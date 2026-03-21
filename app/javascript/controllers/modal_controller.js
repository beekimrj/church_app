import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    this.element.addEventListener("turbo:submit-end", this.handleSubmitEnd.bind(this))
  }

  openAttend(event) {
    event.preventDefault()
    const memberId = event.currentTarget.dataset.memberId
    const dialog = document.querySelector('[data-modal-target="attendDialog"]')
    const hiddenField = dialog.querySelector('#attend_member_id')
    hiddenField.value = memberId
    dialog.showModal()
    const submitButton = dialog.querySelector('input[type="submit"]')
    if (submitButton) submitButton.focus()
  }

  openUnattend(event) {
    event.preventDefault()
    const memberId = event.currentTarget.dataset.memberId
    const dialog = document.querySelector('[data-modal-target="unattendDialog"]')
    const form = dialog.querySelector('form')
    form.action = `/attendance_members/${memberId}`
    const hiddenField = dialog.querySelector('#unattend_member_id')
    hiddenField.value = memberId
    dialog.showModal()
    const submitButton = dialog.querySelector('input[type="submit"]')
    if (submitButton) submitButton.focus()
  }

  close(event) {
    event.preventDefault()
    const dialog = event.currentTarget.closest("dialog")
    dialog.close()
  }

  handleSubmitEnd(event) {
    if (event.detail.success) {
      const dialog = event.currentTarget.closest("dialog")
      dialog.close()
    }
  }
}
