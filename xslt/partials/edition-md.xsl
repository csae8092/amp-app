<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:_="urn:acdh" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget edition-md</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
        </desc>
    </doc>
    
    <xsl:template name="edition-md">
        <xsl:param name="doc_title"/>
        <div class="row"> 
            <div class="col-md-12">
                <div>
                    
                        <dl>
                          
                                <dt>PID</dt>
                                <dd>
                                    <a target="_blank"
                                        title="archived source file"
                                        href="{//tei:publicationStmt/tei:idno[@type='handle']}">
                                        <xsl:value-of select="//tei:publicationStmt/tei:idno[@type='handle']"/>
                                    </a>
                                </dd>
                            
                       
                                <dt>Author</dt>
                                <dd><xsl:value-of select="//tei:titleStmt/tei:author"/></dd>
                            
                       
                                <dt>Editor(s)</dt>
                                <dd>
                                    <ul style="list-style:none; padding-left:0;margin-bottom:0;">
                                        <xsl:for-each select="//tei:titleStmt/tei:editor/tei:name">
                                            <li>
                                                <xsl:value-of select="."/>
                                            </li>
                                        </xsl:for-each>                                                               
                                    </ul>
                                </dd>
                            
                         
                                <dt>Publisher</dt>
                                <dd>
                                    <xsl:value-of select="concat(
                                        //tei:publicationStmt/tei:publisher,
                                        ', ',
                                        //tei:publicationStmt/tei:pubPlace,
                                        ' ' ,
                                        //tei:publicationStmt/tei:date)"/>
                                </dd>
                            
                         
                                <dt>Download</dt>
                                <dd>
                                    <ul style="list-style:none;padding-left:0;margin-bottom:0;">
                                        <li style="display:inline;margin-right:1em;">
                                            <a href="{concat('https://id.acdh.oeaw.ac.at/auden-musulin-papers/', //tei:TEI/@xml:id, '?format=raw')}" title="TEI">
                                                <img alt="TEI Logo" src="images/TEI_Logo_36px.png"/>
                                            </a>
                                        </li>
                                        <li style="display:inline;margin-right:1em;">
                                            <a href="{concat('https://id.acdh.oeaw.ac.at/auden-musulin-papers/', //tei:TEI/@xml:id, '?format=metadata')}" title="RDF metadata">
                                                <img border="0" src="http://www.w3.org/RDF/icons/rdf_w3c_icon.48"
                                                    alt="RDF metadata"/>
                                            </a>
                                        </li>
                                    </ul>                                                            
                                </dd>                                                        
                            
                            
                                <dt>IIIF Endpoint(s)</dt>
                                <dd>
                                    <ul style="list-style:none;margin-bottom:0;padding-left:0;">
                                        <xsl:variable name="iiif-ext" select="'.jpg?format=iiif&amp;param=info.json'"/> 
                                        <xsl:variable name="iiif-domain" select="'https://id.acdh.oeaw.ac.at/auden-musulin-papers/'"/>                                                            
                                        <xsl:for-each select="//tei:pb">
                                            <xsl:variable name="facs_item" select="tokenize(@facs, '/')[5]"/>
                                            <li>
                                                <a href="{concat($iiif-domain, $facs_item, $iiif-ext)}">
                                                    <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
                                                </a>
                                            </li>                                                                    
                                        </xsl:for-each>   
                                    </ul>                                                                                                                     
                                </dd>
                            
                                                                                                                                 
                                <dt>Cite this Source (MLA 9th Edition)</dt>
                                <dd style="text-align:left !important;">
                                    <xsl:value-of select="concat(
                                        'Andorfer Peter, ',
                                        'Elsner Daniel, ',
                                        replace(//tei:editor/tei:name[2], ',', ''),
                                        ', Grigoriou Dimitra, ',
                                        replace(//tei:editor/tei:name[1], ',', ''),
                                        ', Mendelson Edward and Neundlinger Helmut')"/>
                                    <xsl:text>. Auden Musulin Papers: A Digital Edition of W. H. Auden's Letters to Stella Musulin. Austrian Centre for Digital Humanities and Cultural Heritage, Austrian Academy of Sciences, 2022, </xsl:text>
                                    <a href="https://amp.acdh.oeaw.ac.at" id="citation-url">
                                        amp.acdh.oeaw.ac.at
                                    </a><xsl:text>.</xsl:text>                                                         
                                </dd>                                                                                                               
                            
                        </dl>
                    
                </div>
                
            </div>
        </div>
        
    </xsl:template>
</xsl:stylesheet>