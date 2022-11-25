include <parameters.scad>

module rounded_rectangle(size, radius) {
	hull() {
		translate([-(size[0] / 2 - radius), -(size[1] / 2 - radius)])
			circle(radius);
		translate([ (size[0] / 2 - radius), -(size[1] / 2 - radius)])
			circle(radius);
		translate([ (size[0] / 2 - radius),  (size[1] / 2 - radius)])
			circle(radius);
		translate([-(size[0] / 2 - radius),  (size[1] / 2 - radius)])
			circle(radius);
	}
}

module base_plate() {
	translate([35 / 2, 35 / 2])
		rounded_rectangle([35, 35], 1.5);
}

module holes() {
	for(y = [0 : 2])
		translate([0, holes_dy/2 + hole_diameter/2 + y * (5 + hole_diameter)])
			for(x = [0 : 2])
                translate([holes_dx/2 + hole_diameter/2 + x * (5 + hole_diameter), 0]){
                    circle(d=4.7+(y*0.3+x*0.1));
                }	
}

module spyrograph_arm(){
    difference(){
        base_plate();
        holes();
        translate([holes_dx -0.6, 0.5]) text("C", font = "Verdana:style=Bold", size = 4);
    };
}
 spyrograph_arm();