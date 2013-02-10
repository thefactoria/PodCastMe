package podcastDomain

class Groupe {
	
	String nomGroupe
	
	static hasMany = [podcasts:Podcast]
	User user
	static belongsTo = [user:User]
	
	static constraints = {
		nomGroupe (blank:false, nullable:false, size:3..30, matches:"[a-zA-Z1-9_]+")
		user (nullable: true)
		  }


}
