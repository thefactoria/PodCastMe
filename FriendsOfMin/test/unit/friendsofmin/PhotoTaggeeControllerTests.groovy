package friendsofmin



import org.junit.*
import grails.test.mixin.*

@TestFor(PhotoTaggeeController)
@Mock(PhotoTaggee)
class PhotoTaggeeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/photoTaggee/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.photoTaggeeInstanceList.size() == 0
        assert model.photoTaggeeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.photoTaggeeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.photoTaggeeInstance != null
        assert view == '/photoTaggee/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/photoTaggee/show/1'
        assert controller.flash.message != null
        assert PhotoTaggee.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/photoTaggee/list'


        populateValidParams(params)
        def photoTaggee = new PhotoTaggee(params)

        assert photoTaggee.save() != null

        params.id = photoTaggee.id

        def model = controller.show()

        assert model.photoTaggeeInstance == photoTaggee
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/photoTaggee/list'


        populateValidParams(params)
        def photoTaggee = new PhotoTaggee(params)

        assert photoTaggee.save() != null

        params.id = photoTaggee.id

        def model = controller.edit()

        assert model.photoTaggeeInstance == photoTaggee
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/photoTaggee/list'

        response.reset()


        populateValidParams(params)
        def photoTaggee = new PhotoTaggee(params)

        assert photoTaggee.save() != null

        // test invalid parameters in update
        params.id = photoTaggee.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/photoTaggee/edit"
        assert model.photoTaggeeInstance != null

        photoTaggee.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/photoTaggee/show/$photoTaggee.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        photoTaggee.clearErrors()

        populateValidParams(params)
        params.id = photoTaggee.id
        params.version = -1
        controller.update()

        assert view == "/photoTaggee/edit"
        assert model.photoTaggeeInstance != null
        assert model.photoTaggeeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/photoTaggee/list'

        response.reset()

        populateValidParams(params)
        def photoTaggee = new PhotoTaggee(params)

        assert photoTaggee.save() != null
        assert PhotoTaggee.count() == 1

        params.id = photoTaggee.id

        controller.delete()

        assert PhotoTaggee.count() == 0
        assert PhotoTaggee.get(photoTaggee.id) == null
        assert response.redirectedUrl == '/photoTaggee/list'
    }
}
