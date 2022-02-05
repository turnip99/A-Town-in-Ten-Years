if building
{
	var alpha = alarm[0]/total_build_steps
	if selected
		alpha*=0.6
	draw_set_alpha(alpha)
	draw_sprite(sprite_index, image_index, x, y)
	var alpha = (1-alarm[0]/total_build_steps)*0.7
	if selected
		alpha*=0.6
	draw_set_alpha(alpha)
	draw_sprite(get_tile_sprite(building_tile_type), building_tier-1, x, y)
	draw_set_alpha(1)
}
else if selected
{
	draw_set_alpha(0.6)
	draw_sprite(sprite_index, image_index, x, y)
	draw_set_alpha(1)
}
else
{
	draw_self()
}