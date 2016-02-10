import $ from 'jquery'
import 'inventorymanager.js'
import 'bundlemanager.js'

$(document).ready(function () {
    $.extend({
        playSound: function () {
            return $("<embed src='" + arguments[0] + ".mp3' hidden='true' autostart='true' loop='false' class='playSound'>" + "<audio autoplay='autoplay' style='display:none;' controls='controls'><source src='" + arguments[0] + ".mp3' /><source src='" + arguments[0] + ".ogg' /></audio>").appendTo('body');
        }
    });
});

var eventLog = Array();
var target;
var bagslotid;
var bundle;
var isSaving = false;

$(document).ready(function () {
	InventoryManager.Rebuild();
	BundleManager.Load();

    $('#detail-quantity-slider').slider({
        min: 1,
        max: 20,
        val: 1,
        slide: function (event, ui) {
            $("#detail-quantity").text(ui.value);
        }
    });
    $('#save-confirm').on('hidden.bs.modal', function () {

        if ($('#save-confirm-btn').text() == "Close") {

            $('#save-confirm').hide();
            RebuildPlayerInventory();
            //	location.reload();
        }
    });

    $(".item-search #q").keyup(function (event) {

        if (event.keyCode == 13) {

            $(".item-search #search-button").click();
        }
    });

    $('#detail-quantity-slider').slider();

    $('.draggable').draggable({
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

    $(".slotdrop").droppable({
        accept: function (draggable) {
            return (!$(this).find('div').length && //has no item in it
                (
                    ($(this).attr("data-mask") == undefined) ||  //it's ok if no mask set
                    ( //it's ok if slot mask = data mask, and data mask is not 0
                        ($(this).attr("data-mask") & draggable.attr('data-mask')) == draggable.attr('data-mask')
                        && draggable.attr('data-mask') != 0
                        )
                    )
                );
        },

        drop: function (event, ui) {
            $.playSound('/sound/item');
            ui.draggable.css({
                'left': '',
                'top': ''
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


            if (newItem.attr('slot-id') == -1) {

                AddItem(newItem.attr("item-id"), newItem.attr("item-name"), $(this).attr("slot-id"), $(this).attr('slot-name'), newItem.attr('item-icon'), newItem.attr("item-quantity"));

            } else if ($(this).attr('slot-id') == -1) {

                RemoveItem(newItem.attr("item-id"), newItem.attr("item-name"), newItem.attr("slot-id"), $(this).attr('slot-name'), newItem.attr('item-icon'), newItem.attr("item-quantity"));


            } else {

                MoveItem(newItem.attr("item-id"), newItem.attr("item-name"), $(this).attr("slot-id"), $(this).attr('slot-name'), newItem.attr('item-icon'), newItem.attr("slot-id"), newItem.attr('slot-name'), newItem.attr("item-quantity"));

            }


            if (newItem.attr('is-bag') == 1) { //item dragged is a bag

                var bagSlots = GetBagSlots($(this).attr('slot-id'));
                var oldSlots = GetBagSlots(newItem.attr('slot-id'));

                for (var i = 0; i < oldSlots.length; i++) { //iterate bag slots
                    console.log("slot " + oldSlots[i]);

                    var oldSlotItem = $('.slot' + oldSlots[i] + ' div');

                    if (oldSlotItem.attr('item-id') != undefined) {

                        if ($(this).attr('slot-id') == -1) { //bag is being deleted
			      		
                            var quantity = oldSlotItem.attr('item-quantity');
                            if (quantity < 1) quantity = 1;

                            RemoveItem(oldSlotItem.attr('item-id'), oldSlotItem.attr('item-name'), oldSlots[i], oldSlotItem.attr('slot-name'), oldSlotItem.attr('item-icon'), quantity);

                            oldSlotItem.remove();
                            continue;
                        }

                        //moving from an old bag slot

                        var bagItem = $('.slot' + oldSlots[i] + ' div').clone(false);
                        bagItem.removeAttr('is-clonable');
                        bagItem.removeAttr('id');
                        $('.slot' + oldSlots[i] + ' div').remove();
                        $('.slot' + bagSlots[i]).append(bagItem);

                        bagItem.draggable({
                            revert: 'invalid',
                            revertDuration: 100,
                            start: function (event, ui) { $.playSound('/sound/item'); },
                        });
                        var quantity = bagItem.attr('item-quantity');
                        if (quantity < 1) quantity = 1;

                        MoveItem(bagItem.attr('item-id'), bagItem.attr('item-name'), bagSlots[i], $('.slot' + bagSlots[i]).attr('slot-name'), bagItem.attr('item-icon'), $('.slot' + oldSlots[i]).attr('slot-id'), $('.slot' + oldSlots[i]).attr('slot-name'), quantity);
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

                if (bundle[newItem.attr('bundle-id')].isBag == 1) {

                    newItem.attr('is-bag', 1);

                    var bagSlots = GetBagSlots($(this).attr('slot-id'));

                    var focusBundle = bundle[newItem.attr('bundle-id')];
                    for (var i = 0; i < focusBundle.bagData.length; i++) {

                        if (focusBundle.bagData[i].Itemid != undefined) {

                            //Create an item for the bag slot
                            var focusItem = focusBundle.bagData[i];
                            if ($(".slot" + bagSlots[i] + " div")) {

                                console.log("item already exists.. how?");
                                $(".slot" + bagSlots[i] + " div").remove();
                            }

                            $(".slot" + bagSlots[i]).append('<div class="item icon-' + focusItem.Icon + '" item-id="' + focusItem.Itemid + '" item-name="' + focusItem.itemname + '" item-quantity="' + focusItem.Quantity + '" is-bag="' + focusItem.isBag + '" bag-slots="' + focusItem.bagSlots + '" item-icon="' + focusItem.Icon + '" data-mask="' + focusItem.slots + '" is-clonable="1" id="findslot-' + i + '" slot-id="' + bagSlots[i] + '" slot-name="' + $("slot-" + bagSlots[i]).attr('slot-name') + '" bundle-id="' + i + '" onmouseup="GetItemDetails(this)" style="background: url(\'/img/items/item_' + focusItem.Icon + '.gif\')">' + ((focusItem.Quantity > 1) ? '<div class="item-stack-border"><span class="item-stack-count">' + focusItem.Quantity + '</span></div>' : '') + '</div>');
                            $(".slot" + bagSlots[i] + " div")

                            if (focusItem.Quantity < 1) focusItem.Quantity = 1;
                            AddItem(focusItem.Itemid, focusItem.itemname, bagSlots[i], $(".slot" + bagSlots[i]).attr('slot-name'), focusItem.Icon, focusItem.Quantity);
                        }
                    }
                }


                newItem.removeAttr('bundle-id');
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
        hoverclass: "drop-hover",
    });
});

$('.btn-number').click(function (e) {
    e.preventDefault();

    var fieldName = $(this).attr('data-field');
    var type = $(this).attr('data-type');
    var input = $("input[name='" + fieldName + "']");
    var currentVal = parseInt(input.val());
    if (!isNaN(currentVal)) {
        if (type == 'minus') {

            if (currentVal > input.attr('min')) {
                input.val(currentVal - 1).change();
            }
            if (parseInt(input.val()) == input.attr('min')) {
                $(this).attr('disabled', true);
            }

        } else if (type == 'plus') {

            if (currentVal < input.attr('max')) {
                input.val(currentVal + 1).change();
            }
            if (parseInt(input.val()) == input.attr('max')) {
                $(this).attr('disabled', true);
            }

        }
    } else {
        input.val(0);
    }
});
$('.input-number').focusin(function () {
    $(this).data('oldValue', $(this).val());
});
$('.input-number').change(function () {

   var minValue = parseInt($(this).attr('min'));
   var maxValue = parseInt($(this).attr('max'));
   var valueCurrent = parseInt($(this).val());

    name = $(this).attr('name');
    if (valueCurrent >= minValue) {
        $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
    } else {
        alert('Sorry, the minimum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    if (valueCurrent <= maxValue) {
        $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
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