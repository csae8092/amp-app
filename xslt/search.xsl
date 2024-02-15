<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Full Text Search'"/>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
                <link rel="stylesheet" type="text/css" href="css/ts_search.css"/>
            </head>
            
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid mw-100">
                        <div class="row m-2">
                            <div class="col-xl-12 py-5 my-5">
                                <div class="row px-5">
                                    <div class="col-xl-12 text-center justify-content-center">
                                        <h3 class="px-2">Full Text Search</h3>
                                        <div id="searchbox" class="w-50" style="margin: 0 auto;"></div>
                                        <div class="d-flex flex-column align-items-center p-4" id="current-refinements"></div>
                                    </div>
                                    <div class="col-xl-12 px-4 d-flex justify-content-center">
                                        <h5 class="px-2">Date</h5>
                                        <div id="refinement-range-year"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 py-2 bg-diarium-search">
                                <div class="text-center py-2" id="clear-refinements"></div>
                                <h5 class="pt-2">Select Document Type</h5>
                                <div class="p-2" id="document_type"></div>
                                <div id="has-comments"></div>
                                <div id="has-poem"></div>
                                <h5 class="pt-2 hidemobile">Persons</h5>
                                <div id="refinement-list-persons" class="hidemobile"></div>
                                <h5 class="pt-2 hidemobile">Places</h5>
                                <div id="refinement-list-places" class="hidemobile"></div>
                                <h5 class="pt-2 hidemobile">Institutions</h5>
                                <div id="refinement-list-orgs" class="hidemobile"></div>
                                <h5 class="pt-2 hidemobile">Works</h5>
                                <div id="refinement-list-works" class="hidemobile"></div>
                                <h5 class="pt-2 hidemobile">Events</h5>
                                <div id="refinement-list-events" class="hidemobile"></div>
                            </div>
                            <div class="col-xl-10">
                                <div class="row">
                                    <div class="col-xl-4">
                                        <h5 class="pt-2">Sort by</h5>
                                        <div id="sort-by"></div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div id="pagination-top"></div>
                                    </div>
                                    <div class="col-xl-4">
                                        
                                    </div>
                                </div>
                                <div class="text-center" id="stats-container" style="margin-bottom: 1em;"></div>
                                <div id="hits"></div>
                                <div id="pagination-bottom" class="py-4"></div>
                            </div>
                        </div>
                    </div>
                    
                    <xsl:call-template name="html_footer"/>
                    
                </div>
            </body>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/instantsearch.css@7/themes/algolia-min.css"/>
            <link rel="stylesheet" href="css/ts_search.css"/>
            <script src="https://cdn.jsdelivr.net/npm/instantsearch.js@4.46.0"></script>
            <script src="https://cdn.jsdelivr.net/npm/typesense-instantsearch-adapter@2/dist/typesense-instantsearch-adapter.min.js"></script>
            <script src="js/ts_search.js"></script>
            <script src="js/ts_update_url.js"></script>
        </html>
    </xsl:template>
</xsl:stylesheet>