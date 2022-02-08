use <box_edge.scad>

wall_thickness = 2;
wall_bearing_surface = 4;



module box_corner(radius, wall_thickness) {
    difference() {
        union() {
            translate([radius, radius, radius])
            sphere(r = radius);

            translate([radius, radius, 0])
            cylinder(r=radius, h=radius);

            rotate([90, 0, 0])
            translate([radius, radius, -radius])
            cylinder(r=radius, h=radius);

            rotate([0, 90, 0])
            translate([-radius, radius, radius])
            cylinder(r=radius, h=radius);

            cube([2*radius, radius, radius]);

            translate([radius, 0, 0]) {
                cube([radius, radius, 2*radius]);
                cube([radius, 2*radius, radius]);
            }
        }

        rotate([0, 270, 0])
        translate([0, 0, -wall_thickness])
        cylinder(r=radius, h=wall_thickness+1);

        translate([2*radius, 0, 2*radius-wall_thickness])
        cylinder(r=radius, h=wall_thickness+1);

        rotate([270, 0, 0])
        translate([2*radius, 0, 2*radius-wall_thickness])
        cylinder(r=radius, h=wall_thickness+1);
    }
}

$fn = 100;

size = 5;
radius = 5;

box_corner(radius = radius, wall_thickness = wall_thickness);

translate([0, 0, 2*radius])
rotate([0, 90, 270])
box_edge(size = 20, radius = radius, wall_thickness = wall_thickness, wall_bearing_surface = wall_bearing_surface);


