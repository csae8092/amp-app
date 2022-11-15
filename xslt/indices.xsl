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
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
                <!-- ############### leaflet stylesheets ############### -->
                <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
                    integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
                    crossorigin=""/>
                <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.css"/>
                <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.Default.css"/>
                <!-- ############### leaflet script ################ -->
                <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
                    integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
                    crossorigin=""></script>
                <script src="https://unpkg.com/leaflet.markercluster@1.4.1/dist/leaflet.markercluster.js"></script>
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
                        
                        <xsl:if test="contains($doc_title, 'Places')">
                            <div id="tableReload-wrapper">
                                <svg id="tableReload" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
                                    <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
                                </svg>
                            </div>
                            <div id="leaflet-map-one"></div>
                        </xsl:if>
                        
                        <xsl:apply-templates select="//tei:body"/>

                    </div><!-- .container-fluid -->
                    <xsl:call-template name="html_footer"/>
                </div><!-- .site -->
                <script src="js/leaflet.js"></script>
                <script type="text/javascript">
                    $(document).ready(function () {
                        createDataTable('listperson');
                    });
                    $(document).ready(function () {
                        leafletDatatable('listplace');
                    });
                </script>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:listPerson">
        <div>
            <table class="table index-table" id="listperson">
                 <thead>
                     <tr>
                         <th>
                             Name
                         </th>
                         <th>
                             GND
                         </th>
                         <th>
                             Read more
                         </th>
                     </tr>
                 </thead>
                 <tbody>
                     <xsl:for-each select="./tei:person">
                        <tr>
                            <td>
                                <xsl:if test="./tei:persName/tei:surname">
                                    <xsl:value-of select="./tei:persName/tei:surname"/>
                                </xsl:if>
                                <xsl:text> </xsl:text>
                                <xsl:if test="./tei:persName/tei:forename">
                                    <xsl:value-of select="./tei:persName/tei:forename"/>
                                </xsl:if>
                            </td>
                            <td>
                                <a href="{./tei:idno[@type='GND']}" target="_blank">
                                    <xsl:value-of select="./tei:idno[@type='GND']"/>
                                </a>
                            </td>
                            <td>
                                <a href="{concat(@xml:id, '.html')}">
                                    Detail Page
                                </a>
                            </td>
                        </tr>
                     </xsl:for-each>
                 </tbody>
             </table>
        </div>
    </xsl:template>
    <xsl:template match="tei:listPlace">
        <div>
            <table class="table index-table" id="listplace">
                <thead>
                    <tr>
                        <th>
                            Name
                        </th>
                        <th>
                            Geonames ID
                        </th>
                        <th>
                            Coordinates
                        </th>
                        <th>
                            Read more
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="./tei:place">
                        <xsl:variable name="coords" select="tokenize(./tei:location/tei:geo, ', ')"/>
                        <tr>
                            <td>
                                <xsl:value-of select="./tei:placeName"/>
                            </td>
                            <td>
                                <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                    <xsl:value-of select="./tei:idno[@type='GEONAMES']"/>
                                </a>
                            </td>
                            <xsl:choose>
                                <xsl:when test="./tei:location/tei:geo and ./tei:location/tei:geo != 'None, None'">
                                    <td class="map-coordinates" lat="{$coords[1]}" long="{$coords[2]}" subtitle="{./tei:placeName}">
                                        <xsl:value-of select="./tei:location/tei:geo"/>
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td></td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <td>
                                <a href="{concat(@xml:id, '.html')}">
                                    Detail Page
                                </a>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
