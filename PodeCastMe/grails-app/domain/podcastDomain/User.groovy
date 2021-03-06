package podcastDomain

class User {
	
	String nom
	String prenom
	String pseudo
	String passwd
	String image
	String email
	Boolean isAdmin=false
	static hasMany = [groupes:Groupe]
	
	
	static constraints = {
		nom (blank:false, nullable:false, size:3..30, matches:"[a-zA-Z1-9_]+")
		prenom (blank:false, nullable:false, size:3..30, matches:"[a-zA-Z1-9_]+")
		pseudo (blank:false, nullable:false, size:3..30, matches:"[a-zA-Z1-9_]+")
		passwd (blank:false, nullable:false, size:3..30, matches:"[a-zA-Z1-9_]+")
		email (email:true)
		  }
	

}
