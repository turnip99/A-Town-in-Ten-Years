event_inherited();

switch (state)
{
	case "text_1":
		text = "Hail, " + global.player_title_name + ". I am a wizard from distant lands, and I seek the mysteries and wonders of this land. However, I must confess, wandering the desolate places leaves one somewhat isolated."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "If it pleases you, I would humbly request volunteers from among your populace to join me on my travels as my arcane apprentices. I return, I would grant you a scroll of transmutation, which I'm sure one as creative as yourself could put to good use!"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Accepting the wizard's offer will remove the gold cost of your next tile upgrade."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
	case "accept":
		text = "Fantastic. I will teach these young ones everything I know, and then some! I hope that you make good use of that scroll, " + global.player_title_name + "."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "decline":
		text = "Very well, if that is indeed your decision, I shall soon depart from " + global.town_name + ". Farewell, " + global.player_title_name + "."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}