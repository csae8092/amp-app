<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-facsimile.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
            <p>The template "view-pagination" creates a pagintion based on items position.</p> 
            <p>Bootstrap is required.</p>
        </desc>    
    </doc>
    
    <xsl:template name="view-pagination">
        <xsl:param name="reading-type"></xsl:param>
        <xsl:variable 
            name="vseq" 
            select="//tei:pb"
            as="item()*"/>
        <div class="text-center pagination">
            <ul class="nav nav-tabs">
                <xsl:for-each select="$vseq">
                    <xsl:choose>
                        <xsl:when test="position() = 1">
                            <li class="nav-item">
                                <a
                                    title="{position()}"
                                    class="nav-link active"
                                    data-toggle="tab"
                                    href="#{$reading-type}-paginate-{position()}"
                                    style="border-radius:30px;">
                                    <xsl:value-of select="position()"/> 
                                </a>                                                    
                            </li>
                        </xsl:when>
                        <xsl:when test="position() = [1,2,3,4,5,6,7,8,9]">
                            <li class="nav-item">
                                <a
                                    title="{position()}"
                                    class="nav-link"
                                    data-toggle="tab"
                                    href="#{$reading-type}-paginate-{position()}"
                                    style="border-radius:30px;">
                                    <xsl:value-of select="position()"/> 
                                </a>                                                    
                            </li>
                        </xsl:when>
                        <xsl:when test="position() = 10">
                            <li class="nav-item dropdown">
                                <a
                                    title="more"
                                    href="#"
                                    data-toggle="dropdown"
                                    class="nav-link dropdown-toggle"
                                    style="border-radius:30px;"
                                    >
                                    more <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu" role="menu">
                                    <xsl:for-each select="$vseq">
                                        <xsl:choose>
                                            <xsl:when test="position() > 9">
                                                <li
                                                    class="nav-item dropdown-submenu"
                                                    style="display:inline-block;">
                                                    <a
                                                        title="{position()}"
                                                        href="#{$reading-type}-paginate-{position()}"
                                                        class="nav-link"
                                                        data-toggle="tab"
                                                        style="border-radius:30px;">
                                                        <xsl:value-of select="position()"/>
                                                    </a>
                                                </li>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:for-each>                                                                                                                
                                </ul>                                
                            </li>
                        </xsl:when>
                        <xsl:otherwise>
                            <!--<li class="nav-item" style="display:none;">
                                <a
                                    title="{position()}"
                                    class="nav-link btn btn-round btn-backlink"
                                    data-toggle="tab"
                                    href="#diplomatic-paginate-{position()}"
                                    ><xsl:value-of select="position()"/> 
                                </a>                                                    
                            </li>-->
                        </xsl:otherwise>
                    </xsl:choose>                                                                                                        
                </xsl:for-each>                                                                                                
            </ul>
        </div>
    </xsl:template> 
</xsl:stylesheet>