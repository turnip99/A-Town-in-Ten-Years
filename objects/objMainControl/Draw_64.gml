draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_set_font(fnUIMedium)
draw_set_colour(c_white)
if global.season <= 40
{
	draw_text(10, 20, "Year: " + string(ceil(global.season/4)))
	draw_text(76, 20, "Season: " + string(((global.season-1)%4)+1))
	draw_roundrect(10, 75, 110, 85, true)
	draw_set_colour(c_navy)
	draw_roundrect(10, 75, 110, 85, false)
	draw_set_colour(c_yellow)
	draw_set_halign(fa_center)
	draw_text(60, 58, string(global.season_buildings) + "/" + string(global.season_max_buildings))
	draw_roundrect(10, 75, 10+(global.season_buildings/global.season_max_buildings)*100, 85, false)
	draw_sprite_stretched(sprEndSeason, 0, end_season_button_x, end_season_button_y, 40, 40)
}

draw_set_colour(c_white)
draw_set_halign(fa_left)
draw_icon(stats_x1, 0, sprPrestige)
draw_text(stats_x1+55, 25, thousands_separator(get_stat("Prestige")))
draw_icon(stats_x1, 50, sprDefence)
draw_text(stats_x1+55, 75, thousands_separator(get_stat("Defence")))

draw_icon(stats_x2, 0, sprGold)
draw_text(stats_x2+55, 25, thousands_separator(get_stat("Gold")))
draw_icon(stats_x2, 50, sprGoods)
draw_text(stats_x2+55, 75, thousands_separator(get_stat("Goods")))

draw_icon(stats_x3, 0, sprPopulation)
str = thousands_separator(global.population) + "/" + thousands_separator(get_stat("Max Population"))
draw_text(stats_x3+55, 25, str)
required_population = get_required_population()
if required_population > global.population
	draw_set_colour(c_red)
else
	draw_set_colour(c_lime)
required_population_x = stats_x3+65+string_width(str)
required_population_text = "(" + thousands_separator(required_population) + " required)"
draw_text(required_population_x, 25, required_population_text)
draw_set_colour(c_white)
draw_icon(stats_x3, 50, sprMorale)
draw_text(stats_x3+55, 75, thousands_separator(get_stat("Morale")) + "%")

draw_set_colour(c_black)
draw_line(-1, 100, 1520, 100)
draw_line(1520, 100, 1520, 900)

if global.pause && global.manual_pause
{
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_font(fnPause)
	draw_text_glow_background(window_get_width()*0.5, window_get_height()*0.9, "Game Paused...", c_black)
}
