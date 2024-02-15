<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl xs"
    version="2.0">
    <xsl:template match="/" name="html_head">
        <xsl:param name="html_title">Auden Musulin Papers</xsl:param>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-title" content="{$html_title}" />
        <link rel="profile" href="http://gmpg.org/xfn/11"></link>
        <link rel="shortcut icon" href="images/Auden_Musulin_Papers_Logo_rechteckig_favicon_96.png" sizes="96x70"/>
        <link rel="icon" type="image/png" href="images/Auden_Musulin_Papers_Logo_rechteckig_favicon_32.png" sizes="32x23"/>
        <link rel="icon" type="image/png" href="images/Auden_Musulin_Papers_Logo_rechteckig_favicon_96.png" sizes="96x70"/>
        <link rel="apple-touch-icon" sizes="180x180" href="images/Auden_Musulin_Papers_Logo_rechteckig_favicon_180.png"/>
        <meta name="msapplication-TileColor" content="#ffffff"/>
        <meta name="msapplication-TileImage" content="images/Auden_Musulin_Papers_Logo_rechteckig_favicon_144.png"/>
        <title><xsl:value-of select="$html_title"/></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></link>
        <link rel="stylesheet" id="fundament-styles"  href="dist/fundament/css/fundament.min.css" type="text/css"></link>
        <link rel="stylesheet" href="css/style.css" type="text/css"></link>
        <link rel="stylesheet" href="css/micro-editor.css" type="text/css"></link>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
        <!--<script type="text/javascript" src="dist/fundament/vendor/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="dist/fundament/js/fundament.min.js"></script>-->
        <script type="text/javascript" src="js/cookie-consent.js"></script>
    </xsl:template>
</xsl:stylesheet>
