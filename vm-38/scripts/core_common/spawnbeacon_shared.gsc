#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\deployable.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using script_4721de209091b1a6;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\abilities\ability_player.gsc;

#namespace namespace_f2029649;

/*
	Name: function_8b147ce0
	Namespace: namespace_f2029649
	Checksum: 0xAB9FE50B
	Offset: 0x240
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8b147ce0()
{
	level notify(-1807107002);
}

#namespace spawn_beacon;

/*
	Name: init_shared
	Namespace: spawn_beacon
	Checksum: 0x95D0FCA7
	Offset: 0x260
	Size: 0x26C
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	level.var_9fa5aeb4 = undefined;
	level.var_34c482f2 = undefined;
	level.var_4b1d905b = undefined;
	level.var_ae2fe442 = undefined;
	if(!isdefined(game.spawnbeaconid))
	{
		game.spawnbeaconid = 0;
	}
	if(!isdefined(level.spawnbeaconsettings))
	{
		level.spawnbeaconsettings = spawnstruct();
	}
	level.spawnbeaconsettings.userspawnbeacons = [];
	level.spawnbeaconsettings.availablespawnlists = [];
	level.spawnbeaconsettings.var_d6a27a84 = [];
	level.spawnbeaconsettings.var_d741a6a4 = [];
	if(getgametypesetting(#"competitivesettings") === 1)
	{
		level.spawnbeaconsettings.settingsbundle = getscriptbundle("spawnbeacon_custom_settings_comp");
	}
	else
	{
		level.spawnbeaconsettings.settingsbundle = getscriptbundle("default_spawnbeacon_settings");
	}
	level.spawnbeaconsettings.var_c1a364b9 = getweapon(#"gadget_spawnbeacon");
	level.spawnbeaconsettings.var_613ff100 = [];
	level.spawnbeaconsettings.beacons = [];
	level.spawnbeaconsettings.maxpower = 100;
	level.spawnbeaconsettings.var_b851d15e = vectorscale((0, 0, 1), 5);
	level.spawnbeaconsettings.var_247a8b = 100;
	/#
		level.spawnbeaconsettings.var_e7571ff1 = [];
	#/
	setupcallbacks();
	setupclientfields();
	callback::on_finalize_initialization(&function_1c601b99);
	deployable::register_deployable(getweapon("gadget_spawnbeacon"), &function_9aafb7bb, undefined);
}

/*
	Name: function_1c601b99
	Namespace: spawn_beacon
	Checksum: 0x3B5C1F2E
	Offset: 0x4D8
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function function_1c601b99()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](level.spawnbeaconsettings.var_c1a364b9, &function_bff5c062);
	}
}

/*
	Name: function_bff5c062
	Namespace: spawn_beacon
	Checksum: 0xFC221C30
	Offset: 0x520
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_bff5c062(spawnbeacon, attackingplayer)
{
	attackingplayer.var_d02ddb8e = getweapon(#"gadget_icepick");
	attackingplayer thread function_a9ff3efb(1);
}

/*
	Name: function_ee74520a
	Namespace: spawn_beacon
	Checksum: 0x930CD93
	Offset: 0x580
	Size: 0x42
	Parameters: 0
	Flags: None
*/
function function_ee74520a()
{
	if(!isdefined(level.spawnbeaconsettings))
	{
		level.spawnbeaconsettings = spawnstruct();
	}
	level.spawnbeaconsettings.var_9d48e929 = 1;
}

/*
	Name: function_7262646d
	Namespace: spawn_beacon
	Checksum: 0xAB2DE910
	Offset: 0x5D0
	Size: 0x42
	Parameters: 0
	Flags: None
*/
function function_7262646d()
{
	if(!isdefined(level.spawnbeaconsettings))
	{
		level.spawnbeaconsettings = spawnstruct();
	}
	level.spawnbeaconsettings.var_7262646d = 1;
}

/*
	Name: function_5e54a568
	Namespace: spawn_beacon
	Checksum: 0x78B1CDA2
	Offset: 0x620
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_5e54a568(var_b71a2a66)
{
	if(!isdefined(level.spawnbeaconsettings))
	{
		level.spawnbeaconsettings = spawnstruct();
	}
	level.spawnbeaconsettings.var_3c919ca8 = var_b71a2a66;
}

/*
	Name: function_6b437265
	Namespace: spawn_beacon
	Checksum: 0x8FD0B52E
	Offset: 0x678
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_6b437265(team)
{
	foreach(spawnbeacon in level.spawnbeaconsettings.beacons)
	{
		if(!isdefined(spawnbeacon))
		{
			continue;
		}
		if(team == spawnbeacon.team)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_cfabb62c
	Namespace: spawn_beacon
	Checksum: 0x7E5446FF
	Offset: 0x730
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function function_cfabb62c(watcher)
{
	watcher.watchforfire = 1;
	watcher.onspawn = &beacon_spawned;
	watcher.ontimeout = &function_13ac856e;
	watcher.var_994b472b = &function_f9d3fff8;
}

/*
	Name: function_f9d3fff8
	Namespace: spawn_beacon
	Checksum: 0x9A6C40C
	Offset: 0x7A0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_f9d3fff8(player)
{
	if(isdefined(self) && isdefined(self.spawnbeacon))
	{
		self.spawnbeacon thread function_a9ff3efb(0);
	}
}

/*
	Name: function_13ac856e
	Namespace: spawn_beacon
	Checksum: 0x453BABCF
	Offset: 0x7E8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_13ac856e()
{
	if(isdefined(self) && isdefined(self.spawnbeacon))
	{
		self.spawnbeacon thread function_a9ff3efb(0);
	}
}

/*
	Name: function_f8930fa1
	Namespace: spawn_beacon
	Checksum: 0xB9A5136B
	Offset: 0x828
	Size: 0x27C
	Parameters: 1
	Flags: Linked
*/
function function_f8930fa1(time)
{
	self endon(#"death", #"end_timer");
	if(time == 0)
	{
		return;
	}
	if((isdefined(level.spawnbeaconsettings.var_7262646d) ? level.spawnbeaconsettings.var_7262646d : 0))
	{
		return;
	}
	if(isdefined(level.var_7a0aaea2))
	{
		time = level.var_7a0aaea2;
	}
	if(time > (isdefined(level.spawnbeaconsettings.settingsbundle.var_a0ffd0e4) ? level.spawnbeaconsettings.settingsbundle.var_a0ffd0e4 : 0))
	{
		wait(time - (isdefined(level.spawnbeaconsettings.settingsbundle.var_a0ffd0e4) ? level.spawnbeaconsettings.settingsbundle.var_a0ffd0e4 : 0));
	}
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(level.var_a1ca927c))
	{
		self [[level.var_a1ca927c]]();
	}
	remainingtime = (time < (isdefined(level.spawnbeaconsettings.settingsbundle.var_a0ffd0e4) ? level.spawnbeaconsettings.settingsbundle.var_a0ffd0e4 : 0) ? time : (isdefined(level.spawnbeaconsettings.settingsbundle.var_a0ffd0e4) ? level.spawnbeaconsettings.settingsbundle.var_a0ffd0e4 : 0));
	wait(remainingtime);
	while(is_true(level.spawnbeaconsettings.var_9d48e929) && isdefined(self) && isdefined(self.owner) && !isalive(self.owner))
	{
		wait(0.5);
	}
	if(!isdefined(self))
	{
		return;
	}
	self thread function_a9ff3efb(0);
}

/*
	Name: beacon_spawned
	Namespace: spawn_beacon
	Checksum: 0x3D4D91BC
	Offset: 0xAB0
	Size: 0x284
	Parameters: 2
	Flags: Linked
*/
function beacon_spawned(watcher, owner)
{
	self endon(#"death");
	self.canthack = 1;
	self thread weaponobjects::onspawnuseweaponobject(watcher, owner);
	self hide();
	if(is_true(self.previouslyhacked))
	{
		return;
	}
	if(isdefined(level.var_14151f16))
	{
		[[level.var_14151f16]](self, 0);
	}
	waitframe(1);
	if(!isdefined(owner))
	{
		self delete();
		return;
	}
	owner notify(#"hash_31be1f8b27209ad0", {#beacon:self, #player:owner});
	level notify(#"hash_31be1f8b27209ad0", {#beacon:self, #player:owner});
	if(!owner deployable::function_f8fe102f())
	{
		owner deployable::function_416f03e6(level.spawnbeaconsettings.var_c1a364b9);
		self delete();
		return;
	}
	if(isdefined(owner))
	{
		owner stats::function_e24eec31(self.weapon, #"used", 1);
	}
	self deployable::function_dd266e08(owner);
	self.var_9bab32d9 = owner.var_9bab32d9;
	owner.var_9bab32d9 = undefined;
	owner onplacespawnbeacon(self);
	owner clientfield::set_player_uimodel("hudItems.spawnbeacon.active", 1);
	owner.var_9698a18d = 1;
	spawnbeacon = self.spawnbeacon;
	spawnbeacon setanim(#"o_spawn_beacon_deploy", 1);
}

/*
	Name: function_d7cd849c
	Namespace: spawn_beacon
	Checksum: 0xD7348179
	Offset: 0xD40
	Size: 0xF4
	Parameters: 3
	Flags: Linked
*/
function function_d7cd849c(var_cb0f3959, team, var_86a79150)
{
	if(!isdefined(var_cb0f3959))
	{
		return;
	}
	if(!isdefined(level.spawnbeaconsettings.var_d741a6a4[var_cb0f3959]))
	{
		level.spawnbeaconsettings.var_d741a6a4[var_cb0f3959] = 0;
	}
	var_ad7969ca = level.spawnbeaconsettings.var_d741a6a4[var_cb0f3959];
	if(var_ad7969ca != 0 && gettime() < ((int(5 * 1000)) + var_ad7969ca))
	{
		return;
	}
	namespace_f9b02f80::function_b4319f8e(var_cb0f3959, team, var_86a79150, "spawnbeacon");
	level.spawnbeaconsettings.var_d741a6a4[var_cb0f3959] = gettime();
}

/*
	Name: setupclientfields
	Namespace: spawn_beacon
	Checksum: 0x8190EC54
	Offset: 0xE40
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function setupclientfields()
{
	clientfield::register("scriptmover", "spawnbeacon_placed", 1, 1, "int");
	clientfield::register_clientuimodel("hudItems.spawnbeacon.active", 1, 1, "int");
}

/*
	Name: function_45a43bd6
	Namespace: spawn_beacon
	Checksum: 0xF7A9D920
	Offset: 0xEA8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_45a43bd6()
{
	player = self;
	if(is_true(player.var_9698a18d))
	{
		player clientfield::set_player_uimodel("hudItems.spawnbeacon.active", 1);
	}
}

/*
	Name: setupcallbacks
	Namespace: spawn_beacon
	Checksum: 0x225C4A45
	Offset: 0xF00
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private setupcallbacks()
{
	ability_player::register_gadget_activation_callbacks(26, &gadget_spawnbeacon_on, &gadget_spawnbeacon_off);
	callback::on_player_killed(&on_player_killed);
	callback::on_spawned(&on_player_spawned);
	callback::on_loadout(&on_loadout);
	weaponobjects::function_e6400478(#"gadget_spawnbeacon", &function_cfabb62c, 1);
}

/*
	Name: function_9ede386f
	Namespace: spawn_beacon
	Checksum: 0xF97AD3B7
	Offset: 0xFD8
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9ede386f(slot)
{
	wait(0.1);
	if(!isdefined(self))
	{
		return;
	}
	self function_19ed70ca(slot, 1);
	self gadgetpowerset(slot, 0);
}

/*
	Name: function_8892377a
	Namespace: spawn_beacon
	Checksum: 0x15912D16
	Offset: 0x1038
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function function_8892377a()
{
	if(!self hasweapon(level.spawnbeaconsettings.var_c1a364b9))
	{
		self clientfield::set_player_uimodel("hudItems.spawnbeacon.active", 0);
		self.var_9698a18d = 0;
		self.var_583f6cce = undefined;
	}
	else
	{
		if(!isdefined(self.pers[#"hash_677f229433c8735b"]))
		{
			self.pers[#"hash_677f229433c8735b"] = 0;
		}
		if(getdvarint(#"hash_da55c6d97d1dc52", 1) && (isdefined(level.var_6cd68fbe) ? level.var_6cd68fbe : 0) && self.pers[#"hash_677f229433c8735b"] >= 1)
		{
			var_4dbaac09 = self gadgetgetslot(level.spawnbeaconsettings.var_c1a364b9);
			self thread function_9ede386f(var_4dbaac09);
		}
	}
}

/*
	Name: on_loadout
	Namespace: spawn_beacon
	Checksum: 0x9E771051
	Offset: 0x1198
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_loadout()
{
	self function_8892377a();
}

/*
	Name: on_player_spawned
	Namespace: spawn_beacon
	Checksum: 0xA0C3FEDA
	Offset: 0x11C0
	Size: 0x48
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	player = self;
	player function_45a43bd6();
	if(isdefined(level.var_9fa5aeb4))
	{
		self [[level.var_9fa5aeb4]]();
	}
}

/*
	Name: function_41a037e6
	Namespace: spawn_beacon
	Checksum: 0xA502CC22
	Offset: 0x1210
	Size: 0x196
	Parameters: 0
	Flags: Linked
*/
function function_41a037e6()
{
	spawnbeacon = self;
	spawnbeacon.threatlevel = 0;
	foreach(player in level.players)
	{
		if(player getteam() == spawnbeacon.team)
		{
			continue;
		}
		foreach(var_25d50c8b in level.spawnbeaconsettings.var_613ff100)
		{
			distance = distancesquared(spawnbeacon.origin, player.origin);
			if(distance <= var_25d50c8b.zonemax && distance > var_25d50c8b.zonemin)
			{
				spawnbeacon.threatlevel = spawnbeacon.threatlevel + var_25d50c8b.points;
			}
		}
	}
}

/*
	Name: updatethreat
	Namespace: spawn_beacon
	Checksum: 0xA98672C8
	Offset: 0x13B0
	Size: 0x196
	Parameters: 0
	Flags: Linked
*/
function updatethreat()
{
	level endon(#"game_ended");
	spawnbeacon = self;
	spawnbeacon endon(#"beacon_removed");
	while(isdefined(spawnbeacon))
	{
		if(isdefined(spawnbeacon.isdisabled) && spawnbeacon.isdisabled)
		{
			spawnbeacon waittill(#"beacon_enabled");
		}
		spawnbeacon function_41a037e6();
		if(spawnbeacon.threatlevel >= (isdefined(level.spawnbeaconsettings.settingsbundle.var_ba2632d3) ? level.spawnbeaconsettings.settingsbundle.var_ba2632d3 : 0))
		{
			objective_setgamemodeflags(spawnbeacon.objectiveid, 2);
		}
		else
		{
			if(spawnbeacon.threatlevel >= (isdefined(level.spawnbeaconsettings.settingsbundle.var_332c5109) ? level.spawnbeaconsettings.settingsbundle.var_332c5109 : 0))
			{
				objective_setgamemodeflags(spawnbeacon.objectiveid, 1);
			}
			else
			{
				objective_setgamemodeflags(spawnbeacon.objectiveid, 0);
			}
		}
		wait(1);
	}
}

/*
	Name: getnewspawnbeaconspawnlist
	Namespace: spawn_beacon
	Checksum: 0x30121772
	Offset: 0x1550
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function getnewspawnbeaconspawnlist()
{
	if(!sessionmodeiscampaigngame())
	{
		/#
			assert(level.spawnbeaconsettings.availablespawnlists.size > 0);
		#/
		spawnlist = array::pop(level.spawnbeaconsettings.availablespawnlists);
		/#
			assert(isdefined(spawnlist));
		#/
		return spawnlist;
	}
}

/*
	Name: freespawnbeaconspawnlist
	Namespace: spawn_beacon
	Checksum: 0xC698BE08
	Offset: 0x15F0
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function freespawnbeaconspawnlist(spawnlistname)
{
	if(isdefined(spawnlistname))
	{
		/#
			assert(!array::contains(level.spawnbeaconsettings.availablespawnlists, spawnlistname));
		#/
		array::push(level.spawnbeaconsettings.availablespawnlists, spawnlistname);
	}
}

/*
	Name: gadget_spawnbeacon_on
	Namespace: spawn_beacon
	Checksum: 0x80E5D8
	Offset: 0x1670
	Size: 0x66
	Parameters: 2
	Flags: Linked
*/
function gadget_spawnbeacon_on(slot, playerweapon)
{
	/#
		assert(isplayer(self));
	#/
	self notify(#"start_killstreak", {#weapon:playerweapon});
}

/*
	Name: gadget_spawnbeacon_off
	Namespace: spawn_beacon
	Checksum: 0x9C740DD5
	Offset: 0x16E0
	Size: 0x1E
	Parameters: 2
	Flags: Linked
*/
function gadget_spawnbeacon_off(slot, weapon)
{
	self.var_c11172a1 = 0;
}

/*
	Name: on_player_killed
	Namespace: spawn_beacon
	Checksum: 0x576DD05
	Offset: 0x1708
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(s_params)
{
	if(isdefined(self.spawnbeaconbuildprogressobjid))
	{
		deleteobjective(self.spawnbeaconbuildprogressobjid);
		self.spawnbeaconbuildprogressobjid = undefined;
	}
	if(isdefined(self.var_c11172a1) && self.var_c11172a1 && isdefined(s_params.eattacker))
	{
		killstreaks::processscoreevent(#"forward_spawn_stopped_activation", s_params.eattacker, undefined, level.spawnbeaconsettings.var_c1a364b9);
	}
}

/*
	Name: getobjectiveid
	Namespace: spawn_beacon
	Checksum: 0x95D73BF5
	Offset: 0x17C0
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function getobjectiveid()
{
	return gameobjects::get_next_obj_id();
}

/*
	Name: deleteobjective
	Namespace: spawn_beacon
	Checksum: 0x16322C8B
	Offset: 0x17E0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function deleteobjective(objectiveid)
{
	if(isdefined(objectiveid))
	{
		objective_delete(objectiveid);
		gameobjects::release_obj_id(objectiveid);
	}
}

/*
	Name: function_4d9f82ce
	Namespace: spawn_beacon
	Checksum: 0xB73E5587
	Offset: 0x1830
	Size: 0x15A
	Parameters: 0
	Flags: Linked
*/
function function_4d9f82ce()
{
	spawnbeacon = self;
	player = spawnbeacon.owner;
	if(!isdefined(player))
	{
		return;
	}
	if(!player hasweapon(level.spawnbeaconsettings.var_c1a364b9))
	{
		return;
	}
	var_4dbaac09 = player gadgetgetslot(level.spawnbeaconsettings.var_c1a364b9);
	currentpower = player gadgetpowerget(var_4dbaac09) / 100;
	penalty = (isdefined(level.spawnbeaconsettings.settingsbundle.var_da5fcc2d) ? level.spawnbeaconsettings.settingsbundle.var_da5fcc2d : 0) - ((isdefined(level.spawnbeaconsettings.settingsbundle.var_da5fcc2d) ? level.spawnbeaconsettings.settingsbundle.var_da5fcc2d : 0) * currentpower);
	player.var_299012ff = int(penalty);
}

/*
	Name: function_e46fd633
	Namespace: spawn_beacon
	Checksum: 0x43CA3C20
	Offset: 0x1998
	Size: 0x1BC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e46fd633()
{
	spawnbeacon = self;
	if((isdefined(level.spawnbeaconsettings.settingsbundle.var_d2110d43) ? level.spawnbeaconsettings.settingsbundle.var_d2110d43 : 0))
	{
		spawnbeacon function_4d9f82ce();
	}
	var_b80d3663 = isdefined(spawnbeacon.var_d02ddb8e) && spawnbeacon.var_d02ddb8e.name === "gadget_icepick";
	if(isdefined(self.owner) && !var_b80d3663)
	{
		var_9a5be956 = self.owner;
		self.owner thread namespace_f9b02f80::play_taacom_dialog("spawnBeaconDestroyedFriendly");
	}
	function_d7cd849c(level.spawnbeaconsettings.settingsbundle.var_79efc1, util::getotherteam(spawnbeacon.team), spawnbeacon.var_846acfcf);
	if(!var_b80d3663)
	{
		function_d7cd849c(level.spawnbeaconsettings.settingsbundle.var_2ee73347, spawnbeacon.team, var_9a5be956);
		spawnbeacon.owner globallogic_score::function_5829abe3(spawnbeacon.var_846acfcf, spawnbeacon.var_d02ddb8e, level.spawnbeaconsettings.var_c1a364b9);
	}
}

/*
	Name: function_a9ff3efb
	Namespace: spawn_beacon
	Checksum: 0xCA8339BD
	Offset: 0x1B60
	Size: 0x964
	Parameters: 1
	Flags: Linked
*/
function function_a9ff3efb(var_d3213f00)
{
	self notify(#"hash_523ddcbd662010e5");
	self function_68a6ec15();
	self.var_ab0875aa = 1;
	spawnbeacon = self;
	attacker = (var_d3213f00 ? self.var_846acfcf : self.owner);
	spawnbeacon dodamage(spawnbeacon.health + 10000, spawnbeacon.origin, attacker, undefined, undefined, "MOD_EXPLOSIVE");
	if(target_istarget(spawnbeacon))
	{
		target_remove(spawnbeacon);
	}
	player = self.owner;
	if(isdefined(self.beacondisabled) && self.beacondisabled)
	{
		return;
	}
	if(game.state == #"playing")
	{
		if(spawnbeacon.health <= 0)
		{
			if(isdefined(level.spawnbeaconsettings.settingsbundle.var_b3756378))
			{
				spawnbeacon playsound(level.spawnbeaconsettings.settingsbundle.var_b3756378);
			}
		}
		else if(isdefined(level.spawnbeaconsettings.settingsbundle.var_b4ecfeb2))
		{
			spawnbeacon playsound(level.spawnbeaconsettings.settingsbundle.var_b4ecfeb2);
		}
		if(is_true(var_d3213f00))
		{
			self function_e46fd633();
		}
		else
		{
			if(isdefined(self.owner))
			{
				var_9a5be956 = self.owner;
				self.owner thread namespace_f9b02f80::play_taacom_dialog("spawnBeaconOfflineFriendly");
			}
			function_d7cd849c(level.spawnbeaconsettings.settingsbundle.var_10c9ba2d, self.team, var_9a5be956);
			function_d7cd849c(level.spawnbeaconsettings.settingsbundle.var_f29e64de, util::getotherteam(self.team), undefined);
		}
	}
	if(isdefined(level.spawnbeaconsettings.settingsbundle.var_35fbc280))
	{
		playfx(level.spawnbeaconsettings.settingsbundle.var_35fbc280, spawnbeacon.origin);
	}
	if(isdefined(level.spawnbeaconsettings.settingsbundle.var_bb6c29b4) && isdefined(self.var_d02ddb8e) && self.var_d02ddb8e == getweapon(#"shock_rifle"))
	{
		playfx(level.spawnbeaconsettings.settingsbundle.var_bb6c29b4, spawnbeacon.origin);
	}
	if((isdefined(self.var_ca3a0f16) ? self.var_ca3a0f16 : 0) || (isdefined(player) && isdefined(player.var_c4a4cb7d) && player hasweapon(getweapon(#"hash_7ab3f9a730359659"), 1)))
	{
		if(isdefined(self.objectiveid))
		{
			gameobjects::release_obj_id(self.objectiveid);
		}
	}
	else
	{
		if(isdefined(level.var_34c482f2))
		{
			self [[level.var_34c482f2]](attacker, self.var_d02ddb8e);
		}
		/#
			array::push_front(level.spawnbeaconsettings.var_e7571ff1, self.objectiveid);
		#/
		if(isdefined(self.objectiveid))
		{
			deleteobjective(self.objectiveid);
			level.spawnbeaconsettings.beacons[self.objectiveid] = undefined;
		}
		self.beacondisabled = 1;
		freespawnbeaconspawnlist(self.spawnlist);
	}
	self clientfield::set("enemyequip", 0);
	if(isdefined(self.var_d7cf6658))
	{
		foreach(gameobject in self.var_d7cf6658)
		{
			gameobject gameobjects::destroy_object(1, 1);
		}
	}
	if(isdefined(self.owner))
	{
		var_c2ca0930 = getarraykeys(level.spawnbeaconsettings.userspawnbeacons[self.owner.clientid]);
		foreach(var_2f55edb in var_c2ca0930)
		{
			if(level.spawnbeaconsettings.userspawnbeacons[self.owner.clientid][var_2f55edb] == self)
			{
				var_10432750 = var_2f55edb;
			}
		}
	}
	if(isdefined(var_10432750))
	{
		level.spawnbeaconsettings.userspawnbeacons[self.owner.clientid] = array::remove_index(level.spawnbeaconsettings.userspawnbeacons[self.owner.clientid], var_10432750, 0);
	}
	self stoploopsound();
	self notify(#"beacon_removed");
	self callback::remove_callback(#"on_end_game", &function_438ca4e0);
	if(isdefined(player))
	{
		player notify(#"beacon_removed");
		player clientfield::set_player_uimodel("hudItems.spawnbeacon.active", 0);
		player.var_9698a18d = 0;
		player.var_583f6cce = undefined;
	}
	if(isdefined(self.var_2d045452))
	{
		self.var_2d045452 delete();
	}
	deployable::function_81598103(self);
	var_b0e81be9 = self gettagorigin("tag_base_d0");
	if(!isdefined(var_b0e81be9))
	{
		var_b0e81be9 = self.origin;
	}
	var_505e3308 = self gettagangles("tag_base_d0");
	if(!isdefined(var_505e3308))
	{
		var_505e3308 = self.angles;
	}
	var_8fec56c4 = anglestoforward(var_505e3308);
	var_61753233 = anglestoup(var_505e3308);
	playfx(#"hash_695b2e7e4b63a645", var_b0e81be9, var_8fec56c4, var_61753233);
	if(!(isdefined(spawnbeacon.var_4fc7245b) ? spawnbeacon.var_4fc7245b : 0) && (isdefined(level.var_6cd68fbe) ? level.var_6cd68fbe : 0) && isdefined(player))
	{
		player.pers[#"lives"]--;
	}
	self delete();
}

/*
	Name: getspawnbeaconspawns
	Namespace: spawn_beacon
	Checksum: 0x2405362C
	Offset: 0x24D0
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function getspawnbeaconspawns(origin)
{
	spawnstoadd = [];
	return spawnstoadd;
}

/*
	Name: createspawngroupforspawnbeacon
	Namespace: spawn_beacon
	Checksum: 0x2619E574
	Offset: 0x24F8
	Size: 0x19E
	Parameters: 2
	Flags: Linked
*/
function createspawngroupforspawnbeacon(associatedspawnbeacon, spawnstoadd)
{
	/#
		assert(isdefined(spawnstoadd));
	#/
	/#
		assert(isdefined(associatedspawnbeacon));
	#/
	if(spawnstoadd.size == 0)
	{
		return false;
	}
	team = associatedspawnbeacon.team;
	enemyteam = util::getotherteam(team);
	var_5b29525a = level.teambased && isdefined(game.switchedsides) && game.switchedsides && level.spawnsystem.var_3709dc53;
	associatedspawnbeacon.spawnlist = getnewspawnbeaconspawnlist();
	/#
		assert(isdefined(associatedspawnbeacon.spawnlist));
	#/
	if(level.teambased)
	{
		if(var_5b29525a)
		{
			enemyteam = team;
			team = enemyteam;
		}
		/#
			assert(isdefined(team));
		#/
		addspawnpoints(team, spawnstoadd, associatedspawnbeacon.spawnlist);
		addspawnpoints(enemyteam, spawnstoadd, associatedspawnbeacon.spawnlist);
	}
	associatedspawnbeacon.spawns = spawnstoadd;
	return true;
}

/*
	Name: function_425d8006
	Namespace: spawn_beacon
	Checksum: 0x21500D15
	Offset: 0x26A0
	Size: 0x1E8
	Parameters: 0
	Flags: None
*/
function function_425d8006()
{
	spawnbeacon = self;
	spawnbeacon endon(#"beacon_removed");
	level endon(#"game_ended");
	spawnbeacon.isdisabled = 1;
	spawnbeacon notify(#"beacon_disabled");
	objective_setgamemodeflags(spawnbeacon.objectiveid, 3);
	var_d7760961 = (isdefined(level.spawnbeaconsettings.settingsbundle.var_26f4f5f0) ? level.spawnbeaconsettings.settingsbundle.var_26f4f5f0 : 0);
	var_f1c32a14 = "";
	if(spawnbeacon.team == #"allies")
	{
		var_f1c32a14 = "A";
	}
	else
	{
		var_f1c32a14 = "B";
	}
	function_d7cd849c(level.spawnbeaconsettings.settingsbundle.var_1068819a, spawnbeacon.team, undefined);
	function_d7cd849c(level.spawnbeaconsettings.settingsbundle.var_c5d0582b, util::getotherteam(spawnbeacon.team), undefined);
	setbombtimer(var_f1c32a14, gettime() + (int(var_d7760961 * 1000)));
	wait(var_d7760961);
	spawnbeacon.isdisabled = 0;
	spawnbeacon notify(#"beacon_enabled");
}

/*
	Name: watchfordeath
	Namespace: spawn_beacon
	Checksum: 0x2D6ADF9B
	Offset: 0x2890
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function watchfordeath()
{
	level endon(#"game_ended");
	self.owner endon(#"disconnect", #"joined_team", #"changed_specialist");
	self endon(#"hash_523ddcbd662010e5");
	waitresult = undefined;
	waitresult = self waittill(#"death");
	if(!isdefined(self))
	{
		return;
	}
	var_b08a3652 = 1;
	self.var_846acfcf = waitresult.attacker;
	self.var_d02ddb8e = waitresult.weapon;
	if(isdefined(waitresult.attacker) && isdefined(self) && isdefined(self.owner) && waitresult.attacker.team == self.owner.team)
	{
		var_b08a3652 = 0;
	}
	self thread function_a9ff3efb(var_b08a3652);
}

/*
	Name: watchfordamage
	Namespace: spawn_beacon
	Checksum: 0xD386961C
	Offset: 0x29D0
	Size: 0x168
	Parameters: 0
	Flags: Linked
*/
function watchfordamage()
{
	self endon(#"death");
	level endon(#"game_ended");
	self endon(#"hash_523ddcbd662010e5");
	spawnbeacon = self;
	spawnbeacon endon(#"death");
	spawnbeacon.health = level.spawnbeaconsettings.settingsbundle.health;
	if(isdefined(level.var_b8701e49))
	{
		spawnbeacon.health = level.var_b8701e49;
	}
	spawnbeacon.maxhealth = spawnbeacon.health;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(isdefined(waitresult.attacker) && waitresult.amount > 0 && damagefeedback::dodamagefeedback(waitresult.weapon, waitresult.attacker))
		{
			waitresult.attacker damagefeedback::update(waitresult.mod, waitresult.inflictor, undefined, waitresult.weapon, self);
		}
	}
}

/*
	Name: function_40c032a1
	Namespace: spawn_beacon
	Checksum: 0x4A6AF65C
	Offset: 0x2B40
	Size: 0x10A
	Parameters: 13
	Flags: Linked
*/
function function_40c032a1(einflictor, attacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex)
{
	bundle = level.spawnbeaconsettings.settingsbundle;
	chargelevel = 0;
	weapon_damage = killstreak_bundles::function_dd7587e4(bundle, bundle.health, vdir, imodelindex, iboneindex, shitloc, psoffsettime, chargelevel);
	if(!isdefined(weapon_damage))
	{
		weapon_damage = killstreaks::get_old_damage(vdir, imodelindex, iboneindex, shitloc, 1);
	}
	return int(weapon_damage);
}

/*
	Name: function_438ca4e0
	Namespace: spawn_beacon
	Checksum: 0xD8C0785F
	Offset: 0x2C58
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_438ca4e0()
{
	spawnbeacon = self;
	spawnbeacon.var_648955e6 = 1;
	spawnbeacon function_68a6ec15();
}

/*
	Name: function_9c87725b
	Namespace: spawn_beacon
	Checksum: 0x2BD4B16
	Offset: 0x2C98
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function function_9c87725b()
{
	var_d5110c6d = game.spawnbeaconid;
	game.spawnbeaconid = game.spawnbeaconid + 1;
	return var_d5110c6d;
}

/*
	Name: function_639cb9da
	Namespace: spawn_beacon
	Checksum: 0x7ADA044F
	Offset: 0x2CD8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_639cb9da()
{
	self endon(#"death");
	self waittill(#"game_ended");
	if(!isdefined(self))
	{
		return;
	}
	self function_a9ff3efb(0);
}

/*
	Name: function_b3608e1
	Namespace: spawn_beacon
	Checksum: 0x78C1C75D
	Offset: 0x2D30
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_b3608e1(spawnbeacon)
{
	spawnbeacon.objectiveid = getobjectiveid();
	objective_add(spawnbeacon.objectiveid, "active", spawnbeacon.origin, level.spawnbeaconsettings.settingsbundle.mainobjective);
	objective_setteam(spawnbeacon.objectiveid, spawnbeacon.team);
	function_29ef32ee(spawnbeacon.objectiveid, spawnbeacon.owner.team);
	objective_setprogress(spawnbeacon.objectiveid, 1);
}

/*
	Name: retreatedstartmelee
	Namespace: spawn_beacon
	Checksum: 0x125A709E
	Offset: 0x2E08
	Size: 0x840
	Parameters: 2
	Flags: Linked
*/
function retreatedstartmelee(var_a820f9, spawns)
{
	player = self;
	if(isdefined(level.spawnbeaconsettings.userspawnbeacons[player.clientid]) && level.spawnbeaconsettings.userspawnbeacons[player.clientid].size >= (isdefined(level.spawnbeaconsettings.settingsbundle.var_e3d3bd15) ? level.spawnbeaconsettings.settingsbundle.var_e3d3bd15 : 1))
	{
		beacontoremove = level.spawnbeaconsettings.userspawnbeacons[player.clientid][0];
		if(isdefined(beacontoremove))
		{
			beacontoremove thread function_a9ff3efb(0);
		}
		else
		{
			level.spawnbeaconsettings.userspawnbeacons[self.clientid] = undefined;
		}
	}
	slot = player gadgetgetslot(level.spawnbeaconsettings.var_c1a364b9);
	player gadgetpowerreset(slot);
	player gadgetpowerset(slot, 0);
	var_4dbaac09 = player gadgetgetslot(level.spawnbeaconsettings.var_c1a364b9);
	player function_69b5c53c(var_4dbaac09, 0);
	placedspawnbeacon = spawn("script_model", var_a820f9.origin);
	placedspawnbeacon setmodel(level.spawnbeaconsettings.var_c1a364b9.worldmodel);
	var_a820f9.spawnbeacon = placedspawnbeacon;
	placedspawnbeacon.var_2d045452 = var_a820f9;
	placedspawnbeacon function_41b29ff0(#"hash_77200d1bb519ba08");
	placedspawnbeacon useanimtree("generic");
	target_set(placedspawnbeacon, vectorscale((0, 0, 1), 32));
	placedspawnbeacon.owner = player;
	placedspawnbeacon clientfield::set("spawnbeacon_placed", 1);
	placedspawnbeacon setteam(player getteam());
	placedspawnbeacon.var_86a21346 = &function_40c032a1;
	placedspawnbeacon solid();
	placedspawnbeacon show();
	placedspawnbeacon.victimsoundmod = "vehicle";
	if((isdefined(level.var_6cd68fbe) ? level.var_6cd68fbe : 0))
	{
		player.pers[#"lives"]++;
	}
	placedspawnbeacon setweapon(level.spawnbeaconsettings.var_c1a364b9);
	placedspawnbeacon.weapon = level.spawnbeaconsettings.var_c1a364b9;
	function_b3608e1(placedspawnbeacon);
	createspawngroupforspawnbeacon(placedspawnbeacon, spawns);
	level.spawnbeaconsettings.beacons[placedspawnbeacon.objectiveid] = placedspawnbeacon;
	if(!isdefined(level.spawnbeaconsettings.userspawnbeacons[player.clientid]))
	{
		level.spawnbeaconsettings.userspawnbeacons[player.clientid] = [];
	}
	var_a7edcaed = level.spawnbeaconsettings.userspawnbeacons.size + 1;
	array::push(level.spawnbeaconsettings.userspawnbeacons[player.clientid], placedspawnbeacon, var_a7edcaed);
	if((isdefined(level.spawnbeaconsettings.settingsbundle.canbedamaged) ? level.spawnbeaconsettings.settingsbundle.canbedamaged : 0))
	{
		placedspawnbeacon setcandamage(1);
	}
	placedspawnbeacon clientfield::set("enemyequip", 1);
	placedspawnbeacon.var_99d2556b = gettime();
	placedspawnbeacon.threatlevel = 0;
	placedspawnbeacon.spawncount = 0;
	placedspawnbeacon.uniqueid = function_9c87725b();
	function_d7cd849c(level.spawnbeaconsettings.settingsbundle.var_69b1ff7, player getteam(), player);
	function_d7cd849c(level.spawnbeaconsettings.settingsbundle.var_4f37dfe9, util::getotherteam(player getteam()), undefined);
	if(isdefined(level.spawnbeaconsettings.settingsbundle.var_a0db3d4d))
	{
		placedspawnbeacon playloopsound(level.spawnbeaconsettings.settingsbundle.var_a0db3d4d);
	}
	if(isdefined(level.var_4b1d905b))
	{
		self [[level.var_4b1d905b]](placedspawnbeacon);
	}
	placedspawnbeacon thread updatethreat();
	placedspawnbeacon thread watchfordamage();
	placedspawnbeacon thread watchfordeath();
	placedspawnbeacon thread function_f8930fa1((isdefined(level.spawnbeaconsettings.settingsbundle.timeout) ? level.spawnbeaconsettings.settingsbundle.timeout : 0));
	placedspawnbeacon thread function_639cb9da();
	placedspawnbeacon callback::function_d8abfc3d(#"on_end_game", &function_438ca4e0);
	player deployable::function_6ec9ee30(placedspawnbeacon, level.spawnbeaconsettings.var_c1a364b9);
	if(!isdefined(player.pers[#"hash_677f229433c8735b"]))
	{
		player.pers[#"hash_677f229433c8735b"] = 0;
	}
	player.pers[#"hash_677f229433c8735b"]++;
	if(getdvarint(#"hash_da55c6d97d1dc52", 1) && (isdefined(level.var_6cd68fbe) ? level.var_6cd68fbe : 0))
	{
		player function_19ed70ca(slot, 1);
	}
	player.var_583f6cce = placedspawnbeacon;
	player notify(#"beacon_added");
}

/*
	Name: function_264da546
	Namespace: spawn_beacon
	Checksum: 0xBD9ADD81
	Offset: 0x3650
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_264da546(var_cd3712d2, jammer)
{
	/#
		println("");
	#/
}

/*
	Name: function_9aafb7bb
	Namespace: spawn_beacon
	Checksum: 0x1C992A8D
	Offset: 0x3690
	Size: 0x80
	Parameters: 3
	Flags: Linked
*/
function function_9aafb7bb(origin, angles, player)
{
	if(!isdefined(player.var_9bab32d9))
	{
		player.var_9bab32d9 = spawnstruct();
	}
	player.var_9bab32d9.spawns = [];
	if(isdefined(level.var_ae2fe442))
	{
		return [[level.var_ae2fe442]](origin, angles, player);
	}
	return 1;
}

/*
	Name: onplacespawnbeacon
	Namespace: spawn_beacon
	Checksum: 0x8EBBF66F
	Offset: 0x3718
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function onplacespawnbeacon(spawnbeacon)
{
	spawnbeacon setvisibletoall();
	if(isdefined(spawnbeacon.othermodel))
	{
		spawnbeacon.othermodel setinvisibletoall();
	}
	if(isdefined(spawnbeacon.var_9bab32d9) && isdefined(spawnbeacon.var_9bab32d9.spawns))
	{
		self retreatedstartmelee(spawnbeacon, spawnbeacon.var_9bab32d9.spawns);
	}
}

/*
	Name: oncancelplacement
	Namespace: spawn_beacon
	Checksum: 0x72E5F567
	Offset: 0x37C8
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function oncancelplacement(spawnbeacon)
{
	var_4dbaac09 = self gadgetgetslot(level.spawnbeaconsettings.var_c1a364b9);
	self gadgetdeactivate(var_4dbaac09, level.spawnbeaconsettings.var_c1a364b9, 0);
	self gadgetpowerset(var_4dbaac09, 100);
}

/*
	Name: function_d82c03d4
	Namespace: spawn_beacon
	Checksum: 0xAC138452
	Offset: 0x3860
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_d82c03d4(player)
{
	spawnbeacon = self;
	player endon(#"disconnect");
	spawnbeacon endon(#"death");
	player waittill(#"joined_team");
	if(isdefined(spawnbeacon))
	{
		spawnbeacon thread function_a9ff3efb(0);
	}
}

/*
	Name: function_e9fea0ea
	Namespace: spawn_beacon
	Checksum: 0x298B16C6
	Offset: 0x38F0
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_e9fea0ea()
{
	player = self;
	if(!isdefined(level.spawnbeaconsettings) || !isdefined(level.spawnbeaconsettings.userspawnbeacons))
	{
		return undefined;
	}
	return level.spawnbeaconsettings.userspawnbeacons[player.clientid];
}

/*
	Name: function_68a6ec15
	Namespace: spawn_beacon
	Checksum: 0x80F724D1
	Offset: 0x3958
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_68a6ec15()
{
}

/*
	Name: function_d32596e5
	Namespace: spawn_beacon
	Checksum: 0x80F724D1
	Offset: 0x3968
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_d32596e5()
{
}

