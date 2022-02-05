event_inherited();

switch (state)
{
	case "text_1":
		text = "It is time, my " + global.player_title + ". Our ten years have passed, and the king's envoy has just arrived to deliver his verdict on " + global.town_name + "."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "text_2":
		text = "Hail, " + global.player_title_name + ". I come on behalf of the high king to behold your work in " + global.town_name + ". Shall we take a look around and see how you've fared?" 
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}