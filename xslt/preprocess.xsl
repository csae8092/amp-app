<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!--<xsl:template match="tei:p[ancestor::tei:body]">
        <p xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:for-each select="@*">
                <xsl:attribute name="{name()}">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
            <lb xmlns="http://www.tei-c.org/ns/1.0"/>
            <xsl:apply-templates/>
        </p>
    </xsl:template>-->
    <xsl:template match="tei:editor">
        <xsl:copy>
            <name ref="https://orcid.org/0000-0002-2915-5888"
                xml:id="smayer">Mayer, Sandra</name>
            <name ref="https://orcid.org/0000-0002-3997-5193"
                xml:id="tfruewirth">Frühwirth, Timo</name>
            <name ref="https://orcid.org/0000-0002-0914-9245"
                xml:id="dgrigoriou">Grigoriou, Dimitra</name>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="tei:respStmt">
        <xsl:copy>
            <resp>Transcription and commentary</resp>
            <name ref="https://orcid.org/0000-0002-2915-5888"
                xml:id="smayer">Mayer, Sandra</name>
            <name ref="https://orcid.org/0000-0002-3997-5193"
                xml:id="tfruewirth">Frühwirth, Timo</name>
            <name ref="https://orcid.org/0000-0002-0914-9245"
                xml:id="dgrigoriou">Grigoriou, Dimitra</name>
        </xsl:copy>
        <respStmt>
            <resp>TEI Schema, ODD/RNG</resp>
            <name ref="https://orcid.org/0000-0002-9575-9372"
                xml:id="pandorfer">Andorfer, Peter</name>
            <name ref="https://orcid.org/0000-0002-0636-4476"
                xml:id="delsner">Elsner, Daniel</name>
        </respStmt>
    </xsl:template>
    
</xsl:stylesheet>