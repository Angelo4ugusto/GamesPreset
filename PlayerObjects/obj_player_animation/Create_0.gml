image_xscale = obj_player_Head.image_xscale
image_yscale = obj_player_Head.image_yscale
PlayerDir = 1
AnimTransition = false

function SpriteSide(_Rsprite,_Lsprite)
{
	switch PlayerDir
	{
		case 1:
			sprite_index = _Lsprite
		break
		case -1:
			sprite_index = _Rsprite
		break
		
	}
	
}
function AnimationTransition()
{
	if !AnimTransition
	{
		AnimTransition = true
		image_index = 0
	}
	
}