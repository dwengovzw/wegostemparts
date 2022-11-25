//include <parameters.scad>;
//include <corner_connector.scad>;
$fn = 100;

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


module square_circle_hole(square_hole_radius, square_hole_width){
    intersection(){
        circle(d=square_hole_radius);
        scale(v=[1, 3]){
            square(square_hole_width, true);
        };
    };
}

module holes_range(){
    for(i = [1 : 10]){
        for(j = [1 : 10]){
               translate([i*10, j*10])
                   square_circle_hole(5.0+j*0.05, 3.3 + i * 0.05);
        }
    }
}

module hole_measurement_piece(){
    difference(){
        translate([55, 55]) rounded_rectangle([110, 110], 1.5);
        holes_range();
    }
}

hole_measurement_piece();