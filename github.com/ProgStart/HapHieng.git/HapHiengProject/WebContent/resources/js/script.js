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
	
	// ===================== REPORTS TAB ===========================
	// ============ SALES REPORT ============
	$('#SRad_btn').click(function(){
		$('#SRad').toggleClass('show');
		$('#SRccd').attr('class','hide');
		$('#SRdate').attr('class','hide');
		$('#SRisrh').attr('class','hide');
	});
	
	$('#SRccd_btn').click(function(){
		$('#SRad').attr('class','hide');
		$('#SRccd').toggleClass('show');
		$('#SRdate').attr('class','hide');
		$('#SRisrh').attr('class','hide');
	});
	
	$('#SRdate_btn').click(function(){
		$('#SRad').attr('class','hide');
		$('#SRccd').attr('class','hide');
		$('#SRdate').toggleClass('show');
		$('#SRisrh').attr('class','hide');
	});
	
	$('#SRisrh_btn').click(function(){
		$('#SRad').attr('class','hide');
		$('#SRccd').attr('class','hide');
		$('#SRdate').attr('class','hide');
		$('#SRisrh').toggleClass('show');
	});
	
	// ============ SALES RETURN REPORT ============
	$('#SRRad_btn').click(function(){
		$('#SRRad').toggleClass('show');
		$('#SRRccd').attr('class','hide');
		$('#SRRdate').attr('class','hide');
		$('#SRRisrh').attr('class','hide');
	});
	
	$('#SRRccd_btn').click(function(){
		$('#SRRad').attr('class','hide');
		$('#SRRccd').toggleClass('show');
		$('#SRRdate').attr('class','hide');
		$('#SRRisrh').attr('class','hide');
	});
	
	$('#SRRdate_btn').click(function(){
		$('#SRRad').attr('class','hide');
		$('#SRRccd').attr('class','hide');
		$('#SRRdate').toggleClass('show');
		$('#SRRisrh').attr('class','hide');
	});
	
	$('#SRRisrh_btn').click(function(){
		$('#SRRad').attr('class','hide');
		$('#SRRccd').attr('class','hide');
		$('#SRRdate').attr('class','hide');
		$('#SRRisrh').toggleClass('show');
	});
	
	// ============ PURCHASE REPORT ============
	$('#PRad_btn').click(function(){
		$('#PRad').toggleClass('show');
		$('#PRccd').attr('class','hide');
		$('#PRdate').attr('class','hide');
		$('#PRisrh').attr('class','hide');
	});
	
	$('#PRccd_btn').click(function(){
		$('#PRad').attr('class','hide');
		$('#PRccd').toggleClass('show');
		$('#PRdate').attr('class','hide');
		$('#PRisrh').attr('class','hide');
	});
	
	$('#PRdate_btn').click(function(){
		$('#PRad').attr('class','hide');
		$('#PRccd').attr('class','hide');
		$('#PRdate').toggleClass('show');
		$('#PRisrh').attr('class','hide');
	});
	
	$('#PRisrh_btn').click(function(){
		$('#PRad').attr('class','hide');
		$('#PRccd').attr('class','hide');
		$('#PRdate').attr('class','hide');
		$('#PRisrh').toggleClass('show');
	});
	
	// ============ PURCHASE RETURN REPORT ============
	$('#PRRad_btn').click(function(){
		$('#PRRad').toggleClass('show');
		$('#PRRccd').attr('class','hide');
		$('#PRRdate').attr('class','hide');
		$('#PRRisrh').attr('class','hide');
	});
	
	$('#PRRccd_btn').click(function(){
		$('#PRRad').attr('class','hide');
		$('#PRRccd').toggleClass('show');
		$('#PRRdate').attr('class','hide');
		$('#PRRisrh').attr('class','hide');
	});
	
	$('#PRRdate_btn').click(function(){
		$('#PRRad').attr('class','hide');
		$('#PRRccd').attr('class','hide');
		$('#PRRdate').toggleClass('show');
		$('#PRRisrh').attr('class','hide');
	});
	
	$('#PRRisrh_btn').click(function(){
		$('#PRRad').attr('class','hide');
		$('#PRRccd').attr('class','hide');
		$('#PRRdate').attr('class','hide');
		$('#PRRisrh').toggleClass('show');
	});
	
	
});

