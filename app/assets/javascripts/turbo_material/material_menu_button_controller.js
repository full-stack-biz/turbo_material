import { Controller } from "@hotwired/stimulus";
import { destroy } from "@rails/request.js";

export default class extends Controller {
    menu = undefined;
    static values = { logoutPath: String };

    connect() {
        mdc.ripple.MDCRipple.attachTo(this.element);
        this.menu = mdc.menu.MDCMenu.attachTo(this.element.querySelector('.mdc-menu-surface'));
        const button = this.element.querySelector('.menu-button');
        this.menu.setAnchorElement(button);
        this.menu.setAnchorCorner(mdc.menu.Corner.BOTTOM_START);
        this.menu.setFixedPosition(true);
    }

    disconnect() {
    }

    toggleMenu(event) {
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

    async logout() {
        const response = await destroy(this.logoutPathValue);
        if (response.ok) {
            window.location.reload();
        }
    }
}
