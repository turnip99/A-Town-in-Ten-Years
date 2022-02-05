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
		state = "text_end_1"
		create_encounter_buttons("Next")
		break;
	case "text_end_1":
		state = "text_end_2"
		killed_courtier = get_random_recruited_courtier_button_not_steward()
		if killed_courtier != ""
		{
			killed_courtier.rank = -1
			killed_courtier.toggled = false
		}
		create_encounter_buttons("Next")
		break;
	case "text_end_2":
		state = "text_end_3"
		killer_courtier = get_random_recruited_courtier_button()
		portrait = killer_courtier.sprite
		portrait_name = killer_courtier.name
		portrait_colour = c_green
		create_encounter_buttons("Next")
		break;
	case "text_end_3":
		state = "text_end_4"
		portrait = get_courtier_sprite("Steward")
		portrait_name = get_courtier_name("Steward")
		create_encounter_buttons("Next")
		break;
	case "text_end_4":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_misc_encounter()
		break;
}