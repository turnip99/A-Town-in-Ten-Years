global.seasons_since_negative_encounter = 0
if get_if_courtier_recruited("Architect")
	courtier = "Architect"
else
	courtier = "Steward"
event_inherited()
lose_buildings = min(1, num_combat_destroyable_tiles())
get_building_destroy_list(lose_buildings)