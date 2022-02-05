function get_stat(stat_name)
{
	var total = 0
	switch (stat_name)
	{
		case "Prestige":
			total = global.base_prestige;
			with (objTile)
			{
				total += passive_prestige
			}
			break;
		case "Defence":
			total = global.base_defence;
			with (objTile)
			{
				total += passive_defence
			}
			break;
		case "Max Population":
			total =  global.base_max_population;
			with (objTile)
			{
				total += passive_max_population
			}
			break;
		case "Morale":
			total =  global.base_morale;
			break;
		case "Gold":
			total =  global.base_gold;
			break;
		case "Goods":
			total =  global.base_goods;
			break;
		case "Population":
			total =  global.population;
			break;
	}
	return total
}


function get_stat_sprite(stat_name)
{
	switch (stat_name)
	{
		case "Prestige":
			return sprPrestige;
		case "Defence":
			return sprDefence;
		case "Max Population": case "Population":
			return sprPopulation;
		case "Morale":
			return sprMorale;
		case "Gold":
			return sprGold;
		case "Goods":
			return sprGoods;
	}
}


function increment(stat_name, i)
{
	switch (stat_name)
	{
		case "Prestige":
			global.base_prestige+=i;
			return i;
		case "Defence":
			global.base_defence+=i;
			return i;
		case "Max Population":
			global.base_max_population+=i;
			return i;
		case "Morale":
			var morale = get_stat("Morale")
			var new_morale = morale + i
			if new_morale > 200
				i = 200-morale
			if new_morale < 20
				i = 20-morale
			global.base_morale+=i;
			return i;
		case "Gold":
			var gold = get_stat("Gold")
			var new_gold = gold + i
			if new_gold < 0
				i = -gold
			global.base_gold+=i;
			return i;
		case "Goods":
			var goods = get_stat("Goods")
			var new_goods = goods + i
			if new_goods < 0
				i = -goods
			global.base_goods+=i;
			return i;
		case "Population":
			global.population+=i
			var max_population = get_stat("Max Population")
			if global.population > max_population
				global.population = max_population
			if global.population < 0
				global.population = 0
			return i;
	}
}


function get_required_population()
{
	var n = 0
	with objTile
	{
		n+=required_population
	}
	return n
}


function modify_passive_effect(val, num_beneficial_neighbours)
{
	return round_min_1(val*(1+num_beneficial_neighbours/10))
}


function modify_seasonal_yield(val, num_beneficial_neighbours)
{
	return round_min_1(modify_passive_effect(val, num_beneficial_neighbours)*(get_stat("Morale")/100)*min(get_stat("Population")/get_required_population(), 1))
}


function restrict_stat_change(stat_name, i)
{
	switch (stat_name)
	{
		case "Prestige": case "Defence":
			return i;
		case "Population":
			var max_population = get_stat("Max Population")
			var population = get_stat("Population")
			var new_population = population + i
			if new_population > max_population
				return max_population-population
			if new_population < 0
				return -population
			return i;
		case "Morale":
			var morale = get_stat("Morale")
			var new_morale = morale + i
			if new_morale > 200
				return 200-morale
			if new_morale < 20
				return 20-morale
			return i;
		case "Gold":
			var gold = get_stat("Gold")
			var new_gold = gold + i
			if new_gold < 0
				return -gold
			return i;
		case "Goods":
			var goods = get_stat("Goods")
			var new_goods = goods + i
			if new_goods < 0
				return -goods
			return i;
	}
}


function scale_stat(stat, val)
{
	switch (stat)
	{
		case "Defence":
			return round(val + val*power(0.1*global.season, 3))
		case "Gold": case "Goods":
			return round(val + val*power(0.1*global.season, 2))
		case "Population":
			return round(val + 0.06*val*global.season)
		case "Prestige": case "Morale":
			return round(val + 0.04*val*global.season)
	}
}