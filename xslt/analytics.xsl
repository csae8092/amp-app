<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes"/>

    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>

    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Analytics'"/>
        <html>
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
                <link rel="stylesheet" type="text/css" href="css/analytics.css"></link>
                <link rel="stylesheet" type="text/css" href="css/network.css"></link>
            </head>
            <body class="d-flex flex-column">
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0">
                    <div class="container-fluid">

                        <figure class="highcharts-figure">
                            <div id="container"></div>
                            <p class="highcharts-description">
                                Chart showing data loaded dynamically. The individual data points can
                                be hovered to display more information.
                            </p>
                        </figure>

                        <figure class="highcharts-figure">
                            <h5 class="text-center">Relationships between Persons</h5>
                            <div id="container-network"
                                style="position: relative; height: 600px; background: #fafafa; height: 800px;"></div>
                            <p class="highcharts-description">
                                This directed graph shows an example of a network graph, where
                                the nodes represent persons and their relationships with each other. 
                                The IDs have different types like "is_lover_of" to describe
                                the nature of the relationship. 
                            </p>
                        </figure>

                        <figure class="highcharts-figure">
                            <h5 class="text-center">Relationships between Persons and Organizations</h5>
                            <div id="container-network-org"
                                style="position: relative; height: 600px; background: #fafafa; height: 800px;"></div>
                            <p class="highcharts-description">
                                This directed graph shows an example of a network graph, where
                                the nodes represent persons and their relationships to organizations. 
                                The IDs have different types like "is_employee_of" to describe
                                the nature of the relationship. 
                            </p>
                        </figure>

                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
                <script src="https://code.highcharts.com/highcharts.js"></script>
                <script src="https://code.highcharts.com/modules/data.js"></script>
                <script src="https://code.highcharts.com/modules/series-label.js"></script>
                <script src="https://code.highcharts.com/modules/exporting.js"></script>
                <script src="https://code.highcharts.com/modules/export-data.js"></script>
                <script src="https://code.highcharts.com/modules/accessibility.js"></script>
                <script src="js/sender-receiver-graph.js"></script>
                <script
                    src="https://unpkg.com/react@16/umd/react.production.min.js"
                    ></script>
                <script
                    src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"
                    ></script>
                <script
                    src="https://unpkg.com/three@0.126.1/build/three.min.js"
                    ></script>                
                <script
                    src="https://unpkg.com/@acdh/network-visualization@0/lib/network-visualization.umd.js"
                    ></script>
                <script type="text/javascript" src="js/network-visualisation.js"></script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>