import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.switchControl = mdc.switchControl.MDCSwitch.attachTo(this.element.querySelector('.mdc-switch'));
        const hidden = this.element.querySelector('input[type=hidden]');
        this.switchControl.listen('click', () => {
            hidden.value = this.switchControl.selected;
        });
    }

    disconnect() {
        this.switchControl?.destroy();
    }
}
