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
                    
                    <div class="container-fluid" style="background-color:#fff;max-width:100%;margin-bottom:0;">
                        <div class="row">
                            <div class="col-md-12" style="padding:0;margin-bottom:1em;">
                                <div class="card" style="background-color:#f6fa29;max-height:75px;margin-top:0;box-shadow:0;box-shadow:none;border-radius: 0;">
                                    <div class="card-body">
                                        <h5 style="display:inline;">Pre-Release (v0.1)</h5>                                        
                                        <p style="display:inline;">                                            
                                            This website is in development. Help us to improve and                                         
                                            <a style="text-decoration:underline;" 
                                                href="mailto:amp@oeaw.ac.at?subject=Auden-Musulin%20Papers%20Feedback!">
                                                send us your feedback</a>.
                                        </p>                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 intro_column">
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
                            <div class="col-md-6 intro_img">
                                <div class="row">
                                    <div class="col-md-3">
                                        <a href="toc.html" class="index-link">                                   
                                            <div class="card index-card">
                                                <div class="card-body">
                                                    <img src="images/Auden_Musulin_Papers_Logo_rechteckig_web.png"
                                                        class="d-block w-100"
                                                        alt="Auden-Musulin Correspondence Image"/>
                                                </div>
                                                <div class="card-header">                                            
                                                    <h4>W. H. Auden's correspondence with Stella Musulin</h4>
                                                </div>
                                            </div>                                     
                                        </a>                                    
                                    </div>
                                    <div class="col-md-3">
                                        <div class="card">
                                            <div class="card-header">                                        
                                                <h5>Document search</h5>       
                                                <p style="margin-bottom:.5em;font-size:22px;">Explore the Auden Musulin Papers through full-text search.</p>
                                                <button class="btn btn-light" style="background-color:#fff;">
                                                    <a href="search.html" style="color:#000;">
                                                        Start searching
                                                    </a>
                                                    
                                                </button>
                                                
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
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <a href="auden-biography.html" class="index-link">  
                                            <div class="card index-card">
                                                <div class="card-body">
                                                    <img src="images/index/W-H-Auden_7.jpg"
                                                        class="d-block w-100"
                                                        alt="W.H. Auden Image"/>
                                                </div>
                                                <div class="card-header">  
                                                    <h4>W. H. Auden</h4>                                         
                                                </div>
                                            </div>                                    
                                        </a>
                                    </div>
                                    <div class="col-md-3">
                                        <a href="musulin-biography.html" class="index-link">                                                     
                                            <div class="card index-card">
                                                <div class="card-body">
                                                    <img src="images/index/stella-musulin_0237.jpg" 
                                                        class="d-block w-100" 
                                                        alt="Stella Musulin Image"/>
                                                </div>
                                                <div class="card-header">   
                                                    <h4>Stella Musulin</h4>                                     
                                                </div>
                                            </div>                                 
                                        </a>
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