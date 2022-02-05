event_inherited();

switch (state)
{
	case "text_1":
		text = global.player_title_name + ", a vistor is here to see you."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "text_2":
		if courtier == "Architect"
		{
			text = "Greetings, " + global.player_title_name + ". I am Jocelyn, architect of no small repute. A pleasure to make your acquaintance."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "I have come to " + global.town_name + " seeking work. While I've certainly seen towns in worse condition, your population could thrive with the aid of my skill and experience."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "Would you be so kind as to grant me residence in " + global.town_name + "?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Foreman"
		{
			text = "So this is " + global.town_name + ", huh? It's fine enough, I suppose, but on the way in, I spotted a number of your workers shirking their duties. That really isn't a good look, you know."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "I happen to have a certain way of getting those fools moving, as it were. If you would accept me into your court, I would effectuate a level of productivity so great that it'll rival even the high king's city itself. How about it?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Merchant"
		{
			text = "Good day, " + global.player_title_name + "! My name is Haiko, and I follow the beckoning of the ever-distant horizon! " + global.town_name + " called out to me, so here I am!"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "I happen to be merchant by trade, and in unique and extravagant marvels, no less! During my travels, I have discovered many curiosities, and now I feel called to share some of these with " + global.town_name + ". You let me in, and I'll make it my mission to make every market in this fabulous town just that little bit more exciting! How does that sound?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Engineer"
		{
			text = "Well... well met, " + global.player_title_name + ". I am... my name is Ina, and... well, as I was visiting your, um, lovely town, I couldn't help but notice some structural flaws in some of you- wait! I mean, what you've got here is fantastic, and I, uhh, don't want to intrude... but... umm..."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "If you'd have me, I'd like... I'd love to help out here. I have a small amount of skill with stone and metal which I'd be more than happy to- uh, if you'd have me, of course! I don't mean to, uh, intrude, you see... just let me know either way?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Veteran"
		{
			text = "So this is the emergent " + global.player_title + ", hm? Silas, at your service, veteran of the Seven Stone War."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "I couldn't help but notice that some of your soldiers are looking, rather green, as it were. They need more discipline - unless you want them to meet an early grave at the hands of that fiend, Belirvac, of course."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "That villain has gained more enemies than just you in his years on this green earth. Would you grant an old elf a shot at retribution?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Priest"
		{
			text = "Blessing me upon you, " + global.player_title_name + ". I come on behalf of the Council of the Six Suns, to offer my aid to " + global.town_name + " and see to the upkeep of its chapels." 
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "With the threat of Belirvac looming over this valley, the people here need the guidance of the Six Suns. Would you permit me to perform my sacred duty?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Swindler"
		{
			text = "'Ello 'ello 'ello. What have we here? Another petty " + global.player_title + " with a town full of missed potential, perhaps?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "You know what you need to sort that problem out, eh? Gold. Lots of beautiful, magnificent, heavenly gold. What I'm trying to say is that I can make you stinking rich."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "That got your attention, huh? Let's just say I that I have a way of persuading our good friends at your arenas to part with their nice shiny coins. What d'ya say?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Envoy"
		{
			text = "Salutation, " + global.player_title_name + ". I am Bertha, though many call me 'Silver-tongue'. I come today to bring you a proposition that I am confident will be to our mutual benefit."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "I happen to be in the business of persuasion, and " + global.town_name + " looks like it could use a growth in its population. I propose a formal arrangement in which I ensure the expansion of your town in return for a moderate wage in gold. I do hope that you will welcome my proposal?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		else if courtier == "Assassin"
		{
			text = "..."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "..."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "..."
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
			text = "Terrible accidents will befall your enemies. My purse will grow heavier. Will this be the truth?"
			yText=draw_encounter_text(text, fnEncounterItalics, yText)
		}
		break;
	case "accept":
		text = courtier_name + " has joined your court!"
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
	case "reject":
		text = courtier_name + " departs swiftly from " + global.town_name + "."
		yText=draw_encounter_text(text, fnEncounterText, yText)
		break;
}