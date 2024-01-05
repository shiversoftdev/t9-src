#using script_72d96920f15049b8;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace wz_golova;

/*
	Name: function_7159bc3f
	Namespace: wz_golova
	Checksum: 0x840529E1
	Offset: 0x2E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7159bc3f()
{
	level notify(2116956464);
}

/*
	Name: main
	Namespace: wz_golova
	Checksum: 0xA4E9B5FF
	Offset: 0x300
	Size: 0x16C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	/#
		callback::on_vehicle_spawned(&debug_vehicle_spawn);
	#/
	load::main();
	function_a387f4f5();
	scene::function_497689f6(#"cin_hpc_intro", "hpc_intro_air_transport", "tag_probe_attach", "probe_hpc_intro_hero_plane");
	scene::function_497689f6(#"hash_1b604bdf7a53d705", "hpc_intro_air_transport", "tag_probe_attach", "probe_hpc_intro_hero_plane");
	scene::function_497689f6(#"cin_hpc_outro", "helicopter", "tag_probe_cabin", "prb_tn_us_heli_lg_cabin");
	scene::function_497689f6(#"cin_hpc_outro", "helicopter", "tag_probe_cockpit", "prb_tn_us_heli_lg_cockpit");
	compass::setupminimap("");
	function_e8fa58f2();
	function_564698fd();
}

/*
	Name: function_e8fa58f2
	Namespace: wz_golova
	Checksum: 0x53CE71E6
	Offset: 0x478
	Size: 0x154
	Parameters: 0
	Flags: None
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
}

/*
	Name: function_564698fd
	Namespace: wz_golova
	Checksum: 0x46CA2C87
	Offset: 0x5D8
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function function_564698fd()
{
	gametype = function_be90acca(util::get_game_type());
	if(gametype === "zsurvival")
	{
		level.mapcenter = (-9863.87, 9707.61, 257.607);
		namespace_e8c18978::function_d887d24d("chopper_gunner_vol_golova_1");
		namespace_e8c18978::function_d887d24d("chopper_gunner_vol_golova_2");
	}
}

/*
	Name: function_a387f4f5
	Namespace: wz_golova
	Checksum: 0xAFE9B59
	Offset: 0x680
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_a387f4f5()
{
	if(level.basegametype == #"fireteam_dirty_bomb" || level.basegametype == #"hash_2a8c6a2ad775902a")
	{
		/#
			level thread function_f9492b33();
		#/
		if(isdefined(level.var_574cc797))
		{
			level thread [[level.var_574cc797]](#"hash_5a88477bbf0736f1", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_1c4eccf00713d9c7", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_d5c723294842e7c", level.var_b9f31e66);
		}
	}
}

/*
	Name: debug_vehicle_spawn
	Namespace: wz_golova
	Checksum: 0xED5AA2EC
	Offset: 0x770
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
	Namespace: wz_golova
	Checksum: 0xEB1BD53C
	Offset: 0x798
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
	Namespace: wz_golova
	Checksum: 0x7B0A7B57
	Offset: 0xBC0
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
	Namespace: wz_golova
	Checksum: 0xA2BA1F13
	Offset: 0xE40
	Size: 0x1DC
	Parameters: 0
	Flags: None
*/
function function_1221d304()
{
	/#
		a_str_types = array(#"hash_232aa3a4e81249c6", #"hash_232abda4e81275f4", #"hash_7acdf9a4d20bca08", #"hash_2f8d60a5381870ee", #"hash_1d6e04a52d9a5fe2", #"veh_mil_ru_fav_heavy", #"vehicle_t9_mil_fav_light", #"hash_42b91f3544c1a9e1", #"hash_6595f5efe62a4ec", #"hash_17e868e0ebf3c1d6", #"vehicle_motorcycle_mil_us_offroad", #"hash_2c0e11a1e87bbcd5", #"vehicle_t9_mil_snowmobile", #"hash_28d512b739c9d9c1", #"hash_2d32c08b862baa46", #"vehicle_t9_mil_ru_truck_light_player", #"hash_2a245bf3738fed8b", #"vehicle_t9_civ_ru_sedan_80s_player", #"hash_dd63f34c77a725e");
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
	Namespace: wz_golova
	Checksum: 0xDA56DF69
	Offset: 0x1028
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
			case "hash_2d32c08b862baa46":
			case "vehicle_t9_mil_ru_truck_light_player":
			case "vehicle_t9_civ_ru_sedan_80s_player":
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
	Namespace: wz_golova
	Checksum: 0x940912D9
	Offset: 0x1200
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
	Namespace: wz_golova
	Checksum: 0xC4D971AE
	Offset: 0x13E8
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
	Namespace: wz_golova
	Checksum: 0xA0183EA0
	Offset: 0x14B0
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

