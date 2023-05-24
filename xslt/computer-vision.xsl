<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="tei xsl xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/toc-table.xsl"/>
    <xsl:import href="partials/toc-cards.xsl"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="'RTI Viewer'"></xsl:with-param>
                </xsl:call-template>
                <link type="text/css" href="css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="Stylesheet"/>
                <link type="text/css" href="css/webrtiviewer.css" rel="Stylesheet"/>
                <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jq-3.3.1/jszip-2.5.0/dt-1.11.0/b-2.0.0/b-html5-2.0.0/cr-1.5.4/r-2.2.9/sp-1.4.0/datatables.min.css"/>
                <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/1.1.1/css/searchPanes.dataTables.min.css"/>
                <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.11.0/b-2.0.0/b-html5-2.0.0/cr-1.5.4/r-2.2.9/sp-1.4.0/datatables.min.js"></script>
                <script type="text/javascript" src="js/jquery-ui.min.js"></script>
                <script type="text/javascript" src="js/pep.min.js"></script>
                <script type="text/javascript" src="spidergl/spidergl.min.js"></script>
                <script type="text/javascript" src="spidergl/multires.min.js"></script>
                <script type="text/javascript" src="js/imageLoaded.js"></script>
            </head>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">
                        
                        <div class="row">
                            <div class="col-md-12 text-center" style="margin:2% auto;">
                                <h1>Auden Musulin Papers through Computer Vision</h1>
                                <p>See all transcripts created with CVL technology.</p>
                            </div>
                            <div class="col-md-12">
                                <div id="navBarLetters">
                                    <ul class="nav nav-tabs" id="dropdown-lang">
                                        <li class="nav-item">                                    
                                            <a title="Cards" href="#cards-tab" data-toggle="tab" class="nav-link btn btn-round active">
                                                show cards
                                            </a>
                                        </li>
                                        <li class="nav-item">                                    
                                            <a title="Table" href="#table-tab" data-toggle="tab" class="nav-link btn btn-round">
                                                show table
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-12" style="margin:5% auto;">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="cards-tab" tabindex="-1">  
                                        <div class="row gy-1 text-center">
                                            <xsl:call-template name="toc-cards">
                                                <xsl:with-param name="img" select="'off'"/>
                                                <xsl:with-param name="category" select="'correspondence-cvl'"/>
                                                <xsl:with-param name="max_date" select="xs:date('1969-06-10')"></xsl:with-param>
                                                <xsl:with-param name="low_date" select="xs:date('1965-04-28')"></xsl:with-param>
                                            </xsl:call-template>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="table-tab" tabindex="-1">                        
                                        <div class="card">
                                            <div class="card-body">
                                                <xsl:call-template name="toc-table">
                                                    <xsl:with-param name="img" select="'off'"/>
                                                    <xsl:with-param name="category" select="'correspondence-cvl'"/>
                                                    <xsl:with-param name="max_date" select="xs:date('1969-06-10')"></xsl:with-param>
                                                    <xsl:with-param name="low_date" select="xs:date('1965-04-28')"></xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 text-center" style="margin:2% auto;">
                                <h2>RTI Viewer</h2>
                                <p>Activate the viewer lightbulb and add a lighting angle.</p>
                            </div>
                            <div class="col-md-12" style="margin:5% auto;">
                                <div id="viewerContainer">
                                    <script  type="text/javascript">
                                        createRtiViewer("viewerContainer", "rti-images", 1000, 800); 
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <xsl:call-template name="html_footer"/>
                    <script type="text/javascript" src="js/dt.js"></script>
                    <script>
                        $(document).ready(function () {
                            createDataTable('tocTable', 'Search titles and dates:');
                        });
                    </script>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>