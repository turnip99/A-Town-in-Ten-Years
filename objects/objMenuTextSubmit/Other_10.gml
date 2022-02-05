// Text box submission, either on button click or enter.

if string_length(keyboard_string) > 0
{	
	audio_play_sound(sndButtonClick, 0, false)
	switch (objMenuTextBox.input_field)
	{
		case "Player Name":
			global.player_name = keyboard_string
			global.player_title_name = global.player_title + " " + global.player_name
			objMenuTextBox.text = ""
			objMenuTextBox.input_field = "Town Name"
			break;
		case "Town Name":
			global.town_name = keyboard_string
			room_goto(rmMain)
			break;
	}
	keyboard_string = ""
}