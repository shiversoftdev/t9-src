#using script_1cc417743d7c262d;
#using script_47fb62300ac0bd60;
#using script_79a7e1c31a3e8cc;
#using script_8988fdbc78d6c53;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace listening_device;

/*
	Name: function_89f2df9
	Namespace: listening_device
	Checksum: 0xBCE46BF
	Offset: 0x180
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"listening_device", &init_shared, undefined, undefined, undefined);
}

/*
	Name: init_shared
	Namespace: listening_device
	Checksum: 0x2D7D362
	Offset: 0x1C8
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	weaponobjects::function_e6400478("listening_device", &function_2111cf41, 0);
	level.var_81286410 = &function_23fef963;
	level.var_5be42934 = &function_f38fc2a8;
	callback::function_98a0917d(&function_98a0917d);
	callback::function_78ccee50(&function_78ccee50);
	level.var_8ddf6d3d = getscriptbundle(#"listeningdevicesettings");
	level.var_96492769 = getscriptbundle(#"listeningdevicesettings_deadsilence");
	callback::on_finalize_initialization(&function_1c601b99);
	deployable::function_2e088f73(getweapon("listening_device"));
	clientfield::register("missile", "listening_device_hacked", 1, 1, "counter");
}

/*
	Name: function_1c601b99
	Namespace: listening_device
	Checksum: 0x6ABBCB6E
	Offset: 0x338
	Size: 0x48
	Parameters: 0
	Flags: Linked
*/
function function_1c601b99()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](getweapon("listening_device"), &function_bff5c062);
	}
}

/*
	Name: function_bff5c062
	Namespace: listening_device
	Checksum: 0xA8B41911
	Offset: 0x388
	Size: 0x18C
	Parameters: 2
	Flags: Linked
*/
function function_bff5c062(listening_device, var_dbd1a594)
{
	var_f3ab6571 = listening_device.owner weaponobjects::function_8481fc06(listening_device.weapon) > 1;
	listening_device.owner thread globallogic_audio::function_a2cde53d(listening_device.weapon, var_f3ab6571);
	listening_device.team = var_dbd1a594.team;
	listening_device setteam(var_dbd1a594.team);
	listening_device.owner = var_dbd1a594;
	listening_device setowner(var_dbd1a594);
	if(isdefined(listening_device) && isdefined(level.var_f1edf93f))
	{
		_station_up_to_detention_center_triggers = [[level.var_f1edf93f]]();
		if((isdefined(_station_up_to_detention_center_triggers) ? _station_up_to_detention_center_triggers : 0))
		{
			listening_device notify(#"hash_602ae7ca650d6287");
			listening_device thread weaponobjects::weapon_object_timeout(listening_device.var_2d045452, _station_up_to_detention_center_triggers);
		}
	}
	listening_device thread weaponobjects::function_6d8aa6a0(var_dbd1a594, listening_device.var_2d045452);
	listening_device clientfield::increment("listening_device_hacked");
}

/*
	Name: function_2111cf41
	Namespace: listening_device
	Checksum: 0x3F4E542
	Offset: 0x520
	Size: 0x1C2
	Parameters: 1
	Flags: Linked
*/
function function_2111cf41(watcher)
{
	watcher.watchforfire = 1;
	watcher.activatesound = #"wpn_claymore_alert";
	watcher.hackable = 1;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = undefined;
	watcher.immediatedetonation = 1;
	watcher.immunespecialty = "specialty_immunetriggerbetty";
	watcher.var_8eda8949 = (0, 0, 0);
	var_167da8cf = getweapon(#"listening_device");
	if(isdefined(var_167da8cf.var_4dd46f8a))
	{
		var_e6fbac16 = getscriptbundle(var_167da8cf.var_4dd46f8a);
		/#
			assert(isdefined(var_e6fbac16));
		#/
	}
	watcher.stuntime = 1;
	watcher.ondetonatecallback = &function_ad011f90;
	watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
	watcher.onspawn = &function_8bdff396;
	watcher.stun = &weaponobjects::weaponstun;
	watcher.var_994b472b = &function_7b26afb;
	watcher.var_10efd558 = "switched_field_upgrade";
	watcher.ondestroyed = &function_8af865a6;
}

/*
	Name: function_ad011f90
	Namespace: listening_device
	Checksum: 0x8D1DAF57
	Offset: 0x6F0
	Size: 0xD4
	Parameters: 3
	Flags: Linked
*/
function function_ad011f90(attacker, weapon, target)
{
	if(isdefined(attacker) && isplayer(attacker) && attacker != self.owner && attacker.team != self.team)
	{
		var_f3ab6571 = self.owner weaponobjects::function_8481fc06(self.weapon) > 1;
		self.owner thread globallogic_audio::function_6daffa93(self.weapon, var_f3ab6571);
	}
	weaponobjects::proximitydetonate(attacker, weapon, target);
}

/*
	Name: function_7b26afb
	Namespace: listening_device
	Checksum: 0x839E2772
	Offset: 0x7D0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_7b26afb(player)
{
	self weaponobjects::weaponobjectfizzleout();
}

/*
	Name: function_8bdff396
	Namespace: listening_device
	Checksum: 0xC1238D91
	Offset: 0x800
	Size: 0x12C
	Parameters: 2
	Flags: Linked
*/
function function_8bdff396(watcher, player)
{
	weaponobjects::onspawnproximitygrenadeweaponobject(watcher, player);
	self.weapon = getweapon(#"listening_device");
	self.var_48d842c3 = 1;
	self.var_515d6dda = 1;
	self function_619a5c20();
	if(!isdefined(level.var_b7bd6b6d))
	{
		level.var_b7bd6b6d = [];
	}
	team = player.team;
	if(isdefined(team))
	{
		if(!isdefined(level.var_b7bd6b6d[team]))
		{
			level.var_b7bd6b6d[team] = [];
		}
		level.var_b7bd6b6d[team][self getentitynumber()] = self;
	}
	player battlechatter::function_fc82b10(self.weapon, self.origin, self);
}

/*
	Name: function_8af865a6
	Namespace: listening_device
	Checksum: 0x6B6772D0
	Offset: 0x938
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_8af865a6(attacker, var_61dedb9f)
{
	weaponobjects::proximitydetonate(var_61dedb9f);
	if(isplayer(var_61dedb9f) && var_61dedb9f != self.owner && var_61dedb9f.team != self.team)
	{
		scoreevents::processscoreevent(#"hash_20263a44bc86ab70", var_61dedb9f);
		self thread battlechatter::function_d2600afc(var_61dedb9f, self.owner, self.weapon);
		var_f3ab6571 = self.owner weaponobjects::function_8481fc06(self.weapon) > 1;
		self.owner thread globallogic_audio::function_6daffa93(self.weapon, var_f3ab6571);
	}
}

/*
	Name: function_23fef963
	Namespace: listening_device
	Checksum: 0x48FA832B
	Offset: 0xA50
	Size: 0x1DA
	Parameters: 0
	Flags: Linked
*/
function function_23fef963()
{
	if(!isdefined(self.team))
	{
		return;
	}
	if(!isdefined(level.var_b7bd6b6d[self.team]))
	{
		level.var_b7bd6b6d[self.team] = [];
	}
	var_c3df74e2 = (isdefined(level.var_8ddf6d3d.var_ec25308b) ? level.var_8ddf6d3d.var_ec25308b : 0);
	var_bf170232 = [];
	foreach(device in level.var_b7bd6b6d[self.team])
	{
		if(!isdefined(device))
		{
			continue;
		}
		if(!var_c3df74e2 && device.owner !== self)
		{
			continue;
		}
		var_48b7953 = spawnstruct();
		var_48b7953.origin = device.origin;
		var_48b7953.angles = device.angles;
		var_48b7953.owner = device.owner;
		var_48b7953.isjammed = device.isjammed;
		if(!isdefined(var_bf170232))
		{
			var_bf170232 = [];
		}
		else if(!isarray(var_bf170232))
		{
			var_bf170232 = array(var_bf170232);
		}
		var_bf170232[var_bf170232.size] = var_48b7953;
	}
	return var_bf170232;
}

/*
	Name: function_98a0917d
	Namespace: listening_device
	Checksum: 0x65795E49
	Offset: 0xC38
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_98a0917d()
{
	level thread function_d993c135();
}

/*
	Name: function_78ccee50
	Namespace: listening_device
	Checksum: 0x37F6594B
	Offset: 0xC60
	Size: 0x26
	Parameters: 1
	Flags: Linked, Private
*/
function private function_78ccee50(params)
{
	self.var_bb20a522 = gettime();
	self.var_8c3b7f1a = self.origin;
}

/*
	Name: function_d993c135
	Namespace: listening_device
	Checksum: 0x3E80A84D
	Offset: 0xC90
	Size: 0x3B4
	Parameters: 0
	Flags: Linked
*/
function function_d993c135()
{
	self notify("1e8063b141dac84d");
	self endon("1e8063b141dac84d");
	level endon(#"game_ended");
	pass = 0;
	var_af989ae4 = sqr(level.var_8ddf6d3d.var_293163bd);
	var_84dbcde7 = sqr(level.var_96492769.var_293163bd);
	var_24fcb2d = min(var_af989ae4, var_84dbcde7);
	var_24bfde42 = sqr(level.var_8ddf6d3d.var_9b69c823);
	var_46638976 = sqr(level.var_96492769.var_9b69c823);
	var_3d369b0c = min(var_af989ae4, var_84dbcde7);
	while(true)
	{
		now = gettime();
		players = getplayers();
		foreach(player in players)
		{
			if(!isdefined(player))
			{
				continue;
			}
			if(player getentitynumber() & 3 != pass)
			{
				continue;
			}
			if(!isalive(player))
			{
				continue;
			}
			var_92c9c085 = length2dsquared(player getvelocity());
			if(player isplayerswimming() && !player isplayerunderwater())
			{
				if(var_92c9c085 < var_3d369b0c)
				{
					continue;
				}
				var_daf9a500 = var_24bfde42;
				if(player hasperk(#"specialty_sixthsensejammer"))
				{
					var_daf9a500 = var_84dbcde7;
				}
				if(var_92c9c085 > var_daf9a500)
				{
					player.var_3ab8ccc9 = now;
					player.var_5550488a = player.origin;
				}
				continue;
			}
			if(var_92c9c085 < var_24fcb2d)
			{
				continue;
			}
			if(var_92c9c085 > 62500)
			{
				player.var_e5a19e3d = now;
				player.var_50703880 = player.origin;
				continue;
			}
			minspeedsq = var_af989ae4;
			if(player hasperk(#"specialty_sixthsensejammer"))
			{
				minspeedsq = var_84dbcde7;
			}
			if(var_92c9c085 > minspeedsq)
			{
				player.var_3ab8ccc9 = now;
				player.var_5550488a = player.origin;
			}
		}
		pass++;
		if(pass >= 4)
		{
			pass = 0;
		}
		wait(0.1);
	}
}

/*
	Name: function_f38fc2a8
	Namespace: listening_device
	Checksum: 0xEA8F045A
	Offset: 0x1050
	Size: 0x98C
	Parameters: 1
	Flags: Linked
*/
function function_f38fc2a8(data)
{
	attacker = self;
	if(!isdefined(attacker))
	{
		return false;
	}
	victim = data.victim;
	if(!isdefined(victim))
	{
		return false;
	}
	var_bf170232 = data.var_807875bc;
	if(!isdefined(var_bf170232))
	{
		return false;
	}
	if(!isarray(var_bf170232))
	{
		return false;
	}
	arrayremovevalue(var_bf170232, undefined, 0);
	if(var_bf170232.size == 0)
	{
		return false;
	}
	var_ca2cadcd = level.var_8ddf6d3d.var_ec25308b !== 1;
	var_52b5458f = getweapon(#"listening_device");
	var_64c27ffb = 0;
	var_55336d8d = level.var_8ddf6d3d;
	var_c394e130 = level.var_96492769;
	bundle = var_55336d8d;
	if(isplayer(victim) && victim hasperk(#"specialty_sixthsensejammer"))
	{
		bundle = var_c394e130;
	}
	range = bundle.var_151e2c9b + 30;
	rangesq = sqr(range);
	var_d6ff0766 = 0;
	if(!isdefined(data.var_a73da413))
	{
		data.var_a73da413 = 0;
	}
	if(!isdefined(data.var_c23ee432))
	{
		data.var_c23ee432 = 0;
	}
	if(data.time - data.var_a73da413 < 6000)
	{
		var_d6ff0766 = bundle.var_a8e88375 * range;
		var_a8d3770f = data.var_5f1818be;
	}
	else if(data.time - data.var_c23ee432 < 6000)
	{
		if(data.var_f0b3c772 >= 1)
		{
			var_d6ff0766 = bundle.var_2b6e9133 * range;
		}
		else
		{
			if(data.var_e05c79a4)
			{
				var_d6ff0766 = bundle.var_c26d14da * range;
				var_7aeac1e7 = 1;
			}
			else
			{
				if(data.victimstance == "stand")
				{
					var_d6ff0766 = bundle.var_dbf6038b * range;
					var_7aeac1e7 = 1;
				}
				else if(data.victimstance == "crouch")
				{
					var_d6ff0766 = bundle.var_dccff18f * range;
				}
			}
		}
		var_a8d3770f = data.var_dbbf805a;
	}
	if(!isdefined(data.var_9c16cd22))
	{
		data.var_9c16cd22 = 0;
	}
	if(data.time - data.var_9c16cd22 < 6000)
	{
		var_f57f785b = bundle.var_abea5dd8 * range;
		if(weaponhasattachment(data.victimweapon, "suppressed") || weaponhasattachment(data.victimweapon, "suppressed2"))
		{
			var_f57f785b = bundle.var_301350af * range;
		}
		if(var_f57f785b > var_d6ff0766)
		{
			var_d6ff0766 = var_f57f785b;
			var_a8d3770f = data.var_5d9be0a1;
		}
	}
	if(!isdefined(var_a8d3770f))
	{
		var_a8d3770f = data.victimorigin;
	}
	var_8463af9d = sqr(var_d6ff0766);
	var_7f4e7212 = [];
	var_7a6cbc93 = [];
	foreach(var_48b7953 in var_bf170232)
	{
		if(!isdefined(var_48b7953.owner))
		{
			continue;
		}
		if(var_48b7953.isjammed === 1)
		{
			continue;
		}
		distcurrentsq = distance2dsquared(var_a8d3770f, var_48b7953.origin);
		if(distcurrentsq > rangesq)
		{
			continue;
		}
		disttovictim = var_a8d3770f - var_48b7953.origin;
		if(bundle.var_b060dd0c < 180)
		{
			var_fa4e3cfc = vectornormalize((disttovictim[0], disttovictim[1], 0));
			if(!isdefined(var_48b7953.var_fa4e3cfc))
			{
				var_48b7953.var_2a5aebad = anglestoforward((0, var_48b7953.angles[1], 0));
			}
			dot = vectordot(var_fa4e3cfc, var_48b7953.var_2a5aebad);
			if(dot < cos(bundle.var_b060dd0c))
			{
				continue;
			}
		}
		if(distcurrentsq > var_8463af9d)
		{
			continue;
		}
		var_a07d912f = !var_ca2cadcd;
		if(var_48b7953.owner == attacker)
		{
			if(var_7a6cbc93[var_48b7953.owner getentitynumber()] !== 1)
			{
				scoreevents::processscoreevent(#"hash_18522e88ad05a3b2", attacker, victim, var_52b5458f);
				attacker stats::function_dad108fa(#"hash_15da16b6b9032af", 1);
				attacker stats::function_dad108fa(#"hash_d9fe863a1e9e4d8", 1);
				attacker challenges::function_38ad2427(#"hash_4808274db2565c0d", 1);
				attacker contracts::function_a54e2068(#"hash_327ba388df6e6793");
				attacker contracts::function_a54e2068(#"hash_3ff1fe889b516cc3");
				if(isdefined(data.weapon) && data.weapon !== level.weaponnone)
				{
					attacker stats::function_e24eec31(data.weapon, #"kill_detected_stunned_blinded", 1);
					attacker stats::function_622feb0d(var_52b5458f.name, #"kills", 1);
					attacker stats::function_6fb0b113(var_52b5458f.name, #"best_kills");
				}
				var_7a6cbc93[var_48b7953.owner getentitynumber()] = 1;
			}
			if(attacker.var_fa9604fd !== 1)
			{
				if(!isdefined(attacker.var_90df1936))
				{
					attacker.var_90df1936 = 0;
				}
				if(data.time - attacker.var_90df1936 < 4000)
				{
					scoreevents::processscoreevent(#"hash_293351f0ab09e08e", attacker, victim, var_52b5458f);
					attacker stats::function_622feb0d(var_52b5458f.name, #"hash_7bf29fa438d54aad", 1);
					attacker.var_fa9604fd = 1;
				}
				attacker.var_90df1936 = data.time;
			}
			var_a07d912f = 0;
		}
		if(var_a07d912f && var_7f4e7212[var_48b7953.owner getentitynumber()] !== 1)
		{
			scoreevents::processscoreevent(#"hash_573fdf319bb7b7d1", var_48b7953.owner, victim, var_52b5458f);
			var_48b7953.owner stats::function_622feb0d(var_52b5458f.name, #"assists", 1);
			var_7f4e7212[var_48b7953.owner getentitynumber()] = 1;
		}
	}
}

