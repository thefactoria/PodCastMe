
<%@ page import="friendsofmin.PhotoTaggee" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'photoTaggee.label', default: 'PhotoTaggee')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-photoTaggee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-photoTaggee" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list photoTaggee">
			
				<g:if test="${photoTaggeeInstance?.membreTag}">
				<li class="fieldcontain">
					<span id="membreTag-label" class="property-label"><g:message code="photoTaggee.membreTag.label" default="Membre Tag" /></span>
					
						<g:each in="${photoTaggeeInstance.membreTag}" var="m">
						<span class="property-value" aria-labelledby="membreTag-label"><g:link controller="membre" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${photoTaggeeInstance?.photo}">
				<li class="fieldcontain">
					<span id="photo-label" class="property-label"><g:message code="photoTaggee.photo.label" default="Photo" /></span>
					
						<span class="property-value" aria-labelledby="photo-label"><g:link controller="photo" action="show" id="${photoTaggeeInstance?.photo?.id}">${photoTaggeeInstance?.photo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${photoTaggeeInstance?.id}" />
					<g:link class="edit" action="edit" id="${photoTaggeeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
