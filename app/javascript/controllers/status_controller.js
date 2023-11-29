import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="status"
export default class extends Controller {
  static targets = ["statusform"]

  connect() {
    console.log(this.statusformTarget)
  }
}
