include <TextGenerator.bin>;

/* Box inner size and wall thickness */
box_s = [77, 59.5, 11];
wall_s = [1.5, 1.5, 2];

/* Lid base thickness and depth */
base_s = [2, 2, 2];

/* Socket position and size */
lid_s = [17, 10];
lid_o = [5, box_s[1] - lid_s[1] - 5];

/* Character size (includes inter-char spacing) */
char_s = [6, 7];

/* Hackology label next to socket */
text_str = "hackology";
text_scale = (box_s[0] - 2 * lid_o[0] - lid_s[0] - 5) / (len(text_str) * char_s[0] - 1);
text_s = [len(text_str) * char_s[0] - 1, char_s[1]];
text_o = [lid_o[0] + lid_s[0] + 5, lid_o[1] + lid_s[1] / 2];

/* AURA label in remaining space */
aura_str = "AURA";
aura_scale = (box_s[0] - 2 * lid_o[0]) / (len(aura_str) * char_s[0] - 1);
aura_s = [len(aura_str) * char_s[0] - 1, char_s[1]] * aura_scale;
aura_o = [lid_o[0], lid_o[1] / 2, 0];

/* Struts on lid (replaced with separate base ring) */
//strut_round = 1;
//strut_s = [3, 3, 3] - strut_round * [1, 1, 1];

/* Explosion scale factor for viewing */
explode = 15;

/* Box with open top */
module box() {
	difference() {
		translate(-wall_s)
			cube(box_s + 2 * wall_s - [0, 0, wall_s[2]]);
		cube(box_s);
	}
}

/* Lid insert ring which doesn't obstruct the socket */
module lid_base() {
	difference() {
		cube([box_s[0], box_s[1], base_s[2]]);
		translate([lid_o[0], lid_o[1], 0])
			cube([lid_s[0], lid_s[1], wall_s[2]]);
		translate([base_s[0], base_s[1], 0])
			cube([box_s[0] - 2 * base_s[0], box_s[1] - 2 * base_s[1], base_s[2]]);
	}
}

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

/* Assemble and render! */
translate(-[box_s[0] / 2, box_s[1] / 2, box_s[2]]) {
	box();
	translate([0, 0, box_s[2] + explode])
		lid_base();
	translate([0, 0, box_s[2] + 2*explode])
		lid();
}
