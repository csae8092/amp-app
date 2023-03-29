<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="no" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/biography-el.xsl"/>
    <xsl:import href="partials/biography-circle.xsl"/>
    <xsl:import href="partials/add_modal-metadata.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@level='a'][1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>               
                
                <meta name="docImage" class="staticSearch_docImage">
                    <xsl:attribute name="content">
                        <xsl:value-of select="concat(//tei:pb[1]/@facs, 'full/full/0/default.jpg')"/>
                    </xsl:attribute>
                </meta>
                <meta name="docTitle" class="staticSearch_docTitle">
                    <xsl:attribute name="content">
                        <xsl:value-of select="//tei:titleStmt/tei:title[@level='a']"/>
                    </xsl:attribute>
                </meta>
                <style>

                </style>                
                <!--<script type="text/javascript" src="js/timelinejs/js/timeline.min.js"></script>-->
                <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
                    integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
                    crossorigin=""/>
                <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
                    integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
                    crossorigin=""></script>
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>                    
                    <div class="container-fluid"> 
                        <div class="text-right tei-logo">
                            <xsl:choose>
                                <xsl:when test="contains($doc_title, 'Musulin')">
                                    <h1>
                                        <a href="musulin-biography.xml?format=raw" title="TEI Source">
                                            <img alt="TEI Logo" src="images/TEI_Logo_36px.png"/>
                                        </a>
                                    </h1>
                                </xsl:when>
                                <xsl:otherwise>
                                    <h1>
                                        <a href="auden-biography.xml?format=raw" title="TEI Source">
                                            <img alt="TEI Logo" src="images/TEI_Logo_36px.png"/>
                                        </a>
                                    </h1>
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>                        
                        <div class="card">
                            <div class="card-body text-center" style="padding-bottom:0;">
                                <h1><xsl:value-of select="substring-before($doc_title, ' Biography')"/></h1>
                            </div>   
                            <div class="card-body text-center">
                                <ul style="margin-top:1em;padding-left:0;word-wrap:break-word;word-break:break-word;">
                                    <xsl:for-each-group select="//tei:event" group-by="tokenize(./tei:head/tei:date/@notAfter, '-')[1]">                                    
                                        <li style="display:inline;list-style:none;margin-left:1em;">
                                            <a href="#{current-grouping-key()}" title="jump to date">
                                                <xsl:value-of select="current-grouping-key()"/>
                                            </a>
                                        </li>
                                    </xsl:for-each-group>
                                </ul>
                                <!--<a href="#">
                                    <i class="far fa-play-circle fa-3x" title="autoplay timeline" data-toggle="modal" data-target="#exampleModalLong"/>
                                </a>-->
                            </div>                            
                        </div>                     
                        <div class="row">
                            <div class="col-md-12">                                
                                <xsl:for-each-group select="//tei:event" group-by="tokenize(./tei:head/tei:date/@notAfter, '-')[1]">                                    
                                    <!--<xsl:variable name="panel-id" select="concat(generate-id(), '-', position())"/>-->                                                                        
                                    <div class="timeline-wrapper" id="{current-grouping-key()}" style="padding-top:5em;">
                                        <div class="text-center">                                            
                                            <h2 id="timeline-heading">
                                                <xsl:value-of select="current-grouping-key()"/>
                                                <a href="#page" title="jump to the top" style="color:#fff; font-size:12px;">
                                                    <small>TOP</small>
                                                </a>                                            
                                            </h2>
                                        </div>   
                                        <xsl:for-each select="current-group()">
                                            <div class="row timeline">                                            
                                                <xsl:choose>
                                                    <xsl:when test="contains(@type, 'event')">                                                        
                                                        <div class="col-md-5">    
                                                            <xsl:call-template name="bio-el">
                                                                <xsl:with-param name="location" select="'left'"/>
                                                            </xsl:call-template>
                                                        </div>  
                                                        <div class="col-md-2">
                                                            <xsl:call-template name="bio-circle"/>
                                                        </div>                                                                
                                                        <div class="col-md-5">
                                                            <!--<div class="card timeline-panel" style="border:1px solid #615a60;">
                                                                <div class="card-body">
                                                                    
                                                                </div>                                                                    
                                                            </div>-->
                                                        </div>
                                                    </xsl:when>                                                    
                                                    <xsl:when test="@type='correspondence'">  <!-- or @type='additional-materials' or @type='photos' -->
                                                        <div class="col-md-5">
                                                            
                                                        </div>
                                                        <div class="col-md-2">
                                                            <xsl:call-template name="bio-circle"/>
                                                        </div>
                                                        <div class="col-md-5">    
                                                            <xsl:call-template name="bio-el">
                                                                <xsl:with-param name="location" select="'right'"/>
                                                            </xsl:call-template>
                                                        </div>                                                            
                                                    </xsl:when>
                                                </xsl:choose>
                                            </div>  
                                        </xsl:for-each>                                        
                                    </div>
                                </xsl:for-each-group> 
                                <!--<xsl:call-template name="modal-metadata"/>-->
                                <script type="text/javascript">
                                    $('.timeline-circle').mouseover(function() {                                        
                                        var date = $(this).attr('data');
                                        $(this).html(date);                                        
                                    });
                                    $('.timeline-circle').mouseout(function() {
                                        $(this).html("");
                                    });
                                </script>
                                <script type="text/javascript">
                                    $(document).on('click', 'a[href^="#"]', function (event) {
                                        event.preventDefault();
                                    
                                        $('html, body').animate({
                                            scrollTop: $($.attr(this, 'href')).offset().top
                                        }, 500);
                                    });
                                </script>
                            </div>                                                                        
                        </div>
                                                        
                        
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>                
            </body>
            <script type="text/javascript" src="js/leaflet_bio.js"/>
        </html>
    </xsl:template>
    <xsl:template match="tei:hi">
        <span class="italic"><xsl:apply-templates/></span>
    </xsl:template>                
    
</xsl:stylesheet>