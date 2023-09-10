/// @description Rank Show
if rankdex == 0
	stampani = 1

if (global.rank == "p")
{
	rankdex = 6;
}
if global.collect >= global.srank
{
	rankdex = 5
}
else if global.collect >= global.arank && global.collect < global.srank
{
	rankdex = 4
}
else if global.collect >= global.brank && global.collect < global.arank
{
	rankdex = 3
}
else if global.collect >= global.crank && global.collect < global.brank
{
	rankdex = 2
}
else
{
	rankdex = 1
}
obj_player.visible = 0

if (check_char("P") && obj_player.ispeppino)
{
	if (global.rank == "p")
        sprite_index = spr_rankP;
    if (global.rank == "s")
        sprite_index = spr_rankS;
    if (global.rank == "a")
        sprite_index = spr_rankA;
    if (global.rank == "b")
        sprite_index = spr_rankB;
    if (global.rank == "c")
        sprite_index = spr_rankC;
    if (global.rank == "d")
        sprite_index = spr_rankD;
}
else if (check_char("PN"))
{
	if (global.rank == "p")
        sprite_index = spr_rankPNP;
    if (global.rank == "s")
        sprite_index = spr_rankPNS;
    if (global.rank == "a")
        sprite_index = spr_rankPNA;
    if (global.rank == "b")
        sprite_index = spr_rankPNB;
    if (global.rank == "c")
        sprite_index = spr_rankPNC;
    if (global.rank == "d")
        sprite_index = spr_rankPND;
}
else if (check_char("BN"))
{
	if (global.rank == "p")
        sprite_index = spr_rankBNP;
    if (global.rank == "s")
        sprite_index = spr_rankBNS;
    if (global.rank == "a")
        sprite_index = spr_rankBNA;
    if (global.rank == "b")
        sprite_index = spr_rankBNB;
    if (global.rank == "c")
        sprite_index = spr_rankBNC;
    if (global.rank == "d")
        sprite_index = spr_rankBND;
}
else if (check_char("SP"))
{
	if (global.rank == "p")
        sprite_index = spr_rankSPP;
    if (global.rank == "s")
        sprite_index = spr_rankSPS;
    if (global.rank == "a")
        sprite_index = spr_rankSPA;
    if (global.rank == "b")
        sprite_index = spr_rankSPB;
    if (global.rank == "c")
        sprite_index = spr_rankSPC;
    if (global.rank == "d")
        sprite_index = spr_rankSPD;
}
else if (check_char("SN"))
{
	if (global.rank == "p")
        sprite_index = spr_rankSPP;
    if (global.rank == "s")
        sprite_index = spr_rankSNS;
    if (global.rank == "a")
        sprite_index = spr_rankSNA;
    if (global.rank == "b")
        sprite_index = spr_rankSNB;
    if (global.rank == "c")
        sprite_index = spr_rankSNC;
    if (global.rank == "d")
        sprite_index = spr_rankSND;
}
else
{
    if (global.rank == "s")
        sprite_index = spr_rankNS;
    if (global.rank == "a")
        sprite_index = spr_rankNA;
    if (global.rank == "b")
        sprite_index = spr_rankNB;
    if (global.rank == "c")
        sprite_index = spr_rankNC;
    if (global.rank == "d")
        sprite_index = spr_rankND;
}

alarm[7] = 70
image_speed = 0.45
canleave = 1
alarm[3] = -1
