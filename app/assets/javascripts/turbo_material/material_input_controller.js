import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        mdc.textField.MDCTextField.attachTo(this.element);
    }
    disconnect() {
    }
}
