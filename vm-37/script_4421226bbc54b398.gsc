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
	Name: __init__system__
	Namespace: namespace_d4ecbbf0
	Checksum: 0x9FF549CE
	Offset: 0x330
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
	Checksum: 0x94AE978D
	Offset: 0x378
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_item_pickup(&on_item_pickup);
	callback::add_callback(#"objective_ended", &function_37c1c391);
	/#
		level function_14defa19();
		level thread function_868c9a6e();
	#/
}

/*
	Name: function_6daf57e7
	Namespace: namespace_d4ecbbf0
	Checksum: 0x1BB6AD2B
	Offset: 0x408
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
	Checksum: 0xE703EC69
	Offset: 0x478
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
	Checksum: 0x2677688A
	Offset: 0x538
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
	Checksum: 0x994929E6
	Offset: 0x650
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
	Checksum: 0xCD0B5D62
	Offset: 0x6F8
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
	Checksum: 0x70494E81
	Offset: 0x7A0
	Size: 0xD4
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
	if(!is_true(getgametypesetting(#"hash_534a70940dadf3e7")))
	{
		var_1c26a346 = stats::get_stat(#"hash_65febbdf3f1ab4d7", #"rare");
		if(var_1c26a346 >= 138)
		{
			return;
		}
	}
	function_2ea9419c(#"rare", amount, var_8e592166);
}

/*
	Name: function_89a45cd4
	Namespace: namespace_d4ecbbf0
	Checksum: 0x3E8F8BB9
	Offset: 0x880
	Size: 0x5C
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
	function_2ea9419c(#"epic", amount, var_8e592166);
}

/*
	Name: function_74f5b460
	Namespace: namespace_d4ecbbf0
	Checksum: 0x777603DE
	Offset: 0x8E8
	Size: 0x5C
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
	function_2ea9419c(#"legendary", amount, var_8e592166);
}

/*
	Name: function_37c1c391
	Namespace: namespace_d4ecbbf0
	Checksum: 0x2DB86C5E
	Offset: 0x950
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
	Checksum: 0x7555D764
	Offset: 0xA48
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
	Checksum: 0x41D4E07
	Offset: 0xB80
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
	Name: function_3a2e46e0
	Namespace: namespace_d4ecbbf0
	Checksum: 0xB124C2F
	Offset: 0xD90
	Size: 0x774
	Parameters: 1
	Flags: Linked
*/
function function_3a2e46e0(var_8e592166)
{
	if(!isdefined(var_8e592166))
	{
		var_8e592166 = 1;
	}
	self thread function_7b6ac8d5(1);
	if(zm_utility::is_survival())
	{
		var_b48509f9 = zm_utility::function_e3025ca5();
		var_eeeff6bf = 100;
		var_32ea0039 = 1;
		switch(var_b48509f9)
		{
			case 1:
			{
				var_eeeff6bf = 50;
				break;
			}
			case 2:
			{
				var_eeeff6bf = 75;
				break;
			}
			case 3:
			{
				var_eeeff6bf = 75;
				break;
			}
			case 4:
			{
				var_eeeff6bf = 75;
				break;
			}
			case 5:
			{
				var_eeeff6bf = 75;
				break;
			}
			case 6:
			{
				var_eeeff6bf = 75;
				break;
			}
			case 7:
			{
				var_eeeff6bf = 75;
				break;
			}
			case 8:
			{
				var_32ea0039 = 2;
				break;
			}
			case 9:
			{
				var_32ea0039 = 2;
				break;
			}
			case 10:
			{
				var_32ea0039 = 3;
				break;
			}
			default:
			{
				var_32ea0039 = 3;
				break;
			}
		}
		var_5937b8ee = function_3e6a3070(var_b48509f9);
		self thread function_e439076f(var_5937b8ee);
		if(math::cointoss(var_eeeff6bf))
		{
			function_d59d7b74(var_32ea0039, var_8e592166);
		}
		if(is_true(getgametypesetting(#"hash_534a70940dadf3e7")))
		{
			if(var_b48509f9 >= 3)
			{
				mod = var_b48509f9 - 2;
				chance = 10 * mod;
				chance = math::clamp(chance, 0, 100);
				if(math::cointoss(chance))
				{
					function_89a45cd4(1, var_8e592166);
				}
			}
			if(var_b48509f9 >= 6)
			{
				mod = var_b48509f9 - 5;
				chance = 5 * mod;
				chance = math::clamp(chance, 0, 100);
				if(math::cointoss(chance))
				{
					function_74f5b460(1, var_8e592166);
				}
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
		if(math::cointoss(var_eeeff6bf))
		{
			function_d59d7b74(var_32ea0039, var_8e592166);
		}
		if(is_true(getgametypesetting(#"hash_534a70940dadf3e7")))
		{
			if(round >= 15)
			{
				mod = ((round - 15) / 5) + 1;
				chance = 10 * mod;
				chance = math::clamp(chance, 0, 100);
				if(math::cointoss(chance))
				{
					function_89a45cd4(1, var_8e592166);
				}
			}
			if(round >= 30)
			{
				mod = ((round - 30) / 5) + 1;
				chance = 10 * mod;
				chance = math::clamp(chance, 0, 100);
				if(math::cointoss(chance))
				{
					function_74f5b460(1, var_8e592166);
				}
			}
		}
	}
}

/*
	Name: function_ef580a0c
	Namespace: namespace_d4ecbbf0
	Checksum: 0x651B1B7E
	Offset: 0x1510
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
	Checksum: 0x761F16F7
	Offset: 0x1668
	Size: 0x136
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
				return 1;
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
	Name: function_73cddc69
	Namespace: namespace_d4ecbbf0
	Checksum: 0xD853FA56
	Offset: 0x17A8
	Size: 0x654
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
	self zm_stats::increment_challenge_stat(#"hash_775bd6b063e325ff");
	self contracts::increment_zm_contract(#"hash_ddd05a3c6891d38");
	if(zm_utility::is_survival())
	{
		self thread function_7b6ac8d5(0);
		var_b48509f9 = zm_utility::function_e3025ca5();
		var_36bda4b = function_ef580a0c(var_b48509f9);
		var_ef5aac55 = var_36bda4b * 100;
		var_ef5aac55 = math::clamp(var_ef5aac55, 0, 900);
		var_1ac981fc = function_b03d7dd0(var_b48509f9);
		var_a9b93bb4 = var_1ac981fc * 50;
		var_a9b93bb4 = math::clamp(var_a9b93bb4, 0, 450);
		self thread sr_scrap::function_afab250a(var_ef5aac55);
		self thread sr_scrap::function_a6d4221f(var_a9b93bb4);
		if(var_b48509f9 >= 4)
		{
			amount = (int(var_b48509f9 / 4)) * 2;
			amount = math::clamp(amount, 1, 10);
			self function_d59d7b74(amount, var_8e592166);
		}
		else
		{
			self function_d59d7b74(1, var_8e592166);
		}
		if(is_true(getgametypesetting(#"hash_534a70940dadf3e7")))
		{
			if(var_b48509f9 >= 3)
			{
				mod = var_b48509f9 - 2;
				chance = 10 * mod;
				chance = math::clamp(chance, 0, 100);
				if(math::cointoss(chance))
				{
					function_89a45cd4(1, var_8e592166);
				}
			}
			if(var_b48509f9 >= 6)
			{
				mod = var_b48509f9 - 5;
				chance = 5 * mod;
				chance = math::clamp(chance, 0, 100);
				if(math::cointoss(chance))
				{
					function_74f5b460(1, var_8e592166);
				}
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
		var_ef5aac55 = math::clamp(var_ef5aac55, 0, 900);
		var_1ac981fc = function_b03d7dd0(round);
		var_a9b93bb4 = var_1ac981fc * 50;
		var_a9b93bb4 = math::clamp(var_a9b93bb4, 0, 450);
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
			if(round >= 15)
			{
				mod = ((round - 15) / 5) + 1;
				chance = 10 * mod;
				chance = math::clamp(chance, 0, 100);
				if(math::cointoss(chance))
				{
					function_89a45cd4(1, var_8e592166);
				}
			}
			if(round >= 30)
			{
				mod = ((round - 30) / 5) + 1;
				chance = 10 * mod;
				chance = math::clamp(chance, 0, 100);
				if(math::cointoss(chance))
				{
					function_74f5b460(1, var_8e592166);
				}
			}
		}
	}
}

/*
	Name: on_item_pickup
	Namespace: namespace_d4ecbbf0
	Checksum: 0x64852578
	Offset: 0x1E08
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
	Checksum: 0x535ECB99
	Offset: 0x1F30
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
				loc_00002094:
				loc_000020BC:
				loc_000020E4:
				var_8220ca34 = ((((((("" + rarity) + "") + (isdefined(var_19c3d01e) ? "" + var_19c3d01e : "") + "") + (isdefined(amount) ? "" + amount : "") + "") + (isdefined(var_6665791e) ? "" + var_6665791e : "") + "") + rarity) + "") + (isdefined(amount) ? "" + amount : "") + "";
				adddebugcommand(var_8220ca34);
			}
		}
	#/
}

/*
	Name: function_868c9a6e
	Namespace: namespace_d4ecbbf0
	Checksum: 0x4F0E7B72
	Offset: 0x2160
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

