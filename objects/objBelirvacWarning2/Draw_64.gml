event_inherited();

switch (state)
{
	case "text_1":
		if courtier == "Foreman"
			text = "My " + global.player_title + ", I bring a urgent message. One of my workers, while travelling beyond the bounds of the valley, went missing. When I sent a search party, we found only his rotting body - animated. Belirvac nears for another assault, mark my words."
		else
			text = global.player_title_name + ", rumours have abound around the town of residents straying beyond the bounds of the valley and returning... changed. I have no doubt that Belirvac is behind this, and that he will attempt to raze " + global.town_name + " again. We must remain vigilant."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Belirvac's hoard will attack " + global.town_name + " at the end of the next season. Your scouts report his offensive strength to range somewhere between " + thousands_separator(get_belirvac_attack_range(2, "min")) + " and " + thousands_separator(get_belirvac_attack_range(2, "max")) + "."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
}