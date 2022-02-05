change_tile(id, building_tile_type, building_tier)
building = false
building_tile_type = ""
building_tier = ""
audio_play_sound(sndBuildComplete, 0, false)

if selected
{
	instance_destroy(objTileButton)
	create_tile_buttons(tile_type, tier)
}