//calibrations
//Actual measured size of the components
measured_hole_diameter = 5;
measured_squared_hole_width = 3.7;
measured_squared_hole_height = 5.4;
measured_pen_hole_diameter = 8.25;

//Dimensions for correct fit on 3d printer in the lab
3d_print_hole_diameter = 5.1;
3d_print_squared_hole_width = 3.7;
3d_print_squared_hole_height = 5.3;

//Dimensions for correct fit on laser cutter fablab UGent
laser_hole_diameter = 4.7;
laser_squared_hole_width = 3.35;
laser_squared_hole_height = 5.05;

// common
hole_diameter = laser_hole_diameter;
holes_dx = 8;
holes_dy = holes_dx;
squared_hole_width = laser_squared_hole_width;
squared_hole_height = laser_squared_hole_height;
pen_hole_diameter = measured_pen_hole_diameter;   // Not calibrated yet
slot_width = 20;
slot_height = 3.3;
$fn = 100;

// base plate: 211.2 is a multiple of 0.8 plus 0.32.
// This ensures the side attachment holes are at lego distance from eachother
base_plate_width = 211.2;
base_plate_height = 35;
motor_holes_dX = holes_dx;
motor_holes_dY = 17.5;
motor_axel_width = 190;
motor_axel_height = 7.5;
motor_axel_wide_slot_height = 22.2;

// arm
arm_holes_columns = 7;
arm_holes_rows = 1;
hole_spacing_arm_x = 22.8;
hole_spacing_arm_y = 22.8;
arm_width = holes_dx + (arm_holes_columns) * hole_diameter + (arm_holes_columns - 1) * hole_spacing_arm_x;
arm_height = holes_dy + (arm_holes_rows) * hole_diameter + (arm_holes_rows - 1) * hole_spacing_arm_y;
pen_hole_diameter = 9;

// front connector
front_connector_width = 106;
front_connector_height = 8;

// corner connector
cconn_width = 40;
cconn_height = 15;
cconn_hole_offset = 5;

// motor spacer
motor_spacer_outer_diameter = 15;
motor_spacer_inner_diameter = 8;

// pen attachment
pen_holes_columns = 3;
pen_holes_rows = 1;
pen_base_width = holes_dx - hole_diameter + pen_holes_columns * holes_dx;
pen_base_height = holes_dy - hole_diameter + pen_holes_rows * holes_dy;
pen_outer_diameter = 20;
pen_inner_diameter = 10;

//enclosure
enclosure_width = 219;
enclosure_height = 152;

