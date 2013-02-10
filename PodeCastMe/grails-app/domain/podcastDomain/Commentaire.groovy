package podcastDomain

class Commentaire {

	String text
	Date dateCreation
	Podcast podcast
	static belongsTo = [podcast:Podcast]
	
	static constraints = {
		text (size:3..100)
		podcast (nullable: true)
	
		  }
}
