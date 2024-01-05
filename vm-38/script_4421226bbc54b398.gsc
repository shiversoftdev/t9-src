#using scripts\zm_common\zm_score.gsc;
#using script_18077945bb84ede7;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_d4ecbbf0;

/*
	Name: function_b2f667c8
	Namespace: namespace_d4ecbbf0
	Checksum: 0x63862F25
	Offset: 0x338
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b2f667c8()
{
	level notify(1552409098);
}

/*
	Name: __init__system__
	Namespace: namespace_d4ecbbf0
	Checksum: 0x16F4AC7E
	Offset: 0x358
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_6750752a31e788e2", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d4ecbbf0
	Checksum: 0x6BE0B1AE
	Offset: 0x3A0
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_item_pickup(&on_item_pickup);
	callback::add_callback(#"objective_ended", &function_37c1c391);
	level.var_da7a41e7 = 0;
	level.var_e5e795ee = 0;
	level.var_7d3f22bd = 0;
	level.var_e578d0db = 0;
	level.var_5ed8f6ba = 0;
	level.var_8a84008 = 0;
	level.var_97f56902 = 0;
	level.var_fb82a5bd = 0;
	/#
		level function_14defa19();
		level thread function_868c9a6e();
	#/
}

/*
	Name: function_6daf57e7
	Namespace: namespace_d4ecbbf0
	Checksum: 0xC8AA0800
	Offset: 0x490
	Size: 0x62
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6daf57e7(type)
{
	switch(type)
	{
		case "rare":
		{
			return 1;
		}
		case "epic":
		{
			return 2;
		}
		case "legendary":
		{
			return 3;
		}
	}
}

/*
	Name: function_7b6ac8d5
	Namespace: namespace_d4ecbbf0
	Checksum: 0xCFE11BE1
	Offset: 0x500
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_7b6ac8d5(type, reason)
{
	if(!isdefined(reason))
	{
		reason = undefined;
	}
	level endon(#"game_ended");
	self endon(#"death");
	wait(5);
	if(isdefined(reason))
	{
		self luinotifyevent(#"hash_79cee3d30d7eb785", 2, type, reason);
	}
	else
	{
		self luinotifyevent(#"hash_79cee3d30d7eb785", 1, type);
	}
}

/*
	Name: function_e439076f
	Namespace: namespace_d4ecbbf0
	Checksum: 0x2D5B3946
	Offset: 0x5C0
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_e439076f(var_5937b8ee)
{
	level endon(#"game_ended");
	self endon(#"death");
	wait(5);
	level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:var_5937b8ee, #attacker:self});
	/#
		/#
			assert(isdefined(level.scoreinfo[var_5937b8ee][#"xp"]), "");
		#/
	#/
	var_370ac26d = level.scoreinfo[var_5937b8ee][#"xp"];
	self luinotifyevent(#"hash_6743fb07d8c3b4b0", 1, var_370ac26d);
}

/*
	Name: function_2ea9419c
	Namespace: namespace_d4ecbbf0
	Checksum: 0x51E3FDE
	Offset: 0x6D8
	Size: 0x9C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_2ea9419c(type, amount, var_8e592166)
{
	if(!isdefined(amount))
	{
		amount = 1;
	}
	if(!isdefined(var_8e592166))
	{
		var_8e592166 = 1;
	}
	self stats::inc_stat(#"hash_65febbdf3f1ab4d7", type, amount);
	if(is_true(var_8e592166))
	{
		self thread function_6e4a862f(type, amount);
	}
}

/*
	Name: function_6e4a862f
	Namespace: namespace_d4ecbbf0
	Checksum: 0x50FE6E22
	Offset: 0x780
	Size: 0x9C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6e4a862f(type, amount)
{
	level endon(#"game_ended");
	self endon(#"death");
	wait(5);
	typeindex = function_6daf57e7(type);
	if(isdefined(typeindex))
	{
		self luinotifyevent(#"hash_519f4dd76b2e3e49", 2, typeindex, amount);
	}
}

/*
	Name: function_d59d7b74
	Namespace: namespace_d4ecbbf0
	Checksum: 0xE0F8CCD0
	Offset: 0x828
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function function_d59d7b74(amount, var_8e592166)
{
	if(!isdefined(amount))
	{
		amount = 1;
	}
	if(!isdefined(var_8e592166))
	{
		var_8e592166 = 1;
	}
	var_1c26a346 = stats::get_stat(#"hash_65febbdf3f1ab4d7", #"rare");
	if(var_1c26a346 >= 168)
	{
		return;
	}
	function_2ea9419c(#"rare", amount, var_8e592166);
}

/*
	Name: function_89a45cd4
	Namespace: namespace_d4ecbbf0
	Checksum: 0x9315287C
	Offset: 0x8D8
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function function_89a45cd4(amount, var_8e592166)
{
	if(!isdefined(amount))
	{
		amount = 1;
	}
	if(!isdefined(var_8e592166))
	{
		var_8e592166 = 1;
	}
	var_34979522 = stats::get_stat(#"hash_65febbdf3f1ab4d7", #"epic");
	if(var_34979522 >= 112)
	{
		return;
	}
	function_2ea9419c(#"epic", amount, var_8e592166);
}

/*
	Name: function_74f5b460
	Namespace: namespace_d4ecbbf0
	Checksum: 0x585871A0
	Offset: 0x988
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function function_74f5b460(amount, var_8e592166)
{
	if(!isdefined(amount))
	{
		amount = 1;
	}
	if(!isdefined(var_8e592166))
	{
		var_8e592166 = 1;
	}
	var_abde766a = stats::get_stat(#"hash_65febbdf3f1ab4d7", #"legendary");
	if(var_abde766a >= 140)
	{
		return;
	}
	function_2ea9419c(#"legendary", amount, var_8e592166);
}

/*
	Name: function_37c1c391
	Namespace: namespace_d4ecbbf0
	Checksum: 0xEC379EF3
	Offset: 0xA38
	Size: 0xF0
	Parameters: 1
	Flags: Linked
*/
function function_37c1c391(eventstruct)
{
	if(level.var_fdcaf3a6 === level.var_7d45d0d4.var_1d9d92ba)
	{
		return;
	}
	if(!is_true(eventstruct.completed))
	{
		return;
	}
	players = getplayers();
	foreach(player in players)
	{
		player function_73cddc69();
	}
}

/*
	Name: function_3e6a3070
	Namespace: namespace_d4ecbbf0
	Checksum: 0x595D5B93
	Offset: 0xB30
	Size: 0x12A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3e6a3070(var_b48509f9)
{
	switch(var_b48509f9)
	{
		case 1:
		{
			return "exfil_sr_rank_1";
		}
		case 2:
		{
			return "exfil_sr_rank_2";
		}
		case 3:
		{
			return "exfil_sr_rank_3";
		}
		case 4:
		{
			return "exfil_sr_rank_4";
		}
		case 5:
		{
			return "exfil_sr_rank_5";
		}
		case 6:
		{
			return "exfil_sr_rank_6";
		}
		case 7:
		{
			return "exfil_sr_rank_7";
		}
		case 8:
		{
			return "exfil_sr_rank_8";
		}
		case 9:
		{
			return "exfil_sr_rank_9";
		}
		case 10:
		{
			return "exfil_sr_rank_10";
		}
		default:
		{
			return "exfil_sr_rank_10";
		}
	}
}

/*
	Name: function_75ecd524
	Namespace: namespace_d4ecbbf0
	Checksum: 0x537EAAFF
	Offset: 0xC68
	Size: 0x202
	Parameters: 1
	Flags: Linked, Private
*/
function private function_75ecd524(var_14326bba)
{
	switch(var_14326bba)
	{
		case 10:
		{
			return "exfil_rbz_round_10";
		}
		case 15:
		{
			return "exfil_rbz_round_15";
		}
		case 20:
		{
			return "exfil_rbz_round_20";
		}
		case 25:
		{
			return "exfil_rbz_round_25";
		}
		case 30:
		{
			return "exfil_rbz_round_30";
		}
		case 35:
		{
			return "exfil_rbz_round_35";
		}
		case 40:
		{
			return "exfil_rbz_round_40";
		}
		case 45:
		{
			return "exfil_rbz_round_45";
		}
		case 50:
		{
			return "exfil_rbz_round_50";
		}
		case 55:
		{
			return "exfil_rbz_round_55";
		}
		case 60:
		{
			return "exfil_rbz_round_60";
		}
		case 65:
		{
			return "exfil_rbz_round_65";
		}
		case 70:
		{
			return "exfil_rbz_round_70";
		}
		case 75:
		{
			return "exfil_rbz_round_75";
		}
		case 80:
		{
			return "exfil_rbz_round_80";
		}
		case 85:
		{
			return "exfil_rbz_round_85";
		}
		case 90:
		{
			return "exfil_rbz_round_90";
		}
		case 95:
		{
			return "exfil_rbz_round_95";
		}
		case 100:
		{
			return "exfil_rbz_round_100";
		}
	}
	if(var_14326bba > 100)
	{
		return "exfil_rbz_round_100";
	}
	return undefined;
}

/*
	Name: function_9ab33c13
	Namespace: namespace_d4ecbbf0
	Checksum: 0x12F2DEEA
	Offset: 0xE78
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function function_9ab33c13(var_b48509f9)
{
	if(!isdefined(var_b48509f9))
	{
		var_b48509f9 = 1;
	}
	switch(var_b48509f9)
	{
		case 1:
		case 2:
		case 3:
		{
			return 1;
			break;
		}
		case 4:
		case 5:
		case 6:
		case 7:
		case 8:
		{
			return 2;
			break;
		}
		case 9:
		case 10:
		default:
		{
			return 3;
			break;
		}
	}
	return 0;
}

/*
	Name: function_1cda88b8
	Namespace: namespace_d4ecbbf0
	Checksum: 0x5DE4BE72
	Offset: 0xF80
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_1cda88b8(var_b48509f9)
{
	if(!isdefined(var_b48509f9))
	{
		var_b48509f9 = 1;
	}
	switch(var_b48509f9)
	{
		case 1:
		{
			return 0;
			break;
		}
		case 2:
		case 3:
		case 4:
		{
			return 1;
			break;
		}
		case 5:
		case 6:
		case 7:
		case 8:
		case 9:
		{
			return 2;
			break;
		}
		case 10:
		default:
		{
			return 3;
			break;
		}
	}
	return 0;
}

/*
	Name: function_b299bcd5
	Namespace: namespace_d4ecbbf0
	Checksum: 0x948E315C
	Offset: 0x1090
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function function_b299bcd5(round)
{
	if(!isdefined(round))
	{
		round = 10;
	}
	switch(round)
	{
		case 10:
		{
			return 0;
			break;
		}
		case 15:
		case 20:
		case 25:
		{
			return 1;
			break;
		}
		case 30:
		case 35:
		case 40:
		case 45:
		case 50:
		{
			return 2;
			break;
		}
		case 55:
		case 60:
		case 65:
		case 70:
		case 75:
		case 100:
		default:
		{
			return 3;
			break;
		}
	}
	return 0;
}

/*
	Name: function_15c36044
	Namespace: namespace_d4ecbbf0
	Checksum: 0xC25036F1
	Offset: 0x11F0
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_15c36044(var_b48509f9)
{
	if(!isdefined(var_b48509f9))
	{
		var_b48509f9 = 1;
	}
	switch(var_b48509f9)
	{
		case 1:
		case 2:
		{
			return false;
			break;
		}
		default:
		{
			return true;
			break;
		}
	}
	return false;
}

/*
	Name: function_3a2e46e0
	Namespace: namespace_d4ecbbf0
	Checksum: 0xAB03B41A
	Offset: 0x1270
	Size: 0x57C
	Parameters: 1
	Flags: Linked
*/
function function_3a2e46e0(var_8e592166)
{
	if(!isdefined(var_8e592166))
	{
		var_8e592166 = 1;
	}
	if(!is_true(level.onlinegame))
	{
		var_8e592166 = 0;
	}
	self thread function_7b6ac8d5(1);
	if(zm_utility::is_survival())
	{
		var_b48509f9 = zm_utility::function_e3025ca5();
		var_5937b8ee = function_3e6a3070(var_b48509f9);
		self thread function_e439076f(var_5937b8ee);
		var_3bf72bdb = function_9ab33c13(var_b48509f9);
		function_d59d7b74(var_3bf72bdb, var_8e592166);
		if(is_true(getgametypesetting(#"hash_534a70940dadf3e7")))
		{
			var_8f88887b = function_1cda88b8(var_b48509f9);
			var_a1b51775 = function_15c36044(var_b48509f9);
			if(var_8f88887b > 0)
			{
				function_89a45cd4(var_8f88887b, var_8e592166);
			}
			if(var_a1b51775 > 0)
			{
				function_74f5b460(var_a1b51775, var_8e592166);
			}
		}
	}
	else
	{
		round = level.round_number;
		var_1fb4cd01 = round - 1;
		var_eeeff6bf = 100;
		var_32ea0039 = 1;
		switch(var_1fb4cd01)
		{
			case 10:
			{
				var_eeeff6bf = 50;
				break;
			}
			case 15:
			{
				var_eeeff6bf = 75;
				break;
			}
			case 20:
			{
				break;
			}
			case 25:
			{
				var_32ea0039 = 2;
				break;
			}
			case 30:
			{
				var_32ea0039 = 2;
				break;
			}
			case 35:
			{
				var_32ea0039 = 2;
				break;
			}
			case 40:
			{
				var_32ea0039 = 2;
				break;
			}
			case 45:
			{
				var_32ea0039 = 2;
				break;
			}
			case 50:
			{
				var_32ea0039 = 3;
				break;
			}
			case 55:
			{
				var_32ea0039 = 3;
				break;
			}
			case 60:
			{
				var_32ea0039 = 3;
				break;
			}
			case 65:
			{
				var_32ea0039 = 3;
				break;
			}
			case 70:
			{
				var_32ea0039 = 4;
				break;
			}
			case 75:
			{
				var_32ea0039 = 4;
				break;
			}
			case 80:
			{
				var_32ea0039 = 4;
				break;
			}
			case 85:
			{
				var_32ea0039 = 4;
				break;
			}
			case 90:
			{
				var_32ea0039 = 5;
				break;
			}
			case 95:
			{
				var_32ea0039 = 5;
				break;
			}
			case 100:
			{
				var_32ea0039 = 5;
				break;
			}
		}
		if(var_1fb4cd01 > 100)
		{
			var_32ea0039 = 5;
		}
		var_5937b8ee = function_75ecd524(var_1fb4cd01);
		if(isdefined(var_5937b8ee))
		{
			self thread function_e439076f(var_5937b8ee);
		}
		if(!is_true(level.var_da7a41e7))
		{
			level.var_da7a41e7 = 1;
			if(math::cointoss(var_eeeff6bf))
			{
				level.var_e5e795ee = 1;
			}
		}
		if(is_true(level.var_e5e795ee))
		{
			function_d59d7b74(var_32ea0039, var_8e592166);
		}
		if(is_true(getgametypesetting(#"hash_534a70940dadf3e7")))
		{
			var_8f88887b = function_b299bcd5(var_1fb4cd01);
			if(var_8f88887b > 0)
			{
				function_89a45cd4(var_8f88887b, var_8e592166);
			}
			if(var_1fb4cd01 >= 20)
			{
				function_74f5b460(1, var_8e592166);
			}
		}
	}
}

/*
	Name: function_ef580a0c
	Namespace: namespace_d4ecbbf0
	Checksum: 0xD6F8CD99
	Offset: 0x17F8
	Size: 0x14E
	Parameters: 1
	Flags: Linked
*/
function function_ef580a0c(var_8f426cc8)
{
	if(zm_utility::is_survival())
	{
		switch(var_8f426cc8)
		{
			case 1:
			{
				return 1;
				break;
			}
			case 2:
			{
				return 2;
				break;
			}
			case 3:
			{
				return 3;
				break;
			}
			case 4:
			{
				return 4;
				break;
			}
			default:
			{
				return 5;
				break;
			}
		}
	}
	else
	{
		switch(var_8f426cc8)
		{
			case 10:
			{
				return 1;
				break;
			}
			case 15:
			{
				return 2;
				break;
			}
			case 20:
			{
				return 3;
				break;
			}
			case 25:
			{
				return 4;
				break;
			}
			default:
			{
				return 5;
				break;
			}
		}
	}
	return 1;
}

/*
	Name: function_b03d7dd0
	Namespace: namespace_d4ecbbf0
	Checksum: 0x1C0D9315
	Offset: 0x1950
	Size: 0x11E
	Parameters: 1
	Flags: Linked
*/
function function_b03d7dd0(var_8f426cc8)
{
	if(zm_utility::is_survival())
	{
		switch(var_8f426cc8)
		{
			case 1:
			{
				return 2;
			}
			case 2:
			{
				return 3;
				break;
			}
			case 3:
			{
				return 4;
				break;
			}
			default:
			{
				return 5;
				break;
			}
		}
	}
	else
	{
		switch(var_8f426cc8)
		{
			case 10:
			{
				return 2;
				break;
			}
			case 15:
			{
				return 3;
				break;
			}
			case 20:
			{
				return 4;
				break;
			}
			default:
			{
				return 5;
				break;
			}
		}
	}
	return 1;
}

/*
	Name: function_4f5dff62
	Namespace: namespace_d4ecbbf0
	Checksum: 0x5E48BF2D
	Offset: 0x1A78
	Size: 0x512
	Parameters: 2
	Flags: Linked
*/
function function_4f5dff62(var_23720377, type)
{
	if(!isdefined(var_23720377))
	{
		var_23720377 = 1;
	}
	if(!isdefined(type))
	{
		type = #"rare";
	}
	switch(var_23720377)
	{
		case 1:
		{
			switch(type)
			{
				case "rare":
				{
					return 1;
					break;
				}
				case "epic":
				{
					return 0;
					break;
				}
				case "legendary":
				{
					return 0;
					break;
				}
			}
			break;
		}
		case 2:
		{
			switch(type)
			{
				case "rare":
				{
					return 1;
					break;
				}
				case "epic":
				{
					return 1;
					break;
				}
				case "legendary":
				{
					return 0;
					break;
				}
			}
			break;
		}
		case 3:
		{
			switch(type)
			{
				case "rare":
				{
					return 1;
					break;
				}
				case "epic":
				{
					return 1;
					break;
				}
				case "legendary":
				{
					return 1;
					break;
				}
			}
			break;
		}
		case 4:
		{
			switch(type)
			{
				case "rare":
				{
					return 1;
					break;
				}
				case "epic":
				{
					return 1;
					break;
				}
				case "legendary":
				{
					return 1;
					break;
				}
			}
			break;
		}
		case 5:
		{
			switch(type)
			{
				case "rare":
				{
					return 2;
					break;
				}
				case "epic":
				{
					return 1;
					break;
				}
				case "legendary":
				{
					return 1;
					break;
				}
			}
			break;
		}
		case 6:
		{
			switch(type)
			{
				case "rare":
				{
					return 2;
					break;
				}
				case "epic":
				{
					return 2;
					break;
				}
				case "legendary":
				{
					return 1;
					break;
				}
			}
			break;
		}
		case 7:
		{
			switch(type)
			{
				case "rare":
				{
					return 3;
					break;
				}
				case "epic":
				{
					return 2;
					break;
				}
				case "legendary":
				{
					return 2;
					break;
				}
			}
			break;
		}
		case 8:
		{
			switch(type)
			{
				case "rare":
				{
					return 3;
					break;
				}
				case "epic":
				{
					return 2;
					break;
				}
				case "legendary":
				{
					return 2;
					break;
				}
			}
			break;
		}
		case 9:
		{
			switch(type)
			{
				case "rare":
				{
					return 4;
					break;
				}
				case "epic":
				{
					return 3;
					break;
				}
				case "legendary":
				{
					return 2;
					break;
				}
			}
			break;
		}
		case 10:
		default:
		{
			switch(type)
			{
				case "rare":
				{
					return 4;
					break;
				}
				case "epic":
				{
					return 3;
					break;
				}
				case "legendary":
				{
					return 2;
					break;
				}
			}
			break;
		}
	}
}

/*
	Name: function_1c7ac571
	Namespace: namespace_d4ecbbf0
	Checksum: 0xA04BD3C3
	Offset: 0x1F98
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_1c7ac571(round)
{
	if(!isdefined(round))
	{
		round = 20;
	}
	switch(round)
	{
		case 20:
		case 25:
		case 30:
		{
			return 1;
			break;
		}
		default:
		{
			return 2;
			break;
		}
	}
	return 0;
}

/*
	Name: function_70067981
	Namespace: namespace_d4ecbbf0
	Checksum: 0x7CF4B1D5
	Offset: 0x2028
	Size: 0x10
	Parameters: 1
	Flags: Linked
*/
function function_70067981(round)
{
	return true;
}

/*
	Name: function_73cddc69
	Namespace: namespace_d4ecbbf0
	Checksum: 0x7B66DBA6
	Offset: 0x2040
	Size: 0x92C
	Parameters: 1
	Flags: Linked
*/
function function_73cddc69(var_8e592166)
{
	if(!isdefined(var_8e592166))
	{
		var_8e592166 = 1;
	}
	if(isdefined(level.var_24a62388))
	{
		self [[level.var_24a62388]]();
	}
	if(!is_true(level.onlinegame))
	{
		var_8e592166 = 0;
	}
	self zm_stats::increment_challenge_stat(#"hash_775bd6b063e325ff");
	self contracts::increment_zm_contract(#"hash_ddd05a3c6891d38");
	if(is_true(level.var_92c52eed))
	{
		self contracts::increment_zm_contract(#"hash_52d7aad059ba306a");
	}
	else if(is_true(level.var_ce7af4fa))
	{
		self contracts::increment_zm_contract(#"hash_5962be83752b7345");
	}
	if(zm_utility::is_survival())
	{
		self thread function_7b6ac8d5(3);
		var_b48509f9 = zm_utility::function_e3025ca5();
		if(var_b48509f9 <= 1)
		{
			self thread zm_score::add_to_player_score(1000);
		}
		else
		{
			score = 2500 * (var_b48509f9 - 1);
			score = math::clamp(score, 0, 15000);
			self thread zm_score::add_to_player_score(score);
		}
		var_36bda4b = function_ef580a0c(var_b48509f9);
		var_ef5aac55 = var_36bda4b * 100;
		var_ef5aac55 = math::clamp(var_ef5aac55, 0, 500);
		var_1ac981fc = function_b03d7dd0(var_b48509f9);
		var_a9b93bb4 = var_1ac981fc * 50;
		var_a9b93bb4 = math::clamp(var_a9b93bb4, 0, 250);
		self thread sr_scrap::function_afab250a(var_ef5aac55);
		self thread sr_scrap::function_a6d4221f(var_a9b93bb4);
		var_64bd84cc = function_4f5dff62(var_b48509f9, #"rare");
		self function_d59d7b74(var_64bd84cc, var_8e592166);
		if(is_true(getgametypesetting(#"hash_534a70940dadf3e7")))
		{
			var_bc3885e0 = function_4f5dff62(var_b48509f9, #"epic");
			var_629196dd = function_4f5dff62(var_b48509f9, #"legendary");
			if(var_b48509f9 <= 2 && var_bc3885e0 > 0)
			{
				if(!is_true(level.var_7d3f22bd))
				{
					level.var_7d3f22bd = 1;
					if(math::cointoss())
					{
						level.var_e578d0db = 1;
					}
				}
				if(is_true(level.var_e578d0db))
				{
					self function_89a45cd4(var_bc3885e0, var_8e592166);
				}
			}
			else
			{
				self function_89a45cd4(var_bc3885e0, var_8e592166);
			}
			if(var_b48509f9 <= 3 && var_629196dd > 0)
			{
				if(!is_true(level.var_5ed8f6ba))
				{
					level.var_5ed8f6ba = 1;
					if(math::cointoss())
					{
						level.var_8a84008 = 1;
					}
				}
				if(is_true(level.var_8a84008))
				{
					self function_74f5b460(var_629196dd, var_8e592166);
				}
			}
			else
			{
				self function_74f5b460(var_629196dd, var_8e592166);
			}
		}
	}
	else
	{
		round = level.round_number;
		if(round <= 5)
		{
			return;
		}
		self thread function_7b6ac8d5(2, round);
		milestones = level.round_number / 5;
		var_36bda4b = function_ef580a0c(round);
		var_ef5aac55 = var_36bda4b * 100;
		var_ef5aac55 = math::clamp(var_ef5aac55, 0, 500);
		var_1ac981fc = function_b03d7dd0(round);
		var_a9b93bb4 = var_1ac981fc * 50;
		var_a9b93bb4 = math::clamp(var_a9b93bb4, 0, 250);
		self thread sr_scrap::function_afab250a(var_ef5aac55);
		self thread sr_scrap::function_a6d4221f(var_a9b93bb4);
		if(round >= 10)
		{
			amount = (int(round / 10)) - 1;
			amount = math::clamp(amount, 1, 9);
			self function_d59d7b74(amount, var_8e592166);
		}
		else
		{
			self function_d59d7b74(1, var_8e592166);
		}
		if(is_true(getgametypesetting(#"hash_534a70940dadf3e7")))
		{
			if(round == 15)
			{
				if(!is_true(level.var_7d3f22bd))
				{
					level.var_7d3f22bd = 1;
					if(math::cointoss())
					{
						level.var_e578d0db = 1;
					}
				}
				if(is_true(level.var_e578d0db))
				{
					function_89a45cd4(1, var_8e592166);
				}
			}
			else if(round > 15)
			{
				var_8f88887b = function_1c7ac571(round);
				function_89a45cd4(var_8f88887b, var_8e592166);
			}
			if(round == 20)
			{
				if(!is_true(level.var_5ed8f6ba))
				{
					level.var_5ed8f6ba = 1;
					if(math::cointoss())
					{
						level.var_8a84008 = 1;
					}
				}
				if(is_true(level.var_8a84008))
				{
					function_74f5b460(1, var_8e592166);
				}
			}
			else
			{
				if(round == 25)
				{
					if(!is_true(level.var_97f56902))
					{
						level.var_97f56902 = 1;
						if(math::cointoss())
						{
							level.var_fb82a5bd = 1;
						}
					}
					if(is_true(level.var_fb82a5bd))
					{
						function_74f5b460(1, var_8e592166);
					}
				}
				else if(round > 25)
				{
					var_a1b51775 = function_70067981(round);
					function_74f5b460(var_a1b51775, var_8e592166);
				}
			}
		}
	}
}

/*
	Name: on_item_pickup
	Namespace: namespace_d4ecbbf0
	Checksum: 0x42E06CAA
	Offset: 0x2978
	Size: 0x11A
	Parameters: 1
	Flags: Linked
*/
function on_item_pickup(params)
{
	item = params.item;
	if(isplayer(self))
	{
		if(isdefined(item.var_a6762160))
		{
			if(item.var_a6762160.itemtype === #"hash_6a8c9b279aa1c2c5")
			{
				if(isdefined(item.var_a6762160.rarity))
				{
					switch(item.var_a6762160.rarity)
					{
						case "rare":
						{
							self function_d59d7b74();
							break;
						}
						case "epic":
						{
							self function_89a45cd4();
							break;
						}
						case "legendary":
						{
							self function_74f5b460();
							break;
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_14defa19
	Namespace: namespace_d4ecbbf0
	Checksum: 0x9A1A7F70
	Offset: 0x2AA0
	Size: 0x224
	Parameters: 0
	Flags: None
*/
function function_14defa19()
{
	/#
		setdvar(#"hash_45e7c4e448c5fdd3", "");
		var_5084d761 = [2:"", 1:"", 0:""];
		var_d2d49534 = [6:100, 5:50, 4:20, 3:10, 2:5, 1:2, 0:1];
		for(var_19c3d01e = 0; var_19c3d01e < var_5084d761.size; var_19c3d01e++)
		{
			rarity = var_5084d761[var_19c3d01e];
			for(var_6665791e = 0; var_6665791e < var_d2d49534.size; var_6665791e++)
			{
				amount = var_d2d49534[var_6665791e];
				loc_00002C04:
				loc_00002C2C:
				loc_00002C54:
				var_8220ca34 = ((((((("" + rarity) + "") + (isdefined(var_19c3d01e) ? "" + var_19c3d01e : "") + "") + (isdefined(amount) ? "" + amount : "") + "") + (isdefined(var_6665791e) ? "" + var_6665791e : "") + "") + rarity) + "") + (isdefined(amount) ? "" + amount : "") + "";
				adddebugcommand(var_8220ca34);
			}
		}
	#/
}

/*
	Name: function_868c9a6e
	Namespace: namespace_d4ecbbf0
	Checksum: 0xCC7E018
	Offset: 0x2CD0
	Size: 0x22E
	Parameters: 0
	Flags: None
*/
function function_868c9a6e()
{
	/#
		while(true)
		{
			str_command = getdvarstring(#"hash_45e7c4e448c5fdd3", "");
			if(str_command != "")
			{
				if(strstartswith(str_command, ""))
				{
					str = strreplace(str_command, "", "");
					arr = strtok(str, "");
					var_a4a3ca3a = arr[0];
					amount = arr[1];
					var_e1f0e492 = [1:hash(var_a4a3ca3a), 0:#"hash_65febbdf3f1ab4d7"];
					players = getplayers();
					foreach(player in players)
					{
						player function_2ea9419c(hash(var_a4a3ca3a), int(amount));
					}
				}
				setdvar(#"hash_45e7c4e448c5fdd3", "");
			}
			waitframe(1);
		}
	#/
}

