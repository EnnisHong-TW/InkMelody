import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="like"
export default class extends Controller {
  static targets = ["btn"];
  toggle(e) {
    e.preventDefault();
    console.log(this.btnTarget);
    // const token_key = document.querySelector("meta[name='csrf-param']").content;
    const token = document.querySelector("meta[name='csrf-token']").content;
    // console.log(token);

    const { id, path } = this.element.dataset;
    console.log(id);
    // const url = `/api/v1/products/${id}/like`;
    const url = path;

    fetch(url, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": token,
      },
    })
      .then((result) => result.json())
      .then(({ status }) => {
        if (status == "liked") {
          this.btnTarget.textContent = "取消";
          // console.log("喜歡");
        } else {
          this.btnTarget.textContent = "喜歡";
          // console.log("不喜歡");
        }
      })
      .catch((err) => {
        console.log(err);
      });
  }
}
