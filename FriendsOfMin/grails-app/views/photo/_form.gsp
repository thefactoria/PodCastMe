<%@ page import="friendsofmin.Photo" %>



<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'contenu', 'error')} required">
	<label for="contenu">
		<g:message code="photo.contenu.label" default="Contenu" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="contenu" name="contenu" />
</div>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'nomp', 'error')} ">
	<label for="nomp">
		<g:message code="photo.nomp.label" default="Nomp" />
		
	</label>
	<g:textField name="nomp" value="${photoInstance?.nomp}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'phototag', 'error')} ">
	<label for="phototag">
		<g:message code="photo.phototag.label" default="Phototag" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${photoInstance?.phototag?}" var="p">
    <li><g:link controller="photoTaggee" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="photoTaggee" action="create" params="['photo.id': photoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'photoTaggee.label', default: 'PhotoTaggee')])}</g:link>
</li>
</ul>

</div>

