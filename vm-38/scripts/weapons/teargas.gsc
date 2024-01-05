#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\deployable.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;

#namespace teargas;

/*
	Name: function_998a85d7
	Namespace: teargas
	Checksum: 0x6DBB6FC9
	Offset: 0x180
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_998a85d7()
{
	level notify(-975442194);
}

/*
	Name: init_shared
	Namespace: teargas
	Checksum: 0xFB221BB9
	Offset: 0x1A0
	Size: 0x1FC
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	level.var_2ee59975 = [];
	level.var_29115f03 = [];
	level.var_29115f03[1] = {#hash_18c0a09d:#"hash_42b275f8ad52e92d", #slow:#"hash_8a5fd5a0a3d0325"};
	level.var_29115f03[2] = {#hash_18c0a09d:#"hash_42b272f8ad52e414", #slow:#"hash_8a5fa5a0a3cfe0c"};
	level.var_29115f03[3] = {#hash_18c0a09d:#"hash_42b273f8ad52e5c7", #slow:#"hash_8a5fb5a0a3cffbf"};
	weapon = getweapon(#"tear_gas");
	clientfield::register("toplayer", "in_tear_gas", 1, 2, "int");
	weaponobjects::function_e6400478(#"tear_gas", &function_db9e3adb, 0);
	deployable::register_deployable(weapon);
	globallogic_score::function_a458dbe1(#"hash_69c2a47bf2322b6b", &function_dbdedd18);
	callback::on_finalize_initialization(&function_1c601b99);
}

/*
	Name: function_1c601b99
	Namespace: teargas
	Checksum: 0x9EFD5C61
	Offset: 0x3A8
	Size: 0x48
	Parameters: 0
	Flags: None
*/
function function_1c601b99()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](getweapon("tear_gas"), &function_bff5c062);
	}
}

/*
	Name: function_bff5c062
	Namespace: teargas
	Checksum: 0x8E5BD1D1
	Offset: 0x3F8
	Size: 0x1DC
	Parameters: 2
	Flags: None
*/
function function_bff5c062(teargas, attackingplayer)
{
	var_f3ab6571 = teargas.owner weaponobjects::function_8481fc06(teargas.weapon) > 1;
	teargas.owner thread globallogic_audio::function_a2cde53d(teargas.weapon, var_f3ab6571);
	teargas.owner weaponobjects::hackerremoveweapon(teargas);
	teargas weaponobjects::function_fb7b0024(teargas.owner);
	teargas.team = attackingplayer.team;
	teargas setteam(attackingplayer.team);
	teargas.owner = attackingplayer;
	teargas setowner(attackingplayer);
	teargas weaponobjects::function_386fa470(attackingplayer);
	teargas weaponobjects::function_931041f8(attackingplayer);
	if(isdefined(teargas) && isdefined(level.var_f1edf93f))
	{
		_station_up_to_detention_center_triggers = [[level.var_f1edf93f]]();
		if((isdefined(_station_up_to_detention_center_triggers) ? _station_up_to_detention_center_triggers : 0))
		{
			teargas notify(#"cancel_timeout");
			teargas thread weaponobjects::weapon_object_timeout(teargas.var_2d045452, _station_up_to_detention_center_triggers);
		}
	}
	teargas thread weaponobjects::function_6d8aa6a0(attackingplayer, teargas.var_2d045452);
}

/*
	Name: function_db9e3adb
	Namespace: teargas
	Checksum: 0x443E7D01
	Offset: 0x5E0
	Size: 0x1CA
	Parameters: 1
	Flags: None
*/
function function_db9e3adb(watcher)
{
	watcher.watchforfire = 1;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = 1;
	watcher.immediatedetonation = 1;
	watcher.immunespecialty = "specialty_immunegastrap";
	watcher.var_8eda8949 = (0, 0, 0);
	watcher.stuntime = 1;
	watcher.var_10efd558 = "switched_field_upgrade";
	if(isdefined(watcher.weapon.customsettings))
	{
		var_e6fbac16 = getscriptbundle(watcher.weapon.customsettings);
		watcher.var_20d0363e = var_e6fbac16.var_af22b5dc;
		watcher.activationdelay = var_e6fbac16.var_a3fd61e7;
		watcher.detectiongraceperiod = (isdefined(var_e6fbac16.var_88b0248b) ? var_e6fbac16.var_88b0248b : 0);
		if(isdefined(var_e6fbac16.var_29467698) && var_e6fbac16.var_29467698 != 0)
		{
			watcher.detonateradius = var_e6fbac16.var_29467698;
		}
	}
	watcher.ondetonatecallback = &function_f82566e8;
	watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
	watcher.onspawn = &function_7641afa6;
	watcher.var_994b472b = &function_5192d9d6;
	watcher.stun = &weaponobjects::weaponstun;
}

/*
	Name: function_dbdedd18
	Namespace: teargas
	Checksum: 0xA00A04BA
	Offset: 0x7B8
	Size: 0x80
	Parameters: 5
	Flags: None
*/
function function_dbdedd18(attacker, victim, var_3d1ed4bd, weapon, meansofdeath)
{
	victim contracts::increment_contract(#"hash_d9376f51d3c734c");
	if(meansofdeath != weapon)
	{
		level scoreevents::function_2a2e1723(#"hash_5a02ff4e546b68f1", victim, var_3d1ed4bd);
	}
	return true;
}

/*
	Name: function_7641afa6
	Namespace: teargas
	Checksum: 0xE9BE4FE5
	Offset: 0x840
	Size: 0xFC
	Parameters: 2
	Flags: None
*/
function function_7641afa6(watcher, player)
{
	self.delete_on_death = 1;
	self.var_48d842c3 = 1;
	self.var_515d6dda = 1;
	self function_619a5c20();
	var_e6fbac16 = getscriptbundle(self.weapon.customsettings);
	self.var_b2ed661a = var_e6fbac16.teargasduration + 3;
	self weaponobjects::onspawnproximitygrenadeweaponobject(watcher, player);
	player battlechatter::function_fc82b10(self.weapon, self.origin, self);
	level influencers::create_grenade_influencers(player.team, self.weapon, self);
}

/*
	Name: function_5192d9d6
	Namespace: teargas
	Checksum: 0x37BA4E34
	Offset: 0x948
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_5192d9d6(player)
{
	self weaponobjects::weaponobjectfizzleout();
}

/*
	Name: function_f82566e8
	Namespace: teargas
	Checksum: 0x5115DBA9
	Offset: 0x978
	Size: 0x354
	Parameters: 3
	Flags: None
*/
function function_f82566e8(attacker, weapon, target)
{
	var_7e6e7f9f = self.weapon;
	if(is_true(self.wasdamaged))
	{
		if(self.owner util::isenemyplayer(attacker))
		{
			attacker challenges::destroyedexplosive(weapon);
			scoreevents::processscoreevent(#"hash_6913b395f1030cd3", attacker, self.owner, weapon);
			self thread battlechatter::function_d2600afc(attacker, self.owner, var_7e6e7f9f, weapon);
			self.owner globallogic_score::function_5829abe3(attacker, weapon, var_7e6e7f9f);
			var_f3ab6571 = self.owner weaponobjects::function_8481fc06(var_7e6e7f9f) > 1;
			self.owner thread globallogic_audio::function_6daffa93(var_7e6e7f9f, var_f3ab6571);
		}
		if(isdefined(level._equipment_explode_fx))
		{
			playfx(level._equipment_explode_fx, self.origin);
		}
		self playsound(#"hash_16dfe84ea21fd143");
		self delete();
		return;
	}
	var_e6fbac16 = getscriptbundle(var_7e6e7f9f.customsettings);
	radius = var_e6fbac16.var_b86ce9f4;
	duration = var_e6fbac16.teargasduration;
	position = self.origin;
	dir_up = (0, 0, 1);
	ent = spawn("script_model", position);
	ent setteam(self.team);
	ent.team = self.team;
	owner = self.owner;
	ent.killcament = self.killcament;
	if(isdefined(owner))
	{
		ent setowner(owner);
		ent.owner = owner;
		owner.var_d56524fc = gettime();
		owner.var_2af14143 = position;
	}
	ent thread function_2f37f73e(var_7e6e7f9f, duration, radius);
	level influencers::create_grenade_influencers(ent.team, var_7e6e7f9f, ent);
	level thread function_a2493473(position, duration, var_7e6e7f9f.projsmokestartsound, var_7e6e7f9f.projsmokeendsound, var_7e6e7f9f.projsmokeloopsound);
	self weaponobjects::proximitydetonate(attacker, weapon, target);
}

/*
	Name: function_2f37f73e
	Namespace: teargas
	Checksum: 0x58E4F750
	Offset: 0xCD8
	Size: 0x1CC
	Parameters: 3
	Flags: None
*/
function function_2f37f73e(var_7e6e7f9f, duration, radius)
{
	team = self.team;
	owner = self.owner;
	trigger = spawn("trigger_radius", self.origin, 0, radius, radius);
	trigger.owner = owner;
	self.var_160d2855 = trigger;
	if(!isdefined(level.var_2ee59975))
	{
		level.var_2ee59975 = [];
	}
	else if(!isarray(level.var_2ee59975))
	{
		level.var_2ee59975 = array(level.var_2ee59975);
	}
	level.var_2ee59975[level.var_2ee59975.size] = trigger;
	level thread function_516794d8(self, var_7e6e7f9f);
	killcament = self.killcament;
	self waittilltimeout(duration, #"death");
	arrayremovevalue(level.var_2ee59975, trigger);
	if(isdefined(killcament))
	{
		killcament thread util::deleteaftertime(5);
	}
	if(isdefined(trigger))
	{
		trigger delete();
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_12b45f48
	Namespace: teargas
	Checksum: 0x96C9F3EE
	Offset: 0xEB0
	Size: 0xEE
	Parameters: 2
	Flags: None
*/
function function_12b45f48(var_7acab93a, team)
{
	foreach(trigger in level.var_2ee59975)
	{
		if(isdefined(team) && trigger util::isenemyteam(team))
		{
			continue;
		}
		if(self istouching(trigger))
		{
			if(isdefined(var_7acab93a))
			{
				if(var_7acab93a != trigger)
				{
					return trigger;
				}
				continue;
			}
			return trigger;
		}
	}
	return undefined;
}

/*
	Name: function_585ad28f
	Namespace: teargas
	Checksum: 0xE3DFBA90
	Offset: 0xFA8
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function function_585ad28f(weapon)
{
	if(getweapon(#"tear_gas") == weapon.rootweapon)
	{
		return true;
	}
	return false;
}

/*
	Name: function_516794d8
	Namespace: teargas
	Checksum: 0x841F472D
	Offset: 0xFF0
	Size: 0x2F0
	Parameters: 2
	Flags: None
*/
function function_516794d8(grenadeent, var_7e6e7f9f)
{
	var_160d2855 = grenadeent.var_160d2855;
	if(!isdefined(var_160d2855))
	{
		return;
	}
	grenadeteam = grenadeent.team;
	owner = grenadeent.owner;
	while(true)
	{
		waitresult = undefined;
		waitresult = var_160d2855 waittilltimeout(0.2, #"death");
		playertargets = grenadeent getpotentialtargets(owner, grenadeteam, var_7e6e7f9f);
		foreach(player in playertargets)
		{
			if(player hasperk(#"hash_5fef46715b368a6e"))
			{
				continue;
			}
			if(waitresult._notify == #"timeout" && isdefined(var_160d2855) && player istouching(var_160d2855) && bullettracepassed(grenadeent.origin, player.origin + vectorscale((0, 0, 1), 12), 0, player))
			{
				if(!isdefined(player.var_2ee59975))
				{
					player.var_2ee59975 = [];
				}
				else if(!isarray(player.var_2ee59975))
				{
					player.var_2ee59975 = array(player.var_2ee59975);
				}
				if(!isinarray(player.var_2ee59975, var_160d2855))
				{
					player.var_2ee59975[var_160d2855 getentitynumber()] = var_160d2855;
					if(!isdefined(player.var_1b05dcde))
					{
						player thread function_78d7002(var_7e6e7f9f, owner, grenadeent);
					}
				}
				continue;
			}
			if(isdefined(player.var_1b05dcde))
			{
				player function_9eda41cd(var_160d2855, var_7e6e7f9f, owner);
			}
		}
		if(!isdefined(var_160d2855) || waitresult._notify != "timeout")
		{
			return;
		}
	}
}

/*
	Name: getpotentialtargets
	Namespace: teargas
	Checksum: 0x6DBF518A
	Offset: 0x12E8
	Size: 0xD0
	Parameters: 3
	Flags: Private
*/
function private getpotentialtargets(owner, ownerteam, var_7e6e7f9f)
{
	if(level.friendlyfire)
	{
		return function_a1ef346b();
	}
	potentialtargets = function_f6f34851(ownerteam);
	var_e6fbac16 = getscriptbundle(var_7e6e7f9f.customsettings);
	if(is_true(var_e6fbac16.var_fc20cda3) && isalive(owner))
	{
		potentialtargets[potentialtargets.size] = owner;
	}
	return potentialtargets;
}

/*
	Name: function_78d7002
	Namespace: teargas
	Checksum: 0xD580FFC
	Offset: 0x13C0
	Size: 0x212
	Parameters: 3
	Flags: Private
*/
function private function_78d7002(var_7e6e7f9f, owner, grenadeent)
{
	self endoncallback(&function_ac86e0a9, #"death", #"hash_7adffd186663a874");
	dot = (level.hardcoremode === 1 ? getstatuseffect(#"hash_5f651c0a59d8c40d") : getstatuseffect(#"hash_69c2a47bf2322b6b"));
	dot.killcament = grenadeent.killcament;
	self thread status_effect::status_effect_apply(dot, var_7e6e7f9f, owner, 0, undefined, undefined, grenadeent.origin);
	self playsoundtoplayer(#"hash_569fa11d8a4005ba", self);
	foreach(stage, var_c62d6d34 in level.var_29115f03)
	{
		self.var_1b05dcde = stage;
		slow = getstatuseffect(var_c62d6d34.slow);
		self thread status_effect::status_effect_apply(slow, var_7e6e7f9f, owner);
		self clientfield::set_to_player("in_tear_gas", stage);
		wait(float(slow.var_77449e9) / 1000);
	}
}

/*
	Name: function_ac86e0a9
	Namespace: teargas
	Checksum: 0x25A0543D
	Offset: 0x15E0
	Size: 0x156
	Parameters: 1
	Flags: Private
*/
function private function_ac86e0a9(notifyhash)
{
	if(notifyhash == "death" && isdefined(self))
	{
		if(isdefined(self.var_1b05dcde))
		{
			var_c62d6d34 = level.var_29115f03[self.var_1b05dcde];
			slow = getstatuseffect(var_c62d6d34.slow);
			self status_effect::function_408158ef(slow.setype, slow.var_18d16a6b);
			self.var_1b05dcde = undefined;
		}
		dot = (level.hardcoremode === 1 ? getstatuseffect(#"hash_5f651c0a59d8c40d") : getstatuseffect(#"hash_69c2a47bf2322b6b"));
		self status_effect::function_408158ef(dot.setype, dot.var_18d16a6b);
		self clientfield::set_to_player("in_tear_gas", 0);
		self.var_2ee59975 = undefined;
	}
}

/*
	Name: function_9eda41cd
	Namespace: teargas
	Checksum: 0xC3882D0
	Offset: 0x1740
	Size: 0x216
	Parameters: 3
	Flags: Private
*/
function private function_9eda41cd(var_160d2855, var_7e6e7f9f, owner)
{
	if(isarray(self.var_2ee59975) && isinarray(self.var_2ee59975, var_160d2855))
	{
		arrayremovevalue(self.var_2ee59975, var_160d2855);
		if(!self.var_2ee59975.size)
		{
			self.var_2ee59975 = undefined;
		}
	}
	if(isdefined(self.var_2ee59975))
	{
		return;
	}
	self notify(#"hash_7adffd186663a874");
	if(!isdefined(self.var_1b05dcde))
	{
		return;
	}
	var_c62d6d34 = level.var_29115f03[self.var_1b05dcde];
	slow = getstatuseffect(var_c62d6d34.slow);
	var_18c0a09d = getstatuseffect(var_c62d6d34.var_18c0a09d);
	dot = (level.hardcoremode === 1 ? getstatuseffect(#"hash_5f651c0a59d8c40d") : getstatuseffect(#"hash_69c2a47bf2322b6b"));
	self status_effect::function_408158ef(dot.setype, dot.var_18d16a6b);
	self status_effect::function_408158ef(slow.setype, slow.var_18d16a6b);
	self thread status_effect::status_effect_apply(var_18c0a09d, var_7e6e7f9f, owner);
	self clientfield::set_to_player("in_tear_gas", 0);
	self.var_1b05dcde = undefined;
}

/*
	Name: function_a2493473
	Namespace: teargas
	Checksum: 0x2557D81C
	Offset: 0x1960
	Size: 0x13C
	Parameters: 5
	Flags: None
*/
function function_a2493473(position, duration, startsound, stopsound, loopsound)
{
	var_4af5a2e7 = spawn("script_origin", (0, 0, 1));
	if(isdefined(var_4af5a2e7))
	{
		var_4af5a2e7 endon(#"death");
		var_4af5a2e7.origin = position;
		if(isdefined(startsound))
		{
			var_4af5a2e7 playsound(startsound);
		}
		if(isdefined(loopsound))
		{
			var_4af5a2e7 playloopsound(loopsound);
		}
		if(duration > 7.5)
		{
			wait(duration - 7.5);
		}
		if(isdefined(stopsound))
		{
			thread sound::play_in_space(stopsound, position);
		}
		var_4af5a2e7 stoploopsound(0.5);
		wait(0.5);
		var_4af5a2e7 delete();
	}
}

