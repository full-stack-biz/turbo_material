import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.select = mdc.select.MDCSelect.attachTo(this.element);
    this.select.listen("MDCSelect:change", () => {
      this.select.root.dispatchEvent(
        new CustomEvent("submit-now", {
          bubbles: true,
          cancelable: true,
        }),
      );
    });
  }

  disconnect() {
    this.select?.destroy();
  }
}
