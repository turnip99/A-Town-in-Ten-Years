draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_set_font(fnMenuButton)
draw_set_colour(c_ltgray)
draw_rectangle(x1, y1, x2, y2, false)
draw_set_colour(c_black)
draw_rectangle(x1, y1, x2, y2, true)
draw_text(x1+10, y, text + cursor_char)
if input_field == "Player Name"
{
	draw_set_halign(fa_right)
	draw_text_glow_background(x1-10, y, global.player_title, c_black)
}