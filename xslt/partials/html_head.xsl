<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xsl xs" version="2.0">
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
        <title>
            <xsl:value-of select="$html_title"/>
        </title>
        <link href="js/vendor/bootstrap-bin-5.3.3/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="js/vendor/fontawesome-bin-5.15.4/all.min.css"></link>
        <link rel="stylesheet" href="js/vendor/fundament-bin-1/fundament.min.css"></link>
        <link rel="stylesheet" href="css/style.css" type="text/css"></link>
        <link rel="stylesheet" href="css/micro-editor.css" type="text/css"></link>
        <script src="js/vendor/jquery-bin-3.6.0/jquery.min.js"></script>
        <script src="js/vendor/bootstrap-bin-5.3.3/js/bootstrap.bundle.min.js"></script>
        <script>
        var _paq = window._paq = window._paq || [];
        /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
        _paq.push(['trackPageView']);
        _paq.push(['enableLinkTracking']);
        (function() {
            var u="https://matomo.acdh.oeaw.ac.at/";
            _paq.push(['setTrackerUrl', u+'matomo.php']);
            _paq.push(['setSiteId', '207']);
            var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
            g.async=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
        })();
        </script>
    </xsl:template>
</xsl:stylesheet>
