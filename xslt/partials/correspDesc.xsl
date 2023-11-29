<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl tei xs"
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
            <div class="col-md-6" style="text-align:left;">
                <xsl:if test="string-length($prev) != 0 or string-length($next) != 0">
                    <table>
                        <tr>
                            <th>Correspondence between: </th>
                            <td>
                                <ul>
                                    <xsl:for-each select=".//tei:correspContext/tei:ref[@type='belongsToCorrespondence']">
                                        <li><xsl:value-of select="./text()"/></li>
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
                    </table>
                </xsl:if>
            </div>
        </div><!-- .row -->    
    </xsl:template>
</xsl:stylesheet>