// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		portrait = sprCleric
		portrait_name = "Wandering Cleric"
		portrait_colour = c_blue
		create_encounter_buttons("Yes", "No")
		var btn = get_button_with_val("Yes")
		btn.goods = -scale_stat("Goods", 150)
		btn.morale = scale_stat("Morale", 15)
		btn.prestige = scale_stat("Prestige", 15)
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