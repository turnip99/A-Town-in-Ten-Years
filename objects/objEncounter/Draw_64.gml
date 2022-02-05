draw_set_colour(global.encounter_background_colour)
draw_rectangle(x1, y1, x2, y2, false)
draw_set_colour(c_black)
draw_rectangle_border(x1, y1, x2, y2, 4)

draw_set_alpha(loading_alpha)
draw_sprite_stretched(global.player_portrait, 0, x1+3, y1+3, 100, 100)
draw_rectangle(x1+4, y1+4, x1+102, y1+102, true)
draw_set_font(fnEncounterText)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_colour(c_dkgray)
draw_text(x1+112, y1+5, global.player_title_name)
if portrait != ""
{
	draw_sprite_ext(portrait, 0, x2-1, y1+3, -1/3, 1/3, 0, c_white, 1)
	draw_set_colour(portrait_colour)
	draw_rectangle(x2-101, y1+4, x2-3, y1+102, true)
	draw_set_halign(fa_right)
	draw_set_valign(fa_bottom)
	draw_set_colour(c_dkgray)
	draw_text(x2-95-string_length(portrait_name), y1+102, portrait_name)
}
if combat && state == "combat_begin"
{
	draw_set_font(fnEncounterDefenceAttack)
	draw_set_valign(fa_center)
	draw_sprite_stretched(sprDefence, 0, x1+40, y1+140, 60, 60)
	draw_set_halign(fa_left)
	draw_text(x1+110, y1+170, thousands_separator(get_stat("Defence")))
	draw_sprite_stretched(sprAttack, 0, x2-100, y1+140, 60, 60)
	draw_set_halign(fa_right)
	draw_text(x2-110, y1+170, thousands_separator(attack))
	yText = y1+220
}
else
{
	yText = y1+140
}