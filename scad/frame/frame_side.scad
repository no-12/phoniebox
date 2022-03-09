include <../parameter.scad>;
use <frame_corner.scad>
use <frame_edge.scad>

module _corner_with_edge() {
    frame_corner(
        radius = corner_radius,
        wall_thickness = wall_thickness,
        thread_insert_radius = ruthex_m3_thread_insert_radius,
        thread_insert_height = ruthex_m3_thread_insert_height
    );
    rotate([0, 270, 0])
    translate([corner_radius, 0, corner_radius])
    frame_edge(
        radius = corner_radius,
        size = edge_short_length,
        wall_thickness = wall_thickness,
        wall_bearing_surface = wall_bearing_surface
    );
}

rotate([0, 0, 180])
_corner_with_edge();

translate([0, 120, 0])
rotate([0, 0, 90])
_corner_with_edge();

translate([120, 120, 0])
_corner_with_edge();

translate([120, 0, 0])
rotate([0, 0, 270])
_corner_with_edge();
