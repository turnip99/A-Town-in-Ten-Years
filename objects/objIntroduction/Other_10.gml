// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		portrait = get_courtier_sprite("Steward")
		portrait_name = get_courtier_name("Steward")
		portrait_colour = c_green
		create_encounter_buttons("Yes", "No")
		break;
	case "text_1":
		if button_val == "Yes"
		{
			state = "text_2"
			create_encounter_buttons("Next")
		}
		else
		{
			instance_destroy()
			instance_destroy(objEncounterButton)
			global.pause = false
		}
		break;
	case "text_2":
		state = "text_3"
		create_encounter_buttons("Next")
		break;
	case "text_3":
		state = "text_4"
		create_encounter_buttons("Next")
		break;
	case "text_4":
		state = "text_5"
		create_encounter_buttons("Next")
		break;
	case "text_5":
		state = "text_6"
		create_encounter_buttons("Next")
		break;
	case "text_6":
		state = "text_7"
		create_encounter_buttons("Next")
		break;
	case "text_7":
		state = "text_8"
		create_encounter_buttons("Begin Game")
		break;
	case "text_8":
		instance_destroy()
		instance_destroy(objEncounterButton)
		global.pause = false
		break;
}