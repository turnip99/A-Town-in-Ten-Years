function get_courtier_name(courtier)
{
	switch (courtier)
	{
		case "Steward": return "Estella, Keeper of Keeps";
		case "Architect": return "Jocelyn of Many Eyes";
		case "Foreman": return "Lothar the Brutal";
		case "Merchant": return "Haiko the Flavourful";
		case "Engineer": return "Ina the Ingenious";
		case "Veteran": return "Shattered-spear Silas";
		case "Priest": return "Warley, Sage of Six Suns";
		case "Swindler": return "Big-bet Barnabas";
		case "Envoy": return "Bertha the Silver-tongued";
		case "Assassin": return "Vera, Knife of the North";
	}
}


function get_courtier_short_name(courtier)
{
	switch (courtier)
	{
		case "Steward": return "Estella";
		case "Architect": return "Jocelyn";
		case "Foreman": return "Lothar";
		case "Merchant": return "Haiko";
		case "Engineer": return "Ina";
		case "Veteran": return "Silas";
		case "Priest": return "Warley";
		case "Swindler": return "Barnabas";
		case "Envoy": return "Bertha";
		case "Assassin": return "Vera";
	}
}

function get_courtier_sprite(courtier)
{
	switch (courtier)
	{
		case "Steward": return sprSteward;
		case "Architect": return sprArchitect;
		case "Foreman": return sprForeman;
		case "Merchant": return sprMerchant;
		case "Engineer": return sprEngineer;
		case "Veteran": return sprVeteran;
		case "Priest": return sprPriest;
		case "Swindler": return sprSwindler;
		case "Envoy": return sprEnvoy;
		case "Assassin": return sprAssassin;
	}
}


function get_courtier_personality(courtier)
{
	switch (courtier)
	{
		case "Steward": return "Humble/Reliable";
		case "Architect": return "Honest/Self-confident";
		case "Foreman": return "Humourless/Assertive";
		case "Merchant": return "Lighthearted/Witty";
		case "Engineer": return "Timid/Diligent";
		case "Veteran": return "Impassive/Stern";
		case "Priest": return "Astute/Dutiful";
		case "Swindler": return "Resourceful/Egotistical";
		case "Envoy": return "Professional/Eloquent";
		case "Assassin": return "Shady/Purposeful";
	}
}


function get_courtier_description(courtier, rank)
{
	switch (courtier)
	{
		case "Steward": return "+" + string(25*rank) + "% keep seasonal gold\n-100% keep seasonal prestige";
		case "Architect": return "+" + string(1*rank) + " neighbourhood seasonal prestige per tier\n+" + string(1*rank) + " lodge seasonal prestige per tier\n-200 neighbourhood seasonal gold per tier\n-200 lodge seasonal gold per tier";
		case "Foreman": return "+" + string(50*rank) + "% farm seasonal goods\n+" + string(50*rank) + "% mine seasonal goods\n-2 farm seasonal morale per tier\n-2 mine seasonal morale per tier";
		case "Merchant": return "+" + string(100*rank) + "% market seasonal morale\n-50% market seasonal gold";
		case "Engineer": return "+" + string(100*rank) + "% watchtower passive defence\n+" + string(50*rank) + "% forge seasonal defence\n-200 watchtower seasonal gold per tier\n-200 forge seasonal gold per tier";
		case "Veteran": return "+" + string(50*rank) + "% barracks seasonal defence\n-200 barracks seasonal gold per tier";
		case "Priest": return "+" + string(1*rank) + " chapel seasonal prestige per tier\n-100% chapel seasonal gold";
		case "Swindler": return "+" + string(50*rank) + "% arena seasonal gold\n-1 arena seasonal prestige per tier";
		case "Envoy": return "+" + string(100*rank) + "% seasonal population growth\n-" + thousands_separator(get_envoy_assassin_cost(global.season)) + " seasonal gold";
		case "Assassin": return "-" + string(10*rank) + "% combat encounter enemy attack\n-" + thousands_separator(get_envoy_assassin_cost(global.season)) + " seasonal gold";
	}
}


function get_envoy_assassin_cost(season)
{
	return scale_stat("Gold", 600)
}


function get_courtier_button(courtier)
{
	with (objCourtierButton)
	{
		if self.courtier == courtier
			return id
	}
	return noone
}


function recruit_courtier(courtier)
{
	var button = get_courtier_button(courtier)
	button.rank = 1
	button.season_recruited = global.season
	var num_recruited = 9
	with (objCourtierButton)
	{
		if rank <= 0
		{
			num_recruited-=1
		}
	}
	with (button)
	{
		y = 99+num_recruited*80
		y1 = y
		y2 = y1+h
	}
	var ys = window_get_height()
	with (objCourtierButton)
	{
		if rank <= 0
		{
			y2 = ys
			y1 = y2-h
			y = y1
			ys-=h
		}
	}
}


function get_random_unrecruited_courtier()
{
	var unrecruited_courtiers = ds_list_create()
	with (objCourtierButton)
	{
		if rank == 0
		{
			ds_list_add(unrecruited_courtiers, courtier)
		}
	}
	var list_size = ds_list_size(unrecruited_courtiers)
	if list_size == 0
		return ""
	else
		return ds_list_find_value(unrecruited_courtiers, irandom(list_size-1))
}


function num_trainable_courtiers()
{
	var n = 0
	with (objCourtierButton)
	{
		if self.rank > 0 && !training_attempted && global.season - season_recruited > 2
			n++
	}
	return n
}


function get_random_recruited_courtier_button()
{
	var recruited_courtiers = ds_list_create()
	with (objCourtierButton)
	{
		if rank > 0
		{
			ds_list_add(recruited_courtiers, id)
		}
	}
	var list_size = ds_list_size(recruited_courtiers)
	if list_size == 0
		return ""
	else
		return ds_list_find_value(recruited_courtiers, irandom(list_size-1))
}


function get_random_recruited_courtier_button_not_steward()
{
	var recruited_courtiers = ds_list_create()
	with (objCourtierButton)
	{
		if rank > 0 && courtier != "Steward"
		{
			ds_list_add(recruited_courtiers, id)
		}
	}
	var list_size = ds_list_size(recruited_courtiers)
	if list_size == 0
		return ""
	else
		return ds_list_find_value(recruited_courtiers,  irandom(list_size-1))
}


function get_random_trainable_courtier()
{
	var trainable_courtiers = ds_list_create()
	with (objCourtierButton)
	{
		if self.rank > 0 && !training_attempted && global.season - season_recruited > 2
		{
			ds_list_add(trainable_courtiers, courtier)
		}
	}
	var list_size = ds_list_size(trainable_courtiers)
	if list_size == 0
		return ""
	else
		return ds_list_find_value(trainable_courtiers, irandom(list_size-1))
}


function get_training_cost()
{
	return -scale_stat("Gold", 1000)
}


function get_if_courtier_recruited(courtier)
{
	return get_courtier_button(courtier).rank > 0
}