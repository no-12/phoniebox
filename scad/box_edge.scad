module box_edge(size, radius, wall_thickness, wall_bearing_surface) {
    difference() {
        translate([radius, radius, 0])
        cylinder(r=radius, h=size);

        translate([radius, 0, -1])
        cube([radius, 2*radius, size+2]);

        translate([0, radius, -1])
        cube([2*radius, radius, size+2]);
    }
    translate([radius, wall_thickness, 0])
    cube([wall_bearing_surface, radius-wall_thickness+wall_bearing_surface, size]);


    translate([wall_thickness, radius, 0])
    cube([radius-wall_thickness+wall_bearing_surface, wall_bearing_surface, size]);
}
