import $ from 'jquery';

export class InventoryManager {

	static GetItemDetails(target) {
		if (!target) {
			console.log("Empty element?!")
			return;
		}
		
		//First, fetch generic item info
		if ($(target).hasClass('ui-draggable-dragging')) {
			console.log("Already dragging");
			return;
		}
		if ($(target).attr('is-bag') == 1) {
			ToggleBag($(target).attr('slot-id'));
		}
		//console.log($(target).attr('item-quantity'));
		//var quantity = $(target).attr('item-quantity');
		////if (quantity < 1) quantity = 1;
		////$('#detail-quantity').val(quantity);
		$('#details-tab').attr('aria-expanded', 'true');
		$('#li-details').addClass('active');
		$('#details').addClass('active in');
		$('#changes-tab').attr('aria-expanded', 'false');
		$('#li-changes').removeClass('active');
		$('#changes').removeClass('active in');
		$.ajax({
			type: "POST",
			url: "/rest/item/getbyid",
			data: "id=" + $(target).attr('item-id'),
			success: function (data) {
				var rest = $.parseJSON(data);
				if (rest.Status == 1) {
					if (rest.Item.stacksize < 2) {
						$('#detail-quantity-slider').hide();
					} else {
						$('#details-name').text(rest.Item.Name);
						$('#detail-quantity-slider').slider("option", "max", rest.Item.stacksize);
						$('#detail-quantity-slider').slider("value", $(target).attr('item-quantity'));
						$("#detail-quantity").text($(target).attr('item-quantity'));
						$('#detail-quantity-slider').show();
					}
				} else {
					console.log("error occcured");
				}
			},
			error: function () {
				console.log("ajax related error occured");
			}
		});	
	}
	
	static SaveItemDetails(target) {
		var newItem = $(target);
		UpdateItem(newItem.attr("item-id"), newItem.attr("item-name"), newItem.attr("slot-id"), newItem.attr('slot-name'), newItem.attr('item-icon'), $('#detail-quantity-slider').slider("option", "value"), newItem.attr("item-quantity"));
		newItem.attr('item-quantity', $('#detail-quantity-slider').slider("option", "value"));
		console.log(newItem.find("div span"));
		newItem.find("div span").text($('#detail-quantity-slider').slider("option", "value"));
		
		//update tab
		$('#details-tab').attr('aria-expanded', 'false');
		$('#li-details').removeClass('active');
		$('#details').removeClass('active in');
		$('#changes-tab').attr('aria-expanded', 'true');
		$('#li-changes').addClass('active');
		$('#changes').addClass('active in');
	}
	
	static ToggleBag(slotid) {
		if ($(".bag" + slotid).css("display") == "block") {
		$(".bag" + slotid).css("display", "none");
		$.playSound('/sound/bag');
		bagslotid = -1;
		}
		else {
		//hide unused slots
		var slots = GetBagSlots(slotid);
		var numSlots = $(".slot" + slotid + " div").attr('bag-slots');
		if (numSlots < 0) {
		return;
		}
		for (var i = 1; i < 10; i++) {
		if (numSlots > i) {
		$(".slot" + slots[i] + " div s").css("display", "block");
		continue;
		}
		$(".slot" + slots[i]).css("display", "none");
		}
		$(".bag" + slotid).css("display", "block");
		$.playSound('/sound/bag');
		}
		for (var i = 22; i < 30; i++) {
		if (i == slotid) continue;
		$(".bag" + i).css("display", "none");
		}
		for (var i = 2000; i < 2024; i++) {
		if (i == slotid) continue;
		$(".bag" + i).css("display", "none");
		}
		bagslotid = slotid;
	}
	
	static GetBagSlots(bagid) {
		var slots = Array();
		bagid = parseInt(bagid);
		//Equipment Slots
		if (bagid >= 22 && bagid <= 30) {
			var offset = bagid - 22;
			offset *= 10;
			offset += 251;
			for (var i = offset; i < offset + 10; i++) {
				slots.push(i);
			}
		}
		//Bank Slots
		if (bagid >= 2000 && bagid <= 2023) {
			var bagOffset = bagid - 2000;
			offset = bagOffset * 10;
			offset += 2031;
			offset += bagOffset;
			/*
			2001
			1,
			10
			2041
			*/
			for (var i = offset; i < offset + 10; i++) {
				slots.push(i);
			}
		}
		return slots;
	}

	static Load() {
		$.ajax({
			type: "POST",
			url: "/rest/inventory/getbycharacterid",
			data: "id=" + $('.container').attr('charid'),
			success: function (data) {
				//console.log(data);
				var rest = $.parseJSON(data);
				if (rest.Status == 0) {
					console.log("Error on returned data");
					return;
				}
				console.log("Found " + rest.Inventory.length);
				for (var i = 0; i < rest.Inventory.length; i++) {
					var curItem = rest.Inventory[i];
					$('.slot' + curItem.Slotid).append('<div class="item icon-' + curItem.Icon + '" item-id="' + curItem.Itemid + '" item-name="' + curItem.Name + '" item-icon="' + curItem.Icon + '" slot-id="' + curItem.Slotid + '" data-mask="' + curItem.Slots + '" slot-name="' + $('.slot' + curItem.Slotid).attr('slot-name') + '" item-quantity="' + curItem.Charges + '" class="draggable" id="findslot-' + curItem.Slotid + '"  is-bag=' + ((curItem.Bagslots > 0) ? 1 : 0) + ' bag-slots="' + curItem.Bagslots + '"	onclick="GetItemDetails(this)">' + ((curItem.Charges > 1) ? '<div class="item-stack-border"><span class="item-stack-count">' + curItem.Charges + '</span></div>' : '') + '</div>');
				}
				$('.item').draggable({
					revert: 'invalid',
					revertDuration: 100,
					zIndex: 100,
					start: function (event, ui) { $.playSound('/sound/item'); },
				}).each(function () {
					var top = $(this).position().top;
					var left = $(this).position().left;
					$(this).data('orgTop', top);
					$(this).data('orgLeft', left);
				});

			},
			error: function () {
				console.log("ajax related error occured");
			}
		});
	}
	
	static Clear() {
		$('.slotdrop div').remove();
	}

	static Reload() {
		this.Clear()
		this.Load()
	}
}