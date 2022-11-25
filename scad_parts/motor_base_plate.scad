include <parameters.scad>;
use <dwengo_logo.scad>;

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

module motor_mounting_holes(){
    for (x = [-3:3]){
        if (x!=0){
            translate([motor_holes_dX * 3 * x, motor_holes_dY / 2]) 
            circle(d=3, false);
            translate([motor_holes_dX * 3 * x, -motor_holes_dY / 2])
            circle(d=3, false);
        }
    }
}

module motor_axel_hole(){
    rounded_rectangle([motor_axel_width, motor_axel_height], 1);
}

module motor_base_plate_slots(){
    translate([base_plate_width/2 - slot_width/2, base_plate_height/2 - (square_hole_diameter + 0.1 + slot_height/2)]){
        square([slot_width, slot_height], true);
    }
        
    translate([-base_plate_width/2 + slot_width/2, base_plate_height/2 - (square_hole_diameter + 0.1 + slot_height/2)]){
        square([slot_width, slot_height], true);
    }
        
     translate([base_plate_width/2 - slot_width/2, -base_plate_height/2 + (square_hole_diameter + 0.1 + slot_height/2)]){
        square([slot_width, slot_height], true);
    }
        
    translate([-base_plate_width/2 + slot_width/2, -base_plate_height/2 + (square_hole_diameter + 0.1 + slot_height/2)]){
        square([slot_width, slot_height], true);
    }
}

module motor_base_plate(){
    difference(){
        rounded_rectangle([base_plate_width, base_plate_height], 5);
        motor_mounting_holes();
        motor_axel_hole();
        //motor_base_plate_slots();
        translate([-base_plate_width/2+1.75, -4]) text("A", font = "Verdana", size = 8);
        translate([0,motor_axel_height/4+base_plate_height/4]) resize([33, 0], auto=true) dwengo_logo();
    }
    
}

motor_base_plate();