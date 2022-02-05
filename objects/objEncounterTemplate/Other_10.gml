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
		create_encounter_buttons("Next")
		break;
	case "text_2":
		instance_destroy()
		instance_destroy(objEncounterButton)
		break;
}