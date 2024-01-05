#using script_1da833573eb80e61;
#using script_2feaeed9ab01d6f7;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

class cluielem 
{
	var var_47d8642e;
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cluielem
		Checksum: 0x515E03A5
		Offset: 0x828
		Size: 0x2A
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.var_d5213cbb = "";
		self.var_bf9c8c95 = undefined;
		self.var_779239b4 = 0;
	}

	/*
		Name: destructor
		Namespace: cluielem
		Checksum: 0x1F6AA34A
		Offset: 0x860
		Size: 0x96
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
		if(lui::function_4206783a() && isdefined(var_d5213cbb) && var_d5213cbb != "" && isdefined(level.var_a706401b[hash(var_d5213cbb)][var_bf9c8c95]))
		{
			level.var_a706401b[hash(var_d5213cbb)][var_bf9c8c95] = undefined;
		}
	}

	/*
		Name: open
		Namespace: cluielem
		Checksum: 0x14963CFB
		Offset: 0xF88
		Size: 0x82
		Parameters: 1
		Flags: Linked
	*/
	function open(local_client_num)
	{
		/#
			assert(var_47d8642e, "");
		#/
		openluielem(local_client_num, hash(var_d5213cbb), var_bf9c8c95);
		[[ self ]]->function_fa582112(local_client_num);
		self.var_779239b4 = 1;
	}

	/*
		Name: close
		Namespace: cluielem
		Checksum: 0xE77FB8DD
		Offset: 0x1088
		Size: 0x6E
		Parameters: 1
		Flags: Linked
	*/
	function close(local_client_num)
	{
		/#
			assert(var_47d8642e, "");
		#/
		closeluielem(local_client_num, hash(var_d5213cbb), var_bf9c8c95);
		self.var_779239b4 = 0;
	}

	/*
		Name: register_clientside
		Namespace: cluielem
		Checksum: 0xD77661B
		Offset: 0xDB0
		Size: 0x18E
		Parameters: 1
		Flags: Linked
	*/
	function register_clientside(menu_name)
	{
		if(!isdefined(level.var_c6881a61))
		{
			level.var_c6881a61 = associativearray();
		}
		if(!isdefined(level.var_c6881a61[hash(menu_name)]))
		{
			level.var_c6881a61[hash(menu_name)] = 0;
		}
		self.var_d5213cbb = menu_name;
		self.var_bf9c8c95 = level.var_c6881a61[hash(menu_name)];
		level.var_c6881a61[hash(menu_name)]++;
		self.var_47d8642e = 1;
		if(lui::function_4206783a())
		{
			if(!isdefined(level.var_a706401b))
			{
				level.var_a706401b = associativearray();
			}
			if(!isdefined(level.var_a706401b[hash(menu_name)]))
			{
				level.var_a706401b[hash(menu_name)] = [];
			}
			level.var_a706401b[hash(menu_name)][var_bf9c8c95] = {#hash_34327e5a:self};
		}
	}

	/*
		Name: setup_clientfields
		Namespace: cluielem
		Checksum: 0x3C557C5B
		Offset: 0x900
		Size: 0xDA
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(menu_name)
	{
		if(!isdefined(level.var_f70b6db))
		{
			level.var_f70b6db = associativearray();
		}
		if(!isdefined(level.var_f70b6db[hash(menu_name)]))
		{
			level.var_f70b6db[hash(menu_name)] = 0;
		}
		self.var_d5213cbb = menu_name;
		self.var_bf9c8c95 = level.var_f70b6db[hash(menu_name)];
		level.var_f70b6db[hash(menu_name)]++;
		self.var_47d8642e = 0;
	}

	/*
		Name: get_data
		Namespace: cluielem
		Checksum: 0x2BBCAD35
		Offset: 0x1330
		Size: 0x6A
		Parameters: 2
		Flags: Linked
	*/
	function get_data(local_client_num, field)
	{
		/#
			assert(var_47d8642e, "");
		#/
		return function_88759655(local_client_num, hash(var_d5213cbb), var_bf9c8c95, field);
	}

	/*
		Name: function_cbca32d8
		Namespace: cluielem
		Checksum: 0xF00B036C
		Offset: 0x13A8
		Size: 0x26C
		Parameters: 1
		Flags: Linked
	*/
	function function_cbca32d8(local_client_num)
	{
		if(lui::function_4206783a() && isdefined(level.var_a706401b[hash(var_d5213cbb)][var_bf9c8c95]))
		{
			data = level.var_a706401b[hash(var_d5213cbb)][var_bf9c8c95].data;
			if(isdefined(data))
			{
				if(isdefined(local_client_num))
				{
					if(isdefined(data[local_client_num]))
					{
						foreach(kvp in data[local_client_num])
						{
							function_bcc2134a(local_client_num, hash(var_d5213cbb), var_bf9c8c95, kvp.field, kvp.value);
						}
					}
				}
				else
				{
					foreach(local_client_num in data)
					{
						foreach(kvp in data[local_client_num])
						{
							function_bcc2134a(local_client_num, hash(var_d5213cbb), var_bf9c8c95, kvp.field, kvp.value);
						}
					}
				}
			}
		}
	}

	/*
		Name: set_data
		Namespace: cluielem
		Checksum: 0x70DE36E2
		Offset: 0x1100
		Size: 0x222
		Parameters: 3
		Flags: Linked
	*/
	function set_data(local_client_num, field, value)
	{
		/#
			assert(var_47d8642e, "");
		#/
		function_bcc2134a(local_client_num, hash(var_d5213cbb), var_bf9c8c95, field, value);
		if(lui::function_4206783a() && !level flag::get(#"hash_31f7d14ea61c9b88") && isdefined(level.var_a706401b[hash(var_d5213cbb)][var_bf9c8c95]))
		{
			if(!isdefined(level.var_a706401b[hash(var_d5213cbb)][var_bf9c8c95].data))
			{
				level.var_a706401b[hash(var_d5213cbb)][var_bf9c8c95].data = [];
			}
			if(!isdefined(level.var_a706401b[hash(var_d5213cbb)][var_bf9c8c95].data[local_client_num]))
			{
				level.var_a706401b[hash(var_d5213cbb)][var_bf9c8c95].data[local_client_num] = [];
			}
			level.var_a706401b[hash(var_d5213cbb)][var_bf9c8c95].data[local_client_num][field] = {#value:value, #field:field};
		}
	}

	/*
		Name: is_open
		Namespace: cluielem
		Checksum: 0xB5913E47
		Offset: 0x1018
		Size: 0x62
		Parameters: 1
		Flags: Linked
	*/
	function is_open(local_client_num)
	{
		/#
			assert(var_47d8642e, "");
		#/
		return isluielemopen(local_client_num, hash(var_d5213cbb), var_bf9c8c95);
	}

	/*
		Name: add_clientfield
		Namespace: cluielem
		Checksum: 0xB30A2348
		Offset: 0x9E8
		Size: 0x1E4
		Parameters: 5
		Flags: Linked
	*/
	function add_clientfield(field_name, version, bits, type, callback)
	{
		/#
			assert(!var_47d8642e, "");
		#/
		var_8e016f22 = strtok(field_name, ".");
		var_2637b994 = [];
		foreach(field in var_8e016f22)
		{
			if(!isdefined(var_2637b994))
			{
				var_2637b994 = [];
			}
			else if(!isarray(var_2637b994))
			{
				var_2637b994 = array(var_2637b994);
			}
			var_2637b994[var_2637b994.size] = hash(field);
		}
		clientfield::register_luielem((("luielement." + var_d5213cbb) + ".") + (isdefined(var_bf9c8c95) ? "" + var_bf9c8c95 : "") + field_name, hash(var_d5213cbb), var_bf9c8c95, var_2637b994, version, bits, type, callback, 0, 0);
	}

	/*
		Name: function_dcb34c80
		Namespace: cluielem
		Checksum: 0x739C5D3E
		Offset: 0xBD8
		Size: 0x1CC
		Parameters: 3
		Flags: Linked
	*/
	function function_dcb34c80(var_2a0de052, field_name, version)
	{
		/#
			assert(!var_47d8642e, "");
		#/
		var_8e016f22 = strtok(field_name, ".");
		var_2637b994 = [];
		foreach(field in var_8e016f22)
		{
			if(!isdefined(var_2637b994))
			{
				var_2637b994 = [];
			}
			else if(!isarray(var_2637b994))
			{
				var_2637b994 = array(var_2637b994);
			}
			var_2637b994[var_2637b994.size] = hash(field);
		}
		clientfield::function_b63c5dfe(var_2a0de052, (("luielement." + var_d5213cbb) + ".") + (isdefined(var_bf9c8c95) ? "" + var_bf9c8c95 : "") + field_name, hash(var_d5213cbb), var_bf9c8c95, var_2637b994, version, undefined, 0, 0);
	}

	/*
		Name: function_fa582112
		Namespace: cluielem
		Checksum: 0xF104CEE1
		Offset: 0xF48
		Size: 0x34
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(local_client_num)
	{
		/#
			assert(var_47d8642e, "");
		#/
	}

}

#namespace lui_shared;

/*
	Name: function_f77a9409
	Namespace: lui_shared
	Checksum: 0x34D90247
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f77a9409()
{
	level notify(-1067558688);
}

#namespace lui;

/*
	Name: __init__system__
	Namespace: lui
	Checksum: 0x46D567F4
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"lui_shared", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: lui
	Checksum: 0xF2238664
	Offset: 0x148
	Size: 0x70
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	full_screen_black::register();
	initial_black::register();
	level.localclients = [];
	level.localclients[0] = {};
	level.localclients[1] = {};
	level.localclients[2] = {};
	level.localclients[3] = {};
}

/*
	Name: screen_fade
	Namespace: lui
	Checksum: 0xEF962240
	Offset: 0x1C0
	Size: 0x9C
	Parameters: 6
	Flags: Linked
*/
function screen_fade(localclientnum, n_time, n_target_alpha, n_start_alpha, str_color, b_force_close_menu)
{
	if(!isdefined(n_target_alpha))
	{
		n_target_alpha = 1;
	}
	if(!isdefined(n_start_alpha))
	{
		n_start_alpha = 0;
	}
	if(!isdefined(str_color))
	{
		str_color = "black";
	}
	if(!isdefined(b_force_close_menu))
	{
		b_force_close_menu = 0;
	}
	level thread _screen_fade(localclientnum, n_time, n_target_alpha, n_start_alpha, str_color, b_force_close_menu);
}

/*
	Name: screen_fade_out
	Namespace: lui
	Checksum: 0xE3B68E71
	Offset: 0x268
	Size: 0x42
	Parameters: 3
	Flags: Linked
*/
function screen_fade_out(localclientnum, n_time, str_color)
{
	screen_fade(localclientnum, n_time, 1, 0, str_color, 0);
	wait(n_time);
}

/*
	Name: screen_fade_in
	Namespace: lui
	Checksum: 0x521A6836
	Offset: 0x2B8
	Size: 0x4A
	Parameters: 3
	Flags: Linked
*/
function screen_fade_in(localclientnum, n_time, str_color)
{
	screen_fade(localclientnum, n_time, 0, 1, str_color, 1);
	wait(n_time);
}

/*
	Name: screen_close_menu
	Namespace: lui
	Checksum: 0x89834CEE
	Offset: 0x310
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function screen_close_menu(localclientnum)
{
	level thread _screen_close_menu(localclientnum);
}

/*
	Name: _screen_close_menu
	Namespace: lui
	Checksum: 0x7FA7B932
	Offset: 0x340
	Size: 0x80
	Parameters: 1
	Flags: Linked, Private
*/
function private _screen_close_menu(localclientnum)
{
	level notify("_screen_fade" + localclientnum);
	level endon("_screen_fade" + localclientnum);
	if(isdefined(level.localclients[localclientnum].full_screen_black))
	{
		[[ level.localclients[localclientnum].full_screen_black.lui_menu ]]->close(localclientnum);
	}
}

/*
	Name: _screen_fade
	Namespace: lui
	Checksum: 0xB2D40605
	Offset: 0x3C8
	Size: 0x438
	Parameters: 6
	Flags: Linked, Private
*/
function private _screen_fade(localclientnum, n_time, n_target_alpha, n_start_alpha, v_color, b_force_close_menu)
{
	level notify("_screen_fade" + localclientnum);
	level endon("_screen_fade" + localclientnum);
	if(!isdefined(v_color))
	{
		v_color = (0, 0, 0);
	}
	n_time_ms = int(int(n_time * 1000));
	str_menu = "full_screen_black";
	if(isstring(v_color))
	{
		switch(v_color)
		{
			case "black":
			{
				v_color = (0, 0, 0);
				break;
			}
			case "white":
			{
				v_color = (1, 1, 1);
				break;
			}
			default:
			{
				/#
					assertmsg("");
				#/
			}
		}
	}
	lui_menu = "";
	if(isdefined(level.localclients[localclientnum].full_screen_black))
	{
		s_menu = level.localclients[localclientnum].full_screen_black;
		[[ s_menu.lui_menu ]]->close(localclientnum);
		n_start_alpha = lerpfloat(s_menu.n_start_alpha, s_menu.n_target_alpha, gettime() - s_menu.n_start_time);
	}
	else
	{
		level.localclients[localclientnum].full_screen_black = spawnstruct();
		level.localclients[localclientnum].full_screen_black.lui_menu = full_screen_black::register_clientside();
	}
	level.localclients[localclientnum].full_screen_black.n_start_alpha = n_start_alpha;
	level.localclients[localclientnum].full_screen_black.n_target_alpha = n_target_alpha;
	level.localclients[localclientnum].full_screen_black.n_target_time = n_time_ms;
	level.localclients[localclientnum].full_screen_black.n_start_time = gettime();
	[[ level.localclients[localclientnum].full_screen_black.lui_menu ]]->open(localclientnum);
	[[ level.localclients[localclientnum].full_screen_black.lui_menu ]]->set_red(localclientnum, v_color[0]);
	[[ level.localclients[localclientnum].full_screen_black.lui_menu ]]->set_green(localclientnum, v_color[1]);
	[[ level.localclients[localclientnum].full_screen_black.lui_menu ]]->set_blue(localclientnum, v_color[2]);
	[[ level.localclients[localclientnum].full_screen_black.lui_menu ]]->set_startalpha(localclientnum, n_start_alpha);
	[[ level.localclients[localclientnum].full_screen_black.lui_menu ]]->set_endalpha(localclientnum, n_target_alpha);
	[[ level.localclients[localclientnum].full_screen_black.lui_menu ]]->set_fadeovertime(localclientnum, n_time_ms);
	wait(n_time);
	if(b_force_close_menu || n_target_alpha == 0)
	{
		[[ level.localclients[localclientnum].full_screen_black.lui_menu ]]->close(localclientnum);
	}
}

/*
	Name: function_4206783a
	Namespace: lui
	Checksum: 0xDB12E8E7
	Offset: 0x808
	Size: 0x12
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4206783a()
{
	return sessionmodeiscampaigngame();
}

/*
	Name: function_ca036b2c
	Namespace: lui
	Checksum: 0x6B7D99D6
	Offset: 0x18B8
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function function_ca036b2c(local_client_num, name)
{
	var_cad692a8 = getentarray(local_client_num, name, "targetname");
	foreach(trigger in var_cad692a8)
	{
		trigger function_c06a8682(local_client_num);
	}
	return var_cad692a8;
}

