<script type="text/javascript" src="/js/playsound.js"></script>

<script>

var eventLog = Array();
var target;
var bagslotid;
var bundle;

$( document ).ready(function() {

	RebuildPlayerInventory();
	LoadBundle();

	$('#save-confirm').on('hidden.bs.modal', function () {
    
    	if ($('#save-confirm-btn').text() == "Close") {

    		$('#save-confirm').hide();
    		RebuildPlayerInventory();
		//	location.reload();
		}
    });

	$(".item-search #q").keyup(function(event){

	    if(event.keyCode == 13){

	        $(".item-search #search-button").click();
	    }
	});

    $('.draggable').draggable({ 
    	revert: 'invalid',
        revertDuration: 100,
        zIndex: 100,
        start: function(event, ui) { $.playSound('/sound/item'); },
    }).each(function() {
        var top = $(this).position().top;
        var left = $(this).position().left;
        $(this).data('orgTop', top);
        $(this).data('orgLeft', left);
    });

    $(".slotdrop").droppable({
    	accept: function (draggable) {
//    		console.log();
    		return (!$(this).find('img').length && //has no item in it
    			(
    				($(this).attr("data-mask") == undefined) ||  //it's ok if no mask set
    				( //it's ok if slot mask = data mask, and data mask is not 0
    					($(this).attr("data-mask") & draggable.attr('data-mask')) ==  draggable.attr('data-mask')
    					&& draggable.attr('data-mask') != 0 
    				)
    			)
    			);
    	},

     	drop: function( event, ui ) {
     		$.playSound('/sound/item');
	      	ui.draggable.css( {
	      		'left' : '', 
	      		'top' : ''
	      	});
	      	ui.draggable.removeClass("ui-draggable-dragging");

	      	if (!ui.draggable.attr('is-clonable')) {

	      		ui.draggable.remove();
	  		} else {

	  			if ($(this).attr('slot-id') == -1) {

	  				console.log("Dragged a find item to destroy window!");	
	  				return;
	  			}

	  		}
	  		//update tab
	      	$('#details-tab').attr('aria-expanded', 'false');
			$('#li-details').removeClass('active');
			$('#details').removeClass('active in');

			$('#changes-tab').attr('aria-expanded', 'true');
			$('#li-changes').addClass('active');
			$('#changes').addClass('active in');

	      	var newItem = ui.draggable.clone(false);
	      	newItem.removeAttr('is-clonable');
	      	newItem.removeAttr('id');


	  		if (bagslotid > 0 && newItem.attr('is-bag') == 1 && newItem.attr('slot-id') == bagslotid) {

	  			ToggleBag(-1); //Hide all bags

	  		}
	      	$(this).append(newItem);
	      	newItem.draggable({
	      		revert: 'invalid',
	        	revertDuration: 100,
	        	start: function(event, ui) { $.playSound('/sound/item'); },
	      	});

	      	

	      	if (newItem.attr('slot-id') == -1) {

	      		AddItem(newItem.attr("item-id"),$(this).attr("slot-id"), $(this).attr('slot-name'), newItem.attr('item-icon'), newItem.attr("item-quantity"));

	      	} else if ($(this).attr('slot-id') == -1) {

	      		RemoveItem(newItem.attr("item-id"),newItem.attr("slot-id"), $(this).attr('slot-name'), newItem.attr('item-icon'), newItem.attr("item-quantity"));
	      		

	      	} else {

	      		MoveItem(newItem.attr("item-id"),$(this).attr("slot-id"), $(this).attr('slot-name'), newItem.attr('item-icon'), newItem.attr("slot-id"), newItem.attr('slot-name'), newItem.attr("item-quantity"));
	      		
	      	}
	      	

	      	if (newItem.attr('is-bag') == 1) { //item dragged is a bag

	      		console.log("is Bag");
      			var bagSlots = GetBagSlots($(this).attr('slot-id'));
      			var oldSlots = GetBagSlots(newItem.attr('slot-id'));
      			
      			for (var i = 0; i < oldSlots.length; i++) { //iterate bag slots
      				console.log("slot "+oldSlots[i]);

      				var oldSlotItem = $('.slot'+oldSlots[i]+' img');

      				if (oldSlotItem.attr('item-id') != undefined) {
      					console.log("has item");

			      		if ($(this).attr('slot-id') == -1) { //bag is being deleted
			      			console.log("Being deleted");

			      			var quantity =oldSlotItem.attr('item-quantity');
 							if (quantity < 1) quantity = 1;

			      			RemoveItem(oldSlotItem.attr('item-id'), oldSlots[i], oldSlotItem.attr('slot-name'), oldSlotItem.attr('item-icon'), quantity);

			      			oldSlotItem.remove();
			      			continue;
			      		}

			      		//moving from an old bag slot

      				
      					console.log("Found item in "+oldSlots[i]);

      					var bagItem = $('.slot'+oldSlots[i]+' img').clone(false);
				      	bagItem.removeAttr('is-clonable');
				      	bagItem.removeAttr('id');
				      	$('.slot'+oldSlots[i]+' img').remove();
				      	$('.slot'+bagSlots[i]).append(bagItem);

				      	bagItem.draggable({
				      		revert: 'invalid',
				        	revertDuration: 100,
				        	start: function(event, ui) { $.playSound('/sound/item'); },
				      	});
 						var quantity = bagItem.attr('item-quantity');
 						if (quantity < 1) quantity = 1;

      					MoveItem(bagItem.attr('item-id'), bagSlots[i], $('.slot'+bagSlots[i]).attr('slot-name'), bagItem.attr('item-icon'), $('.slot'+oldSlots[i]).attr('slot-id'), $('.slot'+oldSlots[i]).attr('slot-name'), quantity);
      				}
      			}

	      	}

	      	if ($(this).attr('slot-id') == -1) { //bag is being deleted

	      		newItem.remove();
	      		return;
			}
	      	newItem.attr('slot-id', $(this).attr('slot-id'));
	      	newItem.attr('slot-name', $(this).attr('slot-name'));
	      	
	      	if (newItem.attr('bundle-id') != undefined) {

	      		console.log(bundle[newItem.attr('bundle-id')]);


	      		if (bundle[newItem.attr('bundle-id')].isBag == 1) {

	      			newItem.attr('is-bag', 1);

	      			var bagSlots = GetBagSlots($(this).attr('slot-id'));

	      			var focusBundle = bundle[newItem.attr('bundle-id')];
	      			for (var i = 0; i < focusBundle.bagData.length; i++) {

	      				if (focusBundle.bagData[i].itemid != undefined) {

	      					//Create an item for the bag slot
	      					var focusItem = focusBundle.bagData[i];
	      					console.log("Adding slot data for "+bagSlots[i]);

	      					if ($(".slot"+bagSlots[i]+" img")) {

	      						console.log("item already exists.. how?");
	      						$(".slot"+bagSlots[i]+" img").remove();
	      					}
	      					$(".slot"+bagSlots[i]).append('<img item-id="'+focusItem.itemid+'" item-quantity="'+focusItem.quantity+'" is-bag="'+focusItem.isBag+'" bag-slots="'+focusItem.bagSlots+'" slot-id="-1" item-icon="'+focusItem.icon+'" data-mask="'+focusItem.slots+'" is-clonable="1" id="findslot-'+i+'" slot-id="'+bagSlots[i]+'" slot-name="'+$("slot-"+bagSlots[i]).attr('slot-name')+'" bundle-id="'+i+'" onmouseup="GetDetails(this)" src="/images/items/item_'+focusItem.icon+'.gif">');
	      					if (focusItem.quantity < 1) focusItem.quantity = 1;
	      					AddItem(focusItem.itemid,bagSlots[i], $(".slot"+bagSlots[i]).attr('slot-name'), focusItem.icon, focusItem.quantity);
	      				}
	      			}
	      		}

	      		newItem.removeAttr('bundle-id');
	      	}
	      	console.log("dropped");
     	},
    	hoverclass: "drop-hover",
	});
});

$('.btn-number').click(function(e){
    e.preventDefault();
    
    fieldName = $(this).attr('data-field');
    type      = $(this).attr('data-type');
    var input = $("input[name='"+fieldName+"']");
    var currentVal = parseInt(input.val());
    if (!isNaN(currentVal)) {
        if(type == 'minus') {
            
            if(currentVal > input.attr('min')) {
                input.val(currentVal - 1).change();
            } 
            if(parseInt(input.val()) == input.attr('min')) {
                $(this).attr('disabled', true);
            }

        } else if(type == 'plus') {

            if(currentVal < input.attr('max')) {
                input.val(currentVal + 1).change();
            }
            if(parseInt(input.val()) == input.attr('max')) {
                $(this).attr('disabled', true);
            }

        }
    } else {
        input.val(0);
    }
});
$('.input-number').focusin(function(){
   $(this).data('oldValue', $(this).val());
});
$('.input-number').change(function() {
    
    minValue =  parseInt($(this).attr('min'));
    maxValue =  parseInt($(this).attr('max'));
    valueCurrent = parseInt($(this).val());
    
    name = $(this).attr('name');
    if(valueCurrent >= minValue) {
        $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the minimum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    if(valueCurrent <= maxValue) {
        $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the maximum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    
    
});
$(".input-number").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
             // Allow: Ctrl+A
            (e.keyCode == 65 && e.ctrlKey === true) || 
             // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
</script>

<script>

function GetDetails(element) {

	target = element;
	//First, fetch generic item info
	if ($(element).hasClass('ui-draggable-dragging')) {

		console.log("Already dragging");
		return;
	}
	console.log("info");
	if ($(element).attr('is-bag') == 1) {

		ToggleBag($(element).attr('slot-id'));
	}
	console.log($(element).attr('item-quantity'));
	var quantity = $(element).attr('item-quantity');

	if (quantity < 1) quantity = 1;
	$('#detail-quantity').val(quantity);

	$('#details-tab').attr('aria-expanded', 'true');
	$('#li-details').addClass('active');
	$('#details').addClass('active in');

	$('#changes-tab').attr('aria-expanded', 'false');
	$('#li-changes').removeClass('active');
	$('#changes').removeClass('active in');

	$.ajax({

	    type: "POST",
	    url: "/rest/public/item/get_by_item_id",
	    data: "id="+$(element).attr('item-id'),
	    success: function (data) {

	      var rest = jQuery.parseJSON(data);
	      if (rest.Status == 1) {

	      	$('#details-name').text(rest.Item.Name);

	      } else {

	        console.log("error occcured");
	      }
	    },

	    error: function() {
	     console.log("ajax related error occured");
	    }
	  });
}


function LoadPlayerInventory() {

	$.ajax({

	    type: "POST",
	    url: "/rest/admin/inventory/get_by_character_id",
	    data: "id=1",
	    success: function (data) {

	      //console.log(data);
	      var rest = jQuery.parseJSON(data);
	      if (rest.Status == 0) {

	      	console.log("Error on returned data");
	      	return;
	      }
	      console.log("Found "+rest.Inventory.length);
	      for (var i = 0; i < rest.Inventory.length; i++) {

			var curItem = rest.Inventory[i];
			$('.slot'+curItem.slotid).append('<img item-id="'+curItem.itemid+'" item-name="'+curItem.Name+'" item-icon="'+curItem.icon+'" slot-id="'+curItem.slotid+'" data-mask="'+curItem.slots+'"  item-quantity="'+curItem.charges+'" class="draggable" id="findslot-'+curItem.slotid+'" src="/images/items/item_'+curItem.icon+'.gif" is-bag='+((curItem.bagslots > 0) ? 1 : 0)+' bag-slots="'+curItem.bagslots+'" onclick="GetDetails(this)">');

	      }


	        $('.draggable').draggable({ 
		    	revert: 'invalid',
		        revertDuration: 100,
		        zIndex: 100,
		        start: function(event, ui) { $.playSound('/sound/item'); },
		    }).each(function() {
		        var top = $(this).position().top;
		        var left = $(this).position().left;
		        $(this).data('orgTop', top);
		        $(this).data('orgLeft', left);
		    });
	      

	    },

	    error: function() {

	     console.log("ajax related error occured");
	    }
	  });
}

function ClearPlayerInventory() {

	$('.slotdrop img').remove();
}

//Rebuild player's inventory from server
function RebuildPlayerInventory() {

	ClearPlayerInventory();
	LoadPlayerInventory();
}

function ToggleBag(slotid) {
	if ($(".bag"+slotid).css("display") == "block") {

		$(".bag"+slotid).css("display", "none");
		$.playSound('/sound/bag');
		bagslotid = -1;
	}
	else {

		//hide unused slots
		slots = GetBagSlots(slotid);
		var numSlots = $(".slot"+slotid+" img").attr('bag-slots');

		if (numSlots < 0) {

			return;
		}
		console.log(numSlots);

		for (var i = 1; i < 10; i++) {

			console.log(i);
			if (numSlots > i) {

				$(".slot"+slots[i]+" div s").css("display", "block");
				continue;
			}

			$(".slot"+slots[i]).css("display", "none");
		}

		$(".bag"+slotid).css("display", "block");
		$.playSound('/sound/bag');
	}
	for (var i = 22; i < 30; i++) {
		if (i == slotid) continue;

		$(".bag"+i).css("display", "none");
	}

	for (var i = 2000; i < 2024; i++) {
		if (i == slotid) continue;

		$(".bag"+i).css("display", "none");
	}
	bagslotid = slotid;

}


function AddBundle() {

	if (target == undefined) return;
	if (bundle == undefined) LoadBundle();

	console.log(bundle);
	
	var bagData = Array();

	if ($(target).attr('is-bag')) {

		var slots = GetBagSlots($(target).attr('slot-id'));
		for (var i = 0; i < slots.length; i++) {

			if ($('.slot'+slots[i]+' img').attr('item-id') != undefined) {

				bagData.push({
					'itemid' : $('.slot'+slots[i]+' img').attr('item-id'),
					'isBag' : ($('.slot'+slots[i]+' img') == 1) ? 1 : 0,
					'bagSlots' : $('.slot'+slots[i]+' img').attr('bag-slots'),
					'icon' : $('.slot'+slots[i]+' img').attr('item-icon'),
					'quantity' : $('.slot'+slots[i]+' img').attr('item-quantity'),
					'slots' :  $('.slot'+slots[i]+' img').attr('data-mask'),
					'name' :  $('.slot'+slots[i]+' img').attr('item-name'),
				});
			} else {
				//Pad it with empty data so that the slot alocation is identical
				bagData.push({

				});
			}
		}
	}

	bundle.push({
		'itemid' : $(target).attr('item-id'),
		'isBag' : ($(target).attr('is-bag') == 1) ? 1 : 0,
		'bagSlots' : $(target).attr('bag-slots'),
		'icon' : $(target).attr('item-icon'),
		'quantity' : $(target).attr('item-quantity'),
		'slots' : $(target).attr('data-mask'),
		'name' : $(target).attr('item-name'),
		'bagData' : bagData,
	});


	console.log(bundle);
	$.playSound('/sound/drink');
	SaveBundle();
}

function RemoveBundle(index) {

	if (bundle == undefined) LoadBundle();
	bundle.splice(index,1);
	SaveBundle();
}

function SaveBundle() {

	if (bundle == undefined) LoadBundle();
	SetCookie('bundle', JSON.stringify(bundle));
	console.log("Save: "+JSON.stringify(bundle));
	RebuildBundle();
}

function LoadBundle() {

	var cdata = GetCookie('bundle');
	if (cdata.length == 0) cdata = "[]";
	console.log("Load: "+cdata);
	bundle = jQuery.parseJSON(cdata);
	RebuildBundle();

}

function RebuildBundle() {

	if (bundle == undefined) return;

	$('.bundleslots li').remove();

	if (bundle.length > 0) $('.bundleslots span').remove();

    for (var i = 0; i < bundle.length; i++) {

    	$('.bundleslots').append('<li class="list-group-item"><span class="bundleloc'+i+'"><span class="slot"> <img item-id="'+bundle[i].itemid+'" is-bag="'+bundle[i].isBag+'" bag-slots="'+bundle[i].bagSlots+'" item-quantity="'+bundle[i].quantity+'" slot-id="-1" item-icon="'+bundle[i].icon+'" data-mask="'+bundle.slots+'" is-clonable="1" id="findslot-'+i+'" bundle-id="'+i+'" onmouseup="GetDetails(this)" src="/images/items/item_'+bundle[i].icon+'.gif"></span><a class="remove-item-text" data-event-index="0" onclick="RemoveBundle('+i+')"><i class="glyphicon glyphicon-remove text-danger" aria-hidden="true"></i></a>'+bundle[i].name+'</span><span class="badge">'+bundle[i].itemid+'</span></li>');

    	$('.bundleloc'+i+' img').draggable({ 
	    	revert: 'invalid',
	        revertDuration: 100,
	        zIndex: 100,
	        start: function(event, ui) { $.playSound('/sound/item'); },
	    });

    }	
}

function FindItem(search, limit, offset) {

	$('.list-group').removeClass('in');	
	if (!search) search = $('.item-search #q').val();
	if (!limit) limit = 5;
	if (!offset) offset = 0;
	search.trim();
  $.ajax({

    type: "POST",
    url: "/rest/public/item/find_all_by_name",
    data: "q="+search+"&limit="+limit+"&offset="+offset,
    success: function (data) {

      //console.log(data);
      var rest = jQuery.parseJSON(data);
      if (rest.Status == 1) {

      	$('.findslots li').remove();

        for (var i = 0; i < rest.Items.length; i++) {

        	$('.findslots').append('<li class="list-group-item"><span class="findloc'+i+'"><span class="slot"> <img item-id="'+rest.Items[i].id+'" is-bag="'+((rest.Items[i].bagslots > 0) ? 1 : 0)+'" item-quantity="1" bag-slots="'+rest.Items[i].bagslots+'" slot-id="-1" item-icon="'+rest.Items[i].icon+'" data-mask="'+rest.Items[i].slots+'" is-clonable="1" id="findslot-'+i+'" item-name="'+rest.Items[i].Name+'" onmouseup="GetDetails(this)" src="/images/items/item_'+rest.Items[i].icon+'.gif"></span>'+rest.Items[i].Name+'</span><span class="badge">'+rest.Items[i].id+'</span></li>');

        	$('.findloc'+i+' img').draggable({

		    	revert: 'invalid',
		        revertDuration: 100,
		        zIndex: 100,
		        start: function(event, ui) { 

		        	$.playSound('/sound/item'); 
		        },
		    });

        }

        $('.list-group').addClass('in');
        $('.item-pagination div').remove();

        var pagination = '<div class="text-center"><ul class="pagination pagination-sm">';
        
        if (offset > 0) {

        	pagination += '<li><a onclick="FindItem(\''+search+'\','+limit+',0)" href="#">«</a></li>';
        } else {

        	pagination += '<li class="disabled"><a>«</a></li>';
        }
        var pageNum = 0;
        for (var i = 0; i < rest.Total; i += limit) {

        	pageNum++;
        	if (offset == i) {

        		pagination += '<li class="active"><a>'+pageNum+'</a></li>';
        	} else {

        		pagination += '<li><a href="#" onclick="FindItem(\''+search+'\','+limit+','+i+')">'+pageNum+'</a></li>';
        	}

        	if (pageNum > 3) {

        		//pagination += '<li><a>..</a></li>';
        		//pagination += '<li><a class="active">'+((offset/limit)+1)+'</a></li>';

        		i = rest.Total;
        	}
        }

        if (offset < (rest.Total - limit)) {

        	pagination += '<li><a href="#" onclick="FindItem(\''+search+'\','+limit+','+(offset+limit)+')">»</a></li>';
        } else {

			pagination += '<li class="disabled"><a>»</a></li>';        	
        }
        pagination += '</ul></div>';

        $('.item-pagination').append(pagination);

      } else {

        console.log("error occcured");
      }
    },

    error: function() {
     console.log("ajax related error occured");
    }
  });
}

function GetBagSlots(bagid) {

    var slots = Array();
    bagid = parseInt(bagid);

    //Equipment Slots
	if (bagid >= 22 && bagid <= 30) {

		offset = bagid-22;
		offset *= 10;
		offset += 251;
		for (var i = offset; i < offset+10; i++) {

			slots.push(i);
		}
	}

	//Bank Slots
	if (bagid >= 2000 && bagid <= 2023) {

		bagOffset = bagid-2000;
		offset = bagOffset * 10;
		offset += 2031;
		offset += bagOffset;

		/*
		2001
		1,
		10

		2041
		*/
		for (var i = offset; i < offset+10; i++) {

			slots.push(i);
		}
	}
	return slots;
}

function AddItem(id, slotid, slotname, icon, quantity) {

	if (quantity < 1) quantity = 1;

	eventLog.push({
		'action' : 1, //1 - add, -1 delete, 2 move
		'itemid' : id,
		'slotid' : slotid,
		'slotname' : slotname,
		'icon' : icon,
		'quantity' : quantity,
	});
	RebuildEventLog();
}

function RemoveItem(id, slotid, slotname, icon, quantity) {

	if (quantity < 1) quantity = 1;
	
	eventLog.push({
		'action' : -1, //1 - add, -1 delete, 2 move
		'itemid' : id,
		'slotid' : slotid,
		'slotname' : slotname,
		'icon' : icon,
		'quantity' : quantity,
	});
	RebuildEventLog();
}

function MoveItem(id, slotid, slotname, icon, oldslotid, oldslotname, quantity) {

	if (quantity < 1) quantity = 1;
	
	eventLog.push({
		'action' : 2, //1 - add, -1 delete, 2 move
		'itemid' : id,
		'slotid' : slotid,
		'slotname' : slotname,
		'oldslotid' : oldslotid,
		'oldslotname' : oldslotname,
		'icon' : icon,
		'quantity' : quantity,
	});
	RebuildEventLog();	
}

function RemoveEvent(index) {

	eventLog.splice(index,1);
	RebuildEventLog();
}


function DoEvent(eventLog) {
	return $.ajax({

	    type: "POST",
	    url: eventLog.urlPath,
	    data: "itemid="+eventLog.itemid+"&slotid="+eventLog.slotid+"&charid="+$('.container').attr('charid')+"&oldslotid="+eventLog.oldslotid+"&refid="+eventLog.refid,
	    success: function (data) {

	      console.log(data);
	      var rest = jQuery.parseJSON(data);
	      if (rest.Status == 1) {

	      	$('.event-item-'+rest.refid+' div span .event-success').show();
	      	$('.event-item-'+rest.refid+' div span').addClass('text-success');
	      	console.log("Success!");
	      } else {

	      	$('.event-item-'+rest.refid+' div span .event-danger').show();
	      	$('.event-item-'+rest.refid+' div span').addClass('text-danger');
	      	console.log("Failure!");
	    
	      }
	    },
	    error: function() {
	    	console.log("ajax related error occured");
		},
	});
}

function SaveEventLog() {

 

	for (var i = 0; i < eventLog.length; i++) {

		$('#saving-text').text('Saving...');

		var urlPath = "/rest/admin/item/";
		if (eventLog[i].action == 1) urlPath += "add";
		if (eventLog[i].action == 2) urlPath += "move";
		if (eventLog[i].action == -1) urlPath += "remove";
		
		eventLog[i].refid = i;
		eventLog[i].urlPath = urlPath;

	}

	eventLog.reduce(function (result, eventItem) {
		return result.then(function() {
			
			return $.ajax({
			    type: "POST",
			    url: eventItem.urlPath,
			    data: "itemid="+eventItem.itemid+"&slotid="+eventItem.slotid+"&charid="+$('.container').attr('charid')+"&oldslotid="+eventItem.oldslotid+"&refid="+eventItem.refid,
			    success: function (data) {
			      console.log("Success "+eventItem.refid);

			      console.log(data);
			      var rest = jQuery.parseJSON(data);
			      if (rest.Status == 1) {

			      	$('.event-item-'+rest.refid+' div span .event-success').show();
			      	$('.event-item-'+rest.refid+' div span').addClass('text-success');
			      	console.log("Success!");
			      } else {

			      	$('.event-item-'+rest.refid+' div span .event-danger').show();
			      	$('.event-item-'+rest.refid+' div span').addClass('text-danger');
			      	console.log("Failure!");
			    
			      }
			    },
			    error: function() {
			    	console.log("ajax related error occured");
				},
			});
		});
	}, $.when())
		.then(function() {
			console.log("Done!");

			RebuildPlayerInventory(1);
			
			$.playSound('/sound/buyitem');

			FlushEventLog(1);
			$('#save-confirm-btn').attr('data-dismiss', 'modal');
			$('#save-confirm-btn').attr('onclick', 'FlushEventLog()');
			$('#saving-text').text('Done.');
			$('#save-confirm-btn').text("Close");
		
		});
}

function FlushEventLog(partial) {
	
	eventLog = Array();
	RebuildEventLog(partial);
}


function RebuildEventLog(partial) {

	console.log("Rebuilding");
	$('#list-changes li').remove();
	if (!partial) $('#event-progress li').remove();
	if (eventLog.length == 0) {

		$('#save-info').show();
		$('#save-btn button').hide();
	} else {

		$('#save-info').hide();
		$('#save-btn button').show();
	}
	$('#save-btn span').text( (eventLog.length > 0) ? eventLog.length : '' );
	
	if (eventLog.length > 0) {

		$('#save-confirm-btn').attr('data-dismiss', '');
		$('#save-confirm-btn').attr('onclick', 'SaveEventLog()');
		$('#save-confirm-btn').text("Save");

	}
	for (var i = 0; i < eventLog.length; i++) {
		var action;

		var content = '<li class="event-item-'+i+' list-group-item"><div class="text-left">'; //<span class="event-text">
		var eventText = content + '<span class="event-text"><i class="glyphicon glyphicon-ok event-success" style="display: none"></i><i class="glyphicon glyphicon-remove event-danger" style="display: none"></i>';

		content += '<a class="remove-item-text" data-event-index="'+i+'" onclick="RemoveEvent('+i+')"><i class="glyphicon glyphicon-remove text-danger" aria-hidden="true"></i></a>';

		message = "";
		if (eventLog[i].action == 1) message += "Add";
		if (eventLog[i].action == -1) message += "Remove";
		if (eventLog[i].action == 2) message += "Move";

		message += ' '+eventLog[i].quantity+' x <img item-id="'+eventLog[i].itemid+'" src="/images/items/item_'+eventLog[i].icon+'.gif"> ('+eventLog[i].itemid+')';
		if (eventLog[i].action == 2) message += " from ("+eventLog[i].oldslotid+")";

		if (eventLog[i].action != -1) message += ' to '+eventLog[i].slotname+' ('+eventLog[i].slotid+')';
		//message = "</span>";
		content += message;
		eventText += message;

		content += '</div></li>';
		
		$('#list-changes').append(content);
		if (!partial) $('#event-progress').append(eventText);

	}
}

function SetCookie(cname, cvalue, exdays) {

    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function GetCookie(cname) {

    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {

        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}

function CheckCookie() {

    var user = GetCookie("username");
    if (user != "") {
        alert("Welcome again " + user);
    } else {
        user = prompt("Please enter your name:", "");
        if (user != "" && user != null) {
            SetCookie("username", user, 365);
        }
    }
}
</script>