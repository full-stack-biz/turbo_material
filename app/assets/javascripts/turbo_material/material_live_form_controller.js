import { Controller } from "@hotwired/stimulus";

// Auto-submits a form: debounced on `submit`, immediately on `submitNow`.
// Keeps focus and caret position across the Turbo re-render.
// Extracted from itu-online-admissions' live_form_controller (lodash debounce → setTimeout).
const FOCUSABLE_INPUTS = [
  "text", "textarea", "number", "email", "password", "search", "tel", "url", "date", "time",
  "datetime-local", "color", "range"
];

export default class extends Controller {
  static values = { delay: { type: Number, default: 2000 } }

  initialize() {
    this.submitStart = this.submitStart.bind(this)
    this.submitEnd = this.submitEnd.bind(this)
  }

  connect() {
    if (window.liveForm === undefined) {
      window.liveForm = {}
      document.addEventListener('turbo:submit-start', this.submitStart)
      document.addEventListener('turbo:submit-end', this.submitEnd)
    } else if (window.liveForm.focused) {
      this.restoreFocus(window.liveForm.focused, window.liveForm.selectionStart, window.liveForm.selectionEnd)
      window.liveForm = {}
    }
    this.element.classList.add('live-form');
  }

  disconnect() {
    clearTimeout(this.timer)
    document.removeEventListener('turbo:submit-start', this.submitStart)
    document.removeEventListener('turbo:submit-end', this.submitEnd)
  }

  submitStart() {
    document.body.classList.add('turbo-loading')
  }

  submitEnd() {
    document.body.classList.remove('turbo-loading')
    const active = document.activeElement || document.body
    window.liveForm.selectionStart = active.selectionStart
    window.liveForm.selectionEnd = active.selectionEnd
    window.liveForm.focused = active.id
  }

  restoreFocus(focusedId, selectionStart, selectionEnd) {
    const focused = document.getElementById(focusedId)
    if (!focused || !FOCUSABLE_INPUTS.includes(focused.type)) return
    if (focused.readOnly) focused.blur()
    if (!focused.matches(":focus")) focused.focus()
    if (focused.setSelectionRange && (focused.type === "text" || focused.type === "textarea")) {
      focused.setSelectionRange(selectionStart, selectionEnd)
    }
  }

  submit(event) {
    if (event.target.dataset.autosave === "off") return
    clearTimeout(this.timer)
    this.timer = setTimeout(() => this.submitNow(event), this.delayValue)
  }

  submitNow(event) {
    clearTimeout(this.timer)
    const frame = event.target.dataset.frame
    if (frame !== undefined) {
      let input = this.element.querySelector("input[type='hidden'][name='frame']")
      if (!input) {
        input = document.createElement("input")
        input.type = "hidden"
        input.name = "frame"
        this.element.appendChild(input)
      }
      input.value = frame
    }
    this.element.requestSubmit()
    setTimeout(() => this.element.querySelector("input[type='hidden'][name='frame']")?.remove(), 1000)
  }
}
