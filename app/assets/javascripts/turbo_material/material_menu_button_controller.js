import { Controller } from "@hotwired/stimulus";
import { destroy } from "@rails/request.js";

export default class extends Controller {
    menu = undefined;
    static values = { logoutPath: String };

    connect() {
        this.ripple = mdc.ripple.MDCRipple.attachTo(this.element);
        this.menu = mdc.menu.MDCMenu.attachTo(this.element.querySelector('.mdc-menu-surface'));
        const button = this.element.querySelector('.menu-button');
        this.menu.setAnchorElement(button);
        this.menu.setAnchorCorner(mdc.menu.Corner.BOTTOM_START);
        this.menu.setFixedPosition(true);
        // MDC's outside-click handler closes the menu before our click handler runs,
        // so remember the state from before the click starts.
        this.rememberOpen = () => { this.wasOpen = this.menu.open; };
        button.addEventListener('pointerdown', this.rememberOpen);
        button.addEventListener('keydown', this.rememberOpen);
        this.button = button;
    }

    disconnect() {
        this.button?.removeEventListener('pointerdown', this.rememberOpen);
        this.button?.removeEventListener('keydown', this.rememberOpen);
        this.menu?.destroy();
        this.ripple?.destroy();
    }

    toggleMenu(event) {
        const wasOpen = this.wasOpen ?? this.menu.open;
        this.wasOpen = undefined;
        if (wasOpen) {
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
