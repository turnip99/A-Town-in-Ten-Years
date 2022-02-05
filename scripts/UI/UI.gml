function draw_icon(xs, ys, sprite)
{
	draw_sprite_stretched(sprBase, 0, xs, ys, 50, 50)
	draw_sprite_stretched(sprite, 0, xs+10, ys+10, 30, 30)	
}


function create_tooltip(x1, y1, x2, y2, topic)
{
	instance_create_depth_args(0, 0, -500, objTooltipHandler, x1, y1, x2, y2, topic)
}


function create_tile_buttons(tile_type, tier)
{
	xStart = 1000
	yRow1 = 25
	yRow2 = 75
	xs = xStart
	switch (tile_type)
	{
		case "Empty":
			instance_create_depth_args(xs, yRow1, -500, objTileButton, "Neighbourhood", 1, "1")
			instance_create_depth_args(xs, yRow2, -500, objTileButton, "Lodge", 1, "6")
			xs+=50
			instance_create_depth_args(xs, yRow1, -500, objTileButton, "Farm", 1, "2")
			instance_create_depth_args(xs, yRow2, -500, objTileButton, "Mine", 1, "7")
			xs+=50
			instance_create_depth_args(xs, yRow1, -500, objTileButton, "Market", 1, "3")
			instance_create_depth_args(xs, yRow2, -500, objTileButton, "Forge", 1, "8")
			xs+=50
			instance_create_depth_args(xs, yRow1, -500, objTileButton, "Barracks", 1, "4")
			instance_create_depth_args(xs, yRow2, -500, objTileButton, "Watchtower", 1, "9")
			xs+=50
			instance_create_depth_args(xs, yRow1, -500, objTileButton, "Chapel", 1, "5")
			instance_create_depth_args(xs, yRow2, -500, objTileButton, "Arena", 1, "0")
			break;
		case "Forest": case "Rubble":
			instance_create_depth_args(xs, yRow1, -500, objTileButton, "Empty", 0, "1")
			break;
		case "Keep":
			if tier < 4
				instance_create_depth_args(xs, yRow1, -500, objTileButton, tile_type, tier+1, "1")
			break;
		default:
			if tier < 4
				instance_create_depth_args(xs, yRow1, -500, objTileButton, tile_type, tier+1, "1")
			instance_create_depth_args(xs, yRow2, -500, objTileButton, "Empty", 0, "6")
			break;
	}
}


function get_tooltip_effect_x(x_middle, num_effects, effect_num)
{
	switch (num_effects)
	{
		case 0: case 1:
			return x_middle
			break;
		case 2:
			if effect_num == 1
				return x_middle-50
			else
				return x_middle+50
			break;
		case 3:
			if effect_num == 1
				return x_middle-100
			else if effect_num == 2
				return x_middle
			else
				return x_middle+100
			break;
	}
}