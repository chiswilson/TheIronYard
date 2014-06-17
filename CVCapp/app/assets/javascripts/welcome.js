var when_page_is_ready = function() {

	$(".notice").fadeOut(3000);
	// $(".alert").fadeOut(3000);

	$(".sendmessage-contact").autocomplete({
      source: "/contacts",
      minLength: 2,
      select: function( event, ui ) {
      	console.log("got select event!");
      	$(".sel-contact-id").val(ui.item.id)

        // log( ui.item ?
          // "Selected: " + ui.item.value + " aka " + ui.item.id :
          // "Nothing selected, input was " + this.value );
      }
    });

}

$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);