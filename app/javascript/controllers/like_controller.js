import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="like"
export default class extends Controller {
  toggle(e) {
    e.preventDefault();

    // const token_key = document.querySelector("meta[name='csrf-param']").content;
    const token = document.querySelector("meta[name='csrf-token']").content;
    // console.log(token);

    // console.log("like");
    const url = "/products/61/like";

    fetch(url, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": token,
      },
    })
      .then((result) => result.json())
      .then(({ status }) => {
        if (status == "liked") {
          console.log("喜歡");
        } else {
          console.log("不喜歡");
        }
      })
      .catch((err) => {
        console.log(err);
      });
  }
}
