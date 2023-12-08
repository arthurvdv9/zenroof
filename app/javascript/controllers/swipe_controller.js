import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swipe"
export default class extends Controller {
  connect() {
    const carousel = new bootstrap.Carousel('#carouselExampleIndicators')
  }


}
