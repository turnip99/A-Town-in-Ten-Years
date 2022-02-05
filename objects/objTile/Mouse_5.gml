if tier == 0 || tier == 4
	exit;
var upgrade_cost = get_tile_cost(tile_type, tile_type, tier)
if get_stat("Gold") >= upgrade_cost && !building
{
	building = true
	building_tile_type = tile_type
	building_tier = tier+1
	if building_tier > 1
		global.free_upgrade = false
	alarm[0] = total_build_steps
	audio_play_sound(sndBuildBegin, 0, false)
	increment("Gold", -upgrade_cost)
}
else
{
	audio_play_sound(sndBuildError, 0, false)
}