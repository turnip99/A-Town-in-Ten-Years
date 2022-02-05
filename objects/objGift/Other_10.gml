// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		portrait = sprRoyalEnvoy
		portrait_name = "Gauthier, Envoy of the High King"
		portrait_colour = c_blue
		create_encounter_buttons("Coin", "Provisions", "Weapons")
		var btn = get_button_with_val("Coin")
		btn.gold = scale_stat("Gold", 1000)
		var btn = get_button_with_val("Provisions")
		btn.goods = scale_stat("Goods", 100)
		var btn = get_button_with_val("Weapons")
		btn.defence = scale_stat("Defence", 20)
		break;
	case "text_1":
		state = "text_end"
		create_encounter_buttons("Next")
		break;
	case "text_end":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_training_encounter()
		break;
}