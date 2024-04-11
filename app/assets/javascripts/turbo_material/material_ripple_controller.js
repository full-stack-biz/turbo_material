import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    ripple = undefined;
    connect() {
        this.ripple = mdc.ripple.MDCRipple.attachTo(this.element);
    }

    disconnect() {
    }
}
