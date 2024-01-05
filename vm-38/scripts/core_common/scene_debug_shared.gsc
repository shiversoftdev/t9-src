#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace scene_debug_shared;

/*
	Name: function_6914a2eb
	Namespace: scene_debug_shared
	Checksum: 0x715ADF45
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6914a2eb()
{
	level notify(-1414649771);
}

#namespace scene;

/*
	Name: __init__system__
	Namespace: scene
	Checksum: 0x69CFA57C
	Offset: 0xC0
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
	Checksum: 0xDB5A95EA
	Offset: 0x108
	Size: 0x19C
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
		if(!isdefined(level.scene_roots))
		{
			level.scene_roots = [];
		}
		setdvar(#"run_client_scene", "");
		setdvar(#"init_client_scene", "");
		setdvar(#"stop_client_scene", "");
		setdvar(#"hash_62cdb8fd35a5a4c3", 0);
		level thread run_scene_tests();
		level thread toggle_scene_menu();
		level thread toggle_postfx_igc_loop();
		level thread debug_display_all();
		level thread function_42edf155();
	#/
}

/*
	Name: run_scene_tests
	Namespace: scene
	Checksum: 0xA31241C6
	Offset: 0x2B0
	Size: 0x6BE
	Parameters: 0
	Flags: None
*/
function run_scene_tests()
{
	/#
		level endon(#"run_scene_tests");
		var_cdb63291 = 0;
		while(true)
		{
			str_run_scene = getdvarstring(#"run_scene");
			a_toks = strtok(str_run_scene, "");
			str_scene = a_toks[0];
			str_shot = a_toks[1];
			str_mode = tolower(getdvarstring(#"scene_menu_mode", ""));
			if(str_mode == "" && isdefined(a_toks[2]))
			{
				str_mode = a_toks[2];
			}
			if(!isdefined(str_scene))
			{
				str_scene = "";
			}
			str_client_scene = getdvarstring(#"run_client_scene");
			b_capture = 0;
			if(b_capture)
			{
				if(str_scene != "")
				{
					setdvar(#"init_scene", str_scene);
					setdvar(#"run_scene", "");
				}
			}
			else
			{
				if(str_client_scene != "")
				{
					level util::clientnotify(str_client_scene + "");
					util::wait_network_frame();
				}
				if(str_scene != "")
				{
					setdvar(#"run_scene", "");
					b_series = str_mode == "";
					if(str_mode == "" || str_mode == "")
					{
						str_mode = str_mode + ("" + getdvarstring(#"hash_3018c0b9207d1c", ""));
						str_mode = str_mode + ("" + getdvarstring(#"hash_51617678bebb961a", ""));
						str_mode = str_mode + ("" + getdvarstring(#"hash_4bf15ae7a6fbf73c", ""));
						str_mode = str_mode + ("" + getdvarstring(#"hash_7b946c8966b56a8e", ""));
					}
					level thread test_play(str_scene, str_shot, str_mode);
				}
			}
			str_scene = getdvarstring(#"init_scene");
			str_client_scene = getdvarstring(#"init_client_scene");
			if(str_client_scene != "")
			{
				level util::clientnotify(str_client_scene + "");
				util::wait_network_frame();
			}
			if(str_scene != "")
			{
				setdvar(#"init_scene", "");
				level thread test_play(str_scene, undefined, "");
				if(b_capture)
				{
					capture_scene(str_scene, str_mode);
				}
			}
			str_scene = getdvarstring(#"stop_scene");
			str_client_scene = getdvarstring(#"stop_client_scene");
			if(str_client_scene != "")
			{
				level util::clientnotify(str_client_scene + "");
				util::wait_network_frame();
			}
			if(str_scene != "")
			{
				setdvar(#"stop_scene", "");
				function_d2785094(level.var_a572f325);
				level stop(str_scene);
			}
			str_scene = getdvarstring(#"clear_scene");
			if(str_scene != "")
			{
				setdvar(#"clear_scene", "");
				function_d2785094(level.var_a572f325);
				level stop(str_scene);
				level delete_scene_spawned_ents(str_scene);
			}
			if(var_cdb63291 != getdvarint(#"hash_62cdb8fd35a5a4c3", 0))
			{
				var_cdb63291 = getdvarint(#"hash_62cdb8fd35a5a4c3", 0);
				if(var_cdb63291 == 1)
				{
					adddebugcommand("");
				}
				else
				{
					adddebugcommand("");
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: capture_scene
	Namespace: scene
	Checksum: 0x913F461C
	Offset: 0x978
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function capture_scene(str_scene, str_mode)
{
	/#
		setdvar(#"scene_menu", 0);
		level play(str_scene, undefined, undefined, 1, str_mode);
	#/
}

/*
	Name: toggle_scene_menu
	Namespace: scene
	Checksum: 0x2361F99
	Offset: 0x9E8
	Size: 0x244
	Parameters: 0
	Flags: None
*/
function toggle_scene_menu()
{
	/#
		setdvar(#"scene_menu", 0);
		n_scene_menu_last = -1;
		while(true)
		{
			n_scene_menu = getdvarstring(#"scene_menu");
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
							function_1f93be7b();
							level flag::clear(#"menu_open");
							level flag::clear(#"menu_open");
							level flag::clear(#"hash_4035a6aa4a6ba08d");
							level flag::clear(#"hash_7b50fddf7a4b9e2e");
							level flag::clear(#"hash_5bcd66a9c21f5b2d");
							level notify(#"scene_menu_cleanup");
							setdvar(#"bgcache_disablewarninghints", 0);
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
	Checksum: 0x5ED9BBE9
	Offset: 0xC38
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
	Name: function_70042fe2
	Namespace: scene
	Checksum: 0x61A2732A
	Offset: 0xD18
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_70042fe2(str_scene)
{
	/#
		if(!level flag::get(""))
		{
			level flag::set("");
			level.var_a97df3b7 = str_scene;
			function_27f5972e(str_scene);
		}
	#/
}

/*
	Name: function_1f93be7b
	Namespace: scene
	Checksum: 0x2B0CD32
	Offset: 0xD98
	Size: 0x76
	Parameters: 0
	Flags: None
*/
function function_1f93be7b()
{
	/#
		if(level flag::get("") && isdefined(level.var_a97df3b7))
		{
			level flag::clear("");
			function_f81475ae(level.var_a97df3b7);
			level.var_a97df3b7 = undefined;
		}
	#/
}

/*
	Name: display_scene_menu
	Namespace: scene
	Checksum: 0x7675FF07
	Offset: 0xE18
	Size: 0xFC6
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
		setdvar(#"bgcache_disablewarninghints", 1);
		setdvar(#"cl_tacticalhud", 0);
		names = [];
		b_shot_menu = 0;
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
			names[names.size] = "";
			str_title = str_scene;
			b_shot_menu = 1;
			selected = (isdefined(level.scene_menu_shot_index) ? level.scene_menu_shot_index : 0);
		}
		else
		{
			level flag::set(str_type + "");
			if(level flag::get(#"hash_5bcd66a9c21f5b2d"))
			{
				println(("" + toupper(str_type)) + "");
			}
			var_72acc069 = 1;
			foreach(str_scenedef in level.scenedefs)
			{
				s_scenedef = getscriptbundle(str_scenedef);
				if(s_scenedef.vmtype !== "" && s_scenedef.scenetype === str_type)
				{
					if(level flag::get(#"hash_5bcd66a9c21f5b2d"))
					{
						if(is_scene_active(s_scenedef.name) && function_c0f30783(s_scenedef))
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
			foreach(str_scene_name in names)
			{
				var_69836136 = getsubstr(str_scene_name, 0, 4);
				if(var_69836136 == "")
				{
					arrayremovevalue(names, str_scene_name);
					array::push_front(names, str_scene_name);
				}
			}
			names[names.size] = "";
			names[names.size] = "";
			array::push_front(names, "");
			array::push_front(names, "");
			str_title = str_type + "";
			selected = (isdefined(level.scene_menu_index) ? level.scene_menu_index : 0);
		}
		if(selected > names.size - 1)
		{
			selected = 0;
		}
		if(!b_shot_menu && !level flag::get(#"scene_menu_disable"))
		{
			debug2dtext((150, 410 + 400, 0), "", (1, 1, 1), 1, (0, 0, 0), 1, 2);
		}
		up_pressed = 0;
		down_pressed = 0;
		held = 0;
		old_selected = selected;
		while(true)
		{
			if(!isdefined(level.host))
			{
				waitframe(1);
				continue;
			}
			if(b_shot_menu)
			{
				if(isdefined(level.last_scene_state) && isdefined(level.last_scene_state[str_scene]))
				{
					str_title = ((str_scene + "") + level.last_scene_state[str_scene]) + "";
				}
				else
				{
					str_title = str_scene;
				}
				function_70042fe2(str_scene);
			}
			else
			{
				function_1f93be7b();
			}
			if(held)
			{
				scene_list_settext(names, selected, str_title, b_shot_menu, 10);
				wait(0.5);
			}
			else
			{
				scene_list_settext(names, selected, str_title, b_shot_menu, 1);
			}
			if(!up_pressed)
			{
				if(level.host util::up_button_pressed())
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
				if(level.host util::up_button_held())
				{
					held = 1;
					selected = selected - 10;
				}
				else if(!level.host util::up_button_pressed())
				{
					held = 0;
					up_pressed = 0;
				}
			}
			if(!down_pressed)
			{
				if(level.host util::down_button_pressed())
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
				if(level.host util::down_button_held())
				{
					held = 1;
					selected = selected + 10;
				}
				else if(!level.host util::down_button_pressed())
				{
					held = 0;
					down_pressed = 0;
				}
			}
			if(!down_pressed && !up_pressed)
			{
				if(names[selected] === "")
				{
					selected++;
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
			if(level.host buttonpressed(""))
			{
				if(b_shot_menu)
				{
					while(level.host buttonpressed(""))
					{
						waitframe(1);
					}
					level.scene_menu_shot_index = selected;
					level thread display_scene_menu(str_type);
				}
				else
				{
					level.scene_menu_index = selected;
					setdvar(#"scene_menu", 0);
				}
			}
			if(names[selected] != "" && !b_shot_menu)
			{
				if(level.host buttonpressed("") || level.host buttonpressed(""))
				{
					level.host move_to_scene(names[selected]);
					while(level.host buttonpressed("") || level.host buttonpressed(""))
					{
						waitframe(1);
					}
				}
				else if(level.host buttonpressed("") || level.host buttonpressed(""))
				{
					level.host move_to_scene(names[selected], 1);
					while(level.host buttonpressed("") || level.host buttonpressed(""))
					{
						waitframe(1);
					}
				}
			}
			if(b_shot_menu && function_940c526f() && isdefined(str_scene) && function_9730988a(str_scene, names[selected]))
			{
				setdvar(#"run_scene", (((str_scene + "") + names[selected]) + "") + "");
			}
			else if(function_606f1f21())
			{
				if(names[selected] == "")
				{
					level flag::toggle("");
					while(function_606f1f21())
					{
						waitframe(1);
					}
					level thread display_scene_menu(str_type);
				}
				else
				{
					if(names[selected] == "")
					{
						setdvar(#"scene_menu", 0);
					}
					else if(b_shot_menu)
					{
						if(names[selected] == "")
						{
							level.scene_menu_shot_index = selected;
							while(function_606f1f21())
							{
								waitframe(1);
							}
							level thread display_scene_menu(str_type);
						}
						else
						{
							if(names[selected] == "")
							{
								setdvar(#"stop_scene", str_scene);
							}
							else
							{
								if(names[selected] == "")
								{
									setdvar(#"clear_scene", str_scene);
								}
								else
								{
									if(names[selected] == "")
									{
										setdvar(#"init_scene", str_scene);
									}
									else
									{
										if(names[selected] == "")
										{
											setdvar(#"run_scene", str_scene);
										}
										else
										{
											setdvar(#"run_scene", (str_scene + "") + names[selected]);
										}
									}
								}
							}
						}
					}
				}
				while(function_606f1f21() || function_940c526f())
				{
					waitframe(1);
				}
				if(!b_shot_menu && isdefined(names[selected]) && names[selected] != "")
				{
					level.scene_menu_index = selected;
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
	Checksum: 0xF8244FC8
	Offset: 0x1DE8
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
	Name: function_606f1f21
	Namespace: scene
	Checksum: 0x7D6FE21D
	Offset: 0x1E78
	Size: 0x80
	Parameters: 0
	Flags: None
*/
function function_606f1f21()
{
	/#
		if(level.host buttonpressed("") || level.host buttonpressed("") || level.host buttonpressed(""))
		{
			return true;
		}
		return false;
	#/
}

/*
	Name: function_940c526f
	Namespace: scene
	Checksum: 0xF88092F7
	Offset: 0x1F08
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function function_940c526f()
{
	/#
		if(level.host buttonpressed(""))
		{
			return true;
		}
		return false;
	#/
}

/*
	Name: scene_list_settext
	Namespace: scene
	Checksum: 0xAC04C304
	Offset: 0x1F48
	Size: 0x74
	Parameters: 5
	Flags: None
*/
function scene_list_settext(strings, n_selected, str_title, b_shot_menu, var_444abf97)
{
	/#
		if(!level flag::get(#"scene_menu_disable"))
		{
			thread _scene_list_settext(strings, n_selected, str_title, b_shot_menu, var_444abf97);
		}
	#/
}

/*
	Name: _scene_list_settext
	Namespace: scene
	Checksum: 0x3D9F99D5
	Offset: 0x1FC8
	Size: 0x434
	Parameters: 5
	Flags: Private
*/
function private _scene_list_settext(strings, n_selected, str_title, b_shot_menu, var_444abf97)
{
	/#
		if(!isdefined(b_shot_menu))
		{
			b_shot_menu = 0;
		}
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
			str_scene = text;
			if(isdefined(level.last_scene_state) && isdefined(level.last_scene_state[text]))
			{
				text = text + (("" + level.last_scene_state[text]) + "");
			}
			if(i == 5)
			{
				text = ("" + text) + "";
				str_color = (0.8, 0.4, 0);
			}
			else
			{
				if(is_scene_active(str_scene))
				{
					str_color = (0, 1, 0);
				}
				else
				{
					str_color = (1, 1, 1);
				}
			}
			debug2dtext((136, 400 + (i * 25), 0), text, str_color, 1, (0, 0, 0), 1, 1, var_444abf97);
		}
		if(b_shot_menu)
		{
			debug2dtext((150, 410 + 400, 0), "", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
		}
		else
		{
			debug2dtext((150, 410 + 400, 0), "", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
		}
	#/
}

/*
	Name: is_scene_active
	Namespace: scene
	Checksum: 0x476541AF
	Offset: 0x2408
	Size: 0x56
	Parameters: 1
	Flags: None
*/
function is_scene_active(str_scene)
{
	/#
		if(str_scene != "" && str_scene != "")
		{
			if(level is_active(str_scene))
			{
				return true;
			}
		}
		return false;
	#/
}

/*
	Name: function_3bafd088
	Namespace: scene
	Checksum: 0x8944070B
	Offset: 0x2468
	Size: 0x192
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
				adddebugcommand("");
				wait(1);
			}
		#/
	#/
}

/*
	Name: function_d2785094
	Namespace: scene
	Checksum: 0x929C21E5
	Offset: 0x2608
	Size: 0x16C
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
				adddebugcommand("");
			}
		#/
	#/
}

/*
	Name: test_play
	Namespace: scene
	Checksum: 0x2E1613C1
	Offset: 0x2780
	Size: 0x11C
	Parameters: 3
	Flags: None
*/
function test_play(arg1, arg2, str_mode)
{
	/#
		n_skipto = getdvarfloat(#"scr_scene_skipto_time", 0);
		if(n_skipto > 0)
		{
			str_mode = str_mode + ("" + n_skipto);
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
	Name: debug_display_all
	Namespace: scene
	Checksum: 0x1FB55477
	Offset: 0x28A8
	Size: 0x12A
	Parameters: 0
	Flags: None
*/
function debug_display_all()
{
	/#
		while(true)
		{
			level flag::wait_till("");
			debug_frames = randomintrange(5, 10);
			debug_time = debug_frames / 20;
			if(isdefined(level.scene_roots))
			{
				arrayremovevalue(level.scene_roots, undefined);
				foreach(scene in level.scene_roots)
				{
					scene debug_display(debug_frames);
				}
			}
			wait(debug_time);
		}
	#/
}

/*
	Name: debug_display
	Namespace: scene
	Checksum: 0xCCAABEC5
	Offset: 0x29E0
	Size: 0x30C
	Parameters: 1
	Flags: None
*/
function debug_display(debug_frames)
{
	/#
		sphere(debug_display_origin(), 1, (1, 1, 0), 1, 1, 8, debug_frames);
		i = 0;
		if(self == level)
		{
			b_found = 0;
			if(isdefined(self.scene_ents))
			{
				foreach(scene in self.scene_ents)
				{
					if(isarray(scene))
					{
						foreach(ent in scene)
						{
							if(isdefined(ent))
							{
								b_found = 1;
								print_scene_debug(debug_frames, i, k, self.last_scene_state_instance[k]);
								i++;
								break;
							}
						}
					}
				}
			}
			if(!b_found)
			{
				return;
			}
		}
		else
		{
			if(isdefined(self.last_scene_state_instance))
			{
				foreach(str_state in self.last_scene_state_instance)
				{
					print_scene_debug(debug_frames, i, str_scene, str_state);
					i++;
				}
			}
			else if(isdefined(self.scriptbundlename))
			{
				if(ishash(self.scriptbundlename))
				{
					str_scene = function_9e72a96(self.scriptbundlename);
				}
				else
				{
					str_scene = self.scriptbundlename;
				}
				n_offset = 15;
				print3d(debug_display_origin() - (0, 0, n_offset), str_scene, (0.8, 0.2, 0.8), 1, 0.3, debug_frames);
			}
		}
	#/
}

/*
	Name: print_scene_debug
	Namespace: scene
	Checksum: 0x68AEE50E
	Offset: 0x2CF8
	Size: 0x124
	Parameters: 4
	Flags: None
*/
function print_scene_debug(debug_frames, i, str_scene, str_state)
{
	/#
		v_origin = debug_display_origin();
		n_offset = 15 * (i + 1);
		str_scene = function_9e72a96(str_scene);
		print3d(v_origin - (0, 0, n_offset), str_scene, (0.8, 0.2, 0.8), 1, 0.3, debug_frames);
		print3d(v_origin - (0, 0, n_offset + 5), ("" + str_state) + "", (0.8, 0.2, 0.8), 1, 0.15, debug_frames);
	#/
}

/*
	Name: debug_display_origin
	Namespace: scene
	Checksum: 0xAEC54BB0
	Offset: 0x2E28
	Size: 0x26
	Parameters: 0
	Flags: None
*/
function debug_display_origin()
{
	/#
		if(self == level)
		{
			return (0, 0, 0);
		}
		return self.origin;
	#/
}

/*
	Name: move_to_scene
	Namespace: scene
	Checksum: 0x95A0FE2D
	Offset: 0x2E58
	Size: 0x24C
	Parameters: 2
	Flags: None
*/
function move_to_scene(str_scene, b_reverse_dir)
{
	/#
		if(!isdefined(b_reverse_dir))
		{
			b_reverse_dir = 0;
		}
		if(level.debug_current_scene_name !== str_scene)
		{
			level.debug_current_scene_instances = struct::get_array(str_scene, "");
			level.debug_current_scene_index = 0;
			level.debug_current_scene_name = str_scene;
		}
		else
		{
			if(b_reverse_dir)
			{
				level.debug_current_scene_index--;
				if(level.debug_current_scene_index == -1)
				{
					level.debug_current_scene_index = level.debug_current_scene_instances.size - 1;
				}
			}
			else
			{
				level.debug_current_scene_index++;
				if(level.debug_current_scene_index == level.debug_current_scene_instances.size)
				{
					level.debug_current_scene_index = 0;
				}
			}
		}
		if(level.debug_current_scene_instances.size == 0)
		{
			s_bundle = getscriptbundle(str_scene);
			if(!isdefined(s_bundle))
			{
				error_on_screen("" + str_scene);
			}
			else
			{
				if(isdefined(s_bundle.aligntarget))
				{
					e_align = get_existing_ent(s_bundle.aligntarget, 0, 1);
					if(isdefined(e_align))
					{
						level.host set_origin(e_align.origin);
					}
					else
					{
						error_on_screen("");
					}
				}
				else
				{
					error_on_screen("");
				}
			}
		}
		else
		{
			s_scene = level.debug_current_scene_instances[level.debug_current_scene_index];
			level.host set_origin(s_scene.origin);
		}
	#/
}

/*
	Name: set_origin
	Namespace: scene
	Checksum: 0x96E61B6
	Offset: 0x30B0
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function set_origin(v_origin)
{
	/#
		if(!self isinmovemode("", ""))
		{
			adddebugcommand("");
		}
		self setorigin(v_origin);
	#/
}

/*
	Name: toggle_postfx_igc_loop
	Namespace: scene
	Checksum: 0x1EC48407
	Offset: 0x3120
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function toggle_postfx_igc_loop()
{
	/#
		while(true)
		{
			if(getdvarint(#"scr_postfx_igc_loop", 0))
			{
				array::run_all(function_a1ef346b(), &clientfield::increment_to_player, "", 1);
				wait(4);
			}
			wait(1);
		}
	#/
}

/*
	Name: function_42edf155
	Namespace: scene
	Checksum: 0x7CA369BC
	Offset: 0x31B0
	Size: 0x2D6
	Parameters: 0
	Flags: None
*/
function function_42edf155()
{
	/#
		while(true)
		{
			var_45ec9741 = getdvarint(#"hash_1c68b689a2dac0fa", 0);
			if(var_45ec9741 != 0)
			{
				position_x = 0;
				position_y = 0;
				position_z = 0;
				angle_x = 0;
				angle_y = 0;
				angle_z = 0;
				align_target = getdvarstring(#"hash_442538f50d245600");
				align_tag = getdvarstring(#"hash_2004f1dddc83a63b");
				s = get_existing_ent(align_target, 0, 1);
				if(isdefined(s))
				{
					if(align_tag != "")
					{
						s = animation::_get_align_pos(s, align_tag);
					}
					position_x = s.origin[0];
					position_y = s.origin[1];
					position_z = s.origin[2];
					angle_x = s.angles[0];
					angle_y = s.angles[1];
					angle_z = s.angles[2];
				}
				setdvar(#"hash_6c03d4e558bf8abd", position_x);
				setdvar(#"hash_6c03d3e558bf890a", position_y);
				setdvar(#"hash_6c03d2e558bf8757", position_z);
				setdvar(#"hash_277ac0be2726df0f", angle_x);
				setdvar(#"hash_277abfbe2726dd5c", angle_y);
				setdvar(#"hash_277ac2be2726e275", angle_z);
				setdvar(#"hash_1c68b689a2dac0fa", 0);
			}
			waitframe(1);
		}
	#/
}

