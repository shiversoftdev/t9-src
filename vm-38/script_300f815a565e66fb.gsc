#using script_300f815a565e66fb;
#using script_383a3b1bb18ba876;
#using script_6c8abe14025b47c4;
#using script_8988fdbc78d6c53;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace namespace_707cab08;

/*
	Name: function_b1481ecd
	Namespace: namespace_707cab08
	Checksum: 0xE8182E12
	Offset: 0x278
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b1481ecd()
{
	level notify(1997961932);
}

#namespace emp;

/*
	Name: init_shared
	Namespace: emp
	Checksum: 0xD9B1E21A
	Offset: 0x298
	Size: 0x1FC
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	if(!isdefined(level.var_707cab08))
	{
		level.var_707cab08 = {};
		level.var_707cab08.activeplayeremps = [];
		level.var_707cab08.activeemps = [];
		foreach(team, _ in level.teams)
		{
			level.var_707cab08.activeemps[team] = 0;
		}
		level.var_707cab08.enemyempactivefunc = &enemyempactive;
		level thread emptracker();
		clientfield::register("scriptmover", "emp_turret_init", 1, 1, "int");
		clientfield::register("vehicle", "emp_turret_deploy", 1, 1, "int");
		callback::on_spawned(&onplayerspawned);
		callback::on_connect(&onplayerconnect);
		vehicle::add_main_callback("emp_turret", &initturretvehicle);
		callback::add_callback(#"hash_7c6da2f2c9ef947a", &fx_flesh_hit_neck_fatal);
	}
}

/*
	Name: fx_flesh_hit_neck_fatal
	Namespace: emp
	Checksum: 0x96AB1297
	Offset: 0x4A0
	Size: 0x120
	Parameters: 1
	Flags: Linked
*/
function fx_flesh_hit_neck_fatal(params)
{
	foreach(player in params.players)
	{
		if(player hasactiveemp())
		{
			scoregiven = scoreevents::processscoreevent(#"emp_assist", player, undefined, undefined);
			if(isdefined(scoregiven))
			{
				player challenges::earnedempassistscore(scoregiven);
				killstreakindex = level.killstreakindices[#"emp"];
				killstreaks::killstreak_assist(player, self, killstreakindex);
			}
		}
	}
}

/*
	Name: initturretvehicle
	Namespace: emp
	Checksum: 0xE2DB60DF
	Offset: 0x5C8
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function initturretvehicle()
{
	turretvehicle = self;
	turretvehicle killstreaks::setup_health("emp");
	turretvehicle.damagetaken = 0;
	turretvehicle.health = turretvehicle.maxhealth;
	turretvehicle clientfield::set("enemyvehicle", 1);
	turretvehicle.soundmod = "drone_land";
	turretvehicle.overridevehiclekilled = &onturretdeath;
	target_set(turretvehicle, vectorscale((0, 0, 1), 36));
	if(isdefined(level.var_389a99a4))
	{
		turretvehicle [[level.var_389a99a4]]();
	}
}

/*
	Name: onplayerspawned
	Namespace: emp
	Checksum: 0x8EFA9EA6
	Offset: 0x6A0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function onplayerspawned()
{
	self endon(#"disconnect");
	self updateemp();
}

/*
	Name: onplayerconnect
	Namespace: emp
	Checksum: 0x495924B7
	Offset: 0x6D8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function onplayerconnect()
{
	self.entnum = self getentitynumber();
	level.var_707cab08.activeplayeremps[self.entnum] = 0;
}

/*
	Name: deployempturret
	Namespace: emp
	Checksum: 0x5C239D87
	Offset: 0x720
	Size: 0x1DC
	Parameters: 1
	Flags: None
*/
function deployempturret(emp)
{
	player = self;
	player endon(#"disconnect", #"joined_team", #"joined_spectators");
	emp endon(#"death");
	emp.vehicle useanimtree("generic");
	emp.vehicle setanim(#"o_turret_emp_core_deploy", 1);
	length = getanimlength(#"o_turret_emp_core_deploy");
	emp.vehicle clientfield::set("emp_turret_deploy", 1);
	wait(length * 0.75);
	emp.vehicle thread playempfx();
	emp.vehicle playsound(#"mpl_emp_turret_activate");
	emp.vehicle setanim(#"o_turret_emp_core_spin", 1);
	player thread emp_jamenemies(emp, 0);
	wait(length * 0.25);
	emp.vehicle clearanim(#"o_turret_emp_core_deploy", 0);
}

/*
	Name: doneempfx
	Namespace: emp
	Checksum: 0x392FC51A
	Offset: 0x908
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function doneempfx(fxtagorigin)
{
	params = getscriptbundle("killstreak_bundle");
	playfx(params.ksexplosionfx, fxtagorigin);
	playsoundatposition(#"mpl_emp_turret_deactivate", fxtagorigin);
}

/*
	Name: playempfx
	Namespace: emp
	Checksum: 0xF4957D29
	Offset: 0x980
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function playempfx()
{
	emp_vehicle = self;
	emp_vehicle playloopsound(#"mpl_emp_turret_loop_close");
	waitframe(1);
}

/*
	Name: on_timeout
	Namespace: emp
	Checksum: 0x1D539BE3
	Offset: 0x9C8
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function on_timeout()
{
	emp = self;
	if(isdefined(emp.vehicle))
	{
		fxtagorigin = emp.vehicle gettagorigin("tag_fx");
		doneempfx(fxtagorigin);
	}
	shutdownemp(emp);
}

/*
	Name: oncancelplacement
	Namespace: emp
	Checksum: 0x2727AB89
	Offset: 0xA50
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function oncancelplacement(emp)
{
	stopemp(emp.team, emp.ownerentnum, emp.originalteam, emp.killstreakid);
}

/*
	Name: onturretdeath
	Namespace: emp
	Checksum: 0x93DB705B
	Offset: 0xA98
	Size: 0x5C
	Parameters: 8
	Flags: Linked
*/
function onturretdeath(inflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	self ondeath(shitloc, psoffsettime);
}

/*
	Name: ondeathafterframeend
	Namespace: emp
	Checksum: 0x71E53F62
	Offset: 0xB00
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function ondeathafterframeend(attacker, weapon)
{
	waittillframeend();
	if(isdefined(self))
	{
		self ondeath(attacker, weapon);
	}
}

/*
	Name: ondeath
	Namespace: emp
	Checksum: 0xC2458C10
	Offset: 0xB48
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function ondeath(attacker, weapon)
{
	emp_vehicle = self;
	fxtagorigin = self gettagorigin("tag_fx");
	doneempfx(fxtagorigin);
	if(isdefined(level.var_b1ffcff8))
	{
		self [[level.var_b1ffcff8]](attacker, weapon);
	}
	shutdownemp(emp_vehicle.parentstruct);
}

/*
	Name: onshutdown
	Namespace: emp
	Checksum: 0xFF992017
	Offset: 0xBF0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function onshutdown(emp)
{
	shutdownemp(emp);
}

/*
	Name: shutdownemp
	Namespace: emp
	Checksum: 0x5E5F943C
	Offset: 0xC20
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function shutdownemp(emp)
{
	if(!isdefined(emp))
	{
		return;
	}
	if(isdefined(emp.already_shutdown))
	{
		return;
	}
	emp.already_shutdown = 1;
	if(isdefined(emp.vehicle))
	{
		emp.vehicle clientfield::set("emp_turret_deploy", 0);
	}
	stopemp(emp.team, emp.ownerentnum, emp.originalteam, emp.killstreakid);
	if(isdefined(emp.othermodel))
	{
		emp.othermodel delete();
	}
	if(isdefined(emp.vehicle))
	{
		emp.vehicle delete();
	}
	emp delete();
}

/*
	Name: stopemp
	Namespace: emp
	Checksum: 0x3F89619D
	Offset: 0xD28
	Size: 0x54
	Parameters: 4
	Flags: Linked
*/
function stopemp(currentteam, currentownerentnum, originalteam, killstreakid)
{
	stopempeffect(currentteam, currentownerentnum);
	stopemprule(originalteam, killstreakid);
}

/*
	Name: stopempeffect
	Namespace: emp
	Checksum: 0x8BF59565
	Offset: 0xD88
	Size: 0x58
	Parameters: 2
	Flags: Linked
*/
function stopempeffect(team, ownerentnum)
{
	level.var_707cab08.activeemps[team] = 0;
	level.var_707cab08.activeplayeremps[ownerentnum] = 0;
	level notify(#"emp_updated");
}

/*
	Name: stopemprule
	Namespace: emp
	Checksum: 0xA14A9190
	Offset: 0xDE8
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function stopemprule(killstreakoriginalteam, killstreakid)
{
	killstreakrules::killstreakstop("emp", killstreakoriginalteam, killstreakid);
}

/*
	Name: hasactiveemp
	Namespace: emp
	Checksum: 0x65EA43F8
	Offset: 0xE28
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function hasactiveemp()
{
	return level.var_707cab08.activeplayeremps[self.entnum];
}

/*
	Name: teamhasactiveemp
	Namespace: emp
	Checksum: 0x3FF3D025
	Offset: 0xE50
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function teamhasactiveemp(team)
{
	return level.var_707cab08.activeemps[team] > 0;
}

/*
	Name: getenemies
	Namespace: emp
	Checksum: 0xECE9BBFB
	Offset: 0xE80
	Size: 0x192
	Parameters: 0
	Flags: Linked
*/
function getenemies()
{
	enemies = [];
	combatants = level.players;
	if(sessionmodeiscampaigngame())
	{
		combatants = arraycombine(combatants, getactorarray(), 0, 0);
	}
	foreach(combatant in combatants)
	{
		if(combatant.team === #"spectator")
		{
			continue;
		}
		if(level.teambased && util::function_fbce7263(combatant.team, self.team) || (!level.teambased && combatant != self))
		{
			if(!isdefined(enemies))
			{
				enemies = [];
			}
			else if(!isarray(enemies))
			{
				enemies = array(enemies);
			}
			enemies[enemies.size] = combatant;
		}
	}
	return enemies;
}

/*
	Name: function_d12cde1c
	Namespace: emp
	Checksum: 0xE5B7EE1A
	Offset: 0x1020
	Size: 0x10
	Parameters: 0
	Flags: Linked
*/
function function_d12cde1c()
{
	return isdefined(level.var_707cab08);
}

/*
	Name: enemyempactive
	Namespace: emp
	Checksum: 0x8A833A84
	Offset: 0x1038
	Size: 0x182
	Parameters: 0
	Flags: Linked
*/
function enemyempactive()
{
	if(!function_d12cde1c())
	{
		return false;
	}
	if(level.teambased)
	{
		foreach(team, _ in level.teams)
		{
			if(util::function_fbce7263(team, self.team) && teamhasactiveemp(team))
			{
				return true;
			}
		}
	}
	else
	{
		enemies = self getenemies();
		foreach(player in enemies)
		{
			if(player hasactiveemp())
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: enemyempowner
	Namespace: emp
	Checksum: 0xABE48894
	Offset: 0x11C8
	Size: 0xB2
	Parameters: 0
	Flags: None
*/
function enemyempowner()
{
	enemies = self getenemies();
	foreach(player in enemies)
	{
		if(player hasactiveemp())
		{
			return player;
		}
	}
	return undefined;
}

/*
	Name: emp_jamenemies
	Namespace: emp
	Checksum: 0xBD268130
	Offset: 0x1288
	Size: 0x23C
	Parameters: 2
	Flags: Linked
*/
function emp_jamenemies(empent, hacked)
{
	level endon(#"game_ended");
	self endon(#"killstreak_hacked");
	if(level.teambased)
	{
		if(hacked)
		{
			level.var_707cab08.activeemps[empent.originalteam] = 0;
		}
		level.var_707cab08.activeemps[self.team] = 1;
	}
	if(hacked)
	{
		level.var_707cab08.activeplayeremps[empent.originalownerentnum] = 0;
	}
	level.var_707cab08.activeplayeremps[self.entnum] = 1;
	level notify(#"emp_updated");
	level notify(#"emp_deployed");
	visionsetnaked("flash_grenade", 1.5);
	wait(0.1);
	visionsetnaked("flash_grenade", 0);
	visionsetnaked("default", 5);
	radius = (isdefined(level.empkillstreakbundle.ksdamageradius) ? level.empkillstreakbundle.ksdamageradius : 750);
	empkillstreakweapon = getweapon(#"emp");
	empkillstreakweapon.isempkillstreak = 1;
	level destroyotherteamsactivevehicles(self, empkillstreakweapon, radius);
	level destroyotherteamsequipment(self, empkillstreakweapon, radius);
	level weaponobjects::destroy_other_teams_supplemental_watcher_objects(self, empkillstreakweapon, radius);
}

/*
	Name: emptracker
	Namespace: emp
	Checksum: 0x97D2C35
	Offset: 0x14D0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function emptracker()
{
	level endon(#"game_ended");
	while(true)
	{
		level waittill(#"emp_updated");
		foreach(player in level.players)
		{
			player updateemp();
		}
	}
}

/*
	Name: updateemp
	Namespace: emp
	Checksum: 0x39BC4CAD
	Offset: 0x15A0
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function updateemp()
{
	player = self;
	enemy_emp_active = player enemyempactive();
	player setempjammed(enemy_emp_active);
	emped = player isempjammed();
	player clientfield::set_to_player("empd_monitor_distance", emped);
	if(emped)
	{
		player notify(#"emp_jammed");
	}
}

/*
	Name: destroyotherteamsequipment
	Namespace: emp
	Checksum: 0x523CEDAF
	Offset: 0x1648
	Size: 0x12C
	Parameters: 3
	Flags: Linked
*/
function destroyotherteamsequipment(attacker, weapon, radius)
{
	foreach(team, _ in level.teams)
	{
		if(!util::function_fbce7263(team, attacker.team))
		{
			continue;
		}
		destroyequipment(attacker, team, weapon, radius);
		destroytacticalinsertions(attacker, team, radius);
	}
	destroyequipment(attacker, #"none", weapon, radius);
	destroytacticalinsertions(attacker, #"none", radius);
}

/*
	Name: destroyequipment
	Namespace: emp
	Checksum: 0x7AC2A210
	Offset: 0x1780
	Size: 0x1CC
	Parameters: 4
	Flags: Linked
*/
function destroyequipment(attacker, team, weapon, radius)
{
	radiussq = radius * radius;
	for(i = 0; i < level.missileentities.size; i++)
	{
		item = level.missileentities[i];
		if(!isdefined(item))
		{
			continue;
		}
		if(distancesquared(item.origin, attacker.origin) > radiussq)
		{
			continue;
		}
		if(!isdefined(item.weapon))
		{
			continue;
		}
		if(!isdefined(item.owner))
		{
			continue;
		}
		if(isdefined(team) && util::function_fbce7263(item.owner.team, team))
		{
			continue;
		}
		else if(item.owner == attacker)
		{
			continue;
		}
		if(!item.weapon.isequipment && !is_true(item.destroyedbyemp))
		{
			continue;
		}
		watcher = item.owner weaponobjects::getwatcherforweapon(item.weapon);
		if(!isdefined(watcher))
		{
			continue;
		}
		watcher thread weaponobjects::waitanddetonate(item, 0, attacker, weapon);
	}
}

/*
	Name: destroytacticalinsertions
	Namespace: emp
	Checksum: 0x382AAECE
	Offset: 0x1958
	Size: 0x118
	Parameters: 3
	Flags: Linked
*/
function destroytacticalinsertions(attacker, victimteam, radius)
{
	radiussq = radius * radius;
	for(i = 0; i < level.players.size; i++)
	{
		player = level.players[i];
		if(!isdefined(player.tacticalinsertion))
		{
			continue;
		}
		if(level.teambased && util::function_fbce7263(player.team, victimteam))
		{
			continue;
		}
		if(attacker == player)
		{
			continue;
		}
		if(distancesquared(player.origin, attacker.origin) < radiussq)
		{
			if(isdefined(level.var_8ee772a3))
			{
				player.tacticalinsertion thread [[level.var_8ee772a3]]();
			}
		}
	}
}

/*
	Name: destroyotherteamsactivevehicles
	Namespace: emp
	Checksum: 0xB02EF77C
	Offset: 0x1A78
	Size: 0xD0
	Parameters: 3
	Flags: Linked
*/
function destroyotherteamsactivevehicles(attacker, weapon, radius)
{
	foreach(team, _ in level.teams)
	{
		if(!util::function_fbce7263(team, attacker.team))
		{
			continue;
		}
		destroyactivevehicles(attacker, team, weapon, radius);
	}
}

/*
	Name: destroyactivevehicles
	Namespace: emp
	Checksum: 0x768211E8
	Offset: 0x1B50
	Size: 0xC04
	Parameters: 4
	Flags: Linked, Private
*/
function private destroyactivevehicles(attacker, team, weapon, radius)
{
	radiussq = radius * radius;
	targets = target_getarray();
	destroyentities(targets, attacker, team, weapon, radius);
	ai_tanks = getentarray("talon", "targetname");
	destroyentities(ai_tanks, attacker, team, weapon, radius);
	remotemissiles = getentarray("remote_missile", "targetname");
	destroyentities(remotemissiles, attacker, team, weapon, radius);
	remotedrone = getentarray("remote_drone", "targetname");
	destroyentities(remotedrone, attacker, team, weapon, radius);
	script_vehicles = getentarray("script_vehicle", "classname");
	foreach(vehicle in script_vehicles)
	{
		if(distancesquared(vehicle.origin, attacker.origin) > radiussq)
		{
			continue;
		}
		if(isdefined(team) && !util::function_fbce7263(vehicle.team, team) && isvehicle(vehicle))
		{
			if(isdefined(vehicle.detonateviaemp) && is_true(weapon.isempkillstreak))
			{
				vehicle [[vehicle.detonateviaemp]](attacker, weapon);
			}
			if(isdefined(vehicle.archetype))
			{
				if(vehicle.archetype == "turret" || vehicle.archetype == "rcbomb" || vehicle.archetype == "wasp")
				{
					vehicle dodamage(vehicle.health + 1, vehicle.origin, attacker, attacker, "", "MOD_EXPLOSIVE", 0, weapon);
				}
			}
		}
	}
	planemortars = getentarray("plane_mortar", "targetname");
	foreach(planemortar in planemortars)
	{
		if(distance2d(planemortar.origin, attacker.origin) > radius)
		{
			continue;
		}
		if(isdefined(team) && isdefined(planemortar.team))
		{
			if(util::function_fbce7263(planemortar.team, team))
			{
				continue;
			}
		}
		else if(planemortar.owner == attacker)
		{
			continue;
		}
		planemortar notify(#"emp_deployed", {#attacker:attacker});
	}
	dronestrikes = getentarray("drone_strike", "targetname");
	foreach(dronestrike in dronestrikes)
	{
		if(distance2d(dronestrike.origin, attacker.origin) > radius)
		{
			continue;
		}
		if(isdefined(team) && isdefined(dronestrike.team))
		{
			if(util::function_fbce7263(dronestrike.team, team))
			{
				continue;
			}
		}
		else if(dronestrike.owner == attacker)
		{
			continue;
		}
		dronestrike notify(#"emp_deployed", {#attacker:attacker});
	}
	var_eca5110 = getentarray("guided_artillery_shell", "targetname");
	foreach(shell in var_eca5110)
	{
		if(distance2d(shell.origin, attacker.origin) > radius)
		{
			continue;
		}
		if(isdefined(team) && isdefined(shell.team))
		{
			if(util::function_fbce7263(shell.team, team))
			{
				continue;
			}
		}
		else if(shell.owner == attacker)
		{
			continue;
		}
		shell notify(#"emp_deployed", {#attacker:attacker});
	}
	counteruavs = getentarray("counteruav", "targetname");
	foreach(counteruav in counteruavs)
	{
		if(distance2d(counteruav.origin, attacker.origin) > radius)
		{
			continue;
		}
		if(isdefined(team) && isdefined(counteruav.team))
		{
			if(util::function_fbce7263(counteruav.team, team))
			{
				continue;
			}
		}
		else if(counteruav.owner == attacker)
		{
			continue;
		}
		counteruav notify(#"emp_deployed", {#attacker:attacker});
	}
	satellites = getentarray("satellite", "targetname");
	foreach(satellite in satellites)
	{
		if(distance2d(satellite.origin, attacker.origin) > radius)
		{
			continue;
		}
		if(isdefined(team) && isdefined(satellite.team))
		{
			if(util::function_fbce7263(satellite.team, team))
			{
				continue;
			}
		}
		else if(satellite.owner == attacker)
		{
			continue;
		}
		satellite notify(#"emp_deployed", {#attacker:attacker});
	}
	robots = getaiarchetypearray("robot");
	foreach(robot in robots)
	{
		if(distancesquared(robot.origin, attacker.origin) > radiussq)
		{
			continue;
		}
		if(robot.allowdeath !== 0 && robot.magic_bullet_shield !== 1 && isdefined(team) && !util::function_fbce7263(robot.team, team))
		{
			if(isdefined(attacker) && (!isdefined(robot.owner) || robot.owner util::isenemyplayer(attacker)))
			{
				scoreevents::processscoreevent(#"destroyed_combat_robot", attacker, robot.owner, weapon);
				luinotifyevent(#"player_callout", 2, #"hash_3b274c8c3c961f3", attacker.entnum);
			}
			robot kill();
		}
	}
	if(isdefined(level.missile_swarm_owner))
	{
		if(level.missile_swarm_owner util::isenemyplayer(attacker))
		{
			if(distancesquared(level.missile_swarm_owner.origin, attacker.origin) < radiussq)
			{
				level.missile_swarm_owner notify(#"emp_destroyed_missile_swarm", {#attacker:attacker});
			}
		}
	}
}

/*
	Name: destroyentities
	Namespace: emp
	Checksum: 0xE55C76F1
	Offset: 0x2760
	Size: 0x26C
	Parameters: 5
	Flags: Linked, Private
*/
function private destroyentities(entities, attacker, team, weapon, radius)
{
	meansofdeath = "MOD_EXPLOSIVE";
	damage = 5000;
	direction_vec = (0, 0, 0);
	point = (0, 0, 0);
	modelname = "";
	tagname = "";
	partname = "";
	radiussq = radius * radius;
	foreach(entity in entities)
	{
		if(isdefined(team) && isdefined(entity.team))
		{
			if(util::function_fbce7263(entity.team, team))
			{
				continue;
			}
		}
		else if(isdefined(entity.owner) && entity.owner == attacker)
		{
			continue;
		}
		if(distancesquared(entity.origin, attacker.origin) < radiussq)
		{
			entity notify(#"damage", {#weapon:weapon, #part_name:partname, #model_name:modelname, #tag_name:tagname, #mod:meansofdeath, #position:point, #direction:direction_vec, #attacker:attacker, #amount:damage});
		}
	}
}

