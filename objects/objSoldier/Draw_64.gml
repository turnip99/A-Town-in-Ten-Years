event_inherited();

switch (state)
{
	case "text_1":
		text = "Hail, " + global.player_title_name + ". I am a knight of the realm charged with protecting the land from threats to the high king's peace. I have heard that " + global.town_name + " faces more than its fair share of such threats, and so I wish to offer my sword in the defence of this valley, if you would have me."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "accept":
		text = "Very good, my " + global.player_title + ". Belirvac's hoard will soon quake beneath my wrath upon the battlefield."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "decline":
		text = "So be it, my " + global.player_title + ". I wish you well in your campaign against the dread necromancer."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}