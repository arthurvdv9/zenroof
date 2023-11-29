import { Controller } from "@hotwired/stimulus"



// Connects to data-controller="create-house"
export default class extends Controller {
  static targets = ["form"]

  connect() {

  }

  createHouse(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        // console.log(data)
        this.formTarget.outerHTML = data

      })


  }
}
