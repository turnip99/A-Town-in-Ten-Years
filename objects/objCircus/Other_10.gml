// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		if random(1) < 0.5
			portrait = sprCircusMaster1
		else
			portrait = sprCircusMaster2
		portrait_name = "Travelling Circus Ringleader"
		portrait_colour = c_blue
		create_encounter_buttons("Yes", "No")
		var btn = get_button_with_val("Yes")
		btn.gold = -scale_stat("Gold", 1500)
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
	case "accept":
		if get_if_courtier_recruited("Merchant")
		{
			portrait = get_courtier_sprite("Merchant")
			portrait_name = get_courtier_name("Merchant")
			portrait_colour = c_green
			state = "merchant_comment"
			create_encounter_buttons("Next")
			break;
		}
	case "decline": case "merchant_comment":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_training_encounter()
		break;
}