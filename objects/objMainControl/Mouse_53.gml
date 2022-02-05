if global.pause
	exit
if point_in_rectangle(mouse_x_gui(), mouse_y_gui(), end_season_button_x, end_season_button_y, end_season_button_x+40, end_season_button_y+40)
{
	end_season()
}