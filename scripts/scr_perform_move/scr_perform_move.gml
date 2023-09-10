enum moves
{
	grabattack,
	doublegrab,
}
function scr_perform_move(move, prestate)
{
	if move == moves.grabattack
	{
		switch global.attackstyle
		{
			case 1: // kung fu
				if grounded
				{
					with instance_create(x, y, obj_superdashcloud)
						image_xscale = other.xscale;
					sprite_index = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3);
				}
				else
					sprite_index = choose(spr_player_kungfuair1transition, spr_player_kungfuair2transition, spr_player_kungfuair3transition);
				suplexmove = true;
							
				particle_set_scale(particle.crazyrunothereffect, xscale, 1);
				create_particle(x, y, particle.crazyrunothereffect);
					
				sound_play_3d("event:/ptt/sfx/kungfu", x, y);
				state = states.punch;
				movespeed = max(movespeed, 10);
				if vsp > 0
					vsp = 0;
				image_index = 0;
				break;
						
			case 2: // shoulderbash
				if grounded
				{
					with instance_create(x, y, obj_superdashcloud)
						image_xscale = other.xscale;
					sprite_index = spr_attackdash;
				}
				else
					sprite_index = spr_airattackstart;
				suplexmove = true;
							
				particle_set_scale(particle.crazyrunothereffect, xscale, 1);
				create_particle(x, y, particle.crazyrunothereffect);
							
				fmod_event_instance_play(snd_dive);
				state = states.handstandjump;
				movespeed = max(movespeed, 10);
				image_index = 0;
				break;
		case 3: // pummel
				sprite_index = spr_player_lunge
				suplexmove = true;
				
				particle_set_scale(particle.crazyrunothereffect, xscale, 1);
				create_particle(x, y, particle.crazyrunothereffect);
							
				fmod_event_instance_play(suplexdashsnd);
				state = states.handstandjump;
				movespeed = max(movespeed, 10);
				if vsp > 0
				vsp = 0;
				image_index = 0;
				break;
		}
	}
	if move == moves.doublegrab
	{
		switch global.doublegrab
		{
			case 1: // shoulder bash
				if global.attackstyle != 2
				{
					if sprite_index != spr_attackdash && sprite_index != spr_airattackstart && sprite_index != spr_airattack
					&& !suplexmove2
					{
						fmod_event_instance_stop(suplexdashsnd);
						fmod_event_instance_play(snd_dive);
						
						state = states.handstandjump;
						image_index = 0;
						movespeed = max(movespeed, 10);
						
						with instance_create(x, y, obj_crazyrunothereffect)
							image_xscale = other.xscale;
						
						if grounded
						{
							sprite_index = spr_attackdash;
							with instance_create(x + (xscale * -50), y, obj_superdashcloud)
								image_xscale = other.xscale;
						}
						else
						{
							suplexmove2 = true;
							if vsp > -4
								vsp = -4;
							sprite_index = spr_airattackstart;
						}
					}
				}
				else
				{
					// grab instead
					if sprite_index != spr_suplexdash && sprite_index != spr_shotgunsuplexdash
					{
						sprite_index = shotgunAnim ? spr_shotgunsuplexdash : spr_suplexdash;
						suplexmove = true;
						particle_set_scale(particle.jumpdust, xscale, 1);
						create_particle(x, y, particle.jumpdust, 0);
						fmod_event_instance_play(suplexdashsnd);
						state = states.handstandjump;
						image_index = 0;
					}
				}
				break;
			
			case 2: // tumble
				movespeed = movespeed
				
				image_index = 0;
				sprite_index = spr_player_faceplant;
				
				state = states.faceplant;
				image_speed = 0.5;
				
				with instance_create(x, y, obj_jumpdust)
					image_xscale = other.xscale;
				with instance_create(x, y, obj_crazyrunothereffect)
					image_xscale = other.xscale;
				break;
			
			case 3: // chainsaw
				if floor(global.fuel) > 0
				{
					var swapdir = key_left + key_right;
					if swapdir != 0
						xscale = swapdir;
					
					particle_set_scale(particle.jumpdust, xscale, 1);
					create_particle(x, y, particle.jumpdust, 0);
					
					particle_set_scale(particle.crazyrunothereffect, xscale, 1);
					create_particle(x, y, particle.crazyrunothereffect);
					
					with instance_create(x, y, obj_superdashcloud)
						image_xscale = other.xscale;
					
					global.fuel = floor(global.fuel - 1);
					state = states.chainsawbump;
					movespeed = max(movespeed, 10);
					sprite_index = spr_player_chainsawdash;
					image_index = 0;
				}
				break;
		}
	}
}
