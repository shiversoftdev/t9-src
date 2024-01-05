#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace display_transition;

/*
	Name: function_b07c3fc2
	Namespace: display_transition
	Checksum: 0xC572CF32
	Offset: 0x180
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b07c3fc2()
{
	level notify(-1647193977);
}

/*
	Name: init_shared
	Namespace: display_transition
	Checksum: 0xACEF38F
	Offset: 0x1A0
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
	Checksum: 0x7C45EEDB
	Offset: 0x1D0
	Size: 0x84
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
	}
}

/*
	Name: function_a5ce91f1
	Namespace: display_transition
	Checksum: 0x96C85C00
	Offset: 0x260
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
	Checksum: 0xFAE04550
	Offset: 0x2A8
	Size: 0x52
	Parameters: 0
	Flags: None
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
	Checksum: 0x7DD77567
	Offset: 0x308
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
	Checksum: 0xE9988AC4
	Offset: 0x3A0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_e6b4f2f7(outcome)
{
	function_76f27db3(outcome.var_c1e98979, 1, #"none", outcome.team, outcome.players);
}

/*
	Name: function_12d1f62a
	Namespace: display_transition
	Checksum: 0x278CF883
	Offset: 0x3F0
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_12d1f62a(outcome)
{
	function_2fa975e0(util::getroundsplayed(), outcome.var_c1e98979, 1, #"none", outcome.team, outcome.players);
}

/*
	Name: function_19adc0b7
	Namespace: display_transition
	Checksum: 0x7B25BC74
	Offset: 0x458
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_19adc0b7(outcome)
{
	player::function_2f80d95b(&function_3f65d5d3);
	function_e6b4f2f7(outcome);
	function_15e28b1a(outcome);
}

/*
	Name: display_round_end
	Namespace: display_transition
	Checksum: 0xE7903515
	Offset: 0x4C0
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function display_round_end(outcome)
{
	player::function_2f80d95b(&function_3f65d5d3);
	player::function_2f80d95b(&function_3cfb29e1);
	function_12d1f62a(outcome);
	function_cf3d556b(outcome);
}

/*
	Name: function_91b514e8
	Namespace: display_transition
	Checksum: 0xA5D81FDD
	Offset: 0x548
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
	Checksum: 0x3ED50025
	Offset: 0x608
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
	Checksum: 0xE390E0B1
	Offset: 0x818
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
	Checksum: 0x69EAFD75
	Offset: 0x8F8
	Size: 0x54
	Parameters: 0
	Flags: None
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
	Checksum: 0xD8328442
	Offset: 0x958
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_b3964dc9()
{
	/#
		if(getdvarint(#"scr_disable_infiltration", 0))
		{
			return;
		}
	#/
	if(is_true(level.var_a4c48e88))
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
	Checksum: 0x34B1354F
	Offset: 0xA08
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
	Checksum: 0x1F7A4A5E
	Offset: 0xA70
	Size: 0x14C
	Parameters: 1
	Flags: None
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
	Checksum: 0x7C440322
	Offset: 0xBC8
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
	Name: function_3cfb29e1
	Namespace: display_transition
	Checksum: 0x17BFA8B8
	Offset: 0xC10
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function function_3cfb29e1()
{
	if(!util::waslastround())
	{
		music::setmusicstate("roundend");
		if(isdefined(self.pers[#"music"].spawn))
		{
			self.pers[#"music"].spawn = 0;
		}
	}
}

/*
	Name: freeze_player_for_round_end
	Namespace: display_transition
	Checksum: 0x80F724D1
	Offset: 0xC90
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private freeze_player_for_round_end()
{
}

/*
	Name: function_ba94df6c
	Namespace: display_transition
	Checksum: 0x6FDCCE2D
	Offset: 0xCA0
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
	Checksum: 0x6873BA53
	Offset: 0xCE0
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function function_9185f489(transition, outcome)
{
}

/*
	Name: function_e22f5208
	Namespace: display_transition
	Checksum: 0x8EC4CDD9
	Offset: 0xD00
	Size: 0xF4
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
	player::function_2f80d95b(&function_ba94df6c);
}

/*
	Name: function_a3b4d41d
	Namespace: display_transition
	Checksum: 0xC38CDBD3
	Offset: 0xE00
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
	Checksum: 0xE4E72BB9
	Offset: 0xE40
	Size: 0x34
	Parameters: 2
	Flags: Linked, Private
*/
function private function_654c0030(transition, outcome)
{
	player::function_2f80d95b(&function_d7b5082e);
}

/*
	Name: function_d9d842b2
	Namespace: display_transition
	Checksum: 0x8B2129BA
	Offset: 0xE80
	Size: 0x14
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d9d842b2(transition, outcome)
{
}

/*
	Name: function_b7fec738
	Namespace: display_transition
	Checksum: 0xAC7E5B7
	Offset: 0xEA0
	Size: 0x14
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b7fec738(transition, outcome)
{
}

/*
	Name: function_66713ac
	Namespace: display_transition
	Checksum: 0x65465D17
	Offset: 0xEC0
	Size: 0x14
	Parameters: 2
	Flags: Linked, Private
*/
function private function_66713ac(transition, outcome)
{
}

/*
	Name: function_8feabee3
	Namespace: display_transition
	Checksum: 0x8E5A6343
	Offset: 0xEE0
	Size: 0x14
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8feabee3(transition, outcome)
{
}

/*
	Name: function_a3c90acf
	Namespace: display_transition
	Checksum: 0xD2DC2ADD
	Offset: 0xF00
	Size: 0x14
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a3c90acf(transition, outcome)
{
}

/*
	Name: function_26bbb839
	Namespace: display_transition
	Checksum: 0x1818CB54
	Offset: 0xF20
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
	Checksum: 0xC22FC7E6
	Offset: 0x10F0
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
	Checksum: 0x44098E86
	Offset: 0x1188
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
	Checksum: 0xBD0387D9
	Offset: 0x1220
	Size: 0x24
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a2d39e40(transition, outcome)
{
	killcam::post_round_final_killcam();
}

/*
	Name: function_e3442abc
	Namespace: display_transition
	Checksum: 0xEA8BC6A5
	Offset: 0x1250
	Size: 0x24
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e3442abc(transition, outcome)
{
	potm::post_round_potm();
}

/*
	Name: function_7285f7e1
	Namespace: display_transition
	Checksum: 0x33F72745
	Offset: 0x1280
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
	Checksum: 0x5D06B49C
	Offset: 0x12E8
	Size: 0x174
	Parameters: 0
	Flags: Private
*/
function private function_6b33e951()
{
	var_9a829482 = 6;
	winning_team = #"allies";
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
	Checksum: 0x18149A15
	Offset: 0x1468
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
	Checksum: 0xD7F9F57C
	Offset: 0x14B0
	Size: 0x34
	Parameters: 2
	Flags: Linked, Private
*/
function private function_721d8d6e(transition, outcome)
{
	level clientfield::set("top_squad_begin", 1);
}

/*
	Name: function_7e74281
	Namespace: display_transition
	Checksum: 0x70465BD1
	Offset: 0x14F0
	Size: 0x16C
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
}

/*
	Name: function_b797319e
	Namespace: display_transition
	Checksum: 0x54D89B6A
	Offset: 0x1668
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
	Checksum: 0xC39D8D39
	Offset: 0x16A8
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
	Checksum: 0xF1363BD4
	Offset: 0x16D8
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
	Checksum: 0xE884E232
	Offset: 0x1740
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
	Name: function_f2ffece2
	Namespace: display_transition
	Checksum: 0x27D52400
	Offset: 0x17C0
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
	Checksum: 0x677D7B7
	Offset: 0x1828
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function clear_transition()
{
	player::function_2f80d95b(&function_752a920f);
}

/*
	Name: function_40a46b5b
	Namespace: display_transition
	Checksum: 0x61D1D08F
	Offset: 0x1858
	Size: 0x1EE
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
	Checksum: 0x87E72696
	Offset: 0x1A50
	Size: 0x174
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
		level notify(#"display_transition", index, transition, outcome);
		display_transition(transition, index, outcome, lui_event);
		if((isdefined(transition.time) ? transition.time : 0) != 0)
		{
			round_end_wait(float(transition.time) / 1000);
		}
		function_f2ffece2(transition, outcome, transitions[index + 1]);
	}
	clear_transition();
}

/*
	Name: function_15e28b1a
	Namespace: display_transition
	Checksum: 0xB332C669
	Offset: 0x1BD0
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
	Checksum: 0x5986A04B
	Offset: 0x1C18
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
	Checksum: 0x65EE8FA9
	Offset: 0x1CD0
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
	Checksum: 0x33B72CC3
	Offset: 0x1D20
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

