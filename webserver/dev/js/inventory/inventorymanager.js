import $ from 'jquery';

class InventoryManager {

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
		ajax({
			type: "POST",
			url: "/rest/inventory/getbycharacterid",
			data: "id=" + $('.container').attr('charid'),
			success: function (data) {
				//console.log(data);
				var rest = jQuery.parseJSON(data);
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