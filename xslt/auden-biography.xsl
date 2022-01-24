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
                            <div class="card-header">
                                <h1><xsl:value-of select="$doc_title"/></h1>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <ul class="timeline" style="list-style:none;">
                                            <xsl:for-each select="//tei:event">
                                                <xsl:variable name="panel-id" select="concat(generate-id(), '-', position())"/>
                                                <li id="{$panel-id}">
                                                    <a title="open document" href="{replace(@xml:id, '.xml', '.html')}">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="card timeline-panel" style="border:1px solid #ccc;margin-right:1.8em;">
                                                                    <div class="card-body">
                                                                        <h5><xsl:value-of select="./tei:head"/></h5>
                                                                        <p><xsl:value-of select="./tei:ab"/></p>
                                                                    </div>                                                                    
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <!--<div class="card timeline-panel" style="border:1px solid #615a60;">
                                                                    <div class="card-body">
                                                                        
                                                                    </div>                                                                    
                                                                </div>-->
                                                            </div>
                                                        </div>                                                         
                                                    </a>                                                                                                        
                                                </li>                                                
                                            </xsl:for-each> 
                                        </ul>
                                    </div>
                                                                        
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>                
            </body>
        </html>
    </xsl:template>
                    
    
</xsl:stylesheet>