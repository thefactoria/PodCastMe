package podcastDomain

import org.springframework.dao.DataIntegrityViolationException

class GroupeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [groupeInstanceList: Groupe.list(params), groupeInstanceTotal: Groupe.count()]
    }

    def create() {
        [groupeInstance: new Groupe(params)]
    }

    def save() {
        def groupeInstance = new Groupe(params)
        if (!groupeInstance.save(flush: true)) {
            render(view: "create", model: [groupeInstance: groupeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupeInstance.id])
    }

}
