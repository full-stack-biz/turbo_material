import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    mdc.tooltip.MDCTooltip.attachTo(this.element);
  }

  disconnect() {
  }
}
