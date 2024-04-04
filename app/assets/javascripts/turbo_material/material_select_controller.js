import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const select = mdc.select.MDCSelect.attachTo(this.element);
    select.listen("MDCSelect:change", () => {
      select.root.dispatchEvent(
        new CustomEvent("submit-now", {
          bubbles: true,
          cancelable: true,
        }),
      );
    });
  }

  disconnect() {}
}
