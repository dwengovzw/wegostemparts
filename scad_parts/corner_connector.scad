include <parameters.scad>;

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

module hole() {
	translate([cconn_width - cconn_hole_offset - hole_diameter/2, cconn_hole_offset + hole_diameter/2])
        circle(d=hole_diameter);
}

module motor_attachment_hole(square_hole_radius, square_hole_width){
    translate([cconn_hole_offset + hole_diameter / 2, cconn_hole_offset + hole_diameter / 2])
        square_circle_hole(square_hole_radius, square_hole_width);
}

module square_circle_hole(square_hole_radius, square_hole_width){
    intersection(){
        circle(d=square_hole_radius);
        scale(v=[1, 3]){
            square(square_hole_width, true);
        };
    };
}

module corner_connector(square_hole_radius, square_hole_width){
    difference(){
        translate([cconn_width / 2, cconn_height / 2]) rounded_rectangle([cconn_width, cconn_height], 1.5);
        hole();
        motor_attachment_hole(square_hole_radius, square_hole_width);
        translate([16, 3.5]) text("B", font = "Verdana", size = 8);
    }
}



corner_connector(squared_hole_height, squared_hole_width);







