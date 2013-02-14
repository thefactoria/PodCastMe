package podcastDomain



import org.junit.*
import grails.test.mixin.*

@TestFor(PodcastController)
@Mock(Podcast)
class PodcastControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/podcast/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.podcastInstanceList.size() == 0
        assert model.podcastInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.podcastInstance != null
    }

    void testSave() {
        controller.save()

        assert model.podcastInstance != null
        assert view == '/podcast/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert controller.flash.message == null
    }



 

   
}
