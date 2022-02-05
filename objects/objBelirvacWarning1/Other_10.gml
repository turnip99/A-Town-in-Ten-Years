// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		portrait = get_courtier_sprite(courtier)
		portrait_name = get_courtier_name(courtier)
		portrait_colour = c_green
		create_encounter_buttons("Next")
		break;
	case "text_1":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_ending_encounter()
		break;
}