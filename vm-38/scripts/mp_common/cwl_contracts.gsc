#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace cwl_contracts;

/*
	Name: function_d9a4ed51
	Namespace: cwl_contracts
	Checksum: 0xB5B17DF0
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d9a4ed51()
{
	level notify(-1363322108);
}

#namespace contracts;

/*
	Name: __init__system__
	Namespace: contracts
	Checksum: 0xA80B36D6
	Offset: 0xD8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"cwl_contracts", &function_70a657d8, undefined, &finalize_init, undefined);
}

/*
	Name: function_70a657d8
	Namespace: contracts
	Checksum: 0x5843D42D
	Offset: 0x128
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.challengescallbacks))
	{
		level.challengescallbacks = [];
	}
	init_player_contract_events();
}

/*
	Name: finalize_init
	Namespace: contracts
	Checksum: 0x90F653AB
	Offset: 0x168
	Size: 0x1A4
	Parameters: 0
	Flags: Linked, Private
*/
function private finalize_init()
{
	callback::on_connect(&on_player_connect);
	if(can_process_contracts())
	{
		challenges::registerchallengescallback("gameEnd", &function_a4c8ce2a);
		globallogic_score::registercontractwinevent(&contract_win);
		register_player_contract_event(#"score", &on_player_score, 2);
		register_player_contract_event(#"ekia", &on_ekia, 2);
		register_player_contract_event(#"objective_ekia", &on_objective_ekia);
		register_player_contract_event(#"damagedone", &on_damagedone, 1);
		level.var_79a93566 = &function_902ef0de;
		level.var_c3e2bb05 = 2;
		function_7364a587();
		/#
			thread devgui_setup();
		#/
	}
}

/*
	Name: function_7364a587
	Namespace: contracts
	Checksum: 0x2A2A6CBC
	Offset: 0x318
	Size: 0x356
	Parameters: 0
	Flags: Linked
*/
function function_7364a587()
{
	level.var_9d6b3096 = [];
	level.var_9d6b3096[#"hash_35a6541d081acef5"] = spawnstruct();
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"] = spawnstruct();
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"] = spawnstruct();
	level.var_9d6b3096[#"hash_35a6541d081acef5"].var_9dd75c18 = 3000;
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"].var_9dd75c18 = 2500;
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"].var_9dd75c18 = 500;
	level.var_9d6b3096[#"hash_35a6541d081acef5"].var_9a5a8dcf = 4000;
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"].var_9a5a8dcf = 3000;
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"].var_9a5a8dcf = 1000;
	level.var_9d6b3096[#"hash_35a6541d081acef5"].var_f703cb6c = 20;
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"].var_f703cb6c = 15;
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"].var_f703cb6c = 4;
	level.var_9d6b3096[#"hash_35a6541d081acef5"].var_39027dc7 = 30;
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"].var_39027dc7 = 25;
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"].var_39027dc7 = 7;
	level.var_9d6b3096[#"hash_35a6541d081acef5"].var_81bbb381 = 3500;
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"].var_81bbb381 = 3000;
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"].var_81bbb381 = 750;
	level.var_9d6b3096[#"hash_35a6541d081acef5"].var_9037b57b = 15;
	level.var_9d6b3096[#"hash_594c4ab1d31aa150"].var_9037b57b = 10;
	level.var_9d6b3096[#"hash_5fd7317230bb0fac"].var_9037b57b = 1;
}

/*
	Name: on_player_connect
	Namespace: contracts
	Checksum: 0x373D9229
	Offset: 0x678
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(can_process_contracts())
	{
		self setup_player_contracts(3, &function_1fd13839);
	}
}

/*
	Name: can_process_contracts
	Namespace: contracts
	Checksum: 0x2120E2E8
	Offset: 0x6C0
	Size: 0xBA
	Parameters: 0
	Flags: Linked
*/
function can_process_contracts()
{
	if(getdvarint(#"contracts_enabled", 0) == 0)
	{
		return 0;
	}
	if(getdvarint(#"hash_332424e6c4a080d8", 1) == 0)
	{
		return 0;
	}
	if(!sessionmodeismultiplayergame())
	{
		return 0;
	}
	if(level.var_73e51905 !== 1)
	{
		return 0;
	}
	if(level.arenamatch !== 1)
	{
		return 0;
	}
	return challenges::canprocesschallenges();
}

/*
	Name: on_player_score
	Namespace: contracts
	Checksum: 0xB90ED341
	Offset: 0x788
	Size: 0x1C4
	Parameters: 2
	Flags: Linked
*/
function on_player_score(new_score, delta_score)
{
	gametype = level.gametype;
	if(!isdefined(level.var_9d6b3096[gametype]))
	{
		return;
	}
	player = self;
	old_score = new_score - delta_score;
	target_value = level.var_9d6b3096[gametype].var_9dd75c18;
	if(old_score < target_value)
	{
		if(new_score >= target_value)
		{
			player function_ccf82192(#"hash_78214e78d4159f84");
			switch(gametype)
			{
				case "hash_35a6541d081acef5":
				{
					player function_ccf82192(#"hash_ae762b8f099ea78");
					break;
				}
				case "hash_594c4ab1d31aa150":
				{
					player function_ccf82192(#"hash_7f6444fe885ce68c");
					break;
				}
				case "hash_5fd7317230bb0fac":
				{
					player function_ccf82192(#"hash_6eae617e00faf9d1");
					break;
				}
			}
		}
	}
	else
	{
		var_2c74fba6 = level.var_9d6b3096[gametype].var_9a5a8dcf;
		if(old_score < var_2c74fba6 && new_score >= var_2c74fba6)
		{
			player function_ccf82192(#"hash_1075c38287814aa0");
		}
	}
}

/*
	Name: on_ekia
	Namespace: contracts
	Checksum: 0x7822795D
	Offset: 0x958
	Size: 0x1AC
	Parameters: 2
	Flags: Linked
*/
function on_ekia(weapon, victim)
{
	gametype = level.gametype;
	if(!isdefined(level.var_9d6b3096[gametype]))
	{
		return;
	}
	player = self;
	var_350027d1 = player.pers[#"ekia"];
	if(var_350027d1 == level.var_9d6b3096[gametype].var_f703cb6c)
	{
		player function_ccf82192(#"hash_1d1b3fe36f24b6ac");
		switch(level.gametype)
		{
			case "hash_35a6541d081acef5":
			{
				player function_ccf82192(#"hash_5094a25541df9380");
				break;
			}
			case "hash_594c4ab1d31aa150":
			{
				player function_ccf82192(#"hash_4a7745c3b4819d04");
				break;
			}
			case "hash_5fd7317230bb0fac":
			{
				player function_ccf82192(#"hash_2783d4c96f09717");
				break;
			}
		}
	}
	else if(var_350027d1 == level.var_9d6b3096[gametype].var_39027dc7)
	{
		player function_ccf82192(#"hash_63e1c91ddca36b58");
	}
}

/*
	Name: on_objective_ekia
	Namespace: contracts
	Checksum: 0xC931B662
	Offset: 0xB10
	Size: 0x162
	Parameters: 0
	Flags: Linked
*/
function on_objective_ekia()
{
	gametype = level.gametype;
	if(!isdefined(level.var_9d6b3096[gametype]))
	{
		return;
	}
	player = self;
	objective_ekia = player.pers[#"objectiveekia"] + 1;
	if(objective_ekia == level.var_9d6b3096[gametype].var_9037b57b)
	{
		player function_ccf82192(#"hash_518ce6f8a5567a08");
		switch(level.gametype)
		{
			case "hash_35a6541d081acef5":
			{
				player function_ccf82192(#"hash_2b23579cbf8999f4");
				break;
			}
			case "hash_594c4ab1d31aa150":
			{
				player function_ccf82192(#"hash_7182bb77d8974488");
				break;
			}
			case "hash_5fd7317230bb0fac":
			{
				player function_ccf82192(#"hash_501faf9b8da2fcc7");
				break;
			}
		}
	}
}

/*
	Name: on_damagedone
	Namespace: contracts
	Checksum: 0x81EE2624
	Offset: 0xC80
	Size: 0x1B2
	Parameters: 1
	Flags: Linked
*/
function on_damagedone(damagedone)
{
	player = self;
	if(player is_contract_active(#"hash_783240d7e11018c9"))
	{
		gametype = level.gametype;
		if(!isdefined(level.var_9d6b3096[gametype]))
		{
			return;
		}
		var_2e0944a3 = self.pers[#"damagedone"];
		var_5f607191 = var_2e0944a3 - damagedone;
		target_value = level.var_9d6b3096[gametype].var_81bbb381;
		if(var_5f607191 < target_value && var_2e0944a3 >= target_value)
		{
			player function_ccf82192(#"hash_783240d7e11018c9");
			switch(level.gametype)
			{
				case "hash_35a6541d081acef5":
				{
					player function_ccf82192(#"hash_41263195cd7fa7f");
					break;
				}
				case "hash_594c4ab1d31aa150":
				{
					player function_ccf82192(#"hash_5579ada75c110186");
					break;
				}
				case "hash_5fd7317230bb0fac":
				{
					player function_ccf82192(#"hash_693d0b4e9c956a4");
					break;
				}
			}
		}
	}
}

/*
	Name: function_ccf82192
	Namespace: contracts
	Checksum: 0xBC8CCFE7
	Offset: 0xE40
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_ccf82192(var_38280f2f, delta)
{
	if(!isdefined(delta))
	{
		delta = 1;
	}
	if(self is_contract_active(var_38280f2f))
	{
		self function_902ef0de(var_38280f2f, delta);
	}
}

/*
	Name: function_902ef0de
	Namespace: contracts
	Checksum: 0xE4067463
	Offset: 0xEA8
	Size: 0x3AC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_902ef0de(var_38280f2f, delta)
{
	/#
		if(getdvarint(#"scr_contract_debug_multiplier", 0) > 0)
		{
			delta = delta * getdvarint(#"scr_contract_debug_multiplier", 1);
		}
	#/
	if(delta <= 0)
	{
		return;
	}
	target_value = self.pers[#"contracts"][var_38280f2f].target_value;
	old_progress = (isdefined(self.pers[#"contracts"][var_38280f2f].current_value) ? self.pers[#"contracts"][var_38280f2f].current_value : self.pers[#"contracts"][var_38280f2f].var_59cb904f);
	if(old_progress == target_value)
	{
		return;
	}
	new_progress = int(old_progress + delta);
	if(new_progress > target_value)
	{
		new_progress = target_value;
	}
	if(new_progress != old_progress)
	{
		self.pers[#"contracts"][var_38280f2f].current_value = new_progress;
		if(isdefined(level.contract_ids[var_38280f2f]))
		{
			self luinotifyevent(#"hash_4b04b1cb4b3498d0", 2, level.contract_ids[var_38280f2f], new_progress);
		}
	}
	if(old_progress < target_value && target_value <= new_progress)
	{
		var_9d12108c = (isdefined(self.timeplayed[self.team]) ? self.timeplayed[self.team] : 0);
		self.pers[#"contracts"][var_38280f2f].var_be5bf249 = (self stats::get_stat_global(#"time_played_total") - self.pers[#"hash_5651f00c6c1790a4"]) + var_9d12108c;
		if(isdefined(level.contract_ids[var_38280f2f]))
		{
			self luinotifyevent(#"hash_1739c4bd5baf83bc", 1, level.contract_ids[var_38280f2f]);
		}
	}
	/#
		if(getdvarint(#"scr_contract_debug", 0) > 0)
		{
			iprintln((((function_9e72a96(var_38280f2f) + "") + new_progress) + "") + target_value);
			if(old_progress < target_value && target_value <= new_progress)
			{
				iprintln(function_9e72a96(var_38280f2f) + "");
			}
		}
	#/
}

/*
	Name: function_1fd13839
	Namespace: contracts
	Checksum: 0x49BA0A8F
	Offset: 0x1260
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_1fd13839(slot)
{
	return function_d17bcd3c(slot);
}

/*
	Name: function_a4c8ce2a
	Namespace: contracts
	Checksum: 0x353EB80F
	Offset: 0x1290
	Size: 0x2B4
	Parameters: 1
	Flags: Linked
*/
function function_a4c8ce2a(data)
{
	if(!isdefined(data))
	{
		return;
	}
	player = data.player;
	if(!isplayer(player))
	{
		return;
	}
	player function_ccf82192(#"hash_5f67f3e8adbeb98a");
	switch(level.gametype)
	{
		case "hash_35a6541d081acef5":
		{
			player function_ccf82192(#"hash_c3dd6c976fd6da0");
			break;
		}
		case "hash_594c4ab1d31aa150":
		{
			player function_ccf82192(#"hash_59ddf56a06fffa34");
			break;
		}
		case "hash_5fd7317230bb0fac":
		{
			player function_ccf82192(#"hash_41aad2f69ccae443");
			break;
		}
	}
	team = player.team;
	if(isdefined(level.placement[team]) && player.score > 0)
	{
		var_414a209b = min(level.placement.size, 3);
		for(i = 0; i < var_414a209b; i++)
		{
			if(level.placement[team][i] == player)
			{
				player increment_contract(#"hash_355152b5a8de61ef");
				break;
			}
		}
	}
	arenaslot = arenagetslot();
	var_67d27328 = player stats::get_stat(#"arenastats", arenaslot, #"leagueplaystats", #"hash_36cd820c1ff6c16b");
	if(var_67d27328 > 0)
	{
		player increment_contract(#"hash_35e52e40ab6d1223", var_67d27328);
		player increment_contract(#"hash_421c3b5196a40f99", var_67d27328);
	}
	player function_78083139();
}

/*
	Name: contract_win
	Namespace: contracts
	Checksum: 0xBA289720
	Offset: 0x1550
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function contract_win(winner)
{
	winner function_ccf82192(#"hash_4e903e32da421b17");
	winner function_ccf82192(#"hash_2809e14b0f3b4c5e");
	switch(level.gametype)
	{
		case "hash_35a6541d081acef5":
		{
			winner function_ccf82192(#"hash_7ad97dfb4e13dcf5");
			break;
		}
		case "hash_594c4ab1d31aa150":
		{
			winner function_ccf82192(#"hash_1d7c20fdd4a3cef1");
			break;
		}
		case "hash_5fd7317230bb0fac":
		{
			winner function_ccf82192(#"hash_70bec139292fe3e2");
			break;
		}
	}
	var_283195f2 = winner stats::get_stat_global(#"hash_56a0e77eea02664d");
	if(var_283195f2 > 0)
	{
		if((var_283195f2 % 4) == 0)
		{
			winner function_ccf82192(#"hash_40186850547832f7");
		}
		if((var_283195f2 % 2) == 0)
		{
			winner function_ccf82192(#"hash_4a14b348f01ad76d");
		}
	}
}

/*
	Name: devgui_setup
	Namespace: contracts
	Checksum: 0xA56FEDF3
	Offset: 0x1700
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function devgui_setup()
{
	/#
		devgui_base = "";
		wait(3);
		function_e07e542b(devgui_base, undefined);
		function_17a92a99(devgui_base);
		function_7f05e018(devgui_base);
		function_bdc473ef(devgui_base);
		function_936f8390(devgui_base);
		function_2e9917ec(devgui_base);
		function_295a8005(devgui_base);
	#/
}

/*
	Name: function_17a92a99
	Namespace: contracts
	Checksum: 0x4CB2212B
	Offset: 0x17D8
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_17a92a99(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_7f05e018
	Namespace: contracts
	Checksum: 0xC535F75F
	Offset: 0x1910
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_7f05e018(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_bdc473ef
	Namespace: contracts
	Checksum: 0x4FD78D33
	Offset: 0x19D0
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function function_bdc473ef(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_936f8390
	Namespace: contracts
	Checksum: 0xD3619160
	Offset: 0x1B30
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function function_936f8390(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_2e9917ec
	Namespace: contracts
	Checksum: 0x3AFA78EF
	Offset: 0x1C90
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function function_2e9917ec(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_ef925b75
	Namespace: contracts
	Checksum: 0xEBE1E365
	Offset: 0x1DF0
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function function_ef925b75(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
	#/
}

/*
	Name: function_295a8005
	Namespace: contracts
	Checksum: 0xB2882E85
	Offset: 0x1E38
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_295a8005(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

