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
	Number.prototype.between  = function (a, b, inclusive) {
	    var min = Math.min.apply(Math, [a,b]),
	        max = Math.max.apply(Math, [a,b]);
	    return inclusive ? this >= min && this <= max : this > min && this < max;
	};

	$('#orderQuantity').keydown(function(event){
	    var v = parseFloat(this.value + String.fromCharCode(event.which));
	    var max = $('#orderQuantity').attr('max');
	    if (event.keyCode == 45) { 
	        event.preventDefault();
	        return false;
	    }
	    return parseFloat(v).between(0,max,true);
	});
	
	$(".list").delegate("tr", "click", function(e) {
		var dataRow = $(e.currentTarget);
		$("#orderQuantity").val(dataRow.data("quantity"));
		$("#salesagent").val(dataRow.data("agent"));
		$("input[name=itementry][value=" + dataRow.data("id") + "]").prop('checked', true);
    });

	$('#itemTable tr').click(function() {
	    $(this).find('td input:radio').prop('checked', true);
	    
	});
	
	$('.addToList').click(function(){
		var itemName = $(this).attr('name');
		var itemPrice = $('#itemAmount').text();
		var quantity = $('#orderQuantity').val();
		
		var itemDesc = $('#description').text();
		var stock = $('#stockQuantity').val();
		var agentname = $('#salesagent').val();
		var itemCode = $('#itemCode').text();

		if((quantity*itemPrice !== 0 && (parseInt(quantity) <= parseInt(stock)))){	
			if($('#'+itemCode+'item').length == 0) {
				$('.list').append('<tr data-toggle="modal" data-target="#addEntry" id=' + itemCode + '-item data-quantity="' + quantity + '" data-id="' + itemCode + '" data-agent="' + agentname + '">\n\t<td>' + itemCode + '</td>\n\t<td>' + itemCode + '</td>\n\t<td>' +  itemName + '</td>\n\t<td>' +  quantity + '</td>\n\t<td align=\"center\">' +  stock + '</td>\n\t<td>' +  "STOCK" + '</td>\n\t<td>' +  agentname + '</td>\n\t<td>' + itemPrice + '</td>\n\t<td>' + (itemPrice*quantity).toFixed(2) + '</td>\n\t<td class="x-close"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></td>\n</tr>').fadeIn('slow');
			}
			else{
				$('#'+itemCode+'item').replaceWith('<tr id=' + itemCode + 'item>\n\t<td class=\"item-xm\">' + itemCode + '</td>\n\t<td class=\"item-xm\">' + itemCode + '</td>\n\t<td class=\"item-xm\">' +  itemName + '</td>\n\t<td class=\"item-xm\">' +  quantity + '</td>\n\t<td class=\"item-xm\" align=\"center\">' +  stock + '</td>\n\t<td class=\"item-xm\">' +  "STOCK" + '</td>\n\t<td class=\"item-xm\">' +  agentname + '</td>\n\t<td class=\"item-xm\">' + itemPrice + '</td>\n\t<td class=\"item-xm\">' + (itemPrice*quantity).toFixed(2) + '</td>\n\t<td><font class=\"item-x\"> <span class="glyphicon glyphicon-remove" aria-hidden="true"></span></td>\n</tr>').fadeIn('slow');
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

	$('#post-btn').click( function() {
		  var table = $('#entries').tableToJSON();
		  console.log(table);
		  alert(JSON.stringify(table));
		  var tableStr = encodeURI(JSON.stringify(table));
		  
		  $.get('postEntry.htm?request='+tableStr,function(refNo) {
	        $.get('postEntries.htm?request='+tableStr+'&refNo='+refNo,function(json) {
	            if(json!=null){
	            	alert(json);
	            }
	            else {
	            	alert("fail");
	            }
	        }); 
		  }); 
	});
	
	$(document).on('click','.x-close',function(){
		if (confirm("Remove Item?") == true) {
			$(this).parent().fadeOut();
			var amt = parseFloat($("#totalAmt").val());
			var curAmt = $(this).parent().children("td:nth-child(9)").text();
			var curTotal = amt - curAmt;
			$(this).parent().remove();
	        //$(this).parent().parent().fadeOut();
			//var removeSum = $(this).parent().parent().children("td:nth-child(9)").text();
			//var myDivObj = document.getElementById("totalAmt").innerHTML;
			//sumTotals = parseInt(myDivObj) - parseInt(removeSum);
			//$('#totalAmt').text(sumTotals.toFixed(2));
			//$(this).parent().parent().children("td:nth-child(9)").text(0);
			$("#totalAmt").val(parseFloat(Math.round(curTotal * 100) / 100).toFixed(2));
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
        var itemval = $('input[name=itementry]:checked').val();
		var agentval = $('#salesagent').val();
		//alert(itemval);
		
		if(agentval == 0 || itemval == undefined){
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
	$("#salesagent").change(changer);
	$('#itemTable tr').click(changer);
	
});

	function searchItem() {
	  // Declare variables 
	  var input, filter, table, tr, td, td1, i;
	  input = document.getElementById("entrySearch");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("itemTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[2];
	    td1 = tr[i].getElementsByTagName("td")[1];
	    if (td || td1) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1 || td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    } 
	  }
	}