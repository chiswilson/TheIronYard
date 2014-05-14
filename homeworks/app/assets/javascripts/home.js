var when_page_is_ready = function() {

// $(function() {
// 	console.log($(".datepicker"))
//     $(".datepicker").datepicker();
//   });


$(function() {
    $( "a.mybuttonclass" )
      .button()
      // .click(function( event ) {
      //   event.preventDefault();
      // });
  });

// Hide all the images
$(".cardimage").hide();


$(".card").click(function() {
	console.log("card click")
	// $(".cardimage").show();
	$(this).children(":first").show();
});



}
$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);