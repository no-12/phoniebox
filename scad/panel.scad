use <rounded_cube.scad>
use <box_corner.scad>

$fn = 100;

module _screw_hole(d) {
    cylinder(d = d, h=10000);
    cylinder(h=3/5*d, d1=2*d, d2=d);
}

module panel(size = [150, 100, 3], radius = 15, screw_diameter = 3) {
    difference() {
        rounded_cube (size = size, radius = radius);

        translate([radius*2/3,radius*2/3,0]) _screw_hole(d = screw_diameter);
        translate([radius*2/3,size[1]-radius*2/3,0]) _screw_hole(d = screw_diameter);
        translate([size[0]-radius*2/3,size[1]-radius*2/3,0]) _screw_hole(d = screw_diameter);
        translate([size[0]-radius*2/3,radius*2/3,0]) _screw_hole(d = screw_diameter);
    }
}

panel();
