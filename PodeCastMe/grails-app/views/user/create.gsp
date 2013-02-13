<%@ page import="podcastDomain.User" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Accueil</title>
   
   <meta name="viewport" content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">

    <!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

    <!--[if lte IE 7]><link rel="stylesheet" href="style.ie7.css" media="screen" /><![endif]-->

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.responsive.css')}" type="text/css" media="all">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" media="screen">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Actor&amp;subset=latin">
	    <script src="/test/static/js/jquery.js"></script>
    <script src="/test/static/js/script.js"></script>
    <script src="/test/static/js/script.responsive.js"></script>
	<meta name="description" content="Description">
	<meta name="keywords" content="Keywords">


<style>.art-content .art-postcontent-0 .layout-item-0 { padding-top: 0px;padding-right: 20px;padding-bottom: 20px;padding-left: 20px;  }
.art-content .art-postcontent-0 .layout-item-1 { border-top-style:solid;border-right-style:solid;border-bottom-style:solid;border-left-style:solid;border-width:1px;border-color:#9D95E4; color: #111222; background: #EAECF6; padding: 20px;  }
.art-content .art-postcontent-0 .layout-item-2 { padding-top: 10px;padding-right: 20px;padding-bottom: 10px;padding-left: 20px;  }
.ie7 .post .layout-cell {border:none !important; padding:0 !important; }
.ie6 .post .layout-cell {border:none !important; padding:0 !important; }

</style></head>
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
    <ul class="art-hmenu"><li><a href="authentification.gsp" class="active">Mes PodCasts</a></li><li><a href="podcasts-2.html">Podcasts</a></li><li><a href="contact.html">Contact</a></li></ul> 
    </nav>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper clearfix">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-content clearfix"><article class="art-post art-article">
                                
                                                
                <div class="art-postcontent art-postcontent-0 clearfix"><div class="art-content-layout">
    <div class="art-content-layout-row">
    <div class="art-layout-cell layout-item-0" style="width: 100%" >
        <h4>Inscription</h4>

    </div>
    </div>
</div>
<div class="art-content-layout">
    <div class="art-content-layout-row">
    <div class="art-layout-cell layout-item-1" style="width: 100%" >
<div id="create-user" class="content scaffold-create" role="main" style="width: 30%">
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
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