event_inherited();

switch (state)
{
	case "text_1":
		text = "Greetings, " + global.player_name + ". I was lenient when we last met, but now my patience has run dry. You insist on standing between me and my prize, and for this you shall be dispossessed. Let's make this quick."
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
			text = "Very impressive, child. Perhaps I underestimated you. Don't you worry, though, it won't happen again..."
		else
			text = "Behold, you are nothing in the face of my chosen! Let this battle serve as a lesson to you and your court - none can face the Displacer of Souls and stand."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break
}