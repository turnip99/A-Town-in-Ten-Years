function draw_encounter_text(text, font, ys){
	if font = fnEncounterItalics
	{
		text = "\"" + text + "\""
		draw_set_colour(c_black)
	}
	else
	{
		draw_set_colour(c_dkgray)
	}
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	draw_set_font(font)
	var sep = 25
	var width = objEncounter.xSize-40
	draw_text_ext(objEncounter.xMiddle, ys, text, sep, width)
	return ys+string_height_ext(text, sep, width)+20
}


function create_encounter_buttons()
{
	instance_destroy(objEncounterButton)
	for (var i=0;i<argument_count;i+=1)
	{
	    var button_val = argument[i];
		var xs;
		var ys = objEncounter.y2-35
		switch (argument_count)
		{
			case 1:
				xs = objEncounter.xMiddle
				break;
			case 2:
				if i == 0
					xs = objEncounter.xMiddle-90
				else
					xs = objEncounter.xMiddle+90
				break;
			case 3:
				if i == 0
					xs = objEncounter.xMiddle-180
				else if i == 1
					xs = objEncounter.xMiddle
				else
					xs = objEncounter.xMiddle+180
				break;
		}
		instance_create_depth_args(xs, ys, -2000, objEncounterButton, button_val)
	}
}


function check_courtier_encounter()
{
	if global.season == 41
	{
		check_ending_encounter()
	}
	else if global.season <= 2
	{
		check_misc_encounter()
	}
	else if random(100) < 20*global.seasons_since_courtier_encounter
	{
		var courtier = get_random_unrecruited_courtier()
		if courtier == ""
		{
			check_negative_encounter()
		}
		else
		{
			instance_create_depth_args(0, 0, -1000, objCourtierRecruit, courtier)
		}
	}
	else
	{
		check_negative_encounter()
	}
}


function check_negative_encounter()
{
	if irandom(100) < 10*global.seasons_since_negative_encounter
	{
		if num_combat_destroyable_tiles() > 0
			var encounters = array(objDisease, objTribute, objVandals, objFire)
		else
			var encounters = array(objDisease, objTribute, objVandals)
		var encounter = encounters[irandom(array_length_1d(encounters)-1)]
		instance_create_depth(0, 0, -1000, encounter)
	}
	else
	{
		check_positive_encounter()
	}
}


function check_positive_encounter()
{
	if irandom(100) < 15*global.seasons_since_positive_encounter
	{
		var encounters = array(objGift, objWizard, objRefugees, objCircus, objCleric, objSoldier, objFlood)
		var encounter = encounters[irandom(array_length_1d(encounters)-1)]
		instance_create_depth(0, 0, -1000, encounter)
	}
	else
	{
		check_training_encounter()
	}
}


function check_training_encounter()
{
	if irandom(20) < num_trainable_courtiers() && get_stat("Gold") >= get_training_cost()
	{
		var courtier = get_random_trainable_courtier()
		if courtier == ""
		{
			check_combat_encounter()
		}
		else
		{
			instance_create_depth_args(0, 0, -1000, objTraining, courtier)
		}
	}
	else
	{
		check_combat_encounter()
	}
}


function check_combat_encounter()
{
	if global.season == 10
	{
		instance_create_depth(0, 0, -1000, objBelirvacCombat1)
	}
	else if global.season == 20
	{
		instance_create_depth(0, 0, -1000, objBelirvacCombat2)
	}
	else if global.season == 30
	{
		instance_create_depth(0, 0, -1000, objBelirvacCombat3)
	}
	else if global.season == 40
	{
		instance_create_depth(0, 0, -1000, objBelirvacCombat4)
	}
	else if global.season >= 5 && irandom(100) < 14*global.seasons_since_combat_encounter
	{
		if random(100) < 120-global.season*5
		{
			instance_create_depth(0, 0, -1000, objBanditCombat)
		}
		else if random(100) < 250-global.season*7
		{
			instance_create_depth(0, 0, -1000, objBarbarianCombat)
		}
		else if random(100) < 380-global.season*10
		{
			instance_create_depth(0, 0, -1000, objMercenaryCombat)
		}
		else
		{
			instance_create_depth(0, 0, -1000, objVampireCombat)
		}
	}
	else
	{
		check_misc_encounter()
	}
}


function check_misc_encounter()
{
	if global.season == 2
	{
		instance_create_depth(0, 0, -1000, objBelirvacIntro)
	}
	else if global.season == 9
	{
		instance_create_depth(0, 0, -1000, objBelirvacWarning1)
	}
	else if global.season == 19
	{
		instance_create_depth(0, 0, -1000, objBelirvacWarning2)
	}
	else if global.season == 29
	{
		instance_create_depth(0, 0, -1000, objBelirvacWarning3)
	}
	else if global.season == 39
	{
		instance_create_depth(0, 0, -1000, objBelirvacWarning4)
	}
	else
	{
		check_ending_encounter()
	}
}


function check_ending_encounter()
{
	if global.season == 41
	{
		instance_create_depth(0, 0, -1000, objEnding)
	}
	else
	{
		global.pause = false
		refresh_tile_yields()
	}
}


function get_button_with_val(text)
{
	with objEncounterButton
	{
		if val == text
		{
			return id
		}
	}
	return noone
}


function draw_encounter_button_yield(xs, ys, stat, val)
{
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_font(fnEncounterButtonYield)
	draw_set_colour(c_black)
	draw_sprite_stretched(get_stat_sprite(stat), 0, xs-35, ys, 20, 20)
	if stat == "Morale"
		draw_text(xs, ys, thousands_separator(plus_sign_num(val)) + "%")
	else
		draw_text(xs, ys, thousands_separator(plus_sign_num(val)))
}


function get_belirvac_attack_range(encounter_num, minmax)
{
	switch (encounter_num)
	{
		case 1:
			if minmax == "min"
				return 200
			else
				return 300
		case 2:
			if minmax == "min"
				return 2000
			else
				return 3000
		case 3:
			if minmax == "min"
				return 20000
			else
				return 30000
		case 4:
			if minmax == "min"
				return 70000
			else
				return 100000
	}
}


function get_belirvac_attack(encounter_num)
{
	return apply_assassin(irandom_range(get_belirvac_attack_range(encounter_num, "min"), get_belirvac_attack_range(encounter_num, "max")))
}


function get_combat_multipler(foe)
{
	switch (foe)
	{
		case "Bandit": return 0.8
		case "Barbarian": return 0.9;
		case "Mercenary": return 1
		case "Vampire": return 1.1;
		case "Belirvac": return 1.5;
	}
}

function get_attack(foe)
{
	var minimum = scale_stat("Defence", 50)*max(1, global.season-15)
	return apply_assassin(irandom_range(minimum, round(minimum*1.15)*get_combat_multipler(foe)))
}


function set_combat_yields(foe)
{
	var mult = get_combat_multipler(foe)
	win_prestige = restrict_stat_change("Prestige", round_min_1(scale_stat("Prestige", 12)*mult))
	win_defence = restrict_stat_change("Defence", round_min_1(scale_stat("Defence", 8)*mult))
	win_population = restrict_stat_change("Population", -irandom_range(round_min_1(scale_stat("Population", 5)*mult), round_min_1(scale_stat("Population", 10)*mult)))
	win_morale = restrict_stat_change("Morale", round_min_1(scale_stat("Morale", 5)*mult))
	win_gold = restrict_stat_change("Gold", round_min_1(scale_stat("Gold", 600)*mult))
	win_goods = restrict_stat_change("Goods", round_min_1(scale_stat("Goods", 50)*mult))

	lose_prestige = restrict_stat_change("Prestige", round_min_1(-scale_stat("Prestige", 18)*mult))
	lose_defence = restrict_stat_change("Defence", round_min_1(-scale_stat("Defence", 10)*mult))
	lose_population = restrict_stat_change("Population", -irandom_range(round_min_1(scale_stat("Population", 12)*mult), round_min_1(scale_stat("Population", 25)*mult)))
	lose_morale = restrict_stat_change("Morale", round_min_1(-scale_stat("Morale", 6)*mult))
	lose_gold = restrict_stat_change("Gold", round_min_1(-scale_stat("Gold", 750)*mult))
	lose_goods = restrict_stat_change("Goods", round_min_1(-scale_stat("Goods", 60)*mult))
	
	surrender_prestige = round_min_1(-scale_stat("Prestige", 5)*mult)
	surrender_gold = round_min_1(-scale_stat("Gold", 400)*mult)
	surrender_goods = round_min_1(-scale_stat("Goods", 30)*mult)

	lose_buildings = min(irandom_range(0, round(2*mult)), num_combat_destroyable_tiles())
	get_building_destroy_list(lose_buildings)
}


function apply_assassin(n)
{
	var courtier = get_courtier_button("Assassin")
	if courtier.toggled && get_stat("Gold")-get_envoy_assassin_cost(global.season-1) >= 0
	{
		increment("Gold", get_envoy_assassin_cost(global.season-1))
		return round_min_1(n*(1-courtier.rank/10))
	}
	else
	{
		return n
	}
}

function calculate_combat_win(defence, attack)
{
	var defence_modified = power(defence, 2.2)
	if defence_modified < 0
		defence_modified*=-1
	var attack_modified = power(attack, 2.2)
	if attack_modified < 0
		attack_modified*=-1
	if defence > attack * 1.7 || power(defence_modified, 2.2) > power(attack_modified, 2.2)
		return true
	else
		return false
}


function process_combat_yields(win)
{
	if win
	{
		increment("Prestige", win_prestige)
		increment("Defence", win_defence)
		increment("Population", win_population)
		increment("Morale", win_morale)
		increment("Gold", win_gold)
		increment("Goods", win_goods)
	}
	else
	{
		increment("Prestige", lose_prestige)
		increment("Defence", lose_defence)
		increment("Population", lose_population)
		increment("Morale", lose_morale)
		increment("Gold", lose_gold)
		increment("Goods", lose_goods)
		for (var i = 0; i < ds_list_size(building_destroy_list); i++)
		{
			var tile = ds_list_find_value(building_destroy_list, i)
			change_tile(tile, "Rubble", 0)
		}
	}
}


function draw_combat_result(win, ys)
{
	ys-=15
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	draw_set_font(fnCombatResult)
	if win
		var win_text = "Combat Victory!"
	else
		var win_text = "Combat Defeat!"
	draw_text(xMiddle, ys, win_text)
	draw_set_font(fnEncounterText)
	ys+=37
	if win
	{
		if win_population != 0
		{
			draw_text(xMiddle, ys, thousands_separator(-win_population) + " soldier(s) were slain during the battle.")
			ys+=22
		}
		if win_prestige != 0
		{
			draw_text(xMiddle, ys, "Your victory has earned you " + thousands_separator(win_prestige) + " prestige.")
			ys+=22
		}
		if win_defence != 0
		{
			draw_text(xMiddle, ys, "You salvage " + thousands_separator(win_defence) + " defence in weapons and equipment from the battlefield.")
			ys+=22
		}
		if win_morale != 0
		{
			draw_text(xMiddle, ys, "Your victory heartens your populace by " + thousands_separator(win_morale) + "%.")
			ys+=22
		}
		if win_gold != 0
		{
			draw_text(xMiddle, ys, "You salvage " + thousands_separator(win_gold) + " gold pieces from the battlefield.")
			ys+=22
		}
		if win_goods != 0
		{
			draw_text(xMiddle, ys,"You salvage " + thousands_separator(win_goods) + " goods from the battlefield.")
			ys+=22
		}
	}
	else
	{
		if lose_population != 0
		{
			draw_text(xMiddle, ys, thousands_separator(-lose_population) + " soldier(s) were slain during the battle.")
			ys+=22
		}
		if lose_prestige != 0
		{
			draw_text(xMiddle, ys, "Your defeat has cost you " + thousands_separator(-lose_prestige) + " prestige.")
			ys+=22
		}
		if lose_defence != 0
		{
			draw_text(xMiddle, ys, "Your defeat has weakened your defences by " + thousands_separator(-lose_defence) + ".")
			ys+=22
		}
		if lose_morale != 0
		{
			draw_text(xMiddle, ys, "Your defeat demoralises your populace by " + thousands_separator(-lose_morale) + "%.")
			ys+=22
		}
		if lose_gold != 0
		{
			draw_text(xMiddle, ys, "Your foe loots " + thousands_separator(-lose_gold) + " gold pieces from the town during the battle.")
			ys+=22
		}
		if lose_goods != 0
		{
			draw_text(xMiddle, ys, "Your foe loots " + thousands_separator(-lose_goods) + " goods from the town during the battle")
			ys+=22
		}
		for (var i = 0; i < ds_list_size(building_destroy_list_names); i++)
		{
			var tile_name = ds_list_find_value(building_destroy_list_names, i)
			draw_text(xMiddle, ys, "A " + tile_name + " was destroyed during the battle.")
			ys+=22
		}
	}
}


function get_building_destroy_list(lose_buildings)
{
	for (i = 0; i < lose_buildings; i++)
	{
		var tile = get_random_combat_destroyable_tile()
		tile.to_be_destroyed = true
		ds_list_add(building_destroy_list, tile)
		ds_list_add(building_destroy_list_names, tile.tile_name)
	}
}