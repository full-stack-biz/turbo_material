import {Controller} from "@hotwired/stimulus";
import {get} from "@rails/request.js";
import {useClickOutside} from 'stimulus-use';

export default class extends Controller {
    opened = false;
    static targets = ["input", "hidden", "field", "panel"];
    static outlets = ["material-list"];

    static values = {
        url: String,
        suffix: String,
        name: String
    }

    connect() {
        this.inputEl = this.element.querySelector(".mdc-text-field");
        this.chipsetEl = this.element.querySelector(".mdc-chip-set");
        this.input = mdc.textField.MDCTextField.attachTo(this.inputEl);
        this.chips = mdc.chips.MDCChipSet.attachTo(this.chipsetEl);
        useClickOutside(this);
    }

    chipTemplate(label, value) {
        return `<div class="mdc-chip__text">${label}</div><i data-action="click->material-chips-input#removeChip" data-value="${value}" class="material-icons mdc-chip__icon mdc-chip__icon--trailing" tabindex="0" role="button">cancel</i>`;
    }

    addChip(content, value) {
        const chipEl = document.createElement('div');
        chipEl.classList.add('mdc-chip');
        if (this.chipCssValue) {
            chipEl.classList.add(this.chipCssValue);
        }
        chipEl.dataset.value = value;
        chipEl.innerHTML = content;
        this.chipsetEl.insertBefore(chipEl, this.hiddenTarget);
        this.chips.addChip(chipEl);
        this.hiddenTarget.value = this.chips.chipsList.map((chip) => chip.root.dataset.value).join(',');
        this.search();
    }

    removeChip(event) {
        event.stopPropagation();
        event.preventDefault();
        const chip = this.element.querySelector(`.mdc-chip[data-value="${event.target.dataset.value}"]`);
        const chipIndex = this.chips.foundation.adapter.getIndexOfChipById(chip.id);
        this.chips.foundation.adapter.removeChipAtIndex(chipIndex);
        if (this.chips.foundation.adapter.getChipListCount() === 0) {
            this.input.foundation.adapter.floatLabel(false);
        }
        this.hiddenTarget.value = this.chips.chipsList.map((chip) => chip.root.dataset.value).join(',');
        this.search();
    }

    open() {
        if ((this.opened && this.panelTarget.classList.contains('mdc-menu-surface--open')) || (parseInt(this.panelTarget.dataset.size) === 0)) return;

        this.opened = true;
        this.panelTarget.classList.add("mdc-menu-surface--open");
    }

    toggle() {
        if (this.opened) {
            this.close();
        } else {
            this.open();
        }
    }

    close(event) {
        if (!this.opened) return;

        this.opened = false;
        this.panelTarget.classList.remove("mdc-menu-surface--open");
        if (event) {
            event.preventDefault();
            event.stopPropagation();
        }
    }

    clickOutside(event) {
        if (!this.opened) {
            return;
        } else {
            this.close(event);
        }
    }


    select(user) {
        this.close();
        this.inputTarget.value = "";
        this.addChip(this.chipTemplate(user.dataset.name, user.dataset.value), user.dataset.value);
    }

    focusNext(event) {
        if (!this.opened) return;

        this.materialListOutlet.focusNext();
        if (event) {
            event.preventDefault();
            event.stopPropagation();
        }
    }

    focusPrevious(event) {
        if (!this.opened) return;

        this.materialListOutlet.focusPrevious();
        if (event) {
            event.preventDefault();
            event.stopPropagation();
        }
    }

    confirmSelection(event) {
        if (!this.opened) return;

        this.select(this.materialListOutlet.list.listElements[event.detail.index]);
        if (event) {
            event.preventDefault();
            event.stopPropagation();
        }
    }

    disconnect() {
    }

    search() {
        let params = new URLSearchParams();
        params.append("query", this.inputTarget.value);
        params.append("suffix", this.suffixValue);
        params.append("name", this.nameValue);
        params.append("opened", this.opened);
        params.append("exclude", this.hiddenTarget.value);
        get(`${this.urlValue}?${params.toString()}`, {
            responseKind: "turbo-stream",
        });
    }
}
