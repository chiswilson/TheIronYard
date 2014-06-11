var when_page_is_ready = function() {

	$(".notice").fadeOut(3000);
	// $(".alert").fadeOut(3000);

	$("#contacts").autocomplete({
      source: "/contacts",
      minLength: 2,
      select: function( event, ui ) {
      	console.log("got some sorta event!");

        // log( ui.item ?
          // "Selected: " + ui.item.value + " aka " + ui.item.id :
          // "Nothing selected, input was " + this.value );
      }
    });

}

$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);