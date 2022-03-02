#using script_4194df57536e11ed;
#using script_50719ad9bcd4b183;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\string_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

class class_6aaccc24 
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_6aaccc24
		Checksum: 0xD3C9F270
		Offset: 0x2F18
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
		Namespace: namespace_6aaccc24
		Checksum: 0x80F724D1
		Offset: 0x3350
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_7bfd10e6
		Namespace: namespace_6aaccc24
		Checksum: 0xE9F768D2
		Offset: 0x3210
		Size: 0x3A
		Parameters: 1
		Flags: Linked
	*/
	function function_7bfd10e6(player)
	{
		return player function_3fc81484(hash(var_d5213cbb), var_bf9c8c95);
	}

	/*
		Name: function_8b8089ba
		Namespace: namespace_6aaccc24
		Checksum: 0x63CCB3A5
		Offset: 0x31A0
		Size: 0x62
		Parameters: 2
		Flags: Linked
	*/
	function function_8b8089ba(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		player function_5686f5cd(hash(var_d5213cbb), var_bf9c8c95, flags);
		self.var_779239b4 = 1;
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_6aaccc24
		Checksum: 0x27F66777
		Offset: 0x2F50
		Size: 0xCE
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
	}

	/*
		Name: function_a68f6e20
		Namespace: namespace_6aaccc24
		Checksum: 0xE304588C
		Offset: 0x3258
		Size: 0xEE
		Parameters: 1
		Flags: Linked
	*/
	function function_a68f6e20(player)
	{
		if(isplayer(player))
		{
			if(isdefined(player.var_3bc46b87) && isdefined(player.var_3bc46b87[hash(var_d5213cbb)]) && isdefined(player.var_3bc46b87[hash(var_d5213cbb)][var_bf9c8c95]))
			{
				player.var_3bc46b87[hash(var_d5213cbb)][var_bf9c8c95] = undefined;
			}
			player function_43d5b973(hash(var_d5213cbb), var_bf9c8c95);
			self.var_779239b4 = 0;
		}
	}

	/*
		Name: function_b0c4e363
		Namespace: namespace_6aaccc24
		Checksum: 0xF066562A
		Offset: 0x3100
		Size: 0x44
		Parameters: 3
		Flags: Linked
	*/
	function function_b0c4e363(player, field_name, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, field_name, value);
	}

	/*
		Name: function_d6203429
		Namespace: namespace_6aaccc24
		Checksum: 0xEADD8E88
		Offset: 0x3150
		Size: 0x44
		Parameters: 3
		Flags: Linked
	*/
	function function_d6203429(player, field_name, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, field_name, value);
	}

	/*
		Name: function_da693cbe
		Namespace: namespace_6aaccc24
		Checksum: 0x7ADA476B
		Offset: 0x3028
		Size: 0x64
		Parameters: 5
		Flags: Linked
	*/
	function function_da693cbe(field_name, version, bits, type, var_59f69872)
	{
		if(!isdefined(var_59f69872))
		{
			var_59f69872 = 1;
		}
		clientfield::function_346f95ba(var_d5213cbb, var_bf9c8c95, field_name, version, bits, type, var_59f69872);
	}

	/*
		Name: function_dcb34c80
		Namespace: namespace_6aaccc24
		Checksum: 0x3958725B
		Offset: 0x3098
		Size: 0x5C
		Parameters: 4
		Flags: Linked
	*/
	function function_dcb34c80(var_2a0de052, field_name, version, var_59f69872)
	{
		if(!isdefined(var_59f69872))
		{
			var_59f69872 = 1;
		}
		clientfield::function_b63c5dfe(var_2a0de052, var_d5213cbb, var_bf9c8c95, field_name, version, var_59f69872);
	}

}

#namespace lui;

/*
	Name: function_89f2df9
	Namespace: lui
	Checksum: 0x6B396809
	Offset: 0x228
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"lui_shared", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: lui
	Checksum: 0xB0BE7677
	Offset: 0x270
	Size: 0x74
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_spawned(&refresh_menu_values);
	function_b95a3ba5("FullScreenBlack", &full_screen_black::register);
	function_b95a3ba5("InitialBlack", &initial_black::register);
}

/*
	Name: function_bed1b789
	Namespace: lui
	Checksum: 0x84611497
	Offset: 0x2F0
	Size: 0x110
	Parameters: 4
	Flags: Linked
*/
function function_bed1b789(menuname, var_5f9bb54b, var_a216857c, var_91de0487)
{
	if(!isdefined(self.var_3bc46b87))
	{
		self.var_3bc46b87 = associativearray();
	}
	if(!isdefined(self.var_3bc46b87[menuname]))
	{
		self.var_3bc46b87[menuname] = associativearray();
	}
	if(!isdefined(self.var_3bc46b87[menuname][var_5f9bb54b]))
	{
		self.var_3bc46b87[menuname][var_5f9bb54b] = associativearray();
	}
	if(!isdefined(self.var_3bc46b87[menuname][var_5f9bb54b][var_a216857c]) || self.var_3bc46b87[menuname][var_5f9bb54b][var_a216857c] != var_91de0487)
	{
		self.var_3bc46b87[menuname][var_5f9bb54b][var_a216857c] = var_91de0487;
		return true;
	}
	return false;
}

/*
	Name: function_bb6bcb89
	Namespace: lui
	Checksum: 0x400D6CEE
	Offset: 0x408
	Size: 0x128
	Parameters: 5
	Flags: Linked
*/
function function_bb6bcb89(menuname, var_5f9bb54b, var_a216857c, var_91de0487, var_97c4b88a)
{
	if(!self function_bed1b789(menuname, var_5f9bb54b, var_a216857c, var_91de0487))
	{
		return;
	}
	if(!isdefined(level.var_b0d329df))
	{
		level.var_b0d329df = [];
		level thread function_1c4c4975();
	}
	index = level.var_b0d329df.size;
	level.var_b0d329df[index] = {#hash_97c4b88a:var_97c4b88a, #hash_91de0487:var_91de0487, #hash_a216857c:var_a216857c, #hash_5f9bb54b:var_5f9bb54b, #menuname:menuname, #ent:self};
	level notify(#"hash_731d5f1e22d23b13");
}

/*
	Name: function_e1038404
	Namespace: lui
	Checksum: 0xBF3B3361
	Offset: 0x538
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_e1038404(var_32613683)
{
	self function_2891bd54(var_32613683.menuname, var_32613683.var_5f9bb54b, 2, var_32613683.var_a216857c, var_32613683.var_91de0487);
	if(is_true(var_32613683.var_97c4b88a))
	{
		self function_4c1e52d4(var_32613683.menuname, var_32613683.var_5f9bb54b, 2, var_32613683.var_a216857c, var_32613683.var_91de0487);
	}
}

/*
	Name: function_1c4c4975
	Namespace: lui
	Checksum: 0x9D4C73A0
	Offset: 0x5E0
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function function_1c4c4975()
{
	while(true)
	{
		level waittill(#"hash_731d5f1e22d23b13");
		do
		{
			if(isdefined(level.var_b0d329df[0].ent))
			{
				level.var_b0d329df[0].ent function_e1038404(level.var_b0d329df[0]);
			}
			arrayremoveindex(level.var_b0d329df, 0, 0);
			waitframe(1);
		}
		while(level.var_b0d329df.size > 0);
	}
}

/*
	Name: function_b95a3ba5
	Namespace: lui
	Checksum: 0xCC2DE9E7
	Offset: 0x690
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_b95a3ba5(alias, registerfunc)
{
	if(!isdefined(level.luimenus))
	{
		level.luimenus = array();
	}
	level.luimenus[alias] = [[registerfunc]]();
}

/*
	Name: function_e810a527
	Namespace: lui
	Checksum: 0xC20A568
	Offset: 0x6F0
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_e810a527(alias)
{
	return level.luimenus[alias];
}

/*
	Name: refresh_menu_values
	Namespace: lui
	Checksum: 0x6FBF1312
	Offset: 0x718
	Size: 0x10C
	Parameters: 0
	Flags: Linked, Private
*/
function private refresh_menu_values()
{
	if(!isdefined(level.lui_script_globals))
	{
		return;
	}
	foreach(v in level.lui_script_globals)
	{
		foreach(v2 in v)
		{
			self set_value_for_player(k, k2, v2);
		}
	}
}

/*
	Name: play_animation
	Namespace: lui
	Checksum: 0x4D808DA
	Offset: 0x830
	Size: 0x9C
	Parameters: 2
	Flags: None
*/
function play_animation(menu, str_anim)
{
	str_curr_anim = self getluimenudata(menu, "current_animation");
	str_new_anim = str_anim;
	if(isdefined(str_curr_anim) && str_curr_anim == str_anim)
	{
		str_new_anim = "";
	}
	self setluimenudata(menu, #"current_animation", str_new_anim);
}

/*
	Name: set_color
	Namespace: lui
	Checksum: 0x19F13933
	Offset: 0x8D8
	Size: 0x80
	Parameters: 2
	Flags: Linked
*/
function set_color(menu, color)
{
	if(!isint(menu))
	{
		[[ menu ]]->function_eccc151d(self, color[0]);
		[[ menu ]]->function_2208b8db(self, color[1]);
		[[ menu ]]->function_7420df0a(self, color[2]);
	}
}

/*
	Name: set_value_for_player
	Namespace: lui
	Checksum: 0xBA7C1B20
	Offset: 0x960
	Size: 0x8C
	Parameters: 3
	Flags: Linked
*/
function set_value_for_player(str_menu_id, str_variable_id, value)
{
	if(!isdefined(self.lui_script_menus))
	{
		self.lui_script_menus = [];
	}
	if(!isdefined(self.lui_script_menus[str_menu_id]))
	{
		self.lui_script_menus[str_menu_id] = self openluimenu(str_menu_id);
	}
	self setluimenudata(self.lui_script_menus[str_menu_id], str_variable_id, value);
}

/*
	Name: set_global
	Namespace: lui
	Checksum: 0xCCE6DEDF
	Offset: 0x9F8
	Size: 0x110
	Parameters: 3
	Flags: None
*/
function set_global(str_menu_id, str_variable_id, value)
{
	if(!isdefined(level.lui_script_globals))
	{
		level.lui_script_globals = [];
	}
	if(!isdefined(level.lui_script_globals[str_menu_id]))
	{
		level.lui_script_globals[str_menu_id] = [];
	}
	level.lui_script_globals[str_menu_id][str_variable_id] = value;
	if(isdefined(level.players))
	{
		foreach(player in level.players)
		{
			player set_value_for_player(str_menu_id, str_variable_id, value);
		}
	}
}

/*
	Name: timer
	Namespace: lui
	Checksum: 0x10DF113C
	Offset: 0xB10
	Size: 0x184
	Parameters: 5
	Flags: None
*/
function timer(n_time, str_endon, x, y, height)
{
	if(!isdefined(x))
	{
		x = 1080;
	}
	if(!isdefined(y))
	{
		y = 200;
	}
	if(!isdefined(height))
	{
		height = 60;
	}
	lui = self openluimenu("HudElementTimer");
	self setluimenudata(lui, #"x", x);
	self setluimenudata(lui, #"y", y);
	self setluimenudata(lui, #"height", height);
	self setluimenudata(lui, #"time", gettime() + (int(n_time * 1000)));
	if(isdefined(str_endon))
	{
		self waittilltimeout(n_time, str_endon);
	}
	else
	{
		wait(n_time);
	}
	self closeluimenu(lui);
}

/*
	Name: prime_movie
	Namespace: lui
	Checksum: 0xCAC5A44A
	Offset: 0xCA0
	Size: 0x194
	Parameters: 3
	Flags: Linked
*/
function prime_movie(str_movie, b_looping, str_key)
{
	if(!isdefined(b_looping))
	{
		b_looping = 0;
	}
	if(!isdefined(str_key))
	{
		str_key = "";
	}
	if(isarray(self))
	{
		foreach(player in self)
		{
			player primemovie(str_movie, b_looping, str_key);
		}
	}
	else
	{
		if(self == level)
		{
			foreach(player in level.players)
			{
				player primemovie(str_movie, b_looping, str_key);
			}
		}
		else
		{
			self primemovie(str_movie, b_looping, str_key);
		}
	}
}

/*
	Name: function_2fb8927b
	Namespace: lui
	Checksum: 0x83089A6D
	Offset: 0xE40
	Size: 0x110
	Parameters: 4
	Flags: None
*/
function function_2fb8927b(str_team, str_movie, b_looping, str_key)
{
	if(!isdefined(b_looping))
	{
		b_looping = 0;
	}
	if(!isdefined(str_key))
	{
		str_key = #"";
	}
	callback::on_connect(&function_67373791, undefined, str_team, str_movie, b_looping, str_key);
	foreach(player in function_58385b58(str_team))
	{
		player prime_movie(str_movie);
	}
}

/*
	Name: function_67373791
	Namespace: lui
	Checksum: 0x63302C59
	Offset: 0xF58
	Size: 0x6C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_67373791(str_team, str_movie, b_looping, str_key)
{
	if(util::is_on_side(b_looping))
	{
		if(util::function_8e89351(self))
		{
			prime_movie(str_key);
		}
	}
}

/*
	Name: function_c6d1cb5d
	Namespace: lui
	Checksum: 0xF6856AC2
	Offset: 0xFD0
	Size: 0x148
	Parameters: 8
	Flags: None
*/
function function_c6d1cb5d(str_team, str_movie, str_type, show_black_screen, b_looping, b_skippable, str_key, n_timeout)
{
	if(!isdefined(show_black_screen))
	{
		show_black_screen = 0;
	}
	if(!isdefined(b_looping))
	{
		b_looping = 0;
	}
	if(!isdefined(b_skippable))
	{
		b_skippable = 0;
	}
	if(!isdefined(str_key))
	{
		str_key = #"";
	}
	callback::remove_on_connect(&function_67373791);
	foreach(player in function_58385b58(str_team))
	{
		player thread play_movie(str_movie, str_type, show_black_screen, b_looping, b_skippable, str_key, n_timeout);
	}
}

/*
	Name: play_movie
	Namespace: lui
	Checksum: 0x522D7AB3
	Offset: 0x1120
	Size: 0x518
	Parameters: 7
	Flags: Linked
*/
function play_movie(str_movie, str_type, show_black_screen, b_looping, b_skippable, str_key, n_timeout)
{
	if(!isdefined(show_black_screen))
	{
		show_black_screen = 0;
	}
	if(!isdefined(b_looping))
	{
		b_looping = 0;
	}
	if(!isdefined(b_skippable))
	{
		b_skippable = 0;
	}
	if(!isdefined(str_key))
	{
		str_key = #"";
	}
	if(str_type === "fullscreen" || str_type === "fullscreen_additive")
	{
		b_hide_hud = 1;
	}
	if(isarray(self))
	{
		a_players = self;
	}
	else if(self == level)
	{
		a_players = level.players;
	}
	if(isarray(a_players))
	{
		var_7e05b6e9 = [];
		foreach(player in a_players)
		{
			if(isbot(player) || player issplitscreen())
			{
				array::add(var_7e05b6e9, player);
			}
		}
		foreach(bot in var_7e05b6e9)
		{
			arrayremovevalue(a_players, bot);
		}
		foreach(player in a_players)
		{
			if(isdefined(b_hide_hud))
			{
				player flag::set(#"playing_movie_hide_hud");
				player val::set(#"play_movie", "show_hud", 0);
			}
			player thread _play_movie_for_player(str_movie, str_type, show_black_screen, b_looping, b_skippable, str_key, n_timeout);
		}
		array::wait_till(a_players, "movie_done", n_timeout);
		if(a_players.size == 0)
		{
			waitframe(1);
		}
		if(isdefined(b_hide_hud))
		{
			foreach(player in a_players)
			{
				player flag::clear(#"playing_movie_hide_hud");
				player val::reset(#"play_movie", "show_hud");
			}
		}
	}
	else
	{
		if(isdefined(b_hide_hud))
		{
			self flag::set(#"playing_movie_hide_hud");
			self val::set(#"play_movie", "show_hud", 0);
		}
		_play_movie_for_player(str_movie, str_type, show_black_screen, b_looping, b_skippable, str_key, n_timeout);
		if(isdefined(b_hide_hud) && isdefined(self))
		{
			self flag::clear(#"playing_movie_hide_hud");
			self val::reset(#"play_movie", "show_hud");
		}
	}
	level notify(#"movie_done", {#type:str_type});
}

/*
	Name: _play_movie_for_player
	Namespace: lui
	Checksum: 0xFA0ED9C3
	Offset: 0x1640
	Size: 0x376
	Parameters: 7
	Flags: Linked, Private
*/
function private _play_movie_for_player(str_movie, str_type, show_black_screen, b_looping, b_skippable, str_key, n_timeout)
{
	self endon(#"disconnect");
	str_menu = undefined;
	switch(str_type)
	{
		case "fullscreen_additive":
		case "fullscreen":
		{
			str_menu = "full_screen_movie";
			break;
		}
		case "pip":
		{
			str_menu = "pip_menu";
			break;
		}
		default:
		{
			/#
				assertmsg(("" + str_type) + "");
			#/
		}
	}
	if(str_type == "pip")
	{
		self playsoundtoplayer(#"uin_pip_open", self);
	}
	lui_menu = function_e810a527(str_menu);
	if(![[ lui_menu ]]->function_7bfd10e6(self))
	{
		[[ lui_menu ]]->open(self);
	}
	if(isdefined(lui_menu))
	{
		[[ lui_menu ]]->function_87bb24(self, str_movie);
		[[ lui_menu ]]->function_8f7a8b9c(self, show_black_screen);
		[[ lui_menu ]]->function_5caa21cb(self, b_looping);
		[[ lui_menu ]]->function_493305af(self, 0);
		if(str_menu != "pip_menu")
		{
			[[ lui_menu ]]->function_251fc818(self, str_key);
			[[ lui_menu ]]->registerplayer_callout_traversal(self, b_skippable);
		}
		if(issubstr(str_type, "additive"))
		{
			[[ lui_menu ]]->function_493305af(self, 1);
		}
		while(true)
		{
			if(isdefined(n_timeout))
			{
				waitresult = undefined;
				waitresult = self waittilltimeout(n_timeout, #"menuresponse");
			}
			else
			{
				waitresult = undefined;
				waitresult = self waittill(#"menuresponse");
			}
			menu = waitresult.menu;
			response = waitresult.response;
			if(waitresult._notify == "timeout" || (menu === hash(str_menu) && response === #"finished_movie_playback"))
			{
				if(str_type == "pip")
				{
					self playsoundtoplayer(#"uin_pip_close", self);
				}
				[[ lui_menu ]]->close(self);
				self notify(#"movie_done");
				break;
			}
		}
	}
}

/*
	Name: play_outro_movie
	Namespace: lui
	Checksum: 0x80CAB271
	Offset: 0x19C0
	Size: 0x400
	Parameters: 1
	Flags: None
*/
function play_outro_movie(outro_movie)
{
	if(!isdefined(outro_movie))
	{
		outro_movie = getmapoutromovie();
	}
	if(!isdefined(outro_movie) || outro_movie == "")
	{
		return;
	}
	if(isarray(self))
	{
		a_players = self;
	}
	else if(self == level)
	{
		a_players = getplayers();
	}
	level flag::set("playing_outro_movie");
	if(isarray(a_players))
	{
		foreach(player in a_players)
		{
			player flag::set("playing_movie_hide_hud");
			player val::set(#"play_movie", "show_hud", 0);
			player val::set(#"play_movie", "freezecontrols", 1);
			player thread function_1bc580af();
		}
		array::wait_till(a_players, "movie_done");
		foreach(player in a_players)
		{
			player flag::clear("playing_movie_hide_hud");
			player val::reset(#"play_movie", "show_hud");
			player val::reset(#"play_movie", "freezecontrols");
		}
	}
	else
	{
		self flag::set("playing_movie_hide_hud");
		self val::set(#"play_movie", "show_hud", 0);
		self val::set(#"play_movie", "freezecontrols", 1);
		function_1bc580af();
		if(isdefined(self))
		{
			self flag::clear("playing_movie_hide_hud");
			self val::reset(#"play_movie", "show_hud");
			self val::reset(#"play_movie", "freezecontrols");
		}
	}
	level flag::clear("playing_outro_movie");
	level notify(#"movie_done", {#type:"outro"});
}

/*
	Name: function_1bc580af
	Namespace: lui
	Checksum: 0x3176E8A6
	Offset: 0x1DC8
	Size: 0x18C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1bc580af()
{
	lui_menu = function_e810a527("full_screen_movie");
	if(![[ lui_menu ]]->function_7bfd10e6(self))
	{
		[[ lui_menu ]]->open(self);
	}
	if(isdefined(lui_menu))
	{
		[[ lui_menu ]]->function_3a81612d(self, 1);
		[[ lui_menu ]]->function_8f7a8b9c(self, 1);
		while(true)
		{
			waitresult = undefined;
			waitresult = self waittill(#"menuresponse");
			menu = waitresult.menu;
			response = waitresult.response;
			value = waitresult.value;
			if(menu === #"full_screen_movie")
			{
				if(response === #"finished_movie_playback")
				{
					[[ lui_menu ]]->close(self);
					self notify(#"movie_done");
					break;
				}
				else if(response === #"skippable" && isdefined(value))
				{
					[[ lui_menu ]]->registerplayer_callout_traversal(self, value);
				}
			}
		}
	}
}

/*
	Name: screen_flash
	Namespace: lui
	Checksum: 0x1A8F348D
	Offset: 0x1F60
	Size: 0x18C
	Parameters: 7
	Flags: Linked
*/
function screen_flash(n_fadein_time, n_hold_time, n_fadeout_time, n_target_alpha, v_color, b_force_close_menu, var_4db66001)
{
	if(!isdefined(n_target_alpha))
	{
		n_target_alpha = 1;
	}
	if(!isdefined(b_force_close_menu))
	{
		b_force_close_menu = 0;
	}
	if(!isdefined(var_4db66001))
	{
		var_4db66001 = 0;
	}
	if(self == level)
	{
		foreach(player in level.players)
		{
			player thread screen_flash(n_fadein_time, n_hold_time, n_fadeout_time, n_target_alpha, v_color, b_force_close_menu, var_4db66001);
		}
	}
	else
	{
		self endon(#"disconnect");
		if(var_4db66001 && self scene::is_igc_active())
		{
			return;
		}
		self _screen_fade(n_fadein_time, n_target_alpha, 0, v_color, b_force_close_menu);
		wait(n_hold_time);
		self _screen_fade(n_fadeout_time, 0, n_target_alpha, v_color, b_force_close_menu);
	}
}

/*
	Name: screen_fade
	Namespace: lui
	Checksum: 0x81DF14EB
	Offset: 0x20F8
	Size: 0x13C
	Parameters: 8
	Flags: Linked
*/
function screen_fade(n_time, n_target_alpha, n_start_alpha, v_color, b_force_close_menu, str_menu_id, var_b675738a, b_force)
{
	if(!isdefined(n_target_alpha))
	{
		n_target_alpha = 1;
	}
	if(!isdefined(n_start_alpha))
	{
		n_start_alpha = 0;
	}
	if(!isdefined(b_force_close_menu))
	{
		b_force_close_menu = 0;
	}
	if(self == level)
	{
		foreach(player in level.players)
		{
			player thread _screen_fade(n_time, n_target_alpha, n_start_alpha, v_color, b_force_close_menu, str_menu_id, var_b675738a, b_force);
		}
	}
	else
	{
		self thread _screen_fade(n_time, n_target_alpha, n_start_alpha, v_color, b_force_close_menu, str_menu_id, var_b675738a, b_force);
	}
}

/*
	Name: screen_fade_out
	Namespace: lui
	Checksum: 0xB5E2BBDB
	Offset: 0x2240
	Size: 0x5C
	Parameters: 4
	Flags: Linked
*/
function screen_fade_out(n_time, v_color, str_menu_id, var_b675738a)
{
	screen_fade(n_time, 1, 0, v_color, 0, str_menu_id, var_b675738a);
	if(n_time > 0)
	{
		wait(n_time);
	}
}

/*
	Name: screen_fade_in
	Namespace: lui
	Checksum: 0x2407853A
	Offset: 0x22A8
	Size: 0x64
	Parameters: 5
	Flags: Linked
*/
function screen_fade_in(n_time, v_color, str_menu_id, var_b675738a, b_force)
{
	screen_fade(n_time, 0, 1, v_color, 1, str_menu_id, var_b675738a, b_force);
	if(n_time > 0)
	{
		wait(n_time);
	}
}

/*
	Name: function_a6eb5334
	Namespace: lui
	Checksum: 0x7642A159
	Offset: 0x2318
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function function_a6eb5334(n_time, v_color, str_menu_id, var_b675738a)
{
	screen_fade_in(n_time, v_color, str_menu_id, var_b675738a, 1);
}

/*
	Name: screen_close_menu
	Namespace: lui
	Checksum: 0x5E8ADE1A
	Offset: 0x2368
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function screen_close_menu()
{
	if(self == level)
	{
		foreach(player in level.players)
		{
			player thread _screen_close_menu();
		}
	}
	else
	{
		self thread _screen_close_menu();
	}
}

/*
	Name: _screen_close_menu
	Namespace: lui
	Checksum: 0xA1280C1
	Offset: 0x2428
	Size: 0xB6
	Parameters: 0
	Flags: Linked, Private
*/
function private _screen_close_menu()
{
	self notify(#"_screen_fade");
	self endon(#"_screen_fade", #"disconnect");
	if(isdefined(self.var_59f4be9a))
	{
		if(isint(self.var_59f4be9a.lui_menu))
		{
			self closeluimenu(self.var_59f4be9a.lui_menu);
		}
		else
		{
			[[ self.var_59f4be9a.lui_menu ]]->close(self);
		}
		self.var_59f4be9a = undefined;
	}
}

/*
	Name: _screen_fade
	Namespace: lui
	Checksum: 0xC95EA0B4
	Offset: 0x24E8
	Size: 0x71E
	Parameters: 8
	Flags: Linked, Private
*/
function private _screen_fade(n_time, n_target_alpha, n_start_alpha, v_color, b_force_close_menu, str_menu_id, var_b675738a, b_force)
{
	if(!isdefined(str_menu_id))
	{
		str_menu_id = "default";
	}
	if(!isdefined(var_b675738a))
	{
		var_b675738a = 0;
	}
	if(!isdefined(b_force))
	{
		b_force = 0;
	}
	self notify(#"_screen_fade_");
	self endon(#"_screen_fade_", #"disconnect");
	if(!b_force)
	{
		if(!isdefined(self.var_d57eeb7f))
		{
			self.var_d57eeb7f = 0;
		}
		if(n_target_alpha >= n_start_alpha)
		{
			self.var_d57eeb7f++;
		}
		else
		{
			self.var_d57eeb7f--;
			if(self.var_d57eeb7f > 0)
			{
				return;
			}
			self.var_d57eeb7f = 0;
		}
	}
	else
	{
		self.var_d57eeb7f = 0;
	}
	if(!isdefined(level.screen_fade_network_frame))
	{
		level.screen_fade_network_frame = 0;
	}
	if(!isdefined(v_color))
	{
		v_color = (0, 0, 0);
	}
	n_time_ms = int(int(n_time * 1000));
	str_menu = "FullScreenBlack";
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
		}
	}
	lui_menu = 0;
	if(isdefined(self.var_59f4be9a))
	{
		s_menu = self.var_59f4be9a;
		lui_menu = s_menu.lui_menu;
		_one_screen_fade_per_network_frame(s_menu);
		n_start_alpha = lerpfloat(s_menu.n_start_alpha, s_menu.n_target_alpha, (s_menu.n_target_time > 0 ? (gettime() - s_menu.n_start_time) / s_menu.n_target_time : 1));
		[[ lui_menu ]]->function_9cd54463(self, n_start_alpha);
		[[ lui_menu ]]->function_331f9dd(self, n_target_alpha);
		waitframe(1);
	}
	else
	{
		if(isdefined(function_e810a527(str_menu)))
		{
			lui_menu = function_e810a527(str_menu);
			if(![[ lui_menu ]]->function_7bfd10e6(self))
			{
				[[ lui_menu ]]->open(self);
			}
		}
		else
		{
			lui_menu = self openluimenu(str_menu);
		}
		self.var_59f4be9a = spawnstruct();
		self.var_59f4be9a.lui_menu = lui_menu;
	}
	self.var_59f4be9a.n_start_alpha = n_start_alpha;
	self.var_59f4be9a.n_target_alpha = n_target_alpha;
	self.var_59f4be9a.n_target_time = n_time_ms;
	self.var_59f4be9a.n_start_time = gettime();
	self set_color(lui_menu, v_color);
	drawhud = (var_b675738a ? 1 : 0);
	if(isint(lui_menu))
	{
		self setluimenudata(lui_menu, #"startalpha", n_start_alpha);
		self setluimenudata(lui_menu, #"endalpha", n_target_alpha);
		self setluimenudata(lui_menu, #"fadeovertime", n_time_ms);
		self setluimenudata(lui_menu, #"drawhud", drawhud);
	}
	else
	{
		[[ lui_menu ]]->function_9cd54463(self, n_start_alpha);
		[[ lui_menu ]]->function_331f9dd(self, n_target_alpha);
		[[ lui_menu ]]->function_237ff433(self, n_time_ms);
		[[ lui_menu ]]->function_ae1277a0(self, drawhud);
	}
	/#
		if(!isdefined(level.n_fade_debug_time))
		{
			level.n_fade_debug_time = 0;
		}
		n_debug_time = gettime();
		if(n_debug_time - level.n_fade_debug_time > 5000)
		{
			printtoprightln("");
		}
		level.n_fade_debug_time = n_debug_time;
		printtoprightln(((((("" + (string::rjust("" + gettime(), 6))) + "") + string::rjust(str_menu_id, 10) + "") + string::rjust(v_color, 11) + "") + (string::rjust((n_start_alpha + "") + n_target_alpha, 10)) + "") + string::rjust(n_time, 6) + "", (1, 1, 1));
	#/
	if(n_time > 0)
	{
		wait(n_time);
	}
	if(!isdefined(self))
	{
		return;
	}
	if(isint(lui_menu))
	{
		self setluimenudata(lui_menu, #"fadeovertime", 0);
	}
	else
	{
		[[ lui_menu ]]->function_237ff433(self, 0);
	}
	if(b_force_close_menu || n_target_alpha == 0)
	{
		if(isint(lui_menu))
		{
			self closeluimenu(self.var_59f4be9a.lui_menu);
		}
		else
		{
			[[ lui_menu ]]->close(self);
		}
		self.var_59f4be9a = undefined;
	}
}

/*
	Name: _one_screen_fade_per_network_frame
	Namespace: lui
	Checksum: 0xD54D50E8
	Offset: 0x2C10
	Size: 0x4A
	Parameters: 1
	Flags: Linked, Private
*/
function private _one_screen_fade_per_network_frame(s_menu)
{
	while(s_menu.screen_fade_network_frame === level.network_frame)
	{
		util::wait_network_frame();
	}
	s_menu.screen_fade_network_frame = level.network_frame;
}

/*
	Name: open_generic_script_dialog
	Namespace: lui
	Checksum: 0xB284496E
	Offset: 0x2C68
	Size: 0x166
	Parameters: 2
	Flags: None
*/
function open_generic_script_dialog(title, description)
{
	self endoncallback(&function_5ce0a623, #"close_generic_script_dialog", #"disconnect");
	dialog = self openluimenu("ScriptMessageDialog_Compact");
	self setluimenudata(dialog, #"title", title);
	self setluimenudata(dialog, #"description", description);
	self.var_520fb18c = dialog;
	do
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
	}
	while(menu != "ScriptMessageDialog_Compact" || response != "close");
	self closeluimenu(dialog);
	self.var_520fb18c = undefined;
}

/*
	Name: function_5ce0a623
	Namespace: lui
	Checksum: 0x7006434
	Offset: 0x2DD8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_5ce0a623(str_notify)
{
	if(str_notify == "close_generic_script_dialog")
	{
		if(isdefined(self.var_520fb18c))
		{
			self closeluimenu(self.var_520fb18c);
		}
	}
}

/*
	Name: close_generic_script_dialog
	Namespace: lui
	Checksum: 0x39D699D8
	Offset: 0x2E28
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function close_generic_script_dialog()
{
	self notify(#"close_generic_script_dialog");
}

/*
	Name: open_script_dialog
	Namespace: lui
	Checksum: 0x2D178669
	Offset: 0x2E48
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function open_script_dialog(dialog_name)
{
	self endon(#"disconnect");
	dialog = self openluimenu(dialog_name);
	do
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
	}
	while(menu != dialog_name || response != "close");
	self closeluimenu(dialog);
}

