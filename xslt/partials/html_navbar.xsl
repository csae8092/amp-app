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
        <div class="wrapper-fluid wrapper-navbar sticky-navbar" id="wrapper-navbar" >
            <a class="skip-link screen-reader-text sr-only" href="#content">Skip to content</a>
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container">
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
                                        <a title="Surface reconstructions" href="#" class="nav-link">Surface reconstructions</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Musulin memoirs" href="memoirs.html" class="nav-link">Musulin memoirs</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Photos" href="photos.html" class="nav-link">Photos</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Additional materials" href="additional-materials.html" class="nav-link">Additional materials</a>
                                    </li>
                                </ul>                                
                            </li>
                            <li class="nav-item dropdown">
                                <a title="Indexes" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Indexes <span class="caret"></span></a>
                                <ul class=" dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Persons" href="#" class="nav-link">Persons</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Institutions" href="#" class="nav-link">Institutions</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Works" href="#" class="nav-link">Works</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Places" href="#" class="nav-link">Places</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Events" href="#" class="nav-link">Events</a>
                                    </li>
                                </ul>                                
                            </li>                            
                            <li class="nav-item"><a title="Relations" href="#" class="nav-link">Relations</a></li>
                            <!--<li class="nav-item dropdown">
                                <a title="Biographies" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Biographies <span class="caret"></span></a>
                                <ul class=" dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Level 1" href="#" class="nav-link">In Progress</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Level 1" href="#" class="nav-link">In Progress</a>
                                    </li>
                                </ul>                                
                            </li>-->
                            <li class="nav-item dropdown">
                                <a title="Project" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Project <span class="caret"></span></a>
                                <ul class=" dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Description" href="description.html" class="nav-link">Description</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Team" href="#" class="nav-link">Team</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Editorial Declaration" href="#" class="nav-link">Editorial Declaration</a>
                                    </li>
                                    <!--<li class="nav-item dropdown-submenu">
                                        <a title="Instruction for using the edition" href="#" class="nav-link">Instruction for using the edition</a>
                                    </li>-->
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Technical Documentation" href="#" class="nav-link">Technical Documentation</a>
                                    </li>
                                </ul>                                
                            </li>                            
                        </ul>                        
                        <form class="form-inline my-2 my-lg-0 navbar-search-form" method="get" action="search.html" role="search">
                            <input class="form-control navbar-search" id="s" name="q" type="text" placeholder="Search" value="" autocomplete="off" />
                            <button type="submit" class="navbar-search-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                            </button>
                        </form>
                    </div>
                    <!-- .collapse navbar-collapse -->
                </div>
                <!-- .container -->
            </nav>
            <!-- .site-navigation -->
        </div>
    </xsl:template>
</xsl:stylesheet>