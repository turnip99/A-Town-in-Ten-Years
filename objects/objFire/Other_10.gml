// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		portrait = get_courtier_sprite(courtier)
		portrait_name = get_courtier_name(courtier)
		portrait_colour = c_green
		create_encounter_buttons("Yes", "No")
		var btn = get_button_with_val("Yes")
		btn.goods = -round(100+global.season*5)
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
		check_positive_encounter()
		break;
}