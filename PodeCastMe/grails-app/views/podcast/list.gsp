
<%@ page import="podcastDomain.Podcast" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'podcast.label', default: 'Podcast')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-podcast" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-podcast" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="titre" title="${message(code: 'podcast.titre.label', default: 'Titre')}" />
					
						<g:sortableColumn property="note" title="${message(code: 'podcast.note.label', default: 'Note')}" />
					
						<th><g:message code="podcast.groupe.label" default="Groupe" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${podcastInstanceList}" status="i" var="podcastInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${podcastInstance.id}">${fieldValue(bean: podcastInstance, field: "titre")}</g:link></td>
					
						<td>${fieldValue(bean: podcastInstance, field: "note")}</td>
					
						<td>${fieldValue(bean: podcastInstance, field: "groupe")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${podcastInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
