include <../parameter.scad>;
use <frame_connector.scad>

module _corner(radius) {
    difference() {
        sphere(r = radius);
        translate([-radius, -radius, -radius]) cube([2*radius, radius, 2*radius]);
        translate([-radius, -radius, -radius]) cube([radius, 2*radius, 2*radius]);
        translate([-radius, -radius, -radius]) cube([2*radius, 2*radius, radius]);
    }
}

module _edge(radius, connector = false) {
    difference() {
        cylinder(r=radius, h=radius);
        translate([-radius, -radius, -1]) cube([2*radius, radius, radius+2]);
        translate([-radius, -1, -1]) cube([radius, radius+2, radius+2]);

        if (connector) {
            translate([0, 0, -1])
            frame_connector(
                radius = radius,
                length = radius+1,
                wall_thickness = wall_thickness
            );
        }
    }
}

module _bearing(radius, wall_thickness, thread_insert_radius, thread_insert_height) {
    difference() {
        cube([radius, 2*radius, radius]);

        rotate([90, 0, 0])
        translate([0, 0, -wall_thickness])
        cylinder(r=radius, h=wall_thickness+1);

        rotate([90, 0, 0])
        translate([radius/3,radius/3,-wall_thickness-thread_insert_height])
        cylinder(r=thread_insert_radius, h=thread_insert_height+1);
    }
}

module frame_corner(radius, wall_thickness, thread_insert_radius, thread_insert_height) {
    translate([0, 0, radius])
    _corner(radius);

    _edge(radius, connector = true);
    rotate([90, 0, 90])  translate([0, radius, -radius]) _edge(radius);
    mirror([0,0,1]) rotate([270, 0, 0]) translate([0, radius, -radius]) _edge(radius);

    rotate([0, 0, 90]) translate([-radius, -radius ,0]) _bearing(radius, wall_thickness, thread_insert_radius, thread_insert_height);
    rotate([270, 0, 0]) translate([-radius, -2*radius, -radius]) _bearing(radius, wall_thickness, thread_insert_radius, thread_insert_height);
    rotate([180, 270, 0]) translate([0, -radius, -radius]) _bearing(radius, wall_thickness, thread_insert_radius, thread_insert_height);
}
