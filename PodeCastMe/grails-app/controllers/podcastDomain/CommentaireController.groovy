package podcastDomain

import org.springframework.dao.DataIntegrityViolationException

class CommentaireController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [commentaireInstanceList: Commentaire.list(params), commentaireInstanceTotal: Commentaire.count()]
    }

    def create() {
        [commentaireInstance: new Commentaire(params)]
    }



 
}
