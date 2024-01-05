#using script_725554a59d6a75b9;
#using script_6d9bde564029bdf6;
#using script_396f7d71538c9677;
#using script_1f17c601c8e8824c;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace battlechatter;

/*
	Name: __init__system__
	Namespace: battlechatter
	Checksum: 0x6EB74D9B
	Offset: 0x458
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"battlechatter", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: battlechatter
	Checksum: 0xE01B5A8C
	Offset: 0x4A0
	Size: 0x408
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	/#
		level thread devgui_think();
	#/
	callback::on_spawned(&on_player_spawned);
	callback::function_33f0ddd3(&function_33f0ddd3);
	callback::on_game_playing(&function_9cc82a74);
	if(is_true(level.teambased) && !isdefined(game.boostplayerspicked))
	{
		game.boostplayerspicked = [];
		foreach(team, _ in level.teams)
		{
			game.boostplayerspicked[team] = 0;
		}
	}
	level.allowbattlechatter[#"bc"] = currentsessionmode() != 4 && (isdefined(getgametypesetting(#"allowbattlechatter")) ? getgametypesetting(#"allowbattlechatter") : 0);
	mpdialog = getscriptbundle("mpdialog_default");
	if(!isdefined(mpdialog))
	{
		mpdialog = spawnstruct();
	}
	level.var_3602c1be = &playkillbattlechatter;
	level.allowspecialistdialog = (isdefined(mpdialog.enableherodialog) ? mpdialog.enableherodialog : 0) && is_true(level.allowbattlechatter[#"bc"]);
	level.playstartconversation = (isdefined(mpdialog.enableconversation) ? mpdialog.enableconversation : 0) && is_true(level.allowbattlechatter[#"bc"]);
	level.var_add8e0f2 = [10:#"trophy_system", 9:#"land_mine", 8:#"hatchet", 7:#"satchel_charge", 6:#"eq_molotov", 5:#"nightingale", 4:#"willy_pete", 3:#"eq_slow_grenade", 2:#"eq_flash_grenade", 1:#"eq_sticky_grenade", 0:#"frag_grenade"];
	level.var_648e79b7 = [];
	level.var_75aa0434 = [];
	level.var_e444d44 = 1;
}

/*
	Name: on_player_spawned
	Namespace: battlechatter
	Checksum: 0x471646E2
	Offset: 0x8B0
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self.enemythreattime = 0;
	self.heartbeatsnd = 0;
	self.soundmod = "player";
	self.voxunderwatertime = 0;
	self.voxemergebreath = 0;
	self.voxdrowning = 0;
	self.pilotisspeaking = 0;
	self.playingdialog = 0;
	self.playinggadgetreadydialog = 0;
	self.var_6765d33e = 0;
	self.playedgadgetsuccess = 1;
	self.var_d853c1af = function_58c93260(self).var_d853c1af;
	level.var_648e79b7[self getentitynumber()] = undefined;
	self callback::add_callback("weapon_melee", &function_90cedf5b);
}

/*
	Name: function_33f0ddd3
	Namespace: battlechatter
	Checksum: 0x4D5E9DD0
	Offset: 0x9A8
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_33f0ddd3(eventstruct)
{
	self.var_d853c1af = function_58c93260(self).var_d853c1af;
}

/*
	Name: wait_play_dialog
	Namespace: battlechatter
	Checksum: 0xBD480515
	Offset: 0x9E8
	Size: 0xA4
	Parameters: 6
	Flags: None
*/
function wait_play_dialog(waittime, dialogkey, dialogflags, dialogbuffer, enemy, endnotify)
{
	self endon(#"death");
	level endon(#"game_ended");
	if(isdefined(waittime) && waittime > 0)
	{
		if(isdefined(endnotify))
		{
			self endon(endnotify);
		}
		wait(waittime);
	}
	self thread play_dialog(dialogkey, dialogflags, dialogbuffer, enemy);
}

/*
	Name: function_f57e565f
	Namespace: battlechatter
	Checksum: 0x37174AF
	Offset: 0xA98
	Size: 0x1E4
	Parameters: 3
	Flags: None
*/
function function_f57e565f(dialogkey, entity, waittime)
{
	self endon(#"death");
	level endon(#"game_ended");
	if(!isdefined(self) || is_true(self.playingdialog) || !isplayer(self) || !isdefined(entity) || (self == entity && self isplayerunderwater()) || !isplayer(entity))
	{
		return;
	}
	dialogalias = entity get_player_dialog_alias(dialogkey, undefined);
	if(isdefined(waittime) && waittime > 0)
	{
		wait(waittime);
		if(!isdefined(self) || is_true(self.playingdialog) || !isplayer(self) || !isdefined(entity) || (self == entity && self isplayerunderwater()) || !isplayer(entity))
		{
			return;
		}
	}
	if(isdefined(dialogalias))
	{
		self playsoundtoplayer(dialogalias, self);
		self thread wait_dialog_buffer(mpdialog_value("killstreakDialogBuffer", 0));
	}
}

/*
	Name: play_dialog
	Namespace: battlechatter
	Checksum: 0xA46254E4
	Offset: 0xC88
	Size: 0x64
	Parameters: 4
	Flags: Linked
*/
function play_dialog(dialogkey, dialogflags, dialogbuffer, enemy)
{
	dialogalias = self get_player_dialog_alias(dialogkey, undefined);
	function_a48c33ff(dialogalias, dialogflags, dialogbuffer, enemy);
}

/*
	Name: function_5896274
	Namespace: battlechatter
	Checksum: 0x7CD4FCAC
	Offset: 0xCF8
	Size: 0xA4
	Parameters: 6
	Flags: Linked
*/
function function_5896274(waittime, dialogalias, dialogflags, dialogbuffer, enemy, endnotify)
{
	self endon(#"death");
	level endon(#"game_ended");
	if(isdefined(waittime) && waittime > 0)
	{
		if(isdefined(endnotify))
		{
			self endon(endnotify);
		}
		wait(waittime);
	}
	self thread function_a48c33ff(dialogalias, dialogflags, dialogbuffer, enemy);
}

/*
	Name: function_a48c33ff
	Namespace: battlechatter
	Checksum: 0x25040A63
	Offset: 0xDA8
	Size: 0x42C
	Parameters: 4
	Flags: Linked
*/
function function_a48c33ff(dialogalias, dialogflags, dialogbuffer, enemy)
{
	self endon(#"death");
	var_c84adc7e = !sessionmodeiswarzonegame() || !isdefined(dialogflags) || dialogflags & 128;
	if(!var_c84adc7e)
	{
		level endon(#"game_ended");
	}
	if(!isdefined(dialogalias) || !isplayer(self) || !isalive(self) || (level.gameended && !var_c84adc7e))
	{
		return;
	}
	if(!isdefined(dialogflags))
	{
		dialogflags = 0;
	}
	if(!is_true(level.allowspecialistdialog) && (dialogflags & 16) == 0)
	{
		return;
	}
	if(is_true(level.var_28ebc1e8))
	{
		dialogbuffer = float(max((isdefined(soundgetplaybacktime(dialogalias)) ? soundgetplaybacktime(dialogalias) : 500), 500)) / 1000;
	}
	if(!isdefined(dialogbuffer))
	{
		dialogbuffer = mpdialog_value("playerDialogBuffer", 0);
	}
	if(self isplayerunderwater() && !dialogflags & 8)
	{
		return;
	}
	if(is_true(self.playingdialog))
	{
		if(!dialogflags & 4)
		{
			return;
		}
		self stopsounds();
		waitframe(1);
	}
	if(dialogflags & 32)
	{
		self.playinggadgetreadydialog = 1;
	}
	if(dialogflags & 64)
	{
		if(!isdefined(self.stolendialogindex))
		{
			self.stolendialogindex = 0;
		}
		dialogalias = (dialogalias + "_0") + self.stolendialogindex;
		self.stolendialogindex++;
		self.stolendialogindex = self.stolendialogindex % 4;
	}
	if(dialogflags & 2)
	{
		if(self hasdobj() && self haspart("J_Head"))
		{
			self playsoundontag(dialogalias, "J_Head");
		}
	}
	else
	{
		if(dialogflags & 1)
		{
			if(self hasdobj() && self haspart("J_Head"))
			{
				if(isdefined(enemy))
				{
					self playsoundontag(dialogalias, "J_Head", self.team, enemy);
				}
				else
				{
					self playsoundontag(dialogalias, "J_Head", self.team);
				}
			}
		}
		else
		{
			self playlocalsound(dialogalias);
		}
	}
	self notify(#"played_dialog");
	self thread wait_dialog_buffer(dialogbuffer);
}

/*
	Name: wait_dialog_buffer
	Namespace: battlechatter
	Checksum: 0x22CC7A52
	Offset: 0x11E0
	Size: 0xAE
	Parameters: 1
	Flags: Linked
*/
function wait_dialog_buffer(dialogbuffer)
{
	self endon(#"death", #"played_dialog", #"stop_dialog");
	level endon(#"game_ended");
	self.playingdialog = 1;
	if(isdefined(dialogbuffer) && dialogbuffer > 0)
	{
		wait(dialogbuffer);
	}
	self.playingdialog = 0;
	self.var_6765d33e = 0;
	self.playinggadgetreadydialog = 0;
	self notify(#"done_speaking");
}

/*
	Name: stop_dialog
	Namespace: battlechatter
	Checksum: 0x2A2075F2
	Offset: 0x1298
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function stop_dialog(var_cdaf7797)
{
	self notify(#"stop_dialog");
	if(isdefined(var_cdaf7797))
	{
		self stopsound(var_cdaf7797);
	}
	else
	{
		self stopsounds();
	}
	self notify(#"done_speaking");
	self.playingdialog = 0;
	self.var_6765d33e = 0;
	self.playinggadgetreadydialog = 0;
}

/*
	Name: function_9d4a3d68
	Namespace: battlechatter
	Checksum: 0x41C2DDC3
	Offset: 0x1330
	Size: 0x124
	Parameters: 6
	Flags: Linked
*/
function function_9d4a3d68(var_11317dc8, speakingplayer, var_df336ed3, weapon, startdelay, var_44e63719)
{
	level endon(#"game_ended");
	speakingplayer endon(#"disconnect");
	/#
		assert(isdefined(var_11317dc8));
	#/
	/#
		assert(isplayer(speakingplayer));
	#/
	startdelay = (isdefined(startdelay) ? startdelay : 0);
	var_44e63719 = (isdefined(var_44e63719) ? var_44e63719 : 4);
	if(startdelay > 0)
	{
		wait(startdelay);
		if(!isdefined(speakingplayer))
		{
			return;
		}
	}
	speakingplayer function_18aba49d(var_11317dc8, weapon, var_df336ed3);
	thread wait_dialog_buffer(var_44e63719);
}

/*
	Name: check_boost_start_conversation
	Namespace: battlechatter
	Checksum: 0xED32A969
	Offset: 0x1460
	Size: 0x1B6
	Parameters: 0
	Flags: None
*/
function check_boost_start_conversation()
{
	if(!level.playstartconversation)
	{
		return;
	}
	if(!level.inprematchperiod || !level.teambased || game.boostplayerspicked[self.team])
	{
		return;
	}
	players = self get_friendly_players();
	array::add(players, self, 0);
	players = array::randomize(players);
	playerindex = 1;
	foreach(player in players)
	{
		playerdialog = player getmpdialogname();
		for(i = playerindex; i < players.size; i++)
		{
			playeri = players[i];
			if(playerdialog != playeri getmpdialogname())
			{
				pick_boost_players(player, playeri);
				return;
			}
		}
		playerindex++;
	}
}

/*
	Name: function_e6457410
	Namespace: battlechatter
	Checksum: 0x5777AB42
	Offset: 0x1620
	Size: 0x124
	Parameters: 5
	Flags: Linked
*/
function function_e6457410(var_5c238c21, attacker, victim, weapon, inflictor)
{
	if(!isdefined(victim) || !isplayer(victim) || victim hasperk(#"specialty_quieter"))
	{
		return 0;
	}
	if(!isdefined(inflictor) || !isplayer(weapon))
	{
		return 0;
	}
	if(!isdefined(attacker))
	{
		return 0;
	}
	if(!(isdefined(attacker.var_4a648cbd) ? attacker.var_4a648cbd : 0))
	{
		return 0;
	}
	var_49376124 = (isdefined(attacker.var_14e8550b) ? attacker.var_14e8550b : 0);
	if(var_49376124 == 0)
	{
		return 0;
	}
	return victim.var_3528f7e9 == var_49376124;
}

/*
	Name: function_46ac5cbb
	Namespace: battlechatter
	Checksum: 0x90742140
	Offset: 0x1750
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function function_46ac5cbb(victim)
{
	if(!dialog_chance("specialKillChance"))
	{
		return undefined;
	}
	if(!isdefined(victim.currentweapon))
	{
		return undefined;
	}
	var_5c238c21 = function_cdd81094(victim.currentweapon);
	if(!isdefined(var_5c238c21) || !isdefined(var_5c238c21.destroyedalias))
	{
		return;
	}
	return var_5c238c21.destroyedalias;
}

/*
	Name: function_551980b7
	Namespace: battlechatter
	Checksum: 0x5F77B151
	Offset: 0x17E0
	Size: 0x134
	Parameters: 2
	Flags: None
*/
function function_551980b7(speakingplayer, var_76787d10)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(var_76787d10))
	{
		return;
	}
	if(!isdefined(speakingplayer) || !isplayer(speakingplayer))
	{
		return;
	}
	if(!isdefined(var_76787d10) || !isplayer(var_76787d10))
	{
		return;
	}
	var_daeb4f94 = function_58c93260(speakingplayer);
	var_2708cdb2 = function_58c93260(var_76787d10);
	if(!isdefined(var_daeb4f94) || !isdefined(var_2708cdb2))
	{
		return;
	}
	if(!isdefined(var_daeb4f94.voiceprefix) || !isdefined(var_2708cdb2.var_ff5e0d8e))
	{
		return;
	}
	thread function_9d4a3d68(6, speakingplayer, var_76787d10, level.weaponnone, 0, 4);
}

/*
	Name: function_bd715920
	Namespace: battlechatter
	Checksum: 0x832E40E8
	Offset: 0x1920
	Size: 0x5CA
	Parameters: 5
	Flags: Linked
*/
function function_bd715920(var_28b40381, attacker, var_87017634, var_d963f0cf, timedelay)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self))
	{
		return;
	}
	if((isdefined(self.var_87b1ba00) ? self.var_87b1ba00 : 0) || (isdefined(var_d963f0cf.var_87b1ba00) ? var_d963f0cf.var_87b1ba00 : 0) || !isdefined(var_28b40381))
	{
		return;
	}
	var_8e39def3 = function_cdd81094(var_28b40381);
	if(!isdefined(var_8e39def3))
	{
		return;
	}
	var_4a247dec = (isdefined(var_8e39def3.var_2bb73e97) ? var_8e39def3.var_2bb73e97 : 0);
	var_2f741f8e = (isdefined(var_8e39def3.var_9715d1af) ? var_8e39def3.var_9715d1af : 0);
	var_4e424b8b = (isdefined(var_8e39def3.var_c6face5d) ? var_8e39def3.var_c6face5d : 0);
	var_494ab587 = (isdefined(var_8e39def3.var_97a93569) ? var_8e39def3.var_97a93569 : 0);
	if((isdefined(var_4a247dec) ? var_4a247dec : 0))
	{
		if(isdefined(attacker) && isplayer(attacker) && !attacker hasperk(#"specialty_quieter"))
		{
			if((isdefined(var_2f741f8e) ? var_2f741f8e : 0))
			{
				var_d963f0cf.var_87b1ba00 = 1;
			}
			else
			{
				self.var_87b1ba00 = 1;
			}
			attacker function_95e44f78(var_28b40381, timedelay);
			return;
		}
	}
	else if(isdefined(var_87017634))
	{
		players = self getenemies();
		allyradius = mpdialog_value("enemyContactAllyRadius", 0);
		enemydistance = mpdialog_value("enemyContactDistance", 0);
		foreach(player in players)
		{
			if(!isplayer(player) || player hasperk(#"specialty_quieter"))
			{
				continue;
			}
			if(isdefined(attacker) && isplayer(attacker) && player == attacker)
			{
				continue;
			}
			if((isdefined(var_4e424b8b) ? var_4e424b8b : 0))
			{
				if(distancesquared(var_87017634, player.origin) < sqr(allyradius))
				{
					if((isdefined(var_494ab587) ? var_494ab587 : 0))
					{
						relativepos = vectornormalize(player.origin - var_87017634);
						dir = anglestoforward(self getplayerangles());
						dotproduct = vectordot(relativepos, dir);
						if(dotproduct > 0)
						{
							continue;
						}
					}
					else
					{
						continue;
					}
				}
			}
			if(distancesquared(var_87017634, player.origin) > sqr(enemydistance))
			{
				continue;
			}
			eyepoint = player geteye();
			relativepos = vectornormalize(var_87017634 - eyepoint);
			dir = anglestoforward(player getplayerangles());
			dotproduct = vectordot(relativepos, dir);
			if(dotproduct > 0)
			{
				if(sighttracepassed(var_87017634, eyepoint, 1, player, var_d963f0cf))
				{
					if((isdefined(var_2f741f8e) ? var_2f741f8e : 0))
					{
						var_d963f0cf.var_87b1ba00 = 1;
					}
					else
					{
						self.var_87b1ba00 = 1;
					}
					player function_95e44f78(var_28b40381, timedelay);
					return;
				}
			}
		}
	}
}

/*
	Name: function_fc82b10
	Namespace: battlechatter
	Checksum: 0x1E9139A
	Offset: 0x1EF8
	Size: 0x402
	Parameters: 3
	Flags: Linked
*/
function function_fc82b10(weapon, var_87017634, var_d963f0cf)
{
	if(!isdefined(weapon))
	{
		return;
	}
	var_8e39def3 = function_cdd81094(weapon);
	if(!isdefined(var_8e39def3.var_ff5e0d8e))
	{
		return;
	}
	if((isdefined(var_d963f0cf.var_87b1ba00) ? var_d963f0cf.var_87b1ba00 : 0))
	{
		return;
	}
	var_4e424b8b = (isdefined(var_8e39def3.var_c6face5d) ? var_8e39def3.var_c6face5d : 0);
	if(isdefined(var_87017634))
	{
		players = self getenemies();
		if(isdefined(players) && players.size > 0)
		{
			playerbundle = function_58c93260(players[0], undefined);
			if(!isdefined(playerbundle.voiceprefix))
			{
				return;
			}
			dialogkey = playerbundle.voiceprefix + var_8e39def3.var_ff5e0d8e;
			allyradius = mpdialog_value("enemyContactAllyRadius", 0);
			enemydistance = mpdialog_value("enemyContactDistance", 0);
			foreach(player in players)
			{
				if(!isplayer(player) || player hasperk(#"specialty_quieter"))
				{
					continue;
				}
				distancetoplayer = distancesquared(var_87017634, player.origin);
				if(var_4e424b8b)
				{
					if(distancetoplayer < sqr(allyradius))
					{
						relativepos = vectornormalize(player.origin - var_87017634);
						dir = anglestoforward(self getplayerangles());
						dotproduct = vectordot(relativepos, dir);
						if(dotproduct > 0)
						{
							continue;
						}
					}
				}
				if(distancetoplayer > sqr(enemydistance))
				{
					continue;
				}
				eyepoint = player geteye();
				relativepos = vectornormalize(var_87017634 - eyepoint);
				dir = anglestoforward(player getplayerangles());
				dotproduct = vectordot(relativepos, dir);
				if(dotproduct > 0)
				{
					if(sighttracepassed(var_87017634, eyepoint, 1, player, var_d963f0cf))
					{
						var_d963f0cf.var_87b1ba00 = 1;
						player thread function_a48c33ff(dialogkey, 2);
						return;
					}
				}
			}
		}
	}
}

/*
	Name: function_95e44f78
	Namespace: battlechatter
	Checksum: 0xB4188DF2
	Offset: 0x2308
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function function_95e44f78(weapon, timedelay)
{
	playerbundle = function_58c93260(self, undefined);
	if(!isdefined(playerbundle) || !isdefined(playerbundle.voiceprefix))
	{
		return;
	}
	var_5c238c21 = function_cdd81094(timedelay);
	if(!isdefined(var_5c238c21) || !isdefined(var_5c238c21.var_ff5e0d8e))
	{
		return;
	}
	dialogkey = playerbundle.voiceprefix + var_5c238c21.var_ff5e0d8e;
	thread function_9d4a3d68(6, self, undefined, level.weaponnone, var_5c238c21.var_c4d151c8, var_5c238c21.var_4eb6c155);
}

/*
	Name: function_b06bbccf
	Namespace: battlechatter
	Checksum: 0x273F6DD
	Offset: 0x23F8
	Size: 0x2F4
	Parameters: 1
	Flags: Linked
*/
function function_b06bbccf(sniper)
{
	if(!function_e1983f22())
	{
		return false;
	}
	if(!isdefined(sniper) || !isdefined(self) || !level.teambased || !is_true(level.allowspecialistdialog))
	{
		return false;
	}
	if(!dialog_chance("sniperKillChance"))
	{
		return false;
	}
	closest_ally = self get_closest_player_ally(0);
	allyradius = mpdialog_value("sniperKillAllyRadius", 0);
	if(!isdefined(closest_ally) || distancesquared(self.origin, closest_ally.origin) > (allyradius * allyradius))
	{
		return false;
	}
	voiceprefix = function_e05060f0(closest_ally);
	if(!isdefined(voiceprefix))
	{
		return false;
	}
	playerbundle = function_58c93260(closest_ally);
	if(!isdefined(playerbundle) || !isdefined(playerbundle.threatsniper))
	{
		return false;
	}
	var_a1886234 = voiceprefix + playerbundle.threatsniper;
	closest_ally thread function_a48c33ff(var_a1886234, 2);
	sniper.spottedtime = gettime();
	sniper.spottedby = [];
	players = self get_friendly_players();
	players = arraysort(players, self.origin);
	voiceradius = mpdialog_value("playerVoiceRadius", 0);
	voiceradiussq = voiceradius * voiceradius;
	foreach(player in players)
	{
		if(distancesquared(closest_ally.origin, player.origin) <= voiceradiussq)
		{
			sniper.spottedby[sniper.spottedby.size] = player;
		}
	}
	return true;
}

/*
	Name: function_bafe1ee4
	Namespace: battlechatter
	Checksum: 0xC3EABE10
	Offset: 0x26F8
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function function_bafe1ee4(weapon)
{
	if(!function_e1983f22())
	{
		return false;
	}
	voiceprefix = function_e05060f0(self);
	if(!isdefined(voiceprefix))
	{
		return false;
	}
	var_8e39def3 = function_cdd81094(weapon);
	if(!isdefined(var_8e39def3))
	{
		return false;
	}
	dialogalias = voiceprefix + var_8e39def3.var_2c07bbf1;
	self thread function_a48c33ff(dialogalias, 6);
	return true;
}

/*
	Name: function_d2600afc
	Namespace: battlechatter
	Checksum: 0x8705BBEC
	Offset: 0x27B0
	Size: 0x15C
	Parameters: 4
	Flags: Linked
*/
function function_d2600afc(attacker, owner, gadgetweapon, attackerweapon)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(attacker) || !isplayer(attacker) || attacker hasperk(#"specialty_quieter"))
	{
		return;
	}
	if(!isdefined(gadgetweapon) || (isdefined(owner) && owner == attacker))
	{
		return;
	}
	if(isdefined(level.var_98769415))
	{
		if(isdefined(attackerweapon) && isdefined([[level.var_98769415]](attackerweapon)))
		{
			return;
		}
	}
	var_5c238c21 = function_cdd81094(gadgetweapon);
	if(!isdefined(var_5c238c21) || !isdefined(var_5c238c21.destroyedalias))
	{
		return;
	}
	thread function_9d4a3d68(9, attacker, undefined, gadgetweapon, var_5c238c21.var_8f77c9dd, var_5c238c21.var_51812235);
}

/*
	Name: playkillbattlechatter
	Namespace: battlechatter
	Checksum: 0xC2A4FEB6
	Offset: 0x2918
	Size: 0x51C
	Parameters: 5
	Flags: Linked
*/
function playkillbattlechatter(dialogkey, attacker, weapon, victim, inflictor)
{
	if(!is_true(level.allowspecialistdialog))
	{
		return;
	}
	if(!isdefined(attacker) || !isplayer(attacker) || !isalive(attacker) || attacker isremotecontrolling() || attacker isinvehicle() || attacker isweaponviewonlylinked() || attacker hasperk(#"specialty_quieter"))
	{
		return;
	}
	if(isdefined(inflictor) && inflictor.classname != "worldspawn" && !isplayer(inflictor) && inflictor.birthtime < attacker.spawntime)
	{
		return;
	}
	if((isdefined(self.var_2b0c267) ? self.var_2b0c267 : 0) > gettime())
	{
		return;
	}
	var_9074cacb = function_58c93260(attacker);
	if(!isdefined(var_9074cacb))
	{
		return;
	}
	if(isdefined(dialogkey))
	{
		suffix = var_9074cacb.(dialogkey);
	}
	else if(isdefined(victim))
	{
		var_5c238c21 = function_cdd81094(weapon);
		var_25db02aa = victim function_e6457410(var_5c238c21, attacker, victim, weapon, inflictor);
		if(var_25db02aa)
		{
			var_71449560 = (isdefined(var_5c238c21.var_9ccf7d8b) ? var_5c238c21.var_9ccf7d8b : 4);
			if(isdefined(var_5c238c21.var_48b8bd2c))
			{
				var_71449560 = var_71449560 + (isdefined(var_5c238c21.var_c4d151c8) ? var_5c238c21.var_c4d151c8 : 0);
				var_71449560 = var_71449560 + (isdefined(var_5c238c21.var_4eb6c155) ? var_5c238c21.var_4eb6c155 : 4);
			}
			thread function_9d4a3d68(0, attacker, undefined, weapon, var_5c238c21.var_57c1e152, var_71449560);
			return;
		}
		if(var_25db02aa || weapon.skipbattlechatterkill)
		{
			return;
		}
		if(isplayer(victim) && dialog_chance("enemyKillChance"))
		{
			suffix = function_46ac5cbb(victim);
			if(!isdefined(suffix) && isdefined(victim.spottedtime) && (victim.spottedtime + mpdialog_value("enemySniperKillTime", 0)) >= gettime() && array::contains(victim.spottedby, attacker) && dialog_chance("enemySniperKillChance"))
			{
				suffix = var_9074cacb.("killSniper");
			}
			if(!isdefined(suffix))
			{
				if(randomfloatrange(0, 1) < 0.8)
				{
					suffix = var_9074cacb.killgeneric;
				}
				else
				{
					if(victim util::is_female())
					{
						suffix = var_9074cacb.var_3823c559;
					}
					else
					{
						suffix = var_9074cacb.var_9903c3b;
					}
				}
			}
		}
		victim.spottedtime = undefined;
		victim.spottedby = undefined;
	}
	if(isdefined(suffix) && isdefined(var_9074cacb.voiceprefix))
	{
		killdialog = var_9074cacb.voiceprefix + suffix;
	}
	if(!isdefined(killdialog) || inflictor.var_259f6c17 === 1)
	{
		return;
	}
	self.var_2b0c267 = gettime() + (int(mpdialog_value("enemyKillCooldown", 7) * 1000));
	attacker thread function_5896274(mpdialog_value("enemyKillDelay", 0), killdialog, 2, undefined, victim, "cancel_kill_dialog");
}

/*
	Name: function_b5242998
	Namespace: battlechatter
	Checksum: 0x2B3044CA
	Offset: 0x2E40
	Size: 0x3B4
	Parameters: 0
	Flags: Linked
*/
function function_b5242998()
{
	self endon(#"death");
	level endon(#"game_ended");
	if(!is_true(level.teambased) || !is_true(level.allowspecialistdialog))
	{
		return;
	}
	allies = [];
	allyradiussq = mpdialog_value("playerVoiceRadius", 0);
	allyradiussq = allyradiussq * allyradiussq;
	foreach(player in level.players)
	{
		if(!isdefined(player) || !isalive(player) || player.sessionstate != "playing" || player == self || player hasperk(#"specialty_quieter") || util::function_fbce7263(player.team, self.team))
		{
			continue;
		}
		distsq = distancesquared(self.origin, player.origin);
		if(distsq > allyradiussq)
		{
			continue;
		}
		allies[allies.size] = player;
	}
	wait(mpdialog_value("enemyKillDelay", 0) + 0.1);
	while(self.playingdialog)
	{
		wait(0.5);
	}
	allies = arraysort(allies, self.origin);
	foreach(player in allies)
	{
		if(!isalive(player) || player.sessionstate != "playing" || player.playingdialog || player isplayerunderwater() || player isremotecontrolling() || player isinvehicle() || player isweaponviewonlylinked())
		{
			continue;
		}
		distsq = distancesquared(self.origin, player.origin);
		if(distsq > allyradiussq)
		{
			break;
		}
		player play_dialog("heroWeaponSuccessReaction", 2);
		break;
	}
}

/*
	Name: function_f5b398b6
	Namespace: battlechatter
	Checksum: 0x2E9141D2
	Offset: 0x3200
	Size: 0x34C
	Parameters: 0
	Flags: Linked
*/
function function_f5b398b6()
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter"))
	{
		return;
	}
	self endon(#"death");
	level endon(#"game_ended");
	if(!level.teambased)
	{
		return;
	}
	wait(9);
	players = self get_friendly_players();
	players = arraysort(players, self.origin);
	selfdialog = self getmpdialogname();
	voiceradius = mpdialog_value("playerVoiceRadius", 0);
	voiceradiussq = voiceradius * voiceradius;
	foreach(player in players)
	{
		if(player == self)
		{
			continue;
		}
		playerdialog = player getmpdialogname();
		if(!isdefined(playerdialog) || playerdialog == selfdialog || !player can_play_dialog(1) || distancesquared(self.origin, player.origin) >= voiceradiussq)
		{
			continue;
		}
		dialogalias = player get_player_dialog_alias("promotionReaction", undefined);
		if(!isdefined(dialogalias))
		{
			continue;
		}
		ally = player;
		break;
	}
	if(isdefined(ally))
	{
		if(ally hasdobj() && ally haspart("J_Head"))
		{
			ally playsoundontag(dialogalias, "J_Head", undefined, self);
		}
		else
		{
			ally playsoundontag(dialogalias, "tag_origin", undefined, self);
		}
		ally thread wait_dialog_buffer(mpdialog_value("playerDialogBuffer", 0));
	}
}

/*
	Name: function_576ff6fe
	Namespace: battlechatter
	Checksum: 0x119474BF
	Offset: 0x3558
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function function_576ff6fe(killstreaktype)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter"))
	{
		return;
	}
	if(!isdefined(killstreaktype) || !isdefined(level.killstreaks[killstreaktype]))
	{
		return;
	}
	if(!isdefined(level.killstreaks[killstreaktype].script_bundle.var_c236921c))
	{
		return;
	}
	playerbundle = function_58c93260(self);
	if(!isdefined(playerbundle) || !isdefined(playerbundle.voiceprefix))
	{
		return;
	}
	dialogalias = playerbundle.voiceprefix + level.killstreaks[killstreaktype].script_bundle.var_c236921c;
	self thread function_a48c33ff(dialogalias, 1);
}

/*
	Name: playkillstreakthreat
	Namespace: battlechatter
	Checksum: 0xD767CD3
	Offset: 0x36B8
	Size: 0x19C
	Parameters: 1
	Flags: Linked
*/
function playkillstreakthreat(killstreaktype)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter"))
	{
		return;
	}
	if(!isdefined(killstreaktype) || !isdefined(level.killstreaks[killstreaktype]))
	{
		return;
	}
	if(!isdefined(level.killstreaks[killstreaktype].script_bundle.var_aef5ea0a))
	{
		return;
	}
	playerbundle = function_58c93260(self);
	if(!isdefined(playerbundle) || !isdefined(playerbundle.voiceprefix))
	{
		return;
	}
	dialogalias = playerbundle.voiceprefix + level.killstreaks[killstreaktype].script_bundle.var_aef5ea0a;
	if(killstreaks::function_c5927b3f(killstreaks::get_killstreak_weapon(killstreaktype)))
	{
		self thread function_a48c33ff(dialogalias, 1);
	}
	else
	{
		self thread function_a48c33ff(dialogalias, 2);
	}
}

/*
	Name: function_eebf94f6
	Namespace: battlechatter
	Checksum: 0x7404FC1D
	Offset: 0x3860
	Size: 0x144
	Parameters: 2
	Flags: Linked
*/
function function_eebf94f6(killstreaktype, weapon)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter"))
	{
		return;
	}
	if(isdefined(level.var_98769415))
	{
		if(!isdefined(weapon) || !isdefined(level.killstreaks[weapon]))
		{
			return;
		}
	}
	if(!isdefined(level.killstreaks[weapon].script_bundle.var_1b390aa1))
	{
		return;
	}
	playerbundle = function_58c93260(self);
	if(!isdefined(playerbundle) || !isdefined(playerbundle.voiceprefix))
	{
		return;
	}
	thread function_9d4a3d68(11, self, undefined, killstreaks::get_killstreak_weapon(weapon));
}

/*
	Name: playgadgetready
	Namespace: battlechatter
	Checksum: 0xF63DFBFE
	Offset: 0x39B0
	Size: 0x4D4
	Parameters: 2
	Flags: Linked
*/
function playgadgetready(weapon, userflip)
{
	if(!isdefined(userflip))
	{
		userflip = 0;
	}
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter"))
	{
		return;
	}
	if(!isdefined(weapon) || (gettime() - (isdefined(level.starttime) ? level.starttime : 0)) < (int(mpdialog_value("readyAudioDelay", 0) * 1000)))
	{
		return;
	}
	var_5c238c21 = function_cdd81094(weapon);
	if(!isdefined(var_5c238c21) || !isdefined(var_5c238c21.var_788c5852))
	{
		return;
	}
	playerbundle = function_58c93260(self);
	if(!isdefined(playerbundle) || !isdefined(playerbundle.voiceprefix))
	{
		return;
	}
	dialogkey = playerbundle.voiceprefix + var_5c238c21.var_788c5852;
	if(!is_true(self.isthief) && !is_true(self.isroulette))
	{
		self thread function_a48c33ff(dialogkey, 2);
		return;
	}
	waittime = 0;
	dialogflags = 32;
	if(userflip)
	{
		minwaittime = 0;
		if(self.playinggadgetreadydialog)
		{
			self stop_dialog();
			minwaittime = float(function_60d95f53()) / 1000;
		}
		if(is_true(self.isthief))
		{
			delaykey = "thiefFlipDelay";
		}
		else
		{
			delaykey = "rouletteFlipDelay";
		}
		waittime = mpdialog_value(delaykey, minwaittime);
		dialogflags = dialogflags + 64;
	}
	else
	{
		if(is_true(self.isthief))
		{
			generickey = playerbundle.thiefweaponready;
			repeatkey = playerbundle.thiefweaponrepeat;
			repeatthresholdkey = "thiefRepeatThreshold";
			chancekey = "thiefReadyChance";
			delaykey = "thiefRevealDelay";
		}
		else
		{
			generickey = playerbundle.rouletteabilityready;
			repeatkey = playerbundle.rouletteabilityrepeat;
			repeatthresholdkey = "rouletteRepeatThreshold";
			chancekey = "rouletteReadyChance";
			delaykey = "rouletteRevealDelay";
		}
		if(randomint(100) < mpdialog_value(chancekey, 0))
		{
			dialogkey = generickey;
		}
		else
		{
			waittime = mpdialog_value(delaykey, 0);
			if(self.laststolengadget === weapon && (self.laststolengadgettime + (int(mpdialog_value(repeatthresholdkey, 0) * 1000))) > gettime())
			{
				dialogkey = repeatkey;
			}
			else
			{
				dialogflags = dialogflags + 64;
			}
		}
	}
	self.laststolengadget = weapon;
	self.laststolengadgettime = gettime();
	if(waittime)
	{
		self notify(#"cancel_kill_dialog");
	}
	self thread function_5896274(waittime, dialogkey, dialogflags, undefined, undefined, undefined);
}

/*
	Name: function_1d4b0ec0
	Namespace: battlechatter
	Checksum: 0x8BC5043A
	Offset: 0x3E90
	Size: 0x17C
	Parameters: 2
	Flags: None
*/
function function_1d4b0ec0(dogstate, dog)
{
	if(!is_true(level.allowspecialistdialog))
	{
		return;
	}
	if(!isdefined(dog))
	{
		return;
	}
	if(!isdefined(self.script_owner) || !isplayer(self.script_owner) || self.script_owner hasperk(#"specialty_quieter"))
	{
		return;
	}
	bundlename = self.script_owner getmpdialogname();
	if(!isdefined(bundlename))
	{
		return;
	}
	playerbundle = getscriptbundle(bundlename);
	if(!isdefined(playerbundle))
	{
		return;
	}
	dialogkey = undefined;
	switch(dog)
	{
		case 0:
		{
			dialogkey = playerbundle.var_499ffcee;
			break;
		}
		case 1:
		{
			dialogkey = playerbundle.var_38ab9818;
			break;
		}
		default:
		{
			return;
		}
	}
	self.script_owner thread function_a48c33ff(dialogkey);
}

/*
	Name: function_e3ebbf87
	Namespace: battlechatter
	Checksum: 0x7DF330E6
	Offset: 0x4018
	Size: 0x264
	Parameters: 2
	Flags: None
*/
function function_e3ebbf87(var_aa988d26, var_c1132df6)
{
	if(!isdefined(var_aa988d26) || !isdefined(self) || !isplayer(self))
	{
		return;
	}
	self notify("466f2691e55c760b");
	self endon("466f2691e55c760b");
	self endon(#"death", #"disconnect");
	if(!sessionmodeiswarzonegame())
	{
		level endon(#"game_ended");
	}
	waittime = mpdialog_value("calloutTriggerDelay", 0);
	wait(waittime);
	if(!isdefined(self) || !isplayer(self) || self isplayerunderwater())
	{
		return;
	}
	if(is_true(self.playingdialog))
	{
		return;
	}
	dialogbundle = function_58c93260(self);
	if(!isdefined(dialogbundle) || !isdefined(dialogbundle.voiceprefix))
	{
		return;
	}
	if(!is_true(var_c1132df6) && !isdefined(var_aa988d26.var_4bc5b617) || (is_true(var_c1132df6) && !isdefined(var_aa988d26.var_5cb8190f)))
	{
		return;
	}
	var_4bc5b617 = (is_true(var_c1132df6) ? var_aa988d26.var_5cb8190f : var_aa988d26.var_4bc5b617);
	dialogalias = dialogbundle.voiceprefix + var_4bc5b617;
	dialogbuffer = mpdialog_value("calloutDialogBuffer", 0);
	self thread function_a48c33ff(dialogalias, 146, dialogbuffer);
}

/*
	Name: function_fff18afc
	Namespace: battlechatter
	Checksum: 0x7C2B86F2
	Offset: 0x4288
	Size: 0x204
	Parameters: 2
	Flags: Linked
*/
function function_fff18afc(dialogkey, var_4d5833c)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self))
	{
		return;
	}
	if(!isdefined(dialogkey) || self isplayerunderwater())
	{
		return;
	}
	dialogbuffer = mpdialog_value("killstreakDialogBuffer", 0);
	voiceprefix = function_e05060f0(self);
	if(isdefined(voiceprefix))
	{
		dialogalias = voiceprefix + dialogkey;
	}
	else
	{
		dialogalias = dialogkey;
	}
	if(is_true(level.var_28ebc1e8))
	{
		dialogbuffer = float(max((isdefined(soundgetplaybacktime(dialogalias)) ? soundgetplaybacktime(dialogalias) : 500), 500)) / 1000;
	}
	if(!self hasperk(#"specialty_quieter"))
	{
		self function_a48c33ff(dialogalias, 5, dialogbuffer, undefined);
	}
	var_cf210c5b = self get_player_dialog_alias(var_4d5833c, undefined);
	if(isdefined(var_cf210c5b))
	{
		self function_253c2ba4(var_cf210c5b, dialogbuffer);
	}
}

/*
	Name: function_cad61ec
	Namespace: battlechatter
	Checksum: 0xE9D78ADF
	Offset: 0x4498
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_cad61ec(weapon)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self))
	{
		return;
	}
	if(!isdefined(weapon) || !isalive(self) || level.gameended || self isplayerunderwater())
	{
		return;
	}
	var_5c238c21 = function_cdd81094(weapon);
	if(!isdefined(var_5c238c21) || !isdefined(var_5c238c21.deployalias))
	{
		return;
	}
	thread function_9d4a3d68(8, self, undefined, weapon, var_5c238c21.var_25b5335a, var_5c238c21.var_373ebd09);
}

/*
	Name: function_916b4c72
	Namespace: battlechatter
	Checksum: 0xC89C11CE
	Offset: 0x45B0
	Size: 0x21C
	Parameters: 1
	Flags: Linked
*/
function function_916b4c72(weapon)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter"))
	{
		return;
	}
	if(!isdefined(weapon) || !isalive(self) || level.gameended || (isdefined(self.var_8720dd77) ? self.var_8720dd77 : 0) > gettime() || self isplayerunderwater())
	{
		return;
	}
	playerbundle = function_58c93260(self, undefined);
	if(!isdefined(playerbundle) || !isdefined(playerbundle.voiceprefix))
	{
		return;
	}
	var_5c238c21 = function_cdd81094(weapon);
	if(!isdefined(var_5c238c21) || !isdefined(var_5c238c21.var_931a4bf8))
	{
		return;
	}
	dialogkey = playerbundle.voiceprefix + var_5c238c21.var_931a4bf8;
	self.var_8720dd77 = gettime() + (int(mpdialog_value("useFailDelay", 5) * 1000));
	self playsoundtoplayer(dialogkey, self);
	self thread wait_dialog_buffer(mpdialog_value("playerDialogBuffer", 0));
}

/*
	Name: function_4b6a650d
	Namespace: battlechatter
	Checksum: 0xEEA50434
	Offset: 0x47D8
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_4b6a650d(weapon)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self))
	{
		return;
	}
	if(!isdefined(weapon) || self isplayerunderwater())
	{
		return;
	}
	playerbundle = function_58c93260(self, undefined);
	if(!isdefined(playerbundle) || !isdefined(playerbundle.voiceprefix))
	{
		return;
	}
	var_5c238c21 = function_cdd81094(weapon);
	if(!isdefined(var_5c238c21) || !isdefined(var_5c238c21.equipalias))
	{
		return;
	}
	thread function_9d4a3d68(10, self, undefined, weapon, var_5c238c21.var_79b79488, var_5c238c21.var_eeb8e319);
}

/*
	Name: function_26dd1669
	Namespace: battlechatter
	Checksum: 0xDF739DD9
	Offset: 0x4910
	Size: 0x1B4
	Parameters: 1
	Flags: Linked
*/
function function_26dd1669(weapon)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self))
	{
		return;
	}
	if(!isdefined(weapon) || self isplayerunderwater())
	{
		return;
	}
	playerbundle = function_58c93260(self, undefined);
	if(!isdefined(playerbundle) || !isdefined(playerbundle.voiceprefix))
	{
		return;
	}
	var_5c238c21 = function_cdd81094(weapon);
	if(!isdefined(var_5c238c21) || !isdefined(var_5c238c21.usealias))
	{
		self function_624f04c6(playerbundle);
		return;
	}
	if(isinarray(level.var_add8e0f2, weapon.rootweapon.name) && randomfloatrange(0, 1) < 0.5)
	{
		self function_624f04c6(playerbundle);
	}
	else
	{
		thread function_9d4a3d68(7, self, undefined, weapon, var_5c238c21.var_14da1618, var_5c238c21.var_b76b8205);
	}
}

/*
	Name: function_253c2ba4
	Namespace: battlechatter
	Checksum: 0x6B56FC13
	Offset: 0x4AD0
	Size: 0x2B0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_253c2ba4(var_cf210c5b, dialogbuffer)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self) || !isdefined(var_cf210c5b))
	{
		return;
	}
	if(!isdefined(dialogbuffer))
	{
		dialogbuffer = mpdialog_value("playerDialogBuffer", 0);
	}
	teamarray = getplayers(self.team);
	if(self hasperk(#"specialty_quieter"))
	{
		arrayremovevalue(teamarray, self, 0);
	}
	else
	{
		localplayers = getplayers(self.team, self.origin, 1200);
		foreach(localplayer in localplayers)
		{
			arrayremovevalue(teamarray, localplayer, 0);
		}
	}
	foreach(player in teamarray)
	{
		if(!isdefined(player) || !isalive(player) || (is_true(player.playingdialog) && !is_true(player.var_6765d33e)))
		{
			continue;
		}
		player.var_6765d33e = 0;
		player playsoundtoplayer(var_cf210c5b, player);
		player thread wait_dialog_buffer(dialogbuffer);
	}
}

/*
	Name: play_gadget_success
	Namespace: battlechatter
	Checksum: 0xEE2F77D4
	Offset: 0x4D88
	Size: 0x1AC
	Parameters: 4
	Flags: Linked
*/
function play_gadget_success(weapon, waitkey, victim, var_5d738b56)
{
	if(!is_true(level.allowspecialistdialog) || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter"))
	{
		return;
	}
	if(!isdefined(victim) || !level.teambased)
	{
		return;
	}
	var_5c238c21 = function_cdd81094(victim);
	if(!isdefined(var_5c238c21) || !isdefined(var_5c238c21.var_c8d8482c))
	{
		return;
	}
	self.playedgadgetsuccess = 1;
	var_71449560 = (isdefined(var_5c238c21.var_9ccf7d8b) ? var_5c238c21.var_9ccf7d8b : 4);
	if(isdefined(var_5c238c21.var_48b8bd2c))
	{
		var_71449560 = var_71449560 + (isdefined(var_5c238c21.var_c4d151c8) ? var_5c238c21.var_c4d151c8 : 0);
		var_71449560 = var_71449560 + (isdefined(var_5c238c21.var_4eb6c155) ? var_5c238c21.var_4eb6c155 : 4);
	}
	thread function_9d4a3d68(0, self, var_5d738b56, victim, var_5c238c21.var_57c1e152, var_71449560);
}

/*
	Name: function_98898d14
	Namespace: battlechatter
	Checksum: 0x9B1F8DCB
	Offset: 0x4F40
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function function_98898d14(player, objective)
{
	if(isdefined(objective.var_76975be4[player.team]) && (objective.var_b4ea8d3f[player.team] + (int(20 * 1000))) < gettime())
	{
		return;
	}
	if(randomfloatrange(0, 1) < 0.25)
	{
		var_57fce7c = function_8c4b101f(player.team, player.origin, 360);
		if(var_57fce7c.size >= 2)
		{
			player play_dialog("captureStartObjective", 1);
			objective.var_b4ea8d3f[player.team] = gettime();
		}
	}
}

/*
	Name: function_924699f4
	Namespace: battlechatter
	Checksum: 0x59135D71
	Offset: 0x5050
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function function_924699f4(player, objective)
{
	if(isdefined(objective.var_2a30805a[player.team]) && (objective.var_fe3d79b9[player.team] + (int(20 * 1000))) < gettime())
	{
		return;
	}
	if(randomfloatrange(0, 1) < 0.25)
	{
		var_57fce7c = function_8c4b101f(player.team, player.origin, 360);
		if(var_57fce7c.size >= 2)
		{
			player play_dialog("capturedObjective", 1);
			objective.var_fe3d79b9[player.team] = gettime();
		}
	}
}

/*
	Name: game_end_vox
	Namespace: battlechatter
	Checksum: 0x4AD1D017
	Offset: 0x5160
	Size: 0x1D0
	Parameters: 1
	Flags: None
*/
function game_end_vox(winner)
{
	if(!is_true(level.allowspecialistdialog))
	{
		return;
	}
	foreach(player in level.players)
	{
		if(player issplitscreen())
		{
			continue;
		}
		bundlename = player getmpdialogname();
		if(!isdefined(bundlename))
		{
			return;
		}
		playerbundle = getscriptbundle(bundlename);
		if(!isdefined(playerbundle.voiceprefix))
		{
			return;
		}
		if(isdefined(winner) && (level.teambased && isdefined(level.teams[winner]) && player.pers[#"team"] == winner) || (!level.teambased && player == winner))
		{
			dialogkey = playerbundle.boostwin;
		}
		else
		{
			dialogkey = playerbundle.boostloss;
		}
		if(isdefined(playerbundle.voiceprefix) && isdefined(dialogkey))
		{
			player playlocalsound(playerbundle.voiceprefix + dialogkey);
		}
	}
}

/*
	Name: function_72b65730
	Namespace: battlechatter
	Checksum: 0x5D59D2C
	Offset: 0x5338
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function function_72b65730()
{
	bundlename = self getmpdialogname();
	if(!isdefined(bundlename))
	{
		return;
	}
	playerbundle = getscriptbundle(bundlename);
	if(!isdefined(playerbundle))
	{
		return;
	}
	dialogkey = playerbundle.var_96b4150c;
	waittime = mpdialog_value("playerExertBuffer", 0);
	thread function_5896274(waittime, dialogkey, 2);
}

/*
	Name: heavyweaponkilllogic
	Namespace: battlechatter
	Checksum: 0xF1441F24
	Offset: 0x53F8
	Size: 0xC4
	Parameters: 3
	Flags: Linked
*/
function heavyweaponkilllogic(attacker, weapon, victim)
{
	if(!isdefined(attacker.heavyweaponkillcount))
	{
		attacker.heavyweaponkillcount = 0;
	}
	attacker.heavyweaponkillcount++;
	if(!is_true(attacker.playedgadgetsuccess) && attacker.heavyweaponkillcount >= mpdialog_value("heroWeaponKillCount", 0))
	{
		attacker thread play_gadget_success(weapon, "enemyKillDelay", victim);
		attacker thread function_b5242998();
	}
}

/*
	Name: function_9cc82a74
	Namespace: battlechatter
	Checksum: 0xF621C31C
	Offset: 0x54C8
	Size: 0x318
	Parameters: 0
	Flags: Linked
*/
function function_9cc82a74()
{
	if(!function_e1983f22())
	{
		return;
	}
	self notify("7f6bd9a493597a68");
	self endon("7f6bd9a493597a68");
	level endon(#"match_end");
	while(true)
	{
		level waittill(#"hash_6c17824062de93e5");
		while(true)
		{
			if(level.var_648e79b7.size == 0)
			{
				break;
			}
			var_d465d941 = [];
			foreach(entry in level.var_648e79b7)
			{
				if(entry.timestamp < gettime())
				{
					dialogkey = undefined;
					attacker = getentbynum(key);
					weapon = entry.weapon;
					victim = entry.victim;
					einflictor = entry.einflictor;
					var_46604f00 = level.var_42648a02[entry.statname];
					if(isdefined(var_46604f00))
					{
						dialogkey = var_46604f00[2];
						var_e76fd8fa = var_46604f00[4];
					}
					if(isdefined(level.var_3602c1be))
					{
						if(is_false(attacker.playingdialog))
						{
							[[level.var_3602c1be]](dialogkey, attacker, weapon, victim, einflictor);
							level thread function_d8bd5eb9(attacker, var_e76fd8fa);
						}
					}
					if(!isdefined(var_d465d941))
					{
						var_d465d941 = [];
					}
					else if(!isarray(var_d465d941))
					{
						var_d465d941 = array(var_d465d941);
					}
					var_d465d941[var_d465d941.size] = entry;
					level.var_75aa0434 = [];
				}
			}
			foreach(entry in var_d465d941)
			{
				arrayremovevalue(level.var_648e79b7, entry, 1);
			}
			wait(0.1);
		}
	}
}

/*
	Name: function_d8bd5eb9
	Namespace: battlechatter
	Checksum: 0xCC018EE9
	Offset: 0x57E8
	Size: 0x31C
	Parameters: 2
	Flags: Linked
*/
function function_d8bd5eb9(player, var_e76fd8fa)
{
	if(!isdefined(var_e76fd8fa) || randomfloatrange(0, 1) < 0.25)
	{
		return;
	}
	wait(3);
	if(!isplayer(player) || player hasperk(#"specialty_quieter"))
	{
		return;
	}
	voiceradius = mpdialog_value("playerVoiceRadius", 0);
	allies = function_8c4b101f(player.team, player.origin, voiceradius);
	allies = arraysort(allies, player.origin);
	selfdialog = player getmpdialogname();
	foreach(ally in allies)
	{
		if(ally == player)
		{
			continue;
		}
		playerdialog = ally getmpdialogname();
		if(!isdefined(playerdialog) || playerdialog == selfdialog || !ally can_play_dialog(1))
		{
			continue;
		}
		if(var_e76fd8fa == 1)
		{
			dialogalias = ally get_player_dialog_alias("congratulateLarge");
		}
		else
		{
			dialogalias = ally get_player_dialog_alias("congratulateSmall");
		}
		if(isdefined(dialogalias))
		{
			break;
		}
	}
	if(isdefined(ally) && isdefined(dialogalias))
	{
		if(ally hasdobj() && ally haspart("J_Head"))
		{
			ally playsoundontag(dialogalias, "J_Head", undefined, player);
		}
		else
		{
			ally playsoundontag(dialogalias, "tag_origin", undefined, player);
		}
		ally thread wait_dialog_buffer(mpdialog_value("playerDialogBuffer", 0));
	}
}

/*
	Name: function_382adb6c
	Namespace: battlechatter
	Checksum: 0x5077BAFC
	Offset: 0x5B10
	Size: 0x1AC
	Parameters: 1
	Flags: Event
*/
event function_382adb6c(params)
{
	self endon(#"death");
	level endon(#"game_ended");
	if(!(isdefined(self) && isdefined(params)) || !isplayer(self) || params.isattacker !== 1)
	{
		return;
	}
	dialogbundle = function_58c93260(self);
	if(!isdefined(dialogbundle.voiceprefix))
	{
		return;
	}
	var_eb7a15a5 = dialogbundle.executionkills;
	foreach(execution in var_eb7a15a5)
	{
		if(execution.var_b4a570f4 == params.var_b4a570f4)
		{
			suffix = execution.var_e265e63e;
			delay = execution.var_8e1cee6b;
			break;
		}
	}
	if(!isdefined(suffix))
	{
		return;
	}
	if(isdefined(delay))
	{
		wait(delay);
	}
	self function_a48c33ff(dialogbundle.voiceprefix + suffix, 2);
}

