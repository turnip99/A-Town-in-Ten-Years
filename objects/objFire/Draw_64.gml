event_inherited();

switch (state)
{
	case "text_1":
		if courtier == "Architect"
			text = "My " + global.player_title + "! One of our " + ds_list_find_value(building_destroy_list, 0).tile_name + "s is on fire! We must bring water and put it out at once!"
		else
			text =  global.player_title_name + ", one of " + global.town_name + "'s " + ds_list_find_value(building_destroy_list, 0).tile_name + "s has been set ablaze! We must bring water at once!"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "accept":
		if courtier == "Architect"
			text = "Thank you. Now let's get this fire out, and quickly!"
		else
			text = "I will ensure that this fire is dowsed swiftly, my " + global.player_title + "."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "decline":
		var tile_name = ds_list_find_value(building_destroy_list_names, 0)
		text = "A " + tile_name + " was destroyed during the fire."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
}