use <frame_corner.scad>
use <frame_edge.scad>

radius = 15;
edge_size = 90;
wall_thickness = 3;
wall_bearing_surface = 3;
thread_insert_radius = 2;
thread_insert_height = 6.7;

module corner_with_edge() {
    frame_corner(
        radius = radius,
        wall_thickness = wall_thickness,
        thread_insert_radius = thread_insert_radius,
        thread_insert_height = thread_insert_height
    );
    rotate([0, 270, 0])
    translate([radius, 0, radius])
    frame_edge(
        radius = radius,
        size = edge_size,
        wall_thickness = wall_thickness,
        wall_bearing_surface = wall_bearing_surface
    );
}

rotate([0, 0, 180])
corner_with_edge();

translate([0, 120, 0])
rotate([0, 0, 90])
corner_with_edge();

translate([120, 120, 0])
corner_with_edge();

translate([120, 0, 0])
rotate([0, 0, 270])
corner_with_edge();
