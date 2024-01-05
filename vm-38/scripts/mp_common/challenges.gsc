#using scripts\killstreaks\mp\uav.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\scoreevents.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using script_7f6cd71c43c45c57;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using script_6167e26342be354b;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\killstreaks\emp_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\activecamo_shared.gsc;

#namespace challenges;

/*
	Name: function_4394b23b
	Namespace: challenges
	Checksum: 0xF92F9839
	Offset: 0x4F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4394b23b()
{
	level notify(-838931208);
}

/*
	Name: __init__system__
	Namespace: challenges
	Checksum: 0x286BC8F5
	Offset: 0x510
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"challenges", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: challenges
	Checksum: 0x61CEC18D
	Offset: 0x558
	Size: 0x310
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.challengescallbacks))
	{
		level.challengescallbacks = [];
	}
	callback::on_start_gametype(&start_gametype);
	callback::on_spawned(&on_player_spawn);
	callback::add_callback(#"scavenged_primary_grenade", &scavenged_primary_grenade);
	callback::add_callback(#"hash_171443902e2a22ee", &function_2bc84a5f);
	level.challenges_callback_vehiclekilled = &vehiclekilled;
	level.var_4d062db3 = &killstreak_started;
	level.var_706f827 = &function_e7e09ca1;
	level.var_d92c4db3 = &function_1123ffd1;
	level.var_de946e0 = &function_3d9dbb3a;
	level.var_f18966dd = &function_e143d63b;
	level.var_c8de519d = {};
	level.var_c8de519d.multikill = &function_19e8b086;
	level.var_c8de519d.var_ec391d55 = &function_3ee91387;
	level.var_7897141a = [];
	level.var_7897141a[getweapon(#"hash_66401df7cd6bf292")] = 1;
	level.var_7897141a[getweapon(#"hash_3f62a872201cd1ce")] = 1;
	level.var_ca4ce464 = [];
	level.var_ca4ce464[getweapon(#"ability_smart_cover")] = 1;
	level.var_1d971504 = &function_7007692f;
	level.var_fc6cd245 = &function_5af500d9;
	level.var_f9922f0b = &function_23320f51;
	level.var_faccd7d4 = [#"hash_73f1fe390db552da":&function_486d4ce3, #"hash_5b3c69ab88f8a086":&function_8c48d8ff, #"hash_494be20e0ae54646":&function_8c48d8ff, #"hash_7ef27b4daf600fa3":&function_8c48d8ff];
}

/*
	Name: start_gametype
	Namespace: challenges
	Checksum: 0xFDC306F
	Offset: 0x870
	Size: 0x1CC
	Parameters: 0
	Flags: Linked
*/
function start_gametype()
{
	waittillframeend();
	if(isdefined(level.scoreeventgameendcallback))
	{
		registerchallengescallback("gameEnd", level.scoreeventgameendcallback);
	}
	if(canprocesschallenges())
	{
		registerchallengescallback("playerKilled", &challengekills);
		registerchallengescallback("vehicleKilled", &function_8e9b2d44);
		registerchallengescallback("gameEnd", &challengegameendmp);
		registerchallengescallback("gun_level_complete_last_rank", &function_b15a1e1e);
		player::function_3c5cc656(&function_a79ea08b);
		self callback::add_callback(#"done_healing", &player_fully_healed);
		level.var_9ff21849 = (isdefined(getgametypesetting(#"hash_7647d0e9a45eeca6")) ? getgametypesetting(#"hash_7647d0e9a45eeca6") : 0);
		if(level.teambased)
		{
			function_be3d23d1();
		}
	}
	callback::on_connect(&on_player_connect);
}

/*
	Name: on_player_connect
	Namespace: challenges
	Checksum: 0x45716104
	Offset: 0xA48
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	initchallengedata();
}

/*
	Name: function_1123ffd1
	Namespace: challenges
	Checksum: 0x98BC2D22
	Offset: 0xA70
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_1123ffd1()
{
	return self loadout::function_18a77b37("primary");
}

/*
	Name: function_3d9dbb3a
	Namespace: challenges
	Checksum: 0xEC84BF5C
	Offset: 0xAA0
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_3d9dbb3a()
{
	return self loadout::function_18a77b37("secondary");
}

/*
	Name: function_e143d63b
	Namespace: challenges
	Checksum: 0x2EAACEF9
	Offset: 0xAD0
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_e143d63b()
{
	return self loadout::function_18a77b37("specialgrenade");
}

/*
	Name: initchallengedata
	Namespace: challenges
	Checksum: 0xC8612F4E
	Offset: 0xB00
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function initchallengedata()
{
	self.var_9cd2c51d = {};
	self.pers[#"stickexplosivekill"] = 0;
	self.pers[#"carepackagescalled"] = 0;
	self.pers[#"challenge_destroyed_air"] = 0;
	self.pers[#"challenge_destroyed_ground"] = 0;
	self.pers[#"challenge_anteup_earn"] = 0;
	self.pers[#"specialiststatabilityusage"] = 0;
	self.pers[#"activekillstreaks"] = [];
	self.pers[#"killnemesis"] = 0;
	self.pers[#"killsfastmagext"] = 0;
	self.pers[#"longshotsperlife"] = 0;
	self.pers[#"specialiststatabilityusage"] = 0;
	self.challenge_defenderkillcount = 0;
	self.challenge_offenderkillcount = 0;
	self.challenge_offenderprojectilemultikillcount = 0;
	self.challenge_offendercomlinkkillcount = 0;
	self.challenge_offendersentryturretkillcount = 0;
	self.challenge_objectivedefensivekillcount = 0;
	self.challenge_scavengedcount = 0;
	self.challenge_resuppliednamekills = 0;
	self.challenge_objectivedefensive = undefined;
	self.challenge_objectiveoffensive = undefined;
	self.challenge_lastsurvivewithflakfrom = undefined;
	self.explosiveinfo = [];
	self function_6b34141d();
}

/*
	Name: function_6b34141d
	Namespace: challenges
	Checksum: 0x17008AF2
	Offset: 0xCB8
	Size: 0x86
	Parameters: 0
	Flags: Linked
*/
function function_6b34141d()
{
	self.weaponkillsthisspawn = [];
	self.var_93da0d74 = [];
	self.var_c9062c1c = [];
	self.attachmentkillsthisspawn = [];
	self.challenge_hatchettosscount = 0;
	self.challenge_hatchetkills = 0;
	self.challenge_combatrobotattackclientid = [];
	self.var_ee07421b = [];
	self.var_9cd2c51d.var_a063d754 = 0;
	self.var_3c9fd034 = undefined;
	self.var_26b87dc4 = 1;
}

/*
	Name: function_edc4ebe8
	Namespace: challenges
	Checksum: 0x94D9E197
	Offset: 0xD48
	Size: 0x122
	Parameters: 1
	Flags: Event
*/
event function_edc4ebe8(eventstruct)
{
	if(!isdefined(self.var_ea1458aa))
	{
		return;
	}
	var_f2b25a4e = (self isusingoffhand() ? self getcurrentoffhand() : eventstruct.weapon);
	if(var_f2b25a4e.var_76ce72e8)
	{
		self.var_ea1458aa.var_59ac2f5 = undefined;
		scoreevents = globallogic_score::function_3cbc4c6c(var_f2b25a4e.var_2e4a8800);
		if(isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1)
		{
			self.var_ea1458aa.var_59ac2f5 = 0;
		}
	}
	else if(!isdefined(level.var_ca4ce464) || level.var_ca4ce464[var_f2b25a4e] !== 1)
	{
		self.var_ea1458aa.var_96d50420 = undefined;
		if(var_f2b25a4e.issignatureweapon)
		{
			self.var_ea1458aa.var_96d50420 = 0;
		}
	}
}

/*
	Name: function_97023fdf
	Namespace: challenges
	Checksum: 0x4C6DF5F5
	Offset: 0xE78
	Size: 0x2E
	Parameters: 1
	Flags: Event
*/
event function_97023fdf(eventstruct)
{
	if(!isdefined(self.var_ea1458aa))
	{
		return;
	}
	newweapon = eventstruct.weapon;
}

/*
	Name: function_4776caf4
	Namespace: challenges
	Checksum: 0xDDCC0C45
	Offset: 0xEB0
	Size: 0x202
	Parameters: 1
	Flags: Event
*/
event function_4776caf4(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	newweapon = eventstruct.weapon;
	if(isdefined(self.var_9cd2c51d))
	{
		if(isdefined(level.var_ca4ce464) && level.var_ca4ce464[newweapon] === 1)
		{
			self.var_9cd2c51d.var_d298c9a8 = undefined;
			if(newweapon.issignatureweapon)
			{
				self.var_9cd2c51d.var_d298c9a8 = 0;
			}
		}
	}
	if(isdefined(self.var_ea1458aa))
	{
		if(isdefined(level.var_7897141a) && level.var_7897141a[newweapon] !== 1)
		{
			if(!newweapon.issignatureweapon)
			{
				self.var_ea1458aa.var_59ac2f5 = undefined;
				if(newweapon.var_76ce72e8)
				{
					scoreevents = globallogic_score::function_3cbc4c6c(newweapon.var_2e4a8800);
					if(isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1)
					{
						self.var_ea1458aa.var_59ac2f5 = 0;
					}
				}
			}
		}
	}
	if(level.var_e7c95d09 !== 1)
	{
		if(isdefined(eventstruct.projectile))
		{
			grenade = eventstruct.projectile;
			weapon = eventstruct.weapon;
			if(weapon.rootweapon.name == "hatchet")
			{
				self.challenge_hatchettosscount++;
				grenade.challenge_hatchettosscount = self.challenge_hatchettosscount;
			}
			if(self issprinting())
			{
				grenade.ownerwassprinting = 1;
			}
		}
	}
}

/*
	Name: player_fully_healed
	Namespace: challenges
	Checksum: 0x9703D605
	Offset: 0x10C0
	Size: 0xEE
	Parameters: 0
	Flags: Linked
*/
function player_fully_healed()
{
	var_c3ade07c = self.var_ea1458aa;
	info = self.var_9cd2c51d;
	if(isdefined(var_c3ade07c) && isdefined(info))
	{
		if(isdefined(info.var_6e219f3c) && info.var_6e219f3c <= 52)
		{
			if(!isdefined(var_c3ade07c.recover_full_health_from_critical))
			{
				var_c3ade07c.recover_full_health_from_critical = 0;
			}
			var_c3ade07c.recover_full_health_from_critical++;
			if(var_c3ade07c.recover_full_health_from_critical >= 3)
			{
				self stats::function_dad108fa(#"recover_full_health_from_critical", 1);
				var_c3ade07c.recover_full_health_from_critical = undefined;
			}
			var_c3ade07c.var_55a37dc7 = 1;
		}
		else
		{
			var_c3ade07c.var_55a37dc7 = 0;
		}
		var_c3ade07c.var_a440c10 = gettime();
	}
}

/*
	Name: scavenged_primary_grenade
	Namespace: challenges
	Checksum: 0x6E8C85E3
	Offset: 0x11B8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function scavenged_primary_grenade(params)
{
	if(!isdefined(self.challenge_scavengedcount))
	{
		self.challenge_scavengedcount = 0;
	}
	self.challenge_scavengedcount++;
}

/*
	Name: function_2bc84a5f
	Namespace: challenges
	Checksum: 0x5DF4DEE7
	Offset: 0x11F0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_2bc84a5f(event_params)
{
	if(isplayer(self))
	{
		level thread function_53813a83(self);
	}
}

/*
	Name: function_53813a83
	Namespace: challenges
	Checksum: 0xECA32896
	Offset: 0x1238
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_53813a83(player)
{
	self notify("33c5af87c8b9515d");
	self endon("33c5af87c8b9515d");
	player endon(#"death", #"disconnect");
	while(!player isonground())
	{
		waitframe(1);
	}
	player.var_1e1c7f1b = gettime();
}

/*
	Name: function_6a50096c
	Namespace: challenges
	Checksum: 0xFE8EB1F2
	Offset: 0x12B8
	Size: 0x16
	Parameters: 1
	Flags: Event
*/
event function_6a50096c(eventstruct)
{
	self.challenge_jump_begin = gettime();
}

/*
	Name: function_d385546a
	Namespace: challenges
	Checksum: 0xE6E0D21B
	Offset: 0x12D8
	Size: 0x16
	Parameters: 1
	Flags: Event
*/
event function_d385546a(eventstruct)
{
	self.challenge_slide_end = gettime();
}

/*
	Name: function_a65ce628
	Namespace: challenges
	Checksum: 0x7247A418
	Offset: 0x12F8
	Size: 0x16
	Parameters: 1
	Flags: Event
*/
event function_a65ce628(eventstruct)
{
	self.challenge_sprint_end = gettime();
}

/*
	Name: function_a79ea08b
	Namespace: challenges
	Checksum: 0x48FF6F86
	Offset: 0x1318
	Size: 0x3204
	Parameters: 4
	Flags: Linked
*/
function function_a79ea08b(einflictor, victim, idamage, weapon)
{
	if(!isplayer(self))
	{
		return;
	}
	if(!isplayer(idamage))
	{
		return;
	}
	if(!isdefined(self.team))
	{
		return;
	}
	if(!isdefined(idamage.team))
	{
		return;
	}
	if(!isdefined(weapon) || !isdefined(idamage.var_ea1458aa.attackerdamage))
	{
		return;
	}
	if(level.teambased)
	{
		if(self.team == idamage.team)
		{
			return;
		}
	}
	else if(self == idamage)
	{
		return;
	}
	time = gettime();
	var_5afc3871 = self function_65776b07();
	killstreak = killstreaks::get_from_weapon(weapon);
	if(!isdefined(killstreak))
	{
		var_6af452fc = function_2e532eed(idamage.var_ea1458aa.attackerdamage[self.clientid]);
		var_5018995b = idamage.gadget_weapon;
		var_bcbcb4ec = (isdefined(level.var_49ef5263) ? idamage [[level.var_49ef5263]]() : 0);
		var_fff76b4 = idamage.var_b6672e47;
		totalenemies = countplayers(idamage.team);
		victimentnum = idamage getentitynumber();
		var_3cd641b = var_6af452fc.class_num;
		if(!isdefined(self.var_ea1458aa))
		{
			self.var_ea1458aa = {};
		}
		if(!isdefined(self.var_ea1458aa.ekia))
		{
			self.var_ea1458aa.ekia = [];
		}
		if(!isdefined(self.var_ea1458aa.ekia[#"primary"]))
		{
			self.var_ea1458aa.ekia[#"primary"] = 0;
		}
		if(!isdefined(self.var_ea1458aa.ekia[#"secondary"]))
		{
			self.var_ea1458aa.ekia[#"secondary"] = 0;
		}
		isprimaryweapon = weapon.name == self function_b958b70d(var_3cd641b, "primary");
		var_197329e6 = weapon.name == self function_b958b70d(var_3cd641b, "secondary");
		if(isprimaryweapon)
		{
			self.var_ea1458aa.ekia[#"primary"]++;
		}
		else if(var_197329e6)
		{
			self.var_ea1458aa.ekia[#"secondary"]++;
		}
		if(self.var_ea1458aa.ekia[#"primary"] > 0 && self.var_ea1458aa.ekia[#"secondary"] > 0)
		{
			var_95ac2e77 = 1;
			self.var_ea1458aa.ekia[#"primary"]--;
			self.var_ea1458aa.ekia[#"secondary"]--;
		}
		scoreevents = globallogic_score::function_3cbc4c6c(weapon.var_2e4a8800);
		var_8a4cfbd = weapon.var_76ce72e8 && isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1;
		if(isdefined(self.var_9cd2c51d))
		{
			if(weapon.issignatureweapon && isdefined(level.var_ca4ce464) && level.var_ca4ce464[weapon] === 1)
			{
				if(!isdefined(self.var_9cd2c51d.var_d298c9a8))
				{
					self.var_9cd2c51d.var_d298c9a8 = 0;
				}
				self.var_9cd2c51d.var_d298c9a8++;
				if((self.var_9cd2c51d.var_d298c9a8 % 4) == 0)
				{
					var_828dac8f = 1;
				}
			}
		}
		if(!isdefined(var_828dac8f))
		{
			if(weapon.issignatureweapon && isdefined(self.var_ea1458aa.var_96d50420))
			{
				if(!isdefined(self.var_9cd2c51d.var_96d50420))
				{
					self.var_9cd2c51d.var_96d50420 = 0;
				}
				self.var_ea1458aa.var_96d50420++;
				if((self.var_ea1458aa.var_96d50420 % 4) == 0)
				{
					var_828dac8f = 1;
				}
			}
			else if(var_8a4cfbd && isdefined(self.var_ea1458aa.var_59ac2f5))
			{
				if(!isdefined(self.var_9cd2c51d.var_59ac2f5))
				{
					self.var_9cd2c51d.var_59ac2f5 = 0;
				}
				self.var_ea1458aa.var_59ac2f5++;
				if((self.var_ea1458aa.var_59ac2f5 % 4) == 0)
				{
					var_828dac8f = 1;
				}
			}
		}
		var_ffe9dfa5 = self weaponhasattachmentandunlocked(weapon, "extclip");
		if(var_ffe9dfa5)
		{
			if(!isdefined(self.var_ea1458aa.var_23f5861b))
			{
				self.var_ea1458aa.var_23f5861b = 0;
			}
			self.var_ea1458aa.var_23f5861b++;
		}
		if(totalenemies >= 4)
		{
			if(!isdefined(self.var_ea1458aa.ekia_every_enemy_onelife))
			{
				self.var_ea1458aa.ekia_every_enemy_onelife = [];
			}
			self.var_ea1458aa.ekia_every_enemy_onelife[victimentnum] = 1;
			if(self.var_ea1458aa.ekia_every_enemy_onelife.size >= totalenemies)
			{
				var_2adaec2f = 1;
				self.var_ea1458aa.ekia_every_enemy_onelife = undefined;
			}
		}
		if(isdefined(level.var_1aef539f) && [[level.var_1aef539f]](idamage, self))
		{
			var_1f0bdb8f = 1;
		}
		var_70137a58 = function_2e532eed(self.var_ea1458aa);
		if(!isdefined(var_5afc3871[#"talent_resistance"]))
		{
			var_2d4a24ea = self.var_ef9b6f0b === 1;
			var_6c5ba24c = self.lastflashedby === idamage;
			if(isdefined(self.var_121392a1) && isdefined(self.var_121392a1[#"shock_seeker_mine"]))
			{
				if(self.var_121392a1[#"shock_seeker_mine"].var_4b22e697 === idamage)
				{
					var_ba9c5900 = 1;
				}
			}
		}
		var_30f88120 = scoreevents::function_c28e2c05(idamage.origin, var_6af452fc.sensordarts, 0);
	}
	data = idamage.var_1318544a;
	if(!isdefined(data))
	{
		return;
	}
	var_89775a8e = self util::function_14e61d05();
	var_21409def = self util::function_5e7e010();
	var_b0ca1732 = self hasperk(#"specialty_paranoia");
	var_ca5827fd = self hasperk(#"specialty_tracker");
	var_f22bbd84 = self hasperk(#"specialty_flakjacket");
	var_4e8a56b1 = self isinvehicle() && !self isremotecontrolling();
	if(var_4e8a56b1)
	{
		var_284da85d = self getvehicleoccupied();
		var_d7b43cfe = var_284da85d.vehicleclass === "4 wheel" || var_284da85d.vehicleclass === "motorcycle" || var_284da85d.vehicleclass === "tank";
		var_c48b1869 = isairborne(var_284da85d);
	}
	var_cf99d005 = idamage.laststand === 1;
	util::waittillslowprocessallowed();
	if(!isplayer(self))
	{
		return;
	}
	if(!isplayer(idamage))
	{
		return;
	}
	self stats::function_dad108fa(#"hash_d636c7d30f976a4", 1);
	if(!isdefined(killstreak))
	{
		weaponclass = util::getweaponclass(weapon);
		if(isdefined(var_3cd641b))
		{
			if(isprimaryweapon)
			{
				self stats::function_dad108fa(#"hash_207964660a784470", 1);
				if(weapon.attachments.size > 2)
				{
					self stats::function_dad108fa(#"hash_6803083fa39064a4", 1);
				}
			}
			else if(var_197329e6)
			{
				self stats::function_dad108fa(#"hash_207964660a784470", 1);
				self stats::function_dad108fa(#"hash_1d965783ae1b802", 1);
				if(weapon.attachments.size > 2)
				{
					self stats::function_dad108fa(#"hash_7b0b54996f4aafbc", 1);
				}
			}
			if(var_95ac2e77 === 1)
			{
				self stats::function_dad108fa(#"hash_58ee12dacf893367", 1);
				if(self function_db654c9(var_3cd641b, #"bonuscard_overkill"))
				{
					self stats::function_dad108fa(#"hash_33dd7ef72b15e6ac", 1);
					self contracts::increment_contract(#"hash_bda5f100f182228");
				}
				else if(self function_db654c9(var_3cd641b, #"bonuscard_underkill"))
				{
					self stats::function_dad108fa(#"hash_9cb265b8b1483b0", 1);
				}
			}
			talents = self function_4a9f1384(var_3cd641b);
			if(isdefined(talents) && isarray(talents))
			{
				if(self function_db654c9(var_3cd641b, #"bonuscard_perk_1_greed"))
				{
					if(isdefined(talents[0]) && talents[0] != #"weapon_null" && isdefined(talents[3]) && talents[3] != #"weapon_null")
					{
						self stats::function_dad108fa(#"ekia_perk1_greed", 1);
						self contracts::increment_contract(#"hash_714a511ec2adab44");
					}
				}
				if(self function_db654c9(var_3cd641b, #"bonuscard_perk_2_greed"))
				{
					if(isdefined(talents[1]) && talents[1] != #"weapon_null" && isdefined(talents[4]) && talents[4] != #"weapon_null")
					{
						self stats::function_dad108fa(#"ekia_perk2_greed", 1);
					}
				}
				if(self function_db654c9(var_3cd641b, #"bonuscard_perk_3_greed"))
				{
					if(isdefined(talents[2]) && talents[2] != #"weapon_null" && isdefined(talents[5]) && talents[5] != #"weapon_null")
					{
						self stats::function_dad108fa(#"ekia_perk3_greed", 1);
					}
				}
				arrayremovevalue(talents, #"weapon_null");
				if(talents.size > 2)
				{
					var_ee03db9e = 0;
					if(self function_db654c9(var_3cd641b, #"bonuscard_perk_1_gluttony"))
					{
						self stats::function_dad108fa(#"ekia_perk1_gluttony", 1);
						var_ee03db9e = 1;
					}
					else
					{
						if(self function_db654c9(var_3cd641b, #"bonuscard_perk_2_gluttony"))
						{
							self stats::function_dad108fa(#"ekia_perk2_gluttony", 1);
							var_ee03db9e = 1;
						}
						else if(self function_db654c9(var_3cd641b, #"bonuscard_perk_3_gluttony"))
						{
							self stats::function_dad108fa(#"hash_af94e8f65ee288c", 1);
							var_ee03db9e = 1;
						}
					}
					if(var_ee03db9e)
					{
						self contracts::increment_contract(#"hash_29c44b5c02f1674d");
					}
				}
				if(talents.size >= 5)
				{
					self contracts::increment_contract(#"hash_1d68713877c674d8");
				}
				if(isdefined(var_5afc3871[#"talent_resistance"]))
				{
					if(var_6af452fc.var_5745c480 === 1)
					{
						self stats::function_dad108fa(#"ekia_stunned_slowed_irradiated_cuav_resistance", 1);
					}
					else if(isdefined(var_6af452fc.var_121392a1) && isarray(var_6af452fc.var_121392a1) && var_6af452fc.var_121392a1.size > 0)
					{
						foreach(effect in var_6af452fc.var_121392a1)
						{
							if(!isdefined(effect.var_4b22e697) || self == effect.var_4b22e697 || !isdefined(effect.var_3d1ed4bd))
							{
								continue;
							}
							switch(effect.var_3d1ed4bd.name)
							{
								case "ability_smart_cover":
								case "eq_swat_grenade":
								case "hash_3f62a872201cd1ce":
								case "eq_seeker_mine":
								case "eq_concertina_wire":
								case "eq_slow_grenade":
								case "gadget_radiation_field":
								{
									award = 1;
									break;
								}
								default:
								{
									break;
								}
							}
							if(award === 1)
							{
								self stats::function_dad108fa(#"ekia_stunned_slowed_irradiated_cuav_resistance", 1);
								break;
							}
						}
					}
				}
				if(var_6af452fc.var_53611a9c === 1)
				{
					if(isdefined(var_5afc3871[#"talent_teamlink"]))
					{
						self stats::function_dad108fa(#"ekia_minimap_teamlink", 1);
					}
					if(isdefined(var_5afc3871[#"talent_tracker"]))
					{
						self stats::function_dad108fa(#"ekia_tracker", 1);
					}
				}
				else if(isdefined(var_5afc3871[#"talent_teamlink"]) && var_6af452fc.var_ec93e5f2 === 1)
				{
					self stats::function_dad108fa(#"ekia_minimap_teamlink", 1);
				}
				if(isdefined(var_5afc3871[#"talent_deadsilence"]))
				{
					self stats::function_dad108fa(#"ekia_deadsilence", 1);
				}
				if(isdefined(var_5afc3871[#"talent_ghost"]) && (var_6af452fc.var_8e35fb71 === 1 || var_6af452fc.var_efc9cf4d === 1))
				{
					self stats::function_dad108fa(#"ekia_enemy_uav_sensordart_ghost", 1);
				}
				if(isdefined(var_5afc3871[#"talent_gungho"]) && var_6af452fc.var_e8072c8d === 1)
				{
					self stats::function_dad108fa(#"hash_cdd16b48f26b85f", 1);
				}
				if(isdefined(var_5afc3871[#"talent_dexterity"]))
				{
					if(var_6af452fc.ismantling === 1 || var_6af452fc.var_bd77a1eb === 1 || var_6af452fc.isjumping === 1)
					{
						self stats::function_dad108fa(#"hash_20be2d12bc757e0a", 1);
					}
				}
				if(isdefined(var_5afc3871[#"talent_scavenger"]) && var_6af452fc.var_54433d4b === 1)
				{
					self stats::function_dad108fa(#"ekia_ammo_pickup_scavenger", 1);
				}
			}
			wildcards = self function_6f2c0492(var_3cd641b);
			arrayremovevalue(wildcards, #"weapon_null");
			if(wildcards.size > 1)
			{
				self stats::function_dad108fa(#"hash_3c794263f2d7e231", 1);
			}
			gear = self function_b958b70d(var_3cd641b, "tacticalgear");
			if(isdefined(gear))
			{
				switch(gear)
				{
					case "gear_armor":
					{
						if(var_6af452fc.var_d7bd6f9b === 1)
						{
							self stats::function_dad108fa(#"hash_434323084b426f9", 1);
						}
						break;
					}
					case "gear_awareness":
					{
						var_1550b3b2 = function_fd82b127() * 0.5;
						if(var_6af452fc.var_85997af0 < sqr(var_1550b3b2))
						{
							self stats::function_dad108fa(#"ekia_minimap_awareness", 1);
							if(isdefined(var_5afc3871[#"talent_tracker"]) && var_6af452fc.var_53611a9c === 1)
							{
								self stats::function_dad108fa(#"ekia_minimap_awareness_tracker", 1);
							}
						}
						break;
					}
					case "gear_equipmentcharge":
					{
						scoreevents = globallogic_score::function_3cbc4c6c(weapon.var_2e4a8800);
						baseweapon = weapons::getbaseweapon(weapon);
						if(baseweapon.var_76ce72e8 && isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1)
						{
							self stats::function_dad108fa(#"ekia_specialist_equipment_equipmentcharge", 1);
							if(!isdefined(self.var_9cd2c51d.var_b385927))
							{
								self.var_9cd2c51d.var_b385927 = 0;
							}
							self.var_9cd2c51d.var_b385927++;
							if(self.var_9cd2c51d.var_b385927 == 7)
							{
								self stats::function_dad108fa(#"hash_7db6a4180312b94c", 1);
							}
						}
						break;
					}
					case "gear_medicalinjectiongun":
					{
						if(var_6af452fc.var_46a82df0 === 1)
						{
							self stats::function_dad108fa(#"ekia_full_heal_medicalinjectiongun", 1);
							if(var_6af452fc.var_69b66e8e === 1)
							{
								self stats::function_dad108fa(#"ekia_critical_heal_medicalinjectiongun_revenge", 1);
							}
						}
						break;
					}
					case "weapon_null":
					default:
					{
						break;
					}
				}
			}
		}
		if(isdefined(level.gametype) && (level.gametype == #"tdm" || level.gametype == #"dm"))
		{
			if(level.hardcoremode)
			{
				self stats::function_dad108fa(#"hash_307266bd52a9fc51", 1);
			}
			else if(!level.arenamatch)
			{
				self stats::function_dad108fa(#"ekia_core_in_tdm_dm", 1);
			}
		}
		if(isdefined(weaponclass))
		{
			switch(weaponclass)
			{
				case "weapon_pistol":
				case "weapon_shotgun":
				case "weapon_lmg":
				case "weapon_tactical":
				case "weapon_smg":
				case "weapon_cqb":
				case "weapon_assault":
				{
					if(!function_cd84dead(weapon, "optic"))
					{
						self stats::function_dad108fa(#"hash_5c41a492b47fc297", 1);
					}
					break;
				}
				case "weapon_sniper":
				{
					if(self weaponhasattachmentandunlocked(weapon, "elo"))
					{
						self stats::function_dad108fa(#"hash_5c41a492b47fc297", 1);
					}
					break;
				}
				default:
				{
					break;
				}
			}
		}
		if(isdefined(weapon.attachments) && weapon.attachments.size > 0)
		{
			if(weapon.attachments.size >= 5)
			{
				self stats::function_dad108fa(#"hash_36dfb920467c2f92", 1);
			}
			attachmentname = self getweaponoptic(weapon);
			if(isdefined(attachmentname) && attachmentname != "" && self weaponhasattachmentandunlocked(weapon, attachmentname))
			{
				switch(attachmentname)
				{
					case "ir":
					{
						self stats::function_dad108fa(#"hash_4c52eb020ea39538", 1);
					}
					case "acog":
					case "tactical":
					case "hash_487f75e1a5f169b0":
					case "hash_48977fe1a6060c8f":
					case "dualoptic":
					case "hash_7bdc3beafb1d08b0":
					{
						self stats::function_dad108fa(#"hash_40c77418f9182719", 1);
						break;
					}
				}
			}
			isads = is_true(var_6af452fc.isads);
			var_95c30fc5 = 0;
			if(self weaponhasattachmentandunlocked(weapon, "grip"))
			{
				if(isads)
				{
					self stats::function_dad108fa(#"ekia_ads_grip", 1);
				}
				if(self weaponhasattachmentandunlocked(weapon, "grip2"))
				{
					var_95c30fc5++;
				}
			}
			if(self weaponhasattachmentandunlocked(weapon, "quickdraw"))
			{
				if(isads)
				{
					self stats::function_dad108fa(#"ekia_ads_quickdraw", 1);
				}
				if(self weaponhasattachmentandunlocked(weapon, "quickdraw2"))
				{
					var_95c30fc5++;
				}
			}
			if(self weaponhasattachmentandunlocked(weapon, "stalker"))
			{
				if(isads)
				{
					self stats::function_dad108fa(#"ekia_ads_stalker", 1);
				}
				if(self weaponhasattachmentandunlocked(weapon, "stalker2"))
				{
					var_95c30fc5++;
				}
			}
			if(isads)
			{
				if(self weaponhasattachmentandunlocked(weapon, "quickdraw", "stalker", "grip"))
				{
					self stats::function_dad108fa(#"ekia_ads_quickdraw_stalker_grip", 1);
				}
			}
			if(var_ffe9dfa5 == 1)
			{
				if((var_70137a58.var_23f5861b % 2) == 0)
				{
					self stats::function_dad108fa(#"hash_779e1fc5021c532c", 1);
				}
				if(self weaponhasattachmentandunlocked(weapon, "extclip2"))
				{
					var_95c30fc5++;
				}
			}
			if(self weaponhasattachmentandunlocked(weapon, "steadyaim"))
			{
				if(var_6af452fc.var_bd77a1eb === 1)
				{
					if(isdefined(var_3cd641b) && isdefined(var_5afc3871[#"talent_dexterity"]) && self function_db654c9(var_3cd641b, #"bonuscard_overkill"))
					{
						if(!isdefined(self.var_9cd2c51d.var_1a72ebf5))
						{
							self.var_9cd2c51d.var_1a72ebf5 = 0;
						}
						self.var_9cd2c51d.var_1a72ebf5++;
						if(self.var_9cd2c51d.var_1a72ebf5 == 5)
						{
							self stats::function_dad108fa(#"hash_6c13ae81deff608b", 1);
						}
					}
				}
				if(self weaponhasattachmentandunlocked(weapon, "steadyaim2"))
				{
					var_95c30fc5++;
				}
			}
			if(self weaponhasattachmentandunlocked(weapon, "fastreload"))
			{
				self stats::function_dad108fa(#"hash_3f378b9a10f47f0", 1);
				if(weaponclass === #"weapon_launcher")
				{
					self stats::function_dad108fa(#"hash_4b19afce40dfc918", 1);
				}
				if(self weaponhasattachmentandunlocked(weapon, "fastreload2"))
				{
					var_95c30fc5++;
					if(isads && var_6af452fc.var_14f058c7 === 1 && self weaponhasattachmentandunlocked(weapon, "quickdraw"))
					{
						self stats::function_dad108fa(#"ekia_ads_reload_quickdraw_fastreload2", 1);
					}
				}
			}
			if(self weaponhasattachmentandunlocked(weapon, "mixclip"))
			{
				self stats::function_dad108fa(#"hash_3f378b9a10f47f0", 1);
			}
			if(var_95c30fc5 < 2)
			{
				if(self weaponhasattachmentandunlocked(weapon, "barrel", "barrel2"))
				{
					var_95c30fc5++;
				}
			}
			if(var_95c30fc5 == 1)
			{
				self stats::function_dad108fa(#"hash_51430fd20ccb2b05", 1);
			}
			else if(var_95c30fc5 > 1)
			{
				self stats::function_dad108fa(#"hash_6c36aa2d7d6f2b4", 1);
			}
		}
		if(weapon.statname == "smg_handling_t8" && (isdefined(weapon.dualwieldweapon) && weapon.dualwieldweapon != level.weaponnone || self weaponhasattachmentandunlocked(weapon, "dw")))
		{
			self stats::function_dad108fa(#"hash_1dc20f3502e9530", 1);
		}
		if(isdefined(var_5018995b) && var_5018995b.statname == #"gadget_radiation_field" && (!isdefined(var_6af452fc.var_75c08813) || var_6af452fc.var_75c08813 < 1))
		{
			self stats::function_dad108fa(#"radiation_field_shutdown_ekia", 1);
		}
		if(var_bcbcb4ec === 1)
		{
			self stats::function_dad108fa(#"kill_enemy_who_has_goldenammo", 1);
		}
		if(var_fff76b4 === 1)
		{
			self stats::function_dad108fa(#"kill_enemy_who_has_bonus_health", 1);
		}
		if(!isdefined(var_5afc3871[#"talent_resistance"]))
		{
			if(var_2d4a24ea)
			{
				if(var_6c5ba24c)
				{
					self stats::function_dad108fa(#"hash_f03c59c6881738c", 1);
				}
			}
			if(var_ba9c5900 === 1)
			{
				self stats::function_dad108fa(#"hash_f03c59c6881738c", 1);
			}
		}
		if(isdefined(var_70137a58.var_64ffda50))
		{
			var_f4917629 = var_70137a58.var_64ffda50[victimentnum];
			if(isdefined(var_f4917629) && (var_f4917629 + 6000) > time)
			{
				self stats::function_dad108fa(#"kill_after_shot_in_back", 1);
			}
		}
		if(weapon != level.weaponnone)
		{
			if(isdefined(self.pickedupweapons) && isdefined(self.pickedupweapons[weapon]) && isdefined(self.var_c9062c1c))
			{
				var_eef88563 = self.pickedupweapons[weapon];
				if(var_eef88563 >= 0 && var_eef88563 == victimentnum)
				{
					if(!isdefined(self.var_c9062c1c[weapon]))
					{
						self.var_c9062c1c[weapon] = [];
					}
					if(!isdefined(self.var_c9062c1c[weapon][var_eef88563]))
					{
						self.var_c9062c1c[weapon][var_eef88563] = 0;
					}
					self.var_c9062c1c[weapon][var_eef88563]++;
				}
				if(isdefined(self.var_93da0d74[weapon]))
				{
					self.var_93da0d74[weapon]++;
					if(self.var_93da0d74[weapon] >= 5 && isdefined(self.var_c9062c1c[weapon]) && var_eef88563 == victimentnum && self.var_c9062c1c[weapon][var_eef88563] > 0)
					{
						self stats::function_dad108fa(#"killstreak_5_picked_up_weapon", 1);
						self.var_93da0d74[weapon] = self.var_93da0d74[weapon] - 5;
						self.var_c9062c1c[weapon][var_eef88563]--;
					}
				}
				else
				{
					self.var_93da0d74[weapon] = 1;
				}
				self contracts::increment_contract(#"hash_48fef2dc09d2af16");
				var_6fafd7bd = getentbynum(var_eef88563);
				if(util::function_fbce7263(var_6fafd7bd.team, self.team))
				{
					self stats::function_dad108fa(#"hash_760f298458773e70", 1);
				}
			}
		}
		if(var_2adaec2f === 1)
		{
			self stats::function_dad108fa(#"ekia_every_enemy_onelife", 1);
		}
		if(var_1f0bdb8f === 1)
		{
			self stats::function_dad108fa(#"hash_3bf4605458c33226", 1);
		}
		if(var_8a4cfbd)
		{
			self stats::function_dad108fa(#"ekia_specialized_equipment", 1);
		}
		else if(weapon.issignatureweapon)
		{
			self stats::function_dad108fa(#"ekia_specialized_weapons", 1);
		}
		if(var_6af452fc.var_9a5c07a === 1)
		{
			if(var_6af452fc.var_79eb9a59 === self)
			{
				self stats::function_dad108fa(#"ekia_debuffed_enemies_specialized_weapon_equipment", 1);
				var_38a1a18 = 1;
			}
		}
		if(!var_38a1a18 === 1 && isdefined(var_6af452fc.sensor_darts))
		{
			if(isdefined(var_30f88120))
			{
				self stats::function_dad108fa(#"ekia_debuffed_enemies_specialized_weapon_equipment", 1);
				var_38a1a18 = 1;
			}
		}
		if(!var_38a1a18 === 1 && isdefined(var_6af452fc.var_2acdce3e))
		{
			foreach(effect in var_6af452fc.var_2acdce3e)
			{
				if(!isdefined(effect.var_4b22e697) || self != effect.var_4b22e697 || !isdefined(effect.var_3d1ed4bd))
				{
					continue;
				}
				switch(effect.var_3d1ed4bd.name)
				{
					case "shock_rifle":
					case "ability_smart_cover":
					case "eq_swat_grenade":
					case "hash_3f62a872201cd1ce":
					case "eq_seeker_mine":
					case "eq_concertina_wire":
					case "hero_flamethrower":
					case "gadget_radiation_field":
					{
						award = 1;
						break;
					}
					default:
					{
						break;
					}
				}
				if(award === 1)
				{
					self stats::function_dad108fa(#"ekia_debuffed_enemies_specialized_weapon_equipment", 1);
					break;
				}
			}
		}
		if(var_828dac8f === 1)
		{
			self stats::function_dad108fa(#"hash_23d2a4d333f13590", 1);
		}
		if(var_6af452fc.var_b535f1ea === self && isdefined(var_6af452fc.var_2acdce3e))
		{
			if(isdefined(var_6af452fc.var_2acdce3e[#"hash_1527a22d8a6fdc21"]) && var_6af452fc.var_2acdce3e[#"hash_1527a22d8a6fdc21"].endtime > time)
			{
				if(self util::is_item_purchased(#"eq_slow_grenade"))
				{
					self stats::function_dad108fa(#"ekia_concussed_enemy", 1);
				}
			}
		}
		if(weapon.issniperweapon)
		{
			self function_38ad2427(#"hash_1593f24b861eb245", 1);
		}
		if(weapon.var_a9a55985)
		{
			self stats::function_dad108fa(#"hash_6f4a03c7df254b96", 1);
		}
		if(var_89775a8e)
		{
			self stats::function_dad108fa(#"hash_200b9eaa7df992a8", 1);
		}
		if(var_f22bbd84)
		{
			self stats::function_dad108fa(#"hash_345a3aa1489f6839", 1);
		}
		if(var_21409def)
		{
			self stats::function_dad108fa(#"hash_63b656007f0362c4", 1);
		}
		if(var_b0ca1732)
		{
			self stats::function_dad108fa(#"hash_41fbdc6f4aa1a875", 1);
			self stats::function_dad108fa(#"hash_16b2c41d0ccb0961", 1);
		}
		if(var_ca5827fd)
		{
			self stats::function_dad108fa(#"hash_2cceb05c88366b28", 1);
			self stats::function_dad108fa(#"hash_300c58880c01bf58", 1);
		}
		if(data.var_e020b97e === 1 && data.var_af1b39cb === self)
		{
			self stats::function_dad108fa(#"hash_19868ed34c58dae", 1);
		}
		weaponclass = util::getweaponclass(weapon);
		if(isdefined(weaponclass))
		{
			weaponclass = (isstring(weaponclass) ? hash(weaponclass) : weaponclass);
			switch(weaponclass)
			{
				case "weapon_cqb":
				{
					self stats::function_dad108fa(#"hash_496927d497fdf692", 1);
					self stats::function_dad108fa(#"hash_24f356ecf6fb6c0e", 1);
					break;
				}
				case "weapon_assault":
				{
					self stats::function_dad108fa(#"hash_64d78a0e86ba8b55", 1);
					self stats::function_dad108fa(#"hash_41393b0369e02954", 1);
					break;
				}
				case "weapon_lmg":
				{
					self stats::function_dad108fa(#"hash_52aa8f35541651b8", 1);
					self stats::function_dad108fa(#"hash_49b83486e6f9bc38", 1);
					break;
				}
				case "weapon_pistol":
				{
					self stats::function_dad108fa(#"hash_50ce2207b80f9fa5", 1);
					self stats::function_dad108fa(#"hash_48f5753f9361f31", 1);
					break;
				}
				case "weapon_smg":
				{
					self stats::function_dad108fa(#"hash_26e871c3fec523d3", 1);
					break;
				}
				case "weapon_tactical":
				{
					self stats::function_dad108fa(#"hash_94d913babcd584", 1);
					self stats::function_dad108fa(#"hash_4f45ca1828646934", 1);
					break;
				}
				case "weapon_sniper":
				{
					self stats::function_dad108fa(#"hash_5f8a23bbf07a8769", 1);
					break;
				}
				default:
				{
					break;
				}
			}
		}
		if(var_cf99d005)
		{
			self stats::function_dad108fa(#"hash_7f05b25034ae349f", 1);
			self stats::function_dad108fa(#"hash_5df87ce6dd360abf", 1);
			self stats::function_dad108fa(#"hash_6c9b07f9cd4f45d6", 1);
		}
	}
	if(isdefined(level.activeplayeruavs[self.entnum]) && level.activeplayeruavs[self.entnum] && (!isdefined(level.forceradar) || level.forceradar == 0))
	{
		self stats::function_dad108fa(#"ekia_uav", 1);
	}
	if(isdefined(level.activeplayercounteruavs[self.entnum]) && level.activeplayercounteruavs[self.entnum] > 0)
	{
		self stats::function_dad108fa(#"ekia_counteruav", 1);
	}
	if(killstreak === #"ability_dog")
	{
		if(weapon.issignatureweapon)
		{
			self stats::function_dad108fa(#"ekia_specialized_weapons", 1);
		}
	}
	function_88235aee(idamage, self);
	if(var_4e8a56b1)
	{
		self stats::function_dad108fa(#"hash_3cbe820401e3d5c6", 1);
		self stats::function_dad108fa(#"hash_15e9f992b5497ad7", 1);
		if(var_d7b43cfe)
		{
			self stats::function_dad108fa(#"hash_19b522874d71d0c2", 1);
		}
		else if(var_c48b1869)
		{
			self stats::function_dad108fa(#"hash_7d65f6cc85a27569", 1);
		}
	}
}

/*
	Name: challengekills
	Namespace: challenges
	Checksum: 0x75445A23
	Offset: 0x4528
	Size: 0x3CD2
	Parameters: 1
	Flags: Linked
*/
function challengekills(data)
{
	weapon = data.weapon;
	player = data.attacker;
	victim = data.victim;
	attacker = data.attacker;
	time = data.time;
	if(!isdefined(attacker.team))
	{
		return;
	}
	if(!isdefined(victim.team))
	{
		return;
	}
	attacker.lastkilledplayer = victim;
	attackertraversing = data.attackertraversing;
	var_1fa3e8cc = data.var_1fa3e8cc;
	var_8556c722 = data.var_8556c722;
	attackerwasconcussed = data.attackerwasconcussed;
	attackerwasflashed = data.attackerwasflashed;
	attackerwasunderwater = data.attackerwasunderwater;
	var_911b9b40 = data.var_911b9b40;
	attackerlastfastreloadtime = data.attackerlastfastreloadtime;
	var_2e1b3ac1 = data.var_2e1b3ac1;
	lastweaponbeforetoss = data.lastweaponbeforetoss;
	meansofdeath = data.smeansofdeath;
	ownerweaponatlaunch = data.ownerweaponatlaunch;
	killstreak = data.killstreaktype;
	var_18db7a57 = data.var_18db7a57;
	victimweapon = data.victimweapon;
	victimbledout = data.bledout;
	var_59a8c5c7 = data.var_59a8c5c7;
	victimorigin = data.victimorigin;
	victimforward = data.victimforward;
	victimelectrifiedby = data.victimelectrifiedby;
	victimattackersthisspawn = data.victimattackersthisspawn;
	victimwasinslamstate = data.victimwasinslamstate;
	var_9fb5719b = data.var_9fb5719b;
	victimwasonground = data.victimonground;
	var_8e5d0c71 = data.var_8e5d0c71;
	var_59b78db0 = data.var_59b78db0;
	victimwasunderwater = data.wasunderwater;
	var_e828179e = data.var_e828179e;
	victimlaststunnedby = data.victimlaststunnedby;
	var_da9749ea = data.var_da9749ea;
	var_642d3a64 = data.var_642d3a64;
	victimactiveproximitygrenades = data.victimactiveproximitygrenades;
	victimactivebouncingbetties = data.victimactivebouncingbetties;
	var_f91a4dd6 = data.var_f91a4dd6;
	var_8099aa99 = data.var_8099aa99;
	attackerlastflashedby = data.attackerlastflashedby;
	attackerlaststunnedby = data.attackerlaststunnedby;
	attackerlaststunnedtime = data.attackerlaststunnedtime;
	attackerwassliding = data.attackerwassliding;
	attackerwassprinting = data.attackerwassprinting;
	attackerstance = data.attackerstance;
	wasdefusing = data.wasdefusing;
	wasplanting = data.wasplanting;
	inflictorownerwassprinting = data.inflictorownerwassprinting;
	attackerorigin = data.attackerorigin;
	attackerforward = data.attackerforward;
	var_70763083 = data.var_70763083;
	var_d6553aa9 = data.var_d6553aa9;
	var_d24b8539 = data.var_6799f1da;
	attacker_sprint_end = (isdefined(data.attacker_sprint_end) ? data.attacker_sprint_end : 0);
	var_e5241328 = data.var_e5241328;
	var_cc8f0762 = data.var_cc8f0762;
	var_26aed950 = data.var_26aed950;
	inflictoriscooked = data.inflictoriscooked;
	var_dc8c6b51 = data.var_dc8c6b51;
	var_74f23861 = data.var_74f23861;
	inflictorchallenge_hatchettosscount = data.inflictorchallenge_hatchettosscount;
	inflictorownerwassprinting = data.inflictorownerwassprinting;
	inflictorplayerhasengineerperk = data.inflictorplayerhasengineerperk;
	var_9e818622 = data.var_9e818622;
	inflictor = data.einflictor;
	var_937b6de2 = isdefined(victim.challenge_combatrobotattackclientid) && isdefined(victim.challenge_combatrobotattackclientid[player.clientid]);
	weaponclass = util::getweaponclass(weapon);
	weaponclass = (isstring(weaponclass) ? hash(weaponclass) : weaponclass);
	baseweapon = getbaseweapon(weapon);
	baseweaponitemindex = getbaseweaponitemindex(baseweapon);
	weaponpurchased = player isitempurchased(baseweaponitemindex);
	if(meansofdeath == #"mod_head_shot" || meansofdeath == #"mod_pistol_bullet" || meansofdeath == #"mod_rifle_bullet")
	{
		bulletkill = 1;
	}
	else
	{
		if(baseweapon == level.weaponflechette && (meansofdeath == #"mod_impact" || meansofdeath == #"mod_projectile" || meansofdeath == #"mod_projectile_splash"))
		{
			bulletkill = 1;
		}
		else
		{
			bulletkill = 0;
		}
	}
	if(level.teambased)
	{
		if(player.team == victim.team)
		{
			return;
		}
	}
	else if(player == victim)
	{
		return;
	}
	if(!isdefined(killstreak))
	{
		if(level.hardcoremode)
		{
			player stats::function_dad108fa(#"kill_hc", 1);
			if(isdefined(var_e5241328) && (var_e5241328 + 4500) > time)
			{
				player stats::function_dad108fa(#"kill_hc_stim", 1);
			}
			if(player.health < player.maxhealth)
			{
				player stats::function_dad108fa(#"kill_hc_crit_health", 1);
			}
			if(weapons::ismeleemod(meansofdeath) && weapons::ispunch(weapon))
			{
				player stats::function_dad108fa(#"kill_hc_fist", 1);
			}
		}
		player processspecialistchallenge("kills");
		if(weapon.isheavyweapon)
		{
			if(!isdefined(player.pers[#"challenge_heroweaponkills"]))
			{
				player.pers[#"challenge_heroweaponkills"] = 0;
			}
			player processspecialistchallenge("kills_weapon");
			player.pers[#"challenge_heroweaponkills"]++;
			if(player.pers[#"challenge_heroweaponkills"] >= 6)
			{
				player processspecialistchallenge("kill_one_game_weapon");
				player.pers[#"challenge_heroweaponkills"] = 0;
			}
		}
		if(isdefined(victim.var_ea1458aa.attackerdamage))
		{
			var_d72bd991 = victim.var_ea1458aa.attackerdamage[player.clientid];
			if(var_d72bd991.var_b535f1ea === player)
			{
				if(isdefined(var_d72bd991.var_2acdce3e[#"hash_1527a22d8a6fdc21"]) && var_d72bd991.var_2acdce3e[#"hash_1527a22d8a6fdc21"].endtime > time)
				{
					player stats::function_dad108fa(#"hash_3c511176cb6b5853", 1);
				}
			}
			blindstatuseffect = var_d72bd991.var_2acdce3e[#"blind_base"];
			if(isdefined(blindstatuseffect))
			{
				if(blindstatuseffect.var_4b22e697 === player && blindstatuseffect.endtime > time && blindstatuseffect.var_3d1ed4bd.name === #"eq_flash_grenade")
				{
					player stats::function_dad108fa(#"hash_79914da435788fe4", 1);
				}
			}
		}
	}
	else
	{
		player function_ea966b4a(killstreak, var_18db7a57);
	}
	if(bulletkill && !isdefined(killstreak))
	{
		player genericbulletkill(data, victim, weapon);
		player function_80327323(data);
		if(isdefined(victim.firsttimedamaged) && victim.firsttimedamaged == time)
		{
			if(weaponpurchased)
			{
				if(weaponclass === #"weapon_sniper")
				{
					player stats::function_dad108fa(#"kill_enemy_one_bullet_sniper", 1);
					player stats::function_e24eec31(weapon, #"kill_enemy_one_bullet_sniper", 1);
					if(!isdefined(player.pers[#"kill_enemy_one_bullet_sniper"]))
					{
						player.pers[#"kill_enemy_one_bullet_sniper"] = 0;
					}
					player.pers[#"kill_enemy_one_bullet_sniper"]++;
					if((player.pers[#"kill_enemy_one_bullet_sniper"] % 10) == 0)
					{
						player stats::function_dad108fa(#"hash_2ebd387ffb67e1dc", 1);
					}
				}
				else if(weaponclass === #"weapon_cqb")
				{
					player stats::function_dad108fa(#"kill_enemy_one_bullet_shotgun", 1);
					player stats::function_e24eec31(weapon, #"kill_enemy_one_bullet_shotgun", 1);
				}
			}
			if(weaponclass === #"weapon_sniper")
			{
				player stats::function_dad108fa(#"hash_44655b9f24b38f68", 1);
			}
			if(!isdefined(weapon.attachments) || weapon.attachments.size == 0)
			{
				if(!isdefined(player.pers[#"hash_5fd35ed903bc42a3"]))
				{
					player.pers[#"hash_5fd35ed903bc42a3"] = 0;
				}
				player.pers[#"hash_5fd35ed903bc42a3"]++;
				if(player.pers[#"hash_5fd35ed903bc42a3"] == 3)
				{
					player stats::function_d0de7686(#"hash_6daf88d537c4ae9d", 1, #"hash_3be00484d9ce9a63");
				}
			}
		}
		function_7fd1799f(baseweapon, player, weaponclass);
		function_b2b18857(player);
		if(meansofdeath == #"mod_head_shot")
		{
			if(isdefined(victim.var_ea1458aa) && isdefined(victim.var_ea1458aa.attackerdamage))
			{
				var_d72bd991 = victim.var_ea1458aa.attackerdamage[player.clientid];
				gear = player function_b958b70d(player.class_num, "tacticalgear");
				if(gear === #"gear_armor" && isdefined(var_d72bd991))
				{
					if(var_d72bd991.var_d7bd6f9b === 1)
					{
						player stats::function_dad108fa(#"hash_2ed3de647f5090f1", 1);
					}
				}
			}
			player stats::function_dad108fa(#"hash_71d1142f6d1828c8", 1);
			if(weaponclass === #"weapon_assault")
			{
				player stats::function_dad108fa(#"hash_31d5721ee9793424", 1);
			}
		}
		if(isdefined(var_26aed950[#"talent_lightweight"]))
		{
			player stats::function_dad108fa(#"kill_lightweight", 1);
		}
		if(weapon.isdualwield && weaponpurchased)
		{
			checkdualwield(baseweapon, player, attacker, time, attackerwassprinting, attacker_sprint_end);
		}
		if(isdefined(weapon.attachments) && weapon.attachments.size > 0)
		{
			attachmentname = player getweaponoptic(weapon);
			if(isdefined(attachmentname) && attachmentname != "" && player weaponhasattachmentandunlocked(weapon, attachmentname))
			{
				if(weapon.attachments.size > 5 && player allweaponattachmentsunlocked(weapon) && !isdefined(attacker.tookweaponfrom[weapon]))
				{
					player stats::function_dad108fa(#"kill_optic_5_attachments", 1);
				}
				if(isdefined(player.attachmentkillsthisspawn[attachmentname]))
				{
					player.attachmentkillsthisspawn[attachmentname]++;
					if(player.attachmentkillsthisspawn[attachmentname] == 5)
					{
						player stats::function_e24eec31(weapon, #"killstreak_5_attachment", 1);
					}
				}
				else
				{
					player.attachmentkillsthisspawn[attachmentname] = 1;
				}
				if(weapons::ispistol(weapon.rootweapon))
				{
					if(player weaponhasattachmentandunlocked(weapon, "suppressed", "barrel"))
					{
						player stats::function_dad108fa(#"kills_pistol_lasersight_suppressor_longbarrel", 1);
					}
				}
			}
			if(player weaponhasattachmentandunlocked(weapon, "suppressed"))
			{
				if(attacker util::has_hard_wired_perk_purchased_and_equipped() && attacker util::has_ghost_perk_purchased_and_equipped() && attacker util::has_jetquiet_perk_purchased_and_equipped())
				{
					player stats::function_dad108fa(#"kills_suppressor_ghost_hardwired_blastsuppressor", 1);
				}
			}
			if(player playerads() == 1)
			{
				if(isdefined(player.smokegrenadetime) && isdefined(player.smokegrenadeposition))
				{
					if(player.smokegrenadetime + 14000 > time)
					{
						if(player util::is_looking_at(player.smokegrenadeposition) || distancesquared(player.origin, player.smokegrenadeposition) < 40000)
						{
							if(player weaponhasattachmentandunlocked(weapon, "ir"))
							{
								player stats::function_dad108fa(#"kill_with_thermal_and_smoke_ads", 1);
								player stats::function_e24eec31(weapon, #"kill_thermal_through_smoke", 1);
							}
						}
					}
				}
			}
			if(weapon.attachments.size > 1)
			{
				if(player playerads() == 1)
				{
					if(player weaponhasattachmentandunlocked(weapon, "grip", "quickdraw"))
					{
						player stats::function_dad108fa(#"kills_ads_quickdraw_and_grip", 1);
					}
				}
				if(player weaponhasattachmentandunlocked(weapon, "fastreload", "extclip"))
				{
					player.pers[#"killsfastmagext"]++;
					if(player.pers[#"killsfastmagext"] > 4)
					{
						player stats::function_dad108fa(#"kills_one_life_fastmags_and_extclip", 1);
						player.pers[#"killsfastmagext"] = 0;
					}
				}
			}
			if(weapon.attachments.size > 4)
			{
				if(player weaponhasattachmentandunlocked(weapon, "extclip", "grip", "fastreload", "quickdraw", "stalker"))
				{
					player stats::function_dad108fa(#"kills_extclip_grip_fastmag_quickdraw_stock", 1);
				}
			}
		}
		if(isdefined(attackerlastfastreloadtime) && (time - attackerlastfastreloadtime) <= 5000 && player weaponhasattachmentandunlocked(weapon, "fastreload"))
		{
			player stats::function_dad108fa(#"kills_after_reload_fastreload", 1);
		}
		if(isdefined(victim.idflagstime) && victim.idflagstime == time)
		{
			if(victim.idflags & 8)
			{
				player stats::function_dad108fa(#"kill_enemy_through_wall", 1);
			}
		}
		if(data.var_b0985dfc === 1 && weapon != level.weaponnone)
		{
			player stats::function_e24eec31(weapon, #"kill_enemy_while_holding_breath", 1);
		}
	}
	else
	{
		if(weapons::ismeleemod(meansofdeath) && !isdefined(killstreak))
		{
			player stats::function_dad108fa(#"melee", 1);
			if(weapons::ispunch(weapon))
			{
				player stats::function_dad108fa(#"kill_enemy_with_fists", 1);
			}
			function_7fd1799f(baseweapon, player, weaponclass);
		}
		else if(!isdefined(killstreak))
		{
			if(weaponclass === #"weapon_launcher")
			{
				player stats::function_dad108fa(#"hash_be93d1227e6db1", 1);
				player stats::function_dad108fa(#"hash_315afd945b989705", 1);
			}
			if(weapon.islethalgrenade && data.var_2f59a6b8 === 1)
			{
				player stats::function_dad108fa(#"hash_fac49b9c9fcdb8d", 1);
			}
			if(weaponpurchased)
			{
				slot_weapon = player loadout::function_18a77b37("primarygrenade");
				if(weapon === slot_weapon)
				{
					if(player.challenge_scavengedcount > 0)
					{
						player.challenge_resuppliednamekills++;
						if(player.challenge_resuppliednamekills >= 3)
						{
							player stats::function_dad108fa(#"kills_3_resupplied_nade_one_life", 1);
							player.challenge_resuppliednamekills = 0;
						}
						player.challenge_scavengedcount--;
					}
				}
				if(isdefined(inflictoriscooked))
				{
					if(inflictoriscooked == 1 && weapon.statname == #"frag_grenade")
					{
						player stats::function_dad108fa(#"kill_with_cooked_grenade", 1);
					}
				}
				if(isdefined(var_dc8c6b51))
				{
					if(var_dc8c6b51 == 1 && weapon.statname == #"frag_grenade")
					{
						player stats::function_dad108fa(#"hash_1f4675640009a9f7", 1);
						player contracts::increment_contract(#"hash_4529ad00eb0b976d");
					}
					if(var_74f23861 === victim)
					{
						player stats::function_dad108fa(#"hash_70670980a3a22c4", 1);
					}
				}
				if(victimlaststunnedby === player)
				{
					if(weaponclass === "weapon_grenade")
					{
						player stats::function_dad108fa(#"kill_stun_lethal", 1);
					}
				}
				if(baseweapon.statname == level.weaponballisticknife.statname)
				{
					player function_80327323(data);
					if(isdefined(var_26aed950[#"talent_lightweight"]))
					{
						player stats::function_dad108fa(#"kill_lightweight", 1);
					}
				}
				if(baseweapon == level.weaponspecialcrossbow)
				{
					if(weapon.isdualwield)
					{
						checkdualwield(baseweapon, player, attacker, time, attackerwassprinting, attacker_sprint_end);
					}
				}
				if(baseweapon == level.weaponshotgunenergy)
				{
					if(isdefined(victim.firsttimedamaged) && victim.firsttimedamaged == time)
					{
						player stats::function_dad108fa(#"kill_enemy_one_bullet_shotgun", 1);
						player stats::function_e24eec31(weapon, #"kill_enemy_one_bullet_shotgun", 1);
					}
				}
			}
			if(weapon.statname === #"satchel_charge")
			{
				player stats::function_dad108fa(#"hash_76c2a7d61abd306d", 1);
				player stats::function_dad108fa(#"hash_4de1ffd2115bd019", 1);
			}
			else
			{
				if(weapon.statname === #"eq_molotov")
				{
					player stats::function_dad108fa(#"hash_1519552f0db891c2", 1);
					player stats::function_dad108fa(#"hash_172b3bc29a9fabde", 1);
					player stats::function_dad108fa(#"hash_3ef5b668aaef6551", 1);
				}
				else
				{
					if(weapon.statname === #"land_mine")
					{
						player stats::function_dad108fa(#"hash_101aa1c56608b02d", 1);
					}
					else
					{
						if(weapon.statname === #"hatchet")
						{
							player stats::function_dad108fa(#"hash_26f18c40643aa0e3", 1);
						}
						else
						{
							if(weapon.statname === #"eq_sticky_grenade")
							{
								player stats::function_dad108fa(#"hash_46faf6240c2fe71a", 1);
							}
							else if(weapon.statname === #"frag_grenade")
							{
								player stats::function_dad108fa(#"hash_43a02e8eda81d313", 1);
							}
						}
					}
				}
			}
			if(baseweapon.forcedamagehitlocation || baseweapon == level.weaponspecialcrossbow || baseweapon == level.weaponshotgunenergy || baseweapon.statname == level.weaponballisticknife.statname)
			{
				function_7fd1799f(baseweapon, player, weaponclass);
			}
			else
			{
				function_8e3fdb84(baseweapon, player);
			}
		}
	}
	if(!isdefined(killstreak) && victimwasonground && !var_8e5d0c71)
	{
		var_141c7081 = victimorigin + vectorscale((0, 0, 1), 31);
		var_a2d0af6e = attackerorigin + vectorscale((0, 0, 1), 31);
		dirtoplayer = vectornormalize(var_a2d0af6e - victimorigin);
		var_2baca0fc = !bullettracepassed(var_141c7081, var_141c7081 + (dirtoplayer * 144), 0, victim);
		if(var_2baca0fc)
		{
			player stats::function_e24eec31(weapon, #"kill_enemy_taking_cover_from_you", 1);
			player contracts::increment_contract(#"hash_72fe5b5f010b1df3");
			if(bulletkill && (isdefined(var_642d3a64) && (var_642d3a64 + 5500) > time))
			{
				var_31d806d5 = vectordot(attackerforward, victimforward);
				if(var_31d806d5 < -0.98)
				{
					player stats::function_dad108fa(#"hash_4c3088a2e317bb2", 1);
				}
			}
		}
	}
	if(isdefined(attacker) && isdefined(attacker.tookweaponfrom) && isdefined(attacker.tookweaponfrom[weapon]) && isdefined(attacker.tookweaponfrom[weapon].previousowner))
	{
		if(!isdefined(attacker.tookweaponfrom[weapon].previousowner.team) || attacker.tookweaponfrom[weapon].previousowner.team != player.team)
		{
			player stats::function_dad108fa(#"kill_with_pickup", 1);
		}
		if(attacker.tookweaponfrom[weapon].previousowner != player)
		{
			player stats::function_dad108fa(#"hash_1e868415652219af", 1);
		}
	}
	awarded_kill_enemy_that_blinded_you = 0;
	if(attackerwasflashed)
	{
		if(attackerlastflashedby === victim && !data.var_a15d12b0)
		{
			player stats::function_dad108fa(#"kill_enemy_that_blinded_you", 1);
			awarded_kill_enemy_that_blinded_you = 1;
		}
	}
	if(!awarded_kill_enemy_that_blinded_you && (isdefined(attackerlaststunnedtime) && (attackerlaststunnedtime + 5000) > time))
	{
		if(attackerlaststunnedby === victim && !data.var_a15d12b0)
		{
			player stats::function_dad108fa(#"kill_enemy_that_blinded_you", 1);
			awarded_kill_enemy_that_blinded_you = 1;
		}
	}
	killedstunnedvictim = victimlaststunnedby === attacker && !data.var_90795a2c && (isdefined(var_da9749ea) && (var_da9749ea + 5000) > time);
	if(isdefined(victim.lastshockedby) && victim.lastshockedby == attacker)
	{
		if(victim.shockendtime > time)
		{
			if(player util::is_item_purchased(#"proximity_grenade"))
			{
				player stats::function_dad108fa(#"kill_shocked_enemy", 1);
			}
			player function_be7a08a8(getweapon(#"proximity_grenade"), 1);
			killedstunnedvictim = 1;
			if(weapon.rootweapon.name == "bouncingbetty")
			{
				player stats::function_dad108fa(#"kill_trip_mine_shocked", 1);
			}
		}
	}
	if(victim util::isflashbanged())
	{
		if(victim.lastflashedby === player)
		{
			killedstunnedvictim = 1;
			if(player util::is_item_purchased(#"flash_grenade"))
			{
				player stats::function_dad108fa(#"kill_flashed_enemy", 1);
			}
			player function_be7a08a8(getweapon(#"flash_grenade"), 1);
		}
	}
	if(level.teambased)
	{
		if(!isdefined(player.pers[#"kill_every_enemy_with_specialist"]) && (level.playercount[victim.pers[#"team"]] > 3 && player.pers[#"killed_players_with_specialist"].size >= level.playercount[victim.pers[#"team"]]))
		{
			player stats::function_dad108fa(#"kill_every_enemy", 1);
			player.pers[#"kill_every_enemy_with_specialist"] = 1;
		}
		if(isdefined(victimattackersthisspawn) && isarray(victimattackersthisspawn))
		{
			if(victimattackersthisspawn.size > 5)
			{
				attackercount = 0;
				foreach(attacking_player in victimattackersthisspawn)
				{
					if(!isdefined(attacking_player))
					{
						continue;
					}
					if(attacking_player == attacker)
					{
						continue;
					}
					if(attacking_player.team !== attacker.team)
					{
						continue;
					}
					attackercount++;
				}
				if(attackercount > 4)
				{
					player stats::function_dad108fa(#"kill_enemy_5_teammates_assists", 1);
				}
			}
		}
	}
	if(isdefined(killstreak))
	{
		if(killstreak == "ultimate_turret" || killstreak == "inventory_ultimate_turret")
		{
			if(isdefined(inflictor))
			{
				if(!isdefined(inflictor.challenge_killcount))
				{
					inflictor.challenge_killcount = 0;
				}
				inflictor.challenge_killcount++;
				if(inflictor.challenge_killcount == 5)
				{
					player stats::function_dad108fa(#"hash_636e38d21d529ce3", 1);
				}
			}
		}
	}
	if(var_937b6de2)
	{
		if(!isdefined(inflictor) || !isdefined(inflictor.killstreaktype) || !isstring(inflictor.killstreaktype) || inflictor.killstreaktype != "combat_robot")
		{
			player stats::function_dad108fa(#"kill_enemy_who_damaged_robot", 1);
		}
	}
	var_46119dfa = player getloadoutitem(player.class_num, "primarygrenadecount");
	if(var_46119dfa)
	{
		if(weapon.rootweapon.name == "hatchet" && inflictorchallenge_hatchettosscount <= 2)
		{
			player.challenge_hatchetkills++;
			if(player.challenge_hatchetkills == 2)
			{
				player stats::function_dad108fa(#"kills_first_throw_both_hatchets", 1);
			}
		}
	}
	if(var_2e1b3ac1 === 1)
	{
		player stats::function_dad108fa(#"hash_21792d157fabd319", 1);
	}
	player trackkillstreaksupportkills(victim);
	if(!isdefined(killstreak))
	{
		if(attackerwasunderwater)
		{
			player stats::function_dad108fa(#"kill_while_underwater", 1);
		}
		if(attackerwasunderwater && var_e828179e < 5 && !var_8556c722)
		{
			player stats::function_dad108fa(#"kill_enemy_on_land_underwater", 1);
		}
		trackedplayer = 0;
		if(player util::has_purchased_perk_equipped(#"specialty_tracker"))
		{
			if(!victim hasperk(#"specialty_trackerjammer"))
			{
				player stats::function_dad108fa(#"kill_detect_tracker", 1);
				trackedplayer = 1;
			}
		}
		if(player util::has_purchased_perk_equipped(#"specialty_detectnearbyenemies"))
		{
			if(!victim hasperk(#"specialty_sixthsensejammer"))
			{
				player stats::function_dad108fa(#"kill_enemy_sixth_sense", 1);
				if(player util::has_purchased_perk_equipped(#"specialty_loudenemies"))
				{
					if(!victim hasperk(#"specialty_quieter"))
					{
						player stats::function_dad108fa(#"kill_sixthsense_awareness", 1);
					}
				}
			}
			if(trackedplayer)
			{
				player stats::function_dad108fa(#"kill_tracker_sixthsense", 1);
			}
		}
		if(player hasperk(#"specialty_gpsjammer"))
		{
			if(player uav::function_781f1bf2() || (isdefined(level.var_efb43e1) && player [[level.var_efb43e1]]()))
			{
				player stats::function_dad108fa(#"hash_5bdb4dad0048aead", 1);
				player stats::function_dad108fa(#"hash_74b19794b9a484d9", 1);
			}
		}
		if(player util::has_purchased_perk_equipped(#"specialty_gpsjammer"))
		{
			if(uav::hasuav(victim.team))
			{
				player stats::function_dad108fa(#"kill_uav_enemy_with_ghost", 1);
			}
			if(player util::has_blind_eye_perk_purchased_and_equipped())
			{
				activekillstreaks = victim killstreaks::getactivekillstreaks();
				awarded_kill_blindeye_ghost_aircraft = 0;
				foreach(activestreak in activekillstreaks)
				{
					if(awarded_kill_blindeye_ghost_aircraft)
					{
						break;
					}
					switch(activestreak.killstreaktype)
					{
						case "drone_striked":
						case "uav":
						case "helicopter_comlink":
						case "sentinel":
						{
							player stats::function_dad108fa(#"kill_blindeye_ghost_aircraft", 1);
							awarded_kill_blindeye_ghost_aircraft = 1;
							break;
						}
					}
				}
			}
		}
		if(player util::has_purchased_perk_equipped(#"specialty_flakjacket"))
		{
			if(isdefined(player.challenge_lastsurvivewithflakfrom) && player.challenge_lastsurvivewithflakfrom == victim)
			{
				player stats::function_dad108fa(#"kill_enemy_survive_flak", 1);
			}
			if(player util::has_tactical_mask_purchased_and_equipped())
			{
				if(attackerwasflashed || (isdefined(player.challenge_lastsurvivewithflaktime) && (player.challenge_lastsurvivewithflaktime + 3500) > time) || (isdefined(attackerlaststunnedtime) && (attackerlaststunnedtime + 2500) > time))
				{
					player stats::function_dad108fa(#"kill_flak_tac_while_stunned", 1);
				}
			}
		}
		if(player util::has_hard_wired_perk_purchased_and_equipped())
		{
			if(isdefined(level.hasindexactivecounteruav) && victim [[level.hasindexactivecounteruav]](victim.team))
			{
				player stats::function_dad108fa(#"kills_counteruav_emp_hardline", 1);
			}
		}
		if(player util::has_scavenger_perk_purchased_and_equipped())
		{
			if(player.scavenged)
			{
				player stats::function_dad108fa(#"kill_after_resupply", 1);
				if(trackedplayer)
				{
					player stats::function_dad108fa(#"kill_scavenger_tracker_resupply", 1);
				}
			}
		}
		if(player util::has_fast_hands_perk_purchased_and_equipped())
		{
			if(bulletkill)
			{
				if(attackerwassprinting || (attacker_sprint_end + 3000) > time)
				{
					player stats::function_dad108fa(#"kills_after_sprint_fasthands", 1);
					if(player util::has_gung_ho_perk_purchased_and_equipped())
					{
						player stats::function_dad108fa(#"kill_fasthands_gungho_sprint", 1);
					}
				}
			}
		}
		if(player util::has_hard_wired_perk_purchased_and_equipped())
		{
			if(player util::has_cold_blooded_perk_purchased_and_equipped())
			{
				player stats::function_dad108fa(#"kill_hardwired_coldblooded", 1);
			}
		}
		killedplayerwithgungho = 0;
		if(player util::has_gung_ho_perk_purchased_and_equipped())
		{
			if(bulletkill)
			{
				killedplayerwithgungho = 1;
				if(attackerwassprinting && player playerads() != 1)
				{
					player stats::function_dad108fa(#"kill_hip_gung_ho", 1);
				}
			}
			if(weaponclass === "weapon_grenade")
			{
				if(isdefined(inflictorownerwassprinting) && inflictorownerwassprinting == 1)
				{
					killedplayerwithgungho = 1;
					player stats::function_dad108fa(#"kill_hip_gung_ho", 1);
				}
			}
		}
		if(player util::has_awareness_perk_purchased_and_equipped())
		{
			player stats::function_dad108fa(#"kill_awareness", 1);
		}
		if(killedstunnedvictim)
		{
			if(weapon !== level.weaponnone)
			{
				player stats::function_e24eec31(weapon, #"kill_detected_stunned_blinded", 1);
				player stats::function_e24eec31(weapon, #"kill_smoked_blinded_stunned", 1);
			}
			if(player util::has_tactical_mask_purchased_and_equipped())
			{
				player stats::function_dad108fa(#"kill_stunned_tacmask", 1);
				if(killedplayerwithgungho == 1)
				{
					player stats::function_dad108fa(#"kill_sprint_stunned_gungho_tac", 1);
				}
			}
		}
		if(player util::has_ninja_perk_purchased_and_equipped())
		{
			player stats::function_dad108fa(#"kill_dead_silence", 1);
			if(distancesquared(attackerorigin, victimorigin) < sqr(120))
			{
				if(player util::has_awareness_perk_purchased_and_equipped())
				{
					player stats::function_dad108fa(#"kill_close_deadsilence_awareness", 1);
				}
				if(player util::has_jetquiet_perk_purchased_and_equipped())
				{
					player stats::function_dad108fa(#"kill_close_blast_deadsilence", 1);
				}
			}
		}
		primary_weapon = player loadout::function_18a77b37("primary");
		if(isdefined(primary_weapon) && weapon == primary_weapon || (isdefined(primary_weapon) && isdefined(primary_weapon.altweapon) && weapon == primary_weapon.altweapon))
		{
			if(player function_861fe993("secondary"))
			{
				player function_7ec2f2c("primary", 0);
				player function_7ec2f2c("secondary", 0);
			}
			else
			{
				player function_7ec2f2c("primary", 1);
			}
		}
		else
		{
			secondary_weapon = player loadout::function_18a77b37("secondary");
			if(isdefined(secondary_weapon) && weapon == secondary_weapon || (isdefined(secondary_weapon) && isdefined(secondary_weapon.altweapon) && weapon == secondary_weapon.altweapon))
			{
				if(player function_861fe993("primary"))
				{
					player function_7ec2f2c("primary", 0);
					player function_7ec2f2c("secondary", 0);
				}
				else
				{
					player function_7ec2f2c("secondary", 1);
				}
			}
		}
		if(player util::has_hacker_perk_purchased_and_equipped() && player util::has_hard_wired_perk_purchased_and_equipped())
		{
			should_award_kill_near_plant_engineer_hardwired = 0;
			if(isdefined(victimactivebouncingbetties))
			{
				foreach(bouncingbettyinfo in victimactivebouncingbetties)
				{
					if(!isdefined(bouncingbettyinfo) || !isdefined(bouncingbettyinfo.origin))
					{
						continue;
					}
					if(distancesquared(bouncingbettyinfo.origin, victimorigin) < sqr(400))
					{
						should_award_kill_near_plant_engineer_hardwired = 1;
						break;
					}
				}
			}
			if(isdefined(victimactiveproximitygrenades) && should_award_kill_near_plant_engineer_hardwired == 0)
			{
				foreach(proximitygrenadeinfo in victimactiveproximitygrenades)
				{
					if(!isdefined(proximitygrenadeinfo) || !isdefined(proximitygrenadeinfo.origin))
					{
						continue;
					}
					if(distancesquared(proximitygrenadeinfo.origin, victimorigin) < sqr(400))
					{
						should_award_kill_near_plant_engineer_hardwired = 1;
						break;
					}
				}
			}
			if(should_award_kill_near_plant_engineer_hardwired)
			{
				player stats::function_dad108fa(#"kill_near_plant_engineer_hardwired", 1);
			}
		}
		if(isdefined(var_70763083) && (var_70763083 + 2500) > time)
		{
			player stats::function_dad108fa(#"kill_enemy_after_they_heal", 1);
		}
		if(isdefined(var_e5241328) && (var_e5241328 + 4500) > time)
		{
			if(isdefined(attacker.health) && isdefined(var_cc8f0762) && (attacker.health - var_cc8f0762) > 40)
			{
				attacker stats::function_dad108fa(#"kill_enemy_after_you_heal", 1);
			}
		}
		if(var_d6553aa9 === 1 && level.teambased)
		{
			attacker stats::function_dad108fa(#"hash_ae06343a118b545", 1);
		}
		if(!victimwasonground && var_e828179e <= 0)
		{
			attacker stats::function_dad108fa(#"kill_enemy_thats_in_air", 1);
		}
		if(victimweapon.issignatureweapon === 1)
		{
			if(!isdefined(var_f91a4dd6) || var_f91a4dd6 < 1)
			{
				attacker stats::function_dad108fa(#"kill_before_specialist_weapon_use", 1);
			}
			if(victimweapon.statname == #"sig_buckler_dw")
			{
				if(!isdefined(killstreak) && bulletkill && (vectordot(victimforward, attackerorigin - victimorigin)) < 0)
				{
					attacker stats::function_dad108fa(#"shutdown_ballisticshield_in_back", 1);
				}
			}
		}
		if(var_1fa3e8cc === 1 && !var_8556c722 && var_911b9b40 !== 1)
		{
			attacker stats::function_dad108fa(#"kill_with_weapon_in_right_hand_only", 1);
		}
		if(isdefined(attacker.attackerdamage) && isdefined(attacker.attackerdamage[victim.clientid]))
		{
			if(isdefined(attacker.attackerdamage[victim.clientid].lasttimedamaged) && (attacker.attackerdamage[victim.clientid].lasttimedamaged + 1500) > time)
			{
				attacker stats::function_dad108fa(#"hash_40df7b67ff81556e", 1);
			}
			else if(!(isdefined(attacker.attackerdamage[victim.clientid].lasttimedamaged) && (attacker.attackerdamage[victim.clientid].lasttimedamaged + (int(5 * 1000))) > time))
			{
				if(attacker.health >= attacker.maxhealth)
				{
					attacker stats::function_dad108fa(#"hash_512dd9eae51dae25", 1);
				}
			}
		}
		else if(attacker.health >= attacker.maxhealth)
		{
			attacker stats::function_dad108fa(#"hash_512dd9eae51dae25", 1);
		}
		if(!victimwasonground && victimwasinslamstate && var_d24b8539 === 1)
		{
			attacker stats::function_dad108fa(#"hash_50371401f38a92f", 1);
		}
		if(isdefined(data.var_58b48038))
		{
			attacker stats::function_dad108fa(#"kill_enemy_after_surviving_rcxd", 1);
		}
	}
	else
	{
		if(weapon.name == #"supplydrop")
		{
			if(isdefined(inflictorplayerhasengineerperk))
			{
				player stats::function_dad108fa(#"kill_booby_trap_engineer", 1);
			}
		}
		var_2cf35051 = globallogic_score::function_3cbc4c6c(victimweapon.var_2e4a8800);
		if(victimweapon.issignatureweapon === 1 || (isdefined(var_2cf35051) && var_2cf35051.var_fcd2ff3a === 1))
		{
			if(killstreak == #"dart" || killstreak == #"inventory_dart" || killstreak == #"recon_car" || killstreak == #"inventory_recon_car" || (killstreak == #"tank_robot" || killstreak == #"inventory_tank_robot" && var_911b9b40 === 1))
			{
				attacker stats::function_dad108fa(#"hash_7ce97233d9d7e81", 1);
			}
		}
	}
	if(var_8099aa99 === 1)
	{
		attacker stats::function_dad108fa(#"hash_2c01bc7b9ae95b81", 1);
		attacker contracts::increment_contract(#"hash_6f0eb3d065bcf77e");
	}
	var_eae59bb8 = globallogic_score::function_3cbc4c6c(weapon.var_2e4a8800);
	if(weapon.issignatureweapon === 1 || (isdefined(var_eae59bb8) && var_eae59bb8.var_fcd2ff3a === 1))
	{
		if(victimweapon.issignatureweapon === 1)
		{
			attacker stats::function_dad108fa(#"kill_specialist_with_specialist", 1);
		}
	}
	if(level.var_9ff21849)
	{
		if(victimbledout !== 1 || var_59a8c5c7 === 1)
		{
			if(!isdefined(attacker.var_ee07421b[victim.squad]))
			{
				attacker.var_ee07421b[victim.squad] = 0;
			}
			attacker.var_ee07421b[victim.squad]++;
		}
	}
	if(isdefined(attacker.var_1e1c7f1b) && (attacker.var_1e1c7f1b + (int(20 * 1000))) > time)
	{
		attacker stats::function_dad108fa(#"hash_529c12e133e45b94", 1);
		attacker stats::function_dad108fa(#"hash_3dd233c2a2cb7eec", 1);
	}
	if(var_9e818622 === 1)
	{
		attacker stats::function_dad108fa(#"hash_1674502cb913305d", 1);
	}
	if(isdefined(attacker.var_3c9fd034) && attacker.var_26b87dc4 === 1)
	{
		attacker stats::function_dad108fa(#"hash_2859c7926269f2a7", 1);
		attacker.var_26b87dc4 = 0;
	}
	attacker.var_3c9fd034 = weapon;
}

/*
	Name: on_player_spawn
	Namespace: challenges
	Checksum: 0x610AC0B2
	Offset: 0x8208
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function on_player_spawn()
{
	if(canprocesschallenges())
	{
		self fix_challenge_stats_on_spawn();
		self function_b6d44fd9();
	}
	self function_6b34141d();
}

/*
	Name: function_b6d44fd9
	Namespace: challenges
	Checksum: 0x3014753C
	Offset: 0x8278
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function function_b6d44fd9()
{
	self.var_ea1458aa = {};
}

/*
	Name: force_challenge_stat
	Namespace: challenges
	Checksum: 0x13E376DE
	Offset: 0x8290
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function force_challenge_stat(stat_name, stat_value)
{
	self stats::set_stat_global(stat_name, stat_value);
	self stats::set_stat_challenge(stat_name, stat_value);
}

/*
	Name: get_challenge_group_stat
	Namespace: challenges
	Checksum: 0x18737075
	Offset: 0x82E0
	Size: 0x52
	Parameters: 2
	Flags: Linked
*/
function get_challenge_group_stat(group_name, stat_name)
{
	return self stats::get_stat(#"groupstats", group_name, #"stats", stat_name, #"challengevalue");
}

/*
	Name: fix_challenge_stats_on_spawn
	Namespace: challenges
	Checksum: 0xCD02BD4A
	Offset: 0x8340
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function fix_challenge_stats_on_spawn()
{
	player = self;
	if(!isdefined(player))
	{
		return;
	}
	if(player.var_8efcbd6a === 1)
	{
		return;
	}
	player thread function_4039ce49();
	player.var_8efcbd6a = 1;
}

/*
	Name: function_4039ce49
	Namespace: challenges
	Checksum: 0x221BADB8
	Offset: 0x83A0
	Size: 0xBE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4039ce49()
{
	player = self;
	player endon(#"disconnect");
	while(game.state != #"playing")
	{
		wait(1);
	}
	wait_time = randomfloatrange(3, 5);
	wait(wait_time);
	if(!isdefined(player))
	{
		return;
	}
	player function_ba57595b();
	player function_8f60c536();
}

/*
	Name: function_8f60c536
	Namespace: challenges
	Checksum: 0xBFA54F3D
	Offset: 0x8468
	Size: 0x11C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8f60c536()
{
	player = self;
	params = {};
	primary_weapon = player loadout::function_18a77b37("primary");
	if(isdefined(primary_weapon) && primary_weapon != level.weaponnone)
	{
		params.item_index = getbaseweaponitemindex(primary_weapon);
		player function_4e40694d(#"hash_354a96dc1d24e7a3", params);
	}
	secondary_weapon = player loadout::function_18a77b37("secondary");
	if(isdefined(secondary_weapon) && secondary_weapon != level.weaponnone)
	{
		params.item_index = getbaseweaponitemindex(secondary_weapon);
		player function_4e40694d(#"hash_354a96dc1d24e7a3", params);
	}
}

/*
	Name: function_ba57595b
	Namespace: challenges
	Checksum: 0x3DE51E9C
	Offset: 0x8590
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ba57595b()
{
	if(!util::isfirstround())
	{
		return;
	}
	player = self;
	player function_ee1898d0();
}

/*
	Name: function_ee1898d0
	Namespace: challenges
	Checksum: 0x4C5BB14A
	Offset: 0x85D8
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_ee1898d0()
{
	if(self stats::function_af5584ca(#"top_scorer") === 3 && !self stats::function_af5584ca(#"hash_70c5595e6963954b") === 1)
	{
		if(self stats::function_af5584ca(#"hash_726639776bb5add") === 3 && self stats::function_af5584ca(#"hash_4551622490fb634f") === 3 && self stats::function_af5584ca(#"hash_20b4a91c344d73ec") === 3 && self stats::function_af5584ca(#"hash_59a333a70cbf2d40") === 1 && self stats::function_af5584ca(#"featured_in_best_play") === 1)
		{
			self stats::function_dad108fa(#"hash_70c5595e6963954b", 1);
		}
	}
}

/*
	Name: function_223ff464
	Namespace: challenges
	Checksum: 0x3FAA397A
	Offset: 0x8730
	Size: 0x26C
	Parameters: 0
	Flags: None
*/
function function_223ff464()
{
	if(!self stats::get_stat(#"extrabools", 0) === 1)
	{
		self force_challenge_stat(#"mastery_marksman", 0);
		marksmanarray = [];
		array::add(marksmanarray, #"hash_4075f20007923416");
		array::add(marksmanarray, #"hash_72d1952fced05f40");
		array::add(marksmanarray, #"hash_70cd6c54d1c07272");
		array::add(marksmanarray, #"hash_6b828c2fcb0e8df5");
		array::add(marksmanarray, #"hash_2ea8a6bab2364c58");
		array::add(marksmanarray, #"hash_7ecfcae46143397c");
		array::add(marksmanarray, #"hash_3b30f98820bc20cf");
		array::add(marksmanarray, #"hash_18816731b999fbfb");
		array::add(marksmanarray, #"hash_6c1c399dcbe1af97");
		array::add(marksmanarray, #"hash_5630ec40181e1db3");
		array::add(marksmanarray, #"hash_354bfe5c140365bf");
		array::add(marksmanarray, #"hash_51eff59939399dc9");
		for(index = 0; index < marksmanarray.size; index++)
		{
			if(self stats::function_af5584ca(marksmanarray[index]) === 1)
			{
				self stats::function_dad108fa(#"mastery_marksman", 1);
			}
		}
		self stats::set_stat(#"extrabools", 0, 1);
	}
}

/*
	Name: function_bd5db926
	Namespace: challenges
	Checksum: 0x90608888
	Offset: 0x89A8
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_bd5db926()
{
	if(!self stats::get_stat(#"extrabools", 1) === 1)
	{
		var_5d157945 = self stats::get_stat_global(#"stats_rcxd_kill");
		recon_car = getweapon(#"hash_38ffd09564931482");
		self stats::function_e24eec31(recon_car, #"kills", var_5d157945);
		self stats::set_stat(#"extrabools", 1, 1);
	}
}

/*
	Name: function_f4106216
	Namespace: challenges
	Checksum: 0x4DCEC76F
	Offset: 0x8A90
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_f4106216()
{
	if(!self stats::get_stat(#"playerstatslist", #"hash_195a18a5697c5c96") === 1)
	{
		challengetier = self stats::function_af5584ca("shutdown_gravslam_before_impact");
		if(!isdefined(challengetier))
		{
			return;
		}
		if(challengetier > 0)
		{
			self stats::function_8e071909("stats_gravity_slam_shutdown", challengetier);
		}
		challengevalue = self stats::get_stat_challenge("shutdown_gravslam_before_impact");
		self stats::set_stat_challenge("stats_gravity_slam_shutdown", challengevalue);
		self stats::set_stat(#"playerstatslist", #"hash_195a18a5697c5c96", 1);
	}
}

/*
	Name: function_34364901
	Namespace: challenges
	Checksum: 0x6AC2EA4C
	Offset: 0x8BB8
	Size: 0x1C4
	Parameters: 0
	Flags: None
*/
function function_34364901()
{
	player = self;
	var_fae27922 = player stats::get_stat(#"item_stats", #"sniper_locus_t8", #"challenges_tu", #"challengevalue");
	if(var_fae27922 === 6)
	{
		player stats::set_stat(#"item_stats", #"sniper_locus_t8", #"challenges_tu", #"challengevalue", 5);
		player stats::set_stat(#"item_stats", #"sniper_locus_t8", #"challenges_tu", #"statvalue", 5);
		player stats::set_stat(#"item_stats", #"sniper_locus_t8", #"challenges_tu", #"challengetier", 0);
		player addweaponstat(getweapon(#"sniper_locus_t8"), #"challenges_tu", 1);
	}
}

/*
	Name: fix_tu6_weapon_for_diamond
	Namespace: challenges
	Checksum: 0xC670D372
	Offset: 0x8D88
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function fix_tu6_weapon_for_diamond(stat_name)
{
	player = self;
	wepaon_for_diamond = player stats::get_stat_challenge(stat_name);
	if(wepaon_for_diamond == 1)
	{
		secondary_mastery = player stats::get_stat_challenge("secondary_mastery");
		if(secondary_mastery == 3)
		{
			player force_challenge_stat(stat_name, 2);
		}
		else
		{
			player force_challenge_stat(stat_name, 0);
		}
	}
}

/*
	Name: fix_tu6_ar_garand
	Namespace: challenges
	Checksum: 0xC4165C06
	Offset: 0x8E50
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function fix_tu6_ar_garand()
{
	player = self;
	group_weapon_assault = player get_challenge_group_stat("weapon_assault", "challenges");
	weapons_mastery_assault = player stats::get_stat_challenge("weapons_mastery_assault");
	if(group_weapon_assault >= 49 && weapons_mastery_assault < 1)
	{
		player force_challenge_stat("weapons_mastery_assault", 1);
		player stats::function_dad108fa(#"ar_garand_for_diamond", 1);
	}
}

/*
	Name: fix_tu6_pistol_shotgun
	Namespace: challenges
	Checksum: 0xF791E2E8
	Offset: 0x8F28
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function fix_tu6_pistol_shotgun()
{
	player = self;
	group_weapon_pistol = player get_challenge_group_stat("weapon_pistol", "challenges");
	secondary_mastery_pistol = player stats::get_stat_challenge("secondary_mastery_pistol");
	if(group_weapon_pistol >= 21 && secondary_mastery_pistol < 1)
	{
		player force_challenge_stat("secondary_mastery_pistol", 1);
		player stats::function_dad108fa(#"pistol_shotgun_for_diamond", 1);
	}
}

/*
	Name: completed_specific_challenge
	Namespace: challenges
	Checksum: 0xE9F1AC96
	Offset: 0x9000
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function completed_specific_challenge(target_value, challenge_name)
{
	challenge_count = self stats::get_stat_challenge(challenge_name);
	return challenge_count >= target_value;
}

/*
	Name: tally_completed_challenge
	Namespace: challenges
	Checksum: 0x2FBDBBB
	Offset: 0x9048
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function tally_completed_challenge(target_value, challenge_name)
{
	return true;
}

/*
	Name: tu7_fix_100_percenter
	Namespace: challenges
	Checksum: 0x9D36B3D5
	Offset: 0x9088
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function tu7_fix_100_percenter()
{
	self tu7_fix_mastery_perk_2();
}

/*
	Name: tu7_fix_mastery_perk_2
	Namespace: challenges
	Checksum: 0xACEBABBB
	Offset: 0x90B0
	Size: 0x2BC
	Parameters: 0
	Flags: Linked
*/
function tu7_fix_mastery_perk_2()
{
	player = self;
	mastery_perk_2 = player stats::get_stat_challenge("mastery_perk_2");
	if(mastery_perk_2 >= 12)
	{
		return;
	}
	if(player completed_specific_challenge(200, "earn_scorestreak_anteup") == 0)
	{
		return;
	}
	perk_2_tally = 1;
	perk_2_tally = perk_2_tally + player tally_completed_challenge(100, #"destroy_ai_scorestreak_coldblooded");
	perk_2_tally = perk_2_tally + player tally_completed_challenge(100, #"kills_counteruav_emp_hardline");
	perk_2_tally = perk_2_tally + player tally_completed_challenge(200, #"kill_after_resupply");
	perk_2_tally = perk_2_tally + player tally_completed_challenge(100, #"kills_after_sprint_fasthands");
	perk_2_tally = perk_2_tally + player tally_completed_challenge(200, #"kill_detect_tracker");
	perk_2_tally = perk_2_tally + player tally_completed_challenge(10, #"earn_5_scorestreaks_anteup");
	perk_2_tally = perk_2_tally + player tally_completed_challenge(25, #"kill_scavenger_tracker_resupply");
	perk_2_tally = perk_2_tally + player tally_completed_challenge(25, #"kill_hardwired_coldblooded");
	perk_2_tally = perk_2_tally + player tally_completed_challenge(25, #"kill_anteup_overclock_scorestreak_specialist");
	perk_2_tally = perk_2_tally + player tally_completed_challenge(50, #"kill_fasthands_gungho_sprint");
	perk_2_tally = perk_2_tally + player tally_completed_challenge(50, #"kill_tracker_sixthsense");
	if(mastery_perk_2 < perk_2_tally)
	{
		player stats::function_dad108fa(#"mastery_perk_2", 1);
	}
}

/*
	Name: getbaseweapon
	Namespace: challenges
	Checksum: 0xF72DC6DA
	Offset: 0x9378
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function getbaseweapon(weapon)
{
	rootweapon = weapons::getbaseweapon(weapon);
	baseweapon = getweapon(rootweapon.statname);
	if(level.weaponnone == baseweapon)
	{
		baseweapon = rootweapon;
	}
	return baseweapon.rootweapon;
}

/*
	Name: function_8e3fdb84
	Namespace: challenges
	Checksum: 0xA719FF48
	Offset: 0x9400
	Size: 0x13C
	Parameters: 2
	Flags: Linked
*/
function function_8e3fdb84(baseweapon, player)
{
	/#
		assert(isdefined(baseweapon));
	#/
	/#
		assert(isdefined(player.weaponkillsthisspawn));
	#/
	if(isdefined(player.weaponkillsthisspawn[baseweapon]))
	{
		player.weaponkillsthisspawn[baseweapon]++;
		weaponkillsthisspawn = player.weaponkillsthisspawn[baseweapon];
		if((weaponkillsthisspawn % 2) == 0)
		{
			player stats::function_e24eec31(baseweapon, #"killstreak_3", 1);
		}
		if((weaponkillsthisspawn % 3) == 0)
		{
			if(baseweapon.islethalgrenade && player function_6c32d092(#"hash_59c460a16d8c1e96"))
			{
				player contracts::increment_contract(#"hash_1c0d581d27b54c2a");
			}
		}
	}
	else
	{
		player.weaponkillsthisspawn[baseweapon] = 1;
	}
}

/*
	Name: function_7fd1799f
	Namespace: challenges
	Checksum: 0xC7C8292C
	Offset: 0x9548
	Size: 0x2BC
	Parameters: 3
	Flags: Linked
*/
function function_7fd1799f(baseweapon, player, weaponclass)
{
	/#
		assert(isdefined(baseweapon));
	#/
	/#
		assert(isdefined(player.weaponkillsthisspawn));
	#/
	if(isdefined(player.weaponkillsthisspawn[baseweapon]))
	{
		player.weaponkillsthisspawn[baseweapon]++;
		weaponkillsthisspawn = player.weaponkillsthisspawn[baseweapon];
		if((weaponkillsthisspawn % 3) == 0)
		{
			player stats::function_e24eec31(baseweapon, #"killstreak_3", 1);
			if(weaponclass === #"weapon_cqb" && !isdefined(player.pers[#"hash_21f4e05360177d4b"]))
			{
				player stats::function_d0de7686(#"hash_458e8316073535c4", 1, #"hash_37fcfdb6e2a551aa");
				player.pers[#"hash_21f4e05360177d4b"] = 1;
			}
			else
			{
				if(weaponclass === #"weapon_assault" && !isdefined(player.pers[#"hash_19bc4812e186371a"]))
				{
					player stats::function_d0de7686(#"hash_4749db0b7b2d6e3", 1, #"hash_51465116c1efc9be");
					player.pers[#"hash_19bc4812e186371a"] = 1;
				}
				else if(weaponclass === #"weapon_knife" && !isdefined(player.pers[#"hash_2b0aa9d6dc24efd7"]))
				{
					player stats::function_d0de7686(#"hash_515b8f2bd79567f8", 1, #"hash_2b6ca84b97ab9928");
					player.pers[#"hash_2b0aa9d6dc24efd7"] = 1;
				}
			}
		}
		if((weaponkillsthisspawn % 5) == 0)
		{
			player stats::function_e24eec31(baseweapon, #"killstreak_5", 1);
		}
		if(weaponkillsthisspawn == 30)
		{
			player stats::function_e24eec31(baseweapon, #"killstreak_30", 1);
		}
	}
	else
	{
		player.weaponkillsthisspawn[baseweapon] = 1;
	}
}

/*
	Name: function_b2b18857
	Namespace: challenges
	Checksum: 0x29452C67
	Offset: 0x9810
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_b2b18857(player)
{
	if(isdefined(player.headshots) && player.headshots > 0)
	{
		if((player.headshots % 5) == 0)
		{
			player stats::function_dad108fa(#"headshot_5", 1);
		}
	}
}

/*
	Name: checkdualwield
	Namespace: challenges
	Checksum: 0xA6EB008F
	Offset: 0x9888
	Size: 0x34
	Parameters: 6
	Flags: Linked
*/
function checkdualwield(baseweapon, player, attacker, time, attackerwassprinting, attacker_sprint_end)
{
}

/*
	Name: challengegameendmp
	Namespace: challenges
	Checksum: 0xED93DBFB
	Offset: 0x98C8
	Size: 0x9D2
	Parameters: 1
	Flags: Linked
*/
function challengegameendmp(data)
{
	player = data.player;
	winner = data.winner;
	var_f5d9e583 = data.place;
	if(!isdefined(player.team))
	{
		return;
	}
	if(endedearly(winner, match::get_flag("tie")))
	{
		return;
	}
	if(level.teambased)
	{
		winnerscore = game.stat[#"teamscores"][winner];
		loserscore = getlosersteamscores(winner);
	}
	var_97e12758 = 1;
	for(index = 0; index < level.placement[#"all"].size; index++)
	{
		if(level.placement[#"all"][index].deaths < player.deaths)
		{
			var_97e12758 = 0;
		}
		if(level.placement[#"all"][index].ekia > player.ekia)
		{
			var_97e12758 = 0;
		}
	}
	if(var_97e12758 && player.ekia > 0 && level.placement[#"all"].size > 3)
	{
		if(level.teambased)
		{
			playeriswinner = player.team === winner;
		}
		else
		{
			playeriswinner = var_f5d9e583 < 3;
		}
		if(playeriswinner)
		{
			player stats::function_dad108fa(#"hash_1ffca5180d4e7b6", 1);
			player contracts::increment_contract(#"hash_8f83854f9aa068e");
			if(level.basegametype == #"dm" || level.var_9ff21849)
			{
				player stats::function_dad108fa(#"hash_3a99adcb0a44c32b", 1);
			}
			if(level.basegametype == #"tdm" || level.basegametype == #"dm" || level.basegametype == #"sd")
			{
				player stats::function_dad108fa(#"hash_59a333a70cbf2d40", 1);
			}
		}
	}
	if(var_f5d9e583 < 3)
	{
		player contracts::player_contract_event(#"hash_32ed5d2b274397c1");
		if(level.hardcoremode)
		{
			player stats::function_dad108fa(#"hash_4551622490fb634f", 1);
		}
		else if(!level.arenamatch)
		{
			player stats::function_dad108fa(#"hash_726639776bb5add", 1);
		}
		if(level.basegametype == #"dm" || level.var_9ff21849)
		{
			player stats::function_dad108fa(#"hash_52acb9c328698c58", 1);
		}
		if(level.var_9ff21849)
		{
			player stats::function_dad108fa(#"hash_53c962b66dc62fd1", 1);
		}
	}
	if(level.var_9ff21849 && player.team == winner)
	{
		player stats::function_dad108fa(#"hash_20b4a91c344d73ec", 1);
	}
	switch(level.basegametype)
	{
		case "tdm":
		{
			if(player.team == winner)
			{
				if(winnerscore >= (loserscore + 25))
				{
					player stats::function_d40764f3(#"crush", 1);
					player stats::function_dad108fa(#"hash_38cf622aaf2ce3d7", 1);
				}
			}
			break;
		}
		case "dm":
		{
			if(player == winner)
			{
				if(level.placement[#"all"].size >= 2)
				{
					secondplace = level.placement[#"all"][1];
					if(player.kills >= (secondplace.kills + 7))
					{
						player stats::function_d40764f3(#"crush", 1);
						player stats::function_dad108fa(#"hash_38cf622aaf2ce3d7", 1);
					}
					player stats::function_dad108fa(#"hash_20b4a91c344d73ec", 1);
				}
			}
			break;
		}
		case "ctf":
		{
			if(player.team == winner)
			{
				if(loserscore == 0)
				{
					player stats::function_d40764f3(#"shut_out", 1);
				}
			}
			break;
		}
		case "dom":
		{
			if(player.team == winner)
			{
				if(winnerscore >= (loserscore + 70))
				{
					player stats::function_d40764f3(#"crush", 1);
					player stats::function_dad108fa(#"hash_1b0c06f37648493f", 1);
				}
			}
			break;
		}
		case "hq":
		{
			if(player.team == winner && winnerscore > 0)
			{
				if(winnerscore >= (loserscore + 70))
				{
					player stats::function_d40764f3(#"crush", 1);
				}
			}
			break;
		}
		case "koth":
		{
			if(player.team == winner && winnerscore > 0)
			{
				if(winnerscore >= (loserscore + 70))
				{
					player stats::function_d40764f3(#"crush", 1);
					player stats::function_dad108fa(#"hash_1b0c06f37648493f", 1);
				}
			}
			if(player.team == winner && winnerscore > 0)
			{
				if(winnerscore >= (loserscore + 110))
				{
					player stats::function_d40764f3(#"annihilation", 1);
				}
			}
			break;
		}
		case "dem":
		{
			if(player.team == game.defenders && player.team == winner)
			{
				if(loserscore == 0)
				{
					player stats::function_d40764f3(#"shut_out", 1);
				}
			}
			break;
		}
		case "control":
		case "sd":
		case "bounty":
		{
			if(player.team == winner)
			{
				if(loserscore == 0)
				{
					player stats::function_d40764f3(#"crush", 1);
					player stats::function_dad108fa(#"hash_644326620d99cbbb", 1);
				}
			}
			break;
		}
		case "conf":
		{
			if(player.team == winner)
			{
				if(winnerscore >= (loserscore + 25))
				{
					player stats::function_d40764f3(#"crush", 1);
				}
			}
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_ea966b4a
	Namespace: challenges
	Checksum: 0x7B500398
	Offset: 0xA2A8
	Size: 0x4BC
	Parameters: 2
	Flags: Linked
*/
function function_ea966b4a(killstreak, var_18db7a57)
{
	if(!isdefined(killstreak) || !isdefined(self) || !isplayer(self))
	{
		return;
	}
	self stats::function_dad108fa(#"hash_2d62481543a7209", 1);
	self stats::function_dad108fa(#"hash_139b997bc49d4b16", 1);
	if(self.var_311d1335 !== 1 && self stats::get_stat_global(#"hash_2d62481543a7209") >= 50)
	{
		self giveachievement(#"hash_4ab5f04a4e88fd55");
		self.var_311d1335 = 1;
	}
	self stats::function_dad108fa(#"hash_4693318a66e8a0b7", 1);
	self stats::function_dad108fa(#"hash_15fb183dc7fd005f", 1);
	self stats::function_dad108fa(#"hash_1d73823f33cb13ff", 1);
	playercontrolled = 0;
	switch(killstreak)
	{
		case "inventory_planemortar":
		case "napalm_strike":
		case "hash_67f88dbc909e85f8":
		case "planemortar":
		{
			var_6616c2ea = 1;
		}
		playercontrolled = 1;
		self stats::function_dad108fa(#"air_assault_total_kills", 1);
		self contracts::player_contract_event(#"air_assault_total_kills");
		break;
		case "recon_car":
		case "inventory_recon_car":
		{
			playercontrolled = 1;
		}
		self stats::function_dad108fa(#"hash_10b0c56ae630070d", 1);
		self contracts::player_contract_event(#"hash_10b0c56ae630070d");
		break;
	}
	if(playercontrolled && var_18db7a57 === 4)
	{
		self stats::function_dad108fa(#"hash_6400ff0ff3d29c3e", 1);
	}
	if(var_6616c2ea === 1)
	{
		self stats::function_dad108fa(#"hash_6e9e59a789ec1e80", 1);
	}
	if(var_18db7a57 === 2)
	{
		self stats::function_dad108fa(#"hash_46d214ee909c2c6a", 1);
	}
}

/*
	Name: function_2f462ffd
	Namespace: challenges
	Checksum: 0xA579B442
	Offset: 0xA770
	Size: 0x6FC
	Parameters: 4
	Flags: None
*/
function function_2f462ffd(victim, weapon, inflictor, objective)
{
	if(!isdefined(objective))
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	if(!isplayer(inflictor))
	{
		return;
	}
	if(!isdefined(self.team))
	{
		return;
	}
	if(!isdefined(inflictor.team))
	{
		return;
	}
	if(level.teambased)
	{
		if(self.team == inflictor.team)
		{
			return;
		}
	}
	else if(self == inflictor)
	{
		return;
	}
	killstreak = killstreaks::get_from_weapon(objective);
	if(isdefined(killstreak))
	{
		switch(killstreak)
		{
			case "dart":
			case "remote_missile":
			case "inventory_planemortar":
			case "drone_squadron":
			case "inventory_drone_squadron":
			case "overwatch_helicopter":
			case "inventory_dart":
			case "inventory_straferun":
			case "inventory_ac130":
			case "inventory_remote_missile":
			case "straferun":
			case "ac130":
			case "helicopter_comlink":
			case "planemortar":
			case "inventory_overwatch_helicopter":
			case "inventory_helicopter_comlink":
			{
				self stats::function_dad108fa(#"hash_55a5fc51678a4dde", 1);
				break;
			}
			case "recon_car":
			case "inventory_recon_car":
			{
				self stats::function_dad108fa(#"hash_7daf653f5e86b75", 1);
			}
			case "ultimate_turret":
			case "inventory_ultimate_turret":
			case "tank_robot":
			case "swat_team":
			case "inventory_tank_robot":
			case "inventory_swat_team":
			{
				self stats::function_dad108fa(#"hash_1efa6ab922134e1d", 1);
				break;
			}
		}
	}
	else
	{
		if(level.hardcoremode)
		{
			self stats::function_dad108fa(#"hash_753f02ea48b19cd", 1);
		}
		else if(!level.arenamatch)
		{
			self stats::function_dad108fa(#"hash_45fca5cee12d8bdb", 1);
		}
		self stats::function_dad108fa(#"objective_ekia", 1);
		self contracts::player_contract_event(#"objective_ekia");
		scoreevents = globallogic_score::function_3cbc4c6c(objective.var_2e4a8800);
		var_8a4cfbd = objective.var_76ce72e8 && isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1;
		if(var_8a4cfbd)
		{
			self stats::function_dad108fa(#"hash_d4a989a2da3fa72", 1);
		}
		else if(objective.issignatureweapon)
		{
			self stats::function_dad108fa(#"hash_6c3172682467122", 1);
		}
		if(isdefined(inflictor.var_ea1458aa))
		{
			var_d72bd991 = inflictor.var_ea1458aa.attackerdamage[self.clientid];
			gear = self function_b958b70d(var_d72bd991.class_num, "tacticalgear");
			if(gear == #"gear_medicalinjectiongun")
			{
				if(var_d72bd991.var_46a82df0 === 1)
				{
					self stats::function_dad108fa(#"hash_47c5c8af0f105c71", 1);
				}
			}
			else if(gear == #"gear_equipmentcharge")
			{
				if(var_8a4cfbd)
				{
					if(!isdefined(self.var_9cd2c51d.var_17ff6e52))
					{
						self.var_9cd2c51d.var_17ff6e52 = 0;
					}
					self.var_9cd2c51d.var_17ff6e52++;
					if(self.var_9cd2c51d.var_17ff6e52 == 5)
					{
						self stats::function_dad108fa(#"hash_386525eb8f4537c2", 1);
					}
				}
			}
		}
		if(isdefined(inflictor.lastconcussedby) && inflictor.lastconcussedby == self && isdefined(inflictor.var_121392a1))
		{
			if(isdefined(inflictor.var_121392a1[#"hash_1527a22d8a6fdc21"]) && inflictor.var_121392a1[#"hash_1527a22d8a6fdc21"].endtime > gettime())
			{
				if(self util::is_item_purchased(#"eq_slow_grenade"))
				{
					self stats::function_dad108fa(#"hash_1a02c128bae3a6a0", 1);
				}
			}
		}
	}
	victimweapon = inflictor.currentweapon;
	var_2cf35051 = globallogic_score::function_3cbc4c6c(victimweapon.var_2e4a8800);
	if(victimweapon.issignatureweapon === 1 || (isdefined(var_2cf35051) && var_2cf35051.var_fcd2ff3a === 1))
	{
		self stats::function_dad108fa(#"end_enemy_specialist_weapon_on_objective", 1);
	}
}

/*
	Name: function_82bb78f7
	Namespace: challenges
	Checksum: 0x33934A10
	Offset: 0xAE78
	Size: 0x126
	Parameters: 2
	Flags: None
*/
function function_82bb78f7(weapon, victim)
{
	if(!isdefined(self) || !isplayer(self) || !isdefined(weapon) || isdefined(killstreaks::get_from_weapon(weapon)))
	{
		return;
	}
	if(isdefined(victim.var_1318544a))
	{
		victim.var_1318544a.var_60cb0c39 = 1;
	}
	self activecamo::function_896ac347(weapon, #"vanguard", 1);
	if(isdefined(self.var_aef7ad9) && (self.var_aef7ad9 + (int(5 * 1000))) >= gettime())
	{
		self activecamo::function_896ac347(weapon, #"rapid_vanguard", 1);
	}
	self.var_aef7ad9 = gettime();
}

/*
	Name: function_e0f51b6f
	Namespace: challenges
	Checksum: 0x4B3FFA11
	Offset: 0xAFA8
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_e0f51b6f(weapon)
{
	should_award = 0;
	if(weapon.issignatureweapon)
	{
		should_award = 1;
	}
	else
	{
		scoreevents = globallogic_score::function_3cbc4c6c(weapon.var_2e4a8800);
		should_award = weapon.var_76ce72e8 && isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1;
	}
	if(should_award)
	{
		self stats::function_dad108fa(#"hash_7dfdf288a8fccdb0", 1);
	}
}

/*
	Name: function_57ca42c6
	Namespace: challenges
	Checksum: 0x9BB53FCF
	Offset: 0xB060
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_57ca42c6(weapon)
{
	should_award = 0;
	if(weapon.issignatureweapon)
	{
		should_award = 1;
	}
	else
	{
		scoreevents = globallogic_score::function_3cbc4c6c(weapon.var_2e4a8800);
		should_award = weapon.var_76ce72e8 && isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1;
	}
	if(should_award)
	{
		self stats::function_dad108fa(#"hash_7ddba69a0de126e5", 1);
	}
}

/*
	Name: killedbaseoffender
	Namespace: challenges
	Checksum: 0x62ACA5DB
	Offset: 0xB118
	Size: 0x4CE
	Parameters: 3
	Flags: None
*/
function killedbaseoffender(objective, weapon, inflictor)
{
	self endon(#"disconnect");
	self stats::function_bb7eedf0(#"defends", 1);
	self.challenge_offenderkillcount++;
	if(isdefined(self.var_ea1458aa) && isdefined(objective))
	{
		if(!isdefined(self.var_ea1458aa.challenge_objectiveoffensive) || !self.var_ea1458aa.challenge_objectiveoffensive === objective)
		{
			self.var_ea1458aa.challenge_objectiveoffensivekillcount = 0;
		}
		self.var_ea1458aa.challenge_objectiveoffensivekillcount++;
		self.var_ea1458aa.challenge_objectiveoffensive = objective;
		if(self.var_ea1458aa.challenge_objectiveoffensivekillcount > 4)
		{
			self stats::function_dad108fa(#"multikill_5_attackers", 1);
			self.var_ea1458aa.challenge_objectiveoffensivekillcount = 0;
		}
	}
	killstreak = killstreaks::get_from_weapon(weapon);
	if(isdefined(killstreak))
	{
		switch(killstreak)
		{
			case "remote_missile":
			case "inventory_planemortar":
			case "inventory_straferun":
			case "inventory_remote_missile":
			case "straferun":
			case "planemortar":
			{
				self.challenge_offenderprojectilemultikillcount++;
				break;
			}
			case "helicopter_comlink":
			case "inventory_helicopter_comlink":
			{
				self.challenge_offendercomlinkkillcount++;
				break;
			}
			case "combat_robot":
			case "inventory_combat_robot":
			{
				self stats::function_dad108fa(#"kill_attacker_with_robot_or_tank", 1);
				break;
			}
			case "autoturret":
			case "inventory_autoturret":
			{
				self.challenge_offendersentryturretkillcount++;
				self stats::function_dad108fa(#"kill_attacker_with_robot_or_tank", 1);
				break;
			}
			case "swat_team":
			case "inventory_swat_team":
			{
				self stats::function_dad108fa(#"hash_103a235d7563069c", 1);
				break;
			}
			case "ultimate_turret":
			case "inventory_ultimate_turret":
			{
				self stats::function_dad108fa(#"hash_103a235d7563069c", 1);
				if(isdefined(inflictor))
				{
					if(!isdefined(inflictor.var_d6489fb6))
					{
						inflictor.var_d6489fb6 = 0;
					}
					inflictor.var_d6489fb6++;
					if(inflictor.var_d6489fb6 == 3)
					{
						self stats::function_dad108fa(#"hash_1379d16cee958f3e", 1);
					}
				}
				break;
			}
		}
	}
	if(self.challenge_offendercomlinkkillcount == 2)
	{
		self stats::function_dad108fa(#"kill_2_attackers_with_comlink", 1);
	}
	if(self.challenge_offendersentryturretkillcount > 2)
	{
		self stats::function_dad108fa(#"multikill_3_attackers_ai_tank", 1);
		self.challenge_offendersentryturretkillcount = 0;
	}
	self contracts::player_contract_event(#"offender_kill");
	self waittilltimeoutordeath(4);
	if(self.challenge_offenderkillcount > 1)
	{
		self stats::function_dad108fa(#"hash_4b3049ba027dd495", 1);
	}
	self.challenge_offenderkillcount = 0;
	if(self.challenge_offenderprojectilemultikillcount >= 2)
	{
		self stats::function_dad108fa(#"multikill_2_objective_scorestreak_projectile", 1);
	}
	self.challenge_offenderprojectilemultikillcount = 0;
}

/*
	Name: killedbasedefender
	Namespace: challenges
	Checksum: 0xF1DE3AAF
	Offset: 0xB5F0
	Size: 0x10E
	Parameters: 1
	Flags: None
*/
function killedbasedefender(objective)
{
	self endon(#"disconnect");
	self stats::function_bb7eedf0(#"offends", 1);
	if(!isdefined(self.challenge_objectivedefensive) || self.challenge_objectivedefensive !== objective)
	{
		self.challenge_objectivedefensivekillcount = 0;
	}
	self.challenge_objectivedefensivekillcount++;
	self.challenge_objectivedefensive = objective;
	self.challenge_defenderkillcount++;
	self contracts::player_contract_event(#"defender_kill");
	self waittilltimeoutordeath(4);
	if(self.challenge_defenderkillcount > 1)
	{
		self stats::function_dad108fa(#"hash_4b3049ba027dd495", 1);
	}
	self.challenge_defenderkillcount = 0;
}

/*
	Name: waittilltimeoutordeath
	Namespace: challenges
	Checksum: 0x532FF0DE
	Offset: 0xB708
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function waittilltimeoutordeath(timeout)
{
	self endon(#"death");
	wait(timeout);
}

/*
	Name: killstreak_30_noscorestreaks
	Namespace: challenges
	Checksum: 0xD0AD16A3
	Offset: 0xB738
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function killstreak_30_noscorestreaks()
{
	if(level.gametype == "dm" || level.gametype == "dm_hc")
	{
		self stats::function_dad108fa(#"killstreak_30_no_scorestreaks", 1);
	}
}

/*
	Name: calledincomlinkchopper
	Namespace: challenges
	Checksum: 0xFFA39AAB
	Offset: 0xB7A0
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function calledincomlinkchopper()
{
	self.challenge_offendercomlinkkillcount = 0;
}

/*
	Name: combat_robot_damage
	Namespace: challenges
	Checksum: 0x89FE8818
	Offset: 0xB7B8
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function combat_robot_damage(eattacker, combatrobotowner)
{
	if(!isdefined(eattacker.challenge_combatrobotattackclientid[combatrobotowner.clientid]))
	{
		eattacker.challenge_combatrobotattackclientid[combatrobotowner.clientid] = spawnstruct();
	}
}

/*
	Name: trackkillstreaksupportkills
	Namespace: challenges
	Checksum: 0x17FE3829
	Offset: 0xB818
	Size: 0x1F4
	Parameters: 1
	Flags: Linked
*/
function trackkillstreaksupportkills(victim)
{
	if(isdefined(level.activeplayeruavs[self.entnum]) && level.activeplayeruavs[self.entnum] > 0 && (!isdefined(level.forceradar) || level.forceradar == 0))
	{
		self stats::function_e24eec31(getweapon(#"uav"), #"kills_while_active", 1);
	}
	if(isdefined(level.activeplayersatellites) && level.activeplayersatellites[self.entnum] > 0)
	{
		self stats::function_e24eec31(getweapon(#"satellite"), #"kills_while_active", 1);
	}
	if(isdefined(level.activeplayercounteruavs[self.entnum]) && level.activeplayercounteruavs[self.entnum] > 0)
	{
		self stats::function_e24eec31(getweapon(#"counteruav"), #"kills_while_active", 1);
	}
	if(isdefined(victim.lastmicrowavedby) && victim.lastmicrowavedby == self)
	{
		self stats::function_e24eec31(getweapon(#"microwave_turret"), #"kills_while_active", 1);
	}
}

/*
	Name: function_b4174270
	Namespace: challenges
	Checksum: 0x1AFCA83D
	Offset: 0xBA18
	Size: 0xAA
	Parameters: 1
	Flags: Event
*/
event function_b4174270(eventstruct)
{
	if(level.var_e7c95d09 === 1)
	{
		return;
	}
	currentweapon = eventstruct.weapon;
	if(currentweapon == level.weaponnone)
	{
		return;
	}
	time = gettime();
	self.lastreloadtime = time;
	if(isdefined(self.var_ea1458aa))
	{
		self.var_ea1458aa.var_23f5861b = undefined;
	}
	if(weaponhasattachment(currentweapon, "fastreload"))
	{
		self.lastfastreloadtime = time;
	}
}

/*
	Name: longdistancekillmp
	Namespace: challenges
	Checksum: 0x5169FAA8
	Offset: 0xBAD0
	Size: 0x204
	Parameters: 2
	Flags: Linked
*/
function longdistancekillmp(weapon, meansofdeath)
{
	self stats::function_e24eec31(meansofdeath, #"longshot_kill", 1);
	self stats::function_dad108fa(#"hash_6735e4eb7d54b9f4", 1);
	self stats::function_dad108fa(#"hash_191b00b02f6c4144", 1);
	if(isdefined(meansofdeath.attachments) && meansofdeath.attachments.size > 1)
	{
		if(self weaponhasattachmentandunlocked(meansofdeath, "barrel", "suppressed"))
		{
			if(self getweaponoptic(meansofdeath) != "")
			{
				self stats::function_dad108fa(#"long_shot_longbarrel_suppressor_optic", 1);
			}
		}
	}
	weaponclass = util::getweaponclass(meansofdeath);
	if(weaponclass === #"weapon_sniper")
	{
		if(!isdefined(self.pers[#"hash_34fa8e9b0799c487"]))
		{
			self.pers[#"hash_34fa8e9b0799c487"] = 0;
		}
		self.pers[#"hash_34fa8e9b0799c487"]++;
		if(self.pers[#"hash_34fa8e9b0799c487"] == 2)
		{
			self stats::function_d0de7686(#"hash_4733deea0d442bf1", 1, #"hash_699bb6cd0eb6fe01");
		}
	}
}

/*
	Name: function_ffdecc69
	Namespace: challenges
	Checksum: 0xC3E3793D
	Offset: 0xBCE0
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_ffdecc69(attacker, weapon)
{
	attacker stats::function_e24eec31(weapon, #"point_blank_kill", 1);
	attacker stats::function_dad108fa(#"hash_396f347b1d4c7db7", 1);
	attacker stats::function_dad108fa(#"hash_534a88a25d5f0737", 1);
	attacker contracts::increment_contract(#"hash_f9e1c9ceb2539ca");
	weaponclass = util::getweaponclass(weapon);
	if(weaponclass === #"weapon_cqb")
	{
		attacker stats::function_dad108fa(#"hash_1b44d2efdcfc12b1", 1);
	}
}

/*
	Name: processspecialistchallenge
	Namespace: challenges
	Checksum: 0x1340F04E
	Offset: 0xBDF8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function processspecialistchallenge(statname)
{
	self addspecialiststat(statname, 1);
}

/*
	Name: flakjacketprotectedmp
	Namespace: challenges
	Checksum: 0x2EF7CD80
	Offset: 0xBE30
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function flakjacketprotectedmp()
{
	self endon(#"death");
	level endon(#"game_ended");
	self notify("3828c268adb3fae8");
	self endon("3828c268adb3fae8");
	if(!self function_6c32d092(#"talent_flakjacket"))
	{
		return;
	}
	wait(2);
	self stats::function_dad108fa(#"survive_with_flak", 1);
}

/*
	Name: function_7ec2f2c
	Namespace: challenges
	Checksum: 0x5D9313AC
	Offset: 0xBED0
	Size: 0x42
	Parameters: 2
	Flags: Linked, Private
*/
function private function_7ec2f2c(slot_index, killed)
{
	slot = self loadout::get_loadout_slot(slot_index);
	slot.killed = killed;
}

/*
	Name: function_861fe993
	Namespace: challenges
	Checksum: 0x3746157C
	Offset: 0xBF20
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private function_861fe993(slot_index)
{
	slot = self loadout::get_loadout_slot(slot_index);
	return slot.killed;
}

/*
	Name: function_3ee91387
	Namespace: challenges
	Checksum: 0xAB41962D
	Offset: 0xBF60
	Size: 0x64
	Parameters: 4
	Flags: Linked
*/
function function_3ee91387(weapon, playercontrolled, groundbased, countaskillstreakvehicle)
{
	if(isdefined(level.hintobjectivehint_updat))
	{
		self [[level.hintobjectivehint_updat]](groundbased);
	}
	if(countaskillstreakvehicle)
	{
		self function_6c21a4de(groundbased);
	}
}

/*
	Name: function_19e8b086
	Namespace: challenges
	Checksum: 0x973E8733
	Offset: 0xBFD0
	Size: 0x34
	Parameters: 3
	Flags: Linked
*/
function function_19e8b086(killcount, weapon, var_2e4a8800)
{
	self function_90aad780(weapon, var_2e4a8800);
}

/*
	Name: function_90aad780
	Namespace: challenges
	Checksum: 0xB7DA930D
	Offset: 0xC010
	Size: 0x7C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_90aad780(killcount, weapon)
{
	baseweapon = getweapon(weapon.statname);
	if(baseweapon.var_76ce72e8 && weapon.offhandslot == "Lethal grenade")
	{
		self stats::function_dad108fa(#"hash_43f515139ba38c55", 1);
	}
}

/*
	Name: vehiclekilled
	Namespace: challenges
	Checksum: 0x574C5927
	Offset: 0xC098
	Size: 0x4EC
	Parameters: 6
	Flags: Linked
*/
function vehiclekilled(inflictor, attacker, damage, mod, weapon, hitloc)
{
	if(!is_true(self.var_46439e18))
	{
		return;
	}
	if(!isdefined(weapon))
	{
		weapon = level.weaponnone;
	}
	attacker endon(#"disconnect");
	data = spawnstruct();
	data.vehicle = self;
	data.vehicleteam = self.team;
	data.var_43f2e2ad = self getvehoccupants().size;
	data.var_528b83c2 = self.var_38800c0;
	data.inflictor = inflictor;
	data.damage = damage;
	data.mod = mod;
	data.weapon = weapon;
	data.hitloc = hitloc;
	data.time = gettime();
	data.var_c8757561 = 0;
	if(isplayer(attacker))
	{
		data.attackerwasunderwater = attacker isplayerunderwater();
		data.var_8e1828ea = attacker isparachuting();
		data.var_5ffb0b0d = attacker isinfreefall();
	}
	if(!isplayer(attacker) && isarray(self.attackers))
	{
		lastdamagetime = -1;
		foreach(var_2338ad61 in self.attackers)
		{
			if(isdefined(var_2338ad61.clientid) && isdefined(self.attackerdamage[var_2338ad61.clientid]))
			{
				var_b8b7b6cf = self.attackerdamage[var_2338ad61.clientid].lastdamagetime;
				if(var_b8b7b6cf > lastdamagetime)
				{
					lastdamagetime = var_b8b7b6cf;
					lastattacker = var_2338ad61;
				}
			}
		}
		if(isdefined(lastattacker) && (lastdamagetime + 2000) >= data.time)
		{
			attacker = lastattacker;
		}
	}
	data.attacker = attacker;
	if(isplayer(attacker))
	{
		data.isenemyvehicle = isdefined(self.team) && self.team != #"neutral" && self.team !== attacker.team;
		data.var_da46f58a = isdefined(self.var_8e382c5f) && (self.var_8e382c5f + 2000) >= data.time && isdefined(self.var_beafde27) && self.var_beafde27 !== attacker.team;
	}
	else
	{
		data.isenemyvehicle = 0;
		data.var_da46f58a = 0;
	}
	for(i = 0; i < 11; i++)
	{
		if(!self function_dcef0ba1(i))
		{
			break;
		}
		var_e082d5c = self seatgetweapon(i);
		if(isdefined(var_e082d5c) && var_e082d5c.var_29d24e37 && !var_e082d5c.var_9a789947)
		{
			data.var_c8757561 = 1;
			break;
		}
	}
	data.var_68c74205 = self.vehicleclass === "4 wheel" || self.vehicleclass === "motorcycle" || self.vehicleclass === "tank";
	data.var_a14dfd03 = isairborne(self);
	function_94d6aade(data);
	data.attacker notify(#"hash_56b121e50d70ac18");
}

/*
	Name: function_94d6aade
	Namespace: challenges
	Checksum: 0x88FA23CE
	Offset: 0xC590
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_94d6aade(data)
{
	if(isdefined(data.attacker))
	{
		data.attacker endon(#"disconnect");
	}
	waitframe(1);
	util::waittillslowprocessallowed();
	level thread dochallengecallback("vehicleKilled", data);
	level thread scoreevents::doscoreeventcallback("vehicleKilled", data);
}

/*
	Name: function_8e9b2d44
	Namespace: challenges
	Checksum: 0x977B43D9
	Offset: 0xC628
	Size: 0x53C
	Parameters: 2
	Flags: Linked
*/
function function_8e9b2d44(data, time)
{
	attacker = time.attacker;
	if(!isplayer(attacker))
	{
		return;
	}
	attackerwasunderwater = time.attackerwasunderwater;
	var_8e1828ea = time.var_8e1828ea;
	var_5ffb0b0d = time.var_5ffb0b0d;
	var_43f2e2ad = time.var_43f2e2ad;
	var_da46f58a = time.var_da46f58a;
	vehicle = time.vehicle;
	vehicleteam = time.vehicleteam;
	isenemyvehicle = time.isenemyvehicle;
	var_68c74205 = time.var_68c74205;
	var_a14dfd03 = time.var_a14dfd03;
	var_528b83c2 = time.var_528b83c2;
	weapon = time.weapon;
	if(isenemyvehicle && var_43f2e2ad || var_da46f58a)
	{
		attacker contracts::player_contract_event(#"hash_2f3b5cfd90466f60", weapon);
		attacker stats::function_dad108fa(#"hash_33d24eb29a631f61", 1);
		if(var_68c74205)
		{
			attacker stats::function_dad108fa(#"hash_160d0dd620800569", 1);
			attacker stats::function_dad108fa(#"hash_18c0785801027269", 1);
		}
		if(weapon.name === #"satchel_charge")
		{
			if(vehicle.scriptvehicletype === "player_tank")
			{
				attacker stats::function_dad108fa(#"hash_252a4cbc963fc617", 1);
			}
			if(attackerwasunderwater === 1)
			{
				attacker stats::function_dad108fa(#"hash_53316bf26e1435bb", 1);
			}
			if(var_68c74205)
			{
				attacker stats::function_dad108fa(#"hash_7659bc4836c71dee", 1);
			}
		}
		else if(weapon.name === #"land_mine")
		{
			if(var_68c74205)
			{
				attacker stats::function_dad108fa(#"hash_68f56bb01d2ea427", 1);
			}
		}
		if(!isdefined(vehicle.killstreak_id))
		{
			attacker stats::function_e24eec31(weapon, #"destroy_any", 1);
			attacker stats::function_e24eec31(weapon, #"hash_497df827743010c3", 1);
			attacker stats::function_e24eec31(weapon, #"hash_67536f932f6aeb36", 1);
			attacker function_38ad2427(#"hash_450f99ce50083544", 1);
			attacker stats::function_dad108fa(#"hash_5d209f828d9bbd96", 1);
			attacker stats::function_dad108fa(#"hash_55becb3a18f3c612", 1);
			if(var_528b83c2 === 0)
			{
				attacker stats::function_e24eec31(weapon, #"destroy_vehicle_air", 1);
			}
			else
			{
				attacker stats::function_e24eec31(weapon, #"destroy_vehicle_ground", 1);
			}
			if(var_a14dfd03 === 1)
			{
				attacker stats::function_dad108fa(#"hash_7dab2161d3681f85", 1);
				weaponclass = util::getweaponclass(weapon);
				if(isdefined(weaponclass))
				{
					weaponclass = (isstring(weaponclass) ? hash(weaponclass) : weaponclass);
					if(weaponclass == #"weapon_launcher")
					{
						attacker stats::function_dad108fa(#"hash_32a02036b210e14d", 1);
					}
				}
			}
			attacker function_6c21a4de(weapon);
		}
	}
}

/*
	Name: function_6c21a4de
	Namespace: challenges
	Checksum: 0x80566F10
	Offset: 0xCB70
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_6c21a4de(weapon)
{
	if(!isdefined(self.pers[#"hash_47e7ebe61b42a76e"]))
	{
		self.pers[#"hash_47e7ebe61b42a76e"] = 0;
	}
	self.pers[#"hash_47e7ebe61b42a76e"]++;
	if((self.pers[#"hash_47e7ebe61b42a76e"] % 3) == 0)
	{
		self stats::function_e24eec31(weapon, #"hash_44ee37a6f2b220c9", 1);
	}
}

/*
	Name: function_88235aee
	Namespace: challenges
	Checksum: 0x7F962B4C
	Offset: 0xCC28
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_88235aee(victim, attacker)
{
	if(!isdefined(victim.squad))
	{
		return;
	}
	if(!isdefined(attacker.var_ee07421b[victim.squad]))
	{
		attacker.var_ee07421b[victim.squad] = 0;
	}
	if(attacker.var_ee07421b[victim.squad] >= 2 && function_a1cff525(victim.squad).size == 0)
	{
		attacker stats::function_dad108fa(#"hash_18cc315440f11102", 1);
		attacker.var_ee07421b[victim.squad] = -100;
	}
}

/*
	Name: function_7007692f
	Namespace: challenges
	Checksum: 0xC6085329
	Offset: 0xCD08
	Size: 0x8C
	Parameters: 3
	Flags: Linked
*/
function function_7007692f(attacker, victim, killstreak_weapon)
{
	if(victim util::isenemyplayer(attacker) && (isdefined(victim.var_8e94d71c[killstreak_weapon]) ? victim.var_8e94d71c[killstreak_weapon] : 0) == 0)
	{
		attacker stats::function_dad108fa(#"hash_760e917a4024491a", 1);
	}
}

/*
	Name: function_3f57a5b
	Namespace: challenges
	Checksum: 0xA396AF17
	Offset: 0xCDA0
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_3f57a5b(attacker, weapon)
{
	weaponclass = util::getweaponclass(weapon);
	if(isdefined(weaponclass))
	{
		weaponclass = (isstring(weaponclass) ? hash(weaponclass) : weaponclass);
		if(weaponclass == #"weapon_sniper")
		{
			attacker stats::function_dad108fa(#"hash_59b75115ee254217", 1);
		}
	}
}

/*
	Name: function_b15a1e1e
	Namespace: challenges
	Checksum: 0x4575178D
	Offset: 0xCE60
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b15a1e1e(eventstruct)
{
	self function_d43316bd(#"hash_354a96dc1d24e7a3", eventstruct);
	self function_4e40694d(#"hash_354a96dc1d24e7a3", eventstruct);
}

/*
	Name: function_8c48d8ff
	Namespace: challenges
	Checksum: 0x47B3A084
	Offset: 0xCEB8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8c48d8ff(eventstruct)
{
	self function_4e40694d(#"hash_354a96dc1d24e7a3", eventstruct);
}

/*
	Name: function_486d4ce3
	Namespace: challenges
	Checksum: 0xCC0AAE04
	Offset: 0xCEF0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_486d4ce3(eventstruct)
{
	self function_4e40694d(#"hash_354a96dc1d24e7a3", eventstruct);
}

/*
	Name: function_80327323
	Namespace: challenges
	Checksum: 0x48227FA0
	Offset: 0xCF28
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private function_80327323(data)
{
	player = self;
	attackerstance = data.attackerstance;
	if(isdefined(attackerstance))
	{
		if(attackerstance == #"crouch")
		{
			player stats::function_dad108fa(#"kill_enemy_while_crouched", 1);
			player stats::function_dad108fa(#"hash_529cb0a2c0619c09", 1);
		}
		else if(attackerstance == #"prone")
		{
			player stats::function_dad108fa(#"kill_enemy_while_prone", 1);
			player stats::function_dad108fa(#"hash_529cb0a2c0619c09", 1);
		}
	}
}

/*
	Name: killstreak_started
	Namespace: challenges
	Checksum: 0x72DC9B30
	Offset: 0xD038
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private killstreak_started(params)
{
	if(!isplayer(self))
	{
		return;
	}
	if(params.hardpointtype !== #"planemortar")
	{
		self stats::function_dad108fa(#"call_in_killstreak_for_operator_mission", 1);
	}
}

/*
	Name: function_5af500d9
	Namespace: challenges
	Checksum: 0x1E87213E
	Offset: 0xD0B0
	Size: 0x98
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5af500d9(killstreak_weapon)
{
	if(!isplayer(self))
	{
		return;
	}
	if(!isdefined(killstreak_weapon))
	{
		return;
	}
	if(!isdefined(self.var_e52625f))
	{
		self.var_e52625f = [];
	}
	if(isdefined(self.var_e52625f[killstreak_weapon]))
	{
		return;
	}
	self stats::function_dad108fa("call_in_killstreak_for_operator_mission", 1);
	self.var_e52625f[killstreak_weapon] = 1;
}

/*
	Name: function_23320f51
	Namespace: challenges
	Checksum: 0x69D007CF
	Offset: 0xD150
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_23320f51(killstreak_weapon)
{
	if(isdefined(self.var_e52625f[killstreak_weapon]))
	{
		self.var_e52625f[killstreak_weapon] = undefined;
	}
}

/*
	Name: function_e7e09ca1
	Namespace: challenges
	Checksum: 0xC8C8FA85
	Offset: 0xD188
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e7e09ca1(params)
{
	if(!isplayer(self))
	{
		return;
	}
	if(self.just_given_new_inventory_killstreak === 1)
	{
		self stats::function_dad108fa(#"hash_e46234e26adf731", 1);
	}
}

