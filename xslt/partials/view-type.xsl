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
        <!--<xsl:variable name="hand" select="'font-family: Times New Roman, serif; font-size: 22px;'"/>
        <xsl:variable name="typed" select="'font-family: Courier New, monospace; font-size: 18px;'"/>
        <xsl:variable name="printed" select="'font-family: Arial, serif; font-size: 18px;'"/>-->
        
        <div class="pagination-top">
            <xsl:call-template name="view-pagination"/>
        </div> 
        
        <div class="{
                if (ancestor::tei:text/@hand = '#handwritten') then 
                ('handwritten') else if (ancestor::tei:text/@hand = '#typed') then 
                ('typed') else if (ancestor::tei:text/@hand = '#printed') then 
                ('printed') else ()
            } tab-content">
            <xsl:choose>
                <xsl:when test="./tei:div[@type]">
                    <xsl:for-each-group select="./tei:div[@type]/*" group-starting-with="tei:pb"><!-- envelope or letter content -->
                        <div class="pagination-tab tab-pane {if(position() = 1) then('active') else('fade')}" 
                            data-tab="paginate"  
                            id="paginate-{position()}" 
                            tabindex="-1">
                            
                            <div id="container-resize-{position()}" class="transcript row">  
                                
                                <div id="text-resize-{position()}" class="text-re col-md-9"> 
                                    <div class="card-body">
                                        <xsl:if test="@type='cv_sheet'">
                                            <img class="card-img-right flex-auto d-md-block"
                                                src="https://www.oeaw.ac.at/fileadmin/Institute/ACDH/img/logo/cvl_logo.png"
                                                alt="Computer Vision Lab Logo"
                                                style="max-width: 140px; height: auto; padding: .5em;"
                                                title="Computer Vision Lab"/>
                                        </xsl:if>
                                        <xsl:choose>
                                            <xsl:when test="current-group()//tei:cb">
                                                <div class="row">
                                                    <xsl:for-each-group select="current-group()[self::tei:div]/*"
                                                        group-starting-with="tei:cb"><!-- letter_messge or poem -->
                                                        <div class="{if(current-group()[self::tei:p[preceding-sibling::tei:cb]|self::tei:lg[preceding-sibling::tei:cb]]) then
                                                            ('col-md-6') else
                                                            ('col-md-12')}">
                                                            <xsl:for-each select="current-group()">
                                                                <xsl:call-template name="text-window">
                                                                    <xsl:with-param name="hand">
                                                                        <xsl:value-of select="./parent::tei:div/@hand"/>
                                                                    </xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:for-each>
                                                        </div>
                                                    </xsl:for-each-group>
                                                </div>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:for-each select="current-group()[self::tei:ab|self::tei:div]">
                                                    <xsl:call-template name="text-window">
                                                        <xsl:with-param name="hand">
                                                            <xsl:value-of select="@hand"/>
                                                        </xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:for-each>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </div>
                                </div>   
                                
                                <xsl:call-template name="img-window"/>
                            </div>
                        </div>
                    </xsl:for-each-group>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each-group select="*" group-starting-with="tei:pb">                                  
                        <div class="pagination-tab tab-pane {if(position() = 1) then('active') else('fade')}" 
                            data-tab="paginate"  
                            id="paginate-{position()}" 
                            tabindex="-1">
                            
                            <!--<window-resize opt="resizing" pos="{position()}" size="0.755"></window-resize>-->
                            
                            <div id="container-resize-{position()}" class="transcript row">  
                                
                                <div id="text-resize-{position()}" class="text-re col-md-9"> 
                                    <div class="card-body">
                                        <xsl:if test="@type='cv_sheet'">
                                            <img class="card-img-right flex-auto d-md-block"
                                                src="https://www.oeaw.ac.at/fileadmin/Institute/ACDH/img/logo/cvl_logo.png"
                                                alt="Computer Vision Lab Logo"
                                                style="max-width: 140px; height: auto; padding: .5em;"
                                                title="Computer Vision Lab"/>
                                        </xsl:if>
                                        <xsl:for-each select="current-group()[self::tei:p|self::tei:lg]">
                                            <xsl:call-template name="text-window"/>
                                        </xsl:for-each> 
                                    </div>
                                </div>   
                                <xsl:call-template name="img-window"/>
                            </div>
                        </div>                                                         
                    </xsl:for-each-group>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:if test="//tei:handShift">
                <script type="text/javascript" src="js/handshift.js"></script>
            </xsl:if>
        </div>
        
        <div class="pagination-bottom">
            <xsl:call-template name="view-pagination"/>
        </div>    
        
    </xsl:template>
    <xsl:template name="img-window">
        <div id="img-resize-{position()}"
            class="col-md-3 card-header osd-viewer"
            style="padding: 1em;background-color: #dedede;">                                                                              
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
                        </xsl:if>     
                    </div>                                
                </div>  
            </div>
        </div>
    </xsl:template>
    <xsl:template name="text-window">
        <xsl:param name="hand"/>
        <div class="yes-index {
            if ($hand = '#handwritten') then
            ('handwritten') else if ($hand = '#typed') then
            ('typed') else if ($hand = '#printed') then
            ('printed') else if ($hand = '#stamp') then
            ('text-align:center;font-weight:bold;letter-spacing:.2em;') else ()
            }">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
</xsl:stylesheet>