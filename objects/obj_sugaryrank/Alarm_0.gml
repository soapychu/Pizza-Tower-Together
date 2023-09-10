/// @description Check Toppins
event = event + 1
shake1 = false
shake2 = false
shake3 = false
shake4 = false
shake5 = false

switch (event)
{
	case 1:
		if (global.toppinshroom == true)
			mallowspr = mallowspr
		else
			mallowspr = mallowmissspr
		drawmallow = true
		alarm[0] = 15
		break;
	
	case 2:
		if (global.toppincheese == true)
			chocospr = chocospr
		else
			chocospr = chocomissspr
		drawchoco = true
		alarm[0] = 15
		break;
		
	case 3:
		if (global.toppintomato == true)
			crackspr = crackspr
		else
			crackspr = crackmissspr
		drawcrack = true
		alarm[0] = 15
		alarm[0] = 15
		break;
	
		case 4:
		if (global.toppinsausage == true)
			wormspr = wormspr
		else
			wormspr = wormmissspr
		drawworm = true
		alarm[0] = 15
		break;
	
	case 5:
		if (global.toppinpineapple == true)
			candyspr = candyspr
		else
			candyspr = candymissspr
		drawcandy = true
		alarm[0] = 15
		break;
		
	default:
		alarm[1] = 50
}
