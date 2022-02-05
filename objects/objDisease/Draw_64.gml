event_inherited();

switch (state)
{
	case "text_1":
		if courtier == "Priest"
			text = global.player_title_name + ", a terrible disease has begone to sweep through the populace of " + global.town_name + ", and I bring to you the plea of the people for aid. Will you not seek a cure?"
		else
			text = "My " + global.player_title + ", I bring reports that a potentially fatal disease has begun infecting your populace. I suggest that we invest in medicine before this gets out of hand."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "gold": case "goods":
		if courtier == "Priest"
			text = "I thank you for your compassion, " + global.player_title_name + ". Let us make haste to provide medicine for the peoples' ills."
		else
			text = "A wise decision, my " + global.player_title + ", if I do say so myself. I will see this done."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "decline":
		if courtier == "Priest"
			text = "While I am disappointed, I will continue to do what I can to provide solace for the people in this trying time."
		else
			text = "As you wish, my " + global.player_title + "."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}