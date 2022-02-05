var selected_tile = get_selected_tile()
if get_stat("Gold") >= cost && !selected_tile.building
{
	with selected_tile
	{
		building = true
		building_tile_type = other.tile_type
		building_tier = other.tier
		if other.tier > 1
			global.free_upgrade = false
		alarm[0] = total_build_steps
		audio_play_sound(sndBuildBegin, 0, false)
	}
	increment("Gold", -cost)
}
else
{
	audio_play_sound(sndBuildError, 0, false)
}