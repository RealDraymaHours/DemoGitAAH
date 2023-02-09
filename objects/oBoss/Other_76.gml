if (layer_instance_get_instance(event_data[?"element_id"]) == id) 
{
   switch (event_data[?"message"]) 
	{

		case("Damage"):
			global.Health -= 0.9;
			if global.Health < 1
			{
				game_end();	
			}

		break;
		
	}
}