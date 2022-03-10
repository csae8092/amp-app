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
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jq-3.3.1/jszip-2.5.0/dt-1.11.0/b-2.0.0/b-html5-2.0.0/cr-1.5.4/r-2.2.9/sp-1.4.0/datatables.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></link>
        <link rel="stylesheet" id="fundament-styles"  href="dist/fundament/css/fundament.min.css" type="text/css"></link>
        <link rel="stylesheet" href="js/timelinejs/css/timeline.min.css" />
        <link rel="stylesheet" href="css/style.css" type="text/css"></link>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
        <script type="text/javascript" src="dist/fundament/vendor/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="dist/fundament/js/fundament.min.js"></script>
        <script src="https://unpkg.com/arche-api@1.2.0/lib/arche-api.min.js"/>
        <!--<script src="js/arche-api.min.js"/>--> 
        <script type="text/javascript" src="js/resize.js"></script>
        <!-- Matomo -->
        <script>
          var _paq = window._paq = window._paq || [];
          /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
          _paq.push(['trackPageView']);
          _paq.push(['enableLinkTracking']);
          (function() {
            var u="https://matomo.acdh.oeaw.ac.at/";
            _paq.push(['setTrackerUrl', u+'piwik.php']);
            _paq.push(['setSiteId', '207']);
            var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
            g.async=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
          })();
        </script>
        <!-- End Matomo Code -->

    </xsl:template>
</xsl:stylesheet>
