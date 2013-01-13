
<%@ page import="friendsofmin.Photo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'photo.label', default: 'Photo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-photo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-photo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list photo">
			
				<g:if test="${photoInstance?.contenu}">
				<img src="${createLink(controller: 'PhotoController', action: 'displayGraph')}"/>
				
				<li class="fieldcontain">
					<span id="contenu-label" class="property-label"><g:message code="photo.contenu.label" default="Contenu" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${photoInstance?.nomp}">
				<li class="fieldcontain">
					<span id="nomp-label" class="property-label"><g:message code="photo.nomp.label" default="Nomp" /></span>
					
						<span class="property-value" aria-labelledby="nomp-label"><g:fieldValue bean="${photoInstance}" field="nomp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${photoInstance?.phototag}">
				<li class="fieldcontain">
					<span id="phototag-label" class="property-label"><g:message code="photo.phototag.label" default="Phototag" /></span>
					
						<g:each in="${photoInstance.phototag}" var="p">
						<span class="property-value" aria-labelledby="phototag-label"><g:link controller="photoTaggee" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${photoInstance?.id}" />
					<g:link class="edit" action="edit" id="${photoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
