use <./../rounded_cube.scad>;
use <./display.scad>;
use <./speaker.scad>;

$fn = 100;

wall_thickness = 3;

difference() {
    translate([-82, -44, 0])
    rounded_cube(size = [164, 120, wall_thickness], radius = 15);

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
