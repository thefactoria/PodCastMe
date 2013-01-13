package friendsofmin
//<g:include page="DateTagLib.groovy" />
class DateTagLib {
	def dateFormat = { attrs, body ->
		out << new java.text.SimpleDateFormat(attrs.format).format(attrs.date)
	}


}
