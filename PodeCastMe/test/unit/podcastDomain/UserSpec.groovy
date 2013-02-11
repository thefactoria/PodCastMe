package podcastDomain

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*


@TestMixin(GrailsUnitTestMixin)
class UserSpec extends Specification{
	
	
	String getLongString(Integer length) {
		'a' * length
	}
	
	def setup() {
		//mock a user with some data (put unique violations in here so they can be tested, the others aren't needed)
		mockForConstraintsTests(User, [new User(nom: 'jeremique', prenom: 'chouaiech', pseudo: 'jeremiquechrabounique', passwd: 'azerty')])
	}
	
	void validateConstraints(obj, field, error) {
		def validated = obj.validate()
		if (error && error != 'valid') {
			assert !validated
			assert obj.errors[field]
			assert error == obj.errors[field]
		} else {
			assert !obj.errors[field]
		}
		//println ("erreur attendue : "+error+ ", pour le champ : "+field+ ", avec la valeur : "+obj."$field"+", erreur obtenu : "+obj.errors[field])
	}
	
	 @Unroll("test user all constraints #field is #error using #val")
    def "test user all constraints"() {
        when:
        def obj = new User("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error                  | field        | val
        'size'                 | 'nom'       | getLongString(31)
        'nullable'             | 'nom'       | null
        'size'                 | 'nom'       | getLongString(2)
		'size'                 | 'prenom'       | getLongString(31)
		'nullable'             | 'prenom'       | null
		'size'                 | 'prenom'       | getLongString(2)
		'size'                 | 'pseudo'       | getLongString(31)
		'nullable'             | 'pseudo'       | null
		'size'                 | 'pseudo'       | getLongString(2)
		'size'                 | 'passwd'       | getLongString(31)
		'nullable'             | 'passwd'       | null
		'size'                 | 'passwd'       | getLongString(2)
		


    }
	

}
