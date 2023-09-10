tv_x = SCREEN_WIDTH - 115;
tv_y = 80;
timer_xstart = (SCREEN_WIDTH / 2) + timer_xplus;
timer_x = timer_xstart;
timer_ystart = SCREEN_HEIGHT + timer_yplus;
if (global.combotime > 0 && global.combo > 0)
	visualcombo = global.combo;
if (room == Realtitlescreen or room == funnyintro or room == Longintro or room == Mainmenu or room == rank_room or room == rm_levelselect or room == timesuproom or room == boss_room1 or room == characterselect or room == basement_entrance or room == basement_1 or room == basement_2 or room == hub_loadingscreen or (string_copy(room_get_name(room), 1, 5) == "tower" && !global.panic))
{
	visible = false;
	targetspr = spr_tv_off;
}
else
	visible = true;
if ((instance_exists(obj_chat) && !obj_chat.showhud) or !global.option_hud)
	visible = false;

image_speed = 0.35;
if (targetgolf != -4 && !instance_exists(targetgolf))
	targetgolf = -4;
if (targetgolf != -4 && !view_visible[1])
{
	view_visible[1] = true;
	view_enabled = true;
}

if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
{
	if (prompt != -4)
		prompt_buffer = 2;
	bubbleindex += image_speed;
	if (floor(bubbleindex) == sprite_get_number(bubblespr))
	{
		bubbleindex = 0;
		switch (bubblespr)
		{
			case spr_tv_bubbleopen:
                bubblespr = spr_tv_bubble
                break
            case spr_tv_bubbleclose:
                bubblespr = spr_tv_bubbleclosed
                if (prompt == -4 or prompt == "")
                    bubblespr = -4
                break
		}
	}
}

switch (state)
{
	case states.normal:
		idlespr = spr_tv_idle;
		if (global.panic) && !instance_exists(obj_ghostcollectibles) && (global.canlap3 && global.laps < 2)
			idlespr = spr_tv_exprpanic;
		else if (global.combo >= 3 && global.stylethreshold < 3 && !obj_player.isgustavo  && (global.canlap3 && global.laps < 2))
			idlespr = spr_tv_exprcombo;
		else if (global.stylethreshold >= 3 && !obj_player.isgustavo) or (global.canlap3 && global.laps > 1)
			idlespr = spr_tv_exprheat;
		
		if (obj_player.isgustavo)
		{
			if global.pizzellesugaryoverride then
			{
			idlespr = spr_tv_idleGSP;
			if (global.panic)
				idlespr = spr_tv_escapeGSP;
			}
			else
			{
			idlespr = spr_tv_idleG;
			if (global.panic)
				idlespr = spr_tv_escapeG;
			}
		}
		
		if obj_player1.character == "SP" && instance_exists(obj_ghostcollectibles)
		{
			sprite_index = spr_tv_secretSP;
			idlespr = -1;
			idleanim = 240;
		}
		
		var _state = obj_player1.state;
		if (_state == states.backbreaker or _state == states.chainsaw)
			_state = obj_player1.tauntstoredstate;
		
		var _transfo = true;
		var _transfospr = scr_tv_get_transfo_sprite();
		if (_transfospr == -4)
			_transfo = false;
		else
			idlespr = _transfospr;
		
		if (!_transfo)
		{
			with (obj_player1)
			{
				if (mach4mode == 1)
					tv_do_expression(spr_tv_exprmach4);
				else if (state == states.mach3 or sprite_index == spr_mach3boost)
					tv_do_expression(spr_tv_exprmach3);
			}
		}
		switch (targetspr)
		{
			case spr_tv_off:
				if (visible)
				{
					targetspr = spr_tv_open;
					image_index = 0;
				}
				break;
			
			case spr_tv_open:
				if (floor(image_index) == (image_number - 1))
					targetspr = idlespr;
				break;
			
			case spr_tv_idle:
			case spr_tv_idleN:
				if (idleanim > 0)
					idleanim--;
				if (targetspr != idlespr)
					targetspr = idlespr;
				if (idleanim <= 0 && floor(image_index) == (image_number - 1))
				{
					targetspr = choose(spr_tv_idleanim1, spr_tv_idleanim2);
					image_index = 0;
				}
				break;
			
			case spr_tv_idleanim1:
			case spr_tv_idleanim2:
			case spr_tv_idleanim1N:
			case spr_tv_idleanim2N:
				if (floor(image_index) == (image_number - 1))
				{
					targetspr = idlespr;
					idleanim = 240 + (60 * irandom_range(-1, 2));
				}
				if (idlespr != spr_tv_idle && idlespr != spr_tv_idleN)
					targetspr = idlespr;
				break;
			
			default:
				targetspr = idlespr;
		}
		
		/*
		if (targetspr != spr_tv_open)
		{
			if (!ds_list_empty(tvprompts_list))
			{
				var b = ds_list_find_value(tvprompts_list, 0);
				prompt_buffer = prompt_max;
				if (b[0] != "" && b[0] != -4)
				{
					bubblespr = spr_tv_bubbleopen;
					bubbleindex = 0;
					prompt = b[0];
					promptspd = b[3];
					promptx = promptxstart;
				}
				else
				{
					if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
						bubblespr = spr_tv_bubbleclose;
					if (bubblespr == spr_tv_bubbleclosed)
						bubblespr = -4;
					bubbleindex = 0;
					promptx = promptxstart;
					prompt = -4;
				}
				if (b[1] == tvprompt.normal)
				{
					targetspr = spr_tv_open;
					image_index = 0;
					tvsprite = b[2];
					if (!obj_player1.ispeppino)
					{
						spr = sprite_get_name(tvsprite);
						spr = asset_get_index(concat(spr, "N"));
						if (spr > -1)
							tvsprite = spr;
					}
				}
				else
				{
					tvsprite = b[2];
					if (!obj_player1.ispeppino)
					{
						spr = sprite_get_name(tvsprite);
						spr = asset_get_index(concat(spr, "N"));
						if (spr > -1)
							tvsprite = spr;
					}
					targetspr = tvsprite;
					image_index = 0;
				}
				state = states.transition;
			}
			else
				bubblespr = -4;
		}
		*/
		break;
	
	case states.transition:
		if (targetspr == spr_tv_open && floor(image_index) == (image_number - 1))
			targetspr = tvsprite;
		if (targetspr == tvsprite)
		{
			if (prompt_buffer > 0)
				prompt_buffer--;
			else
			{
				promptx = promptxstart;
				ds_list_delete(tvprompts_list, 0);
				state = states.normal;
			}
		}
		break;
	
	case states.tv_whitenoise:
		if (tv_trans >= sprite_get_number(spr_tv_whitenoise))
		{
			if (expressionsprite != -4)
			{
				state = states.tv_expression;
				targetspr = expressionsprite;
			}
			else
				state = states.normal;
			image_index = 0;
		}
		break;
	
	case states.tv_expression:
		var s = state;
		var es = expressionsprite;
		var _transfospr = scr_tv_get_transfo_sprite();
		
		switch (expressionsprite)
		{
			case spr_tv_exprhurt:
            case spr_tv_exprhurt1:
            case spr_tv_exprhurt2:
            case spr_tv_exprhurt3:
            case spr_tv_exprhurt4:
            case spr_tv_exprhurt5:
            case spr_tv_exprhurt6:
            case spr_tv_exprhurt7:
            case spr_tv_exprhurt8:
            case spr_tv_exprhurt9:
            case spr_tv_exprhurt10:
				if (obj_player1.state != states.hurt)
				{
					if (expressionbuffer > 0)
						expressionbuffer--;
					else
					{
						state = states.tv_whitenoise;
						expressionsprite = -4;
					}
				}
				break;
				case spr_tv_confecti1:
					if (expressionbuffer > 0)
					expressionbuffer--;
				else
				{
					state = states.tv_whitenoise;
					expressionsprite = -4;
				}
				break
				case spr_tv_confecti2:
					if (expressionbuffer > 0)
					expressionbuffer--;
				else
				{
					state = states.tv_whitenoise;
					expressionsprite = -4;
				}
				break
				case spr_tv_confecti3:
					if (expressionbuffer > 0)
					expressionbuffer--;
				else
				{
					state = states.tv_whitenoise;
					expressionsprite = -4;
				}
				break
				case spr_tv_confecti4:
					if (expressionbuffer > 0)
					expressionbuffer--;
				else
				{
					state = states.tv_whitenoise;
					expressionsprite = -4;
				}
				break
				case spr_tv_confecti5:
				if (expressionbuffer > 0)
					expressionbuffer--;
				else
				{
					state = states.tv_whitenoise;
					expressionsprite = -4;
				}
				break
			case spr_tv_hurtG:
				if (obj_player1.state != states.ratmounthurt)
				{
					if (expressionbuffer > 0)
						expressionbuffer--;
					else
					{
						state = states.tv_whitenoise;
						expressionsprite = -4;
					}
				}
				break;
			
			case spr_tv_exprcombo:
				if (global.combo < 3 or _transfospr != -4 or obj_player1.isgustavo or obj_player1.mach4mode or obj_player1.state == states.hurt or obj_player1.state == states.mach3 or obj_player1.sprite_index == obj_player1.spr_mach3boost or global.stylethreshold >= 3)
				{
					state = states.tv_whitenoise;
					expressionsprite = -4;
					if (obj_player1.state == states.hurt)
						tv_do_expression(spr_tv_exprhurt);
				}
				break;
			
			case spr_tv_exprcollect:
			case spr_tv_keyget:
				if (expressionbuffer > 0)
					expressionbuffer--;
				else
				{
					state = states.tv_whitenoise;
					expressionsprite = -4;
				}
				break;
            case spr_tv_happyG:
				if (expressionbuffer > 0)
					expressionbuffer--;
				else
				{
					state = states.tv_whitenoise;
					expressionsprite = -4;
				}
				break;
			
			case spr_tv_exprmach3:
				with (obj_player1)
				{
					if (state != states.mach3 && state != states.climbwall && (state != states.chainsaw or (tauntstoredstate != states.mach3 && tauntstoredstate != states.climbwall)) && sprite_index != spr_mach3boost && mach4mode == 0)
					{
						other.state = states.tv_whitenoise;
						other.expressionsprite = -4;
					}
					if (mach4mode)
						tv_do_expression(spr_tv_exprmach4);
				}
				break;
			
			case spr_tv_exprmach4:
				with (obj_player1)
				{
					if (mach4mode == 0 && (state != states.chainsaw or (tauntstoredstate != states.mach3 && tauntstoredstate != states.climbwall)))
					{
						other.state = states.tv_whitenoise;
						other.expressionsprite = -4;
					}
				}
				break;
			
			case spr_tv_exprheat:
				_transfo = false;
				with (obj_player1)
				{
					if (_transfospr != -4)
						_transfo = true;
					if (isgustavo)
						_transfo = true;
				}
				if (!global.lap3 or global.stylethreshold < 3  or _transfo or obj_player1.mach4mode or obj_player1.state == states.hurt or obj_player1.state == states.mach3 or obj_player1.sprite_index == obj_player1.spr_mach3boost)
				{
					state = states.tv_whitenoise;
					expressionsprite = noone;
				}
				break;
			
			case spr_tv_exprpanic:
				_transfo = false;
				with (obj_player1)
				{
					if (_transfospr)
						_transfo = true;
					if (isgustavo)
						_transfo = true;
				}
				if (!global.panic or global.lap3 or global.stylethreshold >= 3 or _transfo or obj_player1.mach4mode or obj_player1.state == states.hurt or obj_player1.state == states.mach3 or obj_player1.sprite_index == obj_player1.spr_mach3boost)
				{
					state = states.tv_whitenoise;
					expressionsprite = noone;
				}
				break;
		}
		if (!ds_list_empty(tvprompts_list))
		{
			state = states.tv_whitenoise;
			tv_trans = 0;
			expressionsprite = -4;
		}
		break;
}

// PTO - set tv sprite
if targetspr != -1
{
	var char = obj_player1.character;
	if char == "P" && !obj_player1.ispeppino
		char = "N";
	if char == "G" && global.pizzellesugaryoverride
		char = "SP"
	var charspr = asset_get_index(sprite_get_name(targetspr) + char);
	if charspr > -1
		sprite_index = charspr;
	else
	{
		sprite_index = targetspr;
		if obj_player1.character == "SP" or char == "GSP"
			sprite_index = spr_tv_failsafeSP;
	}
}

// transition timer
if (state != states.tv_whitenoise)
	tv_trans = 0;
else
	tv_trans += 0.35;

// hide tv
var change_pos = false;
if (obj_player.x > (room_width - 224) && obj_player.y < 187)
	change_pos = true;
if (bubblespr != -4 && obj_player.x > 316 && obj_player.y < 101)
	change_pos = true;

var spd = 15;
if (change_pos)
	hud_posY = Approach(hud_posY, -300, spd);
else
	hud_posY = Approach(hud_posY, 0, spd);

// fill timer
if !check_sugary()
{
pizzaface_index += 0.35;
hand_index += 0.35;
johnface_index += 0.35;


		pizzaface_sprite = pizzafacespr1
		if (global.panic && global.fill > 0 && !instance_exists(obj_pizzaface))
{
	showtime_buffer = 100;
	if (!instance_exists(obj_ghostcollectibles))
		timer_y = Approach(timer_y, timer_ystart, 1);
	else
		timer_y = Approach(timer_y, timer_ystart + 212, 4);
}
else if (global.panic)
{

if (pizzaface_sprite == pizzafacespr1 && alreadyspr2 == false)
	{
		pizzaface_sprite = pizzafacespr2;
		pizzaface_index = -1
		alreadyspr2 = true
	}
else if (pizzaface_sprite == pizzafacespr2)
	{
		if (floor(pizzaface_index) >= (sprite_get_number(pizzaface_sprite) - 1))
		{
			pizzaface_sprite = pizzafacespr3;
			pizzaface_index = 0;
		}
	}
	else if (showtime_buffer > 0)
		showtime_buffer--;
	else
		timer_y = Approach(timer_y, timer_ystart + 212, 1);
}
else
{
	
	pizzaface_sprite = pizzafacespr1
	hand_sprite = spr_timer_hand1;
	timer_y = timer_ystart + 212;
}
if (global.panic && global.fill < (chunkmax / 5))
	hand_sprite = spr_timer_hand2;
barfill_x -= 0.2;
if (barfill_x < -173)
	barfill_x = 0;
if (pizzaface_index > (sprite_get_number(pizzaface_sprite) - 1))
	pizzaface_index = frac(pizzaface_index);
if (hand_index > (sprite_get_number(hand_sprite) - 1))
	hand_index = frac(hand_index);
if (johnface_index > (sprite_get_number(johnface_sprite) - 1))
	johnface_index = frac(johnface_index);
}
else
{
if (global.panic && !instance_exists(obj_ghostcollectibles))
{
    if (global.fill > 0 && !instance_exists(obj_pizzaface))
    {
        var _spd = ((1 - (target_fill / global.maxwave)) * (sprite_get_number(spr_bartimer_roll) * 10))
        roll_index = (_spd % sprite_get_number(spr_bartimer_roll))
        //oldTimer_index = (secs % 2)
		coneball_sprite = spr_bartimer_normalFront
        coneball_index += 0.35
        oldBall_index += 0.35
        if (coneball_index >= sprite_get_number(coneball_sprite))
            coneball_index = frac(coneball_index)
        if (oldBall_index >= sprite_get_number(oldBall_sprite))
            oldBall_index = frac(oldBall_index)
        if (roll_index >= sprite_get_number(roll_sprite))
            roll_index = frac(roll_index)
        if (global.panic)
            timer_y = Approach(timer_y, SCREEN_HEIGHT - 75, 4)
        else if (timer_in <= 0)
            timer_y = Approach(timer_y, 0, 1)
    }
    else
    {
        if (oldBall_sprite == spr_timer_coneball_idle)
        {
            oldBall_sprite = spr_timer_coneball
            oldBall_index = 0
        }
        if (coneball_sprite == spr_bartimer_normalFront)
        {
            coneball_sprite = spr_bartimer_showtime
            coneball_index = 0
        }
        if (coneball_index < (sprite_get_number(coneball_sprite) - 1))
            coneball_index += 0.35
        if (oldBall_index < (sprite_get_number(oldBall_sprite) - 1))
            oldBall_index += 0.35
        if (oldTimer_index < (sprite_get_number(oldTimer_sprite) - 1))
            oldTimer_index += 0.35
        if (timer_out > 0)
            timer_out--
        else
            timer_y = Approach(timer_y, SCREEN_HEIGHT + 150, 1)
    }
    if (timer_in > 0)
        timer_in--
}
else
{
    timer_y = SCREEN_HEIGHT + 150;
    timer_out = 220
    timer_in = 60
    oldTimer_sprite = spr_timer
    oldBall_sprite = spr_timer_coneball_idle
    coneball_sprite = spr_bartimer_normalFront
}
}
// combo
combo_posX = Wave(-5, 5, 2, 20);
if (global.combotime > 0 && global.combo != 0)
{
	switch (combo_state)
	{
		case 0:
			combo_posY += combo_vsp;
			combo_vsp += 0.5;
			if (combo_posY > 20)
				combo_state++;
			break;
		case 1:
			combo_posY = lerp(combo_posY, 0, 0.05);
			if (combo_posY < 1)
			{
				combo_posY = 0;
				combo_vsp = 0;
				combo_state++;
			}
			break;
		case 2:
			if (global.combotime < 30)
			{
				combo_posY += combo_vsp;
				if (combo_vsp < 20)
					combo_vsp += 0.5;
				if (combo_posY > 0)
				{
					combo_posY = 0;
					combo_vsp = -1;
					if (global.combotime < 15)
						combo_vsp = -2;
				}
			}
			else
				combo_posY = Approach(combo_posY, 0, 10);
			break;
	}
}
else
{
	combo_posY = Approach(combo_posY, -500, 5);
	combo_vsp = 0;
	combo_state = 0;
}
combofill_index += 0.35;
if (combofill_index > (sprite_get_number(spr_tv_combobubblefill) - 1))
	combofill_index = frac(combofill_index);

// ptt
sleepingjohnface_index += 0.15;
lapflag_index = (lapflag_index + 0.35) % sprite_get_number(spr_lapflag);

var char = obj_player1.character;
if char == "P" && !obj_player1.ispeppino
		char = "N";
		
	
switch char
{
	default:
	{
		pizzafacespr1 = spr_timer_pizzaface1;
		pizzafacespr2 = spr_timer_pizzaface2;
		pizzafacespr3 = spr_timer_pizzaface3;
	}
	break;		
	case "PN":
	{
		pizzafacespr1 = spr_timer_crumwait;
		pizzafacespr2 = spr_timer_crumwakeup;
		pizzafacespr3 = spr_timer_crumshowtime;
	}
	break;	
}
