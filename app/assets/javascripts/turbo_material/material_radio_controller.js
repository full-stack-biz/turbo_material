import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.radio = mdc.radio.MDCRadio.attachTo(this.element);
    }

    disconnect() {
        this.radio?.destroy();
    }
}
