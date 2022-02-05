// Event for button press.

switch (state)
{
	case "setup":
		state = "text_1"
		portrait = sprSteward
		portrait_name = "Estella, Keeper of Keeps"
		portrait_colour = c_green
		create_encounter_buttons("Next")
		break;
	case "text_1":
		state = "text_2"
		portrait = sprRoyalEnvoy
		portrait_name = "Gauthier, Envoy of the High King"
		portrait_colour = c_blue
		create_encounter_buttons("Next")
		break;
	case "text_2":
		global.prestige_result = get_stat("Prestige")
		global.defence_result = get_stat("Defence")
		global.population_result = get_stat("Population")
		global.morale_result = get_stat("Morale")
		global.gold_result = get_stat("Gold")
		global.goods_result = get_stat("Goods")
		room_goto(rmResults)
		break;
}