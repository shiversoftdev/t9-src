#using script_32c8b5b0eb2854f3;
#using script_335d0650ed05d36d;
#using script_44b0b8420eabacad;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;

#namespace userspawnselection;

/*
	Name: function_afb2afb5
	Namespace: userspawnselection
	Checksum: 0x86F015C1
	Offset: 0x1C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_afb2afb5()
{
	level notify(1721463970);
}

/*
	Name: function_89f2df9
	Namespace: userspawnselection
	Checksum: 0xE5637958
	Offset: 0x1E0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"userspawnselection", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: userspawnselection
	Checksum: 0x7974E5E4
	Offset: 0x228
	Size: 0x1EC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.spawnselect))
	{
		level.spawnselect = spawnstruct();
	}
	level.spawnselect.vox_plr_1_revive_down_2 = [];
	level.spawnselect.lastchosenplayerspawns = [];
	level.spawnselectenabled = getgametypesetting(#"spawnselectenabled");
	level.usespawngroups = getgametypesetting(#"usespawngroups");
	level.spawngroups = [];
	level.next_spawn_group_index = 0;
	level.var_abb55703 = &function_a316ca82;
	level.registeravailablespawnbeacon = &registeravailablespawnbeacon;
	level.var_13edf38c = &removespawnbeacon;
	level.spawnselect_timelimit_ms = getdvarint(#"spawnselect_timelimit_ms", 10000);
	if(isspawnselectenabled())
	{
		callback::on_start_gametype(&on_start_gametype);
		callback::on_disconnect(&on_player_disconnect);
		callback::on_spawned(&onplayerspawned);
		spawning::function_754c78a6(&function_259770ba);
		level.var_b8622956 = &filter_spawnpoints;
	}
	registerclientfields();
}

/*
	Name: function_127864f2
	Namespace: userspawnselection
	Checksum: 0x53C07F69
	Offset: 0x420
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function function_127864f2(player)
{
	foreach(spawnbeacon in level.spawnselect.vox_plr_1_revive_down_2)
	{
		if(player == spawnbeacon.owner)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_93076e1d
	Namespace: userspawnselection
	Checksum: 0xF7F6FE2F
	Offset: 0x4C8
	Size: 0x42
	Parameters: 0
	Flags: None
*/
function function_93076e1d()
{
	if(!isdefined(level.spawnselect))
	{
		level.spawnselect = spawnstruct();
	}
	level.spawnselect.var_d302b268 = 1;
}

/*
	Name: function_a316ca82
	Namespace: userspawnselection
	Checksum: 0x73223E6C
	Offset: 0x518
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_a316ca82(player)
{
	spawnbeacon = player function_b9573d36();
	if(isdefined(spawnbeacon))
	{
		return true;
	}
	return false;
}

/*
	Name: onplayerspawned
	Namespace: userspawnselection
	Checksum: 0xB8956721
	Offset: 0x560
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function onplayerspawned()
{
	closespawnselect();
	if(!isdefined(level.spawnselect.lastchosenplayerspawns[self.clientid]))
	{
		return;
	}
	if(level.spawnselect.lastchosenplayerspawns[self.clientid] == -2)
	{
		level.spawnselect.lastchosenplayerspawns[self.clientid] = -1;
	}
}

/*
	Name: registeravailablespawnbeacon
	Namespace: userspawnselection
	Checksum: 0xE5C00A81
	Offset: 0x5E0
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function registeravailablespawnbeacon(spawnbeaconid, spawnbeacon)
{
	/#
		assert(!isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawnbeaconid]));
	#/
	level.spawnselect.vox_plr_1_revive_down_2[spawnbeaconid] = spawnbeacon;
}

/*
	Name: removespawnbeacon
	Namespace: userspawnselection
	Checksum: 0x76545831
	Offset: 0x648
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function removespawnbeacon(spawnbeaconid)
{
	if(!isdefined(spawnbeaconid) || !isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawnbeaconid]))
	{
		return;
	}
	spawnbeacon = level.spawnselect.vox_plr_1_revive_down_2[spawnbeaconid];
	if(isdefined(spawnbeacon) && isdefined(spawnbeacon.spawnlist))
	{
		clearspawnpoints(spawnbeacon.spawnlist);
	}
	level.spawnselect.vox_plr_1_revive_down_2[spawnbeaconid] = undefined;
}

/*
	Name: isspawnselectenabled
	Namespace: userspawnselection
	Checksum: 0x3B1FE15D
	Offset: 0x700
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function isspawnselectenabled()
{
	return level.spawnselectenabled;
}

/*
	Name: getspawngroup
	Namespace: userspawnselection
	Checksum: 0x174F854C
	Offset: 0x718
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function getspawngroup(index)
{
	return level.spawngroups[index];
}

/*
	Name: getspawngroupbyname
	Namespace: userspawnselection
	Checksum: 0xC217F78E
	Offset: 0x740
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function getspawngroupbyname(target)
{
	retunrarr = [];
	foreach(spawngroup in level.spawngroups)
	{
		if(spawngroup.target == target)
		{
			array::add(retunrarr, spawngroup);
		}
	}
	return retunrarr;
}

/*
	Name: getspawngroupsforzone
	Namespace: userspawnselection
	Checksum: 0xCE22B746
	Offset: 0x808
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function getspawngroupsforzone(zoneindex)
{
	returnarray = [];
	foreach(spawngroup in level.spawngroups)
	{
		if(spawngroup.script_zoneindex == zoneindex)
		{
			array::add(returnarray, spawngroup);
		}
	}
	return returnarray;
}

/*
	Name: getspawngroupwithscriptnoteworthy
	Namespace: userspawnselection
	Checksum: 0x1BFB6B5A
	Offset: 0x8D0
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function getspawngroupwithscriptnoteworthy(script_noteworthy)
{
	returnarray = [];
	foreach(spawngroup in level.spawngroups)
	{
		if(isdefined(spawngroup.script_noteworthy) && spawngroup.script_noteworthy == script_noteworthy)
		{
			array::add(returnarray, spawngroup);
		}
	}
	return returnarray;
}

/*
	Name: changeusability
	Namespace: userspawnselection
	Checksum: 0xBCD284F6
	Offset: 0x9A8
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function changeusability(isusable)
{
	usestatusmodel = getclientfieldprefix(self.uiindex) + "useStatus";
	self.ison = isusable;
	level clientfield::set_world_uimodel(usestatusmodel, isusable);
}

/*
	Name: changevisibility
	Namespace: userspawnselection
	Checksum: 0xFBD613E3
	Offset: 0xA18
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function changevisibility(isvisible)
{
	visstatusmodel = getclientfieldprefix(self.uiindex) + "visStatus";
	level clientfield::set_world_uimodel(visstatusmodel, isvisible);
}

/*
	Name: changeteam
	Namespace: userspawnselection
	Checksum: 0xCA68EBCB
	Offset: 0xA78
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function changeteam(teamname)
{
	teamclientfieldindex = getteamclientfieldvalue(teamname);
	teammodel = getclientfieldprefix(self.uiindex) + "team";
	level clientfield::set_world_uimodel(teammodel, teamclientfieldindex);
	enablespawnpointlist(self.spawnlist, util::getteammask(teamname));
}

/*
	Name: setspawngroupsenabled
	Namespace: userspawnselection
	Checksum: 0xFA2500C6
	Offset: 0xB28
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function setspawngroupsenabled()
{
	if(!isdefined(level.spawngroups))
	{
		return;
	}
	foreach(spawngroup in level.spawngroups)
	{
		spawngroup changeusability(1);
		spawngroup changevisibility(1);
	}
}

/*
	Name: canplayerusespawngroup
	Namespace: userspawnselection
	Checksum: 0xBBBE204E
	Offset: 0xBE8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function canplayerusespawngroup(spawngroupindex)
{
	return true;
}

/*
	Name: setspawngroupforplayer
	Namespace: userspawnselection
	Checksum: 0x60B2D4C0
	Offset: 0xC00
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function setspawngroupforplayer(selectedspawngroupindex)
{
	level.spawnselect.lastchosenplayerspawns[self.clientid] = selectedspawngroupindex;
}

/*
	Name: function_b9573d36
	Namespace: userspawnselection
	Checksum: 0x1904EB60
	Offset: 0xC30
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_b9573d36()
{
	player = self;
	if(level.spawnselectenabled !== 1 && level.var_6cd68fbe === 1)
	{
		return player.var_583f6cce;
	}
	if(isdefined(player.var_583f6cce) && strstartswith(level.gametype, "sd"))
	{
		return player.var_583f6cce;
	}
	if(!isdefined(level.spawnselect.lastchosenplayerspawns[player.clientid]))
	{
		return undefined;
	}
	spawbeaconid = level.spawnselect.lastchosenplayerspawns[player.clientid];
	if(spawbeaconid == -1 || spawbeaconid == -2)
	{
		return undefined;
	}
	if(!isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid]))
	{
		return undefined;
	}
	if(isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].var_34d7dddd) && level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].var_34d7dddd)
	{
		return undefined;
	}
	return level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid];
}

/*
	Name: fillspawnlists
	Namespace: userspawnselection
	Checksum: 0x80B5D1BA
	Offset: 0xDB0
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function fillspawnlists()
{
	foreach(spawngroup in level.spawngroups)
	{
		spawngroup setupspawnlistforspawngroup(spawngroup.target, spawngroup.spawnlist, util::get_team_mapping(spawngroup.script_team));
	}
}

/*
	Name: clearcacheforplayer
	Namespace: userspawnselection
	Checksum: 0x936C8F85
	Offset: 0xE68
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function clearcacheforplayer()
{
	if(!isdefined(self) || !isdefined(self.clientid))
	{
		return;
	}
	if(isdefined(level.spawnselect.lastchosenplayerspawns) && isdefined(level.spawnselect.lastchosenplayerspawns[self.clientid]))
	{
		level.spawnselect.lastchosenplayerspawns[self.clientid] = undefined;
	}
}

/*
	Name: clearcacheforallplayers
	Namespace: userspawnselection
	Checksum: 0x6A88FF1D
	Offset: 0xEE0
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function clearcacheforallplayers()
{
	level.spawnselect.lastchosenplayerspawns = [];
}

/*
	Name: getlastchosenspawngroupforplayer
	Namespace: userspawnselection
	Checksum: 0x4107D31E
	Offset: 0xF00
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function getlastchosenspawngroupforplayer()
{
	if(!isdefined(level.spawnselect.lastchosenplayerspawns[self.clientid]))
	{
		return undefined;
	}
	if(level.spawnselect.lastchosenplayerspawns[self.clientid] == -2)
	{
		return undefined;
	}
	lastchosenid = level.spawnselect.lastchosenplayerspawns[self.clientid];
	if(!isdefined(level.spawngroups[lastchosenid]))
	{
		return undefined;
	}
	return level.spawngroups[lastchosenid];
}

/*
	Name: onroundchange
	Namespace: userspawnselection
	Checksum: 0xF5D3E812
	Offset: 0xFA8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function onroundchange()
{
	clearcacheforallplayers();
	supressspawnselectionmenuforallplayers();
	closespawnselectionmenuforallplayers();
}

/*
	Name: function_5cd68e00
	Namespace: userspawnselection
	Checksum: 0xA898340C
	Offset: 0xFE8
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function function_5cd68e00()
{
	player = self;
	level.spawnselect.lastchosenplayerspawns[player.clientid] = -2;
}

/*
	Name: supressspawnselectionmenuforallplayers
	Namespace: userspawnselection
	Checksum: 0x3B4227C2
	Offset: 0x1020
	Size: 0x10
	Parameters: 0
	Flags: Linked
*/
function supressspawnselectionmenuforallplayers()
{
	level.showspawnselectionmenu = [];
}

/*
	Name: shouldshowspawnselectionmenu
	Namespace: userspawnselection
	Checksum: 0x10BAD694
	Offset: 0x1038
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function shouldshowspawnselectionmenu()
{
	isbot = isbot(self);
	var_1367cd2a = (isdefined(level.spawnselect.lastchosenplayerspawns[self.clientid]) ? level.spawnselect.lastchosenplayerspawns[self.clientid] : -1) == -2;
	gameended = gamestate::is_game_over();
	var_e39674d4 = level.numteamlives > 0 && game.lives[self.team] < 0;
	var_d302b268 = (isdefined(level.spawnselect.var_d302b268) ? level.spawnselect.var_d302b268 : 0) && function_127864f2(self);
	return !isbot && !var_1367cd2a && !level.infinalkillcam && !gameended && !var_e39674d4 || var_d302b268;
}

/*
	Name: activatespawnselectionmenu
	Namespace: userspawnselection
	Checksum: 0xF6DA6E9C
	Offset: 0x11A8
	Size: 0x18
	Parameters: 0
	Flags: Linked
*/
function activatespawnselectionmenu()
{
	level.showspawnselectionmenu[self.clientid] = 1;
}

/*
	Name: openspawnselect
	Namespace: userspawnselection
	Checksum: 0x9826EC4E
	Offset: 0x11C8
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function openspawnselect()
{
	if(is_true(level.var_582f7d48))
	{
		while(is_true(level.var_582f7d48))
		{
			waitframe(1);
		}
	}
	self clientfield::set_player_uimodel("hudItems.showSpawnSelect", 1);
	level notify(#"hash_4c1be11f1e312a36");
}

/*
	Name: closespawnselect
	Namespace: userspawnselection
	Checksum: 0xB363F1B6
	Offset: 0x1250
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function closespawnselect()
{
	self clientfield::set_player_uimodel("hudItems.showSpawnSelect", 0);
	level notify(#"hash_48b4c5f856407d62");
}

/*
	Name: function_fed7687f
	Namespace: userspawnselection
	Checksum: 0x78BFDD94
	Offset: 0x1290
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_fed7687f()
{
	return self clientfield::get_player_uimodel("hudItems.showSpawnSelect") == 1;
}

/*
	Name: closespawnselectionmenuforallplayers
	Namespace: userspawnselection
	Checksum: 0xC560AC63
	Offset: 0x12C0
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function closespawnselectionmenuforallplayers()
{
	players = getplayers();
	foreach(player in players)
	{
		player closespawnselect();
	}
}

/*
	Name: function_b55c5868
	Namespace: userspawnselection
	Checksum: 0x4B7D457A
	Offset: 0x1368
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_b55c5868()
{
	self endon(#"disconnect", #"end_respawn");
	self openspawnselect();
	self thread watchforselectiontimeout();
}

/*
	Name: waitforspawnselection
	Namespace: userspawnselection
	Checksum: 0xE2F944A
	Offset: 0x13C8
	Size: 0x184
	Parameters: 0
	Flags: Linked
*/
function waitforspawnselection()
{
	self endon(#"disconnect", #"end_respawn");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		if(response == "SpawnRegionFocus")
		{
			waitframe(1);
			continue;
		}
		var_ff3ca6eb = 0;
		if(isdefined(level.var_2fa4efc2))
		{
			var_ff3ca6eb = [[level.var_2fa4efc2]](waitresult);
		}
		if(menu == "SpawnSelect" && !var_ff3ca6eb)
		{
			if(isplayer(self))
			{
				self setspawngroupforplayer(waitresult.intpayload);
				if(!level.infinalkillcam)
				{
					self killcam::function_875fc588();
				}
				self closespawnselect();
				self.var_eca4c67f = 0;
			}
			return;
		}
		waitframe(1);
	}
	self closespawnselect();
}

/*
	Name: watchforselectiontimeout
	Namespace: userspawnselection
	Checksum: 0xAAEB9F4B
	Offset: 0x1558
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function watchforselectiontimeout()
{
	self endon(#"disconnect", #"end_respawn");
	self.spawnselect_start_time = gettime();
	while(true)
	{
		if((level.spawnselect_timelimit_ms - (gettime() - self.spawnselect_start_time)) <= 0)
		{
			self luinotifyevent(#"force_spawn_selection");
			return;
		}
		wait(0.1);
	}
}

/*
	Name: on_player_disconnect
	Namespace: userspawnselection
	Checksum: 0xEABC1290
	Offset: 0x15E8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_disconnect()
{
	self clearcacheforplayer();
}

/*
	Name: filter_spawnpoints
	Namespace: userspawnselection
	Checksum: 0x800233BC
	Offset: 0x1610
	Size: 0x20E
	Parameters: 1
	Flags: Linked
*/
function filter_spawnpoints(spawnpoints)
{
	e_player = self;
	if(!isdefined(e_player.clientid))
	{
		return;
	}
	if(!isdefined(level.spawnselect.lastchosenplayerspawns[e_player.clientid]))
	{
		return undefined;
	}
	spawbeaconid = level.spawnselect.lastchosenplayerspawns[e_player.clientid];
	if(spawbeaconid == -1)
	{
		return undefined;
	}
	if(spawbeaconid == -2)
	{
		return undefined;
	}
	if(!isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid]))
	{
		/#
			print("");
		#/
		level.spawnselect.lastchosenplayerspawns[e_player.clientid] = -1;
		return undefined;
	}
	/#
		assert(e_player getteam() == level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].team);
	#/
	if(e_player getteam() != level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].team)
	{
		return undefined;
	}
	/#
		/#
			assert(isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].spawns) && level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].spawns.size > 0);
		#/
	#/
	e_player.var_7007b746 = 1;
	return level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].spawns;
}

/*
	Name: function_259770ba
	Namespace: userspawnselection
	Checksum: 0xBDAC9AF
	Offset: 0x1828
	Size: 0x5CA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_259770ba(e_player)
{
	if(!isdefined(level.spawnselect.lastchosenplayerspawns[e_player.clientid]) || spawning::usestartspawns())
	{
		return undefined;
	}
	spawbeaconid = level.spawnselect.lastchosenplayerspawns[e_player.clientid];
	if(spawbeaconid == -1)
	{
		return undefined;
	}
	if(spawbeaconid == -2)
	{
		return undefined;
	}
	if(!isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid]))
	{
		/#
			print("");
		#/
		level.spawnselect.lastchosenplayerspawns[e_player.clientid] = -1;
		return undefined;
	}
	if(e_player getteam() != level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].team)
	{
		/#
			println("");
			println(("" + spawbeaconid) + "");
			println(("" + e_player.team) + "");
			for(index = 0; index < level.spawnselect.vox_plr_1_revive_down_2.size; index++)
			{
				if(!isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid]))
				{
					continue;
				}
				println(("" + index) + "");
				println(("" + level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].objectiveid) + "");
				println(("" + level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].team) + "");
				if(isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].owner.playername))
				{
					println(("" + level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].owner.playername) + "");
				}
				println("");
			}
			println(("" + level.numgametypereservedobjectives) + "");
			println(("" + level.releasedobjectives.size) + "");
			println("");
			foreach(objid in level.releasedobjectives)
			{
				println(objid + "");
			}
			println("");
			foreach(objid in level.spawnbeaconsettings.var_e7571ff1)
			{
				println(objid + "");
			}
			println("");
		#/
		/#
			assert(e_player.team == level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].team);
		#/
		return undefined;
	}
	/#
		/#
			assert(isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].spawns) && level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].spawns.size > 0);
		#/
	#/
	return level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].spawnlist;
}

/*
	Name: getclientfieldprefix
	Namespace: userspawnselection
	Checksum: 0x611D9A31
	Offset: 0x1E00
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private getclientfieldprefix(id)
{
	return ("spawngroupStatus_" + id) + "_";
}

/*
	Name: registerclientfields
	Namespace: userspawnselection
	Checksum: 0x507855B4
	Offset: 0x1E28
	Size: 0x14C
	Parameters: 0
	Flags: Linked, Private
*/
function private registerclientfields()
{
	for(index = 0; index < 20; index++)
	{
		basename = getclientfieldprefix(index);
		clientfield::function_5b7d846d(basename + "visStatus", 1, 1, "int");
		clientfield::function_5b7d846d(basename + "useStatus", 1, 1, "int");
		clientfield::function_5b7d846d(basename + "team", 1, 2, "int");
	}
	clientfield::function_a8bbc967("hudItems.showSpawnSelect", 1, 1, "int");
	clientfield::function_a8bbc967("hudItems.killcamActive", 1, 1, "int");
	clientfield::function_5b7d846d("hideautospawnoption", 1, 1, "int");
}

/*
	Name: waitandenablespawngroups
	Namespace: userspawnselection
	Checksum: 0x3A6ED7AE
	Offset: 0x1F80
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function waitandenablespawngroups()
{
	util::wait_network_frame(1);
	setspawngroupsenabled();
}

/*
	Name: function_4f78b01d
	Namespace: userspawnselection
	Checksum: 0x4A47C149
	Offset: 0x1FB8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_4f78b01d(var_22eb977c)
{
	level clientfield::set_world_uimodel("hideautospawnoption", var_22eb977c);
}

/*
	Name: on_start_gametype
	Namespace: userspawnselection
	Checksum: 0x8E22DBA
	Offset: 0x1FF0
	Size: 0x13E
	Parameters: 0
	Flags: Linked
*/
function on_start_gametype()
{
	spawngroups = getentarray("spawn_group_marker", "classname");
	if(!isdefined(spawngroups) || spawngroups.size == 0)
	{
		return;
	}
	if(level.usespawngroups)
	{
		spawngroupssorted = arraysort(spawngroups, (0, 0, 0), 1);
		foreach(spawngroup in spawngroupssorted)
		{
			if(!spawning::function_d3d4ff67(spawngroup))
			{
				continue;
			}
			setupspawngroup(spawngroup);
		}
	}
	waitandenablespawngroups();
}

/*
	Name: setupspawnlistforspawngroup
	Namespace: userspawnselection
	Checksum: 0x7D8BB86F
	Offset: 0x2138
	Size: 0x1F0
	Parameters: 3
	Flags: Linked, Private
*/
function private setupspawnlistforspawngroup(spawngroupkey, spawnlistname, team)
{
	rawspawns = struct::get_array(spawngroupkey, "groupname");
	if(!isdefined(rawspawns))
	{
		return;
	}
	self.spawns = [];
	var_38345be7 = 0;
	var_496cfe58 = 0;
	var_12de913c = 0;
	var_3cc38ddd = 0;
	foreach(spawn in rawspawns)
	{
		if(!spawning::function_d3d4ff67(spawn))
		{
			continue;
		}
		if(!isdefined(spawn.enabled))
		{
			spawn.enabled = -1;
		}
		array::add(self.spawns, spawn);
		var_38345be7 = var_38345be7 + spawn.origin[0];
		var_496cfe58 = var_496cfe58 + spawn.origin[1];
		var_12de913c = var_12de913c + spawn.origin[2];
		var_3cc38ddd++;
	}
	var_b5d9fb3a = undefined;
	if(var_3cc38ddd > 0)
	{
		var_b5d9fb3a = (var_38345be7 / var_3cc38ddd, var_496cfe58 / var_3cc38ddd, var_12de913c / var_3cc38ddd);
	}
	addspawnpoints(team, self.spawns, spawnlistname);
	return var_b5d9fb3a;
}

/*
	Name: setupspawngroup
	Namespace: userspawnselection
	Checksum: 0xD806D74F
	Offset: 0x2330
	Size: 0x13E
	Parameters: 1
	Flags: Linked, Private
*/
function private setupspawngroup(spawngroup)
{
	spawngroup.objectiveid = gameobjects::get_next_obj_id();
	if(level.teambased && isdefined(game.switchedsides) && game.switchedsides)
	{
		spawngroup.team = util::getotherteam(spawngroup.script_team);
	}
	else
	{
		spawngroup.team = spawngroup.script_team;
	}
	var_b5d9fb3a = spawngroup setupspawnlistforspawngroup(spawngroup.target, spawngroup.spawnlist, spawngroup.team);
	objectivename = spawngroup.script_objective;
	objective_add(spawngroup.objectiveid, "active", var_b5d9fb3a, objectivename);
	objective_setteam(spawngroup.objectiveid, spawngroup.team);
	level.spawnselect.vox_plr_1_revive_down_2[spawngroup.objectiveid] = spawngroup;
	spawngroup.var_34d7dddd = 1;
}

/*
	Name: getteamclientfieldvalue
	Namespace: userspawnselection
	Checksum: 0xC492F1D9
	Offset: 0x2478
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function getteamclientfieldvalue(team)
{
	if(!isdefined(team))
	{
		return 0;
	}
	teamname = util::get_team_mapping(team);
	if(team == #"allies")
	{
		return 1;
	}
	if(team == #"axis")
	{
		return 2;
	}
	if(team == #"neutral")
	{
		return 3;
	}
	return 0;
}

