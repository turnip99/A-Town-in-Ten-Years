if global.pause
	exit
limit = camera_get_view_border_x(view_camera[0])
if x > limit
	x-=spd
else
	x = limit