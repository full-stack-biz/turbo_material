import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

    connect() {
        this.menuSurface = new mdc.menuSurface.MDCMenuSurface.attachTo(this.element);
    }

    disconnect() {
    }
}
