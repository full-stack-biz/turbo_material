import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

    connect() {
        this.menuSurface = mdc.menuSurface.MDCMenuSurface.attachTo(this.element);
    }

    disconnect() {
        this.menuSurface?.destroy();
    }
}
