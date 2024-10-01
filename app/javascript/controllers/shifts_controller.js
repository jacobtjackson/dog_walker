import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    toggleAddDog(e) {
        console.log(e.target)
        e.preventDefault();
        e.target.classList.toggle('hidden')
        const shiftId = e.target.dataset.value
        console.log(shiftId)
        const el = document.getElementById(`addDogForm_${shiftId}`)
        console.log(el)
        el.classList.toggle('hidden')
        
    }
}
