import $ from 'jquery';
import 'cookiemanager.js';
import 'bundle.js';

class BundleManager {
	static bundles;
	
	//Load Bundle data from cookies
   	static Load() {		
		var cdata = CookieManager.Get('bundle');
		if (cdata.length == 0) cdata = "[]";
		console.log("Load: " + cdata);
		bundle = $.parseJSON(cdata);
		this.Rebuild();
    }
	
	static Save() {
		 CookieManager.Set('bundle', JSON.stringify(bundle))
		console.log("Save: " + JSON.stringify(bundle));
		this.Rebuild();
    }
	
	static Remove(index) {
		if (bundle == undefined) LoadBundle();
		bundle.splice(index, 1);
		SaveBundle();
	}
	
	//Flush the bundles
	static Rebuild() {
    	$('.bundleslots li').remove();
    	if (bundle.length == 0) {
        	$('.bundleslots span').remove();
        	return;
    	}
    	for (var i = 0; i < bundle.length; i++) {
        	$('.bundleslots').append('<li class="list-group-item"><span class="bundleloc' + i + '"><span class="slot"> <div class="item icon-' + bundle[i].Icon + '" item-id="' + bundle[i].Itemid + '" item-name="' + bundle[i].itemname + '" is-bag="' + bundle[i].isBag + '" bag-slots="' + bundle[i].bagSlots + '" item-quantity="' + bundle[i].Quantity + '" slot-id="-1" item-icon="' + bundle[i].Icon + '" data-mask="' + bundle.slots + '" is-clonable="1" id="findslot-' + i + '" bundle-id="' + i + '" onmouseup="GetItemDetails(this)" ></div></span><a class="remove-item-text" data-event-index="0" onclick="RemoveBundle(' + i + ')"><i class="glyphicon glyphicon-remove text-danger" aria-hidden="true"></i></a>' + bundle[i].itemname + '</span><span class="badge">' + bundle[i].Itemid + '</span></li>');
        	$('.bundleloc' + i + ' div').draggable({
				revert: 'invalid',
				revertDuration: 100,
				zIndex: 100,
				start: function (event, ui) { $.playSound('/sound/item'); },
			});
		}
	}
}