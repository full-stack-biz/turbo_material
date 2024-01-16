import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        const select = mdc.radio.MDCRadio.attachTo(this.element);
    }

    disconnect() {
    }
}
