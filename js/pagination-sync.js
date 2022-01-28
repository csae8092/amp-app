$('.pagination .nav-tabs li a').click(function (e) {     
    //get selected href
    var href = $(this).attr('href');
    var tabCat = href.split('-')[0].replace('#', '');
    console.log(tabCat);   

    //set all nav tabs to inactive
    $('.pagination .nav-tabs li a[data-tab="'+tabCat+'"]').removeClass('active');

    //get all nav tabs matching the href and set to active
    $('.pagination .nav-tabs li a[href="'+href+'"]').addClass('active');

    //active tab
    $('.pagination-tab.tab-pane[data-tab="'+tabCat+'"]').removeClass('active');   
    $('.pagination-tab.tab-pane'+href).addClass('active show');
})