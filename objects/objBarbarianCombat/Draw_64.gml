event_inherited();

switch (state)
{
	case "text_1":
		text = "Your town in our land. We remove invaders. We kill invaders."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "combat_result":
		if win
		{
			if defence >= attack
				text = "Through the vigour of your soldiers and the sharpness of their swords, the barbarian raiding party is routed."
			else
				text = "Though outnumbered, your soldiers' strength of will allows them to gain the upper hand against the barbarian raiding party."
		}
		else
		{
			if defence >= attack
				text = "Despite your superior strength, the barbarians' pure physical strength proves too much for your soldiers, and you are quickly overwhelmed."
			else
				text = "The barbarian force are too many and too relentless, and your smaller force finds itself quickly overwhelmed."
		}
		yText=draw_encounter_text(text, fnEncounterText, yText)
		draw_combat_result(win, yText)
		break;
	case "surrender":
		text = "This is acceptable. We leave. For now."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}