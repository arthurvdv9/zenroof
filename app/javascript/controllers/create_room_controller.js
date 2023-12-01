import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-room"
export default class extends Controller {
  static targets = ["form", "formContainer", "list", "button"]

  createRoom(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => {

      if (data.inserted_item) {
        this.listTarget.insertAdjacentHTML("beforeend", data.inserted_item)
      }
      this.formTarget.outerHTML = data.form
      // this.formTarget.scrollTo(0,this.formTarget.scrollHeight)
    })
  }


  displayForm(event) {
    event.preventDefault()
    if (this.formContainerTarget.classList.contains("d-none")){
      this.formContainerTarget.classList.remove("d-none")
      // this.buttonTarget.scrollTo(0, this.formTarget.scrollHeight)
    } else {
      this.formContainerTarget.classList.add("d-none")
    }
  }

}
