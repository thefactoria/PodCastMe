package podcastDomain

class Podcast {
	
	String titre
	Integer note = 0
	Groupe groupe
	static belongsTo = [groupe:Groupe]
	static hasMany = [commentaires:Commentaire]
	
	static constraints = {
		titre (blank:false, nullable:false, size:3..30, matches:"[a-zA-Z1-9_]+")
		note (min:0, max:5)
		groupe (nullable: true)
		
		  }

}
