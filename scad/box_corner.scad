use <box_edge.scad>

$fn = 100;
thread_insert_radius = 2.75;
thread_insert_height = 5;

module _corner(radius) {
    difference() {
        sphere(r = radius);
        translate([-radius, -radius, -radius]) cube([2*radius, radius, 2*radius]);
        translate([-radius, -radius, -radius]) cube([radius, 2*radius, 2*radius]);
        translate([-radius, -radius, -radius]) cube([2*radius, 2*radius, radius]);
    }
}

module _edge(radius) {
    difference() {
        cylinder(r=radius, h=radius);
        translate([-radius, -radius, -1]) cube([2*radius, radius, radius+2]);
        translate([-radius, -1, -1]) cube([radius, radius+2, radius+2]);

        translate([radius/4, radius/4, -0.5])
        cube([radius/3,radius/3,radius/3+1]);
    }
}

module _bearing(radius, wall_thickness) {
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

module box_corner(radius = 15, wall_thickness = 3) {
    translate([0, 0, radius])
    _corner(radius);

    _edge(radius);
    rotate([90, 0, 90])  translate([0, radius, -radius]) _edge(radius);
    mirror([0,0,1]) rotate([270, 0, 0]) translate([0, radius, -radius]) _edge(radius);

    rotate([0, 0, 90]) translate([-radius, -radius ,0]) _bearing(radius, wall_thickness);
    rotate([270, 0, 0]) translate([-radius, -2*radius, -radius]) _bearing(radius, wall_thickness);
    rotate([180, 270, 0]) translate([0, -radius, -radius]) _bearing(radius, wall_thickness);
}

box_corner();
