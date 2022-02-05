if global.pause
	exit
instance_destroy(objTileButton)
if selected
{
	selected = false
	audio_play_sound(sndTileDeselect, 0, false)
}
else
{
	with (objTile)
	{
		selected = false
	}
	selected = true
	audio_play_sound(sndTileSelect, 0, false)
	create_tile_buttons(tile_type, tier)
}
