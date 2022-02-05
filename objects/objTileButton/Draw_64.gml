if get_selected_tile().building
	draw_set_alpha(0.3)
if get_stat("Gold") >= cost
	draw_set_colour(c_white)
else
	draw_set_colour(c_red)
draw_sprite_stretched(sprite, tier-1, x1, y1-2, 50, 50)
if y == 25
{
	draw_rectangle(x1+1, 1, x2-1, 49, true)
}
else
{
	draw_rectangle(x1+1, 51, x2-1, 98, true)
}
draw_set_halign(fa_right)
draw_set_valign(fa_top)
draw_set_font(fnUISmall)
draw_text(x2-3, y1-3, shortcut)
if get_selected_tile().building
	draw_set_alpha(1)