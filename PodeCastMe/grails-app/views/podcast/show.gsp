
<%@ page import="podcastDomain.Podcast" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'podcast.label', default: 'Podcast')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-podcast" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-podcast" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list podcast">
			
				<g:if test="${podcastInstance?.titre}">
				<li class="fieldcontain">
					<span id="titre-label" class="property-label"><g:message code="podcast.titre.label" default="Titre" /></span>
					
						<span class="property-value" aria-labelledby="titre-label"><g:fieldValue bean="${podcastInstance}" field="titre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${podcastInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="podcast.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${podcastInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${podcastInstance?.groupe}">
				<li class="fieldcontain">
					<span id="groupe-label" class="property-label"><g:message code="podcast.groupe.label" default="Groupe" /></span>
					
						<span class="property-value" aria-labelledby="groupe-label"><g:link controller="groupe" action="show" id="${podcastInstance?.groupe?.id}">${podcastInstance?.groupe?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${podcastInstance?.commentaires}">
				<li class="fieldcontain">
					<span id="commentaires-label" class="property-label"><g:message code="podcast.commentaires.label" default="Commentaires" /></span>
					
						<g:each in="${podcastInstance.commentaires}" var="c">
						<span class="property-value" aria-labelledby="commentaires-label"><g:link controller="commentaire" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${podcastInstance?.id}" />
					<g:link class="edit" action="edit" id="${podcastInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
