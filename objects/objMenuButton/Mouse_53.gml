if point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)
{
	audio_play_sound(sndButtonClick, 0, false)
	switch (button_text)
	{
		case "New Game":
			instance_destroy(objMenuButton)
			instance_create_depth_args(0, 260, 0, objMenuPortraitButton, sprMale1)
			instance_create_depth_args(300, 260, 0, objMenuPortraitButton, sprFemale1)
			instance_create_depth_args(600, 260, 0, objMenuPortraitButton, sprMale2)			
			instance_create_depth_args(900, 260, 0, objMenuPortraitButton, sprFemale2)
			break;
		case "Load Game":
			if file_exists("town_main_save")
			{
				game_load("town_main_save")
			}
			break;
		case "Quit Game":
			game_end()
			break;
	}
}