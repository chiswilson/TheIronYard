var when_page_is_ready = function() {

  // Hide the patient submit button for starters, cause no name yet...
	$("input.patient_submit_button").hide();

	$("input.patient_name_input").on('keyup', function() {
    	myval = $(this).val();
    	if (myval.length > 0)
    	{
    		$("input.patient_submit_button").show();
    		$("h5.namereqclass").hide();
    	}
    	else 
    	{
    		$("input.patient_submit_button").hide();
    		$("h5.namereqclass").show();
    	}
  });

  	

}

$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);