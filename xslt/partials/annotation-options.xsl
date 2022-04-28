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
                                <!--<td style="text-align:left;width:20%;">                                                            
                                    <ul class="nav nav-tabs options-menu1">  
                                        <li>                                    
                                            <a title="full screen on/off"
                                                onclick="fullScreen(this)"
                                                class="nav-link btn btn-round active"
                                                id="fullscreen-link">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen active" viewBox="0 0 16 16">
                                                    <path d="M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z"/>
                                                </svg>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen-exit fade" viewBox="0 0 16 16">
                                                    <path d="M5.5 0a.5.5 0 0 1 .5.5v4A1.5 1.5 0 0 1 4.5 6h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5zm5 0a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 10 4.5v-4a.5.5 0 0 1 .5-.5zM0 10.5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 6 11.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zm10 1a1.5 1.5 0 0 1 1.5-1.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4z"/>
                                                </svg>
                                            </a>                                                                  
                                        </li>
                                        <li>                                    
                                            <a title="facsimile on/off"
                                                onclick="facsimileOnOff(this)"
                                                class="nav-link btn btn-round active"
                                                id="facsimile-link">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image active" viewBox="0 0 16 16">
                                                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
                                                </svg>
                                            </a>                                                                  
                                        </li>    
                                        <!-\-<li>                                    
                                            <a title="show original view"
                                                onclick="original(this)"
                                                class="nav-link btn btn-round"
                                                id="original-link">
                                                Original
                                            </a>
                                        </li>-\->
                                    </ul>
                                </td>-->
                                <td style="width:5%;border: 1px dashed #dedede;">
                                    <a title="full screen on/off"
                                        onclick="fullScreen(this)"
                                        class="nav-link btn btn-round active"
                                        id="fullscreen-link">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen active" viewBox="0 0 16 16">
                                            <path d="M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fullscreen-exit fade" viewBox="0 0 16 16">
                                            <path d="M5.5 0a.5.5 0 0 1 .5.5v4A1.5 1.5 0 0 1 4.5 6h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5zm5 0a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 10 4.5v-4a.5.5 0 0 1 .5-.5zM0 10.5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 6 11.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zm10 1a1.5 1.5 0 0 1 1.5-1.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4z"/>
                                        </svg>
                                    </a>
                                </td>
                                <td style="text-align:left;width:5%;border: 1px dashed #dedede;border-right: 2px dashed #dedede;"> 
                                    <a title="facsimile on/off"
                                        onclick="facsimileOnOff(this)"
                                        class="nav-link btn btn-round active"
                                        id="facsimile-link">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image active" viewBox="0 0 16 16">
                                            <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                            <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
                                        </svg>
                                    </a>
                                </td>
                                <td style="text-align:right;width:40%;border: 1px dashed #dedede;">   
                                    <label>Text features</label>
                                    <label class="switch">
                                        <input title="text features"
                                            type="checkbox"
                                            onclick="textFeaturesAll(this)"
                                            id="text-features-link"/>
                                        <span id="text-features-link2" class="i-slider round"></span>                                                                        
                                    </label>  
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;">     
                                    <label>Deleted</label>
                                    <label class="switch">
                                        <input title="deleted"
                                            type="checkbox"
                                            onclick="textFeatures(this, null)"
                                            id="deleted-link"/>
                                        <span id="deleted-link2" class="i-slider round"></span>                                                                        
                                    </label>   
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;">     
                                    <label>Unclear</label>
                                    <label class="switch">
                                        <input title="unclear"
                                            type="checkbox"
                                            onclick="textFeatures(this, null)"
                                            id="unclear-link"/>
                                        <span id="unclear-link2" class="i-slider round"></span>                                                                        
                                    </label>  
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;">     
                                    <label>Underlined</label>
                                    <label class="switch">
                                        <input title="underlined"
                                            type="checkbox"
                                            onclick="textFeatures(this, null)"
                                            id="underline-link"/>
                                        <span id="underline-link2" class="i-slider round"></span>                                                                        
                                    </label>      
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;border-right: 1px dashed #dedede;">  
                                    <label>Spaced</label>
                                    <label class="switch">
                                        <input title="spaced"
                                            type="checkbox"
                                            onclick="textFeatures(this, null)"
                                            id="whitespaces-link"/>
                                        <span id="whitespaces-link2" class="i-slider round"></span>                                                                        
                                    </label>    
                                </td>
                                <!--<td style="text-align:center;width:80%;">  
                                    <ul class="nav nav-tabs options-menu2">     
                                        <li style="border-right: 2px dotted #f1f1f1;">       
                                            <label>Text features</label>
                                            <label class="switch">
                                                <input title="text features"
                                                    type="checkbox"
                                                    onclick="textFeaturesAll(this)"
                                                    id="text-features-link"/>
                                                <span id="text-features-link2" class="i-slider round"></span>                                                                        
                                            </label>                                                                    
                                        </li>
                                        <li>       
                                            <label>Deleted</label>
                                            <label class="switch">
                                                <input title="deleted"
                                                    type="checkbox"
                                                    onclick="textFeatures(this, null)"
                                                    id="deleted-link"/>
                                                <span id="deleted-link2" class="i-slider round"></span>                                                                        
                                            </label>                                                                    
                                        </li>                                    
                                        <li>
                                            <label>Unclear</label>
                                            <label class="switch">
                                                <input title="unclear"
                                                    type="checkbox"
                                                    onclick="textFeatures(this, null)"
                                                    id="unclear-link"/>
                                                <span id="unclear-link2" class="i-slider round"></span>                                                                        
                                            </label>                                                                    
                                        </li> 
                                        <li>      
                                            <label>Underlined</label>
                                            <label class="switch">
                                                <input title="underlined"
                                                    type="checkbox"
                                                    onclick="textFeatures(this, null)"
                                                    id="underline-link"/>
                                                <span id="underline-link2" class="i-slider round"></span>                                                                        
                                            </label>                                                                    
                                        </li>
                                        <li>   
                                            <label>Spaced</label>
                                            <label class="switch">
                                                <input title="spaced"
                                                    type="checkbox"
                                                    onclick="textFeatures(this, null)"
                                                    id="whitespaces-link"/>
                                                <span id="whitespaces-link2" class="i-slider round"></span>                                                                        
                                            </label>                                                                    
                                        </li>
                                    </ul>
                                </td>-->                                
                            </tr>      
                        </tbody>
                    </table>   
                </div>
            </div>                                    
        </div>
        
    </xsl:template>
</xsl:stylesheet>