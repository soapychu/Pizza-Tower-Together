scr_getinput();
if clipy != 0
clipy = approach(clipy, 0, 25 - accel)
accel = approach(accel, 24, .4)
if (floor(image_index) >= (image_number - 1)) {
	image_speed = 0;
}
//Confecti Values
//Scale
scale1 = approach(scale1, 0, 0.30);
scale2 = approach(scale2, 0, 0.30);
scale3 = approach(scale3, 0, 0.30);
scale4 = approach(scale4, 0, 0.30);
scale5 = approach(scale5, 0, 0.30);
//Index
if drawmallow == true mallowdex = approach(mallowdex, 8, .3)  if mallowdex >= 8 drawmallow = false
if drawchoco == true chocodex = approach(chocodex, 8, .3) if chocodex >= 8 drawchoco = false
if drawcrack == true crackdex = approach(crackdex, 8, .3) if crackdex >= 8 drawcrack = false
if drawworm == true wormdex = approach(wormdex, 8, .3) if wormdex >= 8 drawworm = false
if drawcandy == true candydex = approach(candydex, 8, .3) if candydex >= 8 drawcandy = false

//Rank Values
//Scale
//rscale = approach(rscale, 1, 0.30);
if stampani = 1
stampdex = approach(stampdex, 11, .5)
if stampdex >= 11
stampani = 0
//Sound Effect
if /*rscale = 1 && stampsnd = 0 && rankdex != 0*/ stampdex = 3
{
	fmod_event_one_shot("event:/sfx/ui/stamp");
	stampsnd = 1
	/*with instance_create(733, 142, obj_poofeffect)
	image_speed = .5*/
}
//Player Index
playerdex += .5
if playerdex >= 10
playerdex = 0
//Card anim
if card1 = 1 card1spr = cardflipping if card1spr = cardflipping && carddex1 >= 6 card1spr = cardflipped
if card2 = 1 card2spr = cardflipping if card2spr = cardflipping && carddex2 >= 6 card2spr = cardflipped
if card3 = 1 card3spr = cardflipping if card3spr = cardflipping && carddex3 >= 6 card3spr = cardflipped
carddex1 += .3
carddex2 += .3
carddex3 += .3
//Hat Text
//Hat unlocked?
ini_open("saveData.ini");
//Player Sprite Stuff
if (floor(image_index) >= (image_number - 1)) {
	image_speed = 0;
}
//Rank Count Speedup Thing
if counting = true
pspeed += 7
//BG change
if counting = true
{
if countpoint >= global.srank
{
	cakedex = 4
	paltime = approach(paltime, 10, .05)
}
else if countpoint >= global.arank && countpoint < global.srank
{
	cakedex = 3
	paltime = approach(paltime, 8, .05)
}
else if countpoint >= global.brank && countpoint < global.arank
{
	cakedex = 2
	paltime = approach(paltime, 6, .05)
}
else if countpoint >= global.crank && countpoint < global.brank
{
	cakedex = 1
	paltime = approach(paltime, 4, .05)
}
else if countpoint < global.crank
{
	cakedex = 0
	paltime = approach(paltime, 2, .05)
}
}
if paltime >= 1 && paltime < 3
bgdex = 1
else if paltime >= 3 && paltime < 5
bgdex = 2
else if paltime >= 5 && paltime < 7
bgdex = 3
else if paltime >= 7 && paltime < 9
bgdex = 4
else if paltime >= 9
bgdex = 5
bgx -= 1
bgy += 1
if jandraw = 1
janscale = approach(janscale, 1, 0.30);
totalalpha = approach(totalalpha, 1, 0.1);
//press jump button to get outta there
if canleave = 1 && key_jump2
alarm[4] = 1