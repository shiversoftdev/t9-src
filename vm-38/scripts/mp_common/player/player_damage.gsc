#using scripts\mp_common\vehicle.gsc;
#using scripts\mp_common\bb.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\core_common\armor.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using script_725554a59d6a75b9;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\weapons\weapons.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using script_6167e26342be354b;
#using script_44b0b8420eabacad;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\globallogic\globallogic_player.gsc;
#using script_32c8b5b0eb2854f3;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\burnplayer.gsc;
#using script_396f7d71538c9677;
#using scripts\abilities\ability_util.gsc;
#using scripts\abilities\ability_power.gsc;
#using scripts\abilities\ability_player.gsc;

#namespace player_damage;

/*
	Name: function_c523bfb7
	Namespace: player_damage
	Checksum: 0xD4646696
	Offset: 0x5B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c523bfb7()
{
	level notify(-1586984048);
}

#namespace player;

/*
	Name: callback_playerdamage
	Namespace: player
	Checksum: 0xDF534D9E
	Offset: 0x5D0
	Size: 0x121C
	Parameters: 14
	Flags: Linked
*/
function callback_playerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal)
{
	profilelog_begintiming(6, "ship");
	if(function_b5dadafc(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal))
	{
		return;
	}
	if(self getinvulnerability())
	{
		return;
	}
	do_post_game_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
	self.idflags = idflags;
	self.idflagstime = gettime();
	if(!isplayer(eattacker) && isdefined(eattacker) && eattacker.owner === self)
	{
		treat_self_damage_as_friendly_fire = eattacker.treat_owner_damage_as_friendly_fire;
	}
	ignore_round_start_friendly_fire = isdefined(einflictor) && smeansofdeath == "MOD_CRUSH" || smeansofdeath == "MOD_HIT_BY_OBJECT";
	eattacker = figure_out_attacker(eattacker);
	if(isplayer(eattacker) && is_true(eattacker.laststand) && einflictor === eattacker)
	{
		return;
	}
	smeansofdeath = modify_player_damage_meansofdeath(einflictor, eattacker, smeansofdeath, weapon, shitloc);
	if(!self should_do_player_damage(eattacker, einflictor, weapon, smeansofdeath, idflags))
	{
		return;
	}
	update_attacker(einflictor, eattacker, smeansofdeath);
	weapon = function_f4f77cfb(weapon, einflictor);
	pixbeginevent();
	if(!isdefined(vdir))
	{
		idflags = idflags | 4;
	}
	attackerishittingteammate = isplayer(eattacker) && self util::isenemyplayer(eattacker) == 0;
	attackerishittingself = isplayer(eattacker) && self == eattacker;
	friendlyfire = attackerishittingself && treat_self_damage_as_friendly_fire === 1 || (level.teambased && !attackerishittingself && attackerishittingteammate);
	pixendevent();
	idamage = modify_player_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex);
	if(friendlyfire)
	{
		idamage = modify_player_damage_friendlyfire(idamage, eattacker);
	}
	if(shitloc == "riotshield")
	{
		riotshield_hit(einflictor, eattacker, idamage, smeansofdeath, weapon, attackerishittingteammate, vdir);
		if(isdefined(eattacker) && !attackerishittingself && (isalive(eattacker) || eattacker util::isusingremote()))
		{
			if(damagefeedback::dodamagefeedback(weapon, einflictor, idamage, smeansofdeath))
			{
				if(idamage > 0)
				{
					dofeedback = 0;
					armorbroke = is_true(self.var_426947c4);
					if(self.health > 0)
					{
						dofeedback = 1;
					}
					else if(self.health == 0 && self armor::get_armor() > 0)
					{
						dofeedback = 1;
						armorbroke = 1;
					}
					if(dofeedback)
					{
						perkfeedback = function_e512b988(self, weapon, smeansofdeath, einflictor, idflags & 2048, armorbroke);
					}
				}
				eattacker thread damagefeedback::update(smeansofdeath, einflictor, perkfeedback, weapon, self, psoffsettime, shitloc, 0, idflags);
			}
		}
	}
	idamage = self does_player_completely_avoid_damage(idflags, shitloc, weapon, friendlyfire, attackerishittingself, smeansofdeath, vpoint, idamage, einflictor, eattacker);
	if(!isdefined(idamage) || idamage == 0)
	{
		if(weapons::isbulletdamage(smeansofdeath) && randomfloatrange(0, 1) > 0.5)
		{
			if((isdefined(self.var_b6247681) ? self.var_b6247681 : 0) < gettime())
			{
				self battlechatter::play_dialog("takingFriendlyFire", 1);
				self.var_b6247681 = gettime() + (int(battlechatter::mpdialog_value("FriendlyFireWarningCooldown", 7) * 1000));
			}
		}
		return;
	}
	if(isplayer(eattacker) && !weapons::ismeleemod(smeansofdeath))
	{
		var_8f516911 = function_b576d3d(weapon, shitloc);
		idamage = idamage * var_8f516911;
		eattacker util::function_f7fe3c5(shitloc);
	}
	var_f16d7bc8 = (isdefined(self.armor) ? self.armor : 0);
	armor_damage = apply_damage_to_armor(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, shitloc, friendlyfire, ignore_round_start_friendly_fire);
	idamage = armor_damage.idamage;
	idflags = armor_damage.idflags;
	idamage = function_74a5d514(eattacker, idamage, smeansofdeath, weapon, shitloc);
	idamage = make_sure_damage_is_not_zero(idamage, idflags & 2048);
	params = {#vsurfacenormal:vsurfacenormal, #boneindex:boneindex, #vdamageorigin:vdamageorigin, #vpoint:vpoint, #idflags:idflags, #shitloc:shitloc, #vdir:vdir, #hash_fd90b0bb:var_fd90b0bb, #weapon:weapon, #smeansofdeath:smeansofdeath, #idamage:idamage, #eattacker:eattacker, #einflictor:einflictor};
	self callback::callback(#"on_player_damage", params);
	if(is_true(params.overridedamage))
	{
		idamage = params.idamage;
	}
	if(self laststand::player_is_in_laststand())
	{
		self notify(#"laststand_damage", params);
		self.health++;
		idamage = 1;
	}
	if(shitloc == "riotshield")
	{
		shitloc = "none";
	}
	if(!function_104e1126(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex))
	{
		return;
	}
	prevhealthratio = self.health / self.maxhealth;
	fatal = 0;
	if(friendlyfire)
	{
		pixmarker("BEGIN: PlayerDamage player");
		if(function_1727a023(ignore_round_start_friendly_fire, eattacker))
		{
			self.lastdamagewasfromenemy = 0;
			fatal = self function_961fe569(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
		}
		var_86f19cfe = 0;
		if(level.friendlyfire == 4 && is_true(eattacker.var_e03ca8a5))
		{
			var_86f19cfe = 1;
			eattacker.var_e03ca8a5 = undefined;
		}
		if(!var_86f19cfe && function_44b6bb92(eattacker, ignore_round_start_friendly_fire))
		{
			eattacker.lastdamagewasfromenemy = 0;
			eattacker.friendlydamage = 1;
			fatal = eattacker function_961fe569(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
			eattacker.friendlydamage = undefined;
		}
		if(attackerishittingteammate)
		{
			if(fatal === 1 && randomfloatrange(0, 1) < 0.25)
			{
				eattacker battlechatter::play_dialog("KilledFriendly", 1);
				var_57fce7c = function_8c4b101f(eattacker.team, eattacker.origin, 200);
				foreach(teammate in var_57fce7c)
				{
					if(teammate != eattacker && teammate != self)
					{
						teammate battlechatter::play_dialog("KilledFriendlyReaction", 1);
						break;
					}
				}
			}
		}
		pixmarker("END: PlayerDamage player");
	}
	else
	{
		self.lastattackweapon = weapon;
		var_5370b15e = (idamage > self.health ? self.health : idamage);
		globallogic_player::giveattackerandinflictorownerassist(eattacker, einflictor, var_5370b15e, smeansofdeath, weapon, shitloc);
		globallogic_player::function_efd02c1d(einflictor);
		if(isdefined(eattacker))
		{
			level.lastlegitimateattacker = eattacker;
		}
		if(smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" && isdefined(einflictor) && isdefined(einflictor.iscooked))
		{
			self.wascooked = gettime();
		}
		else
		{
			self.wascooked = undefined;
		}
		self.lastdamagewasfromenemy = isdefined(eattacker) && eattacker != self;
		if(self.lastdamagewasfromenemy && isdefined(self.clientid))
		{
			if(isplayer(eattacker))
			{
				if(!isdefined(eattacker.damagedplayers))
				{
					eattacker.damagedplayers = [];
				}
				if(!isdefined(eattacker.damagedplayers[self.clientid]))
				{
					eattacker.damagedplayers[self.clientid] = spawnstruct();
				}
				eattacker.damagedplayers[self.clientid].time = gettime();
				eattacker.damagedplayers[self.clientid].entity = self;
			}
		}
		if(isplayer(eattacker) && isdefined(weapon.gadget_type) && weapon.gadget_type == 11)
		{
			if(isdefined(eattacker.heavyweaponhits))
			{
				eattacker.heavyweaponhits++;
			}
		}
		fatal = self function_961fe569(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
	}
	self.var_e2e8198f = gettime();
	if(isdefined(eattacker))
	{
		eattacker.var_e03e3ae5 = gettime();
		if(!isdefined(eattacker.var_4a755632))
		{
			eattacker.var_4a755632 = [];
		}
		if(!isdefined(eattacker.var_4a755632[self.clientid]))
		{
			eattacker.var_4a755632[self.clientid] = spawnstruct();
		}
		eattacker.var_4a755632[self.clientid].entity = self;
		eattacker.var_4a755632[self.clientid].lastdamagedtime = gettime();
		squad_spawn::onplayerdamaged(self, eattacker);
	}
	if(isdefined(eattacker) && !attackerishittingself && (isalive(eattacker) || eattacker util::isusingremote()))
	{
		if(damagefeedback::dodamagefeedback(weapon, einflictor, idamage, smeansofdeath))
		{
			if(idamage > 0)
			{
				dofeedback = 0;
				armorbroke = is_true(self.var_426947c4);
				if(self.health > 0)
				{
					dofeedback = 1;
				}
				else if(self.health == 0 && self armor::get_armor() > 0)
				{
					dofeedback = 1;
					armorbroke = 1;
				}
				if(dofeedback)
				{
					perkfeedback = function_e512b988(self, weapon, smeansofdeath, einflictor, idflags & 2048, armorbroke);
				}
			}
			eattacker thread damagefeedback::update(smeansofdeath, einflictor, perkfeedback, weapon, self, psoffsettime, shitloc, fatal, idflags);
		}
	}
	if(isalive(self))
	{
		if(!isdefined(eattacker) || !friendlyfire || is_true(level.hardcoremode))
		{
			if(!isdefined(var_f16d7bc8) || var_f16d7bc8 == 0 || (weapons::isheadshot(weapon, shitloc, smeansofdeath) && !self armor::has_helmet()))
			{
				self battlechatter::pain_vox(smeansofdeath, weapon);
			}
		}
		if(!friendlyfire)
		{
			killstreaks::function_e729ccee(eattacker, weapon);
		}
	}
	self.hasdonecombat = 1;
	if(weapon.isemp && smeansofdeath == "MOD_GRENADE_SPLASH" && !isdefined(weapon.var_13600e25))
	{
		if(!self hasperk(#"specialty_immuneemp"))
		{
			self notify(#"emp_grenaded", {#position:vpoint, #attacker:eattacker});
		}
	}
	if(isdefined(eattacker) && eattacker != self && !friendlyfire)
	{
		spawning::function_7a87efaa();
	}
	player_damage_log(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex);
	profilelog_endtiming(6, "gs=" + game.state);
}

/*
	Name: function_f5cfe2b4
	Namespace: player
	Checksum: 0x4F78CE91
	Offset: 0x17F8
	Size: 0x1D2
	Parameters: 4
	Flags: None
*/
function function_f5cfe2b4(einflictor, eattacker, idamage, idflags)
{
	if(!sessionmodeiswarzonegame())
	{
		return;
	}
	var_4e3e876f = (isdefined(getgametypesetting(#"hash_67b94d37f2e44ee2")) ? getgametypesetting(#"hash_67b94d37f2e44ee2") : 0);
	if(var_4e3e876f <= 0)
	{
		return;
	}
	if(isdefined(idamage) && isplayer(idamage) && isalive(idamage))
	{
		if(isplayer(self) && self util::isenemyteam(idamage.team))
		{
			return;
		}
		if(idamage.health !== idamage.maxhealth)
		{
			idamage playsoundtoplayer(#"chr_vampire", idamage);
		}
		var_2be81a5b = (idflags * var_4e3e876f) / 100;
		newhealth = idamage.health + var_2be81a5b;
		idamage.health = int(math::clamp(newhealth, 0, max(idamage.health, idamage.maxhealth)));
	}
}

/*
	Name: function_74a5d514
	Namespace: player
	Checksum: 0x89FA3002
	Offset: 0x19D8
	Size: 0x1A0
	Parameters: 5
	Flags: Linked
*/
function function_74a5d514(eattacker, idamage, smeansofdeath, weapon, shitloc)
{
	meleedamage = weapon === "MOD_MELEE" || weapon === "MOD_MELEE_WEAPON_BUTT" || weapon === "MOD_MELEE_ASSASSINATE";
	if(isdefined(idamage) && isplayer(idamage) && meleedamage && idamage hasperk(#"specialty_brawler"))
	{
		smeansofdeath = int(smeansofdeath * 4);
		new_health = idamage.health + 50;
		idamage.health = int(math::clamp(new_health, 0, max(idamage.health, idamage.maxhealth)));
		params = getstatuseffect(#"deaf_tinnitus");
		self status_effect::status_effect_apply(params, shitloc, idamage);
	}
	return smeansofdeath;
}

/*
	Name: function_31f333c6
	Namespace: player
	Checksum: 0xDB129E46
	Offset: 0x1B80
	Size: 0xAE
	Parameters: 3
	Flags: Private
*/
function private function_31f333c6(einflictor, eattacker, weapon)
{
	if(isplayer(einflictor))
	{
		return true;
	}
	if(!isplayer(eattacker))
	{
		return false;
	}
	if(isvehicle(einflictor))
	{
		return false;
	}
	if(weapon.isprimary)
	{
		return true;
	}
	if(weapon.isheroweapon)
	{
		return true;
	}
	if(weapon.islauncher)
	{
		return true;
	}
	return false;
}

/*
	Name: function_a31ab50c
	Namespace: player
	Checksum: 0x11EA66F4
	Offset: 0x1C38
	Size: 0x82
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a31ab50c(var_7c61c7a1)
{
	var_ce3cee3a = (self.var_a8b1ce45 === gettime() ? self.var_20038876 : 0);
	var_752c0834 = int(max(var_7c61c7a1, var_ce3cee3a));
	self.var_20038876 = var_752c0834;
	self.var_a8b1ce45 = gettime();
	return var_752c0834;
}

/*
	Name: function_961fe569
	Namespace: player
	Checksum: 0xE12FE905
	Offset: 0x1CC8
	Size: 0x107A
	Parameters: 14
	Flags: Linked, Private
*/
function private function_961fe569(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal)
{
	pixbeginevent();
	if(!level.console && idflags & 8 && isplayer(eattacker))
	{
		/#
			println(((((((((("" + self getentitynumber()) + "") + self.health) + "") + eattacker.clientid) + "") + isplayer(einflictor) + "") + idamage) + "") + shitloc);
		#/
		eattacker stats::function_dad108fa(#"penetration_shots", 1);
	}
	if(getdvarstring(#"scr_csmode") != "")
	{
		self shellshock(#"damage_mp", 0.2);
	}
	self function_a774b4ed(eattacker, einflictor, weapon, smeansofdeath, idamage);
	self ability_power::power_loss_event_took_damage(eattacker, einflictor, weapon, smeansofdeath, idamage);
	if(isplayer(eattacker))
	{
		self.lastshotby = eattacker.clientid;
	}
	if(smeansofdeath == "MOD_BURNED")
	{
		self burnplayer::takingburndamage(eattacker, weapon, smeansofdeath);
	}
	else
	{
		if(smeansofdeath == "MOD_DEATH_CIRCLE")
		{
			vdir = undefined;
		}
		else if(smeansofdeath == "MOD_BLED_OUT")
		{
			vdir = undefined;
		}
	}
	self.gadget_was_active_last_damage = self gadgetisactive(0);
	isexplosivedamage = weapons::isexplosivedamage(smeansofdeath);
	var_f727da4 = 0;
	if(isdefined(einflictor) && isdefined(einflictor.stucktoplayer) && einflictor.stucktoplayer == self)
	{
		var_f727da4 = 1;
	}
	if(isexplosivedamage && idamage > 0 && (weapon.explosioninnerdamage > 1 || (isdefined(einflictor) && einflictor.var_9d992ed1 === 1)))
	{
		var_771902ea = status_effect::function_3c54ae98(3);
		if(level.hardcoremode && !weapon.ignoresflakjacket && self hasperk(#"specialty_flakjacket"))
		{
			var_771902ea = max(var_771902ea, 0.91);
		}
		var_81ccea1a = 1;
		if(var_81ccea1a && !var_f727da4 && weapon != getweapon(#"hero_pineapplegun"))
		{
			idamage = int(idamage * (1 - var_771902ea));
		}
		var_677cfdb0 = getstatuseffect("explosive_damage");
		status_effect::status_effect_apply(var_677cfdb0, weapon, eattacker);
	}
	if(isdefined(eattacker) && self != eattacker)
	{
		damagedone = idamage;
		if(self.health < damagedone)
		{
			damagedone = self.health;
		}
		if(isplayer(eattacker) && self util::isenemyteam(eattacker.team))
		{
			if(!isdefined(eattacker.damagedone))
			{
				eattacker.damagedone = 0;
			}
			eattacker.damagedone = eattacker.damagedone + damagedone;
			eattacker.pers[#"damagedone"] = eattacker.damagedone;
			eattacker weapons::function_b1d41bd5(weapon, damagedone);
			eattacker contracts::player_contract_event(#"damagedone", damagedone);
			eattacker stats::function_bb7eedf0(#"total_damage", int(damagedone));
			eattacker stats::function_b7f80d87(#"total_damage", int(damagedone));
			if(level.hardcoremode === 1)
			{
				eattacker stats::function_dad108fa(#"hash_7175d03d46c6d815", int(damagedone));
			}
			eattacker function_ef823e71(1, eattacker.pers[#"damagedone"]);
			if(!sessionmodeiswarzonegame())
			{
				if(gamemodeisarena())
				{
					total_damage = (isdefined(eattacker stats::get_stat(#"playerstatsbygametype", level.var_12323003, #"total_damage", #"arenavalue")) ? eattacker stats::get_stat(#"playerstatsbygametype", level.var_12323003, #"total_damage", #"arenavalue") : 0) + (isdefined(damagedone) ? damagedone : 0);
					eattacker stats::set_stat(#"playerstatsbygametype", level.var_12323003, #"total_damage", #"arenavalue", total_damage);
				}
				else
				{
					total_damage = (isdefined(eattacker stats::get_stat(#"playerstatsbygametype", level.var_12323003, #"total_damage", #"statvalue")) ? eattacker stats::get_stat(#"playerstatsbygametype", level.var_12323003, #"total_damage", #"statvalue") : 0) + (isdefined(damagedone) ? damagedone : 0);
					eattacker stats::set_stat(#"playerstatsbygametype", level.var_12323003, #"total_damage", #"statvalue", total_damage);
				}
			}
			if(smeansofdeath === "MOD_HEAD_SHOT" && !killstreaks::is_killstreak_weapon(weapon))
			{
				eattacker stats::function_dad108fa(#"headshot_damage", int(damagedone));
			}
		}
	}
	is_melee = weapons::ismeleemod(smeansofdeath);
	var_8c8cca9b = function_f74d2943(weapon, 6);
	var_e31583b3 = isdefined(var_8c8cca9b) && !is_melee;
	dot_params = function_f74d2943(weapon, 7);
	var_7e7a6e97 = isdefined(dot_params) && !is_melee;
	if(isdefined(self.var_213b4a61) && (smeansofdeath == "MOD_BURNED" || smeansofdeath == "MOD_DOT") || var_e31583b3 && self !== eattacker)
	{
		var_9277fb8e = idamage;
		if(self.var_e00c085f === gettime())
		{
			var_9277fb8e = var_9277fb8e + self.var_9277fb8e;
		}
		var_e6544856 = max(self.maxhealth, self.health);
		var_7c61c7a1 = (var_e6544856 - self.health) + var_9277fb8e;
		var_56712f4 = self function_401b9b57();
		var_62b80170 = var_e6544856 - var_56712f4;
		if(var_7c61c7a1 > var_62b80170)
		{
			var_7c61c7a1 = var_62b80170;
		}
		self.var_e00c085f = gettime();
		self.var_9277fb8e = var_9277fb8e;
		if(isdefined(self.var_4dcf932b))
		{
			params = getstatuseffect("wound_radiation");
		}
		else
		{
			if(isdefined(self.var_e8bb749a))
			{
				params = getstatuseffect("shock_rifle_shock");
			}
			else
			{
				if(var_7e7a6e97)
				{
					params = dot_params;
				}
				else
				{
					if(var_e31583b3)
					{
						params = var_8c8cca9b;
					}
					else
					{
						params = getstatuseffect("wound");
					}
				}
			}
		}
		if(!is_true(params.var_d8e9a175) && (!isdefined(self.var_4dcf932b) || self.var_4dcf932b != self))
		{
			params.var_4df0ea83 = smeansofdeath != "MOD_DOT";
			if(params.setype == 6)
			{
				params.var_752c0834 = function_a31ab50c(var_7c61c7a1);
				params.var_4df0ea83 = 1;
				self.var_abe2db87 = 1;
			}
			self status_effect::status_effect_apply(params, weapon, eattacker, 0);
			var_284f3c1a = params.setype == 6;
			if(var_7e7a6e97 && !var_284f3c1a)
			{
				wound_params = (var_e31583b3 ? var_8c8cca9b : getstatuseffect("wound"));
				wound_params.var_752c0834 = function_a31ab50c(var_7c61c7a1);
				self.var_abe2db87 = 1;
				self status_effect::status_effect_apply(wound_params, weapon, eattacker, 0);
			}
		}
		if(is_true(params.var_73c88af2))
		{
			vdir = undefined;
		}
	}
	if(idamage > 1 && isdefined(eattacker) && isdefined(self.var_ea1458aa))
	{
		if(weapons::isbulletdamage(smeansofdeath))
		{
			angles = self getplayerangles();
			forward = anglestoforward((0, angles[1], 0));
			var_5511f898 = vectornormalize(eattacker.origin - self.origin);
			if(vectordot(forward, var_5511f898) < 0.7)
			{
				if(!isdefined(self.var_ea1458aa.var_64ffda50))
				{
					self.var_ea1458aa.var_64ffda50 = [];
				}
				attackerentnum = eattacker getentitynumber();
				self.var_ea1458aa.var_64ffda50[attackerentnum] = gettime();
			}
		}
		else if(weapons::isexplosivedamage(smeansofdeath))
		{
			if(isdefined(einflictor) && isdefined(einflictor.weapon) && einflictor.weapon.statname == #"recon_car")
			{
				if(!isdefined(self.var_ea1458aa.var_8f7ff7ed))
				{
					self.var_ea1458aa.var_8f7ff7ed = [];
				}
				attackerentnum = eattacker getentitynumber();
				self.var_ea1458aa.var_8f7ff7ed[attackerentnum] = gettime();
			}
		}
	}
	if(level.var_71c35c9f && weapon.statname == #"launcher_standard_t8" && smeansofdeath == "MOD_PROJECTILE_SPLASH")
	{
		idamage = int(idamage * 0.25);
	}
	if(isplayer(eattacker) && eattacker != self)
	{
		if(!isdefined(eattacker.var_6fd69072))
		{
			eattacker.var_6fd69072 = function_f8d53445();
		}
	}
	if(!isdefined(self.var_8cb03411))
	{
		self.var_8cb03411 = function_f8d53445();
	}
	fatal = self finishplayerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
	if(self.var_abe2db87 === 1)
	{
		self function_b2b139e6();
		self.var_abe2db87 = undefined;
	}
	if(is_true(self.laststand))
	{
		fatal = isdefined(self.var_969fabf4) && self.var_969fabf4 <= 0;
	}
	pixendevent();
	return is_true(fatal);
}

/*
	Name: player_damage_log
	Namespace: player
	Checksum: 0xA7DDFA16
	Offset: 0x2D50
	Size: 0x3B6
	Parameters: 11
	Flags: Linked, Private
*/
function private player_damage_log(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	pixbeginevent();
	/#
		if(getdvarint(#"g_debugdamage", 0))
		{
			println(((((((((("" + self getentitynumber()) + "") + self.health) + "") + vpoint.clientid) + "") + isplayer(weapon) + "") + vdir) + "") + boneindex);
		}
	#/
	if(self.sessionstate != "dead")
	{
		lpselfnum = self getentitynumber();
		lpselfname = self.name;
		lpselfteam = self.team;
		lpselfguid = self getguid();
		lpattackerteam = "";
		lpattackerorigin = (0, 0, 0);
		var_76d450bd = function_b14806c6(self player_role::get(), currentsessionmode());
		if(isplayer(vpoint))
		{
			lpattacknum = vpoint getentitynumber();
			var_c8fa9c41 = vpoint getxuid();
			lpattackguid = vpoint getguid();
			lpattackname = vpoint.name;
			lpattackerteam = vpoint.team;
			lpattackerorigin = vpoint.origin;
			var_a48b1a67 = function_b14806c6(vpoint player_role::get(), currentsessionmode());
			if(isdefined(self.currentweapon))
			{
				name = self.currentweapon.name;
			}
			bb::function_c3b9e07f(vpoint, lpattackerorigin, var_a48b1a67, psoffsettime.name, self, self.origin, var_76d450bd, name, vdir, shitloc, boneindex, 0, undefined);
		}
		else
		{
			lpattacknum = -1;
			var_c8fa9c41 = 0;
			lpattackguid = "";
			lpattackname = "";
			lpattackerteam = "world";
			bb::function_c3b9e07f(undefined, undefined, undefined, psoffsettime.name, self, self.origin, undefined, undefined, vdir, shitloc, boneindex, 0, undefined);
		}
	}
	pixendevent();
}

/*
	Name: should_allow_postgame_damage
	Namespace: player
	Checksum: 0xEF07DA8
	Offset: 0x3110
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private should_allow_postgame_damage(smeansofdeath)
{
	if(smeansofdeath == "MOD_TRIGGER_HURT" || smeansofdeath == "MOD_CRUSH")
	{
		return true;
	}
	return false;
}

/*
	Name: do_post_game_damage
	Namespace: player
	Checksum: 0x305F5535
	Offset: 0x3150
	Size: 0xD4
	Parameters: 14
	Flags: Linked, Private
*/
function private do_post_game_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal)
{
	if(!gamestate::is_game_over())
	{
		return;
	}
	if(!should_allow_postgame_damage(smeansofdeath))
	{
		return;
	}
	self finishplayerdamage(einflictor, eattacker, idamage, idflags, "MOD_POST_GAME", weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
}

/*
	Name: function_b5dadafc
	Namespace: player
	Checksum: 0x3DE62BE
	Offset: 0x3230
	Size: 0x210
	Parameters: 14
	Flags: Linked, Private
*/
function private function_b5dadafc(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal)
{
	if(!gamestate::is_state(#"pregame"))
	{
		return false;
	}
	if(self isskydiving() && shitloc == "MOD_FALLING" && vpoint > self.health)
	{
		self function_8cf53a19();
	}
	friendlyfire = isplayer(var_fd90b0bb) && self util::isenemyplayer(var_fd90b0bb) == 0;
	if(friendlyfire)
	{
		vpoint = self does_player_completely_avoid_damage(vdir, boneindex, vdamageorigin, friendlyfire, 0, shitloc, psoffsettime, vpoint, weapon, var_fd90b0bb);
		if(vpoint <= 0)
		{
			return false;
		}
	}
	if(damagefeedback::dodamagefeedback(vdamageorigin, weapon, vpoint, shitloc))
	{
		if(vpoint > 0)
		{
			perkfeedback = function_e512b988(self, vdamageorigin, shitloc, weapon, vdir & 2048);
		}
		var_fd90b0bb = figure_out_attacker(var_fd90b0bb);
		if(isdefined(var_fd90b0bb))
		{
			var_fd90b0bb thread damagefeedback::update(shitloc, weapon, perkfeedback, vdamageorigin, self, vsurfacenormal, boneindex, 0, vdir);
		}
	}
	return true;
}

/*
	Name: function_e512b988
	Namespace: player
	Checksum: 0x886936B6
	Offset: 0x3448
	Size: 0x2B2
	Parameters: 6
	Flags: Linked, Private
*/
function private function_e512b988(player, weapon, smeansofdeath, einflictor, armor_damaged, var_295ac8e4)
{
	perkfeedback = undefined;
	var_14e61d05 = player util::function_14e61d05();
	hasflakjacket = player hasperk(#"specialty_flakjacket");
	isexplosivedamage = weapons::isexplosivedamage(smeansofdeath);
	isflashorstundamage = weapons::isflashorstundamage(weapon, smeansofdeath);
	var_d015da29 = weapons::isfiredamage(weapon, smeansofdeath);
	var_1c365dd = player status_effect::function_3c54ae98(7) > 0;
	if(isflashorstundamage && var_14e61d05)
	{
		perkfeedback = "tacticalMask";
	}
	else
	{
		if(var_1c365dd && weapon == getweapon(#"shock_rifle"))
		{
			perkfeedback = "resistance";
		}
		else
		{
			if(player hasperk(#"specialty_fireproof") && weapons::isfiredamage(weapon, smeansofdeath))
			{
				perkfeedback = "flakjacket";
			}
			else
			{
				if(isexplosivedamage || var_d015da29 && hasflakjacket && !weapon.ignoresflakjacket && !function_e3242ae4(weapon, einflictor))
				{
					perkfeedback = "flakjacket";
					player thread challenges::flakjacketprotectedmp();
				}
				else if(armor_damaged)
				{
					if((isdefined(getgametypesetting(#"hash_11e1a0adebdab01a")) ? getgametypesetting(#"hash_11e1a0adebdab01a") : 0))
					{
						if(var_295ac8e4)
						{
							perkfeedback = "armorBroke";
						}
						else
						{
							perkfeedback = "armor";
						}
					}
				}
			}
		}
	}
	return perkfeedback;
}

/*
	Name: function_e3242ae4
	Namespace: player
	Checksum: 0x3C6C84DF
	Offset: 0x3708
	Size: 0x52
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e3242ae4(weapon, einflictor)
{
	if(weapon.isaikillstreakdamage)
	{
		if(weapon.name != "ai_tank_drone_rocket" || isdefined(einflictor.firedbyai))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: does_player_completely_avoid_damage
	Namespace: player
	Checksum: 0x2B0DDB5D
	Offset: 0x3768
	Size: 0x546
	Parameters: 10
	Flags: Linked, Private
*/
function private does_player_completely_avoid_damage(idflags, shitloc, weapon, friendlyfire, attackerishittingself, smeansofdeath, vpoint, idamage, einflictor, eattacker)
{
	if(idflags & 8192)
	{
		return idamage;
	}
	if(friendlyfire && level.friendlyfire == 0)
	{
		return 0;
	}
	if(friendlyfire && (weapon === getweapon(#"straferun_gun") || weapon == getweapon(#"straferun_rockets")))
	{
		return 0;
	}
	if(attackerishittingself || friendlyfire && weapon != level.weaponnone && weapon === getweapon(#"supplydrop") && smeansofdeath == "MOD_EXPLOSIVE")
	{
		return 0;
	}
	if(shitloc == "riotshield")
	{
		if(!idflags & 160)
		{
			return 0;
		}
	}
	if(self.currentweapon === getweapon(#"sig_buckler_turret") && weapon != getweapon(#"remote_missile_missile") && (smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_EXPLOSIVE" || (weapon.type == "gas" && (smeansofdeath == "MOD_GAS" || smeansofdeath == "MOD_BURNED"))))
	{
		angles = self getplayerangles();
		forward = anglestoforward((0, angles[1], 0));
		var_587ddb7b = weapon.statname == #"hero_flamethrower" && weapon.type == "gas" && (smeansofdeath == "MOD_GAS" || smeansofdeath == "MOD_BURNED");
		if(var_587ddb7b && isdefined(eattacker) && 0)
		{
			vpoint = eattacker.origin;
		}
		dirtoplayer = self.origin - vpoint;
		dir = vectornormalize((dirtoplayer[0], dirtoplayer[1], 0));
		dot = vectordot(forward, dir);
		dot_threshold = -0.7;
		if(var_587ddb7b)
		{
			dot_threshold = getdvarfloat(#"hash_5225b2e88154efd5", -0.25);
		}
		if(dot < dot_threshold)
		{
			var_a0c3f41d = (isdefined(self.currentweapon.var_e2b40cd5) ? self.currentweapon.var_e2b40cd5 : 0);
			if(var_a0c3f41d > 0)
			{
				blockeddamage = idamage;
				blockeddamage = blockeddamage * (1 - var_a0c3f41d);
				function_56dc620b(einflictor, eattacker, int(blockeddamage), weapon, getscriptbundle(self.currentweapon.customsettings));
				idamage = idamage * var_a0c3f41d;
				return int(idamage);
			}
			function_56dc620b(einflictor, eattacker, idamage, weapon, getscriptbundle(self.currentweapon.customsettings));
			return 0;
		}
	}
	if(weapon.isemp && smeansofdeath == "MOD_GRENADE_SPLASH")
	{
		if(self hasperk(#"specialty_immuneemp"))
		{
			return 0;
		}
	}
	return idamage;
}

/*
	Name: function_56dc620b
	Namespace: player
	Checksum: 0xF53AABD4
	Offset: 0x3CB8
	Size: 0x294
	Parameters: 5
	Flags: Linked
*/
function function_56dc620b(einflictor, eattacker, idamage, weapon, customsettings)
{
	previous_shield_damage = self.shielddamageblocked;
	self.shielddamageblocked = self.shielddamageblocked + idamage;
	if(self.shielddamageblocked % 200 < previous_shield_damage % 200)
	{
		if(isdefined(einflictor) && !isplayer(einflictor))
		{
			if(!isdefined(einflictor.var_a6cf412b))
			{
				einflictor.var_a6cf412b = [];
			}
			if(!isdefined(einflictor.var_a6cf412b[self.clientid]) || einflictor.var_a6cf412b[self.clientid].var_70465a20 != (isdefined(self.var_70465a20) ? self.var_70465a20 : 0))
			{
				info = spawnstruct();
				info.var_5d378d77 = 1;
				info.var_70465a20 = (isdefined(self.var_70465a20) ? self.var_70465a20 : 0);
				einflictor.var_a6cf412b[self.clientid] = info;
			}
			else
			{
				einflictor.var_a6cf412b[self.clientid].var_5d378d77++;
			}
		}
		var_2c23422d = (isdefined(customsettings.var_2c23422d) ? customsettings.var_2c23422d : 0);
		if(isplayer(einflictor) || einflictor.var_a6cf412b[self.clientid].var_5d378d77 <= var_2c23422d)
		{
			score = rank::getscoreinfovalue("shield_blocked_damage");
			if(score > 0)
			{
				self stats::function_e24eec31(level.weaponriotshield, #"score_from_blocked_damage", score);
			}
			scoreevents::processscoreevent(#"shield_blocked_damage", self, undefined, self.currentweapon);
		}
		self battlechatter::function_bd715920(self.currentweapon, eattacker, self.origin, weapon);
	}
}

/*
	Name: riotshield_hit
	Namespace: player
	Checksum: 0x2CEE292C
	Offset: 0x3F58
	Size: 0x1A4
	Parameters: 7
	Flags: Linked, Private
*/
function private riotshield_hit(einflictor, eattacker, idamage, smeansofdeath, weapon, attackerishittingteammate, vdir)
{
	if(smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_IMPACT" && !attackerishittingteammate)
	{
		currentweapon = self getcurrentweapon();
		if(currentweapon.isriotshield)
		{
			if(isplayer(eattacker))
			{
				eattacker.lastattackedshieldplayer = self;
				eattacker.lastattackedshieldtime = gettime();
			}
			function_56dc620b(einflictor, eattacker, idamage, weapon, getscriptbundle(currentweapon.customsettings));
			forward = anglestoforward(self getplayerangles());
			dot = vectordot(forward, vdir);
			if(dot < -0.8)
			{
				self status_effect::status_effect_apply(getstatuseffect("riotshield_hit_slow"), self.currentweapon, self, 0);
			}
		}
	}
}

/*
	Name: function_ef7fa582
	Namespace: player
	Checksum: 0x9EDD66ED
	Offset: 0x4108
	Size: 0xF6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_ef7fa582(eattacker, etarget, weapon)
{
	if(isdefined(eattacker.owner) && isdefined(eattacker.owner.owner) && eattacker.owner.owner == etarget && is_true(eattacker.owner.donotdamageowner))
	{
		return 1;
	}
	if(level.hardcoremode)
	{
		return 0;
	}
	if(!isdefined(eattacker) || !isdefined(etarget))
	{
		return 0;
	}
	if(!isdefined(weapon))
	{
		return 0;
	}
	if(isdefined(eattacker.script_owner) && eattacker.script_owner == etarget)
	{
		return weapon.donotdamageowner;
	}
	return 0;
}

/*
	Name: should_do_player_damage
	Namespace: player
	Checksum: 0x8953795A
	Offset: 0x4208
	Size: 0x380
	Parameters: 5
	Flags: Linked, Private
*/
function private should_do_player_damage(eattacker, einflictor, weapon, smeansofdeath, idflags)
{
	if(gamestate::is_game_over())
	{
		return false;
	}
	if(self.sessionteam == #"spectator")
	{
		return false;
	}
	if(isdefined(self.candocombat) && !self.candocombat)
	{
		return false;
	}
	if(isdefined(eattacker) && isplayer(eattacker) && isdefined(eattacker.candocombat) && !eattacker.candocombat)
	{
		return false;
	}
	if(isdefined(level.hostmigrationtimer))
	{
		return false;
	}
	if(level.onlyheadshots)
	{
		if(smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET")
		{
			return false;
		}
	}
	if(isdefined(einflictor) && isdefined(einflictor.team) && !self util::isenemyteam(einflictor.team))
	{
		if(isvehicle(einflictor) && is_true(einflictor.var_54b19f55))
		{
			return false;
		}
		if(isai(einflictor) && isdefined(einflictor.ai) && is_true(einflictor.ai.var_54b19f55))
		{
			return false;
		}
	}
	if(isdefined(eattacker) && isdefined(eattacker.team) && !self util::isenemyteam(eattacker.team))
	{
		if(isvehicle(eattacker) && is_true(eattacker.var_54b19f55))
		{
			return false;
		}
		if(isai(eattacker) && is_true(eattacker.ai.var_54b19f55))
		{
			return false;
		}
	}
	if(self vehicle::player_is_occupant_invulnerable(eattacker, smeansofdeath))
	{
		return false;
	}
	if(weapon.issupplydropweapon && !weapon.isgrenadeweapon && smeansofdeath != "MOD_TRIGGER_HURT")
	{
		return false;
	}
	if(self.scene_takedamage === 0)
	{
		return false;
	}
	if(function_ef7fa582(einflictor, self, weapon))
	{
		return false;
	}
	if(idflags & 8 && self is_spawn_protected())
	{
		return false;
	}
	if(smeansofdeath == "MOD_CRUSH" && isdefined(einflictor) && einflictor.deal_no_crush_damage === 1)
	{
		return;
	}
	return true;
}

/*
	Name: apply_damage_to_armor
	Namespace: player
	Checksum: 0xD66EA9D4
	Offset: 0x4590
	Size: 0x334
	Parameters: 9
	Flags: Linked, Private
*/
function private apply_damage_to_armor(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, shitloc, friendlyfire, ignore_round_start_friendly_fire)
{
	victim = self;
	if(friendlyfire && !function_1727a023(ignore_round_start_friendly_fire, eattacker))
	{
		return {#idamage:idamage, #idflags:idflags};
	}
	if(isdefined(einflictor) && isdefined(einflictor.stucktoplayer) && einflictor.stucktoplayer == victim)
	{
		return {#idamage:victim.health, #idflags:idflags};
	}
	armor = self armor::get_armor();
	gear_armor = self.armor;
	self.var_426947c4 = undefined;
	var_5612d816 = idamage;
	idamage = victim armor::apply_damage(weapon, idamage, smeansofdeath, eattacker, shitloc);
	idamage = victim armor::function_a77114f2(einflictor, eattacker, idamage, smeansofdeath, weapon, shitloc);
	armor_damaged = armor != self armor::get_armor();
	time = gettime();
	if(armor_damaged)
	{
		idflags = idflags | 2048;
		if(gear_armor > 0 && self.armor <= 0)
		{
			self.var_426947c4 = 1;
		}
		if(!isdefined(self.var_eed94074))
		{
			self.var_eed94074 = {};
		}
		if(!isdefined(self.var_eed94074.lastdamagetime) || (self.var_eed94074.lastdamagetime + 4000) < time)
		{
			self.var_eed94074.var_615e1be9 = 0;
		}
		self.var_eed94074.lastdamagetime = time;
	}
	if(isdefined(self.var_eed94074))
	{
		if(!armor_damaged && (self.var_eed94074.lastdamagetime + 4000) < time)
		{
			self.var_eed94074 = undefined;
		}
		else
		{
			self.var_eed94074.var_615e1be9 = self.var_eed94074.var_615e1be9 + var_5612d816;
		}
	}
	if(is_true(self.power_armor_took_damage))
	{
		idflags = idflags | 1024;
	}
	return {#idamage:idamage, #idflags:idflags};
}

/*
	Name: make_sure_damage_is_not_zero
	Namespace: player
	Checksum: 0xB59D10C5
	Offset: 0x48D0
	Size: 0xB2
	Parameters: 2
	Flags: Linked, Private
*/
function private make_sure_damage_is_not_zero(idamage, armor_damaged)
{
	if(idamage < 1)
	{
		if(armor_damaged || self ability_util::gadget_power_armor_on() || self armor::has_armor() && isdefined(self.maxhealth) && self.health < self.maxhealth)
		{
			self.health = self.health + 1;
		}
		idamage = 1;
	}
	return int(idamage);
}

/*
	Name: modify_player_damage_friendlyfire
	Namespace: player
	Checksum: 0x2A152304
	Offset: 0x4990
	Size: 0x72
	Parameters: 2
	Flags: Linked, Private
*/
function private modify_player_damage_friendlyfire(idamage, eattacker)
{
	friendlyfire = [[level.figure_out_friendly_fire]](self, eattacker);
	if(friendlyfire == 2 || friendlyfire == 3)
	{
		idamage = int(idamage * 0.5);
	}
	return idamage;
}

/*
	Name: function_7681dccc
	Namespace: player
	Checksum: 0xFCC75700
	Offset: 0x4A10
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function function_7681dccc()
{
	if(self isinvehicle())
	{
		vehicle = self getvehicleoccupied();
		if(isdefined(vehicle) && isdefined(vehicle.overrideplayerdamage))
		{
			return vehicle.overrideplayerdamage;
		}
	}
	if(isdefined(self.overrideplayerdamage))
	{
		return self.overrideplayerdamage;
	}
	if(isdefined(level.overrideplayerdamage))
	{
		return level.overrideplayerdamage;
	}
}

/*
	Name: modify_player_damage
	Namespace: player
	Checksum: 0x462BE616
	Offset: 0x4AA8
	Size: 0x3EA
	Parameters: 12
	Flags: Linked, Private
*/
function private modify_player_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	overrideplayerdamage = function_7681dccc();
	if(isdefined(overrideplayerdamage))
	{
		idamage = self [[overrideplayerdamage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex);
	}
	/#
		assert(isdefined(idamage), "");
	#/
	if(isdefined(eattacker))
	{
		idamage = loadout::cac_modified_damage(self, eattacker, idamage, smeansofdeath, weapon, einflictor, shitloc);
		if(isdefined(eattacker.pickup_damage_scale) && eattacker.pickup_damage_scale_time > gettime())
		{
			idamage = idamage * eattacker.pickup_damage_scale;
		}
	}
	idamage = custom_gamemodes_modified_damage(self, eattacker, idamage, smeansofdeath, weapon, einflictor, shitloc);
	if(level.onplayerdamage != (&globallogic::blank))
	{
		modifieddamage = [[level.onplayerdamage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime);
		if(isdefined(modifieddamage))
		{
			if(modifieddamage <= 0)
			{
				return;
			}
			idamage = modifieddamage;
		}
	}
	if(level.onlyheadshots)
	{
		if(smeansofdeath == "MOD_HEAD_SHOT")
		{
			idamage = 150;
		}
	}
	if(weapon.damagealwayskillsplayer)
	{
		idamage = self.maxhealth + 1;
	}
	if(shitloc == "riotshield")
	{
		if(idflags & 32)
		{
			if(!idflags & 64)
			{
				idamage = idamage * 0;
			}
		}
		else if(idflags & 128)
		{
			if(isdefined(einflictor) && isdefined(einflictor.stucktoplayer) && einflictor.stucktoplayer == self)
			{
				idamage = self.maxhealth + 1;
			}
		}
	}
	if(self.currentweapon === getweapon(#"sig_buckler_dw") && (smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_PROJECTILE"))
	{
		angles = self getplayerangles();
		forward = anglestoforward((0, angles[1], 0));
		dirtoplayer = self.origin - vpoint;
		dir = vectornormalize((dirtoplayer[0], dirtoplayer[1], 0));
		dot = vectordot(forward, dir);
		if(dot < -0.7)
		{
			idamage = idamage * weapon.var_6844746b;
		}
	}
	return int(idamage);
}

/*
	Name: modify_player_damage_meansofdeath
	Namespace: player
	Checksum: 0xFE20370A
	Offset: 0x4EA0
	Size: 0xA6
	Parameters: 5
	Flags: Linked, Private
*/
function private modify_player_damage_meansofdeath(einflictor, eattacker, smeansofdeath, weapon, shitloc)
{
	if(weapons::isheadshot(weapon, shitloc, smeansofdeath) && isplayer(eattacker))
	{
		smeansofdeath = "MOD_HEAD_SHOT";
	}
	if(isdefined(einflictor) && isdefined(einflictor.script_noteworthy))
	{
		if(einflictor.script_noteworthy == "ragdoll_now")
		{
			smeansofdeath = "MOD_FALLING";
		}
	}
	return smeansofdeath;
}

/*
	Name: update_attacker
	Namespace: player
	Checksum: 0x2570A0C2
	Offset: 0x4F50
	Size: 0x2BE
	Parameters: 3
	Flags: Linked, Private
*/
function private update_attacker(einflictor, eattacker, smeansofdeath)
{
	if(!isplayer(eattacker))
	{
		return;
	}
	if(!isdefined(eattacker.pers))
	{
		return;
	}
	if(eattacker === einflictor)
	{
		if(smeansofdeath == "MOD_HEAD_SHOT" || smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET")
		{
			if(!isdefined(eattacker.hits))
			{
				eattacker.hits = 0;
			}
			if(!isdefined(eattacker.var_2641e022))
			{
				eattacker.var_2641e022 = 0;
			}
			if(!isdefined(eattacker.pers[#"shotshit"]))
			{
				eattacker.pers[#"shotshit"] = 0;
			}
			eattacker.pers[#"shotshit"]++;
			eattacker.hits++;
			if(smeansofdeath == "MOD_HEAD_SHOT")
			{
				eattacker.var_2641e022++;
				if(!isdefined(eattacker.pers[#"hash_27ec70548b00de5"]))
				{
					eattacker.pers[#"hash_27ec70548b00de5"] = 0;
				}
				eattacker.pers[#"hash_27ec70548b00de5"]++;
			}
			if(!isdefined(eattacker.pers[#"shotsfired"]))
			{
				eattacker.pers[#"shotsfired"] = 0;
			}
			shotsmissed = eattacker.pers[#"shotsfired"] - eattacker.pers[#"shotshit"];
			if(shotsmissed < 0)
			{
				shotsmissed = 0;
			}
			eattacker.pers[#"shotsmissed"] = shotsmissed;
			eattacker function_ef823e71(0, eattacker.pers[#"shotsfired"], eattacker.pers[#"shotshit"]);
		}
	}
	if(!isdefined(eattacker.pers[#"participation"]))
	{
		eattacker.pers[#"participation"] = 0;
	}
	eattacker.pers[#"participation"]++;
}

/*
	Name: function_811dd365
	Namespace: player
	Checksum: 0xDAB660EA
	Offset: 0x5218
	Size: 0x13E
	Parameters: 3
	Flags: Linked, Private
*/
function private function_811dd365(einflictor, weapon, smeansofdeath)
{
	if(!self is_spawn_protected())
	{
		return false;
	}
	if(weapon.explosionradius == 0)
	{
		return false;
	}
	distsqr = (isdefined(self.lastspawnpoint) ? distancesquared(einflictor.origin, self.lastspawnpoint.origin) : 0);
	if(distsqr < sqr(250))
	{
		if(smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH")
		{
			return true;
		}
		if(smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH")
		{
			return true;
		}
		if(smeansofdeath == "MOD_EXPLOSIVE")
		{
			return true;
		}
	}
	if(killstreaks::is_killstreak_weapon(weapon))
	{
		return true;
	}
	return false;
}

/*
	Name: function_104e1126
	Namespace: player
	Checksum: 0x9C389000
	Offset: 0x5360
	Size: 0x5B8
	Parameters: 11
	Flags: Linked, Private
*/
function private function_104e1126(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	is_explosive_damage = weapons::isexplosivedamage(psoffsettime);
	if(is_explosive_damage)
	{
		if(self function_811dd365(vdir, boneindex, psoffsettime))
		{
			return false;
		}
		if(self function_eacd01b7(shitloc, boneindex))
		{
			return false;
		}
	}
	if(isdefined(vdir) && (psoffsettime == "MOD_GAS" || is_explosive_damage))
	{
		self.explosiveinfo = [];
		self.explosiveinfo[#"damagetime"] = gettime();
		self.explosiveinfo[#"damageid"] = vdir getentitynumber();
		self.explosiveinfo[#"originalownerkill"] = 0;
		self.explosiveinfo[#"bulletpenetrationkill"] = 0;
		self.explosiveinfo[#"chainkill"] = 0;
		self.explosiveinfo[#"damageexplosivekill"] = 0;
		self.explosiveinfo[#"chainkill"] = 0;
		self.explosiveinfo[#"cookedkill"] = 0;
		self.explosiveinfo[#"weapon"] = boneindex;
		self.explosiveinfo[#"originalowner"] = vdir.originalowner;
		isfrag = boneindex.rootweapon.name == "frag_grenade";
		if(isdefined(shitloc) && shitloc != self)
		{
			if(isdefined(shitloc) && isdefined(vdir.owner) && (boneindex.name == #"satchel_charge" || boneindex.name == #"claymore" || boneindex.name == #"bouncingbetty"))
			{
				self.explosiveinfo[#"originalownerkill"] = vdir.owner == self;
				self.explosiveinfo[#"damageexplosivekill"] = isdefined(vdir.wasdamaged);
				self.explosiveinfo[#"chainkill"] = isdefined(vdir.waschained);
				self.explosiveinfo[#"wasjustplanted"] = isdefined(vdir.wasjustplanted);
				self.explosiveinfo[#"bulletpenetrationkill"] = isdefined(vdir.wasdamagedfrombulletpenetration);
				self.explosiveinfo[#"cookedkill"] = 0;
			}
			if(isdefined(vdir) && isdefined(vdir.stucktoplayer) && boneindex.projexplosiontype == "grenade")
			{
				self.explosiveinfo[#"stucktoplayer"] = vdir.stucktoplayer;
			}
			if(boneindex.dostun)
			{
				self.laststunnedby = shitloc;
				self.laststunnedtime = self.idflagstime;
			}
			if(isdefined(shitloc.lastgrenadesuicidetime) && shitloc.lastgrenadesuicidetime >= (gettime() - 50) && isfrag)
			{
				self.explosiveinfo[#"suicidegrenadekill"] = 1;
			}
			else
			{
				self.explosiveinfo[#"suicidegrenadekill"] = 0;
			}
		}
		if(isfrag)
		{
			self.explosiveinfo[#"cookedkill"] = isdefined(vdir.iscooked);
			self.explosiveinfo[#"throwbackkill"] = isdefined(vdir.throwback);
		}
		if(isdefined(shitloc) && isplayer(shitloc) && shitloc != self)
		{
			self globallogic_score::setinflictorstat(vdir, shitloc, boneindex);
		}
	}
	if(psoffsettime == "MOD_IMPACT" && isdefined(shitloc) && isplayer(shitloc) && shitloc != self)
	{
		if(!boneindex.isballisticknife)
		{
			self globallogic_score::setinflictorstat(vdir, shitloc, boneindex);
		}
		if(boneindex.rootweapon.name == "hatchet" && isdefined(vdir))
		{
			self.explosiveinfo[#"projectile_bounced"] = isdefined(vdir.bounced);
		}
	}
	return true;
}

/*
	Name: function_acca46ef
	Namespace: player
	Checksum: 0xA2A9A850
	Offset: 0x5920
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_acca46ef()
{
	if(!isdefined(level.discardtime) || !isdefined(level.starttime))
	{
		return false;
	}
	if(level.friendlyfiredelay && level.friendlyfiredelaytime >= ((float((gettime() - level.starttime) - level.discardtime)) / 1000))
	{
		return true;
	}
	return false;
}

/*
	Name: function_44b6bb92
	Namespace: player
	Checksum: 0xF58A3F13
	Offset: 0x59B0
	Size: 0xB4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_44b6bb92(eattacker, ignore_round_start_friendly_fire)
{
	if(!isalive(eattacker))
	{
		return false;
	}
	friendlyfire = [[level.figure_out_friendly_fire]](self, eattacker);
	if(friendlyfire == 1)
	{
		if(function_acca46ef() && ignore_round_start_friendly_fire == 0)
		{
			return true;
		}
	}
	if(friendlyfire == 2)
	{
		return true;
	}
	if(friendlyfire == 3)
	{
		return true;
	}
	return false;
}

/*
	Name: function_1727a023
	Namespace: player
	Checksum: 0x449DE519
	Offset: 0x5A70
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_1727a023(ignore_round_start_friendly_fire, attacker)
{
	friendlyfire = [[level.figure_out_friendly_fire]](self, attacker);
	if(friendlyfire == 1)
	{
		if(function_acca46ef() && ignore_round_start_friendly_fire == 0)
		{
			return false;
		}
		return true;
	}
	if(friendlyfire == 3)
	{
		return true;
	}
	return false;
}

/*
	Name: function_eacd01b7
	Namespace: player
	Checksum: 0xEB8A9506
	Offset: 0x5B00
	Size: 0x4A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_eacd01b7(eattacker, weapon)
{
	if(level.hardcoremode)
	{
		return 0;
	}
	if(!isdefined(eattacker))
	{
		return 0;
	}
	if(self != eattacker)
	{
		return 0;
	}
	return weapon.donotdamageowner;
}

/*
	Name: function_f4f77cfb
	Namespace: player
	Checksum: 0xAC573B89
	Offset: 0x5B58
	Size: 0x16E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f4f77cfb(weapon, einflictor)
{
	if(weapon == level.weaponnone && isdefined(einflictor))
	{
		if(isdefined(einflictor.targetname) && einflictor.targetname == "explodable_barrel")
		{
			weapon = getweapon(#"explodable_barrel");
		}
		else
		{
			if(isdefined(einflictor.destructible_type) && issubstr(einflictor.destructible_type, "vehicle_"))
			{
				weapon = getweapon(#"destructible_car");
			}
			else if(isdefined(einflictor.scriptvehicletype))
			{
				veh_weapon = getweapon(einflictor.scriptvehicletype);
				if(isdefined(veh_weapon))
				{
					weapon = veh_weapon;
				}
			}
		}
	}
	if(isdefined(einflictor) && isdefined(einflictor.script_noteworthy))
	{
		if(isdefined(level.overrideweaponfunc))
		{
			weapon = [[level.overrideweaponfunc]](weapon, einflictor.script_noteworthy);
		}
	}
	return weapon;
}

/*
	Name: custom_gamemodes_modified_damage
	Namespace: player
	Checksum: 0xE1BBDEFF
	Offset: 0x5CD0
	Size: 0xDA
	Parameters: 7
	Flags: Linked, Private
*/
function private custom_gamemodes_modified_damage(victim, eattacker, idamage, smeansofdeath, weapon, einflictor, shitloc)
{
	if(level.onlinegame && !sessionmodeisprivate())
	{
		return einflictor;
	}
	if(isdefined(weapon) && isdefined(weapon.damagemodifier))
	{
		einflictor = einflictor * weapon.damagemodifier;
	}
	if(shitloc == "MOD_PISTOL_BULLET" || shitloc == "MOD_RIFLE_BULLET")
	{
		einflictor = int(einflictor * level.bulletdamagescalar);
	}
	return einflictor;
}

/*
	Name: function_a774b4ed
	Namespace: player
	Checksum: 0xF8D703AD
	Offset: 0x5DB8
	Size: 0x1FE
	Parameters: 5
	Flags: Linked, Private
*/
function private function_a774b4ed(eattacker, einflictor, weapon, smeansofdeath, idamage)
{
	self thread weapons::on_damage(eattacker, einflictor, weapon, smeansofdeath, idamage);
	if(!self util::isusingremote())
	{
		if(sessionmodeiswarzonegame() && smeansofdeath == "MOD_DEATH_CIRCLE")
		{
			if(!isdefined(self.var_2f5355a6) || gettime() > self.var_2f5355a6)
			{
				self function_bc82f900("damage_death_circle");
				self.var_2f5355a6 = gettime();
			}
		}
		else
		{
			if(sessionmodeiswarzonegame() && smeansofdeath == "MOD_BLED_OUT")
			{
				if(!isdefined(self.var_2c725854) || gettime() > self.var_2c725854)
				{
					self function_bc82f900("damage_bleed");
					self.var_2c725854 = gettime();
				}
			}
			else
			{
				if(smeansofdeath != "MOD_DOT" && smeansofdeath != "MOD_DOT_SELF")
				{
					if(!isdefined(self.var_6d9f302e) || gettime() > self.var_6d9f302e)
					{
						self function_bc82f900("damage_heavy");
						self.var_6d9f302e = gettime();
					}
				}
				else if(!isdefined(self.var_b82529f5) || gettime() > self.var_b82529f5)
				{
					self function_bc82f900("damage_light");
					self.var_b82529f5 = gettime();
				}
			}
		}
	}
}

/*
	Name: function_40c6c42d
	Namespace: player
	Checksum: 0xFD109744
	Offset: 0x5FC0
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function function_40c6c42d(attacker)
{
	damage = 0;
	if(isdefined(attacker.clientid) && isdefined(self.attackerdamage) && isdefined(self.attackerdamage[attacker.clientid]) && self.attackerdamage[attacker.clientid].damage)
	{
		damage = self.attackerdamage[attacker.clientid].damage;
		if(damage > 200)
		{
			damage = 200;
		}
	}
	return damage;
}

/*
	Name: function_201c298c
	Namespace: player
	Checksum: 0x376399E0
	Offset: 0x6070
	Size: 0x17C
	Parameters: 0
	Flags: None
*/
function function_201c298c()
{
	var_28214e57 = undefined;
	lastdamagetime = undefined;
	if(isarray(self.attackerdamage))
	{
		foreach(clientid, damage in self.attackerdamage)
		{
			if(!isdefined(var_28214e57) || damage.lastdamagetime > lastdamagetime)
			{
				var_28214e57 = clientid;
				lastdamagetime = damage.lastdamagetime;
			}
		}
	}
	if(isdefined(var_28214e57))
	{
		foreach(player in getplayers())
		{
			if(player.clientid === var_28214e57)
			{
				return player;
			}
		}
	}
	return undefined;
}

