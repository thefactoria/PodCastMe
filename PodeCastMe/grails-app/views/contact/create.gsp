<%@ page import="podcastDomain.Contact" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head><!-- Created by Artisteer v4.0.0.58475 -->
    <meta charset="utf-8">
	<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
    <meta name="viewport" content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">

    <!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

    <!--[if lte IE 7]><link rel="stylesheet" href="style.ie7.css" media="screen" /><![endif]-->

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.responsive.css')}" type="text/css" media="all">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" media="screen">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Actor&amp;subset=latin">
	    <script src="/test/static/js/jquery.js"></script>
    <script src="/test/static/js/script.js"></script>
    <script src="/test/static/js/script.responsive.js"></script>


</head>
<body>
<div id="art-main">
<header class="art-header clearfix">


    <div class="art-shapes">
<h1 class="art-headline" data-left="75.39%">
    <a href="#">PodCastMe</a>
</h1>

<div class="art-object1800006215" data-left="0%"></div>
<div class="art-object0" data-left="3.36%"></div>

            </div>
<div class="art-textblock art-object1309420497" data-left="100%">
    <form class="art-search" name="Search" action="javascript:void(0)">
    <input type="text" value="">
    <input type="submit" value="Search" name="search" class="art-search-button">
</form>
</div>
                        
                    
</header>
<nav class="art-nav clearfix">
    <ul class="art-hmenu"><li><a href="index.html">Mes PodCasts</a></li><li><a href="podcasts-2.html">Podcasts</a></li><li><a href="contact.html" class="active">Contact</a></li></ul> 
    </nav>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper clearfix">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-content clearfix"><article class="art-post art-article">
                                <h2 class="art-postheader">Contact</h2>
    </div>
    </div>
</div>
<div class="art-content-layout">
    <div class="art-content-layout-row">
    <div class="art-layout-cell layout-item-1" style="width: 100%" >
		<div id="create-contact" class="content scaffold-create" role="main">

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${contactInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${contactInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="art-button" value="Envoyer" />
				</fieldset>
			</g:form>
		</div>
    </div>
    </div>
</div>
<div class="art-content-layout">
    <div class="art-content-layout-row">
    <div class="art-layout-cell layout-item-2" style="width: 60%" >

        </div>
        </div>
    </div><div class="art-layout-cell layout-item-2" style="width: 40%" >

    </div>
    </div>
</div>
</div>
                                
                </article></div>
                    </div>
                </div>
            </div><footer class="art-footer clearfix">
Master 2 Développement Logiciels

</footer>

    </div>

</div>


</body></html>


