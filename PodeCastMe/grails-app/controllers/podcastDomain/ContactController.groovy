package podcastDomain

import org.springframework.dao.DataIntegrityViolationException

class ContactController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
      params.max = Math.min(max ?: 10, 100)
        [contactInstanceList: Contact.list(params), contactInstanceTotal: Contact.count()]
    }

    def create() {
        [contactInstance: new Contact(params)]
    }

    def save() {
        def contactInstance = new Contact(params)
        if (!contactInstance.save(flush: true)) {
            render(view: "create", model: [contactInstance: contactInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])
    }

 

  
}
