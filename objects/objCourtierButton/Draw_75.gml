if global.pause || rank <= 0
	exit
if hover_steps >= 7
{
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	draw_set_font(fnUISmall)
	description = get_courtier_description(courtier, rank)
	var height = 125+string_height_ext(description, 22, 270)
	tooltip_x1 = mouse_x_gui()-300
	tooltip_x2 = mouse_x_gui()
	if mouse_y_gui() < window_get_height()/2
	{
		tooltip_y1 = mouse_y_gui()
		tooltip_y2 = mouse_y_gui()+height
	}
	else
	{
		tooltip_y1 = mouse_y_gui()-height
		tooltip_y2 = mouse_y_gui()
	}
	draw_set_colour(c_black)
	draw_rectangle(tooltip_x1-5, tooltip_y1, tooltip_x2+5, tooltip_y2, false)
	if toggled
		draw_set_colour(c_yellow)
	else
		draw_set_colour(c_ltgray)
	draw_rectangle(tooltip_x1-5, tooltip_y1, tooltip_x2+5, tooltip_y2, true)
	draw_set_colour(c_white)
	draw_set_font(fnUIMedium)
	x_middle = tooltip_x1+((tooltip_x2-tooltip_x1)/2)
	draw_text(x_middle, tooltip_y1+5, name)
	draw_set_font(fnUISmall)
	draw_text(x_middle, tooltip_y1+35, "Role: " + courtier)
	draw_text(x_middle, tooltip_y1+60, "Personality: " + personality)
	if toggled
	{
		var toggle_text = "Active"
		draw_set_colour(c_yellow)
	}
	else
	{
		var toggle_text = "Inactive"
	}
	draw_text(x_middle, tooltip_y1+85, "Status: " + toggle_text)
	draw_set_colour(c_white)
	draw_line(tooltip_x1+10, tooltip_y1+110, tooltip_x2-10, tooltip_y1+110)
	draw_text_ext(x_middle, tooltip_y1+120, description, 22, 270)
}