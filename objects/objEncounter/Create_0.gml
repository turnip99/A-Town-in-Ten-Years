if !global.pause
{
	global.pause = true
	global.manual_pause = false
	deselect_all_tiles()
}
x1 = 400
x2 = 1200
xMiddle = 800
xSize = 800
y1 = 200
y2 = 700
yMiddle = 450
state = "setup"
button_val = ""
portrait = ""
portrait_name = ""
portrait_colour = c_black
loading_alpha = 0

combat = false
attack = 0
win_prestige = 0
win_defence = 0
win_population = 0
win_morale = 0
win_gold = 0
win_goods = 0
lose_prestige = 0
lose_defence = 0
lose_population = 0
lose_morale = 0
lose_gold = 0
lose_goods = 0
lose_buildings = 0
building_destroy_list = ds_list_create()
building_destroy_list_names = ds_list_create()
surrender_prestige = 0
surrender_gold = 0
surrender_goods = 0
win = false

event_user(0)