<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget correspDesc.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied in html:body.</p>
            <p>The template creates metadata information taken from correspDesc TEI node.</p> 
        </desc>    
    </doc>
    
    <xsl:template name="correspDesc">
        <xsl:variable name="prev">
            <xsl:value-of select="substring-after(replace(.//tei:correspContext/tei:ref[@subtype='previous_letter']/@target, '.xml', '.html'), '#')"/>
        </xsl:variable>
        <xsl:variable name="next">
            <xsl:value-of select="substring-after(replace(.//tei:correspContext/tei:ref[@subtype='next_letter']/@target, '.xml', '.html'), '#')"/>
        </xsl:variable>        
        <div class="row">                                    
            <div class="col-md-12" style="text-align:left;">
                <div class="row">
                    <div class="col-md-6">
                        <table class="table corresp-desc">
                            <tr>
                                <th>Correspondence between: </th>
                                <td>
                                    <ul>
                                        <xsl:for-each select=".//tei:correspContext/tei:ref[@type='belongsToCorrespondence']">
                                            <li><a href="{concat(substring-after(@target, '#'), '.html')}"
                                                    alt="{./text()}">
                                                <xsl:value-of select="./text()"/>
                                            </a></li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                            <xsl:if test="string-length($prev) != 0">
                                <tr>
                                    <th>Previous document:</th>
                                    <td>
                                        
                                        <a id="prev-doc">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="concat($prev, '?img=off')"/>
                                            </xsl:attribute>
                                            <xsl:value-of select=".//tei:correspContext/tei:ref[@subtype='previous_letter']/text()"/>
                                        </a>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="string-length($next) != 0">
                                <tr>
                                    <th>Next document:</th>
                                    <td>
                                        <a id="next-doc">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="concat($next, '?img=off')"/>
                                            </xsl:attribute>
                                            <xsl:value-of select=".//tei:correspContext/tei:ref[@subtype='next_letter']/text()"/>
                                        </a>
                                    </td>
                                </tr>
                            </xsl:if>
                            <tr>
                                <th>Language(s):</th>
                                <td>
                                    <ul>
                                        <xsl:for-each select=".//tei:langUsage/tei:language">
                                            <li>
                                                <xsl:value-of select="./text()"/>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <table class="table corresp-desc">
                            <xsl:if test=".//tei:correspAction[@type='sent']/tei:orgName or .//tei:correspAction[@type='sent']/tei:persName">
                                <tr>
                                    <th>Sent by: </th>
                                    <td>
                                        <a href="{concat(substring-after(.//tei:correspAction[@type='sent']/tei:orgName/@ref, '#'), '.html')}"
                                            alt="{./text()}">
                                            <xsl:choose>
                                                <xsl:when test=".//tei:correspAction[@type='sent']/tei:orgName/text()">
                                                    <xsl:value-of select=".//tei:correspAction[@type='sent']/tei:orgName/text()"/>
                                                </xsl:when>
                                                <xsl:when test=".//tei:correspAction[@type='sent']/tei:persName/text()">
                                                    <xsl:value-of select=".//tei:correspAction[@type='sent']/tei:persName/text()"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </a>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test=".//tei:correspAction[@type='sent']/tei:placeName">
                            <tr>
                                <th>Sent from (Place): </th>
                                <td>
                                    <a href="{concat(substring-after(.//tei:correspAction[@type='sent']/tei:placeName/@ref, '#'), '.html')}"
                                        alt="{./text()}">
                                    <xsl:value-of select=".//tei:correspAction[@type='sent']/tei:placeName/text()"/>
                                    </a>
                                </td>
                            </tr>
                            </xsl:if>
                            <xsl:if test=".//tei:correspAction[@type='sent']/tei:date">
                            <tr>
                                <th>Sent Date: </th>
                                <td>
                                    <xsl:value-of select="substring-before(.//tei:correspAction[@type='sent']/tei:date/@notBefore-iso, 'T')"/>
                                </td>
                            </tr>
                            </xsl:if>
                            <xsl:if test=".//tei:correspAction[@type='received']/tei:persName">
                            <tr>
                                <th>Received by: </th>
                                <td>
                                    <a href="{concat(substring-after(.//tei:correspAction[@type='received']/tei:persName/@ref, '#'), '.html')}"
                                        alt="{./text()}">
                                    <xsl:value-of select=".//tei:correspAction[@type='received']/tei:persName/text()"/>
                                    </a>
                                </td>
                            </tr>
                            </xsl:if>
                            <xsl:if test=".//tei:correspAction[@type='received']/tei:placeName">
                            <tr>
                                <th>Received in (Place): </th>
                                <td>
                                    <a href="{concat(substring-after(.//tei:correspAction[@type='received']/tei:placeName/@ref, '#'), '.html')}"
                                        alt="{./text()}">
                                    <xsl:value-of select=".//tei:correspAction[@type='received']/tei:placeName/text()"/>
                                    </a>
                                </td>
                            </tr>
                            </xsl:if>
                        </table>
                    </div>
                </div>
                
            </div>
        </div><!-- .row -->    
    </xsl:template>
</xsl:stylesheet>