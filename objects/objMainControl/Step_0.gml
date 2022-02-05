if global.pause
	exit
global.timer+=0.02
if global.timer > 100
{
	end_season()
}