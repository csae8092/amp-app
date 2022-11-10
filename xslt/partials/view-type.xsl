<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:_="urn:acdh" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
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
    
    <xsl:function name="_:ano">
        <xsl:param name="node"/>
        <xsl:for-each-group select="$node" group-by="$node">
            <xsl:sequence select="concat('(', count(current-group()[current-grouping-key() = .]), ' ', current-grouping-key(), ')')"/>
        </xsl:for-each-group>    
    </xsl:function>
    
    <xsl:template name="view-type-img">
        <xsl:variable name="hand" select="'font-family: Times New Roman, serif; font-size: 22px;'"/>
        <xsl:variable name="typed" select="'font-family: Courier New, monospace; font-size: 18px;'"/>
        <xsl:variable name="printed" select="'font-family: Arial, serif; font-size: 18px;'"/>
        
        <div class="pagination-top">
            <xsl:call-template name="view-pagination"/>
        </div> 
        
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
                            
                            <window-resize opt="resizing" pos="{position()}"></window-resize>

                            <div id="container-resize-{position()}" class="transcript row">  
                                
                                <div id="text-resize-{position()}" class="text-re col-md-6"> 
                                    <div class="card-body">
                                        <xsl:for-each select="current-group()[self::tei:p|self::tei:lg]">
                                            <!--
                                            <xsl:variable name="para" as="xs:int">
                                                <xsl:number level="any" from="tei:body" count="tei:p"/>
                                            </xsl:variable>
                                            <xsl:variable name="ano" select="child::*[not(self::tei:lb)]/name()"/>
                                            <xsl:if test="exists($ano)">
                                                <span class="identS" alt="In §{$para} are: {_:ano($ano)} transcript modifications.">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-columns" viewBox="0 0 16 16">
                                                        <path fill-rule="evenodd" d="M0 .5A.5.5 0 0 1 .5 0h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 0 .5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2A.5.5 0 0 1 .5 2h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2A.5.5 0 0 1 .5 4h10a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2A.5.5 0 0 1 .5 6h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2A.5.5 0 0 1 .5 8h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Z"/>
                                                    </svg>
                                                </span>
                                            </xsl:if>
                                            -->
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
                                    <xsl:variable name="osd_container_id" select="concat(@type, '_container_', position())"/>
                                    <xsl:variable name="osd_container_id2" select="concat(@type, '_container2_', position())"/>
                                    <div id="viewer-{position()}">
                                        <div id="spinner_{$osd_container_id}" class="text-center">
                                            <div class="loader"></div>
                                        </div>
                                        <div id="{$osd_container_id}" style="padding:.5em;">
                                            <!-- image container accessed by OSD script -->                                           
                                            <div id="{$osd_container_id2}">
                                                <xsl:if test="@facs">
                                                    <xsl:variable name="facs_item" select="tokenize(@facs, '/')[5]"/>
                                                    <image-loader 
                                                        opt="image-loader"
                                                        data-type="{@type}"
                                                        data-source="{$facs_item}" 
                                                        pos="{position()}">
                                                    </image-loader>
                                                    <!--<img id="{$facs_id}" onload="[load_image('{$facs_id}','{$osd_container_id}','{$osd_container_id2}'),$( document ).ready(resize('{position()}'))]">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
                                                        </xsl:attribute>
                                                    </img>  -->                                                              
                                                </xsl:if>                                
                                            </div>                                
                                        </div>  
                                    </div>
                                </div>
                            </div>
                        </div>                                                         
                    </xsl:when>
                    <xsl:when test="position() > 1">
                        <div class="pagination-tab tab-pane fade" data-tab="paginate" id="paginate-{position()}" tabindex="-1">
                            
                            <window-resize opt="resizing" pos="{position()}"></window-resize>
                            
                            <div id="container-resize-{position()}" class="transcript row">
                                <div id="text-resize-{position()}" class="text-re col-md-6">                                                                
                                    <div class="card-body">
                                        <xsl:for-each select="current-group()[self::tei:p|self::tei:lg]">
                                            <!--
                                            <xsl:variable name="para" as="xs:int">
                                                <xsl:number level="any" from="tei:body" count="tei:p"/>
                                            </xsl:variable>
                                            <xsl:variable name="ano" select="child::*[not(self::tei:lb)]/name()"/>
                                            <xsl:if test="exists($ano)">
                                                <span class="identS" alt="In §{$para} are: {_:ano($ano)} transcript modifications.">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-columns" viewBox="0 0 16 16">
                                                        <path fill-rule="evenodd" d="M0 .5A.5.5 0 0 1 .5 0h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 0 .5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2A.5.5 0 0 1 .5 2h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2A.5.5 0 0 1 .5 4h10a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2A.5.5 0 0 1 .5 6h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2A.5.5 0 0 1 .5 8h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-13 2a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5Zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Z"/>
                                                    </svg>
                                                </span>
                                            </xsl:if>
                                            -->
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
                                    <xsl:variable name="osd_container_id" select="concat(@type, '_container_', position())"/>
                                    <xsl:variable name="osd_container_id2" select="concat(@type, '_container2_', position())"/>
                                    <div id="viewer-{position()}">
                                        <div id="spinner_{$osd_container_id}" class="text-center">
                                            <div class="loader"></div>
                                        </div>
                                        <div id="{$osd_container_id}" style="padding:.5em;">
                                            <!-- image container accessed by OSD script -->                                            
                                            <div id="{$osd_container_id2}">
                                                <xsl:if test="@facs">
                                                    <xsl:variable name="facs_item" select="tokenize(@facs, '/')[5]"/>
                                                    <image-loader 
                                                        opt="image-loader"
                                                        data-type="{@type}"
                                                        data-source="{$facs_item}" 
                                                        pos="{position()}">
                                                    </image-loader>
                                                    <!--<img id="{$facs_id}">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
                                                        </xsl:attribute>
                                                    </img> -->
                                                </xsl:if>                                
                                            </div>                                            
                                        </div>  
                                    </div>
                                        
                                </div>
                            </div>
                        </div>                                                         
                    </xsl:when>
                </xsl:choose>                
            </xsl:for-each-group>   
        </div>
        
        <div class="pagination-bottom">
            <xsl:call-template name="view-pagination"/>
        </div>    
        
    </xsl:template>
</xsl:stylesheet>