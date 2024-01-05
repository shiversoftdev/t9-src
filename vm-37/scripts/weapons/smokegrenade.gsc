#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using script_396f7d71538c9677;
#using scripts\core_common\battlechatter.gsc;

#namespace smokegrenade;

/*
	Name: init_shared
	Namespace: smokegrenade
	Checksum: 0x88EA46CD
	Offset: 0x188
	Size: 0x154
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	level.willypetedamageradius = 300;
	level.willypetedamageheight = 128;
	level.smokegrenadeduration = 8;
	level.smokegrenadedissipation = 4;
	level.smokegrenadetotaltime = level.smokegrenadeduration + level.smokegrenadedissipation;
	level.fx_smokegrenade_single = "smoke_center";
	level.smoke_grenade_triggers = [];
	clientfield::register("allplayers", "inenemysmoke", 14000, 1, "int");
	clientfield::register("allplayers", "insmoke", 16000, 2, "int");
	clientfield::register("scriptmover", "smoke_state", 16000, 1, "int");
	globallogic_score::function_5a241bd8(getweapon(#"willy_pete"), &function_b4a975f1);
}

/*
	Name: function_79d42bea
	Namespace: smokegrenade
	Checksum: 0x3BED3E9
	Offset: 0x2E8
	Size: 0x66
	Parameters: 1
	Flags: None
*/
function function_79d42bea(weapon)
{
	if(!isdefined(weapon.customsettings))
	{
		return 128;
	}
	var_b0b958b3 = getscriptbundle(weapon.customsettings);
	return (isdefined(var_b0b958b3.var_40dfefd1) ? var_b0b958b3.var_40dfefd1 : 128);
}

/*
	Name: function_f199623f
	Namespace: smokegrenade
	Checksum: 0xF8B5B692
	Offset: 0x358
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function function_f199623f(weapon)
{
	if(!isdefined(weapon.customsettings))
	{
		return level.smokegrenadeduration;
	}
	var_b0b958b3 = getscriptbundle(weapon.customsettings);
	return (isdefined(var_b0b958b3.smokegrenadeduration) ? var_b0b958b3.smokegrenadeduration : level.smokegrenadeduration);
}

/*
	Name: function_184e15d2
	Namespace: smokegrenade
	Checksum: 0x41ABD685
	Offset: 0x3D8
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function function_184e15d2(weapon)
{
	if(!isdefined(weapon.customsettings))
	{
		return level.smokegrenadedissipation;
	}
	var_b0b958b3 = getscriptbundle(weapon.customsettings);
	return (isdefined(var_b0b958b3.smokegrenadedissipation) ? var_b0b958b3.smokegrenadedissipation : level.smokegrenadedissipation);
}

/*
	Name: watchsmokegrenadedetonation
	Namespace: smokegrenade
	Checksum: 0x2D92AFEC
	Offset: 0x458
	Size: 0x16C
	Parameters: 5
	Flags: None
*/
function watchsmokegrenadedetonation(owner, statweapon, smokeweapon, duration, totaltime)
{
	self endon(#"trophy_destroyed");
	if(isplayer(owner))
	{
		owner stats::function_e24eec31(statweapon, #"used", 1);
	}
	waitresult = undefined;
	waitresult = self waittill(#"explode", #"death");
	if(waitresult._notify != "explode")
	{
		return;
	}
	onefoot = vectorscale((0, 0, 1), 12);
	startpos = waitresult.position + onefoot;
	smokedetonate(owner, statweapon, smokeweapon, waitresult.position, function_79d42bea(smokeweapon), totaltime, duration);
	damageeffectarea(owner, startpos, smokeweapon.explosionradius, level.willypetedamageheight);
}

/*
	Name: smokedetonate
	Namespace: smokegrenade
	Checksum: 0xC373BD6
	Offset: 0x5D0
	Size: 0x1D0
	Parameters: 7
	Flags: None
*/
function smokedetonate(owner, statweapon, smokeweapon, position, radius, effectlifetime, smokeblockduration)
{
	dir_up = (0, 0, 1);
	if(!isdefined(effectlifetime))
	{
		effectlifetime = 10;
	}
	ent = spawn("script_model", position);
	if(isdefined(owner))
	{
		ent setteam(owner.team);
		if(isplayer(owner))
		{
			ent setowner(owner);
		}
	}
	if(ent function_c7b93adf(smokeweapon))
	{
		ent smokeblocksight(radius);
	}
	ent thread spawnsmokegrenadetrigger(smokeweapon, smokeblockduration, owner);
	if(isdefined(owner))
	{
		owner.smokegrenadetime = gettime();
		owner.smokegrenadeposition = position;
	}
	thread playsmokesound(position, smokeblockduration, statweapon.projsmokestartsound, statweapon.projsmokeendsound, statweapon.projsmokeloopsound);
	if(sessionmodeiscampaigngame() && self.var_3791d005 !== 0)
	{
		badplace_cylinder("", effectlifetime * 0.666, position, radius, radius, "axis");
	}
	return ent;
}

/*
	Name: damageeffectarea
	Namespace: smokegrenade
	Checksum: 0xD264A230
	Offset: 0x7A8
	Size: 0x94
	Parameters: 4
	Flags: None
*/
function damageeffectarea(owner, position, radius, height)
{
	effectarea = spawn("trigger_radius", position, 0, radius, height);
	if(isdefined(level.dogsonflashdogs))
	{
		owner thread [[level.dogsonflashdogs]](effectarea);
	}
	effectarea delete();
}

/*
	Name: smokeblocksight
	Namespace: smokegrenade
	Checksum: 0xD365F83E
	Offset: 0x848
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function smokeblocksight(radius)
{
	fxblocksight(self, radius);
	/#
		if(getdvarint(#"scr_smokegrenade_debug", 0))
		{
			self thread function_f02a8a0b(radius);
		}
	#/
}

/*
	Name: function_f02a8a0b
	Namespace: smokegrenade
	Checksum: 0x4E0090D
	Offset: 0x8B8
	Size: 0x68
	Parameters: 1
	Flags: None
*/
function function_f02a8a0b(radius)
{
	self endon(#"death");
	/#
		while(true)
		{
			sphere(self.origin, radius, (1, 0, 0), 0.25, 0, 20, 15);
			wait(0.75);
		}
	#/
}

/*
	Name: function_c7b93adf
	Namespace: smokegrenade
	Checksum: 0xD635479F
	Offset: 0x928
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function function_c7b93adf(weapon)
{
	if(!isdefined(weapon.customsettings))
	{
		return 1;
	}
	var_b0b958b3 = getscriptbundle(weapon.customsettings);
	return is_true(var_b0b958b3.var_afa9a0c4);
}

/*
	Name: waitanddelete
	Namespace: smokegrenade
	Checksum: 0x5C319D21
	Offset: 0x998
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function waitanddelete(time)
{
	self ghost();
	self endon(#"death");
	wait(time);
	self delete();
}

/*
	Name: spawnsmokegrenadetrigger
	Namespace: smokegrenade
	Checksum: 0xE0065FF4
	Offset: 0x9F8
	Size: 0x1F4
	Parameters: 3
	Flags: None
*/
function spawnsmokegrenadetrigger(smokeweapon, duration, owner)
{
	team = self.team;
	radius = function_79d42bea(smokeweapon);
	trigger = spawn("trigger_radius", self.origin, 0, radius, radius);
	trigger.owner = owner;
	self.smoketrigger = trigger;
	if(isdefined(owner.team))
	{
		trigger setteamfortrigger(owner.team);
		trigger.team = owner.team;
	}
	if(!isdefined(level.smoke_grenade_triggers))
	{
		level.smoke_grenade_triggers = [];
	}
	else if(!isarray(level.smoke_grenade_triggers))
	{
		level.smoke_grenade_triggers = array(level.smoke_grenade_triggers);
	}
	level.smoke_grenade_triggers[level.smoke_grenade_triggers.size] = trigger;
	if(function_579815a1(smokeweapon))
	{
		thread function_8b6ddd71(self, smokeweapon);
	}
	self waittilltimeout(duration, #"death");
	arrayremovevalue(level.smoke_grenade_triggers, trigger);
	if(isdefined(self))
	{
		self thread waitanddelete(1);
	}
	if(isdefined(trigger))
	{
		trigger delete();
	}
}

/*
	Name: function_b4a975f1
	Namespace: smokegrenade
	Checksum: 0x12724AD9
	Offset: 0xBF8
	Size: 0x286
	Parameters: 5
	Flags: None
*/
function function_b4a975f1(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	if(!isdefined(weapon) || !isdefined(attackerweapon))
	{
		return false;
	}
	smoketrigger = attackerweapon function_367ce00e();
	if(isdefined(smoketrigger))
	{
		if(weapon === smoketrigger.owner)
		{
			if(isdefined(meansofdeath) && meansofdeath !== level.var_8e2aec59)
			{
				if(!isdefined(smoketrigger.var_25db02aa))
				{
					smoketrigger.kills = (isdefined(smoketrigger.kills) ? smoketrigger.kills : 0) + 1;
					var_9194a036 = battlechatter::mpdialog_value("muteSmokeSuccessLineCount", 0);
					if(smoketrigger.kills == (isdefined(var_9194a036) ? var_9194a036 : 3))
					{
						weapon battlechatter::play_gadget_success(getweapon(#"willy_pete"), undefined, attackerweapon, undefined);
						smoketrigger.var_25db02aa = 1;
					}
				}
			}
			weapon stats::function_e24eec31(meansofdeath, #"kill_smoked_blinded_stunned", 1);
			weapon contracts::increment_contract(#"hash_6477d3e8a879d241");
			return true;
		}
		if(isplayer(smoketrigger.owner) && isalive(smoketrigger.owner) && util::function_fbce7263(smoketrigger.owner.team, attackerweapon.team))
		{
			if(level.teambased)
			{
				scoreevents::processscoreevent(#"smoke_assist", smoketrigger.owner, undefined, getweapon(#"willy_pete"));
			}
		}
	}
	return false;
}

/*
	Name: function_367ce00e
	Namespace: smokegrenade
	Checksum: 0xCE27B564
	Offset: 0xE88
	Size: 0xBE
	Parameters: 1
	Flags: None
*/
function function_367ce00e(var_7acab93a)
{
	foreach(trigger in level.smoke_grenade_triggers)
	{
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
	Name: function_4cc4db89
	Namespace: smokegrenade
	Checksum: 0x33617AB8
	Offset: 0xF50
	Size: 0xE0
	Parameters: 2
	Flags: None
*/
function function_4cc4db89(team, var_7acab93a)
{
	foreach(trigger in level.smoke_grenade_triggers)
	{
		if(!trigger util::isenemyteam(team) && self istouching(trigger))
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
	Name: function_50ef4b12
	Namespace: smokegrenade
	Checksum: 0x5058CC6
	Offset: 0x1038
	Size: 0x130
	Parameters: 1
	Flags: None
*/
function function_50ef4b12(weapon)
{
	if(getweapon(#"eq_smoke") == weapon.rootweapon)
	{
		return true;
	}
	if(getweapon(#"willy_pete") == weapon.rootweapon)
	{
		return true;
	}
	if(getweapon(#"hash_615e6c73989c85b4") == weapon.rootweapon)
	{
		return true;
	}
	if(getweapon(#"hash_7a88daffaea7a9cf") == weapon.rootweapon)
	{
		return true;
	}
	if(getweapon(#"spectre_grenade") == weapon.rootweapon)
	{
		return true;
	}
	if(getweapon(#"hash_34fa23e332e34886") == weapon.rootweapon)
	{
		return true;
	}
	return false;
}

/*
	Name: function_579815a1
	Namespace: smokegrenade
	Checksum: 0xD957EFD8
	Offset: 0x1170
	Size: 0x78
	Parameters: 1
	Flags: Private
*/
function private function_579815a1(weapon)
{
	if(!isdefined(weapon.customsettings))
	{
		return false;
	}
	var_e6fbac16 = getscriptbundle(weapon.customsettings);
	if(var_e6fbac16.var_8ceb6ac8 === 1)
	{
		return true;
	}
	if(var_e6fbac16.var_6942aad6 === 1)
	{
		return true;
	}
	return false;
}

/*
	Name: function_87d0a127
	Namespace: smokegrenade
	Checksum: 0x61115437
	Offset: 0x11F0
	Size: 0x162
	Parameters: 2
	Flags: None
*/
function function_87d0a127(grenadeent, smokeweapon)
{
	if(!isdefined(smokeweapon.smoketrigger))
	{
		return;
	}
	grenadeteam = smokeweapon.team;
	owner = smokeweapon.smoketrigger.owner;
	while(true)
	{
		waitresult = undefined;
		waitresult = smokeweapon waittilltimeout(0.25, #"death");
		if(isdefined(owner))
		{
			if(isdefined(smokeweapon.smoketrigger) && owner istouching(smokeweapon.smoketrigger) && waitresult._notify == #"timeout")
			{
				owner clientfield::set("inenemysmoke", 1);
			}
			else
			{
				owner clientfield::set("inenemysmoke", 0);
			}
		}
		if(!isdefined(owner) || !isdefined(smokeweapon) || waitresult._notify != "timeout")
		{
			break;
		}
	}
}

/*
	Name: function_8b6ddd71
	Namespace: smokegrenade
	Checksum: 0xA0D7EC5D
	Offset: 0x1360
	Size: 0x2EC
	Parameters: 2
	Flags: None
*/
function function_8b6ddd71(grenadeent, smokeweapon)
{
	if(!isdefined(smokeweapon.smoketrigger))
	{
		return;
	}
	grenadeteam = smokeweapon.team;
	while(true)
	{
		waitresult = undefined;
		waitresult = smokeweapon waittilltimeout(0.25, #"death");
		foreach(player in level.players)
		{
			if(!isdefined(player))
			{
				continue;
			}
			curval = player clientfield::get("insmoke");
			if(isdefined(smokeweapon.smoketrigger) && player istouching(smokeweapon.smoketrigger) && waitresult._notify == #"timeout")
			{
				if(player util::isenemyteam(grenadeteam))
				{
					player clientfield::set("insmoke", curval | 1);
				}
				else
				{
					player clientfield::set("insmoke", curval | 2);
				}
				continue;
			}
			if(player util::isenemyteam(grenadeteam))
			{
				mask = 1;
			}
			else
			{
				mask = 2;
			}
			if(curval & mask)
			{
				trig = undefined;
				if(isdefined(smokeweapon))
				{
					trig = function_4cc4db89(grenadeteam, smokeweapon.smoketrigger);
				}
				if(!isdefined(trig))
				{
					player clientfield::set("insmoke", curval & (~mask));
				}
			}
		}
		if(!isdefined(smokeweapon) || waitresult._notify != "timeout" || (!isdefined(smokeweapon.smoketrigger) && smokeweapon.item === getweapon(#"spectre_grenade")))
		{
			break;
		}
	}
}

/*
	Name: function_debb0d4e
	Namespace: smokegrenade
	Checksum: 0xACAEA73A
	Offset: 0x1658
	Size: 0x284
	Parameters: 1
	Flags: Event
*/
event function_debb0d4e(eventstruct)
{
	weapon = eventstruct.weapon;
	if(!function_50ef4b12(weapon))
	{
		return;
	}
	if(weapon.rootweapon == getweapon(#"eq_smoke"))
	{
		weapon_smoke = getweapon(#"eq_smoke");
	}
	else
	{
		if(weapon.rootweapon == getweapon(#"hash_34fa23e332e34886"))
		{
			weapon_smoke = getweapon(#"hash_34fa23e332e34886");
		}
		else
		{
			if(weapon.rootweapon == getweapon(#"spectre_grenade"))
			{
				weapon_smoke = getweapon(#"spectre_grenade");
			}
			else
			{
				weapon_smoke = getweapon(#"willy_pete");
			}
		}
	}
	duration = function_f199623f(weapon_smoke);
	totaltime = duration + function_184e15d2(weapon_smoke);
	grenade = eventstruct.projectile;
	if(grenade util::ishacked())
	{
		return;
	}
	grenade thread watchsmokegrenadedetonation(self, weapon_smoke, weapon_smoke, duration, totaltime);
	waitresult = undefined;
	waitresult = grenade waittill(#"stationary", #"death");
	if(waitresult._notify == "stationary")
	{
		playfx(#"hash_4ca8a1df731cf6a1", grenade.origin, (0, 0, 1), (1, 0, 0));
	}
}

/*
	Name: playsmokesound
	Namespace: smokegrenade
	Checksum: 0x58C643C5
	Offset: 0x18E8
	Size: 0x13C
	Parameters: 5
	Flags: None
*/
function playsmokesound(position, duration, startsound, stopsound, loopsound)
{
	smokesound = spawn("script_origin", (0, 0, 1));
	if(isdefined(smokesound))
	{
		smokesound endon(#"death");
		smokesound.origin = position;
		if(isdefined(startsound))
		{
			smokesound playsound(startsound);
		}
		if(isdefined(loopsound))
		{
			smokesound playloopsound(loopsound);
		}
		if(duration > 0.5)
		{
			wait(duration - 0.5);
		}
		if(isdefined(stopsound))
		{
			thread sound::play_in_space(stopsound, position);
		}
		smokesound stoploopsound(0.5);
		wait(0.5);
		smokesound delete();
	}
}

