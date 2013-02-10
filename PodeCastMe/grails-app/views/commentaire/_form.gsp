<%@ page import="podcastDomain.Commentaire" %>



<div class="fieldcontain ${hasErrors(bean: commentaireInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="commentaire.text.label" default="Text" />
		
	</label>
	<g:textField name="text" maxlength="100" value="${commentaireInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentaireInstance, field: 'podcast', 'error')} ">
	<label for="podcast">
		<g:message code="commentaire.podcast.label" default="Podcast" />
		
	</label>
	<g:select id="podcast" name="podcast.id" from="${podcastDomain.Podcast.list()}" optionKey="id" value="${commentaireInstance?.podcast?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentaireInstance, field: 'dateCreation', 'error')} required">
	<label for="dateCreation">
		<g:message code="commentaire.dateCreation.label" default="Date Creation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateCreation" precision="day"  value="${commentaireInstance?.dateCreation}"  />
</div>

