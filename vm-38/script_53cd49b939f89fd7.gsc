#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\custom_class.csc;
#using scripts\core_common\character_customization.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_d5a9ff55;

/*
	Name: function_fcc676ea
	Namespace: namespace_d5a9ff55
	Checksum: 0xB9BCAF18
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fcc676ea()
{
	level notify(1212453196);
}

/*
	Name: __init__system__
	Namespace: namespace_d5a9ff55
	Checksum: 0xE3BB7F7C
	Offset: 0x140
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_24fe7853d0e9dd01", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d5a9ff55
	Checksum: 0xDD3DB44
	Offset: 0x188
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.client_menus = associativearray();
	level.var_a14cc36b = [];
	callback::on_localclient_connect(&on_player_connect);
}

/*
	Name: on_player_connect
	Namespace: namespace_d5a9ff55
	Checksum: 0x4DA5933B
	Offset: 0x1E0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_player_connect(local_client_num)
{
	level thread client_menus(local_client_num);
}

/*
	Name: function_6f3e10a2
	Namespace: namespace_d5a9ff55
	Checksum: 0xBFBE0237
	Offset: 0x210
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function function_6f3e10a2(var_c12be4a6)
{
	if(!isdefined(var_c12be4a6))
	{
		return undefined;
	}
	data = function_63446d7f(var_c12be4a6);
	if(isdefined(data) && isdefined(var_c12be4a6.state))
	{
		data = (isdefined(data.states[var_c12be4a6.state]) ? data.states[var_c12be4a6.state] : data);
	}
	return data;
}

/*
	Name: function_63446d7f
	Namespace: namespace_d5a9ff55
	Checksum: 0xEDE40DC3
	Offset: 0x2A0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_63446d7f(var_c12be4a6)
{
	if(!isdefined(var_c12be4a6))
	{
		return undefined;
	}
	return level.client_menus[var_c12be4a6.menu_name];
}

/*
	Name: function_1337c436
	Namespace: namespace_d5a9ff55
	Checksum: 0x3FBEABCA
	Offset: 0x2D8
	Size: 0xDE
	Parameters: 3
	Flags: Linked
*/
function function_1337c436(menu_name, target_name, alt_render_mode)
{
	if(!isdefined(alt_render_mode))
	{
		alt_render_mode = 1;
	}
	/#
		assert(isdefined(level.client_menus[menu_name]), ("" + menu_name) + "");
	#/
	menu_data = level.client_menus[menu_name];
	/#
		assert(!isdefined(menu_data.var_cf15815a), ("" + menu_name) + "");
	#/
	menu_data.var_cf15815a = target_name;
	menu_data.var_c27fdce9 = alt_render_mode;
}

/*
	Name: function_daadc836
	Namespace: namespace_d5a9ff55
	Checksum: 0x6895549F
	Offset: 0x3C0
	Size: 0x140
	Parameters: 2
	Flags: Linked
*/
function function_daadc836(menu_name, local_client_num)
{
	if(isdefined(menu_name))
	{
		menu_data = level.client_menus[menu_name];
		character = menu_data.custom_characters[local_client_num];
		if(!isdefined(character) && isdefined(menu_data.var_cf15815a))
		{
			model = getent(local_client_num, menu_data.var_cf15815a, "targetname");
			if(!isdefined(model))
			{
				model = util::spawn_model(local_client_num, "tag_origin");
				model.targetname = menu_data.var_cf15815a;
			}
			model useanimtree("all_player");
			menu_data.custom_characters[local_client_num] = character_customization::function_dd295310(model, local_client_num, menu_data.var_c27fdce9);
			model hide();
			character = menu_data.custom_characters[local_client_num];
		}
	}
	return character;
}

/*
	Name: function_e41243c1
	Namespace: namespace_d5a9ff55
	Checksum: 0xD86F47AA
	Offset: 0x508
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function function_e41243c1(var_e953aca6)
{
	if(!isdefined(var_e953aca6))
	{
		return array();
	}
	if(isarray(var_e953aca6))
	{
		return var_e953aca6;
	}
	return array(var_e953aca6);
}

/*
	Name: function_f603fc4d
	Namespace: namespace_d5a9ff55
	Checksum: 0x4C372D90
	Offset: 0x570
	Size: 0x1C4
	Parameters: 9
	Flags: Linked
*/
function function_f603fc4d(menu_name, target_name, xcam, sub_xcam, xcam_frame, var_1f199068, var_2c679be0, lerp_time, lut_index)
{
	if(!isdefined(xcam_frame))
	{
		xcam_frame = undefined;
	}
	if(!isdefined(var_1f199068))
	{
		var_1f199068 = undefined;
	}
	if(!isdefined(var_2c679be0))
	{
		var_2c679be0 = undefined;
	}
	if(!isdefined(lerp_time))
	{
		lerp_time = 0;
	}
	if(!isdefined(lut_index))
	{
		lut_index = 0;
	}
	/#
		assert(!isdefined(level.client_menus[menu_name]), ("" + menu_name) + "");
	#/
	level.client_menus[menu_name] = {#hash_e57ed98b:[], #lut_index:lut_index, #lerp_time:lerp_time, #hash_2c679be0:function_e41243c1(var_2c679be0), #hash_1f199068:function_e41243c1(var_1f199068), #xcam_frame:xcam_frame, #sub_xcam:sub_xcam, #xcam:xcam, #target_name:target_name, #menu_name:menu_name};
	return level.client_menus[menu_name];
}

/*
	Name: function_460e6001
	Namespace: namespace_d5a9ff55
	Checksum: 0x2E5353A1
	Offset: 0x740
	Size: 0x130
	Parameters: 8
	Flags: Linked
*/
function function_460e6001(menu_name, session_mode, target_name, xcam, sub_xcam, xcam_frame, lerp_time, lut_index)
{
	if(!isdefined(xcam_frame))
	{
		xcam_frame = undefined;
	}
	if(!isdefined(lerp_time))
	{
		lerp_time = 0;
	}
	if(!isdefined(lut_index))
	{
		lut_index = 0;
	}
	/#
		assert(isdefined(level.client_menus[menu_name]), ("" + menu_name) + "");
	#/
	level.client_menus[menu_name].var_e57ed98b[session_mode] = {#lut_index:lut_index, #lerp_time:lerp_time, #xcam_frame:xcam_frame, #sub_xcam:sub_xcam, #xcam:xcam, #target_name:target_name};
}

/*
	Name: function_969a2881
	Namespace: namespace_d5a9ff55
	Checksum: 0xC1E212B4
	Offset: 0x878
	Size: 0x16C
	Parameters: 7
	Flags: Linked
*/
function function_969a2881(menu_name, camera_function, has_state, var_1f199068, var_2c679be0, lut_index, var_ef0a4d1e)
{
	if(!isdefined(var_1f199068))
	{
		var_1f199068 = undefined;
	}
	if(!isdefined(var_2c679be0))
	{
		var_2c679be0 = undefined;
	}
	if(!isdefined(lut_index))
	{
		lut_index = 0;
	}
	/#
		assert(!isdefined(level.client_menus[menu_name]), ("" + menu_name) + "");
	#/
	level.client_menus[menu_name] = {#hash_ef0a4d1e:var_ef0a4d1e, #lut_index:lut_index, #hash_2c679be0:function_e41243c1(var_2c679be0), #hash_1f199068:function_e41243c1(var_1f199068), #has_state:has_state, #camera_function:camera_function, #menu_name:menu_name};
	return level.client_menus[menu_name];
}

/*
	Name: function_6425472c
	Namespace: namespace_d5a9ff55
	Checksum: 0x509E708E
	Offset: 0x9F0
	Size: 0x124
	Parameters: 5
	Flags: Linked
*/
function function_6425472c(menu_name, str_scene, var_f647c5b2, var_559c5c3e, var_3e7fd594)
{
	if(!isdefined(var_f647c5b2))
	{
		var_f647c5b2 = undefined;
	}
	if(!isdefined(var_559c5c3e))
	{
		var_559c5c3e = undefined;
	}
	if(!isdefined(var_3e7fd594))
	{
		var_3e7fd594 = undefined;
	}
	/#
		assert(!isdefined(level.client_menus[menu_name]), ("" + menu_name) + "");
	#/
	level.client_menus[menu_name] = {#hash_b80d1ad4:[], #states:[], #hash_3e7fd594:var_3e7fd594, #hash_559c5c3e:var_559c5c3e, #hash_f647c5b2:var_f647c5b2, #str_scene:str_scene, #menu_name:menu_name};
	return level.client_menus[menu_name];
}

/*
	Name: function_17384292
	Namespace: namespace_d5a9ff55
	Checksum: 0xCC35C8CE
	Offset: 0xB20
	Size: 0x6E
	Parameters: 2
	Flags: Linked
*/
function function_17384292(menu_name, callback_fn)
{
	/#
		assert(isdefined(level.client_menus[menu_name]), ("" + menu_name) + "");
	#/
	level.client_menus[menu_name].var_a362e358 = callback_fn;
}

/*
	Name: function_866692f8
	Namespace: namespace_d5a9ff55
	Checksum: 0x2DBD8445
	Offset: 0xB98
	Size: 0x118
	Parameters: 6
	Flags: Linked
*/
function function_866692f8(menu_name, state, str_scene, var_f647c5b2, var_559c5c3e, var_3e7fd594)
{
	if(!isdefined(var_f647c5b2))
	{
		var_f647c5b2 = undefined;
	}
	if(!isdefined(var_559c5c3e))
	{
		var_559c5c3e = undefined;
	}
	if(!isdefined(var_3e7fd594))
	{
		var_3e7fd594 = undefined;
	}
	/#
		assert(isdefined(level.client_menus[menu_name]), ("" + menu_name) + "");
	#/
	level.client_menus[menu_name].states[state] = {#hash_b80d1ad4:[], #hash_3e7fd594:var_3e7fd594, #hash_559c5c3e:var_559c5c3e, #hash_f647c5b2:var_f647c5b2, #str_scene:str_scene, #menu_name:menu_name};
}

/*
	Name: function_f852c52c
	Namespace: namespace_d5a9ff55
	Checksum: 0x45D5CD62
	Offset: 0xCB8
	Size: 0x16A
	Parameters: 4
	Flags: Linked
*/
function function_f852c52c(menu_name, state_name, var_a180b828, var_a7c679da)
{
	if(!isdefined(state_name))
	{
		state_name = undefined;
	}
	if(!isdefined(var_a180b828))
	{
		var_a180b828 = 1;
	}
	if(!isdefined(var_a7c679da))
	{
		var_a7c679da = 1;
	}
	/#
		assert(isdefined(level.client_menus[menu_name]), ("" + menu_name) + "");
	#/
	if(isdefined(state_name))
	{
		/#
			assert(isdefined(level.client_menus[menu_name].states[state_name]), ((("" + menu_name) + "") + state_name) + "");
		#/
		level.client_menus[menu_name].states[state_name].var_b2ad82eb = var_a180b828;
		level.client_menus[menu_name].states[state_name].var_c9213d93 = var_a7c679da;
	}
	else
	{
		level.client_menus[menu_name].var_b2ad82eb = var_a180b828;
		level.client_menus[menu_name].var_c9213d93 = var_a7c679da;
	}
}

/*
	Name: function_8950260c
	Namespace: namespace_d5a9ff55
	Checksum: 0xCE60ABB3
	Offset: 0xE30
	Size: 0x15C
	Parameters: 4
	Flags: Linked
*/
function function_8950260c(menu_name, from_state, to_state, str_shot)
{
	if(!isdefined(from_state))
	{
		from_state = "__default__";
	}
	if(!isdefined(to_state))
	{
		to_state = "__default__";
	}
	/#
		assert(from_state !== to_state, (("" + menu_name) + "") + (isdefined(from_state) ? "" + from_state : "") + "");
	#/
	/#
		assert(isdefined(level.client_menus[menu_name]), ("" + menu_name) + "");
	#/
	menu = level.client_menus[menu_name];
	if(from_state != "__default__" && isdefined(menu.states[from_state]))
	{
		menu.states[from_state].var_b80d1ad4[to_state] = str_shot;
	}
	else
	{
		menu.states.var_b80d1ad4[to_state] = str_shot;
	}
}

/*
	Name: function_de0ab
	Namespace: namespace_d5a9ff55
	Checksum: 0x7A8E880C
	Offset: 0xF98
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_de0ab(menu_name, custom_open_fn)
{
	/#
		assert(isdefined(level.client_menus[menu_name]));
	#/
	if(!isdefined(level.client_menus[menu_name].var_1f199068))
	{
		level.client_menus[menu_name].var_1f199068 = [];
	}
	else if(!isarray(level.client_menus[menu_name].var_1f199068))
	{
		level.client_menus[menu_name].var_1f199068 = array(level.client_menus[menu_name].var_1f199068);
	}
	level.client_menus[menu_name].var_1f199068[level.client_menus[menu_name].var_1f199068.size] = custom_open_fn;
}

/*
	Name: function_13b48f53
	Namespace: namespace_d5a9ff55
	Checksum: 0x940AC1B5
	Offset: 0x10B0
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_13b48f53(menu_name, custom_close_fn)
{
	/#
		assert(isdefined(level.client_menus[menu_name]));
	#/
	if(!isdefined(level.client_menus[menu_name].var_2c679be0))
	{
		level.client_menus[menu_name].var_2c679be0 = [];
	}
	else if(!isarray(level.client_menus[menu_name].var_2c679be0))
	{
		level.client_menus[menu_name].var_2c679be0 = array(level.client_menus[menu_name].var_2c679be0);
	}
	level.client_menus[menu_name].var_2c679be0[level.client_menus[menu_name].var_2c679be0.size] = custom_close_fn;
}

/*
	Name: function_ffa1213e
	Namespace: namespace_d5a9ff55
	Checksum: 0x48B59A59
	Offset: 0x11C8
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function function_ffa1213e(var_8de6b51a, var_e3315405)
{
	var_cd1475a5 = function_6f3e10a2(var_8de6b51a);
	new_menu = function_6f3e10a2(var_e3315405);
	if(var_cd1475a5.menu_name === new_menu.menu_name)
	{
		return var_cd1475a5.var_b80d1ad4[(isdefined(var_e3315405.state) ? var_e3315405.state : "__default__")];
	}
	return undefined;
}

/*
	Name: setup_menu
	Namespace: namespace_d5a9ff55
	Checksum: 0x3B0AA681
	Offset: 0x1270
	Size: 0x7B4
	Parameters: 3
	Flags: Linked
*/
function setup_menu(local_client_num, var_8de6b51a, var_e3315405)
{
	var_cd1475a5 = function_6f3e10a2(var_8de6b51a);
	var_a8080f41 = function_6f3e10a2(var_8de6b51a);
	new_menu = function_6f3e10a2(var_e3315405);
	var_f81682ee = function_63446d7f(var_e3315405);
	var_fdb39764 = var_cd1475a5.menu_name === new_menu.menu_name;
	var_d2bf9838 = var_cd1475a5.str_scene !== level.var_6dfc0bcf;
	var_ad156153 = function_daadc836(var_cd1475a5.menu_name, local_client_num);
	var_9168605c = function_daadc836(new_menu.menu_name, local_client_num);
	if(isdefined(var_cd1475a5))
	{
		if(!var_fdb39764)
		{
			if(isdefined(var_a8080f41.var_2c679be0))
			{
				foreach(fn in var_a8080f41.var_2c679be0)
				{
					if(is_true(var_a8080f41.var_ef0a4d1e))
					{
						level [[fn]](local_client_num, var_a8080f41);
						continue;
					}
					level thread [[fn]](local_client_num, var_a8080f41);
				}
			}
			if(!var_fdb39764 && isdefined(var_cd1475a5.str_scene) && var_d2bf9838)
			{
				outro = (isdefined(var_cd1475a5.var_3e7fd594) ? var_cd1475a5.var_3e7fd594 : var_a8080f41.var_3e7fd594);
				if(isdefined(outro))
				{
					function_7851a662(var_cd1475a5, outro);
				}
				else
				{
					function_4c61e7c(var_cd1475a5);
				}
			}
			level notify(var_8de6b51a.menu_name + "_closed");
			if(isdefined(var_a8080f41.camera_function))
			{
				stopmaincamxcam(local_client_num);
			}
			else if(isdefined(var_a8080f41.xcam))
			{
				stopmaincamxcam(local_client_num);
			}
			if(isdefined(var_ad156153) && var_ad156153 !== var_9168605c)
			{
				[[ var_ad156153 ]]->hide_model();
				[[ var_ad156153 ]]->function_39a68bf2();
			}
		}
	}
	if(isdefined(new_menu))
	{
		if((isdefined(var_cd1475a5.var_b2ad82eb) ? var_cd1475a5.var_b2ad82eb : var_a8080f41.var_b2ad82eb) !== (isdefined(new_menu.var_b2ad82eb) ? new_menu.var_b2ad82eb : var_f81682ee.var_b2ad82eb))
		{
			if(is_true((isdefined(new_menu.var_b2ad82eb) ? new_menu.var_b2ad82eb : var_f81682ee.var_b2ad82eb)))
			{
				customclass::function_831397a7(local_client_num, is_true((isdefined(new_menu.var_c9213d93) ? new_menu.var_c9213d93 : var_f81682ee.var_c9213d93)));
			}
			else
			{
				customclass::function_415febc4(local_client_num);
			}
		}
		if(isdefined(var_e3315405.charactermode) && isdefined(var_9168605c))
		{
			[[ var_9168605c ]]->set_character_mode(var_e3315405.charactermode);
		}
		if(isdefined(var_f81682ee.var_a362e358))
		{
			level thread [[var_f81682ee.var_a362e358]](local_client_num, var_e3315405.menu_name, var_e3315405.state);
		}
		var_78594590 = function_6d469004(var_e3315405, var_8de6b51a);
		if(var_fdb39764)
		{
			if(isdefined(new_menu.str_scene))
			{
				level thread function_4e55f369(var_8de6b51a, var_e3315405, var_78594590);
			}
			else if(isdefined(new_menu.camera_function))
			{
				level thread [[new_menu.camera_function]](local_client_num, var_e3315405.menu_name, var_e3315405.state);
			}
		}
		else
		{
			if(isdefined(var_9168605c))
			{
				[[ var_9168605c ]]->show_model();
			}
			if(isdefined(var_f81682ee.lut_index))
			{
				setdvar(#"vc_lut", var_f81682ee.lut_index);
			}
			if(isdefined(var_f81682ee.camera_function))
			{
				if(var_f81682ee.has_state === 1)
				{
					level thread [[var_f81682ee.camera_function]](local_client_num, var_e3315405.menu_name, var_e3315405.state);
				}
				else
				{
					level thread [[var_f81682ee.camera_function]](local_client_num, var_e3315405.menu_name);
				}
			}
			else if(isdefined(var_f81682ee.xcam))
			{
				camera_data = (isdefined(var_f81682ee.var_e57ed98b[currentsessionmode()]) ? var_f81682ee.var_e57ed98b[currentsessionmode()] : var_f81682ee);
				camera_ent = struct::get(camera_data.target_name);
				if(isdefined(camera_ent))
				{
					playmaincamxcam(local_client_num, camera_data.xcam, camera_data.lerp_time, camera_data.sub_xcam, "", camera_ent.origin, camera_ent.angles);
				}
			}
			if(isdefined(new_menu.str_scene) && (new_menu.var_559c5c3e !== var_cd1475a5.var_559c5c3e || new_menu.str_scene !== var_cd1475a5.str_scene))
			{
				level thread function_4aa3b942(new_menu, var_78594590);
			}
			if(isdefined(var_f81682ee.var_1f199068))
			{
				foreach(fn in var_f81682ee.var_1f199068)
				{
					level thread [[fn]](local_client_num, var_f81682ee);
				}
			}
		}
	}
}

/*
	Name: function_6d469004
	Namespace: namespace_d5a9ff55
	Checksum: 0xB8AF1172
	Offset: 0x1A30
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_6d469004(var_e3315405, var_8de6b51a)
{
	var_386948ca = level.client_menus[var_e3315405.menu_name].var_386948ca;
	if(isarray(var_386948ca))
	{
		foreach(var_2e96e768 in var_386948ca)
		{
			if(var_2e96e768.var_8176b3c === var_8de6b51a.menu_name && var_2e96e768.var_5e806f4a === var_8de6b51a.state && var_2e96e768.var_a62e11c1 === var_e3315405.state)
			{
				return var_2e96e768.var_b1e821c5;
			}
		}
	}
}

/*
	Name: function_55d56772
	Namespace: namespace_d5a9ff55
	Checksum: 0x7D86818D
	Offset: 0x1B48
	Size: 0x1B8
	Parameters: 5
	Flags: Linked
*/
function function_55d56772(var_7271d7d6, var_8176b3c, var_5e806f4a, var_b5964062, var_a62e11c1)
{
	/#
		assert(isdefined(level.client_menus[var_b5964062]), ("" + var_b5964062) + "");
	#/
	var_2e96e768 = {#hash_b1e821c5:var_7271d7d6, #hash_5e806f4a:var_5e806f4a, #hash_8176b3c:var_8176b3c, #hash_a62e11c1:var_a62e11c1};
	if(!isdefined(level.client_menus[var_b5964062].var_386948ca))
	{
		level.client_menus[var_b5964062].var_386948ca = [];
	}
	else if(!isarray(level.client_menus[var_b5964062].var_386948ca))
	{
		level.client_menus[var_b5964062].var_386948ca = array(level.client_menus[var_b5964062].var_386948ca);
	}
	if(!isinarray(level.client_menus[var_b5964062].var_386948ca, var_2e96e768))
	{
		level.client_menus[var_b5964062].var_386948ca[level.client_menus[var_b5964062].var_386948ca.size] = var_2e96e768;
	}
}

/*
	Name: function_2a35a5f
	Namespace: namespace_d5a9ff55
	Checksum: 0x1400A3F1
	Offset: 0x1D08
	Size: 0x116
	Parameters: 1
	Flags: Private
*/
function private function_2a35a5f(var_a14cc36b)
{
	/#
		var_12fe97ab = "";
		foreach(var_ef86f00f in var_a14cc36b)
		{
			var_12fe97ab = var_12fe97ab + (("" + (ishash(var_ef86f00f.menu_name) ? function_9e72a96(var_ef86f00f.menu_name) : (isdefined(var_ef86f00f.menu_name) ? "" + var_ef86f00f.menu_name : ""))) + "");
		}
		return var_12fe97ab;
	#/
}

/*
	Name: client_menus
	Namespace: namespace_d5a9ff55
	Checksum: 0x10C29AF6
	Offset: 0x1E28
	Size: 0x4C0
	Parameters: 1
	Flags: Linked
*/
function client_menus(local_client_num)
{
	level endon(#"disconnect");
	level.var_a14cc36b[local_client_num] = [];
	clientmenustack = level.var_a14cc36b[local_client_num];
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill("menu_change" + local_client_num);
		menu_name = waitresult.menu;
		status = waitresult.status;
		state = waitresult.state;
		menu_index = undefined;
		for(i = 0; i < clientmenustack.size; i++)
		{
			if(clientmenustack[i].menu_name == menu_name)
			{
				menu_index = i;
				break;
			}
		}
		if(status === "closeToMenu" && isdefined(menu_index))
		{
			topmenu = undefined;
			for(i = 0; i < menu_index; i++)
			{
				popped = array::pop(clientmenustack, 0, 0);
				if(!isdefined(topmenu))
				{
					topmenu = popped;
				}
			}
			setup_menu(local_client_num, topmenu, clientmenustack[0]);
			continue;
		}
		statechange = isdefined(menu_index) && status !== "closed" && clientmenustack[menu_index].state !== state && (!(!isdefined(clientmenustack[menu_index].state) && !isdefined(state)));
		updateonly = statechange && menu_index !== 0;
		if(updateonly)
		{
			clientmenustack[i].state = state;
		}
		else
		{
			if(status === "closed" && isdefined(menu_index))
			{
				/#
					if(menu_index != 0)
					{
						var_12fe97ab = function_2a35a5f(clientmenustack);
						/#
							assertmsg((((("" + local_client_num) + "") + menu_name) + "") + var_12fe97ab);
						#/
					}
				#/
				if(menu_index == 0)
				{
					popped = array::pop(clientmenustack, 0, 0);
					setup_menu(local_client_num, popped, clientmenustack[0]);
				}
			}
			else
			{
				if(status === "opened" && !isdefined(menu_index))
				{
					menu_data = {#charactermode:waitresult.mode, #state:state, #menu_name:menu_name};
					lastmenu = (clientmenustack.size > 0 ? clientmenustack[0] : undefined);
					setup_menu(local_client_num, lastmenu, menu_data);
					array::push_front(clientmenustack, menu_data);
				}
				else if(isdefined(menu_index) && statechange)
				{
					/#
						if(menu_index != 0)
						{
							var_12fe97ab = function_2a35a5f(clientmenustack);
							/#
								assertmsg((((("" + local_client_num) + "") + menu_name) + "") + var_12fe97ab);
							#/
						}
					#/
					var_80c09ee8 = clientmenustack[0];
					clientmenustack[0] = {#charactermode:waitresult.mode, #state:state, #menu_name:menu_name};
					setup_menu(local_client_num, var_80c09ee8, clientmenustack[0]);
				}
			}
		}
	}
}

/*
	Name: function_befcd4f0
	Namespace: namespace_d5a9ff55
	Checksum: 0x7A597ECD
	Offset: 0x22F0
	Size: 0x23C
	Parameters: 5
	Flags: Linked
*/
function function_befcd4f0(str_scene, var_f647c5b2, var_559c5c3e, var_472bee8f, var_b1e821c5)
{
	/#
		assert(!isdefined(var_f647c5b2) || scene::function_9730988a(str_scene, var_f647c5b2), (("" + str_scene) + "") + (isdefined(var_f647c5b2) ? "" + var_f647c5b2 : ""));
	#/
	/#
		assert(!isdefined(var_559c5c3e) || scene::function_9730988a(str_scene, var_559c5c3e), (("" + str_scene) + "") + (isdefined(var_559c5c3e) ? "" + var_559c5c3e : ""));
	#/
	level notify(#"hash_46855140938f532c");
	level endon(#"hash_46855140938f532c");
	if(isdefined(var_472bee8f))
	{
		level endon(var_472bee8f);
	}
	if(level.var_6dfc0bcf !== str_scene)
	{
		level scene::stop(level.var_6dfc0bcf);
	}
	else if(isdefined(level.var_6dfc0bcf))
	{
		level scene::cancel(level.var_6dfc0bcf);
	}
	level.var_6dfc0bcf = str_scene;
	if(isdefined(var_f647c5b2))
	{
		level scene::play(str_scene, var_f647c5b2, undefined, undefined, undefined, undefined, var_b1e821c5);
		var_b1e821c5 = undefined;
	}
	if(isdefined(var_559c5c3e))
	{
		level thread scene::play(str_scene, var_559c5c3e, undefined, undefined, undefined, undefined, var_b1e821c5);
	}
	else
	{
		level thread scene::play(str_scene, undefined, undefined, undefined, undefined, undefined, var_b1e821c5);
	}
}

/*
	Name: function_5993fa03
	Namespace: namespace_d5a9ff55
	Checksum: 0xAABAE200
	Offset: 0x2538
	Size: 0x94
	Parameters: 5
	Flags: None
*/
function function_5993fa03(str_scene, str_shot, time, var_472bee8f, var_78594590)
{
	level notify(#"hash_46855140938f532c");
	level endon(#"hash_46855140938f532c");
	if(isdefined(var_472bee8f))
	{
		level endon(var_472bee8f);
	}
	level thread scene::play_from_time(str_scene, str_shot, undefined, time, 1, 1, var_78594590);
}

/*
	Name: function_4aa3b942
	Namespace: namespace_d5a9ff55
	Checksum: 0x4D3FD495
	Offset: 0x25D8
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_4aa3b942(new_menu, var_b1e821c5)
{
	function_befcd4f0(new_menu.str_scene, new_menu.var_f647c5b2, new_menu.var_559c5c3e, new_menu.menu_name + "_closed", var_b1e821c5);
}

/*
	Name: function_7851a662
	Namespace: namespace_d5a9ff55
	Checksum: 0xEC247F41
	Offset: 0x2638
	Size: 0x54
	Parameters: 3
	Flags: Linked
*/
function function_7851a662(var_cd1475a5, shot, var_b1e821c5)
{
	function_befcd4f0(var_cd1475a5.str_scene, shot, undefined, var_cd1475a5.menu_name + "_closed", var_b1e821c5);
}

/*
	Name: function_4c61e7c
	Namespace: namespace_d5a9ff55
	Checksum: 0x2C416D8E
	Offset: 0x2698
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_4c61e7c(var_cd1475a5)
{
	level notify(#"hash_46855140938f532c");
	level endon(var_cd1475a5.menu_name + "_closed");
	level endon(#"hash_46855140938f532c");
	level.var_6dfc0bcf = undefined;
	level scene::stop(var_cd1475a5.str_scene, 1);
}

/*
	Name: function_4e55f369
	Namespace: namespace_d5a9ff55
	Checksum: 0x1F02424A
	Offset: 0x2728
	Size: 0x14C
	Parameters: 3
	Flags: Linked
*/
function function_4e55f369(var_8de6b51a, var_e3315405, var_b1e821c5)
{
	level notify(#"hash_46855140938f532c");
	new_menu = function_6f3e10a2(var_e3315405);
	var_ffb43fb8 = function_ffa1213e(var_8de6b51a, var_e3315405);
	if(isdefined(var_ffb43fb8))
	{
		level endon(#"hash_46855140938f532c");
		level endon(new_menu.menu_name + "_closed");
		level scene::play(new_menu.str_scene, var_ffb43fb8, undefined, undefined, undefined, undefined, var_b1e821c5);
	}
	else
	{
		var_cd1475a5 = function_6f3e10a2(var_8de6b51a);
		if(var_cd1475a5.str_scene !== new_menu.str_scene || var_cd1475a5.var_559c5c3e !== new_menu.var_559c5c3e)
		{
			new_menu = function_6f3e10a2(var_e3315405);
			function_4aa3b942(new_menu, var_b1e821c5);
		}
	}
}

/*
	Name: is_current_menu
	Namespace: namespace_d5a9ff55
	Checksum: 0xA3946628
	Offset: 0x2880
	Size: 0xB4
	Parameters: 3
	Flags: Linked
*/
function is_current_menu(local_client_num, menu_name, state)
{
	if(!isdefined(state))
	{
		state = undefined;
	}
	if(!isdefined(level.var_a14cc36b[local_client_num]) || level.var_a14cc36b[local_client_num].size == 0)
	{
		return 0;
	}
	return level.var_a14cc36b[local_client_num][0].menu_name === menu_name && (!isdefined(state) || level.var_a14cc36b[local_client_num][0].state === state);
}

