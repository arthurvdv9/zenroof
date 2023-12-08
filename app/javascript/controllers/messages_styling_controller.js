import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages-styling"
export default class extends Controller {
  static targets = [ "message" ]

  connect() {
    this.messageTarget.hidden = this.messageTarget.dataset.messageUserId !== document.body.dataset.currentUserId
  }
}
