// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		portrait = sprBandit
		portrait_name = "Ruthless Bandit"
		portrait_colour = c_red
		create_encounter_buttons("Next")
		break;
	case "text_1":
		state = "combat_begin"
		create_encounter_buttons("Fight", "Surrender")
		var btn = get_button_with_val("Surrender")
		btn.prestige = surrender_prestige
		btn.gold = surrender_gold
		btn.goods = surrender_goods
		break;
	case "combat_begin":
		if button_val == "Fight"
		{
			state = "combat_result"
			win = calculate_combat_win(defence, attack)
			if win
				audio_play_sound(sndCombatWin, 0, false)
			else
				audio_play_sound(sndCombatLose, 0, false)
			process_combat_yields(win)
		}
		else
		{
			state = "surrender"
		}
		create_encounter_buttons("Next")
		break;
	case "combat_result": case "surrender":
		instance_destroy()
		instance_destroy(objEncounterButton)
		check_misc_encounter()
		break;
}