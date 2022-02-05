event_inherited();

switch (state)
{
	case "text_1":
		text = "Greetings " + global.player_title_name + ". The high king is impressed with your service to the kingdom here at " + global.town_name + ", and he wishes to honour your efforts."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "I come today to deliver a gift, the nature of which you may choose - coin, provisions or weapons."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "text_end":
		text = "A good choice, I say. May this boon serve you well, " + global.player_name + "."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}