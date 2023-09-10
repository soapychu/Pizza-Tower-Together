if live_call() return live_result;
global.OptionsBG = bg_modded
// prep
depth = -600;
image_speed = 0.35;
scr_init_input();
stickpressed = false;
con = 0;
t = 0;

options_array = [];
function add_option(name, variable, desc = "", drawfunc = noone)
{
	var struct = {
		type: 0,
		value: 0,
		vari: variable,
		name: name,
		desc: desc,
		opts: [["OFF", false], ["ON", true]],
		drawfunc: drawfunc
	}
	array_push(options_array, struct);
	return struct;
}
function add_section(name)
{
	var struct = {
		type: 1,
		value: 0,
		name: name
	};
	array_push(options_array, struct);
	return struct;
}
sel = 1;
section = -1;
surf = noone;

// simuplayer
reset_simuplayer = function()
{
	simuplayer = {
		x: 960 / 2.5 / 2, y: 540 / 2.5 / 1.5, state: states.normal, hsp: 0, vsp: 0, sprite: spr_player_idle, image: 0, xscale: 1, timer: 0, move: 0, changed: false, angle: 0
	}
}

reset_simuplayer2 = function()
{
	simuplayer2 = {
		x: 960 / 2.5 / 2, y: 540 / 2.5 / 1.5, state: states.normal, hsp: 0, vsp: 0, sprite: spr_player_idle, image: 0, xscale: 1, timer: 0, move: 0, changed: false, angle: 0
	}
}
function draw_simuplayer(p2)
{
	var p = simuplayer;
	if p2 
	p = simuplayer2
	
	
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_peppalette, 1, 0);
	
	var width = 960 / 2.5;
	
	var xo = p.x - lengthdir_x(28, p.angle - 90);
	var yo = p.y;
	
	if xo < 50
		draw_sprite_ext(p.sprite, p.image, xo + width, yo, p.xscale, 1, p.angle, c_white, 1);
	if xo > width - 50
		draw_sprite_ext(p.sprite, p.image, xo - width, yo, p.xscale, 1, p.angle, c_white, 1);
	
	draw_sprite_ext(p.sprite, p.image, xo, yo, p.xscale, 1, p.angle, c_white, 1);
	shader_reset();
}
reset_simuplayer();
reset_simuplayer2();

// options
add_section("Gameplay");

#region REMIX

color1 = shader_get_uniform(shd_mach3effect, "color1");
color2 = shader_get_uniform(shd_mach3effect, "color2");
var opt = add_option("Remix", "gameplay", "Adds extra quality of life improvements to a bunch of stuff.", function(val)
{
	draw_sprite_ext(val == 1 ? spr_tv_bgfinal_NEW : spr_tv_bgfinal, 1, 110, 70, 1, 1, 0, c_white, 1);
	
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_peppalette, 1, 0);
	draw_sprite_ext(spr_tv_idle, 0, 110, 70, 1, 1, 0, c_white, 1);
	shader_reset();
	
	if val == 1
	{
		shader_set(shd_mach3effect);
		gpu_set_blendmode(bm_normal);
		
		var b = global.mach_color1;
		shader_set_uniform_f(color1, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		b = merge_colour(b, c_black, 0.9);
		shader_set_uniform_f(color2, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		
		draw_sprite(spr_player_mach, 0, 240, 150);
		draw_sprite(spr_player_mach, 2, 340, 150);
		
		b = global.mach_color2;
		shader_set_uniform_f(color1, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		b = merge_colour(b, c_black, 0.9);
		shader_set_uniform_f(color2, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		
		draw_sprite(spr_player_mach, 1, 290, 150);
		shader_reset();
	}
	else
	{
		draw_sprite_ext(spr_player_mach, 0, 240, 150, 1, 1, 0, global.mach_color1, 1);
		draw_sprite_ext(spr_player_mach, 1, 290, 150, 1, 1, 0, global.mach_color2, 1);
		draw_sprite_ext(spr_player_mach, 2, 340, 150, 1, 1, 0, global.mach_color1, 1);
	}
});
opt.value = global.gameplay;

#endregion
#region ATTACK STYLE

var opt = add_option("Attack Style", "attackstyle", "Alternatives to the basic grab move. The original grab is moved to the CHAINSAW button.", function(val)
{
	var p = simuplayer;
	
	if p.sprite == spr_player_breakdanceuppercut && p.state == states.titlescreen
	{
		p.state = states.panicjump;
		p.move = 0;
		p.timer = -100;
	}
	else if p.changed && p.x != 75
	{
		if p.state == states.titlescreen
			p.state = states.normal;
		if p.state == states.normal
		{
			if p.x > 75 && p.x + p.hsp > 75
				p.move = -1;
			else if p.x < 75 && p.x + p.hsp < 75
				p.move = 1;
			else
			{
				p.x = 75;
				p.hsp = 0;
				p.move = 0;
				p.xscale = 1;
				p.timer = 10;
				p.changed = false;
			}
		}
	}
	else
	{
		if p.state == states.titlescreen
		{
			p.state = states.normal;
			p.sprite = spr_player_idle;
			p.x = 75;
			p.xscale = 1;
		}
		
		p.timer++;
		if p.timer >= 30
		{
			if val == 0
			{
				p.timer = -40;
				sound_play_centered_oneshot(sfx_suplexdash);
				
				p.state = states.handstandjump;
				p.sprite = spr_player_suplexdash;
				p.image = 0;
				p.move = p.xscale;
				p.hsp = 6 * p.move;
			}
			if val == 1
			{
				p.timer = -5;
				sound_play_centered_oneshot("event:/ptt/sfx/kungfu");
				
				p.state = states.punch;
				p.sprite = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3);
				p.image = 0;
				
				if p.x > 960 / 2.5 / 2
					p.xscale = -1;
				else
					p.xscale = 1;
				
				p.move = p.xscale;
				p.hsp = 6 * p.move;
			}
			if val == 2
			{
				p.timer = -30;
				sound_play_centered_oneshot(sfx_dive);
				
				p.state = states.handstandjump;
				p.sprite = spr_player_attackdash;
				p.image = 0;
				p.move = p.xscale;
				p.hsp = 6 * p.move;
			}
			if val == 3
			{
				p.timer = -30;
				sound_play_centered_oneshot(sfx_suplexdash);
				
				p.state = states.handstandjump;
				p.sprite = spr_player_lunge;
				p.image = 0;
				p.move = p.xscale;
				p.hsp = 6 * p.move;
			}
		}
	}
	
	draw_simuplayer();
});
opt.value = global.attackstyle;
opt.opts = [
	["GRAB", 0],
	["KUNG FU", 1],
	["SHOULDER BASH", 2],
	["PUMMEL", 3],
];

#endregion
#region SHOOT STYLE

var opt = add_option("Shoot Style", "shootstyle", "Extra attacks bound to the SHOOT button. Change it in the key config.", function(val)
{
	var p = simuplayer;
	
	if p.state == states.titlescreen
	{
		p.xscale = 1;
		p.state = states.normal;
		p.sprite = spr_player_idle;
		p.move = 0;
		p.hsp = 0;
		bullets = 3;
		p.timer = 0;
	}
	else if p.x != 100
		p.x = Approach(p.x, 100, 10);
	else
	{
		if p.changed
		{
			p.changed = false;
			p.state = states.titlescreen;
		}
		
		p.timer++;
		if p.timer > 20
		{
			p.timer = 0;
			if val == 1 && floor(bullets) > 0 && frac(bullets) == 0
			{
				sound_play_centered_oneshot(sfx_pistolshot);
				p.state = states.pistol;
				p.sprite = spr_player_pistolshot;
				p.image = 0;
				bullets--;
			}
		}
		
		if p.state != states.pistol
		{
			if bullets == 0
				p.timer = -80;
			bullets = Approach(bullets, 3, 0.05);
		}
	}
	
	draw_simuplayer();
	
	if val == 1
	{
		for(var i = 0; i < floor(bullets); i++)
			draw_sprite(spr_peppinobullet_collectible, -1, 136 - 46 * i, -32);
	}
	if val == 2
	{
		p.state = -1;
		p.sprite = spr_player_taunt;
		p.image = 10;
		
		draw_set_font(global.creditsfont);
		draw_text(960 / 2.5 / 2, 60, "Unimplemented!");
	}
});
opt.opts = [
	["NONE", 0],
	["PISTOL", 1],
	//["BREAKDANCE", 2]
];
opt.value = global.shootstyle;

#endregion
#region DOUBLE GRAB

var opt = add_option("Grab Special", "doublegrab", "Press the GRAB button twice to attack.", function(val)
{
	var p = simuplayer;
	
	if p.sprite == spr_player_breakdanceuppercut && p.state == states.titlescreen
	{
		p.state = states.panicjump;
		p.move = 0;
		p.timer = -100;
	}
	else if p.changed
	{
		bullets = 3;
		if p.state == states.titlescreen
			p.state = states.normal;
		if p.state == states.normal
		{
			if p.x > 75 && p.x + p.hsp > 75
				p.move = -1;
			else if p.x < 75 && p.x + p.hsp < 75
				p.move = 1;
			else
			{
				p.x = 75;
				p.hsp = 0;
				p.move = 0;
				p.xscale = 1;
				p.timer = 10;
				p.changed = false;
			}
		}
	}
	else
	{
		if p.state == states.titlescreen
		{
			p.state = states.normal;
			p.sprite = spr_player_idle;
			p.x = 75;
			p.xscale = 1;
		}
		
		p.timer++;
		if p.timer >= 30 && val != 0 && (val != 3 or floor(bullets) > 0)
		{
			if p.state == states.handstandjump
			{
				p.timer = -30;
				if val == 1
				{
					sound_play_centered_oneshot(sfx_dive);
					p.sprite = spr_player_attackdash;
					p.image = 0;
				}
				if val == 2
				{
					p.sprite = spr_player_faceplant;
					p.state = states.faceplant;
					p.hsp = 8;
					p.image = 0;
				}
				if val == 3
				{
					p.sprite = spr_player_chainsawdash;
					p.state = states.chainsawbump;
					p.hsp = 11;
					p.image = 0;
					bullets--;
				}
			}
			else
			{
				p.timer = 10;
				//sound_play_centered_oneshot(sfx_suplexdash);
				
				p.state = states.handstandjump;
				p.sprite = spr_player_suplexdash;
				p.image = 0;
				p.move = p.xscale;
				p.hsp = 4 * p.move;
			}
		}
	}
	
	if val == 3
	{
		for(var i = 0; i < floor(bullets); i++)
			draw_sprite(spr_fuelHUD, -1, 136 - 46 * i, 46);
	}
	
	draw_simuplayer();
});
opt.opts = [
	["NONE", 0],
	["SHOULDER BASH", 1],
	["FACEPLANT", 2],
	["CHAINSAW", 3]
];
opt.value = global.doublegrab;

#endregion
#region HEAT METER

var opt = add_option("Heat Meter", "heatmeter", "Rewards good gameplay with more points, but harder enemies!", function(val)
{
	var xx = 960 / 2.5 / 2, yy = 540 / 2.5 / 2;
	
	if val
	{
		draw_sprite(spr_heatmeter, 0, xx, yy);
		draw_sprite(spr_pizzascore, 0, xx, yy);
	}
	else
		draw_sprite(spr_pizzascore, 0, xx, yy);
});
opt.value = global.heatmeter;

#endregion

#region Lap 3

var opt = add_option("Lap 3", "canlap3", "Lap 3+ will spawn Pizzaface immediately, only for the most skilled of players.", function(val)
{
	var xx = 960 / 2.5 / 2, yy = 540 / 2.5 / 2;
	
	var p = simuplayer;
	var pf = simuplayer2
	if p.state == states.titlescreen
	{
		pf.x = 80
		p.x = 80;
		p.vsp = 0;
		p.xscale = 1;
		p.move = p.xscale;
		p.hsp = 8 * p.move;
		p.state = states.mach3
		p.sprite = spr_player_mach4
	}
	
	
	
	
	if not val
	{
		
		pf.move = p.xscale;
		pf.hsp = 0 * p.hsp;
		pf.state = states.mach3
		pf.sprite = spr_pizzahead_intro1
		pf.xscale = 0
		pf.yscale = 0
	}
	else
	{	
			pf.xscale = 1
		pf.yscale = 1
		pf.x = p.x - 120
		pf.move = pf.xscale;
		pf.hsp =  8 * pf.move;
		pf.state = states.mach3
		pf.sprite = spr_pizzaface
		
	}
	
	
	draw_sprite(spr_chargeeffect, -1, p.x, p.y);
	pf.image = -1
	p.image += p.hsp / 10;
	draw_simuplayer();
	draw_simuplayer(true);
});
opt.value = global.canlap3;

#endregion

#region john ghost

var opt = add_option("John Ghost in all rooms", "ghostinrooms", "Will automatically spawn the John Ghost from Wasteyard.", function(val)
{
	var xx = 960 / 2.5 / 2, yy = 540 / 2.5 / 2;
	
	var p = simuplayer;
	var pf = simuplayer2
	if p.state == states.titlescreen
	{
		pf.x = 80
		p.x = 50;
		p.vsp = 0;
		p.xscale = 1;
		p.move = p.xscale;
		p.hsp = 0 * p.move;
		p.state = states.idle
		p.sprite = spr_player_idlefrown
	}
	
	
	
	
	if not val
	{
		
		pf.state = states.mach3
		pf.sprite = spr_pizzahead_intro1
		pf.xscale = 0
		pf.yscale = 0
		p.state = states.idle
		p.sprite = spr_player_idlefrown
	}
	else
	{	
		p.sprite = spr_player_gnomecutscene4
		pf.xscale = -1
		pf.yscale = 1
		pf.x = p.x + 120	
		pf.y = p.y - 50
		pf.state = states.idle
		pf.sprite = spr_ghostjohn
		
		
	}
	
	
	pf.image = -1
	p.image = -1
	draw_simuplayer();
	draw_simuplayer(true);
});
opt.value = global.ghostinrooms;

#endregion

#region VIGI SUPER JUMP

var opt = add_option("Vigilante Super Jump", "vigisuperjump", "Enables Vigilante to have a super jump. Really, that's it.", function(val)
{
	var p = simuplayer;
	
		if p.state == states.titlescreen
		{
			p.x = 50;
			p.vsp = 0;
			p.xscale = 1;
			p.move = p.xscale;
			p.hsp = 0;
			p.state = states.actor
			p.sprite = spr_playerV_idle
			p.timer = -15
		}
		

	

	

	/*
	if (p.timer >= 15 && val)
	{
		switch (p.state)
		{
			case states.mach3:
				p.sprite = spr_playerV_facehurt
				p.state = states.Sjumpprep
				fmod_event_instance_play(superjumpsnd)
				p.hsp = 0 * p.move;
				timer = -150
			break;
			case states.Sjumpprep:
				if p.sprite == spr_playerV_facehurt
				{
				p.sprite = spr_playerV_superjumppreplight
				timer = 0
				}
				else
				{
				p.sprite = spr_playerV_superjumploop
				fmod_event_instance_set_parameter(superjumpsnd, "state", 2, true)
				p.state = states.Sjump
				timer = -150
				p.vsp = 4 * p.move;
				}
			break;
			case states.Sjump:
				if (p.image == (sprite_get_number(spr_vigilante_bazooka) - 1))
				{
					p.vsp = 0;
					p.xscale = 1;
					p.move = p.xscale;
					p.hsp = 8 * p.move;
					p.state = states.mach3
					p.sprite = spr_playerV_mach3
					p.timer = -150
				}
				else
				{
					p.sprite = spr_vigilante_bazooka
					p.state = states.Sjump
					p.vsp = 0 * p.move;
					if p.timer == 15 
					fmod_event_one_shot_3d(sfx_superjumpcancel, p.x, p.y)
				}
			break;
		}
	}
	
	if p.sprite = spr_playerV_mach3
		if p.y < 144 
			p.vsp = -4 * p.move
		else
			p.vsp = 0
	
	p.image = -1
	*/
	draw_simuplayer();
});

opt.value = global.vigisuperjump;

#endregion

add_section("Input");
#region SWAP GRAB

var opt = add_option("Swap Grab", "swapgrab", "Binds the grab back to the normal bind, and moves whatever attack style you have to the special button.\n\nChange it in the key config.")
opt.value = global.swapgrab;

#endregion
#region SHOOT BUTTON

var opt = add_option("Separate Shoot", "shootbutton", "Move the shoot button for both the pistol and the shotgun to a standalone SHOOT button, A by default.", function(val)
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_peppalette, 1, false);
	
	if val == 0
	{
		var cx = 180, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_slap), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
	
		draw_sprite(spr_player_shotgun, 0, 200, 130);
	}
	else if val == 1
	{
		var cx = 80, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_slap), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
	
		draw_sprite(spr_player_suplexdash, 5, 100, 130);
		
		var cx = 260, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_shoot), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
		
		draw_sprite(spr_player_shotgun, 0, 260, 130);
	}
	else if val == 2
	{
		var cx = 80, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_shoot), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
		
		draw_sprite(spr_player_shotgun, 0, 100, 130);
		
		var cx = 260, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_slap), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
		
		draw_sprite(spr_player_pistolshot, 1, 280, 130);
	}
	
	shader_reset();
});
opt.opts = [
	["OFF", false],
	["ON", true],
	["SHOTGUN ONLY", 2]
]
opt.value = global.shootbutton;

#endregion


add_section("Visual");
#region PANIC BG

/*
var opt = add_option("Panic Background", "panicbg", "Brings back the wavy background effect from old builds when escaping.", function(val)
{
	if val
	{
		shader_set(shd_panicbg);
		
		shader_set_uniform_f(shader_get_uniform(shd_panicbg, "panic"), 1);
		shader_set_uniform_f(shader_get_uniform(shd_panicbg, "time"), current_time / 1000);
		
		draw_sprite_ext(bg_desert, -1, 0, 0, 0.4, 0.4, 0, c_white, 1);
		
		shader_reset();
	}
	else
		draw_sprite_ext(bg_desert, -1, 0, 0, 0.4, 0.4, 0, c_white, 1);
});
opt.value = global.panicbg;
*/

#endregion


#region SS OVERRIDES

var opt = add_option("Sugary Spire Overrides", "pizzellesugaryoverride", "Depending on whether this is off or on, Pizzelle will carry traits from Sugary Spire levels over to Pizza Tower levels.", function(val)
{
	var p = simuplayer;
	
		if p.state == states.titlescreen
		{
			p.x = 50;
			p.vsp = 0;
			p.xscale = 1;
			p.move = p.xscale;
			p.hsp = 0 * p.move;
			p.state = states.idle
			p.sprite = spr_playerSP_candycaneidle
		}
		
	var xx = 960 / 2.5 / 2, yy = 540 / 2.5 / 2;
	
	if !val
		draw_sprite(spr_pizzaportal, 0, xx, yy);
	else
		draw_sprite(spr_lappingportalSS_idle, 0, xx, yy);
	
	p.image = -1
	
	draw_simuplayer();
});
opt.value = global.pizzellesugaryoverride;

#endregion

#region SLOPE ROTATION

var opt = add_option("Slope Rotation", "sloperot", "Rotates the player when standing on a slope.", function(val)
{
	var slopex = 132;
	draw_sprite_ext(spr_slope, 0, slopex, 94 + 32, 2, 2, 0, c_white, 1);
	draw_sprite_ext(spr_slope, 0, slopex + 32 * 4, 94 + 32, -2, 2, 0, c_white, 1);
	
	var p = simuplayer;
	if p.state == states.titlescreen
	{
		p.x = 50;
		p.state = states.actor;
		p.vsp = 0;
		p.sprite = spr_player_move;
		p.xscale = 1;
	}
	
	p.image += p.hsp / 10;
	if p.x > slopex + 32 * 4
	{
		p.angle = lerp(p.angle, 0, 0.5);
		p.y = 144;
		p.hsp = Approach(p.hsp, 5, 0.2);
	}
	else if p.x > slopex + 32 * 2
	{
		var slop = slopex + 32 * 2;
		
		p.angle = lerp(p.angle, -35, 0.3);
		p.y = lerp(144, 144 - 64, 1 - clamp((p.x - slop) / (32 * 2), 0, 1));
		p.hsp = 3;
	}
	else if p.x > slopex
	{
		p.angle = lerp(p.angle, 35, 0.5);
		p.y = lerp(144, 144 - 64, clamp((p.x - slopex) / (32 * 2), 0, 1));
		p.hsp = 3;
	}
	else
	{
		p.angle = lerp(p.angle, 0, 0.5);
		p.y = 144;
		p.hsp = 5;
	}
	if val == 0
		p.angle = 0;
	
	draw_simuplayer();
});
opt.value = global.sloperot;

#endregion

xo = 0;
yo = 0;
alpha = 1;
