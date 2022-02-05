function end_season()
{
	audio_play_sound(sndSeasonEnd, 0, false)
	instance_create_depth(0, 0, -1000, objSeasonalYield)
	global.season+=1
	global.timer=0
}


function draw_icon_results(xs, ys, sprite)
{
	draw_sprite_stretched(sprBase, 0, xs, ys, 150, 150)
	draw_sprite_stretched(sprite, 0, xs+30, ys+30, 90, 90)	
}


function set_zoom(zoom)
{
	var zoom_mult = power(2, zoom)
	var width = 3000*zoom_mult
	var height = 1600*zoom_mult
	camera_set_view_size(view_camera[0], width, height)
	camera_set_view_border(view_camera[0], width/2, height/2)
	with objViewFollow
	{
		if x < width/2
			x = width/2
		if x > room_width-width/2
			x = room_width-width/2
		if y < height/2
			y = height/2
		if y > room_height-height/2
			y = room_height-height/2
	}
}