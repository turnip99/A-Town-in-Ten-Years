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
		portrait = sprBelirvac
		portrait_name = "Belirvac, Displacer of Souls"
		portrait_colour = c_red
		state = "text_2"
		create_encounter_buttons("Yes", "No")
		break;
	case "text_2":
		if button_val == "No"
			state = "introduction"
		else
			state = "no_introduction"
		create_encounter_buttons("Next")
		break;
	case "introduction": case "no_introduction":
		state = "text_3"
		create_encounter_buttons("Next")
		break;
	case "text_3":
		state = "text_4"
		create_encounter_buttons("Next")
		break;
	case "text_4":
		portrait = get_courtier_sprite("Steward")
		portrait_name = get_courtier_name("Steward")
		portrait_colour = c_green
		state = "text_5"
		create_encounter_buttons("Next")
		break;
	case "text_5":
		state = "text_6"
		create_encounter_buttons("Next")
		break;
	case "text_6":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_ending_encounter()
		break;
}