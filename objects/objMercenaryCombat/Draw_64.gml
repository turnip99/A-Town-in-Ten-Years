event_inherited();

switch (state)
{
	case "text_1":
		text = "Greetings, " + global.player_title_name + ". I am here to inform you that our employer has requested your head on a platter - and to take it myself. It's nothing personal."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "combat_result":
		if win
		{
			if defence >= attack
				text = "Through the vigour of your soldiers and the sharpness of their swords, the mercenary forces are routed."
			else
				text = "Though outnumbered, your soldiers' strength of will allows them to gain the upper hand against the hired mercenaries."
		}
		else
		{
			if defence >= attack
				text = "Despite your superior strength, the mercenary bands' skill proves too much for your soldiers, and you are quickly overwhelmed."
			else
				text = "The mercenary band are too many and too well equipped, and your smaller force finds itself quickly overwhelmed."
		}
		yText=draw_encounter_text(text, fnEncounterText, yText)
		draw_combat_result(win, yText)
		break;
	case "surrender":
		text = "I suppose this is more than our employer has offered us. Very well, we will leave in peace."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}