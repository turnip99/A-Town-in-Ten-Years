event_inherited();

switch (state)
{
	case "text_1":
		if courtier == "Envoy"
			text = global.player_title_name + ", I bring news from our neighbouring province to the south. A great monsoon has afflicted their lands, and a terrible flood has fallen upon them. I would recommend that we provide a gift of either supplies or gold to aid them in their plight, for both political and altruistic reasons."
		else
			text = "My " + global.player_title + ", there have been reports of terrible rain and subsequent flooding in a nearby province to the south. May I suggest that you consider sending aid, either in the form of provisions or gold, to aid our neighbour in their plight?"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "gold": case "goods":
		if courtier == "Envoy"
			text = "Very good, my " + global.player_title + ". I will ensure that you gift reaches our neighbours swiftly and without incident."
		else
			text = "A compassionate decision, " + global.player_title_name + ", and I thank you for it. I will see your gift safely on its way."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "decline":
		if courtier == "Envoy"
			text = "Very well, my " + global.player_title + ", I understand if you cannot help at this time, although if you would heed my counsel, I would suggest that you may have miscalculated the situation."
		else
			text = "Very well, " + global.player_title_name + ", if that is your wish."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}