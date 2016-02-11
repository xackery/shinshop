import $ from 'jquery'

class ItemManager {
		
	static FindItem(search, limit, offset) {
		$('.list-group').removeClass('in');
		if (!search) search = $('.item-search #q').val();
		if (!limit) limit = 5;
		if (!offset) offset = 0;
		search.trim();
		$.ajax({
			type: "POST",
			url: "/rest/item/find_all_by_name",
			data: "q=" + search + "&limit=" + limit + "&offset=" + offset,
			success: function (data) {
				//console.log(data);
				var rest = $.parseJSON(data);
				if (rest.Status == 1) {
					$('.findslots li').remove();
					for (var i = 0; i < rest.Items.length; i++) {
						$('.findslots').append('<li class="list-group-item"><span class="findloc' + i + '"><span class="slot"> <div class="item icon-' + rest.Items[i].Icon + '" item-id="' + rest.Items[i].id + '" item-name="' + rest.Items[i].Name + '" is-bag="' + ((rest.Items[i].bagslots > 0) ? 1 : 0) + '" item-quantity="1" bag-slots="' + rest.Items[i].bagslots + '" slot-id="-1" item-icon="' + rest.Items[i].Icon + '" data-mask="' + rest.Items[i].slots + '" is-clonable="1" id="findslot-' + i + '" onmouseup="GetItemDetails(this)"></div></span>' + rest.Items[i].Name + '</span><span class="badge">' + rest.Items[i].id + '</span></li>');
						$('.findloc' + i + ' div').draggable({
							revert: 'invalid',
							revertDuration: 100,
							zIndex: 100,
							start: function (event, ui) {
								$.playSound('/sound/item');
							},
						});
					}
					$('.list-group').addClass('in');
					$('.item-pagination div').remove();
					var pagination = '<div class="text-center"><ul class="pagination pagination-sm">';

					if (offset > 0) {
						pagination += '<li><a onclick="FindItem(\'' + search + '\',' + limit + ',0)" href="#">«</a></li>';
					} else {
						pagination += '<li class="disabled"><a>«</a></li>';
					}
					var pageNum = 0;
					for (var i = 0; i < rest.Total; i += limit) {
						pageNum++;
						if (offset == i) {
							pagination += '<li class="active"><a>' + pageNum + '</a></li>';
						} else {
							pagination += '<li><a href="#" onclick="FindItem(\'' + search + '\',' + limit + ',' + i + ')">' + pageNum + '</a></li>';
						}
						if (pageNum > 3) {
							//pagination += '<li><a>..</a></li>';
							//pagination += '<li><a class="active">'+((offset/limit)+1)+'</a></li>';
							i = rest.Total;
						}
					}
					if (offset < (rest.Total - limit)) {
						pagination += '<li><a href="#" onclick="FindItem(\'' + search + '\',' + limit + ',' + (offset + limit) + ')">»</a></li>';
					} else {
						pagination += '<li class="disabled"><a>»</a></li>';
					}
					pagination += '</ul></div>';
					$('.item-pagination').append(pagination);
				} else {
					console.log("error occcured");
				}
			},
			error: function () {
				console.log("ajax related error occured");
			}
		});
	}
}