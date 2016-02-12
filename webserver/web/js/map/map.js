$('#svgintro').svg({
	onLoad: drawIntro,
});




function doPathing() {

	window.setTimeout(function() {

		for (var i = 0; i < mobs.length; i++) {
			var curMob = mobs[i];
			if (!curMob) continue;
			if (!curMob.Pathgrid) continue;
			if (!grids[curMob.Pathgrid]) continue;
			if (!curMob.circle) continue;
			if (!curMob.Index) {
				curMob.Index = -1;
			}
			curMob.Index++
			var gridEntry = grids[curMob.Pathgrid].Entries[curMob.Index];
			console.log(curMob.circle);

			$(curMob.circle).animate({svgCX: gridEntry.X, svgCY: gridEntry.Y}, 5000);
			//$(curMob.circle).animate({svgR: 100}, 2000);
			//mob.circle.
			console.log("Moving mob to"+gridEntry.X+", "+gridEntry.Y)
			//doPathing();
			//return
		}
	}, 2000)
	
	//if (!mob.gridIndex) {
	//	mob.gridIndex = 0;
	//}
	//window.setTimeout(function (mob) {
		//mob.index++
		
		//console.log("Mob update:" + mob)
	//}, 1000);
}

var grids;
var mobs;

function drawIntro(svg) {
	
    var myrect = svg.rect(25, 25, 150, '25%', 10, 10, 
    {fill: 'none', stroke: 'blue', strokeWidth: 3, 
    transform: 'rotate(0, 100, 75)'}); 
$(myrect).animate({svgWidth: 200, svgHeight: '50%', 
    svgStrokeWidth: '+=7', svgStroke: 'aqua'}, 2000);
   return;
 //  svg.line(g, 108.200000, 485.800000, 108.200000, 466.000000);
$.ajax({
        type: "POST",
        url: "/rest/map/getbyshortname/",
        data: "name=kael",
        success: function (data) {

            var rest = jQuery.parseJSON(data);
            console.log(rest);
            if (rest.Status == 1) {
            	if (rest.Grids && rest.Grids.length > 0) {
                	console.log("Got "+rest.Grids.length + " grids");
                	//var curGrid = rest.Grids[i];
                	grids = rest.Grids;
                }
                if (rest.Lines.length > 0) {
                	svg.clear(g);
                	 var g = svg.group({stroke: 'green', strokeWidth: 1}); 
                	for (var i = 0; i < rest.Lines.length; i++ ) {
                		var curLine = rest.Lines[i];
                		svg.line(g, curLine.X1, curLine.Y1, curLine.X2, curLine.Y2);
                	}
                	$("svg").attr("height", "1000");
                }

                if (rest.Mobs.length > 0) {
                	mobs = rest.Mobs;
                	console.log("Got "+ mobs.length + " mobs");
                	for (var i = 0; i < mobs.length; i++) {                		
                		mobs[i].circle = svg.circle(mobs[i].X, mobs[i].Y, 2, {fill: 'maroon', stroke: 'red', strokeWidth: 1})
                		if (mobs[i].Pathgrid > 0) {
                			doPathing(mobs[i]);
                		}
                	}
                }


            } else {
                console.log("error occcured:" + data);
            }
        },
        error: function () {
            console.log("ajax related error occured");
        }
    });


}