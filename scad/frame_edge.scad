include <parameter.scad>;
use <lib/frame_connector.scad>

module frame_edge(radius, size, wall_thickness, wall_bearing_surface) {
    difference() {
        cylinder(r=radius, h=size);
        translate([-radius, -radius, -1]) cube([2*radius, radius, size+2]);
        translate([-radius, -1, -1]) cube([radius, 2*radius, size+2]);
    }
    translate([-wall_thickness, -wall_thickness, 0])
    cube([wall_bearing_surface, radius-wall_thickness+wall_bearing_surface, size]);

    translate([-wall_thickness, -wall_thickness, 0])
    cube([radius-wall_thickness+wall_bearing_surface, wall_bearing_surface, size]);

    translate([0.2, 0.2, -(radius-1)])
    frame_connector(
        radius = radius,
        length = size + 2*(radius-1),
        wall_thickness = wall_thickness + 0.2
    );
}

frame_edge(
    radius = corner_radius,
    size = edge_long_length,
    wall_thickness = wall_thickness,
    wall_bearing_surface = wall_bearing_surface
);
