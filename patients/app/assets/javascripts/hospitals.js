var when_page_is_ready = function() {
	
	// Hide the Create buttons
	$("input.hospital_submit_button").hide();
    $(".doctor_submit_button").hide();

	// Got a key press, so hide/show the submit button
  	$("input.hospital_name_input").on('keyup', function() {
    	// console.log("key event");
    	myval = $(this).val();
    	if (myval.length > 0)
    	{
    		$("input.hospital_submit_button").show();
    		$("h5.namereqclass").hide();
    	}
    	else 
    	{
    		$("input.hospital_submit_button").hide();
    		$("h5.namereqclass").show();
    	}
  	});

    // Got a key press, so hide/show the submit button
    $("input.doctor_name_input").on('keyup', function() {
        // console.log("key event");
        myval = $(this).val();
        if (myval.length > 0)
        {
            $("input.doctor_submit_button").show();
            $("h5.namereqclass").hide();
        }
        else 
        {
            $("input.doctor_submit_button").hide();
            $("h5.namereqclass").show();
        }
    });


    // This is for the patient links, like GoToSurgery, etc...
    $(document.body).on("click", "a.change_state", function() 
    {
    $.ajax({
      type: "PATCH",
      url: $(this).attr("patient_url"),
      dataType: "script" //,
      // success: function(data) {
      //   console.log(data);
      //   console.log( $("li.student_" + data.id) )
      //   $("li.student_" + data.id).html(
      //     data.name + "(" + data.workflow_state + ")"
      //   )
      // }
    })
    });


    // This is for the patient list in the hospital view
    pageSize = 10;

    showPage = function(page) 
    {
        $(".pline1").hide();
        $(".pline2").hide();
        $(".pline1").each(function(n) 
        {
            if (n >= pageSize * (page - 1) && n < pageSize * page)
            {
                $(this).show();
                $($(".pline2")[n]).show();
            }
        });
        // Figure out whether to show or hide the previous and next buttons
        if ($(".pline1").length > pageSize * page)
            $(".next_patients").show();
        else
            $(".next_patients").hide();

        if (page > 1)
            $(".prev_patients").show();
        else
            $(".prev_patients").hide();
      
    }
    
    window.mycurrentPage = 1;
    showPage(window.mycurrentPage);

    $(".next_patients").click(function()
    {
        window.mycurrentPage = window.mycurrentPage + 1;
        // console.log(window.mycurrentPage);
        showPage(window.mycurrentPage);
    })

    $(".prev_patients").click(function()
    {
        if (window.mycurrentPage > 1) 
        {
            // console.log("clicked prev, number is:" window.mycurrentPage);
            window.mycurrentPage = window.mycurrentPage - 1;
            showPage(window.mycurrentPage);
        }
    })

}

$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);