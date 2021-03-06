draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_font(fnMainTitle)
draw_text_glow_background(room_width/2, 20, "Results - " + global.town_name, c_black)
draw_set_valign(fa_center)

draw_set_halign(fa_left)
draw_set_font(fnResultsLarge)
draw_set_colour(c_white)
stats_x1 = 265
stats_x2 = 635
stats_x3 = 805
draw_icon_results(stats_x1, 110, sprPrestige)
draw_text(stats_x1+155, 185, thousands_separator(global.prestige_result))
draw_set_font(fnResultsSmall)
draw_icon(stats_x2, 110, sprDefence)
draw_text(stats_x2+55, 135, thousands_separator(global.defence_result))
draw_icon(stats_x2, 160, sprPopulation)
draw_text(stats_x2+55, 185, thousands_separator(global.population_result))
draw_icon(stats_x2, 210, sprMorale)
draw_text(stats_x2+55, 235, thousands_separator(global.morale_result) + "%")
draw_icon(stats_x3, 130, sprGold)
draw_text(stats_x3+55, 155, thousands_separator(global.gold_result))
draw_icon(stats_x3, 190, sprGoods)
draw_text(stats_x3+55, 215, thousands_separator(global.goods_result))

draw_set_halign(fa_center)
draw_set_font(fnHighscoresTitle)
draw_text(room_width/2, 300, "High-scores:")
draw_set_font(fnHighscores)
draw_highscore(room_width/3, 350, room_width-room_width/3, room_height-70)