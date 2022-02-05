// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		if random(1) < 0.5
			portrait = sprWizard1
		else
			portrait = sprWizard2
		portrait_name = "Vagabond Wizard"
		portrait_colour = c_blue
		create_encounter_buttons("Yes", "No")
		var btn = get_button_with_val("Yes")
		btn.population = -scale_stat("Population", 5)
		break;
	case "text_1":
		if button_val == "Yes"
			state = "accept"
		else
			state = "decline"
		create_encounter_buttons("Next")
		break;
	case "accept": case "decline":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_training_encounter()
		break;
}