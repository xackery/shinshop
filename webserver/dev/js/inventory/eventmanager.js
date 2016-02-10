import $ from 'jquery'

class EventManager {
	
	static AddItem(Itemid, itemname, slotid, slotname, icon, quantity) {
		if (quantity < 1) quantity = 1;
		eventLog.push({
			'action': 1, //1 - add, -1 delete, 2 move, 3 update
			'Itemid': Itemid,
			'itemname': itemname,
			'slotid': slotid,
			'slotname': slotname,
			'icon': icon,
			'quantity': quantity,
		});
		RebuildEventLog();
	}
	
	
function RemoveItem(Itemid, itemname, slotid, slotname, icon, quantity) {
    if (quantity < 1) quantity = 1;

    eventLog.push({
        'action': -1, //1 - add, -1 delete, 2 move, 3 update
        'Itemid': Itemid,
        'itemname': itemname,
        'slotid': slotid,
        'slotname': slotname,
        'icon': icon,
        'quantity': quantity,
    });
    RebuildEventLog();
}
function MoveItem(Itemid, itemname, slotid, slotname, icon, oldslotid, oldslotname, quantity) {
    if (quantity < 1) quantity = 1;

    eventLog.push({
        'action': 2, //1 - add, -1 delete, 2 move, 3 update
        'Itemid': Itemid,
        'itemname': itemname,
        'slotid': slotid,
        'slotname': slotname,
        'oldslotid': oldslotid,
        'oldslotname': oldslotname,
        'icon': icon,
        'quantity': quantity,
    });
    RebuildEventLog();
}
function UpdateItem(Itemid, itemname, slotid, slotname, icon, quantity, oldquantity) {
    if (oldquantity == quantity) {
        return;
    }
    if (quantity < 1) quantity = 1;
    eventLog.push({
        'action': 3, //1 - add, -1 delete, 2 move, 3 update
        'Itemid': Itemid,
        'itemname': itemname,
        'slotid': slotid,
        'slotname': slotname,
        'icon': icon,
        'quantity': quantity,
        'oldquantity': oldquantity,
    });
    RebuildEventLog();
}
function RemoveEvent(index) {
    eventLog.splice(index, 1);
    RebuildEventLog();
}


function DoEvent(eventLog) {
    return $.ajax({
        type: "POST",
        url: eventLog.Urlpath,
        data: "Itemid=" + eventLog.Itemid + "&slotid=" + eventLog.Slotid + "&charid=" + $('.container').attr('charid') + "&oldslotid=" + eventLog.Oldslotid + "&refid=" + eventLog.Refid,
        success: function (data) {
            console.log(data);
            var rest = jQuery.parseJSON(data);
            if (rest.Status == 1) {
                $('.event-item-' + rest.Refid + ' div span .event-success').show();
                $('.event-item-' + rest.Refid + ' div span').addClass('text-success');
                console.log("Success!");
            } else {
                $('.event-item-' + rest.Refid + ' div span .event-danger').show();
                $('.event-item-' + rest.Refid + ' div span').addClass('text-danger');
                console.log("Failure!");

            }
        },
        error: function () {
            console.log("ajax related error occured");
        },
    });
}
// Save All Changes pending on event log
function SaveEventLog() {
    console.log(isSaving);
    if (isSaving) return;
    isSaving = true;

    for (var i = 0; i < eventLog.length; i++) {
        $('#saving-text').text('Saving...');
        var Urlpath = "/rest/inventory/";
        if (eventLog[i].Action == 1) Urlpath += "add";
        if (eventLog[i].Action == 2) Urlpath += "move";
        if (eventLog[i].Action == -1) Urlpath += "remove";
        if (eventLog[i].Action == 3) Urlpath += "update";

        eventLog[i].Refid = i;
        eventLog[i].Urlpath = Urlpath;
    }
    eventLog.reduce(function (result, eventItem) {
        return result.then(function () {

            return $.ajax({
                type: "POST",
                url: eventItem.Urlpath,
                data: "Itemid=" + eventItem.Itemid + "&slotid=" + eventItem.Slotid + "&charid=" + $('.container').attr('charid') + "&oldslotid=" + eventItem.Oldslotid + "&refid=" + eventItem.Refid + "&oldquantity=" + eventItem.oldquantity + "&quantity=" + eventItem.Quantity,
                success: function (data) {
                    console.log("Success " + eventItem.Refid);
                    console.log(data);
                    var rest = jQuery.parseJSON(data);
                    if (rest.Status == 1) {
                        $('.event-item-' + rest.Refid + ' div span .event-success').show();
                        $('.event-item-' + rest.Refid + ' div span').addClass('text-success');
                        console.log("Success!");
                    } else {
                        $('.event-item-' + rest.Refid + ' div span .event-danger').show();
                        $('.event-item-' + rest.Refid + ' div span').addClass('text-danger');
                        console.log("Failure!");

                    }
                    isSaving = false;
                },
                error: function () {
                    console.log("ajax related error occured");
                    isSaving = false;
                },
            });
        });
    }, $.when())
        .then(function () {

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
    $('#list-changes li').remove();
    if (!partial) $('#event-progress li').remove();
    if (eventLog.length == 0) {
        $('#save-info').show();
        $('#save-btn button').hide();
    } else {
        $('#save-info').hide();
        $('#save-btn button').show();
    }
    $('#save-btn span').text((eventLog.length > 0) ? eventLog.length : '');

    if (eventLog.length > 0) {
        $('#save-confirm-btn').attr('data-dismiss', '');
        $('#save-confirm-btn').attr('onclick', 'SaveEventLog()');
        $('#save-confirm-btn').text("Save");
    }
    for (var i = 0; i < eventLog.length; i++) {
        var content = '<li class="event-item-' + i + ' list-group-item"><div class="text-left">'; //<span class="event-text">
        var eventText = content + '<span class="event-text"><i class="glyphicon glyphicon-ok event-success" style="display: none"></i><i class="glyphicon glyphicon-remove event-danger" style="display: none"></i>';
        content += '<a class="remove-item-text" data-event-index="' + i + '" onclick="RemoveEvent(' + i + ')"><i class="glyphicon glyphicon-remove text-danger" aria-hidden="true"></i></a>';
        var message = "";

        switch (eventLog[i].Action) {
            case 1:
                message += "Add";
                break;
            case -1:
                message += "Remove";
                break;
            case 2:
                message += "Move";
                break;
            case 3:
                message += "Change quantity from	" + eventLog[i].oldquantity + " to " + eventLog[i].Quantity;
                break;
        }
        message += ' <div class="slot"><div class="item-display" item-id="' + eventLog[i].Itemid + '" style="background: url(\'/img/items/item_' + eventLog[i].Icon + '.gif\'); float: left; position: relative">' + ((eventLog[i].Quantity > 1) ? '<div class="item-stack-border"><span class="item-stack-count">' + eventLog[i].Quantity + '</span></div>' : '') + '</div></div> ' + eventLog[i].itemname + ' (' + eventLog[i].Itemid + ')';
        if (eventLog[i].Action == 2) message += ' from ' + eventLog[i].oldslotname + ' (Slot ' + eventLog[i].Oldslotid + ')';
        if (eventLog[i].Action != -1) message += ' to ' + eventLog[i].slotname + ' (Slot ' + eventLog[i].Slotid + ')';
        //message = "</span>";
        content += message;
        eventText += message;
        content += '</div></li>';

        $('#list-changes').append(content);
        if (!partial) $('#event-progress').append(eventText);
    }
}

}