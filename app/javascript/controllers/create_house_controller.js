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
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        const dataToInsert = data.house_details ? data.house_details : data.form_with_errors
        this.formTarget.outerHTML = dataToInsert
      })


  }
}
