include <parameter.scad>;
use <lib/panel.scad>;
use <lib/display.scad>;
use <lib/speaker.scad>;

difference() {
    translate([-82, -44, 0])
    panel();

    translate([0, 52, -1])
    hull()
    display();

    translate([38, 0, 0])
    speaker(wall_thickness = wall_thickness);
    translate([-38, 0, 0])
    speaker(wall_thickness = wall_thickness);
}

translate([0, 52, 0])
display();
