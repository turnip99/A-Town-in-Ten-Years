// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		portrait = get_courtier_sprite(courtier)
		portrait_name = get_courtier_name(courtier)
		portrait_colour = c_green
		create_encounter_buttons("Gift gold", "Gift goods", "Do nothing")
		var btn = get_button_with_val("Gift gold")
		btn.gold = -scale_stat("Gold", 1000)
		btn.prestige = scale_stat("Prestige", 15)
		var btn = get_button_with_val("Gift goods")
		btn.goods = -scale_stat("Goods", 150)
		btn.prestige = scale_stat("Prestige", 15)
		break;
	case "text_1":
		if button_val == "Gift gold"
			state = "gold"
		else if button_val == "Gift goods"
			state = "goods"
		else
			state = "decline"
		create_encounter_buttons("Next")
		break;
	case "gold": case "goods": case "decline":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_training_encounter()
		break;
}