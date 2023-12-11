import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";
import { patch } from "@rails/request.js";

// Connects to data-controller="drag"
export default class extends Controller {
  connect() {
    // console.log(123);
    // const sortable = Sortable.create(this.element);

    new Sortable(this.element, {
      ghostClass: "drag-ghost", //不接受有空格，要設定多樣css就要有專屬css class
      onEnd: async (e) => {
        const { id } = e.item.dataset;
        const { newIndex } = e;
        const data = { newIndex };
        // call api
        const url = `/api/v1/products/${id}/sort`;

        await patch(url, {
          body: JSON.stringify(data),
        });
        // console.log(result);
        // console.log(e.item.dataset.id);
        // console.log(e.newIndex);
      },
    });
  }
}
