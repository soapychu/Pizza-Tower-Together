event_inherited();
spr_intro = spr_toppinpineapple_intro;
spr_idle = spr_toppinpineapple;
spr_run = spr_toppinpineapple_run;
spr_panicwalk = spr_toppinpineapple_run;
spr_panic = spr_toppinpineapple_panic;
spr_taunt = spr_toppinpineapple_taunt;
spr_intro_strongcold = spr_xmaspineappletoppin_intro;
spr_idle_strongcold = spr_xmaspineappletoppin_idle;
spr_run_strongcold = spr_xmaspineappletoppin_walk;
if check_sugary()
// so this is the famed pizza tower together
{
spr_intro = spr_candy_appear;
spr_idle = spr_candy_idle;
spr_run = spr_candy_walk;
spr_panic = spr_candy_panic;
spr_panicwalk = spr_candy_panicWalk;
spr_taunt = spr_candy_taunt;
}