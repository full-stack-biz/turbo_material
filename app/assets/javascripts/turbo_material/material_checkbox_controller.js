import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        const checkbox = mdc.checkbox.MDCCheckbox.attachTo(this.element.querySelector('.mdc-checkbox'));
        const formField = mdc.formField.MDCFormField.attachTo(this.element);
        formField.input = checkbox;
    }

    disconnect() {
    }
}
