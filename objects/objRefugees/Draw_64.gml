event_inherited();

switch (state)
{
	case "text_1":
		text = "My " + global.player_title + ", myself and my followers have travelled hundreds of leagues, fleeing the war-torn lands to the east. We are tired and hungry, and our resources run low."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Would you perhaps be so generous as to donate what supplies you can afford to our cause?"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "accept":
		text = "Thank you, my " + global.player_title + ". We will not forget this kindness."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "decline":
		text = "Very well. We shall make haste away from your lands, my " + global.player_title + "."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}