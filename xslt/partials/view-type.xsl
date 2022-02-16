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
        <xsl:param name="reading-type"></xsl:param>
        <div class="tab-content">
            <xsl:for-each-group select="*" group-starting-with="tei:pb">                                                 
                <xsl:choose>
                    <xsl:when test="position() = 1">                                                         
                        <div class="pagination-tab tab-pane active" data-tab="{$reading-type}"  id="{$reading-type}-paginate-{position()}" tabindex="-1">
                            <div id="container-resize-{position()}" class="transcript row">  
                                
                                <div id="text-resize-{position()}" class="text-re col-md-6"> 
                                    <div class="card-body">
                                        <xsl:for-each select="current-group()[self::tei:p]">
                                            <p>
                                                <xsl:apply-templates>
                                                    <xsl:with-param name="view" select="$reading-type"/>
                                                </xsl:apply-templates>
                                            </p>
                                        </xsl:for-each>  
                                    </div>                                                                      
                                </div>   
                                
                                <div id="img-resize-{position()}" class="col-md-6">
                                    <div class="card-header" style="border-radius:.25rem;">
                                        <div class="expand-wrapper" style="cursor:col-resize;">
                                            <svg id="img-expand-{position()}" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-aspect-ratio" viewBox="0 0 16 16">
                                                <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h13A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 12.5v-9zM1.5 3a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-13z"/>
                                                <path d="M2 4.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1H3v2.5a.5.5 0 0 1-1 0v-3zm12 7a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1 0-1H13V8.5a.5.5 0 0 1 1 0v3z"/>
                                            </svg>
                                            <p><small>change size</small></p>
                                        </div>
                                        <!--<hr/> -->                                             
                                        <xsl:variable name="osd_container_id" select="concat(@type, '_container_', generate-id())"/>
                                        <xsl:variable name="osd_container_id2" select="concat(@type, '_container2_', generate-id())"/>
                                        <div id="viewer-{position()}">
                                            <div id="{$osd_container_id}" style="padding:.5em;">
                                                <!-- image container accessed by OSD script -->
                                                <script type="text/javascript" src="js/osd_single.js"></script>
                                                <div id="{$osd_container_id2}">
                                                    <xsl:if test="@facs">    
                                                        <xsl:variable name="iiif-ext" select="'full/full/0/default.jpg'"/> 
                                                        <xsl:variable name="facs_id" select="concat(@type, '_img_', generate-id())"/>
                                                        <img id="{$facs_id}" onload="[load_image('{$facs_id}','{$osd_container_id}','{$osd_container_id2}'), $( document ).ready(resize('{position()}'))]">
                                                            <xsl:attribute name="src">
                                                                <xsl:value-of select="concat(@facs , $iiif-ext)"/>
                                                            </xsl:attribute>
                                                        </img>                                                                
                                                    </xsl:if>                                
                                                </div>                                
                                            </div>  
                                        </div>
                                    </div>
                                </div>    
                                
                            </div>
                        </div>                                                         
                    </xsl:when>
                    <xsl:otherwise>
                        <div class="pagination-tab tab-pane fade" data-tab="{$reading-type}" id="{$reading-type}-paginate-{position()}" tabindex="-1">
                            <div id="container-resize-{position()}" class="transcript row">
                                <div id="text-resize-{position()}" class="text-re col-md-6">                                                                
                                    <div class="card-body">                                                                                                                                                                                       
                                        <xsl:for-each select="current-group()[self::tei:p]">
                                            <p>
                                                <xsl:apply-templates>
                                                    <xsl:with-param name="view" select="$reading-type"/>
                                                </xsl:apply-templates>
                                            </p>
                                        </xsl:for-each>
                                    </div>
                                </div>                                                     
                                <div id="img-resize-{position()}" class="col-md-6">
                                    <div class="expand-wrapper" style="cursor:col-resize;">
                                        <svg id="img-expand-{position()}" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-aspect-ratio" viewBox="0 0 16 16">
                                            <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h13A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 12.5v-9zM1.5 3a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-13z"/>
                                            <path d="M2 4.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1H3v2.5a.5.5 0 0 1-1 0v-3zm12 7a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1 0-1H13V8.5a.5.5 0 0 1 1 0v3z"/>
                                        </svg>
                                        <p><small>change size</small></p>
                                    </div>
                                    <!--<hr/> -->                                             
                                    <xsl:variable name="osd_container_id" select="concat(@type, '_container_', generate-id())"/>
                                    <xsl:variable name="osd_container_id2" select="concat(@type, '_container2_', generate-id())"/>
                                    <div id="viewer-{position()}">
                                        <div id="{$osd_container_id}" style="padding:.5em;">
                                            <!-- image container accessed by OSD script -->
                                            <script type="text/javascript" src="js/osd_single.js"></script>
                                            <div id="{$osd_container_id2}">
                                                <xsl:if test="@facs">    
                                                    <xsl:variable name="iiif-ext" select="'full/full/0/default.jpg'"/> 
                                                    <xsl:variable name="facs_id" select="concat(@type, '_img_', generate-id())"/>
                                                    <img id="{$facs_id}" onload="[load_image('{$facs_id}','{$osd_container_id}','{$osd_container_id2}'), $( document ).ready(resize('{position()}'))]">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="concat(@facs , $iiif-ext)"/>
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
    <xsl:template name="view-type-no-img">
        <xsl:param name="reading-type"></xsl:param>
        <div class="tab-content">
            <xsl:for-each-group select="*" group-starting-with="tei:pb">                                                
                <xsl:choose>
                    <xsl:when test="position() = 1">
                        <div class="pagination-tab tab-pane active" data-tab="{$reading-type}" id="{$reading-type}-paginate-{position()}" tabindex="-1">
                            <div class="card-body">
                                <xsl:choose>
                                    <xsl:when test="$reading-type = 'reading'">
                                        <div class="yes-index">
                                            <xsl:for-each select="current-group()[self::tei:p]">
                                                <p>                                                        
                                                    <xsl:apply-templates>
                                                        <xsl:with-param name="view" select="$reading-type"/>
                                                    </xsl:apply-templates>
                                                </p>
                                            </xsl:for-each>
                                        </div>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:for-each select="current-group()[self::tei:p]">
                                            <p>                                                        
                                                <xsl:apply-templates>
                                                    <xsl:with-param name="view" select="$reading-type"/>
                                                </xsl:apply-templates>
                                            </p>
                                        </xsl:for-each>
                                    </xsl:otherwise>
                                </xsl:choose>                                
                            </div>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <div class="pagination-tab tab-pane fade" data-tab="{$reading-type}" id="{$reading-type}-paginate-{position()}" tabindex="-1">
                            <div class="card-body"> 
                                <xsl:choose>
                                    <xsl:when test="$reading-type = 'reading'">
                                        <xsl:for-each select="current-group()[self::tei:p]">
                                            <p class="yes-index">                                                        
                                                <xsl:apply-templates>
                                                    <xsl:with-param name="view" select="$reading-type"/>
                                                </xsl:apply-templates>
                                            </p>
                                        </xsl:for-each>                                        
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:for-each select="current-group()[self::tei:p]">
                                            <p>                                                        
                                                <xsl:apply-templates>
                                                    <xsl:with-param name="view" select="$reading-type"/>
                                                </xsl:apply-templates>
                                            </p>
                                        </xsl:for-each>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </div>
                        </div>
                    </xsl:otherwise>
                </xsl:choose>                                                
            </xsl:for-each-group>
        </div>
    </xsl:template>
</xsl:stylesheet>