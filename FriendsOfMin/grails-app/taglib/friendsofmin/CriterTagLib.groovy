package friendsofmin

class CriterTagLib {
	
	
	
	
	def amisFille = { attrs,  body ->
		//requet sur la table avec hibernat
		def results = Activite.findByTitre("Sky")
		out << results.desc.toString()
		out << "\n"+results.titre.toString()
	

	/*def amisFille = { attrs,  body ->
		
		def c = attrs.input.createCriteria()
		def results = c {
			eq("titre", "Sky")
			
		}
		out << results.desc.toString()
		out << "\n"+results.titre.toString()
	}
	*/
	
}
}
