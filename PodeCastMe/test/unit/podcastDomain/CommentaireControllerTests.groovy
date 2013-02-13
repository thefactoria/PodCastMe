package podcastDomain



import org.junit.*
import grails.test.mixin.*

@TestFor(CommentaireController)
@Mock(Commentaire)
class CommentaireControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/commentaire/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.commentaireInstanceList.size() == 0
        assert model.commentaireInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.commentaireInstance != null
    }

    void testSave() {
        controller.save()
        assert model.commentaireInstance != null
        assert view == '/commentaire/create'
        response.reset()
    }

    

    

    void testDelete() {
		controller.save()
		assert model.commentaireInstance != null
		controller.delete()
		assert Commentaire.count() == 0
    }
}
