drawIntro();


function doPathing() {

	window.setTimeout(function() {
		//for (var i = 0; i < 1; i++) {
		for (var i = 0; i < mobs.length; i++) {
			var curMob = mobs[i];
			if (!curMob) continue;
			if (!curMob.Pathgrid) continue;
			if (!grids[curMob.Pathgrid]) continue;
			if (!curMob.circle) continue;
			if (!curMob.Index) {
				curMob.Index = 0;
			}
			curMob.Index++
			if (!grids[curMob.Pathgrid].Entries[curMob.Index]) {
				console.log(curMob.Pathgrid + "has no index on "+ curMob.Index);
				curMob.Index = 0;
				continue;
			}
			
			var gridEntry = grids[curMob.Pathgrid].Entries[curMob.Index];
			var newX = parseFloat(curMob.circle.attr("cx")) + parseFloat(gridEntry.X);
			var newY = parseFloat(curMob.circle.attr("cy")) + parseFloat(gridEntry.Y);
			
			console.log("Moving "+curMob.circle+" to grid "+curMob.Index+" loc "+newX+", "+newY);
			//console.log(curMob.circle);

			curMob.circle.animate({cx: newX, cy: newY}, 2000);
			//$(curMob.circle).animate({svgR: 100}, 2000);
			//mob.circle.
			//doPathing();
		}
		doPathing();
	}, 5000)
	
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

var s = Snap(2000, 2000);

function drawIntro(svg) {
	//doPathing()
//	s = Snap(2000, 2000);
	//s.circle(300, 300, 100);
	//s.line(500,500,300,100).attr({strokeWidth:1, stroke:"green"});
//	var cir = s.circle(300, 300, 2).attr({strokeWidth: 1, stroke:"red", fill:"maroon"});
//	console.log((parseFloat(cir.attr("cx"))+parseFloat(100)))
	//cir.animate({cx: 445.5260009765625, cy: 301.7739990234375}, 5000);
//	return;
 //  svg.line(g, 108.200000, 485.800000, 108.200000, 466.000000);
$.ajax({
        type: "POST",
        url: "/rest/map/getbyshortname/",
        data: "name="+name,
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
                	s.clear();
                	// var g = svg.group({stroke: 'green', strokeWidth: 1}); 
                	for (var i = 0; i < rest.Lines.length; i++ ) {
                		var curLine = rest.Lines[i];
                		s.line(curLine.X1, curLine.Y1, curLine.X2, curLine.Y2).attr({strokeWidth:1, stroke:"green"});
                	}
                }

                if (rest.Mobs.length > 0) {
                	mobs = rest.Mobs;
                	console.log("Got "+ mobs.length + " mobs");
                	for (var i = 0; i < mobs.length; i++) {                		
                		mobs[i].circle = s.circle(mobs[i].X, mobs[i].Y, 2).attr({fill: 'maroon', stroke: 'red', strokeWidth: 1});
                		if (mobs[i].Pathgrid > 0) {
                			//doPathing(mobs[i]);
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