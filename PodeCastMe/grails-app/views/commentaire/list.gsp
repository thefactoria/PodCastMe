
<%@ page import="podcastDomain.Commentaire" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'commentaire.label', default: 'Commentaire')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-commentaire" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-commentaire" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="text" title="${message(code: 'commentaire.text.label', default: 'Text')}" />
					
						<th><g:message code="commentaire.podcast.label" default="Podcast" /></th>
					
						<g:sortableColumn property="dateCreation" title="${message(code: 'commentaire.dateCreation.label', default: 'Date Creation')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${commentaireInstanceList}" status="i" var="commentaireInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${commentaireInstance.id}">${fieldValue(bean: commentaireInstance, field: "text")}</g:link></td>
					
						<td>${fieldValue(bean: commentaireInstance, field: "podcast")}</td>
					
						<td><g:formatDate date="${commentaireInstance.dateCreation}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${commentaireInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
