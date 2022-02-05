function initialise_tiles()
{
	var tile_width = 512
	var tile_height = 286
	x_start = -tile_width/2
	for (ys = -tile_height/2; ys < room_height; ys+=tile_height/2)
	{
		if x_start == 0
			x_start = -tile_width/2
		else
			x_start = 0
		for (xs = x_start; xs < room_width; xs+=tile_width)
		{
			obj_x = xs+tile_width/2
			obj_y = ys+tile_height/2
			if obj_x > 0 && obj_x < room_width && obj_y > 0 && obj_y < room_height
				obj = objTile
			else
				obj = objTileBorder
			instance_create_depth(obj_x, obj_y, -obj_y/100, obj)
		}
	}
	var keep_tile = get_keep_tile()
	change_tile(keep_tile, "Keep", 1)
	with objViewFollow
	{
		x = keep_tile.x
		y = keep_tile.y
		event_user(0)
	}
	for (var i=0; i<10; i++)
	{
		var forest_tile = get_random_empty_tile()
		forest_tile.tile_type = "Forest"
		forest_tile.tier = 0
		forest_tile.tile_name = "Forest"
		forest_tile.sprite_index = sprForest		
	}
	for (var i=0; i<7; i++)
	{
		var rubble_tile = get_random_empty_tile()
		rubble_tile.tile_type = "Rubble"
		rubble_tile.tier = 0
		rubble_tile.tile_name = "Rubble"
		rubble_tile.sprite_index = sprRubble		
	}
}


function get_tile_sprite(tile_type)
{
	switch (tile_type)
	{
		case "Arena": return sprArena; break;
		case "Barracks": return sprBarracks; break;
		case "Chapel": return sprChapel; break;
		case "Farm": return sprFarm; break;
		case "Forge": return sprForge; break;
		case "Keep": return sprKeep; break;
		case "Lodge": return sprLodge; break;
		case "Market": return sprMarket; break;
		case "Mine": return sprMine; break;
		case "Neighbourhood": return sprNeighbourhood; break;
		case "Watchtower": return sprWatchtower; break;
		case "Forest": return sprForest; break;
		case "Rubble": return sprRubble; break;
		case "Empty": return sprEmpty; break;
		case "Border": return sprBorder; break;
	}
}


function get_tile_tier_text(tier)
{
	switch (tier)
	{
		case 1: return "Basic"; break;
		case 2: return "Excellent"; break;
		case 3: return "Superb"; break;
		case 4: return "Magnificent"; break;
		default: return ""; break;
	}
}


function get_keep_tile()
{
	while true
	{
		tile = get_random_empty_tile()
		adjacent_tiles = get_adjacent_tiles(tile)
		if ds_list_size(adjacent_tiles) == 4
		{
			return tile
		}
	}
}


function get_random_empty_tile()
{
	if num_empty_tiles() == 0
		return noone
	while true
	{
		tile = get_random_tile()
		if tile.tile_type == "Empty"
		{
			return tile
		}
	}
}



function get_random_combat_destroyable_tile()
{
	while true
	{
		tile = get_random_tile()
		if tile.tier > 0 && tile.tile_type != "Keep" && tile.to_be_destroyed == false
		{
			return tile
		}
	}
}


function num_combat_destroyable_tiles()
{
	var n = 0
	with (objTile)
	{
		if tier > 0 && tile_type != "Keep" && to_be_destroyed == false
			n++
	}
	return n
}


function num_empty_tiles()
{
	var n = 0
	with (objTile)
	{
		if tile_type == "Empty"
		n+=1
	}
	return n
}


function get_random_tile() 
{
	return instance_find(objTile, irandom(instance_number(objTile) - 1));
}


function deselect_all_tiles()
{
	with (objTile)
	{
		selected = false
	}
	instance_destroy(objTileButton)
}


function get_adjacent_tiles(tile)
{
	ls = ds_list_create()
	var xs = tile.x
	var ys = tile.y
	var t
	t = instance_position(xs-256, ys-256, objTile)
	if t != noone
		ds_list_add(ls, t)
	t = instance_position(xs+256, ys-256, objTile)
	if t != noone
		ds_list_add(ls, t)
	t = instance_position(xs-256, ys+256, objTile)
	if t != noone
		ds_list_add(ls, t)
	t = instance_position(xs+256, ys+256, objTile)
	if t != noone
		ds_list_add(ls, t)
	return ls
}


function get_selected_tile()
{
	with (objTile)
	{
		if selected
			return self
	}
	return noone
}

function get_tile_name(tile_type, tier)
{
	switch (tile_type)
	{
		case "Empty": return "Grassland";
		case "Rubble": case "Forest": return tile_type;
		default: return string(get_tile_tier_text(tier)) + " " + string(tile_type);
	}
}

function get_tile_button_name(tile_type, tier)
{
	switch (tile_type)
	{
		case "Empty": return "Destroy Tile";
		default: return string(get_tile_tier_text(tier)) + " " + string(tile_type);
	}
}


function change_tile(tile, tile_type, tier)
{
	tile.tile_type = tile_type
	tile.tier = tier
	tile.tile_name = get_tile_name(tile_type, tier)
	tile.sprite_index = get_tile_sprite(tile_type)
	tile.to_be_destroyed = false
	with (tile)
	{
		beneficial_neighbours = get_tile_beneficial_neighbours(tile_type)
		required_population = get_tile_required_population(tile_type, tier)
		tile_name = get_tile_name(tile_type, tier)
	}
	refresh_tile_yields()
}


function refresh_tile_yields()
{
	with (objTile)
	{
		if tile_type != "Empty" && tile_type != "Forest" && tile_type != "Rubble"
		{
			num_beneficial_neighbours = get_num_beneficial_neighbours(id, id.beneficial_neighbours)			
		}
		else
		{	
			num_beneficial_neighbours = 0
		}
	}	
	with (objTile)
	{	
		set_tile_yields(tile_type, tier, num_beneficial_neighbours)
	}
	
	with (objTileButton)
	{
		if tile_type != "Empty" && tile_type != "Forest" && tile_type != "Rubble"
		{
			num_beneficial_neighbours = get_num_beneficial_neighbours(selected_tile, id.beneficial_neighbours)
		}
		else
		{	
			num_beneficial_neighbours = get_num_beneficial_neighbours(selected_tile, beneficial_neighbours)			
		}
	}	
	with (objTileButton)
	{	
		set_tile_yields(tile_type, tier, num_beneficial_neighbours)
	}
	
}


function get_tile_cost(current_tile_type, new_tile_type, current_tile_tier)
{
	if global.free_upgrade && current_tile_tier >= 1
	{
		return 0
	}
	var cost
	switch (new_tile_type)
	{
		case "Empty":
			return get_destroy_cost(current_tile_type, current_tile_tier);
		case "Keep":
			cost = 3000; break;
		case "Neighbourhood":
			cost = 600; break;
		case "Lodge":
			cost = 1000; break;
		case "Farm":
			cost = 700; break;
		case "Mine":
			cost = 900; break;
		case "Market":
			cost = 1200; break;
		case "Forge":
			cost = 1100; break;
		case "Barracks":
			cost = 1200; break;
		case "Watchtower":
			cost = 900; break;
		case "Chapel":
			cost = 1400; break;
		case "Arena":
			cost = 1200; break;
	}
	return round(cost*(1+(current_tile_tier)*0.3))
}


function get_destroy_cost(tile_type, tier)
{
	switch (tile_type)
	{
		case "Forest": return 300;
		case "Rubble": return 500;
		default: return round(get_tile_cost("Empty", tile_type, tier)/5)
	}
}


function set_tile_yields(tile_type, tier, num_beneficial_neighbours)
{
	passive_prestige = 0
	passive_defence = 0
	passive_max_population = 0
	seasonal_prestige = 0
	seasonal_defence = 0
	seasonal_morale = 0
	seasonal_gold = 0
	seasonal_goods = 0
	switch (tile_type)
	{
		case "Keep":
			passive_max_population = modify_passive_effect(30, num_beneficial_neighbours)*tier
			passive_defence = modify_passive_effect(30, num_beneficial_neighbours)*tier
			passive_prestige = modify_passive_effect(10, num_beneficial_neighbours)*tier
			seasonal_gold = modify_seasonal_yield(1000, num_beneficial_neighbours)*tier
			seasonal_prestige = modify_seasonal_yield(1, num_beneficial_neighbours)*tier
			courtier = get_courtier_button("Steward")
			if courtier.toggled
			{
				seasonal_gold*=(1+(0.25*courtier.rank))
				seasonal_prestige = 0
			}
			break;
		case "Neighbourhood":
			passive_max_population = modify_passive_effect(10, num_beneficial_neighbours)*tier
			passive_prestige = modify_passive_effect(1, num_beneficial_neighbours)*tier
			courtier = get_courtier_button("Architect")
			if courtier.toggled
			{
				seasonal_prestige+=(courtier.rank*tier)
				seasonal_gold-=200*tier
			}
			break;
		case "Lodge":
			passive_max_population = modify_passive_effect(7, num_beneficial_neighbours)*tier
			passive_prestige = modify_passive_effect(3, num_beneficial_neighbours)*tier
			seasonal_morale = modify_seasonal_yield(3, num_beneficial_neighbours)*tier
			courtier = get_courtier_button("Architect")
			if courtier.toggled
			{
				seasonal_prestige+=(courtier.rank*tier)
				seasonal_gold-=200*tier
			}
			break;
		case "Farm":
			passive_max_population = modify_passive_effect(2, num_beneficial_neighbours)*tier
			passive_prestige = modify_passive_effect(1, num_beneficial_neighbours)*tier
			seasonal_goods = modify_seasonal_yield(30, num_beneficial_neighbours)*tier
			courtier = get_courtier_button("Foreman")
			if courtier.toggled
			{
				seasonal_goods*=(1+(0.5*courtier.rank))
				seasonal_morale-=2*tier
			}
			break;
		case "Mine":
			passive_defence = modify_passive_effect(2, num_beneficial_neighbours)*tier
			passive_prestige = modify_passive_effect(1, num_beneficial_neighbours)*tier
			seasonal_goods = modify_seasonal_yield(50, num_beneficial_neighbours)*tier
			seasonal_morale = modify_seasonal_yield(-3, num_beneficial_neighbours)*tier
			courtier = get_courtier_button("Foreman")
			if courtier.toggled
			{
				seasonal_goods*=(1+(0.5*courtier.rank))
				seasonal_morale-=2*tier
			}
			break;
		case "Market":
			passive_prestige = modify_passive_effect(2, num_beneficial_neighbours)*tier
			seasonal_goods = modify_seasonal_yield(-40, num_beneficial_neighbours)*tier
			seasonal_gold = modify_seasonal_yield(700, num_beneficial_neighbours)*tier
			seasonal_morale = modify_seasonal_yield(3, num_beneficial_neighbours)*tier
			courtier = get_courtier_button("Merchant")
			if courtier.toggled
			{
				seasonal_morale*=(1+courtier.rank)
				seasonal_gold*=0.5
			}
			break;
		case "Forge":
			passive_prestige = modify_passive_effect(2, num_beneficial_neighbours)*tier
			seasonal_goods = modify_seasonal_yield(-40, num_beneficial_neighbours)*tier
			seasonal_defence = modify_seasonal_yield(12, num_beneficial_neighbours)*tier
			courtier = get_courtier_button("Engineer")
			if courtier.toggled
			{
				seasonal_defence*=(1+(0.5*courtier.rank))
				seasonal_gold-=200*tier
			}
			break;
		case "Barracks":
			passive_defence = modify_passive_effect(5, num_beneficial_neighbours)*tier
			passive_max_population = modify_passive_effect(3, num_beneficial_neighbours)*tier
			passive_prestige = modify_passive_effect(2, num_beneficial_neighbours)*tier
			seasonal_defence = modify_seasonal_yield(8, num_beneficial_neighbours)*tier
			courtier = get_courtier_button("Veteran")
			if courtier.toggled
			{
				seasonal_defence*=(1+(0.5*courtier.rank))
				seasonal_gold-=200*tier
			}
			break;
		case "Watchtower":
			passive_defence = modify_passive_effect(30, num_beneficial_neighbours)*tier
			passive_prestige = modify_passive_effect(2, num_beneficial_neighbours)*tier
			courtier = get_courtier_button("Engineer")
			if courtier.toggled
			{
				passive_defence*=(1+courtier.rank)
				seasonal_gold-=200*tier
			}
			break;
		case "Chapel":
			passive_defence = modify_passive_effect(3, num_beneficial_neighbours)*tier
			passive_prestige = modify_passive_effect(4, num_beneficial_neighbours)*tier
			seasonal_gold = modify_seasonal_yield(200, num_beneficial_neighbours)*tier
			seasonal_morale = modify_seasonal_yield(4, num_beneficial_neighbours)*tier
			courtier = get_courtier_button("Priest")
			if courtier.toggled
			{
				seasonal_prestige+=(courtier.rank)*tier
				seasonal_gold = 0
			}
			break;
		case "Arena":
			passive_defence = modify_passive_effect(2, num_beneficial_neighbours)*tier
			passive_prestige = modify_passive_effect(3, num_beneficial_neighbours)*tier
			seasonal_gold = modify_seasonal_yield(800, num_beneficial_neighbours)*tier
			seasonal_morale = modify_seasonal_yield(-5, num_beneficial_neighbours)*tier
			courtier = get_courtier_button("Swindler")
			if courtier.toggled
			{
				seasonal_gold*=(1+(0.5*courtier.rank))
				seasonal_prestige-=1*tier
			}
			break;
	}
	passive_prestige = round_min_1(passive_prestige)
	passive_defence = round_min_1(passive_defence)
	passive_max_population = round_min_1(passive_max_population)
	seasonal_prestige = round_min_1(seasonal_prestige)
	seasonal_defence = round_min_1(seasonal_defence)
	seasonal_morale = round_min_1(seasonal_morale)
	seasonal_gold = round_min_1(seasonal_gold)
	seasonal_goods = round_min_1(seasonal_goods)
}


function get_num_passive_effects()
{
	var n = 0
	if passive_prestige != 0
		n+=1
	if passive_defence != 0
		n+=1
	if passive_max_population != 0
		n+=1
	return n
}


function get_num_seasonal_yields()
{
	var n = 0
	if seasonal_prestige != 0
		n+=1
	if seasonal_defence != 0
		n+=1
	if seasonal_morale != 0
		n+=1
	if seasonal_gold != 0
		n+=1
	if seasonal_goods != 0
		n+=1
	return n
}


function get_num_beneficial_neighbours(tile, beneficial_neighbours)
{
	var n = 0
	var adjacent_tiles = get_adjacent_tiles(tile)
	for (var i = 0; i < ds_list_size(adjacent_tiles); i++)
	{
		var adjacent_tile_type = ds_list_find_value(adjacent_tiles, i).tile_type
		if get_if_in_array(adjacent_tile_type, beneficial_neighbours)
		{
			n++
		}
	}
	return n
}

function get_tile_required_population(tile_type, tier)
{
	var required_population
	switch (tile_type)
	{
		case "Keep":
			required_population = 12; break;
		case "Neighbourhood":
			required_population = 1; break;
		case "Lodge":
			required_population = 2; break;
		case "Farm":
			required_population = 6; break;
		case "Mine":
			required_population = 6; break;
		case "Market":
			required_population = 8; break;
		case "Forge":
			required_population = 6; break;
		case "Barracks":
			required_population = 8; break;
		case "Watchtower":
			required_population = 4; break;
		case "Chapel":
			required_population = 6; break;
		case "Arena":
			required_population = 6; break;
		default:
			return 0;
	}
	return round(required_population*(1+(tier-1)*0.25))
}


function get_tile_beneficial_neighbours(tile_type)
{
	switch (tile_type)
	{
		case "Keep":
			return array("Watchtower", "Chapel");
		case "Neighbourhood":
			return array("Farm", "Market");
		case "Lodge":
			return array("Farm", "Market");
		case "Farm":
			return array("Neighbourhood", "Lodge");
		case "Mine":
			return array("Neighbourhood", "Lodge");
		case "Market":
			return array("Farm", "Mine");
		case "Forge":
			return array("Mine", "Arena");
		case "Barracks":
			return array("Forge", "Keep");
		case "Watchtower":
			return array("Barracks", "Mine");
		case "Chapel":
			return array("Keep", "Lodge");
		case "Arena":
			return array("Forge", "Neighbourhood");
		default:
			return "";
	}
	return round(required_population*(1+(tier-1)*0.25))
}