event_inherited();

switch (state)
{
	case "text_1":
		if courtier == "Veteran"
			text = global.player_name + ", my scouts report seeing hoard of gruesome undead creatures moving with great speed towards " + global.town_name + ". It seems Belirvac's patience has run dry. We should prepare at once."
		else
			text = global.player_title_name + ", our scouts have reported the presence of a vile undead hoard to the north-east, swiftly approaching " + global.town_name + ". I can only assume that this that villain, Belirvac's doing. We must prepare ourselves."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Belirvac's hoard will attack " + global.town_name + " at the end of the next season. Your scouts report his offensive strength to range somewhere between " + thousands_separator(get_belirvac_attack_range(1, "min")) + " and " + thousands_separator(get_belirvac_attack_range(1, "max")) + "."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
}