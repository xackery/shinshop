$('#svgintro').svg({
	onLoad: drawIntro,
});
function drawIntro(svg) {
	
    svg.circle(75, 75, 50, 
        {fill: 'none', stroke: 'red', strokeWidth: 1});
   
 //  svg.line(g, 108.200000, 485.800000, 108.200000, 466.000000);	
$.ajax({
        type: "POST",
        url: "/rest/map/getbyshortname/",
        data: "name=mischiefplane",
        success: function (data) {
            var rest = jQuery.parseJSON(data);
            if (rest.Status == 1) {
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
                	console.log("Got "+ rest.Mobs.length + " mobs")
                	for (var i = 0; i < rest.Mobs.length; i++) {
                		var curMob = rest.Mobs[i]
                		svg.circle(curMob.X, curMob.Y, 2, {fill: 'maroon', stroke: 'red', strokeWidth: 1})
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