function leafletDatatable(table) {                
    // display map container
    $('#leaflet-map-one').css({'display': 'flex'});
    // leaflet map:
    var latStart = document.body.querySelectorAll('.map-coordinates')[0].getAttribute('lat');
    var longStart = document.body.querySelectorAll('.map-coordinates')[0].getAttribute('long');
    var mymap = L.map('leaflet-map-one').setView([latStart,longStart], 2);
    
    var tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Map data &amp;copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.openstreetmap.org/">OpenStreetMap</a>',
        maxZoom: 18,
        zIndex: 1
    }).addTo(mymap);

    mymap.addControl(new L.Control.Fullscreen());
    
    /* create labels for each coordinate existing lat long coordinate */
    var markers = L.markerClusterGroup();

    var objects = new L.GeoJSON.AJAX(["geo/listplace.geojson"], {onEachFeature:popUp});
    // objects.on('data:loaded', function () {
    //     markers.addLayer(objects);
    //     mymap.addLayer(markers);
    //     try {
    //         mymap.fitBounds(markers.getBounds());
    //     } catch (err) {
    //         console.log(err);
    //     }
    // });
               
    // variable id #tableOne must match table id in html
    var tableOne = $('#' + table)
    .DataTable({
         "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/English.json"
             },
         dom: 'fpBirtp',
        buttons:['copy', 'excel', 'pdf'],
         "lengthMenu":[25, 50, 75, 100, "All"],
        responsive: true,
        orderCellsTop: true,
        "pageLength": 50,
        keepConditions: true
    });
    
    tableOne.on('search.dt', function(e) {
        var value = $('.dataTables_filter input').val();
        if (value.length != 0) {
            markers.clearLayers();
            getCoordinates();
            mymap.addLayer(markers);
            try {
                mymap.fitBounds(markers.getBounds());
            } catch (err) {
                console.log(err);
            }
        } else {
            markers.clearLayers();
            var objects = new L.GeoJSON.AJAX(["geo/listplace.geojson"], {onEachFeature:popUp});
            objects.on('data:loaded', function () {
                markers.addLayer(objects);
                mymap.addLayer(markers);
                try {
                    mymap.fitBounds(markers.getBounds());
                } catch (err) {
                    console.log(err);
                }
            });
        }
    });
    
    tableOne.on('page.dt', function() {
        markers.clearLayers();
        getCoordinates();
        mymap.addLayer(markers);
        try {
            mymap.fitBounds(markers.getBounds());
        } catch (err) {
            console.log(err);
        }
    });

    var baseLayers = {
        'Map': tiles
    };
    var overlays = {
        "Places Cluster": markers,
        "Places": objects
    };
    var layerControl = L.control.layers(baseLayers, overlays).addTo(mymap);

    $("#tableReload-wrapper").on('click', function() {
        var objects = new L.GeoJSON.AJAX(["geo/listplace.geojson"], {onEachFeature:popUp});
        markers.clearLayers();
        objects.on('data:loaded', function () {
            markers.addLayer(objects);
            mymap.addLayer(markers);
            try {
                mymap.fitBounds(markers.getBounds());
            } catch (err) {
                console.log(err);
            }
        });
    });

    function getCoordinates() {      
        document.body.querySelectorAll('.map-coordinates').forEach(function(node) {
            var lat = node.getAttribute('lat');
            var long = node.getAttribute('long');
            var id = node.getAttribute('id');
            var country = node.getAttribute('data-country');
            var place = `Placename: ${node.getAttribute('subtitle')}, ${country}<br/><a href="${id}.html">Read more</a>`;
            markers.addLayer(L.marker([lat,long]).bindPopup(place));
        });       
    }

    function popUp(f, l) {
        var out = [];
        if (f.properties) {
            out.push("Placename: " + f.properties['title'] + ', ' + f.properties['country_code']);
            out.push(`<a href='${f.properties['id']}.html'>Read more</a>`);    
            l.bindPopup(out.join("<br />"));
        }
    }
}
