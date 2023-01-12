<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>

    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Analytics'"/>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
                <link rel="stylesheet" type="text/css" href="css/analytics.css"></link>
                <link rel="stylesheet" type="text/css" href="css/network.css"></link>
                <script src="https://code.highcharts.com/highcharts.js"></script>
                <script src="https://code.highcharts.com/modules/data.js"></script>
                <script src="https://code.highcharts.com/modules/series-label.js"></script>
                <script src="https://code.highcharts.com/modules/exporting.js"></script>
                <script src="https://code.highcharts.com/modules/export-data.js"></script>
                <script src="https://code.highcharts.com/modules/accessibility.js"></script>
                <script src="https://code.highcharts.com/modules/networkgraph.js"></script>
            </head>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    <div class="container-fluid">
                        
                        <figure class="highcharts-figure">
                            <div id="container"></div>
                            <p class="highcharts-description">
                                Chart showing data loaded dynamically. The individual data points can
                                be hovered to display more information.
                            </p>
                        </figure>

                        <figure class="highcharts-figure">
                            <div id="container-network"></div>
                            <p class="highcharts-description">
                                This directed graph shows an example of a network graph, where
                                the nodes represent persons and their relationships with each other. 
                                A relationship is defined by an unique ID like "relationship_id_1" that connects
                                two individuals. The IDs have different types like "is_lover_of" to describe
                                the nature of the relationship. 
                            </p>
                        </figure>
                        
                    </div>
                    
                    <xsl:call-template name="html_footer"/>
                </div>
                <script src="js/sender-receiver-graph.js"></script>
                <script src="js/network.js"></script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>