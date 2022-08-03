<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
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
        <div class="row">
            <div class="col-md-12">
                <div class="navBarLetters text-center">                                            
                    <table class="table" style="margin-bottom:0;">
                        <tbody>           
                            <tr>         
                                <td style="width:5%;border: 1px dashed #dedede;">
                                    <full-size opt="edition-fullsize" data-target="conf_fullsize" data-path="js/json"></full-size> 
                                </td>
                                <td style="text-align:center;width:5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;"> 
                                    <image-switch opt="edition-switch" data-target="conf_image_switch" data-path="js/json"></image-switch>
                                </td>
                                <td style="text-align:left;width:10%;border: 1px dashed #dedede;border-right: 2px dashed #dedede;"> 
                                    <font-size opt="select-fontsize" data-target="conf_fontsize" data-path="js/json"></font-size> 
                                </td>
                                <td style="text-align:left;width:15%;border: 1px dashed #dedede;border-right: 2px dashed #dedede;">
                                    <font-family opt="select-font" data-target="conf_font_family" data-path="js/json"></font-family> 
                                </td>                                                                
                                <td style="text-align:right;width:15%;border: 1px dashed #dedede;">   
                                    <annotation-slider opt="text-features" data-target="conf_annotation_slider" data-path="js/json"></annotation-slider> 
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;">     
                                    <annotation-slider opt="deleted" data-target="conf_annotation_slider" data-path="js/json"></annotation-slider>  
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;">   
                                    <annotation-slider opt="unclear" data-target="conf_annotation_slider" data-path="js/json"></annotation-slider>  
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;">     
                                    <annotation-slider opt="underlined" data-target="conf_annotation_slider" data-path="js/json"></annotation-slider>      
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;border-right: 1px dashed #dedede;">  
                                    <annotation-slider opt="whitespace" data-target="conf_annotation_slider" data-path="js/json"></annotation-slider>   
                                </td>
                            </tr>      
                        </tbody>
                    </table>   
                </div>
            </div>
        </div>
        
    </xsl:template>
</xsl:stylesheet>