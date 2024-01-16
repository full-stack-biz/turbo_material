import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        const select = mdc.select.MDCSelect.attachTo(this.element)
    }

    disconnect() {
    }
}
