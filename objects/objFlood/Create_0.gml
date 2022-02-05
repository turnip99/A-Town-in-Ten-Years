global.seasons_since_positive_encounter = 0
if get_if_courtier_recruited("Envoy")
	courtier = "Envoy"
else
	courtier = "Steward"
event_inherited()