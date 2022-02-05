if global.pause
	exit
limit = camera_get_view_border_y(view_camera[0])
if y > limit
	y-=spd
else
	y = limit