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


