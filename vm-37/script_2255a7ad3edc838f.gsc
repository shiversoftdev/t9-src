#using script_2e7b2ce35bae89d9;
#using script_34e162235fb08844;
#using script_3f27a7b2232674db;
#using script_4e44ad88a2b0f559;
#using script_55b445d561c4bd83;
#using script_57f7003580bb15e0;
#using script_5e6a760c6f43dd12;
#using script_6158278c8647d8a9;
#using script_74453936abc39adf;
#using script_747b8f8449e8891b;
#using script_79b47c663155f8bd;
#using script_ee56e8b680377b6;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace bot;

/*
	Name: function_89f2df9
	Namespace: bot
	Checksum: 0x664055CF
	Offset: 0x1C8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"bot", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bot
	Checksum: 0xB133964D
	Offset: 0x210
	Size: 0x320
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(util::function_3f165ee8())
	{
		return;
	}
	if(currentsessionmode() == 4 || currentsessionmode() == 2)
	{
		return;
	}
	level.var_fa5cacde = getgametypesetting(#"hash_77b7734750cd75e9") || is_true(level.var_fa5cacde);
	/#
		if(getdvarint(#"hash_7140b31f7170f18b", 0))
		{
			setdvar(#"scr_player_ammo", "");
		}
	#/
	if(is_true(level.var_fa5cacde))
	{
		namespace_ffbf548b::function_70a657d8();
		callback::on_spawned(&function_abe38e0f);
		callback::on_player_killed(&function_96dddf6f);
		return;
	}
	namespace_87549638::function_70a657d8();
	bot_action::function_70a657d8();
	bot_difficulty::function_70a657d8();
	namespace_38ee089b::function_70a657d8();
	namespace_1d70329f::function_70a657d8();
	namespace_ffbf548b::function_70a657d8();
	namespace_b20b4885::function_70a657d8();
	namespace_9c817acd::function_70a657d8();
	namespace_255a2b21::function_70a657d8();
	bot_traversals::function_70a657d8();
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	callback::on_player_killed(&on_player_killed);
	callback::add_callback(#"hash_6efb8cec1ca372dc", &function_7291a729);
	callback::add_callback(#"hash_6280ac8ed281ce3c", &function_99a2ecf5);
	callback::add_callback(#"hash_730d00ef91d71acf", &function_8481733a);
	level.var_38c34301 = 500 / function_60d95f53();
}

/*
	Name: is_bot_ranked_match
	Namespace: bot
	Checksum: 0x4FFAB13A
	Offset: 0x538
	Size: 0x6
	Parameters: 0
	Flags: None
*/
function is_bot_ranked_match()
{
	return false;
}

/*
	Name: add_bot
	Namespace: bot
	Checksum: 0x3A4C2679
	Offset: 0x548
	Size: 0x15A
	Parameters: 3
	Flags: Linked
*/
function add_bot(team, name, clanabbrev)
{
	if(!isdefined(name))
	{
		name = undefined;
	}
	if(!isdefined(clanabbrev))
	{
		clanabbrev = undefined;
	}
	bot = addtestclient(name, clanabbrev);
	if(!isdefined(bot))
	{
		return undefined;
	}
	bot init_bot();
	if(is_true(level.disableclassselection))
	{
		bot.pers[#"class"] = level.defaultclass;
		bot.curclass = level.defaultclass;
	}
	if(level.teambased && isdefined(team) && isdefined(level.teams[team]))
	{
		bot.botteam = team;
	}
	else
	{
		if(isdefined(team) && team == #"spectator")
		{
			bot.botteam = #"spectator";
		}
		else
		{
			bot.botteam = "autoassign";
		}
	}
	return bot;
}

/*
	Name: add_bots
	Namespace: bot
	Checksum: 0xCFA739DA
	Offset: 0x6B0
	Size: 0x96
	Parameters: 2
	Flags: Linked
*/
function add_bots(count, team)
{
	if(!isdefined(count))
	{
		count = 1;
	}
	level endon(#"game_ended", #"remove_bot");
	for(i = 0; i < count; i++)
	{
		bot = add_bot(team);
		if(!isdefined(bot))
		{
			return;
		}
		waitframe(1);
	}
}

/*
	Name: remove_bots
	Namespace: bot
	Checksum: 0xC0B6BB8D
	Offset: 0x750
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function remove_bots(team)
{
	bots = function_b16926ea(team);
	foreach(bot in bots)
	{
		remove_bot(bot);
	}
}

/*
	Name: remove_random_bot
	Namespace: bot
	Checksum: 0x55FA89FD
	Offset: 0x808
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function remove_random_bot()
{
	bots = function_b16926ea();
	if(bots.size)
	{
		bot = bots[randomint(bots.size)];
		remove_bot(bot);
	}
}

/*
	Name: remove_bot
	Namespace: bot
	Checksum: 0x8F6F1314
	Offset: 0x870
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function remove_bot(bot)
{
	if(!isbot(bot) || function_2dd2fa57(bot))
	{
		return;
	}
	level notify(#"remove_bot");
	bot botdropclient();
}

/*
	Name: function_abe38e0f
	Namespace: bot
	Checksum: 0xFCF15078
	Offset: 0x8E8
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_abe38e0f()
{
	if(!isbot(self))
	{
		return;
	}
	self thread fixed_spawn_override();
	waitframe(1);
	self bottakemanualcontrol();
}

/*
	Name: function_96dddf6f
	Namespace: bot
	Checksum: 0x58BDC120
	Offset: 0x940
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_96dddf6f(params)
{
	if(!isbot(self))
	{
		return;
	}
	self thread respawn();
}

/*
	Name: on_player_connect
	Namespace: bot
	Checksum: 0x3B9EB7EB
	Offset: 0x988
	Size: 0x130
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_connect()
{
	if(!isbot(self))
	{
		return;
	}
	self endon(#"disconnect");
	if(!isdefined(self.bot))
	{
		self init_bot();
		self bot_difficulty::assign();
	}
	if(isdefined(self.var_29b433bd) && player_role::is_valid(self.var_29b433bd))
	{
		player_role::set(self.var_29b433bd);
		self.var_29b433bd = undefined;
	}
	if(!getdvarint(#"hash_1f80dbba75375e3d", 0))
	{
		customloadoutindex = self.pers[#"loadoutindex"];
		if(isdefined(customloadoutindex))
		{
			self [[level.curclass]]("custom" + customloadoutindex);
		}
	}
}

/*
	Name: on_player_spawned
	Namespace: bot
	Checksum: 0x9569DBE1
	Offset: 0xAC0
	Size: 0xDC
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_spawned()
{
	if(!isbot(self))
	{
		return;
	}
	self setgoal(self.origin);
	self forceupdategoalpos();
	self botreleasemanualcontrol();
	self thread function_b781f1e5();
	self thread fixed_spawn_override();
	if(is_true(self.bot.var_261b9ab3))
	{
		waitframe(1);
		self bottakemanualcontrol();
	}
}

/*
	Name: on_player_killed
	Namespace: bot
	Checksum: 0xAD34BB0C
	Offset: 0xBA8
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_player_killed(params)
{
	if(!isbot(self))
	{
		return;
	}
	self thread respawn();
}

/*
	Name: respawn
	Namespace: bot
	Checksum: 0xF973694C
	Offset: 0xBF0
	Size: 0x108
	Parameters: 0
	Flags: Linked, Private
*/
function private respawn()
{
	level endon(#"game_ended");
	self endon(#"disconnect", #"spawned", #"hash_3525e39d3694d0a9");
	self waittilltimeout(3, #"death_delay_finished");
	wait(0.1);
	if(is_true(getgametypesetting(#"hash_2b1f40bc711c41f3")))
	{
		self thread squad_spawn(0.1);
		return;
	}
	while(true)
	{
		self bottapbutton(3);
		wait(0.1);
	}
}

/*
	Name: squad_spawn
	Namespace: bot
	Checksum: 0x8D03BF5D
	Offset: 0xD00
	Size: 0x1F2
	Parameters: 1
	Flags: Linked, Private
*/
function private squad_spawn(var_2b6a7c31)
{
	level endon(#"game_ended");
	self endon(#"death", #"disconnect", #"spawned");
	while(!isdefined(self.spawn.var_e8f87696) || self.spawn.var_e8f87696 <= 0)
	{
		wait(var_2b6a7c31);
	}
	aliveplayers = function_a1cff525(self.squad);
	var_f2cc505e = [];
	foreach(player in aliveplayers)
	{
		if(!isdefined(player.var_83de62a2) || player.var_83de62a2 != 0)
		{
			continue;
		}
		var_f2cc505e[var_f2cc505e.size] = player;
	}
	if(var_f2cc505e.size > 0)
	{
		targetplayer = var_f2cc505e[randomint(var_f2cc505e.size)];
		self.spawn.var_e8f87696 = 0;
		self.spawn.response = "spawnOnPlayer";
		self.var_d690fc0b = targetplayer;
		return;
	}
	self.spawn.var_e8f87696 = 0;
	self.spawn.response = "autoSpawn";
}

/*
	Name: function_7291a729
	Namespace: bot
	Checksum: 0x6BB03AEA
	Offset: 0xF00
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7291a729()
{
	force = getdvarint(#"hash_5c4685215b35dda2", 0);
	self setgoal(self.origin, force);
	self forceupdategoalpos();
	self init_bot();
	self bot_difficulty::assign();
	self thread function_b781f1e5();
}

/*
	Name: function_99a2ecf5
	Namespace: bot
	Checksum: 0x4D6076F
	Offset: 0xFB8
	Size: 0x1E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_99a2ecf5()
{
	self notify(#"hash_3525e39d3694d0a9");
	self.bot = undefined;
}

/*
	Name: function_8481733a
	Namespace: bot
	Checksum: 0xA5FC9722
	Offset: 0xFE0
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8481733a()
{
	if(!isdefined(self.bot.difficulty) || is_true(self.bot.difficulty.var_ea800f8))
	{
		self function_3ca49c4e(0.8);
	}
	else
	{
		self function_3ca49c4e(0.1);
	}
}

/*
	Name: function_b781f1e5
	Namespace: bot
	Checksum: 0x23EA786
	Offset: 0x1070
	Size: 0x2B8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b781f1e5()
{
	self endoncallback(&function_de8f0d0e, #"death", #"hash_3525e39d3694d0a9");
	level endon(#"game_ended");
	self thread function_ef59c9e();
	self thread namespace_b20b4885::startup();
	while(game.state != #"playing")
	{
		waitframe(1);
	}
	while(true)
	{
		pixbeginevent();
		/#
			self function_ef4e01f();
			self function_cf9ffac7();
			self function_f76a8ac4();
		#/
		self function_a9fd7b4b();
		self function_4fb21bb4();
		self function_7d5bb412();
		self function_47281162();
		self function_ca477c1f();
		self function_1f098eb();
		self.bot.tpoint = function_ad6356f5(self.origin);
		self function_66749735();
		self function_1b14ddcf();
		self namespace_1d70329f::think();
		self namespace_87549638::think();
		self bot_action::think();
		self namespace_9c817acd::think();
		self namespace_b20b4885::think();
		self namespace_94e44221::update();
		self.bot.lastenemy = self.enemy;
		self check_stuck();
		self function_e4055765();
		pixendevent();
		waitframe(1);
	}
}

/*
	Name: function_de8f0d0e
	Namespace: bot
	Checksum: 0x745AB0F4
	Offset: 0x1330
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_de8f0d0e(notifyhash)
{
	self.bot.lastenemy = undefined;
	self.bot.var_b73d5099 = undefined;
	self.bot.var_538135ed = undefined;
	self.bot.var_9d03fb75 = undefined;
	self.bot.var_fad934a1 = undefined;
	self.bot.var_36df6398 = undefined;
	self clear_stuck();
	self bot_action::shutdown();
	self namespace_1d70329f::shutdown();
	self namespace_b20b4885::shutdown();
}

/*
	Name: function_a9fd7b4b
	Namespace: bot
	Checksum: 0x34B4E562
	Offset: 0x1400
	Size: 0x5E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a9fd7b4b()
{
	self.bot.flashed = self function_a8581873(1) <= 0 && isdefined(self.flashendtime) && (self.flashendtime + 1500) > gettime();
}

/*
	Name: function_4fb21bb4
	Namespace: bot
	Checksum: 0xD132F134
	Offset: 0x1468
	Size: 0x586
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4fb21bb4()
{
	if(isdefined(self.enemy) && self.bot.lastenemy !== self.enemy)
	{
		self.bot.var_b73d5099 = undefined;
	}
	pixbeginevent();
	if(self.combatstate == #"hash_25a4754a6175a242" || !isdefined(self.enemy) || !isalive(self.enemy) || self.bot.flashed || self function_ce3dfcfc(self.enemy))
	{
		self.bot.var_2cf887f8 = 0;
		self.bot.var_e8c84f98 = 0;
	}
	else
	{
		if(isplayer(self.enemy) && self.enemy isinvehicle() && !self.enemy isremotecontrolling())
		{
			vehicle = self.enemy getvehicleoccupied();
			visible = self cansee(vehicle, 250);
			self.bot.var_2cf887f8 = visible;
			self.bot.var_e8c84f98 = visible;
		}
		else
		{
			if(isplayer(self.enemy) && isdefined(self.enemy.prop))
			{
				prop = self.enemy.prop;
				visible = self cansee(prop, 250);
				self.bot.var_2cf887f8 = visible;
				if(visible)
				{
					self.bot.var_b73d5099 = gettime() + 4500;
					self.bot.var_e8c84f98 = 1;
				}
				else
				{
					var_ae19a93d = self.bot.var_b73d5099;
					self.bot.var_e8c84f98 = isdefined(var_ae19a93d) && gettime() < var_ae19a93d;
				}
				self.bot.var_e8c84f98 = visible || self cansee(prop, 4500);
			}
			else
			{
				if(self cansee(self.enemy, 250))
				{
					self.bot.var_2cf887f8 = 1;
					self.bot.var_e8c84f98 = 1;
				}
				else
				{
					if(isdefined(self.enemylastseentime))
					{
						self.bot.var_2cf887f8 = 0;
						self.bot.var_e8c84f98 = (self.enemylastseentime + 4500) >= gettime();
					}
					else
					{
						self.bot.var_2cf887f8 = 0;
						self.bot.var_e8c84f98 = 0;
					}
				}
			}
		}
	}
	if(!self.bot.var_e8c84f98 || self.bot.var_2cf887f8 || !isdefined(self.enemylastseenpos))
	{
		self.bot.var_a0b6205e = undefined;
	}
	else if(self.bot.var_e8c84f98)
	{
		if(!isdefined(self.bot.var_a0b6205e) || (isdefined(self.enemy) && self.bot.lastenemy !== self.enemy))
		{
			var_32bdb70 = self.origin - self.enemylastseenpos;
			normal = vectornormalize((var_32bdb70[0], var_32bdb70[1], 0));
			self.bot.var_a0b6205e = normal;
		}
	}
	/#
		if(self should_record(#"hash_44dd65804e74042e") && isdefined(self.bot.var_a0b6205e))
		{
			function_af72dbc5(self.enemylastseenpos, (0, -96, -64), (0, 96, 64), vectortoangles(self.bot.var_a0b6205e)[1], (1, 1, 0), "", self);
			recordcircle(self.enemylastseenpos + (vectorscale((0, 0, -1), 64)), 96, (1, 1, 0), "", self);
		}
	#/
	pixendevent();
}

/*
	Name: function_ce3dfcfc
	Namespace: bot
	Checksum: 0x2BE2024
	Offset: 0x19F8
	Size: 0x1E0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ce3dfcfc(enemy)
{
	if(!isdefined(enemy.targetname))
	{
		return false;
	}
	if(enemy.targetname != "uav" && enemy.targetname != "counteruav" && enemy.targetname != "recon_plane" && enemy.targetname != "chopper_gunner" && enemy.targetname != "ac130" && enemy.targetname != "hoverjet")
	{
		return false;
	}
	if(is_true(enemy.leaving))
	{
		return true;
	}
	if(isdefined(enemy.incoming_missile) && enemy.incoming_missile > 1)
	{
		return true;
	}
	weapons = self getweaponslist();
	foreach(weapon in weapons)
	{
		if(weapon.lockontype == #"hash_a6a8bcce6c1a902" && self getammocount(weapon) > 0)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_7d5bb412
	Namespace: bot
	Checksum: 0xD708451E
	Offset: 0x1BE0
	Size: 0xB2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7d5bb412()
{
	if(self.bot.var_2cf887f8)
	{
		self.bot.enemydist = distance(self.origin, self.enemy.origin);
	}
	else
	{
		if(self.bot.var_e8c84f98)
		{
			self.bot.enemydist = distance(self.origin, self.enemylastseenpos);
		}
		else
		{
			self.bot.enemydist = 1000;
		}
	}
}

/*
	Name: function_47281162
	Namespace: bot
	Checksum: 0x5FDD9114
	Offset: 0x1CA0
	Size: 0x9E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_47281162()
{
	if(!isdefined(self.enemy))
	{
		self.bot.var_e9ff4b76 = 0;
		return;
	}
	dir = self.enemy.origin - self.origin;
	enemyfwd = anglestoforward(self.enemy.angles);
	self.bot.var_e9ff4b76 = vectordot(enemyfwd, dir) > 0;
}

/*
	Name: function_ca477c1f
	Namespace: bot
	Checksum: 0x25D962BE
	Offset: 0x1D48
	Size: 0x9A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ca477c1f()
{
	if(!isdefined(self.enemy) || !issentient(self.enemy))
	{
		self.bot.var_faa25d47 = 0;
		return;
	}
	self.bot.var_faa25d47 = self attackedrecently(self.enemy, 10) || self.enemy attackedrecently(self, 10);
}

/*
	Name: function_1f098eb
	Namespace: bot
	Checksum: 0xABA077DE
	Offset: 0x1DF0
	Size: 0x56
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1f098eb()
{
	if(self.bot.var_e8c84f98)
	{
		self.bot.var_494658cd = function_ad6356f5(self.enemy.origin);
	}
	else
	{
		self.bot.var_494658cd = undefined;
	}
}

/*
	Name: function_66749735
	Namespace: bot
	Checksum: 0xABE24102
	Offset: 0x1E50
	Size: 0x448
	Parameters: 0
	Flags: Linked, Private
*/
function private function_66749735()
{
	pixbeginevent();
	if(!isdefined(level.var_934fb97))
	{
		pixendevent();
		return;
	}
	if(self.bot.var_e8c84f98 || self.bot.flashed || self function_e8e1d88e() > 0)
	{
		self.bot.var_538135ed = undefined;
		pixendevent();
		return;
	}
	if(!(!isdefined(self.bot.var_fad934a1) || self.bot.var_fad934a1 <= gettime()) && (!isdefined(self.bot.var_9d03fb75) || self.bot.var_9d03fb75 <= gettime()))
	{
		self.bot.var_538135ed = undefined;
		pixendevent();
		return;
	}
	var_23d5b7a6 = self.bot.var_538135ed;
	if(isdefined(var_23d5b7a6) && isdefined(var_23d5b7a6.gameobject) && !is_true(var_23d5b7a6.var_8d834202) && distance2dsquared(self.origin, var_23d5b7a6.origin) <= (600 * 600))
	{
		if(!isdefined(var_23d5b7a6.gameobject.canuseobject) || var_23d5b7a6.gameobject [[var_23d5b7a6.gameobject.canuseobject]](self))
		{
			pixendevent();
			return;
		}
	}
	tpoint = self.bot.tpoint;
	if(!isdefined(tpoint))
	{
		self.bot.var_538135ed = undefined;
		pixendevent();
		return;
	}
	pods = [];
	ents = getentitiesinradius(self.origin, 600, 6);
	weapon = level.var_934fb97.weapon;
	foreach(ent in ents)
	{
		if(!isdefined(ent.item) || !isdefined(ent.team) || ent.item != weapon || is_true(ent.var_9863caa6) || !isdefined(ent.gameobject))
		{
			continue;
		}
		if(ent.team != self.team && distance2dsquared(self.origin, ent.origin) > (120 * 120))
		{
			continue;
		}
		if(!ent.gameobject gameobjects::can_interact_with(self))
		{
			continue;
		}
		if(isdefined(ent.gameobject.canuseobject) && !ent.gameobject [[ent.gameobject.canuseobject]](self))
		{
			continue;
		}
		pods[pods.size] = ent;
	}
	if(pods.size <= 0)
	{
		self.bot.var_538135ed = undefined;
		pixendevent();
		return;
	}
	self.bot.var_538135ed = pods[randomint(pods.size)];
	pixendevent();
}

/*
	Name: function_1b14ddcf
	Namespace: bot
	Checksum: 0xF6B242A9
	Offset: 0x22A0
	Size: 0x14E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1b14ddcf()
{
	if(!isdefined(level.dogtags))
	{
		return;
	}
	var_ab80d451 = self getentitiesinrange(level.dogtags, 500, self.origin);
	if(var_ab80d451.size <= 0)
	{
		self.bot.var_36df6398 = undefined;
		return;
	}
	var_2a981f95 = arraysortclosest(var_ab80d451, self.origin);
	foreach(tag in var_2a981f95)
	{
		if(isdefined(tag.interactteam) && tag gameobjects::can_interact_with(self))
		{
			self.bot.var_36df6398 = tag;
			return;
		}
	}
	self.bot.var_36df6398 = undefined;
}

/*
	Name: clear_stuck
	Namespace: bot
	Checksum: 0x907E3228
	Offset: 0x23F8
	Size: 0x42
	Parameters: 0
	Flags: Linked, Private
*/
function private clear_stuck()
{
	self.bot.var_4208fe0e = undefined;
	self.bot.var_fc10153f = undefined;
	self.bot.var_ad331541 = undefined;
	self.bot.var_510b1057 = undefined;
}

/*
	Name: check_stuck
	Namespace: bot
	Checksum: 0x3B519108
	Offset: 0x2448
	Size: 0x84E
	Parameters: 0
	Flags: Linked, Private
*/
function private check_stuck()
{
	pixbeginevent();
	movedir = self move_dir();
	if(length2dsquared(movedir) <= 0 || self status_effect::function_4617032e(2))
	{
		self clear_stuck();
		pixendevent();
		return;
	}
	if(!isdefined(self.bot.positionhistory))
	{
		self.bot.positionhistory = [];
	}
	history = self.bot.positionhistory;
	history[history.size] = self.origin;
	if(history.size < level.var_38c34301)
	{
		pixendevent();
		return;
	}
	if(history.size > level.var_38c34301)
	{
		arrayremoveindex(history, 0);
	}
	var_ed68443 = 0;
	foreach(point in history)
	{
		distsq = distancesquared(self.origin, point);
		if(distsq > var_ed68443)
		{
			var_ed68443 = distsq;
		}
	}
	if(var_ed68443 > 5 * 5)
	{
		pixendevent();
		return;
	}
	self notify(#"hash_72f42e7610533d49");
	/#
		record3dtext(function_9e72a96(#"stuck"), self.origin, (1, 0, 1), "", undefined, 5);
		function_af72dbc5(self.origin, self getmaxs(), self getmins(), self.angles[1], (1, 0, 1), "");
		function_af72dbc5(self.origin, (64, 64, 0), (64 * -1, 64 * -1, 0), 0, (1, 0, 1), "");
		recordline(self.origin, self.origin + (movedir * 128), (1, 0, 1), "");
		foreach(point in history)
		{
			recordstar(point, (1, 0, 1), "", self);
		}
	#/
	ents = getentitiesinradius(self.origin, 64);
	ents = arraysortclosest(ents, self.origin);
	foreach(ent in ents)
	{
		if(ent == self || (vectordot(ent.origin - self.origin, movedir)) <= 0)
		{
			continue;
		}
		/#
			function_af72dbc5(ent.origin, ent getmins(), ent getmaxs(), ent.angles[1], (1, 0, 0), "");
			if(isdefined(ent.targetname))
			{
				record3dtext(ent.targetname, ent.origin, (1, 0, 0), "");
			}
		#/
		if(isdefined(ent.targetname) && ent.targetname == #"smart_cover")
		{
			self.bot.var_ad331541 = ent;
			break;
		}
		if(isdefined(ent.script_noteworthy) && ent.script_noteworthy == #"care_package" && ent isusable())
		{
			self.bot.var_510b1057 = ent;
			break;
		}
	}
	if(isdefined(self.bot.var_510b1057) || isdefined(self.bot.var_ad331541))
	{
		pixendevent();
		return;
	}
	eye = self.origin + (0, 0, self getplayerviewheight());
	if(!isdefined(self.bot.var_8e60176d))
	{
		self.bot.var_8e60176d = 0;
	}
	tracefwd = anglestoforward(self getplayerangles() + (0, self.bot.var_8e60176d, 0));
	self.bot.var_8e60176d = (self.bot.var_8e60176d + 36) % 360;
	end = eye + (tracefwd * 20);
	trace = bullettrace(eye, end, 0, self);
	surfacetype = trace[#"surfacetype"];
	if(isdefined(surfacetype) && surfacetype == #"glass" && !isdefined(trace[#"entity"]))
	{
		self notify(#"glass", {#position:trace[#"position"]});
		pixendevent();
		return;
	}
	var_901218a3 = self.origin + (0, 0, 16);
	glassradiusdamage(var_901218a3, 64, 3000, 3000);
	/#
		recordcircle(var_901218a3, 64, (1, 0, 0), "", self);
	#/
	pixendevent();
}

/*
	Name: function_ef59c9e
	Namespace: bot
	Checksum: 0x8202B73B
	Offset: 0x2CA0
	Size: 0xBA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ef59c9e()
{
	self endon(#"death", #"hash_3525e39d3694d0a9");
	level endon(#"game_ended");
	self.bot.var_3edc9d4d = undefined;
	while(true)
	{
		result = undefined;
		result = self waittill(#"glass");
		self.bot.var_3edc9d4d = result.position;
		wait(0.2);
		self.bot.var_3edc9d4d = undefined;
	}
}

/*
	Name: init_bot
	Namespace: bot
	Checksum: 0xA4286443
	Offset: 0x2D68
	Size: 0x122
	Parameters: 0
	Flags: Linked
*/
function init_bot()
{
	self.bot = {};
	self.bot.var_458ddbc0 = [];
	self.maxsightdistsqrd = 0 * 0;
	self.highlyawareradius = 96;
	self.fovcosine = fov_angle_to_cosine(179);
	self.fovcosinebusy = fov_angle_to_cosine(110);
	self botsetlooksensitivity(1, 1);
	self function_4f0b9564(7.5, 15);
	self function_3ca49c4e(1);
	self.goalradius = 512;
}

/*
	Name: fov_angle_to_cosine
	Namespace: bot
	Checksum: 0x13D73296
	Offset: 0x2E98
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function fov_angle_to_cosine(fovangle)
{
	if(!isdefined(fovangle))
	{
		fovangle = 0;
	}
	if(fovangle >= 180)
	{
		return 0;
	}
	return cos(fovangle / 2);
}

/*
	Name: move_dir
	Namespace: bot
	Checksum: 0x79453720
	Offset: 0x2EE8
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function move_dir()
{
	move = self getnormalizedmovement();
	fwd = anglestoforward(self.angles);
	right = anglestoright(self.angles);
	return (fwd * move[0]) + (right * move[1]);
}

/*
	Name: function_f0c35734
	Namespace: bot
	Checksum: 0xD5FDAD87
	Offset: 0x2F78
	Size: 0x112
	Parameters: 1
	Flags: None
*/
function function_f0c35734(trigger)
{
	/#
		assert(isbot(self));
	#/
	/#
		assert(isdefined(trigger));
	#/
	radius = self getpathfindingradius();
	height = self function_6a9ae71();
	heightoffset = (0, 0, (height * -1) / 2);
	var_e790dc87 = (radius, radius, height / 2);
	var_75ae35a4 = ai::function_470c0597(trigger.origin + heightoffset, trigger.maxs + var_e790dc87, trigger.angles);
	return var_75ae35a4;
}

/*
	Name: function_52947b70
	Namespace: bot
	Checksum: 0x1C8D3FE0
	Offset: 0x3098
	Size: 0x142
	Parameters: 1
	Flags: None
*/
function function_52947b70(trigger)
{
	/#
		assert(isbot(self));
	#/
	/#
		assert(isstruct(trigger));
	#/
	radius = self getpathfindingradius();
	height = self function_6a9ae71();
	heightoffset = (0, 0, (height * -1) / 2);
	var_e790dc87 = (radius, radius, height / 2);
	maxs = (trigger.script_width, trigger.script_length, trigger.script_height);
	var_75ae35a4 = ai::function_470c0597(trigger.origin + heightoffset, maxs + var_e790dc87, trigger.angles);
	return var_75ae35a4;
}

/*
	Name: function_e4055765
	Namespace: bot
	Checksum: 0x4CF49EAB
	Offset: 0x31E8
	Size: 0x414
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e4055765()
{
	var_458ddbc0 = self.bot.var_458ddbc0;
	foreach(bit, val in var_458ddbc0)
	{
		self bottapbutton(bit);
		if(val > 1)
		{
			var_458ddbc0[bit] = undefined;
		}
	}
	if(function_59116c33())
	{
		return;
	}
	if(getdvarint(#"hash_1a9061866669d862", 0))
	{
		weapon = self getcurrentweapon();
		if(weapon.firetype == #"hash_23fc6944af5b9753" || weapon.firetype == #"hash_6d442b2367a0f9d8" || weapon.firetype == #"minigun" || !self attackbuttonpressed())
		{
			self bottapbutton(0);
			if(weapon.dualwieldweapon != level.weaponnone)
			{
				self bottapbutton(11);
			}
		}
		else
		{
			self botreleasebutton(0);
			if(weapon.dualwieldweapon != level.weaponnone)
			{
				self botreleasebutton(11);
			}
		}
	}
	if(getdvarint(#"hash_79f45adceb86fee6", 0))
	{
		if(!self ismeleeing())
		{
			self bottapbutton(2);
		}
	}
	if(getdvarint(#"bot_forcestand", 0))
	{
		self botreleasebutton(9);
		self botreleasebutton(8);
	}
	else
	{
		if(getdvarint(#"hash_40c21bbf75d12604", 0))
		{
			self bottapbutton(9);
			self botreleasebutton(8);
		}
		else
		{
			if(getdvarint(#"hash_17afd6654d53591c", 0))
			{
				self botreleasebutton(9);
				self bottapbutton(8);
			}
			else if(getdvarint(#"hash_3049c8687f66a426", 0))
			{
				self botreleasebutton(9);
				self botreleasebutton(8);
				if(self isonground() && !self jumpbuttonpressed())
				{
					self bottapbutton(10);
				}
			}
		}
	}
}

/*
	Name: add_fixed_spawn_bot
	Namespace: bot
	Checksum: 0xF7C792A1
	Offset: 0x3608
	Size: 0xB0
	Parameters: 4
	Flags: Linked
*/
function add_fixed_spawn_bot(team, origin, yaw, var_f11eb5f2)
{
	if(!isdefined(var_f11eb5f2))
	{
		var_f11eb5f2 = undefined;
	}
	bot = add_bot(team);
	if(isdefined(bot))
	{
		if(isdefined(var_f11eb5f2) && var_f11eb5f2 >= 0)
		{
			bot.var_29b433bd = int(var_f11eb5f2);
		}
		bot.ignoreall = 1;
		bot function_bab12815(origin, yaw);
	}
	return bot;
}

/*
	Name: function_bab12815
	Namespace: bot
	Checksum: 0xCFACBED4
	Offset: 0x36C0
	Size: 0x7E
	Parameters: 2
	Flags: Linked
*/
function function_bab12815(origin, yaw)
{
	if(!isstruct(self.bot))
	{
		return;
	}
	self.pers[#"hash_63201776738fc052"] = origin;
	self.pers[#"hash_777e40938cf10f50"] = (0, yaw, 0);
	self.bot.var_6af67fd1 = 1;
}

/*
	Name: function_39d30bb6
	Namespace: bot
	Checksum: 0x5B7980B0
	Offset: 0x3748
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function function_39d30bb6(forcegoal)
{
	if(!isstruct(self.bot))
	{
		return;
	}
	self.bot.var_7280cc1b = forcegoal;
}

/*
	Name: function_bcc79b86
	Namespace: bot
	Checksum: 0x3877EAC3
	Offset: 0x3790
	Size: 0x66
	Parameters: 2
	Flags: Linked
*/
function function_bcc79b86(vehicle, seatindex)
{
	if(!isdefined(seatindex))
	{
		seatindex = undefined;
	}
	if(!isstruct(self.bot))
	{
		return;
	}
	self.bot.var_22989bf = vehicle;
	self.bot.var_a3d475e5 = seatindex;
}

/*
	Name: fixed_spawn_override
	Namespace: bot
	Checksum: 0x8E0F284C
	Offset: 0x3800
	Size: 0x14C
	Parameters: 0
	Flags: Linked, Private
*/
function private fixed_spawn_override()
{
	self endon(#"death", #"hash_6280ac8ed281ce3c");
	waittillframeend();
	if(!isstruct(self.bot))
	{
		return;
	}
	origin = self.pers[#"hash_63201776738fc052"];
	angles = self.pers[#"hash_777e40938cf10f50"];
	forcegoal = (isdefined(self.bot.var_7280cc1b) ? self.bot.var_7280cc1b : 1);
	if(isdefined(origin))
	{
		self.ignoreall = 1;
		self dontinterpolate();
		self setorigin(origin);
		if(isdefined(angles))
		{
			self setplayerangles(angles);
		}
		self setgoal(origin, forcegoal);
	}
	self function_50c012c9();
}

/*
	Name: function_50c012c9
	Namespace: bot
	Checksum: 0xF28333BB
	Offset: 0x3958
	Size: 0x170
	Parameters: 0
	Flags: Linked, Private
*/
function private function_50c012c9()
{
	if(!isstruct(self.bot))
	{
		return;
	}
	vehicle = self.bot.var_22989bf;
	seatindex = self.bot.var_a3d475e5;
	if(!isvehicle(vehicle))
	{
		return;
	}
	if(isint(seatindex) && !vehicle isvehicleseatoccupied(seatindex))
	{
		vehicle usevehicle(self, seatindex);
	}
	else
	{
		for(i = 0; i < 11; i++)
		{
			if(vehicle function_dcef0ba1(i))
			{
				var_3693c73b = vehicle function_defc91b2(i);
				if(isdefined(var_3693c73b) && var_3693c73b >= 0 && !vehicle isvehicleseatoccupied(i))
				{
					vehicle usevehicle(self, i);
					break;
				}
			}
		}
	}
}

/*
	Name: should_record
	Namespace: bot
	Checksum: 0xFEEFCAC7
	Offset: 0x3AD0
	Size: 0xB8
	Parameters: 1
	Flags: None
*/
function should_record(dvarstr)
{
	/#
		if(getdvarint(#"recorder_enablerec", 0) < 1 || getdvarint(dvarstr, 0) <= 0)
		{
			return 0;
		}
		botnum = getdvarint(#"hash_457b3d0b71e0fd8a", 0);
		if(botnum < 0)
		{
			return 1;
		}
		return self getentitynumber() == botnum;
	#/
}

/*
	Name: record_text
	Namespace: bot
	Checksum: 0xF7C15F49
	Offset: 0x3B98
	Size: 0x64
	Parameters: 3
	Flags: None
*/
function record_text(text, textcolor, dvarstr)
{
	/#
		if(self should_record(dvarstr))
		{
			record3dtext(text, self.origin, textcolor, "", self, 0.5);
		}
	#/
}

/*
	Name: function_ef4e01f
	Namespace: bot
	Checksum: 0xEBF9C946
	Offset: 0x3C08
	Size: 0xDC
	Parameters: 0
	Flags: Private
*/
function private function_ef4e01f()
{
	/#
		if(!self should_record(#"hash_1919da6e381816f7"))
		{
			return;
		}
		if(!isdefined(self.bot.difficulty))
		{
			record3dtext(function_9e72a96(#"hash_34d3ed856dad1a43"), self.origin, (1, 1, 1), "", self, 0.5);
			return;
		}
		record3dtext(self.bot.difficulty.name, self.origin, (1, 1, 1), "", self, 0.5);
	#/
}

/*
	Name: function_cf9ffac7
	Namespace: bot
	Checksum: 0xA445C29
	Offset: 0x3CF0
	Size: 0xC4
	Parameters: 0
	Flags: Private
*/
function private function_cf9ffac7()
{
	/#
		if(!self should_record(#"hash_44dd65804e74042e") && !self should_record(#"hash_15e4429f6d6deb52"))
		{
			return;
		}
		color = function_5d55f3c9(self.combatstate);
		record3dtext(function_9e72a96(self.combatstate), self.origin, color, "", self, 0.5);
	#/
}

/*
	Name: function_5d55f3c9
	Namespace: bot
	Checksum: 0x9C8D14B1
	Offset: 0x3DC0
	Size: 0x8E
	Parameters: 1
	Flags: Private
*/
function private function_5d55f3c9(combatstate)
{
	/#
		switch(combatstate)
		{
			case "combat_state_in_combat":
			{
				return (1, 0, 0);
			}
			case "combat_state_has_visible_enemy":
			{
				return (1, 0.5, 0);
			}
			case "hash_13ae5523119f0e4d":
			{
				return (1, 1, 0);
			}
			case "hash_25a4754a6175a242":
			{
				return (0, 1, 0);
			}
		}
		return (1, 1, 1);
	#/
}

/*
	Name: function_f76a8ac4
	Namespace: bot
	Checksum: 0x46AD4AD0
	Offset: 0x3E58
	Size: 0xDC
	Parameters: 0
	Flags: Private
*/
function private function_f76a8ac4()
{
	/#
		if(!self should_record(#"bot_recordgoal") || !isdefined(self get_revive_target()))
		{
			return;
		}
		target = self get_revive_target().origin;
		recordline(self.origin, target, (0, 1, 1), "", self);
		recordcircle(target, 32, (0, 1, 1), "", self);
	#/
}

/*
	Name: function_f86de15e
	Namespace: bot
	Checksum: 0xDC0FB54D
	Offset: 0x3F40
	Size: 0xDA
	Parameters: 3
	Flags: Variadic
*/
function function_f86de15e(val, maxval, ...)
{
	/#
		if(val <= 0)
		{
			return vararg[0];
		}
		if(val >= maxval)
		{
			return vararg[vararg.size - 1];
		}
		var_c0dabf48 = (val * vararg.size) / maxval;
		var_c0dabf48 = var_c0dabf48 - 1;
		colorindex = int(var_c0dabf48);
		colorfrac = var_c0dabf48 - colorindex;
		return vectorlerp(vararg[colorindex], vararg[colorindex + 1], colorfrac);
	#/
}

/*
	Name: function_e5d7f472
	Namespace: bot
	Checksum: 0x8D2843D3
	Offset: 0x4028
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_e5d7f472()
{
	return isdefined(self.bot.revivetarget) && isdefined(self.bot.revivetarget.revivetrigger);
}

/*
	Name: get_revive_target
	Namespace: bot
	Checksum: 0x6C8FF4A3
	Offset: 0x4068
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function get_revive_target()
{
	return self.bot.revivetarget;
}

/*
	Name: function_85bfe6d3
	Namespace: bot
	Checksum: 0xB26A909B
	Offset: 0x4088
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_85bfe6d3()
{
	if(isdefined(self.bot.revivetarget))
	{
		return self.bot.revivetarget.revivetrigger;
	}
	return undefined;
}

/*
	Name: set_revive_target
	Namespace: bot
	Checksum: 0x16A7236B
	Offset: 0x40C8
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function set_revive_target(target)
{
	self.bot.revivetarget = target;
}

/*
	Name: clear_revive_target
	Namespace: bot
	Checksum: 0x7AED3B4E
	Offset: 0x40F0
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function clear_revive_target()
{
	self.bot.revivetarget = undefined;
}

