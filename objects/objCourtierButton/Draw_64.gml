if rank <= 0
{
	draw_set_alpha(0.025)
}
if toggled
	draw_set_colour(c_yellow)
else
	draw_set_colour(c_dkgray)
draw_sprite_stretched(sprite, 0, x1+1, y1+1, 79, 79)
draw_rectangle(x1+1, y1+2, x2-2, y2-1, true)
draw_set_alpha(1)