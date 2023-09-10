event_inherited();
spr_intro = spr_toppintomato_intro;
spr_idle = spr_toppintomato;
spr_run = spr_toppintomato_run;
spr_panic = spr_toppintomato_panic;
spr_panicwalk = spr_toppintomato_run;
spr_taunt = spr_toppintomato_taunt;
spr_intro_strongcold = spr_xmastomatotoppin_intro;
spr_idle_strongcold = spr_xmastomatotoppin_idle;
spr_run_strongcold = spr_xmastomatotoppin_walk;
if check_sugary()
{
// so this is the famed pizza tower together
spr_intro = spr_crack_appear;
spr_idle = spr_crack_idle;
spr_run = spr_crack_run;
spr_panic = spr_crack_panic;
spr_panicwalk = spr_crack_panicWalk;
spr_taunt = spr_crack_taunt;
}