import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    dialog = undefined;

    static values = {
        opened: Boolean,
        closeActionUrl: String
    }

    connect() {
        this.dialog = mdc.dialog.MDCDialog.attachTo(this.element);
        this.dialog.listen('MDCDialog:opened', () => {
            this.element.querySelectorAll('.mdc-icon-button').forEach((button) => {
                mdc.ripple.MDCRipple.attachTo(button);
            });
        });
        if (this.openedValue) {
            this.dialog.open();
        }
    }

    close() {
        this.dialog.close();
        if (this.closeActionUrlValue) {
            window.location.href = this.closeActionUrlValue;
        }
    }

    open() {
        this.dialog.open();
    }

    disconnect() {
    }
}
