<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-facsimile.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
            <p>The template "toc-cards" creats a card view of items from a collection</p> 
            <p>Bootstrap is required.</p>
        </desc>    
    </doc>
    
    <xsl:template name="toc-cards">
        <xsl:param name="category"></xsl:param>
        <xsl:for-each select="collection(concat('../../data/editions/', $category))//tei:TEI">
            <xsl:sort select="//tei:origDate/@when-iso"/>
            <xsl:variable name="full_path">
                <xsl:value-of select="document-uri(/)"/>
            </xsl:variable>                                
            <!--<xsl:variable name="date" select="//tei:correspAction/tei:date/@when-iso"/>-->
            <div class="col-md-4" style="padding: 0 !important;">
                <a>
                    <xsl:attribute name="href">                                                
                        <xsl:value-of select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"/>
                    </xsl:attribute>
                    <div class="card index-card" style="margin:.2em !important;">                                 
                        <div class="card-body">
                            <xsl:variable name="iiif-ext" select="'.jpg?format=iiif&amp;param=full/,150/0/default.jpg'"/> 
                            <xsl:variable name="iiif-domain" select="'https://id.acdh.oeaw.ac.at/auden-musulin-papers/'"/> 
                            <xsl:variable name="facs_item" select="tokenize(//tei:pb[1]/@facs, '/')[5]"/>
                            <img>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
                                </xsl:attribute>
                            </img>                            
                        </div>
                        <div class="card-header">                                                      
                            <p style="padding: .2em!important;margin:0!important;"><xsl:value-of select="//tei:title[@level='a']"/></p>
                        </div>                                        
                    </div>
                </a>
            </div>                                
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>