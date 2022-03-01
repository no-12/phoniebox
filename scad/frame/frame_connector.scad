$fn = 100;

radius = 15;
length = 90;
wall_thickness = 3;

module frame_connector(radius, length, wall_thickness) {
    connector_size = radius - 2*wall_thickness;
    difference() {
        cube([connector_size, connector_size, length]);

        translate([connector_size, connector_size/2, -1])
        rotate([0, 0, 45])
        cube([connector_size, connector_size, length+2]);
    }
}

frame_connector(
    radius = radius,
    length = length,
    wall_thickness = wall_thickness
);
