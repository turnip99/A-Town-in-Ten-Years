event_inherited();

switch (state)
{
	case "text_1":
		if courtier == "Assassin"
			text = "Necromancer approaches. Soon he shall arrive. We must stop him."
		else
			text = global.player_title_name + ", there have been reports that Belirvac amasses another army to assault " + global.town_name + ". Reports vary as to the size of his force, but there can be no mistake that he still intends to claim this valley and those beneath for his own malevolent schemes. Let us not falter now!"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Belirvac's hoard will attack " + global.town_name + " at the end of the next season. Your scouts report his offensive strength to range somewhere between " + thousands_separator(get_belirvac_attack_range(3, "min")) + " and " + thousands_separator(get_belirvac_attack_range(3, "max")) + "."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
}