#using script_59f62971655f7103;
#using scripts\core_common\struct.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\map.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace battlechatter;

/*
	Name: function_45d633b2
	Namespace: battlechatter
	Checksum: 0x943D5269
	Offset: 0x3E8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_45d633b2()
{
	level notify(-308707277);
}

/*
	Name: __init__system__
	Namespace: battlechatter
	Checksum: 0x6F4DE03C
	Offset: 0x408
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"battlechatter", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: battlechatter
	Checksum: 0xDBAB748
	Offset: 0x450
	Size: 0xEC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_2829c23d = &function_50e36ba7;
	level.var_44e74ef4 = &function_f1d27638;
	level.allowbattlechatter[#"bc"] = is_true(getgametypesetting(#"allowbattlechatter"));
	level.allowspecialistdialog = mpdialog_value("enableHeroDialog", 0) && is_true(level.allowbattlechatter[#"bc"]);
	level.var_e444d44 = 1;
	level thread function_4bc12499();
}

/*
	Name: function_4bc12499
	Namespace: battlechatter
	Checksum: 0xDEAEFC8A
	Offset: 0x548
	Size: 0x120
	Parameters: 0
	Flags: Linked
*/
function function_4bc12499()
{
	level endon(#"death");
	while(true)
	{
		var_7f729179 = undefined;
		var_7f729179 = level waittill(#"play_death_vox");
		if(!isdefined(var_7f729179.body))
		{
			return;
		}
		bundlename = var_7f729179.body getmpdialogname();
		if(!isdefined(bundlename))
		{
			return;
		}
		playerbundle = getscriptbundle(bundlename);
		voiceprefix = playerbundle.voiceprefix;
		deathalias = get_death_vox(playerbundle, var_7f729179.mod);
		if(isdefined(voiceprefix) && isdefined(deathalias))
		{
			var_7f729179.body playsound(0, voiceprefix + deathalias);
		}
	}
}

/*
	Name: function_f1d27638
	Namespace: battlechatter
	Checksum: 0xBECC7057
	Offset: 0x670
	Size: 0x322
	Parameters: 1
	Flags: Linked
*/
function function_f1d27638(var_f7f4481f)
{
	if(!isdefined(var_f7f4481f) || !isdefined(var_f7f4481f.eventid))
	{
		return;
	}
	switch(var_f7f4481f.eventid)
	{
		case 0:
		{
			thread function_50e36ba7(var_f7f4481f.var_40209f44, var_f7f4481f.weapon, var_f7f4481f.var_3d136cd9, var_f7f4481f.var_7e98b410);
			break;
		}
		case 2:
		{
			thread function_ee8935da(var_f7f4481f.var_3d136cd9);
			break;
		}
		case 3:
		case 4:
		case 5:
		{
			thread function_bf569dab(var_f7f4481f.var_40209f44, var_f7f4481f.var_3d136cd9, var_f7f4481f.eventid, var_f7f4481f.weapon);
			break;
		}
		case 6:
		{
			thread function_6bed8fc0(var_f7f4481f.var_40209f44, var_f7f4481f.var_3d136cd9, var_f7f4481f.var_7e98b410);
			break;
		}
		case 7:
		{
			thread function_6afb2bd4(var_f7f4481f.var_40209f44, var_f7f4481f.weapon, var_f7f4481f.localclientnum, var_f7f4481f.var_7e98b410);
			break;
		}
		case 8:
		{
			thread function_22ea6c18(var_f7f4481f.var_40209f44, var_f7f4481f.weapon, var_f7f4481f.localclientnum, var_f7f4481f.var_7e98b410);
			break;
		}
		case 9:
		{
			thread function_7d29bb1e(var_f7f4481f.var_40209f44, var_f7f4481f.weapon, var_f7f4481f.localclientnum, var_f7f4481f.var_7e98b410);
			break;
		}
		case 10:
		{
			thread function_2ddd5b7d(var_f7f4481f.var_40209f44, var_f7f4481f.weapon, var_f7f4481f.localclientnum, var_f7f4481f.var_7e98b410);
			break;
		}
		case 11:
		{
			thread function_afa6ac4b(var_f7f4481f.var_40209f44, var_f7f4481f.weapon, var_f7f4481f.var_3d136cd9, var_f7f4481f.var_7e98b410);
			break;
		}
		case 12:
		case 13:
		case 14:
		{
			thread game_end_vox(var_f7f4481f.var_40209f44, var_f7f4481f.eventid);
			break;
		}
	}
}

/*
	Name: get_death_vox
	Namespace: battlechatter
	Checksum: 0x84F625D6
	Offset: 0x9A0
	Size: 0x1C2
	Parameters: 2
	Flags: Linked
*/
function get_death_vox(playerbundle, meansofdeath)
{
	if(isdefined(meansofdeath))
	{
		switch(meansofdeath)
		{
			case "mod_unknown":
			{
				return playerbundle.exertdeath;
			}
			case "mod_burned":
			{
				if(function_fc261b83())
				{
					return "";
				}
				else
				{
					return playerbundle.exertdeathburned;
				}
			}
			case "mod_melee_weapon_butt":
			{
				return playerbundle.var_53f25688;
			}
			case "mod_head_shot":
			{
				return playerbundle.var_207908de;
			}
			case "mod_falling":
			{
				return playerbundle.var_1dfcabbd;
			}
			case "mod_drown":
			{
				return playerbundle.exertdeathdrowned;
			}
			case "mod_explosive":
			{
				return playerbundle.var_44d86dec;
			}
			case "mod_dot_self":
			{
				return playerbundle.var_48305ed9;
			}
			case "mod_dot":
			{
				return playerbundle.var_f8b4bcc1;
			}
			case "mod_melee_assassinate":
			{
				return playerbundle.exertdeathstabbed;
			}
			case "mod_gas":
			{
				return playerbundle.var_7a45f37b;
			}
			case "mod_electrocuted":
			{
				return playerbundle.exertdeathelectrocuted;
			}
			case "mod_crush":
			{
				return playerbundle.var_35f92256;
			}
		}
	}
	return playerbundle.exertdeath;
}

/*
	Name: function_d2f35e13
	Namespace: battlechatter
	Checksum: 0x4DD7F090
	Offset: 0xB70
	Size: 0x1D4
	Parameters: 6
	Flags: Linked
*/
function function_d2f35e13(localclientnum, successplayer, weapon, var_6ac148bc, var_5d738b56, seed)
{
	while(isdefined(var_6ac148bc) && soundplaying(var_6ac148bc))
	{
		waitframe(1);
	}
	wait(0.4);
	if(!isdefined(successplayer))
	{
		return;
	}
	var_5c238c21 = function_cdd81094(weapon);
	if(!isdefined(var_5c238c21.var_48b8bd2c))
	{
		return;
	}
	successreactionradius = mpdialog_value("SuccessReactionRadius", 500);
	if((isdefined(var_5c238c21.var_506f762f) ? var_5c238c21.var_506f762f : 0) && isdefined(var_5d738b56) && isplayer(var_5d738b56))
	{
		if(function_d804d2f0(localclientnum, successplayer, var_5d738b56, successreactionradius * successreactionradius))
		{
			var_8a6b001a = var_5d738b56;
		}
	}
	else
	{
		var_8a6b001a = function_db89c38f(localclientnum, successplayer, successreactionradius * successreactionradius);
	}
	if(!isdefined(var_8a6b001a))
	{
		return;
	}
	var_9f84e4a9 = function_b59a25c5(var_8a6b001a);
	if(!isdefined(var_9f84e4a9))
	{
		return;
	}
	var_81485093 = var_9f84e4a9 + var_5c238c21.var_48b8bd2c;
	var_8a6b001a function_4b126e4c(localclientnum, var_81485093, seed);
}

/*
	Name: function_50e36ba7
	Namespace: battlechatter
	Checksum: 0xD58CC530
	Offset: 0xD50
	Size: 0x16C
	Parameters: 4
	Flags: Linked
*/
function function_50e36ba7(attacker, weapon, var_5d738b56, seed)
{
	if(!isdefined(attacker) || !isplayer(attacker))
	{
		return;
	}
	var_9f84e4a9 = function_b59a25c5(attacker);
	if(!isdefined(var_9f84e4a9))
	{
		return;
	}
	var_5c238c21 = function_cdd81094(weapon);
	if(!isdefined(var_5c238c21.var_c8d8482c))
	{
		return;
	}
	var_17a094cf = var_9f84e4a9 + var_5c238c21.var_c8d8482c;
	var_57c1e152 = (isdefined(var_5c238c21.var_57c1e152) ? var_5c238c21.var_57c1e152 : 0);
	wait(var_57c1e152);
	if(!isdefined(attacker) || !isplayer(attacker))
	{
		return;
	}
	var_a874c58 = attacker function_4b126e4c(0, var_17a094cf, seed);
	if(!isdefined(var_a874c58))
	{
		return;
	}
	thread function_d2f35e13(0, attacker, weapon, var_a874c58, var_5d738b56, seed);
}

/*
	Name: function_afa6ac4b
	Namespace: battlechatter
	Checksum: 0xAA1F937D
	Offset: 0xEC8
	Size: 0x18C
	Parameters: 4
	Flags: Linked
*/
function function_afa6ac4b(attacker, weapon, var_5d738b56, seed)
{
	if(!isdefined(attacker) || !isplayer(attacker))
	{
		return;
	}
	if(attacker === var_5d738b56)
	{
		var_5d738b56 = undefined;
	}
	var_9f84e4a9 = function_b59a25c5(attacker);
	if(!isdefined(var_9f84e4a9))
	{
		return;
	}
	var_5c238c21 = function_cdd81094(weapon);
	if(!isdefined(var_5c238c21.destroyedalias))
	{
		return;
	}
	var_9c00ad8b = var_9f84e4a9 + var_5c238c21.destroyedalias;
	if(!isdefined(attacker) || !isplayer(attacker))
	{
		return;
	}
	var_d1927bab = attacker function_4b126e4c(0, var_9c00ad8b, seed);
	if(!isdefined(var_d1927bab))
	{
		return;
	}
	if(isdefined(var_5c238c21.var_eefecef8) && randomfloatrange(0, 1) < 0.25)
	{
		thread function_29f600fe(0, attacker, var_5c238c21.var_eefecef8, var_d1927bab, var_5d738b56, seed);
	}
}

/*
	Name: function_29f600fe
	Namespace: battlechatter
	Checksum: 0x11E334BB
	Offset: 0x1060
	Size: 0x17C
	Parameters: 6
	Flags: Linked
*/
function function_29f600fe(localclientnum, attacker, var_eefecef8, var_d1927bab, var_5d738b56, seed)
{
	while(isdefined(var_d1927bab) && soundplaying(var_d1927bab))
	{
		waitframe(1);
	}
	wait(0.25);
	if(!isdefined(attacker))
	{
		return;
	}
	successreactionradius = mpdialog_value("SuccessReactionRadius", 500);
	if(isdefined(var_5d738b56) && isplayer(var_5d738b56))
	{
		if(function_d804d2f0(localclientnum, attacker, var_5d738b56, successreactionradius * successreactionradius))
		{
			var_8a6b001a = var_5d738b56;
		}
	}
	else
	{
		var_8a6b001a = function_db89c38f(localclientnum, attacker, successreactionradius * successreactionradius);
	}
	if(!isdefined(var_8a6b001a))
	{
		return;
	}
	var_9f84e4a9 = function_b59a25c5(var_8a6b001a);
	if(!isdefined(var_9f84e4a9))
	{
		return;
	}
	var_81485093 = var_9f84e4a9 + var_eefecef8;
	var_8a6b001a function_4b126e4c(localclientnum, var_81485093, seed);
}

/*
	Name: game_end_vox
	Namespace: battlechatter
	Checksum: 0x7BB1F6BA
	Offset: 0x11E8
	Size: 0x344
	Parameters: 2
	Flags: Linked
*/
function game_end_vox(player, eventid)
{
	localclientnum = player getlocalclientnumber();
	if(!isdefined(localclientnum))
	{
		return;
	}
	switch(eventid)
	{
		case 12:
		{
			var_6e32f147 = "gameDraw";
			var_135807f9 = "boostDraw";
			break;
		}
		case 13:
		{
			var_6e32f147 = "gameLost";
			var_135807f9 = "boostLoss";
			break;
		}
		case 14:
		{
			var_6e32f147 = "gameWon";
			var_135807f9 = "boostWin";
			break;
		}
	}
	factionlist = map::function_596f8772();
	if(player.team === #"allies")
	{
		faction = getscriptbundle((isdefined(factionlist.faction[1].var_d2446fa0) ? factionlist.faction[1].var_d2446fa0 : #""));
		commander = (isdefined(faction.var_ccc3e5ba) ? faction.var_ccc3e5ba : "blops_commander");
	}
	else
	{
		faction = getscriptbundle((isdefined(factionlist.faction[2].var_d2446fa0) ? factionlist.faction[2].var_d2446fa0 : #""));
		commander = (isdefined(faction.var_ccc3e5ba) ? faction.var_ccc3e5ba : "cdp_commander");
	}
	commanderbundle = getscriptbundle(commander);
	if(!(isdefined(commanderbundle.voiceprefix) && isdefined(commanderbundle.(var_6e32f147))))
	{
		return;
	}
	var_bf147cb1 = commanderbundle.voiceprefix + commanderbundle.(var_6e32f147);
	var_b7095947 = player playsound(localclientnum, var_bf147cb1);
	if(!isdefined(var_b7095947))
	{
		return;
	}
	playerbundle = function_58c93260(player);
	if(!(isdefined(playerbundle.voiceprefix) && isdefined(playerbundle.(var_135807f9))))
	{
		return;
	}
	var_81485093 = playerbundle.voiceprefix + playerbundle.(var_135807f9);
	thread function_cc6f6e09(player, var_81485093, var_b7095947);
}

/*
	Name: function_cc6f6e09
	Namespace: battlechatter
	Checksum: 0xB6EB39E8
	Offset: 0x1538
	Size: 0x7C
	Parameters: 3
	Flags: Linked
*/
function function_cc6f6e09(player, var_81485093, var_b7095947)
{
	while(isdefined(var_b7095947) && soundplaying(var_b7095947))
	{
		waitframe(1);
	}
	wait(0.25);
	if(!isdefined(player))
	{
		return;
	}
	player playsound(0, var_81485093);
}

/*
	Name: function_c8663dbc
	Namespace: battlechatter
	Checksum: 0x5CB734D1
	Offset: 0x15C0
	Size: 0x4EA
	Parameters: 2
	Flags: Linked
*/
function function_c8663dbc(weapon, player)
{
	taacombundle = function_84eb6127(player);
	if(!isdefined(taacombundle))
	{
		return undefined;
	}
	switch(weapon.name)
	{
		case "eq_emp_grenade":
		{
			taacomdialog = "jammerWeaponHacked";
			break;
		}
		case "eq_tripwire":
		{
			taacomdialog = "meshMineWeaponHacked";
			break;
		}
		case "eq_seeker_mine":
		{
			taacomdialog = "seekerMineWeaponHacked";
			break;
		}
		case "eq_sensor":
		{
			taacomdialog = "sensorDartHacked";
			break;
		}
		case "ability_smart_cover":
		case "gadget_smart_cover":
		{
			taacomdialog = "smartCoverHacked";
			break;
		}
		case "gadget_spawnbeacon":
		{
			taacomdialog = "spawnBeaconHacked";
			break;
		}
		case "gadget_supplypod":
		{
			taacomdialog = "supplyPodHacked";
			break;
		}
		case "trophy_system":
		{
			taacomdialog = "trophyWeaponHacked";
			break;
		}
		case "inventory_ac130":
		case "ac130":
		{
			taacomdialog = "ac130Hacked";
			break;
		}
		case "inventory_chopper_gunner":
		case "chopper_gunner":
		{
			taacomdialog = "chopperGunnerHacked";
			break;
		}
		case "tank_robot":
		case "inventory_tank_robot":
		case "ai_tank_marker":
		{
			taacomdialog = "aiTankHacked";
			break;
		}
		case "cobra_20mm_comlink":
		case "helicopter_comlink":
		case "inventory_helicopter_comlink":
		{
			taacomdialog = "attackChopperHacked";
			break;
		}
		case "inventory_helicopter_guard":
		case "helicopter_guard":
		{
			taacomdialog = "heavyAttackChopperHacked";
			break;
		}
		case "counteruav":
		{
			taacomdialog = "cuavHacked";
			break;
		}
		case "dart":
		case "inventory_dart":
		{
			taacomdialog = "dartHacked";
			break;
		}
		case "drone_squadron":
		case "inventory_drone_squadron":
		{
			taacomdialog = "droneSquadHacked";
			break;
		}
		case "hoverjet":
		case "inventory_hoverjet":
		{
			taacomdialog = "hoverJetHacked";
			break;
		}
		case "recon_car":
		case "inventory_recon_car":
		{
			taacomdialog = "reconCarHacked";
			break;
		}
		case "inventory_recon_plane":
		case "recon_plane":
		{
			taacomdialog = "reconPlaneHacked";
			break;
		}
		case "remote_missile":
		case "inventory_remote_missile":
		{
			taacomdialog = "hellstormHacked";
			break;
		}
		case "inventory_planemortar":
		case "planemortar":
		{
			taacomdialog = "lightningStrikeHacked";
			break;
		}
		case "overwatch_helicopter":
		case "inventory_overwatch_helicopter":
		{
			taacomdialog = "overwatchHelicopterHacked";
			break;
		}
		case "inventory_straferun":
		case "straferun":
		{
			taacomdialog = "strafeRunHacked";
			break;
		}
		case "supplydrop":
		{
			taacomdialog = "supplyDropHacked";
			break;
		}
		case "uav":
		{
			taacomdialog = "uavHacked";
			break;
		}
		case "ultimate_turret":
		case "inventory_ultimate_turret":
		{
			taacomdialog = "sentryHacked";
			break;
		}
	}
	if(!isdefined(taacomdialog))
	{
		return undefined;
	}
	dialogalias = taacombundle.(taacomdialog);
	return dialogalias;
}

/*
	Name: function_bf569dab
	Namespace: battlechatter
	Checksum: 0xF7432902
	Offset: 0x1AB8
	Size: 0x1BC
	Parameters: 4
	Flags: Linked
*/
function function_bf569dab(hacker, originalowner, eventid, weapon)
{
	if(!function_5d7ad9a9(hacker, originalowner))
	{
		return;
	}
	var_a8aa2745 = function_c8663dbc(weapon, originalowner);
	if(!isdefined(var_a8aa2745))
	{
		return;
	}
	var_6ae4c5af = playsound(0, var_a8aa2745);
	if(!isdefined(var_6ae4c5af))
	{
		return;
	}
	while(isdefined(var_6ae4c5af) && soundplaying(var_6ae4c5af))
	{
		waitframe(1);
	}
	wait(0.1);
	if(!function_5d7ad9a9(hacker, originalowner))
	{
		return;
	}
	bundlename = hacker getmpdialogname();
	if(!isdefined(bundlename))
	{
		return;
	}
	playerbundle = getscriptbundle(bundlename);
	if(!isdefined(playerbundle))
	{
		return;
	}
	if(eventid === 3)
	{
		var_2131493 = playerbundle.var_489ef66b;
	}
	else
	{
		if(eventid === 4)
		{
			var_2131493 = playerbundle.var_5545b3a1;
		}
		else if(eventid === 5)
		{
			var_2131493 = playerbundle.var_1037850d;
		}
	}
	if(!isdefined(var_2131493))
	{
		return;
	}
	originalowner playsound(0, var_2131493);
}

/*
	Name: function_ee8935da
	Namespace: battlechatter
	Checksum: 0x6CF5ABD7
	Offset: 0x1C80
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_ee8935da(player)
{
	if(function_fc261b83())
	{
		return;
	}
	commander = "blops_commander";
	if(player.team === #"axis")
	{
		commander = "cdp_commander";
	}
	commanderbundle = getscriptbundle(commander);
	if(!isdefined(commanderbundle) || !isdefined("gamePlayerKicked"))
	{
		return;
	}
	dialogalias = commanderbundle.("gamePlayerKicked");
	if(!isdefined(dialogalias))
	{
		return;
	}
	voiceprefix = commanderbundle.("voiceprefix");
	if(isdefined(voiceprefix))
	{
		dialogalias = voiceprefix + dialogalias;
	}
	if(isdefined(dialogalias))
	{
		player playsound(0, dialogalias);
	}
}

/*
	Name: function_ad01601e
	Namespace: battlechatter
	Checksum: 0x5F527F6A
	Offset: 0x1D90
	Size: 0xCC
	Parameters: 2
	Flags: Linked
*/
function function_ad01601e(localclientnum, characterindex)
{
	characterfields = getcharacterfields(characterindex, currentsessionmode());
	if(isdefined(characterfields) && isdefined(characterfields.mpdialog))
	{
		dialogbundle = getscriptbundle(characterfields.mpdialog);
		alias = get_dialog_bundle_alias(dialogbundle, "characterSelect");
		if(isdefined(alias))
		{
			playsound(localclientnum, alias);
		}
	}
}

/*
	Name: play_dialog
	Namespace: battlechatter
	Checksum: 0xE57EE086
	Offset: 0x1E68
	Size: 0x14A
	Parameters: 2
	Flags: None
*/
function play_dialog(dialogkey, localclientnum)
{
	if(!isdefined(dialogkey) || !isdefined(localclientnum))
	{
		return -1;
	}
	dialogalias = self get_player_dialog_alias(dialogkey);
	if(!isdefined(dialogalias))
	{
		return -1;
	}
	soundpos = (self.origin[0], self.origin[1], self.origin[2] + 60);
	if(!function_65b9eb0f(localclientnum))
	{
		return self playsound(undefined, dialogalias, soundpos);
	}
	voicebox = spawn(localclientnum, self.origin, "script_model");
	self thread update_voice_origin(voicebox);
	voicebox thread delete_after(10);
	return voicebox playsound(undefined, dialogalias, soundpos);
}

/*
	Name: update_voice_origin
	Namespace: battlechatter
	Checksum: 0x352B39DA
	Offset: 0x1FC0
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function update_voice_origin(voicebox)
{
	if(1)
	{
		wait(0.1);
		return;
	}
}

/*
	Name: function_edf14b78
	Namespace: battlechatter
	Checksum: 0xFDB64487
	Offset: 0x2000
	Size: 0x126
	Parameters: 5
	Flags: Linked, Private
*/
function private function_edf14b78(var_726a8c2e, var_cc6c1b8f, localclientnum, weapon, seed)
{
	if(!isdefined(self))
	{
		return;
	}
	voiceprefix = function_b59a25c5(self);
	if(!isdefined(voiceprefix))
	{
		return;
	}
	var_5c238c21 = function_cdd81094(weapon);
	if(!isdefined(var_5c238c21))
	{
		return;
	}
	if(!isdefined(var_cc6c1b8f) || !isdefined(var_5c238c21.(var_cc6c1b8f)))
	{
		return;
	}
	if(self hasperk(localclientnum, #"specialty_quieter"))
	{
		return;
	}
	var_9a73928b = var_5c238c21.(var_cc6c1b8f);
	dialogkey = voiceprefix + var_9a73928b;
	var_ca5ab3a7 = self function_4b126e4c(0, dialogkey, seed);
}

/*
	Name: function_6bed8fc0
	Namespace: battlechatter
	Checksum: 0xB66267D0
	Offset: 0x2130
	Size: 0x116
	Parameters: 3
	Flags: Linked
*/
function function_6bed8fc0(speakingplayer, var_76787d10, seed)
{
	if(!isdefined(speakingplayer) || !isplayer(speakingplayer))
	{
		return;
	}
	if(!isdefined(var_76787d10) || !isplayer(var_76787d10))
	{
		return;
	}
	var_20fbd263 = function_b59a25c5(speakingplayer);
	if(!isdefined(var_20fbd263))
	{
		return;
	}
	var_2708cdb2 = function_58c93260(var_76787d10);
	if(!isdefined(var_2708cdb2) || !isdefined(var_2708cdb2.var_ff5e0d8e))
	{
		return;
	}
	dialogkey = var_20fbd263 + var_2708cdb2.var_ff5e0d8e;
	var_a874c58 = speakingplayer function_4b126e4c(0, dialogkey, seed);
}

/*
	Name: function_6afb2bd4
	Namespace: battlechatter
	Checksum: 0x96C9C5EE
	Offset: 0x2250
	Size: 0x54
	Parameters: 4
	Flags: Linked
*/
function function_6afb2bd4(speakingplayer, weapon, localclientnum, seed)
{
	weapon function_edf14b78("useAlias", "useFutzAlias", 0, localclientnum, seed);
}

/*
	Name: function_2ddd5b7d
	Namespace: battlechatter
	Checksum: 0x45D0745A
	Offset: 0x22B0
	Size: 0x4C
	Parameters: 4
	Flags: Linked
*/
function function_2ddd5b7d(speakingplayer, weapon, localclientnum, seed)
{
	weapon function_edf14b78("equipAlias", undefined, 0, localclientnum, seed);
}

/*
	Name: function_22ea6c18
	Namespace: battlechatter
	Checksum: 0xD85CB820
	Offset: 0x2308
	Size: 0x54
	Parameters: 4
	Flags: Linked
*/
function function_22ea6c18(speakingplayer, weapon, localclientnum, seed)
{
	weapon function_edf14b78("deployAlias", "deployFutzAlias", 0, localclientnum, seed);
}

/*
	Name: function_7d29bb1e
	Namespace: battlechatter
	Checksum: 0x6879E1A7
	Offset: 0x2368
	Size: 0x54
	Parameters: 4
	Flags: Linked
*/
function function_7d29bb1e(speakingplayer, weapon, localclientnum, seed)
{
	weapon function_edf14b78("destroyedAlias", "deployFutzAlias", 0, localclientnum, seed);
}

/*
	Name: function_f47a0e3b
	Namespace: battlechatter
	Checksum: 0xE8BB7D35
	Offset: 0x23C8
	Size: 0x25E
	Parameters: 3
	Flags: Linked
*/
function function_f47a0e3b(localclientnum, speakingplayer, dialogkey)
{
	if(!isdefined(dialogkey) || dialogkey == "" || !isalive(speakingplayer) || speakingplayer inlaststand() || ((isdefined(speakingplayer.var_20af9a03) ? speakingplayer.var_20af9a03 : 0) + 5000) > gettime())
	{
		return;
	}
	playerbundle = function_58c93260(speakingplayer);
	if(ishash(dialogkey) || sessionmodeiszombiesgame())
	{
		if(isdefined(level.var_4edd846))
		{
			dialogalias = self [[level.var_4edd846]](playerbundle, dialogkey);
			if(!isdefined(dialogalias) && isstring(dialogkey) && isdefined(playerbundle.(dialogkey)))
			{
				dialogalias = playerbundle.(dialogkey);
				if(isstring(dialogalias) && isstring(playerbundle.voiceprefix))
				{
					dialogalias = playerbundle.voiceprefix + dialogalias;
				}
			}
		}
		else
		{
			/#
				iprintlnbold(("" + function_9e72a96(dialogkey)) + "");
			#/
		}
	}
	else if(isdefined(playerbundle.voiceprefix) && isdefined(playerbundle.(dialogkey)))
	{
		dialogalias = playerbundle.voiceprefix + playerbundle.(dialogkey);
	}
	if(!isdefined(dialogalias))
	{
		return;
	}
	speakingplayer playsound(localclientnum, dialogalias);
	speakingplayer.var_20af9a03 = gettime();
}

