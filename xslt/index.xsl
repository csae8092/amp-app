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
                <meta name="Document type" class="staticSearch_desc" content="index"/>
            </head>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                
                    <div class="wrapper" id="wrapper-hero">
                        <div class="row">
                            <div class="col-md-8" style="padding:0!important;">
                                <div class="wrapper">
                                    <div class="container hero-dark" id="wrapper-hero-inner" tabindex="-1" style="margin-top:5%;">
                                        <div class="main-title">
                                            <h1 style="color:#615a60;padding:.5em 0;">Auden Musulin Papers</h1>
                                            <h2 style="color:#615a60;">A Digital Edition of W. H. Auden's Letters to Stella Musulin</h2>
                                        </div>
                                        <p>This website presents the letters and literary papers by Anglo-American poet W. H. Auden (1907-1973) in the estate of Welsh-Austrian writer and journalist Stella Musulin (1915-1996). Previously unpublished, they cast a fresh light on Auden's life and work in Austria.</p>  
                                        <button class="btn btn-round">
                                            <a href="description.html">Read More</a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3" style="padding:0!important;">
                                <div class="card" id="carousel-card">
                                    <div class="card-body" id="carousel-body">
                                        <div id="audenIndexCarousel" class="container carousel carousel-fade" data-ride="carousel">
                                            <!--<ol class="carousel-indicators">
                                                <li data-target="#audenIndexCarousel" data-slide-to="0" class="active"></li>
                                                <li data-target="#audenIndexCarousel" data-slide-to="1"></li>
                                                <li data-target="#audenIndexCarousel" data-slide-to="2"></li>
                                                <li data-target="#audenIndexCarousel" data-slide-to="3"></li>
                                                <li data-target="#audenIndexCarousel" data-slide-to="4"></li>
                                                <li data-target="#audenIndexCarousel" data-slide-to="5"></li>
                                                <li data-target="#audenIndexCarousel" data-slide-to="6"></li>
                                                <li data-target="#audenIndexCarousel" data-slide-to="7"></li>
                                                <li data-target="#audenIndexCarousel" data-slide-to="8"></li>
                                                <li data-target="#audenIndexCarousel" data-slide-to="9"></li>
                                                <li data-target="#audenIndexCarousel" data-slide-to="10"></li>
                                                <li data-target="#audenIndexCarousel" data-slide-to="11"></li>                                       
                                            </ol>-->
                                            <div class="carousel-inner">
                                                <div class="carousel-item active">
                                                    <img src="images/daumenkino/DSC_0250.JPG" class="d-block" alt="..."/>
                                                    <!--<div class="carousel-caption d-none d-md-block" style="background-image: linear-gradient(rgba(38.0, 35.3, 37.6, 0.5), rgba(38.0, 35.3, 37.6, 0.5));">
                                                    </div>-->
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images/daumenkino/DSC_0251.JPG" class="d-block w-100" alt="..."/>
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images/daumenkino/DSC_0252.JPG" class="d-block w-100" alt="..."/>
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images/daumenkino/DSC_0253.JPG" class="d-block w-100" alt="..."/>
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images/daumenkino/DSC_0254.JPG" class="d-block w-100" alt="..."/>
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images/daumenkino/DSC_0267.JPG" class="d-block w-100" alt="..."/>
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images/daumenkino/DSC_0268.JPG" class="d-block w-100" alt="..."/>
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images/daumenkino/DSC_0257.JPG" class="d-block w-100" alt="..."/>
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images/daumenkino/DSC_0265.JPG" class="d-block w-100" alt="..."/>
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images/daumenkino/DSC_0259.JPG" class="d-block w-100" alt="..."/>
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images/daumenkino/DSC_0260.JPG" class="d-block w-100" alt="..."/>
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images/daumenkino/DSC_0262.JPG" class="d-block w-100" alt="..."/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                 
                            </div>
                            <div class="col-md-1" style="padding:0!important;">
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid" style="margin-top:3em;">
                        <div class="row">
                            <div class="col-md-4">
                                <a href="toc.html" class="index-link">                                   
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img src="images/Auden_Musulin_Papers_Logo_rechteckig_web.png" class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">                                            
                                            <h4>W. H. Auden's correspondence with Stella Musulin</h4>
                                        </div>
                                    </div>                                     
                                </a>                                    
                            </div>                            
                            <div class="col-md-4">
                                <a href="auden-biography.html" class="index-link">  
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img src="images/index/W-H-Auden_7.jpg" class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">  
                                            <h4>W. H. Auden</h4>                                         
                                        </div>
                                    </div>                                    
                                </a>
                            </div>   
                            <div class="col-md-4">
                                <a href="musulin-biography.html" class="index-link">                                                     
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img src="images/index/stella-musulin_0237.jpg" class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">   
                                            <h4>Stella Musulin</h4>                                     
                                        </div>
                                    </div>                                 
                                </a>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>
            </body>
            <script type="text/javascript">
                $('.carousel').carousel({
                    interval: 2000
                });
            </script>
            <script type="text/javascript" src="autocomplete-addon/autocomplete-download-only.js"></script>
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