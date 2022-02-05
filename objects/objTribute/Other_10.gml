// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
			portrait = get_courtier_sprite(courtier)
		portrait_name = get_courtier_name(courtier)
		portrait_colour = c_green
		create_encounter_buttons("Pay Tribute", "Refuse")
		var btn = get_button_with_val("Pay Tribute")
		btn.gold = -scale_stat("Gold", 1000)
		var btn = get_button_with_val("Refuse")
		btn.prestige = -scale_stat("Prestige", 10)
		break;
	case "text_1":
		if button_val == "Pay Tribute"
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