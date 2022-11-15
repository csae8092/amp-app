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

    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@type='main'][1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>                
                <meta name="docTitle" class="staticSearch_docTitle">
                    <xsl:attribute name="content">
                        <xsl:value-of select="$doc_title"/>
                    </xsl:attribute>
                </meta>
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">  
                        
                        <xsl:apply-templates select="//tei:body"/>

                    </div><!-- .container-fluid -->
                    <xsl:call-template name="html_footer"/>
                </div><!-- .site -->
                <script>
                    $(document).ready(function () {
                        createDataTable('listplace');
                    });
                    $(document).ready(function () {
                        createDataTable('listperson');
                    });
                </script>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:listPerson">
         <table class="table" id="listperson">
             <thead>
                 <tr>
                     <th>
                         Name
                     </th>
                     <th>
                         GND
                     </th>
                     <th>
                         Read more
                     </th>
                 </tr>
             </thead>
             <tbody>
                 <xsl:for-each select="./tei:person">
                    <tr>
                        <td>
                            <xsl:value-of select="concat(./tei:persName/tei:surname, ', ', ./tei:persName/tei:forename)"/>
                        </td>
                        <td>
                            <a href="{./tei:idno[@type='GND']}" target="_blank">
                                <xsl:value-of select="./tei:idno[@type='GND']"/>
                            </a>
                        </td>
                        <td>
                            <a href="{concat(@xml:id, '.html')}">
                                Detail Page
                            </a>
                        </td>
                    </tr>
                 </xsl:for-each>
             </tbody>
         </table>
    </xsl:template>
    <xsl:template match="tei:listPlace">
        
            <table class="table" id="listplace">
                <thead>
                    <tr>
                        <th>
                            Name
                        </th>
                        <th>
                            Geonames ID
                        </th>
                        <th>
                            Read more
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="./tei:place">
                        <tr>
                            <td>
                                <xsl:value-of select="./tei:placeName"/>
                            </td>
                            <td>
                                <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                    <xsl:value-of select="./tei:idno[@type='GEONAMES']"/>
                                </a>
                            </td>
                            <td>
                                <a href="{concat(@xml:id, '.html')}">
                                    Detail Page
                                </a>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        
    </xsl:template>
    
</xsl:stylesheet>
