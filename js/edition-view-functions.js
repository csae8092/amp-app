function editionClick(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".abbr").each(function() {
            $(this).removeClass("unclear");
        });
        $(".space").each(function() {
            $(this).addClass("fade");
        });
        $(".del").each(function() {
            $(this).removeClass("strikethrough");
        });
        $(".hi-underline").each(function() {
            $(this).removeClass("underline");
        });
    } else {
        element.addClass("active");
        $(".abbr").each(function() {
            $(this).addClass("unclear");
        });
        $(".space").each(function() {
            $(this).removeClass("fade");
        });
        $(".del").each(function() {
            $(this).addClass("strikethrough");
        });
        $(".hi-underline").each(function() {
            $(this).removeClass("italic");
            $(this).addClass("underline");
        });
        $("#reading-link").removeClass("active");
        $("#diplomatic-link").removeClass("active");
        $("p").each(function() {
            $(this).removeClass("reading-view-font");
        });
        $(".osd-viewer").each(function() {
            $(this).removeClass("fade-all");
            $(this).addClass("col-md-6");
            $(this).css("max-width","50%");
        });
        $(".pagination-tab.active .transcript .osd-viewer")
            .children("div")
            .children("div")
            .css({"width":"914px","height":"914px"});
        $(".text-re").each(function() {
            $(this).removeClass("col-md-12");
            $(this).addClass("col-md-6");         
            $(this).css("max-width","50%");   
        });
        $(".expand-wrapper").each(function() {
            $(this).removeClass("fade");
        });
        $(".expand-wrapper input").each(function() {
            $(this).val(201);
        });
        $(".hide-reading").each(function() {
            $(this).removeClass("fade");
        });        
    }
}

function diplomaticClick(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".abbr").each(function() {
            $(this).removeClass("unclear");
        });
        $(".space").each(function() {
            $(this).addClass("fade");
        });
        $(".del").each(function() {
            $(this).removeClass("strikethrough");
        });
        $(".hi-underline").each(function() {
            $(this).removeClass("underline");
        });
    } else {
        element.addClass("active");
        $(".abbr").each(function() {
            $(this).addClass("unclear");
        });
        $(".space").each(function() {
            $(this).removeClass("fade");
        });
        $(".del").each(function() {
            $(this).addClass("strikethrough");
        });
        $(".hi-underline").each(function() {
            $(this).removeClass("italic");
            $(this).addClass("underline");
        });
        $("#reading-link").removeClass("active");
        $("#edition-link").removeClass("active");
        $("p").each(function() {
            $(this).removeClass("reading-view-font");
        });
        $(".osd-viewer").each(function() {
            $(this).removeClass("fade-all");
            $(this).addClass("col-md-6");
            $(this).css("max-width","50%");
        });
        $(".pagination-tab.active .transcript .osd-viewer")
            .children("div")
            .children("div")
            .css({"width":"914px","height":"914px"});
        $(".text-re").each(function() {
            $(this).removeClass("col-md-12");
            $(this).addClass("col-md-6");         
            $(this).css("max-width","50%");   
        });
        $(".expand-wrapper").each(function() {
            $(this).removeClass("fade");
        });
        $(".expand-wrapper input").each(function() {
            $(this).val(201);
        });
        $(".hide-reading").each(function() {
            $(this).addClass("fade");
        });
    }
}

function diplomaticLoad(el) {
    $(".abbr").each(function() {
        // console.log($(this));
        $(this).addClass("unclear");
    });
    $(".space").each(function() {
        $(this).removeClass("fade");
    });
    $(".del").each(function() {
        $(this).addClass("strikethrough");
    });
    $(".hi-underline").each(function() {
        $(this).addClass("underline");
    });
    $("input").each(function() {
        this.checked = true;
    });
    deletions("#deletions-link");
    unclear("#unclear-link");
    space("#whitespaces-link");
    underline("#underline-link");
}

function readingClick(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".abbr").each(function() {
            $(this).removeClass("unclear");
        });
        $(".space").each(function() {
            $(this).addClass("fade");
        });
        $(".del").each(function() {
            $(this).removeClass("strikethrough");
        });
        $(".hi-underline").each(function() {
            $(this).removeClass("underline");
            $(this).removeClass("italic");
        });
        $("p").each(function() {
            $(this).removeClass("reading-view-font");
        });
    } else {
        element.addClass("active");
        $(".abbr").each(function() {
            $(this).removeClass("unclear");
        });
        $(".space").each(function() {
            $(this).addClass("fade");
        });
        $(".del").each(function() {
            $(this).removeClass("strikethrough");
        });
        $(".hi-underline").each(function() {
            $(this).removeClass("underline");
            $(this).addClass("italic");
        });
        $("#diplomatic-link").removeClass("active");
        $("#edition-link").removeClass("active");
        $("p").each(function() {
            $(this).addClass("reading-view-font");
        });
        $(".osd-viewer").each(function() {
            $(this).addClass("fade-all");
            $(this).removeClass("col-md-6");
            $(this).css("max-width","100%");  
        });
        $(".text-re").each(function() {
            $(this).removeClass("col-md-6");
            $(this).addClass("col-md-12");      
            $(this).css("max-width","100%");    
        });
        $(".expand-wrapper").each(function() {
            $(this).addClass("fade");
        });
        $(".hide-reading").each(function() {
            $(this).addClass("fade");
        });      
    }
}

function deletions(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".del").each(function() {
            $(this).removeClass("strikethrough badge-item red");
        });
        $("#deletions-link2, #deletions-link").removeClass("red");
    } else {
        element.addClass("active");
        $(".del").each(function() {
            $(this).addClass("strikethrough badge-item red");
        });
        $("#deletions-link2, #deletions-link").addClass("red");
    }
}

function unclear(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".abbr").each(function() {
            $(this).removeClass("unclear badge-item yellow");
        });
        $("#unclear-link2, #unclear-link").removeClass("yellow");
    } else {
        element.addClass("active");
        $(".abbr").each(function() {
            $(this).addClass("unclear badge-item yellow");
        });
        $("#unclear-link2, #unclear-link").addClass("yellow");
    }
}

function space(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".space").each(function() {
            $(this).addClass("fade");
            $(this).removeClass("badge-item green");
        });
        $("#whitespaces-link2, #whitespaces-link").removeClass("green");
    } else {
        element.addClass("active");
        $(".space").each(function() {
            $(this).removeClass("fade");
            $(this).addClass("badge-item green");
        });
        $("#whitespaces-link2, #whitespaces-link").addClass("green");
    }
}

function underline(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".hi-underline").each(function() {
            $(this).removeClass("underline badge-item blue");
        });
        $("#underline-link2, #underline-link").removeClass("blue");
    } else {
        element.addClass("active");
        $(".hi-underline").each(function() {
            $(this).addClass("underline badge-item blue");
        });
        $("#underline-link2, #underline-link").addClass("blue");
    }
}

function clearAll(el) {
    $(".abbr").each(function() {
        $(this).removeClass("unclear badge-item yellow");
    });
    $(".space").each(function() {
        $(this).addClass("fade").removeClass("badge-item green");
    });
    $(".del").each(function() {
        $(this).removeClass("strikethrough badge-item red");
    });
    $(".hi-underline").each(function() {
        $(this).removeClass("italic underline badge-item blue");
    });
    $("#reading-link").removeClass("active");
    $("#diplomatic-link").removeClass("active");
    $("#edition-link").removeClass("active");
    $("#unclear-link").removeClass("active");
    $("#whitespaces-link").removeClass("active");
    $("#underline-link").removeClass("active");
    $("#deletions-link").removeClass("active");
    $("#underline-link2, #underline-link").removeClass("blue");
    $("#unclear-link2, #unclear-link").removeClass("yellow");
    $("#whitespaces-link2, #whitespaces-link").removeClass("green");
    $("#deletions-link2, #deletions-link").removeClass("red");
    $("p").each(function() {
        $(this).removeClass("reading-view-font");
    });
    $("input").each(function() {
        if(this.checked) {
            // console.log($(this));
            this.checked = false;
        }        
    });
}
