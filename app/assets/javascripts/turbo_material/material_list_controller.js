import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.list = mdc.list.MDCList.attachTo(this.element);
        this.list.listen('MDCList:action', (event) => {
            this.focusElement(event.detail.index);
            this.element.dispatchEvent(new CustomEvent('country-select-focus', {
                bubbles: true,
                cancelable: true,
                detail: {
                    index: event.detail.index
                }
            }));
        });
    }

    selected() {
        return this.list.listElements[this.list.selectedIndex];
    }

    focusNext() {
        if (this.list.selectedIndex === undefined ) {
            this.list.selectedIndex = 0;
        } else if (this.list.selectedIndex < this.list.listElements.length - 1) {
            this.list.selectedIndex++;
        } else {
            this.list.selectedIndex = 0;
        }
        this.element.querySelector(".mdc-deprecated-list-item--selected").scrollIntoView({
            behavior: 'smooth'
        });
    }

    focusPrevious() {
        if (this.list.selectedIndex === undefined ) {
            this.list.selectedIndex = this.list.listElements.length - 1;
        } else if (this.list.selectedIndex > 0) {
            this.list.selectedIndex--;
        } else {
            this.list.selectedIndex = this.list.listElements.length - 1;
        }
        this.element.querySelector(".mdc-deprecated-list-item--selected").scrollIntoView({
            behavior: 'smooth'
        });
    }

    focusElement(index) {
        this.list.selectedIndex = index;
        this.element.querySelector(".mdc-deprecated-list-item--selected").scrollIntoView({
            behavior: 'smooth'
        });
    }

    disconnect() {
    }
}
