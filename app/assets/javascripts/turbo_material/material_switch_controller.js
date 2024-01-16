import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        const switchControl = mdc.switchControl.MDCSwitch.attachTo(this.element.querySelector('.mdc-switch'));
        const hidden = this.element.querySelector('input[type=hidden]');
        switchControl.listen('click', () => {
            hidden.value = switchControl.selected;
        });
    }

    disconnect() {
    }
}
