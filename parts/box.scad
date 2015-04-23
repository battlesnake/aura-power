/* Box with open top */
module box() {
	difference() {
		translate(-wall_s)
			cube(box_s + 2 * wall_s - [0, 0, wall_s[2]]);
		cube(box_s);
	}
}
