#using script_1029986e2bc8ca8e;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_ff7e490;

/*
	Name: function_c91ec403
	Namespace: namespace_ff7e490
	Checksum: 0x98310C27
	Offset: 0x338
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c91ec403()
{
	level notify(1735760958);
}

/*
	Name: init
	Namespace: namespace_ff7e490
	Checksum: 0xFB757B24
	Offset: 0x358
	Size: 0x144
	Parameters: 0
	Flags: None
*/
function init()
{
	clientfield::register("world", "" + #"hash_666ad912cb4541f1", 28000, 1, "int");
	clientfield::register("world", "" + #"hash_6601c584f23761c4", 28000, 1, "int");
	level.var_5bfd847e = #"hash_1446e25b57f66305";
	level.var_352c9e03 = &function_af65fe93;
	level.var_e9737821 = &function_c52e8ba;
	level.var_a5a050c1 = 30;
	level.var_ce0f67cf = 5;
	level.var_d0fafce1 = 1;
	level clientfield::set("" + #"hash_6601c584f23761c4", 1);
	function_56987d5e();
}

/*
	Name: start_fasttravel
	Namespace: namespace_ff7e490
	Checksum: 0x8C71D2BC
	Offset: 0x4A8
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function start_fasttravel()
{
	level flag::set(#"hash_1446e25b57f66305");
	level clientfield::set("" + #"hash_666ad912cb4541f1", 1);
	function_becf7525("portal_fx_main_street_to_helipads");
	function_becf7525("portal_fx_main_street_to_anytown_usa");
	function_becf7525("portal_fx_anytown_usa_to_main_street");
	function_becf7525("portal_fx_bunker_to_anytown_usa");
	function_becf7525("portal_fx_observation_to_bunker");
	function_becf7525("portal_fx_observation_to_helipads");
}

/*
	Name: function_becf7525
	Namespace: namespace_ff7e490
	Checksum: 0xC8F0892D
	Offset: 0x5A0
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private function_becf7525(var_a04ebe57)
{
	e_portal = getent(var_a04ebe57, "targetname");
	playsoundatposition(#"hash_5f27432854b069c9", e_portal.origin);
}

/*
	Name: function_af65fe93
	Namespace: namespace_ff7e490
	Checksum: 0xAD3114B5
	Offset: 0x610
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_af65fe93(var_79bf62e6)
{
	if(!isplayer(self) || !isdefined(var_79bf62e6))
	{
		return;
	}
	str_loc = var_79bf62e6.stub.script_string;
	s_loc = struct::get((str_loc + "_end_") + zm_fasttravel::get_player_index(self));
	self util::create_streamer_hint(s_loc.origin, s_loc.angles, 1);
	self util::delay("fasttravel_over", "disconnect", &util::clear_streamer_hint);
}

/*
	Name: function_c52e8ba
	Namespace: namespace_ff7e490
	Checksum: 0x4F66EB35
	Offset: 0x708
	Size: 0x54E
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
	if(!self zm_fasttravel::function_d06e636b(player) || player isswitchingweapons())
	{
		self.hint_string[n_player_index] = #"";
	}
	else
	{
		if(isdefined(self.stub.var_a92d1b24) && !level flag::get_all(self.stub.var_a92d1b24))
		{
			switch(self.stub.script_string)
			{
				case "helipads_to_main_street":
				{
					if(level flag::get(#"hash_5981a23fdea21f78"))
					{
						self.hint_string[n_player_index] = #"hash_5d6c42a597323f3c";
						b_result = 1;
					}
					break;
				}
				case "anytown_usa_to_bunker":
				{
					if(!level flag::get(#"hash_bc6e6c4a2ea3f60"))
					{
						self.hint_string[n_player_index] = #"hash_116dced27129125c";
						b_result = 1;
					}
					break;
				}
				case "observation_to_helipads":
				{
					if(!level flag::get(#"power_on1"))
					{
						self.hint_string[n_player_index] = #"hash_793db3dc20917334";
						b_result = 1;
					}
					break;
				}
				default:
				{
					self.hint_string[n_player_index] = #"hash_222289639943b061";
					b_result = 1;
					break;
				}
			}
		}
		else
		{
			if(is_true(player.var_9c7b96ed[var_8d5d092c]))
			{
				switch(self.stub.script_string)
				{
					default:
					{
						self.hint_string[n_player_index] = #"hash_7667bd0f83307360";
						b_result = 1;
						break;
					}
				}
			}
			else
			{
				if(isdefined(self.stub.delay) && !self.stub flag::get("delayed"))
				{
					switch(self.stub.script_string)
					{
						default:
						{
							self.hint_string[n_player_index] = #"hash_4be7c1bbfe9f5d86";
							b_result = 1;
							break;
						}
					}
				}
				else
				{
					switch(self.stub.script_string)
					{
						case "main_street_to_helipads":
						case "observation_to_helipads":
						{
							self.hint_string[n_player_index] = #"hash_304d3a663d56e57f";
							break;
						}
						case "helipads_to_main_street":
						{
							self.hint_string[n_player_index] = #"hash_44a5bc69db5e0ee7";
							break;
						}
						case "anytown_usa_to_main_street":
						{
							self.hint_string[n_player_index] = #"hash_423e9a8e530ed95a";
							break;
						}
						case "main_street_to_anytown_usa":
						{
							self.hint_string[n_player_index] = #"hash_29eee6d6112fe209";
							break;
						}
						case "bunker_to_anytown_usa":
						{
							self.hint_string[n_player_index] = #"hash_6250636afaff2f8b";
							break;
						}
						case "anytown_usa_to_bunker":
						{
							self.hint_string[n_player_index] = #"hash_4c57d5cff43d2407";
							break;
						}
						case "observation_to_bunker":
						{
							self.hint_string[n_player_index] = #"hash_656093d7320c2914";
							break;
						}
						case "helipads_to_observation":
						case "bunker_to_observation":
						{
							self.hint_string[n_player_index] = #"hash_3b286335feef3751";
							break;
						}
						default:
						{
							self.hint_string[n_player_index] = #"hash_2731cc5c1208e2e4";
							break;
						}
					}
					b_result = 1;
				}
			}
		}
	}
	return b_result;
}

/*
	Name: function_56987d5e
	Namespace: namespace_ff7e490
	Checksum: 0xDF559EB
	Offset: 0xC60
	Size: 0x7C
	Parameters: 0
	Flags: Private
*/
function private function_56987d5e()
{
	level.var_c1bfcfe0 = array();
	level.var_7899bc18 = array();
	level.var_b2fde059 = &function_ee59489c;
	level.var_248a3989 = &function_10ff2c34;
	level.var_9fed8c8b = &function_e1579dc4;
}

/*
	Name: function_a70fa155
	Namespace: namespace_ff7e490
	Checksum: 0x715ED633
	Offset: 0xCE8
	Size: 0x518
	Parameters: 6
	Flags: None
*/
function function_a70fa155(var_74fbad21, var_af6496cd, var_54829af, var_32281137, var_95c6b9dd, var_c8bb51c4)
{
	if(!isdefined(var_c8bb51c4))
	{
		var_c8bb51c4 = 0;
	}
	level endoncallback(&function_c8901681, var_95c6b9dd, #"hash_419cb6aea3c6771e");
	level endon(#"end_game");
	level.var_474108be = var_74fbad21;
	level.var_2918dbdf = var_af6496cd;
	foreach(e_player in getplayers())
	{
		var_e3c700bd = e_player [[level.var_248a3989]](var_54829af, var_32281137);
		if(isdefined(var_e3c700bd))
		{
			if(array::function_460f3c24(var_e3c700bd, var_54829af))
			{
				level.var_c1bfcfe0[e_player.playernum] = var_54829af;
			}
			else
			{
				e_player function_66c3f496(var_74fbad21);
				e_player zm_sq::objective_set(var_af6496cd, var_e3c700bd, undefined, undefined, undefined, 96);
				level.var_7899bc18[e_player.playernum] = var_e3c700bd;
			}
			continue;
		}
		e_player function_66c3f496(var_74fbad21);
	}
	while(true)
	{
		wait(1);
		if(var_c8bb51c4)
		{
			var_32281137 = var_54829af[0] [[level.var_9fed8c8b]]();
		}
		foreach(e_player in getplayers())
		{
			var_e3c700bd = e_player [[level.var_248a3989]](var_54829af, var_32281137);
			if(isdefined(var_e3c700bd))
			{
				if(array::function_460f3c24(var_e3c700bd, var_54829af))
				{
					if(isdefined(level.var_7899bc18[e_player.playernum]))
					{
						e_player zm_sq::objective_complete(var_af6496cd);
						level.var_7899bc18[e_player.playernum] = undefined;
					}
					if(!isdefined(level.var_c1bfcfe0[e_player.playernum]))
					{
						e_player function_4f928bec(var_74fbad21, var_54829af);
						level.var_c1bfcfe0[e_player.playernum] = var_54829af;
					}
				}
				else
				{
					if(isdefined(level.var_c1bfcfe0[e_player.playernum]))
					{
						e_player function_66c3f496(var_74fbad21);
						level.var_c1bfcfe0[e_player.playernum] = undefined;
					}
					if(isdefined(level.var_7899bc18[e_player.playernum]))
					{
						if(!array::function_460f3c24(level.var_7899bc18[e_player.playernum], var_e3c700bd))
						{
							e_player zm_sq::objective_complete(var_af6496cd, level.var_7899bc18[e_player.playernum]);
							e_player zm_sq::objective_set(var_af6496cd, var_e3c700bd, undefined, undefined, undefined, 96);
							level.var_7899bc18[e_player.playernum] = var_e3c700bd;
						}
					}
					else
					{
						e_player zm_sq::objective_set(var_af6496cd, var_e3c700bd, undefined, undefined, undefined, 96);
						level.var_7899bc18[e_player.playernum] = var_e3c700bd;
					}
				}
				continue;
			}
			if(isdefined(level.var_c1bfcfe0[e_player.playernum]))
			{
				e_player function_66c3f496(var_74fbad21);
				level.var_c1bfcfe0[e_player.playernum] = undefined;
			}
			if(isdefined(level.var_7899bc18[e_player.playernum]))
			{
				e_player zm_sq::objective_complete(var_af6496cd);
				level.var_7899bc18[e_player.playernum] = undefined;
			}
		}
	}
}

/*
	Name: function_c8901681
	Namespace: namespace_ff7e490
	Checksum: 0x5AC51549
	Offset: 0x1208
	Size: 0x1D4
	Parameters: 1
	Flags: Private
*/
function private function_c8901681(var_b09af3eb)
{
	foreach(e_player in getplayers())
	{
		if(isdefined(level.var_7899bc18[e_player.playernum]))
		{
			e_player zm_sq::objective_complete(level.var_2918dbdf);
			level.var_7899bc18[e_player.playernum] = undefined;
		}
		if(isdefined(level.var_c1bfcfe0[e_player.playernum]))
		{
			level.var_c1bfcfe0[e_player.playernum] = undefined;
		}
	}
	if(var_b09af3eb == #"hash_419cb6aea3c6771e")
	{
		if(isdefined(level.var_474108be))
		{
			if(ishash(level.var_474108be) || isstring(level.var_474108be))
			{
				level zm_sq::objective_complete(level.var_474108be);
			}
			else if(isint(level.var_474108be))
			{
				objective_setstate(level.var_474108be, "done");
				zm_utility::function_bc5a54a8(level.var_474108be);
			}
		}
	}
}

/*
	Name: function_66c3f496
	Namespace: namespace_ff7e490
	Checksum: 0x87833F75
	Offset: 0x13E8
	Size: 0x8C
	Parameters: 1
	Flags: Private
*/
function private function_66c3f496(var_74fbad21)
{
	if(isdefined(var_74fbad21))
	{
		if(ishash(var_74fbad21) || isstring(var_74fbad21))
		{
			self zm_sq::function_3029d343(var_74fbad21);
		}
		else if(isint(var_74fbad21))
		{
			objective_setinvisibletoplayer(var_74fbad21, self);
		}
	}
}

/*
	Name: function_4f928bec
	Namespace: namespace_ff7e490
	Checksum: 0x11F48BE7
	Offset: 0x1480
	Size: 0x9C
	Parameters: 2
	Flags: Private
*/
function private function_4f928bec(var_74fbad21, var_54829af)
{
	if(isdefined(var_74fbad21))
	{
		if(ishash(var_74fbad21) || isstring(var_74fbad21))
		{
			self zm_sq::function_aee0b4b4(var_74fbad21, var_54829af);
		}
		else if(isint(var_74fbad21))
		{
			objective_setvisibletoplayer(var_74fbad21, self);
		}
	}
}

/*
	Name: function_10ff2c34
	Namespace: namespace_ff7e490
	Checksum: 0x8011628E
	Offset: 0x1528
	Size: 0x9F6
	Parameters: 2
	Flags: None
*/
function function_10ff2c34(var_54829af, var_32281137)
{
	if(self zm_zonemgr::is_player_in_zone(level.var_dc2ca204))
	{
		if(array::function_460f3c24(var_32281137, level.var_dc2ca204))
		{
			return var_54829af;
		}
		if(array::function_460f3c24(var_32281137, [0:"zone_observation"]))
		{
			if(level flag::get("power_on1"))
			{
				return struct::get_array("helipads_to_observation", "script_string");
			}
			if(level flag::get(#"hash_67685d2c51bd61db"))
			{
				return struct::get_array("helipads_to_main_street", "script_string");
			}
		}
		else
		{
			if(array::function_460f3c24(var_32281137, level.var_65c43c31))
			{
				if(level flag::get("power_on1"))
				{
					return struct::get_array("helipads_to_observation", "script_string");
				}
				if(level flag::get(#"hash_3976f9f041f5b338"))
				{
					return struct::get_array("helipads_to_main_street", "script_string");
				}
			}
			else
			{
				if(array::function_460f3c24(var_32281137, level.var_2f941a56))
				{
					if(level flag::get(#"connect_anytown_usa_west_zones"))
					{
						return struct::get_array("helipads_to_main_street", "script_string");
					}
				}
				else if(array::function_460f3c24(var_32281137, level.var_6097ff89))
				{
					if(level flag::get(#"hash_23042147964b0bc2"))
					{
						return struct::get_array("helipads_to_main_street", "script_string");
					}
				}
			}
		}
	}
	else
	{
		if(self zm_zonemgr::is_player_in_zone(level.var_6097ff89))
		{
			if(array::function_460f3c24(var_32281137, level.var_6097ff89))
			{
				return var_54829af;
			}
			if(array::function_460f3c24(var_32281137, level.var_dc2ca204))
			{
				return struct::get_array("main_street_to_helipads", "script_string");
			}
			if(array::function_460f3c24(var_32281137, [0:"zone_observation"]))
			{
				if(level flag::get("power_on1"))
				{
					return var_54829af;
				}
				if(level flag::get(#"hash_67685d2c51bd61db"))
				{
					return struct::get_array("main_street_to_anytown_usa", "script_string");
				}
			}
			else
			{
				if(array::function_460f3c24(var_32281137, level.var_65c43c31))
				{
					if(level flag::get(#"hash_3976f9f041f5b338"))
					{
						return struct::get_array("main_street_to_anytown_usa", "script_string");
					}
				}
				else if(array::function_460f3c24(var_32281137, level.var_2f941a56))
				{
					if(level flag::get(#"connect_anytown_usa_west_zones"))
					{
						return struct::get_array("main_street_to_anytown_usa", "script_string");
					}
				}
			}
		}
		else
		{
			if(self zm_zonemgr::is_player_in_zone(level.var_2f941a56))
			{
				if(array::function_460f3c24(var_32281137, level.var_2f941a56))
				{
					return var_54829af;
				}
				if(array::function_460f3c24(var_32281137, level.var_6097ff89))
				{
					return struct::get_array("anytown_usa_to_main_street", "script_string");
				}
				if(array::function_460f3c24(var_32281137, level.var_dc2ca204))
				{
					return struct::get_array("anytown_usa_to_main_street", "script_string");
				}
				if(array::function_460f3c24(var_32281137, [0:"zone_observation"]))
				{
					if(level flag::get("power_on1"))
					{
						return var_54829af;
					}
					if(level flag::get(#"hash_67685d2c51bd61db"))
					{
						return struct::get_array("anytown_usa_to_bunker", "script_string");
					}
				}
				else if(array::function_460f3c24(var_32281137, level.var_65c43c31))
				{
					if(level flag::get(#"hash_3976f9f041f5b338"))
					{
						return struct::get_array("anytown_usa_to_bunker", "script_string");
					}
				}
			}
			else
			{
				if(self zm_zonemgr::is_player_in_zone(level.var_65c43c31))
				{
					if(array::function_460f3c24(var_32281137, level.var_65c43c31))
					{
						return var_54829af;
					}
					if(array::function_460f3c24(var_32281137, level.var_2f941a56))
					{
						return struct::get_array("bunker_to_anytown_usa", "script_string");
					}
					if(array::function_460f3c24(var_32281137, level.var_6097ff89))
					{
						return struct::get_array("bunker_to_anytown_usa", "script_string");
					}
					if(array::function_460f3c24(var_32281137, level.var_dc2ca204))
					{
						if(level flag::get("power_on1"))
						{
							return struct::get_array("bunker_to_observation", "script_string");
						}
						return struct::get_array("bunker_to_anytown_usa", "script_string");
					}
					if(array::function_460f3c24(var_32281137, [0:"zone_observation"]))
					{
						if(level flag::get(#"hash_67685d2c51bd61db"))
						{
							return struct::get_array("bunker_to_observation", "script_string");
						}
					}
				}
				else if(self zm_zonemgr::is_player_in_zone([0:"zone_observation"]))
				{
					if(array::function_460f3c24(var_32281137, [0:"zone_observation"]))
					{
						return var_54829af;
					}
					if(array::function_460f3c24(var_32281137, level.var_65c43c31))
					{
						return struct::get_array("observation_to_bunker", "script_string");
					}
					if(array::function_460f3c24(var_32281137, level.var_2f941a56))
					{
						if(level flag::get("power_on1"))
						{
							return var_54829af;
						}
						return struct::get_array("observation_to_bunker", "script_string");
					}
					if(array::function_460f3c24(var_32281137, level.var_6097ff89))
					{
						if(level flag::get("power_on1"))
						{
							return var_54829af;
						}
						return struct::get_array("observation_to_bunker", "script_string");
					}
					if(array::function_460f3c24(var_32281137, level.var_dc2ca204))
					{
						if(level flag::get("power_on1"))
						{
							return struct::get_array("observation_to_helipads", "script_string");
						}
						return struct::get_array("observation_to_bunker", "script_string");
					}
				}
			}
		}
	}
	return undefined;
}

/*
	Name: function_e1579dc4
	Namespace: namespace_ff7e490
	Checksum: 0x2F9D0411
	Offset: 0x1F28
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_e1579dc4()
{
	var_5f3b05e8 = self zm_utility::get_current_zone();
	if(function_5996e591(var_5f3b05e8, level.var_dc2ca204))
	{
		return level.var_dc2ca204;
	}
	if(function_5996e591(var_5f3b05e8, level.var_6097ff89))
	{
		return level.var_6097ff89;
	}
	if(function_5996e591(var_5f3b05e8, level.var_2f941a56))
	{
		return level.var_2f941a56;
	}
	if(function_5996e591(var_5f3b05e8, level.var_65c43c31))
	{
		return level.var_65c43c31;
	}
	if(function_5996e591(var_5f3b05e8, [0:"zone_observation"]))
	{
		return [0:"zone_observation"];
	}
	return undefined;
}

/*
	Name: function_5996e591
	Namespace: namespace_ff7e490
	Checksum: 0xC9BF23FF
	Offset: 0x2058
	Size: 0x92
	Parameters: 2
	Flags: Private
*/
function private function_5996e591(var_5f3b05e8, a_str_zones)
{
	foreach(str_zone in a_str_zones)
	{
		if(var_5f3b05e8 === str_zone)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_ee59489c
	Namespace: namespace_ff7e490
	Checksum: 0xE932F2E
	Offset: 0x20F8
	Size: 0xB4
	Parameters: 3
	Flags: Private
*/
function private function_ee59489c(var_331b7cc3, origin, instance)
{
	objective_manager::function_9751c453(var_331b7cc3, origin, instance);
	level flag::set(#"hash_419cb6aea3c6771e");
	level thread function_a70fa155(level.var_fdcaf3a6.var_e55c8b4e, #"hash_53c181b5f1f2760f", array(level.var_117d5f10), level.var_dc2ca204, #"hash_4fbe4720f6f13107");
}

