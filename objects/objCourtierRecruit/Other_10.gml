// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		portrait = get_courtier_sprite("Steward")
		portrait_name = get_courtier_name("Steward")
		portrait_colour = c_green
		create_encounter_buttons("Next")
		break;
	case "text_1":
		state = "text_2"
		portrait = get_courtier_sprite(courtier)
		portrait_name = courtier_name
		create_encounter_buttons("Yes", "No")
		break;
	case "text_2":
		if button_val == "Yes"
		{
			state = "accept"
			recruit_courtier(courtier)
			audio_play_sound(sndCourtierAdvance, 0, false)
		}
		else
		{
			state = "reject"
			var button = get_courtier_button(courtier)
			button.rank = -1
		}
		create_encounter_buttons("Next")
		break;
	case "accept": case "reject":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_negative_encounter()
		break;
}