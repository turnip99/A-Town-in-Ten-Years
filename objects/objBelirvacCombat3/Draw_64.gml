event_inherited();

switch (state)
{
	case "text_1":
		text = "Here we are again, " + global.player_name + ", at the crossroads of fate. Except this time, destiny is on my side. Come, embrace your fate, child!"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "combat_begin":
		text = "Belirvac won't accept surrender - your only hope is to defeat his undead hoard in combat."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
	case "combat_result":
		if win
		{
			if defence >= attack
				text = "Through the vigour of your soldiers and the sharpness of their swords, Belirvac's forces are routed."
			else
				text = "Though outnumbered, your soldiers' strength of will allows them to gain the upper hand against Belirvac's undead hoard."
		}
		else
		{
			if defence >= attack
				text = "Despite your superior strength, Belirvac's brutal combat tactics prove too much for your soldiers, and you are quickly overwhelmed."
			else
				text = "Belirvac's forces are too many and too brutal, and your smaller force finds itself quickly overwhelmed."
		}
		yText=draw_encounter_text(text, fnEncounterText, yText)
		draw_combat_result(win, yText)
		break;
	case "text_end":
		if win
			text = "This is unfathomable - that you have defeated my hoard not once, not twice, but three times. For this, you have my respect, " + global.player_name + ". You have not disuaded me, though. I will return for my own, and this time, there will be no dawn for " + global.town_name + "."
		else
			text = "Foolish child! None can stand against the mighty Belirvac and live! I shall return one final time, and when I do, there shall be no quarter."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break
}