if place_meeting(x,y,obj_player_Head)
{
	global.enter = true
	
	
}
if global.enter
{
	var _Background = layer_background_get_id(layer_get_id("Londing"))
	
	global.Opacity = lerp(global.Opacity,1,0.2)
	layer_background_alpha(_Background,global.Opacity)
	if global.Opacity == 1{global.enter = false room_goto(Next_Room)}
	
}