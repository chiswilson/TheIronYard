var when_page_is_ready = function() {

	$(".notice").fadeOut(3000);
	$(".error").fadeOut(3000);

}

$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);