#using script_3f6516099f1d5ff1;
#using script_59f62971655f7103;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;

#namespace battlechatter;

/*
	Name: function_89f2df9
	Namespace: battlechatter
	Checksum: 0x177FEE31
	Offset: 0x3E8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"battlechatter", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: battlechatter
	Checksum: 0xC41C71B7
	Offset: 0x430
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
	Checksum: 0x2B329497
	Offset: 0x528
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
	Checksum: 0x7BF856FB
	Offset: 0x650
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
	Checksum: 0x587D4E8F
	Offset: 0x980
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
	Checksum: 0x5B3AE5EC
	Offset: 0xB50
	Size: 0x1D4
	Parameters: 6
	Flags: Linked
*/
function function_d2f35e13(localclientnum, var_c1a2172e, weapon, var_6ac148bc, var_5d738b56, seed)
{
	while(isdefined(var_6ac148bc) && soundplaying(var_6ac148bc))
	{
		waitframe(1);
	}
	wait(0.4);
	if(!isdefined(var_c1a2172e))
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
		if(function_d804d2f0(localclientnum, var_c1a2172e, var_5d738b56, successreactionradius * successreactionradius))
		{
			var_8a6b001a = var_5d738b56;
		}
	}
	else
	{
		var_8a6b001a = function_db89c38f(localclientnum, var_c1a2172e, successreactionradius * successreactionradius);
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
	Checksum: 0x125FA190
	Offset: 0xD30
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
	Checksum: 0xA58E1A25
	Offset: 0xEA8
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
	Checksum: 0xF8F110E5
	Offset: 0x1040
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
	Checksum: 0x3792BF9F
	Offset: 0x11C8
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
	Checksum: 0x59DBCACD
	Offset: 0x1518
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
	Checksum: 0xC1BD407B
	Offset: 0x15A0
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
		case "hash_21b346649d376bf3":
		{
			var_60d3002f = "jammerWeaponHacked";
			break;
		}
		case "eq_tripwire":
		{
			var_60d3002f = "meshMineWeaponHacked";
			break;
		}
		case "hash_4a4ba36128b6582f":
		{
			var_60d3002f = "seekerMineWeaponHacked";
			break;
		}
		case "eq_sensor":
		{
			var_60d3002f = "sensorDartHacked";
			break;
		}
		case "ability_smart_cover":
		case "hash_1fb0b26684caee0f":
		{
			var_60d3002f = "smartCoverHacked";
			break;
		}
		case "gadget_spawnbeacon":
		{
			var_60d3002f = "spawnBeaconHacked";
			break;
		}
		case "gadget_supplypod":
		{
			var_60d3002f = "supplyPodHacked";
			break;
		}
		case "trophy_system":
		{
			var_60d3002f = "trophyWeaponHacked";
			break;
		}
		case "hash_459c0007ec5e2470":
		case "ac130":
		{
			var_60d3002f = "ac130Hacked";
			break;
		}
		case "hash_1bf811fa5d684607":
		case "chopper_gunner":
		{
			var_60d3002f = "chopperGunnerHacked";
			break;
		}
		case "tank_robot":
		case "inventory_tank_robot":
		case "ai_tank_marker":
		{
			var_60d3002f = "aiTankHacked";
			break;
		}
		case "cobra_20mm_comlink":
		case "helicopter_comlink":
		case "inventory_helicopter_comlink":
		{
			var_60d3002f = "attackChopperHacked";
			break;
		}
		case "inventory_helicopter_guard":
		case "helicopter_guard":
		{
			var_60d3002f = "heavyAttackChopperHacked";
			break;
		}
		case "counteruav":
		{
			var_60d3002f = "cuavHacked";
			break;
		}
		case "dart":
		case "inventory_dart":
		{
			var_60d3002f = "dartHacked";
			break;
		}
		case "drone_squadron":
		case "hash_3447a6457d26a42e":
		{
			var_60d3002f = "droneSquadHacked";
			break;
		}
		case "hoverjet":
		case "hash_511b5c81a984baf9":
		{
			var_60d3002f = "hoverJetHacked";
			break;
		}
		case "recon_car":
		case "inventory_recon_car":
		{
			var_60d3002f = "reconCarHacked";
			break;
		}
		case "hash_62a2088c3368ea":
		case "recon_plane":
		{
			var_60d3002f = "reconPlaneHacked";
			break;
		}
		case "remote_missile":
		case "inventory_remote_missile":
		{
			var_60d3002f = "hellstormHacked";
			break;
		}
		case "inventory_planemortar":
		case "planemortar":
		{
			var_60d3002f = "lightningStrikeHacked";
			break;
		}
		case "overwatch_helicopter":
		case "hash_74ea4af18853e9af":
		{
			var_60d3002f = "overwatchHelicopterHacked";
			break;
		}
		case "hash_4307d5aaa7ce21d4":
		case "straferun":
		{
			var_60d3002f = "strafeRunHacked";
			break;
		}
		case "supplydrop":
		{
			var_60d3002f = "supplyDropHacked";
			break;
		}
		case "uav":
		{
			var_60d3002f = "uavHacked";
			break;
		}
		case "ultimate_turret":
		case "inventory_ultimate_turret":
		{
			var_60d3002f = "sentryHacked";
			break;
		}
	}
	if(!isdefined(var_60d3002f))
	{
		return undefined;
	}
	dialogalias = taacombundle.(var_60d3002f);
	return dialogalias;
}

/*
	Name: function_bf569dab
	Namespace: battlechatter
	Checksum: 0xD6F02DE
	Offset: 0x1A98
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
	Checksum: 0x12A49CE8
	Offset: 0x1C60
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
	Checksum: 0x1D9CAB91
	Offset: 0x1D70
	Size: 0xCC
	Parameters: 2
	Flags: Linked
*/
function function_ad01601e(localclientnum, characterindex)
{
	var_bacff7f = getcharacterfields(characterindex, currentsessionmode());
	if(isdefined(var_bacff7f) && isdefined(var_bacff7f.mpdialog))
	{
		dialogbundle = getscriptbundle(var_bacff7f.mpdialog);
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
	Checksum: 0xB808FB39
	Offset: 0x1E48
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
	Checksum: 0x2308E773
	Offset: 0x1FA0
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
	Checksum: 0xCF70487D
	Offset: 0x1FE0
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
	Checksum: 0xA7581333
	Offset: 0x2110
	Size: 0x116
	Parameters: 3
	Flags: Linked
*/
function function_6bed8fc0(var_70b80ca6, var_76787d10, seed)
{
	if(!isdefined(var_70b80ca6) || !isplayer(var_70b80ca6))
	{
		return;
	}
	if(!isdefined(var_76787d10) || !isplayer(var_76787d10))
	{
		return;
	}
	var_20fbd263 = function_b59a25c5(var_70b80ca6);
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
	var_a874c58 = var_70b80ca6 function_4b126e4c(0, dialogkey, seed);
}

/*
	Name: function_6afb2bd4
	Namespace: battlechatter
	Checksum: 0x3D953A61
	Offset: 0x2230
	Size: 0x54
	Parameters: 4
	Flags: Linked
*/
function function_6afb2bd4(var_70b80ca6, weapon, localclientnum, seed)
{
	weapon function_edf14b78("useAlias", "useFutzAlias", 0, localclientnum, seed);
}

/*
	Name: function_2ddd5b7d
	Namespace: battlechatter
	Checksum: 0xAA53581E
	Offset: 0x2290
	Size: 0x4C
	Parameters: 4
	Flags: Linked
*/
function function_2ddd5b7d(var_70b80ca6, weapon, localclientnum, seed)
{
	weapon function_edf14b78("equipAlias", undefined, 0, localclientnum, seed);
}

/*
	Name: function_22ea6c18
	Namespace: battlechatter
	Checksum: 0x6010D8C1
	Offset: 0x22E8
	Size: 0x54
	Parameters: 4
	Flags: Linked
*/
function function_22ea6c18(var_70b80ca6, weapon, localclientnum, seed)
{
	weapon function_edf14b78("deployAlias", "deployFutzAlias", 0, localclientnum, seed);
}

/*
	Name: function_7d29bb1e
	Namespace: battlechatter
	Checksum: 0xB4B7E92D
	Offset: 0x2348
	Size: 0x54
	Parameters: 4
	Flags: Linked
*/
function function_7d29bb1e(var_70b80ca6, weapon, localclientnum, seed)
{
	weapon function_edf14b78("destroyedAlias", "deployFutzAlias", 0, localclientnum, seed);
}

/*
	Name: function_f47a0e3b
	Namespace: battlechatter
	Checksum: 0x6324F438
	Offset: 0x23A8
	Size: 0x25E
	Parameters: 3
	Flags: Linked
*/
function function_f47a0e3b(localclientnum, var_70b80ca6, dialogkey)
{
	if(!isdefined(dialogkey) || dialogkey == "" || !isalive(var_70b80ca6) || var_70b80ca6 inlaststand() || ((isdefined(var_70b80ca6.var_20af9a03) ? var_70b80ca6.var_20af9a03 : 0) + 5000) > gettime())
	{
		return;
	}
	playerbundle = function_58c93260(var_70b80ca6);
	if(function_7a600918(dialogkey) || sessionmodeiszombiesgame())
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
	var_70b80ca6 playsound(localclientnum, dialogalias);
	var_70b80ca6.var_20af9a03 = gettime();
}

