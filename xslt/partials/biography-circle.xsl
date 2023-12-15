<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-facsimile.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
            <p>The template "bio-circle" adds a card for biography timeline.</p> 
            <p>Bootstrap is required.</p>
        </desc>    
    </doc>
    
    <xsl:template name="bio-circle">
        <xsl:variable name="dstring" select="./tei:head/tei:date/@notAfter"/>
        <xsl:variable name="d" select="if(contains($dstring, 'T')) then(substring-before($dstring, 'T')) else($dstring)"/>
        <xsl:variable name="date-formated" select="format-date(xs:date($d), '[MNn] [D1o]', 'en', (), ())"/>
        <div class="timeline-circle text-center" data="{$date-formated}">       
            <!--<p style="font-family: FreeMono, monospace;margin-bottom:0;padding: 0 .5em">
                <!-\-<xsl:value-of select="current-grouping-key()"/> -\->             
            </p> -->
        </div>            
    </xsl:template>
</xsl:stylesheet>