surface_resize(application_surface, room_width, room_height);
instance_create_depth_args(room_width*0.25, room_height-40, 0, objResultsButton, "Replay Game")
instance_create_depth_args(room_width*0.75, room_height-40, 0, objResultsButton, "Quit Game")
audio_play_sound(sndResults, 0, false)
str = global.player_name + "/" + global.town_name
highscore_add(str, global.prestige_result);