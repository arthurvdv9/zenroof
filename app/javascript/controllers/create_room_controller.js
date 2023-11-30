import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-room"
export default class extends Controller {
  static targets = ["form", "formContainer", "list"]

  createRoom(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((data) => {
      console.log(data)
      this.formTarget.reset()
      this.listTarget.insertAdjacentHTML("beforeend", data)
    })
  }


  displayForm(event) {
    event.preventDefault()
    this.formContainerTarget.classList.remove("d-none")
  }

}
