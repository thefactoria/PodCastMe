package friendsofmin

class Photo {
	String nomp
	byte[] contenu
	//static belongsTo=[ owner :Membre] 
	static hasMany = [phototag : PhotoTaggee ]
 String toSring () { return nomp }
  /*  static constraints = {
		contenu max : 1000
    }
    */
}
