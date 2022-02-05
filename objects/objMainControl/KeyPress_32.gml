if instance_number(objEncounter) > 0
	exit
if !global.pause
{
	global.pause = true
	global.manual_pause = true
	deselect_all_tiles()
}
else
{
	global.pause = false
}