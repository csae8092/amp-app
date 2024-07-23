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

                        <figure class="network-visualization">
                            <h5 class="text-center">Relationships between Persons</h5>
                            <select id="network-visualization-data" class="form-select" aria-label="Select different graph data">
                                <option value="all">All Entities - Person, Organization, Place, Event</option>
                                <option value="person">Person - Person</option>
                                <option value="org">Person - Organization</option>
                            </select>
                            <div id="network-container" style="position: relative; height: 600px; background: #fafafa; height: 800px;"></div>
                            <p class="highcharts-description">

                            </p>
                        </figure>
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
                <script src="js/vendor/highcharts-bin-11.4.6/highcharts.js"></script>
                <script src="js/vendor/highcharts-bin-11.4.6/data.js"></script>
                <script src="js/vendor/highcharts-bin-11.4.6/series-label.js"></script>
                <script src="js/vendor/highcharts-bin-11.4.6/exporting.js"></script>
                <script src="js/vendor/highcharts-bin-11.4.6/export-data.js"></script>
                <script src="js/vendor/highcharts-bin-11.4.6/accessibility.js"></script>
                <script src="js/sender-receiver-graph.js"></script>
                <script src="js/vendor/react-bin-16.14.0/react.production.min.js"></script>
                <script src="js/vendor/react-bin-16.14.0/react-dom.production.min.js"></script>
                <script src="js/vendor/three-bin-0.126.1/three.min.js"></script>
                <script src="js/vendor/acdh-network-visualization-bin-0.1.39/network-visualization.umd.js"></script>
                <script type="text/javascript" src="js/network-visualisation.js"></script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>