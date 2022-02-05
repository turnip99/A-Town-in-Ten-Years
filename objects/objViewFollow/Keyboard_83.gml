if global.pause
	exit
limit = room_height-camera_get_view_border_y(view_camera[0])
if y < limit
	y+=spd
else
	y = limit