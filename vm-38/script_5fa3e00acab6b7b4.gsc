#using script_18f0d22c75b141a7;
#using script_3f27a7b2232674db;
#using script_47fb62300ac0bd60;
#using script_6167e26342be354b;
#using script_68d2ee1489345a1d;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\overtime.gsc;

#namespace namespace_a77a81df;

/*
	Name: function_da95c595
	Namespace: namespace_a77a81df
	Checksum: 0xA302931D
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_da95c595()
{
	level notify(627657634);
}

/*
	Name: function_89f2df9
	Namespace: namespace_a77a81df
	Checksum: 0x38D2272B
	Offset: 0x138
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_ac6037cb01da0d4", &function_70a657d8, undefined, undefined, #"hash_53528dbbf6cd15c4");
}

/*
	Name: function_70a657d8
	Namespace: namespace_a77a81df
	Checksum: 0x5F47C4F
	Offset: 0x188
	Size: 0x26C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_46821767 = getdvarint(#"hash_661461deeee00da6", 0);
	telemetry::add_callback(#"hash_361e06db4b210e", &function_72c32279);
	telemetry::add_callback(#"hash_3ca80e35288a78d0", &function_d519e318);
	telemetry::add_callback(#"on_end_game", &function_f0ffff28);
	telemetry::add_callback(#"on_player_connect", &on_player_connect);
	telemetry::add_callback(#"on_player_disconnect", &on_player_disconnect);
	telemetry::add_callback(#"on_player_spawned", &on_player_spawned);
	telemetry::function_98df8818(#"hash_6602db5bc859fcd9", &function_55a7ded6);
	telemetry::function_98df8818(#"hash_fc0d1250fc48d49", &function_607901f4);
	telemetry::function_98df8818(#"hash_b88b6d2e0028e13", &function_abbc84ad);
	telemetry::add_callback(#"on_loadout", &function_e2162733);
	telemetry::function_98df8818(#"hash_540cddd637f71a5e", &function_c1165a2d);
	telemetry::function_98df8818(#"hash_37f96a1d3c57a089", &function_6c95006e);
}

/*
	Name: function_72c32279
	Namespace: namespace_a77a81df
	Checksum: 0x850B4BA1
	Offset: 0x400
	Size: 0x342
	Parameters: 0
	Flags: Linked
*/
function function_72c32279()
{
	if(util::isfirstround())
	{
		/#
			println("" + getutc());
			println("" + util::function_53bbf9d2());
			println("" + level.gametype);
			println("" + sessionmodeisprivateonlinegame());
			println("" + sessionmodeissystemlink());
			println("" + isdedicated());
			println("");
		#/
		utc = getutc();
		if(isdefined(game.telemetry))
		{
			game.telemetry.utc_start_time_s = utc;
		}
		matchstart = {};
		matchstart.utc_start_time_s = utc;
		matchstart.map = hash(util::function_53bbf9d2());
		matchstart.game_type = hash(level.gametype);
		matchstart.var_c8019fa4 = sessionmodeisprivateonlinegame();
		matchstart.is_offline = sessionmodeissystemlink();
		matchstart.var_cc957f27 = isdedicated();
		matchstart.var_b9e06742 = function_cd124b7c();
		matchstart.playlist_name = hash(function_970f37d1());
		matchstart.is_playtest = getdvarint(#"hash_4c63a0806012e032", 0);
		matchstart.var_a14949d8 = getdvarstring(#"hash_164a9a28628343ef", "");
		matchstart.var_ffa674c = gamemodeisarena();
		function_92d1707f(#"hash_2d8b6733f192c69b", matchstart);
	}
	if(util::isroundbased())
	{
		if(isdefined(game.telemetry))
		{
			game.telemetry.var_29d0de09 = function_f8d53445();
		}
	}
}

/*
	Name: function_d519e318
	Namespace: namespace_a77a81df
	Checksum: 0x9D9D6093
	Offset: 0x750
	Size: 0x794
	Parameters: 0
	Flags: Linked
*/
function function_d519e318()
{
	if(util::isoneround() || util::waslastround())
	{
		util::function_64ebd94d();
		/#
			println("" + function_f8d53445());
			println("" + gettime());
			println("" + util::function_53bbf9d2());
			println("" + level.gametype);
			println("" + getutc());
		#/
		utc = getutc();
		matchend = {};
		matchend.utc_start_time_s = 0;
		matchend.utc_end_time_s = utc;
		matchend.map = hash(util::function_53bbf9d2());
		matchend.game_type = hash(level.gametype);
		matchend.var_c8019fa4 = sessionmodeisprivateonlinegame();
		matchend.is_offline = sessionmodeissystemlink();
		matchend.var_cc957f27 = isdedicated();
		matchend.player_count = 0;
		matchend.life_count = 0;
		matchend.var_b9e06742 = function_cd124b7c();
		matchend.playlist_name = hash(function_970f37d1());
		matchend.is_playtest = getdvarint(#"hash_4c63a0806012e032", 0);
		matchend.var_a14949d8 = getdvarstring(#"hash_164a9a28628343ef", "");
		matchend.var_d21c921d = (isdefined(game.stat[#"teamscores"]) ? game.stat[#"teamscores"] : []);
		matchend.var_ffa674c = gamemodeisarena();
		teams = [];
		foreach(var_4c905113 in level.teams)
		{
			teams[teams.size] = var_3ac79a83;
		}
		matchend.teams = teams;
		if(isdefined(game.telemetry.utc_start_time_s))
		{
			time_seconds = utc - game.telemetry.utc_start_time_s;
			/#
				println("" + time_seconds);
			#/
			matchend.utc_start_time_s = game.telemetry.utc_start_time_s;
		}
		match_duration = function_f8d53445() / 1000;
		/#
			println("" + match_duration);
		#/
		if(isdefined(game.telemetry.player_count))
		{
			/#
				println("" + game.telemetry.player_count);
			#/
			matchend.player_count = game.telemetry.player_count;
		}
		if(isdefined(game.telemetry.life_count))
		{
			/#
				println("" + game.telemetry.life_count);
			#/
			matchend.life_count = game.telemetry.life_count;
		}
		if(function_feface0c())
		{
			var_3b7c8f8c = function_6997ae82();
			if(isdefined(var_3b7c8f8c))
			{
				matchend.var_c517822c = (isdefined(var_3b7c8f8c.votesforprev) ? var_3b7c8f8c.votesforprev : 0);
				matchend.var_5bdd51ff = (isdefined(var_3b7c8f8c.votesfornext) ? var_3b7c8f8c.votesfornext : 0);
				matchend.var_b1f1e8df = (isdefined(var_3b7c8f8c.votesforrandom) ? var_3b7c8f8c.votesforrandom : 0);
				matchend.var_33f196e0 = (isdefined(var_3b7c8f8c.var_bc0c5ed6) ? var_3b7c8f8c.var_bc0c5ed6 : 0);
				matchend.var_c35af8bc = (isdefined(var_3b7c8f8c.var_f6de7b09) ? var_3b7c8f8c.var_f6de7b09 : 0);
				matchend.var_cc8e62ce = (isdefined(var_3b7c8f8c.var_6441c8d) ? var_3b7c8f8c.var_6441c8d : 0);
			}
		}
		function_92d1707f(#"hash_1b52f03009c8c97e", matchend);
		/#
			println("");
		#/
	}
	if(util::isroundbased())
	{
		if(isdefined(game.telemetry.var_29d0de09))
		{
			roundend = {};
			roundend.var_29d0de09 = game.telemetry.var_29d0de09;
			roundend.var_b0ab3472 = function_f8d53445();
			roundend.var_d21c921d = (isdefined(game.stat[#"teamscores"]) ? game.stat[#"teamscores"] : []);
			roundend.var_e394d7c0 = util::getroundsplayed();
			roundend.overtime_round = overtime::is_overtime_round();
			function_92d1707f(#"hash_4aeb25514c599057", roundend);
		}
	}
}

/*
	Name: on_player_connect
	Namespace: namespace_a77a81df
	Checksum: 0xDCADBAC1
	Offset: 0xEF0
	Size: 0x4D4
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(!is_true(self.pers[#"telemetry"].connected))
	{
		/#
			println("" + gettime());
			println("" + getutc());
			println("" + self.name);
		#/
		self.pers[#"weaponstats"] = [];
		if(!isdefined(self.pers[#"telemetry"]))
		{
			self.pers[#"telemetry"] = {};
		}
		self.pers[#"telemetry"].utc_connect_time_s = getutc();
		self.pers[#"telemetry"].connected = 1;
		self.pers[#"telemetry"].var_35a0b8bd = self rank::getrankxp();
		self.pers[#"telemetry"].var_a1938c60 = self rank::function_5b197def(0);
		self.pers[#"telemetry"].var_970f034c = self rank::function_5b197def(1);
		self.pers[#"telemetry"].var_43ab3c14 = self rank::function_5b197def(2);
		self.pers[#"telemetry"].var_9c4d3f78 = self rank::function_5b197def(3);
		self.pers[#"telemetry"].var_12173831 = self rank::function_5b197def(5);
		self.pers[#"telemetry"].var_9f177532 = self rank::getrank();
		self.pers[#"telemetry"].var_af870172 = self rank::function_f2363c2d();
		if(isdefined(game.telemetry.player_count))
		{
			self.pers[#"telemetry"].var_6ba64843 = game.telemetry.player_count;
			game.telemetry.player_count++;
			/#
				println("" + game.telemetry.player_count);
			#/
		}
		else
		{
			/#
				println("");
			#/
			return;
		}
		/#
			println("");
		#/
		playerdata = {};
		playerdata.utc_connect_time_s = self.pers[#"telemetry"].utc_connect_time_s;
		playerdata.var_6ba64843 = (isdefined(self.pers[#"telemetry"].var_6ba64843) ? self.pers[#"telemetry"].var_6ba64843 : 0);
		playerdata.var_524ab934 = self function_d40f1a0e();
		playerdata.var_504e19f4 = self function_21f71ac8();
		playerdata.var_68441d6f = self function_325dc923();
		self function_678f57c8(#"hash_2d1a41c5bbfe18dd", playerdata);
	}
}

/*
	Name: on_player_disconnect
	Namespace: namespace_a77a81df
	Checksum: 0x5780DE19
	Offset: 0x13D0
	Size: 0xDD4
	Parameters: 0
	Flags: Linked
*/
function on_player_disconnect()
{
	if(!is_true(self.pers[#"telemetry"].connected))
	{
		return;
	}
	self.pers[#"telemetry"].connected = 0;
	playerdata = {};
	/#
		println("" + self.name);
		println("" + gettime());
	#/
	playerdata.utc_connect_time_s = 0;
	playerdata.utc_disconnect_time_s = 0;
	playerdata.var_37b8e421 = 0;
	utc = getutc();
	if(isdefined(self.pers[#"telemetry"].utc_connect_time_s))
	{
		playerdata.utc_connect_time_s = self.pers[#"telemetry"].utc_connect_time_s;
		playerdata.utc_disconnect_time_s = utc;
		playerdata.var_37b8e421 = utc - playerdata.utc_connect_time_s;
	}
	playerdata.var_6ba64843 = (isdefined(self.pers[#"telemetry"].var_6ba64843) ? self.pers[#"telemetry"].var_6ba64843 : 0);
	if(isdefined(self.pers))
	{
		playerdata.score = (isdefined(self.pers[#"score"]) ? self.pers[#"score"] : 0);
		playerdata.kills = (isdefined(self.pers[#"kills"]) ? self.pers[#"kills"] : 0);
		playerdata.deaths = (isdefined(self.pers[#"deaths"]) ? self.pers[#"deaths"] : 0);
		playerdata.headshots = (isdefined(self.pers[#"headshots"]) ? self.pers[#"headshots"] : 0);
		playerdata.assists = (isdefined(self.pers[#"assists"]) ? self.pers[#"assists"] : 0);
		playerdata.damage_dealt = (isdefined(self.pers[#"damagedone"]) ? self.pers[#"damagedone"] : 0);
		playerdata.suicides = (isdefined(self.pers[#"suicides"]) ? self.pers[#"suicides"] : 0);
		playerdata.shots = (isdefined(self.pers[#"shotsfired"]) ? self.pers[#"shotsfired"] : 0);
		playerdata.hits = (isdefined(self.pers[#"shotshit"]) ? self.pers[#"shotshit"] : 0);
		playerdata.time_played_alive = (isdefined(self.pers[#"time_played_alive"]) ? self.pers[#"time_played_alive"] : 0);
		playerdata.var_ef5017c7 = (isdefined(self.pers[#"best_kill_streak"]) ? self.pers[#"best_kill_streak"] : 0);
		playerdata.multikills = (isdefined(self.pers[#"hash_104ec9727c3d4ef7"]) ? self.pers[#"hash_104ec9727c3d4ef7"] : 0);
		playerdata.var_fc1e4ef3 = (isdefined(self.pers[#"highestmultikill"]) ? self.pers[#"highestmultikill"] : 0);
		playerdata.ekia = (isdefined(self.pers[#"ekia"]) ? self.pers[#"ekia"] : 0);
	}
	playerdata.var_35a0b8bd = (isdefined(self.pers[#"telemetry"].var_35a0b8bd) ? self.pers[#"telemetry"].var_35a0b8bd : 0);
	playerdata.var_f29581ce = self rank::getrankxp();
	playerdata.var_a1938c60 = (isdefined(self.pers[#"telemetry"].var_a1938c60) ? self.pers[#"telemetry"].var_a1938c60 : 0);
	playerdata.var_7ddf8420 = self rank::function_5b197def(0);
	playerdata.var_970f034c = (isdefined(self.pers[#"telemetry"].var_970f034c) ? self.pers[#"telemetry"].var_970f034c : 0);
	playerdata.var_b7d93a80 = self rank::function_5b197def(1);
	playerdata.var_43ab3c14 = (isdefined(self.pers[#"telemetry"].var_43ab3c14) ? self.pers[#"telemetry"].var_43ab3c14 : 0);
	playerdata.var_460c9ce = self rank::function_5b197def(2);
	playerdata.var_9c4d3f78 = (isdefined(self.pers[#"telemetry"].var_9c4d3f78) ? self.pers[#"telemetry"].var_9c4d3f78 : 0);
	playerdata.var_5f67b464 = self rank::function_5b197def(3);
	playerdata.var_12173831 = (isdefined(self.pers[#"telemetry"].var_12173831) ? self.pers[#"telemetry"].var_12173831 : 0);
	playerdata.var_c4d676ee = self rank::function_5b197def(5);
	playerdata.var_9f177532 = (isdefined(self.pers[#"telemetry"].var_9f177532) ? self.pers[#"telemetry"].var_9f177532 : 0);
	playerdata.var_735f5996 = self rank::getrank();
	playerdata.var_af870172 = (isdefined(self.pers[#"telemetry"].var_af870172) ? self.pers[#"telemetry"].var_af870172 : 0);
	playerdata.var_7d032a98 = self rank::function_f2363c2d();
	playerdata.objectives = (isdefined(self.objectives) ? self.objectives : 0);
	if(!is_true(level.disablestattracking))
	{
		playerdata.var_9ffd4086 = self stats::function_441050ca(#"kills");
		playerdata.var_56c22769 = self stats::function_441050ca(#"deaths");
		playerdata.var_3c57e59 = self stats::function_441050ca(#"wins");
		playerdata.var_e42ad7c9 = self stats::function_441050ca(#"losses");
		playerdata.var_270e8e42 = self stats::function_441050ca(#"ties");
		playerdata.var_4c4d425a = self stats::function_441050ca(#"hits");
		playerdata.var_5197016d = self stats::function_441050ca(#"misses");
		playerdata.var_359ee86a = self stats::function_441050ca(#"time_played_total");
		playerdata.var_4ab9220a = self stats::function_441050ca(#"score");
	}
	playerdata.operator = 0;
	role = self player_role::get();
	if(sessionmodeismultiplayergame() || function_f99d2668())
	{
		var_a791abd1 = function_b14806c6(role, currentsessionmode());
		playerdata.operator = (isdefined(var_a791abd1) ? var_a791abd1 : 0);
	}
	playerdata.var_161a9fc9 = 0;
	var_a38b89a4 = (isdefined(self.pers[#"telemetry"].life.var_4f7ff485) ? self.pers[#"telemetry"].life.var_4f7ff485 : -1);
	lifeindex = (isdefined(self.pers[#"telemetry"].life.life_index) ? self.pers[#"telemetry"].life.life_index : -1);
	if(var_a38b89a4 != lifeindex)
	{
		data = {};
		data.victim = self;
		data.attacker = undefined;
		data.weapon = undefined;
		data.victimweapon = self.currentweapon;
		data.var_d18366fd = 1;
		playerdata.var_161a9fc9 = 1;
		if(isalive(self))
		{
			data.died = 0;
		}
		else
		{
			data.died = 1;
		}
		if(isdefined(self.pers[#"telemetry"].life))
		{
			self.pers[#"telemetry"].life.var_75cd3884 = function_f8d53445();
		}
		function_607901f4(data);
	}
	self function_678f57c8(#"hash_4a80e3ea4f031ba4", playerdata);
	self function_21b451d5(playerdata.score, playerdata.kills, playerdata.deaths, playerdata.headshots, playerdata.assists, playerdata.suicides, playerdata.var_35a0b8bd, playerdata.var_f29581ce, playerdata.var_9f177532, playerdata.var_735f5996, playerdata.time_played_alive);
	self function_792e6d18();
}

/*
	Name: on_player_spawned
	Namespace: namespace_a77a81df
	Checksum: 0x60F46933
	Offset: 0x21B0
	Size: 0x304
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(!isdefined(self.pers[#"telemetry"]))
	{
		self.pers[#"telemetry"] = {};
	}
	self.pers[#"telemetry"].life = {};
	self.pers[#"telemetry"].life.var_62c7b24e = function_f8d53445();
	self.pers[#"telemetry"].life.spawn_origin = self.origin;
	self.pers[#"telemetry"].life.var_cc189f4f = (isdefined(self.pers[#"score"]) ? self.pers[#"score"] : 0);
	self.pers[#"telemetry"].life.var_a04d3223 = (isdefined(self.pers[#"assists"]) ? self.pers[#"assists"] : 0);
	self.pers[#"telemetry"].life.var_75f84f99 = (isdefined(self.pers[#"kills"]) ? self.pers[#"kills"] : 0);
	self.pers[#"telemetry"].life.var_3ba59e4e = [];
	if(isdefined(game.telemetry.life_count))
	{
		self.pers[#"telemetry"].life.life_index = game.telemetry.life_count;
		game.telemetry.life_count++;
		/#
			println("" + self.name);
			println("" + game.telemetry.life_count);
		#/
	}
	/#
		println("");
	#/
}

/*
	Name: function_f0ffff28
	Namespace: namespace_a77a81df
	Checksum: 0x8E6FA0F4
	Offset: 0x24C0
	Size: 0x23C
	Parameters: 0
	Flags: Linked
*/
function function_f0ffff28()
{
	var_87e50fa8 = function_f8d53445();
	var_a7dd086f = isalive(self);
	telemetry::function_f397069a();
	if(var_a7dd086f && isdefined(self))
	{
		var_a38b89a4 = (isdefined(self.pers[#"telemetry"].life.var_4f7ff485) ? self.pers[#"telemetry"].life.var_4f7ff485 : -1);
		lifeindex = (isdefined(self.pers[#"telemetry"].life.life_index) ? self.pers[#"telemetry"].life.life_index : -1);
		if(var_a38b89a4 != lifeindex)
		{
			data = {};
			data.victim = self;
			data.attacker = undefined;
			data.weapon = undefined;
			data.victimweapon = self.currentweapon;
			data.died = 0;
			if(isdefined(self.pers[#"telemetry"].life))
			{
				self.pers[#"telemetry"].life.var_75cd3884 = var_87e50fa8;
			}
			function_607901f4(data);
		}
	}
	if(isdefined(self))
	{
		self killstreaks::function_ef1303ba(var_87e50fa8, #"game_ended");
	}
}

/*
	Name: function_55a7ded6
	Namespace: namespace_a77a81df
	Checksum: 0xF4B5755D
	Offset: 0x2708
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_55a7ded6(data)
{
	if(!isplayer(data.victim))
	{
		return;
	}
	if(isdefined(data.victim.pers[#"telemetry"].life))
	{
		data.victim.pers[#"telemetry"].life.var_75cd3884 = function_f8d53445();
	}
	if(isdefined(data.victim.var_c8836f02))
	{
		data.var_cc4bc1dd = arraycopy(data.victim.var_c8836f02);
	}
	/#
		println("" + data.victim.name);
		println("" + function_f8d53445());
	#/
}

/*
	Name: function_607901f4
	Namespace: namespace_a77a81df
	Checksum: 0xA7BA66F1
	Offset: 0x2848
	Size: 0xF8A
	Parameters: 1
	Flags: Linked
*/
function function_607901f4(data)
{
	if(!isdefined(data.victim) || !isplayer(data.victim))
	{
		return;
	}
	/#
		println("" + data.victim.name);
		println("" + function_f8d53445());
	#/
	died = 1;
	if(isdefined(data.died))
	{
		died = data.died;
	}
	var_37d8e38f = {};
	var_37d8e38f.died = died;
	var_37d8e38f.var_161a9fc9 = (isdefined(data.var_d18366fd) ? data.var_d18366fd : 0);
	var_37d8e38f.var_62c7b24e = 0;
	var_37d8e38f.var_75cd3884 = 0;
	var_37d8e38f.var_39872854 = 0;
	if(isdefined(data.victim.pers[#"telemetry"].life.var_62c7b24e))
	{
		var_37d8e38f.var_62c7b24e = data.victim.pers[#"telemetry"].life.var_62c7b24e;
		if(isdefined(data.victim.pers[#"telemetry"].life.var_75cd3884))
		{
			var_37d8e38f.var_75cd3884 = data.victim.pers[#"telemetry"].life.var_75cd3884;
			var_37d8e38f.var_39872854 = var_37d8e38f.var_75cd3884 - var_37d8e38f.var_62c7b24e;
		}
	}
	var_37d8e38f.var_5b58152b = (isdefined(data.victim.var_6fd69072) ? data.victim.var_6fd69072 : 0);
	var_37d8e38f.var_41d1b088 = (isdefined(data.victim.var_8cb03411) ? data.victim.var_8cb03411 : 0);
	var_37d8e38f.var_f079a94e = 0;
	if(squad_spawn::function_d072f205())
	{
		var_37d8e38f.var_f079a94e = 1;
	}
	var_37d8e38f.spawn_type = (isdefined(data.victim.spawn.var_a9914487) ? data.victim.spawn.var_a9914487 : 0);
	var_37d8e38f.var_d5eb9cb8 = (isdefined(data.victim.spawn.var_4db23b) ? data.victim.spawn.var_4db23b : 0);
	var_37d8e38f.team = data.victim.team;
	var_37d8e38f.life_index = -1;
	if(isdefined(data.victim.pers[#"telemetry"].life.life_index))
	{
		var_37d8e38f.life_index = data.victim.pers[#"telemetry"].life.life_index;
	}
	if(isdefined(data.victim.pers[#"telemetry"].life.spawn_origin))
	{
		var_37d8e38f.spawn_pos_x = data.victim.pers[#"telemetry"].life.spawn_origin[0];
		var_37d8e38f.spawn_pos_y = data.victim.pers[#"telemetry"].life.spawn_origin[1];
		var_37d8e38f.spawn_pos_z = data.victim.pers[#"telemetry"].life.spawn_origin[2];
	}
	var_37d8e38f.var_e399fbd4 = !data.victim gamepadusedlast();
	var_37d8e38f.attacker_life_index = -1;
	if(died)
	{
		victimorigin = (isdefined(data.victimorigin) ? data.victimorigin : data.victim.origin);
		var_37d8e38f.var_a8ffa14f = victimorigin[0];
		var_37d8e38f.var_e6a11c91 = victimorigin[1];
		var_37d8e38f.var_d4717832 = victimorigin[2];
		var_5fceefd4 = (isdefined(data.var_5fceefd4) ? data.var_5fceefd4 : data.victim getplayerangles());
		var_37d8e38f.var_7c125af5 = var_5fceefd4[0];
		var_37d8e38f.var_8d9bfe08 = var_5fceefd4[1];
		var_37d8e38f.var_506d83ac = var_5fceefd4[2];
		var_37d8e38f.var_873aa898 = hash((isdefined(data.victimstance) ? data.victimstance : data.victim getstance()));
		var_37d8e38f.means_of_death = hash((isdefined(data.smeansofdeath) ? data.smeansofdeath : ""));
		var_37d8e38f.hit_location = hash((isdefined(data.shitloc) ? data.shitloc : ""));
		var_37d8e38f.victim_ads_value = data.var_f0b3c772;
		if(isdefined(data.victimweapon))
		{
			var_37d8e38f.victim_weapon = data.victimweapon.name;
			var_37d8e38f.victim_weapon_attachments = function_8d2c5f27((isdefined(data.victimweapon.attachments) ? data.victimweapon.attachments : []));
		}
		if(isdefined(data.attacker) && isplayer(data.attacker))
		{
			attackerpos = (isdefined(data.attackerorigin) ? data.attackerorigin : data.attacker.origin);
			var_83634238 = (isdefined(data.var_83634238) ? data.var_83634238 : data.attacker getplayerangles());
			var_37d8e38f.attacker_pos_x = attackerpos[0];
			var_37d8e38f.attacker_pos_y = attackerpos[1];
			var_37d8e38f.attacker_pos_z = attackerpos[2];
			var_37d8e38f.attacker_angle_x = var_83634238[0];
			var_37d8e38f.attacker_angle_y = var_83634238[1];
			var_37d8e38f.attacker_angle_z = var_83634238[2];
			var_37d8e38f.var_4d858e3d = hash((isdefined(data.attackerstance) ? data.attackerstance : ""));
			var_37d8e38f.attacker_ads_value = data.attacker playerads();
			var_37d8e38f.var_11737fc2 = util::within_fov(attackerpos, var_83634238, data.victimorigin, 0.5);
			var_37d8e38f.var_cc3e142b = util::within_fov(data.victimorigin, var_5fceefd4, attackerpos, 0.5);
			var_37d8e38f.var_67fadda6 = !data.attacker gamepadusedlast();
			var_37d8e38f.attacker_life_index = (isdefined(data.attacker.pers[#"telemetry"].life.life_index) ? data.attacker.pers[#"telemetry"].life.life_index : -1);
			var_37d8e38f.var_8e368e7c = (isdefined(data.attacker.pers[#"telemetry"].var_ee8d3324) ? data.attacker.pers[#"telemetry"].var_ee8d3324 : 0);
		}
		if(isdefined(data.weapon))
		{
			var_37d8e38f.attacker_weapon = data.weapon.name;
			weapon_attachments = data.weapon.attachments;
			if(weapon_attachments.size > 0)
			{
				var_4e00795d = [];
				for(i = 0; i < weapon_attachments.size; i++)
				{
					var_4e00795d[i] = hash(weapon_attachments[i]);
				}
				var_37d8e38f.attacker_weapon_attachments = var_4e00795d;
			}
		}
	}
	var_37d8e38f.var_5bf208a0 = 0;
	if(isdefined(data.victim.class_num))
	{
		if(!isdefined(data.victim.pers[#"telemetry"].var_728f5d7d))
		{
			data.victim.pers[#"telemetry"].var_728f5d7d = [];
		}
		var_6165a2d8 = data.victim.pers[#"telemetry"].var_ee8d3324;
		if(isdefined(var_6165a2d8))
		{
			var_75000956 = data.victim.pers[#"telemetry"].var_728f5d7d;
			sent = 0;
			for(i = 0; i < var_75000956.size; i++)
			{
				if(var_75000956[i] == var_6165a2d8)
				{
					sent = 1;
					break;
				}
			}
			if(!sent)
			{
				var_75000956[var_75000956.size] = var_6165a2d8;
				/#
					println("" + var_6165a2d8);
				#/
				function_6d57b52a(data.victim, var_6165a2d8, data.var_cc4bc1dd);
			}
			var_37d8e38f.var_5bf208a0 = var_6165a2d8;
		}
	}
	var_37d8e38f.var_123cae71 = isdefined(data.victim.pickedupweapons[data.victimweapon]);
	var_37d8e38f.var_8c6afa1f = isdefined(data.attacker.pickedupweapons[data.weapon]);
	if(!isdefined(data.victim.pers[#"score"]))
	{
		data.victim.pers[#"score"] = 0;
	}
	var_37d8e38f.score_earned = data.victim.pers[#"score"] - data.victim.pers[#"telemetry"].life.var_cc189f4f;
	if(!isdefined(data.victim.pers[#"assists"]))
	{
		data.victim.pers[#"assists"] = 0;
	}
	var_37d8e38f.assists = data.victim.pers[#"assists"] - data.victim.pers[#"telemetry"].life.var_a04d3223;
	if(!isdefined(data.victim.pers[#"kills"]))
	{
		data.victim.pers[#"kills"] = 0;
	}
	var_37d8e38f.kills = data.victim.pers[#"kills"] - data.victim.pers[#"telemetry"].life.var_75f84f99;
	var_37d8e38f.var_1af2a81e = data.victim.pers[#"telemetry"].life.var_3ba59e4e;
	/#
		println("" + var_37d8e38f.life_index);
	#/
	if(isdefined(data.attacker) && isplayer(data.attacker))
	{
		data.victim function_678f57c8(#"hash_56b3bb4a34717783", var_37d8e38f, #"attacker", data.attacker);
	}
	else
	{
		data.victim function_678f57c8(#"hash_56b3bb4a34717783", var_37d8e38f);
	}
	data.victim.pers[#"telemetry"].life.var_4f7ff485 = var_37d8e38f.life_index;
}

/*
	Name: function_6d57b52a
	Namespace: namespace_a77a81df
	Checksum: 0xAF0BC850
	Offset: 0x37E0
	Size: 0x754
	Parameters: 3
	Flags: Linked
*/
function function_6d57b52a(player, var_6165a2d8, var_cc4bc1dd)
{
	var_2153b0fe = {};
	var_2153b0fe.var_5bf208a0 = var_6165a2d8;
	primaryweapon = player loadout::function_18a77b37("primary");
	if(isdefined(primaryweapon))
	{
		var_2153b0fe.primary_weapon = primaryweapon.name;
		var_2153b0fe.primary_weapon_attachments = function_8d2c5f27((isdefined(primaryweapon.attachments) ? primaryweapon.attachments : []));
		var_df9e1af5 = player function_e601ff48(player.class_num, 0);
		var_ff1e2369 = function_69031255(primaryweapon, var_df9e1af5);
		var_2153b0fe.var_4be85015 = (isdefined(var_ff1e2369.var_a6b3fd45) ? var_ff1e2369.var_a6b3fd45 : 0);
		primaryweaponoptions = player function_ade49959(primaryweapon);
		primarycamoindex = getcamoindex(primaryweaponoptions);
		var_cc073e42 = function_6f89999e(primarycamoindex);
		var_2153b0fe.var_5eb8cc7c = (isdefined(var_cc073e42) ? var_cc073e42 : 0);
	}
	secondaryweapon = player loadout::function_18a77b37("secondary");
	if(isdefined(secondaryweapon))
	{
		var_2153b0fe.secondary_weapon = secondaryweapon.name;
		var_2153b0fe.var_85aac3ff = function_8d2c5f27((isdefined(secondaryweapon.attachments) ? secondaryweapon.attachments : []));
		var_48d617f1 = player function_e601ff48(player.class_num, 14);
		var_96a1671e = function_69031255(secondaryweapon, var_48d617f1);
		var_2153b0fe.var_61e93312 = (isdefined(var_96a1671e.var_a6b3fd45) ? var_96a1671e.var_a6b3fd45 : 0);
		secondaryweaponoptions = player function_ade49959(secondaryweapon);
		secondarycamoindex = getcamoindex(secondaryweaponoptions);
		var_e1e3c149 = function_6f89999e(secondarycamoindex);
		var_2153b0fe.var_a656d9c6 = (isdefined(var_e1e3c149) ? var_e1e3c149 : 0);
	}
	primarygrenade = player loadout::function_18a77b37("primarygrenade");
	if(isdefined(primarygrenade))
	{
		var_2153b0fe.primary_grenade = primarygrenade.name;
	}
	secondarygrenade = player loadout::function_18a77b37("secondarygrenade");
	if(isdefined(secondarygrenade))
	{
		var_2153b0fe.secondary_grenade = secondarygrenade.name;
	}
	fieldupgrade = player loadout::function_18a77b37("specialgrenade");
	if(isdefined(fieldupgrade))
	{
		var_2153b0fe.field_upgrade = fieldupgrade.name;
	}
	if(isdefined(var_cc4bc1dd))
	{
		var_2153b0fe.perks = [5:0, 4:0, 3:0, 2:0, 1:0, 0:0];
		switch(var_cc4bc1dd.size)
		{
			case 6:
			default:
			{
				var_2153b0fe.perks[5] = var_cc4bc1dd[5].var_3cf2d21;
			}
			case 5:
			{
				var_2153b0fe.perks[4] = var_cc4bc1dd[4].var_3cf2d21;
			}
			case 4:
			{
				var_2153b0fe.perks[3] = var_cc4bc1dd[3].var_3cf2d21;
			}
			case 3:
			{
				var_2153b0fe.perks[2] = var_cc4bc1dd[2].var_3cf2d21;
			}
			case 2:
			{
				var_2153b0fe.perks[1] = var_cc4bc1dd[1].var_3cf2d21;
			}
			case 1:
			{
				var_2153b0fe.perks[0] = var_cc4bc1dd[0].var_3cf2d21;
			}
			case 0:
			{
				break;
			}
		}
	}
	wildcards = player function_6f2c0492(player.class_num);
	if(isdefined(wildcards))
	{
		var_2153b0fe.wildcards = [2:0, 1:0, 0:0];
		switch(wildcards.size)
		{
			case 3:
			default:
			{
				var_2153b0fe.wildcards[2] = wildcards[2];
			}
			case 2:
			{
				var_2153b0fe.wildcards[1] = wildcards[1];
			}
			case 1:
			{
				var_2153b0fe.wildcards[0] = wildcards[0];
			}
			case 0:
			{
				break;
			}
		}
	}
	killstreaks = player.killstreak;
	if(isdefined(killstreaks))
	{
		var_2153b0fe.killstreaks = [2:0, 1:0, 0:0];
		switch(killstreaks.size)
		{
			case 3:
			default:
			{
				var_2153b0fe.killstreaks[2] = killstreaks[2];
			}
			case 2:
			{
				var_2153b0fe.killstreaks[1] = killstreaks[1];
			}
			case 1:
			{
				var_2153b0fe.killstreaks[0] = killstreaks[0];
			}
			case 0:
			{
				break;
			}
		}
	}
	player function_678f57c8(#"hash_46722c5c0abe049f", var_2153b0fe);
}

/*
	Name: function_abbc84ad
	Namespace: namespace_a77a81df
	Checksum: 0x396665BD
	Offset: 0x3F40
	Size: 0x23C
	Parameters: 1
	Flags: Linked
*/
function function_abbc84ad(data)
{
	if(level.var_46821767 === 1)
	{
		return;
	}
	if(!data.weaponpickedup)
	{
		if(!isdefined(data.player.pers[#"telemetry"].var_68ef7250))
		{
			return;
		}
		key = data.weapon.name + data.player.pers[#"telemetry"].var_68ef7250;
		if(!isdefined(data.player.pers[#"weaponstats"][key]))
		{
			if(data.player.pers[#"weaponstats"].size >= 5)
			{
				data.player function_792e6d18();
				data.player.pers[#"weaponstats"] = [];
			}
			data.player.pers[#"weaponstats"][key] = {#hash_6165a2d8:data.player.pers[#"telemetry"].var_ee8d3324, #weapon:data.weapon, #stats:[]};
		}
		var_ae601515 = data.player.pers[#"weaponstats"][key].stats;
		if(!isdefined(var_ae601515[data.statname]))
		{
			var_ae601515[data.statname] = 0;
		}
		var_ae601515[data.statname] = var_ae601515[data.statname] + data.value;
	}
}

/*
	Name: function_792e6d18
	Namespace: namespace_a77a81df
	Checksum: 0x8AF1D88F
	Offset: 0x4188
	Size: 0x388
	Parameters: 0
	Flags: Linked
*/
function function_792e6d18()
{
	foreach(weaponinfo in self.pers[#"weaponstats"])
	{
		weaponitemindex = getbaseweaponitemindex(weaponinfo.weapon);
		loc_0000425E:
		loc_000042B0:
		loc_00004300:
		loc_00004350:
		loc_000043A0:
		loc_000043F0:
		loc_00004440:
		weaponstats = {#end_level:(isdefined(self getcurrentgunrank(weaponitemindex)) ? self getcurrentgunrank(weaponitemindex) : 0) + 1, #xp_earned:(isdefined(weaponinfo.stats[#"xpearned"]) ? weaponinfo.stats[#"xpearned"] : 0), #time_used_s:(isdefined(weaponinfo.stats[#"timeused"]) ? weaponinfo.stats[#"timeused"] : 0), #hash_7e2968cc:(isdefined(weaponinfo.stats[#"deathsduringuse"]) ? weaponinfo.stats[#"deathsduringuse"] : 0), #headshots:(isdefined(weaponinfo.stats[#"headshots"]) ? weaponinfo.stats[#"headshots"] : 0), #kills:(isdefined(weaponinfo.stats[#"kills"]) ? weaponinfo.stats[#"kills"] : 0), #hits:(isdefined(weaponinfo.stats[#"hits"]) ? weaponinfo.stats[#"hits"] : 0), #shots:(isdefined(weaponinfo.stats[#"shots"]) ? weaponinfo.stats[#"shots"] : 0), #hash_5bf208a0:weaponinfo.var_6165a2d8, #weapon_name:weaponinfo.weapon.name};
		self function_678f57c8(#"hash_71e24083d5b3f555", weaponstats);
	}
}

/*
	Name: function_e2162733
	Namespace: namespace_a77a81df
	Checksum: 0xBFFCCD8A
	Offset: 0x4518
	Size: 0xC6
	Parameters: 0
	Flags: Linked
*/
function function_e2162733()
{
	var_ee8d3324 = self function_13f24803(self.class_num);
	self.pers[#"telemetry"].var_ee8d3324 = var_ee8d3324;
	if(isdefined(var_ee8d3324))
	{
		self.pers[#"telemetry"].var_68ef7250 = ("+loadoutChecksum") + string(var_ee8d3324);
	}
	else
	{
		self.pers[#"telemetry"].var_68ef7250 = undefined;
	}
}

/*
	Name: function_c1165a2d
	Namespace: namespace_a77a81df
	Checksum: 0xFFFB52C6
	Offset: 0x45E8
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_c1165a2d(data)
{
	var_e3b99e34 = {};
	var_e3b99e34.event_type = data.eventtype;
	var_e3b99e34.var_87a3e584 = (isdefined(data.var_51b1d48e) ? data.var_51b1d48e : function_f8d53445());
	if(isdefined(data.player.origin))
	{
		var_e3b99e34.var_39c6001a = data.player.origin[0];
		var_e3b99e34.var_71986fbe = data.player.origin[1];
		var_e3b99e34.var_efd8ec65 = data.player.origin[2];
	}
	if(isdefined(data.player))
	{
		function_92d1707f(#"hash_16b85b3fe51a7bd4", var_e3b99e34, #"player", data.player);
	}
	else
	{
		function_92d1707f(#"hash_16b85b3fe51a7bd4", var_e3b99e34);
	}
}

/*
	Name: function_6c95006e
	Namespace: namespace_a77a81df
	Checksum: 0xDB43E9E
	Offset: 0x4738
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function function_6c95006e(data)
{
	if(isdefined(data.var_bdc4bbd2))
	{
		var_3ba59e4e = data.player.pers[#"telemetry"].life.var_3ba59e4e;
		var_3ba59e4e[var_3ba59e4e.size] = data.var_bdc4bbd2;
	}
}

/*
	Name: function_8d2c5f27
	Namespace: namespace_a77a81df
	Checksum: 0x8619C0F6
	Offset: 0x47B0
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_8d2c5f27(array)
{
	new_array = [];
	for(i = 0; i < array.size; i++)
	{
		new_array[i] = hash(array[i]);
	}
	return new_array;
}

