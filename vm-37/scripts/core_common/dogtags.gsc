#using script_47fb62300ac0bd60;
#using script_6167e26342be354b;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace dogtags;

/*
	Name: init
	Namespace: dogtags
	Checksum: 0x24DE1C3B
	Offset: 0x240
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function init()
{
	level.antiboostdistance = getgametypesetting(#"antiboostdistance");
	level.dogtags = [];
	level.var_f9800416 = getdvarint(#"hash_686978f3ee15ce69", 0);
	callback::on_spawned(&on_spawn_player);
	callback::on_player_killed(&on_player_killed);
	gameobjects::function_ad0c0995(&function_1d8e2a5b);
	clientfield::register("scriptmover", "dogtag_flag", 1, 2, "int");
}

/*
	Name: function_bf06b7aa
	Namespace: dogtags
	Checksum: 0xAF571217
	Offset: 0x340
	Size: 0x320
	Parameters: 3
	Flags: Linked, Private
*/
function private function_bf06b7aa(victim, attacker, on_use_function)
{
	dogtag = function_afe6cbc4(attacker);
	if(isdefined(dogtag))
	{
		return dogtag;
	}
	if(is_true(getgametypesetting("dogTagPooling")))
	{
		arrayremovevalue(level.dogtags, undefined, 0);
		var_1bcc6d7e = (isdefined(getgametypesetting("dogTagPoolSize")) ? getgametypesetting("dogTagPoolSize") : 0);
		if(var_1bcc6d7e > 0 && level.dogtags.size > var_1bcc6d7e)
		{
			level.dogtags[0] reset_tags();
		}
	}
	else
	{
		arrayremovevalue(level.dogtags, undefined, 1);
	}
	visuals = [];
	trigger = spawn("trigger_radius", (0, 0, 0), 0, 32, 32);
	if(!level.var_f9800416)
	{
		trigger.var_a865c2cd = 0;
	}
	objectivename = (isdefined(level.var_febab1ea) ? level.var_febab1ea : #"hash_bc7bcc75f63dc7b");
	dogtag = gameobjects::create_use_object(attacker.team, trigger, visuals, (0, 0, 0), objectivename);
	trigger.dogtag = dogtag;
	dogtag gameobjects::set_use_time(0);
	dogtag.onuse = &onuse;
	dogtag.custom_onuse = on_use_function;
	dogtag.victim = attacker;
	dogtag.victimteam = attacker.team;
	dogtag.var_5ee49ea8 = attacker getspecialistindex();
	level thread clear_on_victim_disconnect(attacker);
	attacker thread team_updater(dogtag);
	if(is_true(getgametypesetting("dogTagPooling")))
	{
		level.dogtags[level.dogtags.size] = dogtag;
	}
	else
	{
		level.dogtags[attacker getentitynumber()] = dogtag;
	}
	return dogtag;
}

/*
	Name: function_329adc0f
	Namespace: dogtags
	Checksum: 0x7A29A414
	Offset: 0x668
	Size: 0x154
	Parameters: 1
	Flags: Linked, Private
*/
function private function_329adc0f(dogtag)
{
	dogtag gameobjects::allow_use(#"hash_161f03feaadc9b8f");
	playfx("ui/fx_kill_confirmed_vanish", dogtag.curorigin);
	dogtag notify(#"reset");
	waitframe(1);
	if(isdefined(dogtag))
	{
		if(isdefined(dogtag.objectiveid))
		{
			objective_delete(dogtag.objectiveid);
		}
		if(isdefined(dogtag.var_2581d0d))
		{
			dogtag.var_2581d0d deletedelay();
		}
		dogtag notify(#"deleted");
		dogtag gameobjects::destroy_object(1);
		if(!is_true(getgametypesetting("dogTagPooling")))
		{
			arrayremovevalue(level.dogtags, undefined, 1);
		}
		else
		{
			arrayremovevalue(level.dogtags, undefined, 0);
		}
	}
}

/*
	Name: function_afe6cbc4
	Namespace: dogtags
	Checksum: 0x90474E9B
	Offset: 0x7C8
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_afe6cbc4(victim)
{
	if(is_true(getgametypesetting("dogTagPooling")))
	{
		return;
	}
	return level.dogtags[victim getentitynumber()];
}

/*
	Name: spawn_dog_tag
	Namespace: dogtags
	Checksum: 0x867B01CA
	Offset: 0x828
	Size: 0x4E8
	Parameters: 5
	Flags: None
*/
function spawn_dog_tag(victim, attacker, on_use_function, objectives_for_attacker_and_victim_only, var_2636e48)
{
	dogtag = function_afe6cbc4(victim);
	if(isdefined(dogtag))
	{
		playfx("ui/fx_kill_confirmed_vanish", dogtag.curorigin);
		dogtag notify(#"reset");
		dogtag dontinterpolate();
		var_5ee49ea8 = victim getspecialistindex();
		if(var_5ee49ea8 != dogtag.var_5ee49ea8)
		{
			dogtag.var_5ee49ea8 = var_5ee49ea8;
		}
		if(isdefined(dogtag.var_2581d0d))
		{
			dogtag.var_2581d0d delete();
			dogtag.var_2581d0d = undefined;
		}
	}
	else
	{
		dogtag = function_bf06b7aa(victim, attacker, on_use_function);
	}
	dogtag gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
	baseoffset = vectorscale((0, 0, 1), 14);
	pos = victim.origin + baseoffset;
	if(isvec(var_2636e48))
	{
		pos = pos + var_2636e48;
	}
	dogtag.origin = pos;
	dogtag.curorigin = pos;
	dogtag.trigger.origin = pos;
	dogtag function_9b289986(dogtag.var_5ee49ea8);
	dogtag.team = victim.team;
	dogtag.attacker = attacker;
	dogtag.attackerteam = attacker.team;
	dogtag.unreachable = undefined;
	dogtag.tacinsert = 0;
	if((isdefined(getgametypesetting("dogTagTimeOut")) ? getgametypesetting("dogTagTimeOut") : 0) > 0)
	{
		dogtag thread time_out(victim);
	}
	if(isdefined(dogtag.objectiveid))
	{
		objective_setstate(dogtag.objectiveid, "active");
		objective_setteam(dogtag.objectiveid, victim.team);
		objective_setposition(dogtag.objectiveid, pos);
	}
	if(isdefined(dogtag.objectiveid) && objectives_for_attacker_and_victim_only)
	{
		objective_setinvisibletoall(dogtag.objectiveid);
		if(isplayer(attacker))
		{
			objective_setvisibletoplayer(dogtag.objectiveid, attacker);
		}
		if(isplayer(victim))
		{
			objective_setvisibletoplayer(dogtag.objectiveid, victim);
		}
	}
	var_1175c328 = victim isinvehicle() && !victim getvehicleoccupied() isremotecontrol();
	playerinwater = victim depthinwater() > (abs(victim.origin[2] - pos[2])) && !var_1175c328;
	var_f5ac9ac4 = victim oob::istouchinganyoobtrigger() || !victim oob::function_323d32db();
	if(!playerinwater && !var_f5ac9ac4)
	{
		dogtag function_78a745d7(pos, victim);
	}
	else
	{
		dogtag function_b2a61c9d();
	}
	level notify(#"dogtag_spawned");
}

/*
	Name: function_9b289986
	Namespace: dogtags
	Checksum: 0x149CAE39
	Offset: 0xD18
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9b289986(index)
{
	if(!isdefined(index))
	{
		index = 0;
	}
	self function_209d6da2(index);
}

/*
	Name: function_78a745d7
	Namespace: dogtags
	Checksum: 0x49CA00E5
	Offset: 0xD58
	Size: 0x164
	Parameters: 2
	Flags: Linked
*/
function function_78a745d7(var_561c6e7c, var_5bb2a7e9)
{
	dropangles = (-60, randomint(360), 0);
	force = anglestoforward(dropangles) * randomfloatrange(150, 220);
	self.var_2581d0d = var_5bb2a7e9 magicmissile(getweapon(#"hash_1a8e376e04ffed9d"), var_561c6e7c, force);
	self.var_2581d0d setmodel(#"tag_origin");
	self.var_2581d0d hide();
	self.var_2581d0d notsolid();
	self thread function_b9937933();
	self thread function_924c73e6();
	self clientfield::set("dogtag_flag", 1);
}

/*
	Name: function_b2a61c9d
	Namespace: dogtags
	Checksum: 0xD8564F6B
	Offset: 0xEC8
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_b2a61c9d()
{
	if(self clientfield::get("dogtag_flag") == 2)
	{
		self clientfield::set("dogtag_flag", 3);
	}
	else
	{
		self clientfield::set("dogtag_flag", 2);
	}
}

/*
	Name: function_b9937933
	Namespace: dogtags
	Checksum: 0xAE778CAE
	Offset: 0xF48
	Size: 0x1B0
	Parameters: 0
	Flags: Linked
*/
function function_b9937933()
{
	level endon(#"game_ended");
	self endon(#"reset");
	self.var_2581d0d endon(#"death", #"stationary");
	while(true)
	{
		if(!isdefined(self.var_2581d0d))
		{
			return;
		}
		if(self depthinwater() > 0)
		{
			self.trigger.origin = self.var_2581d0d.origin;
			self.var_2581d0d notify(#"stationary");
			return;
		}
		if(self.var_2581d0d oob::istouchinganyoobtrigger() || !self.var_2581d0d oob::function_323d32db() || self.var_2581d0d gameobjects::is_touching_any_trigger_key_value("trigger_hurt", "classname", self.trigger.origin[2], self.trigger.origin[2] + 32))
		{
			self.trigger.origin = self.var_2581d0d.origin;
			self.var_2581d0d notify(#"stationary");
			return;
		}
		self.trigger.origin = self.var_2581d0d.origin;
		waitframe(1);
	}
}

/*
	Name: function_924c73e6
	Namespace: dogtags
	Checksum: 0xAAB35199
	Offset: 0x1100
	Size: 0x11E
	Parameters: 0
	Flags: Linked
*/
function function_924c73e6()
{
	level endon(#"game_ended");
	self endon(#"reset");
	self.var_2581d0d endon(#"death");
	self.var_2581d0d waittill(#"stationary");
	self.trigger.origin = self.var_2581d0d.origin;
	self.origin = self.trigger.origin;
	waittillframeend();
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.objectiveid))
	{
		objective_setposition(self.objectiveid, self.origin);
	}
	self function_b2a61c9d();
	if(isdefined(self.var_2581d0d))
	{
		self.var_2581d0d delete();
		self.var_2581d0d = undefined;
	}
}

/*
	Name: onuse
	Namespace: dogtags
	Checksum: 0xDF0F2DCF
	Offset: 0x1228
	Size: 0x33C
	Parameters: 1
	Flags: Linked
*/
function onuse(player)
{
	if(!isdefined(player) || !isdefined(self))
	{
		return;
	}
	player playsoundontag("mpl_killconfirm_tags_pickup", "j_head");
	tacinsertboost = 0;
	if(!util::function_fbce7263(player.team, self.victimteam))
	{
		player stats::function_dad108fa(#"killsdenied", 1);
		player recordgameevent("return");
		level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"return", #player:player});
		event = "kill_denied";
		if(self.victim == player)
		{
			if(self.tacinsert == 0)
			{
				event = "retrieve_own_tags";
			}
			else
			{
				tacinsertboost = 1;
			}
		}
		if(!tacinsertboost)
		{
			player.pers[#"killsdenied"]++;
			player.killsdenied = player.pers[#"killsdenied"];
		}
	}
	else
	{
		event = "kill_confirmed";
		if(util::function_fbce7263(player.team, self.attackerteam))
		{
			event = "squad_confirmed_kill_stolen";
		}
		player stats::function_dad108fa(#"killsconfirmed", 1);
		player recordgameevent("capture");
		level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"capture", #player:player});
		if(isdefined(self.attacker) && self.attacker != player && !util::function_fbce7263(player.team, self.attacker.team))
		{
			self.attacker onpickup("teammate_kill_confirmed");
		}
	}
	if(!tacinsertboost && isdefined(player))
	{
		player onpickup(event);
	}
	if(isdefined(self.custom_onuse))
	{
		[[self.custom_onuse]](player);
	}
	self reset_tags();
}

/*
	Name: reset_tags
	Namespace: dogtags
	Checksum: 0xC8BF8790
	Offset: 0x1570
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function reset_tags()
{
	self.attacker = undefined;
	self.unreachable = 1;
	self notify(#"reset");
	self.curorigin = vectorscale((0, 0, 1), 5000);
	self.trigger.origin = vectorscale((0, 0, 1), 5000);
	self.tacinsert = 0;
	self gameobjects::allow_use(#"hash_161f03feaadc9b8f");
	self clientfield::set("dogtag_flag", 0);
	if(isdefined(self.var_2581d0d))
	{
		self.var_2581d0d deletedelay();
		self.var_2581d0d = undefined;
	}
	if(isdefined(self.objectiveid))
	{
		objective_setstate(self.objectiveid, "invisible");
	}
	if(is_true(getgametypesetting("dogTagPooling")))
	{
		thread function_329adc0f(self);
	}
}

/*
	Name: onpickup
	Namespace: dogtags
	Checksum: 0x9F9EB7A6
	Offset: 0x16C8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function onpickup(event)
{
	scoreevents::processscoreevent(event, self, undefined, undefined);
}

/*
	Name: clear_on_victim_disconnect
	Namespace: dogtags
	Checksum: 0xF1DC15E3
	Offset: 0x1700
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function clear_on_victim_disconnect(victim)
{
	level endon(#"game_ended");
	guid = victim getentitynumber();
	victim waittill(#"disconnect");
	dogtag = function_afe6cbc4(victim);
	if(!isdefined(dogtag))
	{
		return;
	}
	function_329adc0f(dogtag);
}

/*
	Name: on_spawn_player
	Namespace: dogtags
	Checksum: 0xE26BB4BA
	Offset: 0x17A0
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function on_spawn_player()
{
	if(!(isdefined(level.droppedtagrespawn) && level.droppedtagrespawn))
	{
		return;
	}
	if(level.rankedmatch || level.leaguematch)
	{
		if(isdefined(self.tacticalinsertiontime) && (self.tacticalinsertiontime + 100) > gettime())
		{
			mindist = level.antiboostdistance;
			mindistsqr = mindist * mindist;
			dogtag = function_afe6cbc4(self);
			if(!isdefined(dogtag))
			{
				return;
			}
			distsqr = distancesquared(self.origin, dogtag.curorigin);
			if(distsqr < mindistsqr)
			{
				dogtag.tacinsert = 1;
			}
		}
	}
}

/*
	Name: on_player_killed
	Namespace: dogtags
	Checksum: 0xA20D29EE
	Offset: 0x18A0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(params)
{
	self endon(#"disconnect");
	if(is_true(level.droppedtagrespawn) && squad_spawn::function_d072f205())
	{
		self squad_spawn::function_5f976259();
		/#
			var_f26d6aa7 = getdvarint(#"hash_40b119703c5fa11e", 0);
			if(var_f26d6aa7 > 0)
			{
				wait(var_f26d6aa7);
				self dt_respawn();
			}
		#/
	}
}

/*
	Name: function_1d8e2a5b
	Namespace: dogtags
	Checksum: 0xF29213C4
	Offset: 0x1970
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function function_1d8e2a5b(activator)
{
	if(isplayer(activator) && activator isinvehicle())
	{
		vehicle = activator getvehicleoccupied();
	}
	if(!isdefined(vehicle))
	{
		return 0;
	}
	return vehicle.settings.var_a6f70f60;
}

/*
	Name: team_updater
	Namespace: dogtags
	Checksum: 0x668CDC17
	Offset: 0x19F8
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function team_updater(tags)
{
	level endon(#"game_ended");
	self endon(#"disconnect");
	while(true)
	{
		self waittill(#"joined_team");
		tags.victimteam = self.team;
		tags reset_tags();
	}
}

/*
	Name: time_out
	Namespace: dogtags
	Checksum: 0xE54170B4
	Offset: 0x1A78
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function time_out(victim)
{
	level endon(#"game_ended");
	victim endon(#"disconnect");
	self notify(#"timeout");
	self endon(#"timeout", #"death", #"reset");
	timeout = (isdefined(getgametypesetting("dogTagTimeOut")) ? getgametypesetting("dogTagTimeOut") : 0);
	level hostmigration::waitlongdurationwithhostmigrationpause(timeout);
	if(!isdefined(self))
	{
		return;
	}
	self reset_tags();
}

/*
	Name: checkallowspectating
	Namespace: dogtags
	Checksum: 0xF3F7CD10
	Offset: 0x1B88
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function checkallowspectating()
{
	self endon(#"disconnect");
	waitframe(1);
	spectating::update_settings();
}

/*
	Name: should_spawn_tags
	Namespace: dogtags
	Checksum: 0x1F7EA7BB
	Offset: 0x1BC8
	Size: 0x150
	Parameters: 9
	Flags: Linked
*/
function should_spawn_tags(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(isalive(self))
	{
		return false;
	}
	if(isdefined(self.switching_teams))
	{
		return false;
	}
	if(isdefined(deathanimduration) && deathanimduration == self)
	{
		return false;
	}
	if(level.teambased && isdefined(deathanimduration) && isdefined(deathanimduration.team) && deathanimduration.team == self.team)
	{
		return false;
	}
	if(isdefined(deathanimduration) && (!isdefined(deathanimduration.team) || deathanimduration.team == #"none") && (deathanimduration.classname == "trigger_hurt" || deathanimduration.classname == "worldspawn"))
	{
		return false;
	}
	return true;
}

/*
	Name: onusedogtag
	Namespace: dogtags
	Checksum: 0x8DCDD3B0
	Offset: 0x1D20
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function onusedogtag(player)
{
	if(player.pers[#"team"] == self.victimteam)
	{
		player.pers[#"rescues"]++;
		if(isdefined(self.victim))
		{
			if(!level.gameended)
			{
				self.victim thread dt_respawn();
			}
		}
	}
	else if(is_true(level.var_d0252074) && isdefined(self.victim))
	{
		self.victim squad_spawn::function_44c6679();
	}
}

/*
	Name: dt_respawn
	Namespace: dogtags
	Checksum: 0xAF997CB0
	Offset: 0x1DF0
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function dt_respawn()
{
	if(is_true(level.var_d0252074))
	{
		self.pers[#"lives"] = 1;
		self squad_spawn::function_6a7e8977();
		self squad_spawn::function_250e04e5();
	}
	else
	{
		self thread waittillcanspawnclient();
	}
}

/*
	Name: waittillcanspawnclient
	Namespace: dogtags
	Checksum: 0xDED7BC15
	Offset: 0x1E80
	Size: 0x7A
	Parameters: 0
	Flags: Linked
*/
function waittillcanspawnclient()
{
	for(;;)
	{
		wait(0.05);
		if(isdefined(self) && (self.sessionstate == "spectator" || !isalive(self)))
		{
			self.pers[#"lives"] = 1;
			self thread [[level.spawnclient]]();
			continue;
		}
		return;
	}
}

