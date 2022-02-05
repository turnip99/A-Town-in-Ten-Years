draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_font(fnMainTitle)
draw_text_glow_background(room_width/2, 20, "A Town in Ten Years", c_black)
draw_set_valign(fa_center)
draw_set_font(fnMenuCredits)
draw_text_glow_background(room_width/2, room_height-20, "Sprites from a-ravlik and YusufArtun, to see licenses please contact me. Sounds from zapsplat.com.", c_black)
if instance_number(objMenuPortraitButton)
{
	draw_set_font(fnMenuLarge)
	draw_text_glow_background(room_width/2, 210, "Portrait:", c_black)
}
else if instance_number(objMenuTextBox)
{
	draw_set_font(fnMenuLarge)
	draw_text_glow_background(room_width/2, 210, objMenuTextBox.input_field + ":", c_black)
}