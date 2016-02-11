import $ from 'jquery';
import CookieManager from 'cookiemanager.js';
import 'bundle.js';

export default class BundleManager {
	
	//Load bundle data from cookies
   	static Load() {		
		var cdata = CookieManager.Get('bundle');
		if (cdata.length == 0) cdata = "[]";
		console.log("Load: " + cdata);
		this.bundles = $.parseJSON(cdata);
		this.Rebuild();
    }
	
	static Save() {
		
		CookieManager.Set('bundle', JSON.stringify(this.bundles))
		console.log("Save: " + JSON.stringify(this.bundles));
		this.Rebuild();
    }
	
	static Remove(index) {				
		this.bundles.splice(index, 1);
		this.Save();
	}
	
	//Flush the Bundles
	static Rebuild() {
    	$('.this.bundleslots li').remove();
    	if (this.bundles.length == 0) {
        	$('.bundleslots span').remove();
        	return;
    	}
    	for (var i = 0; i < this.bundles.length; i++) {
			var curBundle = this.bundles[i];
			
        	$('.this.bundleslots').append('<li class="list-group-item"><span class="this.bundleloc' + i + '"><span class="slot"> <div class="item icon-' + curBundle.Icon + '" item-id="' + curBundle.Itemid + '" item-name="' + curBundle.itemname + '" is-bag="' + curBundle.isBag + '" bag-slots="' + curBundle.bagSlots + '" item-quantity="' + curBundle.Quantity + '" slot-id="-1" item-icon="' + curBundle.Icon + '" data-mask="' + curBundle.slots + '" is-clonable="1" id="findslot-' + i + '" this.bundle-id="' + i + '" onmouseup="GetItemDetails(this)" ></div></span><a class="remove-item-text" data-event-index="0" onclick="Removethis.bundle(' + i + ')"><i class="glyphicon glyphicon-remove text-danger" aria-hidden="true"></i></a>' + curBundle.itemname + '</span><span class="badge">' + curBundle.Itemid + '</span></li>');
        	$('.this.bundleloc' + i + ' div').draggable({
				revert: 'invalid',
				revertDuration: 100,
				zIndex: 100,
				start: function (event, ui) { $.playSound('/sound/item'); },
			});
		}
	}
}