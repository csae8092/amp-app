function load_image(facs_id, osd_container_id, osd_container_id2) {
    if ( $("#" + osd_container_id).children("div[class='openseadragon-container']").length == 0 ) {
        // console.log(osd_container_id);
        $('#' + osd_container_id).css({
            'height': '1000px'
        });
        // OpenSeaDragon Image Viewer
        var image = $('#' + facs_id);
        var image = image.attr('src');
        var imageURL = {type: 'image', url: image};
        var viewer = OpenSeadragon({
            id: osd_container_id,
            prefixUrl: 'https://cdnjs.cloudflare.com/ajax/libs/openseadragon/3.1.0/images/',
            // sequenceMode: true,
            // showReferenceStrip: true,
            // showNavigator: true,
            // imageLoaderLimit: 10,
            tileSources: imageURL
        });
        // hides static images
        $('#' + osd_container_id2).remove();

        // hide loading spinner if image fully loaded status changes
        // see issue: https://github.com/openseadragon/openseadragon/issues/1262

        viewer.addHandler('open', function() {
        var tiledImage = viewer.world.getItemAt(0);
        if (tiledImage.getFullyLoaded()) {
            hideLoading();
        } else {
            tiledImage.addOnceHandler('fully-loaded-change', hideLoading);
        }
        });
    }

    function hideLoading() {
        // var container = $(osd_container_id).attr("id");  
        var spinnerID = "spinner_" + osd_container_id;
        if ( $("#" + spinnerID ) ) {
            // console.log(spinnerID);
            $("#" + spinnerID ).remove();
        }
    }
}
