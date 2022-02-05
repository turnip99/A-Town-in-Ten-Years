if global.pause || tile_type == "Empty" || tile_type == "Forest" || tile_type == "Rubble"
	exit
if hover_steps >= 7
{
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	draw_set_font(fnUISmall)
	if mouse_x_gui() < window_get_width()/2
	{
		tooltip_x1 = mouse_x_gui()
		tooltip_x2 = mouse_x_gui()+300
	}
	else
	{
		tooltip_x1 = mouse_x_gui()-300
		tooltip_x2 = mouse_x_gui()
	}
	if mouse_y_gui() < window_get_height()/2
	{
		tooltip_y1 = mouse_y_gui()
		tooltip_y2 = mouse_y_gui()+335
	}
	else
	{
		tooltip_y1 = mouse_y_gui()-335
		tooltip_y2 = mouse_y_gui()
	}
	draw_set_colour(c_black)
	draw_rectangle(tooltip_x1-5, tooltip_y1, tooltip_x2+5, tooltip_y2, false)
	draw_set_colour(c_ltgray)
	draw_rectangle(tooltip_x1-5, tooltip_y1, tooltip_x2+5, tooltip_y2, true)
	draw_set_colour(c_white)
	draw_set_font(fnUIMedium)
	x_middle = tooltip_x1+((tooltip_x2-tooltip_x1)/2)
	draw_text(x_middle, tooltip_y1+5, tile_name)
	draw_line(tooltip_x1+10, tooltip_y1+35, tooltip_x2-10, tooltip_y1+35)
	draw_set_font(fnUISmall)
	draw_set_halign(fa_center)
	draw_text(x_middle, tooltip_y1+40, "Passive Effect")
	var num_effects = get_num_passive_effects()
	var effect_num = 0
	if passive_prestige != 0
	{
		effect_num+=1
		xs = get_tooltip_effect_x(x_middle, num_effects, effect_num)
		draw_sprite_stretched(sprPrestige, 0, xs-40, tooltip_y1+65, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xs+5, tooltip_y1+75, thousands_separator(plus_sign_num(passive_prestige)))
	}	
	if passive_defence != 0
	{
		effect_num+=1
		xs = get_tooltip_effect_x(x_middle, num_effects, effect_num)
		draw_sprite_stretched(sprDefence, 0, xs-40, tooltip_y1+65, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xs+5, tooltip_y1+75,  thousands_separator(plus_sign_num(passive_defence)))
	}
	if passive_max_population != 0
	{
		effect_num+=1
		xs = get_tooltip_effect_x(x_middle, num_effects, effect_num)
		draw_sprite_stretched(sprPopulation, 0, xs-40, tooltip_y1+65, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xs+5, tooltip_y1+75,  thousands_separator(plus_sign_num(passive_max_population)))
	}
			
		
	draw_line(tooltip_x1+10, tooltip_y1+110, tooltip_x2-10, tooltip_y1+110)
	draw_set_halign(fa_center)
	draw_text(x_middle, tooltip_y1+115, "Seasonal Yield")
	num_effects = get_num_seasonal_yields()
	effect_num = 0
	if seasonal_prestige != 0
	{
		effect_num+=1
		xs = get_tooltip_effect_x(x_middle, num_effects, effect_num)
		draw_sprite_stretched(sprPrestige, 0, xs-40, tooltip_y1+140, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xs+5, tooltip_y1+150, thousands_separator(plus_sign_num(seasonal_prestige)))
	}	
	if seasonal_defence != 0
	{
		effect_num+=1
		xs = get_tooltip_effect_x(x_middle, num_effects, effect_num)
		draw_sprite_stretched(sprDefence, 0, xs-40, tooltip_y1+140, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xs+5, tooltip_y1+150, thousands_separator(plus_sign_num(seasonal_defence)))
	}
	if seasonal_morale != 0
	{
		effect_num+=1
		xs = get_tooltip_effect_x(x_middle, num_effects, effect_num)
		draw_sprite_stretched(sprMorale, 0, xs-40, tooltip_y1+140, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xs+5, tooltip_y1+150, thousands_separator(plus_sign_num(seasonal_morale)))
	}
	if seasonal_gold != 0
	{
		effect_num+=1
		xs = get_tooltip_effect_x(x_middle, num_effects, effect_num)
		draw_sprite_stretched(sprGold, 0, xs-40, tooltip_y1+140, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xs+5, tooltip_y1+150, thousands_separator(plus_sign_num(seasonal_gold)))
	}
	if seasonal_goods != 0
	{
		effect_num+=1
		xs = get_tooltip_effect_x(x_middle, num_effects, effect_num)
		draw_sprite_stretched(sprGoods, 0, xs-40, tooltip_y1+140, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xs+5, tooltip_y1+150, thousands_separator(plus_sign_num(seasonal_goods)))
	}
		
	draw_line(tooltip_x1+10, tooltip_y1+185, tooltip_x2-10, tooltip_y1+185)
	draw_set_halign(fa_center)
	draw_text(x_middle, tooltip_y1+190, "Required Population")
	draw_sprite_stretched(sprPopulation, 0, x_middle-40, tooltip_y1+215, 40, 40)
	if get_required_population() <= get_stat("Population")
		draw_set_colour(c_white)
	else
		draw_set_colour(c_red)
	draw_set_halign(fa_left)
	draw_text(x_middle+5, tooltip_y1+225, required_population)
	draw_set_colour(c_white)
		
	draw_line(tooltip_x1+10, tooltip_y1+260, tooltip_x2-10, tooltip_y1+260)
	draw_set_halign(fa_center)
	if beneficial_neighbours != ""
	{
		draw_text(x_middle, tooltip_y1+265, "Beneficial Neighbours (" + string(num_beneficial_neighbours) + "/4)")
		draw_set_colour(c_silver)
		draw_text(x_middle+5, tooltip_y1+288, beneficial_neighbours[0])
		draw_text(x_middle+5, tooltip_y1+308, beneficial_neighbours[1])
	}
	else
	{
		draw_text(x_middle, tooltip_y1+265, "Beneficial Neighbours")
	}
}