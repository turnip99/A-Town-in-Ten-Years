// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		if random(1) < 1/3
			portrait = sprSoldier1
		if random(1) < 1/2
			portrait = sprSoldier2
		else
			portrait = sprSoldier3
		portrait_name = "Intrepid Knight"
		portrait_colour = c_blue
		create_encounter_buttons("Yes", "No")
		var btn = get_button_with_val("Yes")
		btn.gold = -scale_stat("Gold", 1000)
		btn.defence = scale_stat("Defence", 40)
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