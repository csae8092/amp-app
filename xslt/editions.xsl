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
    <xsl:import href="partials/osd-container.xsl"/>
    <xsl:import href="partials/tei-facsimile.xsl"/>
    <xsl:import href="partials/view-pagination.xsl"/>
    <xsl:import href="partials/view-type.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@level='a'][1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/openseadragon/2.4.2/openseadragon.min.js"></script>
                <meta name="Document type" class="staticSearch_desc">
                    <xsl:attribute name="content">
                        <xsl:value-of select="//tei:text/@type"/>
                    </xsl:attribute>
                </meta>
                <meta name="Date of publication" class="staticSearch_date">
                    <xsl:attribute name="content">
                        <xsl:value-of select="//tei:correspAction/tei:date/@when-iso"/>
                    </xsl:attribute>
                </meta>
                <meta name="docImage" class="staticSearch_docImage">
                    <xsl:attribute name="content">
                        <xsl:value-of select="concat(//tei:pb[1]/@facs, 'full/full/0/default.jpg')"/>
                    </xsl:attribute>
                </meta>
                <meta name="docTitle" class="staticSearch_docTitle">
                    <xsl:attribute name="content">
                        <xsl:value-of select="//tei:titleStmt/tei:title[@level='a']"/>
                    </xsl:attribute>
                </meta>
                <style>
                    .transcript {
                        padding: 1em 0;
                    }
                    .text-re::before {
                        content: '';
                        background-color: #ccc;
                        right: 0;
                        width: 4px;
                        height: 100%;
                        position:absolute;
                        border-top: 10px solid ccc;
                    }
                </style>
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">  
                        <div class="text-right tei-logo">                           
                            <h1>
                                <a href="{//tei:TEI/@xml:id}?format=raw" title="TEI Source">
                                    <img alt="TEI Logo" src="images/TEI_Logo_36px.png" id="tei-logo"/>
                                </a>
                            </h1>                         
                        </div>
                        <div class="card">
                            <div class="card-header">                                
                                <xsl:call-template name="header-nav"/>                                                              
                            </div>
                            <div id="navBarLetters" style="margin-top:4em !important;">
                                <ul class="nav nav-tabs" id="dropdown-lang">
                                    <li class="nav-item">
                                        <xsl:choose>
                                            <xsl:when test="substring-before(substring-after(//tei:TEI/@xml:id, '__'), '.xml') = ['0046', '0047', '0027', '0051', '0052', '0056', '0029', '0053', '0030', '0031', '0032', '0033', '0034', '0036', '0049', '0037', '0026', '0061', '0060']">
                                                <a title="back to all letters" href="additional-materials.html" class="nav-link btn btn-round btn-backlink">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
                                                        <path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2z"/>
                                                    </svg>
                                                </a>  
                                            </xsl:when>
                                            <xsl:when test="substring-before(substring-after(//tei:TEI/@xml:id, '__'), '.xml') = ['0055', '0048', '0054', '0050']">
                                                <a title="back to all letters" href="photos.html" class="nav-link btn btn-round btn-backlink">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
                                                        <path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2z"/>
                                                    </svg>
                                                </a>  
                                            </xsl:when>
                                            <xsl:when test="substring-before(substring-after(//tei:TEI/@xml:id, '__'), '.xml') = ['0028']">
                                                <a title="back to all letters" href="memoirs.html" class="nav-link btn btn-round btn-backlink">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
                                                        <path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2z"/>
                                                    </svg>
                                                </a>  
                                            </xsl:when>
                                            <xsl:when test="not(substring-before(substring-after(//tei:TEI/@xml:id, '__'), '.xml') = ['0046', '0047', '0027', '0051', '0052', '0056', '0029', '0053', '0030', '0031', '0032', '0033', '0034', '0036', '0049', '0037', '0026', '0061', '0060','0055', '0048', '0054', '0050','0028'])">
                                                <a title="back to all letters" href="toc.html" class="nav-link btn btn-round btn-backlink">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
                                                        <path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2z"/>
                                                    </svg>
                                                </a>  
                                            </xsl:when>
                                        </xsl:choose>                                        
                                    </li>
                                    <li class="nav-item">                                    
                                        <a title="Cards" href="#diplomatic-tab" data-toggle="tab" class="nav-link btn btn-round active">
                                            diplomatic view
                                        </a>
                                    </li>
                                    <li class="nav-item">                                    
                                        <a title="Table" href="#commentary-tab" data-toggle="tab" class="nav-link btn btn-round">
                                            commentary view
                                        </a>
                                    </li>
                                    <li class="nav-item">                                    
                                        <a title="Table" href="#reading-tab" data-toggle="tab" class="nav-link btn btn-round">
                                            reading view
                                        </a>
                                    </li>
                                    <li class="nav-item">                                    
                                        <a title="Table" href="#xml-tab" data-toggle="tab" class="nav-link btn btn-round">
                                            TEI/XML view
                                        </a>
                                    </li>                                    
                                </ul>
                            </div>
                            <div class="tab-content">
                                 <div class="tab-pane active" id="diplomatic-tab" tabindex="-1">                                     
                                     <xsl:for-each select="//tei:div[@xml:id='transcription']">                                             
                                         
                                         <div class="pagination-top">
                                             <xsl:call-template name="view-pagination">
                                                 <xsl:with-param name="reading-type" select="'diplomatic'"/>
                                             </xsl:call-template>  
                                         </div> 
                                         
                                         <xsl:call-template name="view-type-img">
                                             <xsl:with-param name="reading-type" select="'diplomatic'"/>
                                         </xsl:call-template>
                                         
                                         <div class="pagination-bottom">
                                             <xsl:call-template name="view-pagination">
                                                 <xsl:with-param name="reading-type" select="'diplomatic'"/>
                                             </xsl:call-template>  
                                         </div>                                         
                                         
                                     </xsl:for-each>                                     
                                 </div>
                                <div class="tab-pane fade" id="reading-tab" tabindex="-1">
                                    <xsl:for-each select="//tei:div[@xml:id='transcription']">
                                        
                                        <div class="pagination-top">
                                            <xsl:call-template name="view-pagination">
                                                <xsl:with-param name="reading-type" select="'reading'"/>
                                            </xsl:call-template>  
                                        </div>  
                                        
                                        <xsl:call-template name="view-type-no-img">
                                            <xsl:with-param name="reading-type" select="'reading'"/>
                                        </xsl:call-template>
                                        
                                        <div class="pagination-bottom">
                                            <xsl:call-template name="view-pagination">
                                                <xsl:with-param name="reading-type" select="'reading'"/>
                                            </xsl:call-template>  
                                        </div>   
                                        
                                    </xsl:for-each>                                            
                                </div>
                                <div class="tab-pane fade" id="commentary-tab" tabindex="-1">
                                    <xsl:for-each select="//tei:div[@xml:id='transcription']">                                        
                                        
                                        <div class="pagination-top">
                                            <xsl:call-template name="view-pagination">
                                                <xsl:with-param name="reading-type" select="'commentary'"/>
                                            </xsl:call-template>  
                                        </div>   
                                        
                                        <xsl:call-template name="view-type-no-img">
                                            <xsl:with-param name="reading-type" select="'commentary'"/>
                                        </xsl:call-template>
                                        
                                        <div class="pagination-bottom">
                                            <xsl:call-template name="view-pagination">
                                                <xsl:with-param name="reading-type" select="'commentary'"/>
                                            </xsl:call-template>  
                                        </div> 
                                        
                                    </xsl:for-each>                                    
                                </div>
                                <div class="tab-pane fade" id="xml-tab" tabindex="-1">
                                    <div class="card-body">                                
                                        <iframe frameborder="0" scrolling="yes" width="100%" height="800px">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="concat('xml-view/',replace(tokenize(base-uri(.),'/')[last()],'.xml','.html'))"/>
                                            </xsl:attribute>
                                        </iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>   
                <script type="text/javascript" src="js/pagination-sync.js"></script>
            </body>
        </html>
    </xsl:template>
                    
    <xsl:template match="tei:lb">
        <xsl:param name="view"/>
        <xsl:if test="$view = 'diplomatic' or $view = 'commentary'">
            <br/>
        </xsl:if>
    </xsl:template>
        <xsl:template match="tei:l">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'diplomatic' or $view = 'commentary' or $view = 'reading'">
                <xsl:apply-templates/><br />
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:unclear">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'diplomatic' or $view = 'commentary'">
                <abbr title="unclear"><xsl:apply-templates/></abbr>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>     
    </xsl:template>
    <xsl:template match="tei:space">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'diplomatic' or $view = 'commentary'">
                <xsl:value-of select="string-join((for $i in 1 to @quantity return '&#x00A0;'),'')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>    
    </xsl:template>
    <xsl:template match="tei:del">
        <xsl:param name="view"/>
        <xsl:choose>
            <xsl:when test="$view = 'diplomatic' or $view = 'commentary' or $view = 'reading'">
                <del><xsl:apply-templates/></del>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>    
</xsl:stylesheet>
