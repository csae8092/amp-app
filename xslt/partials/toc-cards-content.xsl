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
                        <xsl:choose>
                            <xsl:when test=".//tei:body/tei:div[1]/tei:pb[1]">
                                <xsl:variable name="facs_item" select="tokenize(.//tei:body/tei:div[1]/tei:pb[1]/@facs, '/')[5]"/>
                                <xsl:call-template name="cover">
                                    <xsl:with-param name="facs_item" select="$facs_item"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test=".//tei:body/tei:div[1]/tei:div[1]/tei:pb[1]">
                                <xsl:variable name="facs_item" select="tokenize(.//tei:body/tei:div[1]/tei:div[1]/tei:pb[1]/@facs, '/')[5]"/>
                                <xsl:call-template name="cover">
                                    <xsl:with-param name="facs_item" select="$facs_item"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="facs_item" select="tokenize(.//tei:pb[1]/@facs, '/')[5]"/>
                                <xsl:call-template name="cover">
                                    <xsl:with-param name="facs_item" select="$facs_item"/>
                                </xsl:call-template>
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
                        <xsl:for-each select="//tei:back/*">
                            <xsl:call-template name="entity-count">
                                <xsl:with-param name="i-class">
                                    <xsl:choose>
                                        <xsl:when test="name(.) = 'listPlace'">
                                            <xsl:text>fa-map-marked-alt</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listPerson'">
                                            <xsl:text>fa-user</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listOrg'">
                                            <xsl:text>fa-building</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listBibl'">
                                            <xsl:text>fa-book</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listEvent'">
                                            <xsl:text>fa-calendar-alt</xsl:text>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:with-param>
                                <xsl:with-param name="count">
                                    <xsl:value-of select="count(./*)"/>
                                </xsl:with-param>
                                <xsl:with-param name="full_path">
                                    <xsl:value-of select="$full_path"/>
                                </xsl:with-param>
                                <xsl:with-param name="urlparam">
                                    <xsl:choose>
                                        <xsl:when test="name(.) = 'listPlace'">
                                            <xsl:text>plc</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listPerson'">
                                            <xsl:text>prs</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listOrg'">
                                            <xsl:text>org</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listBibl'">
                                            <xsl:text>wrk</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listEvent'">
                                            <xsl:text>eve</xsl:text>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:with-param>
                                <xsl:with-param name="img">
                                    <xsl:value-of select="$img"/>
                                </xsl:with-param>
                                <xsl:with-param name="title">
                                    <xsl:choose>
                                        <xsl:when test="name(.) = 'listPlace'">
                                            <xsl:text>places</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listPerson'">
                                            <xsl:text>persons</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listOrg'">
                                            <xsl:text>organisations</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listBibl'">
                                            <xsl:text>literary works</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listEvent'">
                                            <xsl:text>events</xsl:text>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:with-param>
                                <xsl:with-param name="class">
                                    <xsl:choose>
                                        <xsl:when test="name(.) = 'listPlace'">
                                            <xsl:text>plcs</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listPerson'">
                                            <xsl:text>prsns</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listOrg'">
                                            <xsl:text>orges</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listBibl'">
                                            <xsl:text>wrks</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="name(.) = 'listEvent'">
                                            <xsl:text>eves</xsl:text>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </div>
                </div>
            </a>
        </div>
    </xsl:template>
    <xsl:template name="cover">
        <xsl:param name="facs_item"/>
        <xsl:variable name="iiif-ext" select="'.jp2/full/,400/0/default.jpg'"/> 
        <xsl:variable name="iiif-domain" select="'https://iiif.acdh.oeaw.ac.at/iiif/images/amp/'"/>
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
    </xsl:template>
    <xsl:template name="entity-count">
        <xsl:param name="count"/>
        <xsl:param name="title"></xsl:param>
        <xsl:param name="i-class"/>
        <xsl:param name="class"/>
        <xsl:param name="full_path"/>
        <xsl:param name="urlparam"/>
        <xsl:param name="img"/>
        <xsl:if test="$count > 0">
            <a href="{replace(tokenize($full_path, '/')[last()], '.xml', '.html')}?{$urlparam}=on&amp;img={$img}">
                <div title="mentioned {$title}" class="badge badge-en {$class}" style="display:inline;width:50px;">
                    <span class="number">
                        <xsl:value-of select="$count"/>
                    </span>
                    <span><i class="fas {$i-class}"></i></span>
                </div>
            </a>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>