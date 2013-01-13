package friendsofmin

import org.springframework.dao.DataIntegrityViolationException

class MembreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
//action pour se rederiger au site de google	
	def goTogoole() {
		redirect(url: "http://google.fr")
	}
// http://localhost:8080/FriendsOfMin/membre/goTogoole
	

// action connexion pour tester le login et le mot de passe		
	def connexion() {
		//redirect(url: "http://google.fr")
		def nom= params['nom']
				
		Membre a=Membre.findByNom(nom)//requete hibernate
		boolean b=(params['mdp']=='jesuis'+nom) 
		if(a && b==true) redirect(action: "show", id: a.id)
		else redirect(url: "http://localhost:8080/FriendsOfMin/")
		return

	}
	def recherche () {
		def nom= params['nom']
		Membre a=Membre.findByNom(nom)
		//Succes de La recherche 
		if(a) redirect(action: "show", id: a.id)
		else redirect(url: "http://localhost:8080/FriendsOfMin")
	}
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [membreInstanceList: Membre.list(params), membreInstanceTotal: Membre.count()]
    }

    def create() {
        [membreInstance: new Membre(params)]
    }

    def save() {
        def membreInstance = new Membre(params)
        if (!membreInstance.save(flush: true)) {
            render(view: "create", model: [membreInstance: membreInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'membre.label', default: 'Membre'), membreInstance.id])
        redirect(action: "show", id: membreInstance.id)
    }

    def show() {
        def membreInstance = Membre.get(params.id)
        if (!membreInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'membre.label', default: 'Membre'), params.id])
            redirect(action: "list")
            return
        }

        [membreInstance: membreInstance]
    }

    def edit() {
        def membreInstance = Membre.get(params.id)
        if (!membreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'membre.label', default: 'Membre'), params.id])
            redirect(action: "list")
            return
        }

        [membreInstance: membreInstance]
    }

    def update() {
        def membreInstance = Membre.get(params.id)
        if (!membreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'membre.label', default: 'Membre'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (membreInstance.version > version) {
                membreInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'membre.label', default: 'Membre')] as Object[],
                          "Another user has updated this Membre while you were editing")
                render(view: "edit", model: [membreInstance: membreInstance])
                return
            }
        }

        membreInstance.properties = params

        if (!membreInstance.save(flush: true)) {
            render(view: "edit", model: [membreInstance: membreInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'membre.label', default: 'Membre'), membreInstance.id])
        redirect(action: "show", id: membreInstance.id)
    }

    def delete() {
        def membreInstance = Membre.get(params.id)
        if (!membreInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'membre.label', default: 'Membre'), params.id])
            redirect(action: "list")
            return
        }

        try {
            membreInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'membre.label', default: 'Membre'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'membre.label', default: 'Membre'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
