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
        <div class="row" id="title-nav">                                    
            <div class="col-md-12" style="text-align:center;margin-top: 1em;">
                <!--   adding arche metadata for each edition   -->
                <h5 class="card-text">
                    <xsl:value-of select="$doc_title"/>                        
                </h5>
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