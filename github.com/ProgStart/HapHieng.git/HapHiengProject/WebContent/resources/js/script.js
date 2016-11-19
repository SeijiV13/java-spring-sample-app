$(document).ready(function() {
	// MENUT TOGGLE FUNCTION

	$("#menu-toggle").click(function() {
		var menustate = $("#menustate").val();
		if (menustate == "1") {
			$("#menu-toggle").text("Open Menu Bar");
			$("#menustate").val("0");
		} else if (menustate == "0") {
			$("#menu-toggle").text("Close Menu Bar");
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
