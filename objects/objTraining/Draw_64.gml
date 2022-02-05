event_inherited();

switch (state)
{
	case "text_1":
		if courtier == "Steward"
		{
			text = "My " + global.player_title + ", I have a request, if you would hear it?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "You see, a some old colleagues from my time workng at the Royal Library have expressed an interest in joining me in " + global.town_name + ". They are diligent workers and would be a boon to me in my work."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "It is a long journey from the Royal City, though, and I was wondering if you'd be willing to part with some of our treasury's gold to grant them passage?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Architect"
		{
			text = global.player_title_name + ", I wish to ask you for a boon. I am confident that my work in " + global.town_name + " has done much good, and yet I am keenly aware that my craft is not yet perfected."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "I would ask you to consider investing in my further training at the Western Architecture Academy, if that seems good to you?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Foreman"
		{
			text = global.player_title_name + ", while I'm sure that you've recognised that my efforts to instill discipline into your workforce has not been without success, the one major barrier has prevented those sluggards from reaching the grand heights of efficiency that I know they are capable have."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "Food. The fools keep running back to their neighbourhoods for lunch, and they're ALWAYS late! I propse that we invest in fully-equipped kitchens at both our mining sites and our farms. That'd mark the end of their excuses, that's for sure. Are we on the same page?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Merchant"
		{
			text = global.player_name + ", my good friend! If you have a moment, I have a fantastic idea! You see, over the last few seasons, I have been able to build a chain of successful Haiko stalls within the markets of " + global.town_name + ". However, what I really need are some proper stone roofs and walls to really spring the life and soul of your market to the next level!"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "Would you be willing to help poor Haiko out here?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Engineer"
		{
			text = "My " + global.player_title_name + ", I... I hate to intrude, but I was hoping for a moment of you're time- if you're not too busy, of course, uh, I can wait!"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "Um, you see, my work towards improving the defensibility of " + global.town_name + " is going well, but I... I am finding myself... possibly, just, um, very slightly restricted by the equipment at my disposal. I was perhaps hoping that you would be willing to invest in some, um, new engineering tools... maybe?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Veteran"
		{
			text = "My " + global.player_title_name + ". I wish to report to petition to you for new weapons for my men in the barracks. What swords and axes we had have gradually become bent or battered, due in no small part to my rigorous training regime, I will admit."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "I would request new iron-forged weapons if we are to stand any chance against Belirvac's hoard. Would you grant this?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Priest"
		{
			text = global.player_title_name + ", it is custom at this time for myself and my brethren to embark on a pilgramage to the holy sites of the Six Suns."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "Would you be willing to aid me in my preparation for this pilgrimage? If you require an incentive, I am confident that I will return with greater faith and wisdom to counsel the people of " + global.town_name + "."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Swindler"
		{
			text = "Hey, hey, " + global.player_name + "! This whole making you filthy rich thing is going pretty well I'd say, but you know what persuades the populace to relinquish their gold even faster? Ale, and lots of it."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "Tell you what, how about we install some taps at our arena, employ a few barmen, then wah-la! Your treasury will be about as full as their liver! Sounds pretty tasty, doesn't it?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Envoy"
		{
			text = "My " + global.player_title + ", I would entreat you to aid me in a matter of import. My steed has grown old and feeble, and with it my journeys in the name of " + global.town_name + " have been lengthened."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "I would ask you to provide me with a fresh, young stallion to aid me in my work, if should this please you?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Assassin"
		{
			text = "..."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "Poison?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		break;
	case "accept":
		if courtier == "Steward"
		{
			text = "Thank you, " + global.player_name + ". I will see to their passage right away."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Architect"
		{
			text = "My thanks, " + global.player_title_name + ". I will return soon with the skills necessary to see " + global.town_name + " really flourish."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Foreman"
		{
			text = "Excellent. I shall launch the construction project right away."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Merchant"
		{
			text = "Fantatic! I will see it done! You won't regret this, " + global.player_name + "!"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Engineer"
		{
			text = "You are most kind, " + global.player_name + ". I will not... I won't forget this."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Veteran"
		{
			text = "Very good " + global.player_title  + ". I will begin sourcing these at once."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Priest"
		{
			text = "Blessing upon you, " + global.player_title_name + ". I will soon return with a renewed faith and the vigour of my youth!"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Swindler"
		{
			text = "A good choice, I must say. Soon, you'll be making the high king look like a street urchin!"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Envoy"
		{
			text = "You have my thanks. I will begin searching for a suitable steed to serve as my new companion."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Assassin"
		{
			text = "..."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		text = courtier_name + "'s efficiency has increased!"
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
	case "reject":
		text = courtier_name_short + " leaves your presence rather disappointed."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
}