import { Controller } from "@hotwired/stimulus"
import { put } from '@rails/request.js'

export default class extends Controller {
    changeStatus(e) {
        console.log(e.target.selectedOptions[0].value)
        let status = e.target.selectedOptions[0].value
        let dogId = e.target.dataset.value
        put(`/dogs/${dogId}`, { body: { status: status } } )
    }

    bulkUpdateStatus(e) {
        let status = e.target.selectedOptions[0].value
        let dogIds = e.target.dataset.value
        console.log(dogIds)
        put(`/bulk_update_dogs`, { body: { ids: dogIds, status: status } })
    }
}
