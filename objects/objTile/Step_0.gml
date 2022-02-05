if tier == 0
	image_index = 0
else
	image_index = tier-1
	
if global.pause && alarm[0] > 0
	alarm[0]++ 
if global.pause || tile_type == "Empty" || tile_type == "Forest" || tile_type == "Rubble"
	exit
	
if position_meeting(mouse_x, mouse_y, id)
{
	if hover_steps < 7
	{
		hover_steps+=1
	}
}
else
{
	hover_steps = 0
}