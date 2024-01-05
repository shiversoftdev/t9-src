#using scripts\core_common\util_shared.gsc;
#using script_5ee699b0aaf564c4;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_75da5547b1822294;
#using scripts\core_common\system_shared.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using script_7dc3a36c222eaf22;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_insertion.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using script_396f7d71538c9677;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_cd4d78f1;

/*
	Name: function_bcac182b
	Namespace: namespace_cd4d78f1
	Checksum: 0x2DE05212
	Offset: 0x418
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bcac182b()
{
	level notify(1313026048);
}

#namespace squad_spawn;

/*
	Name: __init__system__
	Namespace: squad_spawn
	Checksum: 0xA2C867DA
	Offset: 0x438
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"squad_spawning", &init, undefined, undefined, undefined);
}

/*
	Name: codecallback_menuresponse
	Namespace: squad_spawn
	Checksum: 0xC152210A
	Offset: 0x480
	Size: 0x1FE
	Parameters: 1
	Flags: Event
*/
event codecallback_menuresponse(eventstruct)
{
	var_53227942 = self;
	menu = eventstruct.menu;
	response = eventstruct.response;
	var_8893508d = eventstruct.intpayload;
	if(!isdefined(menu))
	{
		menu = "";
	}
	if(!isdefined(response))
	{
		response = "";
	}
	if(!isdefined(var_8893508d))
	{
		var_8893508d = 0;
	}
	if(menu == "Hud_NavigableUI")
	{
		if(self.sessionstate === "playing")
		{
			return;
		}
		if(response == "spectatePlayer")
		{
			var_26c5324a = getentbynum(var_8893508d);
			self.var_a271f211 = var_8893508d;
			if(isalive(var_26c5324a))
			{
				var_53227942 spectating::function_26c5324a(var_26c5324a);
			}
		}
		else
		{
			if(response == "spawnOnPlayer")
			{
				var_53227942.spawn.var_e8f87696 = 0;
				var_53227942.spawn.response = "spawnOnPlayer";
				var_53227942.var_d690fc0b = getentbynum(var_8893508d);
			}
			else
			{
				if(response == "spawnOnObjective")
				{
					var_53227942.spawn.var_e8f87696 = 0;
					var_53227942.spawn.response = "spawnOnObjective";
					var_53227942.var_612ad92b = var_8893508d;
				}
				else if(response == "autoSpawn")
				{
					var_53227942.spawn.var_e8f87696 = 0;
					var_53227942.spawn.response = "autoSpawn";
				}
			}
		}
	}
}

/*
	Name: init
	Namespace: squad_spawn
	Checksum: 0x67DF8443
	Offset: 0x688
	Size: 0x5B4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.var_d0252074 = (isdefined(getgametypesetting(#"hash_2b1f40bc711c41f3")) ? getgametypesetting(#"hash_2b1f40bc711c41f3") : 0);
	if(!function_d072f205())
	{
		return;
	}
	match_record::set_stat(#"hash_405bc5b0e581dd5e", 1);
	level.var_d2f7a339 = getgametypesetting(#"hash_361f7fe066281093");
	level.var_1c15a724 = getgametypesetting(#"hash_4dd37bf6da89131");
	level.var_8bace951 = getgametypesetting(#"hash_655d904d5995891f");
	if(!isdefined(level.var_f0257219))
	{
		level.var_f0257219 = 0;
	}
	if(!isdefined(level.var_97b04ad0))
	{
		level.var_97b04ad0 = vectorscale((-1, -1, -1), 4);
	}
	if(!isdefined(level.var_1dc6484c))
	{
		level.var_1dc6484c = vectorscale((1, 1, 1), 4);
	}
	if(!isdefined(level.var_64a19c03))
	{
		level.var_64a19c03 = 4;
	}
	if(!isdefined(level.var_4f091b08))
	{
		level.var_4f091b08 = vectorscale((-1, -1, -1), 4);
	}
	if(!isdefined(level.var_7d121ad7))
	{
		level.var_7d121ad7 = vectorscale((1, 1, 1), 4);
	}
	if(!isdefined(level.var_10f21cf8))
	{
		level.var_10f21cf8 = [];
	}
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	callback::on_player_killed(&on_player_killed);
	scoreevents::registerscoreeventcallback("playerKilled", &scoreeventplayerkill);
	setdvar(#"hash_301150d9ff502ccc", 0);
	setdvar(#"hash_3b0f87edc15cba8b", 1);
	level.onspawnplayer = &on_spawn_player;
	if(function_d072f205())
	{
		level thread function_bae8dea9();
		level thread function_e3b77c0b();
	}
	if(isdefined(level.var_d1455682.squadspawnsettings))
	{
		var_393bca70 = getscriptbundle(level.var_d1455682.squadspawnsettings);
	}
	setdvar(#"hash_4de24bfd1d2e60e2", function_e5152e84("maxEnemyInfluence", 0, var_393bca70));
	setdvar(#"hash_3950aff61b5eb579", function_e5152e84("maxFriendlyInfluence", 0, var_393bca70));
	setdvar(#"hash_448da75ac3058f88", function_e5152e84("maxTargetPlayerInfluence", 0, var_393bca70));
	setdvar(#"hash_64315367e45f68ed", function_e5152e84("minDistanceFromEnemyPlayer", 0, var_393bca70));
	setdvar(#"hash_4c4f79641bd0a4a8", function_e5152e84("maxPlayerInfluencerDistance", 0, var_393bca70));
	setdvar(#"hash_11e4c0fa5ecb0ca8", function_e5152e84("minDistanceFromTargetPlayer", 0, var_393bca70));
	setdvar(#"hash_b5fdc515c12876e", function_e5152e84("maxDistanceFromTargetPlayer", 0, var_393bca70));
	var_8f11cf88 = function_e5152e84("minDistanceFromEnemyPlayer", 0, var_393bca70);
	level.var_9b9900e6 = var_8f11cf88 * var_8f11cf88;
	var_a73479b4 = function_e5152e84("maxPlayerInfluencerDistance", 0, var_393bca70);
	level.var_d6cbe602 = var_a73479b4 * var_a73479b4;
	setupclientfields();
}

/*
	Name: function_e5152e84
	Namespace: squad_spawn
	Checksum: 0x9653580F
	Offset: 0xC48
	Size: 0xA4
	Parameters: 3
	Flags: Linked
*/
function function_e5152e84(fieldname, defaultvalue, var_393bca70)
{
	if(!isdefined(var_393bca70) && !isdefined(level.var_d1455682.squadspawnsettings))
	{
		return defaultvalue;
	}
	if(!isdefined(var_393bca70))
	{
		var_393bca70 = getscriptbundle(level.var_d1455682.squadspawnsettings);
	}
	if(isdefined(var_393bca70) && isdefined(var_393bca70.(fieldname)))
	{
		return var_393bca70.(fieldname);
	}
	return defaultvalue;
}

/*
	Name: setupclientfields
	Namespace: squad_spawn
	Checksum: 0xBA734F49
	Offset: 0xCF8
	Size: 0xF4
	Parameters: 0
	Flags: Linked, Private
*/
function private setupclientfields()
{
	clientfield::register_clientuimodel("hudItems.squadSpawnOnStatus", 1, 3, "int");
	clientfield::register_clientuimodel("hudItems.squadSpawnActive", 1, 1, "int");
	clientfield::register_clientuimodel("hudItems.squadSpawnRespawnStatus", 1, 2, "int");
	clientfield::register_clientuimodel("hudItems.squadSpawnViewType", 1, 1, "int");
	clientfield::register_clientuimodel("hudItems.squadAutoSpawnPromptActive", 1, 1, "int");
	clientfield::register_clientuimodel("hudItems.squadSpawnSquadWipe", 1, 1, "int");
}

/*
	Name: function_941bd62f
	Namespace: squad_spawn
	Checksum: 0xC15AF59
	Offset: 0xDF8
	Size: 0x28A
	Parameters: 0
	Flags: Linked
*/
function function_941bd62f()
{
	/#
		if(isdefined(self.devguilockspawn) && self.devguilockspawn)
		{
			return {#angles:self.resurrect_angles, #origin:self.resurrect_origin};
		}
	#/
	if(!isdefined(self.spawn.response))
	{
	}
	else
	{
		if(self.spawn.response === "spawnOnPlayer")
		{
			spawn = function_154cf7ca(self);
		}
		else
		{
			if(self.spawn.response === "spawnOnObjective")
			{
				spawn = getspawnpoint(self);
			}
			else
			{
				if(self.spawn.response === "autoSpawn" && !getgametypesetting(#"hash_1e71b5ce1cd845b3"))
				{
					function_279d5c68(self.team, 0);
					spawn = getspawnpoint(self);
				}
				else
				{
					if(getgametypesetting(#"hash_5d65f5abcdad24fe") && self.spawn.var_e8f87696 < gettime())
					{
						if(self.spawn.response === "spawnOnObjective")
						{
							spawn = getspawnpoint(self);
						}
					}
					else
					{
						if(isdefined(level.var_b8da6142) && [[level.var_b8da6142]](self))
						{
							if(!function_154cf7ca(self))
							{
								spawn = getspawnpoint(self);
							}
						}
						else
						{
							squadmates = function_c65231e2(self.squad);
							if(squadmates.size <= 1)
							{
								spawn = getspawnpoint(self);
							}
						}
					}
				}
			}
		}
	}
	return spawn;
}

/*
	Name: function_841e08f9
	Namespace: squad_spawn
	Checksum: 0xDC63AB42
	Offset: 0x1090
	Size: 0xF6
	Parameters: 1
	Flags: Linked
*/
function function_841e08f9(player)
{
	if(!isdefined(level.inprematchperiod) || level.inprematchperiod)
	{
		return false;
	}
	if(player_insertion::function_6660c1f() && !is_true(player.var_7689a9b2))
	{
		return false;
	}
	if(!getgametypesetting(#"hash_1e71b5ce1cd845b3"))
	{
		return false;
	}
	if(is_true(player.var_20250438))
	{
		return true;
	}
	if(!isdefined(player.spawn.response) || player.spawn.response == "autoSpawn")
	{
		return true;
	}
	return false;
}

/*
	Name: on_spawn_player
	Namespace: squad_spawn
	Checksum: 0x85FD6A17
	Offset: 0x1190
	Size: 0x21E
	Parameters: 1
	Flags: Linked
*/
function on_spawn_player(predictedspawn)
{
	if(!isdefined(predictedspawn))
	{
		predictedspawn = 0;
	}
	spawn = self function_941bd62f();
	if(!isdefined(spawn) || !isdefined(spawn.origin))
	{
		spawn = spawning::function_89116a1e(predictedspawn);
	}
	self.spawn.var_e8f87696 = undefined;
	if(predictedspawn)
	{
		self spawning::function_e1a7c3d9(spawn.origin, spawn.angles);
	}
	else
	{
		self.lastspawntime = gettime();
		if(function_841e08f9(self))
		{
			self namespace_aaddef5a::function_96d350e9(spawn);
			self.spawn.var_a9914487 = 3;
		}
		else
		{
			self spawn(spawn.origin, spawn.angles);
			influencers::create_player_spawn_influencers(spawn.origin);
			if(!function_61e7d9a8(self))
			{
				if(isdefined(self.spawn.response) && self.spawn.response == "spawnOnPlayer")
				{
					self.spawn.var_a9914487 = 1;
				}
				else
				{
					self.spawn.var_a9914487 = 0;
				}
			}
		}
		self.respawntimerstarttime = undefined;
		self.spawn.userespawntime = undefined;
	}
	self clientfield::set_player_uimodel("hudItems.squadSpawnRespawnStatus", 0);
	self.spawn.var_4db23b = function_e5b0d177(self);
	self.var_20250438 = undefined;
	return spawn;
}

/*
	Name: function_e5b0d177
	Namespace: squad_spawn
	Checksum: 0x91975B81
	Offset: 0x13B8
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function function_e5b0d177(player)
{
	squadmates = function_a1cff525(player.squad);
	foreach(squadmate in squadmates)
	{
		if(squadmate.var_83de62a2 == 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: spawn_player
	Namespace: squad_spawn
	Checksum: 0x17FD6C5D
	Offset: 0x1478
	Size: 0x1F4
	Parameters: 0
	Flags: None
*/
function spawn_player()
{
	if(!function_d072f205())
	{
		return;
	}
	if(function_61e7d9a8(self))
	{
		spawninvehicle(self);
	}
	if(self.sessionstate == "dead" && self namespace_8a203916::function_500047aa(1))
	{
		self ghost();
		self notsolid();
		self val::set(#"hash_a97d206e86519b9", "freezecontrols", 1);
		self val::set(#"hash_a97d206e86519b9", "disablegadgets", 1);
		self endon(#"death", #"disconnect");
		wait(1.25 - (float(function_60d95f53()) / 1000));
		self show();
		self solid();
		self val::reset(#"hash_a97d206e86519b9", "freezecontrols");
		self val::reset(#"hash_a97d206e86519b9", "disablegadgets");
	}
	function_bb63189b(self);
}

/*
	Name: function_a0bd2fd6
	Namespace: squad_spawn
	Checksum: 0xC4502A98
	Offset: 0x1678
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_a0bd2fd6(enabled)
{
	if(!function_d072f205())
	{
		return;
	}
	if(enabled)
	{
		self clientfield::set_player_uimodel("hudItems.squadSpawnViewType", 1);
	}
	else
	{
		self clientfield::set_player_uimodel("hudItems.squadSpawnViewType", 0);
	}
}

/*
	Name: function_279d5c68
	Namespace: squad_spawn
	Checksum: 0x8F7561E3
	Offset: 0x16F0
	Size: 0xB8
	Parameters: 2
	Flags: Linked
*/
function function_279d5c68(team, enabled)
{
	team_players = getplayers(enabled);
	foreach(var_abcd943a in team_players)
	{
		var_abcd943a function_e2ec8e07(0);
	}
}

/*
	Name: function_e2ec8e07
	Namespace: squad_spawn
	Checksum: 0x7AAD23E3
	Offset: 0x17B0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_e2ec8e07(enabled)
{
	if(function_d072f205())
	{
		self clientfield::set_player_uimodel("hudItems.squadAutoSpawnPromptActive", (enabled ? 1 : 0));
	}
}

/*
	Name: function_8c7462a6
	Namespace: squad_spawn
	Checksum: 0xC77F3DFF
	Offset: 0x1808
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_8c7462a6(enabled)
{
	self clientfield::set_player_uimodel("hudItems.squadSpawnSquadWipe", (enabled ? 1 : 0));
	self clientfield::set_player_uimodel("hudItems.squadSpawnRespawnStatus", (enabled ? 0 : 1));
}

/*
	Name: function_3aa3c147
	Namespace: squad_spawn
	Checksum: 0xCE8E2701
	Offset: 0x1880
	Size: 0xC0
	Parameters: 2
	Flags: None
*/
function function_3aa3c147(squad, enabled)
{
	foreach(var_cc6fd54 in function_c65231e2(squad))
	{
		var_cc6fd54 clientfield::set_player_uimodel("hudItems.squadSpawnSquadWipe", (enabled ? 1 : 0));
	}
}

/*
	Name: function_5f976259
	Namespace: squad_spawn
	Checksum: 0x32E1C70
	Offset: 0x1948
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_5f976259()
{
	self clientfield::set_player_uimodel("hudItems.squadSpawnActive", 1);
	self setclientuivisibilityflag("hud_visible", 0);
}

/*
	Name: function_c953ceb
	Namespace: squad_spawn
	Checksum: 0x35FD9E52
	Offset: 0x1998
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_c953ceb()
{
	self clientfield::set_player_uimodel("hudItems.squadSpawnActive", 0);
	self setclientuivisibilityflag("hud_visible", 1);
}

/*
	Name: function_bb63189b
	Namespace: squad_spawn
	Checksum: 0x41669BEB
	Offset: 0x19E8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_bb63189b(player)
{
	player.spawn.var_8791b6ff = undefined;
	player.spawn.squadspawnpoint = undefined;
	player function_c953ceb();
}

/*
	Name: function_5f24fd47
	Namespace: squad_spawn
	Checksum: 0xB691DC15
	Offset: 0x1A38
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function function_5f24fd47(player, userespawntime)
{
	userespawntime.spawn.var_e8f87696 = undefined;
	userespawntime function_5f976259();
	if(userespawntime namespace_8a203916::function_500047aa(1))
	{
		userespawntime namespace_8a203916::function_86df9236();
	}
	else
	{
		userespawntime namespace_8a203916::function_888901cb();
	}
}

/*
	Name: onplayerdamaged
	Namespace: squad_spawn
	Checksum: 0x62D28E4B
	Offset: 0x1AC8
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function onplayerdamaged(player, attacker)
{
	if(!function_d072f205())
	{
		return;
	}
	if(!isdefined(attacker))
	{
		return;
	}
	if(player isinvehicle())
	{
		return;
	}
	var_ecbf2401 = attacker getentitynumber();
	if(isdefined(player.var_cc060afa[var_ecbf2401]) && player.var_cc060afa[var_ecbf2401] > gettime())
	{
		return;
	}
	damagearea = spawnstruct();
	damagearea.var_87d6a5e9 = gettime();
	damagearea.attacker = attacker;
	damagearea.origin = player.origin;
	level.var_10f21cf8[level.var_10f21cf8.size] = damagearea;
	player.var_cc060afa[var_ecbf2401] = 500 + gettime();
}

/*
	Name: function_5e178d15
	Namespace: squad_spawn
	Checksum: 0xC5AF3BD3
	Offset: 0x1BD8
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5e178d15(damagearea)
{
	if(damagearea.var_87d6a5e9 + function_e5152e84("damageAreaLifetimeMS", 0) < gettime())
	{
		return true;
	}
	if(!isdefined(damagearea.attacker))
	{
		return true;
	}
	if(isdefined(damagearea.attacker.deathtime))
	{
		if(damagearea.var_87d6a5e9 < damagearea.attacker.deathtime)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_33d9297
	Namespace: squad_spawn
	Checksum: 0xAE18F161
	Offset: 0x1C78
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_33d9297()
{
	for(index = level.var_10f21cf8.size - 1; index >= 0; index--)
	{
		if(function_5e178d15(level.var_10f21cf8[index]))
		{
			arrayremoveindex(level.var_10f21cf8, index, 0);
		}
	}
}

/*
	Name: function_ef8e6bd1
	Namespace: squad_spawn
	Checksum: 0xEA77C447
	Offset: 0x1CF8
	Size: 0x132
	Parameters: 1
	Flags: Linked
*/
function function_ef8e6bd1(player)
{
	damagearearadius = function_e5152e84("damageAreaRadius", 0);
	radiussq = damagearearadius * damagearearadius;
	if(!isdefined(player.var_b7d9b739) || player.var_b7d9b739 < gettime())
	{
		player.var_b7d9b739 = gettime() + 250;
		player.var_e72b96de = 0;
		foreach(damagearea in level.var_10f21cf8)
		{
			if(distancesquared(player.origin, damagearea.origin) < radiussq)
			{
				player.var_e72b96de = 1;
			}
		}
	}
	return player.var_e72b96de;
}

/*
	Name: function_6a7e8977
	Namespace: squad_spawn
	Checksum: 0xF6E4FCA8
	Offset: 0x1E38
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function function_6a7e8977()
{
	self.spawn.var_e8f87696 = gettime() + (int((isdefined(getgametypesetting(#"hash_c8636144ad47ac9")) ? getgametypesetting(#"hash_c8636144ad47ac9") : 0) * 1000));
}

/*
	Name: function_250e04e5
	Namespace: squad_spawn
	Checksum: 0x792938EB
	Offset: 0x1EC8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_250e04e5()
{
	self clientfield::set_player_uimodel("hudItems.squadSpawnRespawnStatus", 1);
}

/*
	Name: function_44c6679
	Namespace: squad_spawn
	Checksum: 0xD2889E2E
	Offset: 0x1EF8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_44c6679()
{
	self clientfield::set_player_uimodel("hudItems.squadSpawnRespawnStatus", 3);
}

/*
	Name: function_61f1a8b6
	Namespace: squad_spawn
	Checksum: 0xD9967DB7
	Offset: 0x1F28
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_61f1a8b6(player)
{
	var_4e655dbe = function_bfb027d2(player);
	if(player.var_83de62a2 != var_4e655dbe)
	{
		timesincelastupdate = gettime() - (isdefined(player.var_b30b9f4a) ? player.var_b30b9f4a : 0);
		if(var_4e655dbe != 1 || timesincelastupdate > 200)
		{
			player.var_83de62a2 = var_4e655dbe;
			player.var_b30b9f4a = gettime();
		}
	}
}

/*
	Name: function_6d9e5aa2
	Namespace: squad_spawn
	Checksum: 0xB44310DC
	Offset: 0x1FD8
	Size: 0x262
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6d9e5aa2()
{
	foreach(player in level.players)
	{
		if(isdefined(player.var_29b1c3fc))
		{
			player.var_29b1c3fc = 0;
		}
	}
	foreach(player in level.players)
	{
		if(isdefined(player.var_a271f211))
		{
			if(level.numlives && !player.pers[#"lives"])
			{
				player clientfield::set_player_uimodel("hudItems.squadSpawnOnStatus", 6);
				continue;
			}
			spectatedplayer = getentbynum(player.var_a271f211);
			if(isdefined(spectatedplayer) && spectatedplayer.squad === player.squad)
			{
				player clientfield::set_player_uimodel("hudItems.squadSpawnOnStatus", player.var_83de62a2);
				spectatedplayer.var_29b1c3fc = 1;
			}
		}
	}
	foreach(player in level.players)
	{
		if(isdefined(player.var_29b1c3fc) && !player.var_29b1c3fc)
		{
			player.var_29b1c3fc = undefined;
		}
	}
}

/*
	Name: function_595dee89
	Namespace: squad_spawn
	Checksum: 0xB979EEB5
	Offset: 0x2248
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_595dee89(str_notify)
{
	foreach(hint in level.var_a938112d)
	{
		hint delete();
	}
	level.var_a938112d = [];
}

/*
	Name: function_e3b77c0b
	Namespace: squad_spawn
	Checksum: 0xEE7A2769
	Offset: 0x22F0
	Size: 0x19C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e3b77c0b()
{
	level endon(#"game_ended");
	level endoncallback(&function_595dee89, #"game_ended");
	level.var_a938112d = [];
	while(true)
	{
		wait(1);
		if(!isdefined(level.players))
		{
			continue;
		}
		function_595dee89();
		foreach(player in level.players)
		{
			if(isdefined(player.var_29b1c3fc))
			{
				var_c1b815dc = createstreamerhint(player.origin, 1.02);
				var_c1b815dc setinvisibletoall();
				var_c1b815dc setvisibletoplayer(player);
				var_c1b815dc setincludemeshes(1);
				array::add(level.var_a938112d, var_c1b815dc);
			}
		}
	}
}

/*
	Name: function_2ffd5f18
	Namespace: squad_spawn
	Checksum: 0xFF931701
	Offset: 0x2498
	Size: 0x160
	Parameters: 0
	Flags: None
*/
function function_2ffd5f18()
{
	if(is_true(self.var_312f13e0))
	{
		return false;
	}
	if(is_true(self.var_20250438))
	{
		return true;
	}
	if(self.spawn.response === "spawnOnPlayer")
	{
		return true;
	}
	if(self.spawn.response === "spawnOnObjective")
	{
		return true;
	}
	if(self.spawn.response === "autoSpawn")
	{
		return true;
	}
	if(level.var_f0257219 && self.spawn.var_e8f87696 < gettime())
	{
		return true;
	}
	if(getgametypesetting(#"hash_5d65f5abcdad24fe") && self.spawn.var_e8f87696 < gettime())
	{
		return true;
	}
	if(isdefined(level.var_b8da6142) && [[level.var_b8da6142]](self))
	{
		return true;
	}
	return false;
}

/*
	Name: updateplayers
	Namespace: squad_spawn
	Checksum: 0x5B9C1B2E
	Offset: 0x2600
	Size: 0x8A
	Parameters: 0
	Flags: Linked, Private
*/
function private updateplayers()
{
	foreach(player in level.players)
	{
		function_61f1a8b6(player);
	}
}

/*
	Name: function_bae8dea9
	Namespace: squad_spawn
	Checksum: 0x90555DA4
	Offset: 0x2698
	Size: 0x70
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bae8dea9()
{
	level endon(#"game_ended");
	while(true)
	{
		waitframe(1);
		if(!isdefined(level.players))
		{
			continue;
		}
		updateplayers();
		function_6d9e5aa2();
		function_33d9297();
	}
}

/*
	Name: function_426b6bde
	Namespace: squad_spawn
	Checksum: 0x7E7B90FB
	Offset: 0x2710
	Size: 0xA4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_426b6bde(origin, reason)
{
	data = {#reason:reason, #pos_z:origin[2], #pos_y:origin[1], #pos_x:origin[0]};
	function_92d1707f(#"hash_7f298b21a2012331", data);
}

/*
	Name: function_154cf7ca
	Namespace: squad_spawn
	Checksum: 0xC9FF136C
	Offset: 0x27C0
	Size: 0x1F2
	Parameters: 1
	Flags: Linked
*/
function function_154cf7ca(player)
{
	if(player.spawn.response === "spawnOnPlayer" && isdefined(player.var_d690fc0b))
	{
		targetplayer = player.var_d690fc0b;
		player.var_d690fc0b = undefined;
	}
	if(!isdefined(targetplayer))
	{
		targetplayer = function_c4505fb0(player);
	}
	if(!isdefined(targetplayer))
	{
		return undefined;
	}
	spawn = function_e402b74e(player, targetplayer);
	if(!isdefined(spawn))
	{
		return undefined;
	}
	scoreevents::processscoreevent(#"hash_1c4cca7457aefbb9", player, undefined, undefined);
	squadmates = function_a1cff525(self.squad);
	if(squadmates.size == 1)
	{
		scoreevents::processscoreevent(#"hash_6d563fdc029e8394", targetplayer, player, undefined);
	}
	else
	{
		scoreevents::processscoreevent(#"squad_spawn", targetplayer, player, undefined);
	}
	if((isdefined(targetplayer.var_23adeae5) ? targetplayer.var_23adeae5 : 0) < gettime())
	{
		player battlechatter::play_dialog("spawnedSquad", 1);
		targetplayer.var_23adeae5 = gettime() + (int(battlechatter::mpdialog_value("squadSpawnCooldown", 5) * 1000));
	}
	return spawn;
}

/*
	Name: spawnplayer
	Namespace: squad_spawn
	Checksum: 0x33774608
	Offset: 0x29C0
	Size: 0xB2
	Parameters: 1
	Flags: Private
*/
function private spawnplayer(player)
{
	timepassed = undefined;
	if(isdefined(player.respawntimerstarttime) && is_true(player.spawn.userespawntime))
	{
		timepassed = (float(gettime() - player.respawntimerstarttime)) / 1000;
	}
	player thread [[level.spawnclient]](timepassed);
	player.respawntimerstarttime = undefined;
	player.spawn.userespawntime = undefined;
}

/*
	Name: function_c4505fb0
	Namespace: squad_spawn
	Checksum: 0x5B3231A7
	Offset: 0x2A80
	Size: 0x80
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c4505fb0(var_53227942)
{
	if(isdefined(var_53227942.currentspectatingclient))
	{
		spectatingplayer = getentbynum(var_53227942.currentspectatingclient);
		if(isdefined(spectatingplayer) && spectatingplayer.squad === var_53227942.squad && function_714da39d(spectatingplayer))
		{
			return spectatingplayer;
		}
	}
	return undefined;
}

/*
	Name: filter_spawn_points
	Namespace: squad_spawn
	Checksum: 0x98D650E4
	Offset: 0x2B08
	Size: 0xD8
	Parameters: 2
	Flags: Linked
*/
function filter_spawn_points(targetplayer, &points)
{
	if(points.size <= 0)
	{
		return points;
	}
	validpoints = [];
	for(index = 0; index < points.size; index++)
	{
		if(!oob::function_1a0f9f54(points[index]))
		{
			validpoints[validpoints.size] = points[index];
		}
	}
	if(isdefined(level.var_38743886))
	{
		validpoints = [[level.var_38743886]](targetplayer, validpoints);
		/#
			assert(isarray(validpoints));
		#/
	}
	return validpoints;
}

/*
	Name: function_e1997588
	Namespace: squad_spawn
	Checksum: 0x7608B146
	Offset: 0x2BE8
	Size: 0x162
	Parameters: 2
	Flags: Private
*/
function private function_e1997588(targetplayer, &points)
{
	nearbyplayers = targetplayer getenemiesinradius(targetplayer.origin, 7500);
	if(nearbyplayers.size <= 0)
	{
		return points;
	}
	if(points.size <= 0)
	{
		return points;
	}
	validpoints = [];
	for(pointindex = 0; pointindex < points.size; pointindex++)
	{
		point = points[pointindex];
		var_2282e309 = 0;
		for(playerindex = 0; playerindex < nearbyplayers.size; playerindex++)
		{
			if(sighttracepassed(nearbyplayers[playerindex].origin + vectorscale((0, 0, 1), 72), point + vectorscale((0, 0, 1), 72), 0, undefined))
			{
				var_2282e309 = 1;
				break;
			}
		}
		if(!var_2282e309)
		{
			validpoints[validpoints.size] = point;
		}
	}
	if(validpoints.size <= 0)
	{
		validpoints[validpoints.size] = points[0];
	}
	return validpoints;
}

/*
	Name: function_32843fc9
	Namespace: squad_spawn
	Checksum: 0x9C0E905A
	Offset: 0x2D58
	Size: 0xDE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_32843fc9(startpoint, endpoint)
{
	for(index = 0; index < 7; index++)
	{
		groundtrace = groundtrace(startpoint, endpoint, 0, undefined, 0);
		if(groundtrace[#"fraction"] <= 0 || groundtrace[#"startsolid"])
		{
			if(startpoint[2] > endpoint[2])
			{
				startpoint = startpoint + vectorscale((0, 0, 1), 64);
			}
			else
			{
				endpoint = endpoint + vectorscale((0, 0, 1), 64);
			}
			continue;
		}
		break;
	}
	return groundtrace;
}

/*
	Name: function_e402b74e
	Namespace: squad_spawn
	Checksum: 0x40D12B99
	Offset: 0x2E40
	Size: 0x3A8
	Parameters: 2
	Flags: Linked
*/
function function_e402b74e(var_53227942, targetplayer)
{
	if(!isdefined(targetplayer) || !isplayer(targetplayer))
	{
		function_426b6bde((0, 0, 0), #"hash_2e8498c8700aaba0");
		return undefined;
	}
	var_6cff872f = 0;
	if(targetplayer isinvehicle() && !targetplayer isremotecontrolling())
	{
		vehicle = targetplayer getvehicleoccupied();
		var_ce6fc3d9 = function_f099b0f1(vehicle);
		if(isdefined(var_ce6fc3d9))
		{
			var_53227942.spawn.locationtype = 1;
			var_53227942.spawn.var_ce6fc3d9 = var_ce6fc3d9;
			var_6cff872f = 1;
		}
		else
		{
			function_426b6bde(targetplayer.origin, #"hash_769d88fed1062d92");
		}
	}
	if(!var_6cff872f)
	{
		var_6b26b855 = util::get_start_time();
		var_1fd07d84 = function_6cb4953e(targetplayer, 50);
		var_1fd07d84 = filter_spawn_points(targetplayer, var_1fd07d84);
		var_8b889046 = var_1fd07d84[0];
		util::note_elapsed_time(var_6b26b855, "squad spawn point");
		if(!isdefined(var_8b889046))
		{
			function_426b6bde(targetplayer.origin, #"hash_6a2b417ef9f221f1");
			var_8b889046 = function_d66eb9cd(targetplayer);
			if(!isdefined(var_8b889046))
			{
				return undefined;
			}
		}
		groundtrace = function_32843fc9(var_8b889046 + vectorscale((0, 0, 1), 64), var_8b889046 - vectorscale((0, 0, 1), 64));
		if(groundtrace[#"fraction"] < 1)
		{
			var_8b889046 = groundtrace[#"position"];
		}
		var_53227942.spawn.locationtype = 0;
		var_53227942.spawn.squadspawnpoint = var_8b889046;
	}
	var_53227942.spawn.var_8791b6ff = targetplayer;
	spawn_point = getspawnpoint(self);
	if(!isdefined(spawn_point))
	{
		return undefined;
	}
	trace = physicstrace(spawn_point.origin + vectorscale((0, 0, 1), 30), spawn_point.origin - vectorscale((0, 0, 1), 1000), (0, 0, 0), (0, 0, 0), self, 32);
	if(trace[#"fraction"] == 1)
	{
		function_426b6bde(spawn_point.origin, #"underground");
	}
	return spawn_point;
}

/*
	Name: function_d66eb9cd
	Namespace: squad_spawn
	Checksum: 0x6D04F6F9
	Offset: 0x31F0
	Size: 0x2C8
	Parameters: 1
	Flags: Linked
*/
function function_d66eb9cd(targetplayer)
{
	if(!isplayer(targetplayer))
	{
		/#
			assert(0);
		#/
		return;
	}
	forward = anglestoforward(targetplayer.angles);
	backward = forward * -1;
	right = anglestoright(targetplayer.angles);
	left = right * -1;
	var_e1cf0006 = [1:144, 0:96];
	angles = [3:forward, 2:left, 1:right, 0:backward];
	var_27b2878f = undefined;
	for(var_1314ef21 = 0; var_1314ef21 < var_e1cf0006.size; var_1314ef21++)
	{
		offsetdistance = var_e1cf0006[var_1314ef21];
		for(angleindex = 0; angleindex < angles.size; angleindex++)
		{
			angle = angles[angleindex];
			position = targetplayer.origin + (angle * offsetdistance);
			var_3a1904d3 = function_9cc082d2(position, 4000);
			if(!isdefined(var_3a1904d3))
			{
				continue;
			}
			navmeshposition = var_3a1904d3[#"point"];
			trace = function_32843fc9(navmeshposition + vectorscale((0, 0, 1), 500), navmeshposition - vectorscale((0, 0, 1), 500));
			if(trace[#"fraction"] == 1)
			{
				continue;
			}
			if(!isdefined(var_27b2878f))
			{
				var_27b2878f = trace[#"position"];
			}
			if(sighttracepassed(var_27b2878f + vectorscale((0, 0, 1), 72), targetplayer.origin + vectorscale((0, 0, 1), 72), 0, undefined))
			{
				return var_27b2878f;
			}
		}
	}
	return var_27b2878f;
}

/*
	Name: function_403f2d91
	Namespace: squad_spawn
	Checksum: 0xE2600C89
	Offset: 0x34C0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_403f2d91(var_53227942)
{
	if(!isdefined(var_53227942.spawn.var_8791b6ff))
	{
		return false;
	}
	return true;
}

/*
	Name: function_d072f205
	Namespace: squad_spawn
	Checksum: 0x850929AE
	Offset: 0x34F8
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function function_d072f205()
{
	return currentsessionmode() != 4 && level.var_d0252074 && !util::is_frontend_map();
}

/*
	Name: function_d95ba61f
	Namespace: squad_spawn
	Checksum: 0x66B50A22
	Offset: 0x3540
	Size: 0x556
	Parameters: 3
	Flags: Linked
*/
function function_d95ba61f(origin, angles, var_92d9ac4b)
{
	var_6e8e0d1a = (var_92d9ac4b + vectorscale((0, 0, 1), 72)) - origin;
	var_5bc46b67 = lengthsquared(var_6e8e0d1a);
	var_b8a577cc = vectornormalize(var_6e8e0d1a);
	forward = var_b8a577cc;
	var_8792667 = (0, 0, 1);
	if(var_5bc46b67 <= sqr(700))
	{
		if(sighttracepassed(origin + vectorscale((0, 0, 1), 72), var_92d9ac4b + vectorscale((0, 0, 1), 72), 0, undefined))
		{
			trace = function_32843fc9(origin + vectorscale((0, 0, 1), 72), origin - vectorscale((0, 0, 1), 72));
			if(trace[#"fraction"] != 1)
			{
				var_8792667 = trace[#"normal"];
			}
			return axistoangles(var_6e8e0d1a, var_8792667);
		}
	}
	if(getdvar(#"hash_734f370c46f37dab", 1))
	{
		var_8788f2da = axistoangles(forward, var_8792667);
	}
	else
	{
		var_8788f2da = angles;
	}
	tracestart = origin + vectorscale((0, 0, 1), 72);
	forwardpoint = tracestart + (forward * 200);
	var_a5a53f73 = physicstrace(tracestart, forwardpoint);
	if(var_a5a53f73[#"fraction"] == 1)
	{
		return var_8788f2da;
	}
	bestangles = var_8788f2da;
	var_3360e6f8 = var_a5a53f73[#"fraction"];
	rightdir = rotatepointaroundaxis(forward, (0, 0, 1), 90);
	rightpoint = tracestart + (rightdir * 200);
	var_3bb4bb28 = physicstrace(tracestart, rightpoint);
	if(var_3bb4bb28[#"fraction"] == 1)
	{
		return axistoangles(rightdir, anglestoup(var_8788f2da));
	}
	if(var_3bb4bb28[#"fraction"] > var_3360e6f8)
	{
		bestangles = axistoangles(rightdir, anglestoup(var_8788f2da));
		var_3360e6f8 = var_3bb4bb28[#"fraction"];
	}
	var_42fd5bad = rightdir * -1;
	leftpoint = tracestart + (var_42fd5bad * 200);
	var_eea13cc2 = physicstrace(tracestart, leftpoint);
	if(var_eea13cc2[#"fraction"] == 1)
	{
		return axistoangles(var_42fd5bad, anglestoup(var_8788f2da));
	}
	if(var_eea13cc2[#"fraction"] > var_3360e6f8)
	{
		bestangles = axistoangles(var_42fd5bad, anglestoup(var_8788f2da));
		var_3360e6f8 = var_eea13cc2[#"fraction"];
	}
	var_cf041923 = forward * -1;
	var_13ef855 = tracestart + (var_cf041923 * 200);
	var_ef688df7 = physicstrace(tracestart, var_13ef855);
	if(var_ef688df7[#"fraction"] == 1)
	{
		return axistoangles(var_cf041923, anglestoup(var_8788f2da));
	}
	if(var_ef688df7[#"fraction"] > var_3360e6f8)
	{
		bestangles = axistoangles(var_cf041923, anglestoup(var_8788f2da));
		var_3360e6f8 = var_ef688df7[#"fraction"];
	}
	return bestangles;
}

/*
	Name: getspawnpoint
	Namespace: squad_spawn
	Checksum: 0x8426A63A
	Offset: 0x3AA0
	Size: 0xCE
	Parameters: 1
	Flags: Linked
*/
function getspawnpoint(var_53227942)
{
	if(!isdefined(var_53227942.spawn.squadspawnpoint) || !isdefined(var_53227942.spawn.var_8791b6ff))
	{
		return undefined;
	}
	spawnpoint = spawnstruct();
	spawnpoint.origin = var_53227942.spawn.squadspawnpoint;
	spawnpoint.angles = function_d95ba61f(spawnpoint.origin, var_53227942.spawn.var_8791b6ff.angles, var_53227942.spawn.var_8791b6ff.origin);
	return spawnpoint;
}

/*
	Name: function_fd0f3019
	Namespace: squad_spawn
	Checksum: 0xBAA2C097
	Offset: 0x3B78
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
*/
function function_fd0f3019(player)
{
	if(!isplayer(player))
	{
		return false;
	}
	var_72ea2bd8 = function_c65231e2(player.squad);
	switch(var_72ea2bd8.size)
	{
		case 1:
		{
			return true;
		}
		case 2:
		{
			return true;
		}
		case 3:
		{
			return true;
		}
		case 4:
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_714da39d
	Namespace: squad_spawn
	Checksum: 0x3C19B21
	Offset: 0x3D68
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function function_714da39d(player)
{
	return function_bfb027d2(player) == 0;
}

/*
	Name: function_bfb027d2
	Namespace: squad_spawn
	Checksum: 0xE92A78AC
	Offset: 0x3D98
	Size: 0x52E
	Parameters: 1
	Flags: Linked
*/
function function_bfb027d2(player)
{
	if(!isalive(player))
	{
		return 3;
	}
	if(player inlaststand())
	{
		return 4;
	}
	if(player isinfreefall())
	{
		return 7;
	}
	if(player isparachuting())
	{
		return 7;
	}
	if(player ishidden())
	{
		return 6;
	}
	if((isdefined(player.var_e03e3ae5) ? player.var_e03e3ae5 : 0) + (int((isdefined(getgametypesetting(#"hash_2596f9e3d6e26ac9")) ? getgametypesetting(#"hash_2596f9e3d6e26ac9") : 0) * 1000)) > gettime() && isdefined(player.var_4a755632))
	{
		foreach(var_49604bcb in player.var_4a755632)
		{
			if(!isdefined(var_49604bcb.lastdamagedtime))
			{
				continue;
			}
			if(!isdefined(var_49604bcb.entity))
			{
				continue;
			}
			if((var_49604bcb.lastdamagedtime + (int((isdefined(getgametypesetting(#"hash_2596f9e3d6e26ac9")) ? getgametypesetting(#"hash_2596f9e3d6e26ac9") : 0) * 1000))) > gettime() && var_49604bcb.lastdamagedtime > (isdefined(var_49604bcb.entity.deathtime) ? var_49604bcb.entity.deathtime : 0))
			{
				return 2;
			}
		}
	}
	if(is_true(player.lastdamagewasfromenemy) && (isdefined(player.var_e2e8198f) ? player.var_e2e8198f : 0) + (int((isdefined(getgametypesetting(#"hash_2596f9e3d6e26ac9")) ? getgametypesetting(#"hash_2596f9e3d6e26ac9") : 0) * 1000)) > gettime())
	{
		return 2;
	}
	if(player laststand::player_is_in_laststand())
	{
		return 4;
	}
	if(player isinvehicle() && !player isremotecontrolling())
	{
		vehicle = player getvehicleoccupied();
		if(isdefined(vehicle))
		{
			var_ce6fc3d9 = function_f099b0f1(vehicle);
			if(!isdefined(var_ce6fc3d9))
			{
				return 5;
			}
		}
	}
	if(player function_b4813488() || player function_e128a831())
	{
		return 6;
	}
	if((isdefined(player.var_12db485c) ? player.var_12db485c : 0) < gettime())
	{
		player.var_708884c0 = gettime() + randomintrange(100, 400);
		enemies = player getenemiesinradius(player.origin, (isdefined(getgametypesetting(#"hash_718b497c5205e74b")) ? getgametypesetting(#"hash_718b497c5205e74b") : 0));
		if(enemies.size > 0)
		{
			return 1;
		}
	}
	if(function_ef8e6bd1(player))
	{
		return 2;
	}
	return 0;
}

/*
	Name: function_f099b0f1
	Namespace: squad_spawn
	Checksum: 0xF05A19C9
	Offset: 0x42D0
	Size: 0x10A
	Parameters: 1
	Flags: Linked
*/
function function_f099b0f1(vehicle)
{
	if(!isvehicle(vehicle))
	{
		return undefined;
	}
	if(!vehicle isvehicleusable())
	{
		return undefined;
	}
	for(seatindex = 0; seatindex < 11; seatindex++)
	{
		if(!vehicle function_dcef0ba1(seatindex))
		{
			continue;
		}
		if(!vehicle function_154190ec(seatindex))
		{
			continue;
		}
		var_3693c73b = vehicle function_defc91b2(seatindex);
		if(!isdefined(var_3693c73b) || var_3693c73b < 0)
		{
			continue;
		}
		if(vehicle isvehicleseatoccupied(seatindex))
		{
			continue;
		}
		return seatindex;
	}
	return undefined;
}

/*
	Name: function_61e7d9a8
	Namespace: squad_spawn
	Checksum: 0xA1F7791
	Offset: 0x43E8
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_61e7d9a8(player)
{
	return isdefined(player.spawn.locationtype) && player.spawn.locationtype == 1;
}

/*
	Name: spawninvehicle
	Namespace: squad_spawn
	Checksum: 0xF43E1CF9
	Offset: 0x4430
	Size: 0xF2
	Parameters: 1
	Flags: Linked
*/
function spawninvehicle(player)
{
	targetplayer = player.spawn.var_8791b6ff;
	if(!isdefined(targetplayer))
	{
		return;
	}
	if(!targetplayer isinvehicle())
	{
		return;
	}
	vehicle = targetplayer getvehicleoccupied();
	if(!isdefined(vehicle))
	{
		return;
	}
	if(vehicle isvehicleseatoccupied(player.spawn.var_ce6fc3d9))
	{
		return;
	}
	vehicle::function_bc2025e(player);
	vehicle usevehicle(player, player.spawn.var_ce6fc3d9);
	player.spawn.var_a9914487 = 2;
}

/*
	Name: on_player_spawned
	Namespace: squad_spawn
	Checksum: 0x4670EB88
	Offset: 0x4530
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(!function_d072f205())
	{
		return;
	}
	function_279d5c68(self.team, 0);
	if(is_true(level.droppedtagrespawn))
	{
		self clientfield::set_player_uimodel("hudItems.squadSpawnRespawnStatus", 2);
	}
	self.var_a271f211 = undefined;
	self.var_cc060afa = [];
}

/*
	Name: function_46196357
	Namespace: squad_spawn
	Checksum: 0xAD886D65
	Offset: 0x45C0
	Size: 0x1FC
	Parameters: 1
	Flags: Linked
*/
function function_46196357(squad)
{
	if(is_true(level.var_5c49de55) && game.var_794ec97[self.team])
	{
		return;
	}
	level endon(#"game_ended");
	foreach(var_cc6fd54 in function_c65231e2(squad))
	{
		var_cc6fd54 function_8c7462a6(1);
		var_cc6fd54.var_312f13e0 = 1;
		var_cc6fd54 notify(#"hash_33713849648e651d");
	}
	var_67899abe = function_fd0f3019(function_c65231e2(squad)[0]);
	wait(var_67899abe);
	foreach(var_cc6fd54 in function_c65231e2(squad))
	{
		var_cc6fd54 function_8c7462a6(0);
		var_cc6fd54.var_312f13e0 = 0;
		var_cc6fd54.var_20250438 = 1;
		var_cc6fd54 notify(#"hash_33713849648e651d");
	}
}

/*
	Name: function_9e0c4479
	Namespace: squad_spawn
	Checksum: 0x9A682919
	Offset: 0x47C8
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_9e0c4479()
{
	var_72ea2bd8 = function_c65231e2(self.squad);
	aliveplayers = function_a1cff525(self.squad);
	if(aliveplayers.size == 0 && var_72ea2bd8.size > 1)
	{
		return true;
	}
	return false;
}

/*
	Name: on_player_killed
	Namespace: squad_spawn
	Checksum: 0x8E1DAB99
	Offset: 0x4840
	Size: 0x324
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(params)
{
	if(self function_9e0c4479())
	{
		attacker = params.eattacker;
		var_72ea2bd8 = function_c65231e2(self.squad);
		if(is_true(level.var_5c49de55))
		{
			if(game.var_5c49de55[self.team] <= 0)
			{
				game.var_794ec97[self.team] = 1;
				callback::callback(#"hash_8ad22d5564224de", {#attacker:attacker, #players:var_72ea2bd8, #squad:self.squad});
				return;
			}
			game.var_5c49de55[self.team]--;
			foreach(player in var_72ea2bd8)
			{
				player clientfield::set_player_uimodel("squad_wipe_tokens.count", game.var_5c49de55[self.team]);
			}
		}
		thread function_46196357(self.squad);
		callback::callback(#"hash_34b41fbe3398f1ef", {#attacker:attacker, #players:var_72ea2bd8, #squad:self.squad});
		if(var_72ea2bd8.size >= (max(2, (isdefined(level.var_704bcca1) ? level.var_704bcca1 : 0) - 1)) && isplayer(attacker) && attacker util::isenemyplayer(self))
		{
			scoreevents::processscoreevent(#"hash_44c301a9ab6ae990", attacker, self, params.weapon);
			if(attacker stats::get_stat_global(#"hash_13ea35c63c00066c") >= 10)
			{
				attacker giveachievement(#"hash_3f780d94296c68c6");
			}
		}
	}
}

/*
	Name: on_player_connect
	Namespace: squad_spawn
	Checksum: 0xD1FDC552
	Offset: 0x4B70
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(level.var_d2f7a339 && self.team != #"spectator")
	{
		self namespace_8a203916::function_86df9236();
	}
	else
	{
		self namespace_8a203916::function_888901cb();
	}
}

/*
	Name: scoreeventplayerkill
	Namespace: squad_spawn
	Checksum: 0x8AF83092
	Offset: 0x4BD8
	Size: 0x268
	Parameters: 1
	Flags: Linked
*/
function scoreeventplayerkill(data)
{
	victim = data.victim;
	if(!isdefined(victim))
	{
		return;
	}
	attacker = data.attacker;
	if(!isdefined(attacker) || !isplayer(attacker))
	{
		return;
	}
	time = data.time;
	attacker.lastkilltime = time;
	if(isdefined(victim.lastkilltime) && victim.lastkilltime > (time - (int(10 * 1000))))
	{
		if(isdefined(victim.lastkilledplayer) && victim.lastkilledplayer.squad == attacker.squad && attacker != victim.lastkilledplayer)
		{
			scoreevents::processscoreevent("squad_avenged_member", attacker, victim);
		}
	}
	if(isdefined(victim.damagedplayers) && isdefined(attacker.clientid))
	{
		foreach(var_87de3b91 in victim.damagedplayers)
		{
			if(var_abe8cf31 === attacker.clientid)
			{
				continue;
			}
			if(!isdefined(var_87de3b91.entity))
			{
				continue;
			}
			if(attacker.squad != var_87de3b91.entity.squad)
			{
				continue;
			}
			if(time - var_87de3b91.time < int(5 * 1000))
			{
				scoreevents::processscoreevent("squad_member_saved", attacker, victim);
			}
		}
	}
}

