import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static outlets = [ "material-drawer" ]

  connect() {
    mdc.ripple.MDCRipple.attachTo(this.element);
  }

  click() {
    this.materialDrawerOutlet.toggle();
  }

  disconnect() {
  }
}
