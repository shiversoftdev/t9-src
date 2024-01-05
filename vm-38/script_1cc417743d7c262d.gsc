#using script_396f7d71538c9677;
#using scripts\core_common\util_shared.gsc;
#using script_3d703ef87a841fe4;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\audio_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace globallogic_audio;

/*
	Name: function_57f9a0a
	Namespace: globallogic_audio
	Checksum: 0x9AA25197
	Offset: 0x590
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_57f9a0a()
{
	level notify(1860565968);
}

/*
	Name: __init__system__
	Namespace: globallogic_audio
	Checksum: 0x5C69CACD
	Offset: 0x5B0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"globallogic_audio", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: globallogic_audio
	Checksum: 0xDA72249F
	Offset: 0x5F8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level thread function_dd5d8f8e();
}

/*
	Name: function_dd5d8f8e
	Namespace: globallogic_audio
	Checksum: 0x9C6AC332
	Offset: 0x620
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function function_dd5d8f8e()
{
	if(!isdefined(game.musicset))
	{
		game.musicset = randomintrange(1, 6);
		if(game.musicset <= 9)
		{
			game.musicset = "0" + game.musicset;
		}
		game.musicset = "_" + game.musicset;
	}
}

/*
	Name: function_6e084fd3
	Namespace: globallogic_audio
	Checksum: 0x62B16BC
	Offset: 0x6A8
	Size: 0x4FA
	Parameters: 2
	Flags: Linked
*/
function function_6e084fd3(var_37ecca7, taacombundle)
{
	bundlename = undefined;
	switch(var_37ecca7)
	{
		case "tank_robot":
		{
			bundlename = taacombundle.aitankdialogbundle;
			break;
		}
		case "inventory_chopper_gunner":
		case "chopper_gunner":
		{
			bundlename = taacombundle.var_3f45482e;
			break;
		}
		case "counteruav":
		{
			bundlename = taacombundle.counteruavdialogbundle;
			break;
		}
		case "dart":
		{
			bundlename = taacombundle.dartdialogbundle;
			break;
		}
		case "sig_lmg":
		{
			bundlename = taacombundle.var_4129b7a;
			break;
		}
		case "drone_squadron":
		{
			bundlename = taacombundle.var_69a9ca12;
			break;
		}
		case "sig_bow_flame":
		{
			bundlename = taacombundle.var_82cefc8c;
			break;
		}
		case "hero_flamethrower":
		{
			bundlename = taacombundle.var_43bcc95e;
			break;
		}
		case "inventory_ac130":
		case "ac130":
		{
			bundlename = taacombundle.var_71693229;
			break;
		}
		case "hero_pineapplegun":
		{
			bundlename = taacombundle.var_dcfac86e;
			break;
		}
		case "helicopter_comlink":
		case "inventory_helicopter_comlink":
		{
			bundlename = taacombundle.helicopterdialogbundle;
			break;
		}
		case "inventory_helicopter_guard":
		case "helicopter_guard":
		{
			bundlename = taacombundle.var_7275c81d;
			break;
		}
		case "hero_annihilator":
		{
			bundlename = taacombundle.var_679bf19;
			break;
		}
		case "dog":
		{
			bundlename = taacombundle.var_f68cebf2;
			break;
		}
		case "hoverjet":
		case "inventory_hoverjet":
		{
			bundlename = taacombundle.var_c96adb95;
			break;
		}
		case "overwatch_helicopter":
		case "inventory_overwatch_helicopter":
		{
			bundlename = taacombundle.var_f8bd3ac5;
			break;
		}
		case "hash_59687845e5356ded":
		{
			bundlename = taacombundle.var_4062b33e;
			break;
		}
		case "planemortar":
		{
			bundlename = taacombundle.planemortardialogbundle;
			break;
		}
		case "recon_car":
		{
			bundlename = taacombundle.rcbombdialogbundle;
			break;
		}
		case "inventory_recon_plane":
		case "recon_plane":
		{
			bundlename = taacombundle.var_5b8e4a97;
			break;
		}
		case "remote_missile":
		case "inventory_remote_missile":
		{
			bundlename = taacombundle.remotemissiledialogbundle;
			break;
		}
		case "inventory_straferun":
		case "straferun":
		{
			bundlename = taacombundle.var_66389705;
			break;
		}
		case "supply_drop":
		{
			bundlename = taacombundle.supplydropdialogbundle;
			break;
		}
		case "swat_team":
		{
			bundlename = taacombundle.var_d93fd150;
			break;
		}
		case "uav":
		{
			bundlename = taacombundle.uavdialogbundle;
			break;
		}
		case "ultimate_turret":
		case "inventory_ultimate_turret":
		{
			bundlename = taacombundle.var_c9b104f1;
			break;
		}
		case "hash_49d514608adc6a24":
		case "jetfighter":
		{
			bundlename = taacombundle.var_2f6e3044;
			break;
		}
		case "napalm_strike_zm":
		case "napalm_strike":
		case "hash_67f88dbc909e85f8":
		{
			bundlename = taacombundle.var_3ab478cf;
			break;
		}
		case "weapon_armor":
		case "hash_6bf7a941e385e178":
		{
			bundlename = taacombundle.var_17e0a105;
			break;
		}
		default:
		{
			break;
		}
	}
	if(!isdefined(bundlename))
	{
		return;
	}
	killstreakbundle = getscriptbundle(bundlename);
	return killstreakbundle;
}

/*
	Name: set_leader_gametype_dialog
	Namespace: globallogic_audio
	Checksum: 0x94D4CACF
	Offset: 0xBB0
	Size: 0xC6
	Parameters: 6
	Flags: None
*/
function set_leader_gametype_dialog(startgamedialogkey, starthcgamedialogkey, offenseorderdialogkey, defenseorderdialogkey, var_2888cc9d, var_826b3c1a)
{
	level.leaderdialog = spawnstruct();
	level.leaderdialog.startgamedialog = startgamedialogkey;
	level.leaderdialog.var_f6fda321 = var_2888cc9d;
	level.leaderdialog.starthcgamedialog = starthcgamedialogkey;
	level.leaderdialog.var_d04b3734 = var_826b3c1a;
	level.leaderdialog.offenseorderdialog = offenseorderdialogkey;
	level.leaderdialog.defenseorderdialog = defenseorderdialogkey;
}

/*
	Name: function_ac2cb1bc
	Namespace: globallogic_audio
	Checksum: 0x40216203
	Offset: 0xC80
	Size: 0x82
	Parameters: 0
	Flags: None
*/
function function_ac2cb1bc()
{
	foreach(player in level.players)
	{
		player.leaderdialogqueue = [];
	}
}

/*
	Name: flush_dialog
	Namespace: globallogic_audio
	Checksum: 0xB4CF9C03
	Offset: 0xD10
	Size: 0x88
	Parameters: 0
	Flags: None
*/
function flush_dialog()
{
	foreach(player in level.players)
	{
		player flush_dialog_on_player();
	}
}

/*
	Name: flush_dialog_on_player
	Namespace: globallogic_audio
	Checksum: 0xBC10C0AA
	Offset: 0xDA0
	Size: 0x56
	Parameters: 0
	Flags: Linked
*/
function flush_dialog_on_player()
{
	if(!isdefined(self.leaderdialogqueue))
	{
		self.leaderdialogqueue = [];
	}
	self.currentleaderdialog = undefined;
	if(!isdefined(self.killstreakdialogqueue))
	{
		self.killstreakdialogqueue = [];
	}
	self.scorestreakdialogplaying = 0;
	self notify(#"flush_dialog");
}

/*
	Name: flush_killstreak_dialog_on_player
	Namespace: globallogic_audio
	Checksum: 0xCABD11A1
	Offset: 0xE00
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function flush_killstreak_dialog_on_player(killstreakid)
{
	if(!isdefined(killstreakid) || !isdefined(self.killstreakdialogqueue))
	{
		return;
	}
	for(i = self.killstreakdialogqueue.size - 1; i >= 0; i--)
	{
		if(killstreakid === self.killstreakdialogqueue[i].killstreakid)
		{
			arrayremoveindex(self.killstreakdialogqueue, i);
		}
	}
}

/*
	Name: function_fd32b1bd
	Namespace: globallogic_audio
	Checksum: 0x56CE908A
	Offset: 0xE98
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_fd32b1bd(killstreaktype)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(killstreaktype) || !isdefined(self.killstreakdialogqueue))
	{
		return;
	}
	for(i = self.killstreakdialogqueue.size - 1; i >= 0; i--)
	{
		if(killstreaktype === self.killstreakdialogqueue[i].killstreaktype)
		{
			arrayremoveindex(self.killstreakdialogqueue, i);
		}
	}
}

/*
	Name: flush_objective_dialog
	Namespace: globallogic_audio
	Checksum: 0x541D5350
	Offset: 0xF38
	Size: 0x98
	Parameters: 1
	Flags: None
*/
function flush_objective_dialog(objectivekey)
{
	foreach(player in level.players)
	{
		player flush_objective_dialog_on_player(objectivekey);
	}
}

/*
	Name: flush_objective_dialog_on_player
	Namespace: globallogic_audio
	Checksum: 0x38EC8A07
	Offset: 0xFD8
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function flush_objective_dialog_on_player(objectivekey)
{
	if(!isdefined(objectivekey) || !isdefined(self.leaderdialogqueue))
	{
		return;
	}
	for(i = self.leaderdialogqueue.size - 1; i >= 0; i--)
	{
		if(objectivekey === self.leaderdialogqueue[i].objectivekey)
		{
			arrayremoveindex(self.leaderdialogqueue, i);
			break;
		}
	}
}

/*
	Name: flush_leader_dialog_key
	Namespace: globallogic_audio
	Checksum: 0xCAA75061
	Offset: 0x1070
	Size: 0x98
	Parameters: 1
	Flags: None
*/
function flush_leader_dialog_key(dialogkey)
{
	foreach(player in level.players)
	{
		player flush_leader_dialog_key_on_player(dialogkey);
	}
}

/*
	Name: flush_leader_dialog_key_on_player
	Namespace: globallogic_audio
	Checksum: 0xCAB55AFE
	Offset: 0x1110
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function flush_leader_dialog_key_on_player(dialogkey)
{
	if(!isdefined(dialogkey))
	{
		return;
	}
	if(!isdefined(self.leaderdialogqueue))
	{
		return;
	}
	for(i = self.leaderdialogqueue.size - 1; i >= 0; i--)
	{
		if(dialogkey === self.leaderdialogqueue[i].dialogkey)
		{
			arrayremoveindex(self.leaderdialogqueue, i);
		}
	}
}

/*
	Name: play_taacom_dialog
	Namespace: globallogic_audio
	Checksum: 0x7B7C2BA1
	Offset: 0x11A8
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function play_taacom_dialog(dialogkey, killstreaktype, killstreakid, var_46bd7973, var_8a6b001a, weapon, priority)
{
	self killstreak_dialog_on_player(dialogkey, killstreaktype, killstreakid, undefined, var_46bd7973, var_8a6b001a, weapon, priority);
}

/*
	Name: killstreak_dialog_on_player
	Namespace: globallogic_audio
	Checksum: 0xD8A79A0C
	Offset: 0x1218
	Size: 0x1B4
	Parameters: 8
	Flags: Linked
*/
function killstreak_dialog_on_player(dialogkey, killstreaktype, killstreakid, pilotindex, var_46bd7973, var_8a6b001a, weapon, priority)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.killstreakdialogqueue))
	{
		return;
	}
	if(!isdefined(dialogkey))
	{
		return;
	}
	if(!level.allowannouncer)
	{
		return;
	}
	if(level.gameended)
	{
		return;
	}
	newdialog = spawnstruct();
	newdialog.dialogkey = dialogkey;
	newdialog.killstreaktype = killstreaktype;
	newdialog.pilotindex = pilotindex;
	newdialog.killstreakid = killstreakid;
	newdialog.var_46bd7973 = var_46bd7973;
	newdialog.var_8a6b001a = var_8a6b001a;
	newdialog.weapon = weapon;
	if(priority === 1)
	{
		arrayinsert(self.killstreakdialogqueue, newdialog, 0);
	}
	else
	{
		self.killstreakdialogqueue[self.killstreakdialogqueue.size] = newdialog;
	}
	if(self.killstreakdialogqueue.size > 1 || isdefined(self.currentkillstreakdialog))
	{
		return;
	}
	if(self.playingdialog === 1 && dialogkey == "arrive")
	{
		self thread wait_for_player_dialog();
	}
	else
	{
		self thread play_next_killstreak_dialog();
	}
}

/*
	Name: wait_for_player_dialog
	Namespace: globallogic_audio
	Checksum: 0x462BD498
	Offset: 0x13D8
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function wait_for_player_dialog()
{
	self endon(#"disconnect", #"flush_dialog");
	level endon(#"game_ended");
	while(self.playingdialog)
	{
		wait(0.5);
	}
	if(!isdefined(self))
	{
		return;
	}
	self thread play_next_killstreak_dialog();
}

/*
	Name: play_next_killstreak_dialog
	Namespace: globallogic_audio
	Checksum: 0x33566FB3
	Offset: 0x1458
	Size: 0x3B4
	Parameters: 0
	Flags: Linked
*/
function play_next_killstreak_dialog()
{
	self endon(#"disconnect", #"flush_dialog");
	level endon(#"game_ended");
	if(self.killstreakdialogqueue.size == 0)
	{
		self.currentkillstreakdialog = undefined;
		return;
	}
	if(isdefined(self.var_9c1a4644))
	{
		taacombundle = getscriptbundle(self.var_9c1a4644);
	}
	else
	{
		if(isdefined(self.pers[level.var_bc01f047]))
		{
			taacombundle = getscriptbundle(self.pers[level.var_bc01f047]);
		}
		else
		{
			self.killstreakdialogqueue = [];
			self.currentkillstreakdialog = undefined;
			return;
		}
	}
	dialogalias = undefined;
	while(!isdefined(dialogalias) && self.killstreakdialogqueue.size > 0)
	{
		nextdialog = self.killstreakdialogqueue[0];
		arrayremoveindex(self.killstreakdialogqueue, 0);
		if(isdefined(nextdialog.killstreaktype))
		{
			if(isdefined(nextdialog.pilotindex))
			{
				pilotarray = taacombundle.pilotbundles[nextdialog.killstreaktype];
				if(isdefined(pilotarray) && nextdialog.pilotindex < pilotarray.size)
				{
					killstreakbundle = getscriptbundle(pilotarray[nextdialog.pilotindex]);
					if(isdefined(killstreakbundle))
					{
						dialogalias = get_dialog_bundle_alias(killstreakbundle, nextdialog.dialogkey);
					}
				}
			}
			else if(isdefined(nextdialog.killstreaktype))
			{
				killstreakbundle = function_6e084fd3(nextdialog.killstreaktype, taacombundle);
				if(isdefined(killstreakbundle))
				{
					dialogalias = self get_dialog_bundle_alias(killstreakbundle, nextdialog.dialogkey);
				}
			}
		}
		else
		{
			dialogalias = self get_dialog_bundle_alias(taacombundle, nextdialog.dialogkey);
		}
	}
	if(!isdefined(dialogalias))
	{
		self.currentkillstreakdialog = undefined;
		return;
	}
	waittime = 0;
	if(isdefined(nextdialog.var_46bd7973) && isdefined(nextdialog.var_8a6b001a) && isalive(nextdialog.var_8a6b001a))
	{
		waittime = waittime + battlechatter::mpdialog_value("taacomHackAndReplyDialogBuffer", 0);
		self thread function_30f16f29(nextdialog.var_46bd7973, nextdialog.var_8a6b001a, nextdialog.weapon);
	}
	else
	{
		/#
			function_d9079fc1(dialogalias, "");
		#/
		self playlocalsound(dialogalias);
		waittime = waittime + battlechatter::mpdialog_value("killstreakDialogBuffer", 0);
	}
	self.currentkillstreakdialog = nextdialog;
	self thread wait_next_killstreak_dialog(waittime);
}

/*
	Name: wait_next_killstreak_dialog
	Namespace: globallogic_audio
	Checksum: 0xFE3CDB4A
	Offset: 0x1818
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function wait_next_killstreak_dialog(waittime)
{
	self endon(#"disconnect", #"flush_dialog");
	level endon(#"game_ended");
	wait(waittime);
	if(!isdefined(self))
	{
		return;
	}
	self thread play_next_killstreak_dialog();
}

/*
	Name: function_30f16f29
	Namespace: globallogic_audio
	Checksum: 0x8988A4
	Offset: 0x1888
	Size: 0x5C
	Parameters: 3
	Flags: Linked
*/
function function_30f16f29(var_46bd7973, var_8a6b001a, weapon)
{
	if(isdefined(var_8a6b001a) && isalive(var_8a6b001a))
	{
		var_8a6b001a function_18aba49d(var_46bd7973, weapon, self);
	}
}

/*
	Name: leader_dialog_for_other_teams
	Namespace: globallogic_audio
	Checksum: 0x146F9402
	Offset: 0x18F0
	Size: 0xF0
	Parameters: 7
	Flags: Linked
*/
function leader_dialog_for_other_teams(dialogkey, skipteam, objectivekey, killstreakid, dialogbufferkey, skippable, var_6ad14004)
{
	/#
		assert(isdefined(skipteam));
	#/
	foreach(_ in level.teams)
	{
		if(team != skipteam)
		{
			leader_dialog(dialogkey, team, objectivekey, killstreakid, dialogbufferkey, skippable, var_6ad14004);
		}
	}
}

/*
	Name: function_61e17de0
	Namespace: globallogic_audio
	Checksum: 0xB4CA1909
	Offset: 0x19E8
	Size: 0xF0
	Parameters: 8
	Flags: Linked
*/
function function_61e17de0(dialogkey, players, objectivekey, killstreakid, dialogbufferkey, dialogalias, skippable, var_6ad14004)
{
	/#
		assert(isdefined(players));
	#/
	foreach(player in players)
	{
		player leader_dialog_on_player(dialogkey, objectivekey, killstreakid, dialogbufferkey, undefined, dialogalias, skippable, var_6ad14004);
	}
}

/*
	Name: function_248fc9f7
	Namespace: globallogic_audio
	Checksum: 0x32F1524
	Offset: 0x1AE0
	Size: 0xEC
	Parameters: 8
	Flags: None
*/
function function_248fc9f7(dialogkey, team, excludelist, objectivekey, killstreakid, dialogbufferkey, skippable, var_6ad14004)
{
	/#
		assert(isdefined(excludelist));
	#/
	/#
		assert(isdefined(level.players));
	#/
	players = (isdefined(team) ? getplayers(team) : level.players);
	players = array::exclude(players, excludelist);
	function_61e17de0(dialogkey, players, objectivekey, killstreakid, dialogbufferkey, skippable, var_6ad14004);
}

/*
	Name: function_b4319f8e
	Namespace: globallogic_audio
	Checksum: 0xF371275C
	Offset: 0x1BD8
	Size: 0xEC
	Parameters: 8
	Flags: None
*/
function function_b4319f8e(dialogkey, team, exclude, objectivekey, killstreakid, dialogbufferkey, skippable, var_6ad14004)
{
	/#
		assert(isdefined(exclude));
	#/
	/#
		assert(isdefined(level.players));
	#/
	players = (isdefined(team) ? getplayers(team) : level.players);
	arrayremovevalue(players, exclude);
	function_61e17de0(dialogkey, players, objectivekey, killstreakid, dialogbufferkey, skippable, var_6ad14004);
}

/*
	Name: leader_dialog
	Namespace: globallogic_audio
	Checksum: 0x8AB9CD0B
	Offset: 0x1CD0
	Size: 0xC4
	Parameters: 7
	Flags: Linked
*/
function leader_dialog(dialogkey, team, objectivekey, killstreakid, dialogbufferkey, skippable, var_6ad14004)
{
	if(is_true(level.is_survival))
	{
		if(isdefined(dialogkey))
		{
			if(issubstr(dialogkey, "Response"))
			{
				return;
			}
		}
	}
	players = getplayers(team);
	function_61e17de0(dialogkey, players, objectivekey, killstreakid, dialogbufferkey, undefined, skippable, var_6ad14004);
}

/*
	Name: leader_dialog_on_player
	Namespace: globallogic_audio
	Checksum: 0xAAA80DA
	Offset: 0x1DA0
	Size: 0x3E4
	Parameters: 8
	Flags: Linked
*/
function leader_dialog_on_player(dialogkey, objectivekey, killstreakid, dialogbufferkey, introdialog, dialogalias, skippable, var_6ad14004)
{
	if(!isdefined(dialogkey))
	{
		return;
	}
	if(!level.allowannouncer)
	{
		return;
	}
	if(!is_true(self.playleaderdialog) && !is_true(introdialog))
	{
		return;
	}
	if(skippable === 1 && isdefined(self.currentleaderdialog))
	{
		return;
	}
	self flush_objective_dialog_on_player(objectivekey);
	if(self.leaderdialogqueue.size == 0 && isdefined(self.currentleaderdialog) && isdefined(objectivekey) && self.currentleaderdialog.objectivekey === objectivekey && self.currentleaderdialog.dialogkey == dialogkey)
	{
		return;
	}
	if(isdefined(killstreakid))
	{
		foreach(item in self.leaderdialogqueue)
		{
			if(item.dialogkey == dialogkey)
			{
				item.killstreakids[item.killstreakids.size] = killstreakid;
				return;
			}
		}
		if(self.leaderdialogqueue.size == 0 && isdefined(self.currentleaderdialog) && self.currentleaderdialog.dialogkey == dialogkey)
		{
			if(self.currentleaderdialog.playmultiple === 1)
			{
				return;
			}
			playmultiple = 1;
		}
	}
	newitem = spawnstruct();
	newitem.priority = dialogkey_priority(dialogkey);
	newitem.dialogkey = dialogkey;
	newitem.multipledialogkey = level.multipledialogkeys[dialogkey];
	newitem.playmultiple = playmultiple;
	newitem.objectivekey = objectivekey;
	newitem.var_6ad14004 = var_6ad14004;
	if(isdefined(killstreakid))
	{
		newitem.killstreakids = [];
		newitem.killstreakids[0] = killstreakid;
	}
	newitem.dialogbufferkey = dialogbufferkey;
	iteminserted = 0;
	if(isdefined(newitem.priority))
	{
		for(i = 0; i < self.leaderdialogqueue.size; i++)
		{
			if(isdefined(self.leaderdialogqueue[i].priority) && self.leaderdialogqueue[i].priority <= newitem.priority)
			{
				continue;
			}
			arrayinsert(self.leaderdialogqueue, newitem, i);
			iteminserted = 1;
			break;
		}
	}
	if(!iteminserted)
	{
		self.leaderdialogqueue[self.leaderdialogqueue.size] = newitem;
	}
	if(isdefined(self.currentleaderdialog))
	{
		return;
	}
	self thread play_next_leader_dialog(dialogalias);
}

/*
	Name: play_next_leader_dialog
	Namespace: globallogic_audio
	Checksum: 0xCF6B2996
	Offset: 0x2190
	Size: 0x404
	Parameters: 1
	Flags: Linked
*/
function play_next_leader_dialog(dialogalias)
{
	self endon(#"disconnect", #"flush_dialog");
	level endon(#"game_ended");
	if(self.leaderdialogqueue.size == 0)
	{
		self.currentleaderdialog = undefined;
		self notify(#"hash_73f839d8939452ad");
		return;
	}
	nextdialog = self.leaderdialogqueue[0];
	arrayremoveindex(self.leaderdialogqueue, 0);
	dialogkey = nextdialog.dialogkey;
	if(isdefined(nextdialog.killstreakids))
	{
		triggeredcount = 0;
		foreach(killstreakid in nextdialog.killstreakids)
		{
			if(isdefined(level.killstreaks_triggered[killstreakid]))
			{
				triggeredcount++;
			}
		}
		if(triggeredcount == 0)
		{
			self thread play_next_leader_dialog();
			return;
		}
		if(triggeredcount > 1 || nextdialog.playmultiple === 1)
		{
			if(isdefined(level.multipledialogkeys[dialogkey]))
			{
				dialogkey = level.multipledialogkeys[dialogkey];
			}
		}
	}
	if(dialogkey === "gamePlayerKicked")
	{
		self function_18aba49d(2);
	}
	else
	{
		if(dialogkey === "gameDraw")
		{
			self function_18aba49d(12);
		}
		else
		{
			if(dialogkey === "gameLost")
			{
				self function_18aba49d(13);
			}
			else
			{
				if(dialogkey === "gameWon")
				{
					self function_18aba49d(14);
				}
				else
				{
					if(!isdefined(dialogalias))
					{
						dialogalias = self get_commander_dialog_alias(dialogkey, nextdialog.var_6ad14004);
					}
					if(!isdefined(dialogalias))
					{
						self thread play_next_leader_dialog();
						return;
					}
					/#
						function_d9079fc1(dialogalias, "");
					#/
					self playlocalsound(dialogalias);
				}
			}
		}
	}
	nextdialog.playtime = gettime();
	self.currentleaderdialog = nextdialog;
	if(is_true(level.var_28ebc1e8))
	{
		dialogbuffer = float(max((isdefined(soundgetplaybacktime(dialogalias)) ? soundgetplaybacktime(dialogalias) : 500), 500)) / 1000;
	}
	else
	{
		dialogbuffer = battlechatter::mpdialog_value(nextdialog.dialogbufferkey, battlechatter::mpdialog_value("commanderDialogBuffer", 0));
	}
	self thread wait_next_leader_dialog(dialogbuffer);
}

/*
	Name: wait_next_leader_dialog
	Namespace: globallogic_audio
	Checksum: 0x2EE00DB7
	Offset: 0x25A0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function wait_next_leader_dialog(dialogbuffer)
{
	self endon(#"disconnect", #"flush_dialog");
	wait(dialogbuffer);
	if(isdefined(self))
	{
		self thread play_next_leader_dialog();
	}
}

/*
	Name: dialogkey_priority
	Namespace: globallogic_audio
	Checksum: 0xADCBA744
	Offset: 0x2600
	Size: 0x6A4
	Parameters: 1
	Flags: Linked
*/
function dialogkey_priority(dialogkey)
{
	switch(dialogkey)
	{
		case "enemydartmultiple":
		case "enemyhelicoptergunner":
		case "enemyrcbomb":
		case "enemydronestrikemultiple":
		case "enemyplanemortarmultiple":
		case "enemyaitank":
		case "enemymicrowaveturretmultiple":
		case "enemyplanemortar":
		case "enemyrapsmultiple":
		case "enemycombatrobot":
		case "enemyturretmultiple":
		case "enemydronestrike":
		case "enemyturret":
		case "enemyhelicoptergunnermultiple":
		case "enemyrcbombmultiple":
		case "enemyremotemissilemultiple":
		case "enemyraps":
		case "enemyplanemortarused":
		case "enemyhelicoptermultiple":
		case "enemymicrowaveturret":
		case "enemyaitankmultiple":
		case "enemydart":
		case "enemyremotemissile":
		case "enemycombatrobotmultiple":
		case "enemyhelicopter":
		{
			return 1;
		}
		case "gamelosing":
		case "nearwinning":
		case "nearlosing":
		case "roundencouragelastplayer":
		case "gamewinning":
		case "gameleadtaken":
		case "gameleadlost":
		case "neardrawing":
		{
			return 1;
		}
		case "upltheydrop":
		case "domenemyhasc":
		case "domenemyhasb":
		case "domenemyhasa":
		case "bombenemytaken":
		case "uplwetake":
		case "sfgrobotcloseattacker":
		case "bombdefused":
		case "domenemysecuringc":
		case "domenemysecuringb":
		case "domenemysecuringa":
		case "kothlocated":
		case "upltheyuplink":
		case "uplorders":
		case "sfgrobotneedreboot":
		case "domfriendlysecuredall":
		case "hubsonline":
		case "sfgstarttow":
		case "sfgtheyreturn":
		case "sfgrobotunderfire":
		case "kothonline":
		case "bombfriendlytaken":
		case "ctffriendlyflagcaptured":
		case "sfgrobotrebootedtowdefender":
		case "hubmoved":
		case "sfgrobotrebootedtowattacker":
		case "uplweuplinkremote":
		case "bombplanted":
		case "uplreset":
		case "sfgrobotrebooteddefender":
		case "ctfenemyflagdropped":
		case "sfgrobotunderfireneutral":
		case "ctffriendlyflagdropped":
		case "kothcontested":
		case "ctfenemyflagtaken":
		case "uplwedrop":
		case "uplweuplink":
		case "hubsoffline":
		case "domenemysecureda":
		case "domenemysecuredb":
		case "domenemysecuredc":
		case "upltransferred":
		case "sfgstarthrdefend":
		case "upltheyuplinkremote":
		case "ctfenemyflagreturned":
		case "sfgstarthrattack":
		case "sfgrobotclosedefender":
		case "kothsecured":
		case "sfgwereturn":
		case "hubsmoved":
		case "sfgstartattack":
		case "ctfenemyflagcaptured":
		case "sfgrobotdisabledattacker":
		case "sfgrobotrebootedattacker":
		case "hubonline":
		case "sfgstartdefend":
		case "ctffriendlyflagreturned":
		case "ctffriendlyflagtaken":
		case "upltheytake":
		case "huboffline":
		case "sfgrobotdisableddefender":
		case "domfriendlysecuredc":
		case "domfriendlysecuredb":
		case "domfriendlysecureda":
		case "kothcaptured":
		case "kothlost":
		case "bombfriendlydropped":
		case "domfriendlysecuringb":
		case "domfriendlysecuringc":
		case "domfriendlysecuringa":
		{
			return 1;
		}
	}
	return undefined;
}

/*
	Name: play_equipment_destroyed_on_player
	Namespace: globallogic_audio
	Checksum: 0x63EF29DE
	Offset: 0x2CB0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function play_equipment_destroyed_on_player()
{
	self play_taacom_dialog("equipmentDestroyed");
}

/*
	Name: play_equipment_hacked_on_player
	Namespace: globallogic_audio
	Checksum: 0xA547B238
	Offset: 0x2CE0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function play_equipment_hacked_on_player()
{
	self play_taacom_dialog("equipmentHacked");
}

/*
	Name: get_commander_dialog_alias
	Namespace: globallogic_audio
	Checksum: 0xABC85CDC
	Offset: 0x2D10
	Size: 0x7A
	Parameters: 2
	Flags: Linked
*/
function get_commander_dialog_alias(dialogkey, var_6ad14004)
{
	if(!isdefined(self.pers[level.var_7ee6af9f]))
	{
		return undefined;
	}
	commanderbundle = getscriptbundle(self.pers[level.var_7ee6af9f]);
	return get_dialog_bundle_alias(commanderbundle, dialogkey, var_6ad14004);
}

/*
	Name: get_dialog_bundle_alias
	Namespace: globallogic_audio
	Checksum: 0x6D082C92
	Offset: 0x2D98
	Size: 0x184
	Parameters: 3
	Flags: Linked
*/
function get_dialog_bundle_alias(dialogbundle, dialogkey, var_6ad14004)
{
	if(!isdefined(dialogbundle) || !isdefined(dialogkey))
	{
		return undefined;
	}
	if(ishash(dialogkey))
	{
		if(isdefined(level.var_3727097e))
		{
			dialogalias = self [[level.var_3727097e]](dialogbundle, dialogkey);
		}
		else
		{
			/#
				iprintlnbold(("" + function_9e72a96(dialogkey)) + "");
			#/
		}
	}
	else
	{
		dialogalias = dialogbundle.(dialogkey);
	}
	if(!isdefined(dialogalias))
	{
		return;
	}
	if(!ishash(dialogalias))
	{
		if(var_6ad14004 === 1)
		{
			faction = teams::function_20cfd8b5(self.pers[#"team"]);
			var_2e00736a = faction.var_ce1913bd;
			if(isdefined(var_2e00736a))
			{
				dialogalias = var_2e00736a + dialogalias;
			}
		}
		voiceprefix = dialogbundle.("voiceprefix");
		if(isdefined(voiceprefix))
		{
			dialogalias = voiceprefix + dialogalias;
		}
	}
	return dialogalias;
}

/*
	Name: function_2523d20f
	Namespace: globallogic_audio
	Checksum: 0x93061F5
	Offset: 0x2F28
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_2523d20f(dialogkey)
{
	if(!isdefined(self.pers[level.var_7ee6af9f]))
	{
		return undefined;
	}
	commanderbundle = getscriptbundle(self.pers[level.var_7ee6af9f]);
	return function_f554c1ad(commanderbundle, dialogkey);
}

/*
	Name: function_f554c1ad
	Namespace: globallogic_audio
	Checksum: 0x8C3D6FE8
	Offset: 0x2FA8
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function function_f554c1ad(dialogbundle, dialogkey)
{
	if(!isdefined(dialogbundle) || !isdefined(dialogkey))
	{
		return undefined;
	}
	dialogkey = dialogkey + "SpeakerBundle";
	if(ishash(dialogkey))
	{
		if(isdefined(level.var_9f234058))
		{
			var_3a0f7868 = self [[level.var_9f234058]](dialogbundle, dialogkey);
		}
		else
		{
			/#
				iprintlnbold(("" + function_9e72a96(dialogkey)) + "");
			#/
		}
	}
	else
	{
		var_3a0f7868 = dialogbundle.(dialogkey);
	}
	return var_3a0f7868;
}

/*
	Name: is_team_winning
	Namespace: globallogic_audio
	Checksum: 0x64D480A0
	Offset: 0x3090
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function is_team_winning(checkteam)
{
	score = game.stat[#"teamscores"][checkteam];
	foreach(team, _ in level.teams)
	{
		if(team != checkteam)
		{
			if(game.stat[#"teamscores"][team] >= score)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_abf21f69
	Namespace: globallogic_audio
	Checksum: 0x86626B1F
	Offset: 0x3178
	Size: 0x98
	Parameters: 2
	Flags: Linked
*/
function function_abf21f69(alias, players)
{
	foreach(player in players)
	{
		player playlocalsound(alias);
	}
}

/*
	Name: play_2d_on_team
	Namespace: globallogic_audio
	Checksum: 0xC14D1D09
	Offset: 0x3218
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function play_2d_on_team(alias, team)
{
	function_abf21f69(alias, getplayers(team));
}

/*
	Name: on_end_game
	Namespace: globallogic_audio
	Checksum: 0x49CEF82B
	Offset: 0x3260
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function on_end_game()
{
	level util::clientnotify("pm");
	level waittill(#"sfade");
	level util::clientnotify("pmf");
}

/*
	Name: set_music_on_team
	Namespace: globallogic_audio
	Checksum: 0x23D7DCB3
	Offset: 0x32C8
	Size: 0x190
	Parameters: 5
	Flags: None
*/
function set_music_on_team(state, team, wait_time, save_state, return_state)
{
	if(!isdefined(team))
	{
		team = "both";
	}
	if(!isdefined(wait_time))
	{
		wait_time = 0;
	}
	if(!isdefined(save_state))
	{
		save_state = 0;
	}
	if(!isdefined(return_state))
	{
		return_state = 0;
	}
	/#
		assert(isdefined(level.players));
	#/
	foreach(player in level.players)
	{
		if(team == "both")
		{
			player thread set_music_on_player(state, wait_time, save_state, return_state);
			continue;
		}
		if(isdefined(player.pers[#"team"]) && player.pers[#"team"] == team)
		{
			player thread set_music_on_player(state, wait_time, save_state, return_state);
		}
	}
}

/*
	Name: function_89fe8163
	Namespace: globallogic_audio
	Checksum: 0xA07291B
	Offset: 0x3460
	Size: 0x160
	Parameters: 5
	Flags: None
*/
function function_89fe8163(state, team, wait_time, save_state, return_state)
{
	if(!isdefined(team))
	{
		team = "both";
	}
	if(!isdefined(wait_time))
	{
		wait_time = 0;
	}
	if(!isdefined(save_state))
	{
		save_state = 0;
	}
	if(!isdefined(return_state))
	{
		return_state = 0;
	}
	/#
		assert(isdefined(level.players));
	#/
	foreach(player in level.players)
	{
		if(isdefined(player.pers[#"team"]) && player.pers[#"team"] != team)
		{
			player thread set_music_on_player(state, wait_time, save_state, return_state);
		}
	}
}

/*
	Name: set_music_on_player
	Namespace: globallogic_audio
	Checksum: 0x6A5AC655
	Offset: 0x35C8
	Size: 0x134
	Parameters: 4
	Flags: Linked
*/
function set_music_on_player(state, wait_time, save_state, return_state)
{
	if(!isdefined(return_state))
	{
		return_state = 0;
	}
	self endon(#"disconnect");
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(save_state))
	{
		return;
	}
	if(!isdefined(game.musicset))
	{
		return;
	}
	if(is_true(level.is_survival))
	{
		return;
	}
	if(is_true(level.var_3a701785))
	{
		return;
	}
	if(is_true(level.var_97902f80))
	{
		if(game.state === #"playing")
		{
			return;
		}
	}
	music::setmusicstate(save_state + game.musicset, self, return_state);
}

/*
	Name: set_music_global
	Namespace: globallogic_audio
	Checksum: 0xC7251360
	Offset: 0x3708
	Size: 0xF4
	Parameters: 4
	Flags: None
*/
function set_music_global(state, wait_time, save_state, return_state)
{
	if(!isdefined(return_state))
	{
		return_state = 0;
	}
	if(!isdefined(save_state))
	{
		return;
	}
	if(!isdefined(game.musicset))
	{
		return;
	}
	if(is_true(level.is_survival))
	{
		return;
	}
	if(is_true(level.var_3a701785))
	{
		return;
	}
	if(is_true(level.var_97902f80))
	{
		if(game.state === #"playing")
		{
			return;
		}
	}
	music::setmusicstate(save_state + game.musicset, undefined, return_state);
}

/*
	Name: function_85818e24
	Namespace: globallogic_audio
	Checksum: 0x891D1F9F
	Offset: 0x3808
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_85818e24(var_9c1ed9ea, team)
{
}

/*
	Name: function_c246758e
	Namespace: globallogic_audio
	Checksum: 0x56775217
	Offset: 0x3978
	Size: 0x8C
	Parameters: 2
	Flags: None
*/
function function_c246758e(str_state, n_delay)
{
	if(!isdefined(n_delay))
	{
		n_delay = 0;
	}
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(str_state))
	{
		return;
	}
	if(game.state != #"playing")
	{
		return;
	}
	music::setmusicstate(str_state, self, n_delay);
}

/*
	Name: function_6fbfba95
	Namespace: globallogic_audio
	Checksum: 0xE35F4760
	Offset: 0x3A10
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function function_6fbfba95(str_state, n_delay)
{
	if(!isdefined(n_delay))
	{
		n_delay = 0;
	}
	self notify("1aa7159fe7d6b8ae");
	self endon("1aa7159fe7d6b8ae");
	if(!isdefined(str_state))
	{
		return;
	}
	if(game.state != #"playing")
	{
		return;
	}
	if(n_delay)
	{
		wait(n_delay);
	}
	music::setmusicstate(str_state);
}

/*
	Name: function_6daffa93
	Namespace: globallogic_audio
	Checksum: 0x1FF3DFE7
	Offset: 0x3AA0
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function function_6daffa93(weapon, var_f3ab6571)
{
	if(!isdefined(weapon))
	{
		return;
	}
	switch(weapon.name)
	{
		case "ability_smart_cover":
		{
			taacomdialog = "smartCoverWeaponDestroyedFriendly";
			break;
		}
		case "gadget_jammer":
		{
			taacomdialog = "jammerWeaponDestroyedFriendly";
			break;
		}
		case "gadget_supplypod":
		{
			taacomdialog = "supplyPodWeaponDestroyedFriendly";
			break;
		}
		case "land_mine":
		{
			taacomdialog = "landmineWeaponDestroyedFriendly";
			break;
		}
		case "listening_device":
		{
			taacomdialog = "listenWeaponDestroyedFriendly";
			break;
		}
		case "missile_turret":
		{
			taacomdialog = "missileTurretWeaponDestroyedFriendly";
			break;
		}
		case "tear_gas":
		{
			taacomdialog = "tearGasWeaponDestroyedFriendly";
			break;
		}
		case "trophy_system":
		{
			taacomdialog = "trophyWeaponDestroyedFriendly";
			break;
		}
	}
	if(isdefined(taacomdialog))
	{
		if(is_true(var_f3ab6571))
		{
			taacomdialog = taacomdialog + "Multiple";
		}
		play_taacom_dialog(taacomdialog);
	}
}

/*
	Name: function_a2cde53d
	Namespace: globallogic_audio
	Checksum: 0xC1B75C19
	Offset: 0x3C30
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function function_a2cde53d(weapon, var_f3ab6571)
{
	if(!isdefined(weapon))
	{
		return;
	}
	switch(weapon.name)
	{
		case "ability_smart_cover":
		{
			taacomdialog = "smartCoverHacked";
			break;
		}
		case "gadget_jammer":
		{
			taacomdialog = "jammerHacked";
			break;
		}
		case "gadget_supplypod":
		{
			taacomdialog = "supplyPodHacked";
			break;
		}
		case "land_mine":
		{
			taacomdialog = "landmineHacked";
			break;
		}
		case "listening_device":
		{
			taacomdialog = "listenHacked";
			break;
		}
		case "missile_turret":
		{
			taacomdialog = "missileTurretHacked";
			break;
		}
		case "tear_gas":
		{
			taacomdialog = "tearGasHacked";
			break;
		}
		case "trophy_system":
		{
			taacomdialog = "trophyHacked";
			break;
		}
	}
	if(isdefined(taacomdialog))
	{
		if(is_true(var_f3ab6571))
		{
			taacomdialog = taacomdialog + "Multiple";
		}
		play_taacom_dialog(taacomdialog);
	}
}

/*
	Name: function_4fb91bc7
	Namespace: globallogic_audio
	Checksum: 0x16E2A828
	Offset: 0x3DC0
	Size: 0x67E
	Parameters: 3
	Flags: None
*/
function function_4fb91bc7(weapon, var_df17fa82, var_53c10ed8)
{
	if(!isdefined(weapon) || !isdefined(var_df17fa82) || !isplayer(var_df17fa82) || !isdefined(self) || !isplayer(self))
	{
		return;
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
			var_b3fe42a9 = 1;
			break;
		}
		case "eq_seeker_mine":
		{
			taacomdialog = "seekerMineWeaponHacked";
			var_b3fe42a9 = 1;
			break;
		}
		case "eq_sensor":
		{
			taacomdialog = "sensorDartHacked";
			var_b3fe42a9 = 1;
			break;
		}
		case "ability_smart_cover":
		case "gadget_smart_cover":
		{
			taacomdialog = "smartCoverHacked";
			var_b3fe42a9 = 1;
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
			var_b3fe42a9 = 1;
			break;
		}
		case "trophy_system":
		{
			taacomdialog = "trophyWeaponHacked";
			var_b3fe42a9 = 1;
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
			var_b3fe42a9 = 1;
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
			var_b3fe42a9 = 1;
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
			var_b3fe42a9 = 1;
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
			var_b3fe42a9 = 1;
			break;
		}
		case "uav":
		{
			taacomdialog = "uavHacked";
			var_b3fe42a9 = 1;
			break;
		}
		case "ultimate_turret":
		case "inventory_ultimate_turret":
		{
			taacomdialog = "sentryHacked";
			var_b3fe42a9 = 1;
			break;
		}
	}
	if(!isdefined(taacomdialog))
	{
		return;
	}
	if((isdefined(self.var_d6422943) ? self.var_d6422943 : 0) > gettime())
	{
		self thread play_taacom_dialog(taacomdialog);
	}
	else
	{
		if(var_b3fe42a9 === 1)
		{
			if(var_53c10ed8 === 1)
			{
				self thread play_taacom_dialog(taacomdialog, undefined, undefined, 5, var_df17fa82, weapon);
			}
			else
			{
				self thread play_taacom_dialog(taacomdialog, undefined, undefined, 3, var_df17fa82, weapon);
			}
		}
		else
		{
			self thread play_taacom_dialog(taacomdialog, undefined, undefined, 4, var_df17fa82);
		}
		self.var_d6422943 = gettime() + (int(battlechatter::mpdialog_value("taacomHackedReplyCooldownSec", 0) * 1000));
	}
}

/*
	Name: function_d9079fc1
	Namespace: globallogic_audio
	Checksum: 0x953BB29E
	Offset: 0x4448
	Size: 0x174
	Parameters: 2
	Flags: None
*/
function function_d9079fc1(str_alias, var_3cd9c84b)
{
	/#
		var_a1f778fa = isdedicated() && function_541e02d0(str_alias) || soundexists(str_alias);
		if(getdvarint(#"hash_1a8d23951f456372", 0))
		{
			if(!var_a1f778fa)
			{
				var_2dbe34fe = ("" + "") + function_9e72a96(str_alias) + "";
				iprintlnbold(var_2dbe34fe);
				println(var_2dbe34fe);
			}
		}
		if(var_a1f778fa)
		{
			if(getdvarint(#"hash_1a8d23951f456372", 0))
			{
				iprintlnbold(var_3cd9c84b + function_9e72a96(str_alias));
				println(var_3cd9c84b + function_9e72a96(str_alias));
			}
		}
	#/
}

