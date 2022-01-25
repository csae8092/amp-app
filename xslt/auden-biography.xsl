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
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">  
                        <div class="card">
                            <div class="card-header text-center">
                                <h1><xsl:value-of select="$doc_title"/></h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <xsl:for-each select="//tei:event">
                                    <xsl:variable name="panel-id" select="concat(generate-id(), '-', position())"/>
                                    <xsl:variable name="img" select="concat(@facs, 'full/full/0/default.jpg')"/>
                                    <div class="row timeline">
                                        <xsl:choose>
                                            <xsl:when test="@type='correspondence'">                                                        
                                                <div class="col-md-5">    
                                                    <a title="open document" href="{replace(@xml:id, '.xml', '.html')}">
                                                        <div class="card timeline-panel-left">
                                                            <div class="card-body">                                                                 
                                                                <img title="{./tei:label}" alt="{./tei:label}" src="{$img}"/>
                                                            </div>          
                                                            <div class="card-footer">
                                                                <h5><xsl:value-of select="./tei:label"/></h5>
                                                            </div>                                                                   
                                                        </div>
                                                    </a>
                                                </div>  
                                                <div class="col-md-2">
                                                    <div class="timeline-circle">
                                                        <xsl:value-of select="./tei:head/tei:date/@when"/>
                                                    </div>
                                                </div>                                                                
                                                <div class="col-md-5">
                                                    <!--<div class="card timeline-panel" style="border:1px solid #615a60;">
                                                        <div class="card-body">
                                                            
                                                        </div>                                                                    
                                                    </div>-->
                                                </div>
                                            </xsl:when>
                                            <xsl:when test="@type='additional-materials'">
                                                <div class="col-md-5">
                                                    <!--<div class="card timeline-panel" style="border:1px solid #615a60;">
                                                        <div class="card-body">
                                                            
                                                        </div>                                                                    
                                                    </div>-->
                                                </div>                                                                
                                                <div class="col-md-2">
                                                    <div class="timeline-circle">
                                                        <xsl:value-of select="./tei:head/tei:date/@when"/>
                                                    </div>
                                                </div>                                                                
                                                <div class="col-md-5">    
                                                    <a title="open document" href="{replace(@xml:id, '.xml', '.html')}">
                                                        <div class="card timeline-panel-right">
                                                            <div class="card-body">                                                                 
                                                                <img title="{./tei:label}" alt="{./tei:label}" src="{$img}"/>
                                                            </div>          
                                                            <div class="card-footer">
                                                                <h5><xsl:value-of select="./tei:label"/></h5>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>                                                                
                                            </xsl:when>
                                            <xsl:when test="@type='photos'">
                                                <div class="col-md-5">
                                                    <!--<div class="card timeline-panel" style="border:1px solid #615a60;">
                                                        <div class="card-body">
                                                            
                                                        </div>                                                                    
                                                    </div>-->
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="timeline-circle">
                                                        <xsl:value-of select="./tei:head/tei:date/@when"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">    
                                                    <a title="open document" href="{replace(@xml:id, '.xml', '.html')}">
                                                        <div class="card timeline-panel-right">
                                                            <div class="card-body">                                                                 
                                                                <img title="{./tei:label}" alt="{./tei:label}" src="{$img}"/>
                                                            </div>          
                                                            <div class="card-footer">
                                                                <h5><xsl:value-of select="./tei:label"/></h5>
                                                            </div>                                                                 
                                                        </div>
                                                    </a>
                                                </div>                                                            
                                            </xsl:when>
                                        </xsl:choose>
                                    </div>                                                                                                    
                                </xsl:for-each> 
                            </div>                                                                        
                        </div>
                                                        
                        
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>                
            </body>
        </html>
    </xsl:template>
                    
    
</xsl:stylesheet>