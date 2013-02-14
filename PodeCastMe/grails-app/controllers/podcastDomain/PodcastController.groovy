package podcastDomain

import org.springframework.dao.DataIntegrityViolationException

class PodcastController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [podcastInstanceList: Podcast.list(params), podcastInstanceTotal: Podcast.count()]
    }

    def create() {
        [podcastInstance: new Podcast(params)]
    }

    def save() {
        def podcastInstance = new Podcast(params)
        if (!podcastInstance.save(flush: true)) {
            render(view: "create", model: [podcastInstance: podcastInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'podcast.label', default: 'Podcast'), podcastInstance.id])
    }
 
}
