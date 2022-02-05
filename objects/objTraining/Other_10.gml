// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		portrait = get_courtier_sprite(courtier)
		portrait_name = courtier_name
		portrait_colour = c_green
		create_encounter_buttons("Yes", "No")
		var btn = get_button_with_val("Yes")
		btn.gold = get_training_cost()
		break;
	case "text_1":
		var button = get_courtier_button(courtier)
		button.training_attempted = true
		if button_val == "Yes"
		{
			state = "accept"
			button.rank = 2
			audio_play_sound(sndCourtierAdvance, 0, false)
		}
		else
		{
			state = "reject"
		}
		create_encounter_buttons("Next")
		break;
	case "accept": case "reject":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_combat_encounter()
		break;
}