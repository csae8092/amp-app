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
                
                    <div class="wrapper" id="wrapper-hero-amp">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="wrapper">
                                    <div class="container hero-dark" id="wrapper-hero-inner" tabindex="-1">
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
                                <!--<div class="card" id="carousel-card">
                                    <div class="card-body" id="carousel-body">
                                        <div id="audenIndexCarousel" class="container carousel slide" data-ride="carousel">
                                            <!-\-<ol class="carousel-indicators">
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
                                            </ol>-\->
                                            <div class="carousel-inner">
                                                <div class="carousel-item active">
                                                    <img src="images/daumenkino/DSC_0250.JPG" class="d-block" alt="..."/>
                                                    <!-\-<div class="carousel-caption d-none d-md-block" style="background-image: linear-gradient(rgba(38.0, 35.3, 37.6, 0.5), rgba(38.0, 35.3, 37.6, 0.5));">
                                                    </div>-\->
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
                                </div>--> 
                                <div class="card" id="document-search-index">
                                    <div class="card-header">                                        
                                        <h5>Document search</h5>       
                                        <p style="margin-bottom: 2em;">Explore the Auden Musulin collection with full-text search features.</p>
                                        <form class="form-inline my-2 my-lg-0 navbar-search-form" method="get" action="search.html" role="search">
                                            <input class="form-control navbar-search" id="s" name="q" type="text" placeholder="Search" value="" autocomplete="off" />
                                            <button type="submit" class="navbar-search-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                                </svg>
                                            </button>
                                        </form>
                                        <p style="margin-top: .5em; padding-left: 10px"><a href="search.html" title="advanced search">advanced search</a></p>
                                    </div>                                                                       
                                </div>                                
                            </div>
                            <div class="col-md-1" style="padding:0!important;">
                            </div>
                        </div>
                        <div class="row auden-item">
                            <div class="auden-item col-md-1">
                                <img src="images/daumenkino/DSC_0250.JPG" class="d-block" alt="..."/>
                            </div>
                            <div class="auden-item col-md-1">
                                <img src="images/daumenkino/DSC_0251.JPG" class="d-block w-100" alt="..."/>
                            </div>
                            <div class="auden-item col-md-1">
                                <img src="images/daumenkino/DSC_0252.JPG" class="d-block w-100" alt="..."/>
                            </div>
                            <div class="auden-item col-md-1">
                                <img src="images/daumenkino/DSC_0253.JPG" class="d-block w-100" alt="..."/>
                            </div>
                            <div class="auden-item col-md-1">
                                <img src="images/daumenkino/DSC_0254.JPG" class="d-block w-100" alt="..."/>
                            </div>
                            <div class="auden-item col-md-1">
                                <img src="images/daumenkino/DSC_0267.JPG" class="d-block w-100" alt="..."/>
                            </div>
                            <div class="auden-item col-md-1">
                                <img src="images/daumenkino/DSC_0268.JPG" class="d-block w-100" alt="..."/>
                            </div>
                            <div class="auden-item col-md-1">
                                <img src="images/daumenkino/DSC_0257.JPG" class="d-block w-100" alt="..."/>
                            </div>
                            <div class="auden-item col-md-1">
                                <img src="images/daumenkino/DSC_0265.JPG" class="d-block w-100" alt="..."/>
                            </div>
                            <div class="auden-item col-md-1">
                                <img src="images/daumenkino/DSC_0259.JPG" class="d-block w-100" alt="..."/>
                            </div>
                            <div class="auden-item col-md-1">
                                <img src="images/daumenkino/DSC_0260.JPG" class="d-block w-100" alt="..."/>
                            </div>
                            <div class="auden-item col-md-1">
                                <img src="images/daumenkino/DSC_0262.JPG" class="d-block w-100" alt="..."/>
                            </div>                            
                        </div>                        
                    </div>
                    <div class="row scroll-link" style="background-color: #fff;">
                        <div class="col-md-12">
                            <div class="text-center" id="page-content-start">
                                <h5>
                                    <a href="#page-content-start">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
                                            <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"/>
                                        </svg>
                                        <xsl:text> scroll down </xsl:text>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
                                            <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"/>
                                        </svg>
                                    </a>
                                </h5>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row" id="wrapper-content-amp">
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
                        <div class="row scroll-link" style="margin-top: 2em;">
                            <div class="col-md-6">
                                <div class="text-center">
                                    <h5>
                                        <a href="#page">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up" viewBox="0 0 16 16">
                                                <path d="M3.204 11h9.592L8 5.519 3.204 11zm-.753-.659 4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659z"/>
                                            </svg>
                                            <xsl:text> scroll up </xsl:text>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up" viewBox="0 0 16 16">
                                                <path d="M3.204 11h9.592L8 5.519 3.204 11zm-.753-.659 4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659z"/>
                                            </svg>
                                        </a>
                                    </h5>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-center">
                                    <h5>
                                        <a href="#wrapper-footer-full">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
                                                <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"/>
                                            </svg>
                                            <xsl:text> scroll down </xsl:text>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
                                                <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"/>
                                            </svg>
                                        </a>
                                    </h5>
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
            <!--<script type="text/javascript">
                $('.carousel').carousel({
                    interval: 2000
                });
            </script>-->
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