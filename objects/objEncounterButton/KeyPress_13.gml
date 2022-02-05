if objEncounter.loading_alpha < 1 || disabled
	exit;
if instance_number(objEncounterButton) == 1
{
	event_user(0)
}
else
{
	var most_left = true
	with (objEncounterButton)
	{
		if other.x > x and !disabled
			most_left = false
	}
	if most_left
		event_user(0)
}