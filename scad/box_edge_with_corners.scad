use <box_corner.scad>
use <box_edge.scad>

radius = 15;

box_corner(radius = radius);

translate([-radius, 0, radius]) rotate([90, 270, 270]) box_edge(radius = radius, size = 90);

translate([-2*radius-90, 0, 0]) rotate([0, 0, 90]) box_corner(radius = radius);
