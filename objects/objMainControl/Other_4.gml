randomize()
surface_resize(application_surface, 1600, 900);
instance_create_depth(500, 500, -100, objViewFollow)
global.base_prestige = 0
global.base_defence = 0
global.base_max_population = 0
global.base_morale = 100
global.base_gold = 3000
global.base_goods = 100
global.population = 30
global.season = 1
global.timer = 10
global.pause = false
global.manual_pause = false
global.ui_background_colour = make_colour_rgb(89, 71, 52)
global.encounter_background_colour = make_colour_rgb(204, 153, 0)
global.free_upgrade = false
zoom = 0

xs = 1520
ys = 99
instance_create_depth_args(xs, ys, -500, objCourtierButton, "Steward")
ys+=80
instance_create_depth_args(xs, ys, -500, objCourtierButton, "Architect")
ys+=80
instance_create_depth_args(xs, ys, -500, objCourtierButton, "Foreman")
ys+=80
instance_create_depth_args(xs, ys, -500, objCourtierButton, "Merchant")
ys+=80
instance_create_depth_args(xs, ys, -500, objCourtierButton, "Engineer")
ys+=80
instance_create_depth_args(xs, ys, -500, objCourtierButton, "Veteran")
ys+=80
instance_create_depth_args(xs, ys, -500, objCourtierButton, "Priest")
ys+=80
instance_create_depth_args(xs, ys, -500, objCourtierButton, "Swindler")
ys+=80
instance_create_depth_args(xs, ys, -500, objCourtierButton, "Envoy")
ys+=80
instance_create_depth_args(xs, ys, -500, objCourtierButton, "Assassin")
ys+=80

global.seasons_since_courtier_encounter = 0
global.seasons_since_negative_encounter = 0
global.seasons_since_positive_encounter = 0
global.seasons_since_training_encounter = 0
global.seasons_since_combat_encounter = 0

initialise_tiles()

create_tooltip(10, 10, 110, 90, "Seasons")

end_season_button_x = 120
end_season_button_y = 50
create_tooltip(end_season_button_x, end_season_button_y, end_season_button_x+40, end_season_button_y+40, "End Season")

stats_x1 = 170
create_tooltip(stats_x1, 0, 250, 50, "Prestige")
create_tooltip(stats_x1, 50, 300, 100, "Defence")
stats_x2 = 300
create_tooltip(stats_x2, 0, 450, 50, "Gold")
create_tooltip(stats_x2, 50, 450, 100, "Goods")
stats_x3 = 450
create_tooltip(stats_x3, 0, 700, 50, "Population")
create_tooltip(stats_x3, 50, 550, 100, "Morale")

instance_create_depth(0, 0, -1000, objIntroduction)



