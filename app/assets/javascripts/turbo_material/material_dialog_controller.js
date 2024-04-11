import { Controller } from "@hotwired/stimulus";
import { useClickOutside } from 'stimulus-use';

export default class extends Controller {
    dialog = undefined;

    static values = {
        opened: Boolean
    }

    connect() {
        this.dialog = mdc.dialog.MDCDialog.attachTo(this.element);
        if (this.openedValue) {
            this.dialog.open();
        }
        useClickOutside(this, { element: this.element.querySelector('.mdc-dialog__surface') });
    }

    close() {
        this.dialog.close();
    }

    clickOutside(event) {
        close();
    }

    open() {
        this.dialog.open();
    }

    disconnect() {
    }
}
