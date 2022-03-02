#using script_1cc417743d7c262d;
#using script_2255a7ad3edc838f;
#using script_383a3b1bb18ba876;
#using script_40fc784c60f9fa7b;
#using script_47fb62300ac0bd60;
#using script_545a0bac37bda541;
#using script_56ca01b3b31455b5;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using script_7133a4d461308099;
#using script_7a8059ca02b7b09e;
#using script_7f6cd71c43c45c57;
#using scripts\core_common\armor.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\loadout_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\callbacks.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\outcome.gsc;
#using scripts\mp_common\scoreevents.gsc;

#namespace globallogic_score;

/*
	Name: function_becf2646
	Namespace: globallogic_score
	Checksum: 0xDACEEC97
	Offset: 0x490
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_becf2646()
{
	level notify(1061362465);
}

/*
	Name: __init__
	Namespace: globallogic_score
	Checksum: 0xA741E77C
	Offset: 0x4B0
	Size: 0x134
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	level.scoreevents_givekillstats = &givekillstats;
	level.scoreevents_processassist = &function_b1a3b359;
	clientfield::function_a8bbc967("hudItems.scoreProtected", 1, 1, "int");
	clientfield::function_a8bbc967("hudItems.minorActions.action0", 1, 1, "counter");
	clientfield::function_a8bbc967("hudItems.minorActions.action1", 1, 1, "counter");
	clientfield::function_a8bbc967("hudItems.hotStreak.level", 1, 3, "int");
	callback::on_joined_team(&function_253ff387);
	callback::on_joined_spectate(&function_30ab51a4);
	callback::function_7117ff72(&function_30ab51a4);
}

/*
	Name: main
	Namespace: globallogic_score
	Checksum: 0xAE0E2CE9
	Offset: 0x5F0
	Size: 0x26
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level thread function_39193e3a();
}

/*
	Name: codecallback_finalizeinitialization
	Namespace: globallogic_score
	Checksum: 0x2A7D26BC
	Offset: 0x620
	Size: 0x204
	Parameters: 1
	Flags: Event
*/
event codecallback_finalizeinitialization(eventstruct)
{
	level.var_b961672f = 0.5;
	if(level.var_5b544215 === 0)
	{
		level.var_43723615 = &function_3ba7c551;
		level.var_43701269 = &function_b58be5d;
		level.var_b961672f = 0;
		level.var_3cb4abe7 = undefined;
	}
	else
	{
		if(level.var_5b544215 === 1)
		{
			level.var_43723615 = &function_5dda25b9;
			level.var_43701269 = &function_fdbd4189;
			level.var_b961672f = (isdefined(getgametypesetting(#"hash_56a31bddd92a64dc")) ? getgametypesetting(#"hash_56a31bddd92a64dc") : 0) / 100;
			level.var_3cb4abe7 = undefined;
		}
		else if(level.var_5b544215 === 2)
		{
			level.var_43723615 = &function_94765bca;
			level.var_43701269 = &function_4301d2e0;
			level.var_b961672f = (isdefined(getgametypesetting(#"hash_77809e5fafcdd481")) ? getgametypesetting(#"hash_77809e5fafcdd481") : 0) / 100;
			level.var_bbaf4cdf = &function_fd1f8965;
			level.scorestreaksmaxstacking = 1;
		}
	}
}

/*
	Name: function_39193e3a
	Namespace: globallogic_score
	Checksum: 0xC60E162F
	Offset: 0x830
	Size: 0x100
	Parameters: 0
	Flags: Linked
*/
function function_39193e3a()
{
	self notify("1519607aded6814a");
	self endon("1519607aded6814a");
	level endon(#"game_ended");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hero_gadget_activated");
		if(isdefined(waitresult.weapon) && isdefined(waitresult.player))
		{
			player = waitresult.player;
			if(isdefined(player.pers[#"hash_53919d92ff1d039"]))
			{
				scoreevents::function_6f51d1e9("battle_command_ultimate_command", player.pers[#"hash_53919d92ff1d039"], undefined, undefined);
				player.pers[#"hash_53919d92ff1d039"] = undefined;
			}
		}
	}
}

/*
	Name: function_eaa4e6f7
	Namespace: globallogic_score
	Checksum: 0x2C21E52D
	Offset: 0x938
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function function_eaa4e6f7()
{
	if(!level.timelimit || level.forcedend)
	{
		gamelength = float(globallogic_utils::gettimepassed()) / 1000;
		gamelength = min(gamelength, 1200);
	}
	else
	{
		gamelength = level.timelimit * 60;
	}
	return gamelength;
}

/*
	Name: function_d68cdc5d
	Namespace: globallogic_score
	Checksum: 0x885E35C7
	Offset: 0x9D8
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function function_d68cdc5d()
{
	var_96974d12 = (isdefined(getgametypesetting(#"hash_24c718cc0c526c38")) ? getgametypesetting(#"hash_24c718cc0c526c38") : 3);
	return var_96974d12;
}

/*
	Name: function_984a57ca
	Namespace: globallogic_score
	Checksum: 0x4AF6DBE5
	Offset: 0xA48
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_984a57ca(player)
{
	var_96974d12 = function_d68cdc5d();
	for(pidx = 0; pidx < min(level.placement[#"all"].size, var_96974d12); pidx++)
	{
		if(level.placement[#"all"][pidx] != player)
		{
			continue;
		}
		return true;
	}
	return false;
}

/*
	Name: function_78e7b549
	Namespace: globallogic_score
	Checksum: 0x206D6C2C
	Offset: 0xAF8
	Size: 0x14A
	Parameters: 2
	Flags: Linked
*/
function function_78e7b549(scale, outcome)
{
	player = self;
	if(isdefined(player) && isdefined(player.pers) && scoreevents::shouldaddrankxp(player))
	{
		var_28ee869a = gettime() - player.pers[#"hash_150795bee4d46ce4"];
		var_7f4c0762 = min((var_28ee869a / 1000) / 60, 30);
		score = int((((getdvarint(#"hash_3cccb7d9e336696a", 0) * var_7f4c0762) * scale) * level.var_b4320b5b[#"hash_31b5b9e273560fa9"]) + 0.5);
		player addrankxpvalue(outcome, score, 3);
		player.matchbonus = score;
	}
}

/*
	Name: function_f7e4fb88
	Namespace: globallogic_score
	Checksum: 0xD52E1BDC
	Offset: 0xC50
	Size: 0x388
	Parameters: 1
	Flags: Linked
*/
function function_f7e4fb88(outcome)
{
	if(!game.timepassed)
	{
		return;
	}
	if(!level.rankedmatch)
	{
		updatecustomgamewinner(outcome);
		return;
	}
	tie = outcome::function_5f24faac(outcome, "tie");
	if(tie)
	{
		winnerscale = 1;
		loserscale = 1;
	}
	else
	{
		winnerscale = 1.15;
		loserscale = 0.85;
	}
	winning_team = outcome::get_winning_team(outcome);
	players = level.players;
	foreach(player in players)
	{
		if(player.timeplayed[#"total"] < 1 || player.pers[#"participation"] < 1)
		{
			player thread rank::endgameupdate();
			continue;
		}
		if(level.hostforcedend && player ishost())
		{
			continue;
		}
		if(player.pers[#"score"] < 0)
		{
			continue;
		}
		if(isdefined(player.pers[#"team"]) && player.pers[#"team"] == #"spectator")
		{
			continue;
		}
		if(level.teambased)
		{
			if(tie)
			{
				player function_78e7b549(winnerscale, "tie");
			}
			else
			{
				if(isdefined(player.pers[#"team"]) && player.pers[#"team"] == winning_team)
				{
					player function_78e7b549(winnerscale, "win");
				}
				else
				{
					player function_78e7b549(loserscale, "loss");
				}
			}
		}
		else
		{
			if(function_984a57ca(player))
			{
				player function_78e7b549(winnerscale, "win");
			}
			else
			{
				player function_78e7b549(loserscale, "loss");
			}
		}
		player.pers[#"totalmatchbonus"] = player.pers[#"totalmatchbonus"] + player.matchbonus;
	}
}

/*
	Name: function_863d9af1
	Namespace: globallogic_score
	Checksum: 0xF8BC395F
	Offset: 0xFE0
	Size: 0xD8
	Parameters: 1
	Flags: Linked
*/
function function_863d9af1(weapon)
{
	if(isdefined(self.pickedupweapons[weapon]))
	{
		return;
	}
	if(self.pers[#"hash_34c4a79728ef275a"].size < 10 || isdefined(self.pers[#"hash_34c4a79728ef275a"][weapon.statname]))
	{
		if(!isdefined(self.pers[#"hash_34c4a79728ef275a"][weapon.statname]))
		{
			self.pers[#"hash_34c4a79728ef275a"][weapon.statname] = 0;
		}
		self.pers[#"hash_34c4a79728ef275a"][weapon.statname]++;
	}
}

/*
	Name: function_3ecf3e8d
	Namespace: globallogic_score
	Checksum: 0xD7AB7F4F
	Offset: 0x10C0
	Size: 0x30C
	Parameters: 0
	Flags: Linked
*/
function function_3ecf3e8d()
{
	players = level.players;
	foreach(player in players)
	{
		if(player.timeplayed[#"total"] < 1 || player.pers[#"participation"] < 1)
		{
			continue;
		}
		if(level.hostforcedend && player ishost())
		{
			continue;
		}
		if(player.pers[#"score"] < 0)
		{
			continue;
		}
		var_20ba9666 = player.timeplayed[#"total"] / 60;
		var_f9c03957 = (level.var_b4320b5b[#"hash_71fab2192fa2537d"] / 60) * var_20ba9666;
		if(player.ekia < var_f9c03957)
		{
			var_3d6175e7 = var_f9c03957 - player.ekia;
			var_a0173673 = var_3d6175e7 * level.var_b4320b5b[#"hash_1f866ae0a3a62832"];
			if(isdefined(level.scoreinfo[#"ekia"][#"xp"]))
			{
				foreach(ekia in player.pers[#"hash_34c4a79728ef275a"])
				{
					var_98217d33 = ekia / player.ekia;
					player function_f93152a5(#"hash_11771ff800549e87", getweapon(weaponname), int((var_98217d33 * var_a0173673) * level.scoreinfo[#"ekia"][#"xp"]));
				}
			}
		}
	}
}

/*
	Name: updatecustomgamewinner
	Namespace: globallogic_score
	Checksum: 0x40A8BBF1
	Offset: 0x13D8
	Size: 0x208
	Parameters: 1
	Flags: Linked
*/
function updatecustomgamewinner(outcome)
{
	if(!level.mpcustommatch)
	{
		return;
	}
	var_6f86cba9 = outcome::get_winning_team(outcome);
	tie = outcome::function_5f24faac(outcome, "tie");
	foreach(player in level.players)
	{
		if(!isdefined(var_6f86cba9))
		{
			player.pers[#"victory"] = 0;
		}
		else
		{
			if(level.teambased)
			{
				if(player.team == var_6f86cba9)
				{
					player.pers[#"victory"] = 2;
				}
				else
				{
					if(tie)
					{
						player.pers[#"victory"] = 1;
					}
					else
					{
						player.pers[#"victory"] = 0;
					}
				}
			}
			else
			{
				if(function_984a57ca(player))
				{
					player.pers[#"victory"] = 2;
				}
				else
				{
					player.pers[#"victory"] = 0;
				}
			}
		}
		player.pers[#"sbtimeplayed"] = player.timeplayed[#"total"];
	}
}

/*
	Name: gethighestscoringplayer
	Namespace: globallogic_score
	Checksum: 0xA5043153
	Offset: 0x15E8
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function gethighestscoringplayer()
{
	players = level.players;
	winner = undefined;
	tie = 0;
	for(i = 0; i < players.size; i++)
	{
		if(!isdefined(players[i].pointstowin))
		{
			continue;
		}
		if(players[i].pointstowin < 1)
		{
			continue;
		}
		if(!isdefined(winner) || players[i].pointstowin > winner.pointstowin)
		{
			winner = players[i];
			tie = 0;
			continue;
		}
		if(players[i].pointstowin == winner.pointstowin)
		{
			tie = 1;
		}
	}
	if(tie || !isdefined(winner))
	{
		return undefined;
	}
	return winner;
}

/*
	Name: function_15683f39
	Namespace: globallogic_score
	Checksum: 0x1312DFE
	Offset: 0x16F8
	Size: 0x108
	Parameters: 0
	Flags: Linked
*/
function function_15683f39()
{
	players = level.players;
	var_3df849b3 = undefined;
	tie = 0;
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(!isdefined(player.score))
		{
			continue;
		}
		if(player.score < 1)
		{
			continue;
		}
		if(!isdefined(var_3df849b3) || player.score > var_3df849b3.score)
		{
			var_3df849b3 = player;
			tie = 0;
			continue;
		}
		if(player.score == var_3df849b3.score)
		{
			tie = 1;
		}
	}
	if(tie || !isdefined(var_3df849b3))
	{
		return undefined;
	}
	return var_3df849b3;
}

/*
	Name: resetplayerscorechainandmomentum
	Namespace: globallogic_score
	Checksum: 0x1311F6B1
	Offset: 0x1810
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function resetplayerscorechainandmomentum(player)
{
	player thread _setplayermomentum(self, 0);
	player thread resetscorechain();
}

/*
	Name: resetscorechain
	Namespace: globallogic_score
	Checksum: 0x25B659CF
	Offset: 0x1858
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function resetscorechain()
{
	self notify(#"reset_score_chain");
	self.scorechain = 0;
	self.rankupdatetotal = 0;
}

/*
	Name: scorechaintimer
	Namespace: globallogic_score
	Checksum: 0xB53710BF
	Offset: 0x1890
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function scorechaintimer()
{
	self notify(#"score_chain_timer");
	self endon(#"reset_score_chain", #"score_chain_timer", #"death", #"disconnect");
	wait(20);
	self thread resetscorechain();
}

/*
	Name: roundtonearestfive
	Namespace: globallogic_score
	Checksum: 0x143FF60F
	Offset: 0x1910
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function roundtonearestfive(score)
{
	rounding = score % 5;
	if(rounding <= 2)
	{
		return score - rounding;
	}
	return score + (5 - rounding);
}

/*
	Name: giveplayermomentumnotification
	Namespace: globallogic_score
	Checksum: 0x39E9334B
	Offset: 0x1968
	Size: 0x2FC
	Parameters: 9
	Flags: Linked
*/
function giveplayermomentumnotification(score, label, descvalue, weapon, combatefficiencybonus, eventindex, event, var_36f23f1f, var_dbaa74e2)
{
	if(!isdefined(eventindex))
	{
		eventindex = 0;
	}
	weapon = weapon + eventindex;
	if(is_true(level.var_5ee570bd))
	{
		weapon = rank::function_bcb5e246(var_36f23f1f);
		if(!isdefined(weapon))
		{
			weapon = 0;
		}
	}
	if(weapon != 0)
	{
		if(!isdefined(event))
		{
			event = 1;
		}
		if(var_dbaa74e2.notificationtype === #"streak")
		{
			self luinotifyevent(#"hash_4aa652796cc3e19", 3, combatefficiencybonus, weapon, var_dbaa74e2.var_c874a8ab);
			self function_8ba40d2f(#"hash_4aa652796cc3e19", 3, combatefficiencybonus, weapon, var_dbaa74e2.var_c874a8ab);
			potm::function_bcad6f70(#"hash_4aa652796cc3e19", self, combatefficiencybonus, weapon, var_dbaa74e2.var_c874a8ab);
		}
		else
		{
			self luinotifyevent(#"score_event", 4, combatefficiencybonus, weapon, eventindex, event);
			self function_8ba40d2f(#"score_event", 4, combatefficiencybonus, weapon, eventindex, event);
			potm::function_d6b60141(#"score_event", self, combatefficiencybonus, weapon, eventindex, event);
		}
	}
	weapon = weapon;
	if(weapon > 0 && self hasperk(#"specialty_earnmoremomentum"))
	{
		weapon = roundtonearestfive(int((weapon * getdvarfloat(#"perk_killstreakmomentummultiplier", 0)) + 0.5));
	}
	if(!isdefined(self.pers[#"momentum"]))
	{
		self.pers[#"momentum"] = 0;
	}
	_setplayermomentum(self, self.pers[#"momentum"] + weapon);
}

/*
	Name: function_49c10afe
	Namespace: globallogic_score
	Checksum: 0xE100B6C3
	Offset: 0x1C70
	Size: 0x114
	Parameters: 0
	Flags: None
*/
function function_49c10afe()
{
	if(isdefined(level.usingscorestreaks) && level.usingscorestreaks)
	{
		_setplayermomentum(self, 0);
		self thread resetscorechain();
		weaponslist = self getweaponslist();
		for(idx = 0; idx < weaponslist.size; idx++)
		{
			weapon = weaponslist[idx];
			if(killstreaks::is_killstreak_weapon(weapon))
			{
				quantity = killstreaks::get_killstreak_quantity(weapon);
				if(isdefined(quantity) && quantity > 0)
				{
					self killstreaks::change_killstreak_quantity(weapon, quantity * -1);
				}
			}
		}
	}
}

/*
	Name: resetplayermomentumonspawn
	Namespace: globallogic_score
	Checksum: 0xC19FEF6D
	Offset: 0x1D90
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function resetplayermomentumonspawn()
{
	if(isdefined(level.usingscorestreaks) && level.usingscorestreaks)
	{
		var_a4e87ee3 = isdefined(self.deathtime) && self.deathtime > 0;
		var_a68a55cd = self function_80172c6();
		if(var_a4e87ee3 && var_a68a55cd > 0)
		{
			var_28749ebe = (isdefined(self.var_28749ebe) ? self.var_28749ebe : 0);
			var_347218dd = var_a68a55cd > var_28749ebe;
			if(var_347218dd)
			{
				self.var_28749ebe = var_28749ebe + 1;
				var_a4e87ee3 = 0;
			}
			else
			{
				self.var_28749ebe = undefined;
			}
		}
		else
		{
			self.var_28749ebe = undefined;
		}
		if(var_a4e87ee3)
		{
			[[level.var_43701269]](self);
			self thread resetscorechain();
		}
		var_8c68675a = var_a68a55cd > (isdefined(self.var_28749ebe) ? self.var_28749ebe : 0);
		self clientfield::set_player_uimodel("hudItems.scoreProtected", var_8c68675a);
	}
}

/*
	Name: function_1ceb2820
	Namespace: globallogic_score
	Checksum: 0x8F5584A7
	Offset: 0x1F00
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_1ceb2820()
{
	if(isdefined(level.usingscorestreaks) && level.usingscorestreaks)
	{
		if(isdefined(level.var_bbaf4cdf))
		{
			[[level.var_bbaf4cdf]](self);
		}
		self thread resetscorechain();
	}
}

/*
	Name: giveplayermomentum
	Namespace: globallogic_score
	Checksum: 0x5B336251
	Offset: 0x1F68
	Size: 0x25C
	Parameters: 7
	Flags: Linked
*/
function giveplayermomentum(event, player, victim, descvalue, weapon, var_36f23f1f, var_dbaa74e2)
{
	if(isdefined(level.disablemomentum) && level.disablemomentum == 1)
	{
		return;
	}
	if(level.var_73e51905 === 1 && getdvarint(#"hash_1aa5f986ed71357d", 1) != 0)
	{
		if(isdefined(player) && !isalive(player))
		{
			return;
		}
	}
	score = player rank::getscoreinfovalue(event);
	/#
		assert(isdefined(score));
	#/
	label = rank::getscoreinfolabel(event);
	eventindex = level.scoreinfo[event][#"row"];
	if(score == 0)
	{
		return;
	}
	if(event == "death")
	{
		if(!isdefined(victim.pers[#"momentum"]))
		{
			victim.pers[#"momentum"] = 0;
		}
		_setplayermomentum(victim, victim.pers[#"momentum"] + score);
	}
	if(level.gameended)
	{
		return;
	}
	if(!isdefined(label))
	{
		player giveplayermomentumnotification(score, #"hash_480234a872bd64ac", descvalue, weapon, 0, eventindex, event, var_36f23f1f, var_dbaa74e2);
		return;
	}
	player giveplayermomentumnotification(score, label, descvalue, weapon, 0, eventindex, event, var_36f23f1f, var_dbaa74e2);
}

/*
	Name: giveplayerscore
	Namespace: globallogic_score
	Checksum: 0xC56ADD62
	Offset: 0x21D0
	Size: 0x2BE
	Parameters: 7
	Flags: Linked
*/
function giveplayerscore(event, player, victim, descvalue, weapon, var_36f23f1f, var_dbaa74e2)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponnone;
	}
	scorediff = 0;
	momentum = (isdefined(player.pers[#"momentum"]) ? player.pers[#"momentum"] : 0);
	giveplayermomentum(event, player, victim, descvalue, weapon, var_36f23f1f, var_dbaa74e2);
	newmomentum = player.pers[#"momentum"];
	if(level.overrideplayerscore)
	{
		return 0;
	}
	pixbeginevent();
	score = player.pers[#"score"];
	[[level.onplayerscore]](event, player, victim);
	newscore = player.pers[#"score"];
	pixendevent();
	if(!isdefined(score))
	{
		score = 0;
	}
	if(!isdefined(newscore))
	{
		newscore = 0;
	}
	scorediff = newscore - score;
	mpplayerscore = {};
	mpplayerscore.gamemode = level.gametype;
	mpplayerscore.spawnid = getplayerspawnid(player);
	mpplayerscore.gametime = function_f8d53445();
	mpplayerscore.type = (function_7a600918(event) ? event : hash(event));
	mpplayerscore.isscoreevent = scoreevents::isregisteredevent(event);
	mpplayerscore.delta = scorediff;
	mpplayerscore.deltamomentum = newmomentum - momentum;
	mpplayerscore.team = player.team;
	mpplayerscore.is_wearing_armor = player armor::has_armor();
	mpplayerscore.weapon = weapon.name;
	self thread function_3172cf59(player, newscore, weapon, mpplayerscore);
	if(scorediff > 0)
	{
		return scorediff;
	}
	return 0;
}

/*
	Name: function_e1573815
	Namespace: globallogic_score
	Checksum: 0x7C91AD16
	Offset: 0x2498
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function function_e1573815()
{
	if(!isdefined(level.var_a5c930dd))
	{
		level.var_a5c930dd = 0;
	}
	if(!isdefined(level.var_445b1bca))
	{
		level.var_445b1bca = 0;
	}
	while(level.var_a5c930dd == gettime() || level.var_445b1bca == gettime())
	{
		waitframe(1);
	}
	level.var_a5c930dd = gettime();
}

/*
	Name: function_3172cf59
	Namespace: globallogic_score
	Checksum: 0x5157CFDF
	Offset: 0x2518
	Size: 0x50E
	Parameters: 4
	Flags: Linked
*/
function function_3172cf59(player, newscore, weapon, mpplayerscore)
{
	player endon(#"disconnect");
	function_e1573815();
	pixbeginevent();
	event = mpplayerscore.type;
	scorediff = mpplayerscore.delta;
	if(sessionmodeismultiplayergame() && !isbot(player))
	{
		player function_678f57c8(#"hash_120b2cf3162c3bc1", mpplayerscore);
	}
	player bb::add_to_stat("score", mpplayerscore.delta);
	if(!isbot(player))
	{
		if(!isdefined(player.pers[#"hash_f9d3527022e8383"]))
		{
			player.pers[#"hash_f9d3527022e8383"] = [];
		}
		if(!isdefined(player.pers[#"hash_f9d3527022e8383"][event]))
		{
			player.pers[#"hash_f9d3527022e8383"][event] = 1;
		}
		else
		{
			player.pers[#"hash_f9d3527022e8383"][event] = player.pers[#"hash_f9d3527022e8383"][event] + 1;
		}
	}
	if(scorediff <= 0)
	{
		pixendevent();
		return;
	}
	recordplayerstats(player, "score", newscore);
	challengesenabled = !level.disablechallenges;
	player stats::function_bb7eedf0(#"score", scorediff);
	if(challengesenabled)
	{
		player stats::function_dad108fa(#"career_score", scorediff);
		scoreevents = function_3cbc4c6c(weapon.var_2e4a8800);
		var_8a4cfbd = weapon.var_76ce72e8 && isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1;
		if(var_8a4cfbd)
		{
			player stats::function_dad108fa(#"hash_6e9980514a73974", scorediff);
		}
		else if(weapon.var_b76e0a09)
		{
			player stats::function_dad108fa(#"hash_26cba7430b2ed7b1", scorediff);
		}
	}
	if(level.hardcoremode)
	{
		player stats::function_dad108fa(#"score_hc", scorediff);
		if(challengesenabled)
		{
			player stats::function_dad108fa(#"career_score_hc", scorediff);
		}
	}
	else
	{
		if(level.arenamatch)
		{
			player stats::function_bb7eedf0(#"hash_6e15cfed6ce05699", scorediff);
		}
		else
		{
			player stats::function_bb7eedf0(#"hash_2b53b624764a0a41", scorediff);
		}
	}
	if(level.multiteam)
	{
		player stats::function_dad108fa(#"score_multiteam", scorediff);
		if(challengesenabled)
		{
			player stats::function_dad108fa(#"career_score_multiteam", scorediff);
		}
	}
	player contracts::player_contract_event(#"score", newscore, scorediff);
	if(isdefined(weapon) && killstreaks::is_killstreak_weapon(weapon))
	{
		killstreak = killstreaks::get_from_weapon(weapon);
		killstreakpurchased = 0;
		if(isdefined(killstreak) && isdefined(level.killstreaks[killstreak]))
		{
			killstreakpurchased = player util::is_item_purchased(level.killstreaks[killstreak].menuname);
		}
		player contracts::player_contract_event(#"killstreak_score", scorediff, killstreakpurchased);
	}
	pixendevent();
}

/*
	Name: default_onplayerscore
	Namespace: globallogic_score
	Checksum: 0x50AE611A
	Offset: 0x2A30
	Size: 0x144
	Parameters: 3
	Flags: Linked
*/
function default_onplayerscore(event, player, victim)
{
	score = victim rank::getscoreinfovalue(player);
	rolescore = victim rank::getscoreinfoposition(player);
	var_f22ee5e = 0;
	if(victim rank::function_f7b5d9fa(player))
	{
		var_f22ee5e = score;
	}
	/#
		assert(isdefined(score));
	#/
	if(level.var_73e51905 === 1 && getdvarint(#"hash_1aa5f986ed71357d", 1) != 0)
	{
		if(isdefined(victim) && !isalive(victim))
		{
			score = 0;
			var_f22ee5e = 0;
			rolescore = 0;
		}
	}
	function_889ed975(victim, score, var_f22ee5e, rolescore);
}

/*
	Name: function_37d62931
	Namespace: globallogic_score
	Checksum: 0x4D6DF688
	Offset: 0x2B80
	Size: 0x6E
	Parameters: 2
	Flags: Linked
*/
function function_37d62931(player, amount)
{
	player.pers[#"objectives"] = player.pers[#"objectives"] + amount;
	player.objectives = player.pers[#"objectives"];
}

/*
	Name: _setplayerscore
	Namespace: globallogic_score
	Checksum: 0x47FCB4FC
	Offset: 0x2BF8
	Size: 0x22E
	Parameters: 4
	Flags: Linked
*/
function _setplayerscore(player, score, var_e21e8076, var_53c3aa0b)
{
	if(score != player.pers[#"score"])
	{
		player.pers[#"score"] = score;
		player.score = player.pers[#"score"];
		recordplayerstats(player, "score", player.pers[#"score"]);
	}
	if(isdefined(var_53c3aa0b) && var_53c3aa0b != player.pers[#"rolescore"])
	{
		player.pers[#"rolescore"] = var_53c3aa0b;
		player.rolescore = player.pers[#"rolescore"];
	}
	if(isdefined(var_e21e8076) && var_e21e8076 != player.pers[#"hash_6061882505788180"])
	{
		amount = (var_e21e8076 - player.pers[#"hash_6061882505788180"]) + player stats::get_stat(#"playerstatsbygametype", level.var_12323003, #"objective_score", #"statvalue");
		player stats::set_stat(#"playerstatsbygametype", level.var_12323003, #"objective_score", #"statvalue", amount);
		player.pers[#"hash_6061882505788180"] = var_e21e8076;
		player.var_f22ee5e = player.pers[#"hash_6061882505788180"];
	}
}

/*
	Name: _getplayerscore
	Namespace: globallogic_score
	Checksum: 0xF8B211AE
	Offset: 0x2E30
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function _getplayerscore(player)
{
	return player.pers[#"score"];
}

/*
	Name: function_17a678b7
	Namespace: globallogic_score
	Checksum: 0x75305924
	Offset: 0x2E60
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function function_17a678b7(player, scoresub)
{
	score = player.pers[#"score"] - scoresub;
	if(score < 0)
	{
		score = 0;
	}
	_setplayerscore(player, score);
}

/*
	Name: function_889ed975
	Namespace: globallogic_score
	Checksum: 0xF471E62B
	Offset: 0x2ED0
	Size: 0x21C
	Parameters: 4
	Flags: Linked
*/
function function_889ed975(player, var_6de41559, var_252f7989, var_f8258842)
{
	/#
		var_1eb7c454 = getdvarfloat(#"hash_eae9a8ee387705d", 1);
		var_6de41559 = int(var_6de41559 * var_1eb7c454);
		var_252f7989 = int(var_252f7989 * var_1eb7c454);
		var_f8258842 = int(var_f8258842 * var_1eb7c454);
	#/
	if(!isdefined(var_6de41559))
	{
		return;
	}
	if(!isdefined(player.pers[#"score"]))
	{
		player.pers[#"score"] = 0;
	}
	if(!isdefined(player.pers[#"hash_6061882505788180"]))
	{
		player.pers[#"hash_6061882505788180"] = 0;
	}
	if(!isdefined(player.pers[#"rolescore"]))
	{
		player.pers[#"rolescore"] = 0;
	}
	score = player.pers[#"score"] + var_6de41559;
	var_e21e8076 = player.pers[#"hash_6061882505788180"];
	if(isdefined(var_252f7989))
	{
		var_e21e8076 = var_e21e8076 + var_252f7989;
	}
	var_53c3aa0b = player.pers[#"rolescore"];
	if(isdefined(var_f8258842))
	{
		var_53c3aa0b = var_53c3aa0b + var_f8258842;
	}
	_setplayerscore(player, score, var_e21e8076, var_53c3aa0b);
}

/*
	Name: setpointstowin
	Namespace: globallogic_score
	Checksum: 0x8F539775
	Offset: 0x30F8
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function setpointstowin(points)
{
	self.pers[#"pointstowin"] = math::clamp(points, 0, 65000);
	self.pointstowin = self.pers[#"pointstowin"];
	self thread globallogic::checkscorelimit();
	self thread globallogic::checkroundscorelimit();
	self thread globallogic::checkplayerscorelimitsoon();
}

/*
	Name: givepointstowin
	Namespace: globallogic_score
	Checksum: 0xBCDF43AB
	Offset: 0x31B0
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function givepointstowin(points)
{
	self setpointstowin(self.pers[#"pointstowin"] + points);
}

/*
	Name: _setplayermomentum
	Namespace: globallogic_score
	Checksum: 0x29CF995B
	Offset: 0x31F8
	Size: 0x7A
	Parameters: 3
	Flags: Linked
*/
function _setplayermomentum(player, momentum, updatescore)
{
	if(!isdefined(updatescore))
	{
		updatescore = 1;
	}
	if(level.var_5b544215 != 2 || momentum > 0)
	{
		if(isdefined(level.var_43723615))
		{
			self [[level.var_43723615]](player, momentum, updatescore);
		}
	}
}

/*
	Name: function_3ba7c551
	Namespace: globallogic_score
	Checksum: 0x1D4A008A
	Offset: 0x3280
	Size: 0x2AC
	Parameters: 3
	Flags: Linked
*/
function function_3ba7c551(player, momentum, updatescore)
{
	momentum = math::clamp(momentum, 0, getdvarint(#"hash_6cc2b9f9d4cbe073", 20000));
	oldmomentum = player.pers[#"momentum"];
	if(momentum == oldmomentum)
	{
		return;
	}
	if(updatescore)
	{
		player bb::add_to_stat("momentum", momentum - oldmomentum);
	}
	if(momentum > oldmomentum)
	{
		highestmomentumcost = 0;
		numkillstreaks = 0;
		if(isdefined(player.killstreak))
		{
			numkillstreaks = player.killstreak.size;
		}
		killstreaktypearray = [];
		for(currentkillstreak = 0; currentkillstreak < numkillstreaks; currentkillstreak++)
		{
			killstreaktype = killstreaks::get_by_menu_name(player.killstreak[currentkillstreak]);
			if(isdefined(killstreaktype))
			{
				momentumcost = player function_dceb5542(level.killstreaks[killstreaktype].itemindex);
				if(momentumcost > highestmomentumcost)
				{
					highestmomentumcost = momentumcost;
				}
				killstreaktypearray[killstreaktypearray.size] = killstreaktype;
			}
		}
		function_1b25db30(player, momentum, oldmomentum, killstreaktypearray);
		while(highestmomentumcost > 0 && momentum >= highestmomentumcost)
		{
			oldmomentum = 0;
			momentum = momentum - highestmomentumcost;
			function_1b25db30(player, momentum, oldmomentum, killstreaktypearray);
		}
	}
	player.pers[#"momentum"] = momentum;
	player.momentum = player.pers[#"momentum"];
	/#
		if(getdvarint(#"hash_4f17b3fc9d5ba79a", 0) > 0)
		{
			iprintln("" + player.pers[#"momentum"]);
		}
	#/
}

/*
	Name: function_5dda25b9
	Namespace: globallogic_score
	Checksum: 0x647D5BD4
	Offset: 0x3538
	Size: 0x304
	Parameters: 3
	Flags: Linked
*/
function function_5dda25b9(player, momentum, updatescore)
{
	momentum = math::clamp(momentum, 0, getdvarint(#"hash_6cc2b9f9d4cbe073", 20000));
	oldmomentum = player.pers[#"momentum"];
	if(momentum == oldmomentum)
	{
		return;
	}
	if(updatescore)
	{
		player bb::add_to_stat("momentum", momentum - oldmomentum);
	}
	player.pers[#"momentum"] = momentum;
	player.momentum = player.pers[#"momentum"];
	for(i = 0; i < 3; i++)
	{
		killstreaktype = killstreaks::get_by_menu_name(player.killstreak[i]);
		if(isdefined(killstreaktype))
		{
			weapon = killstreaks::get_killstreak_weapon(killstreaktype);
			var_1f8971a2 = isdefined(player.pers[#"held_killstreak_ammo_count"][weapon]) && player.pers[#"held_killstreak_ammo_count"][weapon] > 0;
			alreadyearned = (isdefined(level.var_a385666[killstreaktype]) ? [[level.var_a385666[killstreaktype]]](i) : 0);
			if(function_bb8a71b(player, killstreaktype) && function_605fde09(player, killstreaktype) && player killstreakrules::iskillstreakallowed(killstreaktype, player.team, 0) && !var_1f8971a2 && !alreadyearned)
			{
				player killstreaks::add_to_notification_queue(level.killstreaks[killstreaktype].menuname, undefined, killstreaktype, 0, 0);
			}
		}
	}
	/#
		if(getdvarint(#"hash_4f17b3fc9d5ba79a", 0) > 0)
		{
			iprintln("" + player.pers[#"momentum"]);
		}
	#/
}

/*
	Name: function_bb8a71b
	Namespace: globallogic_score
	Checksum: 0x5558C13A
	Offset: 0x3848
	Size: 0x128
	Parameters: 2
	Flags: Linked, Private
*/
function private function_bb8a71b(player, killstreaktype)
{
	if(isdefined(killstreaktype))
	{
		momentum = player.pers[#"momentum"];
		var_36f2d8a2 = player function_dceb5542(level.killstreaks[killstreaktype].itemindex);
		if(player killstreakrules::function_40451ab0(killstreaktype))
		{
			if(player.pers[#"hash_b05d8e95066f3ce"][killstreaktype] !== 1)
			{
				player.pers[#"hash_b05d8e95066f3ce"][killstreaktype] = 1;
				return true;
			}
		}
		else if(player.pers[#"hash_b05d8e95066f3ce"][killstreaktype] === 1)
		{
			player.pers[#"hash_b05d8e95066f3ce"][killstreaktype] = 0;
		}
	}
	return false;
}

/*
	Name: function_4301d2e0
	Namespace: globallogic_score
	Checksum: 0xAF856160
	Offset: 0x3978
	Size: 0x244
	Parameters: 1
	Flags: Linked
*/
function function_4301d2e0(player)
{
	for(slot = 0; slot < 3; slot++)
	{
		killstreaktype = killstreaks::get_by_menu_name(player.killstreak[slot]);
		var_dc3a7628 = 0;
		if(isdefined(killstreaktype))
		{
			var_464ac60 = player.pers[level.var_e57efb05[slot]];
			var_b961672f = level.var_b961672f;
			killstreakweapon = killstreaks::get_killstreak_weapon(killstreaktype);
			if(isdefined(level.var_3cb4abe7[killstreakweapon.statname]))
			{
				var_b961672f = level.var_3cb4abe7[killstreakweapon.statname];
			}
			var_d152ff83 = player function_95ecfff8();
			deathpenalty = (var_464ac60 * var_b961672f) - var_d152ff83;
			if(deathpenalty < 0)
			{
				deathpenalty = 0;
			}
			var_dc3a7628 = int((floor((var_464ac60 - deathpenalty) / 10)) * 10);
			var_dc3a7628 = math::clamp(var_dc3a7628, 0, getdvarint(#"hash_6cc2b9f9d4cbe073", 20000));
		}
		player.pers[level.var_e57efb05[slot]] = var_dc3a7628;
		player function_2c334e8f(slot, var_dc3a7628);
		/#
			if(getdvarint(#"hash_4f17b3fc9d5ba79a", 0) > 0)
			{
				iprintln((killstreaktype + "") + var_dc3a7628);
			}
		#/
	}
}

/*
	Name: function_fd1f8965
	Namespace: globallogic_score
	Checksum: 0xA1DFADBB
	Offset: 0x3BC8
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_fd1f8965(player)
{
	for(slot = 0; slot < 3; slot++)
	{
		killstreaktype = killstreaks::get_by_menu_name(player.killstreak[slot]);
		var_dc3a7628 = 0;
		if(isdefined(killstreaktype))
		{
			var_dc3a7628 = player.pers[level.var_e57efb05[slot]];
			var_dc3a7628 = math::clamp(var_dc3a7628, 0, getdvarint(#"hash_6cc2b9f9d4cbe073", 20000));
		}
		player.pers[level.var_e57efb05[slot]] = var_dc3a7628;
		player function_2c334e8f(slot, var_dc3a7628);
	}
}

/*
	Name: function_fdbd4189
	Namespace: globallogic_score
	Checksum: 0xD258670D
	Offset: 0x3CD8
	Size: 0x204
	Parameters: 1
	Flags: Linked
*/
function function_fdbd4189(player)
{
	oldmomentum = player.pers[#"momentum"];
	var_d152ff83 = player function_95ecfff8();
	deathpenalty = (oldmomentum * level.var_b961672f) - var_d152ff83;
	if(deathpenalty < 0)
	{
		deathpenalty = 0;
	}
	var_4c619c7a = int((floor((oldmomentum - deathpenalty) / 10)) * 10);
	var_4c619c7a = math::clamp(var_4c619c7a, 0, getdvarint(#"hash_6cc2b9f9d4cbe073", 20000));
	player.pers[#"momentum"] = var_4c619c7a;
	player.momentum = player.pers[#"momentum"];
	if(var_4c619c7a !== oldmomentum)
	{
		for(i = 0; i < 3; i++)
		{
			killstreaktype = killstreaks::get_by_menu_name(player.killstreak[i]);
			function_bb8a71b(player, killstreaktype);
		}
	}
	/#
		if(getdvarint(#"hash_4f17b3fc9d5ba79a", 0) > 0)
		{
			iprintln("" + var_4c619c7a);
		}
	#/
}

/*
	Name: function_b58be5d
	Namespace: globallogic_score
	Checksum: 0xD491ED02
	Offset: 0x3EE8
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function function_b58be5d(player)
{
	oldmomentum = player.pers[#"momentum"];
	var_d152ff83 = player function_95ecfff8();
	var_559e5a31 = math::clamp(player function_3ef59ab3(), 0, 1);
	deathpenalty = (oldmomentum * var_559e5a31) - var_d152ff83;
	if(deathpenalty < 0)
	{
		deathpenalty = 0;
	}
	new_momentum = int(oldmomentum - deathpenalty);
	_setplayermomentum(player, new_momentum);
	/#
		if(getdvarint(#"hash_4f17b3fc9d5ba79a", 0) > 0)
		{
			iprintln("" + player.pers[#"momentum"]);
		}
	#/
}

/*
	Name: function_94765bca
	Namespace: globallogic_score
	Checksum: 0xD4D190B5
	Offset: 0x4048
	Size: 0xD4
	Parameters: 3
	Flags: Linked
*/
function function_94765bca(player, momentum, updatescore)
{
	if(!isdefined(level.var_212e8400))
	{
		level.var_212e8400 = [];
	}
	entnum = momentum getentitynumber();
	if(!isdefined(level.var_212e8400[entnum]))
	{
		level.var_212e8400[entnum] = 0;
	}
	level.var_212e8400[entnum] = level.var_212e8400[entnum] + updatescore;
	if(level.var_8a1954d1 !== 1)
	{
		level thread function_4f4a98bf(momentum, updatescore);
	}
}

/*
	Name: function_4f4a98bf
	Namespace: globallogic_score
	Checksum: 0x38BE2A50
	Offset: 0x4128
	Size: 0xDE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4f4a98bf(player, momentum)
{
	level.var_8a1954d1 = 1;
	waittillframeend();
	foreach(momentum in level.var_212e8400)
	{
		player = getentbynum(entnum);
		if(!isdefined(player))
		{
			continue;
		}
		function_c17ecb35(player, momentum);
	}
	level.var_212e8400 = undefined;
	level.var_8a1954d1 = undefined;
}

/*
	Name: function_c17ecb35
	Namespace: globallogic_score
	Checksum: 0x3709F223
	Offset: 0x4210
	Size: 0x306
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c17ecb35(player, momentum)
{
	momentum = math::clamp(momentum, 0, getdvarint(#"hash_6cc2b9f9d4cbe073", 20000));
	oldmomentum = player.pers[#"momentum"];
	/#
		assert(oldmomentum == 0);
	#/
	if(momentum == oldmomentum)
	{
		return;
	}
	deltamomentum = momentum - oldmomentum;
	if(deltamomentum > 0)
	{
		numkillstreaks = 0;
		if(isdefined(player.killstreak))
		{
			numkillstreaks = player.killstreak.size;
		}
		for(slot = 0; slot < numkillstreaks; slot++)
		{
			var_dc3a7628 = 0;
			killstreaktype = killstreaks::get_by_menu_name(player.killstreak[slot]);
			if(!isdefined(level.var_e57efb05[slot]))
			{
				continue;
			}
			if(isdefined(killstreaktype) && function_1d5c913f(player, killstreaktype))
			{
				momentumcost = player function_dceb5542(level.killstreaks[killstreaktype].itemindex);
				var_464ac60 = player.pers[level.var_e57efb05[slot]];
				var_dc3a7628 = var_464ac60 + deltamomentum;
				given = function_9492ba27(player, var_dc3a7628, var_464ac60, killstreaktype);
				if(var_dc3a7628 > momentumcost)
				{
					var_dc3a7628 = momentumcost;
				}
				if(given)
				{
					var_dc3a7628 = var_dc3a7628 - momentumcost;
					/#
						assert(var_dc3a7628 >= 0);
					#/
				}
			}
			/#
				if(getdvarint(#"hash_4f17b3fc9d5ba79a", 0) > 0)
				{
					iprintln((killstreaktype + "") + var_dc3a7628);
				}
			#/
			player.pers[level.var_e57efb05[slot]] = var_dc3a7628;
			player function_2c334e8f(slot, var_dc3a7628);
		}
	}
	player.pers[#"momentum"] = 0;
	player.momentum = player.pers[#"momentum"];
}

/*
	Name: function_1d5c913f
	Namespace: globallogic_score
	Checksum: 0xFB20C07B
	Offset: 0x4520
	Size: 0x228
	Parameters: 2
	Flags: Linked
*/
function function_1d5c913f(player, killstreaktype)
{
	weapon = killstreaks::get_killstreak_weapon(killstreaktype);
	if((isdefined(player.pers[#"killstreak_quantity"][weapon]) ? player.pers[#"killstreak_quantity"][weapon] : 0) >= level.scorestreaksmaxstacking)
	{
		return false;
	}
	var_d0ecbc61 = getdvarint(#"hash_71ffe2a6c9f43529", 0) != 0;
	activekillstreaks = player killstreaks::getactivekillstreaks();
	if(isdefined(activekillstreaks))
	{
		foreach(killstreak in activekillstreaks)
		{
			if(killstreak.killstreakslot === 3)
			{
				continue;
			}
			if(killstreak.killstreaktype === killstreaktype)
			{
				if(var_d0ecbc61)
				{
					if(!player killstreaks::function_55e3fed6(killstreaktype))
					{
						return false;
					}
					continue;
				}
				return false;
			}
		}
	}
	if(isdefined(player.pers[#"held_killstreak_ammo_count"][weapon]))
	{
		if(player.pers[#"held_killstreak_ammo_count"][weapon] > 0)
		{
			return false;
		}
	}
	if(!var_d0ecbc61 && player killstreaks::function_55e3fed6(killstreaktype))
	{
		return false;
	}
	return true;
}

/*
	Name: function_605fde09
	Namespace: globallogic_score
	Checksum: 0xC56383D3
	Offset: 0x4750
	Size: 0x176
	Parameters: 2
	Flags: Linked
*/
function function_605fde09(player, killstreaktype)
{
	weapon = killstreaks::get_killstreak_weapon(killstreaktype);
	if((isdefined(player.pers[#"killstreak_quantity"][weapon]) ? player.pers[#"killstreak_quantity"][weapon] : 0) >= level.scorestreaksmaxstacking)
	{
		return false;
	}
	if(!isalive(player))
	{
		return false;
	}
	activekillstreaks = player killstreaks::getactivekillstreaks();
	if(isdefined(activekillstreaks))
	{
		foreach(killstreak in activekillstreaks)
		{
			if(killstreak.killstreaktype === killstreaktype)
			{
				return false;
			}
		}
	}
	if(player killstreaks::function_55e3fed6(killstreaktype))
	{
		return false;
	}
	return true;
}

/*
	Name: function_1b25db30
	Namespace: globallogic_score
	Checksum: 0xB7439620
	Offset: 0x48D0
	Size: 0x74
	Parameters: 4
	Flags: Linked
*/
function function_1b25db30(player, momentum, oldmomentum, killstreaktypearray)
{
	for(killstreaktypeindex = 0; killstreaktypeindex < killstreaktypearray.size; killstreaktypeindex++)
	{
		killstreaktype = killstreaktypearray[killstreaktypeindex];
		self function_d6377216(player, momentum, oldmomentum, killstreaktype);
	}
}

/*
	Name: function_9492ba27
	Namespace: globallogic_score
	Checksum: 0x1FCD44B3
	Offset: 0x4950
	Size: 0x52
	Parameters: 4
	Flags: Linked
*/
function function_9492ba27(player, momentum, oldmomentum, killstreaktype)
{
	given = self function_d6377216(player, momentum, oldmomentum, killstreaktype);
	return given;
}

/*
	Name: function_d6377216
	Namespace: globallogic_score
	Checksum: 0x4B199D0E
	Offset: 0x49B0
	Size: 0x4E2
	Parameters: 4
	Flags: Linked
*/
function function_d6377216(player, momentum, oldmomentum, killstreaktype)
{
	given = 0;
	var_2b85d59c = is_true(level.var_2b85d59c);
	momentumcost = player function_dceb5542(level.killstreaks[killstreaktype].itemindex);
	if(momentumcost > oldmomentum && momentumcost <= momentum)
	{
		weapon = killstreaks::get_killstreak_weapon(killstreaktype);
		was_already_at_max_stacking = 0;
		if(is_true(level.usingscorestreaks))
		{
			if(isdefined(level.var_ed3e6ff3))
			{
				player [[level.var_ed3e6ff3]](weapon, momentum);
			}
			if(weapon.iscarriedkillstreak)
			{
				if(!isdefined(player.pers[#"held_killstreak_ammo_count"][weapon]))
				{
					player.pers[#"held_killstreak_ammo_count"][weapon] = 0;
				}
				if(!isdefined(player.pers[#"killstreak_quantity"][weapon]))
				{
					player.pers[#"killstreak_quantity"][weapon] = 0;
				}
				currentweapon = player getcurrentweapon();
				if(currentweapon == weapon)
				{
					if(player.pers[#"killstreak_quantity"][weapon] < level.scorestreaksmaxstacking)
					{
						player.pers[#"killstreak_quantity"][weapon]++;
						given = 1;
					}
				}
				else
				{
					player.pers[#"held_killstreak_clip_count"][weapon] = weapon.clipsize;
					player.pers[#"held_killstreak_ammo_count"][weapon] = weapon.maxammo;
					player loadout::function_3ba6ee5d(weapon, player.pers[#"held_killstreak_ammo_count"][weapon]);
					given = 1;
				}
			}
			else
			{
				old_killstreak_quantity = player killstreaks::get_killstreak_quantity(weapon);
				new_killstreak_quantity = player killstreaks::change_killstreak_quantity(weapon, 1);
				was_already_at_max_stacking = new_killstreak_quantity == old_killstreak_quantity;
				if(!was_already_at_max_stacking)
				{
					player challenges::earnedkillstreak();
					player contracts::function_a54e2068(#"hash_3ddcd024e6e13a32");
					if(player ability_util::gadget_is_active(12))
					{
						scoreevents::processscoreevent(#"focus_earn_scorestreak", player, undefined, undefined);
						player scoreevents::specialistmedalachievement();
					}
				}
			}
			if(!was_already_at_max_stacking)
			{
				given = 1;
				if(player.pers[#"hash_b05d8e95066f3ce"][killstreaktype] === 1)
				{
					var_2b85d59c = 1;
				}
				if(level.var_5b544215 == 2 && player killstreaks::function_55e3fed6(killstreaktype))
				{
					var_2b85d59c = 1;
				}
				player killstreaks::add_to_notification_queue(level.killstreaks[killstreaktype].menuname, new_killstreak_quantity, killstreaktype, var_2b85d59c, 0);
			}
		}
		else
		{
			player killstreaks::add_to_notification_queue(level.killstreaks[killstreaktype].menuname, 0, killstreaktype, var_2b85d59c, 0);
			activeeventname = "reward_active";
			if(isdefined(weapon))
			{
				neweventname = weapon.name + "_active";
				if(scoreevents::isregisteredevent(neweventname))
				{
					activeeventname = neweventname;
				}
			}
		}
	}
	return given;
}

/*
	Name: function_3bd226fa
	Namespace: globallogic_score
	Checksum: 0x8E51D485
	Offset: 0x4EA0
	Size: 0x40
	Parameters: 2
	Flags: None
*/
function function_3bd226fa(killstreaktype, var_9595834)
{
	if(!isdefined(level.var_a385666))
	{
		level.var_a385666 = [];
	}
	level.var_a385666[killstreaktype] = var_9595834;
}

/*
	Name: function_13123cee
	Namespace: globallogic_score
	Checksum: 0xE3D6F7BF
	Offset: 0x4EE8
	Size: 0x450
	Parameters: 2
	Flags: Linked
*/
function function_13123cee(player, killstreakslot)
{
	if(game.state != #"playing")
	{
		return 0;
	}
	if(!isalive(player))
	{
		return 0;
	}
	killstreaktype = killstreaks::get_by_menu_name(player.killstreak[killstreakslot]);
	if(killstreaks::should_delay_killstreak(killstreaktype))
	{
		killstreaks::display_unavailable_time();
		return 0;
	}
	given = 0;
	if(isdefined(killstreaktype))
	{
		weapon = killstreaks::get_killstreak_weapon(killstreaktype);
		if(weapon.issupplydropweapon)
		{
			if(player getammocount(weapon) > 0)
			{
				player switchtoweapon(weapon);
				return 0;
			}
		}
		if(isdefined(player.pers[#"held_killstreak_ammo_count"][weapon]))
		{
			if(player.pers[#"held_killstreak_ammo_count"][weapon] > 0)
			{
				player switchtoweapon(weapon);
				return 0;
			}
		}
		if(isdefined(level.var_a385666[killstreaktype]))
		{
			alreadyearned = [[level.var_a385666[killstreaktype]]](killstreakslot);
			if(alreadyearned)
			{
				player switchtoweapon(weapon);
				return 0;
			}
		}
		if(player getammocount(weapon) > 0)
		{
			player switchtoweapon(weapon);
			return 0;
		}
		momentum = player.pers[#"momentum"];
		if(momentum > 0 && function_605fde09(player, killstreaktype) && player killstreakrules::iskillstreakallowed(killstreaktype, player.team, 0))
		{
			momentumcost = player function_dceb5542(level.killstreaks[killstreaktype].itemindex);
			given = function_9492ba27(player, momentum, 0, killstreaktype);
			if(given)
			{
				momentum = momentum - momentumcost;
				player.pers[#"momentum"] = momentum;
				player.momentum = player.pers[#"momentum"];
				for(i = 0; i < 3; i++)
				{
					var_d64761c7 = killstreaks::get_by_menu_name(player.killstreak[i]);
					if(isdefined(var_d64761c7))
					{
						var_36f2d8a2 = player function_dceb5542(level.killstreaks[var_d64761c7].itemindex);
						if(player.momentum < var_36f2d8a2)
						{
							player.pers[#"hash_b05d8e95066f3ce"][var_d64761c7] = 0;
						}
					}
				}
				/#
					if(getdvarint(#"hash_4f17b3fc9d5ba79a", 0) > 0)
					{
						iprintln("" + momentum);
					}
				#/
			}
		}
	}
	return given;
}

/*
	Name: function_8b375624
	Namespace: globallogic_score
	Checksum: 0x834DDB1F
	Offset: 0x5340
	Size: 0x198
	Parameters: 3
	Flags: Linked
*/
function function_8b375624(player, killstreaktype, momentumcost)
{
	given = 0;
	if(isdefined(killstreaktype))
	{
		weapon = killstreaks::get_killstreak_weapon(killstreaktype);
		if(isdefined(player.pers[#"held_killstreak_ammo_count"][weapon]))
		{
			if(player.pers[#"held_killstreak_ammo_count"][weapon] > 0)
			{
				player switchtoweapon(weapon);
				return 0;
			}
		}
		momentum = player.pers[#"momentum"];
		if(momentum >= momentumcost && function_605fde09(player, killstreaktype))
		{
			momentum = momentum - momentumcost;
			player.pers[#"momentum"] = momentum;
			player.momentum = player.pers[#"momentum"];
			given = 1;
			/#
				if(getdvarint(#"hash_4f17b3fc9d5ba79a", 0) > 0)
				{
					iprintln("" + momentum);
				}
			#/
		}
	}
	return given;
}

/*
	Name: setplayermomentumdebug
	Namespace: globallogic_score
	Checksum: 0x3ABA4E32
	Offset: 0x54E0
	Size: 0x118
	Parameters: 0
	Flags: None
*/
function setplayermomentumdebug()
{
	/#
		setdvar(#"sv_momentumpercent", 0);
		while(true)
		{
			wait(1);
			var_2227c36c = getdvarfloat(#"sv_momentumpercent", 0);
			if(var_2227c36c != 0)
			{
				player = util::gethostplayer();
				if(!isdefined(player))
				{
					return;
				}
				if(isdefined(player.killstreak))
				{
					_setplayermomentum(player, int(getdvarint(#"hash_6cc2b9f9d4cbe073", 20000) * (var_2227c36c / 100)));
				}
			}
		}
	#/
}

/*
	Name: giveteamscore
	Namespace: globallogic_score
	Checksum: 0xFA6378FB
	Offset: 0x5600
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function giveteamscore(event, team)
{
	if(level.overrideteamscore)
	{
		return;
	}
	pixbeginevent();
	teamscore = game.stat[#"teamscores"][team];
	[[level.onteamscore]](event, team);
	pixendevent();
	newscore = game.stat[#"teamscores"][team];
	if(teamscore == newscore)
	{
		return;
	}
	updateteamscores(team);
	thread globallogic::checkscorelimit();
	thread globallogic::checkroundscorelimit();
}

/*
	Name: giveteamscoreforobjective_delaypostprocessing
	Namespace: globallogic_score
	Checksum: 0xB2E3E40E
	Offset: 0x56E8
	Size: 0x13C
	Parameters: 2
	Flags: Linked
*/
function giveteamscoreforobjective_delaypostprocessing(team, score)
{
	teamscore = game.stat[#"teamscores"][team];
	onteamscore_incrementscore(score, team);
	newscore = game.stat[#"teamscores"][team];
	if(sessionmodeismultiplayergame())
	{
		mpteamobjscores = {#score:newscore, #diff:newscore - teamscore, #team:team, #gametime:function_f8d53445()};
		function_92d1707f(#"hash_22921c2c027fa389", mpteamobjscores);
	}
	if(teamscore == newscore)
	{
		return;
	}
	updateteamscores(team);
}

/*
	Name: postprocessteamscores
	Namespace: globallogic_score
	Checksum: 0xB14B4F85
	Offset: 0x5830
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function postprocessteamscores()
{
	onteamscore_postprocess();
	thread globallogic::checkscorelimit();
	thread globallogic::checkroundscorelimit();
}

/*
	Name: giveteamscoreforobjective
	Namespace: globallogic_score
	Checksum: 0xDE469F2F
	Offset: 0x5870
	Size: 0x18C
	Parameters: 2
	Flags: Linked
*/
function giveteamscoreforobjective(team, score)
{
	if(!isdefined(level.teams[team]))
	{
		return;
	}
	teamscore = game.stat[#"teamscores"][team];
	onteamscore(score, team);
	newscore = game.stat[#"teamscores"][team];
	if(sessionmodeismultiplayergame())
	{
		mpteamobjscores = {#score:newscore, #diff:newscore - teamscore, #team:team, #gametime:function_f8d53445()};
		function_92d1707f(#"hash_22921c2c027fa389", mpteamobjscores);
	}
	if(teamscore == newscore)
	{
		return;
	}
	updateteamscores(team);
	thread globallogic::checkscorelimit();
	thread globallogic::checkroundscorelimit();
	thread globallogic::checksuddendeathscorelimit(team);
}

/*
	Name: _setteamscore
	Namespace: globallogic_score
	Checksum: 0x3A2764E5
	Offset: 0x5A08
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function _setteamscore(team, teamscore)
{
	if(teamscore == game.stat[#"teamscores"][team])
	{
		return;
	}
	game.stat[#"teamscores"][team] = math::clamp(teamscore, 0, 1000000);
	updateteamscores(team);
	thread globallogic::checkscorelimit();
	thread globallogic::checkroundscorelimit();
}

/*
	Name: resetteamscores
	Namespace: globallogic_score
	Checksum: 0x24552097
	Offset: 0x5AB8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function resetteamscores()
{
	if(level.scoreroundwinbased || util::isfirstround())
	{
		foreach(team, _ in level.teams)
		{
			game.stat[#"teamscores"][team] = 0;
		}
	}
	updateallteamscores();
}

/*
	Name: resetallscores
	Namespace: globallogic_score
	Checksum: 0x3C0F7D4A
	Offset: 0x5B90
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function resetallscores()
{
	resetteamscores();
	resetplayerscores();
}

/*
	Name: resetplayerscores
	Namespace: globallogic_score
	Checksum: 0x602957E6
	Offset: 0x5BC0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function resetplayerscores()
{
	players = level.players;
	winner = undefined;
	tie = 0;
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i].pers[#"score"]))
		{
			_setplayerscore(players[i], 0);
		}
	}
}

/*
	Name: updateteamscores
	Namespace: globallogic_score
	Checksum: 0x6B386B96
	Offset: 0x5C60
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function updateteamscores(team)
{
	setteamscore(team, game.stat[#"teamscores"][team]);
	score = getteamscore(team);
	var_d0266750 = globallogic_utils::function_fd90317f(team, score);
	level thread globallogic::function_b6caec44(score, var_d0266750);
}

/*
	Name: updateallteamscores
	Namespace: globallogic_score
	Checksum: 0x7FBAA8B0
	Offset: 0x5D08
	Size: 0x88
	Parameters: 0
	Flags: Linked
*/
function updateallteamscores()
{
	foreach(_ in level.teams)
	{
		updateteamscores(team);
	}
}

/*
	Name: _getteamscore
	Namespace: globallogic_score
	Checksum: 0x58BD3C22
	Offset: 0x5D98
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function _getteamscore(team)
{
	return game.stat[#"teamscores"][team];
}

/*
	Name: gethighestteamscoreteam
	Namespace: globallogic_score
	Checksum: 0x3D3B2F4E
	Offset: 0x5DC8
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function gethighestteamscoreteam()
{
	score = 0;
	winning_teams = [];
	foreach(team, _ in level.teams)
	{
		team_score = game.stat[#"teamscores"][team];
		if(team_score > score)
		{
			score = team_score;
			winning_teams = [];
		}
		if(team_score == score)
		{
			winning_teams[team] = team;
		}
	}
	return winning_teams;
}

/*
	Name: areteamarraysequal
	Namespace: globallogic_score
	Checksum: 0x85E799AE
	Offset: 0x5EC0
	Size: 0xAA
	Parameters: 2
	Flags: Linked
*/
function areteamarraysequal(teamsa, teamsb)
{
	if(teamsa.size != teamsb.size)
	{
		return false;
	}
	foreach(team in teamsa)
	{
		if(!isdefined(teamsb[team]))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: onteamscore
	Namespace: globallogic_score
	Checksum: 0x71703C3B
	Offset: 0x5F78
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function onteamscore(score, team)
{
	onteamscore_incrementscore(score, team);
	onteamscore_postprocess();
}

/*
	Name: onteamscore_incrementscore
	Namespace: globallogic_score
	Checksum: 0x8423E6A8
	Offset: 0x5FC0
	Size: 0x176
	Parameters: 2
	Flags: Linked
*/
function onteamscore_incrementscore(score, team)
{
	game.stat[#"teamscores"][team] = game.stat[#"teamscores"][team] + score;
	if(game.stat[#"teamscores"][team] < 0)
	{
		game.stat[#"teamscores"][team] = 0;
	}
	if(level.clampscorelimit)
	{
		if(level.scorelimit && game.stat[#"teamscores"][team] > level.scorelimit)
		{
			game.stat[#"teamscores"][team] = level.scorelimit;
		}
		if(level.roundscorelimit && game.stat[#"teamscores"][team] > util::get_current_round_score_limit())
		{
			game.stat[#"teamscores"][team] = util::get_current_round_score_limit();
		}
	}
}

/*
	Name: function_e3a10376
	Namespace: globallogic_score
	Checksum: 0xFC9C126
	Offset: 0x6140
	Size: 0x268
	Parameters: 1
	Flags: Linked
*/
function function_e3a10376(winning_teams)
{
	if(winning_teams.size == 0)
	{
		return;
	}
	if(gettime() - level.laststatustime < 5000)
	{
		return;
	}
	if(areteamarraysequal(winning_teams, level.waswinning))
	{
		return;
	}
	if(winning_teams.size == 1)
	{
		level.laststatustime = gettime();
		foreach(team in winning_teams)
		{
			if(isdefined(level.waswinning[team]))
			{
				if(level.waswinning.size == 1)
				{
					continue;
				}
			}
			if((isdefined(level.var_e7b05b51) ? level.var_e7b05b51 : 1))
			{
				globallogic_audio::leader_dialog("gameLeadTaken", team, "status");
			}
		}
	}
	else
	{
		return;
	}
	if(level.waswinning.size == 1)
	{
		foreach(team in level.waswinning)
		{
			if(isdefined(winning_teams[team]))
			{
				if(winning_teams.size == 1)
				{
					continue;
				}
				if(level.waswinning.size > 1)
				{
					continue;
				}
			}
			if((isdefined(level.var_e7b05b51) ? level.var_e7b05b51 : 1))
			{
				globallogic_audio::leader_dialog("gameLeadLost", team, "status");
			}
		}
	}
	level.waswinning = winning_teams;
}

/*
	Name: onteamscore_postprocess
	Namespace: globallogic_score
	Checksum: 0x1162943
	Offset: 0x63B0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function onteamscore_postprocess()
{
	if(level.splitscreen)
	{
		return;
	}
	if(level.scorelimit == 1)
	{
		return;
	}
	iswinning = gethighestteamscoreteam();
	function_e3a10376(iswinning);
}

/*
	Name: default_onteamscore
	Namespace: globallogic_score
	Checksum: 0xB982BD88
	Offset: 0x6418
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function default_onteamscore(event, team)
{
	score = rank::getscoreinfovalue(event);
	/#
		assert(isdefined(score));
	#/
	onteamscore(score, team);
}

/*
	Name: initpersstat
	Namespace: globallogic_score
	Checksum: 0x6E674A81
	Offset: 0x6490
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function initpersstat(dataname, record_stats)
{
	if(!isdefined(self.pers[dataname]))
	{
		self.pers[dataname] = 0;
	}
	if(!isdefined(record_stats) || record_stats == 1)
	{
		recordplayerstats(self, dataname, int(self.pers[dataname]));
	}
}

/*
	Name: getpersstat
	Namespace: globallogic_score
	Checksum: 0x4E867DCF
	Offset: 0x6528
	Size: 0x18
	Parameters: 1
	Flags: Linked
*/
function getpersstat(dataname)
{
	return self.pers[dataname];
}

/*
	Name: incpersstat
	Namespace: globallogic_score
	Checksum: 0xC5A6BD90
	Offset: 0x6548
	Size: 0xD6
	Parameters: 4
	Flags: Linked
*/
function incpersstat(dataname, increment, record_stats, includegametype)
{
	pixbeginevent();
	if(isdefined(self.pers[dataname]))
	{
		self.pers[dataname] = self.pers[dataname] + increment;
	}
	if(includegametype === 1)
	{
		self stats::function_bb7eedf0(dataname, increment);
	}
	else
	{
		self stats::function_dad108fa(dataname, increment);
	}
	if(record_stats !== 0)
	{
		self thread threadedrecordplayerstats(dataname);
	}
	pixendevent();
}

/*
	Name: threadedrecordplayerstats
	Namespace: globallogic_score
	Checksum: 0x7BF61D90
	Offset: 0x6628
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function threadedrecordplayerstats(dataname)
{
	self endon(#"disconnect");
	waittillframeend();
	if(isdefined(self) && isdefined(self.pers) && isdefined(self.pers[dataname]))
	{
		recordplayerstats(self, dataname, self.pers[dataname]);
	}
}

/*
	Name: updatewinstats
	Namespace: globallogic_score
	Checksum: 0x52BB958
	Offset: 0x66A8
	Size: 0x524
	Parameters: 1
	Flags: Linked
*/
function updatewinstats(winner)
{
	winner stats::function_bb7eedf0(#"losses", -1);
	winner.pers[#"outcome"] = #"win";
	winner stats::function_bb7eedf0(#"wins", 1);
	if(level.rankedmatch && !level.disablestattracking && sessionmodeismultiplayergame())
	{
		if(winner stats::function_441050ca(#"wins") >= 50)
		{
			winner giveachievement(#"hash_ed510979375c908");
		}
	}
	if(level.hardcoremode)
	{
		winner stats::function_dad108fa(#"wins_hc", 1);
		winner updatestatratio("wlratio_hc", "wins_hc", "losses_hc");
	}
	else if(!level.arenamatch)
	{
		winner stats::function_dad108fa(#"hash_14d06f640b771fb8", 1);
	}
	if(level.arenamatch)
	{
		winner stats::function_dad108fa(#"hash_1c95b400490ba23a", 1);
	}
	if(level.multiteam)
	{
		winner stats::function_dad108fa(#"wins_multiteam", 1);
	}
	winner updatestatratio("wlratio", "wins", "losses");
	restorewinstreaks(winner);
	if(level.hardcoremode === 1)
	{
		winner stats::function_bb7eedf0(#"hash_4a226bdcff995085", 1);
	}
	else
	{
		winner stats::function_bb7eedf0(#"cur_win_streak", 1);
	}
	winner notify(#"win");
	winner.lootxpmultiplier = 1;
	cur_gamemode_win_streak = winner stats::function_ed81f25e(#"cur_win_streak");
	gamemode_win_streak = winner stats::function_ed81f25e(#"win_streak");
	var_845aa849 = (level.hardcoremode === 1 ? winner stats::function_441050ca(#"hash_55658382e18b3ec8") : winner stats::function_441050ca(#"hash_5778f54a3c432314"));
	cur_win_streak = winner stats::function_441050ca(#"cur_win_streak");
	if(isdefined(cur_win_streak) && isdefined(var_845aa849) && cur_win_streak > var_845aa849)
	{
		if(level.hardcoremode === 1)
		{
			winner stats::function_4db3fba1(#"hash_55658382e18b3ec8", cur_win_streak);
		}
		else
		{
			winner stats::function_4db3fba1(#"hash_5778f54a3c432314", cur_win_streak);
		}
	}
	if(isdefined(cur_gamemode_win_streak) && isdefined(gamemode_win_streak) && cur_gamemode_win_streak > gamemode_win_streak)
	{
		winner stats::function_baa25a23(#"win_streak", cur_gamemode_win_streak);
	}
	if(bot::is_bot_ranked_match())
	{
		combattrainingwins = winner stats::get_stat(#"combattrainingwins");
		winner stats::set_stat(#"combattrainingwins", combattrainingwins + 1);
	}
	if(level.var_73e51905 === 1)
	{
		winner stats::function_dad108fa(#"hash_56a0e77eea02664d", 1);
	}
	updateweaponcontractwin(winner);
	updatecontractwin(winner);
}

/*
	Name: canupdateweaponcontractstats
	Namespace: globallogic_score
	Checksum: 0x76B81C32
	Offset: 0x6BD8
	Size: 0x56
	Parameters: 0
	Flags: Linked
*/
function canupdateweaponcontractstats()
{
	if(getdvarint(#"enable_weapon_contract", 0) == 0)
	{
		return false;
	}
	if(!level.rankedmatch && !level.arenamatch)
	{
		return false;
	}
	return true;
}

/*
	Name: updateweaponcontractstart
	Namespace: globallogic_score
	Checksum: 0x3F6D7F51
	Offset: 0x6C38
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function updateweaponcontractstart(player)
{
	if(!canupdateweaponcontractstats())
	{
		return;
	}
	if(player stats::get_stat(#"weaponcontractdata", #"starttimestamp") == 0)
	{
		player stats::set_stat(#"weaponcontractdata", #"starttimestamp", getutc());
	}
}

/*
	Name: updateweaponcontractwin
	Namespace: globallogic_score
	Checksum: 0x755F36E6
	Offset: 0x6CE0
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function updateweaponcontractwin(winner)
{
	if(!canupdateweaponcontractstats())
	{
		return;
	}
	matcheswon = winner stats::get_stat(#"weaponcontractdata", #"currentvalue") + 1;
	winner stats::set_stat(#"weaponcontractdata", #"currentvalue", matcheswon);
	if((isdefined(winner stats::get_stat(#"weaponcontractdata", #"completetimestamp")) ? winner stats::get_stat(#"weaponcontractdata", #"completetimestamp") : 0) == 0)
	{
		targetvalue = getdvarint(#"weapon_contract_target_value", 100);
		if(matcheswon >= targetvalue)
		{
			winner stats::set_stat(#"weaponcontractdata", #"completetimestamp", getutc());
		}
	}
}

/*
	Name: updateweaponcontractplayed
	Namespace: globallogic_score
	Checksum: 0xB7EAB219
	Offset: 0x6E70
	Size: 0x128
	Parameters: 0
	Flags: Linked
*/
function updateweaponcontractplayed()
{
	if(!canupdateweaponcontractstats())
	{
		return;
	}
	foreach(player in level.players)
	{
		if(!isdefined(player))
		{
			continue;
		}
		if(!isdefined(player.pers[#"team"]))
		{
			continue;
		}
		matchesplayed = player stats::get_stat(#"weaponcontractdata", #"matchesplayed") + 1;
		player stats::set_stat(#"weaponcontractdata", #"matchesplayed", matchesplayed);
	}
}

/*
	Name: updatecontractwin
	Namespace: globallogic_score
	Checksum: 0xFE8F414C
	Offset: 0x6FA0
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function updatecontractwin(winner)
{
	if(!isdefined(level.updatecontractwinevents))
	{
		return;
	}
	foreach(contractwinevent in level.updatecontractwinevents)
	{
		if(!isdefined(contractwinevent))
		{
			continue;
		}
		[[contractwinevent]](winner);
	}
}

/*
	Name: registercontractwinevent
	Namespace: globallogic_score
	Checksum: 0xCBF2E7F2
	Offset: 0x7050
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function registercontractwinevent(event)
{
	if(!isdefined(level.updatecontractwinevents))
	{
		level.updatecontractwinevents = [];
	}
	if(!isdefined(level.updatecontractwinevents))
	{
		level.updatecontractwinevents = [];
	}
	else if(!isarray(level.updatecontractwinevents))
	{
		level.updatecontractwinevents = array(level.updatecontractwinevents);
	}
	level.updatecontractwinevents[level.updatecontractwinevents.size] = event;
}

/*
	Name: updatelossstats
	Namespace: globallogic_score
	Checksum: 0xCF5B68D1
	Offset: 0x7100
	Size: 0x100
	Parameters: 1
	Flags: Linked
*/
function updatelossstats(loser)
{
	loser.pers[#"outcome"] = #"loss";
	loser stats::function_bb7eedf0(#"losses", 1);
	loser updatestatratio("wlratio", "wins", "losses");
	if(level.hardcoremode)
	{
		loser stats::function_bb7eedf0(#"losses_hc", 1);
		loser updatestatratio("wlratio_hc", "wins_hc", "losses_hc");
	}
	loser notify(#"loss");
}

/*
	Name: updatelosslatejoinstats
	Namespace: globallogic_score
	Checksum: 0x206296E7
	Offset: 0x7208
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function updatelosslatejoinstats(loser)
{
	loser stats::function_bb7eedf0(#"losses", -1);
	loser stats::function_bb7eedf0(#"losses_late_join", 1);
	loser updatestatratio("wlratio", "wins", "losses");
	if(level.hardcoremode)
	{
		loser stats::function_bb7eedf0(#"losses_hc", -1);
		loser updatestatratio("wlratio_hc", "wins_hc", "losses_hc");
	}
}

/*
	Name: updatetiestats
	Namespace: globallogic_score
	Checksum: 0x3774F4F5
	Offset: 0x7300
	Size: 0x1F0
	Parameters: 1
	Flags: Linked
*/
function updatetiestats(loser)
{
	loser stats::function_bb7eedf0(#"losses", -1);
	loser.pers[#"outcome"] = #"draw";
	loser stats::function_bb7eedf0(#"ties", 1);
	loser updatestatratio("wlratio", "wins", "losses");
	if(level.hardcoremode)
	{
		loser stats::function_bb7eedf0(#"losses_hc", -1);
		loser stats::function_bb7eedf0(#"hash_6fe9f5043ed146ae", 1);
		loser updatestatratio("wlratio_hc", "wins_hc", "losses_hc");
	}
	if(!level.disablestattracking)
	{
		if(level.hardcoremode === 1)
		{
			loser stats::function_4db3fba1(#"hash_4a226bdcff995085", 0);
		}
		else
		{
			loser stats::function_4db3fba1(#"cur_win_streak", 0);
		}
		if(level.var_73e51905 === 1)
		{
			loser stats::function_4db3fba1(#"hash_56a0e77eea02664d", 0);
		}
	}
	loser notify(#"tie");
}

/*
	Name: updatewinlossstats
	Namespace: globallogic_score
	Checksum: 0x11BB5572
	Offset: 0x74F8
	Size: 0x6C8
	Parameters: 0
	Flags: Linked
*/
function updatewinlossstats()
{
	if(!util::waslastround() && !level.hostforcedend)
	{
		return;
	}
	players = level.players;
	updateweaponcontractplayed();
	if(match::function_75f97ac7())
	{
		if(level.hostforcedend && match::function_517c0ce0())
		{
			return;
		}
		winner = match::function_9b24638f();
		updatewinstats(winner);
		if(!level.teambased)
		{
			placement = level.placement[#"all"];
			var_ced71946 = min(function_d68cdc5d(), placement.size);
			for(index = 1; index < var_ced71946; index++)
			{
				nexttopplayer = placement[index];
				updatewinstats(nexttopplayer);
			}
			foreach(player in players)
			{
				if(winner == player)
				{
					continue;
				}
				for(index = 1; index < var_ced71946; index++)
				{
					if(player == placement[index])
					{
						break;
					}
				}
				if(index < var_ced71946)
				{
					continue;
				}
				if(level.rankedmatch && !level.leaguematch && player.pers[#"latejoin"] === 1)
				{
					updatelosslatejoinstats(player);
				}
			}
		}
	}
	else
	{
		if(function_d68cdc5d() > 1)
		{
			var_96974d12 = min(function_d68cdc5d(), level.var_eed7c027.size);
			foreach(ranking in level.var_eed7c027)
			{
				if(ranking <= var_96974d12)
				{
					winners = getplayers(team);
					foreach(winner in winners)
					{
						updatewinstats(winner);
					}
				}
			}
		}
		else
		{
			if(match::function_5f24faac("tie"))
			{
				foreach(player in players)
				{
					if(!isdefined(player.pers[#"team"]))
					{
						continue;
					}
					if(level.hostforcedend && player ishost())
					{
						continue;
					}
					updatetiestats(player);
				}
			}
			else
			{
				foreach(player in players)
				{
					if(!isdefined(player.pers[#"team"]))
					{
						continue;
					}
					if(level.hostforcedend && player ishost())
					{
						continue;
					}
					if(match::function_5f24faac("tie"))
					{
						updatetiestats(player);
						continue;
					}
					if(match::function_a2b53e17(player))
					{
						updatewinstats(player);
						continue;
					}
					if(level.rankedmatch && !level.leaguematch && player.pers[#"latejoin"] === 1)
					{
						updatelosslatejoinstats(player);
					}
					if(!level.disablestattracking)
					{
						if(level.hardcoremode === 1)
						{
							player stats::function_4db3fba1(#"hash_4a226bdcff995085", 0);
						}
						else
						{
							player stats::function_4db3fba1(#"cur_win_streak", 0);
						}
						if(level.var_73e51905 === 1)
						{
							player stats::function_4db3fba1(#"hash_56a0e77eea02664d", 0);
						}
					}
				}
			}
		}
	}
}

/*
	Name: backupandclearwinstreaks
	Namespace: globallogic_score
	Checksum: 0xC94DBC31
	Offset: 0x7BC8
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function backupandclearwinstreaks()
{
	if(is_true(level.freerun))
	{
		return;
	}
	self.pers[#"winstreak"] = self stats::function_441050ca(#"cur_win_streak");
	if(!level.disablestattracking)
	{
		if(level.hardcoremode === 1)
		{
			self.pers[#"hash_5396d3210ae83d7a"] = self stats::function_441050ca(#"hash_4a226bdcff995085");
			self stats::function_4db3fba1(#"hash_4a226bdcff995085", 0);
		}
		else
		{
			self stats::function_4db3fba1(#"cur_win_streak", 0);
		}
		if(level.var_73e51905 === 1)
		{
			self.pers[#"hash_130610255352357c"] = self stats::function_441050ca(#"hash_56a0e77eea02664d");
			self stats::function_4db3fba1(#"hash_56a0e77eea02664d", 0);
		}
	}
	self.pers[#"winstreakforgametype"] = self stats::function_ed81f25e(#"cur_win_streak");
	self stats::function_baa25a23(#"cur_win_streak", 0);
}

/*
	Name: restorewinstreaks
	Namespace: globallogic_score
	Checksum: 0x9819203F
	Offset: 0x7D98
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function restorewinstreaks(winner)
{
	if(!level.disablestattracking)
	{
		winner stats::function_4db3fba1(#"cur_win_streak", winner.pers[#"winstreak"]);
		if(level.var_73e51905 === 1)
		{
			winner stats::function_4db3fba1(#"hash_56a0e77eea02664d", winner.pers[#"hash_130610255352357c"]);
		}
		if(level.hardcoremode === 1)
		{
			winner stats::function_4db3fba1(#"hash_4a226bdcff995085", winner.pers[#"hash_5396d3210ae83d7a"]);
		}
	}
	winner stats::function_baa25a23(#"cur_win_streak", (isdefined(winner.pers[#"winstreakforgametype"]) ? winner.pers[#"winstreakforgametype"] : 0));
}

/*
	Name: inckillstreaktracker
	Namespace: globallogic_score
	Checksum: 0x11DC0841
	Offset: 0x7EF8
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function inckillstreaktracker(weapon)
{
	self endon(#"disconnect");
	waittillframeend();
	if(weapon.name == #"artillery")
	{
		self.pers[#"artillery_kills"]++;
	}
	if(weapon.name == #"dog_bite")
	{
		self.pers[#"dog_kills"]++;
	}
}

/*
	Name: trackattackerkill
	Namespace: globallogic_score
	Checksum: 0xB986F700
	Offset: 0x7F88
	Size: 0x28C
	Parameters: 6
	Flags: Linked
*/
function trackattackerkill(name, rank, xp, prestige, xuid, weapon)
{
	self endon(#"disconnect");
	attacker = self;
	waittillframeend();
	pixbeginevent();
	if(!isdefined(attacker.pers[#"killed_players"][name]))
	{
		attacker.pers[#"killed_players"][name] = 0;
	}
	if(!isdefined(attacker.pers[#"killed_players_with_specialist"][name]))
	{
		attacker.pers[#"killed_players_with_specialist"][name] = 0;
	}
	if(!isdefined(attacker.killedplayerscurrent[name]))
	{
		attacker.killedplayerscurrent[name] = 0;
	}
	attacker.pers[#"killed_players"][name]++;
	attacker.killedplayerscurrent[name]++;
	if(weapon.isheavyweapon)
	{
		attacker.pers[#"killed_players_with_specialist"][name]++;
	}
	if(attacker.pers[#"nemesis_name"] == name)
	{
		attacker challenges::killednemesis();
	}
	attacker function_e7b4c25c(name, 1.5, rank, prestige, xp, xuid);
	if(!isdefined(attacker.lastkilledvictim) || !isdefined(attacker.lastkilledvictimcount))
	{
		attacker.lastkilledvictim = name;
		attacker.lastkilledvictimcount = 0;
	}
	if(attacker.lastkilledvictim == name)
	{
		attacker.lastkilledvictimcount++;
		if(attacker.lastkilledvictimcount >= 5)
		{
			attacker.lastkilledvictimcount = 0;
			attacker stats::function_dad108fa(#"streaker", 1);
		}
	}
	else
	{
		attacker.lastkilledvictim = name;
		attacker.lastkilledvictimcount = 1;
	}
	pixendevent();
}

/*
	Name: trackattackeedeath
	Namespace: globallogic_score
	Checksum: 0x340689BA
	Offset: 0x8220
	Size: 0x216
	Parameters: 5
	Flags: Linked
*/
function trackattackeedeath(attackername, rank, xp, prestige, xuid)
{
	self endon(#"disconnect");
	waittillframeend();
	pixbeginevent();
	if(!isdefined(self.pers[#"killed_by"][attackername]))
	{
		self.pers[#"killed_by"][attackername] = 0;
	}
	self.pers[#"killed_by"][attackername]++;
	self function_e7b4c25c(attackername, 1.5, rank, prestige, xp, xuid);
	if(self.pers[#"nemesis_name"] == attackername && self.pers[#"nemesis_tracking"][attackername].value >= 2)
	{
		self setclientuivisibilityflag("killcam_nemesis", 1);
	}
	else
	{
		self setclientuivisibilityflag("killcam_nemesis", 0);
	}
	selfkillstowardsattacker = 0;
	if(isdefined(self.pers[#"killed_players"][attackername]))
	{
		selfkillstowardsattacker = self.pers[#"killed_players"][attackername];
	}
	self luinotifyevent(#"track_victim_death", 2, self.pers[#"killed_by"][attackername], selfkillstowardsattacker);
	pixendevent();
}

/*
	Name: default_iskillboosting
	Namespace: globallogic_score
	Checksum: 0x39DEE230
	Offset: 0x8440
	Size: 0x6
	Parameters: 0
	Flags: Linked
*/
function default_iskillboosting()
{
	return false;
}

/*
	Name: givekillstats
	Namespace: globallogic_score
	Checksum: 0xE95A0FA4
	Offset: 0x8450
	Size: 0x9F6
	Parameters: 4
	Flags: Linked
*/
function givekillstats(smeansofdeath, weapon, evictim, var_e7a369ea)
{
	self endon(#"disconnect");
	if(self === var_e7a369ea)
	{
		self.kills = self.kills + 1;
	}
	laststandparams = undefined;
	if(isdefined(evictim))
	{
		laststandparams = evictim.laststandparams;
	}
	waittillframeend();
	if(level.rankedmatch && self [[level.iskillboosting]]())
	{
		/#
			self iprintlnbold("");
		#/
		return;
	}
	pixbeginevent();
	if(self === var_e7a369ea)
	{
		self activecamo::function_896ac347(weapon, #"kills", 1);
		self incpersstat(#"kills", 1, 1, 1);
		self.kills = self getpersstat(#"kills");
		self updatestatratio("kdratio", "kills", "deaths");
		if(level.hardcoremode === 1)
		{
			self incpersstat(#"kills_hc", 1, 1, 1);
			self updatestatratio("kdratio_hc", "kills_hc", "deaths_hc");
		}
		if(isdefined(evictim) && isplayer(evictim) && isdefined(evictim.attackerdamage))
		{
			if(isarray(evictim.attackerdamage) && isdefined(self.clientid) && isdefined(evictim.attackerdamage[self.clientid]) && evictim.attackerdamage.size == 1)
			{
				stats::function_dad108fa(#"hash_7333f2fa3df0ea1d", 1);
			}
		}
		if(isdefined(self.origin) && isdefined(evictim.origin))
		{
			var_40fd58bf = distancesquared(self.origin, evictim.origin) * 0.0006451613;
			if(var_40fd58bf >= sqr(60))
			{
				var_74e5763 = 4;
			}
			else
			{
				if(var_40fd58bf >= sqr(40))
				{
					var_74e5763 = 3;
				}
				else
				{
					if(var_40fd58bf >= sqr(20))
					{
						var_74e5763 = 2;
					}
					else
					{
						if(var_40fd58bf >= sqr(10))
						{
							var_74e5763 = 1;
						}
						else
						{
							var_74e5763 = 0;
						}
					}
				}
			}
			self stats::function_6cdd992f(weapon.name, var_74e5763, 1);
		}
		if(sessionmodeismultiplayergame() && self armor::has_armor())
		{
			self stats::function_8fb23f94("weapon_armor", #"hash_17a762e313abb2d3", 1);
			self stats::function_b04e7184("weapon_armor", #"best_kills");
		}
		if(isdefined(level.var_c8453874))
		{
			[[level.var_c8453874]](self, evictim, laststandparams);
		}
		vehicle = self getvehicleoccupied();
		if(isvehicle(vehicle) && vehicle.isphysicsvehicle)
		{
			seat = vehicle getoccupantseat(self);
			if(isdefined(seat))
			{
				if(vehicle player_vehicle::function_f89e1149(seat))
				{
					self stats::function_dad108fa(#"hash_5e4a783a0ecd18a4", 1);
				}
				if(seat > 0)
				{
					self stats::function_dad108fa(#"hash_5b470a9caffc584a", 1);
				}
				if(self.var_9ff5ff83 !== 1)
				{
					var_ec0d09fe = self stats::function_441050ca(#"hash_5e4a783a0ecd18a4");
					var_cb26d060 = self stats::function_441050ca(#"hash_5b470a9caffc584a");
					if((var_ec0d09fe + var_cb26d060) >= 100)
					{
						self giveachievement(#"hash_284d0b2a070bfb79");
						self.var_9ff5ff83 = 1;
					}
				}
			}
		}
	}
	if(isdefined(evictim) && isplayer(evictim))
	{
		self incpersstat(#"ekia", 1, 1, 1);
		self stats::function_e24eec31(weapon, #"ekia", 1);
		self stats::function_e24eec31(weapon, #"hash_14b7133a39a0456e", 1);
		self stats::function_e24eec31(weapon, #"hash_497df827743010c3", 1);
		self stats::function_e24eec31(weapon, #"hash_67536f932f6aeb36", 1);
		self stats::function_80099ca1(weapon.name, #"hash_695f66aa9455e172");
		var_bb166c5e = stats::function_3f64434(weapon);
		self stats::function_6fb0b113(var_bb166c5e, #"hash_695f66aa9455e172");
		if(level.hardcoremode === 1)
		{
			self incpersstat(#"hash_d743e7d31079bad", 1, 1, 1);
		}
		self contracts::player_contract_event(#"ekia", weapon, evictim);
		self.ekia = self getpersstat(#"ekia");
		self function_863d9af1(weapon);
		if(self.var_ba29f4f6 !== 1 && self stats::function_441050ca(#"ekia") >= 200)
		{
			self giveachievement(#"hash_5f4e85a66456e98b");
			self.var_ba29f4f6 = 1;
		}
	}
	attacker = self;
	if(smeansofdeath === "MOD_HEAD_SHOT" && !killstreaks::is_killstreak_weapon(weapon))
	{
		self activecamo::function_896ac347(weapon, #"headshots", 1);
		attacker thread incpersstat(#"headshots", 1, 1, 0);
		attacker.headshots = attacker.pers[#"headshots"];
		if(isdefined(evictim))
		{
			level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"headshot", #player:evictim});
		}
		if((attacker.headshots % 5) == 0)
		{
			self contracts::function_a54e2068(#"hash_ca75e54eb5e5ef8");
		}
		attacker stats::function_dad108fa(#"hash_185c3c78ebc24268", 1);
	}
	pixendevent();
}

/*
	Name: setinflictorstat
	Namespace: globallogic_score
	Checksum: 0x68078A1A
	Offset: 0x8E50
	Size: 0x1A4
	Parameters: 3
	Flags: Linked
*/
function setinflictorstat(einflictor, eattacker, weapon)
{
	if(!isdefined(eattacker))
	{
		return;
	}
	weaponpickedup = 0;
	if(isdefined(eattacker.pickedupweapons) && isdefined(eattacker.pickedupweapons[weapon]))
	{
		weaponpickedup = 1;
	}
	if(!isdefined(einflictor))
	{
		eattacker stats::function_eec52333(weapon, #"hits", 1, eattacker.class_num, weaponpickedup);
		return;
	}
	if(!isdefined(einflictor.playeraffectedarray))
	{
		einflictor.playeraffectedarray = [];
	}
	foundnewplayer = 1;
	for(i = 0; i < einflictor.playeraffectedarray.size; i++)
	{
		if(einflictor.playeraffectedarray[i] == self)
		{
			foundnewplayer = 0;
			break;
		}
	}
	if(foundnewplayer)
	{
		einflictor.playeraffectedarray[einflictor.playeraffectedarray.size] = self;
		if(weapon.rootweapon.name == "tabun_gas")
		{
			eattacker stats::function_e24eec31(weapon, #"used", 1);
		}
		eattacker stats::function_eec52333(weapon, #"hits", 1, eattacker.class_num, weaponpickedup);
	}
}

/*
	Name: processshieldassist
	Namespace: globallogic_score
	Checksum: 0xA41DF7AD
	Offset: 0x9000
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function processshieldassist(killedplayer)
{
	self endon(#"disconnect");
	killedplayer endon(#"disconnect");
	waitframe(1);
	util::waittillslowprocessallowed();
	if(!isdefined(level.teams[self.pers[#"team"]]))
	{
		return;
	}
	if(self.pers[#"team"] == killedplayer.pers[#"team"])
	{
		return;
	}
	if(!level.teambased)
	{
		return;
	}
	self incpersstat(#"assists", 1, 1, 1);
	self.assists = self getpersstat(#"assists");
	currentweapon = self getcurrentweapon();
	scoreevents::processscoreevent(#"shield_assist", self, killedplayer, currentweapon);
}

/*
	Name: function_b1a3b359
	Namespace: globallogic_score
	Checksum: 0xB4BF3BEB
	Offset: 0x9160
	Size: 0x33C
	Parameters: 4
	Flags: Linked
*/
function function_b1a3b359(killedplayer, damagedone, weapon, assist_level)
{
	self endon(#"disconnect");
	killedplayer endon(#"disconnect");
	if(!isdefined(level.teams[self.pers[#"team"]]))
	{
		return;
	}
	if(self.pers[#"team"] == killedplayer.pers[#"team"])
	{
		return;
	}
	if(!level.teambased)
	{
		return;
	}
	assist_level = "assist";
	assist_level_value = int(ceil(damagedone / 25));
	if(assist_level_value < 1)
	{
		assist_level_value = 1;
	}
	else if(assist_level_value > 3)
	{
		assist_level_value = 3;
	}
	assist_level = (assist_level + "_") + (assist_level_value * 25);
	self incpersstat(#"assists", 1, 1, 1);
	self.assists = self getpersstat(#"assists");
	if(isdefined(weapon))
	{
		weaponpickedup = 0;
		if(isdefined(self.pickedupweapons) && isdefined(self.pickedupweapons[weapon]))
		{
			weaponpickedup = 1;
		}
		self stats::function_eec52333(weapon, #"assists", 1, self.class_num, weaponpickedup);
	}
	if(!level.var_724cf71)
	{
		switch(weapon.name)
		{
			case "hash_577b41452577c37f":
			case "concussion_grenade":
			{
				assist_level = "assist_concussion";
				break;
			}
			case "hash_af1a40bb1375dab":
			case "flash_grenade":
			{
				assist_level = "assist_flash";
				break;
			}
			case "hash_4cd586d22c20b3cf":
			case "emp_grenade":
			{
				assist_level = "assist_emp";
				break;
			}
			case "proximity_grenade":
			case "proximity_grenade_aoe":
			{
				assist_level = "assist_proximity";
				break;
			}
		}
		self challenges::assisted();
		scoreevents::processscoreevent(assist_level, self, killedplayer, weapon);
	}
	else
	{
		self challenges::function_57ca42c6(weapon);
	}
}

/*
	Name: function_672746e0
	Namespace: globallogic_score
	Checksum: 0xA76F8D7D
	Offset: 0x94A8
	Size: 0xC0
	Parameters: 3
	Flags: Linked
*/
function function_672746e0(attacker, inflictor, weapon)
{
	if(!isdefined(weapon) || !isdefined(weapon.team) || self util::isenemyplayer(weapon) == 0)
	{
		return false;
	}
	if(self == weapon || (weapon.classname == "trigger_hurt" || weapon.classname == "worldspawn"))
	{
		return false;
	}
	if(weapon.team == #"spectator")
	{
		return false;
	}
	return true;
}

/*
	Name: function_c2ea00b2
	Namespace: globallogic_score
	Checksum: 0x906F9459
	Offset: 0x9570
	Size: 0x19C
	Parameters: 3
	Flags: Linked
*/
function function_c2ea00b2(attacker, inflictor, weapon)
{
	if(!function_672746e0(attacker, inflictor, weapon))
	{
		return;
	}
	params = {#weapon:weapon, #inflictor:inflictor, #attacker:attacker, #players:[]};
	foreach(player in getplayers())
	{
		if(util::function_fbce7263(player.team, attacker.team))
		{
			continue;
		}
		if(player == attacker)
		{
			continue;
		}
		if(player.sessionstate != "playing")
		{
			continue;
		}
		params.players[player getentitynumber()] = player;
	}
	callback::callback(#"hash_7c6da2f2c9ef947a", params);
}

/*
	Name: function_9779ac61
	Namespace: globallogic_score
	Checksum: 0xFE2BB88D
	Offset: 0x9718
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_9779ac61()
{
	if(level.scoreroundwinbased)
	{
		if(level.teambased)
		{
			foreach(team, _ in level.teams)
			{
				[[level._setteamscore]](team, game.stat[#"roundswon"][team]);
			}
		}
	}
}

/*
	Name: function_e7b4c25c
	Namespace: globallogic_score
	Checksum: 0xF79360B
	Offset: 0x97E0
	Size: 0x2E4
	Parameters: 6
	Flags: Linked
*/
function function_e7b4c25c(nemesis_name, value, nemesis_rank, var_15574043, nemesis_xp, nemesis_xuid)
{
	if(!isdefined(self.pers[#"nemesis_tracking"][nemesis_name]))
	{
		self.pers[#"nemesis_tracking"][nemesis_name] = {#value:0, #name:nemesis_name};
	}
	self.pers[#"nemesis_tracking"][nemesis_name].value = self.pers[#"nemesis_tracking"][nemesis_name].value + value;
	var_b5c193c6 = self.pers[#"nemesis_tracking"][self.pers[#"nemesis_name"]];
	if(self.pers[#"nemesis_name"] == "" || !isdefined(var_b5c193c6) || self.pers[#"nemesis_tracking"][nemesis_name].value > var_b5c193c6.value)
	{
		/#
			assert(isdefined(nemesis_name), "" + self.name);
		#/
		/#
			assert(isstring(nemesis_name), (("" + nemesis_name) + "") + self.name);
		#/
		self.pers[#"nemesis_name"] = nemesis_name;
		self.pers[#"nemesis_rank"] = nemesis_rank;
		self.pers[#"nemesis_rankicon"] = var_15574043;
		self.pers[#"nemesis_xp"] = nemesis_xp;
		self.pers[#"nemesis_xuid"] = nemesis_xuid;
	}
	else if(isdefined(self.pers[#"nemesis_name"]) && self.pers[#"nemesis_name"] == nemesis_name)
	{
		self.pers[#"nemesis_rank"] = nemesis_rank;
		self.pers[#"nemesis_xp"] = nemesis_xp;
	}
}

/*
	Name: function_30ab51a4
	Namespace: globallogic_score
	Checksum: 0xA837D57F
	Offset: 0x9AD0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_30ab51a4(params)
{
	if(isdefined(self) && isdefined(self.pers))
	{
		self.pers[#"hash_49e7469988944ecf"] = undefined;
		self.pers[#"hash_53919d92ff1d039"] = undefined;
	}
}

/*
	Name: function_253ff387
	Namespace: globallogic_score
	Checksum: 0xE41E8F65
	Offset: 0x9B30
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_253ff387(params)
{
	if(params.var_b66879ad === 0)
	{
		return;
	}
	function_30ab51a4(params);
}

