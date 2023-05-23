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
    
    <xsl:import href="annotation-options.xsl"/>
    <xsl:import href="edition-md.xsl"/>
    
    <xsl:template name="header-nav">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@level='a'][1]/text()"/>
        </xsl:variable>
        <xsl:variable name="prev">
            <xsl:value-of select="substring-after(replace(.//tei:correspContext/tei:ref[@subtype='previous_letter']/@target, '.xml', '.html'), '#')"/>
        </xsl:variable>
        <xsl:variable name="next">
            <xsl:value-of select="substring-after(replace(.//tei:correspContext/tei:ref[@subtype='next_letter']/@target, '.xml', '.html'), '#')"/>
        </xsl:variable>        
        <div class="row" id="title-nav">                                    
            <div class="col-md-3" style="text-align:left;"> 
                <div class="row">
                    <div class="col-md-2" style="margin-top:.7em;">

                        <xsl:if test="string-length($prev) != 0">
                            <a id="prev-doc">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="$prev"/>
                                </xsl:attribute>
                                <svg class="arrow svg-inline--fa fa-chevron-left fa-w-10" title="previous" aria-labelledby="svg-inline--fa-title-1" data-prefix="fas" data-icon="chevron-left" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" data-fa-i2svg=""><title id="svg-inline--fa-title-1">previous</title><path fill="currentColor" d="M34.52 239.03L228.87 44.69c9.37-9.37 24.57-9.37 33.94 0l22.67 22.67c9.36 9.36 9.37 24.52.04 33.9L131.49 256l154.02 154.75c9.34 9.38 9.32 24.54-.04 33.9l-22.67 22.67c-9.37 9.37-24.57 9.37-33.94 0L34.52 272.97c-9.37-9.37-9.37-24.57 0-33.94z"></path></svg><!-- <i class="fas fa-chevron-left" title="previous"></i> -->
                            </a>
                        </xsl:if>
                        
                    </div>
                    <div class="col-md-10" style="margin-top:.7em;">
                        <xsl:variable name="doc_date" 
                            as="xs:date" 
                            select="xs:date(if(//tei:origDate/@notAfter) then(//tei:origDate/@notAfter) else ('1996-12-31'))"/>
                        <xsl:variable name="max_date1" as="xs:date" select="xs:date('1973-12-31')"/>
                        <xsl:variable name="max_date2" as="xs:date" select="xs:date('1996-01-01')"/>
                        <xsl:variable name="low_date" as="xs:date" select="xs:date('1975-12-31')"/>
                        <xsl:choose>
                            <xsl:when test="$doc_date lt $max_date1 and not(contains(string-join(('0055', '0048', '0054', '0050', '0064', '0065', '0066', '0067', '0068', '0069', '0070', '0071', '0072', '0073', '0074', '0075'), ' '), substring-before(substring-after(//tei:TEI/@xml:id, '__'), '.xml')))">
                                <a style="text-align:left;" title="back to all letters" href="toc.html" class="nav-link btn btn-round btn-backlink">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
                                        <path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2z"/>
                                    </svg>
                                </a>  
                            </xsl:when>
                            <xsl:when test="$doc_date lt $max_date2 and $doc_date gt $low_date and not(contains(string-join(('0055', '0048', '0054', '0050', '0064', '0065', '0066', '0067', '0068', '0069', '0070', '0071', '0072', '0073', '0074', '0075'), ' '), substring-before(substring-after(//tei:TEI/@xml:id, '__'), '.xml')))">
                                <a style="text-align:left;" title="back to all memoirs" href="toc_m.html" class="nav-link btn btn-round btn-backlink">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
                                        <path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2z"/>
                                    </svg>
                                </a>  
                            </xsl:when>
                            <xsl:when test="contains(string-join(('0055', '0048', '0054', '0050', '0064', '0065', '0066', '0067', '0068', '0069', '0070', '0071', '0072', '0073', '0074', '0075'), ' '), substring-before(substring-after(//tei:TEI/@xml:id, '__'), '.xml'))"
                                <a style="text-align:left;" title="back to all photos" href="photos.html" class="nav-link btn btn-round btn-backlink">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
                                        <path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2z"/>
                                    </svg>
                                </a>  
                            </xsl:when>
                            
                        </xsl:choose>
                        
                    </div>
                </div>
            </div>
            <div class="col-md-6" style="text-align:center;margin-top: 1em;">
                <!--   adding arche metadata for each edition   -->
                <xsl:call-template name="edition-md">
                    <xsl:with-param name="doc_title" select="$doc_title"/>
                </xsl:call-template>
            </div>
            <div class="col-md-3">
                <div class="row">
                    <div class="col-md-8" style="text-align:right;">
                        <!--   adding annotation view and options   -->
                        <xsl:call-template name="annotation-options"/>
                    </div>
                    <div class="col-md-2" style="margin-top:1em;text-align:right;">
                        <a style="font-style:italic;cursor:pointer;padding:.5em;" id="show-text">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-body-text" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M0 .5A.5.5 0 0 1 .5 0h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 0 .5Zm0 2A.5.5 0 0 1 .5 2h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5Zm9 0a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5Zm-9 2A.5.5 0 0 1 .5 4h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5Zm5 0a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5Zm7 0a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5Zm-12 2A.5.5 0 0 1 .5 6h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5Zm8 0a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5Zm-8 2A.5.5 0 0 1 .5 8h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5Zm7 0a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5Zm-7 2a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5Zm0 2a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5Zm0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Z"/>
                            </svg>
                        </a>
                    </div>
                    <div class="col-md-2" style="margin-top:.7em;text-align:right;">
                        <xsl:if test="string-length($next) != 0">
                            <a id="next-doc">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="$next"/>
                                </xsl:attribute>
                                <svg class="arrow svg-inline--fa fa-chevron-right fa-w-10" title="next" aria-labelledby="svg-inline--fa-title-2" data-prefix="fas" data-icon="chevron-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" data-fa-i2svg="">
                                    <title id="svg-inline--fa-title-2">next</title>
                                    <path fill="currentColor" d="M285.476 272.971L91.132 467.314c-9.373 9.373-24.569 9.373-33.941 0l-22.667-22.667c-9.357-9.357-9.375-24.522-.04-33.901L188.505 256 34.484 101.255c-9.335-9.379-9.317-24.544.04-33.901l22.667-22.667c9.373-9.373 24.569-9.373 33.941 0L285.475 239.03c9.373 9.372 9.373 24.568.001 33.941z"></path>
                                </svg><!-- <i class="fas fa-chevron-right" title="next"></i> -->
                            </a>
                        </xsl:if>
                    </div>
                </div>
                
            </div>
        </div><!-- .row -->
        <div class="row" style="margin:.2em auto;">
            <div class="col-md-8">
            </div>
            <div class="col-md-2" style="text-align:right;">
                <input type="checkbox" name="opt[]" value="separateWordSearch" checked="checked"/> separate word search
                <!--<br></br>
                <input type="checkbox" name="opt[]" value="diacritics" checked="checked"/> diacritics-->
            </div>
            <div class="col-md-2" style="text-align:right;">
                <input type="text" name="keyword" class="form-control input-sm" placeholder="enter keyword..."/>
            </div>
        </div>
        <!-- .card-header -->          
    </xsl:template>
</xsl:stylesheet>