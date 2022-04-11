<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-facsimile.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
            <p>The template "view type" generates various view types e.g. reading, diplomatic, commentary.</p> 
            <p>Select between a type with or without images.</p>
            <p>Bootstrap is required.</p>
        </desc>    
    </doc>
    
    <xsl:template name="view-type-img">
        <xsl:variable name="hand" select="'font-family: Times New Roman, serif; font-size: 22px;'"/>
        <xsl:variable name="typed" select="'font-family: Courier New, monospace; font-size: 18px;'"/>
        <xsl:variable name="printed" select="'font-family: Arial, serif; font-size: 18px;'"/>
        
        <div class="tab-content"
            style="{
                if (ancestor::tei:text/@hand = '#handwritten') then 
                ($hand) else if (ancestor::tei:text/@hand = '#typed') then 
                ($typed) else if (ancestor::tei:text/@hand = '#printed') then 
                ($printed) else 
                ()
            }">
            <xsl:for-each-group select="*" group-starting-with="tei:pb">                                                 
                <xsl:choose>
                    <xsl:when test="position() = 1">                                                         
                        <div class="pagination-tab tab-pane active" data-tab="paginate"  id="paginate-{position()}" tabindex="-1">
                            <div class="expand-wrapper text-center">            
                                <input title="change size" id="img-expand-{position()}" type="range" min="1" max="400" value="201" class="slider"/>
                            </div>
                            <div id="container-resize-{position()}" class="transcript row">  
                                
                                <div id="text-resize-{position()}" class="text-re col-md-6"> 
                                    <div class="card-body">
                                        <xsl:for-each select="current-group()[self::tei:p|self::tei:lg]">
                                            <p class="yes-index" style="{
                                                if (@hand = '#handwritten') then
                                                ($hand) else if (@hand = '#typed') then
                                                ($typed) else if (@hand = '#printed') then
                                                ($printed) else
                                                ()
                                                }">
                                                <xsl:apply-templates/>
                                            </p>
                                        </xsl:for-each>  
                                    </div>                                                                      
                                </div>   
                                
                                <div id="img-resize-{position()}"
                                     class="col-md-6 card-header osd-viewer"
                                     style="padding: 1em;background-color: #dedede;">                                    
                                    <!--<hr/> -->                                             
                                    <xsl:variable name="osd_container_id" select="concat(@type, '_container_', generate-id())"/>
                                    <xsl:variable name="osd_container_id2" select="concat(@type, '_container2_', generate-id())"/>
                                    <div id="viewer-{position()}">
                                        <div id="{$osd_container_id}" style="padding:.5em;">
                                            <!-- image container accessed by OSD script -->
                                            <script type="text/javascript" src="js/osd_single.js"></script>
                                            <div id="{$osd_container_id2}">
                                                <xsl:if test="@facs">    
                                                    <xsl:variable name="iiif-ext" select="'.jp2/full/full/0/default.jpg'"/> 
                                                    <xsl:variable name="iiif-domain" select="'https://iiif.acdh.oeaw.ac.at/iiif/images/amp/'"/>
                                                    <xsl:variable name="facs_id" select="concat(@type, '_img_', generate-id())"/>
                                                    <xsl:variable name="facs_item" select="tokenize(@facs, '/')[5]"/>
                                                    <img id="{$facs_id}" onload="[load_image('{$facs_id}','{$osd_container_id}','{$osd_container_id2}'), $( document ).ready(resize('{position()}'))]">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
                                                        </xsl:attribute>
                                                    </img>                                                                
                                                </xsl:if>                                
                                            </div>                                
                                        </div>  
                                    </div>
                                    
                                </div>    
                                
                            </div>
                        </div>                                                         
                    </xsl:when>
                    <xsl:otherwise>
                        <div class="pagination-tab tab-pane fade" data-tab="paginate" id="paginate-{position()}" tabindex="-1">
                            <div class="expand-wrapper text-center">            
                                <input title="change size" id="img-expand-{position()}" type="range" min="1" max="400" value="201" class="slider"/>
                            </div>
                            <div id="container-resize-{position()}" class="transcript row">
                                <div id="text-resize-{position()}" class="text-re col-md-6">                                                                
                                    <div class="card-body">                                                                                                                                                                                       
                                        <xsl:for-each select="current-group()[self::tei:p|self::tei:lg]">
                                            <p style="{
                                                if (@hand = '#handwritten') then
                                                ($hand) else if (@hand = '#typed') then
                                                ($typed) else if (@hand = '#printed') then
                                                ($printed) else
                                                ()
                                                }">
                                                <xsl:apply-templates/>
                                            </p>
                                        </xsl:for-each>
                                    </div>
                                </div>                                                     
                                <div id="img-resize-{position()}" 
                                    class="col-md-6 card-header osd-viewer"
                                    style="padding: 1em;background-color: #dedede;">                                    
                                    <!--<hr/> -->                                             
                                    <xsl:variable name="osd_container_id" select="concat(@type, '_container_', generate-id())"/>
                                    <xsl:variable name="osd_container_id2" select="concat(@type, '_container2_', generate-id())"/>
                                    <div id="viewer-{position()}">
                                        <div id="{$osd_container_id}" style="padding:.5em;">
                                            <!-- image container accessed by OSD script -->
                                            <script type="text/javascript" src="js/osd_single.js"></script>
                                            <div id="{$osd_container_id2}">
                                                <xsl:if test="@facs">                                                      
                                                    <xsl:variable name="iiif-ext" select="'.jp2/full/full/0/default.jpg'"/> 
                                                    <xsl:variable name="iiif-domain" select="'https://iiif.acdh.oeaw.ac.at/iiif/images/amp/'"/>
                                                    <xsl:variable name="facs_id" select="concat(@type, '_img_', generate-id())"/>
                                                    <xsl:variable name="facs_item" select="tokenize(@facs, '/')[5]"/>
                                                    <img id="{$facs_id}" onload="[load_image('{$facs_id}','{$osd_container_id}','{$osd_container_id2}'), $( document ).ready(resize('{position()}'))]">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
                                                        </xsl:attribute>
                                                    </img> 
                                                </xsl:if>                                
                                            </div>                                
                                        </div>  
                                    </div>
                                        
                                </div>
                            </div>
                        </div>                                                         
                    </xsl:otherwise>
                </xsl:choose>                
            </xsl:for-each-group>   
        </div>
    </xsl:template>
</xsl:stylesheet>