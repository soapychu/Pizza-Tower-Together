function scr_collectspr(obj = object_index, player = obj_player1, set = true)
{
	var char = player.character;
	if char == "P" && !player.ispeppino
		char = "N";
	
	var spr = spr_shroomcollect;
	switch obj
	{
		default:
			switch char
			{
				default:
					spr = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect);
					break;
				
				case "N":
					spr = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5);
					break;
				
				case "SP":
					spr = choose(spr_collect1SP, spr_collect2SP, spr_collect3SP, spr_collect4SP, spr_collect5SP);
					
					spr_palette = spr_collectSP_palette;
					paletteselect = choose(1, 2, 3, 4, 5);
					break;
				case "G":
					if (global.pizzellesugaryoverride && obj_player1.character == "G")
					{
						spr = choose(spr_collect1SP, spr_collect2SP, spr_collect3SP, spr_collect4SP, spr_collect5SP);	
						spr_palette = spr_collectSP_palette;
						paletteselect = choose(1, 2, 3, 4, 5);
					}
					else
						spr = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect);
				break;
			}
			break;
		
		case obj_bigcollect:
			switch char
			{
				default:
					spr = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5);
					break;
				
				case "N":
					spr = choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween);
					break;
				
				case "SP":
					spr = choose(spr_bigcollect1SP, spr_bigcollect2SP, spr_bigcollect3SP, spr_bigcollect4SP, spr_bigcollect5SP, spr_bigcollect6SP);
					break;
				case "G":
					if (global.pizzellesugaryoverride && obj_player1.character == "G")
						spr = choose(spr_bigcollect1SP, spr_bigcollect2SP, spr_bigcollect3SP, spr_bigcollect4SP, spr_bigcollect5SP, spr_bigcollect6SP);
					else
						spr = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5);
				break;
			}
			break;
		
		case obj_giantcollect:
			switch char
			{
				default:
					spr = spr_giantpizza;
					break;
				
				case "N":
					spr = spr_giantpizzahalloween;
					break;
				
				case "SP":
					spr = choose(spr_giantcollect1SP, spr_giantcollect2SP, spr_giantcollect3SP, spr_giantcollect4SP);
					break;
				case "G":
					if (global.pizzellesugaryoverride && obj_player1.character == "G")
						spr = choose(spr_giantcollect1SP, spr_giantcollect2SP, spr_giantcollect3SP, spr_giantcollect4SP);
					else
						spr = spr_giantpizza
				break;
			}
			break;
	}
	
	if set
		sprite_index = spr;
	return spr;
}
