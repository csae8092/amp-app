<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl tei xs" version="2.0">
    
    <xsl:template match="/" name="nav_bar">
        <xsl:param name="site_title">
            Auden Musulin Papers
        </xsl:param>
        <div class="wrapper-fluid wrapper-navbar sticky-navbar hide-reading" id="wrapper-navbar" >
            <a class="skip-link screen-reader-text sr-only" href="#content">Skip to content</a>
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container-fluid">
                    <!-- Your site title as branding in the menu -->
                    <a href="index.html" class="navbar-brand custom-logo-link" rel="home" itemprop="url"><img src="images/Auden_Musulin_Papers_Logo_rechteckig_web.png" class="img-fluid" title="Auden Musulin Papers Logo" alt="Auden Musulin Papers Logo" itemprop="logo" /></a><!-- end custom logo -->
                    <a class="navbar-brand site-title-with-logo" rel="home" href="index.html" title="{$site_title}" itemprop="url"><!--<xsl:value-of select="$site_title"/>--></a>
                    <span style="margin-left:-1.7em;" class="badge bg-light text-dark">in development</span>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                        <!-- Your menu goes here -->
                        <ul id="main-menu" class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a title="Papers" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Papers <span class="caret"></span></a>
                                <ul class=" dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Auden-Musulin Correspondence" href="toc.html" class="nav-link">Auden-Musulin Correspondence</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a style="color:lightgrey!important;" title="Surface reconstructions" class="nav-link">Surface reconstructions <small>(in progress)</small></a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Musulin memoirs" href="memoirs.html" class="nav-link">Musulin memoirs</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a style="color:lightgrey!important;" title="Photos" class="nav-link">Photos <small>(in progress)</small></a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="additional-materials.html" title="Additional materials" class="nav-link">Additional materials</a>
                                    </li> 
                                </ul>                                
                            </li>
                            <li class="nav-item dropdown">
                                <a title="Indexes" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Indexes <span class="caret"></span></a>
                                <ul class=" dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu">
                                        <a href="listperson.html" title="Persons" class="nav-link">Persons</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="listorg.html"  title="Institutions" class="nav-link">Institutions</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="listbibl.html"  title="Works" class="nav-link">Works</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="listplace.html" title="Places" class="nav-link">Places</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="listevent.html" title="Events" class="nav-link">Events</a>
                                    </li>
                                </ul>                                
                            </li>                            
                            <li class="nav-item dropdown">
                                <a title="Biographies" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Biographies <span class="caret"></span></a>
                                <ul class=" dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu">
                                        <a title="W. H. Auden" href="auden-biography.html" class="nav-link">W. H. Auden</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Stella Musulin" href="musulin-biography.html" class="nav-link">Stella Musulin</a>
                                    </li>
                                </ul>                                
                            </li>
                            <li class="nav-item dropdown">
                                <a title="Project" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Project <span class="caret"></span></a>
                                <ul class=" dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Description" href="description.html" class="nav-link">Description</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Team" href="team.html" class="nav-link">Team</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="editorial-declaration.html" title="Editorial Declaration" class="nav-link">Editorial Declaration</a>
                                    </li>
                                    <!--<li class="nav-item dropdown-submenu">
                                        <a title="Instruction for using the edition" href="#" class="nav-link">Instruction for using the edition</a>
                                    </li>-->
                                    <li class="nav-item dropdown-submenu">
                                        <a style="color:lightgrey!important;"  title="Technical Documentation" class="nav-link">Technical Documentation <small>(in progress)</small></a>
                                    </li>
                                </ul>                                
                            </li>  
                            <li class="nav-item">
                                <a href="search.html" title="Search" class="nav-link">Search</a>
                            </li>
                        </ul>                       
                    </div>
                    <!-- .collapse navbar-collapse -->
                </div>
                <!-- .container -->
            </nav>
            <!-- .site-navigation -->
        </div>
    </xsl:template>
</xsl:stylesheet>
