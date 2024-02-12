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
                 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
                    integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI="
                    crossorigin=""/>
                <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.css"/>
                <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.Default.css"/>
                <link href='https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/leaflet.fullscreen.css' rel='stylesheet'/>
                
                <!-- ############### datatable ############### -->
                <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/jszip-2.5.0/dt-1.13.1/b-2.3.3/b-colvis-2.3.3/b-html5-2.3.3/fc-4.2.1/fh-3.3.1/r-2.4.0/sp-2.1.0/sl-1.5.0/datatables.min.css"/>
                
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
                <script type="text/javascript" src="https://cdn.datatables.net/v/bs5/jszip-2.5.0/dt-1.13.1/b-2.3.3/b-colvis-2.3.3/b-html5-2.3.3/fc-4.2.1/fh-3.3.1/r-2.4.0/sp-2.1.0/sl-1.5.0/datatables.min.js"></script>
                <!-- ############### leaflet script ################ -->
                <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
                    integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM="
                    crossorigin=""></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet-ajax/2.1.0/leaflet.ajax.min.js"></script>
                <script src="https://unpkg.com/leaflet.markercluster@1.4.1/dist/leaflet.markercluster.js"></script>
                <script src='https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/Leaflet.fullscreen.min.js'></script>
                <script src="https://unpkg.com/heatmap.js@2.0.5/build/heatmap.min.js"></script>
                <script src="https://unpkg.com/heatmap.js@2.0.5/plugins/leaflet-heatmap/leaflet-heatmap.js"></script>
                <!--<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.11.0/b-2.0.0/b-html5-2.0.0/cr-1.5.4/r-2.2.9/sp-1.4.0/datatables.min.js"></script>-->
                
                <meta name="docTitle" class="staticSearch_docTitle">
                    <xsl:attribute name="content">
                        <xsl:value-of select="$doc_title"/>
                    </xsl:attribute>
                </meta>
                <style>
                    .container-fluid {
                        max-width: 100%;
                    }
                </style>
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">
                        
                        <xsl:if test="contains($doc_title, 'Places') or 
                            contains($doc_title, 'Institut') or 
                            contains($doc_title, 'Events')">
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
                
                <xsl:choose>
                    <xsl:when test="contains($doc_title, 'Persons')">
                        <script type="text/javascript" src="js/dt-panes.js"></script>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                createDataTable('listperson', 'Search:', [5, 6, 7, 8, 9, 10], [0, 1, 2, 3, 4], [9, 10]);
                            });
                        </script>
                    </xsl:when>
                    <xsl:when test="contains($doc_title, 'Places')">
                        
                        <script src="js/leaflet.js"></script>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                leafletDatatable('listplace', [5, 6, 7, 8], [0, 1, 2, 3, 4]);
                            });
                        </script>
                    </xsl:when>
                    <xsl:when test="contains($doc_title, 'Literature')">
                        <script type="text/javascript" src="js/dt-panes.js"></script>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                createDataTable('listbibl', 'Search:', [1, 2, 5], [0, 3, 4], false);
                            });
                        </script>
                    </xsl:when>
                    <xsl:when test="contains($doc_title, 'Institut')">
                        <script src="js/leaflet.js"></script>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                leafletDatatable('listorg', [2, 3, 5], [0, 1, 4]);
                            });
                        </script>
                    </xsl:when>
                    <xsl:when test="contains($doc_title, 'Events')">
                        <script src="js/leaflet.js"></script>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                leafletDatatable('listevent', [2, 3, 5, 6, 7], [0, 1, 4]);
                            });
                        </script>
                    </xsl:when>
                </xsl:choose>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:listPerson">
        <div class="index-table">
            <table class="table" id="listperson">
                 <thead>
                     <tr>
                         <th>Name</th>
                         <th>GND</th>
                         <th>Wikidata</th>
                         <th>Birth</th>
                         <th>Death</th>
                         <th>Place of birth</th>
                         <th>Place of death</th>
                         <th>Works related #</th>
                         <th>Mentioned in papers #</th>
                         <th>Birth year</th>
                         <th>Death year</th>
                     </tr>
                 </thead>
                 <tbody>
                     <xsl:for-each select="./tei:person">
                        <tr>
                            <td>
                                <xsl:if test="./tei:persName/tei:surname/text() or ./tei:persName/tei:forename/text()">
                                 <a href="{concat(@xml:id, '.html')}">
                                     <xsl:if test="./tei:persName/tei:surname/text()">
                                         <xsl:value-of select="./tei:persName/tei:surname/text()"/>
                                     </xsl:if>
                                     <xsl:if test="./tei:persName/tei:surname/text() and ./tei:persName/tei:forename/text()">
                                     <xsl:text>, </xsl:text>
                                     </xsl:if>
                                     <xsl:if test="./tei:persName/tei:forename/text()">
                                         <xsl:value-of select="./tei:persName/tei:forename/text()"/>
                                     </xsl:if>
                                 </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:if test="./tei:idno[@subtype='GND']">
                                <a href="{./tei:idno[@subtype='GND']}" target="_blank">
                                    <xsl:value-of select="tokenize(./tei:idno[@subtype='GND'], '/')[last()]"/>
                                </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:if test="./tei:idno[@subtype='WIKIDATA']">
                                <a href="{./tei:idno[@subtype='WIKIDATA']}" target="_blank">
                                    <xsl:value-of select="tokenize(./tei:idno[@subtype='WIKIDATA'], '/')[last()]"/>
                                </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:value-of select="./tei:birth/tei:date/@when-iso"/>
                            </td>
                            <td>
                                <xsl:value-of select="./tei:death/tei:date/@when-iso"/>
                            </td>
                            <td>
                                <xsl:if test="./tei:birth/tei:settlement/tei:placeName">
                                    <a href="{./tei:birth/tei:settlement/@key}.html" target="_blank">
                                        <xsl:value-of select="./tei:birth/tei:settlement/tei:placeName"/>
                                    </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:if test="./tei:death/tei:settlement/tei:placeName">
                                    <a href="{./tei:death/tei:settlement/@key}.html" target="_blank">
                                        <xsl:value-of select="./tei:death/tei:settlement/tei:placeName"/>
                                    </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:value-of select="count(./tei:listBibl/tei:bibl)"/>
                            </td>
                            <td>
                                <xsl:value-of select="count(./tei:noteGrp/tei:note)"/>
                            </td>
                            <td>
                                <xsl:value-of select="tokenize(./tei:birth/tei:date/@when-iso, '-')[1]"/>
                            </td>
                            <td>
                                <xsl:value-of select="tokenize(./tei:death/tei:date/@when-iso, '-')[1]"/>
                            </td>
                        </tr>
                     </xsl:for-each>
                 </tbody>
             </table>
        </div>
    </xsl:template>
    <xsl:template match="tei:listPlace">
        <div class="index-table">
            <table class="table" id="listplace">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Geonames ID</th>
                        <th>Wikidata ID</th>
                        <th>GND ID</th>
                        <th>Coordinates</th>
                        <th>Type of place</th>
                        <th>Country</th>
                        <th>Located in</th>
                        <th>Mentioned in papers #</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="./tei:place">
                        <xsl:variable name="count" select="count(./tei:noteGrp/tei:note)"/>
                        <xsl:variable name="coords" select="tokenize(./tei:location[@type='coords']/tei:geo, ', ')"/>
                        <tr>
                            <td>
                                <xsl:if test="./tei:settlement/tei:placeName or ./tei:placeName">
                                <a href="{concat(@xml:id, '.html')}">
                                    <xsl:choose>
                                        <xsl:when test="./tei:settlement/tei:placeName">
                                            <xsl:value-of select="./tei:settlement/tei:placeName"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="./tei:placeName"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:if test="./tei:idno[@subtype='GEONAMES']">
                                <a href="{./tei:idno[@subtype='GEONAMES']}" target="_blank">
                                    <xsl:value-of select="tokenize(./tei:idno[@subtype='GEONAMES'], '/')[4]"/>
                                </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:if test="./tei:idno[@subtype='WIKIDATA']">
                                <a href="{./tei:idno[@subtype='WIKIDATA']}" target="_blank">
                                    <xsl:value-of select="tokenize(./tei:idno[@subtype='WIKIDATA'], '/')[last()]"/>
                                </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:if test="./tei:idno[@subtype='GND']">
                                <a href="{./tei:idno[@subtype='GND']}" target="_blank">
                                    <xsl:value-of select="tokenize(./tei:idno[@subtype='GND'], '/')[last()]"/>
                                </a>
                                </xsl:if>
                            </td>
                            <xsl:choose>
                                <xsl:when test="./tei:location/tei:geo">
                                    <td class="map-coordinates" 
                                        data-id="{@xml:id}"
                                        data-count="{$count}" 
                                        data-country="{substring-before(./tei:country, ', ')}" 
                                        lat="{$coords[1]}" 
                                        long="{$coords[2]}"
                                        subtitle="N/A"
                                        title="{if (./tei:settlement) then (./tei:settlement/tei:placeName) else (./tei:placeName)}">
                                        <xsl:value-of select="./tei:location/tei:geo"/>
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td></td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <td>
                                <xsl:if test="./tei:settlement/@type">
                                    <xsl:value-of select="concat(./tei:settlement/@type, ', ', ./tei:desc[@type='entity_type'])"/>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:value-of select="./tei:country"/>
                            </td>
                            <td>
                                <xsl:if test="./tei:location[@type='located_in_place']">
                                <a href="{./tei:location[@type='located_in_place']/tei:placeName/@key}.html">
                                    <xsl:value-of select="./tei:location[@type='located_in_place']/tei:placeName"/>
                                </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:value-of select="count(./tei:noteGrp/tei:note)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>
    <xsl:template match="tei:listOrg">
        <div class="index-table">
            <table class="table" id="listorg">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Wikidata ID</th>
                        <th>Located in</th>
                        <th>Description</th>
                        <th>Comment</th>
                        <th>Mentioned in papers #</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="./tei:org">
                        <xsl:variable name="places" select="document('../data/indices/listplace.xml')//tei:TEI//tei:place"/>
                        <xsl:variable name="count" select="count(./tei:listEvent/tei:event)"/>
                        <tr>
                            <td>
                                <xsl:if test="./tei:orgName">
                                    <a href="{concat(@xml:id, '.html')}">
                                        <xsl:value-of select="./tei:orgName"/>
                                    </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:if test="./tei:idno[@subtype='WIKIDATA']">
                                    <a href="{./tei:idno[@subtype='WIKIDATA']}" target="_blank">
                                        <xsl:value-of select="tokenize(./tei:idno[@subtype='WIKIDATA'], '/')[last()]"/>
                                    </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:if test="./tei:location[@type='located_in_place']">
                                    <ul>
                                        <xsl:for-each select="./tei:location[@type='located_in_place']">
                                            <xsl:variable name="key" select="./tei:placeName/@key"/>
                                            <xsl:variable name="corr_place" select="$places//id($key)"/>
                                            <xsl:variable name="coords" select="tokenize($corr_place/tei:location[@type='coords']/tei:geo/text(), ', ')"/>
                                            <li class="map-coordinates"
                                                lat="{$coords[1]}" 
                                                long="{$coords[2]}"
                                                data-count="{$count}"
                                                data-id="{$key}"
                                                title="{./tei:placeName}"
                                                subtitle="{parent::tei:org/tei:orgName}">
                                                <a href="{$key}.html">
                                                    <xsl:value-of select="./tei:placeName"/>
                                                </a>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:value-of select="./tei:desc"/>
                            </td>
                            <td>
                                <xsl:value-of select="./tei:note"/>
                            </td>
                            <td>
                                <xsl:value-of select="count(./tei:noteGrp/tei:note)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>
    <xsl:template match="tei:listBibl">
        <div class="index-table">
            <table class="table" id="listbibl">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Date</th>
                        <th>Wikidata ID</th>
                        <th>Language</th>
                        <th>Mentioned in papers #</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="./tei:bibl">
                        <tr>
                            <td>
                                <xsl:if test="./tei:title">
                                    <a href="{concat(@xml:id, '.html')}">
                                        <xsl:value-of select="./tei:title"/>
                                    </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:if test="./tei:author">
                                    <ul>
                                        <xsl:for-each select="./tei:author">
                                            <li>
                                                <a href="{substring-after(@ref, '#')}.html">
                                                    <xsl:value-of select="./tei:persName"/>
                                                </a>
                                            </li>
                                        </xsl:for-each>    
                                    </ul>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:value-of select="./tei:date/@when"/>
                            </td>
                            <td>
                                <xsl:value-of select="tokenize(./tei:idno[@subtype='WIKIDATA'], '/')[last()]"/>
                            </td>
                            <td>
                                <xsl:value-of select="./tei:lang"/>
                            </td>
                            <td>
                                <xsl:value-of select="count(./tei:noteGrp/tei:note)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>
    <xsl:template match="tei:listEvent">
        <xsl:variable name="count" select="count(./tei:listEvent/tei:event)"/>
        <div class="index-table">
            <table class="table" id="listevent">
                <thead>
                    <tr>
                        <th>Label</th>
                        <th>Participants</th>
                        <th>Located in</th>
                        <th>Date</th>
                        <th>Wikidata ID</th>
                        <th>Type</th>
                        <th>Subtype</th>
                        <th>Mentioned in papers #</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="./tei:event">
                        <tr>
                            <td>
                                <xsl:if test="./tei:label">
                                <a href="{concat(@xml:id, '.html')}">
                                    <xsl:value-of select="./tei:label"/>
                                </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:if test="./tei:ab[@type='participants']">
                                    <ul>
                                        <xsl:for-each select="./tei:ab[@type='participants']/tei:persName">
                                            <li>
                                                <a href="{@key}.html">
                                                    <xsl:value-of select="."/>
                                                </a>
                                            </li>
                                        </xsl:for-each>    
                                    </ul>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="./tei:ab[@type='location']/tei:location[@type='coords']">
                                        <xsl:variable name="key" select="./tei:ab[@type='location']/tei:location[@type='located_in_place']/tei:placeName/@key"/>
                                        <xsl:variable name="coords" select="tokenize(./tei:ab[@type='location']/tei:location[@type='coords']/tei:geo, ', ')"/>
                                        <a href="{$key}.html"
                                            class="map-coordinates" 
                                            lat="{$coords[1]}"
                                            long="{$coords[2]}"
                                            data-count="{$count}"
                                            data-id="{$key}"
                                            title="{./tei:label}"
                                            subtitle="{./tei:ab[@type='location']/tei:location[@type='located_in_place']/tei:placeName}">
                                            <xsl:value-of select="./tei:ab[@type='location']/tei:location[@type='located_in_place']/tei:placeName"/>
                                        </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:if test="./tei:ab[@type='location']/tei:location[@type='located_in_place']">
                                        <a href="{./tei:ab[@type='location']/tei:location[@type='located_in_place']/tei:placeName/@key}.html">
                                            <xsl:value-of select="./tei:ab[@type='location']/tei:location[@type='located_in_place']/tei:placeName"/>
                                        </a>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td>
                                <xsl:value-of select="@notAfter-iso"/>
                            </td>
                            <td>
                                <xsl:if test="./tei:idno[@subtype='WIKIDATA']">
                                <a href="{./tei:idno[@subtype='WIKIDATA']}">
                                    <xsl:value-of select="tokenize(./tei:idno[@subtype='WIKIDATA'], '/')[last()]"/>
                                </a>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:value-of select="@type"/>
                            </td>
                            <td>
                                <xsl:value-of select="@subtype"/>
                            </td>
                            <td>
                                <xsl:value-of select="count(./tei:noteGrp/tei:note)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
