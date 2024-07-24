<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <!--<xsl:import href="partials/tei-ref.xsl"/>-->
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:titleStmt/tei:title"/>
        </xsl:variable>
        <html lang="en">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>
            <body class="d-flex flex-column">
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0">
                    <div class="container-fluid">
                        <div class="my-4">
                            <h1><xsl:value-of select="//tei:body/tei:div[1]"/></h1>
                            <xsl:apply-templates select="//tei:body"/>
                        </div>
                            
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="tei:body/tei:div[1]"/>
    <xsl:template match="tei:div">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:head">
        <xsl:choose>
            <xsl:when test="following-sibling::tei:p[1]">
                <div class="card-header">
                    <h3><xsl:apply-templates/></h3>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="card-header" style="padding: 2em; text-align: center;">
                    <h2><xsl:apply-templates/></h2>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:p">
        <div class="card-body">
            <p><xsl:apply-templates/></p>
        </div>
    </xsl:template>
    <xsl:template match="tei:hi">
        <span style="font-weight:{@rend};">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>