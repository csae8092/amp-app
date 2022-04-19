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
                                <td style="text-align:left;width:50%;">                                                            
                                    <ul class="nav nav-tabs options-menu1">  
                                        <li>                                    
                                            <a title="diplomatic"
                                                onclick="editionClick(this)"
                                                class="nav-link btn btn-round active"
                                                id="edition-link">
                                                Edition
                                            </a>                                                                  
                                        </li>
                                        <li>                                    
                                            <a title="diplomatic"
                                                onclick="diplomaticClick(this)"
                                                class="nav-link btn btn-round"
                                                id="diplomatic-link">
                                                Diplomatic
                                            </a>                                                                  
                                        </li>                                    
                                        <li>                                    
                                            <a title="reading"
                                                onclick="readingClick(this)"
                                                class="nav-link btn btn-round"
                                                id="reading-link">
                                                Reading
                                            </a>
                                        </li>                                                                        
                                    </ul>
                                </td>
                                <td style="text-align:center;width:40%;">                                                            
                                    <ul class="nav nav-tabs options-menu2">       
                                        <li>       
                                            <label>deletions</label>
                                            <label class="switch">
                                                <input title="deletions"
                                                    type="checkbox"
                                                    onclick="deletions(this)"
                                                    id="deletions-link"/>
                                                <span id="deletions-link2" class="i-slider round"></span>                                                                        
                                            </label>                                                                    
                                            <!--<a title="deletions"
                                                onclick="deletions(this)"
                                                class="nav-link btn badge-link red"
                                                id="deletions-link">
                                                deletions
                                            </a>-->
                                        </li>                                    
                                        <li>
                                            <label>unclear</label>
                                            <label class="switch">
                                                <input title="unclear"
                                                    type="checkbox"
                                                    onclick="unclear(this)"
                                                    id="unclear-link"/>
                                                <span id="unclear-link2" class="i-slider round"></span>                                                                        
                                            </label>                                                                    
                                            <!--<a title="unclear"
                                                onclick="unclear(this)"
                                                class="nav-link btn badge-link yellow"
                                                id="unclear-link">
                                                unclear
                                            </a>-->
                                        </li> 
                                        <li>      
                                            <label>highlighting</label>
                                            <label class="switch">
                                                <input title="underline"
                                                    type="checkbox"
                                                    onclick="underline(this)"
                                                    id="underline-link"/>
                                                <span id="underline-link2" class="i-slider round"></span>                                                                        
                                            </label>                                                                    
                                            <!--<a title="underline"
                                                onclick="underline(this)"
                                                class="nav-link btn badge-link blue"
                                                id="underline-link">
                                                highlighting
                                            </a>-->
                                        </li>
                                        <li>   
                                            <label>whitespaces</label>
                                            <label class="switch">
                                                <input title="whitespaces"
                                                    type="checkbox"
                                                    onclick="space(this)"
                                                    id="whitespaces-link"/>
                                                <span id="whitespaces-link2" class="i-slider round"></span>                                                                        
                                            </label>                                                                    
                                            <!--<a title="whitespaces"
                                                onclick="space(this)"
                                                class="nav-link btn badge-link green"
                                                id="whitespaces-link">
                                                whitespaces
                                            </a>-->
                                        </li>
                                    </ul>
                                </td>
                                <td style="text-align:center;width:10%;">
                                    <a title="clear"                                        
                                        onclick="clearAll(this);"
                                        class="nav-link badge-link"
                                        id="clear-link"
                                        href="#">
                                        clear all
                                    </a>
                                </td>
                            </tr>      
                        </tbody>
                    </table>   
                </div>
            </div>                                    
        </div>
        
    </xsl:template>
</xsl:stylesheet>