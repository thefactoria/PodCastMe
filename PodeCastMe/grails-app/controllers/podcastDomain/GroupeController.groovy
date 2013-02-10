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
        redirect(action: "show", id: groupeInstance.id)
    }

    def show(Long id) {
        def groupeInstance = Groupe.get(id)
        if (!groupeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupe.label', default: 'Groupe'), id])
            redirect(action: "list")
            return
        }

        [groupeInstance: groupeInstance]
    }

    def edit(Long id) {
        def groupeInstance = Groupe.get(id)
        if (!groupeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupe.label', default: 'Groupe'), id])
            redirect(action: "list")
            return
        }

        [groupeInstance: groupeInstance]
    }

    def update(Long id, Long version) {
        def groupeInstance = Groupe.get(id)
        if (!groupeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupe.label', default: 'Groupe'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (groupeInstance.version > version) {
                groupeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'groupe.label', default: 'Groupe')] as Object[],
                          "Another user has updated this Groupe while you were editing")
                render(view: "edit", model: [groupeInstance: groupeInstance])
                return
            }
        }

        groupeInstance.properties = params

        if (!groupeInstance.save(flush: true)) {
            render(view: "edit", model: [groupeInstance: groupeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupeInstance.id])
        redirect(action: "show", id: groupeInstance.id)
    }

    def delete(Long id) {
        def groupeInstance = Groupe.get(id)
        if (!groupeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupe.label', default: 'Groupe'), id])
            redirect(action: "list")
            return
        }

        try {
            groupeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'groupe.label', default: 'Groupe'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'groupe.label', default: 'Groupe'), id])
            redirect(action: "show", id: id)
        }
    }
}
