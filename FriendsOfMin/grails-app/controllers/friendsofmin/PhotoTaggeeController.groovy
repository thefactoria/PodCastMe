package friendsofmin

import org.springframework.dao.DataIntegrityViolationException

class PhotoTaggeeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [photoTaggeeInstanceList: PhotoTaggee.list(params), photoTaggeeInstanceTotal: PhotoTaggee.count()]
    }

    def create() {
        [photoTaggeeInstance: new PhotoTaggee(params)]
    }

    def save() {
        def photoTaggeeInstance = new PhotoTaggee(params)
        if (!photoTaggeeInstance.save(flush: true)) {
            render(view: "create", model: [photoTaggeeInstance: photoTaggeeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'photoTaggee.label', default: 'PhotoTaggee'), photoTaggeeInstance.id])
        redirect(action: "show", id: photoTaggeeInstance.id)
    }

    def show() {
        def photoTaggeeInstance = PhotoTaggee.get(params.id)
        if (!photoTaggeeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photoTaggee.label', default: 'PhotoTaggee'), params.id])
            redirect(action: "list")
            return
        }

        [photoTaggeeInstance: photoTaggeeInstance]
    }

    def edit() {
        def photoTaggeeInstance = PhotoTaggee.get(params.id)
        if (!photoTaggeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photoTaggee.label', default: 'PhotoTaggee'), params.id])
            redirect(action: "list")
            return
        }

        [photoTaggeeInstance: photoTaggeeInstance]
    }

    def update() {
        def photoTaggeeInstance = PhotoTaggee.get(params.id)
        if (!photoTaggeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photoTaggee.label', default: 'PhotoTaggee'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (photoTaggeeInstance.version > version) {
                photoTaggeeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'photoTaggee.label', default: 'PhotoTaggee')] as Object[],
                          "Another user has updated this PhotoTaggee while you were editing")
                render(view: "edit", model: [photoTaggeeInstance: photoTaggeeInstance])
                return
            }
        }

        photoTaggeeInstance.properties = params

        if (!photoTaggeeInstance.save(flush: true)) {
            render(view: "edit", model: [photoTaggeeInstance: photoTaggeeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'photoTaggee.label', default: 'PhotoTaggee'), photoTaggeeInstance.id])
        redirect(action: "show", id: photoTaggeeInstance.id)
    }

    def delete() {
        def photoTaggeeInstance = PhotoTaggee.get(params.id)
        if (!photoTaggeeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photoTaggee.label', default: 'PhotoTaggee'), params.id])
            redirect(action: "list")
            return
        }

        try {
            photoTaggeeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'photoTaggee.label', default: 'PhotoTaggee'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'photoTaggee.label', default: 'PhotoTaggee'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
