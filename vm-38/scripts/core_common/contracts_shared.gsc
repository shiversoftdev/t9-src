#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;

#namespace contracts_shared;

/*
	Name: function_31a420d4
	Namespace: contracts_shared
	Checksum: 0x286D36E6
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_31a420d4()
{
	level notify(-943764330);
}

#namespace contracts;

/*
	Name: __init__system__
	Namespace: contracts
	Checksum: 0xBA70B73C
	Offset: 0x98
	Size: 0x2C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"contracts_shared", undefined, undefined, undefined, undefined);
}

/*
	Name: init_player_contract_events
	Namespace: contracts
	Checksum: 0xBC04FD25
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init_player_contract_events()
{
	if(!isdefined(level.player_contract_events))
	{
		level.player_contract_events = [];
	}
	if(!isdefined(level.contract_ids))
	{
		level.contract_ids = [];
	}
}

/*
	Name: register_player_contract_event
	Namespace: contracts
	Checksum: 0x9CADE6
	Offset: 0x118
	Size: 0xF8
	Parameters: 3
	Flags: None
*/
function register_player_contract_event(event_name, event_func, max_param_count)
{
	if(!isdefined(max_param_count))
	{
		max_param_count = 0;
	}
	if(!isdefined(level.player_contract_events[event_name]))
	{
		level.player_contract_events[event_name] = spawnstruct();
		level.player_contract_events[event_name].param_count = max_param_count;
		level.player_contract_events[event_name].events = [];
	}
	/#
		assert(max_param_count == level.player_contract_events[event_name].param_count);
	#/
	level.player_contract_events[event_name].events[level.player_contract_events[event_name].events.size] = event_func;
}

/*
	Name: player_contract_event
	Namespace: contracts
	Checksum: 0x846A6FA6
	Offset: 0x218
	Size: 0x35A
	Parameters: 4
	Flags: Linked
*/
function player_contract_event(event_name, param1, param2, param3)
{
	if(!isdefined(param1))
	{
		param1 = undefined;
	}
	if(!isdefined(param2))
	{
		param2 = undefined;
	}
	if(!isdefined(param3))
	{
		param3 = undefined;
	}
	if(!isdefined(level.player_contract_events[event_name]))
	{
		return;
	}
	param_count = (isdefined(level.player_contract_events[event_name].param_count) ? level.player_contract_events[event_name].param_count : 0);
	switch(param_count)
	{
		case 0:
		default:
		{
			foreach(event_func in level.player_contract_events[event_name].events)
			{
				if(isdefined(event_func))
				{
					self [[event_func]]();
				}
			}
			break;
		}
		case 1:
		{
			foreach(event_func in level.player_contract_events[event_name].events)
			{
				if(isdefined(event_func))
				{
					self [[event_func]](param1);
				}
			}
			break;
		}
		case 2:
		{
			foreach(event_func in level.player_contract_events[event_name].events)
			{
				if(isdefined(event_func))
				{
					self [[event_func]](param1, param2);
				}
			}
			break;
		}
		case 3:
		{
			foreach(event_func in level.player_contract_events[event_name].events)
			{
				if(isdefined(event_func))
				{
					self [[event_func]](param1, param2, param3);
				}
			}
			break;
		}
	}
}

/*
	Name: get_contract_stat
	Namespace: contracts
	Checksum: 0x70A3A290
	Offset: 0x580
	Size: 0x3A
	Parameters: 2
	Flags: None
*/
function get_contract_stat(slot, stat_name)
{
	return self stats::get_stat(#"contracts", slot, stat_name);
}

/*
	Name: function_d17bcd3c
	Namespace: contracts
	Checksum: 0xA4D80EA5
	Offset: 0x5C8
	Size: 0x224
	Parameters: 1
	Flags: Linked
*/
function function_d17bcd3c(slot)
{
	player = self;
	var_5ceb23d0 = spawnstruct();
	var_5ceb23d0.var_38280f2f = #"hash_6a1133003efe7380";
	var_5ceb23d0.var_59cb904f = 0;
	var_5ceb23d0.var_c3e2bb05 = 0;
	var_38280f2f = player stats::function_ff8f4f17(#"loot_contracts", slot, #"contracthash");
	if(!getdvarint(#"hash_d233413e805fbd0", 0))
	{
		var_38280f2f = hash(var_38280f2f);
	}
	if(var_38280f2f != #"")
	{
		var_5ceb23d0.var_38280f2f = var_38280f2f;
		var_5ceb23d0.target_value = player stats::function_ff8f4f17(#"loot_contracts", slot, #"target");
		var_5ceb23d0.var_59cb904f = player stats::function_ff8f4f17(#"loot_contracts", slot, #"progress");
		var_5ceb23d0.var_c3e2bb05 = player stats::function_ff8f4f17(#"loot_contracts", slot, #"contractgamemode");
		var_5ceb23d0.xp = player stats::function_ff8f4f17(#"loot_contracts", slot, #"xp");
		level.contract_ids[var_38280f2f] = player stats::function_ff8f4f17(#"loot_contracts", slot, #"contractid");
	}
	return var_5ceb23d0;
}

/*
	Name: function_de4ff5a
	Namespace: contracts
	Checksum: 0xC18F17B9
	Offset: 0x7F8
	Size: 0xF0
	Parameters: 1
	Flags: Linked
*/
function function_de4ff5a(slot)
{
	player = self;
	var_38280f2f = player stats::function_ff8f4f17(#"loot_contracts", slot, #"contracthash");
	if(!getdvarint(#"hash_d233413e805fbd0", 0))
	{
		var_38280f2f = hash(var_38280f2f);
	}
	if(var_38280f2f != #"")
	{
		level.contract_ids[var_38280f2f] = player stats::function_ff8f4f17(#"loot_contracts", slot, #"contractid");
	}
}

/*
	Name: setup_player_contracts
	Namespace: contracts
	Checksum: 0xE8D6578D
	Offset: 0x8F0
	Size: 0x22E
	Parameters: 2
	Flags: Linked
*/
function setup_player_contracts(max_contract_slots, var_1b3f5772)
{
	player = self;
	if(isdefined(player.pers[#"contracts"]))
	{
		for(slot = 0; slot < max_contract_slots; slot++)
		{
			player function_de4ff5a(slot);
		}
		return;
	}
	if(isbot(player))
	{
		return;
	}
	if(!isdefined(var_1b3f5772))
	{
		var_1b3f5772 = &function_d17bcd3c;
	}
	if(!isdefined(player.pers[#"contracts"]))
	{
		player.pers[#"contracts"] = [];
	}
	player.pers[#"hash_5651f00c6c1790a4"] = self stats::get_stat_global(#"time_played_total");
	for(slot = 0; slot < max_contract_slots; slot++)
	{
		var_5ceb23d0 = player [[var_1b3f5772]](slot);
		if(!isdefined(var_5ceb23d0))
		{
			continue;
		}
		if(!isstruct(var_5ceb23d0))
		{
			continue;
		}
		var_38280f2f = var_5ceb23d0.var_38280f2f;
		if(var_38280f2f == #"hash_6a1133003efe7380")
		{
			continue;
		}
		if(isdefined(level.var_c3e2bb05) && isdefined(var_5ceb23d0.var_c3e2bb05) && level.var_c3e2bb05 != var_5ceb23d0.var_c3e2bb05 && var_5ceb23d0.var_c3e2bb05 != 5)
		{
			continue;
		}
		var_5ceb23d0.var_38280f2f = undefined;
		var_5ceb23d0.var_c3e2bb05 = undefined;
		player.pers[#"contracts"][var_38280f2f] = var_5ceb23d0;
	}
}

/*
	Name: is_contract_active
	Namespace: contracts
	Checksum: 0xDCA0E623
	Offset: 0xB28
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function is_contract_active(var_38280f2f)
{
	if(!isdefined(var_38280f2f))
	{
		return false;
	}
	if(!isplayer(self))
	{
		return false;
	}
	if(!isdefined(self.pers[#"contracts"]))
	{
		return false;
	}
	if(!isdefined(self.pers[#"contracts"][var_38280f2f]))
	{
		return false;
	}
	return true;
}

/*
	Name: increment_contract
	Namespace: contracts
	Checksum: 0x2411336F
	Offset: 0xBB8
	Size: 0x58
	Parameters: 2
	Flags: Linked
*/
function increment_contract(var_38280f2f, delta)
{
	if(!isdefined(delta))
	{
		delta = 1;
	}
	if(self is_contract_active(var_38280f2f))
	{
		self [[level.var_79a93566]](var_38280f2f, delta);
	}
}

/*
	Name: function_5e1c4d33
	Namespace: contracts
	Checksum: 0x848D11DF
	Offset: 0xC18
	Size: 0xFE
	Parameters: 1
	Flags: None
*/
function function_5e1c4d33(var_5ceb23d0)
{
	/#
		player = self;
		if(isbot(player))
		{
			return;
		}
		if(!isdefined(player.pers[#"contracts"]))
		{
			player.pers[#"contracts"] = [];
		}
		if(!isstruct(var_5ceb23d0))
		{
			return;
		}
		var_38280f2f = var_5ceb23d0.var_38280f2f;
		if(var_38280f2f == #"hash_6a1133003efe7380")
		{
			player.pers[#"contracts"][var_38280f2f] = undefined;
			return;
		}
		var_5ceb23d0.var_38280f2f = undefined;
		player.pers[#"contracts"][var_38280f2f] = var_5ceb23d0;
	#/
}

/*
	Name: function_e07e542b
	Namespace: contracts
	Checksum: 0x657AA76B
	Offset: 0xD20
	Size: 0xEC
	Parameters: 2
	Flags: None
*/
function function_e07e542b(var_1d89ece6, var_300afbc8)
{
	/#
		level thread watch_contract_debug(var_300afbc8);
		function_a781ee84(var_1d89ece6);
		util::function_3f749abc(var_1d89ece6 + "", "");
		util::function_3f749abc(var_1d89ece6 + "", "");
		util::function_3f749abc(var_1d89ece6 + "", "");
		util::function_3f749abc(var_1d89ece6 + "", "");
	#/
}

/*
	Name: function_a781ee84
	Namespace: contracts
	Checksum: 0x3A232116
	Offset: 0xE18
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_a781ee84(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + 2);
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + 5);
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + 10);
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + 100);
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + 1000);
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + 0);
	#/
}

/*
	Name: watch_contract_debug
	Namespace: contracts
	Checksum: 0x1C42479B
	Offset: 0xF50
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function watch_contract_debug(var_300afbc8)
{
	/#
		level notify(#"watch_contract_debug_singleton");
		level endon(#"watch_contract_debug_singleton", #"game_ended");
		while(true)
		{
			function_33bab9aa();
			if(isdefined(var_300afbc8))
			{
				[[var_300afbc8]]();
			}
			wait(0.5);
		}
	#/
}

/*
	Name: function_33bab9aa
	Namespace: contracts
	Checksum: 0x29FCFDE
	Offset: 0xFE0
	Size: 0x554
	Parameters: 0
	Flags: None
*/
function function_33bab9aa()
{
	/#
		if(getdvarint(#"hash_7c0db43f4c0bff69", 0) > 0)
		{
			if(isdefined(level.players))
			{
				foreach(player in level.players)
				{
					if(!isdefined(player))
					{
						continue;
					}
					if(isbot(player))
					{
						continue;
					}
					if(isdefined(player.pers) && isdefined(player.pers[#"contracts"]))
					{
						player.pers[#"contracts"] = undefined;
					}
					iprintln("" + player.name);
				}
			}
			setdvar(#"hash_7c0db43f4c0bff69", 0);
		}
		if(getdvarint(#"hash_23bd356dbd92a9e2", 0) > 0)
		{
			if(isdefined(level.players))
			{
				foreach(player in level.players)
				{
					if(!isdefined(player))
					{
						continue;
					}
					if(isbot(player))
					{
						continue;
					}
					if(isdefined(player.pers) && isdefined(player.pers[#"contracts"]))
					{
						player function_78083139();
					}
					iprintln("" + player.name);
				}
			}
			setdvar(#"hash_23bd356dbd92a9e2", 0);
		}
		if(getdvarstring(#"hash_4e7103a8bd2b97f6", "") != "")
		{
			if(isdefined(level.players))
			{
				var_f029d0d7 = getdvarstring(#"hash_4e7103a8bd2b97f6", "");
				foreach(player in level.players)
				{
					if(!isdefined(player))
					{
						continue;
					}
					if(isbot(player))
					{
						continue;
					}
					var_61525c00 = spawnstruct();
					var_61525c00.var_38280f2f = hash(var_f029d0d7);
					var_61525c00.target_value = 8;
					var_61525c00.var_59cb904f = 0;
					player function_5e1c4d33(var_61525c00);
					iprintln(((("" + var_f029d0d7) + "") + player.name) + "");
				}
			}
			setdvar(#"hash_4e7103a8bd2b97f6", "");
		}
		if(getdvarint(#"scr_contract_msg_front_end_only", 0) > 0)
		{
			iprintln("");
			setdvar(#"scr_contract_msg_front_end_only", 0);
		}
		if(getdvarint(#"scr_contract_msg_debug_on", 0) > 0)
		{
			iprintln("");
			setdvar(#"scr_contract_msg_debug_on", 0);
		}
	#/
}

/*
	Name: function_d3fba20e
	Namespace: contracts
	Checksum: 0x47E1FD69
	Offset: 0x1540
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_d3fba20e()
{
	players = getplayers();
	foreach(player in players)
	{
		player function_78083139();
	}
}

/*
	Name: function_78083139
	Namespace: contracts
	Checksum: 0x203A064E
	Offset: 0x15E8
	Size: 0x56A
	Parameters: 0
	Flags: Linked
*/
function function_78083139()
{
	player = self;
	if(!isplayer(player))
	{
		return;
	}
	if(isbot(player))
	{
		return;
	}
	if(!isdefined(player.pers))
	{
		return;
	}
	if(!isdefined(player.pers[#"contracts"]))
	{
		return;
	}
	foreach(var_5ceb23d0 in player.pers[#"contracts"])
	{
		if(isdefined(var_5ceb23d0.current_value))
		{
			delta = var_5ceb23d0.current_value - var_5ceb23d0.var_59cb904f;
		}
		else
		{
			delta = 0;
		}
		var_4b67585c = 0;
		var_2de8a050 = 0;
		if(!isdefined(var_5ceb23d0.var_1bd1ecbb))
		{
			var_5ceb23d0.var_1bd1ecbb = 0;
		}
		if(!isdefined(var_5ceb23d0.var_c7d05ecd))
		{
			var_5ceb23d0.var_c7d05ecd = 0;
		}
		if(isdefined(var_5ceb23d0.var_be5bf249))
		{
			var_4b67585c = var_5ceb23d0.var_be5bf249 - var_5ceb23d0.var_1bd1ecbb;
			var_2de8a050 = var_5ceb23d0.var_be5bf249 - var_5ceb23d0.var_c7d05ecd;
		}
		else
		{
			if(sessionmodeiszombiesgame())
			{
				var_ad6e6421 = player.pers[#"time_played_total"];
				var_5463bb33 = var_ad6e6421;
			}
			else
			{
				var_ad6e6421 = undefined;
				if(isdefined(level.var_f202fa67) && [[level.var_f202fa67]](var_38280f2f))
				{
					if(isdefined(player.var_c619a827))
					{
						var_ad6e6421 = player.var_c619a827 - player.pers[#"hash_5651f00c6c1790a4"];
					}
				}
				else if(!isdefined(level.var_e3551fe4) || ![[level.var_e3551fe4]](var_38280f2f))
				{
					if(isdefined(player.var_56bd2c02))
					{
						var_ad6e6421 = player.var_56bd2c02 - player.pers[#"hash_5651f00c6c1790a4"];
					}
				}
				time_played_total = player stats::get_stat_global(#"time_played_total");
				var_9d12108c = (isdefined(self.timeplayed[self.team]) ? self.timeplayed[self.team] : 0);
				var_5463bb33 = (time_played_total - player.pers[#"hash_5651f00c6c1790a4"]) + var_9d12108c;
				if(!isdefined(var_ad6e6421))
				{
					var_ad6e6421 = var_5463bb33;
				}
			}
			var_4b67585c = var_ad6e6421 - var_5ceb23d0.var_1bd1ecbb;
			var_2de8a050 = var_5463bb33 - var_5ceb23d0.var_c7d05ecd;
		}
		if(delta <= 0 && var_4b67585c <= 0 && var_2de8a050 <= 0)
		{
			continue;
		}
		if(var_4b67585c < 0)
		{
			var_4b67585c = 0;
		}
		if(var_2de8a050 < 0)
		{
			var_2de8a050 = 0;
		}
		var_9224acc = 0;
		if(isdefined(var_5ceb23d0.current_value))
		{
			if(var_5ceb23d0.current_value >= var_5ceb23d0.target_value)
			{
				var_9224acc = 1;
			}
		}
		/#
			if(getdvarint(#"scr_contract_debug", 0) > 0)
			{
				var_7b6acdb1 = (var_9224acc ? "" : "");
				iprintln(((((((("" + function_9e72a96(var_38280f2f)) + "") + delta) + "") + var_4b67585c) + "") + var_2de8a050) + var_7b6acdb1);
			}
		#/
		flags = player function_507247e8(var_9224acc);
		function_d8c98325(var_38280f2f, delta, flags, var_4b67585c, var_2de8a050);
		if(isdefined(var_5ceb23d0.current_value))
		{
			var_5ceb23d0.var_59cb904f = var_5ceb23d0.current_value;
		}
		var_5ceb23d0.var_1bd1ecbb = var_5ceb23d0.var_1bd1ecbb + var_4b67585c;
		var_5ceb23d0.var_c7d05ecd = var_5ceb23d0.var_c7d05ecd + var_2de8a050;
	}
}

/*
	Name: function_d8c98325
	Namespace: contracts
	Checksum: 0xE71D2361
	Offset: 0x1B60
	Size: 0xCC
	Parameters: 5
	Flags: Linked
*/
function function_d8c98325(var_38280f2f, delta, flags, var_4b67585c, var_2de8a050)
{
	player = self;
	if(var_38280f2f != #"")
	{
		var_ba4b2f4 = function_83edb851(var_38280f2f, #"contract");
		if(var_ba4b2f4 != #"")
		{
			player function_cce105c8(var_ba4b2f4, 1, delta, 2, flags, 3, var_4b67585c, 4, var_2de8a050);
		}
	}
}

/*
	Name: function_507247e8
	Namespace: contracts
	Checksum: 0xF33A7B9F
	Offset: 0x1C38
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_507247e8(var_9224acc)
{
	player = self;
	flags = 0;
	xpscale = player getxpscale();
	if(xpscale > 1)
	{
		flags = flags | 1;
	}
	lootxpscale = player function_c52bcf79();
	if(sessionmodeiszombiesgame())
	{
		if(max(lootxpscale, float(getdvarint(#"hash_1624faaee3c04f09", 1))) > 1)
		{
			flags = flags | 2;
		}
	}
	else if(lootxpscale > 1)
	{
		flags = flags | 2;
	}
	if(var_9224acc)
	{
		flags = flags | 8;
	}
	if(getdvarint(#"lootcontracts_daily_tier_skip", 0) != 0)
	{
		flags = flags | 16;
	}
	return flags;
}

