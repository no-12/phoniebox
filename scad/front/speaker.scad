module speaker(wall_thickness){
    speaker_radius = 32;
    screw_radius = 2.2;

    hole_offset = sqrt(648);

    translate([0,0,-1])
    cylinder(h = wall_thickness + 2, r = speaker_radius);

    translate([hole_offset,hole_offset,-1])
    cylinder(h = wall_thickness + 2, r = screw_radius);

    translate([-hole_offset,-hole_offset,-1])
    cylinder(h = wall_thickness + 2, r = screw_radius);

    translate([hole_offset,-hole_offset,-1])
    cylinder(h = wall_thickness + 2, r = screw_radius);

    translate([-hole_offset,hole_offset,-1])
    cylinder(h = wall_thickness + 2, r = screw_radius);
}
