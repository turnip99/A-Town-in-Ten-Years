event_inherited();

switch (state)
{
	case "text_1":
		text = "So, the ignorant child still defies my noble work. No matter. This will all be over soon."
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
			text = "Aargh! Your foolish child! Your strength has grown, that I will concede, but I will not relinquish my claim to this valley. Do not forget that, " + global.player_name + "."
		else
			text = "You see, your forces are no match for my gifted warriors. I will leave you now to wallow in the shame of your defeat, as I savour this victory. When I return, may your court quiver in terror."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break
}