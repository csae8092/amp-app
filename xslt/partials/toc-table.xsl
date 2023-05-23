<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-facsimile.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
            <p>The template "toc-table" generates a table for table of contents of a collection.</p> 
            <p>Bootstrap is required.</p>
        </desc>    
    </doc>
    
    <xsl:template name="toc-table">
        <xsl:param name="category"></xsl:param>
        <xsl:param name="max_date"></xsl:param>
        <xsl:param name="low_date"></xsl:param>
        <xsl:variable name="cat-norm" select="if($category = 'correspondence-cvl') then(substring-before($category, '-cvl')) else($category)"/>
        <table class="table table-striped display" id="tocTable" style="width:100%">
            <thead>
                <tr>
                    <th scope="col" style="width: 18%;">Title</th>
                    <th scope="col">Date</th>
                    <th scope="col">Latest Revisions Data</th>
                    <th scope="col" style="width: 18%;">Latest Revisions Content</th>
                    <th scope="col"># of Facsimiles</th>
                    <th scope="col">Document Type</th>
                    <th scope="col">Document Hand</th>
                    <th scope="col">Entities</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="collection(concat('../../data/editions/', $cat-norm))//tei:TEI">
                    <xsl:sort select="//tei:origDate/@notBefore"/>
                    <xsl:variable name="doc_date" 
                        as="xs:date" 
                        select="xs:date(if(//tei:origDate/@notBefore) then(//tei:origDate/@notBefore) else ('1996-12-31'))"/>
                    <xsl:if test="$doc_date lt $max_date and $doc_date gt $low_date and $category != 'correspondence-cvl'">
                        <xsl:variable name="full_path">
                            <xsl:value-of select="document-uri(/)"/>
                        </xsl:variable>
                     <!--<tr>
                             <td>                                        
                                 <a>
                                     <xsl:attribute name="href">                                                
                                         <xsl:value-of select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"/>
                                     </xsl:attribute>
                                     <xsl:value-of select=".//tei:title[@level='a'][1]/text()"/>
                                 </a>
                             </td>
                             <td>
                                 <xsl:value-of select="data(.//tei:origDate/@when-iso)"/>
                             </td>  
                         </tr>-->
                        <xsl:for-each select=".//tei:revisionDesc/tei:change[position()=last()]/self::tei:change">                                                
                            <tr>
                                <td>
                                    <a>
                                        <xsl:attribute name="href">                                                
                                            <xsl:value-of select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="//tei:title[@level='a'][1]/text()"/>
                                    </a>
                                </td>
                                <td><xsl:value-of select="data(//tei:origDate/@notAfter)"/></td>
                                <td>
                                    <ul>
                                        <li><xsl:value-of select="concat(@when/name(), ': ' ,@when)"/></li>
                                        <li><xsl:value-of select="concat(@who/name(), ': ', @who)"/></li>
                                    </ul>                                                                                                                                            
                                </td>
                                <td>
                                    <xsl:apply-templates/>                                                                                             
                                </td>
                                <td>
                                    <xsl:value-of select="count(//tei:graphic)"/>                                                                                             
                                </td>  
                                <td>
                                    <xsl:value-of select="//tei:text/@type"/>                                                                                           
                                </td>  
                                <td>
                                    <xsl:value-of select="//tei:text/@hand"/>                                                                                             
                                </td>
                                <td>
                                    <ul>
                                        <xsl:if test="count(//tei:listPlace[parent::tei:back]/tei:place) > 0">
                                            <li>
                                                <xsl:value-of select="count(//tei:listPlace[parent::tei:back]/tei:place)"/><xsl:text> Place(s)</xsl:text>
                                            </li>
                                        </xsl:if>
                                        <xsl:if test="count(//tei:listPerson[parent::tei:back]/tei:person) > 0">
                                            <li>
                                                <xsl:value-of select="count(//tei:listPerson[parent::tei:back]/tei:person)"/><xsl:text> Person(s)</xsl:text>
                                            </li>
                                        </xsl:if>
                                        <xsl:if test="count(//tei:listOrg[parent::tei:back]/tei:org) > 0">
                                            <li>
                                                <xsl:value-of select="count(//tei:listOrg[parent::tei:back]/tei:org)"/><xsl:text> Organisation(s)</xsl:text>
                                            </li>
                                        </xsl:if>
                                        <xsl:if test="count(//tei:listBibl[parent::tei:back]/tei:bibl) > 0">
                                            <li>
                                                <xsl:value-of select="count(//tei:listBibl[parent::tei:back]/tei:bibl)"/><xsl:text> Work(s)</xsl:text>
                                            </li>
                                        </xsl:if>
                                        <xsl:if test="count(//tei:listEvent[parent::tei:back]/tei:event) > 0">
                                            <li>
                                                <xsl:value-of select="count(//tei:listEvent[parent::tei:back]/tei:event)"/><xsl:text> Event(s)</xsl:text>
                                            </li>
                                        </xsl:if>
                                        
                                    </ul>
                                </td> 
                            </tr>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="$doc_date = $max_date or $doc_date = $low_date and $category = 'correspondence-cvl'">
                        <xsl:variable name="full_path">
                            <xsl:value-of select="document-uri(/)"/>
                        </xsl:variable>
                        <!--<tr>
                             <td>                                        
                                 <a>
                                     <xsl:attribute name="href">                                                
                                         <xsl:value-of select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"/>
                                     </xsl:attribute>
                                     <xsl:value-of select=".//tei:title[@level='a'][1]/text()"/>
                                 </a>
                             </td>
                             <td>
                                 <xsl:value-of select="data(.//tei:origDate/@when-iso)"/>
                             </td>  
                         </tr>-->
                        <xsl:for-each select=".//tei:revisionDesc/tei:change[position()=last()]/self::tei:change">                                                
                            <tr>
                                <td>
                                    <a>
                                        <xsl:attribute name="href">                                                
                                            <xsl:value-of select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="//tei:title[@level='a'][1]/text()"/>
                                    </a>
                                </td>
                                <td><xsl:value-of select="data(//tei:origDate/@notAfter)"/></td>
                                <td>
                                    <ul>
                                        <li><xsl:value-of select="concat(@when/name(), ': ' ,@when)"/></li>
                                        <li><xsl:value-of select="concat(@who/name(), ': ', @who)"/></li>
                                    </ul>                                                                                                                                            
                                </td>
                                <td>
                                    <xsl:apply-templates/>                                                                                             
                                </td>
                                <td>
                                    <xsl:value-of select="count(//tei:graphic)"/>                                                                                             
                                </td>  
                                <td>
                                    <xsl:value-of select="//tei:text/@type"/>                                                                                           
                                </td>  
                                <td>
                                    <xsl:value-of select="//tei:text/@hand"/>                                                                                             
                                </td>
                                <td>
                                    <ul>
                                        <xsl:if test="count(//tei:listPlace[parent::tei:back]/tei:place) > 0">
                                            <li>
                                                <xsl:value-of select="count(//tei:listPlace[parent::tei:back]/tei:place)"/><xsl:text> Place(s)</xsl:text>
                                            </li>
                                        </xsl:if>
                                        <xsl:if test="count(//tei:listPerson[parent::tei:back]/tei:person) > 0">
                                            <li>
                                                <xsl:value-of select="count(//tei:listPerson[parent::tei:back]/tei:person)"/><xsl:text> Person(s)</xsl:text>
                                            </li>
                                        </xsl:if>
                                        <xsl:if test="count(//tei:listOrg[parent::tei:back]/tei:org) > 0">
                                            <li>
                                                <xsl:value-of select="count(//tei:listOrg[parent::tei:back]/tei:org)"/><xsl:text> Organisation(s)</xsl:text>
                                            </li>
                                        </xsl:if>
                                        <xsl:if test="count(//tei:listBibl[parent::tei:back]/tei:bibl) > 0">
                                            <li>
                                                <xsl:value-of select="count(//tei:listBibl[parent::tei:back]/tei:bibl)"/><xsl:text> Work(s)</xsl:text>
                                            </li>
                                        </xsl:if>
                                        <xsl:if test="count(//tei:listEvent[parent::tei:back]/tei:event) > 0">
                                            <li>
                                                <xsl:value-of select="count(//tei:listEvent[parent::tei:back]/tei:event)"/><xsl:text> Event(s)</xsl:text>
                                            </li>
                                        </xsl:if>
                                        
                                    </ul>
                                </td> 
                            </tr>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>