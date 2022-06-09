<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-facsimile.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
            <p>The template "toc-table" generates a table for table of contents of a collection.</p> 
            <p>Bootstrap is required.</p>
        </desc>    
    </doc>
    
    <xsl:template name="toc-table">
        <xsl:param name="category"></xsl:param>
        <table class="table table-striped display" id="tocTable" style="width:100%">
            <thead>
                <tr>
                    <th scope="col">Title</th>
                    <th scope="col">Date</th>
                    <th scope="col">Latest Revisions Data</th>
                    <th scope="col">Latest Revisions Content</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="collection(concat('../../data/editions/', $category))//tei:TEI">
                    <xsl:sort select="//tei:origDate/@notAfter"/>
                    <xsl:variable name="full_path">
                        <xsl:value-of select="document-uri(/)"/>
                    </xsl:variable>
                    <!--<tr>
                            <td>                                        
                                <a>
                                    <xsl:attribute name="href">                                                
                                        <xsl:value-of select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"/>
                                    </xsl:attribute>
                                    <xsl:value-of select=".//tei:title[@level='a'][1]/text()"/>
                                </a>
                            </td>
                            <td>
                                <xsl:value-of select="data(.//tei:origDate/@when-iso)"/>
                            </td>  
                        </tr>-->
                    <xsl:for-each select=".//tei:revisionDesc/tei:change[position()=last()]/self::tei:change">                                                
                        <tr>
                            <td>
                                <a>
                                    <xsl:attribute name="href">                                                
                                        <xsl:value-of select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="//tei:title[@level='a'][1]/text()"/>
                                </a>
                            </td>
                            <td><xsl:value-of select="data(//tei:origDate/@when-iso)"/></td>
                            <td>
                                <ul>
                                    <li><xsl:value-of select="concat(@when/name(), ': ' ,@when)"/></li>
                                    <li><xsl:value-of select="concat(@who/name(), ': ', @who)"/></li>
                                </ul>                                                                                                                                            
                            </td>
                            <td>
                                <xsl:apply-templates/>                                                                                             
                            </td>  
                        </tr>                                                                                                                                             
                    </xsl:for-each>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>