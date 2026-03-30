import { Controller } from "@hotwired/stimulus"

// data-controller="removals"
export default class extends Controller {
  connect() {
    this.element.addEventListener("mouseenter", this.pause)
    this.element.addEventListener("mouseleave", this.resume)
  }

  disconnect() {
    this.element.removeEventListener("mouseenter", this.pause)
    this.element.removeEventListener("mouseleave", this.resume)
  }

  remove() {
    this.element.remove()
  }

  pause = () => {
    this.element.style.animationPlayState = "paused"
    this.element.classList.add("paused")
  }

  resume = () => {
    this.element.style.animationPlayState = "running"
    this.element.classList.remove("paused")
  }
}
