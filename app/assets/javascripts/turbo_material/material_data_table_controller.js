import { Controller } from "@hotwired/stimulus";
import { Turbo } from "@hotwired/turbo-rails";
import { put } from "@rails/request.js";

export default class extends Controller {
  dataTable = undefined;
  static values = { url: String, selectUrl: String, queryString: String, body: String, selectionType: String };

  connect() {
    this.dataTable = mdc.dataTable.MDCDataTable.attachTo(this.element);
    this.dataTable.listen('MDCDataTable:sorted', this.sort.bind(this));
    this.dataTable.listen('MDCDataTable:rowSelectionChanged', this.select.bind(this));
    this.dataTable.listen('MDCDataTable:selectedAll', this.selectAll.bind(this));
    this.dataTable.listen('MDCDataTable:unselectedAll', this.unselectAll.bind(this));
  }

  sort(event) {
    let params = new URLSearchParams(this.queryStringValue);
    params.delete("order");
    params.delete("reverse");
    params.append("order", event.detail.columnId);
    params.append("reverse", event.detail.sortValue === "descending" ? "true" : "false");
    let frame = this.element.querySelector('turbo-frame#pupils-table-data');
    Turbo.visit(`${this.urlValue}?${params.toString()}`);
    //   , { action: 'advance', frame: this.bodyValue }
    // FIXME: get this back as soon as https://github.com/hotwired/turbo/issues/489 is fixed
  }

  select(event) {
    put(`${this.selectUrlValue || this.urlValue}/${event.detail.rowId}/select`, {
      body: {
        type: this.selectionTypeValue,
        selected: event.detail.selected,
      },
      responseKind: "turbo-stream",
    });
  }

  selectAll(event, selected = true) {
    let params = new URLSearchParams(this.queryStringValue);
    put(`${this.selectUrlValue || this.urlValue}/select_all?${params.toString()}`, {
      body: {
        type: this.selectionTypeValue,
        selected: selected,
      },
      responseKind: "turbo-stream",
    });
  }

  unselectAll(event) {
    this.selectAll(event, false);
  }

  disconnect() {
  }
}
