#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\overtime.gsc;
#using scripts\mp_common\gametypes\outcome.gsc;
#using scripts\mp_common\gametypes\hud_message.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using script_1cc417743d7c262d;
#using script_39003d7a41f33078;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace display_transition;

/*
	Name: init_shared
	Namespace: display_transition
	Checksum: 0x62CE6751
	Offset: 0x1E0
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
	Namespace: display_transition
	Checksum: 0x5E1C0B32
	Offset: 0x210
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private registerclientfields()
{
	if(sessionmodeiswarzonegame())
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
	Namespace: display_transition
	Checksum: 0xD9AD0168
	Offset: 0x2D0
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a5ce91f1(val)
{
	if(sessionmodeiswarzonegame())
	{
		self clientfield::set_to_player("eliminated_postfx", val);
	}
}

/*
	Name: function_81d670f5
	Namespace: display_transition
	Checksum: 0x23736087
	Offset: 0x318
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
	Namespace: display_transition
	Checksum: 0x4708175
	Offset: 0x378
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
	Namespace: display_transition
	Checksum: 0x371C086B
	Offset: 0x410
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
	Namespace: display_transition
	Checksum: 0xF366A149
	Offset: 0x470
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
	Namespace: display_transition
	Checksum: 0x3132D929
	Offset: 0x4E0
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_19adc0b7(outcome)
{
	thread globallogic_audio::function_91d557d3(outcome);
	player::function_2f80d95b(&function_3f65d5d3);
	function_e6b4f2f7(outcome);
	array::run_all(level.players, &hud_message::can_bg_draw, outcome);
	function_15e28b1a(outcome);
	globallogic::function_452e18ad();
	array::run_all(level.players, &hud_message::function_6be746c2);
}

/*
	Name: function_73d36f61
	Namespace: display_transition
	Checksum: 0xF8BE73CF
	Offset: 0x5C0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_73d36f61(outcome)
{
	level thread globallogic_audio::set_music_global("matchend");
}

/*
	Name: display_round_end
	Namespace: display_transition
	Checksum: 0x3D4540F4
	Offset: 0x5F8
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function display_round_end(outcome)
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
		clear_transition();
	}
	globallogic::function_452e18ad();
}

/*
	Name: function_ee8c4421
	Namespace: display_transition
	Checksum: 0x2FD377EE
	Offset: 0x6C0
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
	Namespace: display_transition
	Checksum: 0xCCFF944F
	Offset: 0x710
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
	Namespace: display_transition
	Checksum: 0xF2615B02
	Offset: 0x7D0
	Size: 0x208
	Parameters: 2
	Flags: Linked
*/
function function_61d01718(transitions, lui_event)
{
	if(!isdefined(transitions))
	{
		return;
	}
	player = self;
	player endon(#"disconnect");
	foreach(transition in transitions)
	{
		player function_b797319e(lui_event, index + 1);
		if((isdefined(transition.time) ? transition.time : 0) != 0)
		{
			round_end_wait(float(transition.time) / 1000);
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
	Namespace: display_transition
	Checksum: 0xEB8DF641
	Offset: 0x9E0
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
	Namespace: display_transition
	Checksum: 0xA73C1E57
	Offset: 0xAC0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_9b2bd02c()
{
	player = self;
	player function_3f65d5d3();
	player function_61d01718(level.var_d1455682.var_87a42f09, #"elimination_transition");
}

/*
	Name: function_b3964dc9
	Namespace: display_transition
	Checksum: 0xCD6F4FC0
	Offset: 0xB20
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
	Namespace: display_transition
	Checksum: 0x5EF86498
	Offset: 0xBC8
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
	Namespace: display_transition
	Checksum: 0x73AC1B76
	Offset: 0xC30
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
	Namespace: display_transition
	Checksum: 0xCB63F7FA
	Offset: 0xD88
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
	Namespace: display_transition
	Checksum: 0x17FD7BF2
	Offset: 0xDD0
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
	Namespace: display_transition
	Checksum: 0xB7059940
	Offset: 0xE10
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
	Namespace: display_transition
	Checksum: 0xD9A9871A
	Offset: 0xE50
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
	Namespace: display_transition
	Checksum: 0x8388579B
	Offset: 0xEB8
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
	Namespace: display_transition
	Checksum: 0x8EA77DF7
	Offset: 0xFD0
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
	Namespace: display_transition
	Checksum: 0xA4A290E4
	Offset: 0x1010
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
	Namespace: display_transition
	Checksum: 0x5C037034
	Offset: 0x1068
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
	Namespace: display_transition
	Checksum: 0xA64268FC
	Offset: 0x10A0
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
	Namespace: display_transition
	Checksum: 0xD7313FE6
	Offset: 0x10D8
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
	Namespace: display_transition
	Checksum: 0x905E6A6F
	Offset: 0x1108
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
	Namespace: display_transition
	Checksum: 0xBC1EA8A7
	Offset: 0x1138
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
	Namespace: display_transition
	Checksum: 0xA15DBABF
	Offset: 0x1168
	Size: 0x1C4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_26bbb839(transition, outcome)
{
	thread function_b8e20f5f(transition, outcome, transition.slowdown, transition.var_d7f20c92, &function_9185f489);
	thread function_b8e20f5f(transition, outcome, transition.freezeplayers, transition.freezetime, &function_a3b4d41d);
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
	Namespace: display_transition
	Checksum: 0x25A41691
	Offset: 0x1338
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
	Namespace: display_transition
	Checksum: 0x510289F3
	Offset: 0x13D0
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
	Namespace: display_transition
	Checksum: 0xE6220DA0
	Offset: 0x1468
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
	Namespace: display_transition
	Checksum: 0xD31B3FAC
	Offset: 0x14A8
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
	Namespace: display_transition
	Checksum: 0x8A1A605D
	Offset: 0x14E8
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
	Namespace: display_transition
	Checksum: 0xC4D1F160
	Offset: 0x1550
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
	Namespace: display_transition
	Checksum: 0x45CB0F99
	Offset: 0x16D0
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
	Namespace: display_transition
	Checksum: 0x6944867E
	Offset: 0x1718
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
	Namespace: display_transition
	Checksum: 0x920CA6CB
	Offset: 0x1768
	Size: 0x64
	Parameters: 2
	Flags: Linked, Private
*/
function private function_51bb7ed5(transition, outcome)
{
	globallogic::function_452e18ad();
	if(sessionmodeiswarzonegame())
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
	Namespace: display_transition
	Checksum: 0x7DA27483
	Offset: 0x17D8
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
	Namespace: display_transition
	Checksum: 0xE90A4106
	Offset: 0x1820
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
	Namespace: display_transition
	Checksum: 0xFA174281
	Offset: 0x1880
	Size: 0x1E4
	Parameters: 0
	Flags: Linked
*/
function function_7e74281()
{
	level.var_3a309902[#"blank"] = &function_26bbb839;
	level.var_3a309902[#"outcome"] = &function_87a832a5;
	level.var_3a309902[#"outcome_with_score"] = &function_26bbb839;
	level.var_3a309902[#"outcome_with_time"] = &function_26bbb839;
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
	Namespace: display_transition
	Checksum: 0x4D45B93C
	Offset: 0x1A70
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_b797319e(transition_type, var_e6825eda)
{
	self luinotifyevent(transition_type, 1, var_e6825eda);
}

/*
	Name: function_752a920f
	Namespace: display_transition
	Checksum: 0xF0A01E0C
	Offset: 0x1AB0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_752a920f()
{
	self luinotifyevent(#"clear_transition");
}

/*
	Name: function_d7b5082e
	Namespace: display_transition
	Checksum: 0x1D08D4E
	Offset: 0x1AE0
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
	Name: display_transition
	Namespace: display_transition
	Checksum: 0x721CBE73
	Offset: 0x1B48
	Size: 0x72
	Parameters: 4
	Flags: Linked
*/
function display_transition(transition, var_e6825eda, outcome, lui_event)
{
	player::function_e7f18b20(&function_b797319e, lui_event, var_e6825eda + 1);
	[[level.var_3a309902[transition.type]]](transition, outcome);
}

/*
	Name: function_2125bc4b
	Namespace: display_transition
	Checksum: 0xB9741B83
	Offset: 0x1BC8
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
	Namespace: display_transition
	Checksum: 0x624CB47A
	Offset: 0x1C28
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
	Name: clear_transition
	Namespace: display_transition
	Checksum: 0x9F90F06E
	Offset: 0x1C90
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function clear_transition()
{
	player::function_2f80d95b(&function_752a920f);
	array::run_all(level.players, &hud_message::function_6be746c2);
}

/*
	Name: function_40a46b5b
	Namespace: display_transition
	Checksum: 0x8AD1E2D7
	Offset: 0x1CE8
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
	Namespace: display_transition
	Checksum: 0x3048D584
	Offset: 0x1F40
	Size: 0x1E8
	Parameters: 3
	Flags: Linked
*/
function function_7e8f8c47(transitions, outcome, lui_event)
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
		level notify(#"display_transition", index, transition, outcome);
		display_transition(transition, index, outcome, lui_event);
		if((isdefined(transition.time) ? transition.time : 0) != 0)
		{
			round_end_wait(float(transition.time) / 1000);
		}
		function_f2ffece2(transition, outcome, transitions[index + 1]);
	}
}

/*
	Name: function_15e28b1a
	Namespace: display_transition
	Checksum: 0x6BFD0AD9
	Offset: 0x2130
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_15e28b1a(outcome)
{
	function_7e8f8c47(level.var_d1455682.var_3e72919, outcome, #"match_transition");
}

/*
	Name: function_cf3d556b
	Namespace: display_transition
	Checksum: 0x29638D24
	Offset: 0x2178
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
	function_7e8f8c47(transitions, outcome, #"round_transition");
}

/*
	Name: round_end_wait
	Namespace: display_transition
	Checksum: 0xA6DF67AC
	Offset: 0x2230
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function round_end_wait(time)
{
	if(time <= 0)
	{
		return;
	}
	level waittilltimeout(time * level.var_49d9aa70, #"hash_197c640e2f684a74");
}

/*
	Name: function_ad717b18
	Namespace: display_transition
	Checksum: 0x4CD3546E
	Offset: 0x2280
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

