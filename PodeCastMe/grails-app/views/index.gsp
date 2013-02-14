<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title id="page-title">Authentification</title>
    <meta name="viewport" content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">

    <!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if lte IE 7]><link rel="stylesheet" href="style.ie7.css" media="screen" /><![endif]-->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style_auth.css')}" media="screen">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.responsive.css')}" media="screen">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Actor&amp;subset=latin">
	<script src="/test/static/js/jquery.js"></script>
    <script src="/test/static/js/script.js"></script>
    <script src="/test/static/js/script.responsive.js"></script>


</head>
<body>
<div id="art-main">
<header class="art-header clearfix">


    <div class="art-shapes">
<h1 class="art-headline" data-left="82.99%">
    <a href="#">PodCastMe</a>
</h1>

<div class="art-object1800006215" data-left="0%"></div>
<div class="art-object0" data-left="3.36%"></div>
<div class="art-textblock art-object109289830" data-left="100%">
        <div class="art-object109289830-text">
	<g:if test="${session?.user}">
	<p class="welcome">
	
	</p>	
	</g:if>
	<g:else>
	<g:form url="[controller:'user',action:'login']" id="login-form">
	<table style="border-spacing : 10px; ">
	<tr>
	<td>Login : </td>
	<td>
	<input name="username" type="text" ></input>
	</td>
	</tr>
	<tr>
	<td>Password : </td>
	<td>
	<input name ="password" type="text"></input>
	</td>
	</tr>
	<tr>
	<td>
	<input type="submit" value="Connexion" name="envoyer" class="art-button"></input>
	</td>
	</tr>
	</table>
	</g:form>
	<g:form>
	<table style="border-spacing : 10px; ">
	<tr>
	<td>
	<input type="submit" value="Inscription" class="art-button"></input>
	</td>
	</tr>
	</table>
	</g:form>
	</g:else>
	</div>
    
</div>
            </div>

                        
                    
</header>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper clearfix">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-content clearfix"><article class="art-post art-article">
                                <h2 class="art-postheader"><center>PodCastMe est gratuit et il le restera Toujours!</center></h2>
                                                
                <div class="art-postcontent art-postcontent-0 clearfix"><p><br></p></div>
                                
                </article></div>
                    </div>
                </div>
            </div>
            <footer class="art-footer clearfix">
Master 2 Développement Logiciels
</footer>
            

    </div>

</div>


</body></html>