#using script_335d0650ed05d36d;
#using script_3e196d275a6fb180;
#using script_44b0b8420eabacad;
#using script_491ff5a2ba670762;
#using script_5ee699b0aaf564c4;
#using script_6167e26342be354b;
#using script_7d712f77ab8d0c16;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace spawning_shared;

/*
	Name: function_16148aa1
	Namespace: spawning_shared
	Checksum: 0xB4C73591
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_16148aa1()
{
	level notify(2100667326);
}

#namespace spawning;

/*
	Name: function_89f2df9
	Namespace: spawning
	Checksum: 0x5E081A74
	Offset: 0x150
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"spawning_shared", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: spawning
	Checksum: 0x1F347F2A
	Offset: 0x198
	Size: 0x2AC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(util::function_3f165ee8())
	{
		return;
	}
	if(!isdefined(level.spawnsystem))
	{
		level.spawnsystem = spawnstruct();
	}
	if(!isdefined(level.players))
	{
		level.players = [];
	}
	if(!isdefined(level.numplayerswaitingtoenterkillcam))
	{
		level.numplayerswaitingtoenterkillcam = 0;
	}
	if(!isdefined(level.spawnmins))
	{
		level.spawnmins = (0, 0, 0);
	}
	if(!isdefined(level.spawnmaxs))
	{
		level.spawnmaxs = (0, 0, 0);
	}
	if(!isdefined(level.spawnminsmaxsprimed))
	{
		level.spawnminsmaxsprimed = 0;
	}
	if(!isdefined(level.default_spawn_lists))
	{
		level.default_spawn_lists = [];
	}
	if(!isdefined(level.spawnsystem.var_3709dc53))
	{
		level.spawnsystem.var_3709dc53 = 1;
	}
	function_8e22661a();
	function_44c8af7f();
	function_d0149d6b();
	function_f210e027();
	function_d9deb7d7();
	namespace_aaddef5a::function_98ebe1b4();
	callback::add_callback(#"hash_79b2aab11c0a9902", &function_44c8af7f);
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	callback::on_joined_team(&on_joined_team);
	if(!isdefined(level.default_spawn_lists))
	{
		level.default_spawn_lists = [];
	}
	else if(!isarray(level.default_spawn_lists))
	{
		level.default_spawn_lists = array(level.default_spawn_lists);
	}
	level.default_spawn_lists[level.default_spawn_lists.size] = "normal";
	/#
		level thread spawnpoint_debug();
	#/
}

/*
	Name: on_player_connect
	Namespace: spawning
	Checksum: 0x8CF85D48
	Offset: 0x450
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self.spawn = {};
}

/*
	Name: on_joined_team
	Namespace: spawning
	Checksum: 0xF1DABC38
	Offset: 0x468
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function on_joined_team(params)
{
	if(!isdefined(self.spawn))
	{
		self.spawn = {};
	}
}

/*
	Name: function_8e22661a
	Namespace: spawning
	Checksum: 0x9CDD6B9B
	Offset: 0x498
	Size: 0x1AA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8e22661a()
{
	level.spawnsystem.var_a9293f4a = randomint(1033);
	level.spawnsystem.var_d9984264 = (isdefined(getgametypesetting(#"spawnprotectiontime")) ? getgametypesetting(#"spawnprotectiontime") : 0);
	level.spawnsystem.spawntraptriggertime = (isdefined(getgametypesetting(#"spawntraptriggertime")) ? getgametypesetting(#"spawntraptriggertime") : 0);
	level.spawnsystem.var_f220c297 = (isdefined(getgametypesetting(#"hash_19400c3e10b77e6b")) ? getgametypesetting(#"hash_19400c3e10b77e6b") : 0);
	level.spawnsystem.var_c2cc011f = (isdefined(getgametypesetting(#"hash_4bdd1bd86b610871")) ? getgametypesetting(#"hash_4bdd1bd86b610871") : 0);
}

/*
	Name: add_default_spawnlist
	Namespace: spawning
	Checksum: 0x433A2607
	Offset: 0x650
	Size: 0x88
	Parameters: 1
	Flags: None
*/
function add_default_spawnlist(spawnlist)
{
	if(!isdefined(level.default_spawn_lists))
	{
		level.default_spawn_lists = [];
	}
	else if(!isarray(level.default_spawn_lists))
	{
		level.default_spawn_lists = array(level.default_spawn_lists);
	}
	level.default_spawn_lists[level.default_spawn_lists.size] = spawnlist;
}

/*
	Name: function_44c8af7f
	Namespace: spawning
	Checksum: 0xAB80DE89
	Offset: 0x6E0
	Size: 0x17C
	Parameters: 0
	Flags: Linked
*/
function function_44c8af7f()
{
	spawnsystem = level.spawnsystem;
	spawnsystem.ispawn_teammask = [];
	spawnsystem.var_c2989de = 1;
	spawnsystem.var_146943ea = 1;
	spawnsystem.ispawn_teammask[#"none"] = spawnsystem.var_c2989de;
	spawnsystem.ispawn_teammask[#"neutral"] = spawnsystem.var_146943ea;
	all = spawnsystem.var_c2989de;
	count = 1;
	if(!isdefined(level.teams))
	{
		level.teams = [];
	}
	foreach(_ in level.teams)
	{
		spawnsystem.ispawn_teammask[team] = 1 << count;
		all = all | spawnsystem.ispawn_teammask[team];
		count++;
	}
	spawnsystem.ispawn_teammask[#"all"] = all;
}

/*
	Name: onspawnplayer
	Namespace: spawning
	Checksum: 0xFDD9A336
	Offset: 0x868
	Size: 0x248
	Parameters: 1
	Flags: Linked
*/
function onspawnplayer(predictedspawn)
{
	if(!isdefined(predictedspawn))
	{
		predictedspawn = 0;
	}
	spawnoverride = 0;
	if(isdefined(level.var_cda5136b))
	{
		spawnoverride = self [[level.var_cda5136b]](predictedspawn);
	}
	spawnresurrect = 0;
	spawn = undefined;
	if(spawnoverride)
	{
		if(predictedspawn && isdefined(self.tacticalinsertion))
		{
			self function_e1a7c3d9(self.tacticalinsertion.origin, self.tacticalinsertion.angles);
		}
		return undefined;
	}
	if(!isdefined(spawn) || !isdefined(spawn.origin))
	{
		spawn = function_89116a1e(predictedspawn);
		if(is_true(level.var_ae517a5))
		{
			self.var_fe682535 = spawn;
		}
	}
	if(!isdefined(spawn.origin))
	{
		/#
			println("");
		#/
		callback::abort_level();
	}
	if(predictedspawn)
	{
		self function_e1a7c3d9(spawn.origin, spawn.angles);
	}
	else
	{
		self spawn(spawn.origin, spawn.angles);
		self.lastspawntime = gettime();
		if(!spawnresurrect && !spawnoverride)
		{
			influencers::create_player_spawn_influencers(spawn.origin);
		}
		if(squad_spawn::function_d072f205())
		{
			if(squad_spawn::function_61e7d9a8(self))
			{
				squad_spawn::spawninvehicle(self);
			}
			squad_spawn::function_bb63189b(self);
		}
	}
	return spawn;
}

/*
	Name: function_d62887a1
	Namespace: spawning
	Checksum: 0x96E55543
	Offset: 0xAB8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_d62887a1(predictedspawn)
{
	onspawnplayer(predictedspawn);
}

/*
	Name: function_89116a1e
	Namespace: spawning
	Checksum: 0xD4FC6E4C
	Offset: 0xAE8
	Size: 0x152
	Parameters: 1
	Flags: Linked
*/
function function_89116a1e(predictedspawn)
{
	/#
		if(isdefined(self.devguilockspawn) && self.devguilockspawn)
		{
			return {#angles:self.resurrect_angles, #origin:self.resurrect_origin};
		}
	#/
	if(isdefined(level.resurrect_override_spawn))
	{
		if(self [[level.resurrect_override_spawn]](predictedspawn))
		{
			return {#angles:self.resurrect_angles, #origin:self.resurrect_origin};
		}
	}
	if(isdefined(self.var_b7cc4567))
	{
		return self.var_b7cc4567;
	}
	if(usestartspawns())
	{
		spawn = self function_f53e594f();
	}
	if(squad_spawn::function_403f2d91(self))
	{
		spawn = squad_spawn::getspawnpoint(self);
	}
	if(!isdefined(spawn))
	{
		spawn = function_99ca1277(self, predictedspawn);
	}
	return spawn;
}

/*
	Name: getspawnlists
	Namespace: spawning
	Checksum: 0x289CF79A
	Offset: 0xC48
	Size: 0x1DE
	Parameters: 2
	Flags: Linked, Private
*/
function private getspawnlists(player, point_team)
{
	lists = [];
	if(player.spawn.response === "spawnOnObjective")
	{
		spawnlist = function_c49f39df(player.var_612ad92b);
		lists[lists.size] = spawnlist;
	}
	else if(isdefined(level.var_811300ad) && level.var_811300ad.size)
	{
		lists = function_a782529(player);
	}
	if(!lists.size)
	{
		foreach(spawnlist in level.default_spawn_lists)
		{
			if(!isdefined(lists))
			{
				lists = [];
			}
			else if(!isarray(lists))
			{
				lists = array(lists);
			}
			lists[lists.size] = spawnlist;
		}
		if(is_spawn_trapped(point_team))
		{
			if(!isdefined(lists))
			{
				lists = [];
			}
			else if(!isarray(lists))
			{
				lists = array(lists);
			}
			lists[lists.size] = "fallback";
		}
	}
	return lists;
}

/*
	Name: function_594e5666
	Namespace: spawning
	Checksum: 0x65990A0D
	Offset: 0xE30
	Size: 0xF6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_594e5666()
{
	if(isdefined(level.var_963c3f1b))
	{
		return level.var_963c3f1b;
	}
	point = level.mapcenter;
	s_trace = groundtrace(point + vectorscale((0, 0, 1), 10000), point + (vectorscale((0, 0, -1), 10000)), 0, self);
	if(s_trace[#"fraction"] < 1)
	{
		point = s_trace[#"position"];
	}
	level.var_963c3f1b = [];
	level.var_963c3f1b[#"origin"] = point;
	level.var_963c3f1b[#"angles"] = (0, 0, 0);
	return level.var_963c3f1b;
}

/*
	Name: function_99ca1277
	Namespace: spawning
	Checksum: 0xB26C5AD3
	Offset: 0xF30
	Size: 0x322
	Parameters: 2
	Flags: Linked, Private
*/
function private function_99ca1277(player, predictedspawn)
{
	if(level.teambased)
	{
		point_team = player.pers[#"team"];
		influencer_team = player.pers[#"team"];
		vis_team_mask = util::getotherteamsmask(player.pers[#"team"]);
	}
	else
	{
		point_team = #"none";
		influencer_team = #"none";
		vis_team_mask = level.spawnsystem.ispawn_teammask[#"all"];
	}
	if(level.teambased && isdefined(game.switchedsides) && game.switchedsides && level.spawnsystem.var_3709dc53)
	{
		point_team = util::getotherteam(point_team);
	}
	if(!is_true(level.var_6e2d52c5))
	{
		lists = getspawnlists(player, point_team);
		spawn_point = getbestspawnpoint(point_team, influencer_team, vis_team_mask, player, predictedspawn, lists);
	}
	if(!isdefined(spawn_point))
	{
		spawn_point = function_594e5666();
	}
	if(!predictedspawn && sessionmodeismultiplayergame())
	{
		mpspawnpointsused = {#hash_50641dd5:0, #z:spawn_point[#"origin"][2], #y:spawn_point[#"origin"][1], #x:spawn_point[#"origin"][0], #hash_c734ddf2:getplayerspawnid(player), #reason:"point used"};
		function_92d1707f(#"hash_608dde355fff78f5", mpspawnpointsused);
	}
	spawn = spawnstruct();
	spawn.origin = spawn_point[#"origin"];
	spawn.angles = spawn_point[#"angles"];
	return spawn;
}

/*
	Name: on_player_spawned
	Namespace: spawning
	Checksum: 0x16524A98
	Offset: 0x1260
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self endon(#"disconnect");
	waitframe(1);
	var_f8e6b703 = self match_record::get_player_stat(#"hash_ec4aea1a8bbd82");
	if(isdefined(self.spawn.var_a9914487))
	{
		if(isdefined(var_f8e6b703))
		{
			self match_record::set_stat(#"lives", var_f8e6b703, #"spawn_type", self.spawn.var_a9914487);
		}
	}
	if(isdefined(self.spawn.var_4db23b))
	{
		if(isdefined(var_f8e6b703))
		{
			self match_record::set_stat(#"lives", var_f8e6b703, #"hash_4b3e577f8ed51943", self.spawn.var_4db23b);
		}
	}
}

/*
	Name: function_f53e594f
	Namespace: spawning
	Checksum: 0x3A364821
	Offset: 0x1370
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_f53e594f()
{
	return function_77b7335(self.team, "start_spawn");
}

/*
	Name: function_29b859d1
	Namespace: spawning
	Checksum: 0xBDAB386B
	Offset: 0x13A0
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function function_29b859d1()
{
	if(isdefined(level.var_1113eb30))
	{
		return [[level.var_1113eb30]]();
	}
	return 1;
}

