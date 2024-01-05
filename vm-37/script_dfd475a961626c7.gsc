#using script_28e27ee9b45fd02d;
#using script_31671175564a93b7;
#using script_1cd690a97dfca36e;
#using script_3318f11e3a1b2358;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\music_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_a052577e;

/*
	Name: function_b489bb7b
	Namespace: namespace_a052577e
	Checksum: 0x36D09A3C
	Offset: 0x650
	Size: 0x8C
	Parameters: 1
	Flags: Event
*/
event function_b489bb7b(eventstruct)
{
	snd::function_d4ec748e(&function_f2a2832d);
	snd::function_ce78b33b(&_targetname);
	snd::function_a1961886(&_trigger);
	snd::skipto_init(&_objective);
}

/*
	Name: function_686b88aa
	Namespace: namespace_a052577e
	Checksum: 0x7ED47FEF
	Offset: 0x6E8
	Size: 0x84
	Parameters: 1
	Flags: Event
*/
event function_686b88aa(eventstruct)
{
	level.var_b9a192d2 = [];
	level.var_936dc3f3 = 0;
	snd::function_294cb4fa();
	snd::waitforplayers();
	function_b6407dd4(1);
	audio::function_21f8b7c3();
	level.var_cffe5f6f = &function_9c9fad4e;
}

/*
	Name: _objective
	Namespace: namespace_a052577e
	Checksum: 0xEB7AA040
	Offset: 0x778
	Size: 0x3D2
	Parameters: 1
	Flags: Linked, Private
*/
function private _objective(objective)
{
	switch(objective)
	{
		case "tkdn_raid_bar":
		{
			function_b6407dd4(1);
			break;
		}
		case "tkdn_raid_gearup":
		{
			function_b6407dd4(1);
			break;
		}
		case "tkdn_raid_apt":
		{
			function_b6407dd4(1);
			break;
		}
		case "tkdn_raid_capture":
		{
			function_b6407dd4(1);
			break;
		}
		case "hash_7db5c2bb92c102ae":
		{
			function_b6407dd4(1);
			break;
		}
		case "tkdn_af_intro":
		{
			function_b6407dd4(0);
			break;
		}
		case "tkdn_af_hill":
		{
			function_b6407dd4(0);
			level thread function_955f4842();
			level thread function_a43c0d2c();
			level notify(#"hash_50385173feb854f0");
			break;
		}
		case "tkdn_af_tarmac":
		{
			function_b6407dd4(0);
			level thread function_2d8bbe54(0.1);
			level thread function_a43c0d2c();
			break;
		}
		case "tkdn_af_chase":
		{
			function_b6407dd4(0);
			function_5ea2c6e3("cp_tkdn_af_chase_mix", 0, 1);
			function_5ea2c6e3("cp_tkdn_af_rc_chase_tires", 0, 1);
			level thread function_ad605463();
			level thread function_d1b165f5();
			break;
		}
		case "tkdn_af_rc_chase":
		{
			function_b6407dd4(0);
			function_5ea2c6e3("cp_tkdn_af_chase_mix", 0, 1);
			level thread function_d1b165f5();
			level thread function_e8df4c70();
			break;
		}
		case "tkdn_af_skid":
		{
			function_b6407dd4(0);
			break;
		}
		case "tkdn_af_wreck":
		{
			function_b6407dd4(0);
			break;
		}
		case "no_game":
		case "hash_6e531fb9475df744":
		{
			break;
		}
		default:
		{
			/#
				snd::function_81fac19d(snd::function_d78e3644(), ("" + objective) + "");
			#/
			break;
		}
	}
}

/*
	Name: _targetname
	Namespace: namespace_a052577e
	Checksum: 0x2CA26051
	Offset: 0xB58
	Size: 0x43A
	Parameters: 2
	Flags: Linked, Private
*/
function private _targetname(ent, name)
{
	switch(name)
	{
		case "adler":
		{
			level.adler = ent;
			ent waittill(#"death");
			level.adler = undefined;
			break;
		}
		case "woods":
		{
			level.woods = ent;
			ent waittill(#"death");
			level.woods = undefined;
			break;
		}
		case "af_flyover":
		{
			plane = ent;
			var_d776868d = snd::play("veh_tkd_airstrip_flyover", plane);
			snd::function_f4f3a2a(var_d776868d, plane, 9);
			break;
		}
		case "cargo_plane":
		{
			level.cargo_plane = ent;
			ent waittill(#"death");
			level.cargo_plane = undefined;
			break;
		}
		case "cargo_plane_mover":
		{
			level.cargo_plane_mover = ent;
			ent waittill(#"death");
			level.cargo_plane_mover = undefined;
			break;
		}
		case "af_truck_plr":
		{
			level.var_5acf72ee = ent;
			function_b3fdcb06(level.var_5acf72ee, "tag_axel_front_up", "veh_tkd_chase_plr_jeep_high_lp");
			function_244835ac(level.var_5acf72ee, "veh_tkd_rcxd_deploy_tires_lp");
			ent waittill(#"death");
			level.var_5acf72ee = undefined;
			break;
		}
		case "rc_car_plr":
		{
			level.rc_car_plr = ent;
			level thread function_e8df4c70();
			ent waittill(#"death");
			level.rc_car_plr = undefined;
			break;
		}
		case "af_enemy_chase_veh":
		{
			level.af_enemy_chase_veh = snd::function_4b879845(level.af_enemy_chase_veh, ent);
			function_b3fdcb06(ent, "tag_axel_front_up", "veh_tkd_chase_npc_jeeps_high_lp");
			function_244835ac(ent, "veh_tkd_rcxd_deploy_tires_lp");
			ent waittill(#"death");
			level.af_enemy_chase_veh = snd::function_16b5f116(level.af_enemy_chase_veh, ent);
			break;
		}
		case "skid_veh":
		{
			function_b3fdcb06(ent, "tag_axel_front_up", "veh_tkd_skid_veh_high_lp");
			function_244835ac(ent, "veh_tkd_skid_veh_tires_skid_lp");
			level thread function_7142e76c(ent);
			break;
		}
		case "cargo_debris":
		{
			level thread cargo_debris(ent);
			break;
		}
		default:
		{
			/#
				snd::function_81fac19d(snd::function_d78e3644(), "" + snd::function_783b69(name, ""));
			#/
			break;
		}
	}
}

/*
	Name: _trigger
	Namespace: namespace_a052577e
	Checksum: 0xFC7716F7
	Offset: 0xFA0
	Size: 0x1C2
	Parameters: 3
	Flags: Linked, Private
*/
function private _trigger(player, trigger, var_ec80d14b)
{
	trigger_name = snd::function_ea2f17d1(var_ec80d14b.script_ambientroom, "$default");
	switch(trigger_name)
	{
		case "$default":
		{
			break;
		}
		case "hash_1be9f27129ae7a62":
		{
			break;
		}
		case "hash_4b729aa87d03cd":
		case "hash_11867574383ac22a":
		case "hash_1912faafb2f99437":
		{
			break;
		}
		case "hash_52c6ce5cc7e45cd":
		case "hash_137e57cafd9e1316":
		case "hash_34a277e453b641df":
		case "hash_3f3ff833c7fba2e7":
		case "hash_50ea2a1178720bb6":
		case "hash_5836480b992bf337":
		case "hash_6da66622baceb34e":
		case "hash_7cf32b3e3b7bd98b":
		{
			break;
		}
		case "hash_431834d37daaaf40":
		case "hash_5f996c7d961a6374":
		{
			break;
		}
		case "hash_d19cd1aa24166b3":
		{
			break;
		}
		default:
		{
			/#
				snd::function_81fac19d(snd::function_d78e3644(), ("" + trigger_name) + "");
			#/
			break;
		}
	}
}

/*
	Name: function_f2a2832d
	Namespace: namespace_a052577e
	Checksum: 0xE73C5AF
	Offset: 0x1170
	Size: 0x7CA
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f2a2832d(player, msg)
{
	/#
	#/
	switch(msg)
	{
		case "triton_on":
		{
			function_b6407dd4(1);
			break;
		}
		case "triton_off":
		{
			function_b6407dd4(0);
			break;
		}
		case "intro_trans_out":
		{
			level notify(#"intro_trans_out");
			break;
		}
		case "hash_443db59c2d746e0f":
		{
			function_5ea2c6e3("cp_takedown_bar_intro");
			break;
		}
		case "hash_1ef4e0d9441579d":
		{
			function_ed62c9c2("cp_takedown_bar_intro");
			break;
		}
		case "cp_takedown_raid_af_transition":
		{
			function_5ea2c6e3("cp_takedown_raid_af_transition");
			break;
		}
		case "cp_takedown_raid_af_transition_complete":
		{
			function_ed62c9c2("cp_takedown_raid_af_transition");
			break;
		}
		case "hit3_fadein":
		{
			thread function_8881654();
			break;
		}
		case "af_intro_camera_whoosh":
		{
			snd::play("evt_tkd_af_intro_camera_whoosh");
			break;
		}
		case "af_intro_done":
		{
			wait(5);
			level notify(#"hash_50385173feb854f0");
			break;
		}
		case "hash_1520ca717f2f90ed":
		{
			break;
		}
		case "snd_overlook_scene":
		{
			thread function_2f088c3f();
			thread function_9c9fad4e();
			break;
		}
		case "start_sniping":
		{
			level notify(#"start_sniping");
			break;
		}
		case "hash_1533b6e574c5cfe7":
		{
			thread function_204b1d87();
			thread function_2d5baabb();
			break;
		}
		case "hash_3620fe1626778dde":
		{
			level notify(#"hash_2501fef6c47895fa");
			break;
		}
		case "hash_1e58e46360c0a83b":
		{
			level notify(#"hash_1e58e46360c0a83b");
			function_5ea2c6e3("cp_tkdn_af_tarmac_combat", 1, 1);
			break;
		}
		case "af_truck_plr_in":
		{
			function_ed62c9c2("cp_tkdn_af_tarmac_combat", 4);
			function_5ea2c6e3("cp_tkdn_af_chase_mix", 4, 1);
			snd::play([1:"evt_tkd_chase_start_peel_out", 0:4], [1:"tag_axel_front_up", 0:level.var_5acf72ee]);
			break;
		}
		case "hash_55e0585ab6221a00":
		{
			function_5ea2c6e3("cp_tkdn_af_hill_plane", 0, 1);
			break;
		}
		case "hash_1bdccb03a5e24d52":
		{
			function_ed62c9c2("cp_tkdn_af_hill_plane", 2);
			break;
		}
		case "hash_706ce4bbfd6f3342":
		{
			break;
		}
		case "hash_5890389a725c1224":
		{
			break;
		}
		case "af_skid_starting":
		{
			thread function_41798e8d();
			break;
		}
		case "af_skid_complete":
		{
			function_ed62c9c2("cp_tkdn_af_chase_mix", 3);
			level notify(#"hash_accff44c369c030");
			break;
		}
		case "plane_idle":
		{
			thread function_2d8bbe54(0.5);
			break;
		}
		case "start_plane_rev":
		{
			break;
		}
		case "hash_164bf872d25545af":
		{
			level notify(#"hash_2b1ea816682de37d");
			level notify(#"hash_6f65948492627624");
			thread function_b5f89c52(level.cargo_plane);
			thread function_b5f89c52(level.var_5acf72ee);
			thread function_b5f89c52(level.rc_car_plr);
			function_ed62c9c2("cp_tkdn_af_chase_rcxd_mix", 0.25);
			level thread function_721eb243();
			break;
		}
		case "af_wreck":
		{
			break;
		}
		case "af_wreck_amb":
		{
			level thread af_wreck_amb();
			break;
		}
		case "af_wreck_amb_end":
		{
			level notify(#"af_wreck_amb_end");
			break;
		}
		case "end_fadeout":
		{
			thread function_4df43a5e();
			break;
		}
		case "unlock_all_takedownmus":
		{
			function_2cca7b47(0, #"hash_985a48664a3651b");
			function_2cca7b47(0, #"hash_985a58664a366ce");
			function_2cca7b47(0, #"hash_985a68664a36881");
			function_2cca7b47(0, #"hash_985a78664a36a34");
			function_2cca7b47(0, #"hash_985a88664a36be7");
			function_2cca7b47(0, #"hash_985a98664a36d9a");
			function_2cca7b47(0, #"hash_985aa8664a36f4d");
			break;
		}
		default:
		{
			/#
				snd::function_81fac19d(snd::function_d78e3644(), "" + snd::function_783b69(msg, ""));
			#/
			break;
		}
	}
}

/*
	Name: function_77da0ec2
	Namespace: namespace_a052577e
	Checksum: 0x30B3A0B7
	Offset: 0x1948
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function function_77da0ec2()
{
	/#
		self endon(#"death");
		self endon(#"hash_2caeecd393c68946");
		while(isdefined(self) && isdefined(self.origin) && isdefined(self.angles))
		{
			snd::function_81183b3(self.origin, 24, self.angles, (1, 1, 1), 1, 0, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: function_5f2fe011
	Namespace: namespace_a052577e
	Checksum: 0xF3C6A7FA
	Offset: 0x19E8
	Size: 0x1C2
	Parameters: 0
	Flags: None
*/
function function_5f2fe011()
{
	/#
		level notify(#"hash_35cd09591f62802f");
		level endon(#"hash_35cd09591f62802f");
		while(true)
		{
			if(snd::function_95c9af4b() >= 2)
			{
				foreach(var_15df3e17 in level.var_b9a192d2)
				{
					if(isdefined(var_15df3e17) && isdefined(var_15df3e17.var_90c86b97))
					{
						velocity = var_15df3e17.var_90c86b97 getvelocity();
						if(isvec(velocity))
						{
							speed = length(velocity);
							txt = "" + snd::function_d6053a8f(speed, 1);
							pos = var_15df3e17.origin + vectorscale((0, 0, 1), 6);
							snd::function_ac033c46(txt, pos, 0.333, "");
						}
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_b3fdcb06
	Namespace: namespace_a052577e
	Checksum: 0xAF579E21
	Offset: 0x1BB8
	Size: 0xCC
	Parameters: 3
	Flags: Linked
*/
function function_b3fdcb06(ent, var_9e542947, var_e03252b9)
{
	if(snd::function_a6779cbd(ent.var_726d44d2))
	{
		return;
	}
	ent.var_726d44d2 = snd::play(var_e03252b9, [1:var_9e542947, 0:ent]);
	snd::function_f4f3a2a(ent.var_726d44d2, ent);
	if(!isinarray(level.var_b9a192d2, ent.var_726d44d2))
	{
		level.var_b9a192d2[level.var_b9a192d2.size] = ent.var_726d44d2;
	}
}

/*
	Name: function_244835ac
	Namespace: namespace_a052577e
	Checksum: 0xEC521040
	Offset: 0x1C90
	Size: 0x1F4
	Parameters: 2
	Flags: Linked
*/
function function_244835ac(ent, var_7eaf9fa5)
{
	var_1cafb128 = [3:[1:"tag_wheel_back_right", 0:ent], 2:[1:"tag_wheel_back_left", 0:ent], 1:[1:"tag_wheel_front_right", 0:ent], 0:[1:"tag_wheel_front_left", 0:ent]];
	if(isarray(ent.var_f4728878) && ent.var_f4728878.size > 0)
	{
		return;
	}
	ent.var_f4728878 = [];
	foreach(var_60213bf0 in var_1cafb128)
	{
		var_d3d66b01 = snd::play(var_7eaf9fa5, var_60213bf0);
		snd::function_f4f3a2a(var_d3d66b01, ent);
		ent.var_f4728878[ent.var_f4728878.size] = var_d3d66b01;
		if(!isinarray(level.var_b9a192d2, var_d3d66b01))
		{
			level.var_b9a192d2[level.var_b9a192d2.size] = var_d3d66b01;
		}
	}
}

/*
	Name: function_d942b1c8
	Namespace: namespace_a052577e
	Checksum: 0x74E4D439
	Offset: 0x1E90
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function function_d942b1c8(ent, var_9e542947, sndalias)
{
	if(snd::function_a6779cbd(ent.var_726d44d2))
	{
		return;
	}
	var_5b1e99b6 = [1:var_9e542947, 0:ent];
	ent.var_726d44d2 = snd::play(sndalias, var_5b1e99b6);
	snd::function_f4f3a2a(ent.var_726d44d2, ent);
	if(!isinarray(level.var_b9a192d2, ent.var_726d44d2))
	{
		level.var_b9a192d2[level.var_b9a192d2.size] = ent.var_726d44d2;
	}
}

/*
	Name: function_721eb243
	Namespace: namespace_a052577e
	Checksum: 0x81B1E977
	Offset: 0x1F78
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_721eb243(fade_out)
{
	if(!isdefined(fade_out))
	{
		fade_out = 0.5;
	}
	arrayremovevalue(level.var_b9a192d2, undefined);
	foreach(var_15df3e17 in level.var_b9a192d2)
	{
		snd::stop(var_15df3e17, fade_out);
	}
	level.var_b9a192d2 = [];
}

/*
	Name: function_8881654
	Namespace: namespace_a052577e
	Checksum: 0x64A6B47B
	Offset: 0x2058
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function function_8881654()
{
	audio::snd_set_snapshot("cp_tkdn_hit3_intro_fadein");
	wait(20);
	level notify(#"hash_27298c361adda6c1");
}

/*
	Name: function_2f088c3f
	Namespace: namespace_a052577e
	Checksum: 0x5F1D8866
	Offset: 0x2098
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_2f088c3f()
{
	wait(5);
	function_5ea2c6e3("cp_tkdn_af_hill");
	level waittill(#"start_sniping");
	function_ed62c9c2("cp_tkdn_af_hill");
}

/*
	Name: function_9c9fad4e
	Namespace: namespace_a052577e
	Checksum: 0xE15D9736
	Offset: 0x20F8
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_9c9fad4e()
{
	level endoncallback(&function_d111fa29, #"start_sniping");
	player = getlocalplayers()[0];
	player endon(#"death");
	function_5ea2c6e3("cp_tkdn_af_hill_binoculars", 0, 0);
	setsoundcontext("vehicle", "interior");
	while(true)
	{
		var_bcebdd89 = undefined;
		var_bcebdd89 = player waittill(#"hash_2b753d505c6182c");
		function_672403ca("cp_tkdn_af_hill_binoculars", float(player function_8e4cd43b()) / 1000, var_bcebdd89.pct);
	}
}

/*
	Name: function_d111fa29
	Namespace: namespace_a052577e
	Checksum: 0x37B3C421
	Offset: 0x2230
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_d111fa29(str_notify)
{
	function_ed62c9c2("cp_tkdn_af_hill_binoculars");
}

/*
	Name: function_2d5baabb
	Namespace: namespace_a052577e
	Checksum: 0xFC5C3D84
	Offset: 0x2260
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_2d5baabb()
{
	function_5ea2c6e3("cp_tkdn_af_hill_bullettime");
	level waittill(#"hash_2501fef6c47895fa");
	function_ed62c9c2("cp_tkdn_af_hill_bullettime", 1);
}

/*
	Name: function_41798e8d
	Namespace: namespace_a052577e
	Checksum: 0xF21AF996
	Offset: 0x22C0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_41798e8d()
{
	function_5ea2c6e3("cp_tkdn_af_skid");
	level waittill(#"hash_accff44c369c030");
	function_ed62c9c2("cp_tkdn_af_skid");
}

/*
	Name: function_4df43a5e
	Namespace: namespace_a052577e
	Checksum: 0x136C2AA6
	Offset: 0x2318
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_4df43a5e()
{
	function_5ea2c6e3("cp_tkdn_end_fadeout");
}

/*
	Name: function_a43c0d2c
	Namespace: namespace_a052577e
	Checksum: 0x33D878FD
	Offset: 0x2340
	Size: 0x116
	Parameters: 0
	Flags: Linked
*/
function function_a43c0d2c()
{
	var_1246faee = (-49666.6, -55444, -25160.2);
	var_2a88513c = (-49790, -55098, -25110.7);
	walla = snd::play("emt_tkd_walla_plane_workers_lp", var_1246faee);
	var_e497a49e = snd::play("emt_tkd_cargo_loading_vehicles_lp", var_2a88513c);
	level waittill(#"hash_1e58e46360c0a83b");
	snd::stop(walla, 1);
	snd::stop(var_e497a49e, 1);
	wait(1.1);
	var_913d2991 = snd::play("emt_tkd_walla_runway_panic", var_1246faee);
}

/*
	Name: function_5be14e40
	Namespace: namespace_a052577e
	Checksum: 0xD2BFD4
	Offset: 0x2460
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function function_5be14e40()
{
	while(!isdefined(level.cargo_plane))
	{
		waitframe(1);
	}
}

/*
	Name: function_53c8ee41
	Namespace: namespace_a052577e
	Checksum: 0xA9E2AFC
	Offset: 0x2488
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function function_53c8ee41()
{
	while(!isdefined(level.cargo_plane_mover))
	{
		waitframe(1);
	}
}

/*
	Name: function_955f4842
	Namespace: namespace_a052577e
	Checksum: 0xDDD7A1A4
	Offset: 0x24B0
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_955f4842()
{
	if(is_true(level.var_1c393e86))
	{
		return;
	}
	level.var_1c393e86 = 1;
	function_5be14e40();
	start = snd::play("veh_tkd_af_cargo_plane_start", [1:(288, 0, 108), 0:level.cargo_plane]);
	thread function_2d8bbe54(3);
}

/*
	Name: function_2d8bbe54
	Namespace: namespace_a052577e
	Checksum: 0x55B5CA38
	Offset: 0x2560
	Size: 0x18C
	Parameters: 1
	Flags: Linked
*/
function function_2d8bbe54(wait_time)
{
	if(is_true(level.var_3f10e8f2))
	{
		return;
	}
	level.var_3f10e8f2 = 1;
	function_5be14e40();
	wait_time = snd::function_ea2f17d1(wait_time, 0.5);
	level.var_2d8bbe54 = snd::play("veh_tkd_af_cargo_plane_idle_lp", [1:(288, 0, 108), 0:level.cargo_plane]);
	snd::function_db78159d(level.var_2d8bbe54, 0);
	snd::set_pitch(level.var_2d8bbe54, 1);
	wait(wait_time);
	snd::function_db78159d(level.var_2d8bbe54, 1, 0.5);
	level waittill(#"hash_352bb96b1643631");
	snd::set_pitch(level.var_2d8bbe54, 2, 1.5);
	snd::stop(level.var_2d8bbe54, 5);
}

/*
	Name: function_e9cf99c1
	Namespace: namespace_a052577e
	Checksum: 0x9F52C787
	Offset: 0x26F8
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function function_e9cf99c1()
{
	if(is_true(level.var_b2f77aec))
	{
		return;
	}
	level.var_b2f77aec = 1;
	function_5be14e40();
	snd::play("veh_tkd_af_cargo_plane_accelerate", [1:(288, 0, 108), 0:level.cargo_plane]);
	level notify(#"hash_5b80aed93a868b80");
}

/*
	Name: function_ad605463
	Namespace: namespace_a052577e
	Checksum: 0xE3478E1
	Offset: 0x2798
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_ad605463()
{
	if(is_true(level.var_72cef6cb))
	{
		return;
	}
	level.var_72cef6cb = 1;
	function_53c8ee41();
	snd::play("veh_tkd_af_cargo_plane_takeoff", [1:(288, 0, 108), 0:level.cargo_plane_mover]);
	waitframe(3);
	level notify(#"hash_352bb96b1643631");
}

/*
	Name: function_d1b165f5
	Namespace: namespace_a052577e
	Checksum: 0x2F7C29BE
	Offset: 0x2840
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_d1b165f5()
{
	if(is_true(level.var_ea29c588))
	{
		return;
	}
	level.var_ea29c588 = 1;
	function_53c8ee41();
	level thread function_b3fdcb06(level.cargo_plane_mover, (288, 0, 108), "veh_tkd_af_cargo_plane_high_lyr1_lp");
}

/*
	Name: function_204b1d87
	Namespace: namespace_a052577e
	Checksum: 0x21944409
	Offset: 0x28C0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_204b1d87()
{
	snd::play("evt_bullettime_shot_main");
}

/*
	Name: function_4e08ef9b
	Namespace: namespace_a052577e
	Checksum: 0xF1DAC20B
	Offset: 0x28E8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_4e08ef9b()
{
	wait(4);
	snd::play("evt_tkd_chase_start_peel_out");
}

/*
	Name: function_b5f89c52
	Namespace: namespace_a052577e
	Checksum: 0xA892BDE9
	Offset: 0x2918
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function function_b5f89c52(veh)
{
	if(isdefined(veh) && isdefined(veh.var_e59bc220))
	{
		veh notify(#"hash_79d732c6bc0d7bd1");
		snd::stop(veh.var_e59bc220, 0.5);
		veh.var_e59bc220 = undefined;
	}
}

/*
	Name: function_81191c8a
	Namespace: namespace_a052577e
	Checksum: 0xDBAAC761
	Offset: 0x2988
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function function_81191c8a()
{
	while(!isdefined(level.rc_car_plr))
	{
		waitframe(1);
	}
}

/*
	Name: function_e8df4c70
	Namespace: namespace_a052577e
	Checksum: 0xFE6DCC95
	Offset: 0x29B0
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_e8df4c70()
{
	if(is_true(level.var_b7589e37))
	{
		return;
	}
	level.var_b7589e37 = 1;
	function_81191c8a();
	snd::play([2:0, 1:"wpn_tkd_rcxd_deploy_drop", 0:1.1], level.rc_car_plr);
	function_5ea2c6e3("cp_tkdn_af_chase_rcxd_mix", 1, 1);
	function_d942b1c8(level.rc_car_plr, "tag_suspension_front", "wpn_tkd_rcxd_veh_high_lp");
	function_ed62c9c2("cp_tkdn_af_rc_chase_tires", 3);
}

/*
	Name: function_b233d29e
	Namespace: namespace_a052577e
	Checksum: 0xD52A1841
	Offset: 0x2AB8
	Size: 0x82
	Parameters: 2
	Flags: Linked
*/
function function_b233d29e(wait_time, fade_time)
{
	if(!isdefined(wait_time))
	{
		wait_time = 1;
	}
	if(!isdefined(fade_time))
	{
		fade_time = 0;
	}
	var_f3c1505b = snd::play("wpn_tkd_rcxd_static_fuzz_lp");
	wait(wait_time);
	snd::stop(var_f3c1505b, fade_time);
	var_f3c1505b = undefined;
}

/*
	Name: function_7142e76c
	Namespace: namespace_a052577e
	Checksum: 0x425B2407
	Offset: 0x2B48
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function function_7142e76c(veh)
{
	level endon(#"hash_2b1ea816682de37d");
	while(isentity(veh))
	{
		snd::play("veh_tkd_chase_npc_jeeps_skid_stop", [1:vectorscale((0, 0, 1), 9), 0:veh]);
		wait(1);
	}
}

/*
	Name: cargo_debris
	Namespace: namespace_a052577e
	Checksum: 0x105BA8EB
	Offset: 0x2BD0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function cargo_debris(ent)
{
	if(!isdefined(ent.var_a107d844))
	{
		var_a107d844 = snd::play("phy_tkd_prop_vel_debris_lp", ent);
		snd::function_f4f3a2a(var_a107d844, ent);
	}
}

/*
	Name: af_wreck_amb
	Namespace: namespace_a052577e
	Checksum: 0x1A79C1C2
	Offset: 0x2C30
	Size: 0x254
	Parameters: 0
	Flags: Linked
*/
function af_wreck_amb()
{
	var_a27674c9 = snd::play("emt_tkd_wreck_fire_01_lp", (10461, -54901, -25182));
	var_d96e62bc = snd::play("emt_tkd_wreck_fire_02_lp", (10738, -54523, -25136));
	var_c6a73d2e = snd::play("emt_tkd_wreck_fire_03_lp", (10648, -55102, -25155));
	metal = snd::play("emt_tkd_wreck_metal_lp", (10261, -54762, -25082));
	var_47cd46cf = snd::play("emt_tkd_wreck_sirens_01_lp", (10491, -53575, -25003));
	var_630e7d51 = snd::play("emt_tkd_wreck_sirens_02_lp", (15160, -54833, -24566));
	var_f07a182a = snd::play("emt_tkd_wreck_sirens_03_lp", (-4034, -49059, -24440));
	level waittill(#"af_wreck_amb_end");
	snd::stop(var_a27674c9, 3);
	snd::stop(var_d96e62bc, 3);
	snd::stop(var_c6a73d2e, 3);
	snd::stop(metal, 3);
	snd::stop(var_47cd46cf, 3);
	snd::stop(var_630e7d51, 3);
	snd::stop(var_f07a182a, 3);
}

