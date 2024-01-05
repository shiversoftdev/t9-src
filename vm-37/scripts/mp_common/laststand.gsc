#using scripts\mp_common\player\player_killed.gsc;
#using scripts\mp_common\player\player_damage.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\weapons\weapons.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using script_45fdb6cec5580007;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_5394c653bafe1358;
#using script_243ea03c7a285692;

#namespace laststand_mp;

/*
	Name: __init__system__
	Namespace: laststand_mp
	Checksum: 0xA64B957F
	Offset: 0x458
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"laststand_mp", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: laststand_mp
	Checksum: 0x3CCA303E
	Offset: 0x4A0
	Size: 0x6FC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.skiplaststand))
	{
		level.skiplaststand = 0;
	}
	if(!isdefined(level.var_f19192e3))
	{
		level.var_f19192e3 = 1;
	}
	if(!isdefined(level.var_39d772ad))
	{
		level.var_39d772ad = 0;
	}
	if(!isdefined(level.var_6dec0ba0))
	{
		level.var_6dec0ba0 = 0;
	}
	if(!isdefined(level.var_b21f0c3))
	{
		level.var_b21f0c3 = 1;
	}
	if(!isdefined(level.var_e735bd66))
	{
		level.var_e735bd66 = 0;
	}
	if(!isdefined(level.var_b1c167f1))
	{
		level.var_b1c167f1 = 1;
	}
	if(!isdefined(level.var_55615499))
	{
		level.var_55615499 = 1;
	}
	if(!isdefined(level.var_3709909d))
	{
		level.var_3709909d = 1;
	}
	if(!isdefined(level.var_47ee6930))
	{
		level.var_47ee6930 = 1;
	}
	function_349ff038();
	clientfield::register_clientuimodel("hudItems.laststand.progress", 13000, 5, "float");
	clientfield::register_clientuimodel("hudItems.laststand.beingRevived", 13000, 1, "int");
	clientfield::register_clientuimodel("hudItems.laststand.cowardsWayBleedOut", 1, 1, "int");
	clientfield::register_clientuimodel("hudItems.laststand.revivingClientNum", 1, 7, "int");
	clientfield::register_clientuimodel("hudItems.laststand.reviveProgress", 1, 5, "float");
	clientfield::register_clientuimodel("EnemyTeamLastLivesData.numPlayersDowned", 1, 3, "int");
	clientfield::register_clientuimodel("PlayerTeamLastLivesData.numPlayersDowned", 1, 3, "int");
	clientfield::register("allplayers", "laststand_bleed", 1, 1, "int");
	clientfield::register_clientuimodel("hud_items.selfReviveAvailable", 1, 1, "int");
	clientfield::register("toplayer", "isSelfReviving", 1, 1, "int");
	level.var_8e910e84 = 1;
	level.var_97c6ee7c = &playerlaststand;
	level.skiplaststand = getgametypesetting(#"skiplaststand");
	level.var_25364e47 = getgametypesetting(#"hash_83f11b8abac148f");
	level.var_5c13c13f = getgametypesetting(#"hash_4c7c8c4bd1b2a58b");
	level.var_57e7d5a = getgametypesetting(#"hash_67d54bbc52811921");
	level.var_b5087de4 = getgametypesetting(#"hash_3e13b420d6773b4c");
	level.var_5bf4f34b = (isdefined(getgametypesetting(#"wzenablecowardswayout")) ? getgametypesetting(#"wzenablecowardswayout") : 0);
	level.laststandweapon = getweapon(#"downed");
	level.var_e273f858 = getweapon(#"notdowned");
	level.var_e86679bd = [];
	level.var_402b86e = &function_c3249e8c;
	if(isdefined(level.revive_hud))
	{
		level thread revive_hud_think();
	}
	level.var_91c33dcb = getscriptbundle(#"finishers");
	if(!isdefined(getdvar(#"revive_trigger_radius")))
	{
		setdvar(#"revive_trigger_radius", 100);
	}
	callback::on_connect(&on_player_connect);
	callback::on_joined_team(&on_joined_team);
	callback::on_spawned(&on_player_spawned);
	callback::on_player_damage(&on_player_damage);
	callback::on_player_killed(&on_player_killed);
	callback::on_disconnect(&on_player_disconnect);
	level.var_dea23a93 = [];
	level.var_ead46974 = [];
	foreach(team, teamstr in level.teams)
	{
		level.var_dea23a93[team] = 0;
		level.var_ead46974[team] = 0;
	}
	/#
		level thread function_86c92a7e();
	#/
	setdvar(#"g_revivetime", getgametypesetting(#"laststandrevivetime"));
}

/*
	Name: function_349ff038
	Namespace: laststand_mp
	Checksum: 0xC33E70B6
	Offset: 0xBA8
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function function_349ff038()
{
	var_f6784858 = 6;
	if(sessionmodeiswarzonegame())
	{
		var_f6784858 = 4;
	}
	prompts = [];
	for(i = 0; i < var_f6784858; i++)
	{
		var_c4d0fe29 = i + 1;
		prompts[i] = mp_revive_prompt::register();
	}
	level.mp_revive_prompt = prompts;
}

/*
	Name: function_feb3e91d
	Namespace: laststand_mp
	Checksum: 0x90CE21D4
	Offset: 0xC50
	Size: 0x50
	Parameters: 0
	Flags: None
*/
function function_feb3e91d()
{
	return true;
}

/*
	Name: function_367cfa1b
	Namespace: laststand_mp
	Checksum: 0x1B95E21B
	Offset: 0xCA8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_367cfa1b(callbackfunc)
{
	level.var_dcc41ae = callbackfunc;
}

/*
	Name: function_eb8c0e47
	Namespace: laststand_mp
	Checksum: 0x2AA94FEC
	Offset: 0xCD0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_eb8c0e47(callbackfunc)
{
	level.var_f80fdd3f = callbackfunc;
}

/*
	Name: function_414115a0
	Namespace: laststand_mp
	Checksum: 0xF140A9C2
	Offset: 0xCF8
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function function_414115a0(time, health)
{
	tier = {#health:health, #time:time};
	level.var_e86679bd[level.var_e86679bd.size] = tier;
}

/*
	Name: on_player_connect
	Namespace: laststand_mp
	Checksum: 0x2C9EE1C7
	Offset: 0xD68
	Size: 0x110
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	if(!isdefined(level.var_dea23a93[self.team]))
	{
		level.var_dea23a93[self.team] = 0;
	}
	if(!isdefined(level.var_ead46974[self.team]))
	{
		level.var_ead46974[self.team] = 0;
	}
	foreach(prompt in level.mp_revive_prompt)
	{
		[[ prompt ]]->set_clientnum(self, int(pow(2, 7) - 2));
	}
}

/*
	Name: on_joined_team
	Namespace: laststand_mp
	Checksum: 0xA8C6DAB0
	Offset: 0xE80
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function on_joined_team(params)
{
	if(!isdefined(level.var_dea23a93[self.team]))
	{
		level.var_dea23a93[self.team] = 0;
	}
	if(!isdefined(level.var_ead46974[self.team]))
	{
		level.var_ead46974[self.team] = 0;
	}
	self clientfield::set_player_uimodel("PlayerTeamLastLivesData.numPlayersDowned", level.var_dea23a93[self.team]);
	self clientfield::set_player_uimodel("EnemyTeamLastLivesData.numPlayersDowned", level.var_ead46974[self.team]);
}

/*
	Name: on_player_spawned
	Namespace: laststand_mp
	Checksum: 0x3C19B954
	Offset: 0xF48
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	if(isdefined(level.revive_hud))
	{
		self laststand::revive_hud_create();
	}
	self clientfield::set_player_uimodel("hudItems.laststand.revivingClientNum", int(pow(2, 7) - 2));
	self.var_d887a4ad = undefined;
	self.var_156bf46e = undefined;
	self.var_5b73c96a = undefined;
}

/*
	Name: function_e011eea6
	Namespace: laststand_mp
	Checksum: 0x9B4F78DE
	Offset: 0xFE8
	Size: 0xC2
	Parameters: 1
	Flags: Event
*/
event function_e011eea6(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	if(self inlaststand())
	{
		self.var_156bf46e = eventstruct.vehicle;
	}
	else if(isairborne(eventstruct.vehicle))
	{
		self.var_156bf46e = eventstruct.vehicle;
		waitframe(1);
		if(isalive(self) && !self inlaststand())
		{
			self.var_156bf46e = undefined;
		}
	}
}

/*
	Name: on_player_damage
	Namespace: laststand_mp
	Checksum: 0x22F62158
	Offset: 0x10B8
	Size: 0xB2
	Parameters: 1
	Flags: None
*/
function on_player_damage(params)
{
	if(self is_reviving_any())
	{
		if(isdefined(self.reviving_player) && isdefined(self.reviving_player.var_d75a6ff5))
		{
			self.reviving_player.var_d75a6ff5.var_d733f8d7 = self.reviving_player.var_d75a6ff5.var_d733f8d7 + params.idamage;
			if(self.health <= params.idamage)
			{
				self.reviving_player.var_d75a6ff5.var_bb36e277 = 1;
			}
		}
	}
}

/*
	Name: on_player_killed
	Namespace: laststand_mp
	Checksum: 0xD884A88F
	Offset: 0x1178
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function on_player_killed(params)
{
	if(is_true(level.var_f19192e3))
	{
		self function_7ff2fc91();
	}
}

/*
	Name: on_player_disconnect
	Namespace: laststand_mp
	Checksum: 0x674DEA59
	Offset: 0x11C0
	Size: 0xDE
	Parameters: 0
	Flags: None
*/
function on_player_disconnect()
{
	if(is_true(level.var_f19192e3))
	{
		self function_7ff2fc91();
	}
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger delete();
		self.revivetrigger = undefined;
	}
	if(isdefined(self.laststandparams))
	{
		attacker = self.laststandparams.attacker;
		weapon = self.laststandparams.weapon;
		smeansofdeath = self.laststandparams.smeansofdeath;
	}
}

/*
	Name: function_7ff2fc91
	Namespace: laststand_mp
	Checksum: 0x6B05F1A3
	Offset: 0x12A8
	Size: 0x100
	Parameters: 0
	Flags: None
*/
function function_7ff2fc91()
{
	var_4cf51823 = function_c0ec19cd();
	if(!var_4cf51823)
	{
		friendlies = function_78d8cf9b(self);
		foreach(player in friendlies)
		{
			if(player != self && isalive(player) && player laststand::player_is_in_laststand())
			{
				player thread function_64df6095();
			}
		}
	}
}

/*
	Name: function_263a2944
	Namespace: laststand_mp
	Checksum: 0x62ABFB8C
	Offset: 0x13B0
	Size: 0xBC
	Parameters: 2
	Flags: None
*/
function function_263a2944(prompt, var_a1258c6b)
{
	var_a1258c6b waittill(#"player_revived", #"disconnect", #"bled_out", #"death");
	if(isdefined(self))
	{
		[[ prompt ]]->close(self);
		[[ prompt ]]->set_clientnum(self, int(pow(2, 7) - 2));
	}
}

/*
	Name: function_c025efba
	Namespace: laststand_mp
	Checksum: 0x8A215830
	Offset: 0x1478
	Size: 0x112
	Parameters: 2
	Flags: None
*/
function function_c025efba(prompt, var_a1258c6b)
{
	var_a1258c6b endon(#"player_revived", #"disconnect", #"bled_out", #"death");
	self endon(#"disconnect");
	clientnum = var_a1258c6b getentitynumber();
	while(true)
	{
		if(![[ prompt ]]->function_7bfd10e6(self))
		{
			[[ prompt ]]->open(self);
			[[ prompt ]]->set_clientnum(self, clientnum);
		}
		[[ prompt ]]->set_progress(self, var_a1258c6b.var_2d19ce3c);
		[[ prompt ]]->set_reviveprogress(self, var_a1258c6b.reviveprogress);
		waitframe(1);
	}
}

/*
	Name: function_5de626dc
	Namespace: laststand_mp
	Checksum: 0xA09B7FC7
	Offset: 0x1598
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_5de626dc(var_a1258c6b)
{
	foreach(prompt in level.mp_revive_prompt)
	{
		if(![[ prompt ]]->function_7bfd10e6(self))
		{
			[[ prompt ]]->open(self);
			[[ prompt ]]->set_progress(self, 1);
			[[ prompt ]]->set_reviveprogress(self, 0);
			[[ prompt ]]->set_clientnum(self, var_a1258c6b getentitynumber());
			self thread function_263a2944(prompt, var_a1258c6b);
			self thread function_c025efba(prompt, var_a1258c6b);
			break;
		}
	}
}

/*
	Name: function_dc7906e8
	Namespace: laststand_mp
	Checksum: 0xD89E8B3D
	Offset: 0x16D8
	Size: 0x2E4
	Parameters: 8
	Flags: None
*/
function function_dc7906e8(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc)
{
	self.laststandparams = spawnstruct();
	self.var_bfc8055f = spawnstruct();
	self.laststandparams.einflictor = einflictor;
	self.var_bfc8055f.var_b5346661 = (isdefined(einflictor) ? einflictor getentitynumber() : -1);
	self.laststandparams.attacker = attacker;
	self.var_bfc8055f.attackernum = (isdefined(attacker) ? attacker getentitynumber() : -1);
	self.laststandparams.attackerorigin = attacker.origin;
	if(isplayer(attacker))
	{
		self.laststandparams.var_83634238 = attacker getplayerangles();
	}
	else
	{
		self.laststandparams.var_83634238 = attacker.angles;
	}
	self.laststandparams.idamage = idamage;
	self.laststandparams.smeansofdeath = smeansofdeath;
	self.laststandparams.weapon = weapon;
	self.laststandparams.var_fd90b0bb = var_fd90b0bb;
	self.laststandparams.vdir = vdir;
	self.laststandparams.shitloc = shitloc;
	self.laststandparams.laststandstarttime = gettime();
	self.laststandparams.victimorigin = self.origin;
	self.laststandparams.var_5fceefd4 = self getplayerangles();
	self.laststandparams.victimweapon = self.currentweapon;
	self.laststandparams.var_10d87328 = gettime();
	self.laststandparams.bledout = 0;
	self.laststandparams.var_59b19c1b = 0;
	if(isdefined(level.var_82b353bf))
	{
		self.laststandparams.var_60cb0c39 = self [[level.var_82b353bf]](attacker);
	}
	self.laststandparams.var_5eb847d5 = self challenges::playerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, shitloc, undefined, 0, 1);
}

/*
	Name: function_67b38e11
	Namespace: laststand_mp
	Checksum: 0x581F1E25
	Offset: 0x19C8
	Size: 0x1EA
	Parameters: 8
	Flags: None
*/
function function_67b38e11(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.laststandparams))
	{
		self.laststandparams = [];
	}
	if(!isdefined(self.var_bfc8055f))
	{
		self.var_bfc8055f = [];
	}
	self.laststandparams.einflictor = einflictor;
	self.var_bfc8055f.var_b5346661 = (isdefined(einflictor) ? einflictor getentitynumber() : -1);
	self.laststandparams.attacker = attacker;
	self.var_bfc8055f.attackernum = (isdefined(attacker) ? attacker getentitynumber() : -1);
	self.laststandparams.idamage = idamage;
	self.laststandparams.smeansofdeath = smeansofdeath;
	self.laststandparams.weapon = weapon;
	self.laststandparams.var_fd90b0bb = var_fd90b0bb;
	self.laststandparams.vdir = vdir;
	self.laststandparams.shitloc = shitloc;
	if(isdefined(einflictor) && isdefined(einflictor.item) && einflictor.item.name === #"planemortar")
	{
		self.laststandparams.killcam_entity_info_cached = killcam::get_killcam_entity_info(attacker, einflictor, weapon);
	}
}

/*
	Name: function_d5db8d2e
	Namespace: laststand_mp
	Checksum: 0x36B73788
	Offset: 0x1BC0
	Size: 0x2C
	Parameters: 2
	Flags: None
*/
function function_d5db8d2e(attacker, weapon)
{
	self function_2907ce7a();
}

/*
	Name: function_c0ec19cd
	Namespace: laststand_mp
	Checksum: 0xFCA1CEEE
	Offset: 0x1BF8
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_c0ec19cd()
{
	friendlies = function_78d8cf9b(self);
	foreach(player in friendlies)
	{
		if(player == self)
		{
			if(player clientfield::get_player_uimodel("hud_items.selfReviveAvailable"))
			{
				return true;
			}
			continue;
		}
		if(!isalive(player))
		{
			continue;
		}
		if(!player laststand::player_is_in_laststand() || player clientfield::get_player_uimodel("hud_items.selfReviveAvailable"))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_78d8cf9b
	Namespace: laststand_mp
	Checksum: 0x58157941
	Offset: 0x1D20
	Size: 0x196
	Parameters: 1
	Flags: None
*/
function function_78d8cf9b(player)
{
	/#
		assert(isplayer(player));
	#/
	friendlies = [];
	if(!isplayer(player))
	{
		return friendlies;
	}
	if(player.squad != #"none" && squads::function_a9758423())
	{
		friendlies = arraycombine(friendlies, function_c65231e2(player.squad), 0, 0);
	}
	else
	{
		teams = player function_2b77bc35();
		foreach(team in teams)
		{
			players = getplayers(team);
			friendlies = arraycombine(friendlies, players, 0, 0);
		}
	}
	return friendlies;
}

/*
	Name: function_2b77bc35
	Namespace: laststand_mp
	Checksum: 0xFE864080
	Offset: 0x1EC0
	Size: 0x6E
	Parameters: 0
	Flags: None
*/
function function_2b77bc35()
{
	teams = [];
	if(!isdefined(teams))
	{
		teams = [];
	}
	else if(!isarray(teams))
	{
		teams = array(teams);
	}
	teams[teams.size] = self.team;
	return teams;
}

/*
	Name: function_86c92a7e
	Namespace: laststand_mp
	Checksum: 0xC1803982
	Offset: 0x1F38
	Size: 0x270
	Parameters: 0
	Flags: None
*/
function function_86c92a7e()
{
	/#
		level endon(#"game_ended");
		while(true)
		{
			var_e796bc31 = getdvarstring(#"scr_last_stand", "");
			if(var_e796bc31 == "")
			{
				host = util::gethostplayer();
				angles = host getplayerangles();
				dir = anglestoforward(angles);
				eye = host geteye();
				dir = dir * 500;
				trace = bullettrace(eye, eye + dir, 1, host);
				target = trace[#"entity"];
				if(!isdefined(target) || !isplayer(target))
				{
					target = host;
				}
				target dodamage(1000, target.origin);
			}
			else if(var_e796bc31 == "")
			{
				foreach(player in getplayers())
				{
					if(isdefined(player.revivetrigger))
					{
						player notify(#"auto_revive");
					}
				}
			}
			setdvar(#"scr_last_stand", "");
			wait(0.1);
		}
	#/
}

/*
	Name: function_b1158c52
	Namespace: laststand_mp
	Checksum: 0x4D5D2711
	Offset: 0x21B0
	Size: 0x48A
	Parameters: 4
	Flags: None
*/
function function_b1158c52(attacker, idamage, smeansofdeath, var_4cf51823)
{
	if(is_true(level.skiplaststand))
	{
		return 1;
	}
	if(is_true(level.var_f19192e3) && !var_4cf51823)
	{
		return 1;
	}
	if(is_true(level.var_39d772ad) && self.usingremote)
	{
		return 1;
	}
	if(is_true(level.var_6dec0ba0) && isdefined(attacker) && attacker == self)
	{
		return 1;
	}
	if(is_true(level.var_25364e47) && self.laststandcount > level.var_25364e47)
	{
		return 1;
	}
	if(is_true(level.var_b21f0c3) && self isplayerswimming())
	{
		return 1;
	}
	if(is_true(level.var_e735bd66) && isvehicle(self.var_156bf46e) && !self.var_156bf46e isremotecontrol())
	{
		return 1;
	}
	if(is_true(level.var_47ee6930) && self isremotecontrolling())
	{
		return 1;
	}
	if(is_true(level.var_b1c167f1) && isvehicle(self.var_156bf46e) && !self.var_156bf46e isremotecontrol() && isairborne(self.var_156bf46e) && function_5ffabd64(self.var_156bf46e, self))
	{
		return 1;
	}
	if(is_true(level.var_55615499) && isvehicle(self.var_156bf46e) && !self.var_156bf46e isremotecontrol() && self.var_156bf46e.vehicleclass === "boat" && function_61c14ebf(self.var_156bf46e, self))
	{
		return 1;
	}
	if(is_true(level.var_3709909d) && isdefined(smeansofdeath) && isdefined(idamage) && smeansofdeath == "MOD_FALLING" && idamage >= self.maxhealth)
	{
		return 1;
	}
	if(!function_3238d10d(self.origin))
	{
		return 1;
	}
	if(is_true(self.var_f5dc0dbf))
	{
		self.var_f5dc0dbf = undefined;
		self.var_5b73c96a = 1;
		return 1;
	}
	var_b145f8cd = self.laststandcount - 1;
	if(var_b145f8cd >= level.var_e86679bd.size)
	{
		var_b145f8cd = level.var_e86679bd.size - 1;
	}
	var_e86679bd = level.var_e86679bd[var_b145f8cd];
	if(isdefined(var_e86679bd))
	{
		return var_e86679bd.time <= 0;
	}
	return 0;
}

/*
	Name: function_5ffabd64
	Namespace: laststand_mp
	Checksum: 0x23CFBE48
	Offset: 0x2648
	Size: 0x7C
	Parameters: 2
	Flags: Private
*/
function private function_5ffabd64(vehicle, player)
{
	trace = groundtrace(player.origin, player.origin - vectorscale((0, 0, 1), 300), 0, vehicle);
	if(trace[#"fraction"] >= 1)
	{
		return true;
	}
	return false;
}

/*
	Name: function_61c14ebf
	Namespace: laststand_mp
	Checksum: 0x91B64A0A
	Offset: 0x26D0
	Size: 0x100
	Parameters: 2
	Flags: Private
*/
function private function_61c14ebf(vehicle, player)
{
	exitposition = vehicle function_212db732(player);
	traceorigin = (isdefined(exitposition) ? exitposition : player.origin);
	ignoreent = (isdefined(exitposition) ? undefined : vehicle);
	trace = groundtrace(traceorigin, traceorigin - vectorscale((0, 0, 1), 500), 0, ignoreent, 1);
	if(trace[#"fraction"] >= 1 || oob::chr_party(trace[#"position"]))
	{
		return true;
	}
	return false;
}

/*
	Name: playerlaststand
	Namespace: laststand_mp
	Checksum: 0x80C95A5F
	Offset: 0x27D8
	Size: 0xA64
	Parameters: 10
	Flags: None
*/
function playerlaststand(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, delayoverride)
{
	if(self laststand::player_is_in_laststand())
	{
		return;
	}
	self.var_60956d6 = self getcurrentweapon();
	self function_dc7906e8(idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, delayoverride);
	if(!isdefined(self.laststandcount))
	{
		self.laststandcount = 0;
	}
	self.laststandcount++;
	self function_ecdd4b27();
	if(isdefined(level.var_f7b64ada))
	{
		[[level.var_f7b64ada]]();
	}
	friendlies = getplayers(self.team);
	var_4cf51823 = self function_c0ec19cd();
	if(self function_b1158c52(smeansofdeath, weapon, var_fd90b0bb, var_4cf51823))
	{
		self undolaststand();
		self.uselaststandparams = 1;
		self function_6da86ae();
		self.laststandparams.killcam_entity_info_cached = killcam::get_killcam_entity_info(smeansofdeath, idamage, vdir);
		self suicide(var_fd90b0bb, smeansofdeath.origin);
		if(isdefined(self.var_d75a6ff5))
		{
			self.var_d75a6ff5.death = 1;
		}
		self function_1e8018b0();
		if(!var_4cf51823)
		{
			foreach(player in friendlies)
			{
				if(player != self && isalive(player) && player laststand::player_is_in_laststand())
				{
					player thread bleed_out();
					player.var_9cd2c51d.var_a063d754 = 1;
				}
			}
		}
		return;
	}
	obituary(self, smeansofdeath, level.weaponnone, "MOD_DOWNED");
	if(isplayer(smeansofdeath))
	{
		var_e6af62e9 = self player::function_40c6c42d(smeansofdeath);
		function_f887b191(self, smeansofdeath, var_e6af62e9, 1);
	}
	if(isdefined(smeansofdeath) && isplayer(smeansofdeath))
	{
		if(util::function_fbce7263(smeansofdeath.team, self.team) && !function_7afe7d1e(smeansofdeath, self) && self.var_179765d7 !== 1)
		{
			scoreevents::processscoreevent(#"downed_enemy", smeansofdeath, self, vdir);
		}
		if(isdefined(level.var_dcc41ae))
		{
			[[level.var_dcc41ae]](smeansofdeath, self, idamage, vdir, var_fd90b0bb);
		}
	}
	self.reviveprogress = 0;
	self.var_2d19ce3c = 1;
	if(!isdefined(level.var_dea23a93[self.team]))
	{
		level.var_dea23a93[self.team] = 0;
	}
	level.var_dea23a93[self.team]++;
	var_9b6c9b51 = level.var_dea23a93[self.team];
	foreach(player in friendlies)
	{
		player clientfield::set_player_uimodel("PlayerTeamLastLivesData.numPlayersDowned", var_9b6c9b51);
		player thread function_5de626dc(self);
	}
	foreach(team, count in level.var_ead46974)
	{
		if(!util::function_fbce7263(team, self.team))
		{
			continue;
		}
		count++;
		level.var_ead46974[team] = count;
		foreach(player in getplayers(team))
		{
			player clientfield::set_player_uimodel("EnemyTeamLastLivesData.numPlayersDowned", count);
		}
	}
	self notify(#"entering_last_stand");
	self allowjump(0);
	self disableoffhandweapons();
	self.health = 5;
	self.laststand = 1;
	self.meleeattackers = undefined;
	callback::callback(#"on_player_laststand");
	self function_d5db8d2e(smeansofdeath, vdir);
	if(!is_true(self.no_revive_trigger))
	{
		self revive_trigger_spawn();
	}
	self thread laststand_disable_player_weapons();
	bleedout_time = getdvarfloat(#"player_laststandbleedouttime", 0);
	var_969fabf4 = self.maxhealth;
	var_b145f8cd = self.laststandcount - 1;
	if(var_b145f8cd >= level.var_e86679bd.size)
	{
		var_b145f8cd = level.var_e86679bd.size - 1;
	}
	var_e86679bd = level.var_e86679bd[var_b145f8cd];
	if(isdefined(var_e86679bd))
	{
		bleedout_time = var_e86679bd.time;
		var_969fabf4 = var_e86679bd.health;
	}
	self clientfield::set("laststand_bleed", 1);
	/#
		bleedout_time = getdvarfloat(#"overridebleedouttime", bleedout_time);
	#/
	self thread laststand_bleedout(bleedout_time, var_969fabf4);
	self thread laststand_invulnerability();
	demo::bookmark(#"player_downed", gettime(), self);
	potm::bookmark(#"player_downed", gettime(), self);
	if(!player::function_faf77690(vdir, idamage, smeansofdeath))
	{
		overrideentitycamera = player::function_c0f28ff9(smeansofdeath, vdir);
		var_50d1e41a = potm::function_775b9ad1(vdir, var_fd90b0bb);
		potm::function_66d09fea(#"hash_11588f7b0737f095", smeansofdeath, self, idamage, var_50d1e41a, overrideentitycamera);
	}
	self thread laststand::function_d4c9e1b5();
	self thread auto_revive_on_notify();
	self thread function_5ccd602d();
	if(self clientfield::get_player_uimodel("hud_items.selfReviveAvailable"))
	{
		self thread function_8e3d5c84();
	}
	/#
		if(getdvarint(#"hash_4fc41e7721e32d59", 0) && isbot(self))
		{
			self thread function_64bea7b1();
		}
	#/
}

/*
	Name: function_5ccd602d
	Namespace: laststand_mp
	Checksum: 0xB3A8909C
	Offset: 0x3248
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_5ccd602d()
{
	self endon(#"player_revived", #"disconnect");
	self waittill(#"death");
	self function_2907ce7a();
	self undolaststand();
}

/*
	Name: laststand_disable_player_weapons
	Namespace: laststand_mp
	Checksum: 0xE0A791AE
	Offset: 0x32B8
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function laststand_disable_player_weapons()
{
	self endon(#"death", #"disconnect");
	self giveweapon(level.laststandweapon);
	self givemaxammo(level.laststandweapon);
	self switchtoweaponimmediate(level.laststandweapon, 1);
	self disableweaponcycling();
	self disableoffhandweapons();
	self disableweaponswitchhero();
	self waittilltimeout(1, #"weapon_change_complete");
	self weapons::detach_all_weapons();
}

/*
	Name: function_102748f8
	Namespace: laststand_mp
	Checksum: 0x61587023
	Offset: 0x33C0
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_102748f8()
{
	self takeweapon(level.laststandweapon);
	self giveweapon(level.var_e273f858);
	self switchtoweaponimmediate(level.var_e273f858, 1);
}

/*
	Name: laststand_enable_player_weapons
	Namespace: laststand_mp
	Checksum: 0x80ED80B
	Offset: 0x3430
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function laststand_enable_player_weapons()
{
	self takeweapon(level.var_e273f858);
	self enableweaponcycling();
	self enableoffhandweapons();
	self enableweaponswitchhero();
	self weapons::function_d571ac59(self.var_60956d6);
}

/*
	Name: laststand_clean_up_on_interrupt
	Namespace: laststand_mp
	Checksum: 0xCEE85DE6
	Offset: 0x34C8
	Size: 0x1BC
	Parameters: 1
	Flags: None
*/
function laststand_clean_up_on_interrupt(playerbeingrevived)
{
	level endon(#"game_ended");
	self endon(#"do_revive_ended_normally", #"disconnect");
	revivetrigger = playerbeingrevived.revivetrigger;
	playerbeingrevived waittill(#"death", #"disconnect");
	if(isdefined(playerbeingrevived))
	{
		playerbeingrevived clientfield::set_player_uimodel("hudItems.laststand.beingRevived", 0);
		if(self == playerbeingrevived)
		{
			self clientfield::set_to_player("isSelfReviving", 0);
		}
		if(playerbeingrevived isgestureplaying("ges_t9_self_revive_last_stand"))
		{
			playerbeingrevived stopgestureviewmodel("ges_t9_self_revive_last_stand");
		}
	}
	if(isdefined(revivetrigger))
	{
		revivetrigger delete();
	}
	self function_2907ce7a();
	if(playerbeingrevived !== self)
	{
		self function_92bfddb4();
	}
	self clientfield::set_player_uimodel("hudItems.laststand.revivingClientNum", int(pow(2, 7) - 2));
}

/*
	Name: laststand_bleedout_damage
	Namespace: laststand_mp
	Checksum: 0xAACC7382
	Offset: 0x3690
	Size: 0x338
	Parameters: 0
	Flags: None
*/
function laststand_bleedout_damage()
{
	level endon(#"game_ended");
	self endon(#"player_revived", #"disconnect", #"bled_out");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"laststand_damage");
		if(self.var_d887a4ad === 1)
		{
			return;
		}
		if(function_58f9f9c5(waitresult))
		{
			self.var_969fabf4 = 0;
		}
		else
		{
			self.var_969fabf4 = self.var_969fabf4 - waitresult.idamage;
		}
		if(self.var_969fabf4 <= 0)
		{
			self.bleedout_time = 0;
			self.var_1cc38de0 = 1;
			vattacker = (isdefined(waitresult.eattacker) ? waitresult.eattacker : self);
			self.var_a1d415ee = {#hash_10d87328:function_f8d53445(), #shitloc:waitresult.shitloc, #vdir:waitresult.vdir, #hash_fd90b0bb:waitresult.var_fd90b0bb, #weapon:waitresult.weapon, #smeansofdeath:waitresult.smeansofdeath, #idamage:waitresult.idamage, #hash_83634238:(isplayer(vattacker) ? vattacker getplayerangles() : vattacker.angles), #attackerorigin:vattacker.origin, #attacker:waitresult.eattacker, #einflictor:waitresult.einflictor};
		}
		if(isdefined(self.var_d75a6ff5))
		{
			self.var_d75a6ff5.damage = self.var_d75a6ff5.damage + int(waitresult.idamage);
		}
		self function_a6872ca5(waitresult.idamage, waitresult.eattacker, waitresult.idflags, waitresult.smeansofdeath, waitresult.weapon, waitresult.var_fd90b0bb, waitresult.vpoint, waitresult.shitloc, waitresult.vdamageorigin, waitresult.boneindex, waitresult.vsurfacenormal, self.var_969fabf4 <= 0);
	}
}

/*
	Name: function_58f9f9c5
	Namespace: laststand_mp
	Checksum: 0xC5C5CF99
	Offset: 0x39D0
	Size: 0xBA
	Parameters: 1
	Flags: None
*/
function function_58f9f9c5(var_acdfb38d)
{
	attacker = player::figure_out_attacker(var_acdfb38d.eattacker);
	if(!isplayer(attacker) || !isdefined(var_acdfb38d.einflictor) || var_acdfb38d.einflictor != attacker)
	{
		return 0;
	}
	return var_acdfb38d.smeansofdeath == "MOD_MELEE" || var_acdfb38d.smeansofdeath == "MOD_MELEE_WEAPON_BUTT" || var_acdfb38d.smeansofdeath == "MOD_MELEE_ASSASSINATE";
}

/*
	Name: is_being_revived
	Namespace: laststand_mp
	Checksum: 0x63AD13B5
	Offset: 0x3A98
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function is_being_revived()
{
	return isdefined(self.revivetrigger) && is_true(self.revivetrigger.beingrevived);
}

/*
	Name: function_72e0c544
	Namespace: laststand_mp
	Checksum: 0x6B3111D1
	Offset: 0x3AD8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_72e0c544()
{
	return isdefined(self.revivetrigger) && is_true(self.revivetrigger.var_3840aba9);
}

/*
	Name: laststand_bleedout
	Namespace: laststand_mp
	Checksum: 0x3F4C8E98
	Offset: 0x3B18
	Size: 0x5B4
	Parameters: 2
	Flags: None
*/
function laststand_bleedout(bleedouttime, var_969fabf4)
{
	level endon(#"game_ended");
	self endon(#"player_revived", #"player_bleedout", #"death", #"disconnect");
	self.var_84c0402e = bleedouttime;
	self.bleedout_time = bleedouttime;
	self.var_969fabf4 = var_969fabf4;
	self.var_2d19ce3c = 0;
	self.var_1cc38de0 = 0;
	self.var_eb33efbc = 0;
	self.var_bcba8155 = 0;
	var_cb141a23 = int(0.1 * 1000);
	var_93b9385d = bleedouttime * 0.06;
	var_1b4f5d73 = "BUTTON_BIT_ACTIONSLOT_4";
	if(self function_a8bbc98a(4) != #"scorestreak_wheel")
	{
		for(i = 1; i <= 4; i++)
		{
			if(self function_a8bbc98a(i) == #"scorestreak_wheel")
			{
				var_1b4f5d73 = "BUTTON_BIT_ACTIONSLOT_" + i;
				break;
			}
		}
	}
	var_cebeb781 = !self usebuttonpressed();
	var_3e5a068a = !self buttonbitstate(var_1b4f5d73);
	if(self.bleedout_time > 0)
	{
		if(!is_true(level.var_7624ce4c))
		{
			self thread laststand_bleedout_damage();
		}
		var_7c962084 = undefined;
		var_9da219f5 = gettime();
		while(self.bleedout_time > 0 || (self isinexecutionvictim() && !is_true(self.var_1cc38de0)))
		{
			time = gettime();
			if(is_true(level.var_5bf4f34b) && var_cebeb781 && self usebuttonpressed() && !self is_being_revived() && !self function_72e0c544())
			{
				if(!isdefined(var_7c962084))
				{
					var_7c962084 = time;
				}
				self.var_eb33efbc = 1;
				if(time >= (var_7c962084 + var_cb141a23))
				{
					self.bleedout_time = self.bleedout_time - var_93b9385d;
					var_7c962084 = time;
					var_9da219f5 = var_9da219f5 + var_cb141a23;
				}
			}
			else if(time >= var_9da219f5)
			{
				self.bleedout_time = self.bleedout_time - 1;
				var_7c962084 = undefined;
				var_9da219f5 = time + (int(1 * 1000));
			}
			self.var_2d19ce3c = self.bleedout_time / bleedouttime;
			if(self.var_d887a4ad !== 1)
			{
				self clientfield::set_player_uimodel("hudItems.laststand.progress", self.var_2d19ce3c);
			}
			self clientfield::set_player_uimodel("hudItems.laststand.cowardsWayBleedOut", (self.var_eb33efbc ? 1 : 0));
			if(self buttonbitstate(var_1b4f5d73) && (time - self.var_bcba8155) > (int(3 * 1000)))
			{
				self battlechatter::play_dialog("laststandHelpCallout", 1);
				self.var_bcba8155 = time;
			}
			waitframe(1);
			var_cebeb781 = var_cebeb781 | !self usebuttonpressed();
			var_3e5a068a = var_3e5a068a | !self buttonbitstate(var_1b4f5d73);
			self.var_eb33efbc = 0;
			while(!is_true(self.var_1cc38de0) && (self is_being_revived() || self function_72e0c544()))
			{
				waitframe(1);
			}
		}
	}
	if(is_true(self.var_d887a4ad))
	{
		return;
	}
	self notify(#"bled_out");
	self thread bleed_out();
}

/*
	Name: laststand_invulnerability
	Namespace: laststand_mp
	Checksum: 0x94087502
	Offset: 0x40D8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function laststand_invulnerability()
{
	self endon(#"death");
	self enableinvulnerability();
	wait(level.var_5c13c13f);
	self disableinvulnerability();
}

/*
	Name: function_6da86ae
	Namespace: laststand_mp
	Checksum: 0x33D47603
	Offset: 0x4130
	Size: 0x76
	Parameters: 0
	Flags: None
*/
function function_6da86ae()
{
	if(isdefined(self) && isdefined(self.laststandparams))
	{
		if(!isdefined(self.laststandparams.attacker))
		{
			self.laststandparams.attacker = self;
		}
		if(!isdefined(self.laststandparams.einflictor))
		{
			self.laststandparams.einflictor = self.laststandparams.attacker;
		}
	}
}

/*
	Name: function_64df6095
	Namespace: laststand_mp
	Checksum: 0x5A3673FF
	Offset: 0x41B0
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_64df6095()
{
	self endon(#"death");
	while(self isinexecutionvictim())
	{
		waitframe(1);
	}
	self bleed_out();
}

/*
	Name: bleed_out
	Namespace: laststand_mp
	Checksum: 0x7F1DFFE8
	Offset: 0x4208
	Size: 0x524
	Parameters: 0
	Flags: None
*/
function bleed_out()
{
	self endon(#"player_revived", #"death");
	util::wait_network_frame();
	if(!isalive(self))
	{
		return;
	}
	self function_2907ce7a();
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger delete();
		self.revivetrigger = undefined;
	}
	self clientfield::set("laststand_bleed", 0);
	demo::bookmark(#"player_bledout", gettime(), self, undefined, 1);
	potm::bookmark(#"player_bledout", gettime(), self, undefined, 1);
	level notify(#"bleed_out", {#character_index:self.characterindex});
	self notify(#"player_bleedout");
	callback::callback(#"on_player_bleedout");
	self undolaststand();
	self.uselaststandparams = 1;
	self function_6da86ae();
	/#
		assert(isdefined(self.laststandparams));
	#/
	if(!isdefined(self.laststandparams))
	{
		return;
	}
	if(!is_true(self.var_1cc38de0))
	{
		self.laststandparams.bledout = 1;
	}
	if(isdefined(self.var_d75a6ff5))
	{
		self.var_d75a6ff5.death = is_true(self.var_1cc38de0);
		self.var_d75a6ff5.bleed_out = !self.var_d75a6ff5.death;
		self function_1e8018b0();
	}
	self function_2907ce7a();
	if(self isinexecutionvictim() && isdefined(self.var_a1d415ee))
	{
		self bledout(self.var_a1d415ee.einflictor, self.laststandparams.attacker, self.var_a1d415ee.idamage, self.var_a1d415ee.smeansofdeath, self.laststandparams.weapon, self.laststandparams.var_fd90b0bb, self.laststandparams.vdir, self.laststandparams.shitloc);
	}
	else
	{
		if(isdefined(self.laststandparams))
		{
			self bledout(self.laststandparams.einflictor, self.laststandparams.attacker, self.laststandparams.idamage, self.laststandparams.smeansofdeath, self.laststandparams.weapon, self.laststandparams.var_fd90b0bb, self.laststandparams.vdir, self.laststandparams.shitloc);
		}
		else
		{
			return;
		}
	}
	if(getdvarint(#"hash_62b8db0428755a32", 1) && isplayer(self))
	{
		var_d7e063c = getdvarfloat(#"hash_44de9418bb6289ac", 1.5);
		self playsoundtoplayer(#"hash_11d39dca0f911535", self);
		self lui::screen_fade(var_d7e063c, 1, 0, "black", 0);
		wait(var_d7e063c + 0.2);
		self lui::screen_fade(var_d7e063c, 0, 1, "black", 0);
	}
	if(isdefined(self) && self.no_respawn !== 1)
	{
		self thread respawn_player_after_time(15);
	}
}

/*
	Name: respawn_player_after_time
	Namespace: laststand_mp
	Checksum: 0xB6E2650A
	Offset: 0x4738
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function respawn_player_after_time(n_time_seconds)
{
	self endon(#"death", #"disconnect");
	players = getplayers();
	if(players.size == 1)
	{
		return;
	}
	self waittill(#"spawned_spectator");
	level endon(#"objective_changed");
	wait(n_time_seconds);
	if(self.sessionstate == #"spectator")
	{
		self thread globallogic_spawn::waitandspawnclient();
	}
}

/*
	Name: function_2907ce7a
	Namespace: laststand_mp
	Checksum: 0xE9AD6193
	Offset: 0x4800
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_2907ce7a()
{
	self clientfield::set_player_uimodel("hudItems.laststand.progress", 0);
	self clientfield::set_player_uimodel("hudItems.laststand.reviveProgress", 0);
	self clientfield::set_player_uimodel("hudItems.laststand.beingRevived", 0);
	self clientfield::set_player_uimodel("hudItems.laststand.cowardsWayBleedOut", 0);
}

/*
	Name: revive_trigger_spawn
	Namespace: laststand_mp
	Checksum: 0x767C7358
	Offset: 0x4890
	Size: 0x194
	Parameters: 0
	Flags: None
*/
function revive_trigger_spawn()
{
	radius = getdvarint(#"revive_trigger_radius", 100);
	self.revivetrigger = spawn("trigger_radius", (0, 0, 0), 0, radius, radius);
	self.revivetrigger sethintstring("");
	self.revivetrigger setcursorhint("HINT_NOICON");
	self.revivetrigger setmovingplatformenabled(1);
	self.revivetrigger enablelinkto();
	self.revivetrigger.origin = self.origin;
	self.revivetrigger linkto(self);
	self.revivetrigger.beingrevived = 0;
	self.revivetrigger.createtime = gettime();
	self.revivetrigger.radius = radius;
	self.revivetrigger function_268e4500();
	self.revivetrigger setteamfortrigger(self.team);
	self thread revive_trigger_think();
}

/*
	Name: revive_trigger_think
	Namespace: laststand_mp
	Checksum: 0x3E35C22A
	Offset: 0x4A30
	Size: 0x418
	Parameters: 0
	Flags: None
*/
function revive_trigger_think()
{
	self endon(#"death", #"stop_revive_trigger");
	level endon(#"game_ended");
	while(true)
	{
		wait(0.1);
		if(!isdefined(self.revivetrigger))
		{
			self notify(#"stop_revive_trigger");
		}
		self.revivetrigger sethintstring("");
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i].team != self.team)
			{
				continue;
			}
			if(players[i] can_revive(self))
			{
				self.revivetrigger setrevivehintstring(#"hash_51a0f083a5566a3", self.team);
				break;
			}
		}
		for(i = 0; i < players.size; i++)
		{
			reviver = players[i];
			if(!isdefined(reviver))
			{
				continue;
			}
			if(reviver.team != self.team)
			{
				continue;
			}
			if(self == reviver || !reviver is_reviving(self))
			{
				continue;
			}
			if(isdefined(reviver.is_reviving_any) && reviver.is_reviving_any > 0)
			{
				continue;
			}
			var_6525e39a = reviver gestures::function_c77349d4("gestable_t9_stimshot_last_stand");
			if(reviver isgestureplaying(var_6525e39a))
			{
				reviver stopgestureviewmodel(var_6525e39a, 0, 1);
			}
			reviver gestures::function_56e00fbf("gestable_t9_stimshot_last_stand");
			reviver disableweaponcycling();
			reviver disableusability();
			reviver disableoffhandweapons();
			reviver disableweaponswitchhero();
			reviver val::set("laststand_revive", "allow_movement", 0);
			revive_success = reviver revive_do_revive(self);
			if(isdefined(reviver))
			{
				reviver function_92bfddb4();
			}
			if(revive_success === 1)
			{
				self thread revive_success(reviver);
				self function_2907ce7a();
				return;
			}
		}
		if(function_feb3e91d())
		{
			foreach(team in level.teams)
			{
				if(team === self.team)
				{
					continue;
				}
				if(function_356caede(team))
				{
					return;
				}
			}
		}
	}
}

/*
	Name: function_356caede
	Namespace: laststand_mp
	Checksum: 0xC1683077
	Offset: 0x4E50
	Size: 0x682
	Parameters: 1
	Flags: None
*/
function function_356caede(team)
{
	if(!isdefined(self))
	{
		return false;
	}
	if(function_a1ef346b(team).size == 0)
	{
		return false;
	}
	if(!isdefined(self.revivetrigger))
	{
		return false;
	}
	players = getplayers(team, self.revivetrigger.origin, self.revivetrigger.radius);
	height = getdvarint(#"hash_48068f92d21e2a64", 15);
	foreach(player in players)
	{
		if(player can_revive(self, 1, height))
		{
			self.revivetrigger setrevivehintstring(#"hash_a9213d7fcad1656", team);
			break;
		}
	}
	foreach(finisher in players)
	{
		if(self == finisher || !finisher is_reviving(self, 0, height) || finisher is_reviving_any() || is_true(finisher.var_5c574004))
		{
			continue;
		}
		finisher increment_finishing();
		var_c9c35e60 = randomintrange(1, level.var_91c33dcb.finishers.size - 1);
		/#
			assert(level.var_91c33dcb.finishers.size >= var_c9c35e60);
		#/
		var_abdbed5a = level.var_91c33dcb.finishers[var_c9c35e60].("finisherbundle");
		var_d1d9820d = getscriptbundle(var_abdbed5a);
		if(isdefined(var_d1d9820d.("attacker_gesture")))
		{
			finisher function_c6775cf9(var_d1d9820d.("attacker_gesture"));
		}
		if(isdefined(var_d1d9820d.("victim_gesture")))
		{
			self function_c6775cf9(var_d1d9820d.("victim_gesture"));
		}
		self function_fab0e07e(finisher);
		if(!isdefined(finisher))
		{
			return false;
		}
		if(!isdefined(self) || !isalive(self) || !isalive(finisher))
		{
			finisher function_b16f016a();
			return false;
		}
		finisher disableweaponcycling();
		finisher disableusability();
		finisher disableoffhandweapons();
		finisher disableweaponswitchhero();
		self flag::clear(#"hash_40e3b09bdbcdac81");
		var_62728357 = finisher function_1c8cab15(self);
		if(isdefined(finisher))
		{
			finisher function_b16f016a();
			finisher enableweaponcycling();
			finisher enableusability();
			finisher enableoffhandweapons();
			finisher enableweaponswitchhero();
			kill_angles = finisher gettagangles("tag_sync");
			kill_origin = finisher gettagorigin("tag_sync");
			if(isdefined(self))
			{
				if(is_true(var_62728357))
				{
					self function_516a3bef(0);
					self setplayerangles(kill_angles);
					self setorigin(kill_origin);
					self dodamage(self.var_969fabf4, self.origin, finisher, undefined, "none", "MOD_MELEE_ASSASSINATE", 8192);
					self function_2907ce7a();
					return true;
				}
				self function_516a3bef(1);
				self function_7c685040();
			}
			finisher function_7c685040();
		}
	}
	return false;
}

/*
	Name: increment_finishing
	Namespace: laststand_mp
	Checksum: 0x89691608
	Offset: 0x54E0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function increment_finishing()
{
	if(!isdefined(self.var_5c574004))
	{
		self.var_5c574004 = 0;
	}
	self.var_5c574004++;
}

/*
	Name: function_b16f016a
	Namespace: laststand_mp
	Checksum: 0x9C6898B4
	Offset: 0x5510
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function function_b16f016a()
{
	self.var_5c574004--;
	if(self.var_5c574004 < 0)
	{
		self.var_5c574004 = 0;
	}
	else if(self.var_5c574004 > 99999)
	{
		self.var_5c574004 = 99999;
	}
}

/*
	Name: function_fab0e07e
	Namespace: laststand_mp
	Checksum: 0x5D0F8C56
	Offset: 0x5568
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_fab0e07e(finisher)
{
	self endon(#"disconnect");
	finisher endon(#"disconnect");
	waitframe(1);
	if(isdefined(self) && isdefined(finisher) && isalive(self) && isalive(finisher))
	{
		self.laststandparams.var_3f57b6a0 = self.origin;
		self.laststandparams.savedangles = self.angles;
		self playerlinkto(finisher, "tag_sync");
	}
}

/*
	Name: function_516a3bef
	Namespace: laststand_mp
	Checksum: 0xA4A5E07F
	Offset: 0x5638
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_516a3bef(replace)
{
	if(isalive(self) && function_feb3e91d())
	{
		self unlink();
		if(replace)
		{
			self setorigin(self.laststandparams.var_3f57b6a0);
		}
	}
}

/*
	Name: function_c82a14d1
	Namespace: laststand_mp
	Checksum: 0xE0AB3369
	Offset: 0x56C8
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function function_c82a14d1(finisher)
{
	self endon(#"death", #"disconnect", #"finish_abort");
	finisher endon(#"death", #"disconnect");
	waitresult = undefined;
	waitresult = self waittill(#"contact");
	self flag::set(#"hash_40e3b09bdbcdac81");
	self notify(#"player_finished");
}

/*
	Name: function_1c8cab15
	Namespace: laststand_mp
	Checksum: 0x3A649449
	Offset: 0x5788
	Size: 0x170
	Parameters: 1
	Flags: None
*/
function function_1c8cab15(var_b4bb7319)
{
	var_b4bb7319 endon(#"disconnect");
	self endon(#"disconnect");
	var_b4bb7319.revivetrigger.var_3840aba9 = 1;
	var_b4bb7319 thread function_c82a14d1(self);
	while(isdefined(var_b4bb7319) && isalive(var_b4bb7319) && isalive(self) && !self laststand::player_is_in_laststand() && var_b4bb7319 laststand::player_is_in_laststand() && !var_b4bb7319 flag::get(#"hash_40e3b09bdbcdac81") && !self is_reviving_any())
	{
		waitframe(1);
	}
	if(isdefined(var_b4bb7319.revivetrigger))
	{
		var_b4bb7319.revivetrigger.var_3840aba9 = 0;
	}
	if(isdefined(var_b4bb7319) && var_b4bb7319 flag::get(#"hash_40e3b09bdbcdac81"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_92bfddb4
	Namespace: laststand_mp
	Checksum: 0xB64322A9
	Offset: 0x5900
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_92bfddb4()
{
	if(!isdefined(self))
	{
		return;
	}
	self stopgestureviewmodel(self gestures::function_c77349d4("gestable_t9_stimshot_last_stand"));
	self enableusability();
	self val::set("laststand_revive", "allow_movement", 1);
	self.is_reviving_any--;
	if(self.is_reviving_any < 0)
	{
		self.is_reviving_any = 0;
	}
	else if(self.is_reviving_any > 99999)
	{
		self.is_reviving_any = 99999;
	}
	if(is_true(self.laststand))
	{
		return;
	}
	self enableweaponcycling();
	self enableoffhandweapons();
	self enableweaponswitchhero();
}

/*
	Name: function_c3249e8c
	Namespace: laststand_mp
	Checksum: 0x89C40184
	Offset: 0x5A30
	Size: 0xA6
	Parameters: 0
	Flags: None
*/
function function_c3249e8c()
{
	/#
		assert(isplayer(self));
	#/
	players = getplayers(self.team);
	for(index = 0; index < players.size; index++)
	{
		if(players[index] == self)
		{
			continue;
		}
		if(self can_revive(players[index]))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: can_revive
	Namespace: laststand_mp
	Checksum: 0xC7C5A0F6
	Offset: 0x5AE0
	Size: 0x306
	Parameters: 3
	Flags: None
*/
function can_revive(revivee, ignore_touch_checks, height)
{
	if(!isdefined(ignore_touch_checks))
	{
		ignore_touch_checks = 0;
	}
	if(!isdefined(height))
	{
		height = undefined;
	}
	if(!isdefined(revivee.revivetrigger))
	{
		return false;
	}
	if(!isalive(self))
	{
		return false;
	}
	if(self laststand::player_is_in_laststand())
	{
		return false;
	}
	if(self isinexecutionvictim() || revivee isinexecutionvictim())
	{
		return false;
	}
	if(isdefined(level.can_revive) && ![[level.can_revive]](revivee))
	{
		return false;
	}
	if(isdefined(level.can_revive_game_module) && ![[level.can_revive_game_module]](revivee))
	{
		return false;
	}
	if(isdefined(level.revive_trigger_should_ignore_sight_checks))
	{
		ignore_sight_checks = [[level.revive_trigger_should_ignore_sight_checks]](self);
		if(ignore_sight_checks && isdefined(revivee.revivetrigger.beingrevived) && revivee.revivetrigger.beingrevived == 1)
		{
			ignore_touch_checks = 1;
		}
	}
	if(!ignore_touch_checks)
	{
		if(!self istouching(revivee.revivetrigger))
		{
			return false;
		}
	}
	if(isdefined(height))
	{
		delta = revivee.origin[2] - self.origin[2];
		if(delta > height || delta < (height * -1))
		{
			return false;
		}
	}
	if(!self laststand::is_facing(revivee, 0.8))
	{
		return false;
	}
	if(distancesquared(revivee.origin, self.origin) > sqr(140))
	{
		return false;
	}
	if(!sighttracepassed(self.origin + vectorscale((0, 0, 1), 50), revivee.origin + vectorscale((0, 0, 1), 30), 0, undefined))
	{
		return false;
	}
	if(!bullettracepassed(self.origin + vectorscale((0, 0, 1), 50), revivee.origin + vectorscale((0, 0, 1), 30), 0, undefined))
	{
		return false;
	}
	return true;
}

/*
	Name: is_reviving
	Namespace: laststand_mp
	Checksum: 0x5A90AF9
	Offset: 0x5DF0
	Size: 0xAC
	Parameters: 3
	Flags: None
*/
function is_reviving(revivee, ignore_touch_checks, height)
{
	if(!isdefined(ignore_touch_checks))
	{
		ignore_touch_checks = 0;
	}
	if(!isdefined(height))
	{
		height = undefined;
	}
	if(!isdefined(self) || !isdefined(revivee))
	{
		return 0;
	}
	if(!isalive(revivee))
	{
		return 0;
	}
	if(!isdefined(revivee.revivetrigger))
	{
		return 0;
	}
	return self usebuttonpressed() && can_revive(revivee, ignore_touch_checks, height);
}

/*
	Name: is_reviving_any
	Namespace: laststand_mp
	Checksum: 0x10F78035
	Offset: 0x5EA8
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function is_reviving_any()
{
	return is_true(self.is_reviving_any);
}

/*
	Name: revive_do_revive
	Namespace: laststand_mp
	Checksum: 0x179F8D8E
	Offset: 0x5ED0
	Size: 0x5F2
	Parameters: 1
	Flags: None
*/
function revive_do_revive(playerbeingrevived)
{
	self endon(#"disconnect");
	if(!isdefined(playerbeingrevived))
	{
		return 0;
	}
	/#
		assert(self is_reviving(playerbeingrevived));
	#/
	revivetime = getdvarfloat(#"g_revivetime", 3) * self function_bd85bc2f();
	timer = 0;
	revived = 0;
	playerbeingrevived clientfield::set_player_uimodel("hudItems.laststand.beingRevived", 1);
	playerbeingrevived.revivetrigger.beingrevived = 1;
	playerbeingrevived.revivetrigger sethintstring("");
	playerbeingrevived function_6bf621ea(#"hash_5b6f9e0c346eb0a", 2, int(revivetime * 1000), playerbeingrevived getentitynumber());
	if(isplayer(playerbeingrevived))
	{
		playerbeingrevived startrevive(self);
	}
	self thread laststand_clean_up_on_interrupt(playerbeingrevived);
	if(!isdefined(self.is_reviving_any))
	{
		self.is_reviving_any = 0;
	}
	self.is_reviving_any++;
	if(isdefined(playerbeingrevived.var_d75a6ff5))
	{
		playerbeingrevived.var_d75a6ff5.var_d10f3b9a++;
	}
	self.reviving_player = playerbeingrevived;
	self clientfield::set_player_uimodel("hudItems.laststand.revivingClientNum", playerbeingrevived getentitynumber());
	while(self is_reviving(playerbeingrevived))
	{
		if(self laststand::player_is_in_laststand() || self isinexecutionvictim() || playerbeingrevived isinexecutionvictim())
		{
			playerbeingrevived.reviveprogress = 0;
			break;
		}
		if(is_true(playerbeingrevived.revivetrigger.auto_revive))
		{
			playerbeingrevived.reviveprogress = 0;
			break;
		}
		playerbeingrevived.reviveprogress = min(timer / revivetime, 1);
		if(timer >= revivetime)
		{
			revived = 1;
			break;
		}
		self clientfield::set_player_uimodel("hudItems.laststand.reviveProgress", playerbeingrevived.reviveprogress);
		playerbeingrevived clientfield::set_player_uimodel("hudItems.laststand.reviveProgress", playerbeingrevived.reviveprogress);
		timer = timer + (float(function_60d95f53()) / 1000);
		waitframe(1);
	}
	self clientfield::set_player_uimodel("hudItems.laststand.reviveProgress", 0);
	playerbeingrevived clientfield::set_player_uimodel("hudItems.laststand.reviveProgress", 0);
	self clientfield::set_player_uimodel("hudItems.laststand.revivingClientNum", int(pow(2, 7) - 2));
	if(isdefined(playerbeingrevived) && playerbeingrevived laststand::player_is_in_laststand())
	{
		playerbeingrevived clientfield::set_player_uimodel("hudItems.laststand.beingRevived", 0);
		playerbeingrevived.reviveprogress = 0;
		if(!is_true(playerbeingrevived.revivetrigger.auto_revive) && !revived)
		{
			playerbeingrevived function_6bf621ea(#"hash_c21960dae38833d", 1, playerbeingrevived getentitynumber());
			if(isplayer(playerbeingrevived))
			{
				playerbeingrevived stoprevive(self);
			}
		}
		playerbeingrevived.revivetrigger sethintstring(#"hash_51a0f083a5566a3");
		playerbeingrevived.revivetrigger.beingrevived = 0;
		if(is_true(revived) && isdefined(level.var_f80fdd3f))
		{
			[[level.var_f80fdd3f]](playerbeingrevived, self);
		}
	}
	self.reviving_player = undefined;
	self notify(#"do_revive_ended_normally");
	self.is_reviving_any--;
	if(self.is_reviving_any < 0)
	{
		self.is_reviving_any = 0;
	}
	else if(self.is_reviving_any > 99999)
	{
		self.is_reviving_any = 99999;
	}
	return revived;
}

/*
	Name: function_d20a7e12
	Namespace: laststand_mp
	Checksum: 0x225A81D4
	Offset: 0x64D0
	Size: 0x86
	Parameters: 0
	Flags: None
*/
function function_d20a7e12()
{
	var_51635501 = self gamepadusedlast() && self weaponswitchbuttonpressed();
	var_e317d01d = !self gamepadusedlast() && self meleebuttonpressed();
	return var_51635501 || var_e317d01d;
}

/*
	Name: function_8e3d5c84
	Namespace: laststand_mp
	Checksum: 0xCA949ED4
	Offset: 0x6560
	Size: 0x118
	Parameters: 0
	Flags: None
*/
function function_8e3d5c84()
{
	self endon(#"player_revived", #"disconnect", #"death");
	while(isalive(self) && self laststand::player_is_in_laststand())
	{
		if(self function_d20a7e12() && !self isinexecutionvictim())
		{
			success = self function_73d6c609();
			if(success)
			{
				self clientfield::set_player_uimodel("hud_items.selfReviveAvailable", 0);
				self thread revive_success(self, 0);
				self function_2907ce7a();
				return;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_64bea7b1
	Namespace: laststand_mp
	Checksum: 0xF5A8F452
	Offset: 0x6680
	Size: 0xF0
	Parameters: 0
	Flags: None
*/
function function_64bea7b1()
{
	/#
		self endon(#"player_revived", #"disconnect", #"death");
		wait(getdvarint(#"hash_4fc41e7721e32d59", 1));
		while(isalive(self) && self laststand::player_is_in_laststand())
		{
			success = self function_73d6c609();
			if(success)
			{
				self thread revive_success(self, 0);
				self function_2907ce7a();
				return;
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_73d6c609
	Namespace: laststand_mp
	Checksum: 0x31EA73B2
	Offset: 0x6778
	Size: 0x592
	Parameters: 0
	Flags: None
*/
function function_73d6c609()
{
	self endon(#"disconnect");
	self playgestureviewmodel("ges_t9_self_revive_last_stand");
	revivetime = getdvarfloat(#"g_revivetime", 3) * self function_bd85bc2f();
	timer = 0;
	revived = 0;
	self clientfield::set_player_uimodel("hudItems.laststand.beingRevived", 1);
	self clientfield::set_to_player("isSelfReviving", 1);
	self.revivetrigger.beingrevived = 1;
	self.revivetrigger sethintstring("");
	self function_6bf621ea(#"hash_5b6f9e0c346eb0a", 2, int(revivetime * 1000), self getentitynumber());
	if(isplayer(self))
	{
		self startrevive(self);
	}
	self thread laststand_clean_up_on_interrupt(self);
	if(isdefined(self.var_d75a6ff5))
	{
		self.var_d75a6ff5.var_d10f3b9a++;
	}
	self.reviving_player = self;
	self clientfield::set_player_uimodel("hudItems.laststand.revivingClientNum", self getentitynumber());
	while(isalive(self) && self laststand::player_is_in_laststand() && (self function_d20a7e12() || isbot(self)))
	{
		if(self isinexecutionvictim())
		{
			self.reviveprogress = 0;
			break;
		}
		if(is_true(self.revivetrigger.auto_revive))
		{
			self.reviveprogress = 0;
			break;
		}
		self.reviveprogress = min(timer / revivetime, 1);
		if(timer >= revivetime)
		{
			revived = 1;
			break;
		}
		self clientfield::set_player_uimodel("hudItems.laststand.reviveProgress", self.reviveprogress);
		timer = timer + (float(function_60d95f53()) / 1000);
		waitframe(1);
	}
	self clientfield::set_player_uimodel("hudItems.laststand.reviveProgress", 0);
	self clientfield::set_player_uimodel("hudItems.laststand.revivingClientNum", int(pow(2, 7) - 2));
	self clientfield::set_player_uimodel("hudItems.laststand.beingRevived", 0);
	self clientfield::set_to_player("isSelfReviving", 0);
	self.reviveprogress = 0;
	if(!is_true(self.revivetrigger.auto_revive) && !revived)
	{
		self function_6bf621ea(#"hash_c21960dae38833d", 1, self getentitynumber());
		if(isplayer(self))
		{
			self stoprevive(self);
		}
	}
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger sethintstring(#"hash_51a0f083a5566a3");
		self.revivetrigger.beingrevived = 0;
		if(is_true(revived) && isdefined(level.var_f80fdd3f))
		{
			[[level.var_f80fdd3f]](self, self);
		}
	}
	self.reviving_player = undefined;
	if(revived)
	{
		self stopgestureviewmodel("ges_t9_self_revive_last_stand");
	}
	else
	{
		self stopgestureviewmodel("ges_t9_self_revive_last_stand", 0, 1);
	}
	self notify(#"do_revive_ended_normally");
	return revived;
}

/*
	Name: auto_revive_on_notify
	Namespace: laststand_mp
	Checksum: 0xE7F7429C
	Offset: 0x6D18
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function auto_revive_on_notify()
{
	self endon(#"death", #"disconnect", #"player_revived");
	waitresult = undefined;
	waitresult = self waittill(#"auto_revive");
	auto_revive(waitresult.reviver);
}

/*
	Name: auto_revive
	Namespace: laststand_mp
	Checksum: 0x9813B78C
	Offset: 0x6D98
	Size: 0x1AE
	Parameters: 1
	Flags: None
*/
function auto_revive(reviver)
{
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"disconnect");
	self.var_d887a4ad = 1;
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger.auto_revive = 1;
		while(is_true(self.revivetrigger.beingrevived))
		{
			util::wait_network_frame();
		}
		self.revivetrigger.auto_trigger = 0;
	}
	self function_102748f8();
	if(!isdefined(self))
	{
		return;
	}
	self reviveplayer();
	self.var_d887a4ad = undefined;
	self notify(#"stop_revive_trigger");
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger delete();
		self.revivetrigger = undefined;
	}
	self function_2907ce7a();
	self laststand_enable_player_weapons();
	self allowjump(1);
	self.laststand = undefined;
	self lui::screen_close_menu();
	self notify(#"player_revived", {#reviver:reviver});
}

/*
	Name: revive_success
	Namespace: laststand_mp
	Checksum: 0x21EB2CCB
	Offset: 0x6F50
	Size: 0x3BC
	Parameters: 2
	Flags: None
*/
function revive_success(reviver, b_track_stats)
{
	if(!isdefined(b_track_stats))
	{
		b_track_stats = 1;
	}
	self.var_156bf46e = undefined;
	if(!isplayer(self))
	{
		self notify(#"player_revived", {#reviver:reviver});
		return;
	}
	if(self isgestureplaying("ges_t9_self_revive_last_stand"))
	{
		self stopgestureviewmodel("ges_t9_self_revive_last_stand");
	}
	self function_102748f8();
	self.var_d887a4ad = 1;
	if(!isdefined(self))
	{
		return;
	}
	if(is_true(b_track_stats))
	{
		demo::bookmark(#"player_revived", gettime(), reviver, self);
		potm::bookmark(#"player_revived", gettime(), reviver, self);
	}
	if(isplayer(self))
	{
		self allowjump(1);
	}
	self.laststand = undefined;
	self notify(#"player_revived", {#reviver:reviver});
	self reviveplayer();
	self.var_d887a4ad = undefined;
	health = getgametypesetting(#"laststandrevivehealth");
	if(isdefined(reviver))
	{
		var_e705e073 = reviver function_15098882();
		if(var_e705e073 > 0)
		{
			health = var_e705e073;
		}
		if(!function_7e980623(reviver, self) && self.var_db459f8d !== 1 && reviver != self)
		{
			reviver scoreevents::processscoreevent(#"revived_teammate", reviver, self);
			reviver stats::function_dad108fa(#"hash_34001d400c0aa7bb", 1);
		}
	}
	self.health = health;
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger delete();
		self.revivetrigger = undefined;
	}
	self clientfield::set("laststand_bleed", 0);
	self function_2907ce7a();
	self laststand_enable_player_weapons();
	self lui::screen_close_menu();
	self function_1e8018b0();
	callback::callback(#"on_player_revived");
	if(isdefined(level.var_1a0c2b72))
	{
		reviver [[level.var_1a0c2b72]](self);
	}
}

/*
	Name: revive_hud_think
	Namespace: laststand_mp
	Checksum: 0x8B31190B
	Offset: 0x7318
	Size: 0x294
	Parameters: 0
	Flags: None
*/
function revive_hud_think()
{
	level endon(#"game_ended");
	while(true)
	{
		wait(0.1);
		if(!laststand::player_any_player_in_laststand())
		{
			continue;
		}
		revived = 0;
		foreach(_ in level.teams)
		{
			playertorevive = undefined;
			foreach(player in function_a1ef346b(team))
			{
				if(!isdefined(player.revivetrigger) || !isdefined(player.revivetrigger.createtime))
				{
					continue;
				}
				if(!isdefined(playertorevive) || playertorevive.revivetrigger.createtime > player.revivetrigger.createtime)
				{
					playertorevive = player;
				}
			}
			if(isdefined(playertorevive))
			{
				foreach(player in function_a1ef346b(team))
				{
					if(player laststand::player_is_in_laststand())
					{
						continue;
					}
					player thread faderevivemessageover(playertorevive, 3);
				}
				playertorevive.revivetrigger.createtime = undefined;
				revived = 1;
			}
		}
		if(revived)
		{
			wait(3.5);
		}
	}
}

/*
	Name: faderevivemessageover
	Namespace: laststand_mp
	Checksum: 0xDB5C814A
	Offset: 0x75B8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function faderevivemessageover(playertorevive, time)
{
	self thread laststand::revive_hud_show_n_fade(#"hash_14cc93f11ba8334a", time, playertorevive);
}

/*
	Name: function_ecdd4b27
	Namespace: laststand_mp
	Checksum: 0xCB127205
	Offset: 0x7600
	Size: 0xF6
	Parameters: 0
	Flags: None
*/
function function_ecdd4b27()
{
	if(!isplayer(self) || isdefined(self.var_d75a6ff5))
	{
		return;
	}
	self.var_d75a6ff5 = {#hash_35b89428:0, #hash_d733f8d7:0, #hash_d10f3b9a:0, #bleed_out:0, #death:0, #damage:0, #end_time:0, #start_time:gettime(), #player_xuid:int(self getxuid(1))};
}

/*
	Name: function_1e8018b0
	Namespace: laststand_mp
	Checksum: 0xB97CDD77
	Offset: 0x7700
	Size: 0x2AC
	Parameters: 0
	Flags: None
*/
function function_1e8018b0()
{
	if(!isplayer(self) || !isdefined(self.var_d75a6ff5))
	{
		return;
	}
	self.var_d75a6ff5.end_time = gettime();
	function_92d1707f(#"hash_142816c2e7c5da66", self.var_d75a6ff5);
	self.var_d75a6ff5 = undefined;
	if(!isdefined(level.var_dea23a93[self.team]))
	{
		level.var_dea23a93[self.team] = 0;
	}
	level.var_dea23a93[self.team]--;
	var_9b6c9b51 = level.var_dea23a93[self.team];
	foreach(player in getplayers(self.team))
	{
		player clientfield::set_player_uimodel("PlayerTeamLastLivesData.numPlayersDowned", var_9b6c9b51);
	}
	foreach(team, count in level.var_ead46974)
	{
		if(!util::function_fbce7263(team, self.team))
		{
			continue;
		}
		count--;
		level.var_ead46974[team] = count;
		foreach(player in getplayers(team))
		{
			player clientfield::set_player_uimodel("EnemyTeamLastLivesData.numPlayersDowned", count);
		}
	}
}

/*
	Name: function_b394486e
	Namespace: laststand_mp
	Checksum: 0x7FE6F948
	Offset: 0x79B8
	Size: 0x6A
	Parameters: 0
	Flags: None
*/
function function_b394486e()
{
	self.var_d292d803 = spawnstruct();
	self.var_d292d803.cheating = 0;
	self.var_d292d803.downs = array();
	self.var_d292d803.revives = array();
}

/*
	Name: is_cheating
	Namespace: laststand_mp
	Checksum: 0xE5C337EC
	Offset: 0x7A30
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function is_cheating()
{
	if(!isdefined(self.var_d292d803))
	{
		return 0;
	}
	return self.var_d292d803.cheating;
}

/*
	Name: function_7afe7d1e
	Namespace: laststand_mp
	Checksum: 0x3BF34B76
	Offset: 0x7A60
	Size: 0x3DA
	Parameters: 2
	Flags: None
*/
function function_7afe7d1e(attacker, victim)
{
	if(!isdefined(level.var_57e7d5a) || level.var_57e7d5a == 0)
	{
		return 0;
	}
	if(!isdefined(attacker.var_d292d803))
	{
		attacker function_b394486e();
	}
	else if(attacker is_cheating())
	{
		return 1;
	}
	if(!isdefined(attacker.var_d292d803.downs[victim.entnum]))
	{
		attacker.var_d292d803.downs[victim.entnum] = array();
		if(!isdefined(attacker.var_d292d803.downs[victim.entnum]))
		{
			attacker.var_d292d803.downs[victim.entnum] = [];
		}
		else if(!isarray(attacker.var_d292d803.downs[victim.entnum]))
		{
			attacker.var_d292d803.downs[victim.entnum] = array(attacker.var_d292d803.downs[victim.entnum]);
		}
		attacker.var_d292d803.downs[victim.entnum][attacker.var_d292d803.downs[victim.entnum].size] = gettime();
		return 0;
	}
	if(!isdefined(attacker.var_d292d803.downs[victim.entnum]))
	{
		attacker.var_d292d803.downs[victim.entnum] = [];
	}
	else if(!isarray(attacker.var_d292d803.downs[victim.entnum]))
	{
		attacker.var_d292d803.downs[victim.entnum] = array(attacker.var_d292d803.downs[victim.entnum]);
	}
	attacker.var_d292d803.downs[victim.entnum][attacker.var_d292d803.downs[victim.entnum].size] = gettime();
	numdowns = attacker.var_d292d803.downs[victim.entnum].size;
	if(numdowns < level.var_57e7d5a)
	{
		return 0;
	}
	var_1053d9e9 = attacker.var_d292d803.downs[victim.entnum][numdowns - 1];
	var_6ab74732 = attacker.var_d292d803.downs[victim.entnum][numdowns - level.var_57e7d5a];
	if((var_1053d9e9 - var_6ab74732) <= (int(60 * 1000)))
	{
		attacker.var_d292d803.cheating = 1;
		attacker.var_d292d803.downs = undefined;
		attacker.var_d292d803.revives = undefined;
	}
	return attacker is_cheating();
}

/*
	Name: function_7e980623
	Namespace: laststand_mp
	Checksum: 0xFAC11602
	Offset: 0x7E48
	Size: 0x3DA
	Parameters: 2
	Flags: None
*/
function function_7e980623(reviver, victim)
{
	if(!isdefined(level.var_b5087de4) || level.var_b5087de4 == 0)
	{
		return 0;
	}
	if(!isdefined(reviver.var_d292d803))
	{
		reviver function_b394486e();
	}
	else if(reviver is_cheating())
	{
		return 1;
	}
	if(!isdefined(reviver.var_d292d803.revives[victim.entnum]))
	{
		reviver.var_d292d803.revives[victim.entnum] = array();
		if(!isdefined(reviver.var_d292d803.revives[victim.entnum]))
		{
			reviver.var_d292d803.revives[victim.entnum] = [];
		}
		else if(!isarray(reviver.var_d292d803.revives[victim.entnum]))
		{
			reviver.var_d292d803.revives[victim.entnum] = array(reviver.var_d292d803.revives[victim.entnum]);
		}
		reviver.var_d292d803.revives[victim.entnum][reviver.var_d292d803.revives[victim.entnum].size] = gettime();
		return 0;
	}
	if(!isdefined(reviver.var_d292d803.revives[victim.entnum]))
	{
		reviver.var_d292d803.revives[victim.entnum] = [];
	}
	else if(!isarray(reviver.var_d292d803.revives[victim.entnum]))
	{
		reviver.var_d292d803.revives[victim.entnum] = array(reviver.var_d292d803.revives[victim.entnum]);
	}
	reviver.var_d292d803.revives[victim.entnum][reviver.var_d292d803.revives[victim.entnum].size] = gettime();
	numrevives = reviver.var_d292d803.revives[victim.entnum].size;
	if(numrevives < level.var_b5087de4)
	{
		return 0;
	}
	var_1053d9e9 = reviver.var_d292d803.revives[victim.entnum][numrevives - 1];
	var_6ab74732 = reviver.var_d292d803.revives[victim.entnum][numrevives - level.var_b5087de4];
	if((var_1053d9e9 - var_6ab74732) <= (int(60 * 1000)))
	{
		reviver.var_d292d803.cheating = 1;
		reviver.var_d292d803.downs = undefined;
		reviver.var_d292d803.revives = undefined;
	}
	return reviver is_cheating();
}

/*
	Name: function_7e714b6a
	Namespace: laststand_mp
	Checksum: 0xFCE1C472
	Offset: 0x8230
	Size: 0x42
	Parameters: 0
	Flags: None
*/
function function_7e714b6a()
{
	if(!isplayer(self))
	{
		/#
			assert(0);
		#/
		return;
	}
	self.laststandcount = 0;
}

