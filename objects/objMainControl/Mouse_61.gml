if global.pause
	exit;

if zoom < 1
{
	zoom+=1
	set_zoom(zoom)
}