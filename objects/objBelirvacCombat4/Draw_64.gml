event_inherited();

switch (state)
{
	case "text_1":
		text = "We meet again, " + global.player_name + ", but this time will be the last. I grow tired of our little bouts, and now it is time to put our disagreement to rest - in your blood! Farewell, " + global.player_name + "."
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
	case "text_end_1":
		if win
			text = "You have caused me a minor inconvenience, child. But then again, perhaps not..."
		else
			text = "Behold, the dead are victorious! Now, behold as I finish this and claim my prize!"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break
	case "text_end_2":
		if killed_courtier == ""
			text = "A great blast of red flame erupts from the entrance of your keep, incinerating the great doors and a number of soldiers. Out from the smoke walks Belirvac, a maniacal grin on his face."
		else
			text = "A great blast of red flame erupts from the entrance of your keep, incinerating the great doors and a number of soldiers. Among the dead, you spot the charred body of " + killed_courtier.name + ". Out from the smoke walks Belirvac, a maniacal grin on his face."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		text = "Well, well, well. Looks like this is it, " + global.player_name + "."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Belirvac raises his staff towards the sky as he cackles with glee. You feel the very air around you begin to vibrate with fell energy, and the ground beneath your feet starts to tremble violently."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break
	case "text_end_3":
		text = "Suddenly, from out of the smoke, you see the form of " + killer_courtier.short_name + " leap towards Belirvac's exposed back. The necromancer turns his head to see a dagger erupt from his chest."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		text = "Belirvac's lifeless corpse falls to the ash-coated floor without a sound."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		if !win
		{
			text = "With their master slain, your remaining soldiers successfully rout the remaining undead army."
			yText=draw_encounter_text(text, fnEncounterText, yText)
		}
		break
	case "text_end_4":
		if killer_courtier.courtier == "Steward"
			text = "That appears to be the last of them, my " + global.player_title + ". This truly is a monumental day, for the dreaded necromancer has at last met his end. May the name of " + global.player_name + " go down in history!"
		else
			text = "That appears to be the last of them, my " + global.player_title + ". This truly is a monumental day, for the dreaded necromancer has at last met his end. May the names of " + global.player_name + " and " + killer_courtier.short_name + " go down in history for their resilience and courage!"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Now that this matter is behind us, I remember that the high king's envoy is due to arrive sometime soon to assess " + global.town_name + ". Let us swiftly prepare for his visit."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break
}