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
    <xsl:import href="partials/osd-container.xsl"/>
    <xsl:import href="partials/tei-facsimile.xsl"/>
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
                    }
                </style>
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">  
                        <div class="card">
                            <div class="card-header">
                                <h1><xsl:value-of select="$doc_title"/></h1>
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
                                            <xsl:when test="substring-before(substring-after(//tei:TEI/@xml:id, '__'), '.xml') != ['0046', '0047', '0027', '0051', '0052', '0056', '0029', '0053', '0030', '0031', '0032', '0033', '0034', '0036', '0049', '0037', '0026', '0061', '0060','0055', '0048', '0054', '0050','0028']">
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
                                         <xsl:variable 
                                             name="vseq" 
                                             select="//tei:pb" 
                                             as="item()*"/>
                                         <div class="text-center pagination">
                                            <ul class="nav nav-tabs">
                                                <xsl:for-each select="$vseq">
                                                    <xsl:choose>
                                                        <xsl:when test="position() = 1">
                                                            <li class="nav-item">
                                                                <a
                                                                    title="{position()}"
                                                                    class="nav-link active"
                                                                    data-toggle="tab"
                                                                    href="#diplomatic-paginate-{position()}"
                                                                    style="border-radius:30px;">
                                                                    <xsl:value-of select="position()"/> 
                                                                </a>                                                    
                                                            </li>
                                                        </xsl:when>
                                                        <xsl:when test="position() = [1,2,3,4,5,6,7,8,9]">
                                                            <li class="nav-item">
                                                                <a
                                                                    title="{position()}"
                                                                    class="nav-link"
                                                                    data-toggle="tab"
                                                                    href="#diplomatic-paginate-{position()}"
                                                                    style="border-radius:30px;">
                                                                    <xsl:value-of select="position()"/> 
                                                                </a>                                                    
                                                            </li>
                                                        </xsl:when>
                                                        <xsl:when test="position() = 10">
                                                            <li class="nav-item dropdown">
                                                                <a
                                                                    title="more"
                                                                    href="#"
                                                                    data-toggle="dropdown"
                                                                    class="nav-link dropdown-toggle"
                                                                    style="border-radius:30px;"
                                                                    >
                                                                    more <span class="caret"></span>
                                                                </a>
                                                                <ul class="dropdown-menu" role="menu">
                                                                    <xsl:for-each select="$vseq">
                                                                        <xsl:choose>
                                                                            <xsl:when test="position() > 9">
                                                                                <li
                                                                                    class="nav-item dropdown-submenu"
                                                                                    style="display:inline-block;">
                                                                                    <a
                                                                                        title="{position()}"
                                                                                        href="#diplomatic-paginate-{position()}"
                                                                                        class="nav-link"
                                                                                        data-toggle="tab"
                                                                                        style="border-radius:30px;">
                                                                                        <xsl:value-of select="position()"/>
                                                                                    </a>
                                                                                </li>
                                                                            </xsl:when>
                                                                        </xsl:choose>
                                                                    </xsl:for-each>                                                                                                                
                                                                </ul>                                
                                                            </li>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <!--<li class="nav-item" style="display:none;">
                                                                <a
                                                                    title="{position()}"
                                                                    class="nav-link btn btn-round btn-backlink"
                                                                    data-toggle="tab"
                                                                    href="#diplomatic-paginate-{position()}"
                                                                    ><xsl:value-of select="position()"/> 
                                                                </a>                                                    
                                                            </li>-->
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                                                                        
                                                </xsl:for-each>                                                                                                
                                            </ul>
                                         </div>
                                         <div class="tab-content">
                                         <xsl:for-each-group select="*" group-starting-with="tei:pb">                                                 
                                             <xsl:choose>
                                                 <xsl:when test="position() = 1">                                                         
                                                     <div class="tab-pane active" id="diplomatic-paginate-{position()}" tabindex="-1">
                                                         <div id="container-resize-{position()}" class="transcript row">
                                                             <div id="text-resize-{position()}" class="text-re col-md-8">
                                                                 <div class="card-body">                                                                                                                                                                                       
                                                                     <xsl:for-each select="current-group()[self::tei:p]">
                                                                         <p>
                                                                             <xsl:apply-templates>
                                                                                 <xsl:with-param name="view" select="'diplomatic'"/>
                                                                             </xsl:apply-templates>
                                                                         </p>
                                                                     </xsl:for-each>
                                                                 </div>
                                                             </div>                                                     
                                                             <div id="img-resize-{position()}" class="col-md-3">
                                                                 <div class="expand-wrapper" style="cursor:col-resize;">
                                                                     <svg id="img-expand-{position()}" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-aspect-ratio" viewBox="0 0 16 16">
                                                                         <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h13A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 12.5v-9zM1.5 3a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-13z"/>
                                                                         <path d="M2 4.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1H3v2.5a.5.5 0 0 1-1 0v-3zm12 7a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1 0-1H13V8.5a.5.5 0 0 1 1 0v3z"/>
                                                                     </svg>
                                                                     <p><small>change size</small></p>
                                                                 </div>
                                                                 <!--<hr/> -->                                             
                                                                 <xsl:variable name="osd_container_id" select="concat(@type, '_container_', generate-id())"/>
                                                                 <xsl:variable name="osd_container_id2" select="concat(@type, '_container2_', generate-id())"/>
                                                                 <div id="viewer-{position()}">
                                                                     <div id="{$osd_container_id}" style="padding:.5em;">
                                                                         <!-- image container accessed by OSD script -->
                                                                         <script type="text/javascript" src="js/osd_single.js"></script>
                                                                         <div id="{$osd_container_id2}">
                                                                             <xsl:if test="@facs">    
                                                                                 <xsl:variable name="iiif-ext" select="'full/full/0/default.jpg'"/> 
                                                                                 <xsl:variable name="facs_id" select="concat(@type, '_img_', generate-id())"/>
                                                                                 <img id="{$facs_id}" onload="[load_image('{$facs_id}','{$osd_container_id}','{$osd_container_id2}'), $( document ).ready(resize('{position()}'))]">
                                                                                     <xsl:attribute name="src">
                                                                                         <xsl:value-of select="concat(@facs , $iiif-ext)"/>
                                                                                     </xsl:attribute>
                                                                                 </img>                                                                
                                                                             </xsl:if>                                
                                                                         </div>                                
                                                                     </div>  
                                                                 </div>
                                                             </div>                                                                 
                                                         </div>
                                                     </div>                                                         
                                                 </xsl:when>
                                                 <xsl:otherwise>
                                                     <div class="tab-pane fade" id="diplomatic-paginate-{position()}" tabindex="-1">
                                                         <div id="container-resize-{position()}" class="transcript row">
                                                             <div id="text-resize-{position()}" class="text-re col-md-8">                                                                
                                                                 <div class="card-body">                                                                                                                                                                                       
                                                                     <xsl:for-each select="current-group()[self::tei:p]">
                                                                         <p>
                                                                             <xsl:apply-templates>
                                                                                 <xsl:with-param name="view" select="'diplomatic'"/>
                                                                             </xsl:apply-templates>
                                                                         </p>
                                                                     </xsl:for-each>
                                                                 </div>
                                                             </div>                                                     
                                                             <div id="img-resize-{position()}" class="col-md-3">
                                                                 <div class="expand-wrapper" style="cursor:col-resize;">
                                                                     <svg id="img-expand-{position()}" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-aspect-ratio" viewBox="0 0 16 16">
                                                                         <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h13A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 12.5v-9zM1.5 3a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-13z"/>
                                                                         <path d="M2 4.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1H3v2.5a.5.5 0 0 1-1 0v-3zm12 7a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1 0-1H13V8.5a.5.5 0 0 1 1 0v3z"/>
                                                                     </svg>
                                                                     <p><small>change size</small></p>
                                                                 </div>
                                                                 <!--<hr/> -->                                             
                                                                 <xsl:variable name="osd_container_id" select="concat(@type, '_container_', generate-id())"/>
                                                                 <xsl:variable name="osd_container_id2" select="concat(@type, '_container2_', generate-id())"/>
                                                                 <div id="viewer-{position()}">
                                                                     <div id="{$osd_container_id}" style="padding:.5em;">
                                                                         <!-- image container accessed by OSD script -->
                                                                         <script type="text/javascript" src="js/osd_single.js"></script>
                                                                         <div id="{$osd_container_id2}">
                                                                             <xsl:if test="@facs">    
                                                                                 <xsl:variable name="iiif-ext" select="'full/full/0/default.jpg'"/> 
                                                                                 <xsl:variable name="facs_id" select="concat(@type, '_img_', generate-id())"/>
                                                                                 <img id="{$facs_id}" onload="[load_image('{$facs_id}','{$osd_container_id}','{$osd_container_id2}'), $( document ).ready(resize('{position()}'))]">
                                                                                     <xsl:attribute name="src">
                                                                                         <xsl:value-of select="concat(@facs , $iiif-ext)"/>
                                                                                     </xsl:attribute>
                                                                                 </img>                                                                
                                                                             </xsl:if>                                
                                                                         </div>                                
                                                                     </div>  
                                                                 </div>
                                                             </div>                                                                 
                                                         </div>
                                                     </div>                                                         
                                                 </xsl:otherwise>
                                             </xsl:choose>
                                             
                                         </xsl:for-each-group>   
                                         </div>
                                     </xsl:for-each>                                     
                                 </div>
                                <div class="tab-pane fade" id="reading-tab" tabindex="-1">
                                    <xsl:for-each select="//tei:div[@xml:id='transcription']">
                                        <xsl:variable 
                                            name="vseq" 
                                            select="//tei:pb" 
                                            as="item()*"/>
                                        <div class="text-center pagination">
                                            <ul class="nav nav-tabs">
                                                <xsl:for-each select="$vseq">
                                                    <xsl:choose>
                                                        <xsl:when test="position() = 1">
                                                            <li class="nav-item">
                                                                <a
                                                                    title="{position()}"
                                                                    class="nav-link active"
                                                                    data-toggle="tab"
                                                                    href="#reading-paginate-{position()}"
                                                                    style="border-radius:30px;">
                                                                    <xsl:value-of select="position()"/> 
                                                                </a>                                                    
                                                            </li>
                                                        </xsl:when>
                                                        <xsl:when test="position() = [1,2,3,4,5,6,7,8,9]">
                                                            <li class="nav-item">
                                                                <a
                                                                    title="{position()}"
                                                                    class="nav-link"
                                                                    data-toggle="tab"
                                                                    href="#reading-paginate-{position()}"
                                                                    style="border-radius:30px;">
                                                                    <xsl:value-of select="position()"/> 
                                                                </a>                                                    
                                                            </li>
                                                        </xsl:when>
                                                        <xsl:when test="position() = 10">
                                                            <li class="nav-item dropdown">
                                                                <a
                                                                    title="more"
                                                                    href="#"
                                                                    data-toggle="dropdown"
                                                                    class="nav-link dropdown-toggle"
                                                                    style="border-radius:30px;"
                                                                    >
                                                                    more <span class="caret"></span>
                                                                </a>
                                                                <ul class="dropdown-menu" role="menu">
                                                                    <xsl:for-each select="$vseq">
                                                                        <xsl:choose>
                                                                            <xsl:when test="position() > 9">
                                                                                <li
                                                                                    class="nav-item dropdown-submenu"
                                                                                    style="display:inline-block;">
                                                                                    <a
                                                                                        title="{position()}"
                                                                                        href="#reading-paginate-{position()}"
                                                                                        class="nav-link"
                                                                                        data-toggle="tab"
                                                                                        style="border-radius:30px;">
                                                                                        <xsl:value-of select="position()"/>
                                                                                    </a>
                                                                                </li>
                                                                            </xsl:when>
                                                                        </xsl:choose>
                                                                    </xsl:for-each>                                                                                                                
                                                                </ul>                                
                                                            </li>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <!--<li class="nav-item" style="display:none;">
                                                                <a
                                                                    title="{position()}"
                                                                    class="nav-link btn btn-round btn-backlink"
                                                                    data-toggle="tab"
                                                                    href="#diplomatic-paginate-{position()}"
                                                                    ><xsl:value-of select="position()"/> 
                                                                </a>                                                    
                                                            </li>-->
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                                                                        
                                                </xsl:for-each>                                                                                                
                                            </ul>
                                        </div>
                                        <div class="tab-content">
                                            <xsl:for-each-group select="*" group-starting-with="tei:pb">                                                
                                                <xsl:choose>
                                                    <xsl:when test="position() = 1">
                                                        <div class="tab-pane active" id="reading-paginate-{position()}" tabindex="-1">
                                                            <div class="card-body"> 
                                                            <xsl:for-each select="current-group()[self::tei:p]">
                                                                <p>                                                        
                                                                    <xsl:apply-templates>
                                                                        <xsl:with-param name="view" select="'reading'"/>
                                                                    </xsl:apply-templates>
                                                                </p>
                                                            </xsl:for-each>
                                                            </div>
                                                        </div>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <div class="tab-pane fade" id="reading-paginate-{position()}" tabindex="-1">
                                                            <div class="card-body"> 
                                                            <xsl:for-each select="current-group()[self::tei:p]">
                                                                <p>                                                        
                                                                    <xsl:apply-templates>
                                                                        <xsl:with-param name="view" select="'reading'"/>
                                                                    </xsl:apply-templates>
                                                                </p>
                                                            </xsl:for-each>
                                                            </div>
                                                        </div>
                                                    </xsl:otherwise>
                                                </xsl:choose>                                                
                                            </xsl:for-each-group>
                                        </div>
                                    </xsl:for-each>                                            
                                </div>
                                <div class="tab-pane fade" id="commentary-tab" tabindex="-1">
                                    <xsl:for-each select="//tei:div[@xml:id='transcription']">
                                        <xsl:variable 
                                            name="vseq" 
                                            select="//tei:pb" 
                                            as="item()*"/>   
                                        <div class="text-center pagination">
                                            <ul class="nav nav-tabs">
                                                <xsl:for-each select="$vseq">
                                                    <xsl:choose>
                                                        <xsl:when test="position() = 1">
                                                            <li class="nav-item">
                                                                <a
                                                                    title="{position()}"
                                                                    class="nav-link active"
                                                                    data-toggle="tab"
                                                                    href="#commentary-paginate-{position()}"
                                                                    style="border-radius:30px;">
                                                                    <xsl:value-of select="position()"/> 
                                                                </a>                                                    
                                                            </li>
                                                        </xsl:when>
                                                        <xsl:when test="position() = [1,2,3,4,5,6,7,8,9]">
                                                            <li class="nav-item">
                                                                <a
                                                                    title="{position()}"
                                                                    class="nav-link"
                                                                    data-toggle="tab"
                                                                    href="#commentary-paginate-{position()}"
                                                                    style="border-radius:30px;">
                                                                    <xsl:value-of select="position()"/> 
                                                                </a>                                                    
                                                            </li>
                                                        </xsl:when>
                                                        <xsl:when test="position() = 10">
                                                            <li class="nav-item dropdown">
                                                                <a
                                                                    title="more"
                                                                    href="#"
                                                                    data-toggle="dropdown"
                                                                    class="nav-link dropdown-toggle"
                                                                    style="border-radius:30px;"
                                                                    >
                                                                    more <span class="caret"></span>
                                                                </a>
                                                                <ul class="dropdown-menu" role="menu">
                                                                    <xsl:for-each select="$vseq">
                                                                        <xsl:choose>
                                                                            <xsl:when test="position() > 9">
                                                                                <li
                                                                                    class="nav-item dropdown-submenu"
                                                                                    style="display:inline-block;">
                                                                                    <a
                                                                                        title="{position()}"
                                                                                        href="#commentary-paginate-{position()}"
                                                                                        class="nav-link"
                                                                                        data-toggle="tab"
                                                                                        style="border-radius:30px;">
                                                                                        <xsl:value-of select="position()"/>
                                                                                    </a>
                                                                                </li>
                                                                            </xsl:when>
                                                                        </xsl:choose>
                                                                    </xsl:for-each>                                                                                                                
                                                                </ul>                                
                                                            </li>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <!--<li class="nav-item" style="display:none;">
                                                                <a
                                                                    title="{position()}"
                                                                    class="nav-link btn btn-round btn-backlink"
                                                                    data-toggle="tab"
                                                                    href="#diplomatic-paginate-{position()}"
                                                                    ><xsl:value-of select="position()"/> 
                                                                </a>                                                    
                                                            </li>-->
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                                                                        
                                                </xsl:for-each>                                                                                                
                                            </ul>
                                        </div>                                             
                                        <div class="tab-content">
                                        <xsl:for-each-group select="*" group-starting-with="tei:pb">                                                
                                            <xsl:choose>
                                                <xsl:when test="position() = 1">
                                                    <div class="tab-pane active" id="commentary-paginate-{position()}" tabindex="-1">
                                                        <div class="card-body"> 
                                                        <xsl:for-each select="current-group()[self::tei:p]">
                                                            <p>                                                        
                                                                <xsl:apply-templates>
                                                                    <xsl:with-param name="view" select="'commentary'"/>
                                                                </xsl:apply-templates>
                                                            </p>
                                                        </xsl:for-each>
                                                        </div>
                                                    </div>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <div class="tab-pane fade" id="commentary-paginate-{position()}" tabindex="-1">
                                                        <div class="card-body"> 
                                                        <xsl:for-each select="current-group()[self::tei:p]">
                                                            <p>                                                        
                                                                <xsl:apply-templates>
                                                                    <xsl:with-param name="view" select="'commentary'"/>
                                                                </xsl:apply-templates>
                                                            </p>
                                                        </xsl:for-each>
                                                        </div>
                                                    </div>
                                                </xsl:otherwise>
                                            </xsl:choose>                                                
                                        </xsl:for-each-group>
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
            </body>
        </html>
    </xsl:template>
                    
    <xsl:template match="tei:lb">
        <xsl:param name="view"/>
        <xsl:if test="$view = 'diplomatic' or $view = 'commentary'">
            <br/>
        </xsl:if>
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