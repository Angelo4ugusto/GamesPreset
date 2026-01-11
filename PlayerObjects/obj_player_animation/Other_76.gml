if event_data[? "event_type"] == "sprite event"
{
    switch (event_data[? "message"])
    {
		//configure os evento de Broadcast Massafe aqui:
        case "StopTransition":
            AnimTransition = false
			obj_player_Head.PlayerAction.falling = true
			obj_player_Head.PlayerAction.jumping = false
        break;
		
		case "EndAttack":
			
			AnimTransition = false
			obj_player_Head.PlayerAction.attaking = false
		break
		
		case "DemageEnd":
			
		break
    }
}