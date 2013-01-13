package friendsofmin

import org.springframework.dao.DataIntegrityViolationException

class PassionsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [passionsInstanceList: Passions.list(params), passionsInstanceTotal: Passions.count()]
    }

    def create() {
        [passionsInstance: new Passions(params)]
    }

    def save() {
        def passionsInstance = new Passions(params)
        if (!passionsInstance.save(flush: true)) {
            render(view: "create", model: [passionsInstance: passionsInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'passions.label', default: 'Passions'), passionsInstance.id])
        redirect(action: "show", id: passionsInstance.id)
    }

    def show() {
        def passionsInstance = Passions.get(params.id)
        if (!passionsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'passions.label', default: 'Passions'), params.id])
            redirect(action: "list")
            return
        }

        [passionsInstance: passionsInstance]
    }

    def edit() {
        def passionsInstance = Passions.get(params.id)
        if (!passionsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'passions.label', default: 'Passions'), params.id])
            redirect(action: "list")
            return
        }

        [passionsInstance: passionsInstance]
    }

    def update() {
        def passionsInstance = Passions.get(params.id)
        if (!passionsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'passions.label', default: 'Passions'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (passionsInstance.version > version) {
                passionsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'passions.label', default: 'Passions')] as Object[],
                          "Another user has updated this Passions while you were editing")
                render(view: "edit", model: [passionsInstance: passionsInstance])
                return
            }
        }

        passionsInstance.properties = params

        if (!passionsInstance.save(flush: true)) {
            render(view: "edit", model: [passionsInstance: passionsInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'passions.label', default: 'Passions'), passionsInstance.id])
        redirect(action: "show", id: passionsInstance.id)
    }

    def delete() {
        def passionsInstance = Passions.get(params.id)
        if (!passionsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'passions.label', default: 'Passions'), params.id])
            redirect(action: "list")
            return
        }

        try {
            passionsInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'passions.label', default: 'Passions'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'passions.label', default: 'Passions'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
