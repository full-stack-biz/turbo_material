import { Controller } from "@hotwired/stimulus";
import { post, destroy, get, patch } from "@rails/request.js";

export default class extends Controller {
    static values = {
        selected: Array,
        url: String,
        confirmable: Boolean,
        modalUrl: String,
        modalName: String,
        queryString: String,
        chipCss: String,
    }

    static targets = [ "hidden" ];

    connect() {
        this.select = mdc.select.MDCSelect.attachTo(this.element);
        this.chipsetEl = this.element.querySelector(".mdc-chip-set");
        this.materialChipset = mdc.chips.MDCChipSet.attachTo(this.chipsetEl);
        if (this.selectedValue.length > 0) {
            this.select.foundation.adapter.floatLabel(true);
            this.selectedValue.forEach(item => {
                let listItem = this.listItem(item);
                this.addChip(listItem.dataset.label, listItem.dataset.value, listItem.dataset.confirmed);
                listItem.classList.add('!hidden');
            });
        }
        this.select.listen('MDCSelect:change', (event) => {
            const selected = this.listItem(event.detail.value);
            selected.classList.add('!hidden');
            this.addChip(selected.dataset.label, selected.dataset.value, selected.dataset.confirmed);
        });
    }

    listItem(value) {
        return this.element.querySelector(`.mdc-deprecated-list-item[data-value="${CSS.escape(value)}"]`);
    }

    addChip(label, value, confirmed) {
        const chipEl = document.createElement('div');
        chipEl.role = 'row';
        chipEl.classList.add('mdc-chip');
        if (this.chipCssValue) {
            chipEl.classList.add(this.chipCssValue);
        }
        chipEl.dataset.value = value;
        const text = document.createElement('div');
        text.className = 'mdc-chip__text';
        text.dataset.action = 'click->material-chips-select#toggle';
        text.textContent = (confirmed === 'false' && this.confirmableValue) ? `${label} (unconfirmed)` : label;
        const icon = document.createElement('i');
        icon.className = 'material-icons mdc-chip__icon mdc-chip__icon--trailing';
        icon.tabIndex = 0;
        icon.setAttribute('role', 'button');
        icon.dataset.action = 'click->material-chips-select#removeChip';
        icon.dataset.value = value;
        icon.textContent = 'cancel';
        chipEl.append(text, icon);
        this.chipsetEl.appendChild(chipEl);
        this.materialChipset.addChip(chipEl);
        if (this.hasHiddenTarget) {
            this.hiddenTarget.value = this.materialChipset.chipsList.map((chip) => chip.root.dataset.value).join(',');
        }
        if (this.urlValue) {
            post(this.urlValue, {
                body: {
                    id: value,
                },
                responseKind: "turbo-stream",
            });
        }
    }

    removeChip(event) {
        event.stopPropagation();
        event.preventDefault();
        const chip = this.element.querySelector(`.mdc-chip[data-value="${CSS.escape(event.target.dataset.value)}"]`);
        this.chipsetEl.removeChild(chip);
        if (this.hasHiddenTarget) {
            this.hiddenTarget.value = this.materialChipset.chipsList.map((chip) => chip.root.dataset.value).join(',');
        }
        const selected = this.listItem(event.target.dataset.value);
        selected.classList.remove('!hidden');
        if (this.urlValue) {
            destroy(`${this.urlValue}/${event.target.dataset.value}`, {
                responseKind: "turbo-stream",
            });
        }
        if (this.chipsetEl.children.length === 0) {
            this.select.foundation.adapter.floatLabel(false);
        }
    }

    toggle(event) {
        if (this.confirmableValue) {
            event.stopPropagation();
            event.preventDefault();
            const item = this.listItem(event.target.parentElement.dataset.value);
            item.dataset.confirmed = item.dataset.confirmed === 'true' ? 'false' : 'true';
            if (item.dataset.confirmed === 'true') {
                let params = new URLSearchParams(this.queryStringValue);
                params.append("name", this.modalNameValue);
                params.append("id", event.target.parentElement.dataset.value);

                get(`${this.modalUrlValue}?${params.toString()}`, {
                    responseKind: "turbo-stream",
                });
            } else {
                patch(`${this.urlValue}/${event.target.parentElement.dataset.value}/toggle`, {
                    body: {
                        confirmed: false,
                    },
                    responseKind: "turbo-stream"
                });
            }
        }
    }

    disconnect() {
        this.materialChipset?.destroy();
        this.select?.destroy();
    }
}
