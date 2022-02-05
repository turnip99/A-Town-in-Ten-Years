event_inherited();

switch (state)
{
	case "text_1":
		text = "My " + global.player_title + ", I am a wandering missionary from the far south, and I would make a humble bid refuge and provisions in " + global.town_name + " for a time. In return, I would do my bit to bring the hope and blessing of the Six Suns to your people."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "accept":
		text = "Thank you, my " + global.player_title + ". I shall put these to good use in my quest to bring hope to the people of the nation."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "decline":
		text = "That is for you to decide, my " + global.player_title + ". May the blessings of the Six Suns be upon you."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}