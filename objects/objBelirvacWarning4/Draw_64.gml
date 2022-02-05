event_inherited();

switch (state)
{
	case "text_1":
		if courtier == "Envoy"
			text = "My " + global.player_title + ", I bring grave tidings to you this day. Our great foe, Belirvac the necromancer, has, certainly through some terrible means, conjured a army mighty enough even to rip asunder the gates of the high king's city itself. Worse still, he has taken great delight in razing numerous villages and towns on his path here, leaving only death and despair in his wake. I believe it is perhaps time for us to put a stop to this insanity, once and for all?"
		else
			text = global.player_name + ", some of our traders have returned to " + global.town_name + " with terrible tidings - Belirvac comes again for us, with a force great enough to rival even the high king's mighty army. He has been burning villages and town, leaving a trail of death and dismay on his road towards " + global.town_name + ". We MUST put a stop to his utter tyranny!"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Belirvac's hoard will attack " + global.town_name + " at the end of the next season. Your scouts report his offensive strength to range somewhere between " + thousands_separator(get_belirvac_attack_range(4, "min")) + " and " + thousands_separator(get_belirvac_attack_range(4, "max")) + "."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
}