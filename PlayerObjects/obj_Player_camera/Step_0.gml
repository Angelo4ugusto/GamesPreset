var _isOnTarget = obj_player_Head.isOnCameraTarge()

if global.Player_inputs._Xinput != 0 {Direction_x = global.Player_inputs._Xinput}
if global.Player_inputs._Yinput != 0
{
	if camera_timer == CAMERA_DLAY
	{
		Direction_y = global.Player_inputs._Yinput * (-1)
		camera_paddingY = lerp(camera_paddingY,CAMERAiY_PADDING * -Direction_y,0.05)
	}
	else
	{
		camera_timer ++
	}
}
else
{
	camera_paddingY = lerp(camera_paddingY,0,0.05)
	camera_timer = 0
}

camera_paddingX = lerp(camera_paddingX,CAMERAiX_PADDING * Direction_x,0.05)

if !_isOnTarget
{
	TARGET = obj_player_Head
	if !isBackToPlayer
	{
		x = lerp(x,TARGET.x + camera_paddingX ,targetAmmount)
		y = lerp(y,TARGET.y - CAMERAY_PAD,targetAmmount)
		
		if targetAmmount != CAMERA_FOLLOW {targetAmmount += 0.01}
		else{isBackToPlayer = true}
		
	}
	else
	{
		x = lerp(x,TARGET.x + camera_paddingX,real(CAMERA_FOLLOW))
		y = lerp(y,TARGET.y + camera_paddingY - CAMERAY_PAD,real(CAMERA_FOLLOW))
	
		
	}
	
}
else
{
	targetAmmount = 0
	isBackToPlayer = false
	var _focusPoint = instance_nearest(obj_player_Head.x,obj_player_Head.y,obj_cameraFocus)
	TARGET = _focusPoint
	
	x = lerp(x,TARGET.x ,0.05)
	y = lerp(y,TARGET.y ,0.05)
	
}

