package friendsofmin

class PhotoTagLib {
	def mypic = { attrs,  body ->
		def m=attrs.membre
		//PhotoTaggee.findByOwner(m)
		
		out << "<img src=\"http://profile.ak.fbcdn.net/hprofile-ak-snc4/174199_567234157_6455882_n.jpg\" alt=\"\" />"
	  
		} 
}
