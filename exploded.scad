include <config.scad>;

include <parts/box.scad>;
include <parts/lid-insert-ring.scad>;
include <parts/lid.scad>;

/* Explosion scale factor for viewing */
explode = 15;

/* Assemble and render! */
translate(-[box_s[0] / 2, box_s[1] / 2, box_s[2]]) {
	box();
	translate([0, 0, box_s[2] + explode])
		lid_base();
	translate([0, 0, box_s[2] + 2*explode])
		lid();
}
