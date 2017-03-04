var sumTotals = 0;
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
	
	// ================= MENU SCRIPT =====================
	$('.addToList').click(function(){
		var itemName = $(this).attr('name');
		var itemPrice = $('#itemAmount').text();
		var quantity = $('#orderQuantity').val();
		
		var itemDesc = $('#description').text();
		var stock = $('#stockQuantity').val();
		var agentname = $('#salesagent').val();
		var itemCode = $('#itemCode').text();

		if((quantity*itemPrice !== 0 && quantity <= stock)){		
			if($('#'+itemCode+'item').length === 0) {
				$('.list').append('<tr id=' + itemCode + 'item>\n\t<td class=\"item-xm\">' + itemCode + '</td>\n\t<td class=\"item-xm\">' + itemCode + '</td>\n\t<td class=\"item-xm\">' +  itemName + '</td>\n\t<td class=\"item-xm\">' +  quantity + '</td>\n\t<td class=\"item-xm\" align=\"center\">' +  stock + '</td>\n\t<td class=\"item-xm\">' +  "STOCK" + '</td>\n\t<td class=\"item-xm\">' +  agentname + '</td>\n\t<td class=\"item-xm\">' + itemPrice + '</td>\n\t<td class=\"item-xm\">' + (itemPrice*quantity).toFixed(2) + '</td>\n\t<td><font class=\"item-x\"> <span class="glyphicon glyphicon-remove" aria-hidden="true"></span></font></td>\n</tr>').fadeIn('slow');
			}
			else{
				$('#'+itemCode+'item').replaceWith('<tr id=' + itemCode + 'item>\n\t<td class=\"item-xm\">' + itemCode + '</td>\n\t<td class=\"item-xm\">' + itemCode + '</td>\n\t<td class=\"item-xm\">' +  itemName + '</td>\n\t<td class=\"item-xm\">' +  quantity + '</td>\n\t<td class=\"item-xm\" align=\"center\">' +  stock + '</td>\n\t<td class=\"item-xm\">' +  "STOCK" + '</td>\n\t<td class=\"item-xm\">' +  agentname + '</td>\n\t<td class=\"item-xm\">' + itemPrice + '</td>\n\t<td class=\"item-xm\">' + (itemPrice*quantity).toFixed(2) + '</td>\n\t<td><font class=\"item-x\"> <span class="glyphicon glyphicon-remove" aria-hidden="true"></span></font></td>\n</tr>').fadeIn('slow');
			} 
		}

		var sumTotals = 0;
		var rows = $("#entries tr:gt(0)");

		 rows.children("td:nth-child(9)").each(function() {
		 sumTotals += parseInt($(this).html());
		 });
		 $("#totalAmt").val(sumTotals.toFixed(2));
 });
	
	$('#clear').click(function(){
		$('#totalAmt').text("0.00");
		$('#entries').replaceWith('<table id=\"entries\" class=\"list\"><thead><tr><th><p class=\"qtyCO\">Name &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</p></th><th><p class=\"qtyCO\">Quantity &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</p></th><th><p class=\"qtyCO\">Price &nbsp &nbsp</p></th></tr></thead></table>');
	});

	$('.addToList').mouseover(function(){
		$(this).css('cursor', 'pointer');
	});

	$(document).on('click','.item-x',function(){
		if (confirm("Remove Item?") == true) {
	         $(this).parent().parent().fadeOut();
			var removeSum = $(this).parent().parent().children("td:nth-child(9)").text();
			var myDivObj = document.getElementById("totalAmt").innerHTML;
			sumTotals = parseInt(myDivObj) - parseInt(removeSum);
			$('#totalAmt').text(sumTotals.toFixed(2));
			$(this).parent().parent().children("td:nth-child(9)").text(0);
	    } else {
	        alert('Cancelled by user.');
	    }
		//$('#result').text(sumTotals);
	});	

	$(document).on('mouseover','.item-x',function(){
		$(this).css('cursor', 'pointer');
	});	

	$(document).on('mouseover','.item-xm',function(){
		$(this).css('cursor', 'pointer');
	});
	
	$("#itemmenu").hide();
	
	var changer = function () {
        var end = this.value;
        var itemval = $('#itemname').val();
		var agentval = $('#salesagent').val();
		
		if(itemval == 0 || agentval == 0){
			$("#itemmenu").hide();
		} else {
	        $.get('entries.htm?itemId='+itemval,function(json) {
	            if(json!=null){
	            	var data = JSON.parse(json);
	            	$('#itemCode').text(data.itemid);
	        		$('#addItem').attr('name', data.name);
	        		$('#itemAmount').text(data.amount);
	        		$('#description').text(data.desc);
	        		$('#stockQuantity').val(data.stock);
	        		$('#orderQuantity').attr('max', data.stock);
	            }
	            else {
	            	$("#totalAmt").html("no fetched");
	            }
	        }); 
			$("#itemmenu").show();
		}
    }
	$( document ).ready( changer );
	$("#itemname").change(changer);
	$("#salesagent").change(changer);
	
});

function searchItem() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("entrySearch");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("itemTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[2];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    } 
	  }
	}