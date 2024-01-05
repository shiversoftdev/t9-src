#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace electroball_grenade;

/*
	Name: function_bf77d1ec
	Namespace: electroball_grenade
	Checksum: 0x420F9A4F
	Offset: 0x220
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bf77d1ec()
{
	level notify(513105164);
}

/*
	Name: __init__system__
	Namespace: electroball_grenade
	Checksum: 0xED575D6C
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register("electroball_grenade", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: electroball_grenade
	Checksum: 0x70B105FD
	Offset: 0x280
	Size: 0x1FC
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.proximitygrenadedetectionradius = getdvarint(#"scr_proximitygrenadedetectionradius", 180);
	level.proximitygrenadegraceperiod = getdvarfloat(#"scr_proximitygrenadegraceperiod", 0.05);
	level.proximitygrenadedotdamageamount = getdvarint(#"scr_proximitygrenadedotdamageamount", 1);
	level.proximitygrenadedotdamageamounthardcore = getdvarint(#"scr_proximitygrenadedotdamageamounthardcore", 1);
	level.proximitygrenadedotdamagetime = getdvarfloat(#"scr_proximitygrenadedotdamagetime", 0.2);
	level.proximitygrenadedotdamageinstances = getdvarint(#"scr_proximitygrenadedotdamageinstances", 4);
	level.proximitygrenadeactivationtime = getdvarfloat(#"scr_proximitygrenadeactivationtime", 0.1);
	level.proximitygrenadeprotectedtime = getdvarfloat(#"scr_proximitygrenadeprotectedtime", 0.45);
	level thread register();
	callback::on_spawned(&on_player_spawned);
	callback::on_ai_spawned(&on_ai_spawned);
	callback::on_grenade_fired(&begin_other_grenade_tracking);
}

/*
	Name: register
	Namespace: electroball_grenade
	Checksum: 0xF76DF6FB
	Offset: 0x488
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function register()
{
	clientfield::register("toplayer", "electroball_tazered", 1, 1, "int");
	clientfield::register("missile", "electroball_stop_trail", 1, 1, "int");
	clientfield::register("missile", "electroball_play_landed_fx", 1, 1, "int");
	clientfield::register("allplayers", "electroball_shock", 1, 1, "int");
}

/*
	Name: function_5d95c1d
	Namespace: electroball_grenade
	Checksum: 0xF5A689A2
	Offset: 0x558
	Size: 0x13A
	Parameters: 0
	Flags: Linked
*/
function function_5d95c1d()
{
	watcher = self weaponobjects::createwatcher("electroball_grenade", undefined, 0);
	watcher.watchforfire = 1;
	watcher.hackable = 0;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.headicon = 0;
	watcher.activatefx = 1;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = 1;
	watcher.immediatedetonation = 1;
	watcher.detectiongraceperiod = 0.05;
	watcher.detonateradius = 64;
	watcher.onstun = &weaponobjects::weaponstun;
	watcher.stuntime = 1;
	watcher.ondetonatecallback = &proximitydetonate;
	watcher.activationdelay = 0.05;
	watcher.activatesound = "wpn_claymore_alert";
	watcher.immunespecialty = "specialty_immunetriggershock";
	watcher.onspawn = &function_5aeaf7bc;
}

/*
	Name: function_5aeaf7bc
	Namespace: electroball_grenade
	Checksum: 0x33B13882
	Offset: 0x6A0
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_5aeaf7bc(watcher, owner)
{
	self thread setupkillcament();
	if(isplayer(owner))
	{
		owner addweaponstat(self.weapon, "used", 1);
	}
	if(isdefined(self.weapon) && self.weapon.proximitydetonation > 0)
	{
		watcher.detonateradius = self.weapon.proximitydetonation;
	}
	weaponobjects::onspawnproximityweaponobject(watcher, owner);
	self thread function_8e671a22();
}

/*
	Name: setupkillcament
	Namespace: electroball_grenade
	Checksum: 0x5CD11572
	Offset: 0x780
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function setupkillcament()
{
	self endon(#"death");
	self util::waittillnotmoving();
	self.killcament = spawn("script_model", self.origin + vectorscale((0, 0, 1), 8));
	self thread cleanupkillcamentondeath();
}

/*
	Name: cleanupkillcamentondeath
	Namespace: electroball_grenade
	Checksum: 0x7B49914B
	Offset: 0x800
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function cleanupkillcamentondeath()
{
	self waittill(#"death");
	self.killcament util::deleteaftertime(4 + (level.proximitygrenadedotdamagetime * level.proximitygrenadedotdamageinstances));
}

/*
	Name: proximitydetonate
	Namespace: electroball_grenade
	Checksum: 0xDEB149EF
	Offset: 0x858
	Size: 0x34
	Parameters: 3
	Flags: Linked
*/
function proximitydetonate(attacker, weapon, target)
{
	weaponobjects::weapondetonate(weapon, target);
}

/*
	Name: watchproximitygrenadehitplayer
	Namespace: electroball_grenade
	Checksum: 0x2B0D9E90
	Offset: 0x898
	Size: 0x112
	Parameters: 1
	Flags: Linked
*/
function watchproximitygrenadehitplayer(owner)
{
	self endon(#"death");
	self setteam(owner.team);
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"grenade_bounce");
		if(isdefined(waitresult.ent) && isplayer(waitresult.ent) && waitresult.surface != "riotshield")
		{
			if(level.teambased && waitresult.ent.team == self.owner.team)
			{
				continue;
			}
			self proximitydetonate(self.owner, self.weapon);
			return;
		}
	}
}

/*
	Name: performhudeffects
	Namespace: electroball_grenade
	Checksum: 0xEAA4B962
	Offset: 0x9B8
	Size: 0x126
	Parameters: 2
	Flags: None
*/
function performhudeffects(position, distancetogrenade)
{
	forwardvec = vectornormalize(anglestoforward(self.angles));
	rightvec = vectornormalize(anglestoright(self.angles));
	explosionvec = vectornormalize(distancetogrenade - self.origin);
	fdot = vectordot(explosionvec, forwardvec);
	rdot = vectordot(explosionvec, rightvec);
	fangle = acos(fdot);
	rangle = acos(rdot);
}

/*
	Name: function_4e48c752
	Namespace: electroball_grenade
	Checksum: 0x240A31CB
	Offset: 0xAE8
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_4e48c752(params)
{
	self endon(#"death");
	if(isdefined(params.weapon) && params.weapon.name == "electroball_grenade")
	{
		self damageplayerinradius(params.eattacker);
	}
}

/*
	Name: damageplayerinradius
	Namespace: electroball_grenade
	Checksum: 0xE5DA2D17
	Offset: 0xB68
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function damageplayerinradius(attacker)
{
	self notify(#"proximitygrenadedamagestart");
	self endon(#"proximitygrenadedamagestart", #"death");
	attacker endon(#"disconnect");
	self clientfield::set("electroball_shock", 1);
	g_time = gettime();
	if(self util::mayapplyscreeneffect())
	{
		self.lastshockedby = attacker;
		self.shockendtime = gettime() + 100;
		self shellshock("electrocution", 0.1);
		self clientfield::set_to_player("electroball_tazered", 1);
	}
	self playrumbleonentity("proximity_grenade");
	self playsound("wpn_taser_mine_zap");
	if(!self hasperk("specialty_proximityprotection"))
	{
		self thread watch_death();
		if(gettime() - g_time < 100)
		{
			wait((gettime() - g_time) / 1000);
		}
	}
	else
	{
		wait(level.proximitygrenadeprotectedtime);
	}
	self clientfield::set_to_player("electroball_tazered", 0);
}

/*
	Name: watch_death
	Namespace: electroball_grenade
	Checksum: 0x6FAA32B1
	Offset: 0xD38
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function watch_death()
{
	self endon(#"disconnect");
	self notify(#"proximity_cleanup");
	self endon(#"proximity_cleanup");
	self waittill(#"death");
	self stoprumble("proximity_grenade");
	self setblur(0, 0);
	self clientfield::set_to_player("electroball_tazered", 0);
}

/*
	Name: on_player_spawned
	Namespace: electroball_grenade
	Checksum: 0x93288624
	Offset: 0xDE8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(isplayer(self))
	{
		self thread function_5d95c1d();
		self callback::on_player_damage(&function_4e48c752);
	}
}

/*
	Name: on_ai_spawned
	Namespace: electroball_grenade
	Checksum: 0x11DF7C4C
	Offset: 0xE48
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function on_ai_spawned()
{
	if(self.archetype === "mechz")
	{
		self thread function_5d95c1d();
	}
}

/*
	Name: begin_other_grenade_tracking
	Namespace: electroball_grenade
	Checksum: 0x1F4A4001
	Offset: 0xE80
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function begin_other_grenade_tracking(params)
{
	if(isdefined(params.weapon) && isdefined(params.weapon.rootweapon) && params.weapon.rootweapon.name == #"electroball_grenade")
	{
		params.projectile thread watchproximitygrenadehitplayer(self);
	}
}

/*
	Name: function_8e671a22
	Namespace: electroball_grenade
	Checksum: 0xAA78DEF2
	Offset: 0xF08
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_8e671a22()
{
	self endon(#"death", #"disconnect", #"delete");
	self waittill(#"grenade_bounce", #"stationary");
	self clientfield::set("electroball_stop_trail", 1);
	self setmodel("tag_origin");
	self clientfield::set("electroball_play_landed_fx", 1);
	if(!isdefined(level.a_electroball_grenades))
	{
		level.a_electroball_grenades = [];
	}
	array::add(level.a_electroball_grenades, self);
}

