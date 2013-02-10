
<%@ page import="podcastDomain.Groupe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-groupe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-groupe" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list groupe">
			
				<g:if test="${groupeInstance?.nomGroupe}">
				<li class="fieldcontain">
					<span id="nomGroupe-label" class="property-label"><g:message code="groupe.nomGroupe.label" default="Nom Groupe" /></span>
					
						<span class="property-value" aria-labelledby="nomGroupe-label"><g:fieldValue bean="${groupeInstance}" field="nomGroupe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupeInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="groupe.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${groupeInstance?.user?.id}">${groupeInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupeInstance?.podcasts}">
				<li class="fieldcontain">
					<span id="podcasts-label" class="property-label"><g:message code="groupe.podcasts.label" default="Podcasts" /></span>
					
						<g:each in="${groupeInstance.podcasts}" var="p">
						<span class="property-value" aria-labelledby="podcasts-label"><g:link controller="podcast" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${groupeInstance?.id}" />
					<g:link class="edit" action="edit" id="${groupeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
