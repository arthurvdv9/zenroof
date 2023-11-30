import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-ticket-form"
export default class extends Controller {
  static targets = ["togglableElement"]

  connect() {
    console.log("Hello from toggle_controller.js")
  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
