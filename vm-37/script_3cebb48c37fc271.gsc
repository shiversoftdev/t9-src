#using script_1254ac024174d9c0;
#using script_3f9e0dc8454d98e1;
#using script_4ce5d94e8c797350;
#using script_ab890501c40b73c;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_challenges.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_fasttravel;

/*
	Name: function_89f2df9
	Namespace: zm_fasttravel
	Checksum: 0x140BC6F9
	Offset: 0x490
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_fasttravel", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_fasttravel
	Checksum: 0x4336A38D
	Offset: 0x4E8
	Size: 0xBC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_clientfields();
	function_44a82004("power_on");
	level flag::init(#"hash_1b9ecc7979b0fcfb");
	/#
		zm_devgui::add_custom_devgui_callback(&function_dd6276f3);
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
	#/
}

/*
	Name: init_clientfields
	Namespace: zm_fasttravel
	Checksum: 0x4A3F6E2D
	Offset: 0x5B0
	Size: 0x214
	Parameters: 0
	Flags: None
*/
function init_clientfields()
{
	clientfield::register("world", "fasttravel_exploder", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"wormhole_fx", 1, 2, "int");
	clientfield::register("toplayer", "player_stargate_fx", 1, 1, "int");
	clientfield::register("toplayer", "player_chaos_light_rail_fx", 1, 1, "int");
	clientfield::register("toplayer", "fasttravel_teleport_sfx", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_638ce9451eb0ea49", 1, 3, "int");
	clientfield::register("allplayers", "fasttravel_start_fx", 1, 1, "counter");
	clientfield::register("allplayers", "fasttravel_end_fx", 1, 1, "counter");
	clientfield::register("allplayers", "fasttravel_rail_fx", 1, 2, "int");
	clientfield::register("allplayers", "" + #"hash_1747eb69683ce477", 1, 1, "int");
}

/*
	Name: function_44a82004
	Namespace: zm_fasttravel
	Checksum: 0x96774C43
	Offset: 0x7D0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_44a82004(str_flag)
{
	if(!isdefined(level.var_5bfd847e))
	{
		level.var_5bfd847e = str_flag;
	}
}

/*
	Name: function_8ac3bea9
	Namespace: zm_fasttravel
	Checksum: 0x3AA33049
	Offset: 0x808
	Size: 0x30C
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	var_7b5d3a70 = &function_2d4bda34;
	if(isdefined(level.var_a5689564))
	{
		var_7b5d3a70 = level.var_a5689564;
	}
	var_1d1bbd52 = struct::get_array("fasttravel_trigger", "targetname");
	foreach(s_loc in var_1d1bbd52)
	{
		level thread [[var_7b5d3a70]](s_loc);
	}
	callback::on_connect(&function_cdbbf1ee);
	level.var_f410ef3b = [];
	for(i = 0; i < 4; i++)
	{
		level.var_f410ef3b[i] = 0;
	}
	var_a3101e2f = getentarray("fasttravel_dropout", "targetname");
	foreach(var_d70a9989 in var_a3101e2f)
	{
		var_d70a9989 sethintstring(#"hash_499c3242364f1755");
		var_d70a9989 thread function_5165d69();
	}
	if(!is_true(level.var_d0fafce1))
	{
		level thread function_1ab837f6();
	}
	s_room = struct::get("s_teleport_room_1", "targetname");
	if(isdefined(s_room))
	{
		level.var_16fecec8 = 1;
		scene::add_scene_func("p8_fxanim_zm_zod_wormhole_bundle", &wormhole_fx);
		scene::add_scene_func("p8_fxanim_zm_office_wormhole_bundle", &wormhole_fx);
	}
	level.var_d03afa3 = [];
	level.var_1dbf5163 = &function_d06e636b;
	level.var_3c84697b = &function_b9c7ccbb;
}

/*
	Name: wormhole_fx
	Namespace: zm_fasttravel
	Checksum: 0x4F82C807
	Offset: 0xB20
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function wormhole_fx(a_ents)
{
	var_fd99631b = a_ents[getfirstarraykey(a_ents)];
	do
	{
		util::wait_network_frame();
	}
	while(!var_fd99631b isplayinganimscripted());
	var_fd99631b clientfield::set("" + #"wormhole_fx", zm_utility::function_166646a6());
}

/*
	Name: function_cdbbf1ee
	Namespace: zm_fasttravel
	Checksum: 0x4FEBB8F3
	Offset: 0xBD0
	Size: 0xE
	Parameters: 0
	Flags: None
*/
function function_cdbbf1ee()
{
	self.var_9c7b96ed = [];
}

/*
	Name: function_2d4bda34
	Namespace: zm_fasttravel
	Checksum: 0x2B70106A
	Offset: 0xBE8
	Size: 0x274
	Parameters: 1
	Flags: None
*/
function function_2d4bda34(s_loc)
{
	s_loc.unitrigger_stub = spawnstruct();
	s_loc.unitrigger_stub.origin = s_loc.origin;
	s_loc.unitrigger_stub.angles = s_loc.angles;
	s_loc.unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	s_loc.unitrigger_stub.cursor_hint = "HINT_NOICON";
	s_loc.unitrigger_stub.require_look_at = 0;
	s_loc.unitrigger_stub.script_string = s_loc.script_string;
	s_loc.unitrigger_stub.script_noteworthy = s_loc.script_noteworthy;
	s_loc.unitrigger_stub.var_7b3e65fe = s_loc.var_7b3e65fe;
	var_a8ca40f5 = (isdefined(s_loc.var_a92d1b24) ? s_loc.var_a92d1b24 : s_loc.var_a4134e51);
	if(isdefined(var_a8ca40f5))
	{
		s_loc.unitrigger_stub.var_a92d1b24 = util::create_flags_and_return_tokens(var_a8ca40f5);
	}
	s_loc.unitrigger_stub.zombie_cost = s_loc.zombie_cost;
	s_loc.unitrigger_stub.var_638d9008 = s_loc.var_638d9008;
	s_loc.unitrigger_stub.var_8d5d092c = s_loc.unitrigger_stub.script_string;
	s_loc.unitrigger_stub.delay = s_loc.delay;
	s_loc.unitrigger_stub.used = 0;
	if(isdefined(s_loc.unitrigger_stub.delay))
	{
		s_loc.unitrigger_stub flag::init("delayed");
	}
	if(isdefined(level.var_829d6a97))
	{
		s_loc [[level.var_829d6a97]]();
	}
	s_loc.unitrigger_stub.prompt_and_visibility_func = &function_5c18a7f4;
	zm_unitrigger::unitrigger_force_per_player_triggers(s_loc.unitrigger_stub, 1);
	zm_unitrigger::register_static_unitrigger(s_loc.unitrigger_stub, &function_6cde5436);
}

/*
	Name: function_5c18a7f4
	Namespace: zm_fasttravel
	Checksum: 0xA7014312
	Offset: 0xE68
	Size: 0x280
	Parameters: 1
	Flags: None
*/
function function_5c18a7f4(player)
{
	if(!isdefined(self.hint_string))
	{
		self.hint_string = [];
	}
	n_player_index = player getentitynumber();
	if(!is_true(player.var_16735873))
	{
		self setvisibletoplayer(player);
	}
	else
	{
		self setinvisibletoplayer(player);
	}
	player globallogic::function_d96c031e();
	if(isdefined(level.var_e9737821))
	{
		var_235457fd = self [[level.var_e9737821]](player, self.stub.var_8d5d092c);
	}
	else
	{
		var_235457fd = self function_c52e8ba(player, self.stub.var_8d5d092c);
	}
	if(!is_true(player.var_9c7b96ed[self.stub.var_8d5d092c]))
	{
		if(isdefined(player.var_d883eecd))
		{
			n_cost = player.var_d883eecd;
		}
		else
		{
			if(isdefined(self.stub))
			{
				n_cost = self.stub.zombie_cost;
			}
			else
			{
				n_cost = self.zombie_cost;
			}
		}
	}
	if(isdefined(self.hint_string[n_player_index]) && self.hint_string[n_player_index] !== " ")
	{
		if(namespace_497ab7da::is_active() && !isdefined(level.var_a29299fb))
		{
			self sethintstringforplayer(player, #"hash_55d25caf8f7bbb2f");
		}
		else
		{
			if(isdefined(n_cost))
			{
				self sethintstringforplayer(player, self.hint_string[n_player_index], n_cost);
			}
			else
			{
				self sethintstringforplayer(player, self.hint_string[n_player_index]);
			}
		}
	}
	return var_235457fd;
}

/*
	Name: function_c52e8ba
	Namespace: zm_fasttravel
	Checksum: 0x19BD2CC0
	Offset: 0x10F0
	Size: 0x204
	Parameters: 2
	Flags: None
*/
function function_c52e8ba(player, var_8d5d092c)
{
	b_result = 0;
	if(!isdefined(self.hint_string))
	{
		self.hint_string = [];
	}
	n_player_index = player getentitynumber();
	if(!self function_d06e636b(player))
	{
		self.hint_string[n_player_index] = #"";
	}
	else
	{
		if(isdefined(self.stub.var_a92d1b24) && !level flag::get_all(self.stub.var_a92d1b24))
		{
			self.hint_string[n_player_index] = #"hash_222289639943b061";
			b_result = 1;
		}
		else
		{
			if(is_true(player.var_9c7b96ed[var_8d5d092c]))
			{
				self.hint_string[n_player_index] = #"hash_7667bd0f83307360";
				b_result = 1;
			}
			else
			{
				if(isdefined(self.stub.delay) && !self.stub flag::get("delayed"))
				{
					self.hint_string[n_player_index] = #"hash_4be7c1bbfe9f5d86";
					b_result = 1;
				}
				else
				{
					if(player function_8b1a219a())
					{
						self.hint_string[n_player_index] = #"hash_47b20f457b370888";
					}
					else
					{
						self.hint_string[n_player_index] = #"hash_2731cc5c1208e2e4";
					}
					b_result = 1;
				}
			}
		}
	}
	return b_result;
}

/*
	Name: function_d06e636b
	Namespace: zm_fasttravel
	Checksum: 0x6D3D220C
	Offset: 0x1300
	Size: 0x13E
	Parameters: 1
	Flags: None
*/
function function_d06e636b(player)
{
	if(!level flag::get(level.var_5bfd847e))
	{
		return false;
	}
	if(!zombie_utility::is_player_valid(player))
	{
		return false;
	}
	if(is_true(player.var_16735873) && isdefined(self.stub) && self.stub.script_string !== "dropout")
	{
		return false;
	}
	if(is_true(player.var_564dec14))
	{
		return false;
	}
	if(player isthrowinggrenade() || player isusingoffhand())
	{
		return false;
	}
	if(level flag::get(#"hash_1b9ecc7979b0fcfb"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_6cde5436
	Namespace: zm_fasttravel
	Checksum: 0x91E8EF41
	Offset: 0x1448
	Size: 0x3F8
	Parameters: 0
	Flags: None
*/
function function_6cde5436()
{
	level endon(#"end_game");
	var_8d5d092c = self.stub.var_8d5d092c;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		if(player zm_utility::in_revive_trigger())
		{
			continue;
		}
		if(player zm_utility::is_drinking())
		{
			continue;
		}
		if(player isthrowinggrenade() || player isusingoffhand())
		{
			continue;
		}
		if(namespace_497ab7da::is_active() && !isdefined(level.var_a29299fb))
		{
			continue;
		}
		if(is_true(player.var_564dec14))
		{
			continue;
		}
		if(is_true(player.var_16735873))
		{
			continue;
		}
		if(!zm_utility::is_player_valid(player))
		{
			continue;
		}
		if(isdefined(self.stub.var_a92d1b24) && !level flag::get_all(self.stub.var_a92d1b24))
		{
			continue;
		}
		if(is_true(player.var_9c7b96ed[var_8d5d092c]))
		{
			continue;
		}
		if(isdefined(self.stub.delay) && !self.stub flag::get("delayed"))
		{
			continue;
		}
		if(isdefined(player.var_d883eecd))
		{
			n_cost = player.var_d883eecd;
		}
		else
		{
			if(isdefined(self.stub))
			{
				n_cost = self.stub.zombie_cost;
			}
			else
			{
				n_cost = self.zombie_cost;
			}
		}
		if(isdefined(level.var_91171ae5))
		{
			n_cost = player [[level.var_91171ae5]](self);
		}
		if(!player zm_score::can_player_purchase(n_cost))
		{
			/#
				player iprintln("");
			#/
			player zm_audio::create_and_play_dialog(#"general", #"outofmoney");
			continue;
		}
		player zm_score::minus_to_player_score(n_cost);
		player contracts::function_5b88297d(#"hash_71ed95630568c0a5");
		level notify(#"hash_e66663be8ba322f", {#player:player});
		player notify(#"hash_e66663be8ba322f");
		if(isdefined(level.var_352c9e03))
		{
			player [[level.var_352c9e03]](self);
		}
		if(isdefined(self.stub))
		{
			player thread function_b9c7ccbb(self.stub, self.stub.var_7b3e65fe);
		}
		else
		{
			player thread function_b9c7ccbb(self);
		}
	}
}

/*
	Name: function_b9c7ccbb
	Namespace: zm_fasttravel
	Checksum: 0x8147A965
	Offset: 0x1848
	Size: 0x53E
	Parameters: 2
	Flags: None
*/
function function_b9c7ccbb(var_12230d08, var_829a20a8)
{
	if(!isdefined(var_829a20a8))
	{
		var_829a20a8 = 0;
	}
	level endon(#"end_game");
	self endon(#"death");
	n_index = get_player_index(self);
	var_f80635c = var_12230d08.script_string;
	self.var_388ee880 = var_f80635c;
	self.var_3011d31c = 0;
	level notify(var_f80635c + "_start", {#s_unitrigger:var_12230d08, #player:self});
	var_4500bf3f = var_12230d08.script_noteworthy;
	var_8d5d092c = var_12230d08.var_8d5d092c;
	var_12230d08.used = 1;
	switch(var_4500bf3f)
	{
		case "traverse":
		{
			if(var_829a20a8)
			{
				if(var_f80635c === "dropout")
				{
					n_idx = self.var_85c91ccc;
				}
				else
				{
					n_idx = function_de173abb(var_f80635c);
					if(!isdefined(n_idx))
					{
						return;
					}
					self.var_85c91ccc = n_idx;
				}
				nd_path_start = getvehiclenode((("fasttravel_" + var_f80635c) + "_start_") + n_idx, "targetname");
				var_384528 = getvehiclenode((("fasttravel_" + var_f80635c) + "_zipline_end_") + n_idx, "targetname");
				str_notify = (("fasttravel_" + var_f80635c) + "_zipline_end_") + n_idx;
			}
			else
			{
				nd_path_start = getvehiclenode(("fasttravel_" + var_f80635c) + "_start", "targetname");
				str_notify = var_f80635c + "_end";
			}
			var_5314bd63 = getent("veh_fasttravel_cam", "targetname");
			self function_66d020b0(var_5314bd63, nd_path_start, undefined, str_notify, undefined, var_12230d08, undefined, undefined);
			break;
		}
		case "flinger":
		case "teleport":
		{
			n_idx = function_de173abb(var_f80635c);
			if(!isdefined(n_idx))
			{
				return;
			}
			self.var_85c91ccc = n_idx;
			str_notify = (("fasttravel_" + var_f80635c) + "_end_") + n_idx;
			self function_66d020b0(undefined, undefined, undefined, str_notify, undefined, var_12230d08, undefined, undefined);
			break;
		}
	}
	if(!var_829a20a8)
	{
		var_f0bbde5 = self function_c78572ab(var_f80635c);
	}
	var_264e247c = 1;
	var_f499ccef = 1;
	if(var_4500bf3f == "traverse")
	{
		if(is_true(level.var_2053e15f))
		{
			var_264e247c = 0;
		}
		else
		{
			util::wait_network_frame();
			if(is_true(level.var_9d19ea6d) || is_true(level.var_7ac95f85))
			{
				var_f499ccef = 0;
			}
		}
	}
	else if(var_4500bf3f == "flinger")
	{
		var_f499ccef = 0;
	}
	if(var_264e247c)
	{
		self function_2aed1d83(var_f0bbde5, var_f499ccef);
		if(isdefined(level.var_1e47389a))
		{
			self thread [[level.var_1e47389a]]();
		}
	}
	if(isdefined(self.var_a5a050c1))
	{
		n_cooldown_timer = self.var_a5a050c1;
	}
	else
	{
		if(isdefined(level.var_a5a050c1))
		{
			n_cooldown_timer = level.var_a5a050c1;
		}
		else
		{
			n_cooldown_timer = 30;
		}
	}
	self function_c1f603e(var_12230d08, n_cooldown_timer, var_8d5d092c);
	self notify(#"hash_178a3d0115bc972e", {#hash_9fa6220c:var_12230d08});
}

/*
	Name: function_c78572ab
	Namespace: zm_fasttravel
	Checksum: 0xEF4BFFA2
	Offset: 0x1D90
	Size: 0xA2
	Parameters: 1
	Flags: None
*/
function function_c78572ab(var_f80635c)
{
	if(self.var_3011d31c)
	{
		var_6a4c362c = function_7a74dbfd(var_f80635c + "_dropdown_end_");
		var_f0bbde5 = self function_d4fbc062(var_6a4c362c);
	}
	else
	{
		var_6a4c362c = function_7a74dbfd(var_f80635c + "_end_");
		var_f0bbde5 = self function_d4fbc062(var_6a4c362c);
	}
	return var_f0bbde5;
}

/*
	Name: function_2aed1d83
	Namespace: zm_fasttravel
	Checksum: 0x172D000
	Offset: 0x1E40
	Size: 0x134
	Parameters: 2
	Flags: None
*/
function function_2aed1d83(var_f0bbde5, var_b3733073)
{
	if(!isdefined(var_b3733073))
	{
		var_b3733073 = 1;
	}
	self dontinterpolate();
	self setorigin(var_f0bbde5.origin);
	/#
		if(var_b3733073 && !isdefined(var_f0bbde5.angles))
		{
			println(("" + (isdefined(var_f0bbde5.origin) ? var_f0bbde5.origin : "")) + "");
		}
	#/
	if(var_b3733073 && isdefined(var_f0bbde5.angles))
	{
		self setplayerangles(var_f0bbde5.angles);
	}
	self function_e61d152a();
	self.var_16735873 = 0;
	self thread function_f86439bc();
}

/*
	Name: function_f86439bc
	Namespace: zm_fasttravel
	Checksum: 0x57900432
	Offset: 0x1F80
	Size: 0x196
	Parameters: 0
	Flags: None
*/
function function_f86439bc()
{
	level endon(#"end_game");
	self endon(#"death");
	var_e9a9a32a = 1;
	do
	{
		util::wait_network_frame();
		var_e9a9a32a = 0;
		players = getplayers();
		foreach(e_player in players)
		{
			if(!isdefined(e_player))
			{
				continue;
			}
			n_distance_squared = distance2dsquared(e_player.origin, self.origin);
			if(self != e_player && !is_true(e_player.var_16735873) && n_distance_squared <= 4096)
			{
				/#
					iprintlnbold("");
				#/
				var_e9a9a32a = 1;
				break;
			}
		}
	}
	while(var_e9a9a32a);
	self.var_f4e33249 = undefined;
}

/*
	Name: function_de173abb
	Namespace: zm_fasttravel
	Checksum: 0x68233281
	Offset: 0x2120
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function function_de173abb(str_loc)
{
	var_33c06362 = level.var_f410ef3b.size;
	for(i = 0; i < var_33c06362; i++)
	{
		n_idx = randomint(var_33c06362);
		if(level.var_f410ef3b[n_idx] == 0)
		{
			level.var_f410ef3b[n_idx] = 1;
			return n_idx;
		}
	}
	return undefined;
}

/*
	Name: get_player_index
	Namespace: zm_fasttravel
	Checksum: 0x5721672B
	Offset: 0x21B8
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function get_player_index(e_player)
{
	a_players = getplayers(e_player.team);
	for(i = 0; i < a_players.size; i++)
	{
		if(e_player == a_players[i])
		{
			return i;
		}
	}
}

/*
	Name: function_7a74dbfd
	Namespace: zm_fasttravel
	Checksum: 0x663D30BB
	Offset: 0x2228
	Size: 0xDE
	Parameters: 1
	Flags: None
*/
function function_7a74dbfd(str_targetname)
{
	var_6a4c362c = [];
	for(i = 0; i < 4; i++)
	{
		var_f0bbde5 = struct::get(str_targetname + i);
		/#
			assert(isdefined(var_f0bbde5), ("" + str_targetname) + i);
		#/
		if(!isdefined(var_6a4c362c))
		{
			var_6a4c362c = [];
		}
		else if(!isarray(var_6a4c362c))
		{
			var_6a4c362c = array(var_6a4c362c);
		}
		var_6a4c362c[var_6a4c362c.size] = var_f0bbde5;
	}
	return var_6a4c362c;
}

/*
	Name: function_66d020b0
	Namespace: zm_fasttravel
	Checksum: 0x39E6914B
	Offset: 0x2310
	Size: 0x9CC
	Parameters: 10
	Flags: None
*/
function function_66d020b0(var_5314bd63, nd_path_start, var_384528, str_notify, var_6c365dbf, var_12230d08, var_5817f611, var_8f1ba730, var_6e7468ee, var_c3cd6081)
{
	if(!isdefined(var_8f1ba730))
	{
		var_8f1ba730 = 0;
	}
	if(!isdefined(var_6e7468ee))
	{
		var_6e7468ee = 1;
	}
	if(!isdefined(var_c3cd6081))
	{
		var_c3cd6081 = 1;
	}
	level endon(#"end_game");
	self endoncallback(&function_79766c56, #"bled_out", #"death");
	self.var_16735873 = 1;
	self.var_99582f14 = 1;
	self function_7a607f29(var_12230d08);
	self.var_f4e33249 = 1;
	self val::set(#"fasttravel", "freezecontrols", 1);
	self val::set(#"fasttravel", "show_hud", 0);
	if(isdefined(level.var_996e8a57))
	{
		if(self namespace_f0b43eb5::is_active())
		{
			self namespace_f0b43eb5::function_7e30f24c();
		}
		else if(isdefined(self.var_9e09931e) && self.var_9e09931e > 0)
		{
			self namespace_f0b43eb5::function_ada590f5();
		}
	}
	if(self isinvehicle())
	{
		self unlink();
		util::wait_network_frame();
	}
	if(isdefined(var_12230d08))
	{
		var_5817f611 = var_12230d08.script_string;
		self.var_5817f611 = var_5817f611;
		var_44c6df03 = var_12230d08.var_cafe149c;
	}
	if(!var_8f1ba730)
	{
		while(level.var_d03afa3[var_5817f611] === 1)
		{
			util::wait_network_frame();
		}
		level thread function_78e3c2ba(var_5817f611);
	}
	foreach(e_player in getplayers())
	{
		e_player clientfield::set_player_uimodel(("WorldSpaceIndicators.bleedOutModel" + self getentitynumber()) + ".hide", 1);
	}
	if(!self laststand::player_is_in_laststand() && isalive(self))
	{
		str_stance = self getstance();
		if(self isstanceallowed("stand"))
		{
			switch(str_stance)
			{
				case "crouch":
				{
					self setstance("stand");
					if(var_c3cd6081)
					{
						wait(0.2);
					}
					break;
				}
				case "prone":
				{
					self setstance("stand");
					if(var_c3cd6081)
					{
						wait(1);
					}
					break;
				}
			}
		}
	}
	if(isdefined(var_6c365dbf))
	{
		if(isarray(var_6c365dbf))
		{
			self util::create_streamer_hint(var_6c365dbf[0].origin, var_6c365dbf[0].angles, 1);
		}
		else
		{
			self util::create_streamer_hint(var_6c365dbf.origin, var_6c365dbf.angles, 1);
		}
	}
	self notify(#"hash_1c35eb15aa210d6", {#hash_9fa6220c:var_12230d08});
	/#
		self zm_challenges::debug_print("");
	#/
	self zm_stats::increment_challenge_stat(#"hash_2f0fbad6ce68f465");
	if(!is_true(self.var_472e3448))
	{
		self stopsounds();
	}
	if(!isdefined(var_12230d08) || (isdefined(var_12230d08) && !is_true(var_12230d08.var_694cbc6f)))
	{
		self ghost();
	}
	self thread function_946fc2d6();
	self clientfield::increment("fasttravel_start_fx", 1);
	if(isdefined(var_5314bd63))
	{
		self thread fasttravel_spline(var_5314bd63, nd_path_start, var_384528);
	}
	else
	{
		if(isdefined(var_12230d08) && var_12230d08.script_noteworthy === "flinger")
		{
			self thread function_bb9a788b(var_6c365dbf, var_12230d08);
		}
		else
		{
			if(is_true(level.var_16fecec8))
			{
				self thread function_a78584c0(var_6c365dbf);
			}
			else
			{
				self thread function_62686dda(var_6c365dbf);
			}
		}
	}
	self waittill(#"fasttravel_over");
	self.var_99582f14 = 0;
	if(isdefined(var_5314bd63))
	{
		self clientfield::set("fasttravel_rail_fx", 0);
		self clientfield::set_to_player("player_chaos_light_rail_fx", 0);
		self clientfield::set("" + #"hash_1747eb69683ce477", 0);
		util::wait_network_frame();
		self allowcrouch(1);
		self allowprone(1);
	}
	else
	{
		self val::reset(#"fasttravel", "freezecontrols");
	}
	if(isdefined(var_44c6df03))
	{
		self clientfield::increment(var_44c6df03, 1);
	}
	else
	{
		self clientfield::increment("fasttravel_end_fx", 1);
	}
	self show();
	if(isdefined(self.var_85c91ccc))
	{
		level.var_f410ef3b[self.var_85c91ccc] = 0;
	}
	if(isdefined(str_notify))
	{
		level notify(str_notify);
	}
	if(isdefined(var_6c365dbf))
	{
		self util::clear_streamer_hint();
	}
	self.var_5817f611 = undefined;
	self notify(#"hash_66790eb1100e11a2", {#hash_9fa6220c:var_12230d08});
	foreach(e_player in getplayers())
	{
		e_player clientfield::set_player_uimodel(("WorldSpaceIndicators.bleedOutModel" + self getentitynumber()) + ".hide", 0);
	}
	if(is_true(var_6e7468ee) && isdefined(level.var_34eb792d))
	{
		thread [[level.var_34eb792d]](self, var_12230d08);
	}
	self util::delay(0.3, undefined, &zm_audio::create_and_play_dialog, #"hash_110a819726ba35f4", #"end");
}

/*
	Name: function_78e3c2ba
	Namespace: zm_fasttravel
	Checksum: 0x10743290
	Offset: 0x2CE8
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_78e3c2ba(var_5817f611)
{
	level endon(#"end_game");
	level.var_d03afa3[var_5817f611] = 1;
	util::wait_network_frame(2);
	level.var_d03afa3[var_5817f611] = undefined;
}

/*
	Name: function_7a607f29
	Namespace: zm_fasttravel
	Checksum: 0xCEA06828
	Offset: 0x2D50
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_7a607f29(var_12230d08)
{
	self.var_f22c83f5 = 1;
	self.var_e75517b1 = 1;
	self val::set(#"fasttravel", "ignoreme", 1);
	b_disable_weapons = 1;
	if(isdefined(var_12230d08) && is_true(var_12230d08.var_638d9008))
	{
		b_disable_weapons = 0;
	}
	if(b_disable_weapons)
	{
		if(self isusingoffhand())
		{
			self forceoffhandend();
		}
		self val::set(#"fasttravel", "disable_weapons", 1);
	}
	self bgb::suspend_weapon_cycling();
	self.var_be3224e6 = 1;
	self util::magic_bullet_shield();
}

/*
	Name: function_e61d152a
	Namespace: zm_fasttravel
	Checksum: 0x605DDB60
	Offset: 0x2E88
	Size: 0x144
	Parameters: 0
	Flags: None
*/
function function_e61d152a()
{
	self.var_f22c83f5 = 0;
	self.var_e75517b1 = 0;
	self val::reset(#"fasttravel", "ignoreme");
	self val::reset(#"fasttravel", "disable_weapons");
	self val::reset(#"fasttravel", "show_hud");
	if(isdefined(level.var_996e8a57))
	{
		if(self namespace_f0b43eb5::is_active())
		{
			self namespace_f0b43eb5::function_b4759cf8();
		}
		else if(isdefined(self.var_9e09931e) && self.var_9e09931e > 0)
		{
			self namespace_f0b43eb5::function_d38641f1();
		}
	}
	self.var_be3224e6 = 0;
	self bgb::resume_weapon_cycling();
	self util::stop_magic_bullet_shield();
}

/*
	Name: function_79766c56
	Namespace: zm_fasttravel
	Checksum: 0x8410EC6A
	Offset: 0x2FD8
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_79766c56(str_notify)
{
	self function_e61d152a();
	self val::reset(#"fasttravel", "freezecontrols");
	self allowcrouch(1);
	self allowprone(1);
	self.var_f4e33249 = undefined;
	self.var_16735873 = 0;
	self val::reset(#"fasttravel", "show_hud");
	if(isdefined(level.var_996e8a57))
	{
		if(self namespace_f0b43eb5::is_active())
		{
			self namespace_f0b43eb5::function_b4759cf8();
		}
		else if(isdefined(self.var_9e09931e) && self.var_9e09931e > 0)
		{
			self namespace_f0b43eb5::function_d38641f1();
		}
	}
}

/*
	Name: fasttravel_spline
	Namespace: zm_fasttravel
	Checksum: 0xE017C38C
	Offset: 0x3118
	Size: 0x4A4
	Parameters: 3
	Flags: None
*/
function fasttravel_spline(var_5314bd63, nd_path_start, var_384528)
{
	self endon(#"death");
	while(true)
	{
		self.var_2790fd8b = spawner::simple_spawn_single(var_5314bd63);
		if(isdefined(self.var_2790fd8b))
		{
			break;
		}
		waitframe(1);
	}
	self.var_2790fd8b val::set("fasttravel_spline", "takedamage", 0);
	self.var_2790fd8b val::set("fasttravel_spline", "allowdeath", 0);
	self.var_2790fd8b setignorepauseworld(1);
	if(isdefined(level.var_a38d293a))
	{
		self.var_2790fd8b setacceleration(level.var_a38d293a);
	}
	else
	{
		self.var_2790fd8b setacceleration(40);
	}
	if(isdefined(level.var_ce0f67cf))
	{
		self.var_2790fd8b setspeed(level.var_ce0f67cf);
	}
	else
	{
		self.var_2790fd8b setspeed(55);
	}
	self.var_2790fd8b setturningability(0.03);
	self.var_2790fd8b.origin = nd_path_start.origin;
	self.var_2790fd8b.angles = nd_path_start.angles;
	self dontinterpolate();
	self setorigin(nd_path_start.origin);
	if(!is_true(level.var_9d19ea6d) && !is_true(level.var_7ac95f85))
	{
		self setplayerangles(nd_path_start.angles);
	}
	self.var_2790fd8b.e_parent = self;
	if(is_true(level.var_dfd49265))
	{
		self playerlinktodelta(self.var_2790fd8b, undefined, 0.5, 0, 0, 0, 0);
	}
	else
	{
		if(is_true(level.var_9d19ea6d))
		{
			self playerlinktodelta(self.var_2790fd8b, undefined, 0.5, 180, 180, 180, 180, 1, 0);
		}
		else
		{
			if(is_true(level.var_7ac95f85))
			{
				self playerlinktodelta(self.var_2790fd8b, undefined, 0.5, 180, 180, 20, 20);
			}
			else
			{
				self playerlinktodelta(self.var_2790fd8b, undefined, 0.5, 30, 30, 15, 30);
			}
		}
	}
	self val::reset(#"fasttravel", "freezecontrols");
	self allowcrouch(0);
	self allowprone(0);
	self.var_2790fd8b vehicle::get_on_path(nd_path_start);
	util::wait_network_frame();
	self clientfield::set("fasttravel_rail_fx", 1);
	self clientfield::set("" + #"hash_1747eb69683ce477", 1);
	self thread function_ab80021(var_384528);
}

/*
	Name: function_62686dda
	Namespace: zm_fasttravel
	Checksum: 0x61378473
	Offset: 0x35C8
	Size: 0x186
	Parameters: 1
	Flags: None
*/
function function_62686dda(var_6c365dbf)
{
	var_a16f5b07 = self.origin;
	self playrumbleonentity(#"hash_5d8a1a68b12dfb24");
	wait(0.5);
	self clientfield::set_to_player("player_stargate_fx", 1);
	self clientfield::set_to_player("fasttravel_teleport_sfx", 1);
	if(isdefined(var_6c365dbf))
	{
		if(isarray(var_6c365dbf))
		{
			var_f0bbde5 = self function_d4fbc062(var_6c365dbf);
		}
		else
		{
			var_f0bbde5 = var_6c365dbf;
		}
		self function_2aed1d83(var_f0bbde5);
	}
	playsoundatposition(#"hash_3388d9809bf60b12", var_a16f5b07);
	wait(0.5);
	self clientfield::set_to_player("player_stargate_fx", 0);
	self clientfield::set_to_player("fasttravel_teleport_sfx", 0);
	self playsound(#"hash_52aaa9a4a2e71c73");
	self notify(#"fasttravel_over");
}

/*
	Name: function_946fc2d6
	Namespace: zm_fasttravel
	Checksum: 0x65E318F1
	Offset: 0x3758
	Size: 0x188
	Parameters: 0
	Flags: None
*/
function function_946fc2d6()
{
	level endon(#"end_game");
	self endon(#"death");
	self waittill(#"fasttravel_over");
	a_enemies = level.ai[#"axis"];
	if(isdefined(a_enemies) && a_enemies.size)
	{
		a_potential_targets = array::get_all_closest(self.origin, a_enemies, undefined, undefined, 640);
		var_ecfe5e20 = array::filter(a_potential_targets, 0, &function_6c856fde);
		if(var_ecfe5e20.size > 0)
		{
			foreach(zombie in var_ecfe5e20)
			{
				if(is_true(zombie.completed_emerging_into_playable_area))
				{
					zombie zombie_utility::setup_zombie_knockdown(self);
				}
			}
		}
	}
}

/*
	Name: function_6c856fde
	Namespace: zm_fasttravel
	Checksum: 0x5419A4B3
	Offset: 0x38E8
	Size: 0x30
	Parameters: 1
	Flags: None
*/
function function_6c856fde(e_zombie)
{
	if(e_zombie.var_6f84b820 == #"normal")
	{
		return true;
	}
	return false;
}

/*
	Name: function_c1f603e
	Namespace: zm_fasttravel
	Checksum: 0x8F01B62E
	Offset: 0x3920
	Size: 0xD8
	Parameters: 3
	Flags: None
*/
function function_c1f603e(var_12230d08, n_cooldown, var_8d5d092c)
{
	level endon(#"end_game");
	self endon(#"death");
	if(var_8d5d092c == "no_cooldown")
	{
		return;
	}
	self.var_9c7b96ed[var_8d5d092c] = 1;
	if(self hasperk(#"hash_37aa3a5919757781"))
	{
		n_cooldown = n_cooldown * 0.5;
	}
	if(isdefined(var_12230d08))
	{
		var_12230d08 waittilltimeout(n_cooldown, #"cancel_fasttravel_cooldown");
	}
	else
	{
		wait(n_cooldown);
	}
	self.var_9c7b96ed[var_8d5d092c] = 0;
}

/*
	Name: function_5165d69
	Namespace: zm_fasttravel
	Checksum: 0x34EB3761
	Offset: 0x3A00
	Size: 0x228
	Parameters: 0
	Flags: None
*/
function function_5165d69()
{
	level endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		if(!isdefined(player))
		{
			/#
				assert(0, "");
			#/
			continue;
		}
		var_616025ba = getvehiclenode(("fasttravel_dropdown_" + player.var_388ee880) + "_start", "targetname");
		if(!isdefined(var_616025ba))
		{
			/#
				assert(0, "");
			#/
			continue;
		}
		if(!isdefined(player.var_2790fd8b))
		{
			/#
				assert(0, "");
			#/
			continue;
		}
		player endon(#"death");
		player.var_3011d31c = 1;
		player notify(#"switch_rail");
		player.var_2790fd8b vehicle::detach_path();
		player.var_2790fd8b vehicle::get_on_path(var_616025ba);
		player clientfield::set("fasttravel_rail_fx", 2);
		player.var_2790fd8b vehicle::go_path();
		player notify(#"fasttravel_over");
		player unlink();
		wait(0.3);
		if(isdefined(player.var_2790fd8b))
		{
			player.var_2790fd8b delete();
		}
	}
}

/*
	Name: function_1ab837f6
	Namespace: zm_fasttravel
	Checksum: 0xDEF9DE50
	Offset: 0x3C30
	Size: 0x150
	Parameters: 0
	Flags: None
*/
function function_1ab837f6()
{
	level endon(#"end_game");
	level waittill(#"all_players_spawned");
	level flag::wait_till(level.var_5bfd847e);
	level clientfield::set("fasttravel_exploder", 1);
	var_1d1bbd52 = struct::get_array("fasttravel_trigger", "targetname");
	foreach(s_loc in var_1d1bbd52)
	{
		if(isdefined(s_loc.unitrigger_stub.delay))
		{
			s_loc.unitrigger_stub flag::delay_set(s_loc.unitrigger_stub.delay, "delayed");
		}
	}
}

/*
	Name: function_ab80021
	Namespace: zm_fasttravel
	Checksum: 0xC96E405C
	Offset: 0x3D88
	Size: 0x1CC
	Parameters: 1
	Flags: None
*/
function function_ab80021(var_384528)
{
	level endon(#"end_game");
	self endon(#"disconnect", #"switch_rail");
	self playrumblelooponentity(#"hash_5d8a1a68b12dfb24");
	if(isdefined(self.var_2790fd8b))
	{
		self.var_2790fd8b vehicle::go_path();
	}
	if(isdefined(var_384528))
	{
		if(isdefined(self.var_2790fd8b))
		{
			self.var_2790fd8b.origin = var_384528.origin;
		}
		self dontinterpolate();
		self setorigin(var_384528.origin);
		self setplayerangles(var_384528.angles);
		if(isdefined(self.var_2790fd8b))
		{
			self.var_2790fd8b vehicle::get_on_path(var_384528);
			self.var_2790fd8b vehicle::go_path();
		}
	}
	self stoprumble(#"hash_5d8a1a68b12dfb24");
	self notify(#"fasttravel_over");
	self unlink();
	wait(0.3);
	if(isdefined(self.var_2790fd8b))
	{
		self.var_2790fd8b delete();
	}
}

/*
	Name: function_e4af83af
	Namespace: zm_fasttravel
	Checksum: 0xC07A3BB7
	Offset: 0x3F60
	Size: 0x74
	Parameters: 1
	Flags: Private
*/
function private function_e4af83af(s_teleport_room)
{
	util::wait_network_frame();
	self.var_805b8325 = spawn("script_origin", s_teleport_room.origin);
	self.var_805b8325.angles = s_teleport_room.angles;
	self linkto(self.var_805b8325);
}

/*
	Name: function_fdb3b5
	Namespace: zm_fasttravel
	Checksum: 0x73D0621
	Offset: 0x3FE0
	Size: 0x154
	Parameters: 3
	Flags: Private
*/
function private function_fdb3b5(var_a16f5b07, s_teleport_room, var_98b11ed9)
{
	util::wait_network_frame();
	self dontinterpolate();
	self setorigin(s_teleport_room.origin);
	self setplayerangles(s_teleport_room.angles);
	self clientfield::set_to_player("fasttravel_teleport_sfx", 1);
	playsoundatposition(#"hash_3388d9809bf60b12", var_a16f5b07);
	/#
		println("" + self getplayercamerapos());
	#/
	self thread function_e4af83af(s_teleport_room);
	waittillframeend();
	self playrumblelooponentity(#"hash_5d8a1a68b12dfb24");
	self clientfield::set_to_player("" + #"hash_638ce9451eb0ea49", var_98b11ed9);
}

/*
	Name: function_a78584c0
	Namespace: zm_fasttravel
	Checksum: 0x9D19DF0
	Offset: 0x4140
	Size: 0x37E
	Parameters: 1
	Flags: None
*/
function function_a78584c0(var_6c365dbf)
{
	level endon(#"end_game");
	self endoncallback(&function_9ff6bcf6, #"death");
	var_a16f5b07 = self.origin;
	self allowcrouch(0);
	self allowprone(0);
	var_1e1e92e9 = [];
	for(i = 0; i < 4; i++)
	{
		str_name = "s_teleport_room_" + (i + 1);
		var_1e1e92e9[i] = struct::get(str_name, "targetname");
	}
	if(!isdefined(level.var_98b11ed9))
	{
		level.var_98b11ed9 = 0;
	}
	s_teleport_room = var_1e1e92e9[level.var_98b11ed9];
	level.var_98b11ed9++;
	var_98b11ed9 = level.var_98b11ed9;
	if(level.var_98b11ed9 >= var_1e1e92e9.size)
	{
		level.var_98b11ed9 = 0;
	}
	self thread function_fdb3b5(var_a16f5b07, s_teleport_room, var_98b11ed9);
	v_vortex_origin = s_teleport_room.origin + (anglestoforward(s_teleport_room.angles) * 1000);
	var_291fc0f7 = struct::spawn(v_vortex_origin, s_teleport_room.angles - vectorscale((0, 1, 0), 90));
	self function_82c1415f(var_291fc0f7);
	self clientfield::set_to_player("" + #"hash_638ce9451eb0ea49", 0);
	if(isdefined(self.var_805b8325))
	{
		self.var_805b8325 delete();
		self.var_805b8325 = undefined;
	}
	if(isdefined(var_6c365dbf))
	{
		if(isarray(var_6c365dbf))
		{
			var_f0bbde5 = self function_d4fbc062(var_6c365dbf);
		}
		else
		{
			var_f0bbde5 = var_6c365dbf;
		}
		self function_2aed1d83(var_f0bbde5);
	}
	self clientfield::set_to_player("fasttravel_teleport_sfx", 0);
	self playsound(#"hash_52aaa9a4a2e71c73");
	self allowcrouch(1);
	self allowprone(1);
	self notify(#"fasttravel_over", {#str_type:#"vortex"});
}

/*
	Name: function_9ff6bcf6
	Namespace: zm_fasttravel
	Checksum: 0x202BC75
	Offset: 0x44C8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_9ff6bcf6(var_c34665fc)
{
	if(isdefined(self) && isdefined(self.var_805b8325))
	{
		self.var_805b8325 delete();
	}
}

/*
	Name: function_183c691b
	Namespace: zm_fasttravel
	Checksum: 0x123DA640
	Offset: 0x4510
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function function_183c691b()
{
	if(zm_utility::function_166646a6() == 1)
	{
		return "p8_fxanim_zm_office_wormhole_bundle";
	}
	return "p8_fxanim_zm_zod_wormhole_bundle";
}

/*
	Name: function_b6e62bc1
	Namespace: zm_fasttravel
	Checksum: 0x91CE445A
	Offset: 0x4548
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function function_b6e62bc1()
{
	if(isdefined(level.var_f3901984))
	{
		return level.var_f3901984;
	}
	str_scene = function_183c691b();
	return scene::function_12479eba(str_scene);
}

/*
	Name: function_82c1415f
	Namespace: zm_fasttravel
	Checksum: 0xC153791C
	Offset: 0x45A8
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_82c1415f(var_291fc0f7)
{
	level endon(#"end_game");
	var_e830c896 = function_183c691b();
	if(!isdefined(level.var_f3901984))
	{
		var_291fc0f7 scene::play(var_e830c896);
	}
	else
	{
		var_291fc0f7 thread scene::play(var_e830c896);
		wait(level.var_f3901984);
		var_291fc0f7 thread scene::stop(var_e830c896);
	}
	self stoprumble(#"hash_5d8a1a68b12dfb24");
	var_291fc0f7 struct::delete();
}

/*
	Name: function_d4fbc062
	Namespace: zm_fasttravel
	Checksum: 0x59B21BBB
	Offset: 0x4698
	Size: 0x11E
	Parameters: 1
	Flags: None
*/
function function_d4fbc062(var_6a4c362c)
{
	n_index = get_player_index(self);
	a_e_players = getplayers();
	if(self function_60d91d03(var_6a4c362c[n_index], a_e_players))
	{
		return var_6a4c362c[n_index];
	}
	foreach(var_f0bbde5 in var_6a4c362c)
	{
		if(var_f0bbde5 == var_6a4c362c[n_index])
		{
			continue;
		}
		if(self function_60d91d03(var_f0bbde5, a_e_players))
		{
			return var_f0bbde5;
		}
	}
	return var_6a4c362c[n_index];
}

/*
	Name: function_60d91d03
	Namespace: zm_fasttravel
	Checksum: 0x8AC310CD
	Offset: 0x47C0
	Size: 0x15C
	Parameters: 2
	Flags: None
*/
function function_60d91d03(var_f0bbde5, a_e_players)
{
	b_safe = 1;
	/#
		assert(isdefined(var_f0bbde5), "");
	#/
	foreach(e_player in a_e_players)
	{
		if(is_true(e_player.var_16735873))
		{
			continue;
			continue;
		}
		if(abs(var_f0bbde5.origin[2] - e_player.origin[2]) > 60)
		{
			continue;
			continue;
		}
		if(distance2dsquared(var_f0bbde5.origin, e_player.origin) > 4096)
		{
			continue;
			continue;
		}
		b_safe = 0;
		break;
	}
	return b_safe;
}

/*
	Name: function_bb9a788b
	Namespace: zm_fasttravel
	Checksum: 0x5135CE98
	Offset: 0x4928
	Size: 0x194
	Parameters: 2
	Flags: None
*/
function function_bb9a788b(var_6c365dbf, var_12230d08)
{
	level endon(#"end_game");
	self endoncallback(&function_672d56c7, #"death");
	self.var_46e13a5f = util::spawn_model("tag_origin", self.origin, self.angles);
	self playerlinkto(self.var_46e13a5f);
	if(isdefined(var_6c365dbf))
	{
		if(isarray(var_6c365dbf))
		{
			var_f0bbde5 = self function_d4fbc062(var_6c365dbf);
		}
		else
		{
			var_f0bbde5 = var_6c365dbf;
		}
		var_c9a46783 = var_f0bbde5;
	}
	else
	{
		var_c9a46783 = struct::get(var_12230d08.var_5d8fb38b, "targetname");
	}
	n_time = self.var_46e13a5f zm_utility::fake_physicslaunch(var_c9a46783.origin, var_12230d08.var_152a43e0);
	wait(n_time);
	self notify(#"fasttravel_over");
	if(isdefined(self.var_46e13a5f))
	{
		self.var_46e13a5f delete();
	}
}

/*
	Name: function_672d56c7
	Namespace: zm_fasttravel
	Checksum: 0x82407FD8
	Offset: 0x4AC8
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_672d56c7()
{
	if(isdefined(self.var_46e13a5f))
	{
		self.var_46e13a5f delete();
	}
}

/*
	Name: function_dd6276f3
	Namespace: zm_fasttravel
	Checksum: 0xA579A671
	Offset: 0x4B00
	Size: 0x112
	Parameters: 1
	Flags: None
*/
function function_dd6276f3(cmd)
{
	switch(cmd)
	{
		case "start_looping":
		{
			if(!is_true(level.var_2a40310c))
			{
				level.var_2a40310c = 1;
				level thread function_8d419972(0);
			}
			break;
		}
		case "stop_looping":
		{
			if(is_true(level.var_2a40310c))
			{
				level.var_2a40310c = 0;
			}
			break;
		}
		case "play_once":
		{
			if(!is_true(level.var_2a40310c))
			{
				level.var_2a40310c = 1;
				level thread function_8d419972(1);
			}
			break;
		}
	}
}

/*
	Name: function_8d419972
	Namespace: zm_fasttravel
	Checksum: 0x4EB32116
	Offset: 0x4C20
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_8d419972(b_play_once)
{
	level endon(#"end_game");
	s_loc = struct::spawn((0, 0, 0));
	player = level.players[0];
	player endon(#"disconnect");
	var_78e5d9d1 = player.origin;
	v_start_angles = player.angles;
	while(is_true(level.var_2a40310c))
	{
		player function_a78584c0(s_loc);
		if(is_true(b_play_once))
		{
			level.var_2a40310c = 0;
		}
	}
	player setorigin(var_78e5d9d1);
	player setplayerangles(v_start_angles);
}

