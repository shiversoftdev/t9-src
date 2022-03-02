#using script_396f7d71538c9677;
#using script_47fb62300ac0bd60;
#using script_545a0bac37bda541;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace smokegrenade;

/*
	Name: function_ee73ae94
	Namespace: smokegrenade
	Checksum: 0x96CD86E3
	Offset: 0x1A0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ee73ae94()
{
	level notify(1533731461);
}

/*
	Name: init_shared
	Namespace: smokegrenade
	Checksum: 0xB5B90288
	Offset: 0x1C0
	Size: 0x184
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
	clientfield::register("allplayers", "foggerpostfx", 9000, 1, "int");
	clientfield::register("scriptmover", "smoke_state", 16000, 1, "int");
	globallogic_score::function_5a241bd8(getweapon(#"willy_pete"), &function_b4a975f1);
}

/*
	Name: function_79d42bea
	Namespace: smokegrenade
	Checksum: 0xD4E876BC
	Offset: 0x350
	Size: 0x66
	Parameters: 1
	Flags: None
*/
function function_79d42bea(weapon)
{
	if(!isdefined(weapon.var_4dd46f8a))
	{
		return 128;
	}
	var_b0b958b3 = getscriptbundle(weapon.var_4dd46f8a);
	return (isdefined(var_b0b958b3.var_40dfefd1) ? var_b0b958b3.var_40dfefd1 : 128);
}

/*
	Name: function_36d48dce
	Namespace: smokegrenade
	Checksum: 0xD4140889
	Offset: 0x3C0
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function function_36d48dce(weapon)
{
	if(!isdefined(weapon.var_4dd46f8a))
	{
		return 128;
	}
	var_b0b958b3 = getscriptbundle(weapon.var_4dd46f8a);
	return (isdefined(var_b0b958b3.var_9e166547) ? var_b0b958b3.var_9e166547 : function_79d42bea(weapon));
}

/*
	Name: function_f199623f
	Namespace: smokegrenade
	Checksum: 0x37CEE441
	Offset: 0x440
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function function_f199623f(weapon)
{
	if(!isdefined(weapon.var_4dd46f8a))
	{
		return level.smokegrenadeduration;
	}
	var_b0b958b3 = getscriptbundle(weapon.var_4dd46f8a);
	return (isdefined(var_b0b958b3.smokegrenadeduration) ? var_b0b958b3.smokegrenadeduration : level.smokegrenadeduration);
}

/*
	Name: function_184e15d2
	Namespace: smokegrenade
	Checksum: 0x30D52CB1
	Offset: 0x4C0
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function function_184e15d2(weapon)
{
	if(!isdefined(weapon.var_4dd46f8a))
	{
		return level.smokegrenadedissipation;
	}
	var_b0b958b3 = getscriptbundle(weapon.var_4dd46f8a);
	return (isdefined(var_b0b958b3.smokegrenadedissipation) ? var_b0b958b3.smokegrenadedissipation : level.smokegrenadedissipation);
}

/*
	Name: watchsmokegrenadedetonation
	Namespace: smokegrenade
	Checksum: 0x4A6C0BBB
	Offset: 0x540
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
	Checksum: 0x299B72D8
	Offset: 0x6B8
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
	Checksum: 0xA8C3FAAC
	Offset: 0x890
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
	Checksum: 0x12FA221B
	Offset: 0x930
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
	Checksum: 0x68DBA17D
	Offset: 0x9A0
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
	Checksum: 0xD9F32220
	Offset: 0xA10
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function function_c7b93adf(weapon)
{
	if(!isdefined(weapon.var_4dd46f8a))
	{
		return 1;
	}
	var_b0b958b3 = getscriptbundle(weapon.var_4dd46f8a);
	return is_true(var_b0b958b3.var_afa9a0c4);
}

/*
	Name: waitanddelete
	Namespace: smokegrenade
	Checksum: 0xB73D14EB
	Offset: 0xA80
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
	Checksum: 0x9247AF7B
	Offset: 0xAE0
	Size: 0x1FC
	Parameters: 3
	Flags: None
*/
function spawnsmokegrenadetrigger(smokeweapon, duration, owner)
{
	team = self.team;
	radius = function_79d42bea(smokeweapon);
	trigger = spawn("trigger_radius", self.origin, 0, radius, radius);
	trigger.owner = owner;
	trigger.smokeweapon = smokeweapon;
	self.var_b999539c = trigger;
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
	Checksum: 0xAB2F976F
	Offset: 0xCE8
	Size: 0x2AE
	Parameters: 5
	Flags: None
*/
function function_b4a975f1(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	if(!isdefined(weapon) || !isdefined(attackerweapon))
	{
		return false;
	}
	var_b999539c = attackerweapon function_367ce00e();
	if(isdefined(var_b999539c))
	{
		if(weapon === var_b999539c.owner)
		{
			if(isdefined(meansofdeath) && meansofdeath !== level.var_8e2aec59)
			{
				if(!isdefined(var_b999539c.var_25db02aa))
				{
					var_b999539c.kills = (isdefined(var_b999539c.kills) ? var_b999539c.kills : 0) + 1;
					var_9194a036 = battlechatter::mpdialog_value("muteSmokeSuccessLineCount", 0);
					if(var_b999539c.kills == (isdefined(var_9194a036) ? var_9194a036 : 3))
					{
						weapon battlechatter::play_gadget_success(getweapon(#"willy_pete"), undefined, attackerweapon, undefined);
						var_b999539c.var_25db02aa = 1;
					}
				}
			}
			weapon stats::function_e24eec31(meansofdeath, #"kill_smoked_blinded_stunned", 1);
			weapon contracts::function_a54e2068(#"hash_6477d3e8a879d241");
			weapon stats::function_dad108fa(#"hash_3c5a82d06549abcc", 1);
			return true;
		}
		if(isplayer(var_b999539c.owner) && isalive(var_b999539c.owner) && util::function_fbce7263(var_b999539c.owner.team, attackerweapon.team))
		{
			if(level.teambased)
			{
				scoreevents::processscoreevent(#"hash_2ffa19a7dfef2ea0", var_b999539c.owner, undefined, getweapon(#"willy_pete"));
			}
		}
	}
	return false;
}

/*
	Name: function_367ce00e
	Namespace: smokegrenade
	Checksum: 0x12D21B33
	Offset: 0xFA0
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
	Checksum: 0x18BF1874
	Offset: 0x1068
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
	Name: function_65fc89ee
	Namespace: smokegrenade
	Checksum: 0xA26583B
	Offset: 0x1150
	Size: 0x15A
	Parameters: 1
	Flags: None
*/
function function_65fc89ee(weapon)
{
	foreach(trigger in level.smoke_grenade_triggers)
	{
		if(self istouching(trigger))
		{
			var_125b3ffe = sqr(function_36d48dce(trigger.smokeweapon));
			var_6f320631 = (isdefined(self gettagorigin("j_head")) ? self gettagorigin("j_head") : self.origin);
			distsq = distance2dsquared(trigger.origin, var_6f320631);
			if(distsq < var_125b3ffe)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_50ef4b12
	Namespace: smokegrenade
	Checksum: 0x782EDA8D
	Offset: 0x12B8
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
	if(getweapon(#"hash_531d2030796963b2") == weapon.rootweapon)
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
	Checksum: 0xAE0F556C
	Offset: 0x13F0
	Size: 0x78
	Parameters: 1
	Flags: Private
*/
function private function_579815a1(weapon)
{
	if(!isdefined(weapon.var_4dd46f8a))
	{
		return false;
	}
	var_e6fbac16 = getscriptbundle(weapon.var_4dd46f8a);
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
	Checksum: 0x63E13EFE
	Offset: 0x1470
	Size: 0x162
	Parameters: 2
	Flags: None
*/
function function_87d0a127(grenadeent, smokeweapon)
{
	if(!isdefined(smokeweapon.var_b999539c))
	{
		return;
	}
	var_ce7665b1 = smokeweapon.team;
	owner = smokeweapon.var_b999539c.owner;
	while(true)
	{
		waitresult = undefined;
		waitresult = smokeweapon waittilltimeout(0.15, #"death");
		if(isdefined(owner))
		{
			if(isdefined(smokeweapon.var_b999539c) && owner istouching(smokeweapon.var_b999539c) && waitresult._notify == #"timeout")
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
	Checksum: 0x35C3E22B
	Offset: 0x15E0
	Size: 0x36C
	Parameters: 2
	Flags: None
*/
function function_8b6ddd71(grenadeent, smokeweapon)
{
	if(!isdefined(grenadeent.var_b999539c))
	{
		return;
	}
	var_ce7665b1 = grenadeent.team;
	while(true)
	{
		waitresult = undefined;
		waitresult = grenadeent waittilltimeout(0.15, #"death");
		foreach(player in level.players)
		{
			if(!isdefined(player))
			{
				continue;
			}
			curval = player clientfield::get("insmoke");
			if(waitresult._notify == #"timeout" && player function_65fc89ee(smokeweapon))
			{
				player clientfield::set("foggerpostfx", 1);
			}
			else
			{
				player clientfield::set("foggerpostfx", 0);
			}
			if(isdefined(grenadeent.var_b999539c) && player istouching(grenadeent.var_b999539c) && waitresult._notify == #"timeout")
			{
				if(player util::isenemyteam(var_ce7665b1))
				{
					player clientfield::set("insmoke", curval | 1);
				}
				else
				{
					player clientfield::set("insmoke", curval | 2);
				}
				continue;
			}
			if(player util::isenemyteam(var_ce7665b1))
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
				if(isdefined(grenadeent))
				{
					trig = player function_4cc4db89(var_ce7665b1, grenadeent.var_b999539c);
				}
				if(!isdefined(trig))
				{
					player clientfield::set("insmoke", curval & (~mask));
				}
			}
		}
		if(!isdefined(grenadeent) || waitresult._notify != "timeout" || (!isdefined(grenadeent.var_b999539c) && grenadeent.item === getweapon(#"hash_531d2030796963b2")))
		{
			break;
		}
	}
}

/*
	Name: function_debb0d4e
	Namespace: smokegrenade
	Checksum: 0xCC604691
	Offset: 0x1958
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
			if(weapon.rootweapon == getweapon(#"hash_531d2030796963b2"))
			{
				weapon_smoke = getweapon(#"hash_531d2030796963b2");
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
	Checksum: 0xA636C89D
	Offset: 0x1BE8
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

