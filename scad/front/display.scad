use <./../rounded_cube.scad>;

module display() {
    display_base_marign = 2;
    pcb_width = 35.5;
    pcb_height = 33.5;
    thread_insert_radius = 2.25;
    thread_insert_height = 5;
    wall_thickness = 7;

    display_base_width = pcb_width+2*display_base_marign;
    display_base_height = pcb_height+2*display_base_marign;

    translate([-display_base_width/2,-display_base_height/2,0])
    difference() {
        cube([display_base_width, display_base_height, wall_thickness]);

        translate([display_base_marign, display_base_marign, 0])
        union() {
            translate([1, 9, -1])
            rounded_cube(size = [pcb_width-2, 16, wall_thickness + 2], radius = 2);

            // pin cutout
            translate([(pcb_width-12)/2, pcb_height - 4 + 0.0001, wall_thickness - 2 + 0.0001])
            cube([12, 4 + display_base_marign, 2]);

            thread_insert_offset = wall_thickness - thread_insert_height + 0.1;

            translate([2.5, 2, thread_insert_offset])
            cylinder(h = thread_insert_height, r = thread_insert_radius);

            translate([pcb_width-2.5, 2, thread_insert_offset])
            cylinder(h = thread_insert_height, r = thread_insert_radius);

            translate([2.5, pcb_height-3, thread_insert_offset])
            cylinder(h = thread_insert_height, r = thread_insert_radius);

            translate([pcb_width-2.5, pcb_height-3, thread_insert_offset])
            cylinder(h = thread_insert_height, r = thread_insert_radius);
        }
    }
}
