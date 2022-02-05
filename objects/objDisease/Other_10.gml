// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		portrait = get_courtier_sprite(courtier)
		portrait_name = get_courtier_name(courtier)
		portrait_colour = c_green
		create_encounter_buttons("Buy medicine", "Make medicine", "Do nothing")
		var btn = get_button_with_val("Buy medicine")
		btn.gold = -scale_stat("Gold", 1000)
		var btn = get_button_with_val("Make medicine")
		btn.goods = -scale_stat("Goods", 100)
		var btn = get_button_with_val("Do nothing")
		btn.prestige = -scale_stat("Prestige", 10)
		btn.population = -min(get_stat("Population"), scale_stat("Population", 20))
		break;
	case "text_1":
		if button_val == "Buy medicine"
			state = "gold"
		else if button_val == "Make medicine"
			state = "goods"
		else
			state = "decline"
		create_encounter_buttons("Next")
		break;
	case "gold": case "goods": case "decline":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_positive_encounter()
		break;
}