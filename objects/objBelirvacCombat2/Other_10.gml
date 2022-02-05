// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		portrait = sprBelirvac
		portrait_name = "Belirvac, Displacer of Souls"
		portrait_colour = c_red
		create_encounter_buttons("Next")
		break;
	case "text_1":
		state = "combat_begin"
		create_encounter_buttons("Fight")
		break;
	case "combat_begin":
		state = "combat_result"
		win = calculate_combat_win(defence, attack)
		if win
			audio_play_sound(sndCombatWin, 0, false)
		else
			audio_play_sound(sndCombatLose, 0, false)
		process_combat_yields(win)
		create_encounter_buttons("Next")
		break;
	case "combat_result":
		state = "text_end"
		create_encounter_buttons("Next")
		break;
	case "text_end":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_misc_encounter()
		break;
}