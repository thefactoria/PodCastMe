package podcastDomain

class Contact {

	String sujet
	String email
	String message
	
	static constraints = {
		sujet (blank:false, nullable:false, size:10..50)
		email (blank:false, nullable:false, size:3..50,, matches:"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})")
		message (blank:false, nullable:false, size:10..100)
	
		
	}
}
