var pagination = document.querySelectorAll('.pagination .nav-tabs li a');
pagination.forEach(function(el) {
    el.addEventListener("click", pageSync);
});

window.onload = pageUrl();

function pageSync() {    
    const url = new URL(window.location.href);
    const urlParam = new URLSearchParams(url.search);
    
    // get selected href
    var href = this.getAttribute('href');
    var dataTab = this.getAttribute('data-tab');

    urlParam.set("page", href.replace('#paginate-', ''));
    window.history.replaceState({}, '', `${location.pathname}?${urlParam}`); 

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
    // urlParam.set('page', 'paginate-1');
    // window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
    const item = document.querySelector('.pagination .nav-tabs .nav-item .nav-link.active');
    const href = item.getAttribute('href').replace('#', '');
    if (urlParam.get('page') == null) {
        urlParam.set('page', "1");
        window.history.replaceState({}, '', `${location.pathname}?${urlParam}`);
    } else if (urlParam.get('page') == href.replace('paginate-', '')) {
        const tab = document.getElementById(href);
        tab.classList.add('active');
        tab.classList.add('show');
        tab.classList.remove('fade');
        item.classList.add('active');
        item.classList.add('show');
    } else {
        var tabs = document.querySelectorAll(`.pagination-tab.tab-pane[data-tab="paginate"]`);
        tabs.forEach(function(el) {
            el.classList.remove('active');
            el.classList.add('fade');
        });
        const tab = document.getElementById(`paginate-${urlParam.get('page')}`);
        tab.classList.remove('fade');
        tab.classList.add('active');
        tab.classList.add('show');
        const link = document.querySelectorAll('.pagination .nav-tabs .nav-item .nav-link');
        link.forEach(function(el) {
            el.classList.remove('active');
            el.classList.remove('show');
        });
        // get all nav tabs matching the href and set to active
        var linkActive = document.querySelectorAll(`.pagination .nav-tabs li a[href="#paginate-${urlParam.get('page')}"]`);
        linkActive.forEach(function(el) {
            el.classList.add('active');
        });
        var current = urlParam.get('page');
        var container_id = `envelope_container_${current}`
        var container_id2 = `envelope_container2_${current}`
        var osd_container = document.getElementById(container_id);
        var osd_container_2 = document.getElementById(container_id2);
        if (osd_container) {
            if ( osd_container_2 ) {
                osd_container.style.height = "1000px";
                // OpenSeaDragon Image Viewer
                var image = document.getElementById(`envelope_img_${current}`);
                var image_src = image.getAttribute('src');
                var image_url = {type: 'image', url: image_src};
                var viewer = OpenSeadragon({
                    id: container_id,
                    prefixUrl: 'https://cdnjs.cloudflare.com/ajax/libs/openseadragon/2.4.1/images/',
                    // sequenceMode: true,
                    // showReferenceStrip: true,
                    // showNavigator: true,
                    // imageLoaderLimit: 10,
                    tileSources: image_url
                });
                // hides static images
                osd_container_2.remove();
        
                // hide loading spinner if image fully loaded status changes
                // see issue: https://github.com/openseadragon/openseadragon/issues/1262
        
                viewer.addHandler('open', function() {
                    var tiledImage = viewer.world.getItemAt(0);
                    if (tiledImage.getFullyLoaded()) {
                        hideLoading(container_id);
                    } else {
                        tiledImage.addOnceHandler('fully-loaded-change', hideLoading(container_id));
                    }
                });
            }
        } else {
            var container_id_sheet = `sheet_container_${current}`
            var container_id_sheet2 = `sheet_container2_${current}`
            var osd_container_sheet = document.getElementById(container_id_sheet);
            var osd_container2_sheet = document.getElementById(container_id_sheet2);
            if ( osd_container2_sheet ) {
                osd_container_sheet.style.height = "1000px";
                // OpenSeaDragon Image Viewer
                var image2 = document.getElementById(`sheet_img_${current}`);
                var image_src2 = image2.getAttribute('src');
                var image_url2 = {type: 'image', url: image_src2};
                var viewer2 = OpenSeadragon({
                    id: container_id_sheet,
                    prefixUrl: 'https://cdnjs.cloudflare.com/ajax/libs/openseadragon/2.4.1/images/',
                    // sequenceMode: true,
                    // showReferenceStrip: true,
                    // showNavigator: true,
                    // imageLoaderLimit: 10,
                    tileSources: image_url2
                });
                // hides static images
                osd_container2_sheet.remove();
        
                // hide loading spinner if image fully loaded status changes
                // see issue: https://github.com/openseadragon/openseadragon/issues/1262
        
                viewer2.addHandler('open', function() {
                    var tiledImage = viewer2.world.getItemAt(0);
                    if (tiledImage.getFullyLoaded()) {
                        hideLoading(container_id_sheet);
                    } else {
                        tiledImage.addOnceHandler('fully-loaded-change', hideLoading(container_id_sheet));
                    }
                });
            }
        }

        // var spinner = document.getElementById(`spinner_envelope_container_${current}`);
        // if (spinner) {
        //     spinner.remove();
        // } else {
        //     var spinner2 = document.getElementById(`spinner_sheet_container_${current}`);
        //     spinner2.remove();
        // }
    }

    function hideLoading(id) { 
        var spinnerID2 = "spinner_" + id;
        if ( document.getElementById(spinnerID2) ) {
            document.getElementById(spinnerID2).remove();
        }
    }
}
