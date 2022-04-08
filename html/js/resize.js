function resize(position) {
    let isResizing = false,
        lastDownX = 0;

    $(function () {
        let container = $(`#container-resize-${position}`),
            left_container = $(`#text-resize-${position}`),
            right_container = $(`#img-resize-${position}`),
            handle = $(`#img-expand-${position}`),
            viewer = $(`#viewer-${position}`).children('div');
        
        handle.on('mousedown', function (e) {
            isResizing = true;
            lastDownX = e.clientX;
        });

        $(document).on('mousemove', function (e) {
            // we don't want to do anything if we aren't resizing.
            if (!isResizing) 
                return;
            
            // console.log(container.offset());
            let offsetRight = container.width() - (e.clientX - container.offset().left);
            // console.log(offsetRight);
            
            left_container.css('max-width', container.width() - offsetRight);
            right_container.css('max-width', offsetRight);
            viewer.css('width', offsetRight);
            viewer.css('height', offsetRight);

        }).on('mouseup', function (e) {
            // stop resizing
            isResizing = false;
        });
    });
    var slider = document.getElementById(`img-expand-${position}`);

    // Update the current slider value (each time you drag the slider handle)
    slider.oninput = function() {
        output.innerHTML = this.value;
    }
}

