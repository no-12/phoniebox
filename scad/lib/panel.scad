include <../parameter.scad>;
use <rounded_cube.scad>

module _screw_hole(d) {
    cylinder(d = d, h=10000);
    cylinder(h=3/5*d, d1=2*d, d2=d);
}

module panel(
    edge_length_x = edge_long_length,
    edge_length_y = edge_short_length,
    wall_thickness = wall_thickness,
    radius = corner_radius,
    screw_diameter = m3_screw_diameter
) {
    x = edge_length_x + 2 * radius;
    y = edge_length_y + 2 * radius;
    difference() {
        rounded_cube (size = [x, y, wall_thickness], radius = radius);

        translate([radius*2/3, radius*2/3, 0]) _screw_hole(d = screw_diameter);
        translate([radius*2/3, y-radius*2/3, 0]) _screw_hole(d = screw_diameter);
        translate([x-radius*2/3, y-radius*2/3, 0]) _screw_hole(d = screw_diameter);
        translate([x-radius*2/3, radius*2/3, 0]) _screw_hole(d = screw_diameter);
    }
}
