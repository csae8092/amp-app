<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all" version="2.0">
    
    <xsl:template match="/" name="nav_bar">
        <xsl:param name="site_title">
            Auden Musulin Papers
        </xsl:param>
        <header class="sticky-navbar hide-reading" id="wrapper-navbar">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container">
                    <!-- Your site title as branding in the menu -->
                    <a href="index.html" class="navbar-brand custom-logo-link" rel="home" itemprop="url"><img src="images/Auden_Musulin_Papers_Logo_rechteckig_web.png" class="img-fluid" title="Auden Musulin Papers Logo" alt="Auden Musulin Papers Logo" itemprop="logo" /></a><!-- end custom logo -->
                    <a class="navbar-brand site-title-with-logo" rel="home" href="index.html" title="{$site_title}" itemprop="url"><!--<xsl:value-of select="$site_title"/>--></a>
                    <span style="margin-left:-1.7em;" class="badge bg-light text-dark">in development</span>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                        <!-- Your menu goes here -->
                        <ul id="main-menu" class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a title="Papers" href="#" data-bs-toggle="dropdown" class="nav-link dropdown-toggle">Papers <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Auden-Musulin Correspondence" href="toc.html" class="nav-link">Auden Musulin Papers 1959-1973</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="toc_m.html" title="Additional materials" class="nav-link">Musulin as Memoirist 1976-1995</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="photos.html" title="Photos" class="nav-link">Photos</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="cv.html" title="Auden through Computer Vision" class="nav-link">
                                            Auden through Computer Vision 
                                        </a> 
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a title="Indexes" href="#" data-bs-toggle="dropdown" class="nav-link dropdown-toggle">Indexes <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu">
                                        <a href="amp-index-persons.html" title="Persons" class="nav-link">Persons</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="amp-index-organizations.html"  title="Institutions" class="nav-link">Institutions</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="amp-index-works.html"  title="Works" class="nav-link">Works</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="amp-index-places.html" title="Places" class="nav-link">Places</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="amp-index-events.html" title="Events" class="nav-link">Events</a>
                                    </li>
                                </ul>                                
                            </li>                            
                            <li class="nav-item dropdown">
                                <a title="Biographies" href="#" data-bs-toggle="dropdown" class="nav-link dropdown-toggle">Biographies <span class="caret"></span></a>
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
                                <a title="Project" href="#" data-bs-toggle="dropdown" class="nav-link dropdown-toggle">Project <span class="caret"></span></a>
                                <ul class=" dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Description" href="description.html" class="nav-link">Description</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Team" href="team.html" class="nav-link">Team</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="editorial-declaration.html" title="Editorial Declaration" class="nav-link">Documentation</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a href="https://github.com/Auden-Musulin-Papers/amp-app/releases" target="_blank" title="Release Notes" class="nav-link">Release Notes</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a style="color:lightgrey!important;"  title="Technical Documentation" class="nav-link">Technical Documentation <small>(in progress)</small></a>
                                    </li>
                                </ul>                                
                            </li>  
                            <li class="nav-item navbar-search-item">
                                <form class="form-inline my-3 my-lg-0"
                                    method="get"
                                    action="search.html?amp[query]"
                                    role="search">
                                    <input class="form-control navbar-search" id="s" name="amp[query]" type="text" placeholder="Search" value="" autocomplete="off" />
                                    <button type="submit" class="navbar-search-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                        </svg>
                                    </button>
                                </form>
                            </li>
                        </ul>                       
                    </div>
                    <!-- .collapse navbar-collapse -->
                </div>
                <!-- .container -->
            </nav>
        </header>
    </xsl:template>
</xsl:stylesheet>
