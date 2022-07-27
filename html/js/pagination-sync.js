const pagination = document.querySelectorAll('.pagination .nav-tabs li a');
pagination.forEach(function(el) {
    el.addEventListener("click", pageSync);
});

window.onload = pageUrl();

function pageSync() {    
    const url = new URL(window.location.href);
    const urlParam = new URLSearchParams(url.search);
    const citation_url = document.getElementById("citation-url");
    
    // get selected href
    var href = this.getAttribute('href');
    var dataTab = this.getAttribute('data-tab');

    urlParam.set("page", href.replace('#paginate-', ''));
    window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
    citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
    citation_url.setAttribute("href", window.location.href);

    // set all nav tabs to inactive
    var link = document.querySelectorAll(`.pagination .nav-tabs li a[data-tab="${dataTab}"]`);
    link.forEach(function(el) {
        el.classList.remove('active');
    });

    // get all nav tabs matching the href and set to active
    var ref = document.querySelectorAll(`.pagination .nav-tabs li a[href="${href}"]`);
    ref.forEach(function(el) {
        el.classList.add('active');
    });

    // active tab
    var tab = document.querySelectorAll(`.pagination-tab.tab-pane[data-tab="${dataTab}"]`);
    tab.forEach(function(el) {
        el.classList.remove('active');
    });
    var tab_ref = document.querySelectorAll(`.pagination-tab.tab-pane${href}`);
    tab_ref.forEach(function(el) {
        el.classList.add('active');
        el.classList.add('show');
    });
}

function pageUrl() {
    const url = new URL(window.location.href);
    const urlParam = new URLSearchParams(url.search);
    const _current = urlParam.get('page');
    const item = document.querySelector('.pagination .nav-tabs .nav-item .nav-link.active');
    const href = item.getAttribute('href').replace('#', '');
    const citation_url = document.getElementById("citation-url");
    if (_current == null) {
        urlParam.set('page', "1");
    } else if (_current == href.replace('paginate-', '')) {
        // no changes necessary your in the right tab and active link
    } else {
        // deactivate all tabs
        var tabs = document.querySelectorAll(`.pagination-tab.tab-pane[data-tab="paginate"]`);
        tabs.forEach(function(el) {
            el.classList.remove('active');
            el.classList.add('fade');
        });
        // activate tab base on urlparams
        const tab = document.getElementById(`paginate-${_current}`);
        tab.classList.remove('fade');
        tab.classList.add('active');
        tab.classList.add('show');
        // deactivate pagination links
        const link = document.querySelectorAll('.pagination .nav-tabs .nav-item .nav-link');
        link.forEach(function(el) {
            el.classList.remove('active');
            el.classList.remove('show');
        });
        // get all nav tabs matching href tabs based on urlparams and set to active
        var linkActive = document.querySelectorAll(`.pagination .nav-tabs li a[href="#paginate-${_current}"]`);
        linkActive.forEach(function(el) {
            el.classList.add('active');
            el.classList.add('show');
        });
        // create OSD container
        var _container_id = `envelope_container_${_current}`
        var _container = document.getElementById(_container_id);
        if (_container) {
            var _image_type = "envelope";
        } else {
            var _image_type = "sheet";
        }
        var _osd_container_id = `${_image_type}_container_${_current}`;
        var _osd_container_id2 = `${_image_type}_container2_${_current}`;
        var osd_container = document.getElementById(_osd_container_id);
        var osd_container_2 = document.getElementById(_osd_container_id2);
        if ( osd_container_2 ) {
            osd_container.style.height = "1000px";
            var image = document.getElementById(`${_image_type}_img_${_current}`);
            var image_src = image.getAttribute('src');
            var image_url = {type: 'image', url: image_src};
            var viewer = OpenSeadragon({
                id: _osd_container_id,
                prefixUrl: 'https://cdnjs.cloudflare.com/ajax/libs/openseadragon/3.1.0/images/',
                tileSources: image_url
            });
            // hides static images
            osd_container_2.remove();
    
            // hide loading spinner if image fully loaded status changes
            // see issue: https://github.com/openseadragon/openseadragon/issues/1262
            viewer.addHandler('open', function() {
                var tiledImage = viewer.world.getItemAt(0);
                if (tiledImage.getFullyLoaded()) {
                    hideLoading(_osd_container_id);
                } else {
                    tiledImage.addOnceHandler('fully-loaded-change', function() {
                        var spinnerID2 = "spinner_" + _osd_container_id;
                        if ( document.getElementById(spinnerID2) ) {
                            document.getElementById(spinnerID2).remove();
                        }
                    });
                }
            });
        }
    }
    window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
    citation_url.innerHTML = `${location.hostname}${location.pathname}?${urlParam}`;
    citation_url.setAttribute("href", window.location.href);

    function hideLoading(id) { 
        var spinnerID2 = "spinner_" + id;
        if ( document.getElementById(spinnerID2) ) {
            document.getElementById(spinnerID2).remove();
        }
    }
}
