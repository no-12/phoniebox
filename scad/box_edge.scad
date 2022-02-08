$fn = 100;

module box_edge(radius = 15, size = 50, wall_thickness = 3, wall_bearing_surface = 3) {
    difference() {
        cylinder(r=radius, h=size);
        translate([-radius, -radius, -1]) cube([2*radius, radius, size+2]);
        translate([-radius, -1, -1]) cube([radius, 2*radius, size+2]);
    }
    translate([-wall_thickness, -wall_thickness, 0])
    cube([wall_bearing_surface, radius-wall_thickness+wall_bearing_surface, size]);

    translate([-wall_thickness, -wall_thickness, 0])
    cube([radius-wall_thickness+wall_bearing_surface, wall_bearing_surface, size]);

    translate([radius/4, radius/4, -radius/3]) cube([radius/3,radius/3,radius*2/3+size]);
}

box_edge();
