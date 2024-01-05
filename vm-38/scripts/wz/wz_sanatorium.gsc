#using script_72d96920f15049b8;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace wz_sanatorium;

/*
	Name: function_21186566
	Namespace: wz_sanatorium
	Checksum: 0xECA6148F
	Offset: 0x328
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_21186566()
{
	level notify(153628655);
}

/*
	Name: function_6a8a6c0e
	Namespace: wz_sanatorium
	Checksum: 0x105BA48D
	Offset: 0x348
	Size: 0x84
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_6a8a6c0e()
{
	gametype = getdvarstring(#"g_gametype");
	if(gametype != "zsurvival")
	{
		setgametypesetting(#"hash_21ac269b4a3e7e37", 0);
		setgametypesetting(#"hash_7fc70ca67b167d76", 0);
	}
}

/*
	Name: main
	Namespace: wz_sanatorium
	Checksum: 0x6545C821
	Offset: 0x3D8
	Size: 0x194
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	/#
		callback::on_vehicle_spawned(&debug_vehicle_spawn);
	#/
	load::main();
	level.var_e1206a08 = 1;
	scene::function_497689f6(#"hash_1b604bdf7a53d705", "hpc_intro_air_transport", "tag_probe_attach", "probe_hpc_intro_hero_plane");
	scene::function_497689f6(#"cin_hpc_outro", "helicopter", "tag_probe_cabin", "prb_tn_us_heli_lg_cabin");
	scene::function_497689f6(#"cin_hpc_outro", "helicopter", "tag_probe_cockpit", "prb_tn_us_heli_lg_cockpit");
	function_a387f4f5();
	compass::setupminimap("");
	level.var_29cfe9dd = 1;
	if(util::get_game_type() === #"zsurvival")
	{
		level util::set_lighting_state(1);
	}
	function_564698fd();
	function_e8fa58f2();
}

/*
	Name: function_e8fa58f2
	Namespace: wz_sanatorium
	Checksum: 0x1587AA39
	Offset: 0x578
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function function_e8fa58f2()
{
	hidemiscmodels("sv_holdout_aetherfungus");
	hidemiscmodels("defend_corpses_1");
	hidemiscmodels("defend_corpses_2");
	hidemiscmodels("defend_corpses_3");
	hidemiscmodels("hvt_mechz_corpses");
	hidemiscmodels("hvt_raz_corpses");
	hidemiscmodels("hvt_steiner_corpses");
	hidemiscmodels("payload_teleport_corpses");
	hidemiscmodels("payload_noteleport_corpses");
	hidemiscmodels("retrieval_corpses");
	hidemiscmodels("secure_corpses");
	hidemiscmodels("hordehunt_corpses_1");
	hidemiscmodels("hordehunt_corpses_2");
	hidemiscmodels("hordehunt_corpses_3");
	hidemiscmodels("fishing_setup");
	hidemiscmodels("end_of_level_corpses");
	hidemiscmodels("mq4_choppercrash");
}

/*
	Name: function_564698fd
	Namespace: wz_sanatorium
	Checksum: 0x3D337A73
	Offset: 0x720
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_564698fd()
{
	gametype = function_be90acca(util::get_game_type());
	if(gametype === "zsurvival")
	{
		level.var_29cfe9dd = 0;
		level.mapcenter = (-4614.75, -20113.8, -884.397);
		namespace_e8c18978::function_d887d24d("chopper_gunner_vol_sanatorium_1");
		namespace_e8c18978::function_d887d24d("chopper_gunner_vol_sanatorium_2");
	}
}

/*
	Name: function_a387f4f5
	Namespace: wz_sanatorium
	Checksum: 0x4BC8DE50
	Offset: 0x7D8
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function function_a387f4f5()
{
	if(level.basegametype == #"fireteam_dirty_bomb" || level.basegametype == #"hash_2a8c6a2ad775902a" || level.basegametype == #"fireteam_koth")
	{
		/#
			level thread function_f9492b33();
		#/
		if(isdefined(level.var_574cc797))
		{
			level thread [[level.var_574cc797]](#"hash_67492346597ba3f2", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_49fe7c02fa7110b2", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_611c237e8680eddb", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_64c2073e77d0bb83", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_59e1a2689fd7c290", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_4b757b29cc4c3712", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_5ceed4cd33f4824a", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_1cec1fe807ac83f5", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_7bf3ae47cb2f9cd6", level.var_b9f31e66);
		}
	}
}

/*
	Name: debug_vehicle_spawn
	Namespace: wz_sanatorium
	Checksum: 0xD6D04AE3
	Offset: 0x9D8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function debug_vehicle_spawn()
{
	/#
		self thread function_f42944c7();
	#/
}

/*
	Name: function_f42944c7
	Namespace: wz_sanatorium
	Checksum: 0xDA9EEFF9
	Offset: 0xA00
	Size: 0x41E
	Parameters: 0
	Flags: None
*/
function function_f42944c7()
{
	/#
		if(!getdvarint(#"hash_57a9b32c8a8503f1", 0) || !self function_1221d304())
		{
			return;
		}
		self endon(#"death");
		if(!isdefined(level.var_6eef6733))
		{
			level.var_6eef6733 = [];
		}
		if(!isdefined(level.var_6eef6733[function_9e72a96(self.vehicletype)]))
		{
			level.var_6eef6733[function_9e72a96(self.vehicletype)] = [];
		}
		if(!isdefined(level.var_6eef6733[function_9e72a96(self.vehicletype)]))
		{
			level.var_6eef6733[function_9e72a96(self.vehicletype)] = [];
		}
		else if(!isarray(level.var_6eef6733[function_9e72a96(self.vehicletype)]))
		{
			level.var_6eef6733[function_9e72a96(self.vehicletype)] = array(level.var_6eef6733[function_9e72a96(self.vehicletype)]);
		}
		level.var_6eef6733[function_9e72a96(self.vehicletype)][level.var_6eef6733[function_9e72a96(self.vehicletype)].size] = self;
		v_spawn_pos = self.origin;
		level thread function_f567f0cd();
		level flag::wait_till("");
		str_type = function_9e72a96(self.vehicletype);
		v_color = self function_b2775b52();
		while(getdvarint(#"hash_57a9b32c8a8503f1", 0))
		{
			var_91d1913b = distance2d(level.players[0].origin, self.origin);
			n_radius = 0.015 * var_91d1913b;
			if(n_radius > 768)
			{
				n_radius = 768;
			}
			if(var_91d1913b > 768)
			{
				sphere(self.origin, n_radius, v_color);
				if(var_91d1913b < 2048)
				{
					print3d(self.origin + (0, 0, 32), str_type, v_color);
				}
			}
			if(getdvarint(#"hash_491fd7f96bbc8909", 0) && distance2d(v_spawn_pos, self.origin) > 768)
			{
				line(v_spawn_pos, self.origin, v_color);
				circle(v_spawn_pos, 64, v_color, 0, 1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_f567f0cd
	Namespace: wz_sanatorium
	Checksum: 0x1D62DCE1
	Offset: 0xE28
	Size: 0x276
	Parameters: 0
	Flags: None
*/
function function_f567f0cd()
{
	/#
		level notify(#"hash_79845fe0e187bb22");
		level endon(#"hash_79845fe0e187bb22");
		while(getdvarint(#"hash_57a9b32c8a8503f1", 0))
		{
			n_total = 0;
			var_bd9acc19 = 176;
			foreach(var_f0ffe8b2 in level.var_6eef6733)
			{
				var_bd9acc19 = var_bd9acc19 + 24;
				n_total = n_total + var_f0ffe8b2.size;
				foreach(var_3ed342fe in var_f0ffe8b2)
				{
					if(isvehicle(var_3ed342fe) && isdefined(var_f0ffe8b2) && isdefined(var_f0ffe8b2[0]) && isdefined(var_f0ffe8b2[0].vehicletype))
					{
						debug2dtext((810, var_bd9acc19, 0), (function_9e72a96(var_f0ffe8b2[0].vehicletype) + "") + var_f0ffe8b2.size, var_3ed342fe function_b2775b52());
						break;
					}
				}
			}
			debug2dtext((810, 176, 0), "" + n_total, (1, 1, 1));
			waitframe(1);
		}
	#/
}

/*
	Name: function_1221d304
	Namespace: wz_sanatorium
	Checksum: 0xEED731F3
	Offset: 0x10A8
	Size: 0x1DC
	Parameters: 0
	Flags: None
*/
function function_1221d304()
{
	/#
		a_str_types = array(#"hash_232aa3a4e81249c6", #"hash_232abda4e81275f4", #"hash_7acdf9a4d20bca08", #"hash_2f8d60a5381870ee", #"hash_1d6e04a52d9a5fe2", #"veh_mil_ru_fav_heavy", #"vehicle_t9_mil_fav_light", #"hash_42b91f3544c1a9e1", #"hash_6595f5efe62a4ec", #"hash_17e868e0ebf3c1d6", #"vehicle_motorcycle_mil_us_offroad", #"hash_2c0e11a1e87bbcd5", #"vehicle_t9_mil_snowmobile", #"hash_28d512b739c9d9c1", #"hash_2d32c08b862baa46", #"vehicle_t9_mil_ru_truck_light_player", #"hash_2a245bf3738fed8b", #"hash_985b7e40ee02aa2", #"hash_dd63f34c77a725e");
		foreach(str_type in a_str_types)
		{
			if(self.vehicletype == str_type)
			{
				return true;
			}
		}
		return false;
	#/
}

/*
	Name: function_b2775b52
	Namespace: wz_sanatorium
	Checksum: 0xA434E89
	Offset: 0x1290
	Size: 0x1CA
	Parameters: 0
	Flags: None
*/
function function_b2775b52()
{
	/#
		switch(self.vehicletype)
		{
			case "hash_6595f5efe62a4ec":
			{
				return (1, 0, 0);
			}
			case "hash_17e868e0ebf3c1d6":
			{
				return (1, 0, 0);
			}
			case "hash_2c0e11a1e87bbcd5":
			{
				return (1, 0, 0);
			}
			case "hash_dd63f34c77a725e":
			case "hash_2a245bf3738fed8b":
			{
				return (1, 1, 1);
			}
			case "veh_mil_ru_fav_heavy":
			{
				return (1, 0.5, 0);
			}
			case "hash_28d512b739c9d9c1":
			{
				return (1, 1, 0);
			}
			case "vehicle_t9_mil_fav_light":
			{
				return (0, 1, 0);
			}
			case "hash_42b91f3544c1a9e1":
			{
				return (0, 1, 1);
			}
			case "hash_985b7e40ee02aa2":
			case "hash_2d32c08b862baa46":
			case "vehicle_t9_mil_ru_truck_light_player":
			{
				return (0, 1, 1);
			}
			case "vehicle_t9_mil_snowmobile":
			{
				return (0, 0, 1);
			}
			case "vehicle_motorcycle_mil_us_offroad":
			{
				return (1, 0, 1);
			}
			case "hash_1d6e04a52d9a5fe2":
			case "hash_232aa3a4e81249c6":
			case "hash_232abda4e81275f4":
			case "hash_2f8d60a5381870ee":
			case "hash_7acdf9a4d20bca08":
			{
				return (1, 0, 1);
			}
			default:
			{
				return (0, 0, 0);
			}
		}
	#/
}

/*
	Name: function_f9492b33
	Namespace: wz_sanatorium
	Checksum: 0xA7489061
	Offset: 0x1468
	Size: 0x1DC
	Parameters: 0
	Flags: None
*/
function function_f9492b33()
{
	/#
		if(!getdvarint(#"hash_31ae3e289b7b921d", 0))
		{
			return;
		}
		level flag::wait_till("");
		if(!isdefined(level.var_ef77c3e3))
		{
			return;
		}
		while(getdvarint(#"hash_31ae3e289b7b921d", 0))
		{
			var_ef77c3e3 = arraysortclosest(level.var_ef77c3e3, level.players[0].origin, 32, 0, 100000);
			foreach(var_b12e89cf in var_ef77c3e3)
			{
				waitframe(1);
				if(!level.players[0] util::is_player_looking_at(var_b12e89cf.origin, 0.6, 0))
				{
					continue;
				}
				sphere(var_b12e89cf.origin, 32, (1, 1, 0), 1, 0, 8, 2);
				circle(var_b12e89cf.origin, 96, (1, 1, 0), 0, 1, 2);
			}
		}
	#/
}

/*
	Name: function_d72aa67e
	Namespace: wz_sanatorium
	Checksum: 0x6C000202
	Offset: 0x1650
	Size: 0xBC
	Parameters: 2
	Flags: None
*/
function function_d72aa67e(str_list, str_name)
{
	/#
		a_str_tok = strtok(str_list, "");
		foreach(tok in a_str_tok)
		{
			if(tok == str_name)
			{
				return true;
			}
		}
		return false;
	#/
}

/*
	Name: function_47351fa3
	Namespace: wz_sanatorium
	Checksum: 0xFF10063B
	Offset: 0x1718
	Size: 0x314
	Parameters: 4
	Flags: None
*/
function function_47351fa3(org, ang, opcolor, frames)
{
	/#
		if(!isdefined(frames))
		{
			frames = 1;
		}
		forward = anglestoforward(ang);
		forwardfar = vectorscale(forward, 50);
		forwardclose = vectorscale(forward, 50 * 0.8);
		right = anglestoright(ang);
		left = anglestoright(ang) * -1;
		leftdraw = vectorscale(right, 50 * -0.2);
		rightdraw = vectorscale(right, 50 * 0.2);
		up = anglestoup(ang);
		right = vectorscale(right, 50);
		left = vectorscale(left, 50);
		up = vectorscale(up, 50);
		red = (0.9, 0.2, 0.2);
		green = (0.2, 0.9, 0.2);
		blue = (0.2, 0.2, 0.9);
		if(isdefined(opcolor))
		{
			red = opcolor;
			green = opcolor;
			blue = opcolor;
		}
		line(org, org + forwardfar, red, 0.9, 0, frames);
		line(org + forwardfar, (org + forwardclose) + rightdraw, red, 0.9, 0, frames);
		line(org + forwardfar, (org + forwardclose) + leftdraw, red, 0.9, 0, frames);
		line(org, org + right, blue, 0.9, 0, frames);
		line(org, org + left, blue, 0.9, 0, frames);
		line(org, org + up, green, 0.9, 0, frames);
	#/
}

