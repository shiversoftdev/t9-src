#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_350cffecd05ef6cf;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_74a56359b7d02ab6;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_14f8bd8f;

/*
	Name: function_32160152
	Namespace: namespace_14f8bd8f
	Checksum: 0x3F16CE75
	Offset: 0x1E8
	Size: 0x374
	Parameters: 5
	Flags: Linked
*/
function function_32160152(player, modelname, origin, angles, scale)
{
	if(!isdefined(scale))
	{
		scale = 1;
	}
	model = namespace_ec06fe4a::function_e22ae9b3(origin, modelname, angles);
	if(isdefined(model))
	{
		model setscale(scale);
		scenedef = #"hash_30c46dd666dd7707";
		var_2468c36a = "fireworks";
		model namespace_83eb6304::function_3ecfde67("glow_white");
		model namespace_e32bb68::function_3a59ec34("evt_doa_pickup_giftbox_activated");
		model scene::play(scenedef, model);
		model waittill(#"scenes_done");
		model namespace_e32bb68::function_3a59ec34("evt_doa_pickup_giftbox_explode");
		model namespace_ec06fe4a::function_8c808737();
		model thread namespace_ec06fe4a::function_52afe5df(1);
		model namespace_83eb6304::turnofffx("glow_yellow");
		model namespace_83eb6304::turnofffx("player_trail_yellow");
		waitframe(1);
		roll = randomint(100);
		if(roll < 55)
		{
			doa_enemy::function_a6b807ea(doa_enemy::function_d7c5adee("spider"), randomint(4) + 1, model.origin);
		}
		else
		{
			model namespace_83eb6304::function_3ecfde67("fireworks");
			model namespace_e32bb68::function_3a59ec34("evt_doa_pickup_giftbox_fireworks");
			if(roll == 99)
			{
				doa_pickups::function_ad7ac41b(origin, 1, 32, 14, 1);
			}
			else
			{
				if(roll > 92)
				{
					doa_pickups::function_ad7ac41b(origin, 1, 32, 16, 1);
				}
				else
				{
					if(roll > 80)
					{
						doa_pickups::function_ad7ac41b(origin, 1, 32, 8, 1);
					}
					else
					{
						if(roll > 70)
						{
							doa_pickups::function_ad7ac41b(origin, 1, 32, 9, 1);
						}
						else
						{
							doa_pickups::function_ad7ac41b(origin, 1, 32, 32, 1);
						}
					}
				}
			}
		}
	}
}

