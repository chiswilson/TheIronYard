var when_page_is_ready = function() {

// $(function() {
// 	console.log($(".datepicker"))
//     $(".datepicker").datepicker();
//   });


// Hide all the images
$(".cardimage").hide();


$(".card").click(function() {
	console.log("card click")
	// $(".cardimage").show();
	$(this).children(":first").css('display', 'inline-block');
});



}
$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);