global.seasons_since_negative_encounter = 0
if get_if_courtier_recruited("Swindler")
	courtier = "Swindler"
else
	courtier = "Steward"
event_inherited()