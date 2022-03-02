#using script_1cc417743d7c262d;
#using script_256b8879317373de;
#using script_2c49ae69cd8ce30c;
#using script_39003d7a41f33078;
#using script_3f27a7b2232674db;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\hud_message.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\outcome.gsc;
#using scripts\mp_common\gametypes\overtime.gsc;

#namespace namespace_81c567a8;

/*
	Name: function_b2a574c8
	Namespace: namespace_81c567a8
	Checksum: 0xAC5B8E62
	Offset: 0x1E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b2a574c8()
{
	level notify(901513110);
}

/*
	Name: init_shared
	Namespace: namespace_81c567a8
	Checksum: 0x40D897DC
	Offset: 0x200
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	registerclientfields();
	function_7e74281();
}

/*
	Name: registerclientfields
	Namespace: namespace_81c567a8
	Checksum: 0xDE9F3E33
	Offset: 0x230
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private registerclientfields()
{
	if(function_f99d2668())
	{
		clientfield::register("toplayer", "eliminated_postfx", 12000, 1, "int");
	}
	if(sessionmodeismultiplayergame())
	{
		clientfield::register("world", "top_squad_begin", 1, 1, "int");
		clientfield::register("world", "hero_pose_begin", 1, 1, "int");
	}
}

/*
	Name: function_a5ce91f1
	Namespace: namespace_81c567a8
	Checksum: 0x116B391D
	Offset: 0x2F0
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a5ce91f1(val)
{
	if(function_f99d2668())
	{
		self clientfield::set_to_player("eliminated_postfx", val);
	}
}

/*
	Name: function_81d670f5
	Namespace: namespace_81c567a8
	Checksum: 0xA0670571
	Offset: 0x338
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function function_81d670f5()
{
	if(isdefined(level.var_d1455682))
	{
		if(!isdefined(level.var_d1455682.var_3e72919) || level.var_d1455682.var_3e72919.size == 0)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_b8e20f5f
	Namespace: namespace_81c567a8
	Checksum: 0xCD09EE5D
	Offset: 0x398
	Size: 0x8C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_b8e20f5f(transition, outcome, var_f6e1baec, var_b6818fc8, func)
{
	if(is_true(var_f6e1baec))
	{
		if((isdefined(var_b6818fc8) ? var_b6818fc8 : 0) != 0)
		{
			wait(float(var_b6818fc8) / 1000);
		}
		[[func]](transition, outcome);
	}
}

/*
	Name: function_e6b4f2f7
	Namespace: namespace_81c567a8
	Checksum: 0xD135FE42
	Offset: 0x430
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_e6b4f2f7(outcome)
{
	function_76f27db3(outcome.var_c1e98979, outcome::function_2e00fa44(outcome), #"none", outcome.team, outcome.players);
}

/*
	Name: function_12d1f62a
	Namespace: namespace_81c567a8
	Checksum: 0x9D36A3FA
	Offset: 0x490
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_12d1f62a(outcome)
{
	function_2fa975e0(util::getroundsplayed(), outcome.var_c1e98979, outcome::function_2e00fa44(outcome), #"none", outcome.team, outcome.players);
}

/*
	Name: function_19adc0b7
	Namespace: namespace_81c567a8
	Checksum: 0x7BB780D7
	Offset: 0x500
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_19adc0b7(outcome)
{
	thread globallogic_audio::function_91d557d3(outcome);
	player::function_2f80d95b(&function_3f65d5d3);
	function_e6b4f2f7(outcome);
	array::run_all(level.players, &hud_message::function_b5b53318, outcome);
	function_15e28b1a(outcome);
	globallogic::function_452e18ad();
	array::run_all(level.players, &hud_message::function_6be746c2);
}

/*
	Name: function_73d36f61
	Namespace: namespace_81c567a8
	Checksum: 0xCD73D572
	Offset: 0x5E0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_73d36f61(outcome)
{
	level thread globallogic_audio::set_music_global("matchend");
}

/*
	Name: function_26654e7e
	Namespace: namespace_81c567a8
	Checksum: 0x1B588D33
	Offset: 0x618
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_26654e7e(outcome)
{
	player::function_2f80d95b(&function_3f65d5d3);
	function_12d1f62a(outcome);
	if(!util::waslastround())
	{
		level thread function_ee8c4421();
	}
	function_cf3d556b(outcome);
	if(!util::waslastround())
	{
		function_f2e3981e();
	}
	globallogic::function_452e18ad();
}

/*
	Name: function_ee8c4421
	Namespace: namespace_81c567a8
	Checksum: 0x92D108A1
	Offset: 0x6E0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_ee8c4421()
{
	if(isdefined(level.var_6561b05c))
	{
		level thread [[level.var_6561b05c]]();
		return;
	}
	level thread globallogic_audio::set_music_global("roundend_start");
}

/*
	Name: function_91b514e8
	Namespace: namespace_81c567a8
	Checksum: 0xE2D0D4C6
	Offset: 0x730
	Size: 0xB6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_91b514e8(menuname)
{
	player = self;
	player endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = player waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		if(isdefined(menuname))
		{
			if(menu == menuname)
			{
				return;
			}
		}
		else if(menu == "GameEndScore")
		{
			return;
		}
	}
}

/*
	Name: function_61d01718
	Namespace: namespace_81c567a8
	Checksum: 0x2AD5F4B5
	Offset: 0x7F0
	Size: 0x208
	Parameters: 2
	Flags: Linked
*/
function function_61d01718(transitions, var_276aad88)
{
	if(!isdefined(transitions))
	{
		return;
	}
	player = self;
	player endon(#"disconnect");
	foreach(transition in transitions)
	{
		player function_b797319e(var_276aad88, index + 1);
		if((isdefined(transition.time) ? transition.time : 0) != 0)
		{
			function_3dc5df3b(float(transition.time) / 1000);
			continue;
		}
		if((isdefined(transition.var_bda115b5) ? transition.var_bda115b5 : 0) != 0)
		{
			self function_a5ce91f1(1);
			self thread function_c6f81aa1(float(transition.var_f4df0630) / 1000);
			player function_91b514e8(transition.menuresponse);
			self function_a5ce91f1(0);
			continue;
		}
		player function_91b514e8(transition.menuresponse);
	}
}

/*
	Name: function_c6f81aa1
	Namespace: namespace_81c567a8
	Checksum: 0x93163A1D
	Offset: 0xA00
	Size: 0xD6
	Parameters: 1
	Flags: Linked
*/
function function_c6f81aa1(time)
{
	if(!isdefined(time))
	{
		return;
	}
	player = self;
	player endon(#"disconnect", #"spawned");
	player.var_686890d5 = 1;
	if(time <= 0)
	{
		time = 0.1;
	}
	wait(time);
	if(!isdefined(player))
	{
		return;
	}
	player.var_686890d5 = undefined;
	player.sessionstate = "spectator";
	player.spectatorclient = -1;
	player.killcamentity = -1;
	player.archivetime = 0;
	player.psoffsettime = 0;
	player.spectatekillcam = 0;
}

/*
	Name: function_9b2bd02c
	Namespace: namespace_81c567a8
	Checksum: 0x8A35ABC0
	Offset: 0xAE0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_9b2bd02c()
{
	player = self;
	player function_3f65d5d3();
	player function_61d01718(level.var_d1455682.var_87a42f09, #"hash_17eef30b79fd25f0");
}

/*
	Name: function_b3964dc9
	Namespace: namespace_81c567a8
	Checksum: 0xC001AD59
	Offset: 0xB40
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_b3964dc9()
{
	display = is_true(level.var_3e5fe4d1);
	if(!is_true(level.var_3e5fe4d1))
	{
		return;
	}
	player = self;
	player function_3f65d5d3();
	player function_61d01718(level.var_d1455682.var_87a42f09, #"hash_ee32e40c182320b");
}

/*
	Name: function_f4c03c3b
	Namespace: namespace_81c567a8
	Checksum: 0x68AC20AC
	Offset: 0xBE8
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_f4c03c3b()
{
	if(is_true(self.var_58f00ca2))
	{
		return;
	}
	self.var_58f00ca2 = 1;
	self thread function_61d01718(level.var_d1455682.var_87a42f09, #"hash_4a3306cfce6719bc");
}

/*
	Name: function_1caf5c87
	Namespace: namespace_81c567a8
	Checksum: 0x20B0E87
	Offset: 0xC50
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_1caf5c87(team)
{
	players = getplayers(team);
	player::function_4dcd9a89(players, &function_3f65d5d3);
	foreach(player in players)
	{
		if(player != self)
		{
			player.var_58f00ca2 = 1;
			player thread function_61d01718(level.var_d1455682.var_87a42f09, #"hash_4a3306cfce6719bc");
		}
	}
	if(self.team == team)
	{
		self.var_58f00ca2 = 1;
		self function_61d01718(level.var_d1455682.var_87a42f09, #"hash_4a3306cfce6719bc");
	}
}

/*
	Name: function_3f65d5d3
	Namespace: namespace_81c567a8
	Checksum: 0x6FD52E7F
	Offset: 0xDA8
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function function_3f65d5d3()
{
	if(!isdefined(self.pers[#"team"]))
	{
		self [[level.spawnintermission]](1);
		return true;
	}
	return false;
}

/*
	Name: freeze_player_for_round_end
	Namespace: namespace_81c567a8
	Checksum: 0x482F50F3
	Offset: 0xDF0
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private freeze_player_for_round_end()
{
	self player::freeze_player_for_round_end();
	self thread globallogic::roundenddof();
}

/*
	Name: function_ba94df6c
	Namespace: namespace_81c567a8
	Checksum: 0xA9683EE6
	Offset: 0xE30
	Size: 0x38
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ba94df6c()
{
	self setclientuivisibilityflag("hud_visible", 0);
	self thread [[level.spawnintermission]](0);
}

/*
	Name: function_9185f489
	Namespace: namespace_81c567a8
	Checksum: 0x7FF215E2
	Offset: 0xE70
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_9185f489(transition, outcome)
{
	globallogic::function_2556afb5(outcome.var_20c0730c, outcome.var_18d4b2ad, float(outcome.var_3efb751d) / 1000);
}

/*
	Name: function_e22f5208
	Namespace: namespace_81c567a8
	Checksum: 0xF190CE0D
	Offset: 0xED8
	Size: 0x10C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e22f5208(transition, outcome)
{
	var_9914886a = 0;
	foreach(player in level.players)
	{
		if(isdefined(player getlinkedent()))
		{
			player unlink();
			var_9914886a = 1;
		}
	}
	if(var_9914886a)
	{
		waitframe(1);
	}
	clearplayercorpses();
	player::function_2f80d95b(&function_ba94df6c);
}

/*
	Name: function_a3b4d41d
	Namespace: namespace_81c567a8
	Checksum: 0xFE8D3458
	Offset: 0xFF0
	Size: 0x34
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a3b4d41d(transition, outcome)
{
	player::function_2f80d95b(&freeze_player_for_round_end);
}

/*
	Name: function_654c0030
	Namespace: namespace_81c567a8
	Checksum: 0x570830D7
	Offset: 0x1030
	Size: 0x4C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_654c0030(transition, outcome)
{
	player::function_2f80d95b(&function_d7b5082e);
	thread globallogic_audio::announce_game_winner(outcome);
}

/*
	Name: function_d9d842b2
	Namespace: namespace_81c567a8
	Checksum: 0xC45CDB13
	Offset: 0x1088
	Size: 0x2C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d9d842b2(transition, outcome)
{
	thread globallogic_audio::function_57678746(outcome);
}

/*
	Name: function_b7fec738
	Namespace: namespace_81c567a8
	Checksum: 0xE0F2829E
	Offset: 0x10C0
	Size: 0x2C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b7fec738(transition, outcome)
{
	thread globallogic_audio::announce_round_winner(0);
}

/*
	Name: function_66713ac
	Namespace: namespace_81c567a8
	Checksum: 0x6A373D39
	Offset: 0x10F8
	Size: 0x24
	Parameters: 2
	Flags: Linked, Private
*/
function private function_66713ac(transition, outcome)
{
	thread globallogic_audio::function_5e0a6842();
}

/*
	Name: function_8feabee3
	Namespace: namespace_81c567a8
	Checksum: 0x85188A92
	Offset: 0x1128
	Size: 0x24
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8feabee3(transition, outcome)
{
	thread globallogic_audio::function_dfd17bd3();
}

/*
	Name: function_a3c90acf
	Namespace: namespace_81c567a8
	Checksum: 0xCEDAFE5A
	Offset: 0x1158
	Size: 0x24
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a3c90acf(transition, outcome)
{
	thread globallogic_audio::function_1f89b047();
}

/*
	Name: function_26bbb839
	Namespace: namespace_81c567a8
	Checksum: 0x64C2286B
	Offset: 0x1188
	Size: 0x1C4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_26bbb839(transition, outcome)
{
	thread function_b8e20f5f(transition, outcome, transition.slowdown, transition.var_d7f20c92, &function_9185f489);
	thread function_b8e20f5f(transition, outcome, transition.var_e2699dc7, transition.var_5f190d97, &function_a3b4d41d);
	thread function_b8e20f5f(transition, outcome, transition.var_b0bc6ae0, transition.var_8d7c57a2, &function_8feabee3);
	thread function_b8e20f5f(transition, outcome, transition.var_738bf790, transition.var_8dc11094, &function_a3c90acf);
	thread function_b8e20f5f(transition, outcome, transition.var_619875ca, transition.var_73f860db, &function_b7fec738);
	thread function_b8e20f5f(transition, outcome, transition.var_7a712c7, transition.var_a803fe51, &function_66713ac);
	thread function_b8e20f5f(transition, outcome, transition.var_93a95648, transition.var_de820e2d, &function_654c0030);
	thread function_b8e20f5f(transition, outcome, transition.var_f9995c63, transition.var_41fc87a8, &function_d9d842b2);
	thread function_b8e20f5f(transition, outcome, transition.pickup_message, transition.var_5026a297, &function_e22f5208);
}

/*
	Name: checkroundswitch
	Namespace: namespace_81c567a8
	Checksum: 0x881C0060
	Offset: 0x1358
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function checkroundswitch()
{
	if(!isdefined(level.roundswitch) || !level.roundswitch)
	{
		return false;
	}
	if(!isdefined(level.onroundswitch))
	{
		return false;
	}
	/#
		assert(game.roundsplayed > 0);
	#/
	if((game.roundsplayed % level.roundswitch) == 0)
	{
		[[level.onroundswitch]]();
		return true;
	}
	return false;
}

/*
	Name: function_e3855f6d
	Namespace: namespace_81c567a8
	Checksum: 0x88788D64
	Offset: 0x13F0
	Size: 0x8C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e3855f6d(transition, outcome)
{
	if(util::waslastround())
	{
		return;
	}
	if(!is_true(level.var_3e7c197f) && !checkroundswitch())
	{
		return;
	}
	level.var_3e7c197f = 1;
	function_26bbb839(transition, outcome);
}

/*
	Name: function_a2d39e40
	Namespace: namespace_81c567a8
	Checksum: 0x254B3C61
	Offset: 0x1488
	Size: 0x34
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a2d39e40(transition, outcome)
{
	globallogic::function_452e18ad();
	killcam::post_round_final_killcam();
}

/*
	Name: function_e3442abc
	Namespace: namespace_81c567a8
	Checksum: 0xF9876A1F
	Offset: 0x14C8
	Size: 0x34
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e3442abc(transition, outcome)
{
	globallogic::function_452e18ad();
	potm::post_round_potm();
}

/*
	Name: function_7285f7e1
	Namespace: namespace_81c567a8
	Checksum: 0x5931C457
	Offset: 0x1508
	Size: 0x5C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_7285f7e1(e1, e2, b_lowest_first)
{
	if(!isdefined(b_lowest_first))
	{
		b_lowest_first = 0;
	}
	if(b_lowest_first)
	{
		return e1.score <= e2.score;
	}
	return e1.score > e2.score;
}

/*
	Name: function_6b33e951
	Namespace: namespace_81c567a8
	Checksum: 0x69AEE684
	Offset: 0x1570
	Size: 0x174
	Parameters: 0
	Flags: Private
*/
function private function_6b33e951()
{
	var_9a829482 = 6;
	winning_team = match::get_winning_team();
	if(winning_team == #"none")
	{
		winning_team = #"allies";
	}
	winners = getplayers(winning_team);
	winners = array::merge_sort(winners, &function_7285f7e1, 0);
	var_860af94a = array();
	for(i = 0; i < var_9a829482; i++)
	{
		client_num = (isdefined(winners[i]) ? winners[i].entnum : -1);
		array::add(var_860af94a, client_num);
	}
	luinotifyevent(#"top_squad", var_9a829482, var_860af94a[0], var_860af94a[1], var_860af94a[2], var_860af94a[3], var_860af94a[4], var_860af94a[5]);
}

/*
	Name: function_87a832a5
	Namespace: namespace_81c567a8
	Checksum: 0xD4D40B28
	Offset: 0x16F0
	Size: 0x3C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_87a832a5(transition, outcome)
{
	function_26bbb839(transition, outcome);
}

/*
	Name: function_721d8d6e
	Namespace: namespace_81c567a8
	Checksum: 0x3A8E9C78
	Offset: 0x1738
	Size: 0x44
	Parameters: 2
	Flags: Linked, Private
*/
function private function_721d8d6e(transition, outcome)
{
	globallogic::function_452e18ad();
	level clientfield::set("top_squad_begin", 1);
}

/*
	Name: function_51bb7ed5
	Namespace: namespace_81c567a8
	Checksum: 0x593A196D
	Offset: 0x1788
	Size: 0x64
	Parameters: 2
	Flags: Linked, Private
*/
function private function_51bb7ed5(transition, outcome)
{
	globallogic::function_452e18ad();
	if(function_f99d2668())
	{
		namespace_98521e8b::function_d6b2318a();
	}
	else
	{
		namespace_98521e8b::function_f7961c39();
	}
}

/*
	Name: function_8d0112e9
	Namespace: namespace_81c567a8
	Checksum: 0x9A84FEE7
	Offset: 0x17F8
	Size: 0x3C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8d0112e9(transition, outcome)
{
	namespace_98521e8b::function_364bc19c(outcome);
	namespace_98521e8b::function_29597300();
}

/*
	Name: function_e794b637
	Namespace: namespace_81c567a8
	Checksum: 0xC34940CF
	Offset: 0x1840
	Size: 0x52
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e794b637(transition, outcome)
{
	globallogic::function_452e18ad();
	wait(1);
	level clientfield::set("hero_pose_begin", 1);
	wait(10);
}

/*
	Name: function_7e74281
	Namespace: namespace_81c567a8
	Checksum: 0x88CE2B8F
	Offset: 0x18A0
	Size: 0x1E4
	Parameters: 0
	Flags: Linked
*/
function function_7e74281()
{
	level.var_3a309902[#"blank"] = &function_26bbb839;
	level.var_3a309902[#"outcome"] = &function_87a832a5;
	level.var_3a309902[#"outcome_with_score"] = &function_26bbb839;
	level.var_3a309902[#"hash_6fbf8ded3dc17ef0"] = &function_26bbb839;
	level.var_3a309902[#"switch_sides"] = &function_e3855f6d;
	level.var_3a309902[#"final_killcam"] = &function_a2d39e40;
	level.var_3a309902[#"play_of_the_match"] = &function_e3442abc;
	level.var_3a309902[#"high_value_operatives"] = &function_26bbb839;
	level.var_3a309902[#"top_squad"] = &function_721d8d6e;
	level.var_3a309902[#"hero_pose"] = &function_e794b637;
	level.var_3a309902[#"exit_cinematic"] = &function_51bb7ed5;
	level.var_7e74281[#"exit_cinematic"] = &function_8d0112e9;
}

/*
	Name: function_b797319e
	Namespace: namespace_81c567a8
	Checksum: 0xD40458E0
	Offset: 0x1A90
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_b797319e(var_d75e9390, var_e6825eda)
{
	self luinotifyevent(var_d75e9390, 1, var_e6825eda);
}

/*
	Name: function_752a920f
	Namespace: namespace_81c567a8
	Checksum: 0x3F8BAC16
	Offset: 0x1AD0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_752a920f()
{
	self luinotifyevent(#"hash_4448c66c7f84aa68");
}

/*
	Name: function_d7b5082e
	Namespace: namespace_81c567a8
	Checksum: 0x2AD698C8
	Offset: 0x1B00
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_d7b5082e()
{
	if(isdefined(self.pers[#"totalmatchbonus"]))
	{
		self luinotifyevent(#"hash_9dfc8d44ea4547e", 1, self.pers[#"totalmatchbonus"]);
	}
}

/*
	Name: function_81c567a8
	Namespace: namespace_81c567a8
	Checksum: 0xA1A31670
	Offset: 0x1B68
	Size: 0x72
	Parameters: 4
	Flags: Linked
*/
function function_81c567a8(transition, var_e6825eda, outcome, var_276aad88)
{
	player::function_e7f18b20(&function_b797319e, var_276aad88, var_e6825eda + 1);
	[[level.var_3a309902[transition.type]]](transition, outcome);
}

/*
	Name: function_2125bc4b
	Namespace: namespace_81c567a8
	Checksum: 0x477589F9
	Offset: 0x1BE8
	Size: 0x56
	Parameters: 3
	Flags: Linked
*/
function function_2125bc4b(transition, var_e6825eda, outcome)
{
	if(isdefined(level.var_7e74281[var_e6825eda.type]))
	{
		[[level.var_7e74281[var_e6825eda.type]]](var_e6825eda, outcome);
	}
}

/*
	Name: function_f2ffece2
	Namespace: namespace_81c567a8
	Checksum: 0xE94BB596
	Offset: 0x1C48
	Size: 0x5A
	Parameters: 3
	Flags: Linked
*/
function function_f2ffece2(transition, outcome, var_61f85cf)
{
	if(isdefined(level.var_5d720398[transition.type]))
	{
		level thread [[level.var_5d720398[transition.type]]](transition, outcome, var_61f85cf);
	}
}

/*
	Name: function_f2e3981e
	Namespace: namespace_81c567a8
	Checksum: 0xC6DC0207
	Offset: 0x1CB0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_f2e3981e()
{
	player::function_2f80d95b(&function_752a920f);
	array::run_all(level.players, &hud_message::function_6be746c2);
}

/*
	Name: function_40a46b5b
	Namespace: namespace_81c567a8
	Checksum: 0xB916A21F
	Offset: 0x1D08
	Size: 0x24E
	Parameters: 2
	Flags: Linked
*/
function function_40a46b5b(transition, outcome)
{
	if(is_true(transition.disable))
	{
		return true;
	}
	if(is_true(transition.var_b5dabc6b))
	{
		if(util::waslastround() || util::isoneround())
		{
			return true;
		}
	}
	var_860cd9fa = isdefined(level.shouldplayovertimeround) && [[level.shouldplayovertimeround]]();
	if(isdefined(level.shouldplayovertimeround) && [[level.shouldplayovertimeround]]())
	{
		if(is_true(transition.var_d0f2da62))
		{
			return true;
		}
	}
	else if(is_true(transition.var_fb87c2b4))
	{
		return true;
	}
	if(overtime::is_overtime_round())
	{
		if(is_true(transition.var_e0d86f3))
		{
			return true;
		}
	}
	else if(is_true(transition.var_7b778818))
	{
		return true;
	}
	if(transition.type == "team_pose")
	{
		if(outcome.team == #"none")
		{
			return true;
		}
		if(!isdefined(struct::get("team_pose_cam", "targetname")))
		{
			return true;
		}
	}
	if(transition.type == "switch_sides")
	{
		if(!is_true(level.roundswitch))
		{
			return true;
		}
	}
	if(transition.type == "outcome")
	{
		if(is_true(level.var_67a68459))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_7e8f8c47
	Namespace: namespace_81c567a8
	Checksum: 0xBFF15F1D
	Offset: 0x1F60
	Size: 0x1E8
	Parameters: 3
	Flags: Linked
*/
function function_7e8f8c47(transitions, outcome, var_276aad88)
{
	foreach(transition in transitions)
	{
		if(function_40a46b5b(transition, outcome))
		{
			continue;
		}
		function_2125bc4b(transition, index, outcome);
	}
	foreach(transition in transitions)
	{
		if(function_40a46b5b(transition, outcome))
		{
			continue;
		}
		level notify(#"hash_2895c81f7bc8a45", index, transition, outcome);
		function_81c567a8(transition, index, outcome, var_276aad88);
		if((isdefined(transition.time) ? transition.time : 0) != 0)
		{
			function_3dc5df3b(float(transition.time) / 1000);
		}
		function_f2ffece2(transition, outcome, transitions[index + 1]);
	}
}

/*
	Name: function_15e28b1a
	Namespace: namespace_81c567a8
	Checksum: 0x8AAB7932
	Offset: 0x2150
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_15e28b1a(outcome)
{
	function_7e8f8c47(level.var_d1455682.var_3e72919, outcome, #"hash_3c8d299dc7fb2944");
}

/*
	Name: function_cf3d556b
	Namespace: namespace_81c567a8
	Checksum: 0xA5358320
	Offset: 0x2198
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_cf3d556b(outcome)
{
	if(is_true(level.var_d1455682.var_e779605d))
	{
		if(util::waslastround() || util::isoneround())
		{
			return;
		}
	}
	transitions = level.var_d1455682.var_573005c3;
	if(!isdefined(transitions))
	{
		return;
	}
	function_7e8f8c47(transitions, outcome, #"hash_51404dd365704d77");
}

/*
	Name: function_3dc5df3b
	Namespace: namespace_81c567a8
	Checksum: 0xB6A1512E
	Offset: 0x2250
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_3dc5df3b(time)
{
	if(time <= 0)
	{
		return;
	}
	level waittilltimeout(time * level.var_49d9aa70, #"hash_197c640e2f684a74");
}

/*
	Name: function_ad717b18
	Namespace: namespace_81c567a8
	Checksum: 0xBC002631
	Offset: 0x22A0
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_ad717b18(var_c139bfe2)
{
	/#
		assert(isdefined(level.roundenddelay[var_c139bfe2]));
	#/
	delay = level.roundenddelay[var_c139bfe2] * level.var_49d9aa70;
	if(delay)
	{
		return;
	}
	var_f05b8779 = delay / 2;
	if(var_f05b8779 > 0)
	{
		wait(var_f05b8779);
		var_f05b8779 = delay / 2;
	}
	else
	{
		var_f05b8779 = (delay / 2) + var_f05b8779;
	}
	level notify(#"give_match_bonus");
	if(var_f05b8779 > 0)
	{
		wait(var_f05b8779);
	}
}

