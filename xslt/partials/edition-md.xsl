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
        <div class="row hide-reading"> 
            <div class="col-md-12">
                <h5 class="card-text" style="text-align:left;">
                    <xsl:value-of select="$doc_title"/>                        
                </h5>                                                                               
                <div class="about-text-hidden fade">
                    <table class="table" style="width:50%;max-width:50%;">
                        <tbody>
                            <tr>
                                <th>PID</th>
                                <td>
                                    <a target="_blank"
                                        title="archived source file"
                                        href="{//tei:publicationStmt/tei:idno[@type='handle']}">
                                        <xsl:value-of select="//tei:publicationStmt/tei:idno[@type='handle']"/>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <th>Author</th>
                                <td><xsl:value-of select="//tei:titleStmt/tei:author"/></td>
                            </tr>
                            <tr>
                                <th>Editor(s)</th>
                                <td>
                                    <ul style="list-style:none; padding-left:0;margin-bottom:0;">
                                        <xsl:for-each select="//tei:titleStmt/tei:editor/tei:name">
                                            <li>
                                                <xsl:value-of select="."/>
                                            </li>
                                        </xsl:for-each>                                                               
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th>Publisher</th>
                                <td>
                                    <xsl:value-of select="concat(
                                        //tei:publicationStmt/tei:publisher,
                                        ', ',
                                        //tei:publicationStmt/tei:pubPlace,
                                        ' ' ,
                                        //tei:publicationStmt/tei:date)"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Download</th>
                                <td>
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
                                </td>                                                        
                            </tr>
                            <tr>
                                <th>IIIF Endpoint(s)</th>
                                <td>
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
                                </td>
                            </tr>
                            <tr>                                                                                                       
                                <th>Cite this Source (MLA 9th Edition)</th>
                                <td>
                                    <xsl:value-of select="concat(
                                        'Andorfer Peter, ', 
                                        replace(//tei:editor/tei:name[1], ',', ''),
                                        ', ', 
                                        replace(//tei:editor/tei:name[2], ',', ''),
                                        ', Mendelson Edward, Neundlinger Helmut and Stoxreiter Daniel')"/>     
                                    <xsl:text>. Auden Musulin Papers: A Digital Edition of W. H. Auden's Letters to Stella Musulin. Austrian Centre for Digital Humanities and Cultural Heritage, Austrian Academy of Sciences, 2022, </xsl:text>
                                    <a href="https://amp.acdh.oeaw.ac.at" id="citation-url">
                                        amp.acdh.oeaw.ac.at
                                    </a><xsl:text>.</xsl:text>                                                         
                                </td>                                                                                                               
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div style="margin-bottom:1em;">
                    <a style="font-style:italic;cursor:pointer;" id="show-text">show metadata</a>
                </div>
                <script type="text/javascript">
                    $('#show-text').click(function () {
                        if ($('.about-text-hidden').hasClass('fade') == true) {
                            $('.about-text-hidden').removeClass('fade')
                            .addClass('active');
                            $(this).html('hide metadata');
                        } else {
                            $('.about-text-hidden').removeClass('active')
                            .addClass('fade');
                            $(this).html('show metadata');
                        }  
                    });
                </script>
            </div>
        </div>
        
    </xsl:template>
</xsl:stylesheet>