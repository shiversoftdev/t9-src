#using script_340a2e805e35f7a2;
#using script_4108035fe400ce67;
#using script_471b31bd963b388e;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_b56b91cb;

/*
	Name: function_7e456f76
	Namespace: namespace_b56b91cb
	Checksum: 0x98C6CDE8
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7e456f76()
{
	level notify(1248531876);
}

/*
	Name: function_89f2df9
	Namespace: namespace_b56b91cb
	Checksum: 0x57847AC1
	Offset: 0xC8
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_637836cd1d98abbd", &function_70a657d8, &function_8ac3bea9, undefined, #"item_world");
}

/*
	Name: function_70a657d8
	Namespace: namespace_b56b91cb
	Checksum: 0x264680AB
	Offset: 0x128
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_ad5a0cd6::use_item_spawns())
	{
		return;
	}
	gametype = util::function_5df4294();
	if(gametype == #"zsurvival")
	{
		return;
	}
	/#
		level thread function_13c803de();
	#/
	/#
		level thread function_44b9dd1d();
	#/
	/#
		level thread function_cdd9b388();
	#/
	/#
		level thread function_91ef342();
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_b56b91cb
	Checksum: 0xD6F20AB
	Offset: 0x1E8
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	gametype = util::function_5df4294();
	if(gametype == #"zsurvival")
	{
		return;
	}
	/#
		level thread function_9cc59537();
	#/
}

/*
	Name: function_13d7bba
	Namespace: namespace_b56b91cb
	Checksum: 0x8702F2E8
	Offset: 0x248
	Size: 0xA2
	Parameters: 2
	Flags: Private
*/
function private function_13d7bba(xoffset, yoffset)
{
	/#
		elem = newdebughudelem();
		elem.alignx = "";
		elem.horzalign = "";
		elem.x = xoffset + 0;
		elem.y = yoffset;
		elem.fontscale = 1;
		elem.color = (1, 1, 1);
		elem.fontstyle3d = "";
		return elem;
	#/
}

/*
	Name: function_11421106
	Namespace: namespace_b56b91cb
	Checksum: 0x1FE2E4E2
	Offset: 0x2F8
	Size: 0x324
	Parameters: 2
	Flags: Private
*/
function private function_11421106(typestring, type)
{
	/#
		tab = "";
		loc_00000358:
		loc_0000038C:
		loc_00000414:
		loc_00000448:
		loc_000004D4:
		loc_00000508:
		loc_00000594:
		return ((((((((((((((typestring + "") + (isdefined(level.var_efeab371[type]) ? level.var_efeab371[type] : 0) + "") + (int((isdefined(level.var_efeab371[type]) ? level.var_efeab371[type] : 0) / int(max(level.var_66e56764, 1)) * 100)) + "") + tab) + "") + (isdefined(level.var_d80c35aa[type]) ? level.var_d80c35aa[type] : 0) + "") + (int((isdefined(level.var_d80c35aa[type]) ? level.var_d80c35aa[type] : 0) / int(max(level.var_136445c0, 1)) * 100)) + "") + tab) + "") + (isdefined(level.var_8d9ad8e8[type]) ? level.var_8d9ad8e8[type] : 0) + "") + (int((isdefined(level.var_8d9ad8e8[type]) ? level.var_8d9ad8e8[type] : 0) / int(max(level.var_5720c09a, 1)) * 100)) + "") + tab) + "") + (isdefined(level.var_ecf16fd3[type]) ? level.var_ecf16fd3[type] : 0) + "") + (int((isdefined(level.var_ecf16fd3[type]) ? level.var_ecf16fd3[type] : 0) / int(max(level.var_2850ef5, 1)) * 100)) + "";
	#/
}

/*
	Name: function_bebe535
	Namespace: namespace_b56b91cb
	Checksum: 0x3AAFC3C1
	Offset: 0x628
	Size: 0x224
	Parameters: 0
	Flags: Private
*/
function private function_bebe535()
{
	/#
		n_total = 0;
		var_9243cc66 = 0;
		foreach(list in level.var_2e96a450)
		{
			var_98ed4e60 = function_9e72a96(i);
			println((var_98ed4e60 + "") + list);
			n_total = n_total + list;
			a_tokens = strtok(var_98ed4e60, "");
			foreach(token in a_tokens)
			{
				if(token === "" || token === "")
				{
					var_9243cc66 = var_9243cc66 + list;
					break;
				}
			}
		}
		if(isdefined(level.var_2e96a450[#"hash_4d4893453c660a3d"]))
		{
			var_9243cc66 = var_9243cc66 - level.var_2e96a450[#"hash_4d4893453c660a3d"];
		}
		println("" + n_total);
		println("" + var_9243cc66);
	#/
}

/*
	Name: function_2248268e
	Namespace: namespace_b56b91cb
	Checksum: 0x82429AA5
	Offset: 0x858
	Size: 0xB8
	Parameters: 0
	Flags: Private
*/
function private function_2248268e()
{
	/#
		vehicles = getvehiclearray();
		foreach(vehicle in vehicles)
		{
			if(isdefined(vehicle.scriptvehicletype))
			{
				println(vehicle.scriptvehicletype);
			}
		}
	#/
}

/*
	Name: function_99216e10
	Namespace: namespace_b56b91cb
	Checksum: 0xC561FFD
	Offset: 0x918
	Size: 0xD0
	Parameters: 1
	Flags: Private
*/
function private function_99216e10(mapname)
{
	/#
		if(mapname === "")
		{
			world_items = [12:"", 11:"", 10:"", 9:"", 8:"", 7:"", 6:"", 5:"", 4:"", 3:"", 2:"", 1:"", 0:""];
			return world_items;
		}
	#/
}

/*
	Name: function_10b50848
	Namespace: namespace_b56b91cb
	Checksum: 0x8C68FCB8
	Offset: 0x9F0
	Size: 0x4EC
	Parameters: 0
	Flags: Private
*/
function private function_10b50848()
{
	/#
		self notify("");
		self endon("");
		file = openfile("", "");
		if(file == -1)
		{
			iprintlnbold("");
			return;
		}
		println("");
		mapname = util::function_53bbf9d2();
		world_items = function_99216e10(mapname);
		count = 0;
		item_count = 0;
		while(count < world_items.size)
		{
			itemlist = function_91b29d2a(world_items[count]);
			foreach(item in itemlist)
			{
				var_5819b8d4 = item_world::function_2e3efdda(item.origin, undefined, 1, 1, -1, 1);
				if(var_5819b8d4.size > 0)
				{
					type = "";
					if(isdefined(var_5819b8d4[0].var_a6762160) && isdefined(var_5819b8d4[0].var_a6762160.itemtype))
					{
						switch(var_5819b8d4[0].var_a6762160.itemtype)
						{
							case "hash_910bf9605abbcea":
							{
								type = "";
								break;
							}
							case "hash_3a094c949a87214d":
							{
								type = "";
								break;
							}
							case "hash_576593319dc02d70":
							{
								type = "";
								break;
							}
							case "hash_fc797c2a8f4d208":
							{
								type = "";
								break;
							}
							case "hash_70823406977e7c34":
							{
								type = "";
								break;
							}
							case "hash_7064fc95aa1c1bbe":
							{
								type = "";
								break;
							}
							case "armor":
							{
								type = "";
								break;
							}
							case "equipment":
							{
								type = "";
								break;
							}
							case "field_upgrade":
							{
								type = "";
								break;
							}
							case "tactical":
							{
								type = "";
								break;
							}
							case "attachment":
							{
								type = "";
								break;
							}
							case "resource":
							{
								type = "";
								break;
							}
							default:
							{
								type = "";
								break;
							}
						}
					}
					if(isdefined(var_5819b8d4[0].var_a6762160))
					{
						debug_string = ((((((var_5819b8d4[0].var_a6762160.name + "") + function_9e72a96(var_5819b8d4[0].targetname) + "") + var_5819b8d4[0].origin) + "") + type) + "") + var_5819b8d4[0].var_a6762160.rarity;
						fprintln(file, debug_string);
						item_count++;
					}
				}
			}
			count++;
		}
		println(("" + item_count) + "");
		println("");
		closefile(file);
	#/
}

/*
	Name: function_b6ea080
	Namespace: namespace_b56b91cb
	Checksum: 0xB64DB741
	Offset: 0xEE8
	Size: 0x4E4
	Parameters: 0
	Flags: Private
*/
function private function_b6ea080()
{
	/#
		self notify("");
		self endon("");
		file = openfile("", "");
		if(file == -1)
		{
			iprintlnbold("");
			return;
		}
		println("");
		mapname = util::function_53bbf9d2();
		world_items = function_99216e10(mapname);
		count = 0;
		item_count = 0;
		while(count < world_items.size)
		{
			itemlist = function_91b29d2a(world_items[count]);
			foreach(item in itemlist)
			{
				var_5819b8d4 = item_world::function_2e3efdda(item.origin, undefined, 1, 1, -1, 1);
				if(var_5819b8d4.size > 0)
				{
					type = "";
					if(isdefined(var_5819b8d4[0].var_a6762160) && isdefined(var_5819b8d4[0].var_a6762160.itemtype))
					{
						switch(var_5819b8d4[0].var_a6762160.itemtype)
						{
							case "ammo":
							{
								type = "";
								break;
							}
							case "weapon":
							{
								type = "";
								break;
							}
							case "health":
							{
								type = "";
								break;
							}
							case "armor":
							{
								type = "";
								break;
							}
							case "equipment":
							{
								type = "";
								break;
							}
							case "field_upgrade":
							{
								type = "";
								break;
							}
							case "tactical":
							{
								type = "";
								break;
							}
							case "backpack":
							{
								type = "";
								break;
							}
							case "generic":
							{
								type = "";
								break;
							}
							case "cash":
							{
								type = "";
								break;
							}
							case "killstreak":
							{
								type = "";
								break;
							}
							case "attachment":
							{
								type = "";
								break;
							}
							case "resource":
							{
								type = "";
								break;
							}
							default:
							{
								type = "";
								break;
							}
						}
					}
					if(isdefined(var_5819b8d4[0].var_a6762160))
					{
						debug_string = ((((var_5819b8d4[0].var_a6762160.name + "") + function_9e72a96(var_5819b8d4[0].targetname) + "") + var_5819b8d4[0].origin) + "") + type;
						fprintln(file, debug_string);
						item_count++;
					}
				}
			}
			count++;
		}
		println(("" + item_count) + "");
		println("");
		closefile(file);
	#/
}

/*
	Name: function_938d798a
	Namespace: namespace_b56b91cb
	Checksum: 0x99CF2427
	Offset: 0x13D8
	Size: 0x54C
	Parameters: 0
	Flags: Private
*/
function private function_938d798a()
{
	/#
		str_filename = util::function_53bbf9d2() + "";
		file = openfile(str_filename, "");
		if(file == -1)
		{
			iprintlnbold("" + str_filename);
			return;
		}
		freadln(file);
		freadln(file);
		freadln(file);
		freadln(file);
		var_7099d03 = [];
		while(freadln(file) > 0)
		{
			var_6f08946b = fgetarg(file, 0);
			var_dd52f0fe = fgetarg(file, 1);
			var_5e4d7301 = fgetarg(file, 2);
			var_6f08946b = function_ea13f55(var_6f08946b, "", "");
			var_5e4d7301 = function_ea13f55(var_5e4d7301, "", "");
			var_5e4d7301 = function_ea13f55(var_5e4d7301, "", "");
			var_5e4d7301 = function_ea13f55(var_5e4d7301, "", "");
			var_a9682cef = [];
			var_a9682cef[0] = float(var_6f08946b);
			var_a9682cef[1] = float(var_dd52f0fe);
			var_a9682cef[2] = float(var_5e4d7301);
			if(!isdefined(var_7099d03))
			{
				var_7099d03 = [];
			}
			else if(!isarray(var_7099d03))
			{
				var_7099d03 = array(var_7099d03);
			}
			var_7099d03[var_7099d03.size] = var_a9682cef;
		}
		closefile(file);
		player = getplayers()[0];
		while(level.var_938d798a)
		{
			foreach(vec in var_7099d03)
			{
				var_31e25ea2 = (vec[0], vec[1], vec[2]);
				if(distance2d(player.origin, var_31e25ea2) < 8000)
				{
					radius = 128;
					var_84dd2a8b = 4096;
					if(distancesquared(player.origin, var_31e25ea2) < sqr(var_84dd2a8b))
					{
						radius = max((distance(player.origin, var_31e25ea2) / var_84dd2a8b) * radius, 1);
					}
					sphere(var_31e25ea2, radius, (1, 0, 0), 1, 0, 10, 20);
					var_f4b807cb = item_world::function_2e3efdda(var_31e25ea2, undefined, 128, 1);
					item = var_f4b807cb[0];
					if(isdefined(item.targetname))
					{
						print3d(item.origin + vectorscale((0, 0, 1), 32), function_9e72a96(item.targetname), (1, 0, 0), 1, 0.3, 20);
					}
				}
			}
			waitframe(1);
		}
		iprintlnbold("");
	#/
}

/*
	Name: function_f9efe895
	Namespace: namespace_b56b91cb
	Checksum: 0x53BD0F86
	Offset: 0x1930
	Size: 0x334
	Parameters: 0
	Flags: Private
*/
function private function_f9efe895()
{
	/#
		var_7f0b4b6b = [];
		buoy_stash = [];
		var_7f0b4b6b = arraycombine(function_91b29d2a(""), function_91b29d2a(""), 1, 0);
		var_7f0b4b6b = arraycombine(var_7f0b4b6b, function_91b29d2a(""), 1, 0);
		var_7f0b4b6b = arraycombine(var_7f0b4b6b, function_91b29d2a(""), 1, 0);
		buoy_stash = function_91b29d2a("");
		var_7f0b4b6b = arraycombine(var_7f0b4b6b, buoy_stash, 1, 0);
		player = util::gethostplayer();
		n_index = 0;
		var_d4714efb = 0;
		wait(1);
		iprintlnbold("");
		while(level.var_f9efe895)
		{
			if(player adsbuttonpressed() && player function_78931318(""))
			{
				if(n_index < var_7f0b4b6b.size - 1)
				{
					n_index++;
				}
				else
				{
					n_index = 0;
				}
			}
			else if(player adsbuttonpressed() && player function_78931318(""))
			{
				if(n_index == 0)
				{
					n_index = var_7f0b4b6b.size - 1;
				}
				else
				{
					n_index--;
				}
			}
			if(n_index != var_d4714efb)
			{
				v_player_pos = var_7f0b4b6b[n_index].origin + (anglestoforward(var_7f0b4b6b[n_index].angles) * 96);
				var_543a44a5 = vectortoangles(var_7f0b4b6b[n_index].origin - (v_player_pos + vectorscale((0, 0, 1), 36)));
				player setorigin(v_player_pos);
				player setplayerangles(var_543a44a5);
				var_d4714efb = n_index;
				iprintlnbold("" + n_index);
				wait(0.1);
			}
			waitframe(1);
		}
		iprintlnbold("");
	#/
}

/*
	Name: function_f0d72128
	Namespace: namespace_b56b91cb
	Checksum: 0xF0921D43
	Offset: 0x1C70
	Size: 0x32C
	Parameters: 0
	Flags: Private
*/
function private function_f0d72128()
{
	/#
		var_df1e5fef = [];
		var_df1e5fef = function_91b29d2a("");
		player = util::gethostplayer();
		if(!isdefined(level.var_99026891))
		{
			level.var_99026891 = var_df1e5fef.size - 1;
		}
		var_d4714efb = 0;
		v_offset = vectorscale((0, 0, 1), 50);
		wait(1);
		iprintlnbold("");
		adddebugcommand("");
		while(level.var_f0d72128)
		{
			if(player jumpbuttonpressed() && player function_78931318(""))
			{
				if(level.var_99026891 < var_df1e5fef.size - 1)
				{
					level.var_99026891++;
				}
				else
				{
					level.var_99026891 = 0;
				}
			}
			else if(player jumpbuttonpressed() && player function_78931318(""))
			{
				if(level.var_99026891 == 0)
				{
					level.var_99026891 = var_df1e5fef.size - 1;
				}
				else
				{
					level.var_99026891--;
				}
			}
			if(level.var_99026891 != var_d4714efb)
			{
				debugstar(var_df1e5fef[level.var_99026891].origin, 190, (1, 1, 1));
				v_player_pos = var_df1e5fef[level.var_99026891].origin - (anglestoright(var_df1e5fef[level.var_99026891].angles) * 128);
				var_543a44a5 = vectortoangles(var_df1e5fef[level.var_99026891].origin - v_player_pos);
				v_player_pos = v_player_pos - v_offset;
				player setorigin(v_player_pos);
				player setplayerangles(var_543a44a5);
				var_d4714efb = level.var_99026891;
				iprintlnbold("" + level.var_99026891);
				wait(0.1);
			}
			waitframe(1);
		}
		iprintlnbold("");
	#/
}

/*
	Name: function_78931318
	Namespace: namespace_b56b91cb
	Checksum: 0x98ADDA0A
	Offset: 0x1FA8
	Size: 0x162
	Parameters: 1
	Flags: None
*/
function function_78931318(str_button)
{
	/#
		switch(str_button)
		{
			case "down":
			{
				var_a1798265 = "";
				var_7a00db94 = "";
				break;
			}
			case "left":
			{
				var_a1798265 = "";
				var_7a00db94 = "";
				break;
			}
			case "right":
			{
				var_a1798265 = "";
				var_7a00db94 = "";
				break;
			}
			case "up":
			{
				var_a1798265 = "";
				var_7a00db94 = "";
				break;
			}
		}
		if(isdefined(var_a1798265))
		{
			if(self buttonpressed(var_a1798265) || self buttonpressed(var_7a00db94))
			{
				while(self buttonpressed(var_a1798265) || self buttonpressed(var_7a00db94))
				{
					waitframe(1);
				}
				return true;
			}
		}
		return false;
	#/
}

/*
	Name: function_66b45a31
	Namespace: namespace_b56b91cb
	Checksum: 0x87115B7B
	Offset: 0x2118
	Size: 0x12C0
	Parameters: 1
	Flags: Private
*/
function private function_66b45a31(origin)
{
	/#
		var_cc58c092 = function_91b29d2a(#"hash_776cf27e25f57c7a");
		var_f5196a40 = function_91b29d2a(#"hash_44623cfed77fbb23");
		var_dfebf4da = function_91b29d2a(#"hash_7e0f31597a8a30af");
		heli_spawn = function_91b29d2a(#"heli_spawn");
		var_56c17d74 = function_91b29d2a(#"hash_7f58537ca200b519");
		var_77bdab14 = function_91b29d2a(#"hash_3392a8a72acc91d");
		var_e8750c36 = function_91b29d2a(#"hash_187ecf3003e27fce");
		var_1901b1fa = function_91b29d2a(#"hash_2d6fce71eb390d50");
		var_453c640c = function_91b29d2a(#"hash_781a27d230f31faf");
		var_b351e4a0 = function_91b29d2a(#"hash_19db6f9cacbc79c3");
		var_e4dc1e88 = function_91b29d2a(#"hash_60758a532bcf65bf");
		var_b3103dc6 = function_91b29d2a(#"hash_48a5672439afc27f");
		var_5cf9a6ca = function_91b29d2a(#"hash_5efb8d41fc3faa1d");
		var_60f65e2 = function_91b29d2a(#"hash_1b0d6e065e6eb939");
		var_ad7c20c4 = function_91b29d2a(#"hash_21fc3a6dd0e569af");
		foreach(vehicle in var_cc58c092)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (1, 0, 0), 1, 0, 10, 20);
		}
		foreach(vehicle in var_f5196a40)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (1, 1, 0), 1, 0, 10, 20);
		}
		foreach(vehicle in var_dfebf4da)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (1, 1, 0), 1, 0, 10, 20);
		}
		foreach(vehicle in heli_spawn)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (1, 0, 1), 1, 0, 10, 20);
		}
		foreach(vehicle in var_56c17d74)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (1, 0, 1), 1, 0, 10, 20);
		}
		foreach(vehicle in var_77bdab14)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
		}
		foreach(vehicle in var_e8750c36)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
		}
		foreach(vehicle in var_1901b1fa)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
		}
		foreach(vehicle in var_453c640c)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
		}
		foreach(vehicle in var_b351e4a0)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
		}
		foreach(vehicle in var_e4dc1e88)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
		}
		foreach(vehicle in var_b3103dc6)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (0, 1, 1), 1, 0, 10, 20);
		}
		foreach(vehicle in var_60f65e2)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (0, 1, 1), 1, 0, 10, 20);
		}
		foreach(vehicle in var_5cf9a6ca)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, vectorscale((1, 1, 0), 0.5019608), 1, 0, 10, 20);
		}
		foreach(vehicle in var_ad7c20c4)
		{
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			sphere(vehicle.origin, radius, (0, 1, 0), 1, 0, 10, 20);
		}
	#/
}

/*
	Name: function_f4c71526
	Namespace: namespace_b56b91cb
	Checksum: 0xA7D048FD
	Offset: 0x33E0
	Size: 0x220
	Parameters: 1
	Flags: Private
*/
function private function_f4c71526(origin)
{
	/#
		vehicles = getvehiclearray();
		foreach(vehicle in vehicles)
		{
			color = vectorscale((1, 1, 1), 0.75);
			radius = 128;
			var_84dd2a8b = 4096;
			if(distancesquared(origin, vehicle.origin) < sqr(var_84dd2a8b))
			{
				radius = max((distance(origin, vehicle.origin) / var_84dd2a8b) * radius, 1);
			}
			if(isdefined(vehicle.scriptvehicletype))
			{
				color = (1, 1, 1);
				switch(vehicle.scriptvehicletype)
				{
					case "player_atv":
					{
						color = (0, 1, 1);
						break;
					}
					case "cargo_truck_wz":
					{
						color = (1, 1, 0);
						break;
					}
					case "tactical_raft_wz":
					{
						color = (1, 0.5, 0);
						break;
					}
					case "helicopter_light":
					{
						color = (1, 0, 1);
						break;
					}
				}
				sphere(vehicle.origin, radius, color, 1, 0, 10, 20);
			}
		}
	#/
}

/*
	Name: function_cdd9b388
	Namespace: namespace_b56b91cb
	Checksum: 0x9B04434F
	Offset: 0x3608
	Size: 0x316C
	Parameters: 0
	Flags: Private
*/
function private function_cdd9b388()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_594f4fa67a3b1977", 0))
			{
				wait(1);
			}
			else
			{
				waitframe(1);
			}
			if(!isdefined(level flag::get(#"hash_51daecff754729dc")))
			{
				continue;
			}
			if(getdvarint(#"hash_4341150bd02e99a1", 0) > 0)
			{
				xoffset = 20;
				yoffset = 160;
				var_27afd540 = 15;
				var_9e681fbf = 10;
				if(!isdefined(level.var_f0d0335b))
				{
					level.var_f0d0335b = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + (var_27afd540 + var_9e681fbf);
				}
				if(!isdefined(level.var_7f7d26cc))
				{
					level.var_7f7d26cc = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_6deb23ed))
				{
					level.var_6deb23ed = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + (var_27afd540 + var_9e681fbf);
				}
				if(!isdefined(level.var_5c6c77b3))
				{
					level.var_5c6c77b3 = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_5471e557))
				{
					level.var_5471e557 = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_544a823a))
				{
					level.var_544a823a = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_eaa15f28))
				{
					level.var_eaa15f28 = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_6fc93583))
				{
					level.var_6fc93583 = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_f2a04fda))
				{
					level.var_f2a04fda = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_721a3621))
				{
					level.var_721a3621 = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_67220c03))
				{
					level.var_67220c03 = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + (var_27afd540 + var_9e681fbf);
				}
				if(!isdefined(level.var_58faba13))
				{
					level.var_58faba13 = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_c36fe7fe))
				{
					level.var_c36fe7fe = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_d302f942))
				{
					level.var_d302f942 = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_1e11d9ad))
				{
					level.var_1e11d9ad = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_598c0b05))
				{
					level.var_598c0b05 = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				if(!isdefined(level.var_68135970))
				{
					level.var_68135970 = function_13d7bba(xoffset, yoffset);
					yoffset = yoffset + var_27afd540;
				}
				tab = "";
				loc_00003C28:
				loc_00003C70:
				level.var_f0d0335b settext((("" + (isdefined(level.var_d80c35aa[#"blank"]) ? level.var_d80c35aa[#"blank"] : 0)) + "") + (int((isdefined(level.var_d80c35aa[#"blank"]) ? level.var_d80c35aa[#"blank"] : 0) / (int(max(level.var_136445c0, 1) + (isdefined(level.var_d80c35aa[#"blank"]) ? level.var_d80c35aa[#"blank"] : 0))) * 100)) + "");
				level.var_7f7d26cc settext("" + (level.var_136445c0 + (isdefined(level.var_d80c35aa[#"blank"]) ? level.var_d80c35aa[#"blank"] : 0)));
				level.var_6deb23ed settext((((((((((((("" + level.var_66e56764) + tab) + tab) + "") + level.var_136445c0) + tab) + tab) + "") + level.var_5720c09a) + tab) + tab) + "") + level.var_2850ef5);
				level.var_5c6c77b3 settext(function_11421106("", ""));
				level.var_5471e557 settext(function_11421106("", ""));
				level.var_544a823a settext(function_11421106("", ""));
				level.var_eaa15f28 settext(function_11421106("", ""));
				level.var_6fc93583 settext(function_11421106("", ""));
				level.var_f2a04fda settext(function_11421106("", ""));
				level.var_721a3621 settext(function_11421106("", ""));
				level.var_67220c03 settext(function_11421106("", ""));
				level.var_c36fe7fe settext(function_11421106("", ""));
				level.var_d302f942 settext(function_11421106("", ""));
				level.var_1e11d9ad settext(function_11421106("", ""));
				level.var_598c0b05 settext(function_11421106("", ""));
				level.var_68135970 settext(function_11421106("", ""));
				level.var_58faba13 settext("" + (isdefined(level.var_f2db6a7f) ? level.var_f2db6a7f : 0));
			}
			else
			{
				if(isdefined(level.var_f0d0335b))
				{
					level.var_f0d0335b destroy();
				}
				if(isdefined(level.var_7f7d26cc))
				{
					level.var_7f7d26cc destroy();
				}
				if(isdefined(level.var_6deb23ed))
				{
					level.var_6deb23ed destroy();
				}
				if(isdefined(level.var_5c6c77b3))
				{
					level.var_5c6c77b3 destroy();
				}
				if(isdefined(level.var_5471e557))
				{
					level.var_5471e557 destroy();
				}
				if(isdefined(level.var_544a823a))
				{
					level.var_544a823a destroy();
				}
				if(isdefined(level.var_eaa15f28))
				{
					level.var_eaa15f28 destroy();
				}
				if(isdefined(level.var_6fc93583))
				{
					level.var_6fc93583 destroy();
				}
				if(isdefined(level.var_f2a04fda))
				{
					level.var_f2a04fda destroy();
				}
				if(isdefined(level.var_721a3621))
				{
					level.var_721a3621 destroy();
				}
				if(isdefined(level.var_67220c03))
				{
					level.var_67220c03 destroy();
				}
				if(isdefined(level.var_58faba13))
				{
					level.var_58faba13 destroy();
				}
				if(isdefined(level.var_c36fe7fe))
				{
					level.var_c36fe7fe destroy();
				}
				if(isdefined(level.var_d302f942))
				{
					level.var_d302f942 destroy();
				}
				if(isdefined(level.var_1e11d9ad))
				{
					level.var_1e11d9ad destroy();
				}
				if(isdefined(level.var_598c0b05))
				{
					level.var_598c0b05 destroy();
				}
				if(isdefined(level.var_68135970))
				{
					level.var_68135970 destroy();
				}
			}
			if(getdvarint(#"hash_66ec171c69a26bfe", 0) > 0)
			{
				level clientfield::set("", 0);
			}
			if(getdvarint(#"hash_cc335a24301e7a1", 0) > 0)
			{
				if(!level.var_1d8e6dd8)
				{
					level.var_1d8e6dd8 = 1;
					level thread function_b6ea080();
				}
			}
			if(getdvarint(#"hash_7504a27146161805", 0) > 0)
			{
				if(!level.var_1d8e6dd8)
				{
					level.var_1d8e6dd8 = 1;
					level thread function_10b50848();
				}
			}
			if(getdvarint(#"hash_7701b1eb7e173692", 0))
			{
				if(!level.var_938d798a)
				{
					wait(0.5);
					level.var_938d798a = 1;
					level thread function_938d798a();
				}
			}
			if(getdvarint(#"hash_7701b1eb7e173692", 0) == 0)
			{
				level.var_938d798a = 0;
			}
			if(getdvarint(#"hash_cb3296a761d4f6c", 0))
			{
				if(!level.var_f9efe895)
				{
					wait(0.5);
					level.var_f9efe895 = 1;
					level thread function_f9efe895();
				}
			}
			if(getdvarint(#"hash_cb3296a761d4f6c", 0) == 0)
			{
				level.var_f9efe895 = 0;
			}
			if(getdvarint(#"hash_4f4c47d52d6ad262", 0))
			{
				if(!level.var_f0d72128)
				{
					wait(0.5);
					level.var_f0d72128 = 1;
					level thread function_f0d72128();
				}
			}
			if(getdvarint(#"hash_4f4c47d52d6ad262", 0) == 0)
			{
				level.var_f0d72128 = 0;
			}
			if(getdvarint(#"hash_170b29b9b506feed", 0))
			{
				setdvar(#"hash_170b29b9b506feed", 0);
				level thread function_bebe535();
			}
			if(getdvarint(#"hash_38ea7228f76d733f", 0))
			{
				setdvar(#"hash_38ea7228f76d733f", 0);
				level thread function_2248268e();
			}
			if(getdvarint(#"hash_cc335a24301e7a1", 0) == 0)
			{
				level.var_1d8e6dd8 = 0;
			}
			else
			{
				setdvar(#"hash_cc335a24301e7a1", 0);
			}
			if(getdvarint(#"hash_7504a27146161805", 0) == 0)
			{
				level.var_1d8e6dd8 = 0;
			}
			else
			{
				setdvar(#"hash_7504a27146161805", 0);
			}
			if(getdvarint(#"hash_3fdd3b60f349d462", 0) > 0)
			{
				players = getplayers();
				if(players.size <= 0)
				{
					continue;
				}
				origin = players[0].origin;
				var_f4b807cb = item_world::function_2e3efdda(origin, undefined, 128, 2000);
				foreach(item in var_f4b807cb)
				{
					hidden = (item.var_8e092725 > 0 ? "" : "");
					print3d(item.origin + vectorscale((0, 0, 1), 10), ((("" + item.var_bd027dd9) + hidden) + "") + item.var_a6762160.name, (1, 0.5, 0), 1, 0.4);
				}
			}
			if(getdvarint(#"hash_52c63fdd1c1d96ac", 0))
			{
				itemtype = getdvarint(#"hash_52c63fdd1c1d96ac", 1);
				players = getplayers();
				if(players.size <= 0)
				{
					continue;
				}
				origin = players[0].origin;
				if(itemtype == 18)
				{
					function_66b45a31(origin);
				}
				else
				{
					if(itemtype == 19)
					{
						function_f4c71526(origin);
					}
					else
					{
						var_f4b807cb = item_world::function_2e3efdda(origin, undefined, 4000, 30000, -1, 0);
						foreach(item in var_f4b807cb)
						{
							if(isdefined(item.var_a6762160) && isdefined(item.var_a6762160.rarity))
							{
								switch(item.var_a6762160.rarity)
								{
									case "common":
									{
										color = (0, 1, 0);
										break;
									}
									case "rare":
									{
										color = (0, 0, 1);
										break;
									}
									case "legendary":
									{
										color = (1, 0.5, 0);
										break;
									}
									case "epic":
									{
										color = (1, 0, 1);
										break;
									}
									default:
									{
										color = vectorscale((1, 1, 1), 0.75);
										break;
									}
								}
							}
							else
							{
								color = vectorscale((1, 1, 1), 0.75);
							}
							radius = 64;
							var_84dd2a8b = 2048;
							if(distancesquared(origin, item.origin) < sqr(var_84dd2a8b))
							{
								radius = max((distance(origin, item.origin) / var_84dd2a8b) * radius, 1);
							}
							switch(itemtype)
							{
								case 1:
								{
									color = (1, 0, 1);
									sphere(item.origin, radius, color, 1, 0, 10, 20);
									if(isdefined(item.targetname))
									{
										print3d(item.origin + vectorscale((0, 0, 1), 32), function_9e72a96(item.targetname), color, 1, 0.3, 20);
									}
									break;
								}
								case 2:
								{
									if(isdefined(item.var_a6762160))
									{
										sphere(item.origin, radius, color, 1, 0, 10, 20);
										if(isdefined(item.targetname))
										{
											print3d(item.origin + vectorscale((0, 0, 1), 32), function_9e72a96(item.targetname), color, 1, 0.3, 20);
										}
									}
								}
								case 3:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"hash_7064fc95aa1c1bbe")
									{
										sphere(item.origin, radius, color, 1, 0, 10, 20);
										if(isdefined(item.targetname))
										{
											print3d(item.origin + vectorscale((0, 0, 1), 32), function_9e72a96(item.targetname), color, 1, 0.3, 20);
										}
									}
									break;
								}
								case 4:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"weapon")
									{
										sphere(item.origin, radius, color, 1, 0, 10, 20);
									}
									break;
								}
								case 5:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"armor")
									{
										if(item.var_a6762160.name == "")
										{
											sphere(item.origin, radius, (0, 1, 0), 1, 0, 10, 20);
										}
										else
										{
											if(item.var_a6762160.name == "")
											{
												sphere(item.origin, radius, (0, 0, 1), 1, 0, 10, 20);
											}
											else
											{
												if(item.var_a6762160.name == "")
												{
													sphere(item.origin, radius, (1, 1, 0), 1, 0, 10, 20);
												}
												else
												{
													sphere(item.origin, radius, color, 1, 0, 10, 20);
												}
											}
										}
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"weapon")
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
									}
									break;
								}
								case 6:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"equipment")
									{
										sphere(item.origin, radius, color, 1, 0, 10, 20);
									}
									break;
								}
								case 7:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"attachment")
									{
										sphere(item.origin, radius, color, 1, 0, 10, 20);
									}
									break;
								}
								case 8:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"hash_576593319dc02d70")
									{
										sphere(item.origin, radius, color, 1, 0, 10, 20);
									}
									break;
								}
								case 9:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"hash_910bf9605abbcea")
									{
										if(item.var_a6762160.amount === 1)
										{
											color = vectorscale((1, 1, 1), 0.75);
										}
										else
										{
											radius = radius * 2;
										}
										sphere(item.origin, radius, color, 1, 0, 10, 20);
									}
									break;
								}
								case 10:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"hash_3a094c949a87214d")
									{
										if(item.var_a6762160.amount === 1)
										{
											color = vectorscale((1, 1, 1), 0.75);
										}
										else
										{
											radius = radius * 2;
										}
										sphere(item.origin, radius, color, 1, 0, 10, 20);
									}
									break;
								}
								case 11:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"hash_70823406977e7c34")
									{
										sphere(item.origin, radius, color, 1, 0, 10, 20);
									}
									break;
								}
								case 12:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"hash_fc797c2a8f4d208")
									{
										sphere(item.origin, radius, color, 1, 0, 10, 20);
									}
									break;
								}
								case 13:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"generic")
									{
										sphere(item.origin, radius, color, 1, 0, 10, 20);
									}
									break;
								}
								case 14:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"resource")
									{
										sphere(item.origin, radius, color, 1, 0, 10, 20);
									}
									break;
								}
								case 16:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"field_upgrade")
									{
										sphere(item.origin, radius, color, 1, 0, 10, 20);
									}
									break;
								}
								case 17:
								{
									if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"tactical")
									{
										sphere(item.origin, radius, color, 1, 0, 10, 20);
									}
									break;
								}
							}
						}
					}
				}
			}
			if(getdvarint(#"hash_594f4fa67a3b1977", 0))
			{
				itemtype = getdvarint(#"hash_594f4fa67a3b1977", 1);
				players = getplayers();
				if(players.size <= 0)
				{
					continue;
				}
				origin = players[0].origin;
				if(itemtype == 17)
				{
					function_66b45a31(origin);
				}
				else
				{
					if(itemtype == 18)
					{
						function_f4c71526(origin);
					}
					else
					{
						if(itemtype == 19)
						{
							var_83f919af = arraycombine(function_91b29d2a(#"hash_77c7d3dc43202775"), function_91b29d2a(#"hash_7ce3442d00bdfee4"), 1, 0);
							var_83f919af = arraycombine(var_83f919af, function_91b29d2a(#"hash_1aa42430861b65d5"), 1, 0);
							var_83f919af = arraycombine(var_83f919af, function_91b29d2a(#"hash_553eee9af583811e"), 1, 0);
							foreach(point in var_83f919af)
							{
								player = level.players[0];
								if(vectordot(player.origin, point.origin) > 0)
								{
									color = (0, 0, 1);
									radius = 128;
									var_84dd2a8b = 4096;
									if(distancesquared(origin, point.origin) < sqr(var_84dd2a8b))
									{
										radius = max((distance(origin, point.origin) / var_84dd2a8b) * radius, 1);
									}
									var_58e1eac5 = item_world::function_2e3efdda(point.origin, undefined, 100, 1);
									if(var_58e1eac5.size > 0)
									{
										switch(var_58e1eac5[0].targetname)
										{
											case "world_dynent_stash_health":
											{
												color = (1, 0, 0);
												break;
											}
											case "world_dynent_stash_supply":
											{
												color = (0, 1, 0);
												break;
											}
											case "hash_ea6664e89a0bff6":
											{
												color = vectorscale((1, 1, 0), 0.5019608);
												break;
											}
										}
										sphere(point.origin, radius, color, 1, 0, 10, 20);
										continue;
									}
									color = vectorscale((1, 1, 1), 0.75);
									sphere(point.origin, radius, color, 1, 0, 10, 20);
								}
							}
						}
						else
						{
							var_f4b807cb = item_world::function_2e3efdda(origin, undefined, 4000, 30000, -1, 0);
							foreach(item in var_f4b807cb)
							{
								if(isdefined(item.var_a6762160) && isdefined(item.var_a6762160.rarity))
								{
									switch(item.var_a6762160.rarity)
									{
										case "common":
										{
											color = (0, 1, 0);
											break;
										}
										case "rare":
										{
											color = (0, 0, 1);
											break;
										}
										case "legendary":
										{
											color = (1, 0.5, 0);
											break;
										}
										case "epic":
										{
											color = (1, 0, 1);
											break;
										}
										default:
										{
											color = vectorscale((1, 1, 1), 0.75);
											break;
										}
									}
								}
								else
								{
									color = vectorscale((1, 1, 1), 0.75);
								}
								radius = 64;
								var_84dd2a8b = 2048;
								if(distancesquared(origin, item.origin) < sqr(var_84dd2a8b))
								{
									radius = max((distance(origin, item.origin) / var_84dd2a8b) * radius, 1);
								}
								switch(itemtype)
								{
									case 1:
									{
										color = (1, 0, 1);
										sphere(item.origin, radius, color, 1, 0, 10, 20);
										if(isdefined(item.targetname))
										{
											print3d(item.origin + vectorscale((0, 0, 1), 32), function_9e72a96(item.targetname), color, 1, 0.3, 20);
										}
										break;
									}
									case 2:
									{
										if(isdefined(item.var_a6762160))
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
									}
									case 3:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"ammo")
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
										break;
									}
									case 4:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"weapon")
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
										break;
									}
									case 5:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"health")
										{
											if(item.var_a6762160.name == "")
											{
												sphere(item.origin, radius, (0, 1, 0), 1, 0, 10, 20);
											}
											else
											{
												if(item.var_a6762160.name == "")
												{
													sphere(item.origin, radius, (0, 0, 1), 1, 0, 10, 20);
												}
												else
												{
													if(item.var_a6762160.name == "")
													{
														sphere(item.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
													}
													else
													{
														sphere(item.origin, radius, color, 1, 0, 10, 20);
													}
												}
											}
										}
										break;
									}
									case 6:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"armor")
										{
											if(item.var_a6762160.name == "")
											{
												sphere(item.origin, radius, (0, 1, 0), 1, 0, 10, 20);
											}
											else
											{
												if(item.var_a6762160.name == "")
												{
													sphere(item.origin, radius, (0, 0, 1), 1, 0, 10, 20);
												}
												else
												{
													if(item.var_a6762160.name == "")
													{
														sphere(item.origin, radius, (1, 1, 0), 1, 0, 10, 20);
													}
													else
													{
														sphere(item.origin, radius, color, 1, 0, 10, 20);
													}
												}
											}
										}
										break;
									}
									case 7:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"equipment")
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
										break;
									}
									case 8:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"backpack")
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
										break;
									}
									case 9:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"attachment")
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
										break;
									}
									case 10:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"generic")
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
										break;
									}
									case 11:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"killstreak")
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
										break;
									}
									case 12:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"quest")
										{
											sphere(item.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
										}
										break;
									}
									case 13:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"cash")
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
										break;
									}
									case 14:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"resource")
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
										break;
									}
									case 15:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"field_upgrade")
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
										break;
									}
									case 16:
									{
										if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"tactical")
										{
											sphere(item.origin, radius, color, 1, 0, 10, 20);
										}
										break;
									}
								}
							}
						}
					}
				}
			}
			if(getdvarint(#"hash_5d7b010a8d4f8666", 0))
			{
				if(isdefined(level.var_8819644a))
				{
					foreach(info in level.var_8819644a)
					{
						vehicle = info.vehicle;
						spawnpoint = info.origin;
						players = getplayers();
						if(players.size <= 0)
						{
							continue;
						}
						origin = players[0].origin;
						if(isdefined(vehicle))
						{
							radius = 64;
							var_84dd2a8b = 2048;
							if(distancesquared(origin, spawnpoint) < sqr(var_84dd2a8b))
							{
								radius = max((distance(origin, spawnpoint) / var_84dd2a8b) * radius, 10);
							}
							sphere(spawnpoint, radius, (1, 1, 0), 1, 0, 10, 20);
							line(spawnpoint, vehicle.origin, (0, 1, 0));
							sphere(vehicle.origin, radius, (1, 0, 0), 1, 0, 10, 20);
						}
					}
				}
			}
		}
	#/
}

/*
	Name: function_13c803de
	Namespace: namespace_b56b91cb
	Checksum: 0x7A1D5DD5
	Offset: 0x6780
	Size: 0x70
	Parameters: 0
	Flags: Private
*/
function private function_13c803de()
{
	/#
		level endon(#"end_game");
		self notify("");
		self endon("");
		while(true)
		{
			level waittill(#"host_migration_begin");
			level thread function_44b9dd1d();
		}
	#/
}

/*
	Name: function_44b9dd1d
	Namespace: namespace_b56b91cb
	Checksum: 0x242B6F96
	Offset: 0x67F8
	Size: 0x2E4
	Parameters: 0
	Flags: Private
*/
function private function_44b9dd1d()
{
	/#
		while(!canadddebugcommand())
		{
			waitframe(1);
		}
		mapname = util::function_53bbf9d2();
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand("");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
	#/
}

/*
	Name: function_91ef342
	Namespace: namespace_b56b91cb
	Checksum: 0x1216920A
	Offset: 0x6AE8
	Size: 0x8E
	Parameters: 0
	Flags: None
*/
function function_91ef342()
{
	/#
		level endon(#"game_ended");
		while(true)
		{
			r = undefined;
			r = level waittill(#"devgui_bot");
			switch(r.args[0])
			{
				case "hash_29f59f6b62fdbf94":
				{
					function_c07eae4e();
					break;
				}
			}
		}
	#/
}

/*
	Name: function_c07eae4e
	Namespace: namespace_b56b91cb
	Checksum: 0x9B9B5460
	Offset: 0x6B80
	Size: 0x246
	Parameters: 0
	Flags: None
*/
function function_c07eae4e()
{
	/#
		var_6e5bbee1 = [];
		itemcount = function_8322cf16();
		for(i = 0; i < itemcount; i++)
		{
			item = function_b1702735(i);
			if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype == "" && item.var_a6762160.weapon.isprimary)
			{
				array::add(var_6e5bbee1, namespace_ad5a0cd6::function_35e06774(item.var_a6762160), 0);
			}
		}
		var_6e5bbee1 = array::randomize(var_6e5bbee1);
		if(var_6e5bbee1.size == 0)
		{
			return;
		}
		players = getplayers();
		var_9db8ea1b = 0;
		foreach(player in players)
		{
			if(isbot(player))
			{
				weapon = var_6e5bbee1[var_9db8ea1b];
				player giveweapon(weapon);
				player givemaxammo(weapon);
				player switchtoweaponimmediate(weapon);
				var_9db8ea1b++;
				if(var_9db8ea1b >= var_6e5bbee1.size)
				{
					var_9db8ea1b = 0;
				}
			}
		}
	#/
}

/*
	Name: function_9cc59537
	Namespace: namespace_b56b91cb
	Checksum: 0xA3A7A2D3
	Offset: 0x6DD0
	Size: 0x1E7A
	Parameters: 0
	Flags: None
*/
function function_9cc59537()
{
	/#
		level endon(#"game_ended");
		var_55a05f87 = 0;
		var_cbc7aaf6 = 0;
		var_ebd66b56 = [];
		level flag::wait_till("");
		while(!isdefined(level.players) || !isplayer(level.players[0]))
		{
			wait(1);
		}
		level.players[0] endon(#"disconnect");
		gametype = util::function_5df4294();
		var_796ab805 = [];
		while(true)
		{
			wait(1);
			if(!getdvarint(#"hash_68dcd0d52e11b957", 0))
			{
				continue;
			}
			do
			{
				waitframe(8);
				var_a4a4012e = level.var_a4a4012e;
				if(isarray(var_a4a4012e))
				{
					foreach(drop in var_a4a4012e)
					{
						if(isdefined(drop) && !is_true(drop.var_49d5e215))
						{
							if(isdefined(drop.var_a6762160.killstreak))
							{
								if(!isdefined(var_796ab805[drop.var_a6762160.name]))
								{
									var_796ab805[drop.var_a6762160.name] = [];
								}
								else if(!isarray(var_796ab805[drop.var_a6762160.name]))
								{
									var_796ab805[drop.var_a6762160.name] = array(var_796ab805[drop.var_a6762160.name]);
								}
								var_796ab805[drop.var_a6762160.name][var_796ab805[drop.var_a6762160.name].size] = drop.var_a6762160.killstreak;
							}
							else if(isdefined(drop.var_a6762160.name) && drop.var_a6762160.name != "")
							{
								if(!isdefined(var_796ab805[drop.var_a6762160.name]))
								{
									var_796ab805[drop.var_a6762160.name] = [];
								}
								else if(!isarray(var_796ab805[drop.var_a6762160.name]))
								{
									var_796ab805[drop.var_a6762160.name] = array(var_796ab805[drop.var_a6762160.name]);
								}
								var_796ab805[drop.var_a6762160.name][var_796ab805[drop.var_a6762160.name].size] = drop.var_a6762160.name;
							}
							drop.var_49d5e215 = 1;
						}
					}
					var_bd9acc19 = 150;
					foreach(item_drop in var_796ab805)
					{
						var_bd9acc19 = var_bd9acc19 + 24;
						var_6abd8aff = (function_9e72a96(i) + "") + item_drop.size;
						debug2dtext((810, var_bd9acc19, 0), var_6abd8aff, (1, 1, 1), undefined, undefined, undefined, undefined, 8);
						if(getdvarint(#"hash_156f2cf900b33f9f", 0))
						{
							print(var_6abd8aff + "");
						}
					}
					if(getdvarint(#"hash_156f2cf900b33f9f", 0))
					{
						setdvar(#"hash_156f2cf900b33f9f", 0);
					}
				}
				var_1d9375fc = struct::get_array("", "");
				foreach(group in var_1d9375fc)
				{
					group.var_4a3dcff2 = [];
					var_f0179f4a = getdvarstring(#"hash_230734aeaaf8671", "");
					if(isstring(group.target) && (var_f0179f4a == "" || function_d72aa67e(var_f0179f4a, group.target)))
					{
						group.var_4a3dcff2 = function_91b29d2a(group.target);
					}
				}
				var_7cb887a8 = [];
				foreach(group in var_1d9375fc)
				{
					var_b91441dd = getscriptbundle(group.scriptbundlename);
					if(!isdefined(var_b91441dd) || is_true(var_b91441dd.var_ca330541) || group.var_4a3dcff2.size == 0 || !isdefined(group.targetname) || var_b91441dd.name === "" || var_b91441dd.name === "" || var_b91441dd.name === "" || (!is_true(var_b91441dd.var_4f220d03) && gametype === ""))
					{
						continue;
					}
					else if(var_b91441dd.name === "")
					{
						var_df1e5fef = arraysortclosest(group.var_4a3dcff2, level.players[0].origin, 85, 1, getdvarint(#"hash_6ac8a75bc45c3633", 10000));
						foreach(point in var_df1e5fef)
						{
							sphere(point.origin, 16, (1, 1, 1), 1, 0, 16, 8);
						}
						continue;
					}
					spawn_points = arraysortclosest(group.var_4a3dcff2, level.players[0].origin, 85, 1, getdvarint(#"hash_6ac8a75bc45c3633", 10000));
					foreach(point in spawn_points)
					{
						if(getdvarint(#"hash_7ae201bf5aee2017", 0))
						{
							var_4b82457c = distance2d(point.origin, level.players[0].origin);
							n_radius = getdvarfloat(#"hash_69e2c57538bbcb9b", 0.015) * var_4b82457c;
							if(n_radius > 128)
							{
								n_radius = 128;
							}
							switch(var_b91441dd.name)
							{
								case "hash_102716229ce6474b":
								{
									color = (1, 1, 0);
									break;
								}
								case "hash_102715229ce64598":
								{
									color = (1, 0, 1);
									break;
								}
								default:
								{
									color = (0, 1, 0);
								}
							}
							sphere(point.origin, n_radius, color, 1, 0, 16, 8);
							continue;
						}
						if(level.players[0] util::is_player_looking_at(point.origin, 0.6, 0))
						{
							b_failed = 0;
							var_47748885 = 28;
							var_c5330f11 = 32;
							v_color = (1, 0, 1);
							if(isdefined(var_b91441dd.itemlist[0]))
							{
								if(var_b91441dd.itemlist[0].var_a6762160 === "" || var_b91441dd.itemlist[0].var_a6762160 === "" || var_b91441dd.itemlist[0].var_a6762160 === "" || var_b91441dd.itemlist[0].var_a6762160 === "" || var_b91441dd.itemlist[0].var_a6762160 === "" || var_b91441dd.itemlist[0].var_a6762160 === "")
								{
									v_color = (1, 1, 0);
									var_47748885 = 4;
									var_c5330f11 = 4;
								}
							}
							else
							{
								continue;
							}
							dynents = [];
							if(isdefined(group.targetname))
							{
								dynents = function_c79d31c4(group.targetname, 1);
								if(getdvarint(#"hash_f6b57eebb5965e6", 0) && dynents.size >= getdvarint(#"hash_6a4b2cc3aa3a5d21", 50))
								{
									foreach(i, stash in dynents)
									{
										if(i >= getdvarint(#"hash_6a4b2cc3aa3a5d21", 50))
										{
											continue;
										}
										waitframe(2);
										stash thread namespace_65181344::function_fd87c780(stash.var_b91441dd.name, stash.available, 3);
									}
									setdvar(#"hash_f6b57eebb5965e6", 0);
								}
							}
							items = item_world::function_2e3efdda(point.origin, undefined, 1, var_47748885, -1, 1);
							if(items.size > 0)
							{
								v_color = (0, 1, 0);
								dynent = undefined;
								foreach(dynent in dynents)
								{
									if(dynent.origin == point.origin)
									{
										var_a835512 = function_ffdbe8c2(dynent);
										if(var_a835512 === 3)
										{
											v_color = (1, 1, 0);
										}
										else if(var_a835512 === 2)
										{
											v_color = (1, 0.5, 0);
										}
										break;
									}
								}
							}
							n_radius = 4;
							var_7cb887a8 = [];
							var_3e832e74 = 360 / 8;
							v_angles = point.angles;
							var_c24ea284 = undefined;
							var_4b82457c = distance2d(point.origin, level.players[0].origin);
							var_24b0b1ea = var_b91441dd.var_7fb0967b;
							if(isdefined(var_24b0b1ea))
							{
								if(items.size > 0)
								{
									var_abc7e003 = item_world::function_2e3efdda(point.origin, undefined, 20, var_24b0b1ea, -1, 1);
									var_abc7e003 = arraysortclosest(var_abc7e003, point.origin, 10, var_47748885);
									foreach(item_type in var_b91441dd.itemlist)
									{
										foreach(var_d76a7255 in var_abc7e003)
										{
											if(item_type.var_a6762160 === var_d76a7255.var_a6762160.name && var_d76a7255.var_a6762160.name === items[0].var_a6762160.name)
											{
												print3d(point.origin + vectorscale((0, 0, 1), 18), (item_type.var_a6762160 + "") + var_24b0b1ea, (1, 0.5, 0), 1, 0.3, 8);
												line(var_d76a7255.origin, point.origin, (1, 0.5, 0), 1, 0, 8);
											}
										}
									}
								}
							}
							up = vectorscale(anglestoup(v_angles), 16);
							if(is_true(var_b91441dd.var_f4cdfe08))
							{
								n_depth = 9;
								n_width = 14;
								if(var_b91441dd.name === "" || var_b91441dd.name === "" || var_b91441dd.name === "")
								{
									n_depth = 12;
									n_width = 48;
								}
								var_7cb887a8[0] = up + vectorscale(anglestoforward(v_angles), n_depth);
								var_7cb887a8[1] = up + (vectorscale(anglestoforward(v_angles) * -1, n_depth + 4));
								var_7cb887a8[2] = up + vectorscale(anglestoright(v_angles), n_width);
								var_7cb887a8[3] = up + (vectorscale(anglestoright(v_angles) * -1, n_width));
							}
							else
							{
								for(i = 0; i < 8; i++)
								{
									var_7cb887a8[i] = up + vectorscale(anglestoforward(v_angles), var_47748885);
									v_angles = v_angles + (0, var_3e832e74, 0);
								}
							}
							var_2e0e7774 = arraysortclosest(spawn_points, point.origin, 20, 1, var_c5330f11);
							foreach(close in var_2e0e7774)
							{
								if(bullettracepassed(up, close.origin, 0, level.players[0]))
								{
									v_color = (0, 0, 1);
									b_failed = 1;
									line(close.origin, point.origin, v_color, 1, 0, 8);
									circle(point.origin, var_c5330f11 / 2, v_color, 0, 1, 8);
									print3d(point.origin + vectorscale((0, 0, 1), 24), sqrt(distancesquared(point.origin, close.origin)), v_color, 1, 0.3, 8);
								}
							}
							if(is_true(var_b91441dd.var_f4cdfe08))
							{
								var_47748885 = n_depth;
								foreach(i, v_test in var_7cb887a8)
								{
									if(i > 2)
									{
										var_47748885 = n_width;
									}
									a_trace = bullettrace(point.origin + vectorscale((0, 0, 1), 12), v_test, 0, level.players[0]);
									if((distancesquared(a_trace[#"position"], point.origin + vectorscale((0, 0, 1), 24))) < ((var_47748885 * var_47748885) - 20) && !isdefined(a_trace[#"dynent"]) || (point.angles[0] > 30 || point.angles[0] < -30 || point.angles[2] < -30 || point.angles[2] > 30))
									{
										v_color = (1, 0, 0);
										b_failed = 1;
										if(var_4b82457c < 256)
										{
											debugstar(a_trace[#"position"], 8, v_color);
										}
									}
								}
								var_47748885 = 9;
							}
							else
							{
								foreach(v_test in var_7cb887a8)
								{
									a_trace = bullettrace(up, v_test, 0, level.players[0]);
									if(distancesquared(a_trace[#"position"], up) < ((var_47748885 * var_47748885) - 6) && !isdefined(a_trace[#"dynent"]))
									{
										v_color = (1, 0, 0);
										b_failed = 1;
										if(var_4b82457c < 256)
										{
											debugstar(a_trace[#"position"], 8, v_color);
										}
									}
								}
							}
							n_radius = getdvarfloat(#"hash_69e2c57538bbcb9b", 0.015) * var_4b82457c;
							if(isdefined(dynent) && (v_color == (0, 1, 0) || v_color == (1, 1, 0) || v_color == (1, 0.5, 0) || v_color == (1, 0, 0)))
							{
								point = dynent;
							}
							if(n_radius > 32)
							{
								n_radius = 32;
							}
							if(var_4b82457c <= 1024)
							{
								if(is_true(var_b91441dd.var_f4cdfe08) && v_angles !== (0, 0, 0))
								{
									function_47351fa3(point.origin, v_angles, v_color, 8);
									box(point.origin + vectorscale(anglestoup(v_angles), 16), (n_depth + 4, n_width, 16) * -1, (n_depth, n_width, 16), v_angles, v_color, 1, 0, 8);
								}
								else
								{
									circle(point.origin, var_47748885, v_color, 0, 1, 8);
								}
								if(var_4b82457c < 512)
								{
									print3d(point.origin + vectorscale((0, 0, 1), 48), function_9e72a96(group.targetname), v_color, 1, 0.3, 8);
									print3d(point.origin + vectorscale((0, 0, 1), 42), function_9e72a96(point.targetname), v_color, 1, 0.3, 8);
									if(var_4b82457c < 256 && level.players[0] util::is_player_looking_at(point.origin, 0.87, 0))
									{
										print3d(point.origin + vectorscale((0, 0, 1), 36), var_b91441dd.name, v_color, 1, 0.3, 8);
										print3d(point.origin + vectorscale((0, 0, 1), 30), point.origin, v_color, 1, 0.3, 8);
										if(dynents.size > 0)
										{
											var_a1bd87ef = getdynentarray(point.targetname);
											print3d(point.origin + vectorscale((0, 0, 1), 24), "" + var_a1bd87ef.size, (1, 1, 0), 1, 0.3, 8);
											print3d(point.origin + vectorscale((0, 0, 1), 24), "" + var_a1bd87ef.size, (0, 1, 0), 1, 0.3, 8);
											print3d(point.origin + vectorscale((0, 0, 1), 24), "" + dynents.size, (1, 1, 0), 1, 0.3, 8);
											print3d(point.origin + vectorscale((0, 0, 1), 18), "" + group.var_4a3dcff2.size, (1, 1, 0), 1, 0.3, 8);
										}
									}
								}
								continue;
							}
							sphere(point.origin, n_radius, v_color, 1, 0, 8, 8);
						}
					}
				}
			}
			while(getdvarint(#"hash_68dcd0d52e11b957", 0));
		}
	#/
}

/*
	Name: function_d72aa67e
	Namespace: namespace_b56b91cb
	Checksum: 0x534A7FDE
	Offset: 0x8C58
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
	Namespace: namespace_b56b91cb
	Checksum: 0x46086CDF
	Offset: 0x8D20
	Size: 0x284
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
	#/
}

