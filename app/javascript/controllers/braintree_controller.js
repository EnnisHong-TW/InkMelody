import { Controller } from "@hotwired/stimulus";
import dropIn from "braintree-web-drop-in";

// Connects to data-controller="braintree"
export default class extends Controller {
  async connect() {
    // console.log(dropIn);
    const form = this.element.closest("form");
    const submitBth = form.querySelector('input[type="submit"]');
    if (submitBth) {
      submitBth.disabled = true;
    }
    const { token } = this.element.dataset;

    // Step two: create a dropin instance using that container (or a string
    //   that functions as a query selector such as '#dropin-container')
    try {
      const instance = await dropIn.create({
        container: this.element,
        authorization: token,
      });

      if (instance && submitBth) {
        submitBth.disabled = false;
      }

      if (form) {
        form.addEventListener("submit", async (e) => {
          e.preventDefault();

          const { nonce } = await instance.requestPaymentMethod();
          if (nonce) {
            const nonce_field = document.createElement("input");
            // nonce_field.setAttribute("type", "hidden");
            nonce_field.setAttribute("name", "nonce");
            nonce_field.setAttribute("value", nonce);
            form.appendChild(nonce_field);
          }
          console.log(nonce);
          form.submit();
        });
      }
    } catch (err) {
      console.log(err);
    }
  }
}
