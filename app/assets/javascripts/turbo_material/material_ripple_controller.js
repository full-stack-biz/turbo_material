import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        mdc.ripple.MDCRipple.attachTo(this.element);
    }

    disconnect() {
    }
}
