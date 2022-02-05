event_inherited();

switch (state)
{
	case "text_1":
		text = "Hello there, " + global.player_title_name + ". My Apologies for the intrusion. My brothers and sisters have grown hungry of late, and they desire the blood of a " + string_lower(global.player_title) + ". Just hold still, please, it won't hurt a bit..."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "combat_result":
		if win
		{
			if defence >= attack
				text = "Through the vigour of your soldiers and the sharpness of their swords, the vampire forces are routed."
			else
				text = "Though outnumbered, your soldiers' strength of will allows them to gain the upper hand against the vampires."
		}
		else
		{
			if defence >= attack
				text = "Despite your superior strength, the vampires' cunning proves too much for your soldiers, and you are quickly overwhelmed."
			else
				text = "The vampire force are too many and too skilled, and your smaller force finds itself quickly overwhelmed."
		}
		yText=draw_encounter_text(text, fnEncounterText, yText)
		draw_combat_result(win, yText)
		break;
	case "surrender":
		text = "This prize is not without value, I say. So be it. But make no mistake, " + global.player_title_name + ", we shall return."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}