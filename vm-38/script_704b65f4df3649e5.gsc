#using script_1435f3c9fc699e04;
#using script_1cc417743d7c262d;
#using script_47fb62300ac0bd60;
#using script_545a0bac37bda541;
#using script_68d2ee1489345a1d;
#using script_8988fdbc78d6c53;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;

#namespace trophy_system;

/*
	Name: function_d33e0a41
	Namespace: trophy_system
	Checksum: 0x8B66EE89
	Offset: 0x1C8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d33e0a41()
{
	level notify(227175231);
}

/*
	Name: init_shared
	Namespace: trophy_system
	Checksum: 0x6359FB54
	Offset: 0x1E8
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	level.trophydetonationfx = #"hash_7e2c1749cc5fcfb9";
	level.fx_trophy_radius_indicator = #"weapon/fx_trophy_radius_indicator";
	trophydeployanim = "p8_fxanim_mp_eqp_trophy_system_world_anim";
	trophyspinanim = "p8_fxanim_mp_eqp_trophy_system_world_open_anim";
	level.var_4f3822f4 = &trophysystemdetonate;
	level thread register();
	callback::on_player_killed(&on_player_killed);
	callback::on_spawned(&ammo_reset);
	weaponobjects::function_e6400478(#"trophy_system", &createtrophysystemwatcher, 1);
	callback::on_finalize_initialization(&function_1c601b99);
}

/*
	Name: function_1c601b99
	Namespace: trophy_system
	Checksum: 0xC03E5C8E
	Offset: 0x318
	Size: 0x50
	Parameters: 0
	Flags: None
*/
function function_1c601b99()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](getweapon(#"trophy_system"), &function_bff5c062);
	}
}

/*
	Name: function_bff5c062
	Namespace: trophy_system
	Checksum: 0x1252FFF4
	Offset: 0x370
	Size: 0x200
	Parameters: 2
	Flags: None
*/
function function_bff5c062(trophysystem, var_dbd1a594)
{
	trophysystem notify(#"hacked");
	var_f3ab6571 = trophysystem.owner weaponobjects::function_7cdcc8ba(trophysystem.var_2d045452) > 1;
	trophysystem.owner thread globallogic_audio::function_a2cde53d(trophysystem.weapon, var_f3ab6571);
	trophysystem.owner weaponobjects::hackerremoveweapon(trophysystem);
	trophysystem.team = var_dbd1a594.team;
	trophysystem setteam(var_dbd1a594.team);
	trophysystem.owner = var_dbd1a594;
	trophysystem setowner(var_dbd1a594);
	trophysystem thread trophyactive(var_dbd1a594);
	trophysystem weaponobjects::function_386fa470(var_dbd1a594);
	if(isdefined(trophysystem) && isdefined(level.var_f1edf93f))
	{
		_station_up_to_detention_center_triggers = [[level.var_f1edf93f]]();
		if((isdefined(_station_up_to_detention_center_triggers) ? _station_up_to_detention_center_triggers : 0))
		{
			trophysystem notify(#"hash_602ae7ca650d6287");
			trophysystem thread weaponobjects::weapon_object_timeout(trophysystem.var_2d045452, _station_up_to_detention_center_triggers);
		}
	}
	trophysystem thread weaponobjects::function_6d8aa6a0(var_dbd1a594, trophysystem.var_2d045452);
	if(isdefined(trophysystem) && isdefined(level.var_fc1bbaef))
	{
		[[level.var_fc1bbaef]](trophysystem);
	}
}

/*
	Name: function_720ddf7f
	Namespace: trophy_system
	Checksum: 0x6228C4E8
	Offset: 0x578
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_720ddf7f(func)
{
	level.var_ccfcde75 = func;
}

/*
	Name: register
	Namespace: trophy_system
	Checksum: 0x551D91EC
	Offset: 0x5A0
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function register()
{
	clientfield::register("missile", "" + #"trophy_system_deploy", 1, 1, "int");
	clientfield::register("missile", "" + #"hash_78a094001c919359", 1, 7, "float");
}

/*
	Name: on_player_killed
	Namespace: trophy_system
	Checksum: 0xFD9F1033
	Offset: 0x630
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function on_player_killed(s_params)
{
	attacker = s_params.eattacker;
	weapon = s_params.weapon;
	if(!isdefined(attacker) || !isdefined(weapon))
	{
		return;
	}
	if(weapon.name == #"trophy_system")
	{
		scoreevents::processscoreevent(#"hash_54e0385adc2f806e", attacker, self, weapon);
	}
}

/*
	Name: createtrophysystemwatcher
	Namespace: trophy_system
	Checksum: 0xE24B2F87
	Offset: 0x6D0
	Size: 0x132
	Parameters: 1
	Flags: None
*/
function createtrophysystemwatcher(watcher)
{
	watcher.ondetonatecallback = &trophysystemdetonate;
	watcher.activatesound = #"wpn_claymore_alert";
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = 1;
	watcher.activationdelay = 0.1;
	watcher.enemydestroy = 1;
	watcher.var_10efd558 = "switched_field_upgrade";
	watcher.onspawn = &ontrophysystemspawn;
	watcher.ondamage = &watchtrophysystemdamage;
	watcher.ondestroyed = &ontrophysystemsmashed;
	watcher.var_994b472b = &function_5a4f1e1e;
	watcher.onstun = &weaponobjects::weaponstun;
	watcher.stuntime = 1;
	watcher.ontimeout = &ontrophysystemsmashed;
}

/*
	Name: function_87af78ed
	Namespace: trophy_system
	Checksum: 0xAC5B09BE
	Offset: 0x810
	Size: 0x5E
	Parameters: 0
	Flags: None
*/
function function_87af78ed()
{
	self endon(#"death", #"hash_340519cc3f2c92c3");
	self util::waittillnotmoving();
	self.trophysystemstationary = 1;
	self notify(#"hash_340519cc3f2c92c3");
}

/*
	Name: ontrophysystemspawn
	Namespace: trophy_system
	Checksum: 0xC4400619
	Offset: 0x878
	Size: 0x24C
	Parameters: 2
	Flags: None
*/
function ontrophysystemspawn(watcher, player)
{
	player endon(#"disconnect");
	level endon(#"game_ended");
	self endon(#"death");
	self useanimtree("generic");
	self weaponobjects::onspawnuseweaponobject(watcher, player);
	self.trophysystemstationary = 0;
	self.weapon = getweapon(#"trophy_system");
	self.var_2d045452 = watcher;
	self.delete_on_death = 1;
	self.var_48d842c3 = 1;
	self.var_515d6dda = 1;
	self setweapon(self.weapon);
	self.ammo = player ammo_get(self.weapon);
	self.var_bf03cf85 = 0;
	self function_619a5c20();
	player stats::function_e24eec31(self.weapon, #"used", 1);
	self thread deployanim();
	self function_87af78ed();
	if(self depthinwater() > 10)
	{
		function_3044fc5();
	}
	self thread trophyactive(player);
	self util::function_c596f193();
	if(isdefined(player))
	{
		player battlechatter::function_fc82b10(getweapon(#"trophy_system"), self.origin, self);
	}
}

/*
	Name: function_5a4f1e1e
	Namespace: trophy_system
	Checksum: 0x3E99BC50
	Offset: 0xAD0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_5a4f1e1e(player)
{
	self thread trophysystemdetonate();
}

/*
	Name: ontrophysystemsmashed
	Namespace: trophy_system
	Checksum: 0x81E4086E
	Offset: 0xB00
	Size: 0x19C
	Parameters: 2
	Flags: None
*/
function ontrophysystemsmashed(attacker, var_61dedb9f)
{
	weaponobjects::function_b4793bda(self, self.weapon);
	self playsound(#"exp_trophy_system");
	var_3c4d4b60 = isdefined(self.owner);
	if(var_3c4d4b60 && isdefined(level.playequipmentdestroyedonplayer))
	{
		self.owner [[level.playequipmentdestroyedonplayer]]();
	}
	if(isdefined(var_61dedb9f) && (!var_3c4d4b60 || self.owner util::isenemyplayer(var_61dedb9f)))
	{
		var_61dedb9f challenges::destroyedequipment();
		scoreevents::processscoreevent(#"destroyed_trophy_system", var_61dedb9f, self.owner, undefined);
		var_f3ab6571 = self.owner weaponobjects::function_8481fc06(self.weapon) > 1;
		self.owner thread globallogic_audio::function_6daffa93(self.weapon, var_f3ab6571);
	}
	self battlechatter::function_d2600afc(var_61dedb9f, self.owner, self.weapon);
	self delete();
}

/*
	Name: trophyactive
	Namespace: trophy_system
	Checksum: 0xCBF4587E
	Offset: 0xCA8
	Size: 0x5E2
	Parameters: 1
	Flags: None
*/
function trophyactive(owner)
{
	owner endon(#"disconnect");
	self endon(#"death", #"hacked");
	traceposition = self.origin + vectorscale((0, 0, 1), 29);
	while(true)
	{
		if(!isdefined(self))
		{
			return;
		}
		if(level.missileentities.size < 1 || isdefined(self.disabled) || is_true(self.isjammed))
		{
			waitframe(1);
			continue;
		}
		waitframe(1);
		missileents = owner getentitiesinrange(level.missileentities, 512, self.origin);
		for(index = 0; index < missileents.size; index++)
		{
			if(!isdefined(self))
			{
				return;
			}
			grenade = missileents[index];
			if(!isdefined(grenade))
			{
				continue;
			}
			if(grenade == self)
			{
				continue;
			}
			if(is_true(grenade.var_8211c733))
			{
				continue;
			}
			if(!grenade.weapon.destroyablebytrophysystem)
			{
				continue;
			}
			if(grenade.destroyablebytrophysystem === 0)
			{
				continue;
			}
			if(grenade.weapon == self.weapon)
			{
				if(is_false(self.trophysystemstationary) && is_true(grenade.trophysystemstationary))
				{
					continue;
				}
			}
			if(!isdefined(grenade.owner))
			{
				grenade.owner = getmissileowner(grenade);
			}
			if(!isdefined(grenade.owner))
			{
				continue;
			}
			if(level.teambased)
			{
				if(!grenade.owner util::isenemyteam(owner.team))
				{
					continue;
				}
			}
			else if(grenade.owner == owner)
			{
				continue;
			}
			var_a3e00632 = bullettracepassed(grenade.origin, traceposition, 0, self, grenade, 0, 1);
			if(!var_a3e00632)
			{
				waitframe(1);
				continue;
			}
			fwd = vectornormalize(grenade.origin - self.origin);
			if(fwd == (0, 0, 0))
			{
				fwd = (1, 0, 0);
			}
			angles = vectortoangles(fwd);
			up = anglestoup(angles);
			distance = distance(grenade.origin, traceposition);
			if(distance > 425)
			{
				fx = #"hash_477d0da44d77c340";
			}
			else
			{
				if(distance > 325)
				{
					fx = #"hash_509348a452bc270b";
				}
				else
				{
					if(distance > 225)
					{
						fx = #"hash_7be30fa46b44c382";
					}
					else
					{
						if(distance > 125)
						{
							fx = #"hash_4f94aa47089274d";
						}
						else
						{
							fx = #"hash_6a2339a461182aac";
						}
					}
				}
			}
			playfx(fx, traceposition, fwd, up);
			self playsound(#"wpn_trophy_shot");
			if(getdvarint(#"player_sustainammo", 0) == 0)
			{
				if(!isdefined(self.ammo))
				{
					self.ammo = 0;
				}
				self.ammo--;
			}
			if(isdefined(level.var_ccfcde75))
			{
				owner thread [[level.var_ccfcde75]](self, grenade);
			}
			owner projectileexplode(grenade, self, fwd, up);
			self.var_bf03cf85++;
			break;
		}
		if(self.ammo <= 0)
		{
			if(self.var_bf03cf85 > 1)
			{
				scoreevents::processscoreevent(#"hash_37f14ae291c32c04", owner, undefined, self.weapon);
				if(self.var_bf03cf85 >= 4)
				{
					owner contracts::function_a54e2068(#"hash_6c0438d5a54313d", 1);
				}
				owner stats::function_622feb0d(self.weapon.name, #"hash_1eed93e0c1faa7cf", 1);
			}
			wait(1.5);
			self thread function_3044fc5();
			return;
		}
	}
}

/*
	Name: projectileexplode
	Namespace: trophy_system
	Checksum: 0xC9F78597
	Offset: 0x1298
	Size: 0x264
	Parameters: 4
	Flags: None
*/
function projectileexplode(projectile, trophy, var_84c1f04c, var_cd148a81)
{
	if(isdefined(self))
	{
		scoreevents::processscoreevent(#"trophy_defense", self, projectile.owner, trophy.weapon);
		self function_3170d645(projectile, trophy);
		self challenges::trophy_defense(projectile.origin, 512);
		if(isdefined(level.var_d3a438fb))
		{
			if([[level.var_d3a438fb]](trophy))
			{
				self stats::function_dad108fa(#"hash_707d06184cf09b50", 1);
			}
		}
		if(self util::is_item_purchased(#"trophy_system"))
		{
			self stats::function_dad108fa(#"destroy_explosive_with_trophy", 1);
		}
		self stats::function_dad108fa(#"hash_37e5b09fc86a64e7", 1);
		self stats::function_622feb0d(#"trophy_system", #"hash_45668719408ee692", 1);
		self stats::function_6fb0b113(#"trophy_system", #"hash_cac64f745e7f76d");
	}
	projposition = projectile.origin;
	playfx(level.trophydetonationfx, projposition, var_84c1f04c, var_cd148a81);
	projectile playsound(#"hash_741683e10b98efd8");
	projectile notify(#"trophy_destroyed");
	if(isdefined(trophy))
	{
		trophy radiusdamage(projposition, 128, 10, 5, self);
	}
	projectile delete();
}

/*
	Name: _the_root_zurich_spawners
	Namespace: trophy_system
	Checksum: 0xA3A30854
	Offset: 0x1508
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function _the_root_zurich_spawners(gameobject, trophy)
{
	return distancesquared(gameobject.origin, trophy.origin) <= math::pow(512, 2);
}

/*
	Name: function_3170d645
	Namespace: trophy_system
	Checksum: 0xD092C7D6
	Offset: 0x1560
	Size: 0x664
	Parameters: 2
	Flags: None
*/
function function_3170d645(projectile, trophy)
{
	player = self;
	entities = getentitiesinradius(trophy.origin, 512);
	var_48b7bfeb = 0;
	for(i = 0; i < entities.size; i++)
	{
		if(!isdefined(self))
		{
			return;
		}
		ent = entities[i];
		if(isdefined(ent.owner) && !ent util::isenemyteam(player.team) && (ent.classname === "noclass" || ent.classname === "script_model" || ent.classname === "script_vehicle" || ent.archetype === #"mp_dog" || ent.archetype === #"human" || isdefined(ent.aitype)) && (ent.item !== level.weaponnone || ent.weapon !== level.weaponnone || ent.meleeweapon !== level.weaponnone || ent.turretweapon !== level.weaponnone) && is_true(ent.takedamage))
		{
			if((isdefined(ent.health) ? ent.health : 0) > 0)
			{
				var_48b7bfeb = 1;
				break;
			}
		}
	}
	if(var_48b7bfeb)
	{
		scoreevents::processscoreevent(#"hash_1ed8a05490cfe606", player, projectile.owner, trophy.weapon);
	}
	if(isdefined(level.flags))
	{
		var_2e36557f = 0;
		foreach(flag in level.flags)
		{
			useobj = flag.useobj;
			if(!isdefined(useobj) || !_the_root_zurich_spawners(useobj, trophy))
			{
				continue;
			}
			var_2e36557f = var_2e36557f | (useobj.userate && (useobj gameobjects::function_4b64b7fd(player.team) || useobj.interactteam === #"hash_33c49a99551acae7"));
			if(var_2e36557f)
			{
				break;
			}
		}
		if(var_2e36557f)
		{
			scoreevents::processscoreevent(#"hash_2f3000a4b38e9235", player, projectile.owner, trophy.weapon);
		}
	}
	if(isdefined(level.zones))
	{
		var_2e36557f = 0;
		foreach(zone in level.zones)
		{
			useobj = zone.gameobject;
			if(!isdefined(useobj) || !_the_root_zurich_spawners(useobj, trophy))
			{
				continue;
			}
			var_2e36557f = var_2e36557f | (useobj.userate && (useobj gameobjects::function_4b64b7fd(player.team) || useobj.interactteam === #"hash_33c49a99551acae7"));
			if(var_2e36557f)
			{
				break;
			}
		}
		if(var_2e36557f)
		{
			scoreevents::processscoreevent(#"hash_2f3000a4b38e9235", player, projectile.owner, trophy.weapon);
		}
	}
	if(isdefined(level.bombzones))
	{
		var_2e36557f = 0;
		foreach(useobj in level.bombzones)
		{
			if(!isdefined(useobj) || !_the_root_zurich_spawners(useobj, trophy))
			{
				continue;
			}
			var_2e36557f = var_2e36557f | (useobj.userate && (useobj gameobjects::function_4b64b7fd(player.team) || useobj.interactteam === #"hash_33c49a99551acae7"));
			if(var_2e36557f)
			{
				break;
			}
		}
		if(var_2e36557f)
		{
			scoreevents::processscoreevent(#"hash_2f3000a4b38e9235", player, projectile.owner, trophy.weapon);
		}
	}
}

/*
	Name: trophydestroytacinsert
	Namespace: trophy_system
	Checksum: 0x6FE4477B
	Offset: 0x1BD0
	Size: 0x14C
	Parameters: 2
	Flags: None
*/
function trophydestroytacinsert(tacinsert, trophy)
{
	self endon(#"death");
	tacpos = tacinsert.origin;
	playfx(level.trophydetonationfx, tacinsert.origin);
	if(isdefined(level.var_ef4e178e))
	{
		tacinsert thread [[level.var_ef4e178e]](self, trophy);
	}
	trophy radiusdamage(tacpos, 128, 105, 10, self);
	scoreevents::processscoreevent(#"trophy_defense", self, undefined, trophy.weapon);
	if(self util::is_item_purchased(#"trophy_system"))
	{
		self stats::function_dad108fa(#"destroy_explosive_with_trophy", 1);
	}
	self function_be7a08a8(trophy.weapon, 1);
}

/*
	Name: trophysystemdetonate
	Namespace: trophy_system
	Checksum: 0x66199016
	Offset: 0x1D28
	Size: 0x18C
	Parameters: 3
	Flags: None
*/
function trophysystemdetonate(attacker, weapon, target)
{
	weaponobjects::function_b4793bda(self, self.weapon);
	if(isdefined(weapon) && self.owner util::isenemyplayer(weapon))
	{
		weapon challenges::destroyedequipment(target);
		scoreevents::processscoreevent(#"destroyed_trophy_system", weapon, self.owner, target);
		self battlechatter::function_d2600afc(weapon, self.owner, self.weapon, target);
		self.owner globallogic_score::function_5829abe3(weapon, target, self.weapon);
		var_f3ab6571 = self.owner weaponobjects::function_8481fc06(self.weapon) > 1;
		self.owner thread globallogic_audio::function_6daffa93(self.weapon, var_f3ab6571);
	}
	playsoundatposition(#"exp_trophy_system", self.origin);
	self delete();
}

/*
	Name: function_3044fc5
	Namespace: trophy_system
	Checksum: 0x75017E9
	Offset: 0x1EC0
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_3044fc5()
{
	weaponobjects::function_f2a06099(self, self.weapon);
	playsoundatposition(#"exp_trophy_system", self.origin);
	self deletedelay();
}

/*
	Name: watchtrophysystemdamage
	Namespace: trophy_system
	Checksum: 0x701A3920
	Offset: 0x1F30
	Size: 0x382
	Parameters: 1
	Flags: None
*/
function watchtrophysystemdamage(watcher)
{
	self endon(#"death");
	self setcandamage(1);
	damagemax = 20;
	if(!self util::ishacked())
	{
		self.damagetaken = 0;
	}
	self.maxhealth = 10000;
	self.health = self.maxhealth;
	self setmaxhealth(self.maxhealth);
	attacker = undefined;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		damage = waitresult.amount;
		type = waitresult.mod;
		weapon = waitresult.weapon;
		attacker = self [[level.figure_out_attacker]](waitresult.attacker);
		damage = weapons::function_74bbb3fa(damage, weapon, self.weapon);
		if(!isplayer(attacker))
		{
			continue;
		}
		if(level.teambased)
		{
			if(!function_f99d2668() && !level.hardcoremode && isdefined(self.owner) && !attacker util::isenemyteam(self.owner.team) && self.owner != attacker)
			{
				continue;
			}
		}
		if(watcher.stuntime > 0 && weapon.dostun)
		{
			self thread weaponobjects::stunstart(watcher, watcher.stuntime);
		}
		if(damage::friendlyfirecheck(self.owner, attacker))
		{
			if(damagefeedback::dodamagefeedback(weapon, attacker))
			{
				attacker damagefeedback::update(waitresult.mod, waitresult.inflictor, undefined, waitresult.weapon, self);
			}
		}
		if(type == "MOD_MELEE" || weapon.isemp || weapon.destroysequipment)
		{
			self.damagetaken = damagemax;
		}
		else
		{
			self.damagetaken = self.damagetaken + damage;
		}
		if(self.damagetaken >= damagemax)
		{
			if(util::function_fbce7263(attacker.team, self.team))
			{
				killstreaks::function_e729ccee(attacker, weapon);
			}
			watcher thread weaponobjects::waitanddetonate(self, 0.05, attacker, weapon);
			return;
		}
	}
}

/*
	Name: ammo_reset
	Namespace: trophy_system
	Checksum: 0x99BF5739
	Offset: 0x22C0
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function ammo_reset()
{
	self._trophy_system_ammo1 = undefined;
	self._trophy_system_ammo2 = undefined;
}

/*
	Name: ammo_get
	Namespace: trophy_system
	Checksum: 0x84E17A58
	Offset: 0x22E0
	Size: 0x86
	Parameters: 1
	Flags: None
*/
function ammo_get(weapon)
{
	totalammo = weapon.ammocountequipment;
	if(isdefined(self._trophy_system_ammo1) && !self util::ishacked())
	{
		totalammo = self._trophy_system_ammo1;
		self._trophy_system_ammo1 = undefined;
		if(isdefined(self._trophy_system_ammo2))
		{
			self._trophy_system_ammo1 = self._trophy_system_ammo2;
			self._trophy_system_ammo2 = undefined;
		}
	}
	return totalammo;
}

/*
	Name: ammo_weapon_pickup
	Namespace: trophy_system
	Checksum: 0xE723F7A7
	Offset: 0x2370
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function ammo_weapon_pickup(ammo)
{
	if(isdefined(ammo))
	{
		if(isdefined(self._trophy_system_ammo1))
		{
			self._trophy_system_ammo2 = self._trophy_system_ammo1;
			self._trophy_system_ammo1 = ammo;
		}
		else
		{
			self._trophy_system_ammo1 = ammo;
		}
	}
}

/*
	Name: deployanim
	Namespace: trophy_system
	Checksum: 0x8093986F
	Offset: 0x23C8
	Size: 0x18C
	Parameters: 0
	Flags: None
*/
function deployanim()
{
	self endon(#"death");
	self setanim(#"hash_70b2041b1f6ad89", 1, 0, 0);
	self clientfield::set("" + #"trophy_system_deploy", 1);
	self waittill(#"hash_340519cc3f2c92c3");
	wait(0.1);
	self setanim(#"hash_70b2041b1f6ad89");
	self clientfield::set("" + #"trophy_system_deploy", 0);
	self playsound(#"wpn_trophy_deploy_start");
	self playloopsound(#"hash_656f8209ae1d1424", 0.25);
	wait(getanimlength(#"hash_70b2041b1f6ad89"));
	self clearanim(#"hash_70b2041b1f6ad89", 0);
	self setanim(#"hash_3c4ee18df7d43dc7", 1, 0, 2);
}

