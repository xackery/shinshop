import $ from 'jquery';
import 'bundlemanager.js';

//This represents items that can be packed/unpacked as a bundle
class Bundle {
	constructor(itemid = 0, isbag = 0, bagslots = 0, icon = 0, quantity = 0, slots = 0, itemname = 0, bagdata = Array()) {
		this.Itemid = itemid;
		this.Isbag = isbag;
		this.Bagslots = bagslots;
		this.Icon = icon;
		this.Quantity = quantity;
		this.Slots = slots;
		this.Itemname = itemname;
		this.Bagdata = bagdata;
	}
	
	Set(target) {
		if (target == undefined) return;
		console.log(this);
		
		if ($(target).attr('is-bag')) {
			this.Slots = GetBagSlots($(target).attr('slot-id'));
			for (var i = 0; i < this.Slots.length; i++) {
				if ($('.slot' + this.Slots[i] + ' div').attr('item-id') != undefined) {
					this.Bagdata.push(new Bundle($('.slot' + this.Slots[i] + ' div').attr('item-id'), //itemid
						($('.slot' + this.Slots[i] + ' div') == 1) ? 1 : 0), //isbag
						$('.slot' + this.Slots[i] + ' div').attr('bag-slots'), //bagslots
						$('.slot' + this.Slots[i] + ' div').attr('item-icon'), //icon
						$('.slot' + this.Slots[i] + ' div').attr('item-quantity'), //quantity
						$('.slot' + this.Slots[i] + ' div').attr('data-mask'), //slots
						$('.slot' + this.Slots[i] + ' div').attr('item-name') //itemname
					);
				} else {
					//Pad it with empty data so that the slot alocation is identical
					this.Bagdata.push(new Bundle());
				}
			}
		}
		
		this.Itemid = $(target).attr('item-id');
		this.Isbag = ($(target).attr('is-bag') == 1) ? 1 : 0;
		this.Bagslots = $(target).attr('bag-slots');
		this.icon = $(target).attr('item-icon');
		this.Quantity = $(target).attr('item-quantity');
		this.Slots = $(target).attr('data-mask');
		this.Itemname = $(target).attr('item-name');
		
		console.log(this);
		//$.playSound('/sound/drink');
		
		BundleManager.Add(this);
		BundleManager.Save();
	}
}