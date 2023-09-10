event_inherited();
spr_intro = spr_toppincheese_intro;
spr_idle = spr_toppincheese;
spr_run = spr_toppincheese_run;
spr_panic = spr_toppincheese_panic;
spr_panicwalk = spr_toppincheese_run;
spr_taunt = spr_toppincheese_taunt;
spr_intro_strongcold = spr_xmascheesetoppin_intro;
spr_idle_strongcold = spr_xmascheesetoppin_idle;
spr_run_strongcold = spr_xmascheesetoppin_walk;
if check_sugary()
// so this is the famed pizza tower together
{
spr_intro = spr_chocolate_appear;
spr_idle = spr_chocolate_idle;
spr_run = spr_chocolate_walk;
spr_panic = spr_chocolate_panic;
spr_panicwalk = spr_chocolate_panicWalk;
spr_taunt = spr_chocolate_taunt;
}