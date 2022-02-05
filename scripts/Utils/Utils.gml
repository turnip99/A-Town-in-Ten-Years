function array()
{
	var arr;
	for (var i=0;i<argument_count;i+=1)
	{
	    arr[i] = argument[i];
	}
	return arr;
}


function get_if_in_array(val, arr)
{
	for (j=0; j<array_length_1d(arr); j++)
	{
		if arr[j] == val
			return true
	}
	return false
}


function draw_rectangle_border()
{
	xx1 = argument[0]
	yy1 = argument[1]
	xx2 = argument[2]
	yy2 = argument[3]
	w = argument[4]
	draw_line_width(xx1 - w/2, yy1, xx2 + w/2, yy1, w);
	draw_line_width(xx2, yy1 + w/2, xx2, yy2 - w/2, w);
	draw_line_width(xx1 - w/2, yy2, xx2 + w/2, yy2, w);
	draw_line_width(xx1, yy1 + w/2, xx1, yy2 - w/2, w);
}


function instance_create_depth_args()
{
	for (i = 0; i < argument_count-4; i++)
	{
		global.args[i] = argument[i+4];
	}
	instance_create_depth(argument[0], argument[1], argument[2], argument[3])
}


/*
function print()
{
	window_set_fullscreen(false);
	show_message(argument[0]);
	window_set_fullscreen(true);
}
*/


function plus_sign_num(val)
{
	if val >= 0
		return "+" + string(val)
	else
		return string(val)
}


function draw_text_glow_background()
{
	xMiddle = argument[0]
	yMiddle = argument[1]
	str = argument[2]
	draw_set_color(c_white)
	draw_text(xMiddle+1, yMiddle+1, str);  
	draw_text(xMiddle-1, yMiddle-1, str);  
	draw_text(xMiddle, yMiddle+1, str);  
	draw_text(xMiddle+1, yMiddle, str);  
	draw_text(xMiddle, yMiddle-1, str);  
	draw_text(xMiddle-1, yMiddle, str);  
	draw_text(xMiddle-1, yMiddle+1, str);  
	draw_text(xMiddle+1, yMiddle-1, str);
	draw_set_color(argument[3])
	draw_text(xMiddle, yMiddle, str)
}


function mouse_x_gui()
{
	window_x = window_mouse_get_x()
	window_size_proportion = 1600/window_get_width()
	return window_x*window_size_proportion
}


function mouse_y_gui()
{
	window_y = window_mouse_get_y()
	window_size_proportion = 900/window_get_height()
	return window_y*window_size_proportion
}


function round_min_1(val)
{
	if val > 0
		return max(round(val), 1)	
	else if val < 0
		return min(round(val), -1)
	else
		return 0
}


function thousands_separator(r)
{
	r = string(r)
	var s = ""
	if string_char_at(r, 0) == "+" || string_char_at(r, 0) == "-" 
	{
		s = string_char_at(r, 0)
		r = string_replace(r, s, "")
	}
	for (var i = string_length(r) - 2; i > 1; i -= 3)
	{
		r = string_insert(",", r, i)
	}
	if s != ""
	{
		r = s + r
	}
	return r
}