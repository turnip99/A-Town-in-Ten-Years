event_inherited();

switch (state)
{
	case "text_1":
		text = "Greetings, " + global.player_title_name + ". Welcome to " + global.town_name + ". I'm your steward, Estella, and I'm here to help with the day-to-day running of " + global.town_name + ". Within the next decade, your aim is to make this town the envy of the nation, both in culture, riches and commerce!"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Would you like me to walk you through the basics?"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "text_2":
		text = "Very well. Where to begin? Ah, yes, prestige. At the end of ten years, " + global.town_name + " will be evaluated for its renown across the land - this is measured in the form of prestige. " + global.town_name + "'s prestige will increase over time as we build and grow."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Other important measures to keep track of are the town's defence, population and maximum population, morale and supply of gold and goods."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Your town's core attributes can be viewed on the dashboard above, along with the current year and season."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
	case "text_3":
		text = "For a cost of gold, you will be able to order the construction of homes, farms, markets, chapels and various other facilities. Most of these places will provide both a passive increase or decrease to our town's health, but also produce a seasonal yield. For example, a farm increases our maximum population slightly, and will produce goods on a seasonal basis."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "text_4":
		text = "The locations in which you choose to build will be critical, as well, as each type of construction will be more fruitful when near to other specific facilities."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "You can begin to build your town by clicking on an empty tile and selecting an option from the dashboard above. High morale and under-population affect a tile's seasonal yield, whereas a tile receives a 10% increase to both passive and seasonal yield for each adjacent 'beneficial neighbour'."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
	case "text_5":
		text = "Everything that you build will be ranked for quality, starting at 'Basic' up to 'Excellent', 'Superb' and finally 'Magnificent'. Upgrades tend to be somewhat pricey, but they sharply increase the yield of the building or facility at a very small increase to the number of workers needed to maintain it - a worthy investment, if you ask me."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "You can upgrade a built-upon tile by selecting the upgrade from the dashboard above or by right-clicking on the tile."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
	case "text_6":
		text = "At the end of each season, in addition to harvesting the bounty of the town, we may also find ourselves facing various encounters, certainly not the least of which being hostile advancements from our enemies - the number and strength of whom can only grow as " + global.town_name + " gains reputation. With a strong military presence and good fortifications, however, I am confident that you will be able handle these threats."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "text_7":
		text = "Finally, as a courtier of your keep, you may call upon my abilities to aid you in your endeavours. While it may not aid much in our bid for fame, I do have great experience in the area of administration that I would be happy to put to use to review our finances and hopefully improve our keep's gold yield."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "I am confident that, as " + global.town_name + " grows in renown, many other courtiers will join your hall."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "As the game progresses, various courtiers will join your keep, each with their own unique skills. These courtiers can each be toggled on and off, providing both positive and negative effects on the town."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
	case "text_8":
		text = "I wish you well on your great venture, my " + global.player_title + ". I believe it is perhaps time to begin?"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}