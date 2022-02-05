w = 80
h = 80
x1 = x
y1 = y
x2 = x+w
y2 = y+h
courtier = global.args[0]
toggled = false
if courtier == "Steward"
{
	rank = 1
	season_recruited = 1
}
else
{
	rank = 0
	season_recruited = -1
}
name = get_courtier_name(courtier)
short_name = get_courtier_short_name(courtier)
sprite = get_courtier_sprite(courtier)
personality = get_courtier_personality(courtier)
training_attempted = false