x1 = global.args[0]
y1 = global.args[1]
x2 = global.args[2]
y2 = global.args[3]
topic = global.args[4]
hover_steps = 0
switch (topic)
{
	case "Seasons":
		tooltip_text = "The game is divided into 10 years, each with 4 seasons - that's 40 seasons in total. At the end of each season, all of your tiles with seasonal yields will be evaluated, and your town population may change as residents arrive or depart. You may also be faced with a random encounter to resolve."
		break;
	case "End Season":
		tooltip_text = "Click this button to end a season prematurely."
		break;
	case "Prestige":
		tooltip_text = "The reputation of your town. This will determine your town's final ranking, as well as influencing its seasonal population growth."
		break;
	case "Defence":
		tooltip_text = "The sum total of your town's military strength and fortification. A higher defence score increases the chances of victory in combat encounters."
		break;
	case "Population":
		tooltip_text = "The number of residents currently living in your town, compared to its maximum capacity. Maximum population can be increased through building various residential tiles, whereas population itself changes at the end of a season.\n\nYour town also has a minimum population required to run at full capacity, and this increases as your town grows. If this requirement exceeds your town's population, the seasonal yield of your tiles will be reduced."
		break;
	case "Morale":
		tooltip_text = "The happiness and general attitude of your town's population, ranging from 20% to 200%. This will directly influence the seasonal yield of your tiles."
		break;
	case "Gold":
		tooltip_text = "Your town's wealth. This can be used to build upon and upgrade tiles, as well as pay certain courtiers."
		break;
	case "Goods":
		tooltip_text = "Your town's supply of materials and commodities. Some tiles make use of goods in order to produce their seasonal yield."
		break;
}
text_sep = 25