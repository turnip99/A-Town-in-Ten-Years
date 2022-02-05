event_inherited();

switch (state)
{
	case "text_1":
		text = "Good day " + global.player_title_name + ". My troupe are aspiring performers that would love the honour of serving for a time at " + global.town_name + "."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Would you allow us to perform in the markerts of " + global.town_name + " during this upcoming season?"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "accept":
		text = "Excellent! We shall put on a show that will draw in crowds from far and wide, I am sure of it!"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "merchant_comment":
		text = "Wait a moment, does this mean that I'm no longer going to be the funniest individual in " + global.town_name + "? I do hope that this troupe aren't to stay too long, my "  + global.player_title + "!"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "decline":
		text = "Very well, " + global.player_title + ". We shall continue our journey north in our bid for greatness."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}