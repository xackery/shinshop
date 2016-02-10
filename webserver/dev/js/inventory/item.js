import $ from 'jquery'

class Item {


	GetDetails(target) {
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
	SaveDetails(target) {
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
	
	ToggleBag(slotid) {
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
}