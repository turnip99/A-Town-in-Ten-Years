if objEncounter.loading_alpha < 1 || disabled
	exit;
if point_in_rectangle(mouse_x_gui(), mouse_y_gui(), x1, y1, x2, y2)
{
	event_user(0)
}