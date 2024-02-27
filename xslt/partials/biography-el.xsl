<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="#all" version="2.0">
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-facsimile.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
            <p>The template "bio-el" adds a card for biography timeline.</p> 
            <p>Bootstrap is required.</p>
        </desc>    
    </doc>
    
    <xsl:template name="bio-el">
        <xsl:param name="img"/>
        <xsl:param name="location"/>          
        <xsl:choose>
            <xsl:when test="$location = 'false'">
                <div class="row">
                    <div class="col-md-5">
                        <img title="{if (./tei:label) then(./tei:label) else (./tei:desc/tei:title)}"
                             alt="{if (./tei:label) then(./tei:label) else (./tei:desc/tei:title)}"
                             src="{$img}"/>
                        <xsl:if test="./tei:desc/tei:location/tei:geo/text()">
                            <xsl:variable name="lat" select="tokenize(./tei:desc/tei:location/tei:geo, ' ')[1]"/>
                            <xsl:variable name="long" select="tokenize(./tei:desc/tei:location/tei:geo, ' ')[2]"/>
                            <div class="leaflet-maps-modal" lat="{$lat}" long="{$long}"></div>
                        </xsl:if>
                    </div>
                    <div class="col-md-7">
                        <xsl:choose>
                            <xsl:when test="./tei:label">
                                <a title="open document" href="{replace(@xml:id, '.xml', '.html')}">
                                    <span><xsl:value-of select="substring-before(translate(translate(./tei:label, '[', ''), ']', ''), ' 19')"/></span>
                                </a>
                            </xsl:when>
                            <xsl:when test="./tei:desc">
                                <h6><xsl:value-of select="./tei:desc/tei:title"/></h6>
                                <span><xsl:value-of select="./tei:desc/text()"/></span>    
                                <ul>
                                    <xsl:for-each select="./tei:desc/tei:location/tei:address/tei:placeName/*">
                                        <li><xsl:apply-templates/></li>
                                    </xsl:for-each>
                                </ul>
                            </xsl:when>
                        </xsl:choose>
                    </div>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="card timeline-panel-{$location}">   
                    <div class="card-body">
                        <xsl:choose>
                            <xsl:when test="./tei:label">
                                <a title="open document" href="{replace(@xml:id, '.xml', '.html')}">
                                    <span><xsl:value-of select="substring-before(translate(translate(./tei:label, '[', ''), ']', ''), ' 19')"/></span>
                                </a>
                            </xsl:when>
                            <xsl:when test="./tei:desc">
                                <h6><xsl:value-of select="./tei:desc/tei:title"/></h6>
                                <span><xsl:value-of select="./tei:desc/text()"/></span>
                                <!--<table class="table">
                                    <tbody>
                                        <xsl:for-each select="./tei:desc/tei:location/tei:address/tei:placeName/*">
                                            <tr>
                                                <th class="capitalize"
                                                    style="border:none;border-right: 1px solid #f1f1f1;width:25%;padding:.2em;">
                                                    <xsl:value-of select="name()"/>
                                                </th>
                                                <td style="border:none;padding:.2em;.5em;">
                                                    <xsl:apply-templates/>
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                    
                                </table>-->
                                
                                <xsl:if test="./tei:desc/tei:idno[@type='geonames']">
                                    <br/>
                                    <br/>
                                    <span style="font-weight: bold;">Geonames ID: </span>
                                    <a target="_blank" href="{./tei:desc/tei:idno[@type='geonames']}">
                                        <xsl:value-of select="tokenize(./tei:desc/tei:idno[@type='geonames'], '/')[last()]"/>
                                    </a>
                                </xsl:if>
                                
                                <xsl:if test="./tei:desc/tei:location/tei:geo/text()">
                                    <xsl:variable name="lat" select="tokenize(./tei:desc/tei:location/tei:geo, ' ')[1]"/>
                                    <xsl:variable name="long" select="tokenize(./tei:desc/tei:location/tei:geo, ' ')[2]"/>
                                    <div class="leaflet-maps" lat="{$lat}" long="{$long}"></div>
                                </xsl:if>
                            </xsl:when>                            
                        </xsl:choose>                        
                    </div>
                </div>
            </xsl:otherwise>
        </xsl:choose>                                                                             
                                    
    </xsl:template>
</xsl:stylesheet>