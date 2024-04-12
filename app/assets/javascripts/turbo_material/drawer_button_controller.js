import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static outlets = [ "material-drawer" ]

  connect() {
    if(!document.querySelector('.mdc-drawer--dismissible.mdc-drawer--right')) {
      this.element.style.display = 'none';
    } else {
      mdc.ripple.MDCRipple.attachTo(this.element);
    }
  }

  click() {
    this.materialDrawerOutlet.toggle();
  }

  disconnect() {
  }
}
