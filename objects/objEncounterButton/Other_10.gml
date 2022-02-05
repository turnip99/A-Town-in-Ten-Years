objEncounter.button_val = val
if val == "Yes" && instance_number(objWizard) > 0
{
	global.free_upgrade = true
}
if val == "No" && instance_number(objFire) > 0
{
	with (objFire)
	{
		var tile = ds_list_find_value(building_destroy_list, 0)
		change_tile(tile, "Rubble", 0)
	}
}
audio_play_sound(sndButtonClick, 0, false)
increment("Prestige", prestige)
increment("Defence", defence)
increment("Population", population)
increment("Morale", morale)
increment("Gold", gold)
increment("Goods", goods)
with objEncounter
{
	event_user(0)
}