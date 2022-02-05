event_inherited();

switch (state)
{
	case "text_1":
		text = "Good day to you, my " + global.player_title + ". Me and my boys caught whiff of something shiny in your town's treasury. I hope you don't mind if we help ourselves?"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "combat_result":
		if win
		{
			if defence >= attack
				text = "Through the vigour of your soldiers and the sharpness of their swords, the bandit forces are routed."
			else
				text = "Though outnumbered, your soldiers' strength of will allows them to gain the upper hand against the bandits."
		}
		else
		{
			if defence >= attack
				text = "Despite your superior strength, the bandits' guile proves too much for your soldiers, and you are quickly overwhelmed."
			else
				text = "The bandit force are too many and too skilled, and your smaller force finds itself quickly overwhelmed."
		}
		yText=draw_encounter_text(text, fnEncounterText, yText)
		draw_combat_result(win, yText)
		break;
	case "surrender":
		text = "A pleasure doing business with you, my " + global.player_title + "."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}