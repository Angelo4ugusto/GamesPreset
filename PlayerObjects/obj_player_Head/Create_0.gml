// Feito por Angelo Augusto no Dia 11/06/26


#region PlayerStatus
//Objetos que se podem interagir com colissão
Walls = [obj_wall,obj_OutsideCastle_Door]

//Status do jogador
Status = 
{

 
 jumpPowe:-8,
 
 acc:.25,
 dcc:.2,
 
 grav:.65,
 
 Life:0,
 
 attDmg:10,
 shielDlay:0,
 Stamina:0,
 
 onGround: false,
 
 HasParry: true,
 HassDash: false,
 HasDjump: true,
 Health:20,
 
 


}
	
//ações do Player, utilizadas para animação
PlayerAction =
{
	jumping: false,
	walking: false,
	idle: false,
	attaking: false,
	Defending: false,
	parrying: false,
	falling: false
	
}
#endregion PlayerStatus


#region PlayerInstances //Criação das instancias extras


for (var i = 0; i < array_length(PlayerObjects);i ++)
{
	var _instance = PlayerObjects[i]
	if !instance_exists(_instance)
	{
		var _instace = instance_create_layer(x,y,"PlayerInstances",_instance)		
	}
	
	
}
#endregion PlayerInstances





#region Moviment
Xspd = 0
Yspd = 0
JumpTime = 0
function Moviment()
{
	Accel()
	Collision()
	
	x += Xspd
	y += Yspd
	
}


//na aceleração voce precisará do script para pegar os inputs do Player
function Accel()
{
	#region Xspd
	if global.Player_inputs._Xinput != 0
	{
		PlayerAction.walking = true
		Xspd = lerp(Xspd,Max_Xspd/2 * global.Player_inputs._Xinput,Status.acc)
	}
	else
	{
		PlayerAction.walking = false
		Xspd = lerp(Xspd,0,Status.dcc)	
	}
	
	#endregion Xspd
	#region Yspd
	Yspd += Status.grav
	if global.Player_inputs._JumpInput && JumpTime < 1
	{
		PlayerAction.jumping = true
		JumpTime += 0.15
		var Jcurve = animcurve_get_channel(acJumpPower,"Jump")
		var _jumpAcc = animcurve_channel_evaluate(Jcurve,JumpTime)
		Yspd = _jumpAcc * Status.jumpPowe 
	}
	else if !Status.onGround
	{
		JumpTime = 1
	}
	#endregion Yspd
	
}
function Collision()
{
	
	var _subPixel = Yspd * 0.1
	
	if place_meeting(x,y + Yspd,Walls)
	{
		while (!place_meeting(x,y + _subPixel,Walls))
		{
			y += _subPixel
		}
		if place_meeting(x,y + 5,Walls)
		{
			JumpTime = 0
			Status.onGround = true
		}
		Yspd = 0
		PlayerAction.falling = false
		
		
	}
	else{Status.onGround = false}
	if place_meeting(x + Xspd,y,Walls)
	{
		Xspd = 0	
	}
	
}
#endregion Moviment
#region Camera
isOncTarget = false

//esta funcão detecta se o player está em um objeto de foco de camera
function isOnCameraTarge()
{
	isOncTarget = place_meeting(x,y,obj_cameraFocus)
	return isOncTarget
	
}


#endregion Camera


/*se seu jogo nao tiver mecanica de combate,
podera deletar esta região do codigo*/

#region Attack
attackDelay = 25
canAtt = true
attTimer = 0

function Attacking()
{
	if global.Player_inputs._CombatInput && (!PlayerAction.attaking) && canAtt
	{
		PlayerAction.attaking = true
		canAtt = false
		attTimer = 0
		
	}
	
	if !canAtt && attTimer <= attackDelay
	{
		attTimer ++
	}
	else{canAtt = true canHit = true}
	
	
}


#endregion Attack