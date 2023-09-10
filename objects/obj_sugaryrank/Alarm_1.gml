/// @description Secret Cards
sevent = sevent + 1
cshake1 = false
cshake2 = false
cshake3 = false
switch (sevent) 
{
	case 1:
		if global.secretfound > 0
		{
			card1 = 1
			carddex1 = 0
		}
		else
			cshake1 = true
		alarm[1] = 25
		break;
	
	case 2:
		if global.secretfound > 1
		{
			card2 = 1
			carddex2 = 0
		}
		else
			cshake2 = true
		alarm[1] = 25
		break;
	
	case 3:
		if global.secretfound > 2
		{
			card3 = 1
			carddex3 = 0
		}
		else
			cshake3 = true
		alarm[1] = 25
		break;
	
	default:
		alarm[2] = 35
		counting = true
		break;
}
