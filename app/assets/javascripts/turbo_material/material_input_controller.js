import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.textField = mdc.textField.MDCTextField.attachTo(this.element);
    }

    disconnect() {
        this.textField?.destroy();
    }
}
