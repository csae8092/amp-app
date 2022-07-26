/*
    Dropdown select to change font family.
*/
function fontSelect(el) {
    var element = $(el);
    var val = element.val();
    $("p.yes-index").each(function() {
        $(this).removeClass("times-new-roman")
        .removeClass("courier-new")
        .removeClass("arial-serif");
        if(val !== "default") {
            $(this).addClass(val);
        }
    });
}

/*
    Dropdown select to change font size.
*/
function fontsizeSelect(el) {
    var element = $(el);
    var val = element.val();
    $("p.yes-index").each(function() {
        $(this).removeClass("font-size-26")
        .removeClass("font-size-22")
        .removeClass("font-size-18")
        .removeClass("font-size-14");
        if(val !== "default") {
            $(this).addClass(val);
        }
    });
}
