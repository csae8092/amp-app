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
                <style>
                    p, ol {
                        font-size: 1.2rem;
                    }
                </style>
            </head>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12" style="margin:4em auto 1em auto;">
                                <h1 class="text-center my-4">Auden Musulin Papers through Computer Vision</h1>
                                <p>Two edition documents contain indented impressions: <a class="cv-link" href="amp-transcript__0039.html">the 1965 typescript of W. H. Auden’s German prose translation of his poem 
                                    “Joseph Weinheber”</a> and <a class="cv-link" href="amp-transcript__0040.html">Auden’s letter to Stella Musulin 
                                        from 10 June 1969</a>. These were created through W. H. Auden’s specific
                                    use of the typewriter: the poet would insert backing sheets into the typewriter that were placed below those sheets of paper
                                    on which he typed his poetry, and subsequently reused them for correspondence and literary writing. The pressure of the typebars
                                    transferred to the backing sheet and left colorless, three-dimensional impressions in the paper.
                                    These impressions are not captured through standard image-digitization technologies. 
                                    By means of raking light, they can be rendered visible, but remain largely undecipherable because of overlapping layers of text. 
                                    Reflectance Transformation Imaging (RTI) offers an interactive visualization of the documents’ surface structure as if illuminated 
                                    from an oblique angle:
                                </p>
                            </div>
                            <div class="col-md-12 text-center" style="margin: 1em auto;">
                                <h2>RTI Viewer</h2>
                            </div>
                            <div class="col-md-12" style="margin: 1em auto;">
                                <div id="viewerContainer">
                                    <script  type="text/javascript">
                                        createRtiViewer("viewerContainer", "rti-images", 1000, 800); 
                                    </script>
                                </div>
                            </div>
                            <div class="col-md-12" style="margin:2% auto;">
                                <p>
                                    Click the light-bulb icon. Place the cursor over the viewer and press the left button of your mouse or trackpad. 
                                    Keep it pressed and move the cursor across the viewer.<lb/>
                                    In order to reconstruct the hidden layers of text, computer-vision technologies used in the research of 3D cultural-heritage objects were employed. 
                                    At the <a class="cv-link" href="https://cvl.tuwien.ac.at">Computer Vision Lab</a> of <a class="cv-link" href="https://www.tuwien.at/en">TU Wien</a>, 
                                    the documents in question were analyzed with the help of Photometric Stereo: from a set of source images, taken from the same angle, 
                                    but illuminated from different directions, surface models were computed that allow for the reconstruction of the 3D typewriter impressions. 
                                    The resulting visualizations have been published on Zenodo <a class="cv-link" href="https://doi.org/10.5281/zenodo.7706092">Zenodo</a>.
                                    The following two poetic texts have been retrieved from the indented impressions:
                                </p>
                                <ol>
                                    <li>
                                        a previously unknown, otherwise lost, early version of W. H. Auden’s poem “Epithalamium”<lb/><lb/>
                                        [<a class="cv-link" href="amp-transcript__0039.html?img=off&amp;tab=6">recto</a>]<lb/><lb/>
                                        [<a class="cv-link" href="amp-transcript__0039.html?img=off&amp;tab=8">verso</a>]
                                    </li>
                                    <li>
                                        an unpublished early version of Auden’s poem “Epistle to a Godson”, 
                                        sent to Oxford scholar E. R. Dodds on 10 June 1969, now held in the Bodleian Libraries’ Special Collections<lb/><lb/>
                                        [<a class="cv-link" href="amp-transcript__0040.html?img=off&amp;tab=6">recto</a>]<lb/><lb/>
                                        [<a class="cv-link" href="amp-transcript__0040.html?img=off&amp;tab=4">verso</a>]
                                    </li>
                                </ol>
                                <p>
                                    The methodology, results, and implications of this discovery are discussed in detail in 
                                    <a class="cv-link" href="https://doi.org/10.1093/llc/fqad037">Brenner, Frühwirth, and Mayer:
                                    Revealing ‘Invisible’ Poetry by W. H. Auden through Computer Vision: Using Photometric Stereo to Visualize indented
                                    impressions</a>.
                                </p>
                            </div>
                        </div>
                        <div class="row">
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
                            <div class="col-md-12" style="margin: 1em auto;">
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