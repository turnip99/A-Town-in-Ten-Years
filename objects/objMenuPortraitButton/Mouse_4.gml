audio_play_sound(sndButtonClick, 0, false)
instance_destroy(objMenuPortraitButton)	
global.player_portrait = sprite_index
switch (sprite_index)
{
	case sprMale1: case sprMale2:
		global.player_title = "Lord"
		break;
	case sprFemale1: case sprFemale2:
		global.player_title = "Lady"
		break;
}
instance_create_depth_args(room_width/2, 310, 0, objMenuTextBox, "Player Name")
instance_create_depth_args(room_width/2, 450, 0, objMenuTextSubmit)