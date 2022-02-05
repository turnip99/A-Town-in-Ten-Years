if global.pause
	exit
if hover_steps >= 7
{
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	draw_set_font(fnUISmall)
	if mouse_x_gui() < window_get_width()/2
	{
		tooltip_x1 = mouse_x_gui()
		tooltip_y1 = mouse_y_gui()
		tooltip_x2 = mouse_x_gui()+300
		tooltip_y2 = mouse_y_gui()+string_height_ext(tooltip_text, text_sep, 300)+45
	}
	else
	{
		tooltip_x1 = mouse_x_gui()-300
		tooltip_y1 = mouse_y_gui()
		tooltip_x2 = mouse_x_gui()
		tooltip_y2 = mouse_y_gui()+string_height_ext(tooltip_text, text_sep, 300)+45
	}
	draw_set_colour(c_black)
	draw_rectangle(tooltip_x1-5, tooltip_y1, tooltip_x2+5, tooltip_y2, false)
	draw_set_colour(c_ltgray)
	draw_rectangle(tooltip_x1-5, tooltip_y1, tooltip_x2+5, tooltip_y2, true)
	draw_set_colour(c_white)
	x_middle = tooltip_x1+((tooltip_x2-tooltip_x1)/2)
	draw_text_ext(x_middle, tooltip_y1+40, tooltip_text, text_sep, 300)
	draw_set_font(fnUIMedium)
	draw_text(x_middle, tooltip_y1+5, topic)
}