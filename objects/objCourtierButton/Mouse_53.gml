if global.pause || rank <= 0
	exit
if point_in_rectangle(mouse_x_gui(), mouse_y_gui(), x1, y1, x2, y2)
{
	toggled = !toggled
	audio_play_sound(sndCourtierToggle, 0, false)
	refresh_tile_yields()
	with (objTileButton)
	{
		set_tile_yields(tile_type, tier, 0)
	}
}