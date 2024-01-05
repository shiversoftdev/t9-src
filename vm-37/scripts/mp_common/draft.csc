#using scripts\killstreaks\killstreak_detect.csc;
#using scripts\core_common\array_shared.csc;
#using script_13da4e6b98ca81a1;
#using scripts\core_common\battlechatter.csc;
#using scripts\core_common\player\player_role.csc;
#using scripts\core_common\character_customization.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\serverfield_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace draft;

/*
	Name: __init__system__
	Namespace: draft
	Checksum: 0x81CC57AC
	Offset: 0x2718
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"draft", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: draft
	Checksum: 0x482696E2
	Offset: 0x2760
	Size: 0xA48
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "draft", 1, 3, "int", &handledraftstage, 0, 0);
	clientfield::register_clientuimodel("PositionDraft.stage", #"hash_6797d4cd7534952f", #"stage", 1, 4, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("PositionDraft.autoSelected", #"hash_6797d4cd7534952f", #"autoselected", 1, 1, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("PositionDraft.cooldown", #"hash_6797d4cd7534952f", #"cooldown", 1, 5, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("PositionDraft.timeRemaining", #"hash_512fa2b9d2d44eda", #"timeremaining", 1, 7, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("PositionDraft.waitingForPlayers", #"hash_512fa2b9d2d44eda", #"hash_136dc90b98ce611f", 1, 1, "int", undefined, 0, 0);
	serverfield::register("PositionDraft.uiLoaded", 1, 1, "int");
	level.var_a968beb = [];
	level.var_a968beb[0] = #"none";
	level.var_a968beb[1] = #"allies";
	level.var_a968beb[2] = #"axis";
	level.var_8cb8d474 = [];
	level.var_8cb8d474[#"none"] = [];
	level.var_8cb8d474[#"none"][0] = #"hash_6eb882c3b52cdbb3";
	level.var_8cb8d474[#"none"][2] = #"hash_6eb881c3b52cda00";
	level.var_8cb8d474[#"none"][1] = #"hash_6eb884c3b52cdf19";
	level.var_8cb8d474[#"none"][3] = #"hash_6eb883c3b52cdd66";
	level.var_8cb8d474[#"none"][4] = #"hash_6eb886c3b52ce27f";
	level.var_8cb8d474[#"allies"] = [];
	level.var_8cb8d474[#"allies"][0] = #"hash_3de928cb4eca5c62";
	level.var_8cb8d474[#"allies"][2] = #"hash_14207ac052338b77";
	level.var_8cb8d474[#"allies"][1] = #"hash_2da80819aca61444";
	level.var_8cb8d474[#"allies"][3] = #"hash_477e5761fdabcb19";
	level.var_8cb8d474[#"allies"][4] = #"hash_42145b8ebbfee26";
	level.var_8cb8d474[#"axis"] = [];
	level.var_8cb8d474[#"axis"][0] = #"hash_3b2607cfca030035";
	level.var_8cb8d474[#"axis"][2] = #"hash_253fd3975ea7547c";
	level.var_8cb8d474[#"axis"][1] = #"hash_1edd5ff5456df7f7";
	level.var_8cb8d474[#"axis"][3] = #"hash_61f816d9a00b29c6";
	level.var_8cb8d474[#"axis"][4] = #"hash_753a11f84aa8941";
	level.var_a72b250f = [];
	level.var_a72b250f[#"none"] = #"hash_24d789c80dba10e6";
	level.var_a72b250f[#"allies"] = #"hash_e2e52f9cab15dce";
	level.var_a72b250f[#"axis"] = #"hash_50c9ef9e41155cf9";
	level.var_a72b250f[#"spectator"] = #"hash_e2e52f9cab15dce";
	level.draftstructs = [];
	level.draftstructs[#"none"] = #"draft_team_struct";
	level.draftstructs[#"allies"] = #"hash_4fb87afe0caa6177";
	level.draftstructs[#"axis"] = #"hash_700492f71a083a7c";
	level.draftstructs[#"spectator"] = #"hash_4fb87afe0caa6177";
	level.var_1f0933dc = [];
	level.var_1f0933dc[#"allies"] = "mp_draft_lights_allies";
	level.var_1f0933dc[#"axis"] = "mp_draft_lights_axis";
	level.var_eeee7da4 = undefined;
	level.playerscriptstructs = [];
	level.playerscriptstructs[#"none"] = [];
	level.playerscriptstructs[#"allies"] = [];
	level.playerscriptstructs[#"axis"] = [];
	for(i = 0; i < 5; i++)
	{
		level.playerscriptstructs[#"none"][i] = struct::get(level.var_8cb8d474[#"none"][i]);
		level.playerscriptstructs[#"allies"][i] = struct::get(level.var_8cb8d474[#"allies"][i]);
		level.playerscriptstructs[#"axis"][i] = struct::get(level.var_8cb8d474[#"axis"][i]);
	}
	level thread function_ca03ab69();
	level thread function_91858511();
	level.draftstage = 0;
	level.draftcharacters = [];
	level.draftactive = [];
	level.var_368aaeb9 = [];
	level.var_df72fe54 = [];
	level.draftintroplayed = [];
	for(i = 0; i < getmaxlocalclients(); i++)
	{
		level.draftactive[i] = 0;
		level.draftintroplayed[i] = 0;
		level.var_368aaeb9[i] = "";
		level.var_df72fe54[i] = "";
		for(t = 0; t < level.var_a968beb.size; t++)
		{
			level.draftcharacters[i][level.var_a968beb[t]] = [];
		}
	}
	level.var_8c099032 = getgametypesetting(#"draftenabled") && !getroundsplayed(0);
	level.var_f35699bc = [#"special_ballisticknife_t8_dw_dw":"melee_alt", #"special_ballisticknife_t8_dw":"melee_alt", #"melee_cutlass_t8":"melee_alt", #"melee_club_t8":"melee_alt", #"melee_demohammer_t8":"melee_alt", #"melee_coinbag_t8":"melee_alt", #"melee_secretsanta_t8":"melee_alt", #"melee_slaybell_t8":"melee_alt"];
}

/*
	Name: function_c4dfe16e
	Namespace: draft
	Checksum: 0x5178E7BC
	Offset: 0x31B0
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_c4dfe16e(localclientnum)
{
	localplayer = function_5c10bd79(localclientnum);
	isteambased = function_b2272884();
	if(!isteambased)
	{
		return #"allies";
	}
	return localplayer.team;
}

/*
	Name: function_75442e78
	Namespace: draft
	Checksum: 0x84E3C40E
	Offset: 0x3228
	Size: 0x62
	Parameters: 2
	Flags: None
*/
function function_75442e78(team, index)
{
	if(!isdefined(level.var_8cb8d474[team]))
	{
		team = #"none";
	}
	return struct::get(level.var_8cb8d474[team][index]);
}

/*
	Name: play_intro_cinematic
	Namespace: draft
	Checksum: 0x4FAF0F07
	Offset: 0x3298
	Size: 0x25A
	Parameters: 1
	Flags: Linked
*/
function play_intro_cinematic(localclientnum)
{
	if(is_true(level.draftintroplayed[localclientnum]))
	{
		return 0;
	}
	team = function_c4dfe16e(localclientnum);
	if(isdefined(level.var_a72b250f[team]))
	{
		var_17e3fc35 = struct::get(level.var_a72b250f[team]);
		if(isdefined(var_17e3fc35) && isdefined(level.var_99ef4320) && isdefined(level.var_99ef4320[team]))
		{
			level.var_368aaeb9[localclientnum] = "cam_draft_intro";
			playmaincamxcam(localclientnum, level.var_99ef4320[team], 0, "cam_draft_intro", "", var_17e3fc35.origin, var_17e3fc35.angles);
			duration = getcamanimtime(level.var_99ef4320[team]);
			wait(float(duration) / 1000);
			level.draftintroplayed[localclientnum] = 1;
		}
	}
	setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"hash_6797d4cd7534952f"), "introPlayed"), 1);
	if(team == #"spectator")
	{
		function_532dfc0b(localclientnum, 0);
	}
	else
	{
		function_e79c182b(localclientnum, 0);
		if(isdefined(level.var_a72b250f[team]))
		{
			function_26c00d58(localclientnum);
		}
	}
	return is_true(level.draftintroplayed[localclientnum]);
}

/*
	Name: show_cam
	Namespace: draft
	Checksum: 0x63075470
	Offset: 0x3500
	Size: 0x1A4
	Parameters: 4
	Flags: Linked
*/
function show_cam(localclientnum, xcam, animname, lerpduration)
{
	if(is_true(level.var_84e5adfd))
	{
		return;
	}
	if(!isdefined(xcam) || !isdefined(animname))
	{
		return;
	}
	if(isdefined(level.var_368aaeb9[localclientnum]) && level.var_368aaeb9[localclientnum] == animname && isdefined(level.var_df72fe54[localclientnum]) && level.var_df72fe54[localclientnum] == xcam)
	{
		return;
	}
	if(codcaster::function_b8fe9b52(localclientnum))
	{
		lerpduration = 0;
	}
	team = function_c4dfe16e(localclientnum);
	if(isdefined(level.draftstructs[team]))
	{
		draftstruct = struct::get(level.draftstructs[team], "targetname");
		if(isdefined(draftstruct))
		{
			playmaincamxcam(localclientnum, xcam, lerpduration, animname, "", draftstruct.origin, draftstruct.angles);
			level.var_368aaeb9[localclientnum] = animname;
			level.var_df72fe54[localclientnum] = xcam;
		}
	}
}

/*
	Name: stop_cameras
	Namespace: draft
	Checksum: 0x30471E74
	Offset: 0x36B0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function stop_cameras(localclientnum)
{
	stopmaincamxcam(localclientnum);
	level.var_368aaeb9[localclientnum] = undefined;
	level.var_df72fe54[localclientnum] = undefined;
}

/*
	Name: function_532dfc0b
	Namespace: draft
	Checksum: 0x31E85E2F
	Offset: 0x3700
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_532dfc0b(localclientnum, lerpduration)
{
	show_cam(localclientnum, level.var_482af62e, "cam_draft_zoom", lerpduration);
}

/*
	Name: function_e79c182b
	Namespace: draft
	Checksum: 0xEFB38719
	Offset: 0x3748
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_e79c182b(localclientnum, lerpduration)
{
	show_cam(localclientnum, level.var_bbb8810e, "cam_draft_ingame", lerpduration);
}

/*
	Name: function_fccaf2ed
	Namespace: draft
	Checksum: 0x1D4DC6A
	Offset: 0x3790
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_fccaf2ed(localclientnum, lerpduration)
{
	show_cam(localclientnum, "ui_cam_frontend_loadout_mp", "cam_loadout_mp", lerpduration);
}

/*
	Name: enable_lights
	Namespace: draft
	Checksum: 0xA2498F89
	Offset: 0x37D8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function enable_lights(localclientnum)
{
	team = function_c4dfe16e(localclientnum);
	if(isdefined(level.var_1f0933dc[team]))
	{
		level.var_eeee7da4 = level.var_1f0933dc[team];
		playradiantexploder(localclientnum, level.var_eeee7da4);
	}
}

/*
	Name: function_2c486f35
	Namespace: draft
	Checksum: 0x5D20B124
	Offset: 0x3860
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function function_2c486f35(localclientnum)
{
	if(isdefined(level.var_eeee7da4))
	{
		killradiantexploder(localclientnum, level.var_eeee7da4);
		level.var_eeee7da4 = undefined;
	}
}

/*
	Name: handledraftstage
	Namespace: draft
	Checksum: 0x2906EF10
	Offset: 0x38B0
	Size: 0x10C
	Parameters: 7
	Flags: Linked
*/
function handledraftstage(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(bwastimejump))
	{
		var_a5976120 = createuimodel(function_1df4c3b0(binitialsnap, #"hash_6797d4cd7534952f"), "stage");
		setuimodelvalue(var_a5976120, bwastimejump);
		level.draftstage = bwastimejump;
		if(bwastimejump != 0)
		{
			level.var_8c099032 = undefined;
		}
	}
	if(fieldname != 0 && bwastimejump == 0)
	{
		killstreak_detect::function_3eff7815(binitialsnap);
		killstreak_detect::function_32c8b999(binitialsnap);
	}
}

/*
	Name: function_799e0ac1
	Namespace: draft
	Checksum: 0xE912821D
	Offset: 0x39C8
	Size: 0xE2
	Parameters: 3
	Flags: Linked
*/
function function_799e0ac1(localclientnum, draftcharacter, masked)
{
	if(masked && !(is_true([[ draftcharacter ]]->function_82e05d64().masked)))
	{
		[[ draftcharacter ]]->function_27945cb8(1);
		[[ draftcharacter ]]->function_82e05d64().masked = 1;
	}
	else if(!masked && is_true([[ draftcharacter ]]->function_82e05d64().masked))
	{
		[[ draftcharacter ]]->function_27945cb8(0);
		[[ draftcharacter ]]->function_82e05d64().masked = 0;
	}
}

/*
	Name: function_236a944e
	Namespace: draft
	Checksum: 0x305A52A1
	Offset: 0x3AB8
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_236a944e(localclientnum)
{
	team = function_c4dfe16e(localclientnum);
	foreach(character in level.draftcharacters[localclientnum][team])
	{
		if([[ character ]]->function_82e05d64().showmodel)
		{
			[[ character ]]->show_model();
		}
	}
}

/*
	Name: function_26c00d58
	Namespace: draft
	Checksum: 0xC51FF20C
	Offset: 0x3B90
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_26c00d58(localclientnum)
{
	team = function_c4dfe16e(localclientnum);
	foreach(character in level.draftcharacters[localclientnum][team])
	{
		[[ character ]]->hide_model();
	}
}

/*
	Name: function_b139ecfb
	Namespace: draft
	Checksum: 0x4F14B352
	Offset: 0x3C50
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function function_b139ecfb(localclientnum)
{
	team = function_c4dfe16e(localclientnum);
	for(i = 0; i < level.draftcharacters[localclientnum][team].size; i++)
	{
		character = level.draftcharacters[localclientnum][team][i];
		var_2d0192e5 = [[ character ]]->function_82e05d64();
		if(var_2d0192e5.islocalclient && var_2d0192e5.showmodel)
		{
			[[ character ]]->show_model();
			continue;
		}
		[[ character ]]->hide_model();
	}
}

/*
	Name: function_1cf2437c
	Namespace: draft
	Checksum: 0xE8965377
	Offset: 0x3D38
	Size: 0xDC
	Parameters: 4
	Flags: Linked
*/
function function_1cf2437c(localclientnum, draftcharacter, var_c0286f82, var_121d6e9a)
{
	if(!isdefined([[ var_121d6e9a ]]->function_82e05d64().player))
	{
		return;
	}
	if(([[ var_121d6e9a ]]->function_82e05d64().localclientnum) === var_c0286f82 && isdefined([[ var_121d6e9a ]]->function_82e05d64().var_c018da16) && player_role::is_valid([[ var_121d6e9a ]]->function_82e05d64().var_c018da16.charactertype))
	{
		[[ var_121d6e9a ]]->function_82e05d64().player battlechatter::play_dialog("characterSelect", var_c0286f82);
	}
}

/*
	Name: function_bb0565d0
	Namespace: draft
	Checksum: 0x182DF7B3
	Offset: 0x3E20
	Size: 0x17BC
	Parameters: 1
	Flags: Linked
*/
function function_bb0565d0(var_de58f286)
{
	var_e78b2a99 = "default";
	weapon = var_de58f286.activeweapon;
	if(isdefined(weapon))
	{
		weapon_group = function_e2703c27(weapon);
		if(isdefined(level.var_f35699bc[weapon.name]))
		{
			var_e78b2a99 = level.var_f35699bc[weapon.name];
		}
		else
		{
			if(weapon_group == #"")
			{
				var_e78b2a99 = "brawler";
				dualwield = getweapon(#"smg_handling_t8_dw");
				if(weapon.name == dualwield.name)
				{
					var_e78b2a99 = "pistol";
				}
			}
			else
			{
				if(weapon_group == #"weapon_launcher" || weapon_group == #"weapon_launcher_alt")
				{
					var_e78b2a99 = "launcher";
				}
				else
				{
					if(weapon_group == #"weapon_pistol" || weapon_group == #"weapon_pistol_dw")
					{
						var_e78b2a99 = "pistol";
					}
					else
					{
						if(weapon_group == #"weapon_smg")
						{
							var_e78b2a99 = "smg";
						}
						else if(weapon_group == #"weapon_knife")
						{
							var_e78b2a99 = "melee";
						}
					}
				}
			}
		}
	}
	return associativearray(#"default", associativearray(#"select", associativearray(#"male", "pb_rifle_male_draft_ch_select_3", #"female", "pb_rifle_fem_draft_ch_select_3"), #"hash_6eaac8719751cb14", associativearray(#"male", "pb_rifle_male_draft_select_to_preready_3", #"female", "pb_rifle_fem_draft_select_to_preready_3"), #"hash_2fe61241a25ee67c", associativearray(#"male", "pb_rifle_male_draft_preready_to_select_3", #"female", "pb_rifle_fem_draft_preready_to_select_3"), #"preready", associativearray(#"male", array("pb_rifle_male_draft_preready_1", "pb_rifle_male_draft_preready_2", "pb_rifle_male_draft_preready_3", "pb_rifle_male_draft_preready_4", "pb_rifle_male_draft_preready_5"), #"female", array("pb_rifle_fem_draft_preready_1", "pb_rifle_fem_draft_preready_2", "pb_rifle_fem_draft_preready_3", "pb_rifle_fem_draft_preready_4", "pb_rifle_fem_draft_preready_5")), #"ready", associativearray(#"male", array("pb_rifle_male_draft_transition_1", "pb_rifle_male_draft_transition_2", "pb_rifle_male_draft_transition_3", "pb_rifle_male_draft_transition_4", "pb_rifle_male_draft_transition_5"), #"female", array("pb_rifle_fem_draft_transition_1", "pb_rifle_fem_draft_transition_2", "pb_rifle_fem_draft_transition_3", "pb_rifle_fem_draft_transition_4", "pb_rifle_fem_draft_transition_5")), #"readyidle", associativearray(#"male", array("pb_rifle_male_draft_readyup_1", "pb_rifle_male_draft_readyup_2", "pb_rifle_male_draft_readyup_3", "pb_rifle_male_draft_readyup_4", "pb_rifle_male_draft_readyup_5"), #"female", array("pb_rifle_fem_draft_readyup_1", "pb_rifle_fem_draft_readyup_2", "pb_rifle_fem_draft_readyup_3", "pb_rifle_fem_draft_readyup_4", "pb_rifle_fem_draft_readyup_5"))), #"brawler", associativearray(#"select", associativearray(#"male", "pb_brawler_male_draft_idle_ch_select_3", #"female", "pb_brawler_fem_draft_idle_ch_select_3"), #"hash_6eaac8719751cb14", associativearray(#"male", "pb_brawler_male_draft_select_to_preready_3", #"female", "pb_brawler_fem_draft_select_to_preready_3"), #"hash_2fe61241a25ee67c", associativearray(#"male", "pb_brawler_male_draft_preready_to_select_3", #"female", "pb_brawler_fem_draft_preready_to_select_3"), #"preready", associativearray(#"male", array("pb_brawler_male_draft_idle_preready1", "pb_brawler_male_draft_idle_preready2", "pb_brawler_male_draft_idle_preready3", "pb_brawler_male_draft_idle_preready4", "pb_brawler_male_draft_idle_preready5"), #"female", array("pb_brawler_fem_draft_idle_preready1", "pb_brawler_fem_draft_idle_preready2", "pb_brawler_fem_draft_idle_preready3", "pb_brawler_fem_draft_idle_preready4", "pb_brawler_fem_draft_idle_preready5")), #"ready", associativearray(#"male", array("pb_brawler_male_draft_idle_transition_1", "pb_brawler_male_draft_idle_transition_2", "pb_brawler_male_draft_idle_transition_3", "pb_brawler_male_draft_idle_transition_4", "pb_brawler_male_draft_idle_transition_5"), #"female", array("pb_brawler_fem_draft_idle_transition_1", "pb_brawler_fem_draft_idle_transition_2", "pb_brawler_fem_draft_idle_transition_3", "pb_brawler_fem_draft_idle_transition_4", "pb_brawler_fem_draft_idle_transition_5")), #"readyidle", associativearray(#"male", array("pb_brawler_male_draft_readyup_1", "pb_brawler_male_draft_readyup_2", "pb_brawler_male_draft_readyup_3", "pb_brawler_male_draft_readyup_4", "pb_brawler_male_draft_readyup_5"), #"female", array("pb_brawler_fem_draft_readyup_1", "pb_brawler_fem_draft_readyup_2", "pb_brawler_fem_draft_readyup_3", "pb_brawler_fem_draft_readyup_4", "pb_brawler_fem_draft_readyup_5"))), #"melee", associativearray(#"select", associativearray(#"male", "pb_melee_male_draft_ch_select_3", #"female", "pb_melee_fem_draft_ch_select_3"), #"hash_6eaac8719751cb14", associativearray(#"male", "pb_melee_male_draft_select_to_preready_3", #"female", "pb_melee_fem_draft_select_to_preready_3"), #"hash_2fe61241a25ee67c", associativearray(#"male", "pb_melee_male_draft_preready_to_select_3", #"female", "pb_melee_fem_draft_preready_to_select_3"), #"preready", associativearray(#"male", array("pb_melee_male_draft_preready_1", "pb_melee_male_draft_preready_2", "pb_melee_male_draft_preready_3", "pb_melee_male_draft_preready_4", "pb_melee_male_draft_preready_5"), #"female", array("pb_melee_fem_draft_preready_1", "pb_melee_fem_draft_preready_2", "pb_melee_fem_draft_preready_3", "pb_melee_fem_draft_preready_4", "pb_melee_fem_draft_preready_5")), #"ready", associativearray(#"male", array("pb_melee_male_draft_transition_1", "pb_melee_male_draft_transition_2", "pb_melee_male_draft_transition_3", "pb_melee_male_draft_transition_4", "pb_melee_male_draft_transition_5"), #"female", array("pb_melee_fem_draft_transition_1", "pb_melee_fem_draft_transition_2", "pb_melee_fem_draft_transition_3", "pb_melee_fem_draft_transition_4", "pb_melee_fem_draft_transition_5")), #"readyidle", associativearray(#"male", array("pb_melee_male_draft_readyup_1", "pb_melee_male_draft_readyup_2", "pb_melee_male_draft_readyup_3", "pb_melee_male_draft_readyup_4", "pb_melee_male_draft_readyup_5"), #"female", array("pb_melee_fem_draft_readyup_1", "pb_melee_fem_draft_readyup_2", "pb_melee_fem_draft_readyup_3", "pb_melee_fem_draft_readyup_4", "pb_melee_fem_draft_readyup_5"))), #"melee_alt", associativearray(#"select", associativearray(#"male", "pb_melee_alt_male_draft_ch_select_3", #"female", "pb_melee_alt_fem_draft_ch_select_3"), #"hash_6eaac8719751cb14", associativearray(#"male", "pb_melee_alt_male_draft_select_to_preready_3", #"female", "pb_melee_alt_fem_draft_select_to_preready_3"), #"hash_2fe61241a25ee67c", associativearray(#"male", "pb_melee_alt_male_draft_preready_to_select_3", #"female", "pb_melee_alt_fem_draft_preready_to_select_3"), #"preready", associativearray(#"male", array("pb_melee_alt_male_draft_preready_1", "pb_melee_alt_male_draft_preready_2", "pb_melee_alt_male_draft_preready_3", "pb_melee_alt_male_draft_preready_4", "pb_melee_alt_male_draft_preready_5"), #"female", array("pb_melee_alt_fem_draft_preready_1", "pb_melee_alt_fem_draft_preready_2", "pb_melee_alt_fem_draft_preready_3", "pb_melee_alt_fem_draft_preready_4", "pb_melee_alt_fem_draft_preready_5")), #"ready", associativearray(#"male", array("pb_melee_alt_male_draft_transition_1", "pb_melee_alt_male_draft_transition_2", "pb_melee_alt_male_draft_transition_3", "pb_melee_alt_male_draft_transition_4", "pb_melee_alt_male_draft_transition_5"), #"female", array("pb_melee_alt_fem_draft_transition_1", "pb_melee_alt_fem_draft_transition_2", "pb_melee_alt_fem_draft_transition_3", "pb_melee_alt_fem_draft_transition_4", "pb_melee_alt_fem_draft_transition_5")), #"readyidle", associativearray(#"male", array("pb_melee_alt_male_draft_readyup_1", "pb_melee_alt_male_draft_readyup_2", "pb_melee_alt_male_draft_readyup_3", "pb_melee_alt_male_draft_readyup_4", "pb_melee_alt_male_draft_readyup_5"), #"female", array("pb_melee_alt_fem_draft_readyup_1", "pb_melee_alt_fem_draft_readyup_2", "pb_melee_alt_fem_draft_readyup_3", "pb_melee_alt_fem_draft_readyup_4", "pb_melee_alt_fem_draft_readyup_5"))), #"launcher", associativearray(#"select", associativearray(#"male", "pb_launcher_male_draft_ch_select_3", #"female", "pb_launcher_fem_draft_ch_select_3"), #"hash_6eaac8719751cb14", associativearray(#"male", "pb_launcher_male_draft_select_to_preready_3", #"female", "pb_launcher_fem_draft_select_to_preready_3"), #"hash_2fe61241a25ee67c", associativearray(#"male", "pb_launcher_male_draft_preready_to_select_3", #"female", "pb_launcher_fem_draft_preready_to_select_3"), #"preready", associativearray(#"male", array("pb_launcher_male_draft_preready1", "pb_launcher_male_draft_preready2", "pb_launcher_male_draft_preready3", "pb_launcher_male_draft_preready4", "pb_launcher_male_draft_preready5"), #"female", array("pb_launcher_fem_draft_ch_preready_1", "pb_launcher_fem_draft_ch_preready_2", "pb_launcher_fem_draft_ch_preready_3", "pb_launcher_fem_draft_ch_preready_4", "pb_launcher_fem_draft_ch_preready_5")), #"ready", associativearray(#"male", array("pb_launcher_male_draft_transition_1", "pb_launcher_male_draft_transition_2", "pb_launcher_male_draft_transition_3", "pb_launcher_male_draft_transition_4", "pb_launcher_male_draft_transition_5"), #"female", array("pb_launcher_fem_draft_transition_1", "pb_launcher_fem_draft_transition_2", "pb_launcher_fem_draft_transition_3", "pb_launcher_fem_draft_transition_4", "pb_launcher_fem_draft_transition_5")), #"readyidle", associativearray(#"male", array("pb_launcher_male_draft_readyup_1", "pb_launcher_male_draft_readyup_2", "pb_launcher_male_draft_readyup_3", "pb_launcher_male_draft_readyup_4", "pb_launcher_male_draft_readyup_5"), #"female", array("pb_launcher_fem_draft_readyup_1", "pb_launcher_fem_draft_readyup_2", "pb_launcher_fem_draft_readyup_3", "pb_launcher_fem_draft_readyup_4", "pb_launcher_fem_draft_readyup_5"))), #"pistol", associativearray(#"select", associativearray(#"male", "pb_pistol_male_draft_ch_select_3", #"female", "pb_pistol_fem_draft_ch_select_3"), #"hash_6eaac8719751cb14", associativearray(#"male", "pb_pistol_male_draft_select_to_preready_3", #"female", "pb_pistol_fem_draft_select_to_preready_3"), #"hash_2fe61241a25ee67c", associativearray(#"male", "pb_pistol_male_draft_preready_to_select_3", #"female", "pb_pistol_fem_draft_preready_to_select_3"), #"preready", associativearray(#"male", array("pb_pistol_male_draft_preready_1", "pb_pistol_male_draft_preready_2", "pb_pistol_male_draft_preready_3", "pb_pistol_male_draft_preready_4", "pb_pistol_male_draft_preready_5"), #"female", array("pb_pistol_fem_draft_preready_1", "pb_pistol_fem_draft_preready_2", "pb_pistol_fem_draft_preready_3", "pb_pistol_fem_draft_preready_4", "pb_pistol_fem_draft_preready_5")), #"ready", associativearray(#"male", array("pb_pistol_male_draft_transition_1", "pb_pistol_male_draft_transition_2", "pb_pistol_male_draft_transition_3", "pb_pistol_male_draft_transition_4", "pb_pistol_male_draft_transition_5"), #"female", array("pb_pistol_fem_draft_transition_1", "pb_pistol_fem_draft_transition_2", "pb_pistol_fem_draft_transition_3", "pb_pistol_fem_draft_transition_4", "pb_pistol_fem_draft_transition_5")), #"readyidle", associativearray(#"male", array("pb_pistol_male_draft_readyup_1", "pb_pistol_male_draft_readyup_2", "pb_pistol_male_draft_readyup_3", "pb_pistol_male_draft_readyup_4", "pb_pistol_male_draft_readyup_5"), #"female", array("pb_pistol_fem_draft_readyup_1", "pb_pistol_fem_draft_readyup_2", "pb_pistol_fem_draft_readyup_3", "pb_pistol_fem_draft_readyup_4", "pb_pistol_fem_draft_readyup_5"))), #"smg", associativearray(#"select", associativearray(#"male", "pb_smg_male_draft_idle_ch_select_3", #"female", "pb_smg_fem_draft_idle_ch_select_3"), #"hash_6eaac8719751cb14", associativearray(#"male", "pb_smg_male_draft_select_to_preready_3", #"female", "pb_smg_fem_draft_select_to_preready_3"), #"hash_2fe61241a25ee67c", associativearray(#"male", "pb_smg_male_draft_preready_to_select_3", #"female", "pb_smg_fem_draft_preready_to_select_3"), #"preready", associativearray(#"male", array("pb_smg_male_draft_preready_1", "pb_smg_male_draft_preready_2", "pb_smg_male_draft_preready_3", "pb_smg_male_draft_preready_4", "pb_smg_male_draft_preready_5"), #"female", array("pb_smg_fem_draft_preready_1", "pb_smg_fem_draft_preready_2", "pb_smg_fem_draft_preready_3", "pb_smg_fem_draft_preready_4", "pb_smg_fem_draft_preready_5")), #"ready", associativearray(#"male", array("pb_smg_male_draft_transition_1", "pb_smg_male_draft_transition_2", "pb_smg_male_draft_transition_3", "pb_smg_male_draft_transition_4", "pb_smg_male_draft_transition_5"), #"female", array("pb_smg_fem_draft_transition_1", "pb_smg_fem_draft_transition_2", "pb_smg_fem_draft_transition_3", "pb_smg_fem_draft_transition_4", "pb_smg_fem_draft_transition_5")), #"readyidle", associativearray(#"male", array("pb_smg_male_draft_readyup_1", "pb_smg_male_draft_readyup_2", "pb_smg_male_draft_readyup_3", "pb_smg_male_draft_readyup_4", "pb_smg_male_draft_readyup_5"), #"female", array("pb_smg_fem_draft_readyup_1", "pb_smg_fem_draft_readyup_2", "pb_smg_fem_draft_readyup_3", "pb_smg_fem_draft_readyup_4", "pb_smg_fem_draft_readyup_5"))))[var_e78b2a99];
}

/*
	Name: function_6b532f83
	Namespace: draft
	Checksum: 0x38E03284
	Offset: 0x55E8
	Size: 0x3F6
	Parameters: 3
	Flags: Linked
*/
function function_6b532f83(localclientnum, var_de58f286, sessionmode)
{
	var_7eb5dfe9 = var_de58f286.positionindex;
	anim_intro_name = undefined;
	anim_name = undefined;
	var_799bae98 = function_bb0565d0(var_de58f286);
	if(isdefined(var_de58f286.var_625ec6da) && player_role::is_valid(var_de58f286.var_625ec6da.charactertype))
	{
		if(!isdefined(var_de58f286) || !isdefined(var_de58f286.var_91065a59) || !isdefined(var_de58f286.var_3afd181d))
		{
			/#
				assert(isdefined(var_de58f286));
			#/
			/#
				assert(isdefined(var_de58f286.var_91065a59));
			#/
			/#
				assert(isdefined(var_de58f286.var_3afd181d));
			#/
			return;
		}
		gender = getherogender(var_de58f286.var_625ec6da.charactertype, sessionmode);
		if(var_de58f286.var_91065a59 != var_de58f286.var_3afd181d)
		{
			if(var_de58f286.var_91065a59)
			{
				var_ca1716fe = var_799bae98[#"ready"][gender];
				anim_intro_name = var_ca1716fe[var_7eb5dfe9 % var_ca1716fe.size];
				var_177782dd = var_799bae98[#"readyidle"][gender];
				anim_name = var_177782dd[var_7eb5dfe9 % var_177782dd.size];
			}
			var_de58f286.var_3afd181d = var_de58f286.var_91065a59;
		}
		else
		{
			if(player_role::is_valid(var_de58f286.focusedcharacterindex))
			{
				if(var_de58f286.selected)
				{
					anim_intro_name = var_799bae98[#"hash_2fe61241a25ee67c"][gender];
					var_de58f286.selected = 0;
				}
				anim_name = var_799bae98[#"select"][gender];
			}
			else
			{
				if(!var_de58f286.var_91065a59)
				{
					if(var_7eb5dfe9 == 1 && !codcaster::function_b8fe9b52(localclientnum))
					{
						anim_intro_name = var_799bae98[#"hash_6eaac8719751cb14"][gender];
					}
					var_b793aad = var_799bae98[#"preready"][gender];
					anim_name = var_b793aad[var_7eb5dfe9 % var_b793aad.size];
				}
				else
				{
					var_ca1716fe = var_799bae98[#"ready"][gender];
					anim_intro_name = var_ca1716fe[var_7eb5dfe9 % var_ca1716fe.size];
					var_177782dd = var_799bae98[#"readyidle"][gender];
					anim_name = var_177782dd[var_7eb5dfe9 % var_177782dd.size];
				}
				var_de58f286.selected = 1;
			}
		}
	}
	else
	{
		anim_name = array("pb_rifle_male_draft_preready_1", "pb_rifle_male_draft_preready_2", "pb_rifle_male_draft_preready_3", "pb_rifle_male_draft_preready_4", "pb_rifle_male_draft_preready_5")[var_7eb5dfe9 % array("pb_rifle_male_draft_preready_1", "pb_rifle_male_draft_preready_2", "pb_rifle_male_draft_preready_3", "pb_rifle_male_draft_preready_4", "pb_rifle_male_draft_preready_5").size];
	}
	var_de58f286.params.anim_intro_name = anim_intro_name;
	var_de58f286.params.anim_name = anim_name;
}

/*
	Name: function_93a4f3c5
	Namespace: draft
	Checksum: 0x1BAB0A7C
	Offset: 0x59E8
	Size: 0x220
	Parameters: 2
	Flags: Linked
*/
function function_93a4f3c5(localclientnum, draftcharacter)
{
	sessionmode = currentsessionmode();
	var_de58f286 = [[ draftcharacter ]]->function_82e05d64();
	if(player_role::is_valid(var_de58f286.focusedcharacterindex))
	{
		var_3f83e0ee = character_customization::function_7474681d(localclientnum, sessionmode, [[ draftcharacter ]]->function_82e05d64().focusedcharacterindex);
		if(!character_customization::function_aa5382ed(var_de58f286.var_625ec6da, var_3f83e0ee))
		{
			return false;
		}
		[[ draftcharacter ]]->function_82e05d64().var_625ec6da = var_3f83e0ee;
	}
	else if(!isdefined(var_de58f286.var_625ec6da) || character_customization::function_aa5382ed(var_de58f286.var_625ec6da, var_de58f286.var_c018da16))
	{
		function_1cf2437c(localclientnum, draftcharacter, var_de58f286.var_625ec6da, var_de58f286.var_c018da16);
		var_de58f286.var_625ec6da = var_de58f286.var_c018da16;
	}
	if(isdefined(var_de58f286.var_625ec6da) && player_role::is_valid(var_de58f286.var_625ec6da.charactertype))
	{
		[[ draftcharacter ]]->function_1ec9448d(0);
		[[ draftcharacter ]]->function_15a8906a([[ draftcharacter ]]->function_82e05d64().var_625ec6da);
		function_799e0ac1(localclientnum, draftcharacter, 0);
	}
	else
	{
		[[ draftcharacter ]]->function_1ec9448d(1);
		[[ draftcharacter ]]->set_character_index(0);
		function_799e0ac1(localclientnum, draftcharacter, 1);
	}
	return true;
}

/*
	Name: function_2dfe152c
	Namespace: draft
	Checksum: 0xA169CCBC
	Offset: 0x5C10
	Size: 0x24
	Parameters: 4
	Flags: Linked
*/
function function_2dfe152c(localclientnum, draftcharacter, oldweapon, newweapon)
{
}

/*
	Name: function_4ccc033d
	Namespace: draft
	Checksum: 0x584C08CC
	Offset: 0x5C40
	Size: 0x20A
	Parameters: 2
	Flags: Linked
*/
function function_4ccc033d(localclientnum, draftcharacter)
{
	if(isdefined([[ draftcharacter ]]->function_82e05d64().primaryweapon))
	{
		if(!isdefined([[ draftcharacter ]]->function_82e05d64().activeweapon))
		{
			return 1;
		}
		if(is_true(level.var_ea696257))
		{
			return ([[ draftcharacter ]]->function_82e05d64().activeweapon) != getweapon(#"pistol_standard_t8");
		}
		if(is_true(level.var_8eef5741))
		{
			return ([[ draftcharacter ]]->function_82e05d64().activeweapon) != level.var_bf82f6b0;
		}
		if(is_true(level.isgungame))
		{
			return ([[ draftcharacter ]]->function_82e05d64().activeweapon) != getweapon(#"pistol_fullauto_t8");
		}
		if(is_true(level.var_207a1c9a))
		{
			return ([[ draftcharacter ]]->function_82e05d64().activeweapon) != getweapon(#"crossbow_special_t8");
		}
		newprimary = ([[ draftcharacter ]]->function_82e05d64().activeweapon) != ([[ draftcharacter ]]->function_82e05d64().primaryweapon) || ([[ draftcharacter ]]->function_82e05d64().var_b8f20727) !== ([[ draftcharacter ]]->function_82e05d64().primaryweaponoptions);
		return newprimary;
	}
	return 0;
}

/*
	Name: function_a1c71160
	Namespace: draft
	Checksum: 0x39F3704F
	Offset: 0x5E58
	Size: 0x33E
	Parameters: 2
	Flags: Linked
*/
function function_a1c71160(localclientnum, draftcharacter)
{
	changed = 0;
	if(function_4ccc033d(localclientnum, draftcharacter))
	{
		function_2dfe152c(localclientnum, draftcharacter, [[ draftcharacter ]]->function_82e05d64().activeweapon, [[ draftcharacter ]]->function_82e05d64().primaryweapon);
		if(is_true(level.var_ea696257))
		{
			[[ draftcharacter ]]->function_82e05d64().activeweapon = getweapon(#"pistol_standard_t8");
			[[ draftcharacter ]]->function_82e05d64().var_b8f20727 = 0;
		}
		else
		{
			if(is_true(level.var_8eef5741))
			{
				[[ draftcharacter ]]->function_82e05d64().activeweapon = level.var_bf82f6b0;
				[[ draftcharacter ]]->function_82e05d64().var_b8f20727 = 0;
			}
			else
			{
				if(is_true(level.isgungame))
				{
					[[ draftcharacter ]]->function_82e05d64().activeweapon = getweapon(#"pistol_fullauto_t8");
					[[ draftcharacter ]]->function_82e05d64().var_b8f20727 = 0;
				}
				else
				{
					if(is_true(level.var_207a1c9a))
					{
						[[ draftcharacter ]]->function_82e05d64().activeweapon = getweapon(#"special_crossbow_t8");
						[[ draftcharacter ]]->function_82e05d64().var_b8f20727 = 0;
					}
					else
					{
						if(([[ draftcharacter ]]->function_82e05d64().primaryweapon) == level.weaponnone)
						{
							[[ draftcharacter ]]->function_82e05d64().activeweapon = [[ draftcharacter ]]->function_82e05d64().secondaryweapon;
							[[ draftcharacter ]]->function_82e05d64().var_b8f20727 = [[ draftcharacter ]]->function_82e05d64().secondaryweaponoptions;
						}
						else
						{
							[[ draftcharacter ]]->function_82e05d64().activeweapon = [[ draftcharacter ]]->function_82e05d64().primaryweapon;
							[[ draftcharacter ]]->function_82e05d64().var_b8f20727 = [[ draftcharacter ]]->function_82e05d64().primaryweaponoptions;
						}
					}
				}
			}
		}
		[[ draftcharacter ]]->function_82e05d64().params.activeweapon = [[ draftcharacter ]]->function_82e05d64().activeweapon;
		[[ draftcharacter ]]->function_82e05d64().params.var_b8f20727 = [[ draftcharacter ]]->function_82e05d64().var_b8f20727;
		changed = 1;
	}
	return changed;
}

/*
	Name: function_71a9fb67
	Namespace: draft
	Checksum: 0x4776381
	Offset: 0x61A0
	Size: 0xE0
	Parameters: 2
	Flags: Linked
*/
function function_71a9fb67(localclientnum, draftcharacter)
{
	update = 0;
	if(function_93a4f3c5(localclientnum, draftcharacter))
	{
		update = 1;
	}
	if(function_a1c71160(localclientnum, draftcharacter))
	{
		update = 1;
	}
	if(update)
	{
		sessionmode = currentsessionmode();
		var_de58f286 = [[ draftcharacter ]]->function_82e05d64();
		function_6b532f83(localclientnum, var_de58f286, sessionmode);
		[[ draftcharacter ]]->update([[ draftcharacter ]]->function_82e05d64().params);
	}
}

/*
	Name: update_team
	Namespace: draft
	Checksum: 0x9A5E9723
	Offset: 0x6288
	Size: 0x844
	Parameters: 2
	Flags: Linked
*/
function update_team(localclientnum, var_4123f2c1)
{
	localplayer = function_5c10bd79(localclientnum);
	team = function_c4dfe16e(localclientnum);
	positiondraftclientsmodel = function_1df4c3b0(localclientnum, #"hash_2d6cbb4c86b58899");
	for(i = 0; i < 5; i++)
	{
		if(!isdefined(level.draftcharacters[localclientnum][team]) || !isdefined(level.draftcharacters[localclientnum][team][i]))
		{
			continue;
		}
		draftcharacter = level.draftcharacters[localclientnum][team][i];
		[[ draftcharacter ]]->function_82e05d64().var_c018da16 = undefined;
		[[ draftcharacter ]]->function_82e05d64().primaryweapon = level.weaponnone;
		[[ draftcharacter ]]->function_82e05d64().primaryweaponoptions = 0;
		[[ draftcharacter ]]->function_82e05d64().secondaryweapon = level.weaponnone;
		[[ draftcharacter ]]->function_82e05d64().secondaryweaponoptions = 0;
		if(isdefined(positiondraftclientsmodel))
		{
			luaindex = i + 1;
			positionmodel = getuimodel(positiondraftclientsmodel, string(luaindex));
			clientnum = getuimodelvalue(getuimodel(positionmodel, "clientNum"));
			[[ draftcharacter ]]->function_82e05d64().islocalclient = getuimodelvalue(getuimodel(positionmodel, "isLocalClient"));
			[[ draftcharacter ]]->function_82e05d64().var_90ba8f6f = createuimodel(positionmodel, "entNum");
			setuimodelvalue([[ draftcharacter ]]->function_82e05d64().var_90ba8f6f, [[ draftcharacter ]]->function_47cb6b19());
			if(clientnum >= 0)
			{
				player = getentbynum(localclientnum, clientnum);
				if(isdefined(player) && player function_e4f35989())
				{
					[[ draftcharacter ]]->function_82e05d64().player = player;
					[[ draftcharacter ]]->function_82e05d64().var_c018da16 = player function_79a48799();
					if(isdefined([[ draftcharacter ]]->function_82e05d64().var_c018da16) && player_role::is_valid([[ draftcharacter ]]->function_82e05d64().var_c018da16.charactertype) && player_role::is_valid([[ draftcharacter ]]->function_82e05d64().focusedcharacterindex))
					{
						[[ draftcharacter ]]->function_82e05d64().var_625ec6da = undefined;
						[[ draftcharacter ]]->function_82e05d64().focusedcharacterindex = 0;
					}
					[[ draftcharacter ]]->function_82e05d64().primaryweapon = player getprimaryweapon();
					[[ draftcharacter ]]->function_82e05d64().primaryweaponoptions = player function_519bc773();
					[[ draftcharacter ]]->function_82e05d64().secondaryweapon = player getsecondaryweapon();
					[[ draftcharacter ]]->function_82e05d64().secondaryweaponoptions = player function_64c66c4b();
				}
				else
				{
					[[ draftcharacter ]]->function_82e05d64().player = undefined;
				}
				if(is_true([[ draftcharacter ]]->function_82e05d64().islocalclient) || codcaster::function_b8fe9b52(localclientnum))
				{
					if(!isdefined([[ draftcharacter ]]->function_82e05d64().player))
					{
						[[ draftcharacter ]]->function_82e05d64().player = localplayer;
						[[ draftcharacter ]]->function_82e05d64().primaryweapon = localplayer getprimaryweapon();
						[[ draftcharacter ]]->function_82e05d64().primaryweaponoptions = localplayer function_519bc773();
						[[ draftcharacter ]]->function_82e05d64().secondaryweapon = localplayer getsecondaryweapon();
						[[ draftcharacter ]]->function_82e05d64().secondaryweaponoptions = localplayer function_64c66c4b();
					}
					[[ draftcharacter ]]->function_82e05d64().localclientnum = localclientnum;
					if(isdefined([[ draftcharacter ]]->function_82e05d64().var_c018da16) && player_role::is_valid([[ draftcharacter ]]->function_82e05d64().var_c018da16.charactertype) || codcaster::function_b8fe9b52(localclientnum))
					{
						function_236a944e(localclientnum);
						lerpduration = 1000;
						if(var_4123f2c1)
						{
							lerpduration = 0;
						}
						function_e79c182b(localclientnum, lerpduration);
					}
					else
					{
						function_b139ecfb(localclientnum);
						lerpduration = 1000;
						if(var_4123f2c1)
						{
							lerpduration = 0;
						}
						function_532dfc0b(localclientnum, lerpduration);
						positiondraftmodel = function_1df4c3b0(localclientnum, #"hash_6797d4cd7534952f");
						if(isdefined(positiondraftmodel))
						{
							[[ draftcharacter ]]->function_82e05d64().focusedcharacterindex = getuimodelvalue(getuimodel(positiondraftmodel, "focusedCharacterIndex"));
						}
					}
				}
				else
				{
					[[ draftcharacter ]]->function_82e05d64().localclientnum = undefined;
				}
				var_24b754fa = getuimodelvalue(getuimodel(positionmodel, "clientInfo"));
				[[ draftcharacter ]]->function_82e05d64().var_91065a59 = getuimodelvalue(getuimodel(var_24b754fa, "ready"));
				if(codcaster::function_b8fe9b52(localclientnum) && !(isdefined([[ draftcharacter ]]->function_82e05d64().var_91065a59)) && isdefined(player) && isbot(player))
				{
					[[ draftcharacter ]]->function_82e05d64().var_91065a59 = 0;
				}
			}
		}
		function_71a9fb67(localclientnum, draftcharacter);
	}
}

/*
	Name: function_9e9e1117
	Namespace: draft
	Checksum: 0xCFADDC8
	Offset: 0x6AD8
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function function_9e9e1117(localclientnum, draftcharacter)
{
	if(isdefined([[ draftcharacter ]]->function_82e05d64().var_90ba8f6f))
	{
		setuimodelvalue([[ draftcharacter ]]->function_82e05d64().var_90ba8f6f, [[ draftcharacter ]]->function_47cb6b19());
	}
}

/*
	Name: function_20811f66
	Namespace: draft
	Checksum: 0x31FF5B2A
	Offset: 0x6B48
	Size: 0x12A
	Parameters: 1
	Flags: Linked
*/
function function_20811f66(localclientnum)
{
	foreach(team in getarraykeys(level.draftcharacters[localclientnum]))
	{
		foreach(char in level.draftcharacters[localclientnum][team])
		{
			[[ char ]]->delete_models();
		}
		level.draftcharacters[localclientnum][team] = [];
	}
}

/*
	Name: setup_team
	Namespace: draft
	Checksum: 0xBA513214
	Offset: 0x6C80
	Size: 0x250
	Parameters: 1
	Flags: Linked
*/
function setup_team(localclientnum)
{
	function_20811f66(localclientnum);
	teambased = function_b2272884();
	team = function_c4dfe16e(localclientnum);
	if(isdefined(level.playerscriptstructs[team]))
	{
		for(i = 0; i < level.playerscriptstructs[team].size; i++)
		{
			if(!isdefined(level.draftcharacters[localclientnum][team][i]))
			{
				model = util::spawn_model(localclientnum, "tag_origin", level.playerscriptstructs[team][i].origin, level.playerscriptstructs[team][i].angles);
				model.targetname = level.playerscriptstructs[team][i].targetname;
				draftcharacter = character_customization::function_dd295310(model, localclientnum, 0);
				[[ draftcharacter ]]->function_184a4d2e(&function_9e9e1117);
				[[ draftcharacter ]]->set_character_mode(currentsessionmode());
				var_de58f286 = [[ draftcharacter ]]->function_82e05d64();
				var_de58f286.positionindex = i;
				var_de58f286.var_3afd181d = 0;
				var_de58f286.var_91065a59 = 0;
				var_de58f286.selected = 0;
				var_de58f286.params = spawnstruct();
				var_de58f286.params.sessionmode = currentsessionmode();
				var_de58f286.islocalclient = 0;
				var_de58f286.showmodel = teambased || i == 1;
				level.draftcharacters[localclientnum][team][i] = draftcharacter;
			}
		}
	}
}

/*
	Name: watchupdate
	Namespace: draft
	Checksum: 0xCF7BFACD
	Offset: 0x6ED8
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function watchupdate(localclientnum)
{
	level endon(#"disconnect", #"draft_closed");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"positiondraft_update", #"positiondraft_reject");
		if(localclientnum == waitresult.localclientnum)
		{
			if(codcaster::function_b8fe9b52(localclientnum))
			{
				setup_team(localclientnum);
			}
			update_team(localclientnum, 0);
		}
	}
}

/*
	Name: watchteamchange
	Namespace: draft
	Checksum: 0x2BBA0780
	Offset: 0x6FA8
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function watchteamchange(localclientnum)
{
	self endon(#"disconnect", #"draft_closed");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"team_changed");
		if(localclientnum == waitresult.localclientnum)
		{
			setup_team(localclientnum);
			update_team(localclientnum, 1);
		}
	}
}

/*
	Name: watchkillcam
	Namespace: draft
	Checksum: 0xDED7E8D1
	Offset: 0x7050
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function watchkillcam()
{
	self notify(#"hash_79dc7957d60fa25");
	self endon(#"hash_79dc7957d60fa25", #"disconnect", #"draft_closed");
	while(true)
	{
		level.var_84e5adfd = 0;
		level waittill(#"killcam_begin");
		level.var_84e5adfd = 1;
		level waittill(#"killcam_end");
	}
}

/*
	Name: function_9afd868e
	Namespace: draft
	Checksum: 0x51C6E954
	Offset: 0x70F8
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function function_9afd868e(localclientnum)
{
	self notify("2b032b5e2a06f25b");
	self endon("2b032b5e2a06f25b");
	self endon(#"draft_closed");
	if(!is_true(level.draftactive[localclientnum]))
	{
		level.draftactive[localclientnum] = 1;
		setup_team(localclientnum);
		play_intro_cinematic(localclientnum);
		enable_lights(localclientnum);
		level thread watchupdate(localclientnum);
		level thread watchteamchange(localclientnum);
		if(!is_true(level.var_f6501ae8))
		{
			level.var_f6501ae8 = 1;
			level thread watchkillcam();
		}
		update_team(localclientnum, 1);
	}
}

/*
	Name: function_ca03ab69
	Namespace: draft
	Checksum: 0x443B8C0
	Offset: 0x7240
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function function_ca03ab69()
{
	level endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"positiondraft_open");
		localclientnum = waitresult.localclientnum;
		localplayer = function_5c10bd79(localclientnum);
		localplayer serverfield::set("PositionDraft.uiLoaded", 1);
		level thread function_9afd868e(localclientnum);
	}
}

/*
	Name: function_91858511
	Namespace: draft
	Checksum: 0x871D47B6
	Offset: 0x72F8
	Size: 0x118
	Parameters: 0
	Flags: Linked
*/
function function_91858511()
{
	level endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"positiondraft_close");
		localclientnum = waitresult.localclientnum;
		if(is_true(level.draftactive[localclientnum]))
		{
			if(!is_true(level.draftclosed))
			{
				level notify(#"draft_closed");
				level.draftclosed = 1;
			}
			function_20811f66(localclientnum);
			function_2c486f35(localclientnum);
			stop_cameras(localclientnum);
			level.draftactive[localclientnum] = 0;
		}
	}
}

