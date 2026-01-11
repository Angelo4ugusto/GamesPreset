x = obj_player_Head.x
y = obj_player_Head.y


//configure as animações nas Funcões SpriteSides(Esquerda,Direita)

var _PlayerActions = obj_player_Head.PlayerAction
var _PlayerStatus = obj_player_Head.Status


if global.Player_inputs._Xinput != 0{PlayerDir = (global.Player_inputs._Xinput)}

if AnimTransition{return}


if _PlayerActions.jumping
{
	AnimationTransition()
	SpriteSide(spr_player_Junping_L,spr_player_Junping_R)
}
else if _PlayerActions.walking && obj_player_Head.Status.onGround
{
	SpriteSide(spr_player_WalkingL,spr_player_WalkingR)
}
else if _PlayerActions.falling || (!_PlayerStatus.onGround)
{
	if image_index < 3
	{
		image_index += 0.1
	}
	
	SpriteSide(spr_player_Falling_L,spr_player_Falling_R)
}
else 
{
	SpriteSide(spr_player_idleL,spr_player_idleR)
}

if _PlayerActions.attaking
{
	AnimationTransition()
	SpriteSide(spr_player_attak_L,spr_player_attak_R)
	
}