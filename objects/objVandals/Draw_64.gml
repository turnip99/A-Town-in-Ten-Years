event_inherited();

switch (state)
{
	case "text_1":
		if courtier == "Engineer"
			text = "Um, my " + global.player_title + ", I seem to have encountered a bit of a problem wit- if you have, um, time to hear it, of course?"
		else
			text = global.player_title_name + ", there have been a number of incidences of horrible vandalism throughout the town over the last few weeks. With your permission, I would like to crack down on this issue before it gets any worse."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		if courtier == "Engineer"
		{
			text = "You see, there's been a couple, well... umm, several incidences of downright repulsive vandalism to public buildings throughout the town. I, um, would very much like to sort this before the problem becomes, umm, unwieldy, I suppose. May I have your permission to, umm, possibly... crack down on these vandals?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		break;
	case "accept":
		if courtier == "Engineer"
			text = "Thank you, " + global.player_title_name + "! I will put a stop to these vandals and clean up our town for good!"
		else
			text = "Thank you, my " + global.player_title + ". I will ensure that these vandals are stopped."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "decline":
		if courtier == "Engineer"
			text = "But, what about- um, forgive me " + global.player_title_name + ". Thank you, um, for your time."
		else
			text = "Very well, my " + global.player_title + ". I understand if you wish to direct your resources in other ways."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}