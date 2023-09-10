///@description sprite init

switch (obj_player1.character)
{
	case "SP":
	case "SN":
		rankclipboard = spr_rankclipboardSS;
		rankletter = spr_rankletter;
		card1spr = spr_rankcardSS;
		card2spr = spr_rankcardSS;
		card3spr = spr_rankcardSS;
		cardflipping = spr_rankcardflippingSS;
		cardflipped = spr_rankcardflippedSS;
		mallowspr = spr_confecti1rank
		chocospr = spr_confecti2rank
		crackspr = spr_confecti3rank
		wormspr = spr_confecti4rank
		candyspr = spr_confecti5rank
		mallowmissspr = spr_confecti1rankm
		chocomissspr = spr_confecti2rankm
		crackmissspr = spr_confecti3rankm
		wormmissspr = spr_confecti4rankm
		candymissspr = spr_confecti5rankm
		break;
		
	case "PN":
		break;
		
	case "BN":
		break;
		
	default:
		rankclipboard = spr_rankclipboard;
		rankletter = spr_rankletterPLACEHOLDER;
		card1spr = spr_rankcard;
		card2spr = spr_rankcard;
		card3spr = spr_rankcard;
		cardflipping = spr_rankcardflipping;
		cardflipped = spr_rankcardflipped;
		mallowspr = spr_confecti1rank
		chocospr = spr_confecti2rank
		crackspr = spr_confecti3rank
		wormspr = spr_confecti4rank
		candyspr = spr_confecti5rank
		mallowmissspr = spr_toppin1rankm
		chocomissspr = spr_confecti2rankm
		crackmissspr = spr_confecti3rankm
		wormmissspr = spr_confecti4rankm
		candymissspr = spr_confecti5rankm
		break;
		
}

alarm[8] = -1;