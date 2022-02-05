if global.pause
	exit

if point_in_rectangle(mouse_x_gui(), mouse_y_gui(), x1, y1, x2, y2)
{
	if hover_steps < 7
	{
		hover_steps+=1
	}
}
else
{
	hover_steps = 0
}