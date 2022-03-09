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
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:titleStmt/tei:title[1]/text()"/>
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
                        <div class="card">
                            <div class="card-header">
                                <h1><xsl:value-of select="$doc_title"/></h1>
                            </div>                          
                             <div class="card-body">
                                 <div class="row">
                                     <div class="col-md-6">
                                         <xsl:apply-templates select="//tei:body/tei:div/tei:p"/>
                                         <xsl:apply-templates select="//tei:div/tei:div[1]"/>
                                     </div>
                                     <div class="col-md-6">
                                         <div class="flex-md-row mb-4 align-items-center">
                                             <xsl:variable name="img" select="replace(//tei:figure/tei:graphic/@url, '../images', 'images')"/>
                                             <img class="card-img-right flex-auto d-md-block" src="{replace($img, '.JPG', '_800x1128.JPG')}" alt="{//tei:figure/tei:head}"/>
                                             <p style="text-align:right;"><small><xsl:value-of select="//tei:figure/tei:figDesc"/></small></p>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="row">
                                     <div class="col-md-12">
                                         <xsl:apply-templates select="//tei:div/tei:div[2]"/>
                                         <xsl:apply-templates select="//tei:div/tei:div[3]"/>
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
                    
    <xsl:template match="tei:div">
        <div><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="tei:head">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
</xsl:stylesheet>