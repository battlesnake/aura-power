include <../lib/TextGenerator.bin>;

/* Lid with hole for socket and text labels on top */
module lid() {
	/* Lid with hole for socket */
	difference() {
		translate(-[wall_s[0], wall_s[1], 0])
			cube([box_s[0], box_s[1], 0] + [2 * wall_s[0], 2 * wall_s[1], 1 * wall_s[2]]);
		translate([lid_o[0], lid_o[1], 0])
			cube([lid_s[0], lid_s[1], wall_s[2]]);
	}
	/* hackology */
	translate([text_o[0], text_o[1], wall_s[2]])
		translate([0, -text_s[1] / 2])
			scale([text_scale, text_scale, 0.5])
				drawtext(text_str, 0.85);
	/* AURA */
	translate([aura_o[0], aura_o[1], wall_s[2]])
		translate([0, -aura_s[1] / 2])
			scale([aura_scale, aura_scale, 0.5])
				drawtext(aura_str, 1.00001);
	/* Struts (replaced with base ring as they would make the lid difficult to print) */
	if (false) {
		for (x = [0, 1])
			for (y = [0, 1])
				translate([x * (box_s[0] - strut_s[0]), y * (box_s[1] - strut_s[1]), 0])
					scale([1, 1, -1])
						minkowski() {
							cube(strut_s);
							cylinder(r=strut_round);
						}
	}
}
