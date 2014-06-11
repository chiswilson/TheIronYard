var when_page_is_ready = function() {

// $(function() {
// 	console.log($(".datepicker"))
//     $(".datepicker").datepicker();
//   });

// Hide all the images
// $(".cardimage").hide();

// $(".card").click(function() {
// 	console.log("card click")
// 	// $(".cardimage").show();
// 	$(this).children(":first").css('display', 'inline-block');
// });


var firstcard, secondcard, waiting_to_be_cleared, total_guesses
var clear_two_cards = function() {
	// console.log("clear_two_cards");
	firstcard = "0";
	firstcard_class = "";
	secondcard = "0";
}

// USE any key to turn the 2 cards back over
document.addEventListener('keydown', function(event) {
	// console.log("got key press");
	$(".card").css("background", "white");
	waiting_to_be_cleared = false;
	clear_two_cards();    
});

console.log("Initializing game");
$(".posted_msg").hide();
$(".card").css("background", "white");
clear_two_cards();
waiting_to_be_cleared = false;
total_guesses = 0;

// They Clicked a Card !
$(".card").click(function() {
	if (waiting_to_be_cleared) {
		$(".card").css("background", "white");
		waiting_to_be_cleared = false;
		clear_two_cards();
	}
  	var image_url = $(this).attr("image_url");
	$(this).css('background-image', image_url);
	if (firstcard == "0")
	{
		// console.log("setting first card");
		firstcard = $(this).attr("cardnum");
		firstcard_class = $(this).attr("class").split(" ")[1];
		  // this give you something like: card_27

		// console.log("first card class: " + firstcard_class)
	}
	else if (secondcard == "0")
	{
		// Make sure they're not selecting the same card twice...
		if ( firstcard_class == $(this).attr("class").split(" ")[1] )
		{
			return;
		}

		total_guesses += 1;
		// console.log("secondcard was 0!")
		secondcard = $(this).attr("cardnum");
		if (firstcard == secondcard)
		{
			// console.log("Got a match!!!");
			$(this).removeClass("card");
			$(this).addClass("card_idle");
			$(this).css("background", "lightgreen");
			$(this).off(); //this removes the previously bound event handler
			$("." + firstcard_class).removeClass("card");
			$("." + firstcard_class).addClass("card_idle");
			$("." + firstcard_class).css("background", "lightgreen");
			$("." + firstcard_class).off();

			if ($(".card").length == 0)
			{
				// alert('Game over, you took ' + total_guesses + ' guesses!');
				$.ajax({
      				type: "POST",
      				url: "/addgame",
      				dataType: "script",
      				data: {total_guesses: total_guesses},
      				success: function( data ) {
            			console.log( "got success function from ajax" );
            			$(".posted_msg").show().fadeOut(2500);
        			}   
    			})

			}
		}
		else
		{
			// console.log("No match");
			waiting_to_be_cleared = true;
			// cause we wanna make them turn the cards back over...
		}
		clear_two_cards();
		
	}
});

// var nums=[12,34,45,53,67,87,90,97,877,435], myresult=[];
// myresult = _.select(nums, function(i) {
// 	return i > 53;
// })
// console.log(myresult);


}
$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);