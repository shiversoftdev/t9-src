#using script_3f27a7b2232674db;
#using script_47fb62300ac0bd60;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_78f34724;

/*
	Name: function_94727f35
	Namespace: namespace_78f34724
	Checksum: 0x523C9593
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_94727f35()
{
	level notify(515182164);
}

#namespace namespace_9a8d2924;

/*
	Name: function_89f2df9
	Namespace: namespace_9a8d2924
	Checksum: 0x1820431A
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3a7ac32272007c6d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9a8d2924
	Checksum: 0x41F52482
	Offset: 0x100
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	setdvar(#"hash_35dbebb08d656926", 0);
	callback::on_spawned(&function_59d3154f);
}

/*
	Name: function_2ce5cb7e
	Namespace: namespace_9a8d2924
	Checksum: 0xE44B4AA
	Offset: 0x150
	Size: 0x5F2
	Parameters: 0
	Flags: None
*/
function function_2ce5cb7e()
{
	if(!getdvarint(#"hash_35dbebb08d656926", 0) || isdefined(self.pers[#"hash_33112f192fb3c234"]) || isbot(self) || !level.rankedmatch || level.disablestattracking)
	{
		return;
	}
	self.pers[#"hash_33112f192fb3c234"] = [];
	self.pers[#"hash_33112f192fb3c234"][#"base"] = [];
	self.pers[#"hash_33112f192fb3c234"][#"current"] = [];
	var_e800bb6a = getscriptbundlelist("hvolist");
	if(isdefined(var_e800bb6a) && isarray(var_e800bb6a))
	{
		foreach(var_3aa46fc3 in var_e800bb6a)
		{
			var_9a8d2924 = getscriptbundle(var_3aa46fc3);
			if(!isdefined(var_9a8d2924) || !isdefined(var_9a8d2924.var_739c1749) || !isarray(var_9a8d2924.var_739c1749))
			{
				continue;
			}
			if(isdefined(var_9a8d2924.var_46a95923) && var_9a8d2924.var_46a95923 != "none" && var_9a8d2924.var_46a95923 != level.gametype)
			{
				continue;
			}
			foreach(stat in var_9a8d2924.var_739c1749)
			{
				if(!isdefined(stat) || !isdefined(stat.stattype))
				{
					continue;
				}
				if(isdefined(stat.var_82670522) && isdefined(self.pers[#"hash_33112f192fb3c234"][#"base"][stat.var_82670522]) || isdefined(self.pers[#"hash_33112f192fb3c234"][#"base"][stat.stattype]))
				{
					continue;
				}
				switch(stat.stattype)
				{
					case "playerstatslist":
					{
						if(!isdefined(stat.var_82670522))
						{
							break;
						}
						self.pers[#"hash_33112f192fb3c234"][#"base"][stat.var_82670522] = self stats::function_441050ca(stat.var_82670522);
						self.pers[#"hash_33112f192fb3c234"][#"current"][stat.var_82670522] = self stats::function_441050ca(stat.var_82670522);
						break;
					}
					case "razorwireekia":
					{
						razorwireekia = self stats::function_441050ca(#"hash_3d06dfa608b3b520") + self stats::function_441050ca(#"hash_2dc93d1e6de62f4c");
						self.pers[#"hash_33112f192fb3c234"][#"base"][stat.stattype] = razorwireekia;
						self.pers[#"hash_33112f192fb3c234"][#"current"][stat.stattype] = razorwireekia;
						break;
					}
					case "highestkillstreak":
					case "objectivescore":
					case "objectivetime":
					case "damagedone":
					case "highestmultikill":
					case "objectiveekia":
					default:
					{
						self.pers[#"hash_33112f192fb3c234"][#"base"][stat.stattype] = 0;
						self.pers[#"hash_33112f192fb3c234"][#"current"][stat.stattype] = 0;
						break;
					}
				}
			}
		}
	}
}

/*
	Name: function_59d3154f
	Namespace: namespace_9a8d2924
	Checksum: 0x206CCCA1
	Offset: 0x750
	Size: 0x5FC
	Parameters: 0
	Flags: None
*/
function function_59d3154f()
{
	if(!getdvarint(#"hash_35dbebb08d656926", 0) || !(isdefined(self.var_228b6835) ? self.var_228b6835 : 0) || !level.rankedmatch || level.disablestattracking)
	{
		return;
	}
	var_e800bb6a = getscriptbundlelist("hvolist");
	var_aa1fbd8c = self.pers[#"hash_1b145cf9f0673e9"];
	if(!isdefined(var_e800bb6a) || !isarray(var_e800bb6a) || !isdefined(var_aa1fbd8c))
	{
		return;
	}
	if(!isdefined(self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c]))
	{
		self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c] = [];
	}
	var_d6155829 = [];
	foreach(var_3aa46fc3 in var_e800bb6a)
	{
		var_9a8d2924 = getscriptbundle(var_3aa46fc3);
		if(!isdefined(var_9a8d2924) || !isdefined(var_9a8d2924.var_739c1749) || !isarray(var_9a8d2924.var_739c1749))
		{
			continue;
		}
		if(isdefined(var_9a8d2924.var_447510ee) && var_9a8d2924.var_447510ee != var_aa1fbd8c)
		{
			continue;
		}
		if(isdefined(var_9a8d2924.var_46a95923) && var_9a8d2924.var_46a95923 != "none" && var_9a8d2924.var_46a95923 != level.gametype)
		{
			continue;
		}
		foreach(stat in var_9a8d2924.var_739c1749)
		{
			if(!isdefined(stat) || is_true(stat.var_233a23b6) || !isdefined(stat.stattype))
			{
				continue;
			}
			switch(stat.stattype)
			{
				case "playerstatslist":
				{
					if(!isdefined(stat.var_82670522))
					{
						break;
					}
					var_6fda3763 = self function_d0c02a50(stat, var_aa1fbd8c, stat.stattype);
					var_d6155829[stat.var_82670522] = var_6fda3763;
					break;
				}
				case "razorwireekia":
				{
					razorwireekia = self stats::function_441050ca(#"hash_3d06dfa608b3b520") + self stats::function_441050ca(#"hash_2dc93d1e6de62f4c");
					self function_b535c32e(stat, razorwireekia, var_aa1fbd8c);
					var_d6155829[stat.stattype] = razorwireekia;
					break;
				}
				case "objectivescore":
				case "objectivetime":
				case "damagedone":
				case "objectiveekia":
				{
					var_6fda3763 = self function_b535c32e(stat, self.pers[stat.stattype], var_aa1fbd8c);
					var_d6155829[stat.stattype] = var_6fda3763;
					break;
				}
				case "highestkillstreak":
				{
					var_6fda3763 = self.pers[#"cur_kill_streak"] - self.pers[#"hash_33112f192fb3c234"][#"current"][#"highestkillstreak"];
					self function_be94d98b(stat, var_6fda3763, var_aa1fbd8c);
					break;
				}
			}
		}
	}
	var_d6155829[#"highestkillstreak"] = self.pers[#"cur_kill_streak"];
	foreach(stat in var_d6155829)
	{
		self.pers[#"hash_33112f192fb3c234"][#"current"][index] = stat;
	}
}

/*
	Name: function_323c6715
	Namespace: namespace_9a8d2924
	Checksum: 0x10A2734A
	Offset: 0xD58
	Size: 0xC28
	Parameters: 0
	Flags: None
*/
function function_323c6715()
{
	if(!getdvarint(#"hash_35dbebb08d656926", 0) || !level.rankedmatch || level.disablestattracking)
	{
		return;
	}
	var_e800bb6a = getscriptbundlelist("hvolist");
	players = getplayers();
	if(!isdefined(var_e800bb6a) || !isarray(var_e800bb6a) || !isdefined(players) || !isarray(players))
	{
		return;
	}
	level.var_1a0a6769 = [];
	foreach(var_3aa46fc3 in var_e800bb6a)
	{
		var_9a8d2924 = getscriptbundle(var_3aa46fc3);
		if(!isdefined(var_9a8d2924) || !isdefined(var_9a8d2924.var_739c1749) || !isarray(var_9a8d2924.var_739c1749))
		{
			continue;
		}
		if(isdefined(var_9a8d2924.var_46a95923) && var_9a8d2924.var_46a95923 != "none" && var_9a8d2924.var_46a95923 != level.gametype)
		{
			continue;
		}
		foreach(player in players)
		{
			if(!isdefined(player) || isbot(player))
			{
				continue;
			}
			/#
				assert(isdefined(player.pers), "");
			#/
			/#
				assert(isdefined(player.pers[#"hash_33112f192fb3c234"]), "");
			#/
			var_9b4eeccc = function_b14806c6(player player_role::get(), currentsessionmode());
			if(!isdefined(var_9b4eeccc) || (isdefined(var_9a8d2924.var_447510ee) && var_9a8d2924.var_447510ee != var_9b4eeccc) || !isdefined(player.pers) || !isdefined(player.pers[#"hash_33112f192fb3c234"]))
			{
				continue;
			}
			if(!isdefined(player.pers[#"hash_33112f192fb3c234"][var_9b4eeccc]))
			{
				player.pers[#"hash_33112f192fb3c234"][var_9b4eeccc] = [];
			}
			var_29da3a57 = 0;
			var_6ad8c73b = [];
			foreach(stat in var_9a8d2924.var_739c1749)
			{
				if(!isdefined(stat) || !isdefined(stat.stattype))
				{
					continue;
				}
				switch(stat.stattype)
				{
					case "playerstatslist":
					{
						score = player function_cd851b02(stat, var_9b4eeccc, stat.stattype);
						break;
					}
					case "razorwireekia":
					{
						razorwireekia = player stats::function_441050ca(#"hash_3d06dfa608b3b520") + player stats::function_441050ca(#"hash_2dc93d1e6de62f4c");
						score = player function_1fa30a47(stat, razorwireekia, var_9b4eeccc);
						break;
					}
					case "objectivescore":
					case "objectivetime":
					case "damagedone":
					case "objectiveekia":
					{
						score = player function_1fa30a47(stat, player.pers[stat.stattype], var_9b4eeccc);
						break;
					}
					case "highestkillstreak":
					{
						if(is_true(stat.var_233a23b6))
						{
							score = (player.pers[#"cur_kill_streak"] > player.pers[#"best_kill_streak"] ? player.pers[#"cur_kill_streak"] : player.pers[#"best_kill_streak"]);
						}
						else
						{
							if(!isdefined(player.pers[#"hash_33112f192fb3c234"][var_9b4eeccc][stat.stattype]))
							{
								player.pers[#"hash_33112f192fb3c234"][var_9b4eeccc][stat.stattype] = 0;
							}
							score = (player.pers[#"cur_kill_streak"] > player.pers[#"hash_33112f192fb3c234"][var_9b4eeccc][stat.stattype] ? player.pers[#"cur_kill_streak"] : player.pers[#"hash_33112f192fb3c234"][var_9b4eeccc][stat.stattype]);
						}
						break;
					}
					case "highestmultikill":
					{
						score = (isdefined(player.pers[stat.stattype]) ? player.pers[stat.stattype] : 0);
						break;
					}
					default:
					{
						score = 0;
						break;
					}
				}
				var_29da3a57 = var_29da3a57 + (score * (isdefined(stat.var_26568428) ? stat.var_26568428 : 0));
				var_6ad8c73b[var_6ad8c73b.size] = score;
			}
			for(index = 0; index < 3; index++)
			{
				if(!isdefined(level.var_1a0a6769[index]))
				{
					level.var_1a0a6769[index] = spawnstruct();
				}
				if(var_29da3a57 < (isdefined(level.var_1a0a6769[index].var_29da3a57) ? level.var_1a0a6769[index].var_29da3a57 : 0))
				{
					continue;
				}
				for(var_82927499 = 2; var_82927499 > index; var_82927499--)
				{
					if(!isdefined(level.var_1a0a6769[var_82927499]))
					{
						level.var_1a0a6769[var_82927499] = spawnstruct();
					}
					if(!isdefined(level.var_1a0a6769[var_82927499 - 1]))
					{
						level.var_1a0a6769[var_82927499 - 1] = spawnstruct();
					}
					level.var_1a0a6769[var_82927499].var_29da3a57 = level.var_1a0a6769[var_82927499 - 1].var_29da3a57;
					level.var_1a0a6769[var_82927499].player = level.var_1a0a6769[var_82927499 - 1].player;
					level.var_1a0a6769[var_82927499].var_9a8d2924 = level.var_1a0a6769[var_82927499 - 1].var_9a8d2924;
					level.var_1a0a6769[var_82927499].var_74be6838 = level.var_1a0a6769[var_82927499 - 1].var_74be6838;
					level.var_1a0a6769[var_82927499].var_6ad8c73b = level.var_1a0a6769[var_82927499 - 1].var_6ad8c73b;
				}
				level.var_1a0a6769[index].var_29da3a57 = var_29da3a57;
				level.var_1a0a6769[index].player = player;
				level.var_1a0a6769[index].var_9a8d2924 = var_9a8d2924;
				level.var_1a0a6769[index].var_74be6838 = var_74be6838;
				level.var_1a0a6769[index].var_6ad8c73b = var_6ad8c73b;
				break;
			}
		}
	}
	foreach(var_142bdec0 in level.var_1a0a6769)
	{
		luinotifyevent(#"hash_7eaa776edd5d85d3", 7, var_142bdec0.player.clientid, (isdefined(var_142bdec0.var_74be6838) ? var_142bdec0.var_74be6838 : 0), (isdefined(var_142bdec0.var_6ad8c73b[0]) ? var_142bdec0.var_6ad8c73b[0] : 0), (isdefined(var_142bdec0.var_6ad8c73b[1]) ? var_142bdec0.var_6ad8c73b[1] : 0), (isdefined(var_142bdec0.var_6ad8c73b[2]) ? var_142bdec0.var_6ad8c73b[2] : 0), (isdefined(var_142bdec0.var_6ad8c73b[3]) ? var_142bdec0.var_6ad8c73b[3] : 0), (isdefined(var_142bdec0.var_6ad8c73b[4]) ? var_142bdec0.var_6ad8c73b[4] : 0));
	}
}

/*
	Name: function_cd851b02
	Namespace: namespace_9a8d2924
	Checksum: 0x1C5F1796
	Offset: 0x1988
	Size: 0x194
	Parameters: 3
	Flags: Private
*/
function private function_cd851b02(stat, var_9b4eeccc, ddl)
{
	if(!isdefined(stat.var_82670522))
	{
		return 0;
	}
	if(is_true(stat.var_233a23b6))
	{
		score = self stats::get_stat(ddl, stat.var_82670522, #"statvalue") - self.pers[#"hash_33112f192fb3c234"][#"base"][stat.var_82670522];
	}
	else
	{
		score = (isdefined(self.pers[#"hash_33112f192fb3c234"][var_9b4eeccc][stat.var_82670522]) ? self.pers[#"hash_33112f192fb3c234"][var_9b4eeccc][stat.var_82670522] : 0);
		score = score + (self stats::get_stat(ddl, stat.var_82670522, #"statvalue") - self.pers[#"hash_33112f192fb3c234"][#"current"][stat.var_82670522]);
	}
	return score;
}

/*
	Name: function_d0c02a50
	Namespace: namespace_9a8d2924
	Checksum: 0xA5DF2E40
	Offset: 0x1B28
	Size: 0x14C
	Parameters: 3
	Flags: Private
*/
function private function_d0c02a50(stat, var_aa1fbd8c, ddl)
{
	if(!isdefined(self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c][stat.var_82670522]))
	{
		self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c][stat.var_82670522] = 0;
	}
	var_6fda3763 = self stats::get_stat(ddl, stat.var_82670522, #"statvalue");
	self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c][stat.var_82670522] = self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c][stat.var_82670522] + (var_6fda3763 - self.pers[#"hash_33112f192fb3c234"][#"current"][stat.var_82670522]);
	return var_6fda3763;
}

/*
	Name: function_1fa30a47
	Namespace: namespace_9a8d2924
	Checksum: 0xEAC23BE1
	Offset: 0x1C80
	Size: 0x124
	Parameters: 3
	Flags: Private
*/
function private function_1fa30a47(stat, currentscore, var_9b4eeccc)
{
	if(is_true(stat.var_233a23b6))
	{
		score = currentscore - self.pers[#"hash_33112f192fb3c234"][#"base"][stat.stattype];
	}
	else
	{
		score = (isdefined(self.pers[#"hash_33112f192fb3c234"][var_9b4eeccc][stat.stattype]) ? self.pers[#"hash_33112f192fb3c234"][var_9b4eeccc][stat.stattype] : 0);
		score = score + (currentscore - self.pers[#"hash_33112f192fb3c234"][#"current"][stat.stattype]);
	}
	return score;
}

/*
	Name: function_b535c32e
	Namespace: namespace_9a8d2924
	Checksum: 0x612CA327
	Offset: 0x1DB0
	Size: 0x10C
	Parameters: 3
	Flags: Private
*/
function private function_b535c32e(stat, score, var_aa1fbd8c)
{
	if(!isdefined(self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c][stat.stattype]))
	{
		self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c][stat.stattype] = 0;
	}
	self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c][stat.stattype] = self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c][stat.stattype] + (score - self.pers[#"hash_33112f192fb3c234"][#"current"][stat.stattype]);
	return score;
}

/*
	Name: function_be94d98b
	Namespace: namespace_9a8d2924
	Checksum: 0x3317557F
	Offset: 0x1EC8
	Size: 0xD0
	Parameters: 3
	Flags: Private
*/
function private function_be94d98b(stat, score, var_aa1fbd8c)
{
	if(!isdefined(self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c][stat.stattype]))
	{
		self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c][stat.stattype] = 0;
	}
	if(self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c][stat.stattype] < score)
	{
		self.pers[#"hash_33112f192fb3c234"][var_aa1fbd8c][stat.stattype] = score;
	}
}

