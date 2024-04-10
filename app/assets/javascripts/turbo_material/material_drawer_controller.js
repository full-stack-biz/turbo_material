import { Controller } from "@hotwired/stimulus";
import { useMatchMedia } from 'stimulus-use';
import { put } from "@rails/request.js";

export default class extends Controller {
  drawer = undefined;

  static values = {
    openUrl: String, closeUrl: String, opened: Boolean, name: String
  }

  connect() {
    this.drawer = mdc.drawer.MDCDrawer.attachTo(this.element);
    if (this.openedValue !== undefined) {
      if (this.openedValue) {
        this.open();
      } else {
        this.close();
      }
    }
    useMatchMedia(this, {
      mediaQueries: {
        lg: '(min-width: 1024px)',
      }
    });
  }

  lgChanged({ name, media, matches, event }) {
    if (this.openedValue) {
      if(matches) {
        this.open();
      } else {
        this.close();
      }
    }
  }

  isLg({ name, media, matches, event }) {
    if (this.openedValue) {
      if(matches) {
        this.open();
      } else {
        this.close();
      }
    }
  }

  open() {
    this.drawer.open = true;
    if (this.openUrlValue) {
      put(this.openUrlValue, {
        body: {
          name: this.nameValue,
        },
      });
    }
  }

  close() {
    this.drawer.open = false;
    if (this.closeUrlValue) {
      put(this.closeUrlValue, {
        body: {
          name: this.nameValue,
        },
      });
    }
  }

  toggle() {
    if(this.drawer.open) {
      this.close();
    } else {
      this.open();
    }
  }

  disconnect() {
  }
}
