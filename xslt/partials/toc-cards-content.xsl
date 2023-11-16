<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>

    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget toc-cards-content.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in toc-cards.xsl</p>
            <p>The template "toc-cards-content" creats a card view of items from a collection</p>
            <p>Bootstrap is required.</p>
        </desc>
    </doc>

    <xsl:template name="toc-cards-content">
        <xsl:param name="img"/>
        <xsl:variable name="full_path">
            <xsl:value-of select="document-uri(/)"/>
        </xsl:variable>
        <!--<xsl:variable name="date" select="//tei:correspAction/tei:date/@when-iso"/>-->
        <div class="col-xxl-3 col-xl-3 col-lg-3 col-md-4 col-sm-12 col-xs-12 p-2">
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="concat(replace(tokenize($full_path, '/')[last()], '.xml', '.html?img='), $img)"/>
                </xsl:attribute>
                <div class="card index-card">
                    
                    <div class="card-body" style="border-radius: 0.5rem 0.5rem 0 0; height: 250px; overflow: hidden; background-color: #000; display: flex; align-items: center;">
                        <xsl:variable name="iiif-ext" select="'.jp2/full/,400/0/default.jpg'"/> 
                        <xsl:variable name="iiif-domain" select="'https://iiif.acdh.oeaw.ac.at/iiif/images/amp/'"/>
                        <xsl:choose>
                            <xsl:when test=".//tei:body/tei:div[1]/tei:pb[1]">
                                <xsl:variable name="facs_item" select="tokenize(.//tei:body/tei:div[1]/tei:pb[1]/@facs, '/')[5]"/>
                                <div class="text-center">
                                    <div class="loader-toc"></div>
                                </div>
                                <img onload="hideLoader(this)">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="//tei:title[@level='a']//text()"/>
                                    </xsl:attribute>
                                </img>
                            </xsl:when>
                            <xsl:when test=".//tei:body/tei:div[1]/tei:div[1]/tei:pb[1]">
                                <xsl:variable name="facs_item" select="tokenize(.//tei:body/tei:div[1]/tei:div[1]/tei:pb[1]/@facs, '/')[5]"/>
                                <div class="text-center">
                                    <div class="loader-toc"></div>
                                </div>
                                <img onload="hideLoader(this)">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="//tei:title[@level='a']//text()"/>
                                    </xsl:attribute>
                                </img>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="facs_item" select="tokenize(.//tei:pb[1]/@facs, '/')[5]"/>
                                <div class="text-center">
                                    <div class="loader-toc"></div>
                                </div>
                                <img onload="hideLoader(this)">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="//tei:title[@level='a']//text()"/>
                                    </xsl:attribute>
                                </img>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    
                    <div class="card-header" style="height:150px; display: flex; align-items: center;">                                                      
                        <p class="p-1 m-0">
                            <xsl:value-of select="//tei:title[@level='a']"/>
                        </p>
                    </div>
                    <div class="card-footer" style="width: 100%; height: 100%; display: inline-flex;">
                        <div style="text-align: left; display: inline; width: 10%;">
                            <a target="_blank" href="{//tei:publicationStmt/tei:idno}"><i class="fas fa-link"></i></a>
                        </div>
                        <div style="text-align: center; display: inline;width: 25%;">
                            <small>#<xsl:value-of select="//tei:text/@type"/></small>
                        </div>
                        <div style="text-align: center; display: inline;width: 40%;">
                            <small><xsl:value-of select="//tei:text/@hand"/></small>
                        </div>
                        <div style="text-align: right; display: inline;width: 25%;">
                            <i class="fas fa-camera"></i> - <xsl:value-of select="count(//tei:graphic)"/>
                        </div>
                    </div>
                    <div class="card-footer" style="width: 100%; height: 100%; background-color:rgba(0,0,0,.03); padding: .5em 0;">
                        
                        <xsl:if test="count(.//tei:listPlace[parent::tei:back]/tei:place) > 0">
                            <a href="{replace(tokenize($full_path, '/')[last()], '.xml', '.html')}?plc=on&amp;img={$img}">
                                <div title="mentioned places" class="badge badge-en plcs" style="display:inline;width:50px;">
                                    <span class="number">
                                        <xsl:value-of select="count(.//tei:listPlace[parent::tei:back]/tei:place)"/>
                                    </span>
                                    <span>
                                        <i class="fas fa-map-marked-alt"></i>
                                    </span>
                                </div>
                            </a>
                        </xsl:if>
                        
                        <xsl:if test="count(.//tei:listPerson[parent::tei:back]/tei:person) > 0">
                            <a href="{replace(tokenize($full_path, '/')[last()], '.xml', '.html')}?prs=on&amp;img={$img}">
                                <div title="mentioned persons" class="badge badge-en prsns" style="display:inline;width:50px;">
                                    <span class="number">
                                        <xsl:value-of select="count(.//tei:listPerson[parent::tei:back]/tei:person)"/>
                                    </span>
                                    <span><i class="fas fa-user"></i></span>
                                </div>
                            </a>
                        </xsl:if>
                        
                        <xsl:if test="count(.//tei:listOrg[parent::tei:back]/tei:org) > 0">
                            <a href="{replace(tokenize($full_path, '/')[last()], '.xml', '.html')}?org=on&amp;img={$img}">
                                <div title="mentioned organisations" class="badge badge-en orgs" style="display:inline;width:50px;">
                                    <span class="number">
                                        <xsl:value-of select="count(.//tei:listOrg[parent::tei:back]/tei:org)"/>
                                    </span>
                                    <span><i class="fas fa-building"></i></span>
                                </div>
                            </a>
                        </xsl:if>
                        
                        <xsl:if test="count(.//tei:listBibl[parent::tei:back]/tei:bibl) > 0">
                            <a href="{replace(tokenize($full_path, '/')[last()], '.xml', '.html')}?wrk=on&amp;img={$img}">
                                <div title="mentioned works" class="badge badge-en wrks" style="display:inline;width:50px;">
                                    <span class="number">
                                        <xsl:value-of select="count(.//tei:listBibl[parent::tei:back]/tei:bibl)"/>
                                    </span>
                                    <span><i class="fas fa-book"></i></span>
                                </div>
                            </a>
                        </xsl:if>
                        
                        <xsl:if test="count(.//tei:listEvent[parent::tei:back]/tei:event) > 0">
                            <a href="{replace(tokenize($full_path, '/')[last()], '.xml', '.html')}?eve=on&amp;img={$img}">
                                <div title="mentioned events" class="badge badge-en eves" style="display:inline;width:50px;">
                                    <span class="number">
                                        <xsl:value-of select="count(.//tei:listEvent[parent::tei:back]/tei:event)"/>
                                    </span>
                                    <span><i class="fas fa-calendar-alt"></i></span>
                                </div>
                            </a>
                        </xsl:if>
                    </div>
                </div>
            </a>
        </div>
    </xsl:template>
</xsl:stylesheet>