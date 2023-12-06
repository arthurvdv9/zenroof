import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["image"];

  connect() {
    console.log("connecteddddddddddddd");
    this.imageTargets.forEach(image => {
      image.addEventListener("click", this.toggleZoom.bind(this));
    });
  }

  toggleZoom() {
    this.imageTargets.forEach(image => {
      image.classList.toggle("zoomed");
    });
  }
}
