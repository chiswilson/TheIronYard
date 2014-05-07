var when_page_is_ready = function() {

$(function() {
	console.log($(".datepicker"))
    $(".datepicker").datepicker();
  });

}

$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);