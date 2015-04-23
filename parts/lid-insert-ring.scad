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
