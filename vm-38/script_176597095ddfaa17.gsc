#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_d0ab5955;

/*
	Name: function_3cf4377c
	Namespace: namespace_d0ab5955
	Checksum: 0xB6603F40
	Offset: 0x230
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3cf4377c()
{
	level notify(-1700690992);
}

/*
	Name: __init__system__
	Namespace: namespace_d0ab5955
	Checksum: 0x76FB8613
	Offset: 0x250
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_d07e35f920d16a8", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d0ab5955
	Checksum: 0xAF34E168
	Offset: 0x298
	Size: 0x1C2
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	clientfield::register("scriptmover", "fogofwarflag", 1, 1, "int");
	clientfield::register("toplayer", "fogofwareffects", 1, 2, "int");
	clientfield::register("toplayer", "fogofwartimer", 1, 1, "int");
	clientfield::register("allplayers", "outsidetile", 1, 1, "int");
	clientfield::register("world", "tile_id", 1, 6, "int");
	if(!is_true(getgametypesetting(#"hash_59854c1f30538261")))
	{
		return;
	}
	level.var_ac22a760 = struct::get_array(#"hash_3460aae6bb799a99", "content_key");
	for(index = 1; index <= level.var_ac22a760.size; index++)
	{
		level.var_ac22a760[index - 1].id = index;
	}
}

/*
	Name: init
	Namespace: namespace_d0ab5955
	Checksum: 0xF3413084
	Offset: 0x468
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	if(!is_true(getgametypesetting(#"hash_59854c1f30538261")))
	{
		return;
	}
	level.var_3814eac9 = getentarray("trigger_within_bounds", "classname");
	foreach(var_df0c0b31 in level.var_3814eac9)
	{
		var_df0c0b31.activated = 0;
	}
	level.var_f2211522 = getentarray("survival_fow", "script_noteworthy");
	callback::on_connect(&on_connect);
	callback::on_game_playing(&start);
}

/*
	Name: on_connect
	Namespace: namespace_d0ab5955
	Checksum: 0xBC95B6B6
	Offset: 0x5C0
	Size: 0x42
	Parameters: 0
	Flags: Linked, Private
*/
function private on_connect()
{
	self val::set(#"hash_794019c675d0ae10", "disable_oob", 1);
	self.oob_start_time = -1;
}

/*
	Name: start
	Namespace: namespace_d0ab5955
	Checksum: 0x581A184F
	Offset: 0x610
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function start()
{
	level thread function_dc15ad60();
	level thread function_e568ca74();
	var_ef325671 = getentarray("sr_boundary_clip", "targetname");
	foreach(e_brush in var_ef325671)
	{
		e_brush setforcenocull();
	}
}

/*
	Name: function_e568ca74
	Namespace: namespace_d0ab5955
	Checksum: 0x48B71F84
	Offset: 0x6F8
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_e568ca74()
{
	level endon(#"hash_1c6770a6f6ea06b6");
	level flag::wait_till_clear(#"hash_4930756571725d11");
	var_123dc898 = getent("fow_border_all", "targetname");
	if(isdefined(var_123dc898))
	{
		var_123dc898 clientfield::set("fogofwarflag", 1);
	}
}

/*
	Name: function_1c5219e4
	Namespace: namespace_d0ab5955
	Checksum: 0xBA93D899
	Offset: 0x790
	Size: 0x86
	Parameters: 2
	Flags: None
*/
function function_1c5219e4(var_6874207, var_d001b56c)
{
	var_df0c0b31 = getent(var_6874207, "targetname");
	var_9bdd487c = getent(var_d001b56c, "targetname");
	if(isdefined(var_df0c0b31) && isdefined(var_9bdd487c))
	{
		var_df0c0b31.var_9bdd487c = var_9bdd487c;
	}
}

/*
	Name: function_d4dec4e8
	Namespace: namespace_d0ab5955
	Checksum: 0x5F4F7A42
	Offset: 0x820
	Size: 0x1CC
	Parameters: 2
	Flags: Linked
*/
function function_d4dec4e8(destination, var_d0c31a32)
{
	level.var_973f0101 = 1;
	if(isdefined(var_d0c31a32.var_fe2612fe[#"hash_3460aae6bb799a99"]))
	{
		var_6c486d1a = var_d0c31a32.var_fe2612fe[#"hash_3460aae6bb799a99"][0];
		if(isdefined(var_6c486d1a))
		{
			var_6c486d1a.activated = 1;
			var_f6b2bc6f = getent(var_6c486d1a.targetname, "target");
			if(isdefined(var_f6b2bc6f))
			{
				var_f6b2bc6f.activated = 1;
			}
			level clientfield::set("tile_id", var_6c486d1a.id);
			if(!isdefined(var_6c486d1a.var_5d62d655))
			{
				var_6c486d1a.var_5d62d655 = util::spawn_model(var_6c486d1a.model, var_6c486d1a.origin, var_6c486d1a.angles);
			}
			else
			{
				var_6c486d1a.var_5d62d655 show();
			}
			if(isdefined(var_6c486d1a.script_noteworthy))
			{
				var_47f0063b = util::spawn_model(var_6c486d1a.script_noteworthy, var_6c486d1a.origin, var_6c486d1a.angles);
				var_47f0063b clientfield::set("fogofwarflag", 1);
			}
			var_6c486d1a.var_5d62d655 clientfield::set("fogofwarflag", 1);
		}
	}
}

/*
	Name: function_f1ad7968
	Namespace: namespace_d0ab5955
	Checksum: 0xD019D6D
	Offset: 0x9F8
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_f1ad7968(destination)
{
	if(isdefined(destination.var_fe2612fe[#"hash_3460aae6bb799a99"]))
	{
		var_6c486d1a = destination.var_fe2612fe[#"hash_3460aae6bb799a99"][0];
		if(isdefined(var_6c486d1a))
		{
			var_6c486d1a.activated = 0;
			var_f6b2bc6f = getent(var_6c486d1a.targetname, "target");
			if(isdefined(var_f6b2bc6f))
			{
				var_f6b2bc6f.activated = 0;
			}
			if(isdefined(var_6c486d1a.var_5d62d655))
			{
				var_6c486d1a.var_5d62d655 hide();
			}
		}
	}
}

/*
	Name: function_ac8a88de
	Namespace: namespace_d0ab5955
	Checksum: 0xBA66BAC3
	Offset: 0xAD0
	Size: 0x194
	Parameters: 2
	Flags: None
*/
function function_ac8a88de(var_6874207, var_d0c31a32)
{
	level.var_973f0101 = 1;
	var_df0c0b31 = getent(var_d0c31a32, "targetname");
	if(isdefined(var_df0c0b31))
	{
		var_df0c0b31.activated = 1;
		foreach(var_ea0ed69c in level.var_ac22a760)
		{
			if(var_ea0ed69c.target == var_df0c0b31.targetname)
			{
				level clientfield::set("tile_id", var_ea0ed69c.id);
			}
		}
		if(isdefined(var_df0c0b31.var_9bdd487c))
		{
			var_62567791 = getent(var_df0c0b31.var_9bdd487c.target, "targetname");
			if(isdefined(var_62567791))
			{
				var_62567791 clientfield::set("fogofwarflag", 1);
			}
		}
		var_df0c0b31 thread function_fcf7c9c8();
	}
}

/*
	Name: function_fcf7c9c8
	Namespace: namespace_d0ab5955
	Checksum: 0xA213AE87
	Offset: 0xC70
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fcf7c9c8()
{
	self endon(#"death");
	move_origin = self.origin + (vectorscale((0, 0, -1), 20000));
	self moveto(move_origin, 3);
	wait(5);
	self delete();
}

/*
	Name: function_3824d2dc
	Namespace: namespace_d0ab5955
	Checksum: 0x873AE308
	Offset: 0xCE8
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function function_3824d2dc(v_loc)
{
	if(!isdefined(v_loc))
	{
		v_loc = self.origin;
	}
	foreach(var_df0c0b31 in level.var_3814eac9)
	{
		if(!is_true(var_df0c0b31.activated))
		{
			continue;
		}
		if(var_df0c0b31 istouching(v_loc))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_dc15ad60
	Namespace: namespace_d0ab5955
	Checksum: 0xF91CC5BD
	Offset: 0xDC8
	Size: 0x6D2
	Parameters: 0
	Flags: Linked
*/
function function_dc15ad60()
{
	level endoncallback(&cleanup_feedback, #"game_ended");
	level flag::wait_till_clear(#"hash_4930756571725d11");
	while(true)
	{
		if(is_true(level.var_973f0101))
		{
			break;
		}
		waitframe(1);
	}
	var_39106ebf = [];
	var_f4d9a132 = gettime() + (int(1 * 1000));
	var_549429b9 = int(3.333333 * 1000);
	var_3c43f4e0 = var_549429b9 * 2;
	var_10e74788 = 10;
	var_69a1706b = int(var_10e74788 / 3);
	var_2df437f5 = 0;
	for(i = 1; i <= var_69a1706b; i++)
	{
		var_2df437f5 = var_2df437f5 + (var_69a1706b * i);
	}
	while(true)
	{
		time = gettime();
		dodamage = time >= var_f4d9a132;
		var_6effa129 = arraycombine(getplayers(), getvehiclearray());
		foreach(entity in var_6effa129)
		{
			if(!isdefined(entity.var_6a2e2f41))
			{
				entity.var_6a2e2f41 = gettime();
			}
			if(isplayer(entity) && (!isalive(entity) || entity scene::is_igc_active()))
			{
				entity clientfield::set("outsidetile", 0);
				entity hide_effects();
				continue;
			}
			if(!entity function_3824d2dc() && !is_true(entity.var_99582f14) && isdefined(entity.maxhealth))
			{
				player = undefined;
				vehicle = undefined;
				if(!isdefined(entity.var_9a1624b5))
				{
					entity.var_9a1624b5 = time;
				}
				elapsed_time = time - entity.var_9a1624b5;
				if(elapsed_time < var_549429b9)
				{
					intensity = 1;
				}
				else
				{
					if(elapsed_time < var_3c43f4e0)
					{
						intensity = 2;
					}
					else
					{
						intensity = 3;
					}
				}
				var_727ff533 = entity.maxhealth / var_2df437f5;
				var_9d778583 = int(var_727ff533 * intensity);
				if(isplayer(entity))
				{
					entity clientfield::set("outsidetile", 1);
					entity show_effects(intensity);
					player = entity;
				}
				if(dodamage)
				{
					if(isdefined(player))
					{
						player dodamage(var_9d778583, player.origin, undefined, undefined, undefined, "MOD_TRIGGER_HURT", 8192);
						player playsoundtoplayer(#"hash_11f49f9aedeeff5e", player);
						if(time >= player.var_6a2e2f41)
						{
							player thread globallogic_audio::play_taacom_dialog("fogOfWarTrappedPlayer");
							player.var_6a2e2f41 = time + (int(240 * 1000));
						}
					}
					else if(isvehicle(entity))
					{
						vehicle = entity;
						if(!is_false(vehicle.allowdeath) && var_9d778583 >= vehicle.health)
						{
							occupants = vehicle getvehoccupants();
							foreach(occupant in occupants)
							{
								occupant unlink();
							}
						}
						vehicle dodamage(var_9d778583, vehicle.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE", 8192);
					}
				}
				continue;
			}
			if(isplayer(entity))
			{
				entity clientfield::set("outsidetile", 0);
				entity hide_effects();
			}
			entity.var_9a1624b5 = undefined;
		}
		if(dodamage)
		{
			var_f4d9a132 = gettime() + (int(1 * 1000));
		}
		waitframe(1);
	}
}

/*
	Name: cleanup_feedback
	Namespace: namespace_d0ab5955
	Checksum: 0xD92942F9
	Offset: 0x14A8
	Size: 0x98
	Parameters: 1
	Flags: Linked, Private
*/
function private cleanup_feedback(notifyhash)
{
	foreach(player in getplayers())
	{
		player hide_effects();
	}
}

/*
	Name: show_effects
	Namespace: namespace_d0ab5955
	Checksum: 0xA2C8E5BF
	Offset: 0x1548
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function show_effects(intensity)
{
	if(self clientfield::get_to_player("fogofwareffects") == 0 && !self isinmovemode("ufo", "noclip"))
	{
		self clientfield::set_to_player("fogofwartimer", 1);
	}
	self clientfield::set_to_player("fogofwareffects", 2);
}

/*
	Name: hide_effects
	Namespace: namespace_d0ab5955
	Checksum: 0x491155B6
	Offset: 0x15F0
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function hide_effects()
{
	if(self clientfield::get_to_player("fogofwareffects") != 0)
	{
		self clientfield::set_to_player("fogofwartimer", 0);
	}
	self clientfield::set_to_player("fogofwareffects", 0);
}

