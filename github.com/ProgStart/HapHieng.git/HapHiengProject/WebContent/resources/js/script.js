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

	$('#resumeTable tr').click(function() {
	    $(this).find('td input:radio').prop('checked', true);
	});

	$("#drnochar").focus(function() { $(this).select(); } );
	$("#drno").focus(function() { $("#drnochar").select(); } );
	$('#drnochar').change(function() {
		var drno = $('#drnochar').val();
	      $.get('getNextID?request='+drno,function(json) {
	    	  if(json!=null){
	    		  $('#drno').val(json);
	          }
	          else {
	        	  alert("Processing failed. Please try again.");
	          }
	      });
	});	
	
	var itemAdder = function (itemName, itemPrice, itemPriceOrig, quantity, itemDesc, stock, agentname, itemCode){
		var trColor = "";
		if(itemPrice !== itemPriceOrig){
			trColor = "class=\"bg_red\"";
		}
		if($('#itemAmountRecent').text() == "0.00"){
			trColor = "class=\"bg_blue\"";
		}
		if((quantity*itemPrice !== 0 && (parseInt(quantity) <= parseInt(stock)))){
			if($('#'+itemCode+'-item').length == 0) {
				alert(itemPrice);
				$('.list').append('<tr ' + trColor + ' data-toggle=\"modal\" data-target=\"#addEntry\" id=\"' + itemCode + '-item\" data-quantity="' + quantity + '" data-id="' + itemCode + '" data-agent="' + agentname + '">\n\t<td>' + itemCode + '</td>\n\t<td>' + itemCode + '</td>\n\t<td>' +  itemName + '</td>\n\t<td>' +  quantity + '</td>\n\t<td align=\"center\">' +  stock + '</td>\n\t<td>' +  "STOCK" + '</td>\n\t<td>' +  agentname + '</td>\n\t<td class=\"priceCol\">' + itemPrice + '</td>\n\t<td>' + (itemPrice*quantity).toFixed(2) + '</td>\n\t<td class=\"xCol\"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></td>\n</tr>').fadeIn('slow');
				//$('.list').append('<tr data-toggle="modal" data-target="#addEntry" id=' + itemCode + '-item data-quantity="' + quantity + '" data-id="' + itemCode + '" data-agent="' + agentname + '">\n\t<td>' + itemCode + '</td>\n\t<td>' + itemCode + '</td>\n\t<td>' +  itemName + '</td>\n\t<td>' +  quantity + '</td>\n\t<td align=\"center\">' +  stock + '</td>\n\t<td>' +  "STOCK" + '</td>\n\t<td>' +  agentname + '</td>\n\t<td class=\"priceCol\"><input type=\"text"\ class=\"form-control inlinetext\" value=\"' + itemPrice + '\"></td>\n\t<td>' + (itemPrice*quantity).toFixed(2) + '</td>\n\t<td class=\"xCol\"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></td>\n</tr>').fadeIn('slow');
				}
			else{
				$('#'+itemCode+'-item').replaceWith('<tr ' + trColor + ' data-toggle=\"modal\" data-target=\"#addEntry\" id=\"' + itemCode + '-item\">\n\t<td class=\"item-xm\">' + itemCode + '</td>\n\t<td class=\"item-xm\">' + itemCode + '</td>\n\t<td class=\"item-xm\">' +  itemName + '</td>\n\t<td class=\"item-xm\">' +  quantity + '</td>\n\t<td class=\"item-xm\" align=\"center\">' +  stock + '</td>\n\t<td class=\"item-xm\">' +  "STOCK" + '</td>\n\t<td class=\"item-xm\">' +  agentname + '</td>\n\t<td class=\"priceCol\">' + itemPrice + '</td>\n\t<td class=\"item-xm\">' + (itemPrice*quantity).toFixed(2) + '</td>\n\t<td><font class=\"xCol\"> <span class="glyphicon glyphicon-remove" aria-hidden="true"></span></td>\n</tr>').fadeIn('slow');
			} 
		}

		var sumTotals = 0;
		var rows = $("#entries tr:gt(0)");

		 rows.children("td:nth-child(9)").each(function() {
			 sumTotals += parseInt($(this).html());
		 });
		 $("#totalAmt").val(sumTotals.toFixed(2));
	};
	
	$('.addToList').click(function(){
		itemAdder($(this).attr('name'), $('#itemAmount').val(), $('#itemAmount2').text(),
				$('#orderQuantity').val(), $('#description').text(), $('#stockQuantity').val(), $('#salesagent').val(),
				$('#itemCode').text());
	});

	$('.addToList').mouseover(function(){
		$(this).css('cursor', 'pointer');
	});

	$('#post-btn').click( function() {
		var r = confirm("Are you sure you want to \"POST\" this transaction?");
		if(r){
		  var table = $('#entries').tableToJSON();
		  var tableStr = encodeURI(JSON.stringify(table));
		  var refno = $("#drnochar").val() + $("#drno").val();
		  var customer = $("#customer").val();
		  var date = $("#date").val();
		  var terms = $("#termsDetails").val();
		  var wcrc = $("#wcrc").val();
		  var totalAmt = $("#totalAmt").val();
		  var currency = "PHP";
		  var details = "{\"refno\" : \""+ refno +"\",\"customer\" : \""+ customer +"\",\"date\" : \""+ date +"\",\"terms\" : \""+ terms +"\",\"wcrc\" : \""+ wcrc +"\",\"totalAmt\" : \""+ totalAmt +"\",\"currency\" : \""+ currency +"\"}";
		  details = encodeURI(details);
	      $.get('postEntries.htm?request='+tableStr+'&details='+details,function(json) {
	    	  if(json!=null){
	    		  alert(json);
	          }
	          else {
	        	  alert("Processing failed. Please try again.");
	          }
	      });
		 }
	});
	
	$("#customer").change(function(){
		var r = confirm("Are you sure you want to change the customer? (Current prices may change based on selected customer)");
		if(r){
			var table = $('#entries').tableToJSON();
			for (var i = 0; i < table.length ; i++) { 
				getItem(table[i]["Item code"]);
				itemAdder(table[i]["Description"], $('#itemAmount').val(), $('#itemAmount2').text(),
						table[i]["Qty"], table[i]["Description"], table[i]["QtyStock"], table[i]["Agent"],
						table[i]["Item code"]);	
			}
		}
		var tableStr = JSON.stringify(table);
		console.log(tableStr);
	});

	$("#wcrc").change(function(){
		var r = confirm("Are you sure you want to change the WC/RC setting? (Current prices may change based on selected customer)");
		if(r){
			var table = $('#entries').tableToJSON();
			var multiplier;
			if($("#wcrc").val() == "WC"){
				multiplier = 0.65;
			} else if($("#wcrc").val() == "RC"){
				multiplier = 0.85;
			} else {
				multiplier = 1.00;
			}
			for (var i = 0; i < table.length ; i++) { 
				getItem(table[i]["Item code"]);
				itemAdder(table[i]["Description"], $('#itemAmount').val(), $('#itemAmount2').text()*multiplier,
						table[i]["Qty"], table[i]["Description"], table[i]["QtyStock"], table[i]["Agent"],
						table[i]["Item code"]);	
			}
		}
		var tableStr = JSON.stringify(table);
		console.log(tableStr);
	});	
	
	$('#suspendSales').click( function() {
		var r = confirm("Are you sure you want to \"SUSPEND\" this transaction?");
		if(r){
		  var table = $('#entries').tableToJSON();
		  var tableStr = encodeURI(JSON.stringify(table));
		  var refno = $("#drnochar").val() + $("#drno").val();
		  var customer = $("#customer").val();
		  var date = $("#date").val();
		  var terms = $("#termsDetails").val();
		  var wcrc = $("#wcrc").val();
		  var totalAmt = $("#totalAmt").val();
		  var currency = "PHP";
		  var details = "{\"refno\" : \""+ refno +"\",\"customer\" : \""+ customer +"\",\"date\" : \""+ date +"\",\"terms\" : \""+ terms +"\",\"wcrc\" : \""+ wcrc +"\",\"totalAmt\" : \""+ totalAmt +"\",\"currency\" : \""+ currency +"\"}";
		  details = encodeURI(details);

	      $.get('suspendEntries.htm?request='+tableStr+'&details='+details,function(json) {
	    	  if(json!=null){
	    		  alert(json);
	          }
	          else {
	        	  alert("Processing failed. Please try again.");
	          }
	      }); 
		 }
	});
	
	$('#resumeBtn').click( function() {
		var val = $('input[name=transentry]:checked').val();				
		$("#tbentries tr").remove();
		
        $.get('resumeEntries.htm?details='+val,function(json) {
            if(json!=null){
            	var data = JSON.parse(json);
            	var drno = data.ref_no + '';
      			$("#drno").val(drno.substring(1));
      			$("#drnochar").val(drno.substring(0, 1));
      		  	$("#customer").val(data.cust_code);
      		  	$("#date").val(data.date);
      		  	$("#termsDetails").val(data.terms);
      		  	$("#salescurrency").val(data.currency);	
      		  	$("#wcrc").val(data.wcrc);	

      		  	for (var i = 0; i < data.items.length ; i++) { 
  		        	var itemPrice = data.items[i].itemPrice;
  	      			var quantity = data.items[i].quantity;
  	      			var agentname = data.items[i].agent;

  	      			var itemName = data.items[i].name;
	        		var stock = data.items[i].stock;
	        		var itemCode = data.items[i].itemid;
	        		
	        		$('#itemAmount2').text(data.items[i].itemPrice);
	        		$('#itemAmountRecent').text(data.items[i].lastamount);
	        		if(data.items[i].lastamount !== "0.00"){
	        			$('#itemAmount').val(data.items[i].lastamount);
	        		}
	        		
	        		itemAdder(itemName, itemPrice, itemPrice, quantity, itemName, stock, agentname, itemCode);
      		  	}
            }
            else {
            	alert("no fetched");
            }
        });
	});
	
	$(document).on('click','.x-close',function(){
		if (confirm("Remove Item?") == true) {
			$(this).parent().fadeOut();
			var amt = parseFloat($("#totalAmt").val());
			var curAmt = $(this).parent().children("td:nth-child(9)").text();
			var curTotal = amt - curAmt;
			$(this).parent().remove();

			$("#totalAmt").val(parseFloat(Math.round(curTotal * 100) / 100).toFixed(2));
	    } else {
	        alert('Cancelled by user.');
	    }
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

		if(agentval == 0 || itemval == undefined){
			$("#itemmenu").hide();
			$('#addItem').prop('disabled', true);
		} else {
			$('#addItem').prop('disabled', false);
			getItem(itemval);
			$("#itemmenu").show();
		}
    }

	var getItem = function (itemval) {
	    $.get('entries.htm?itemId='+itemval+'&client='+$('#customer').val(),function(json) {
	        if(json!=null){
	        	var data = JSON.parse(json);
	        	$('#itemCode').text(data.itemid);
	    		$('#addItem').attr('name', data.name);
	    		$('#itemAmount').val(data.amount);
	    		$('#itemAmount2').text(data.amount);
	    		$('#itemAmountRecent').text(data.lastamount);
	    		if(data.lastamount !== "0.00"){
	    			$('#itemAmount').val(data.lastamount);
	    		}
	    		$('#description').text(data.desc);
	    		$('#stockQuantity').val(data.stock);
	    		$('#orderQuantity').attr('max', data.stock);
	        }
	        else {
	        	$("#totalAmt").html("no fetched");
	        }
	    }); 
    }
	
	$( document ).ready( changer );
	$("#salesagent").change(changer);
	$('#itemTable tr').click(changer);
	
});