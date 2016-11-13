$(document).ready(function() {
	// ADDING TO CART FUNCTION
	$(".select-radio").change(function(){
		var counter = 0;
		$(".select-radio").each(function(){
			if($(this).is(":checked")){
				counter = 1;
			}
		});
		if (counter == 0) {
			$(".removetocart-button").prop('disabled', true);
			$(".nomovie-alert").show();
		} else {
			$(".removetocart-button").removeAttr("disabled");
			$(".nomovie-alert").hide();
		}
	});

	$(".movie-checkbox").change(function() {
		var counter = 0;
		$(".movie-checkbox").each(function() {
			if ($(this).is(":checked")) {
				counter = 1;
			}

		});

		if (counter == 0) {
			$(".addtocart-button").prop('disabled', true);
			$(".nomovie-alert").show();
		} else {
			$(".addtocart-button").removeAttr("disabled");
			$(".nomovie-alert").hide();
		}

		var id = $(this).attr("id");
		var movieid = id.split("-");

		if ($(this).is(":checked")) {
			$("#input-" + movieid[1]).removeAttr("disabled");
			$("#title-" + movieid[1]).removeAttr("disabled");
			$("#unitprice-" + movieid[1]).removeAttr("disabled");
			$("#idnumber-" + movieid[1]).removeAttr("disabled");
		} else {
			$("#input-" + movieid[1]).prop('disabled', true);
			$("#title-" + movieid[1]).prop('disabled', true);
			$("#unitprice-" + movieid[1]).prop('disabled', true);
			$("#idnumber-" + movieid[1]).prop('disabled', true);

		}
	});

	$("#menu-toggle").click(function() {
		var menustate = $("#menustate").val();
		if (menustate == "1") {
			$("#menu-toggle").text("Open Search Bar");
			$("#menustate").val("0");
		} else if (menustate == "0") {
			$("#menu-toggle").text("Close Search Bar");
			$("#menustate").val("1");
		}

	});

	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});

	$('.message a').click(function() {
		$('form').animate({
			height : "toggle",
			opacity : "toggle"
		}, "slow");
	});

});
