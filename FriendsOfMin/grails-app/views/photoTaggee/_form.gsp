<%@ page import="friendsofmin.PhotoTaggee" %>



<div class="fieldcontain ${hasErrors(bean: photoTaggeeInstance, field: 'membreTag', 'error')} ">
	<label for="membreTag">
		<g:message code="photoTaggee.membreTag.label" default="Membre Tag" />
		
	</label>
	<g:select name="membreTag" from="${friendsofmin.Membre.list()}" multiple="multiple" optionKey="id" size="5" value="${photoTaggeeInstance?.membreTag*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: photoTaggeeInstance, field: 'photo', 'error')} required">
	<label for="photo">
		<g:message code="photoTaggee.photo.label" default="Photo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="photo" name="photo.id" from="${friendsofmin.Photo.list()}" optionKey="id" required="" value="${photoTaggeeInstance?.photo?.id}" class="many-to-one"/>
</div>

