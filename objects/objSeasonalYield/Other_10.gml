// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		create_encounter_buttons("Next")
		break;
	case "text_1":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_courtier_encounter()
		break;
}