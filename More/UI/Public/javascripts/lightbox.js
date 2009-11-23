function updateLightbox() {
    _centerLightbox(jQuery(".lightbox"));
}


function _centerLightbox(e) {
    e.css("position", "absolute");
    e.css("width", "auto");
    e.css("height", "auto");
    var width = e.width();
    var height = e.height();
    var x = (jQuery(window).width() - width) / 2;
    var y = (jQuery(window).height() - height) / 2;
    x = x < 0 ? 0 : x; y = y < 0 ? 0 : y;
    e.css("left", x + "px");
    e.css("top", y + "px");
    jQuery('html, body').animate({scrollTop: 0}, 0)
}
