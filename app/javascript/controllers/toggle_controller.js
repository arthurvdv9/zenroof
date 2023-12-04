import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-ticket-form"
export default class extends Controller {
  static targets = ["togglableElement","button","cancelbutton"]

  connect() {
    console.log("Hello from toggle_controller.js")
  }

  fire() {
    // console.log(cancelbuttonTarget);
    this.togglableElementTarget.classList.toggle("d-none");
    this.buttonTarget.classList.toggle("d-none")
  }
}
