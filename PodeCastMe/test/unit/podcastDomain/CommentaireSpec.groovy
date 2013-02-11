package podcastDomain

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*


@TestMixin(GrailsUnitTestMixin)
class CommentaireSpec extends Specification{
	
	String getLongString(Integer length) {
		'a' * length
	}
	def setup() {
		//mock a groupe with some data (put unique violations in here so they can be tested, the others aren't needed)
		mockForConstraintsTests(Commentaire, [new Commentaire(text: 'kizibzibbi')])
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
	
	@Unroll("test Groupe all constraints #field is #error using #val")
	def "test Podcast all constraints"() {
		when:
		def obj = new Commentaire("$field": val)

		then:
		validateConstraints(obj, field, error)

		where:
		error                  | field        | val
		'size'                 | 'text'       | getLongString(101)
		'nullable'             | 'text'       | null
		'size'                 | 'text'       | getLongString(2)


	}

}
