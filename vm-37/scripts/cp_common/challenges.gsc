#using script_32399001bdb550da;
#using script_267e1d16ae28392b;
#using scripts\cp_common\util.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace challenges;

/*
	Name: __init__system__
	Namespace: challenges
	Checksum: 0xA440E7F0
	Offset: 0x180
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
	Checksum: 0x95B61D47
	Offset: 0x1C8
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared();
	callback::on_start_gametype(&start_gametype);
	level.challenges_callback_vehicledamaged = &vehicledamaged;
	level.challenges_callback_vehiclekilled = &vehiclekilled;
}

/*
	Name: start_gametype
	Namespace: challenges
	Checksum: 0xE4ACE8DD
	Offset: 0x238
	Size: 0x114
	Parameters: 0
	Flags: None
*/
function start_gametype()
{
	if(!isdefined(level.challengescallbacks))
	{
		level.challengescallbacks = [];
	}
	waittillframeend();
	if(canprocesschallenges())
	{
		registerchallengescallback("actorKilled", &challengeactorkills);
		registerchallengescallback("actorDamaged", &function_f5b31539);
		registerchallengescallback("VehicleKilled", &function_8e9b2d44);
		registerchallengescallback("VehicleDamaged", &function_b7b0cce0);
	}
	callback::on_connect(&on_player_connect);
	callback::on_connect(&function_706ec529);
}

/*
	Name: function_8e9b2d44
	Namespace: challenges
	Checksum: 0x113EBAF3
	Offset: 0x358
	Size: 0x2C
	Parameters: 2
	Flags: None
*/
function function_8e9b2d44(data, time)
{
	challengeactorkills(data, time);
}

/*
	Name: function_b7b0cce0
	Namespace: challenges
	Checksum: 0xD87304EE
	Offset: 0x390
	Size: 0x2C
	Parameters: 2
	Flags: None
*/
function function_b7b0cce0(data, time)
{
	function_f5b31539(data, time);
}

/*
	Name: function_f5b31539
	Namespace: challenges
	Checksum: 0xA878D9A8
	Offset: 0x3C8
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function function_f5b31539(data, time)
{
}

/*
	Name: challengeactorkills
	Namespace: challenges
	Checksum: 0x8F37AF3A
	Offset: 0x3E8
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function challengeactorkills(data, time)
{
	player = getplayers()[0];
	if(is_true(time.var_2a0adc57))
	{
		player thread function_fc664fc6("cp_proficient_bodyshield", 2);
	}
}

/*
	Name: function_fc664fc6
	Namespace: challenges
	Checksum: 0x49AB9686
	Offset: 0x468
	Size: 0x196
	Parameters: 4
	Flags: None
*/
function function_fc664fc6(challengestat, var_2c59fe94, var_21bccb49, var_cab0fdf5)
{
	if(!isdefined(var_21bccb49))
	{
		var_21bccb49 = 1;
	}
	if(!isdefined(var_cab0fdf5))
	{
		var_cab0fdf5 = 1;
	}
	self notify("ad020554bcde477");
	self endon("ad020554bcde477");
	/#
		assert(isplayer(self));
	#/
	self endon(#"death");
	if(!isdefined(self.var_75b0a52c))
	{
		self.var_75b0a52c = [];
	}
	if(!isdefined(self.var_75b0a52c[challengestat]))
	{
		self.var_75b0a52c[challengestat] = 0;
	}
	self.var_75b0a52c[challengestat] = self.var_75b0a52c[challengestat] + var_21bccb49;
	for(i = 0; i < var_2c59fe94; i++)
	{
		waitframe(2);
	}
	if((isdefined(self.var_75b0a52c[challengestat]) ? self.var_75b0a52c[challengestat] : 0) >= var_2c59fe94)
	{
		self stats::function_dad108fa(challengestat, var_cab0fdf5);
	}
	self.var_75b0a52c[challengestat] = undefined;
	if(self.var_75b0a52c.size == 0)
	{
		self.var_75b0a52c = undefined;
	}
}

/*
	Name: actorkilled
	Namespace: challenges
	Checksum: 0xA1CF9E03
	Offset: 0x608
	Size: 0x144
	Parameters: 6
	Flags: None
*/
function actorkilled(einflictor, attacker, idamage, smeansofdeath, weapon, shitloc)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponnone;
	}
	attacker endon(#"disconnect");
	data = spawnstruct();
	data.victim = self;
	data.einflictor = einflictor;
	data.attacker = attacker;
	data.idamage = idamage;
	data.smeansofdeath = smeansofdeath;
	data.weapon = weapon;
	data.shitloc = shitloc;
	data.time = gettime();
	data.victimweapon = data.victim.currentweapon;
	if(einflictor === attacker.body_shield_grenade)
	{
		data.var_2a0adc57 = 1;
	}
	waitandprocessactorkilledcallback(data);
	data.attacker notify(#"actorkilledchallengesprocessed");
}

/*
	Name: waitandprocessactorkilledcallback
	Namespace: challenges
	Checksum: 0x2C1EA78A
	Offset: 0x758
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function waitandprocessactorkilledcallback(data)
{
	if(isdefined(data.attacker))
	{
		data.attacker endon(#"disconnect");
	}
	waitframe(1);
	util::waittillslowprocessallowed();
	level thread dochallengecallback("actorKilled", data);
}

/*
	Name: actordamaged
	Namespace: challenges
	Checksum: 0x7463F348
	Offset: 0x7D0
	Size: 0x10C
	Parameters: 5
	Flags: None
*/
function actordamaged(einflictor, attacker, idamage, weapon, shitloc)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponnone;
	}
	attacker endon(#"disconnect");
	data = spawnstruct();
	data.victim = self;
	data.einflictor = einflictor;
	data.attacker = attacker;
	data.idamage = idamage;
	data.weapon = weapon;
	data.shitloc = shitloc;
	data.time = gettime();
	data.victimweapon = data.victim.currentweapon;
	function_5e9d4ad3(data);
	data.attacker notify(#"hash_1c23cf76970db631");
}

/*
	Name: function_5e9d4ad3
	Namespace: challenges
	Checksum: 0x2B20E27
	Offset: 0x8E8
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_5e9d4ad3(data)
{
	if(isdefined(data.attacker))
	{
		data.attacker endon(#"disconnect");
	}
	waitframe(1);
	util::waittillslowprocessallowed();
	level thread dochallengecallback("actorDamaged", data);
}

/*
	Name: vehiclekilled
	Namespace: challenges
	Checksum: 0x2853667C
	Offset: 0x960
	Size: 0x134
	Parameters: 6
	Flags: None
*/
function vehiclekilled(einflictor, attacker, idamage, smeansofdeath, weapon, shitloc)
{
	if(isdefined(level.var_e855c811))
	{
		return;
	}
	if(!isdefined(weapon))
	{
		weapon = level.weaponnone;
	}
	attacker endon(#"disconnect");
	data = spawnstruct();
	data.victim = self;
	data.einflictor = einflictor;
	data.attacker = attacker;
	data.idamage = idamage;
	data.smeansofdeath = smeansofdeath;
	data.weapon = weapon;
	data.shitloc = shitloc;
	data.time = gettime();
	data.victimweapon = data.victim.currentweapon;
	function_94d6aade(data);
	data.attacker notify(#"hash_56b121e50d70ac18");
}

/*
	Name: function_94d6aade
	Namespace: challenges
	Checksum: 0x64DD4F7B
	Offset: 0xAA0
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_94d6aade(data)
{
	if(isdefined(data.attacker))
	{
		data.attacker endon(#"disconnect");
	}
	waitframe(1);
	util::waittillslowprocessallowed();
	level thread dochallengecallback("VehicleKilled", data);
}

/*
	Name: vehicledamaged
	Namespace: challenges
	Checksum: 0x2A33B163
	Offset: 0xB18
	Size: 0x10C
	Parameters: 5
	Flags: None
*/
function vehicledamaged(einflictor, attacker, idamage, weapon, shitloc)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponnone;
	}
	attacker endon(#"disconnect");
	data = spawnstruct();
	data.victim = self;
	data.einflictor = einflictor;
	data.attacker = attacker;
	data.idamage = idamage;
	data.weapon = weapon;
	data.shitloc = shitloc;
	data.time = gettime();
	data.victimweapon = data.victim.currentweapon;
	function_2de75dbd(data);
	data.attacker notify(#"hash_324a232de36f6e68");
}

/*
	Name: function_2de75dbd
	Namespace: challenges
	Checksum: 0xED599D14
	Offset: 0xC30
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_2de75dbd(data)
{
	if(isdefined(data.attacker))
	{
		data.attacker endon(#"disconnect");
	}
	waitframe(1);
	level thread dochallengecallback("VehicleDamaged", data);
}

/*
	Name: function_f901cb3c
	Namespace: challenges
	Checksum: 0xD8D37409
	Offset: 0xC98
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_f901cb3c()
{
	self thread function_8332bc5e("career_decorations");
}

/*
	Name: function_8332bc5e
	Namespace: challenges
	Checksum: 0xA1FBC73E
	Offset: 0xCC8
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_8332bc5e(statname, n_amount)
{
	if(!isdefined(n_amount))
	{
		n_amount = 1;
	}
	self endon(#"disconnect");
	if(!isplayer(self))
	{
		return;
	}
	self stats::function_dad108fa(statname, n_amount);
}

/*
	Name: function_706ec529
	Namespace: challenges
	Checksum: 0xFFBD6E1E
	Offset: 0xD40
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_706ec529()
{
	self.challenge_callback_cp = &function_7b4387e1;
	/#
		self thread function_ba92458e();
	#/
}

/*
	Name: function_f752d6a9
	Namespace: challenges
	Checksum: 0x50A1BC23
	Offset: 0xD80
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function function_f752d6a9(challenge_index)
{
	return tablelookup(#"hash_34208f5b04921371", 0, challenge_index, 5);
}

/*
	Name: function_7b4387e1
	Namespace: challenges
	Checksum: 0xA52A821C
	Offset: 0xDC0
	Size: 0x634
	Parameters: 7
	Flags: None
*/
function function_7b4387e1(rewardxp, maxval, row, tablenumber, challengetype, itemindex, challengeindex)
{
	self function_18b65152();
	if(challengeindex == 565)
	{
		self givedecoration("cp_medal_all_accolades");
	}
	tier = int(tablelookup(#"hash_34208f5b04921371", 0, challengeindex, 1));
	switch(challengetype)
	{
		case 0:
		{
			challengename = function_f752d6a9(challengeindex);
			switch(challengename)
			{
				case "hash_20faf480b8f9146a":
				{
					break;
				}
				case "hash_381ccf00b363923d":
				{
					self givedecoration("cp_medal_all_calling_cards");
					break;
				}
			}
			break;
		}
		case 1:
		{
			if(itemindex != 0)
			{
				self stats::set_stat(#"itemstats", itemindex, #"challengecompleted", tier, 1);
				self achievements::checkweaponchallengecomplete(tier);
			}
			break;
		}
		case 4:
		{
			var_9327960d = tablelookup(#"hash_34208f5b04921371", 0, challengeindex, 13);
			self stats::set_stat(#"attachments", var_9327960d, #"challengecompleted", tier, 1);
			break;
		}
	}
	/#
		if(getdvarint(#"hash_4cc2d974d4e9d2d6", 0) != 0)
		{
			var_c4e9517b = tablenumber + 1;
			tablename = ((#"gamedata/stats/cp/statsmilestones") + var_c4e9517b) + "";
			var_eb67c133 = tablelookupcolumnforrow(tablename, row, 5);
			if(var_eb67c133 === #"hash_4a80d584aac2e7d0")
			{
				return;
			}
			challengestring = makelocalizedstring(var_eb67c133);
			challengetier = int(tablelookupcolumnforrow(tablename, row, 1));
			matchrecordlogchallengecomplete(self, var_c4e9517b, challengetier, itemindex, var_eb67c133);
			challengetiernext = int(tablelookupcolumnforrow(tablename, row + 1, 1));
			tiertext = challengetier + 1;
			var_33b913f5 = "";
			if(challengetype == 0)
			{
				var_33b913f5 = "";
			}
			else if(challengetype == 1)
			{
				iteminfo = getunlockableiteminfofromindex(itemindex, 1);
				if(isdefined(iteminfo))
				{
					var_33b913f5 = makelocalizedstring(iteminfo.displayname);
				}
			}
			if(issubstr(challengestring, ""))
			{
				if(challengetype == 3)
				{
					challengestring = strreplace(challengestring, "", "" + function_60394171(#"challenge", 3, itemindex));
				}
			}
			if(issubstr(challengestring, ""))
			{
				challengestring = strreplace(challengestring, "", "" + tiertext);
			}
			msg = (((var_33b913f5 + "") + challengestring) + "") + maxval;
			if(getdvarint(#"hash_4cc2d974d4e9d2d6", 0) == 1)
			{
				iprintlnbold(msg);
			}
			else
			{
				if(getdvarint(#"hash_4cc2d974d4e9d2d6", 0) == 2)
				{
					self iprintlnbold(msg);
				}
				else if(getdvarint(#"hash_4cc2d974d4e9d2d6", 0) == 3)
				{
					iprintln(msg);
				}
			}
			println(msg);
		}
	#/
}

/*
	Name: function_18b65152
	Namespace: challenges
	Checksum: 0x61A73CA3
	Offset: 0x1400
	Size: 0x2E4
	Parameters: 0
	Flags: None
*/
function function_18b65152()
{
	if(sessionmodeisonlinegame())
	{
		return;
	}
	var_80b995df = self stats::get_stat(#"playerstatslist", #"hash_1154ba4defc33345", #"statvalue");
	if(var_80b995df > 0)
	{
		var_e1617d73 = tablelookuprowcount(#"hash_34208f5b04921371");
		challenge_data = [];
		for(i = 0; i < var_e1617d73 - 1; i++)
		{
			challenge_data = tablelookuprow(#"hash_34208f5b04921371", i);
			var_2a9d0df5 = challenge_data[3];
			if(var_2a9d0df5 == "global")
			{
				challenge_stat_name = challenge_data[4];
				if(isdefined(challenge_stat_name) && challenge_stat_name != "")
				{
					var_85321896 = self stats::get_stat(#"playerstatslist", challenge_stat_name, #"statvalue");
					if(challenge_data[10] != "")
					{
						var_a15c6663 = int(challenge_data[2]);
						if(var_85321896 >= var_a15c6663)
						{
							var_f220a4fb = "";
							var_f220a4fb = challenge_data[16];
							switch(var_f220a4fb)
							{
								case "missions":
								{
									self stats::function_dad108fa(#"conf_gamemode_mastery", 1);
									break;
								}
								case "hash_2ff4d6ef38b099cc":
								{
									self stats::function_dad108fa(#"hq_gamemode_mastery", 1);
									break;
								}
								case "career":
								{
									self stats::function_dad108fa(#"hash_2a83a140198f2c69", 1);
									break;
								}
							}
						}
					}
				}
			}
		}
		self stats::set_stat(#"playerstatslist", #"hash_1154ba4defc33345", #"statvalue", 0);
	}
}

/*
	Name: function_6d4abfcd
	Namespace: challenges
	Checksum: 0x9D16F297
	Offset: 0x16F0
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_6d4abfcd(n_time)
{
	/#
		self endon(#"disconnect");
		wait(n_time);
		self thread util::screen_message_delete_client();
	#/
}

/*
	Name: function_ba92458e
	Namespace: challenges
	Checksum: 0xF6D6C1CC
	Offset: 0x1738
	Size: 0x80
	Parameters: 0
	Flags: None
*/
function function_ba92458e()
{
	/#
		while(true)
		{
			if(getdvarint(#"scr_complete_all_challenges", 0) == 1)
			{
				self function_1b7d307e();
				setdvar(#"scr_complete_all_challenges", 0);
			}
			wait(0.1);
		}
	#/
}

/*
	Name: function_1b7d307e
	Namespace: challenges
	Checksum: 0xC3110AF4
	Offset: 0x17C0
	Size: 0x348
	Parameters: 0
	Flags: None
*/
function function_1b7d307e()
{
	/#
		var_2418c386 = [];
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		array::add(var_2418c386, "");
		foreach(challenge in var_2418c386)
		{
			self stats::function_dad108fa(challenge, 1000);
			iprintln("" + challenge);
			wait(1);
		}
	#/
}

