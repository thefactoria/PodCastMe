<%@ page import="podcastDomain.Podcast" %>



<div class="fieldcontain ${hasErrors(bean: podcastInstance, field: 'titre', 'error')} required">
	<label for="titre">
		<g:message code="podcast.titre.label" default="Titre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titre" maxlength="30" pattern="${podcastInstance.constraints.titre.matches}" required="" value="${podcastInstance?.titre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: podcastInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="podcast.note.label" default="Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="note" type="number" min="0" max="5" value="${podcastInstance.note}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: podcastInstance, field: 'groupe', 'error')} ">
	<label for="groupe">
		<g:message code="podcast.groupe.label" default="Groupe" />
		
	</label>
	<g:select id="groupe" name="groupe.id" from="${podcastDomain.Groupe.list()}" optionKey="id" value="${podcastInstance?.groupe?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: podcastInstance, field: 'commentaires', 'error')} ">
	<label for="commentaires">
		<g:message code="podcast.commentaires.label" default="Commentaires" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${podcastInstance?.commentaires?}" var="c">
    <li><g:link controller="commentaire" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="commentaire" action="create" params="['podcast.id': podcastInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'commentaire.label', default: 'Commentaire')])}</g:link>
</li>
</ul>

</div>

