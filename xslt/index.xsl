<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="tei xsl xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@level='s'][1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>

                    <div class="card" id="notification">
                        <div class="card-body">
                            <p class="hidden" style="padding: 0 1em;">                                            
                                <a id="close" style="color:#b59890;text-align:right;cursor:pointer;"
                                    title="close">X</a>
                            </p>
                            <h5 class="hidden">Pre-Release (v0.3.0)</h5>                                        
                            <p class="hidden">                                            
                                This website is in development. Help us to improve and                                         
                                <a style="text-decoration:underline;" 
                                    href="mailto:amp@oeaw.ac.at?subject=Auden-Musulin%20Papers%20Feedback!">
                                    send us your feedback</a>.
                            </p>
                            
                        </div>
                    </div>
                    <div class="container-fluid" style="background-color:#fff;max-width:100%;margin-bottom:0;">
                        <div class="row" style="margin: 2% 0;">
                            
                            <div class="col-sm-12 col-md-12 col-lg-6 intro_column">
                                <div class="intro_text">
                                    <div class="main-title">
                                        <h1 style="color:#615a60;padding:.5em 0;">Auden Musulin Papers</h1>
                                        <h2 style="color:#615a60;">A Digital Edition of W. H. Auden's Letters to Stella Musulin</h2>
                                    </div>
                                    <p style="font-size:22px;">This website presents the letters and literary papers by Anglo-American poet W. H. Auden (1907-1973) in the estate of Welsh-Austrian writer and journalist Stella Musulin (1915-1996). Previously unpublished, they cast a fresh light on Auden's life and work in Austria.</p>  
                                    <button class="btn btn-round">
                                        <a href="description.html" style="font-size:18px;">Read More</a>
                                    </button>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-6 intro_img">

                                <div class="row">
                                    <div class="col-lg-3 col-md-12 col-sm-12">
                                        <a href="toc.html" class="index-link">                                   
                                            <div class="card index-card">
                                                <div class="card-header" style="padding: 0;">
                                                    <img src="images/icons/lp-corresp.png"
                                                        class="d-block w-100"
                                                        alt="Auden Musulin Papers 1959-1973"/>
                                                </div>
                                                <div class="card-header">                                            
                                                    <h4>Auden Musulin Papers 1959-1973</h4>
                                                </div>
                                            </div>                                     
                                        </a>                                    
                                    </div>
                                    <div class="col-lg-3 col-md-12 col-sm-12">
                                        <a href="search.html" class="index-link">  
                                            <div class="card index-card">
                                                <div class="card-header" style="padding: 0;">                                        
                                                    <img src="images/icons/lp-search.png"
                                                        class="d-block w-100"
                                                        alt="Explore the Auden Musulin Papers through full-text search"/>  
                                                    <!--<form class="form-inline my-2 my-lg-0 navbar-search-form"
                                                         method="get"
                                                         action="search.html"
                                                         role="search">
                                                         <input class="form-control navbar-search" id="s" name="q" type="text" placeholder="Search" value="" autocomplete="off" />
                                                         <button type="submit" class="navbar-search-icon">
                                                             <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                                 <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                                             </svg>
                                                         </button>
                                                     </form>-->                                        
                                                </div>
                                                <div class="card-header">  
                                                    <h4>Explore the Auden Musulin Papers through full-text search.</h4>                                         
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-3 col-md-12 col-sm-12">
                                        <a href="toc_m.html" class="index-link">  
                                            <div class="card index-card">
                                                <div class="card-header" style="padding: 0;">
                                                    <img src="images/icons/lp-memoirs.png"
                                                        class="d-block w-100"
                                                        alt="Musulin as Memoirist 1976-1995"/>
                                                </div>
                                                <div class="card-header">  
                                                    <h4>Musulin as Memoirist 1976-1995</h4>                                         
                                                </div>
                                            </div>                                    
                                        </a>
                                    </div>
                                    
                                </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-12 col-sm-12">
                                            <a href="photos.html" class="index-link">                                                     
                                                <div class="card index-card">
                                                    <div class="card-header" style="padding: 0;">
                                                        <img src="images/icons/lp-photos.png"
                                                            class="d-block w-100" 
                                                            alt="Photos"/>
                                                    </div>
                                                    <div class="card-header">   
                                                        <h4>Photos</h4>                                     
                                                    </div>
                                                </div>                                 
                                            </a>
                                        </div>
                                        <div class="col-lg-3 col-md-12 col-sm-12">
                                            <!-- <a href="cvl.html" class="index-link">  -->                                                    
                                                <div class="card index-card">
                                                    <div class="card-header">
                                                        <img src="images/icons/lp-cvl.png" 
                                                            class="d-block w-100" 
                                                            alt="Auden through Computer Vision"/>
                                                    </div>
                                                    <div class="card-header">   
                                                        <h4>Auden through Computer Vision <small>(In progress)</small></h4>
                                                    </div>
                                                </div>                                 
                                        </div>
                                        <div class="col-lg-3 col-md-12 col-sm-12">
                                            
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>
                <script type="text/javascript">
                    $(document).on('click', 'a[href^="#"]', function (event) {
                        event.preventDefault();
                    
                        $('html, body').animate({
                            scrollTop: $($.attr(this, 'href')).offset().top
                        }, 500);
                    });
                </script>
                <script type="text/javascript">
                    document.getElementById("close").addEventListener("click", function(el) {
                        document.getElementById("notification").style.display = "none";
                    });
                </script>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:div//tei:head">
        <h2 id="{generate-id()}"><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p id="{generate-id()}"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <ul id="{generate-id()}"><xsl:apply-templates/></ul>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <li id="{generate-id()}"><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="starts-with(data(@target), 'http')">
                <a>
                    <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>