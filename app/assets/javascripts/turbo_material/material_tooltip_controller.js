import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.tooltip = mdc.tooltip.MDCTooltip.attachTo(this.element);
  }

  disconnect() {
    this.tooltip?.destroy();
  }
}
