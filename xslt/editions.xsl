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
                    mark{
                        background: orange;
                        color: black;
                    }
                </style>
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">  
                        <div class="card">
                            <div class="card-body" style="padding: .5em 0 0 0 !important;">
                                
                                <xsl:call-template name="header-nav"/>
                                
                            </div>
                            <!--   add edition text and facsimile   -->
                            <xsl:for-each select="//tei:body/tei:div[@type='transcription' or @xml:id='transcription']">                           
                                 
                                 <xsl:call-template name="view-type-img"/>
    
                            </xsl:for-each>
                            
                        </div><!-- .card -->
                        <xsl:for-each select="//tei:back">
                            <div class="tei-back">
                                
                                <xsl:apply-templates/>
                                
                            </div>
                        </xsl:for-each>
                    </div><!-- .container-fluid -->
                    <xsl:call-template name="html_footer"/>
                </div><!-- .site -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/openseadragon/4.0.0/openseadragon.min.js"></script>
                <script src="https://unpkg.com/de-micro-editor@0.2.85/dist/de-editor.min.js"></script>
                <!--<script src="js/dist/de-editor.min.js"></script> -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/mark.js/8.11.1/mark.min.js"></script>
                <script type="text/javascript" src="js/run.js"></script>
                <script type="text/javascript" src="js/hide-md.js"></script>
                <script type="text/javascript" src="js/mark.js"></script>
                <script type="text/javascript" src="js/prev-next-urlupdate.js"></script>
            </body>
        </html>
    </xsl:template>
                    
    <!--<xsl:template match="tei:lb">
        <br/>        
    </xsl:template>-->
    
    <!--<xsl:template match="tei:note">
        <xsl:choose>
            <xsl:when test="@type='footnote'">
                <!-\-<span class="footnote_anchor" id="{@xml:id}_inline"></span>-\->
                <sup><a href="#{@xml:id}_inline" id="{@xml:id}" title="footnote {@n}"><xsl:value-of select="@n"/></a></sup>
            </xsl:when>
            <xsl:when test="@type='endnote'">
                <xsl:variable name="place" select="7"/>
                <!-\-<xsl:variable name="place" select="tokenize(@place, '\s')[last()]"/>-\->
                <sup><a href="?tab={$place}#{@xml:id}_inline" id="{@xml:id}" title="endnote {@n}"><xsl:value-of select="@n"/></a></sup>
            </xsl:when>
            <xsl:otherwise>
                <sup><a href="#{@xml:id}_inline" id="{@xml:id}" title="note {@n}"><xsl:value-of select="@n"/></a></sup>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    
    <xsl:template match="tei:ab">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:head">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:address">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:seg">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:opener">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:salute">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:closer">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:signed">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:unclear">
        <span class="abbr" alt="unclear">
            <xsl:apply-templates/>
        </span> 
    </xsl:template>
    <xsl:template match="tei:space">
        <span class="space">
            <xsl:value-of select="string-join((for $i in 1 to @quantity return '&#x00A0;'),'')"/>
        </span>
    </xsl:template>
    <xsl:template match="tei:del">
        <span class="del" style="display:none;"><xsl:apply-templates/></span>      
    </xsl:template> 
    <xsl:template match="tei:gap">
        <xsl:choose>
            <xsl:when test="@reason='deleted'">
                <span class="del gap">
                    <xsl:attribute name="alt">
                        <xsl:value-of select="data(@reason)"/>
                    </xsl:attribute>
                    <xsl:text>[</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
                </span>                
            </xsl:when>
            <xsl:when test="@reason='illegible'">
                <span class="gap">
                    <xsl:attribute name="alt">
                        <xsl:value-of select="data(@reason)"/>
                    </xsl:attribute>
                    <xsl:text>[</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
                </span>
            </xsl:when>
        </xsl:choose> 
    </xsl:template>
     <xsl:template match="tei:rs">
        <xsl:choose>
            <xsl:when test="count(tokenize(@ref, ' ')) > 1">
                <xsl:choose>
                    <xsl:when test="@type='person'">
                        <span class="persons">
                            <xsl:apply-templates/>
                            <xsl:for-each select="tokenize(@ref, ' ')">
                                <sup class="entity" data-bs-toggle="modal" data-bs-target="{.}">
                                    <xsl:value-of select="position()"/>
                                </sup>
                                <xsl:if test="position() != last()">
                                    <sup class="entity">/</sup>
                                </xsl:if>
                            </xsl:for-each>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='place'">
                        <span class="places">
                            <xsl:apply-templates/>
                            <xsl:for-each select="tokenize(@ref, ' ')">
                                <sup class="entity" data-bs-toggle="modal" data-bs-target="{.}">
                                    <xsl:value-of select="position()"/>
                                </sup>
                                <xsl:if test="position() != last()">
                                    <sup class="entity">/</sup>
                                </xsl:if>
                            </xsl:for-each>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='org'">
                        <span class="orgs">
                            <xsl:apply-templates/>
                            <xsl:for-each select="tokenize(@ref, ' ')">
                                <sup class="entity" data-bs-toggle="modal" data-bs-target="{.}">
                                    <xsl:value-of select="position()"/>
                                </sup>
                                <xsl:if test="position() != last()">
                                    <sup class="entity">/</sup>
                                </xsl:if>
                            </xsl:for-each>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='lit_work'">
                        <span class="works">
                            <xsl:apply-templates/>
                            <xsl:for-each select="tokenize(@ref, ' ')">
                                <sup class="entity" data-bs-toggle="modal" data-bs-target="{.}">
                                    <xsl:value-of select="position()"/>
                                </sup>
                                <xsl:if test="position() != last()">
                                    <sup class="entity">/</sup>
                                </xsl:if>
                            </xsl:for-each>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='event'">
                        <span class="event">
                            <xsl:apply-templates/>
                            <xsl:for-each select="tokenize(@ref, ' ')">
                                <sup class="entity" data-bs-toggle="modal" data-bs-target="{.}">
                                    <xsl:value-of select="position()"/>
                                </sup>
                                <xsl:if test="position() != last()">
                                    <sup class="entity">/</sup>
                                </xsl:if>
                            </xsl:for-each>
                        </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@type='person'">
                        <span class="persons ent" data-bs-toggle="modal" data-bs-target="{@ref}">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='place'">
                        <span class="places ent" data-bs-toggle="modal" data-bs-target="{@ref}">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='org'">
                        <span class="orgs ent" data-bs-toggle="modal" data-bs-target="{@ref}">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='lit_work'">
                        <span class="works ent" data-bs-toggle="modal" data-bs-target="{@ref}">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:when>
                    <xsl:when test="@type='event'">
                        <span class="event ent" data-bs-toggle="modal" data-bs-target="{@ref}">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:listEvent">
        <xsl:for-each select="./tei:event">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{./tei:label}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="./tei:label"/></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tbody>
                                    <xsl:if test="./tei:ab[@type='participants']/tei:persName">
                                    <tr>
                                        <th>
                                            Participants
                                        </th>
                                        <td>
                                            <ul>
                                                <xsl:for-each select="./tei:ab[@type='participants']/tei:persName">
                                                    <li>
                                                        <a href="{@key}.html">
                                                            <xsl:value-of select="."/>
                                                        </a>
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:ab/tei:placeName[@type='located_in_place']">
                                    <tr>
                                        <th>
                                            Located in
                                        </th>
                                        <td>
                                            <a href="{./tei:ab/tei:placeName[@type='located_in_place']/@key}.html">
                                                <xsl:value-of select="./tei:ab/tei:placeName[@type='located_in_place']"/>
                                            </a>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GND']/text()">
                                        <tr>
                                            <th>
                                                GND
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GND'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='WIKIDATA']/text()">
                                        <tr>
                                            <th>
                                                Wikidata
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GEONAMES']/text()">
                                        <tr>
                                            <th>
                                                Geonames
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GEONAMES'], '/')[4]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <tr>
                                        <th>
                                            Read more
                                        </th>
                                        <td>
                                            <a href="{@xml:id}.html">
                                                Detail Page
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:listPerson">
        <xsl:for-each select="./tei:person">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{concat(./tei:persName/tei:surname, ', ', ./tei:persName/tei:forename)}" aria-hidden="true">
                 <div class="modal-dialog modal-dialog-centered">
                     <div class="modal-content">
                         <div class="modal-header">
                             <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="concat(./tei:persName/tei:surname, ', ', ./tei:persName/tei:forename)"/></h1>
                             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                         </div>
                         <div class="modal-body">
                             <table>
                                 <tbody>
                                     <xsl:if test="./tei:birth/tei:date">
                                     <tr>
                                         <th>
                                             Birth
                                         </th>
                                         <td>
                                             <xsl:value-of select="./tei:birth/tei:date/@when-iso"/>
                                         </td>
                                     </tr>
                                     </xsl:if>
                                     <xsl:if test="./tei:death/tei:date">
                                     <tr>
                                         <th>
                                             Death
                                         </th>
                                         <td>
                                             <xsl:value-of select="./tei:death/tei:date/@when-iso"/>
                                         </td>
                                     </tr>
                                     </xsl:if>
                                     <xsl:if test="./tei:idno[@type='GND']/text()">
                                         <tr>
                                             <th>
                                                 GND
                                             </th>
                                             <td>
                                                 <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                     <xsl:value-of select="tokenize(./tei:idno[@type='GND'], '/')[last()]"/>
                                                 </a>
                                             </td>
                                         </tr>
                                     </xsl:if>
                                     <xsl:if test="./tei:idno[@type='WIKIDATA']/text()">
                                         <tr>
                                             <th>
                                                 Wikidata
                                             </th>
                                             <td>
                                                 <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                     <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                                                 </a>
                                             </td>
                                         </tr>
                                     </xsl:if>
                                     <xsl:if test="./tei:idno[@type='GEONAMES']/text()">
                                         <tr>
                                             <th>
                                                 Geonames
                                             </th>
                                             <td>
                                                 <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                                     <xsl:value-of select="tokenize(./tei:idno[@type='GEONAMES'], '/')[4]"/>
                                                 </a>
                                             </td>
                                         </tr>
                                     </xsl:if>
                                     <tr>
                                         <th>
                                             Read more
                                         </th>
                                         <td>
                                             <a href="{concat(@xml:id, '.html')}">
                                                 Detail Page
                                             </a>
                                         </td>
                                     </tr>
                                 </tbody>
                             </table>
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                         </div>
                     </div>
                 </div>
             </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:listPlace">
        <xsl:for-each select="./tei:place">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{if(./tei:settlement) then(./tei:settlement/tei:placeName) else (./tei:placeName)}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="if(./tei:settlement) then(./tei:settlement/tei:placeName) else (./tei:placeName)"/></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tbody>
                                    <xsl:if test="./tei:country">
                                    <tr>
                                        <th>
                                            Country
                                        </th>
                                        <td>
                                            <xsl:value-of select="./tei:country"/>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GND']/text()">
                                        <tr>
                                            <th>
                                                GND
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GND'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='WIKIDATA']/text()">
                                        <tr>
                                            <th>
                                                Wikidata
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GEONAMES']/text()">
                                        <tr>
                                            <th>
                                                Geonames
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GEONAMES'], '/')[4]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <tr>
                                        <th>
                                            Read more
                                        </th>
                                        <td>
                                            <a href="{concat(@xml:id, '.html')}">
                                                Detail Page
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:listOrg">
        <xsl:for-each select="./tei:org">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{./tei:orgName}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="./tei:orgName"/></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tbody>
                                    <xsl:if test="./tei:idno[@type='GND']/text()">
                                        <tr>
                                            <th>
                                                GND
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GND'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='WIKIDATA']/text()">
                                        <tr>
                                            <th>
                                                Wikidata
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GEONAMES']/text()">
                                        <tr>
                                            <th>
                                                Geonames
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GEONAMES'], '/')[4]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <tr>
                                        <th>
                                            Read more
                                        </th>
                                        <td>
                                            <a href="{concat(@xml:id, '.html')}">
                                                Detail Page
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:listBibl">
        <xsl:for-each select="./tei:bibl">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{./tei:title}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="./tei:title"/></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tbody>
                                    <xsl:if test="./tei:author">
                                    <tr>
                                        <th>
                                            Author(s)
                                        </th>
                                        <td>
                                            <ul>
                                                <xsl:for-each select="./tei:author">
                                                    <li>
                                                        <a href="{@xml:id}.html">
                                                            <xsl:value-of select="./tei:persName"/>
                                                        </a>
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:date">
                                        <tr>
                                            <th>
                                                Date
                                            </th>
                                            <td>
                                                <xsl:value-of select="./tei:date/@when"/>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GND']/text()">
                                        <tr>
                                            <th>
                                                GND
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GND'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='WIKIDATA']/text()">
                                        <tr>
                                            <th>
                                                Wikidata
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GEONAMES']/text()">
                                        <tr>
                                            <th>
                                                Geonames
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GEONAMES'], '/')[4]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <tr>
                                        <th>
                                            Read more
                                        </th>
                                        <td>
                                            <a href="{concat(@xml:id, '.html')}">
                                                Detail Page
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='underline'">
                <span class="hi-underline italic">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@rend='italic'">
                <span class="italic">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:handShift">
        <xsl:variable name="hand" select="'font-family: Times New Roman, serif; font-size: 22px;'"/>
        <xsl:variable name="typed" select="'font-family: Courier New, monospace; font-size: 18px;'"/>
        <xsl:variable name="printed" select="'font-family: Arial, serif; font-size: 18px;'"/>
        <xsl:choose>
            <xsl:when test="@new = '#handwritten'">
                <span class="handShift" style="{$hand}"/>
            </xsl:when>
            <xsl:when test="@new = '#typed'">
                <span class="handShift" style="{$typed}"/>
            </xsl:when>
            <xsl:when test="@new = '#printed'">
                <span class="handShift" style="{$printed}"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br/>
        <!--<xsl:if test="not(ancestor::tei:note[@type='footnote'])">
            <xsl:if test="ancestor::tei:p[not(@hand='#stamp')]">
                <a>
                    <xsl:variable name="para" as="xs:int">
                        <xsl:number level="any" from="tei:body" count="tei:p"/>
                    </xsl:variable>
                    <xsl:variable name="lines" as="xs:int">
                        <xsl:number level="any" from="tei:body"/>
                    </xsl:variable>
                    <xsl:attribute name="href">
                        <xsl:text>#</xsl:text><xsl:value-of select="ancestor::tei:div/@xml:id"/><xsl:text>__p</xsl:text><xsl:value-of select="$para"/><xsl:text>__lb</xsl:text><xsl:value-of select="$lines"/>
                    </xsl:attribute>
                    <xsl:attribute name="name">
                        <xsl:value-of select="ancestor::tei:div/@xml:id"/><xsl:text>__p</xsl:text><xsl:value-of select="$para"/><xsl:text>__lb</xsl:text><xsl:value-of select="$lines"/>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="ancestor::tei:div/@xml:id"/><xsl:text>__p</xsl:text><xsl:value-of select="$para"/><xsl:text>__lb</xsl:text><xsl:value-of select="$lines"/>
                    </xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="($lines mod 5) = 0">
                            <xsl:attribute name="class">
                                <xsl:text>linenumbersVisible linenumbers yes-index</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="data-lbnr">
                                <xsl:value-of select="$lines"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="class">
                                <xsl:text>linenumbersTransparent linenumbers yes-index</xsl:text>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:value-of select="format-number($lines, '0000')"/>
                </a>  
            </xsl:if>
        </xsl:if>-->
        
    </xsl:template>
    
    <xsl:template match="tei:lg">
        <span style="display:block;margin: 1em 0;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:l">
        <xsl:choose>
            <xsl:when test="parent::tei:lg">
                <a>
                    <xsl:variable name="para" as="xs:int">
                        <xsl:number level="any" from="tei:div" count="tei:lg"/>
                    </xsl:variable>
                    <xsl:variable name="lines" as="xs:int">
                        <xsl:number level="any" from="tei:div" count="tei:l"/>
                    </xsl:variable>
                    <xsl:attribute name="href">
                        <xsl:text>#</xsl:text><xsl:value-of select="ancestor::tei:div/@xml:id"/><xsl:text>__lg</xsl:text><xsl:value-of select="$para"/><xsl:text>__vl</xsl:text><xsl:value-of select="$lines"/>
                    </xsl:attribute>
                    <xsl:attribute name="name">
                        <xsl:value-of select="ancestor::tei:div/@xml:id"/><xsl:text>__lg</xsl:text><xsl:value-of select="$para"/><xsl:text>__vl</xsl:text><xsl:value-of select="$lines"/>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="ancestor::tei:div/@xml:id"/><xsl:text>__lg</xsl:text><xsl:value-of select="$para"/><xsl:text>__vl</xsl:text><xsl:value-of select="$lines"/>
                    </xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="($lines mod 5) = 0">
                            <xsl:attribute name="class">
                                <xsl:text>linenumbersVisible linenumbers verseline yes-index</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="data-lbnr">
                                <xsl:value-of select="$lines"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="class">
                                <xsl:text>linenumbersTransparent linenumbers verseline yes-index</xsl:text>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:value-of select="concat('(vl) ', format-number($lines, '0000'))"/>
                </a>
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>
