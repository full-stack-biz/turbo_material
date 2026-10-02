import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.checkbox = mdc.checkbox.MDCCheckbox.attachTo(this.element.querySelector('.mdc-checkbox'));
        this.formField = mdc.formField.MDCFormField.attachTo(this.element);
        this.formField.input = this.checkbox;
    }

    disconnect() {
        this.formField?.destroy();
        this.checkbox?.destroy();
    }
}
