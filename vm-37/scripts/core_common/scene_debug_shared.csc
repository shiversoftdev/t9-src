#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace scene;

/*
	Name: __init__system__
	Namespace: scene
	Checksum: 0x8EEBC8E6
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	/#
		system::register(#"scene_debug", &function_c3c9d0e5, undefined, undefined, undefined);
	#/
}

/*
	Name: function_c3c9d0e5
	Namespace: scene
	Checksum: 0x9AC1259
	Offset: 0xD8
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function function_c3c9d0e5()
{
	/#
		if(getdvarstring(#"scene_menu_mode", "") == "")
		{
			setdvar(#"scene_menu_mode", "");
		}
		level thread run_scene_tests();
		level thread toggle_scene_menu();
	#/
}

/*
	Name: run_scene_tests
	Namespace: scene
	Checksum: 0x3D9FB667
	Offset: 0x180
	Size: 0x52E
	Parameters: 0
	Flags: None
*/
function run_scene_tests()
{
	/#
		level endon(#"run_scene_tests");
		level.scene_test_struct = spawnstruct();
		level.scene_test_struct.origin = (0, 0, 0);
		level.scene_test_struct.angles = (0, 0, 0);
		while(true)
		{
			str_scene = getdvarstring(#"run_client_scene");
			str_mode = tolower(getdvarstring(#"scene_menu_mode", ""));
			a_toks = strtok(str_scene, "");
			str_scene = a_toks[0];
			str_shot = a_toks[1];
			if(!isdefined(str_scene))
			{
				str_scene = "";
			}
			if(str_scene != "")
			{
				setdvar(#"run_client_scene", "");
				clear_old_ents(str_scene);
				b_found = 0;
				a_scenes = struct::get_array(str_scene, "");
				foreach(s_instance in a_scenes)
				{
					if(isdefined(s_instance))
					{
						b_found = 1;
						s_instance thread test_play(undefined, str_shot, str_mode);
					}
				}
				if(isdefined(level.active_scenes[str_scene]))
				{
					foreach(s_instance in level.active_scenes[str_scene])
					{
						if(!isinarray(a_scenes, s_instance))
						{
							b_found = 1;
							s_instance thread test_play(str_scene, str_shot, str_mode);
						}
					}
				}
				if(!b_found)
				{
					level.scene_test_struct thread test_play(str_scene, str_shot, str_mode);
				}
			}
			str_scene = getdvarstring(#"init_client_scene");
			if(str_scene != "")
			{
				setdvar(#"init_client_scene", "");
				clear_old_ents(str_scene);
				b_found = 0;
				a_scenes = struct::get_array(str_scene, "");
				foreach(s_instance in a_scenes)
				{
					if(isdefined(s_instance))
					{
						b_found = 1;
						s_instance thread test_init();
					}
				}
				if(!b_found)
				{
					level.scene_test_struct thread test_init(str_scene);
				}
			}
			str_scene = getdvarstring(#"stop_client_scene");
			if(str_scene != "")
			{
				setdvar(#"stop_client_scene", "");
				function_d2785094(level.var_a572f325);
				level stop(str_scene, 1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: clear_old_ents
	Namespace: scene
	Checksum: 0xB08699EE
	Offset: 0x6B8
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function clear_old_ents(str_scene)
{
	/#
		foreach(ent in getentarray(0))
		{
			if(ent.scene_spawned === str_scene && ent.finished_scene === str_scene)
			{
				ent delete();
			}
		}
	#/
}

/*
	Name: toggle_scene_menu
	Namespace: scene
	Checksum: 0xCC4FE017
	Offset: 0x788
	Size: 0x1EC
	Parameters: 0
	Flags: None
*/
function toggle_scene_menu()
{
	/#
		setdvar(#"client_scene_menu", 0);
		n_scene_menu_last = -1;
		while(true)
		{
			n_scene_menu = getdvarstring(#"client_scene_menu");
			if(n_scene_menu != "")
			{
				n_scene_menu = int(n_scene_menu);
				if(n_scene_menu != n_scene_menu_last)
				{
					switch(n_scene_menu)
					{
						case 1:
						{
							level thread display_scene_menu("");
							break;
						}
						case 2:
						{
							level thread display_scene_menu("");
							break;
						}
						default:
						{
							level flag::clear(#"menu_open");
							level flag::clear(#"hash_4035a6aa4a6ba08d");
							level flag::clear(#"hash_7b50fddf7a4b9e2e");
							level flag::clear(#"hash_5bcd66a9c21f5b2d");
							level notify(#"scene_menu_cleanup");
							setdvar(#"cl_tacticalhud", 1);
						}
					}
					n_scene_menu_last = n_scene_menu;
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_8ee42bf
	Namespace: scene
	Checksum: 0x456C244B
	Offset: 0x980
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_8ee42bf(o_scene)
{
	/#
		if(isdefined(o_scene) && isdefined(o_scene._s))
		{
			str_type = (isdefined(o_scene._s.scenetype) ? o_scene._s.scenetype : "");
			if(level flag::get(str_type + "") && level flag::get(#"hash_5bcd66a9c21f5b2d"))
			{
				level thread display_scene_menu(o_scene._s.scenetype);
			}
		}
	#/
}

/*
	Name: display_scene_menu
	Namespace: scene
	Checksum: 0xC9502317
	Offset: 0xA60
	Size: 0xD3E
	Parameters: 2
	Flags: None
*/
function display_scene_menu(str_type, str_scene)
{
	/#
		if(!isdefined(str_type))
		{
			str_type = "";
		}
		level flag::clear(#"hash_4035a6aa4a6ba08d");
		level flag::clear(#"hash_7b50fddf7a4b9e2e");
		level notify(#"scene_menu_cleanup");
		level endon(#"scene_menu_cleanup");
		waittillframeend();
		level flag::set(#"menu_open");
		setdvar(#"cl_tacticalhud", 0);
		b_shot_menu = 0;
		a_scenedefs = get_scenedefs(str_type);
		if(str_type == "")
		{
			a_scenedefs = arraycombine(a_scenedefs, get_scenedefs(""), 0, 1);
		}
		names = [];
		if(isstring(str_scene))
		{
			names[names.size] = "";
			names[names.size] = "";
			names[names.size] = "";
			names = arraycombine(names, get_all_shot_names(str_scene), 1, 0);
			names[names.size] = "";
			names[names.size] = "";
			names[names.size] = "";
			names[names.size] = "";
			str_title = str_scene;
			b_shot_menu = 1;
			selected = (isdefined(level.scene_menu_shot_index) ? level.scene_menu_shot_index : 0);
		}
		else
		{
			level flag::set(str_type + "");
			names[0] = "";
			names[1] = "";
			if(level flag::get(#"hash_5bcd66a9c21f5b2d"))
			{
				println(("" + toupper(str_type)) + "");
			}
			var_72acc069 = 1;
			foreach(s_scenedef in a_scenedefs)
			{
				if(s_scenedef.vmtype === "" && s_scenedef.scenetype === str_type)
				{
					if(level flag::get(#"hash_5bcd66a9c21f5b2d"))
					{
						if(is_active(s_scenedef.name) && function_c0f30783(s_scenedef))
						{
							array::add_sorted(names, s_scenedef.name, 0);
							println((((("" + toupper(str_type)) + "") + var_72acc069) + "") + s_scenedef.name);
							var_72acc069++;
						}
						continue;
					}
					if(function_c0f30783(s_scenedef))
					{
						array::add_sorted(names, s_scenedef.name, 0);
					}
				}
			}
			if(level flag::get(#"hash_5bcd66a9c21f5b2d"))
			{
				println(("" + toupper(str_type)) + "");
			}
			names[names.size] = "";
			str_title = str_type + "";
		}
		selected = 0;
		up_pressed = 0;
		down_pressed = 0;
		held = 0;
		old_selected = selected;
		while(true)
		{
			if(held)
			{
				scene_list_settext(names, selected, str_title, 30);
				wait(0.5);
			}
			else
			{
				scene_list_settext(names, selected, str_title, 1);
			}
			if(!up_pressed)
			{
				if(function_5c10bd79(0) util::up_button_pressed())
				{
					up_pressed = 1;
					selected--;
					if(names[selected] === "")
					{
						selected--;
					}
				}
			}
			else
			{
				if(function_5c10bd79(0) util::up_button_held())
				{
					held = 1;
					selected = selected - 10;
				}
				else if(!function_5c10bd79(0) util::up_button_pressed())
				{
					held = 0;
					up_pressed = 0;
				}
			}
			if(!down_pressed)
			{
				if(function_5c10bd79(0) util::down_button_pressed())
				{
					down_pressed = 1;
					selected++;
					if(names[selected] === "")
					{
						selected++;
					}
				}
			}
			else
			{
				if(function_5c10bd79(0) util::down_button_held())
				{
					held = 1;
					selected = selected + 10;
				}
				else if(!function_5c10bd79(0) util::down_button_pressed())
				{
					held = 0;
					down_pressed = 0;
				}
			}
			if(held)
			{
				if(selected < 0)
				{
					selected = 0;
				}
				else if(selected >= names.size)
				{
					selected = names.size - 1;
				}
			}
			else
			{
				if(selected < 0)
				{
					selected = names.size - 1;
				}
				else if(selected >= names.size)
				{
					selected = 0;
				}
			}
			if(function_5c10bd79(0) buttonpressed(""))
			{
				if(b_shot_menu)
				{
					while(function_5c10bd79(0) buttonpressed(""))
					{
						waitframe(1);
					}
					level.scene_menu_shot_index = selected;
					level thread display_scene_menu(str_type);
				}
				else
				{
					level.scene_menu_shot_index = selected;
					setdvar(#"client_scene_menu", 0);
				}
			}
			if(function_5c10bd79(0) buttonpressed("") || function_5c10bd79(0) buttonpressed("") || function_5c10bd79(0) buttonpressed(""))
			{
				if(names[selected] == "")
				{
					level flag::toggle("");
					while(function_5c10bd79(0) buttonpressed("") || function_5c10bd79(0) buttonpressed("") || function_5c10bd79(0) buttonpressed(""))
					{
						waitframe(1);
					}
					level thread display_scene_menu(str_type);
				}
				else
				{
					if(names[selected] == "")
					{
						setdvar(#"client_scene_menu", 0);
					}
					else if(b_shot_menu)
					{
						if(names[selected] == "")
						{
							level.scene_menu_shot_index = selected;
							while(function_5c10bd79(0) buttonpressed("") || function_5c10bd79(0) buttonpressed("") || function_5c10bd79(0) buttonpressed(""))
							{
								waitframe(1);
							}
							level thread display_scene_menu(str_type);
						}
						else
						{
							if(names[selected] == "")
							{
								setdvar(#"stop_client_scene", str_scene);
							}
							else
							{
								if(names[selected] == "")
								{
									setdvar(#"init_client_scene", str_scene);
								}
								else
								{
									if(names[selected] == "")
									{
										setdvar(#"run_client_scene", str_scene);
									}
									else
									{
										setdvar(#"run_client_scene", (str_scene + "") + names[selected]);
									}
								}
							}
						}
					}
				}
				while(function_5c10bd79(0) buttonpressed("") || function_5c10bd79(0) buttonpressed("") || function_5c10bd79(0) buttonpressed(""))
				{
					waitframe(1);
				}
				if(!b_shot_menu && isdefined(names[selected]) && names[selected] != "")
				{
					level.scene_menu_shot_index = selected;
					level thread display_scene_menu(str_type, names[selected]);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_c0f30783
	Namespace: scene
	Checksum: 0x2F96B105
	Offset: 0x17A8
	Size: 0x82
	Parameters: 1
	Flags: None
*/
function function_c0f30783(s_scenedef)
{
	/#
		if(!is_true(s_scenedef.var_241c5f3c) || (is_true(s_scenedef.var_241c5f3c) && getdvarint(#"zm_debug_ee", 0)))
		{
			return true;
		}
		return false;
	#/
}

/*
	Name: scene_list_settext
	Namespace: scene
	Checksum: 0x76427C20
	Offset: 0x1838
	Size: 0x4C
	Parameters: 4
	Flags: None
*/
function scene_list_settext(strings, n_selected, str_title, var_444abf97)
{
	/#
		level thread _scene_list_settext(strings, n_selected, str_title, var_444abf97);
	#/
}

/*
	Name: _scene_list_settext
	Namespace: scene
	Checksum: 0x18691839
	Offset: 0x1890
	Size: 0x374
	Parameters: 4
	Flags: None
*/
function _scene_list_settext(strings, n_selected, str_title, var_444abf97)
{
	/#
		if(!isdefined(var_444abf97))
		{
			var_444abf97 = 1;
		}
		debug2dtext((150, 325, 0), str_title, (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
		str_mode = tolower(getdvarstring(#"scene_menu_mode", ""));
		switch(str_mode)
		{
			case "default":
			{
				debug2dtext((150, 362.5, 0), "", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
				break;
			}
			case "loop":
			{
				debug2dtext((150, 362.5, 0), "", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
				break;
			}
			case "capture_single":
			{
				debug2dtext((150, 362.5, 0), "", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
				break;
			}
			case "capture_series":
			{
				debug2dtext((150, 362.5, 0), "", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
				break;
			}
		}
		for(i = 0; i < 16; i++)
		{
			index = i + (n_selected - 5);
			if(isdefined(strings[index]))
			{
				text = strings[index];
			}
			else
			{
				text = "";
			}
			if(is_scene_playing(text))
			{
				text = text + "";
				str_color = (0, 1, 0);
			}
			else
			{
				if(is_scene_initialized(text))
				{
					text = text + "";
					str_color = (0, 1, 0);
				}
				else
				{
					str_color = (1, 1, 1);
				}
			}
			if(i == 5)
			{
				text = ("" + text) + "";
				str_color = (0.8, 0.4, 0);
			}
			debug2dtext((136, 400 + (i * 25), 0), text, str_color, 1, (0, 0, 0), 1, 1, var_444abf97);
		}
	#/
}

/*
	Name: is_scene_playing
	Namespace: scene
	Checksum: 0xF5E6F1E2
	Offset: 0x1C10
	Size: 0x5E
	Parameters: 1
	Flags: None
*/
function is_scene_playing(str_scene)
{
	/#
		if(str_scene != "" && str_scene != "")
		{
			if(level flag::get(str_scene + ""))
			{
				return true;
			}
		}
		return false;
	#/
}

/*
	Name: is_scene_initialized
	Namespace: scene
	Checksum: 0xEC8ADBAF
	Offset: 0x1C78
	Size: 0x5E
	Parameters: 1
	Flags: None
*/
function is_scene_initialized(str_scene)
{
	/#
		if(str_scene != "" && str_scene != "")
		{
			if(level flag::get(str_scene + ""))
			{
				return true;
			}
		}
		return false;
	#/
}

/*
	Name: test_init
	Namespace: scene
	Checksum: 0xD7BD2F44
	Offset: 0x1CE0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function test_init(arg1)
{
	/#
		init(arg1, undefined, undefined, 1);
	#/
}

/*
	Name: function_3bafd088
	Namespace: scene
	Checksum: 0x3EF2569D
	Offset: 0x1D18
	Size: 0x19A
	Parameters: 1
	Flags: None
*/
function function_3bafd088(var_a572f325)
{
	/#
		/#
			if(getdvarint(#"dvr_enable", 0) > 0 && getdvarint(#"scr_scene_dvr", 0) > 0)
			{
				if(!isdefined(var_a572f325))
				{
					var_a572f325 = spawnstruct();
				}
				var_a572f325.var_3ee40508 = getdvarint(#"hash_13d62f4d290ef671", 0);
				var_a572f325.var_2640d68e = getdvarint(#"scr_show_shot_info_for_igcs", 0);
				var_a572f325.drawfps = getdvarint(#"cg_drawfps", 1);
				level.var_a572f325 = var_a572f325;
				setdvar(#"hash_13d62f4d290ef671", 1);
				setdvar(#"scr_show_shot_info_for_igcs", 1);
				setdvar(#"cg_drawfps", 0);
				adddebugcommand(0, "");
				wait(1);
			}
		#/
	#/
}

/*
	Name: function_d2785094
	Namespace: scene
	Checksum: 0x445F4CE5
	Offset: 0x1EC0
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_d2785094(var_a572f325)
{
	/#
		/#
			if(getdvarint(#"dvr_enable", 0) > 0 && getdvarint(#"scr_scene_dvr", 0) > 0)
			{
				var_3ee40508 = 0;
				var_2640d68e = 0;
				drawfps = 1;
				if(isdefined(var_a572f325))
				{
					if(isdefined(var_a572f325.var_3ee40508))
					{
						var_3ee40508 = var_a572f325.var_3ee40508;
					}
					if(isdefined(var_a572f325.var_2640d68e))
					{
						var_2640d68e = var_a572f325.var_2640d68e;
					}
					if(isdefined(var_a572f325.drawfps))
					{
						drawfps = var_a572f325.drawfps;
					}
				}
				setdvar(#"hash_13d62f4d290ef671", var_3ee40508);
				setdvar(#"scr_show_shot_info_for_igcs", var_2640d68e);
				setdvar(#"cg_drawfps", drawfps);
				adddebugcommand(0, "");
			}
		#/
	#/
}

/*
	Name: test_play
	Namespace: scene
	Checksum: 0xA34F87D1
	Offset: 0x2040
	Size: 0xF4
	Parameters: 3
	Flags: None
*/
function test_play(arg1, arg2, str_mode)
{
	/#
		if(!isdefined(level.var_a572f325))
		{
			level.var_a572f325 = spawnstruct();
		}
		var_a572f325 = spawnstruct();
		var_a572f325.name = arg1;
		if(!isdefined(var_a572f325.name))
		{
			var_a572f325.name = self.scriptbundlename;
		}
		if(!isdefined(var_a572f325.name))
		{
			var_a572f325.name = "";
		}
		function_3bafd088(var_a572f325);
		play(arg1, arg2, undefined, 1, str_mode);
		function_d2785094(var_a572f325);
	#/
}

/*
	Name: debug_display
	Namespace: scene
	Checksum: 0xC377270A
	Offset: 0x2140
	Size: 0x390
	Parameters: 0
	Flags: None
*/
function debug_display()
{
	/#
		self endon(#"death");
		if(!is_true(self.debug_display) && self != level)
		{
			self.debug_display = 1;
			while(true)
			{
				level flag::wait_till("");
				debug_frames = randomintrange(5, 15);
				debug_time = debug_frames / 60;
				sphere(self.origin, 1, (0, 1, 1), 1, 1, 8, debug_frames);
				if(isdefined(self.scenes))
				{
					foreach(i, o_scene in self.scenes)
					{
						n_offset = 15 * (i + 1);
						print3d(self.origin - (0, 0, n_offset), o_scene._str_name, (0.8, 0.2, 0.8), 1, 0.3, debug_frames);
						print3d(self.origin - (0, 0, n_offset + 5), ("" + (isdefined([[ o_scene ]]->function_2ba44cd0()) ? "" + ([[ o_scene ]]->function_2ba44cd0()) : "")) + "", (0.8, 0.2, 0.8), 1, 0.15, debug_frames);
						print3d(self.origin - (0, 0, n_offset + 10), ("" + (isdefined(function_12479eba(o_scene._str_name)) ? "" + function_12479eba(o_scene._str_name) : "")) + "", (0.8, 0.2, 0.8), 1, 0.15, debug_frames);
					}
				}
				else
				{
					if(isdefined(self.scriptbundlename))
					{
						print3d(self.origin - vectorscale((0, 0, 1), 15), self.scriptbundlename, (0.8, 0.2, 0.8), 1, 0.3, debug_frames);
					}
					else
					{
						self.debug_display = 0;
						break;
					}
				}
				wait(debug_time);
			}
		}
	#/
}

