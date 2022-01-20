<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl tei xs"
    version="2.0">
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget add_header-navigation-custom-title.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied in html:body.</p>
            <p>The template "add_header-navigation-custom-title" creates a custom header without using tei:title but includes prev and next urls.</p> 
        </desc>    
    </doc>
    
    <xsl:template name="header-nav">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@level='a'][1]/text()"/>
        </xsl:variable>
        <div class="card-header">
            <xsl:variable name="col" select="collection('../../data/editions')//tei:TEI"/>
            <div class="row">
                <div class="col-md-2 card-body">                    
                    <xsl:for-each select="$col">
                        <xsl:value-of select="@xml:id"/>
                        <xsl:variable name="full_path_prev">
                            <xsl:value-of select="document-uri(/)"/>
                        </xsl:variable> 
                        <xsl:variable name="prev" select="position() - 1"/>
                        <xsl:choose>
                            <xsl:when test="position() = $prev">
                                <h2>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="$full_path_prev"/>
                                        </xsl:attribute>
                                        <svg class="arrow svg-inline--fa fa-chevron-left fa-w-10" title="previous" aria-labelledby="svg-inline--fa-title-1" data-prefix="fas" data-icon="chevron-left" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" data-fa-i2svg=""><title id="svg-inline--fa-title-1">previous</title><path fill="currentColor" d="M34.52 239.03L228.87 44.69c9.37-9.37 24.57-9.37 33.94 0l22.67 22.67c9.36 9.36 9.37 24.52.04 33.9L131.49 256l154.02 154.75c9.34 9.38 9.32 24.54-.04 33.9l-22.67 22.67c-9.37 9.37-24.57 9.37-33.94 0L34.52 272.97c-9.37-9.37-9.37-24.57 0-33.94z"></path></svg><!-- <i class="fas fa-chevron-left" title="previous"></i> -->
                                    </a>                                    
                                </h2>  
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>                                          
                </div>                        
                <div class="col-md-8 card-body">
                    <h2 class="card-text" style="text-align:center;">
                        <xsl:value-of select="$doc_title"/>
                        <br/>
                        <a href="#">
                            <i class="fas fa-info" title="show more info about the document" data-toggle="modal" data-target="#exampleModalLong"/>
                        </a> 
                        |                                                 
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat( '','?format=raw')"/>
                            </xsl:attribute>
                            <i class="fas fa-download" title="show TEI source"/>
                        </a>
                    </h2>
                </div>
                <div class="col-md-2 card-body">
                    <xsl:for-each select="$col">
                        <xsl:variable name="full_path_next">
                            <xsl:value-of select="document-uri(/)"/>
                        </xsl:variable>
                        <xsl:variable name="next" select="position() + 1"/>
                        <xsl:choose>
                            <xsl:when test="position() = $next">
                                <h2>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="$full_path_next"/>
                                        </xsl:attribute>
                                        <svg class="arrow svg-inline--fa fa-chevron-left fa-w-10" title="previous" aria-labelledby="svg-inline--fa-title-1" data-prefix="fas" data-icon="chevron-left" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" data-fa-i2svg=""><title id="svg-inline--fa-title-1">previous</title><path fill="currentColor" d="M34.52 239.03L228.87 44.69c9.37-9.37 24.57-9.37 33.94 0l22.67 22.67c9.36 9.36 9.37 24.52.04 33.9L131.49 256l154.02 154.75c9.34 9.38 9.32 24.54-.04 33.9l-22.67 22.67c-9.37 9.37-24.57 9.37-33.94 0L34.52 272.97c-9.37-9.37-9.37-24.57 0-33.94z"></path></svg><!-- <i class="fas fa-chevron-left" title="previous"></i> -->
                                    </a>                                    
                                </h2>  
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>                        
                </div>
            </div><!-- .row -->
        </div><!-- .card-header -->       
    </xsl:template>
</xsl:stylesheet>