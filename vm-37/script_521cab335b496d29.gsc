#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\util.gsc;

#namespace ui;

/*
	Name: function_89f2df9
	Namespace: ui
	Checksum: 0x87474F5F
	Offset: 0x280
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"ui", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: ui
	Checksum: 0x3A5CA560
	Offset: 0x2D8
	Size: 0x3C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.var_ef4974d7))
	{
		level.var_ef4974d7 = [];
	}
	/#
		level thread function_5f747d5a();
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: ui
	Checksum: 0xEAD3D965
	Offset: 0x320
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	level thread game_time();
}

/*
	Name: game_time
	Namespace: ui
	Checksum: 0x64ACBB79
	Offset: 0x348
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function game_time()
{
	level flag::wait_till("game_start");
	level.n_start_time = gettime();
}

/*
	Name: function_ebd7bf6a
	Namespace: ui
	Checksum: 0x82F6C883
	Offset: 0x380
	Size: 0x824
	Parameters: 10
	Flags: None
*/
function function_ebd7bf6a(var_753cb060, var_3b192471, str_team, var_9c038d31, var_f27011e3, var_3efd443d, var_edf9778a, var_72f304a8, var_243f2dbe, var_f2a3a140)
{
	if(!isdefined(var_3b192471))
	{
		var_3b192471 = "mission_fail_timer";
	}
	if(!isdefined(str_team))
	{
		str_team = #"any";
	}
	if(!isdefined(var_9c038d31))
	{
		var_9c038d31 = 1;
	}
	if(!isdefined(var_f27011e3))
	{
		var_f27011e3 = 1;
	}
	if(!isdefined(var_edf9778a))
	{
		var_edf9778a = 3;
	}
	if(!isdefined(var_72f304a8))
	{
		var_72f304a8 = 0;
	}
	if(!isdefined(var_f2a3a140))
	{
		var_f2a3a140 = array();
	}
	function_d1eb8589(var_3b192471);
	level endon("destroy_ui_countdown_timer_" + var_3b192471);
	level.var_ef4974d7[var_3b192471] = spawnstruct();
	level.var_ef4974d7[var_3b192471].str_team = util::get_team_mapping(str_team);
	level.var_ef4974d7[var_3b192471].b_paused = 0;
	level.var_ef4974d7[var_3b192471].var_9c038d31 = var_9c038d31;
	level.var_ef4974d7[var_3b192471].n_time_left = var_753cb060;
	level.var_ef4974d7[var_3b192471].var_f27011e3 = var_f27011e3;
	level.var_ef4974d7[var_3b192471].var_c215d29e = var_72f304a8;
	if(level.var_ef4974d7[var_3b192471].n_time_left == 0)
	{
		function_c01d14b6(var_3b192471);
		return;
	}
	var_72f304a8 = var_72f304a8 || isdefined(var_243f2dbe);
	if(var_f27011e3)
	{
		switch(level.var_ef4974d7[var_3b192471].str_team)
		{
			case "allies":
			{
				if(is_true(var_72f304a8))
				{
					clientfield::set_world_uimodel("hudItems.cpObjective.allies.hardpoint.progress", 0);
				}
				else
				{
					clientfield::set_world_uimodel("hudItems.cpObjective.allies.radialTimerMaxTime", var_753cb060);
				}
				clientfield::set_world_uimodel("hudItems.cpObjective.allies.progressType", var_edf9778a);
				break;
			}
			case "axis":
			{
				if(is_true(var_72f304a8))
				{
					clientfield::set_world_uimodel("hudItems.cpObjective.axis.hardpoint.progress", 0);
				}
				else
				{
					clientfield::set_world_uimodel("hudItems.cpObjective.axis.radialTimerMaxTime", var_753cb060);
				}
				clientfield::set_world_uimodel("hudItems.cpObjective.axis.progressType", var_edf9778a);
				break;
			}
			default:
			{
				if(is_true(var_72f304a8))
				{
					clientfield::set_world_uimodel("hudItems.cpObjective.allies.hardpoint.progress", 0);
					clientfield::set_world_uimodel("hudItems.cpObjective.axis.hardpoint.progress", 0);
				}
				else
				{
					clientfield::set_world_uimodel("hudItems.cpObjective.allies.radialTimerMaxTime", var_753cb060);
					clientfield::set_world_uimodel("hudItems.cpObjective.axis.radialTimerMaxTime", var_753cb060);
				}
				clientfield::set_world_uimodel("hudItems.cpObjective.allies.progressType", var_edf9778a);
				clientfield::set_world_uimodel("hudItems.cpObjective.axis.progressType", var_edf9778a);
				break;
			}
		}
	}
	while(level.var_ef4974d7[var_3b192471].n_time_left > 0)
	{
		if(var_f27011e3)
		{
			if(!level.var_ef4974d7[var_3b192471].var_9c038d31)
			{
				function_ba6cfb59(var_3b192471, 0, var_72f304a8);
			}
			else if(!level.var_ef4974d7[var_3b192471].b_paused)
			{
				function_c01d14b6(var_3b192471);
			}
		}
		waitframe(1);
		if(!level.var_ef4974d7[var_3b192471].b_paused)
		{
			level.var_ef4974d7[var_3b192471].n_time_left = level.var_ef4974d7[var_3b192471].n_time_left - (float(function_60d95f53()) / 1000);
		}
		n_time_left = level.var_ef4974d7[var_3b192471].n_time_left;
		var_d7b76468 = (var_753cb060 - n_time_left) / var_753cb060;
		if(isdefined(var_243f2dbe))
		{
			var_d7b76468 = [[var_243f2dbe]](var_d7b76468);
			n_time_left = var_753cb060 * (1 - var_d7b76468);
		}
		if(is_true(var_72f304a8))
		{
			switch(level.var_ef4974d7[var_3b192471].str_team)
			{
				case "allies":
				{
					clientfield::set_world_uimodel("hudItems.cpObjective.allies.hardpoint.progress", var_d7b76468);
					break;
				}
				case "axis":
				{
					clientfield::set_world_uimodel("hudItems.cpObjective.axis.hardpoint.progress", var_d7b76468);
					break;
				}
				default:
				{
					clientfield::set_world_uimodel("hudItems.cpObjective.allies.hardpoint.progress", var_d7b76468);
					clientfield::set_world_uimodel("hudItems.cpObjective.axis.hardpoint.progress", var_d7b76468);
					break;
				}
			}
		}
		foreach(var_2e453ccb in var_f2a3a140)
		{
			if(n_time_left <= var_2e453ccb.seconds)
			{
				level notify(var_2e453ccb.notify_str, {#hash_3b192471:var_3b192471});
				self notify(var_2e453ccb.notify_str);
				arrayremoveindex(var_f2a3a140, index);
				break;
			}
		}
		if(isdefined(var_3efd443d))
		{
			foreach(var_ed6377c1 in var_3efd443d)
			{
				self hud::function_b825bd3d(var_ed6377c1, var_d7b76468);
			}
		}
	}
	if(var_f27011e3)
	{
		function_c01d14b6(var_3b192471, 0);
	}
	self notify(var_3b192471 + "_complete");
	if(var_f27011e3)
	{
		function_ba6cfb59(var_3b192471, 0, var_72f304a8);
		arrayremoveindex(level.var_ef4974d7, var_3b192471, 1);
	}
}

/*
	Name: function_77ab7e7d
	Namespace: ui
	Checksum: 0x886864F0
	Offset: 0xBB0
	Size: 0xE6
	Parameters: 3
	Flags: None
*/
function function_77ab7e7d(n_seconds, var_8430ebdc, var_c15fc3d5)
{
	notifies = [];
	foreach(var_9cdf346f in var_8430ebdc)
	{
		if(n_seconds >= var_9cdf346f)
		{
			var_d67e0fa4 = spawnstruct();
			var_d67e0fa4.seconds = var_9cdf346f;
			var_d67e0fa4.notify_str = var_c15fc3d5[index];
			notifies[notifies.size] = var_d67e0fa4;
		}
	}
	return notifies;
}

/*
	Name: function_c01d14b6
	Namespace: ui
	Checksum: 0x92B79E6C
	Offset: 0xCA0
	Size: 0x182
	Parameters: 2
	Flags: Private
*/
function private function_c01d14b6(var_3b192471, n_time_left)
{
	if(isdefined(n_time_left))
	{
		level.var_ef4974d7[var_3b192471].n_time_left = n_time_left;
	}
	var_1c0820a1 = (gettime() + 1000) + (int(level.var_ef4974d7[var_3b192471].n_time_left * 1000));
	function_ba6cfb59(var_3b192471, 1, !is_true(level.var_ef4974d7[var_3b192471].var_c215d29e));
	switch(level.var_ef4974d7[var_3b192471].str_team)
	{
		case "allies":
		{
			setbombtimer("A", var_1c0820a1);
			break;
		}
		case "axis":
		{
			setbombtimer("B", var_1c0820a1);
			break;
		}
		default:
		{
			setbombtimer("A", var_1c0820a1);
			setbombtimer("B", var_1c0820a1);
			break;
		}
	}
}

/*
	Name: function_ba6cfb59
	Namespace: ui
	Checksum: 0xB876E516
	Offset: 0xE30
	Size: 0x28A
	Parameters: 3
	Flags: Private
*/
function private function_ba6cfb59(var_3b192471, b_enable, var_96dc7504)
{
	if(!isdefined(b_enable))
	{
		b_enable = 1;
	}
	if(!isdefined(var_96dc7504))
	{
		var_96dc7504 = 1;
	}
	if(!is_true(level.var_ef4974d7[var_3b192471].var_f27011e3))
	{
		return;
	}
	str_team = level.var_ef4974d7[var_3b192471].str_team;
	switch(str_team)
	{
		case "allies":
		{
			setmatchflag("bomb_timer_a", is_true(b_enable && var_96dc7504));
			break;
		}
		case "axis":
		{
			setmatchflag("bomb_timer_b", is_true(b_enable && var_96dc7504));
			break;
		}
		default:
		{
			setmatchflag("bomb_timer_a", is_true(b_enable && var_96dc7504));
			setmatchflag("bomb_timer_b", is_true(b_enable && var_96dc7504));
			break;
		}
	}
	if(!b_enable)
	{
		switch(str_team)
		{
			case "allies":
			{
				clientfield::set_world_uimodel("hudItems.cpObjective.allies.progressType", 0);
				break;
			}
			case "axis":
			{
				clientfield::set_world_uimodel("hudItems.cpObjective.axis.progressType", 0);
				break;
			}
			default:
			{
				clientfield::set_world_uimodel("hudItems.cpObjective.allies.progressType", 0);
				clientfield::set_world_uimodel("hudItems.cpObjective.axis.progressType", 0);
				break;
			}
		}
	}
}

/*
	Name: function_b4e596c2
	Namespace: ui
	Checksum: 0xB8634749
	Offset: 0x10C8
	Size: 0xD2
	Parameters: 3
	Flags: None
*/
function function_b4e596c2(var_3b192471, n_time, str_notify)
{
	level endon("destroy_ui_countdown_timer_" + var_3b192471);
	self endon(var_3b192471 + "_complete");
	/#
		assert(isdefined(level.var_ef4974d7[var_3b192471]), "" + var_3b192471);
	#/
	while(level.var_ef4974d7[var_3b192471].n_time_left > n_time)
	{
		waitframe(1);
	}
	if(isdefined(str_notify))
	{
		self notify(str_notify);
	}
	else
	{
		self notify((("timer_" + var_3b192471) + "_reached_") + n_time);
	}
}

/*
	Name: function_d1eb8589
	Namespace: ui
	Checksum: 0xF7D18B2D
	Offset: 0x11A8
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_d1eb8589(var_3b192471)
{
	if(!isdefined(var_3b192471))
	{
		var_3b192471 = "mission_fail_timer";
	}
	if(isdefined(level.var_ef4974d7[var_3b192471]))
	{
		level notify("destroy_ui_countdown_timer_" + var_3b192471);
		function_ba6cfb59(var_3b192471, 0, level.var_ef4974d7[var_3b192471].var_316c2f69);
		arrayremoveindex(level.var_ef4974d7, var_3b192471, 1);
	}
}

/*
	Name: function_f7aafb81
	Namespace: ui
	Checksum: 0x8F334219
	Offset: 0x1248
	Size: 0x4E
	Parameters: 1
	Flags: None
*/
function function_f7aafb81(var_3b192471)
{
	if(!isdefined(var_3b192471))
	{
		var_3b192471 = "mission_fail_timer";
	}
	if(isdefined(level.var_ef4974d7[var_3b192471]))
	{
		level.var_ef4974d7[var_3b192471].b_paused = 1;
	}
}

/*
	Name: function_bb62027a
	Namespace: ui
	Checksum: 0x66D219DD
	Offset: 0x12A0
	Size: 0x4E
	Parameters: 1
	Flags: None
*/
function function_bb62027a(var_3b192471)
{
	if(!isdefined(var_3b192471))
	{
		var_3b192471 = "mission_fail_timer";
	}
	if(isdefined(level.var_ef4974d7[var_3b192471]))
	{
		level.var_ef4974d7[var_3b192471].b_paused = 0;
	}
}

/*
	Name: function_c061766e
	Namespace: ui
	Checksum: 0xFD47A4B3
	Offset: 0x12F8
	Size: 0x4E
	Parameters: 1
	Flags: None
*/
function function_c061766e(var_3b192471)
{
	if(!isdefined(var_3b192471))
	{
		var_3b192471 = "mission_fail_timer";
	}
	if(isdefined(level.var_ef4974d7[var_3b192471]))
	{
		level.var_ef4974d7[var_3b192471].var_9c038d31 = 1;
	}
}

/*
	Name: function_7ec9d70a
	Namespace: ui
	Checksum: 0x14E489D2
	Offset: 0x1350
	Size: 0x4E
	Parameters: 1
	Flags: None
*/
function function_7ec9d70a(var_3b192471)
{
	if(!isdefined(var_3b192471))
	{
		var_3b192471 = "mission_fail_timer";
	}
	if(isdefined(level.var_ef4974d7[var_3b192471]))
	{
		level.var_ef4974d7[var_3b192471].var_9c038d31 = 0;
	}
}

/*
	Name: function_7856e5e0
	Namespace: ui
	Checksum: 0x386BF48D
	Offset: 0x13A8
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function function_7856e5e0(var_3b192471)
{
	if(!isdefined(var_3b192471))
	{
		var_3b192471 = "mission_fail_timer";
	}
	/#
		assert(isdefined(level.var_ef4974d7[var_3b192471]), ("" + var_3b192471) + "");
	#/
	return level.var_ef4974d7[var_3b192471].n_time_left;
}

/*
	Name: game_result
	Namespace: ui
	Checksum: 0xD0CC179B
	Offset: 0x1428
	Size: 0x1E0
	Parameters: 1
	Flags: None
*/
function game_result(str_winning_team)
{
	foreach(player in level.players)
	{
		player val::set(#"game_result", "freezecontrols_allowlook");
		player playlocalsound(#"uin_objective_completed");
		if(!isbot(player))
		{
			if(str_winning_team == #"none")
			{
				var_1a47c004 = #"hash_694986fb14b7d7dd";
				var_1da53c42 = #"hash_42774b4d7620fcbc";
			}
			else
			{
				if(player util::is_on_side(str_winning_team))
				{
					var_1a47c004 = #"hash_5379a106e94c7ecc";
					var_1da53c42 = #"hash_26e1226347737c3c";
				}
				else
				{
					var_1a47c004 = #"hash_694986fb14b7d7dd";
					var_1da53c42 = #"hash_6e65cf69191bdda7";
				}
			}
			player luinotifyevent(#"pre_killcam_transition", 4, 1, level.teamindex[util::get_team_mapping(str_winning_team)], var_1a47c004, var_1da53c42);
		}
	}
}

/*
	Name: function_5f747d5a
	Namespace: ui
	Checksum: 0xEB655389
	Offset: 0x1610
	Size: 0x196
	Parameters: 0
	Flags: Private
*/
function private function_5f747d5a()
{
	/#
		while(true)
		{
			wait(0.25);
			dvarstr = getdvarstring(#"hash_146e539b33582942", "");
			if(dvarstr == "")
			{
				continue;
			}
			setdvar(#"hash_146e539b33582942", "");
			args = strtok(dvarstr, "");
			host = util::gethostplayer();
			if(!isdefined(host))
			{
				continue;
			}
			switch(args[0])
			{
				case "comms":
				{
					host function_97f309cb(args[1]);
					break;
				}
				case "hash_382e15719c2d9b7a":
				{
					host function_97f309cb(args[1], args[2]);
					break;
				}
				case "prompt":
				{
					host function_f29c45f6(args[1]);
					break;
				}
			}
		}
	#/
}

/*
	Name: function_97f309cb
	Namespace: ui
	Checksum: 0x4F7BD656
	Offset: 0x17B0
	Size: 0xB4
	Parameters: 2
	Flags: Private
*/
function private function_97f309cb(portraitid, var_e9f94d47)
{
	/#
		if(!isdefined(var_e9f94d47))
		{
			var_e9f94d47 = undefined;
		}
		if(isdefined(portraitid))
		{
			if(isdefined(var_e9f94d47))
			{
				self luinotifyevent(#"offsite_comms_message", 2, portraitid, var_e9f94d47);
			}
			else
			{
				self luinotifyevent(#"offsite_comms_message", 1, portraitid);
			}
		}
		else
		{
			self luinotifyevent(#"offsite_comms_complete");
		}
	#/
}

/*
	Name: function_f29c45f6
	Namespace: ui
	Checksum: 0xC07C4C6A
	Offset: 0x1870
	Size: 0x6C
	Parameters: 1
	Flags: Private
*/
function private function_f29c45f6(index)
{
	/#
		if(!isdefined(index))
		{
			index = 0;
		}
		if(isstring(index))
		{
			index = int(index);
		}
		self clientfield::set_player_uimodel("", index);
	#/
}

