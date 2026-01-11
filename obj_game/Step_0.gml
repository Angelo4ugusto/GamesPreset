global.Player_inputs = scr_get_PlayerInputs()


/* 
Esta parte do codigo é para fazer transições entre salas, se você
ja tem uma transição esta parte do codigo poderá ser apagada
*/
if !global.enter
{
	var _Background = layer_background_get_id(layer_get_id("Londing"))
	global.Opacity = lerp(global.Opacity,0,.2)
	layer_background_alpha(_Background,global.Opacity)

}
show_debug_message(global.Opacity)