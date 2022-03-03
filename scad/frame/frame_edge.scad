use <frame_connector.scad>
$fn = 100;

radius = 15;
size = 134;
wall_thickness = 3;
wall_bearing_surface = 3;

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
    radius = radius,
    size = size,
    wall_thickness = wall_thickness,
    wall_bearing_surface = wall_bearing_surface
);
