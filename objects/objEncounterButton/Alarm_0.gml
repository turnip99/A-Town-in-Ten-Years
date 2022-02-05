if prestige != 0
	stat_yield_draw_y-=stat_yield_draw_height
if defence != 0
	stat_yield_draw_y-=stat_yield_draw_height
if population != 0
	stat_yield_draw_y-=stat_yield_draw_height
if morale != 0
	stat_yield_draw_y-=stat_yield_draw_height
if gold != 0
	stat_yield_draw_y-=stat_yield_draw_height
if goods != 0
	stat_yield_draw_y-=stat_yield_draw_height

if get_stat("Population") + population < 0 || get_stat("Gold") + gold < 0 || get_stat("Goods") + goods < 0
	disabled = true