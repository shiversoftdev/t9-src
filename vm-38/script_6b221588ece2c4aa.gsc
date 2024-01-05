#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_4c668920;

/*
	Name: function_2cab27ff
	Namespace: namespace_4c668920
	Checksum: 0xF4104915
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2cab27ff()
{
	level notify(-1168453783);
}

#namespace weaponobjects;

/*
	Name: function_b455d5d8
	Namespace: weaponobjects
	Checksum: 0x6CEB7364
	Offset: 0xB0
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_b455d5d8()
{
	function_e6400478(#"tactical_insertion", &createtactinsertwatcher, 1);
	function_e6400478(#"rcbomb", &creatercbombwatcher, 1);
	function_e6400478(#"qrdrone", &createqrdronewatcher, 1);
	function_e6400478(#"helicopter_player", &createplayerhelicopterwatcher, 1);
	function_e6400478(#"tr_flechette_t8", &function_1eaa3e20);
	if(is_true(level.var_b68902c4))
	{
		function_e6400478(#"tr_flechette_t8_upgraded", &function_1eaa3e20);
	}
}

/*
	Name: createspecialcrossbowwatchertypes
	Namespace: weaponobjects
	Checksum: 0xDB83D73E
	Offset: 0x218
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function createspecialcrossbowwatchertypes(watcher)
{
	watcher.ondetonatecallback = &delete;
	watcher.ondamage = &util::void;
	if(is_true(level.b_crossbow_bolt_destroy_on_impact))
	{
		watcher.onspawn = &onspawncrossbowboltimpact;
		watcher.onspawnretrievetriggers = &util::void;
		watcher.pickup = &util::void;
	}
	else
	{
		watcher.onspawn = &onspawncrossbowbolt;
		watcher.onspawnretrievetriggers = &function_23b0aea9;
		watcher.pickup = &function_d9219ce2;
	}
}

/*
	Name: function_f297d773
	Namespace: weaponobjects
	Checksum: 0x6BB7D7A0
	Offset: 0x308
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_f297d773()
{
	function_e6400478(#"special_crossbow_t9", &createspecialcrossbowwatchertypes, 1);
	if(is_true(level.b_create_upgraded_crossbow_watchers))
	{
		function_e6400478(#"hash_c6535e906c2c072", &createspecialcrossbowwatchertypes, 1);
	}
}

/*
	Name: function_1eaa3e20
	Namespace: weaponobjects
	Checksum: 0x2D0D3606
	Offset: 0x3A0
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function function_1eaa3e20(watcher)
{
	watcher.notequipment = 1;
	watcher.onfizzleout = undefined;
}

/*
	Name: createtactinsertwatcher
	Namespace: weaponobjects
	Checksum: 0xA1D684D7
	Offset: 0x3D0
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function createtactinsertwatcher(watcher)
{
	watcher.playdestroyeddialog = 0;
}

/*
	Name: creatercbombwatcher
	Namespace: weaponobjects
	Checksum: 0xD1F245F6
	Offset: 0x3F0
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function creatercbombwatcher(watcher)
{
	watcher.altdetonate = 0;
	watcher.ismovable = 1;
	watcher.ownergetsassist = 1;
	watcher.playdestroyeddialog = 0;
	watcher.deleteonkillbrush = 0;
	watcher.ondetonatecallback = level.rcbombonblowup;
	watcher.stuntime = 1;
	watcher.notequipment = 1;
}

/*
	Name: createqrdronewatcher
	Namespace: weaponobjects
	Checksum: 0x145F32A0
	Offset: 0x468
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function createqrdronewatcher(watcher)
{
	watcher.altdetonate = 0;
	watcher.ismovable = 1;
	watcher.ownergetsassist = 1;
	watcher.playdestroyeddialog = 0;
	watcher.deleteonkillbrush = 0;
	watcher.ondetonatecallback = level.qrdroneonblowup;
	watcher.ondamage = level.qrdroneondamage;
	watcher.stuntime = 5;
	watcher.notequipment = 1;
}

/*
	Name: getspikelauncheractivespikecount
	Namespace: weaponobjects
	Checksum: 0xEA3A968E
	Offset: 0x4F0
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function getspikelauncheractivespikecount(watcher)
{
	currentitemcount = 0;
	foreach(obj in watcher.objectarray)
	{
		if(isdefined(obj) && obj.item !== watcher.weapon)
		{
			currentitemcount++;
		}
	}
	return currentitemcount;
}

/*
	Name: watchspikelauncheritemcountchanged
	Namespace: weaponobjects
	Checksum: 0x9B17F87D
	Offset: 0x5B0
	Size: 0xE6
	Parameters: 1
	Flags: None
*/
function watchspikelauncheritemcountchanged(watcher)
{
	self endon(#"death");
	lastitemcount = undefined;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_change");
		weapon = waitresult.weapon;
		while(weapon.name == #"spike_launcher")
		{
			currentitemcount = getspikelauncheractivespikecount(watcher);
			if(currentitemcount !== lastitemcount)
			{
				lastitemcount = currentitemcount;
			}
			wait(0.1);
			weapon = self getcurrentweapon();
		}
	}
}

/*
	Name: spikesdetonating
	Namespace: weaponobjects
	Checksum: 0x108A66CB
	Offset: 0x6A0
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function spikesdetonating(watcher)
{
	spikecount = getspikelauncheractivespikecount(watcher);
	if(spikecount > 0)
	{
		wait(2);
	}
}

/*
	Name: createspikelauncherwatcher
	Namespace: weaponobjects
	Checksum: 0x4E5C4B2A
	Offset: 0x6E8
	Size: 0x11A
	Parameters: 1
	Flags: None
*/
function createspikelauncherwatcher(watcher)
{
	watcher.altname = #"spike_charge";
	watcher.altweapon = getweapon(#"spike_charge");
	watcher.altdetonate = 0;
	watcher.watchforfire = 1;
	watcher.hackable = 1;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.ondetonatecallback = &spikedetonate;
	watcher.onstun = &weaponstun;
	watcher.stuntime = 1;
	watcher.ownergetsassist = 1;
	watcher.detonatestationary = 0;
	watcher.detonationdelay = 0;
	watcher.detonationsound = #"wpn_claymore_alert";
	watcher.ondetonationhandle = &spikesdetonating;
}

/*
	Name: createplayerhelicopterwatcher
	Namespace: weaponobjects
	Checksum: 0x3534EB35
	Offset: 0x810
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function createplayerhelicopterwatcher(watcher)
{
	watcher.altdetonate = 1;
	watcher.notequipment = 1;
}

/*
	Name: function_50d4198b
	Namespace: weaponobjects
	Checksum: 0x86BF94A6
	Offset: 0x840
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_50d4198b(watcher)
{
	watcher.hackable = 0;
	watcher.headicon = 0;
	watcher.enemydestroy = 0;
	watcher.onspawn = &function_f0e307a2;
}

/*
	Name: function_f0e307a2
	Namespace: weaponobjects
	Checksum: 0x4ECF2579
	Offset: 0x890
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function function_f0e307a2(watcher, player)
{
	level endon(#"game_ended");
	self endon(#"death");
	if(isdefined(player))
	{
		player stats::function_e24eec31(self.weapon, #"used", 1);
	}
	self playloopsound(#"uin_c4_air_alarm_loop");
	self waittilltimeout(10, #"stationary");
	function_b70eb3a9(watcher, player);
}

/*
	Name: function_b70eb3a9
	Namespace: weaponobjects
	Checksum: 0xC6A86631
	Offset: 0x960
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function function_b70eb3a9(watcher, player)
{
	pos = self.origin + vectorscale((0, 0, 1), 15);
	self.ammo_trigger = spawn("trigger_radius", pos, 0, 50, 50);
	self.ammo_trigger setteamfortrigger(player.team);
	self.ammo_trigger.owner = player;
	self thread function_5742754c();
	self thread function_42eeab72(self);
}

/*
	Name: function_5742754c
	Namespace: weaponobjects
	Checksum: 0xE7213601
	Offset: 0xA30
	Size: 0x150
	Parameters: 0
	Flags: Linked
*/
function function_5742754c()
{
	station = self;
	station endon(#"death");
	if(!isdefined(station.ammo_resupplies_given))
	{
		station.ammo_resupplies_given = 0;
	}
	/#
		assert(isdefined(station.ammo_trigger));
	#/
	trigger = station.ammo_trigger;
	while(isdefined(trigger))
	{
		waitresult = undefined;
		waitresult = trigger waittill(#"touch");
		player = waitresult.entity;
		if(!isplayer(player))
		{
			continue;
		}
		if(!isalive(player))
		{
			continue;
		}
		if(isdefined(trigger.team) && util::function_fbce7263(player.team, trigger.team))
		{
			continue;
		}
		station function_e98cee52(player, station);
	}
}

/*
	Name: function_e98cee52
	Namespace: weaponobjects
	Checksum: 0x1CC4CD73
	Offset: 0xB88
	Size: 0x16C
	Parameters: 2
	Flags: Linked
*/
function function_e98cee52(player, station)
{
	primary_weapons = player getweaponslistprimaries();
	var_c20b09e1 = 0;
	foreach(weapon in primary_weapons)
	{
		var_c20b09e1 = var_c20b09e1 | player function_61bdb626(weapon);
	}
	if(!var_c20b09e1)
	{
		return;
	}
	if(!isdefined(station.last_ammo_resupply_time))
	{
		station.last_ammo_resupply_time = [];
	}
	station.last_ammo_resupply_time[player getentitynumber()] = gettime();
	station.ammo_resupplies_given++;
	if(station.ammo_resupplies_given >= 1)
	{
		station function_f47cd4cb();
		station delete();
	}
}

/*
	Name: function_61bdb626
	Namespace: weaponobjects
	Checksum: 0x23B96430
	Offset: 0xD00
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_61bdb626(weapon)
{
	player = self;
	new_ammo = weapon.clipsize;
	stockammo = player getweaponammostock(weapon);
	player setweaponammostock(weapon, int(stockammo + new_ammo));
	newammo = player getweaponammostock(weapon);
	return newammo > stockammo;
}

/*
	Name: function_42eeab72
	Namespace: weaponobjects
	Checksum: 0x3E2C9E04
	Offset: 0xDB0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_42eeab72(station)
{
	self waittill(#"death");
	self function_f47cd4cb();
}

/*
	Name: function_f47cd4cb
	Namespace: weaponobjects
	Checksum: 0xA25A731C
	Offset: 0xDF0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_f47cd4cb()
{
	if(isdefined(self.ammo_trigger))
	{
		self.ammo_trigger delete();
	}
}

/*
	Name: delayedspikedetonation
	Namespace: weaponobjects
	Checksum: 0x252CF1A4
	Offset: 0xE28
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function delayedspikedetonation(attacker, weapon)
{
	if(!isdefined(self.owner.spikedelay))
	{
		self.owner.spikedelay = 0;
	}
	delaytime = self.owner.spikedelay;
	owner = self.owner;
	self.owner.spikedelay = self.owner.spikedelay + 0.3;
	waittillframeend();
	wait(delaytime);
	owner.spikedelay = owner.spikedelay - 0.3;
	if(isdefined(self))
	{
		self weapondetonate(attacker, weapon);
	}
}

/*
	Name: spikedetonate
	Namespace: weaponobjects
	Checksum: 0x35A0FE1
	Offset: 0xF18
	Size: 0x6C
	Parameters: 3
	Flags: Linked
*/
function spikedetonate(attacker, weapon, target)
{
	if(isdefined(target) && target.isvalid)
	{
		if(isdefined(weapon))
		{
		}
	}
	thread delayedspikedetonation(weapon, target);
}

/*
	Name: onspawncrossbowbolt
	Namespace: weaponobjects
	Checksum: 0xE8C1D050
	Offset: 0xF90
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function onspawncrossbowbolt(watcher, player)
{
	self.delete_on_death = 1;
	self thread onspawncrossbowbolt_internal(watcher, player);
}

/*
	Name: onspawncrossbowbolt_internal
	Namespace: weaponobjects
	Checksum: 0x67BC48BE
	Offset: 0xFD8
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function onspawncrossbowbolt_internal(watcher, player)
{
	player endon(#"disconnect");
	self endon(#"death");
	wait(0.25);
	linkedent = self getlinkedent();
	if(!isdefined(linkedent) || !isvehicle(linkedent))
	{
		self.takedamage = 0;
	}
	else
	{
		self.takedamage = 1;
		if(isvehicle(linkedent))
		{
			self thread dieonentitydeath(linkedent, player);
		}
	}
}

/*
	Name: onspawncrossbowboltimpact
	Namespace: weaponobjects
	Checksum: 0xEC770CDC
	Offset: 0x10C0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function onspawncrossbowboltimpact(s_watcher, e_player)
{
	self.delete_on_death = 1;
	self thread onspawncrossbowboltimpact_internal(s_watcher, e_player);
}

/*
	Name: onspawncrossbowboltimpact_internal
	Namespace: weaponobjects
	Checksum: 0x26F31165
	Offset: 0x1108
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function onspawncrossbowboltimpact_internal(s_watcher, e_player)
{
	self endon(#"death");
	e_player endon(#"disconnect");
	self waittill(#"stationary");
	s_watcher thread waitandfizzleout(self, 0);
	foreach(e_object in s_watcher.objectarray)
	{
		if(self == e_object)
		{
			s_watcher.objectarray[n_index] = undefined;
		}
	}
	cleanweaponobjectarray(s_watcher);
}

/*
	Name: dieonentitydeath
	Namespace: weaponobjects
	Checksum: 0x5C5D3EA8
	Offset: 0x1220
	Size: 0xB6
	Parameters: 2
	Flags: Linked
*/
function dieonentitydeath(entity, player)
{
	player endon(#"disconnect");
	self endon(#"death");
	alreadydead = entity.dead === 1 || (isdefined(entity.health) && entity.health < 0);
	if(!alreadydead)
	{
		entity waittill(#"death");
	}
	self notify(#"death");
}

