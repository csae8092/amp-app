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
                <meta name="Date of publication" class="staticSearch_date">
                    <xsl:attribute name="content">
                        <xsl:value-of select="//tei:correspAction/tei:date/@when-iso"/>
                    </xsl:attribute>
                </meta>
                <meta name="docImage" class="staticSearch_docImage">
                    <xsl:attribute name="content">
                        <xsl:variable name="iiif-ext" select="'.jp2/full/,200/0/default.jpg'"/> 
                        <xsl:variable name="iiif-domain" select="'https://iiif.acdh.oeaw.ac.at/iiif/images/amp/'"/>
                        <xsl:variable name="facs_id" select="concat(@type, '_img_', generate-id())"/>
                        <xsl:variable name="facs_item" select="tokenize(//tei:pb[1]/@facs, '/')[5]"/>                        
                        <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
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
                    /*.text-re::before {
                        content: '';
                        background-color: #ccc;
                        right: .05em;
                        width: 10px;
                        height: 100%;
                        position:absolute;
                        border-top: 10px solid ccc;
                    }*/
                    .card-body {
                        padding: 4em 1em;
                    }
                    .container-fluid {
                        max-width: 100%;
                    }
                </style>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/openseadragon/2.4.2/openseadragon.min.js"></script>
            </head>
            <body class="page" onload="diplomaticLoad(this)">
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
                            <div class="card-body" style="padding: 1em 0 0 0 !important;">                                
                                <div class="col-md-12">
                                    <h3>
                                    <xsl:choose>
                                        <xsl:when test="substring-before(substring-after(//tei:TEI/@xml:id, '__'), '.xml') = ['0046', '0047', '0027', '0051', '0052', '0056', '0029', '0053', '0030', '0031', '0032', '0033', '0034', '0036', '0049', '0037', '0026', '0061', '0060']">
                                            <a title="back to all letters" href="additional-materials.html" class="nav-link btn btn-round btn-backlink">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
                                                    <path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2z"/>
                                                </svg>
                                            </a>  
                                        </xsl:when>
                                        <xsl:when test="substring-before(substring-after(//tei:TEI/@xml:id, '__'), '.xml') = ['0055', '0048', '0054', '0050']">
                                            <a title="back to all letters" href="photos.html" class="nav-link btn btn-round btn-backlink">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
                                                    <path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2z"/>
                                                </svg>
                                            </a>  
                                        </xsl:when>
                                        <xsl:when test="substring-before(substring-after(//tei:TEI/@xml:id, '__'), '.xml') = ['0028']">
                                            <a title="back to all letters" href="memoirs.html" class="nav-link btn btn-round btn-backlink">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
                                                    <path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2z"/>
                                                </svg>
                                            </a>  
                                        </xsl:when>
                                        <xsl:when test="not(substring-before(substring-after(//tei:TEI/@xml:id, '__'), '.xml') = ['0046', '0047', '0027', '0051', '0052', '0056', '0029', '0053', '0030', '0031', '0032', '0033', '0034', '0036', '0049', '0037', '0026', '0061', '0060','0055', '0048', '0054', '0050','0028'])">
                                            <a title="back to all letters" href="toc.html" class="nav-link btn btn-round btn-backlink">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-back" viewBox="0 0 16 16">
                                                    <path d="M0 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2h2a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2H2a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2z"/>
                                                </svg>
                                            </a>  
                                        </xsl:when>
                                    </xsl:choose>
                                    </h3>
                                </div>
                                
                                <xsl:call-template name="header-nav"/>    
                                
                                <div class="row justify-content-center" style="margin:1em auto 0 auto;display:grid;">
                                    <div class="col-md-12">
                                        <div class="navBarLetters text-center">                                            
                                            <table class="table" style="margin-bottom:0;">
                                                <tbody>           
                                                    <tr>
                                                        <th style="font-weight:normal!important;border-top:none;padding:.1em;">annotation views</th>
                                                        <th style="font-weight:normal!important;border-top:none;padding:.1em;">annotation options</th>
                                                    </tr>
                                                    <tr>         
                                                        <td>                                                            
                                                            <ul class="nav nav-tabs options-menu" style="display:block;">   
                                                                <li style="margin-bottom: 1em;">
                                                                    
                                                                </li>
                                                                <li>                                    
                                                                    <a title="diplomatic"
                                                                        onclick="diplomaticClick(this)"
                                                                        class="nav-link btn btn-round active"
                                                                        id="diplomatic-link">
                                                                        diplomatic
                                                                    </a>                                                                  
                                                                </li>                                    
                                                                <li>                                    
                                                                    <a title="reading"
                                                                        onclick="readingClick(this)"
                                                                        class="nav-link btn btn-round"
                                                                        id="reading-link">
                                                                        reading
                                                                    </a>
                                                                </li>                                                                        
                                                            </ul>
                                                        </td>
                                                        <td>                                                            
                                                            <ul class="nav nav-tabs options-menu" style="display:block;">       
                                                                <li>       
                                                                    <label>deletions</label>
                                                                    <label class="switch">
                                                                        <input title="deletions"
                                                                            type="checkbox"
                                                                            onclick="deletions(this)"
                                                                            id="deletions-link"/>
                                                                        <span id="deletions-link2" class="i-slider round"></span>                                                                        
                                                                    </label>                                                                    
                                                                    <!--<a title="deletions"
                                                                        onclick="deletions(this)"
                                                                        class="nav-link btn badge-link red"
                                                                        id="deletions-link">
                                                                        deletions
                                                                    </a>-->
                                                                </li>                                    
                                                                <li>
                                                                    <label>unclear</label>
                                                                    <label class="switch">
                                                                        <input title="unclear"
                                                                            type="checkbox"
                                                                            onclick="unclear(this)"
                                                                            id="unclear-link"/>
                                                                        <span id="unclear-link2" class="i-slider round"></span>                                                                        
                                                                    </label>                                                                    
                                                                    <!--<a title="unclear"
                                                                        onclick="unclear(this)"
                                                                        class="nav-link btn badge-link yellow"
                                                                        id="unclear-link">
                                                                        unclear
                                                                    </a>-->
                                                                </li>                                                                
                                                            </ul>
                                                            <ul class="nav nav-tabs options-menu" style="display:block;">      
                                                                <li>      
                                                                    <label>highlighting</label>
                                                                    <label class="switch">
                                                                        <input title="underline"
                                                                            type="checkbox"
                                                                            onclick="underline(this)"
                                                                            id="underline-link"/>
                                                                        <span id="underline-link2" class="i-slider round"></span>                                                                        
                                                                    </label>                                                                    
                                                                    <!--<a title="underline"
                                                                        onclick="underline(this)"
                                                                        class="nav-link btn badge-link blue"
                                                                        id="underline-link">
                                                                        highlighting
                                                                    </a>-->
                                                                </li> 
                                                                <li>   
                                                                    <label>whitespaces</label>
                                                                    <label class="switch">
                                                                        <input title="whitespaces"
                                                                            type="checkbox"
                                                                            onclick="space(this)"
                                                                            id="whitespaces-link"/>
                                                                        <span id="whitespaces-link2" class="i-slider round"></span>                                                                        
                                                                    </label>                                                                    
                                                                    <!--<a title="whitespaces"
                                                                        onclick="space(this)"
                                                                        class="nav-link btn badge-link green"
                                                                        id="whitespaces-link">
                                                                        whitespaces
                                                                    </a>-->
                                                                </li>                                                                 
                                                            </ul>
                                                        </td>
                                                    </tr>      
                                                </tbody>
                                            </table>   
                                        </div>
                                        <div class="text-center">
                                            <a title="clear"
                                                style="width:20%;margin:0 auto 1em auto;"
                                                onclick="clearAll(this)"
                                                class="nav-link btn badge-link text-center"
                                                id="clear-link">
                                                clear all
                                            </a>
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
                            
                             <xsl:for-each select="//tei:div[@xml:id='transcription']">                                             
                                 
                                 <div class="pagination-top">
                                     <xsl:call-template name="view-pagination"/>
                                 </div> 
                                 
                                 <xsl:call-template name="view-type-img"/>

                                 <div class="pagination-bottom">
                                     <xsl:call-template name="view-pagination"/>
                                 </div>                                         
                                 
                             </xsl:for-each>     
                            
                        </div><!-- .card -->
                    </div><!-- .container-fluid -->
                    <xsl:call-template name="html_footer"/>
                </div><!-- .site -->
                <script type="text/javascript" src="js/pagination-sync.js"></script>
                <script type="text/javascript" src="js/edition-view-functions.js"></script>
            </body>
        </html>
    </xsl:template>
                    
    <xsl:template match="tei:lb">
        <br/>        
    </xsl:template>
    <xsl:template match="tei:lg">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:l">
        <xsl:apply-templates/><br />
    </xsl:template>
    <xsl:template match="tei:unclear">
        <span class="abbr" title="unclear">
            <xsl:apply-templates/>
        </span> 
    </xsl:template>
    <xsl:template match="tei:space">
        <span class="space">
            <xsl:value-of select="string-join((for $i in 1 to @quantity return '&#x00A0;'),'')"/>
        </span>
    </xsl:template>
    <xsl:template match="tei:del">
        <span class="del"><xsl:apply-templates/></span>      
    </xsl:template> 
    <xsl:template match="tei:gap">
        <xsl:choose>
            <xsl:when test="@reason='deleted'">
                <span class="del">
                    <span class="abbr">
                        <xsl:attribute name="title">
                            <xsl:value-of select="data(@reason)"/>
                        </xsl:attribute>
                        <xsl:text>[</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
                    </span>
                </span>
            </xsl:when>
            <xsl:when test="@reason='illegible'">
                <span class="abbr">
                    <xsl:attribute name="title">
                        <xsl:value-of select="data(@reason)"/>
                    </xsl:attribute>
                    <xsl:text>[</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
                </span>
            </xsl:when>
        </xsl:choose> 
    </xsl:template>
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='underline'">
                <span class="hi-underline">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
