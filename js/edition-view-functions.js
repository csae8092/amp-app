// function original(el) {
    // textFeaturesAll("text-features-link");
    // $(".expand-wrapper").each(function() {
    //     $(this).removeClass("fade");
    // });
    // $(".hide-reading").each(function() {
    //     $(this).removeClass("fade");
    // });
    // $(".bi-fullscreen").each(function() {
    //     $(this).removeClass("fade");
    // }); 
    // $(".bi-fullscreen-exit").each(function() {
    //     $(this).addClass("fade");
    // }); 
    // $(".osd-viewer").each(function() {
    //     $(this).removeClass("fade-all");
    //     $(this).addClass("col-md-6");
    //     $(this).css("max-width","50%");
    // });
    // $(".pagination-tab.active .transcript .osd-viewer")
    //     .children("div")
    //     .children("div")
    //     .css({"width":"914px","height":"914px"});
    // $(".text-re").each(function() {
    //     $(this).removeClass("col-md-12");
    //     $(this).addClass("col-md-6");         
    //     $(this).css("max-width","50%");   
    // });
    // if ($("#unclear-link").prop( "checked" ) && $("#whitespaces-link").prop( "checked" ) && $("#deleted-link").prop( "checked" ) && $("#underline-link").prop( "checked" )) {
    //     $("#text-features-link").prop('checked', true);
    //     $("#text-features-link").addClass("active");
    // }
    // if ($("#unclear-link").prop( "checked" ) == false || $("#whitespaces-link").prop( "checked" ) == false || $("#deleted-link").prop( "checked" ) == false || $("#underline-link").prop( "checked" ) == false) {
    //     $("#text-features-link").prop('checked', false);
    //     $("#text-features-link").removeClass("active");
    // }
// }

function fullScreen(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".expand-wrapper").each(function() {
            $(this).addClass("fade");
        });
        $(".hide-reading").each(function() {
            $(this).addClass("fade");
        }); 
        $(".bi-fullscreen").each(function() {
            $(this).addClass("fade");
        }); 
        $(".bi-fullscreen-exit").each(function() {
            $(this).removeClass("fade");
        });     
    } else {
        element.addClass("active");
        $(".expand-wrapper").each(function() {
            $(this).removeClass("fade");
        });
        $(".hide-reading").each(function() {
            $(this).removeClass("fade");
        });
        $(".bi-fullscreen").each(function() {
            $(this).removeClass("fade");
        }); 
        $(".bi-fullscreen-exit").each(function() {
            $(this).addClass("fade");
        });        
    }
}

function facsimileOnOff(el) {
    if (jQuery.type(el) === "string") {
        var element = $(`#${el}`);
        var id = el;    
    } else {
        var element = $(el);
        var id = element.attr("id");
    } 
    if ( element.hasClass("active") ) {
        element.removeClass("active");
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
    } else {
        element.addClass("active");
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
    }
}


function textFeaturesAll(el) {
    if (jQuery.type(el) === "string") {
        var element = $(`#${el}`);
        var id = el;    
    } else {
        var element = $(el);
        var id = element.attr("id");
    } 
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".del").each(function() {
            $(this).removeClass("strikethrough badge-item red")
            .addClass("fade");
        });
        $("#deleted-link2, #deleted-link").removeClass("red");
        $("#deleted-link").removeClass("active");
        $(".abbr").each(function() {
            $(this).removeClass("unclear badge-item yellow");
        });
        $("#unclear-link2, #unclear-link").removeClass("yellow");
        $("#unclear-link").removeClass("active");
        $(".space").each(function() {
            $(this).addClass("fade");
            $(this).removeClass("badge-item green");
        });
        $("#whitespaces-link2, #whitespaces-link").removeClass("green");
        $("#whitespaces-link").removeClass("active");
        $(".hi-underline").each(function() {
            $(this).removeClass("underline badge-item blue");
        });
        $("#underline-link2, #underline-link").removeClass("blue");
        $("#underline-link").removeClass("active");
        if ($("#unclear-link").prop( "checked" )) {
            $("#unclear-link").prop('checked', false);
        }
        if ($("#whitespaces-link").prop( "checked" )) {
            $("#whitespaces-link").prop('checked', false);
        }
        if ($("#deleted-link").prop( "checked" )) {
            $("#deleted-link").prop('checked', false);
        }
        if ($("#underline-link").prop( "checked" )) {
            $("#underline-link").prop('checked', false);
        }
    } else {
        element.addClass("active");
        $(".del").each(function() {
            $(this).addClass("strikethrough badge-item red")
            .removeClass("fade");
        });
        $("#deleted-link2, #deleted-link").addClass("red");
        $("#deleted-link").addClass("active");
        $(".abbr").each(function() {
            $(this).addClass("unclear badge-item yellow");
        });
        $("#unclear-link2, #unclear-link").addClass("yellow");
        $("#unclear-link").addClass("active");
        $(".space").each(function() {
            $(this).removeClass("fade");
            $(this).addClass("badge-item green");
        });
        $("#whitespaces-link2, #whitespaces-link").addClass("green");
        $("#whitespaces-link").addClass("active");
        $(".hi-underline").each(function() {
            $(this).addClass("underline badge-item blue");
        });
        $("#underline-link2, #underline-link").addClass("blue");
        $("#underline-link").addClass("active");
        if ($("#unclear-link").prop( "checked" ) == false) {
            $("#unclear-link").prop('checked', true);
        }
        if ($("#whitespaces-link").prop( "checked" ) == false) {
            $("#whitespaces-link").prop('checked', true);
        }
        if ($("#deleted-link").prop( "checked" ) == false) {
            $("#deleted-link").prop('checked', true);
        }
        if ($("#underline-link").prop( "checked" ) == false) {
            $("#underline-link").prop('checked', true);
        }
    }
}

function textFeatures(el, reset) {
    if (jQuery.type(el) === "string") {
        var element = $(`#${el}`);
        var id = el;    
    } else {
        var element = $(el);
        var id = element.attr("id");
    } 
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        if (id === "deleted-link") {
            $(".del").each(function() {
                $(this).removeClass("strikethrough badge-item red")
                .addClass("fade");
            });
            $("#deleted-link2, #deleted-link").removeClass("red");
        }
        if (id === "unclear-link") {
            $(".abbr").each(function() {
                $(this).removeClass("unclear badge-item yellow");
            });
            $("#unclear-link2, #unclear-link").removeClass("yellow");
        }
        if (id === "whitespaces-link") {
            $(".space").each(function() {
                $(this).addClass("fade");
                $(this).removeClass("badge-item green");
            });
            $("#whitespaces-link2, #whitespaces-link").removeClass("green");
        }
        if (id === "underline-link") {
            $(".hi-underline").each(function() {
                $(this).removeClass("underline badge-item blue");
            });
            $("#underline-link2, #underline-link").removeClass("blue");
        }
    } else {
        element.addClass("active");
        if (id === "deleted-link") {
            $(".del").each(function() {
                $(this).addClass("strikethrough badge-item red")
                .removeClass("fade");
            });
            $("#deleted-link2, #deleted-link").addClass("red");
        }
        if (id === "unclear-link") {
            $(".abbr").each(function() {
                $(this).addClass("unclear badge-item yellow");
            });
            $("#unclear-link2, #unclear-link").addClass("yellow");
        }
        if (id === "whitespaces-link") {
            $(".space").each(function() {
                $(this).removeClass("fade");
                $(this).addClass("badge-item green");
            });
            $("#whitespaces-link2, #whitespaces-link").addClass("green");
        }
        if (id === "underline-link") {
            $(".hi-underline").each(function() {
                $(this).addClass("underline badge-item blue");
            });
            $("#underline-link2, #underline-link").addClass("blue");
        }
        
    }
    if ($("#unclear-link").prop( "checked" ) && $("#whitespaces-link").prop( "checked" ) && $("#deleted-link").prop( "checked" ) && $("#underline-link").prop( "checked" )) {
        $("#text-features-link").prop('checked', true);
        $("#text-features-link").addClass("active");
    }
    if ($("#unclear-link").prop( "checked" ) == false || $("#whitespaces-link").prop( "checked" ) == false || $("#deleted-link").prop( "checked" ) == false || $("#underline-link").prop( "checked" ) == false) {
        $("#text-features-link").prop('checked', false);
        $("#text-features-link").removeClass("active");
    }
    
}


// function editionClick(el) {
//     var element = $(el);
//     if ( element.hasClass("active") ) {
//         element.removeClass("active");
//         $(".abbr").each(function() {
//             $(this).removeClass("unclear");
//         });
//         $(".space").each(function() {
//             $(this).addClass("fade");
//         });
//         $(".del").each(function() {
//             $(this).removeClass("strikethrough");
//         });
//         $(".hi-underline").each(function() {
//             $(this).removeClass("underline");
//         });
//     } else {
//         element.addClass("active");
//         $(".abbr").each(function() {
//             $(this).addClass("unclear");
//         });
//         $(".space").each(function() {
//             $(this).removeClass("fade");
//         });
//         $(".del").each(function() {
//             $(this).addClass("strikethrough");
//         });
//         $(".hi-underline").each(function() {
//             $(this).removeClass("italic");
//             $(this).addClass("underline");
//         });
//         $("#reading-link").removeClass("active");
//         $("#diplomatic-link").removeClass("active");
//         $("p").each(function() {
//             $(this).removeClass("reading-view-font");
//         });
//         $(".osd-viewer").each(function() {
//             $(this).removeClass("fade-all");
//             $(this).addClass("col-md-6");
//             $(this).css("max-width","50%");
//         });
//         $(".pagination-tab.active .transcript .osd-viewer")
//             .children("div")
//             .children("div")
//             .css({"width":"914px","height":"914px"});
//         $(".text-re").each(function() {
//             $(this).removeClass("col-md-12");
//             $(this).addClass("col-md-6");         
//             $(this).css("max-width","50%");   
//         });
//         $(".expand-wrapper").each(function() {
//             $(this).removeClass("fade");
//         });
//         $(".expand-wrapper input").each(function() {
//             $(this).val(936);
//         });
//         $(".hide-reading").each(function() {
//             $(this).removeClass("fade");
//         });        
//     }
// }

// function diplomaticClick(el) {
//     var element = $(el);
//     if ( element.hasClass("active") ) {
//         element.removeClass("active");
//         $(".abbr").each(function() {
//             $(this).removeClass("unclear");
//         });
//         $(".space").each(function() {
//             $(this).addClass("fade");
//         });
//         $(".del").each(function() {
//             $(this).removeClass("strikethrough");
//         });
//         $(".hi-underline").each(function() {
//             $(this).removeClass("underline");
//         });
//     } else {
//         element.addClass("active");
//         $(".abbr").each(function() {
//             $(this).addClass("unclear");
//         });
//         $(".space").each(function() {
//             $(this).removeClass("fade");
//         });
//         $(".del").each(function() {
//             $(this).addClass("strikethrough");
//         });
//         $(".hi-underline").each(function() {
//             $(this).removeClass("italic");
//             $(this).addClass("underline");
//         });
//         $("#reading-link").removeClass("active");
//         $("#edition-link").removeClass("active");
//         $("p").each(function() {
//             $(this).removeClass("reading-view-font");
//         });
//         $(".osd-viewer").each(function() {
//             $(this).removeClass("fade-all");
//             $(this).addClass("col-md-6");
//             $(this).css("max-width","50%");
//         });
//         $(".pagination-tab.active .transcript .osd-viewer")
//             .children("div")
//             .children("div")
//             .css({"width":"914px","height":"914px"});
//         $(".text-re").each(function() {
//             $(this).removeClass("col-md-12");
//             $(this).addClass("col-md-6");         
//             $(this).css("max-width","50%");   
//         });
//         $(".expand-wrapper").each(function() {
//             $(this).removeClass("fade");
//         });
//         $(".expand-wrapper input").each(function() {
//             $(this).val(936);
//         });
//         $(".hide-reading").each(function() {
//             $(this).addClass("fade");
//         });
//     }
// }

// function readingClick(el) {
//     var element = $(el);
//     if ( element.hasClass("active") ) {
//         element.removeClass("active");
//         $(".abbr").each(function() {
//             $(this).removeClass("unclear");
//         });
//         $(".space").each(function() {
//             $(this).addClass("fade");
//         });
//         $(".del").each(function() {
//             $(this).removeClass("strikethrough");
//         });
//         $(".hi-underline").each(function() {
//             $(this).removeClass("underline");
//             $(this).removeClass("italic");
//         });
//         $("p").each(function() {
//             $(this).removeClass("reading-view-font");
//         });
//     } else {
//         element.addClass("active");
//         $(".abbr").each(function() {
//             $(this).removeClass("unclear");
//         });
//         $(".space").each(function() {
//             $(this).addClass("fade");
//         });
//         $(".del").each(function() {
//             $(this).removeClass("strikethrough");
//         });
//         $(".hi-underline").each(function() {
//             $(this).removeClass("underline");
//             $(this).addClass("italic");
//         });
//         $("#diplomatic-link").removeClass("active");
//         $("#edition-link").removeClass("active");
//         $("p").each(function() {
//             $(this).addClass("reading-view-font");
//         });
//         $(".osd-viewer").each(function() {
//             $(this).addClass("fade-all");
//             $(this).removeClass("col-md-6");
//             $(this).css("max-width","100%");  
//         });
//         $(".text-re").each(function() {
//             $(this).removeClass("col-md-6");
//             $(this).addClass("col-md-12");      
//             $(this).css("max-width","100%");    
//         });
//         $(".expand-wrapper").each(function() {
//             $(this).addClass("fade");
//         });
//         $(".hide-reading").each(function() {
//             $(this).addClass("fade");
//         });      
//     }
// }

// function deleted(el) {
//     var element = $(el);
//     if ( element.hasClass("active") ) {
//         element.removeClass("active");
//         $(".del").each(function() {
//             $(this).removeClass("strikethrough badge-item red")
//             .addClass("fade");
//         });
//         $("#deleted-link2, #deleted-link").removeClass("red");
//     } else {
//         element.addClass("active");
//         $(".del").each(function() {
//             $(this).addClass("strikethrough badge-item red")
//             .removeClass("fade");
//         });
//         $("#deleted-link2, #deleted-link").addClass("red");
//     }
// }

// function unclear(el) {
//     var element = $(el);
//     if ( element.hasClass("active") ) {
//         element.removeClass("active");
//         $(".abbr").each(function() {
//             $(this).removeClass("unclear badge-item yellow");
//         });
//         $("#unclear-link2, #unclear-link").removeClass("yellow");
//     } else {
//         element.addClass("active");
//         $(".abbr").each(function() {
//             $(this).addClass("unclear badge-item yellow");
//         });
//         $("#unclear-link2, #unclear-link").addClass("yellow");
//     }
// }

// function space(el) {
//     var element = $(el);
//     if ( element.hasClass("active") ) {
//         element.removeClass("active");
//         $(".space").each(function() {
//             $(this).addClass("fade");
//             $(this).removeClass("badge-item green");
//         });
//         $("#whitespaces-link2, #whitespaces-link").removeClass("green");
//     } else {
//         element.addClass("active");
//         $(".space").each(function() {
//             $(this).removeClass("fade");
//             $(this).addClass("badge-item green");
//         });
//         $("#whitespaces-link2, #whitespaces-link").addClass("green");
//     }
// }

// function underline(el) {
//     var element = $(el);
//     if ( element.hasClass("active") ) {
//         element.removeClass("active");
//         $(".hi-underline").each(function() {
//             $(this).removeClass("underline badge-item blue");
//         });
//         $("#underline-link2, #underline-link").removeClass("blue");
//     } else {
//         element.addClass("active");
//         $(".hi-underline").each(function() {
//             $(this).addClass("underline badge-item blue");
//         });
//         $("#underline-link2, #underline-link").addClass("blue");
//     }
// }
