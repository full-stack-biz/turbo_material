import { Controller } from "@hotwired/stimulus";
import { useClickOutside } from 'stimulus-use';
export default class extends Controller {
    menu = undefined;

    connect() {
        mdc.ripple.MDCRipple.attachTo(this.element);
        this.menu = mdc.menu.MDCMenu.attachTo(this.element.querySelector('.mdc-menu-surface'));
        const button = this.element.querySelector('.menu-button');
        this.menu.setAnchorElement(button);
        this.menu.setAnchorCorner(mdc.menu.Corner.BOTTOM_START);
        this.menu.setFixedPosition(true);
        useClickOutside(this);
    }

    disconnect() {
    }

    click(event) {
        if (this.menu.open) {
            this.close();
        } else {
            this.open();
        }
    }

    open() {
        this.menu.open = true;
    }

    close() {
        this.menu.open = false;
    }

    clickOutside(event) {
        if (!this.menu.open) {
            return;
        } else {
            event.preventDefault();
            this.close();
        }
    }
}
