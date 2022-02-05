if disabled
	draw_set_alpha(min(objEncounter.loading_alpha, 0.35))
else
	draw_set_alpha(objEncounter.loading_alpha)
draw_set_colour(global.ui_background_colour)
draw_rectangle(x1, y1, x2, y2, false)
draw_set_colour(c_black)
draw_rectangle_border(x1, y1, x2, y2, 2)
draw_set_font(fnEncounterButton)
draw_set_colour(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(x, y, val)

var ys = stat_yield_draw_y
if prestige != 0
{
	draw_encounter_button_yield(x, ys, "Prestige", prestige)
	ys+=stat_yield_draw_height
}
if defence != 0
{
	draw_encounter_button_yield(x, ys, "Defence", defence)
	ys+=stat_yield_draw_height
}
if population != 0
{
	draw_encounter_button_yield(x, ys, "Population", population)
	ys+=stat_yield_draw_height
}
if morale != 0
{
	draw_encounter_button_yield(x, ys, "Morale", morale)
	ys+=stat_yield_draw_height
}
if gold != 0
{
	draw_encounter_button_yield(x, ys, "Gold", gold)
	ys+=stat_yield_draw_height
}
if goods != 0
{
	draw_encounter_button_yield(x, ys, "Goods", goods)
	ys+=stat_yield_draw_height
}
draw_set_alpha(1)