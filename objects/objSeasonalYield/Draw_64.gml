event_inherited();

switch (state)
{
	case "text_1":
		text = "Season End (" + string(global.season-1) + "/40)"
		yText=draw_encounter_text(text, fnEncounterText, yText)
		draw_sprite_stretched(sprPrestige, 0, xMiddle-50, yText-5, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xMiddle, yText, thousands_separator(get_stat("Prestige")) + " (" + thousands_separator(plus_sign_num(prestige_mod)) + ")")
		yText+=45
		draw_sprite_stretched(sprDefence, 0, xMiddle-170, yText-5, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xMiddle-120, yText, thousands_separator(get_stat("Defence")) + " (" + thousands_separator(plus_sign_num(defence_mod)) + ")")
		draw_sprite_stretched(sprGold, 0, xMiddle+70, yText-5, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xMiddle+120, yText, thousands_separator(get_stat("Gold")) + " (" + thousands_separator(plus_sign_num(gold_mod)) + ")")
		yText+=45
		draw_sprite_stretched(sprMorale, 0, xMiddle-170, yText-5, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xMiddle-120, yText, thousands_separator(get_stat("Morale")) + "% (" + thousands_separator(plus_sign_num(morale_mod)) + ")")
		draw_sprite_stretched(sprGoods, 0, xMiddle+70, yText-5, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xMiddle+120, yText, thousands_separator(get_stat("Goods")) + " (" + thousands_separator(plus_sign_num(goods_mod)) + ")")
		yText+=70
		text = thousands_separator(population_mod) + " new residents have moved into " + global.town_name + "."
		var len = string_width(text)
		draw_sprite_stretched(sprPopulation, 0, xMiddle-len/2-30, yText-5, 40, 40)
		draw_set_halign(fa_left)
		draw_text(xMiddle-len/2+20, yText, text)
		break;
}