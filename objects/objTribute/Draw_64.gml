event_inherited();

switch (state)
{
	case "text_1":
		if courtier == "Swindler"
			text = "How's it going, " + global.player_name + "? So, just this morning, the high king's envoy popped over requesting tribute from " + global.town_name + ". As you know, I'm all about making you rich, but perhaps there's a benefit to us getting into the old king's good books, eh?"
		else
			text = "My " + global.player_title + ", the high king has requested tribute from " + global.town_name + "."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "accept":
		if courtier == "Swindler"
			text = "Hmm, probably for the best. I'll be sure to say my farewells to that lovely coin before Estella sends it off!"
		else
			text = "Very good, " + global.player_title_name + ". I will see to it immediately."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "decline":
		if courtier == "Swindler"
			text = "Can't say I blame you. Let's just hope this doesn't come back to bite us, eh?"
		else
			text = "If you are certain, my " + global.player_title + ". I am uncertain as to the wisdom of defying the high king, but I will stand with you in this decision."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}