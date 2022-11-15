<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="no" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/html_title_navigation.xsl"/>

    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@type='main'][1]/text()"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="contains($doc_title, 'Persons')">
                <xsl:for-each select="//tei:person">
                    <xsl:variable name="doc_url" select="concat(@xml:id, '.html')"/>
                    <xsl:result-document href="{$doc_url}">
                        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
                        <html>
                            <head>
                                <xsl:call-template name="html_head">
                                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                                </xsl:call-template>                
                                <meta name="docTitle" class="staticSearch_docTitle">
                                    <xsl:attribute name="content">
                                        <xsl:value-of select="$doc_title"/>
                                    </xsl:attribute>
                                </meta>
                            </head>
                            <body class="page">
                                <div class="hfeed site" id="page">
                                    <xsl:call-template name="nav_bar"/>
                                    
                                    <div class="container-fluid">  
                                            
                                        <table class="table entity-table">
                                            <tbody>
                                                <tr>
                                                    <th>
                                                        Surname
                                                    </th>
                                                    <td>
                                                        <xsl:value-of select="./tei:persName/tei:surname"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Forename
                                                    </th>
                                                    <td>
                                                        <xsl:value-of select="./tei:persName/tei:forename"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Birth
                                                    </th>
                                                    <td>
                                                        <xsl:value-of select="./tei:birth/tei:date/@when-iso"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Death
                                                    </th>
                                                    <td>
                                                        <xsl:value-of select="./tei:death/tei:date/@when-iso"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        GND
                                                    </th>
                                                    <td>
                                                        <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                            <xsl:value-of select="./tei:idno[@type='GND']"/>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Wikidata
                                                    </th>
                                                    <td>
                                                        <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                            <xsl:value-of select="./tei:idno[@type='WIKIDATA']"/>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Literature
                                                    </th>
                                                    <td>
                                                        <ul>
                                                            <xsl:for-each select="./tei:listBibl/tei:bibl">
                                                                <li>
                                                                    <a href="{concat('lit_work_id_', @n, '.html')}">
                                                                        <xsl:value-of select="."/>
                                                                    </a>
                                                                </li>
                                                            </xsl:for-each>
                                                        </ul>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Erwähnt in
                                                    </th>
                                                    <td>
                                                        <ul>
                                                            <xsl:for-each select="./tei:listEvent/tei:event">
                                                                <li>
                                                                    <a href="{replace(replace(./tei:linkGrp/tei:link/@target, 'https://auden-musulin-papers.github.io', 'https://amp.acdh.oeaw.ac.at'), '.xml', '.html')}">
                                                                        <xsl:value-of select="./tei:p/tei:title"/>
                                                                    </a>
                                                                </li>
                                                            </xsl:for-each>
                                                        </ul>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                           
                                    </div><!-- .container-fluid -->
                                    <xsl:call-template name="html_footer"/>
                                </div><!-- .site -->
                            </body>
                        </html>
                    </xsl:result-document>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="contains($doc_title, 'Places')">
                <xsl:for-each select="//tei:place">
                    <xsl:variable name="doc_url" select="concat(@xml:id, '.html')"/>
                    <xsl:result-document href="{$doc_url}">
                        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
                        <html>
                            <head>
                                <xsl:call-template name="html_head">
                                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                                </xsl:call-template>                
                                <meta name="docTitle" class="staticSearch_docTitle">
                                    <xsl:attribute name="content">
                                        <xsl:value-of select="$doc_title"/>
                                    </xsl:attribute>
                                </meta>
                            </head>
                            <body class="page">
                                <div class="hfeed site" id="page">
                                    <xsl:call-template name="nav_bar"/>
                                    
                                    <div class="container-fluid">  
                                        
                                        
                                        <table class="table entity-table">
                                            <tbody>
                                                <tr>
                                                    <th>
                                                        Placename
                                                    </th>
                                                    <td>
                                                        <xsl:value-of select="./tei:placeName"/>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <th>
                                                        Country
                                                    </th>
                                                    <td>
                                                        <xsl:value-of select="./tei:country"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Geonames ID
                                                    </th>
                                                    <td>
                                                        <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                                            <xsl:value-of select="./tei:idno[@type='GEONAMES']"/>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Wikidata ID
                                                    </th>
                                                    <td>
                                                        <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                            <xsl:value-of select="./tei:idno[@type='WIKIDATA']"/>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        GND ID
                                                    </th>
                                                    <td>
                                                        <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                            <xsl:value-of select="./tei:idno[@type='GND']"/>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Latitude
                                                    </th>
                                                    <td>
                                                        <xsl:value-of select="tokenize(./tei:location/tei:geo, ', ')[1]"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Longitude
                                                    </th>
                                                    <td>
                                                        <xsl:value-of select="tokenize(./tei:location/tei:geo, ', ')[2]"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Erwähnt in
                                                    </th>
                                                    <td>
                                                        <ul>
                                                            <xsl:for-each select="./tei:listEvent/tei:event">
                                                                <li>
                                                                    <a href="{replace(./tei:linkGrp/tei:link/@target, 'https://auden-musulin-papers.github.io/amp-app', 'https://amp.acdh.oeaw.ac.at')}">
                                                                        <xsl:value-of select="./tei:p/tei:title"/>
                                                                    </a>
                                                                </li>
                                                            </xsl:for-each>
                                                        </ul>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        
                                    </div><!-- .container-fluid -->
                                    <xsl:call-template name="html_footer"/>
                                </div><!-- .site -->
                            </body>
                        </html>
                    </xsl:result-document>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>
