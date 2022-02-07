module rounded_cube(size, radius) {
    hull() {
        translate([radius, radius, 0])
        cylinder(r=radius, h=size[2]);

        translate([radius, size[1]-radius, 0])
        cylinder(r=radius, h=size[2]);

        translate([size[0]-radius, radius])
        cylinder(r=radius, h=size[2]);

        translate([size[0]-radius, size[1]-radius, 0])
        cylinder(r=radius, h=size[2]);
    }
}
