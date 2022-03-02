#using script_44b0b8420eabacad;
#using script_71b06ed1c867d409;
#using script_72d96920f15049b8;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_f7c36b8c;

/*
	Name: function_7b120f20
	Namespace: namespace_f7c36b8c
	Checksum: 0xC005A87A
	Offset: 0x330
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7b120f20()
{
	level notify(535879531);
}

/*
	Name: main
	Namespace: namespace_f7c36b8c
	Checksum: 0xCFA290FE
	Offset: 0x350
	Size: 0x1B4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	/#
		callback::on_vehicle_spawned(&debug_vehicle_spawn);
	#/
	function_24198689();
	load::main();
	scene::function_497689f6(#"cin_hpc_intro", "hpc_intro_air_transport", "tag_probe_attach", "probe_hpc_intro_hero_plane");
	scene::function_497689f6(#"hash_1b604bdf7a53d705", "hpc_intro_air_transport", "tag_probe_attach", "probe_hpc_intro_hero_plane");
	scene::function_497689f6(#"cin_hpc_outro", "helicopter", "tag_probe_cabin", "prb_tn_us_heli_lg_cabin");
	scene::function_497689f6(#"cin_hpc_outro", "helicopter", "tag_probe_cockpit", "prb_tn_us_heli_lg_cockpit");
	/#
		level thread function_f9492b33();
	#/
	level.var_29cfe9dd = 1;
	level.var_5915ecb1 = 0.8;
	function_a387f4f5();
	compass::setupminimap("");
	function_e8fa58f2();
	function_564698fd();
}

/*
	Name: function_e8fa58f2
	Namespace: namespace_f7c36b8c
	Checksum: 0x89114FB6
	Offset: 0x510
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
	Namespace: namespace_f7c36b8c
	Checksum: 0x4FC9EF37
	Offset: 0x670
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_564698fd()
{
	gametype = function_be90acca(util::function_5df4294());
	if(gametype === "zsurvival")
	{
		namespace_e8c18978::function_d887d24d("chopper_gunner_vol_ski_1");
		namespace_e8c18978::function_d887d24d("chopper_gunner_vol_ski_2");
	}
}

/*
	Name: function_24198689
	Namespace: namespace_f7c36b8c
	Checksum: 0x8969F31
	Offset: 0x6F8
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_24198689()
{
	var_780f74b5 = [];
	var_780f74b5[var_780f74b5.size] = "mp_spawn_point";
	var_780f74b5[var_780f74b5.size] = "mp_spawn_point_axis";
	var_780f74b5[var_780f74b5.size] = "mp_spawn_point_allies";
	spawning::move_spawn_point(var_780f74b5, (-14375, 7368, 2895), (-15161, 7976, 2961), vectorscale((0, -1, 0), 44.1925));
}

/*
	Name: function_a387f4f5
	Namespace: namespace_f7c36b8c
	Checksum: 0xFEB8F96B
	Offset: 0x790
	Size: 0x15C
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
			level thread [[level.var_574cc797]](#"hash_2f424b258bc4ee0a", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_d0568ca69595ebc", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_c5e49e2c17ccd72", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_b30fa0cf372ca03", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_49fe7c02fa7110b2", level.var_b9f31e66);
			level thread [[level.var_574cc797]](#"hash_448fb59468f176f9", level.var_b9f31e66);
		}
	}
}

/*
	Name: debug_vehicle_spawn
	Namespace: namespace_f7c36b8c
	Checksum: 0x798FF277
	Offset: 0x8F8
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
	Namespace: namespace_f7c36b8c
	Checksum: 0xC67CE07D
	Offset: 0x920
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
	Namespace: namespace_f7c36b8c
	Checksum: 0x22386384
	Offset: 0xD48
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
	Namespace: namespace_f7c36b8c
	Checksum: 0x493CEFBF
	Offset: 0xFC8
	Size: 0x1DC
	Parameters: 0
	Flags: None
*/
function function_1221d304()
{
	/#
		a_str_types = array(#"hash_232aa3a4e81249c6", #"hash_232abda4e81275f4", #"hash_7acdf9a4d20bca08", #"hash_2f8d60a5381870ee", #"hash_1d6e04a52d9a5fe2", #"veh_mil_ru_fav_heavy", #"hash_46d0326fb76bfd27", #"hash_42b91f3544c1a9e1", #"hash_6595f5efe62a4ec", #"hash_17e868e0ebf3c1d6", #"hash_436750a1a570f979", #"hash_2c0e11a1e87bbcd5", #"hash_12ad457321efba0e", #"hash_28d512b739c9d9c1", #"hash_2d32c08b862baa46", #"hash_45c09cd48bdd16a7", #"hash_2a245bf3738fed8b", #"hash_73bce22eba22d23c", #"hash_dd63f34c77a725e");
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
	Namespace: namespace_f7c36b8c
	Checksum: 0xACBF4901
	Offset: 0x11B0
	Size: 0x21A
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
			case "hash_1454b1a4e3718153":
			case "hash_2a6d38455e5f8c2b":
			case "hash_5dcbfaf19cd0a753":
			case "hash_6c44467350659f2b":
			{
				return (1, 0, 0);
			}
			case "hash_9bcbedbfbfe7661":
			case "hash_51c4f4dc2591b475":
			case "hash_75de611a4a0353f5":
			case "hash_7ce4c7dc3df1418e":
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
			case "hash_46d0326fb76bfd27":
			{
				return (0, 1, 0);
			}
			case "hash_42b91f3544c1a9e1":
			{
				return (0, 1, 1);
			}
			case "hash_2d32c08b862baa46":
			case "hash_45c09cd48bdd16a7":
			case "hash_73bce22eba22d23c":
			{
				return (0, 1, 1);
			}
			case "hash_12ad457321efba0e":
			{
				return (0, 0, 1);
			}
			case "hash_436750a1a570f979":
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
	Namespace: namespace_f7c36b8c
	Checksum: 0xD907AD5A
	Offset: 0x13D8
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
	Namespace: namespace_f7c36b8c
	Checksum: 0x1D4AF4A1
	Offset: 0x15C0
	Size: 0xBC
	Parameters: 2
	Flags: None
*/
function function_d72aa67e(str_list, str_name)
{
	/#
		var_be4c7921 = strtok(str_list, "");
		foreach(tok in var_be4c7921)
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
	Namespace: namespace_f7c36b8c
	Checksum: 0xEE0B33F8
	Offset: 0x1688
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

