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
	translate([arm_width / 2, arm_height / 2])
		rounded_rectangle([arm_width, arm_height], 1.5);
}

module holes() {
	for(y = [0 : arm_holes_rows - 1])
		translate([0, holes_dy/2 + hole_diameter/2 + y * (hole_spacing_arm_y + hole_diameter)])
			for(x = [0 : arm_holes_columns - 1])
                translate([holes_dx/2 + hole_diameter/2 + x * (hole_spacing_arm_x + hole_diameter), 0]){
                    circle(d=hole_diameter);
                }	
}

module spyrograph_arm(){
    difference(){
        base_plate();
        holes();
        translate([hole_spacing_arm_x/2 + hole_diameter, 4]) text("C", font = "Verdana:style=Bold", size = 4);
    };
}
spyrograph_arm();