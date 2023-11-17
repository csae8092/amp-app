<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>

    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget annotation options.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
            <p>Custom template to create interactive options for text annoations.</p>
        </desc>
    </doc>

    <xsl:template name="annotation-options">
        <div id="aot-navbarNavDropdown" class="navBarLetters row">
            <div class="col-md-12">
                <ul class="aot-list">
                    <li >
                        <annotation-slider opt="tf"></annotation-slider>
                    </li>
                    <li >
                        <annotation-slider opt="del"></annotation-slider>
                    </li>
                    <li >
                        <annotation-slider opt="ucl"></annotation-slider>
                    </li>
                    <li >
                        <annotation-slider opt="udl"></annotation-slider>
                    </li>
                    <li >
                        <annotation-slider opt="wsp"></annotation-slider>
                    </li>
                    <li >
                        <annotation-slider opt="int"></annotation-slider>
                    </li>
                </ul>
                <ul class="aot-list">
                    <li>
                        <annotation-slider opt="ef"></annotation-slider>
                    </li>
                    <li >
                        <annotation-slider opt="prs"></annotation-slider>
                    </li>
                    <li >
                        <annotation-slider opt="plc"></annotation-slider>
                    </li>
                    <li >
                        <annotation-slider opt="org"></annotation-slider>
                    </li>
                    <li >
                        <annotation-slider opt="wrk"></annotation-slider>
                    </li>
                    <li >
                        <annotation-slider opt="eve"></annotation-slider>
                    </li>
                </ul>
                <ul class="aot-list">
                    <li >
                        <full-size opt="ef"></full-size>
                    </li>
                    <li >
                        <image-switch opt="es"></image-switch>
                    </li>
                    <li >
                        <font-size opt="fs"></font-size>
                    </li>
                    <li >
                        <font-family opt="ff"></font-family>
                    </li>
                </ul>
            </div>
        </div>
        <script type="text/javascript">
            $('.dropdown-menu .nav-item').click(function(e) {
                e.stopPropagation();
            });
        </script>

    </xsl:template>
</xsl:stylesheet>