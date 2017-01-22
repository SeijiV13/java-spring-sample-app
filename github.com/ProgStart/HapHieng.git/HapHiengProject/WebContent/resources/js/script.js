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
	
	
	$(window).resize(function(){
		if ($(window).width() < 768) {
			$('.btn_grp').removeClass('btn-group-justified');
	    } else {
	        $('.btn_grp').addClass('btn-group-justified');
		}
	});
	
	$('.datepicker').datepicker({
	    format: 'mm/dd/yyyy',
	    startDate: '-3d'
	});
	
	$('.input-daterange input').each(function() {
	    $(this).datepicker("clearDates");
	});
	
	$("#IOTradio3").click(function(event){
	    //event.preventDefault();
	    $('.IOTselect').removeAttr("disabled");
	    
	});
	
	$('.IOTradios').change(function(){
	  $('.IOTselect').attr('disabled', true);
	});
	
});

