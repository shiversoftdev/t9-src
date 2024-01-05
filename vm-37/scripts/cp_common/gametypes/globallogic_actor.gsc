#using scripts\weapons\weapon_utils.gsc;
#using script_4ab78e327b76395f;
#using scripts\cp_common\gametypes\globallogic_utils.gsc;
#using scripts\cp_common\gametypes\globallogic.gsc;
#using scripts\cp_common\friendlyfire.gsc;
#using scripts\cp_common\challenges.gsc;
#using scripts\cp_common\bb.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\globallogic\globallogic_player.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ammo_shared.gsc;
#using script_4c5c4a64a59247a2;
#using script_35598499769dbb3d;
#using script_41fe08c37d53a635;

#namespace globallogic_actor;

/*
	Name: callback_actorspawned
	Namespace: globallogic_actor
	Checksum: 0x43499ECC
	Offset: 0x1C0
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function callback_actorspawned(spawner)
{
	self thread spawner::spawn_think(spawner);
	self player::reset_attacker_list();
	bb::logaispawn(self, spawner);
}

/*
	Name: callback_actordamage
	Namespace: globallogic_actor
	Checksum: 0x38646229
	Offset: 0x220
	Size: 0xB04
	Parameters: 15
	Flags: None
*/
function callback_actordamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, modelindex, surfacetype, surfacenormal)
{
	self endon(#"death");
	params = spawnstruct();
	params.einflictor = einflictor;
	params.eattacker = eattacker;
	params.idamage = idamage;
	params.idflags = idflags;
	params.smeansofdeath = smeansofdeath;
	params.weapon = weapon;
	params.vpoint = vpoint;
	params.vdir = vdir;
	params.shitloc = shitloc;
	params.vdamageorigin = vdamageorigin;
	params.psoffsettime = psoffsettime;
	self.idflags = idflags;
	self.idflagstime = gettime();
	eattacker = globallogic_player::figureoutattacker(eattacker);
	if(self.health == self.maxhealth || !isdefined(self.attackers))
	{
		self.attackers = [];
		self.attackerdata = [];
		self.attackerdamage = [];
	}
	same_team = isdefined(eattacker) && (self.team === eattacker.team || util::function_9b7092ef(self.team, eattacker.team));
	if(isdefined(level.friendlyfiredisabled) && !level.friendlyfiredisabled)
	{
		if(isdefined(level.friendlyfiredamagepercentage))
		{
			if(isplayer(eattacker) && same_team)
			{
				idamage = int(idamage * level.friendlyfiredamagepercentage);
				if(idamage < 1)
				{
					idamage = 1;
				}
			}
		}
	}
	if(isdefined(eattacker) && isplayer(eattacker) && (smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_MELEE_WEAPON_BUTT"))
	{
		idamage = idamage * 3;
	}
	idamage = int(idamage);
	unmodified = idamage;
	if(isdefined(self.overrideactordamage))
	{
		idamage = self [[self.overrideactordamage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex);
	}
	else if(isdefined(level.overrideactordamage))
	{
		idamage = self [[level.overrideactordamage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex);
	}
	if(isplayer(eattacker) && eattacker hasperk(#"specialty_immunetrackerspotting") && weapons::isbulletdamage(smeansofdeath))
	{
		idamage = int(idamage * 1.25);
	}
	if(isdefined(self.aioverridedamage))
	{
		for(index = 0; index < self.aioverridedamage.size; index++)
		{
			damagecallback = self.aioverridedamage[index];
			idamage = self [[damagecallback]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex);
		}
	}
	if(idflags & 8192 && idamage < unmodified)
	{
		idamage = unmodified;
	}
	/#
		assert(isdefined(idamage), "");
	#/
	if(!isdefined(vdir))
	{
		idflags = idflags | 4;
	}
	if(isdefined(eattacker))
	{
		if(isplayer(eattacker))
		{
			level thread friendlyfire::friendly_fire_callback(self, idamage, eattacker, smeansofdeath);
			if(isdefined(self.playercausedactordamage))
			{
				self thread [[self.playercausedactordamage]]();
			}
			self thread challenges::actordamaged(eattacker, eattacker, idamage, weapon, shitloc);
			if(isdefined(einflictor) && (eattacker === einflictor || !isvehicle(einflictor)) && (!isdefined(smeansofdeath) || smeansofdeath != "MOD_MELEE_WEAPON_BUTT"))
			{
				eattacker.hits++;
			}
		}
		else if(isai(eattacker))
		{
			if(same_team && smeansofdeath == "MOD_MELEE")
			{
				return;
			}
		}
	}
	actorkilled = 0;
	self thread globallogic_player::trackattackerdamage(eattacker, idamage, smeansofdeath, weapon);
	if(self.health > 0 && (self.health - idamage) <= 0)
	{
		if(isdefined(eattacker) && isplayer(eattacker.driver))
		{
			eattacker = eattacker.driver;
		}
		if(isplayer(eattacker))
		{
			/#
				println((("" + weapon.name) + "") + smeansofdeath);
			#/
			if(!same_team)
			{
				if(smeansofdeath == "MOD_MELEE")
				{
					eattacker notify(#"melee_kill");
				}
			}
		}
		actorkilled = 1;
	}
	if(weapons::isflashorstundamage(weapon, smeansofdeath))
	{
		if(isdefined(self.type))
		{
			if(weapon.isflash && self.type == "human")
			{
				self.lastflashedtime = self.idflagstime;
			}
			else if(weapon.isstun && self.type == "human")
			{
				self.var_189fd299 = self.idflagstime;
			}
		}
		self.laststunnedby = eattacker;
		self.laststunnedtime = self.idflagstime;
	}
	if(weapon.isemp && isdefined(self.type) && self.type == "robot")
	{
		if(weapon.name == #"emp_grenade")
		{
			self.var_e6e7d1c1 = self.idflagstime;
		}
		else if(weapon.name == #"hash_8820860b9c7d979" || weapon.name == #"hash_294001bc58d294f8")
		{
			self.var_cc76f50a = self.idflagstime;
		}
	}
	if(!idflags & 8192)
	{
		if(level.teambased && isdefined(eattacker) && eattacker != self && same_team && !isplayer(eattacker))
		{
			if(level.friendlyfire == 0)
			{
				return;
			}
			if(level.friendlyfire == 1)
			{
				if(idamage < 1)
				{
					idamage = 1;
				}
				self.lastdamagewasfromenemy = 0;
			}
			else
			{
				if(level.friendlyfire == 2)
				{
					return;
				}
				if(level.friendlyfire == 3)
				{
					idamage = int(idamage * 0.5);
					if(idamage < 1)
					{
						idamage = 1;
					}
					self.lastdamagewasfromenemy = 0;
				}
			}
		}
		if(isdefined(eattacker) && eattacker != self)
		{
			if(!isdefined(einflictor) || !isai(einflictor) || (isvehicle(einflictor) && einflictor getseatoccupant(0) === eattacker))
			{
				if(idamage > 0 && !same_team && self.team != #"neutral" && shitloc !== "riotshield" && (self.health - idamage) > 0)
				{
					eattacker thread damagefeedback::update(smeansofdeath, einflictor, undefined, weapon, self, psoffsettime, shitloc, 0);
				}
			}
		}
	}
	self callback::callback(#"on_ai_damage", params);
	self callback::callback(#"on_actor_damage", params);
	function_c10ff087(eattacker, einflictor, weapon, smeansofdeath, idamage);
	bb::logdamage(eattacker, self, weapon, idamage, smeansofdeath, shitloc, actorkilled, actorkilled);
	self globallogic_player::giveattackerandinflictorownerassist(eattacker, einflictor, idamage, smeansofdeath, weapon);
	self finishactordamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, surfacetype, surfacenormal);
}

/*
	Name: callback_actorkilled
	Namespace: globallogic_actor
	Checksum: 0x17D722D7
	Offset: 0xD30
	Size: 0x6E4
	Parameters: 8
	Flags: None
*/
function callback_actorkilled(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	params = spawnstruct();
	params.einflictor = einflictor;
	params.eattacker = eattacker;
	params.idamage = idamage;
	params.smeansofdeath = smeansofdeath;
	params.weapon = weapon;
	params.vdir = vdir;
	params.shitloc = shitloc;
	params.psoffsettime = psoffsettime;
	if(game.state == "postgame")
	{
		return;
	}
	eattacker = globallogic_player::figureoutattacker(eattacker);
	if(globallogic_utils::isheadshot(weapon, shitloc, smeansofdeath, einflictor))
	{
		params.smeansofdeath = "MOD_HEAD_SHOT";
	}
	if(isdefined(eattacker) && eattacker != self)
	{
		if(!isdefined(einflictor) || !isai(einflictor) || (isvehicle(einflictor) && einflictor getseatoccupant(0) === eattacker))
		{
			if(idamage > 0 && self.team != eattacker.team && self.team != #"neutral" && shitloc !== "riotshield")
			{
				eattacker thread damagefeedback::update(smeansofdeath, einflictor, undefined, weapon, self, psoffsettime, shitloc, 1);
			}
		}
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
	self callback::callback(#"on_ai_killed", params);
	self callback::callback(#"on_actor_killed", params);
	if(isdefined(self.aioverridekilled))
	{
		for(index = 0; index < self.aioverridekilled.size; index++)
		{
			killedcallback = self.aioverridekilled[index];
			self [[killedcallback]](einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime);
		}
	}
	player = undefined;
	if(isdefined(eattacker))
	{
		if(isplayer(eattacker))
		{
			player = eattacker;
		}
		else if(isdefined(eattacker.owner) && isplayer(eattacker) && eattacker.classname == "script_vehicle")
		{
			player = eattacker.owner;
		}
	}
	if(isdefined(player) && isplayer(player))
	{
		player notify(#"killed_ai", {#weapon:weapon, #mod:smeansofdeath, #victim:self});
		if(smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_MELEE_ASSASSINATE" || smeansofdeath == "MOD_MELEE_WEAPON_BUTT")
		{
			player.meleekills++;
		}
		if(isdefined(weapon))
		{
			if(weapon.name == #"remote_missile_missile" || weapon.name == #"remote_missile_bomblet")
			{
				if(!isdefined(player.remotemissilebda))
				{
					player.remotemissilebda = 0;
				}
				player.remotemissilebda++;
			}
		}
		self thread ammo::dropaiammo();
		deathtime = gettime();
		deathtimeoffset = 0;
		perks = [];
		killstreaks = globallogic::getkillstreaks(player);
		if(isalive(player))
		{
			if(weapon.isheavyweapon)
			{
				battlechatter::heavyweaponkilllogic(player, weapon, undefined);
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
		if(!is_true(self.disable_score_events))
		{
			if(!level.teambased || self.team != player.pers[#"team"])
			{
				self thread challenges::actorkilled(einflictor, player, idamage, smeansofdeath, weapon, shitloc);
				self actorkilled_awardassists(einflictor, player, weapon, player.team);
			}
		}
	}
}

/*
	Name: callback_actorcloned
	Namespace: globallogic_actor
	Checksum: 0xCD6AE5A3
	Offset: 0x1420
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function callback_actorcloned(original)
{
	destructserverutils::copydestructstate(original, self);
	gibserverutils::copygibstate(original, self);
}

/*
	Name: actorkilled_awardassists
	Namespace: globallogic_actor
	Checksum: 0xE21F6D26
	Offset: 0x1468
	Size: 0xD8
	Parameters: 4
	Flags: None
*/
function actorkilled_awardassists(einflictor, eattacker, weapon, lpattackteam)
{
	pixbeginevent();
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
		}
	}
	pixendevent();
}

/*
	Name: function_c10ff087
	Namespace: globallogic_actor
	Checksum: 0xEC990C5E
	Offset: 0x1548
	Size: 0x7C
	Parameters: 5
	Flags: None
*/
function function_c10ff087(eattacker, einflictor, weapon, meansofdeath, damage)
{
	self endon(#"death", #"disconnect");
	if(isdefined(level._custom_weapon_damage_func))
	{
		self [[level._custom_weapon_damage_func]](eattacker, einflictor, weapon, meansofdeath, damage);
	}
}

