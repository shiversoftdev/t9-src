#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\loadout_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\globallogic\globallogic_player.gsc;
#using script_32c8b5b0eb2854f3;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace globallogic_vehicle;

/*
	Name: function_eaf85217
	Namespace: globallogic_vehicle
	Checksum: 0xC1339B36
	Offset: 0x230
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eaf85217()
{
	level notify(486278477);
}

/*
	Name: callback_vehiclespawned
	Namespace: globallogic_vehicle
	Checksum: 0x6E407EBE
	Offset: 0x250
	Size: 0x344
	Parameters: 1
	Flags: Linked
*/
function callback_vehiclespawned(spawner)
{
	if(self.var_dd74f4a9)
	{
		self.health = self.healthdefault;
	}
	if(isdefined(level.vehicle_main_callback))
	{
		if(isdefined(level.vehicle_main_callback[self.vehicletype]))
		{
			self thread [[level.vehicle_main_callback[self.vehicletype]]]();
		}
		else if(isdefined(self.scriptvehicletype) && isdefined(level.vehicle_main_callback[self.scriptvehicletype]))
		{
			self thread [[level.vehicle_main_callback[self.scriptvehicletype]]]();
		}
	}
	if(isdefined(level.a_str_vehicle_spawn_custom_keys))
	{
		foreach(str_key in level.a_str_vehicle_spawn_custom_keys)
		{
			if(isdefined(spawner))
			{
				if(isdefined(spawner.(str_key)))
				{
					str_value = spawner.(str_key);
				}
			}
			else if(isdefined(self.(str_key)))
			{
				str_value = self.(str_key);
			}
			a_key_spawn_funcs = level.("a_str_vehicle_spawn_key_" + str_key);
			if(isdefined(str_value) && isdefined(a_key_spawn_funcs[str_value]))
			{
				foreach(func in a_key_spawn_funcs[str_value])
				{
					util::single_thread(self, func[#"function"], func[#"param1"], func[#"param2"], func[#"param3"], func[#"param4"]);
				}
			}
		}
	}
	self.spawner = spawner;
	if(issentient(self))
	{
		self spawner::spawn_think(spawner);
	}
	if(self.vehicletype != #"zm_zod_train")
	{
		vehicle::init(self);
	}
	self thread function_a8f929b0();
	vehicle::function_e2a44ff1(self);
	self flag::set(#"vehicle_spawn_setup_complete");
}

/*
	Name: function_a8f929b0
	Namespace: globallogic_vehicle
	Checksum: 0xDADDCBB4
	Offset: 0x5A0
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function function_a8f929b0()
{
	if(isdefined(self.ai_forceslots) && self.ai_forceslots >= 0 && self.ai_forceslots < 2)
	{
		level flag::wait_till("all_players_spawned");
		a_e_players = getplayers(self.team);
		if(isdefined(a_e_players[self.ai_forceslots]))
		{
			self.owner = a_e_players[self.ai_forceslots];
		}
	}
}

/*
	Name: isfriendlyfire
	Namespace: globallogic_vehicle
	Checksum: 0x2FE818EA
	Offset: 0x640
	Size: 0x194
	Parameters: 2
	Flags: Linked
*/
function isfriendlyfire(eself, eattacker)
{
	if(!isdefined(eattacker))
	{
		return false;
	}
	if(isdefined(level.friendlyfire) && level.friendlyfire > 0)
	{
		return false;
	}
	var_b423c7f3 = 1;
	if(isdefined(eself.var_20c71d46) && isdefined(eself.owner) && eself.owner == eattacker)
	{
		var_b423c7f3 = 0;
	}
	if(var_b423c7f3)
	{
		occupant_team = eself vehicle::vehicle_get_occupant_team();
		if(occupant_team != #"none" && occupant_team != #"neutral" && (!util::function_fbce7263(occupant_team, eattacker.team) || util::function_9b7092ef(occupant_team, eattacker.team)))
		{
			return true;
		}
	}
	if(!level.hardcoremode && isdefined(eself.owner) && eself.owner === eattacker.owner && !isdefined(eself.var_20c71d46))
	{
		return true;
	}
	return false;
}

/*
	Name: callback_vehicledamage
	Namespace: globallogic_vehicle
	Checksum: 0x9F7EC84E
	Offset: 0x7E0
	Size: 0xEE4
	Parameters: 16
	Flags: Linked
*/
function callback_vehicledamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	eattacker = globallogic_player::figureoutattacker(eattacker);
	params = spawnstruct();
	params.einflictor = einflictor;
	params.eattacker = eattacker;
	params.idamage = idamage;
	params.idflags = idflags;
	params.smeansofdeath = smeansofdeath;
	params.weapon = weapon;
	params.var_fd90b0bb = var_fd90b0bb;
	params.vpoint = vpoint;
	params.vdir = vdir;
	params.shitloc = shitloc;
	params.vdamageorigin = vdamageorigin;
	params.psoffsettime = psoffsettime;
	params.damagefromunderneath = damagefromunderneath;
	params.modelindex = modelindex;
	params.partname = partname;
	params.vsurfacenormal = vsurfacenormal;
	params.isselfdestruct = eattacker === self || (eattacker === self.owner && self.selfdestruct === 1);
	params.friendlyfire = !params.isselfdestruct && isfriendlyfire(self, eattacker);
	if(!isdefined(self.maxhealth))
	{
		self.maxhealth = self.healthdefault;
	}
	if(gamestate::is_game_over())
	{
		avoid_damage_in_postgame = !sessionmodeismultiplayergame() && !sessionmodeiswarzonegame();
		if(avoid_damage_in_postgame)
		{
			return;
		}
	}
	if(!1 & idflags)
	{
		idamage = loadout::cac_modified_vehicle_damage(self, eattacker, idamage, smeansofdeath, weapon, einflictor);
	}
	if(idamage == 0)
	{
		return;
	}
	if(!isdefined(vdir))
	{
		idflags = idflags | 4;
	}
	self.idflags = idflags;
	self.idflagstime = gettime();
	if(self.health == self.maxhealth || !isdefined(self.attackers))
	{
		self.attackers = [];
		self.attackerdata = [];
		self.attackerdamage = [];
	}
	if(weapon == level.weaponnone && isdefined(einflictor))
	{
		if(isdefined(einflictor.targetname) && einflictor.targetname == "explodable_barrel")
		{
			weapon = getweapon(#"explodable_barrel");
		}
		else if(isdefined(einflictor.destructible_type) && issubstr(einflictor.destructible_type, "vehicle_"))
		{
			weapon = getweapon(#"destructible_car");
		}
	}
	if(smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_GRENADE")
	{
		idamage = idamage * weapon.vehicleprojectiledamagescalar;
	}
	idamage = idamage * level.vehicledamagescalar;
	idamage = idamage * self getvehdamagemultiplier(self.idflags, smeansofdeath, weapon, eattacker);
	if(isdefined(level.var_c31df7cf) && weapon === level.var_c31df7cf && weapons::isexplosivedamage(smeansofdeath) && isdefined(self.var_f22b9fe4) && self.var_f22b9fe4 > 0)
	{
		idamage = int(self.healthdefault / self.var_f22b9fe4);
	}
	idamage = weapons::function_74bbb3fa(idamage, weapon, self);
	idamage = int(idamage);
	unmodified = idamage;
	if(isdefined(einflictor.var_e744cea3))
	{
		idamage = self [[einflictor.var_e744cea3]](einflictor, eattacker, idamage, self.idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
	}
	if(isdefined(self.overridevehicledamage))
	{
		idamage = self [[self.overridevehicledamage]](einflictor, eattacker, idamage, self.idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
	}
	else if(isdefined(level.overridevehicledamage))
	{
		idamage = self [[level.overridevehicledamage]](einflictor, eattacker, idamage, self.idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
	}
	if(isdefined(self.aioverridedamage))
	{
		for(index = 0; index < self.aioverridedamage.size; index++)
		{
			damagecallback = self.aioverridedamage[index];
			idamage = self [[damagecallback]](einflictor, eattacker, idamage, self.idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
		}
	}
	if(self.idflags & 8192 && idamage < unmodified)
	{
		idamage = unmodified;
	}
	/#
		assert(isdefined(idamage), "");
	#/
	if(idamage == 0)
	{
		return;
	}
	damageteammates = 0;
	if(!self.idflags & 8192)
	{
		if(self isvehicleimmunetodamage(smeansofdeath))
		{
			return;
		}
		if(params.friendlyfire)
		{
			if(!allowfriendlyfiredamage(einflictor, eattacker, smeansofdeath, weapon))
			{
				return;
			}
			damageteammates = 1;
		}
	}
	if(idamage < 1)
	{
		idamage = 1;
	}
	params.idamage = int(idamage);
	params.idflags = self.idflags;
	if(issentient(self))
	{
		self callback::callback(#"on_ai_damage", params);
	}
	self callback::callback(#"on_vehicle_damage", params);
	idamage = int(idamage);
	if(isdefined(eattacker) && isplayer(eattacker) && isdefined(eattacker.pers))
	{
		if(!isdefined(eattacker.pers[#"participation"]))
		{
			eattacker.pers[#"participation"] = 0;
		}
		if(gamestate::is_state(#"playing"))
		{
			eattacker.pers[#"participation"]++;
		}
	}
	if(is_true(self.var_39c1458c))
	{
		if(isdefined(self.var_3daa0191))
		{
			self [[self.var_3daa0191]](einflictor, eattacker, idamage, self.idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
		}
		else
		{
			driver = self getseatoccupant(0);
			if(isdefined(driver) && isplayer(driver) && !isbot(driver))
			{
				damagepct = idamage / self.maxhealth;
				damagepct = int(max(damagepct, 3));
				if(isdefined(eattacker) || isdefined(einflictor))
				{
					driver addtodamageindicator(damagepct, vdir);
				}
				else
				{
					driver addtodamageindicator(damagepct, undefined);
				}
			}
			else
			{
				gunner = self getseatoccupant(1);
				if(isdefined(gunner) && isplayer(gunner) && !isbot(gunner))
				{
					damagepct = idamage / self.maxhealth;
					damagepct = int(max(damagepct, 3));
					if(isdefined(eattacker) || isdefined(einflictor))
					{
						gunner addtodamageindicator(damagepct, vdir);
					}
					else
					{
						gunner addtodamageindicator(damagepct, undefined);
					}
				}
			}
		}
	}
	var_5370b15e = (idamage > self.health ? self.health : idamage);
	self globallogic_player::giveattackerandinflictorownerassist(eattacker, einflictor, var_5370b15e, smeansofdeath, weapon, shitloc);
	if(isplayer(eattacker) && isdefined(level.challenges_callback_vehicledamaged))
	{
		self thread [[level.challenges_callback_vehicledamaged]](eattacker, eattacker, idamage, weapon, shitloc);
	}
	selfentnum = self getentitynumber();
	occupants = self getvehoccupants();
	if(isdefined(occupants) && occupants.size > 0)
	{
		if(smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH")
		{
			if(isdefined(self.scriptbundlesettings))
			{
				if(!isdefined(self.settings))
				{
					self.settings = getscriptbundle(self.scriptbundlesettings);
				}
				if(isdefined(self.settings.var_2cc03de3))
				{
					self clientfield::increment("rocket_damage_rumble");
				}
			}
		}
	}
	if(idamage >= self.health && isdefined(einflictor) && einflictor getentitytype() == 4)
	{
		if(isdefined(self.scriptbundlesettings))
		{
			if(!isdefined(self.settings))
			{
				self.settings = getscriptbundle(self.scriptbundlesettings);
			}
			if(isdefined(self.settings.var_45b17e9c) && isdefined(vpoint))
			{
				var_74d40edb = einflictor getvelocity();
				if(lengthsquared(var_74d40edb) > sqr(50))
				{
					var_29edfc10 = vectornormalize(var_74d40edb);
					playfx(self.settings.var_45b17e9c, vpoint, var_29edfc10);
				}
			}
		}
	}
	self finishvehicledamage(einflictor, eattacker, idamage, self.idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, damagefromunderneath, modelindex, partname, damageteammates);
	if(isdefined(eattacker) && (!isdefined(params.isselfdestruct) || !params.isselfdestruct) && self.nodamagefeedback !== 1)
	{
		if(damagefeedback::dodamagefeedback(weapon, einflictor))
		{
			eattacker thread damagefeedback::update(smeansofdeath, einflictor, undefined, weapon, self, psoffsettime, shitloc, 0);
		}
	}
	/#
		if(getdvarint(#"g_debugdamage", 0))
		{
			println(((((((((("" + selfentnum) + "") + self.health) + "") + eattacker.clientid) + "") + isplayer(einflictor) + "") + idamage) + "") + shitloc);
		}
	#/
}

/*
	Name: callback_vehicleradiusdamage
	Namespace: globallogic_vehicle
	Checksum: 0x5E3D5724
	Offset: 0x16D0
	Size: 0x2DC
	Parameters: 13
	Flags: Linked
*/
function callback_vehicleradiusdamage(einflictor, eattacker, idamage, finnerdamage, fouterdamage, idflags, smeansofdeath, weapon, vpoint, fradius, fconeanglecos, vconedir, psoffsettime)
{
	idamage = loadout::cac_modified_vehicle_damage(self, eattacker, idamage, smeansofdeath, weapon, einflictor);
	finnerdamage = loadout::cac_modified_vehicle_damage(self, eattacker, finnerdamage, smeansofdeath, weapon, einflictor);
	fouterdamage = loadout::cac_modified_vehicle_damage(self, eattacker, fouterdamage, smeansofdeath, weapon, einflictor);
	self.idflags = idflags;
	self.idflagstime = gettime();
	isselfdestruct = eattacker === self || (eattacker === self.owner && self.selfdestruct === 1);
	friendlyfire = !isselfdestruct && isfriendlyfire(self, eattacker);
	if(gamestate::is_game_over())
	{
		return;
	}
	if(smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_EXPLOSIVE")
	{
		scalar = weapon.vehicleprojectilesplashdamagescalar;
		idamage = int(idamage * scalar);
		finnerdamage = finnerdamage * scalar;
		fouterdamage = fouterdamage * scalar;
		if(finnerdamage == 0)
		{
			return;
		}
	}
	idamage = idamage * self getvehdamagemultiplier(self.idflags, smeansofdeath, weapon);
	idamage = int(idamage);
	if(idamage == 0)
	{
		return;
	}
	if(!self.idflags & 8192)
	{
		if(self isvehicleimmunetodamage(smeansofdeath))
		{
			return;
		}
		if(friendlyfire)
		{
			if(!allowfriendlyfiredamage(einflictor, eattacker, smeansofdeath, weapon))
			{
				return;
			}
		}
	}
	if(idamage < 1)
	{
		idamage = 1;
	}
	self finishvehicleradiusdamage(einflictor, eattacker, idamage, finnerdamage, fouterdamage, self.idflags, smeansofdeath, weapon, vpoint, fradius, fconeanglecos, vconedir, psoffsettime);
}

/*
	Name: callback_vehiclekilled
	Namespace: globallogic_vehicle
	Checksum: 0xAC4C2620
	Offset: 0x19B8
	Size: 0x81C
	Parameters: 8
	Flags: Linked
*/
function callback_vehiclekilled(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	if(gamestate::is_game_over())
	{
		return;
	}
	params = spawnstruct();
	params.einflictor = einflictor;
	params.eattacker = eattacker;
	params.idamage = idamage;
	params.smeansofdeath = smeansofdeath;
	params.weapon = weapon;
	params.vdir = vdir;
	params.shitloc = shitloc;
	params.psoffsettime = psoffsettime;
	params.occupants = self getvehoccupants();
	eattacker = globallogic_player::figureoutattacker(eattacker);
	if(isdefined(eattacker) && isplayer(eattacker) && !is_true(level.var_7c6454))
	{
		globallogic_score::inctotalkills(eattacker.team);
		eattacker thread globallogic_score::givekillstats(smeansofdeath, weapon, self);
	}
	if(isai(eattacker) && isdefined(eattacker.script_owner))
	{
		if(eattacker.script_owner.team != self.team)
		{
			eattacker = eattacker.script_owner;
		}
	}
	if(isdefined(eattacker) && isdefined(eattacker.onkill))
	{
		eattacker [[eattacker.onkill]](self);
	}
	if(isdefined(einflictor))
	{
		self.damageinflictor = einflictor;
	}
	if(issentient(self))
	{
		self callback::callback(#"on_ai_killed", params);
	}
	self callback::callback(#"on_vehicle_killed", params);
	if(isdefined(self.overridevehiclekilled))
	{
		self [[self.overridevehiclekilled]](einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime);
	}
	if(isdefined(einflictor.var_3f9bd15))
	{
		self [[einflictor.var_3f9bd15]](einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, params.occupants);
	}
	player = eattacker;
	if(isdefined(eattacker) && isdefined(eattacker.classname) && eattacker.classname == "script_vehicle" && isdefined(eattacker.owner))
	{
		player = eattacker.owner;
	}
	if(sessionmodeiscampaigngame())
	{
		if(isdefined(player) && isplayer(player) && isalive(player))
		{
			if(weapon.isheavyweapon)
			{
				battlechatter::heavyweaponkilllogic(eattacker, weapon, undefined);
			}
			else
			{
				enemykilled_cooldown = "enemy_killed_vo_" + string(player.team);
				if(level util::iscooldownready(enemykilled_cooldown))
				{
					level util::cooldown(enemykilled_cooldown, 4);
					player battlechatter::play_dialog("killenemy", 1);
					level util::addcooldowntime(enemykilled_cooldown, 4);
				}
			}
		}
		if(isdefined(player) && isplayer(player) && !is_true(self.disable_score_events))
		{
			if(!level.teambased || util::function_fbce7263(self.team, player.pers[#"team"]))
			{
				if(smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_MELEE_ASSASSINATE")
				{
					scoreevents::processscoreevent(#"melee_kill" + self.scoretype, player, self, weapon);
				}
				else
				{
					scoreevents::processscoreevent(#"kill" + self.scoretype, player, self, weapon);
				}
				if(isdefined(level.challenges_callback_vehiclekilled))
				{
					self thread [[level.challenges_callback_vehiclekilled]](einflictor, player, idamage, smeansofdeath, weapon, shitloc);
				}
				self vehiclekilled_awardassists(einflictor, eattacker, weapon, eattacker.team);
			}
		}
		if(isdefined(eattacker) && (!isdefined(params.isselfdestruct) || !params.isselfdestruct) && (!isdefined(self.nodamagefeedback) || self.nodamagefeedback !== 1))
		{
			if(damagefeedback::dodamagefeedback(weapon, einflictor))
			{
				eattacker thread damagefeedback::update(smeansofdeath, einflictor, undefined, weapon, self, psoffsettime, shitloc, 0);
			}
		}
	}
	else
	{
		if(isdefined(level.challenges_callback_vehiclekilled))
		{
			self thread [[level.challenges_callback_vehiclekilled]](einflictor, player, idamage, smeansofdeath, weapon, shitloc);
		}
		if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
		{
			if(isplayer(player))
			{
				vehicleteam = undefined;
				if(isdefined(self.team))
				{
					if(self.team != #"neutral")
					{
						vehicleteam = self.team;
					}
					else if(isdefined(self.var_37f0c900))
					{
						if(self.var_37f0c900.time == gettime())
						{
							vehicleteam = self.var_37f0c900.team;
						}
						self.var_37f0c900 = undefined;
					}
				}
				if(isdefined(vehicleteam) && util::function_fbce7263(vehicleteam, player.pers[#"team"]))
				{
					if(self.weapon.var_62c1bfaa !== 1)
					{
						player stats::function_a431be09(weapon);
						if(player function_6c32d092(#"talent_engineer"))
						{
							scoreevents::processscoreevent(#"hash_78f6e45d08abe0db", player);
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_67e86f71
	Namespace: globallogic_vehicle
	Checksum: 0x85509A36
	Offset: 0x21E0
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function function_67e86f71(vec)
{
	inverse = 0.05681818;
	return (vec[0] * inverse, vec[1] * inverse, vec[2] * inverse);
}

/*
	Name: function_621234f9
	Namespace: globallogic_vehicle
	Checksum: 0xB062C9E4
	Offset: 0x2230
	Size: 0x2BC
	Parameters: 2
	Flags: Linked
*/
function function_621234f9(eattacker, einflictor)
{
	vehicle = einflictor;
	if(!isvehicle(vehicle))
	{
		vehicle = eattacker;
	}
	if(isvehicle(vehicle))
	{
		if(isdefined(self) && is_true(self.var_6cdeac5e) && is_true(vehicle.var_2b60f92f))
		{
			return;
		}
		velocity = function_67e86f71(vehicle getvelocity());
		speedscale = length(velocity) / 30;
		forwardvec = vectornormalize(velocity);
		upvec = (0, 0, 1);
		leftvec = vectornormalize(vectorcross(upvec, forwardvec));
		var_d264a58b = speedscale * randomfloatrange(50, 65);
		upscale = speedscale * randomfloatrange(35, 55);
		var_175cbf21 = speedscale * (randomfloatrange(-25, 25));
		force = (velocity + (forwardvec * var_d264a58b)) + (upvec * upscale) + (leftvec * var_175cbf21);
		var_3e6c815d = length(force);
		force = vectornormalize(force) * math::clamp(var_3e6c815d, 5, 250);
		waitframe(2);
		if(isdefined(self))
		{
			self startragdoll();
			self launchragdoll(force);
		}
	}
}

/*
	Name: vehiclecrush
	Namespace: globallogic_vehicle
	Checksum: 0xBE8A9235
	Offset: 0x24F8
	Size: 0xCC
	Parameters: 2
	Flags: None
*/
function vehiclecrush(eattacker, einflictor)
{
	self endon(#"disconnect");
	if(isdefined(level._effect) && isdefined(level._effect[#"tanksquish"]))
	{
		playfx(level._effect[#"tanksquish"], self.origin + vectorscale((0, 0, 1), 30));
	}
	self playsound(#"chr_crunch");
	self thread function_621234f9(eattacker, einflictor);
}

/*
	Name: allowfriendlyfiredamage
	Namespace: globallogic_vehicle
	Checksum: 0x86F7BF81
	Offset: 0x25D0
	Size: 0x9A
	Parameters: 4
	Flags: Linked
*/
function allowfriendlyfiredamage(einflictor, eattacker, smeansofdeath, weapon)
{
	if(getdvarint(#"g_vehiclebypassfriendlyfire", 0) != 0)
	{
		return 1;
	}
	if(is_true(self.skipfriendlyfirecheck))
	{
		return 1;
	}
	if(isdefined(self.allowfriendlyfiredamageoverride))
	{
		return [[self.allowfriendlyfiredamageoverride]](einflictor, eattacker, smeansofdeath, weapon);
	}
	return 0;
}

/*
	Name: vehiclekilled_awardassists
	Namespace: globallogic_vehicle
	Checksum: 0x3EA415D1
	Offset: 0x2678
	Size: 0x184
	Parameters: 4
	Flags: Linked
*/
function vehiclekilled_awardassists(einflictor, eattacker, weapon, lpattackteam)
{
	if(!isdefined(self.scoretype) || self.scoretype == "none")
	{
		return;
	}
	if(isdefined(self.attackers))
	{
		for(j = 0; j < self.attackers.size; j++)
		{
			player = self.attackers[j];
			if(!isdefined(player))
			{
				continue;
			}
			if(player == weapon)
			{
				continue;
			}
			if(player.team != lpattackteam)
			{
				continue;
			}
			damage_done = self.attackerdamage[player.clientid].damage;
			time = self.attackerdamage[player.clientid].time;
			meansofdeath = self.attackerdamage[player.clientid].meansofdeath;
			player thread globallogic_score::processassist(self, damage_done, self.attackerdamage[player.clientid].weapon, "assist" + self.scoretype, time, meansofdeath);
		}
	}
}

