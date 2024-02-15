<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:template match="/" name="html_footer">
        <footer class="footer mt-auto pt-3 bg hide-reading">
            <div class="wrapper" id="wrapper-footer-full">
                <div class="container" id="footer-full-content" tabindex="-1">
                    <div class="footer-separator">
                        CONTACT
                    </div>
                    <div class="row">
                        <div class="footer-widget col-lg-1 col-md-2 col-sm-2 col-xs-6  ml-auto text-center ">
                            <div class="textwidget custom-html-widget py-2">
                                <a href="https://www.oeaw.ac.at/acdh"><img src="https://fundament.acdh.oeaw.ac.at/common-assets/images/acdh_logo.svg" class="image" alt="ACDH Logo" style="max-width: 100%; height: auto;" title="ACDH Logo"/></a>
                            </div>
                        </div>
                        <!-- .footer-widget -->
                        <div class="footer-widget col-lg-4 col-md-3 col-sm-3">
                            <div class="textwidget custom-html-widget">
                                <p class="py-2">
                                    ACDH-CH OEAW
                                    <br/>
                                    Austrian Centre for Digital Humanities and Cultural Heritage
                                    <br/>
                                    Austrian Academy of Sciences
                                </p>
                                <p class="py-2">
                                    Bäckerstraße 13
                                    <br/>
                                    1010 Vienna
                                </p>
                                <p class="py-2">
                                    T: +43 1 51581-2200
                                    <br/>
                                    E: <a href="mailto:acdh-ch-helpdesk@oeaw.ac.at">acdh-ch-helpdesk@oeaw.ac.at</a>
                                </p>
                            </div>
                            <div class="textwidget custom-html-widget">
                                <a title="CC-BY 4.0" target="_blank" href="https://creativecommons.org/licenses/by/4.0">
                                    <img style="max-width: 50%; margin-top: 2em;" alt="CC-BY 4.0 Free Cultural Approved" src="images/by.png"></img>
                                </a>
                            </div>
                        </div>
                        <div class="footer-widget col-lg-4 col-md-3 col-sm-4">
                            
                            <div class="container">
                                <div class="row align-items-center">
                                <!--<div class="col-lg-6 col-md-6 col-sm-12">
                                        <div class="card flex-md-row mb-4 align-items-center">
                                            <a href="https://acdh.oeaw.ac.at"><img class="card-img-right flex-auto d-md-block" src="https://fundament.acdh.oeaw.ac.at/common-assets/images/acdh_logo.svg" alt="ACDH Logo" style="max-width: 60px; height: auto;" title="ACDH Logo"/></a>
                                            <div class="card-body d-flex flex-column align-items-start">
                                                <p class="card-text mb-auto">Austrian Center for Digital Humanities and Cultural Heritage</p>
                                            </div>
                                        </div>
                                    </div>-->
                                    <div class="col-lg-12 col-md-12 col-sm-12 py-2">
                                        <div class="flex-md-row mb-4 align-items-center">
                                            <h6 class="font-weight-bold">PROJECT PARTNERS</h6>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 py-2">
                                        <div class="flex-md-row mb-4 align-items-center" style="margin-bottom:.5em!important;">
                                            <a href="https://www.fwf.ac.at/en/"><img class="card-img-right flex-auto d-md-block" src="https://www.fwf.ac.at/fileadmin/Website/Logos/FWF_Logo.png" alt="FWF Der Wissenschaftsfond Logo" style="max-width: 250px; height: auto; margin-top:1em;" title="FWF Der Wissenschaftsfond" /></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 py-2">
                                        <div class="flex-md-row mb-4 align-items-center" style="margin-bottom:.5em!important; margin-left: -1em;">
                                            <a href="https://www.univie.ac.at/en/"><img class="card-img-right flex-auto d-md-block" src="https://communications.univie.ac.at/fileadmin/user_upload/d_oeffentlichkeitsarbeit/Logos/2016-02/Uni_Logo_2016.jpg" alt="Universität Wien Logo" style="max-width: 250px; height: auto; vertical-align: middle;" title="Universität Wien" /></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 py-2">
                                        <div class="flex-md-row mb-4 align-items-center">
                                            <a href="https://www.donau-uni.ac.at/en.html"><img class="card-img-right flex-auto d-md-block" src="https://upload.wikimedia.org/wikipedia/de/2/2f/Donau_Universit%C3%A4t_Krems.svg" alt="Donau Universität Krems Logo" style="max-width: 120px; height: auto; vertical-align: middle;" title="Donau Universität Krems " /></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 py-2">
                                        <div class="flex-md-row mb-4 align-items-center">
                                            <a href="https://cvl.tuwien.ac.at/"><img class="card-img-right flex-auto d-md-block" src="https://www.oeaw.ac.at/fileadmin/Institute/ACDH/img/logo/cvl_logo.png" alt="Computer Vision Lab Logo" style="max-width: 170px; height: auto; padding: .5em;" title="Computer Vision Lab"/></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- .footer-widget -->                       
                        <div class="footer-widget col-lg-3 col-md-4 col-sm-3 ml-auto">
                            <div class="row gy-2">
                                <div class="textwidget custom-html-widget">
                                    <h6 class="py-2 font-weight-bold">HELPDESK</h6>
                                    <p class="py-2">ACDH-CH runs a helpdesk offering advice for questions related to various digital humanities topics.</p>
                                    <p class="py-2">
                                        <a class="helpdesk-button" href="mailto:acdh-ch-helpdesk@oeaw.ac.at">ASK US!</a>
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="custom-html-widget" style="margin-left:0 !important;">
                                    <div class="row">
                                        <div class="textwidget custom-html-widget">
                                            <p style="margin-bottom:0 !important;">Social: </p>                                    
                                        </div>
                                    </div>                                
                                    <div class="row py-2">                         
                                        <div class="custom-html-widget col-4">                                    
                                            <a id="github-logo" title="Auden Musulin on GitHub" href="https://github.com/Auden-Musulin-Papers" class="nav-link" target="_blank">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"><path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-4.466 19.59c-.405.078-.534-.171-.534-.384v-2.195c0-.747-.262-1.233-.55-1.481 1.782-.198 3.654-.875 3.654-3.947 0-.874-.312-1.588-.823-2.147.082-.202.356-1.016-.079-2.117 0 0-.671-.215-2.198.82-.64-.18-1.324-.267-2.004-.271-.68.003-1.364.091-2.003.269-1.528-1.035-2.2-.82-2.2-.82-.434 1.102-.16 1.915-.077 2.118-.512.56-.824 1.273-.824 2.147 0 3.064 1.867 3.751 3.645 3.954-.229.2-.436.552-.508 1.07-.457.204-1.614.557-2.328-.666 0 0-.423-.768-1.227-.825 0 0-.78-.01-.055.487 0 0 .525.246.889 1.17 0 0 .463 1.428 2.688.944v1.489c0 .211-.129.459-.528.385-3.18-1.057-5.472-4.056-5.472-7.59 0-4.419 3.582-8 8-8s8 3.581 8 8c0 3.533-2.289 6.531-5.466 7.59z"/></svg>                                
                                            </a>
                                        </div>
                                        <div class="custom-html-widget col-4">                                    
                                            <a id="twitter-logo" title="Auden Musulin on Twitter" href="https://twitter.com/amp_oeaw" class="nav-link" target="_blank">
                                                <img class="card-img-right flex-auto d-md-block" style="max-width: 32px;height:auto;" title="2021 Twitter Logo Blue" alt="2021 Twitter Logo Blue" src="images/2021-twitter-logo-blue.png"></img>                                
                                            </a>
                                        </div>
                                        <div class="custom-html-widget col-4">
                                            <a id="mastodon-logo" rel="me" href="https://fedihum.org/@AMP_OeAW" class="nav-link" target="_blank">
                                                <img class="card-img-right flex-auto d-md-block" style="max-width: 32px;height:auto;" title="2023 Mastodon Logo" alt="2023 Mastodon Logo" src="https://upload.wikimedia.org/wikipedia/commons/4/48/Mastodon_Logotype_%28Simple%29.svg"></img>
                                            </a>
                                        </div>
                                    </div>   
                                    <div class="row">                         
                                        <div class="custom-html-widget col-12 py-2">   
                                            <label>App: </label>                                        
                                            <a style="margin-left: .5rem;"  href="https://doi.org/10.5281/zenodo.10376801"><img src="https://zenodo.org/badge/DOI/10.5281/zenodo.10376801.svg" alt="DOI"/></a>
                                        </div>
                                        <div class="custom-html-widget col-12 py-2">   
                                            <label>Data: </label>
                                            <a style="margin-left: .5rem;"  href="https://doi.org/10.5281/zenodo.10376155"><img src="https://zenodo.org/badge/DOI/10.5281/zenodo.10376155.svg" alt="DOI"/></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- .footer-widget -->
                    </div>
                </div>
            </div>
            <!-- #wrapper-footer-full -->
            <div class="footer-imprint-bar hide-reading text-light" id="wrapper-footer-secondary" style="text-align:center; padding:0.4rem 0; font-size: 0.9rem;" >
                <span>© Copyright OEAW</span> | <a href="imprint.html" class="text-light">Impressum/Imprint</a>
            </div>
            <div id="cookie-overlay">
                <div class="container">
                    <div class="cookie-message">This website uses cookies to ensure you get the best experience on our website. <a href="imprint.html">More info</a><br/></div>  
                    <div class="cookie-buttons">
                        <div class="cookie-accept-btn">Accept All Cookies (functional and tracking)</div>
                        <div class="cookie-accept-necessary-btn">Accept Necessary Cookies Only</div>
                    </div>
                </div>
            </div>
        </footer>
        <script type="text/javascript" src="js/navScrollHide.js"></script>
    </xsl:template>
</xsl:stylesheet>