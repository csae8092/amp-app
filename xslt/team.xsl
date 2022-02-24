<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/osd-container.xsl"/>
    <xsl:import href="partials/tei-facsimile.xsl"/>
    <xsl:import href="partials/tei-ref.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:titleStmt/tei:title"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">  
                        <xsl:apply-templates select="//tei:div[parent::tei:body]"/>
                    </div>
                    
                    <xsl:call-template name="html_footer"/>
                </div>
            </body>
        </html>
    </xsl:template>
                    
    <xsl:template match="tei:div[parent::tei:body]">
        <div class="card">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:div[parent::tei:div]">
        <div class="card-body">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:head[parent::tei:div[parent::tei:body]]">
        <div class="card-header">
            <h1><xsl:apply-templates/></h1>
        </div>        
    </xsl:template>
    <xsl:template match="tei:head[parent::tei:div[parent::tei:div]]">
        <h3><xsl:apply-templates/></h3>                
    </xsl:template>
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:hi">
        <span style="font-weight:{@rend};">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>