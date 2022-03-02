#using script_256b8879317373de;
#using script_32399001bdb550da;
#using script_35ae72be7b4fec10;
#using script_35b5ff21c2a0960f;
#using script_3626f1b2cf51a99c;
#using script_3706d21c449d0d14;
#using script_3f27a7b2232674db;
#using script_47fb62300ac0bd60;
#using script_48294c0de5c37487;
#using script_5399f402045d7abd;
#using script_57f7003580bb15e0;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using script_70a43d6ba27cff6a;
#using script_7133a4d461308099;
#using script_725554a59d6a75b9;
#using script_7bafaa95bb1b427e;
#using script_bc839bb0e693558;
#using script_db93c4bbed6e456;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\audio_shared.gsc;
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\healthoverlay.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\medals_shared.gsc;
#using scripts\core_common\persistence_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\cp_common\bb.gsc;
#using scripts\cp_common\gametypes\globallogic.gsc;
#using scripts\cp_common\gametypes\globallogic_spawn.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\gametypes\globallogic_utils.gsc;
#using scripts\cp_common\gametypes\loadout.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\util.gsc;

#namespace globallogic_player;

/*
	Name: function_7407223b
	Namespace: globallogic_player
	Checksum: 0xBDD1C9D2
	Offset: 0xA40
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7407223b()
{
	level notify(679930690);
}

/*
	Name: function_89f2df9
	Namespace: globallogic_player
	Checksum: 0xA121AF9E
	Offset: 0xA60
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"globallogic_player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: globallogic_player
	Checksum: 0x21547903
	Offset: 0xAA8
	Size: 0x7CC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_fd81f309 = [4:"MOD_GRENADE", 3:"MOD_PROJECTILE_SPLASH", 2:"MOD_PROJECTILE", 1:"MOD_RIFLE_BULLET", 0:"MOD_PISTOL_BULLET"];
	level.var_1befd357 = [10:"MOD_EXPLOSIVE", 9:"MOD_SUICIDE", 8:"MOD_HEAD_SHOT", 7:"MOD_MELEE_WEAPON_BUTT", 6:"MOD_MELEE", 5:"MOD_PROJECTILE_SPLASH", 4:"MOD_PROJECTILE", 3:"MOD_GRENADE_SPLASH", 2:"MOD_GRENADE", 1:"MOD_RIFLE_BULLET", 0:"MOD_PISTOL_BULLET"];
	level.var_ee4d094a = [];
	var_ed2bc2e0 = getscriptbundle("death_gesture_pool");
	foreach(collection in var_ed2bc2e0.collections)
	{
		var_4546d401 = [];
		foreach(entry in collection.stand)
		{
			if(!isdefined(var_4546d401[#"stand"]))
			{
				var_4546d401[#"stand"] = [];
			}
			else if(!isarray(var_4546d401[#"stand"]))
			{
				var_4546d401[#"stand"] = array(var_4546d401[#"stand"]);
			}
			var_4546d401[#"stand"][var_4546d401[#"stand"].size] = entry.gesture;
		}
		/#
			assert(isdefined(var_4546d401[#"stand"]));
		#/
		foreach(entry in collection.crouch)
		{
			if(!isdefined(var_4546d401[#"crouch"]))
			{
				var_4546d401[#"crouch"] = [];
			}
			else if(!isarray(var_4546d401[#"crouch"]))
			{
				var_4546d401[#"crouch"] = array(var_4546d401[#"crouch"]);
			}
			var_4546d401[#"crouch"][var_4546d401[#"crouch"].size] = entry.gesture;
		}
		/#
			assert(isdefined(var_4546d401[#"crouch"]));
		#/
		foreach(entry in collection.prone)
		{
			if(!isdefined(var_4546d401[#"prone"]))
			{
				var_4546d401[#"prone"] = [];
			}
			else if(!isarray(var_4546d401[#"prone"]))
			{
				var_4546d401[#"prone"] = array(var_4546d401[#"prone"]);
			}
			var_4546d401[#"prone"][var_4546d401[#"prone"].size] = entry.gesture;
		}
		/#
			assert(isdefined(var_4546d401[#"prone"]));
		#/
		if(is_true(collection.var_9af99f2f))
		{
			/#
				assert(!isdefined(level.var_ee4d094a[#"hash_3a5790d783810d4a"]));
			#/
			level.var_ee4d094a[#"hash_3a5790d783810d4a"] = var_4546d401;
			continue;
		}
		/#
			assert(isdefined(collection.weapon));
		#/
		/#
			assert(!isdefined(level.var_ee4d094a[collection.weapon]));
		#/
		level.var_ee4d094a[collection.weapon] = var_4546d401;
	}
	clientfield::register("toplayer", "player_damage_type", 1, 1, "int");
	clientfield::register("toplayer", "player_death_shield", 1, 1, "int");
	clientfield::register("toplayer", "player_death_gesture", 1, 1, "int");
	/#
		util::init_dvar("", 1, &function_a215b825);
		util::init_dvar("", 0, &function_a215b825);
		util::init_dvar("", "", &function_a215b825);
		level thread function_c5972380();
	#/
}

/*
	Name: function_a215b825
	Namespace: globallogic_player
	Checksum: 0x50DC6C7C
	Offset: 0x1280
	Size: 0xBC
	Parameters: 1
	Flags: Private
*/
function private function_a215b825(params)
{
	/#
		if(params.name == "")
		{
			level.var_841888e0 = int(params.value);
		}
		else
		{
			if(params.name == "")
			{
				level.var_16f6fb10 = int(params.value);
			}
			else if(params.name == "")
			{
				level.var_b63e01a9 = params.value;
			}
		}
	#/
}

/*
	Name: function_16f6fb10
	Namespace: globallogic_player
	Checksum: 0x4A03B6F6
	Offset: 0x1348
	Size: 0x178
	Parameters: 0
	Flags: Private
*/
function private function_16f6fb10()
{
	/#
		player = self;
		self notify("");
		self endon("");
		player endon(#"disconnect");
		self notifyonplayercommand("", "");
		while(true)
		{
			self waittill(#"hash_561a693fae6d2e9f");
			gesture = level.var_b63e01a9;
			var_f3002d70 = function_39ab832f(1);
			if(!var_f3002d70)
			{
				waitframe(1);
				continue;
			}
			setslowmotion(1, 0.2, 0.3);
			player function_7abbea8e({#hash_3ca8c1dc:gesture});
			player stopgestureviewmodel(gesture);
			player util::function_e05fc3fb(0);
			setslowmotion(0.2, 1, 0.3);
		}
	#/
}

/*
	Name: function_c5972380
	Namespace: globallogic_player
	Checksum: 0xB16CC73
	Offset: 0x14C8
	Size: 0x58
	Parameters: 0
	Flags: Private
*/
function private function_c5972380()
{
	/#
		while(true)
		{
			level waittill(#"save_restore");
			level.var_841888e0 = getdvarint(#"hash_5db59e8350ba59e7", 1);
		}
	#/
}

/*
	Name: init_player_flags
	Namespace: globallogic_player
	Checksum: 0x45C51771
	Offset: 0x1528
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function init_player_flags()
{
	if(isdefined(level.str_player_start_flag) && !self flag::exists(level.str_player_start_flag))
	{
		self flag::init(level.str_player_start_flag);
	}
}

/*
	Name: function_5379a6ca
	Namespace: globallogic_player
	Checksum: 0x9F57C489
	Offset: 0x1590
	Size: 0x74
	Parameters: 3
	Flags: Linked
*/
function function_5379a6ca(mapname, var_e29f1b52, var_33ff23e1)
{
	var_b34e8e96 = self stats::get_stat(#"playerstatsbymap", mapname, var_e29f1b52);
	if(isdefined(var_b34e8e96))
	{
		self recordcareerstatformap(var_33ff23e1, mapname, var_b34e8e96);
	}
}

/*
	Name: function_20b68a46
	Namespace: globallogic_player
	Checksum: 0x5ABED90B
	Offset: 0x1610
	Size: 0x74
	Parameters: 3
	Flags: Linked
*/
function function_20b68a46(mapname, var_e29f1b52, var_33ff23e1)
{
	var_77b33741 = self stats::get_stat(#"playerstatsbymap", mapname, var_e29f1b52);
	if(isdefined(var_77b33741))
	{
		self recordcareerflagformap(var_33ff23e1, mapname, var_77b33741);
	}
}

/*
	Name: function_3b6a335b
	Namespace: globallogic_player
	Checksum: 0xF40ED9F7
	Offset: 0x1690
	Size: 0x168
	Parameters: 0
	Flags: Linked
*/
function function_3b6a335b()
{
	if(!sessionmodeisonlinegame())
	{
		return;
	}
	var_36b17068 = skipto::function_228558fd();
	foreach(mapname in var_36b17068)
	{
		self function_20b68a46(mapname, "hasBeenCompleted", "completed");
		self function_5379a6ca(mapname, "firstTimeCompletedUTC", "firstTimeCompleted");
		self function_5379a6ca(mapname, "lastCompletedUTC", "lastTimeCompleted");
		self function_5379a6ca(mapname, "numCompletions", "numberTimesCompleted");
		self function_20b68a46(mapname, "allAccoladesComplete", "allAccoladesComplete");
	}
}

/*
	Name: function_eee2a9d2
	Namespace: globallogic_player
	Checksum: 0xA1D82466
	Offset: 0x1800
	Size: 0x21C
	Parameters: 0
	Flags: Linked
*/
function function_eee2a9d2()
{
	if(!sessionmodeisonlinegame())
	{
		return;
	}
	self function_3b6a335b();
	var_a25c62f6 = self stats::get_stat(#"playerstatslist", #"hash_668c1bd08c419f31", #"statvalue");
	self recordcareerstat("duration_total_paused_seconds", var_a25c62f6);
	var_cf196dd1 = self stats::get_stat("PlayerStatsList", #"hash_b38ac686f0e8f63", #"statvalue");
	self recordcareerstat("duration_total_seconds", var_cf196dd1);
	var_1ebfb2ab = self stats::get_stat(#"playerstatslist", #"kills", #"statvalue");
	self recordcareerstat("kills_Total", var_1ebfb2ab);
	var_d741995b = self stats::get_stat(#"playerstatslist", #"deaths", #"statvalue");
	self recordcareerstat("deaths_Total", var_d741995b);
	var_6fa2ecd1 = self stats::get_stat(#"hash_7dd9f1ac62a346d", #"hash_c159a616c8e909f");
	self recordcareerstat("deadOps_Total", var_6fa2ecd1);
}

/*
	Name: init_character_index
	Namespace: globallogic_player
	Checksum: 0xA93AFE39
	Offset: 0x1A28
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function init_character_index()
{
	bodytype = 0;
	if(isbot(self))
	{
		bodytype = (isdefined(player_role::function_c1f61ea2()) ? player_role::function_c1f61ea2() : 0);
	}
	if(player_role::is_valid(bodytype))
	{
		player_role::set(bodytype);
	}
}

/*
	Name: callback_playerconnect
	Namespace: globallogic_player
	Checksum: 0x77DAD19B
	Offset: 0x1AC0
	Size: 0x114C
	Parameters: 0
	Flags: Linked
*/
function callback_playerconnect()
{
	init_player_flags();
	thread notifyconnecting();
	self.statusicon = "$default";
	self waittill(#"begin");
	if(isdefined(level.reset_clientdvars))
	{
		self [[level.reset_clientdvars]]();
	}
	if(isbot(self))
	{
		level flag::wait_till("all_players_connected");
	}
	waittillframeend();
	self.statusicon = "";
	self.guid = self getguid();
	checkpointclear();
	savegame::checkpoint_save();
	self function_d4d27d5b();
	self thread function_f92e23de();
	profilelog_begintiming(4, "ship");
	if(self ishost())
	{
		self thread globallogic::listenforgameend();
	}
	if(!level.splitscreen && !isdefined(self.pers[#"score"]))
	{
		iprintln(#"hash_2bff59245c345d80", self);
	}
	if(!isdefined(self.pers[#"score"]))
	{
		self thread persistence::adjust_recent_stats();
		self stats::function_7a850245(#"valid", 0);
	}
	self.movementtracking = spawnstruct();
	self thread util::trackwallrunningdistance();
	self thread util::tracksprintdistance();
	self thread util::trackdoublejumpdistance();
	lpselfnum = self getentitynumber();
	lpxuid = self getxuid(1);
	bb::function_afcc007d(self.name, lpselfnum, lpxuid);
	init_character_index();
	self val::reset(#"player_connect", "show_hud");
	self setclientuivisibilityflag("weapon_hud_visible", 1);
	if(level.forceradar == 1)
	{
		self.pers[#"hasradar"] = 1;
		level.activeuavs[self getentitynumber()] = 1;
	}
	if(level.forceradar == 2)
	{
		self setclientuivisibilityflag("g_compassShowEnemies", level.forceradar);
	}
	else
	{
		self setclientuivisibilityflag("g_compassShowEnemies", 0);
	}
	self setclientplayersprinttime(level.playersprinttime);
	self setclientnumlives(level.numlives);
	self.lives = level.numlives;
	if(level.hardcoremode)
	{
		self setclientdrawtalk(3);
	}
	self.killedplayerscurrent = [];
	if(!isdefined(self.pers[#"best_kill_streak"]))
	{
		self.pers[#"killed_players"] = [];
		self.pers[#"killed_by"] = [];
		self.pers[#"nemesis_tracking"] = [];
		self.pers[#"artillery_kills"] = 0;
		self.pers[#"dog_kills"] = 0;
		self.pers[#"nemesis_name"] = "";
		self.pers[#"nemesis_rank"] = 0;
		self.pers[#"nemesis_rankicon"] = 0;
		self.pers[#"nemesis_xp"] = 0;
		self.pers[#"nemesis_xuid"] = "";
		self.pers[#"best_kill_streak"] = 0;
	}
	if(!isdefined(self.pers[#"music"]))
	{
		self.pers[#"music"] = spawnstruct();
		self.pers[#"music"].spawn = 0;
		self.pers[#"music"].inque = 0;
		self.pers[#"music"].currentstate = "SILENT";
		self.pers[#"music"].previousstate = "SILENT";
		self.pers[#"music"].nextstate = "UNDERSCORE";
		self.pers[#"music"].returnstate = "UNDERSCORE";
	}
	self.leaderdialogqueue = [];
	self.leaderdialogactive = 0;
	self.leaderdialoggroups = [];
	self.currentleaderdialoggroup = "";
	self.currentleaderdialog = "";
	self.currentleaderdialogtime = 0;
	if(!isdefined(self.pers[#"cur_kill_streak"]))
	{
		self.pers[#"cur_kill_streak"] = 0;
	}
	if(!isdefined(self.pers[#"cur_total_kill_streak"]))
	{
		self.pers[#"cur_total_kill_streak"] = 0;
		self setplayercurrentstreak(0);
	}
	if(!isdefined(self.pers[#"totalkillstreakcount"]))
	{
		self.pers[#"totalkillstreakcount"] = 0;
	}
	if(!isdefined(self.pers[#"killstreaksearnedthiskillstreak"]))
	{
		self.pers[#"killstreaksearnedthiskillstreak"] = 0;
	}
	if(isdefined(level.usingscorestreaks) && level.usingscorestreaks && !isdefined(self.pers[#"killstreak_quantity"]))
	{
		self.pers[#"killstreak_quantity"] = [];
	}
	if(isdefined(level.usingscorestreaks) && level.usingscorestreaks && !isdefined(self.pers[#"held_killstreak_ammo_count"]))
	{
		self.pers[#"held_killstreak_ammo_count"] = [];
	}
	if(isdefined(level.usingscorestreaks) && level.usingscorestreaks && !isdefined(self.pers[#"held_killstreak_clip_count"]))
	{
		self.pers[#"held_killstreak_clip_count"] = [];
	}
	if(!isdefined(self.pers[#"changed_class"]))
	{
		self.pers[#"changed_class"] = 0;
	}
	self.lastkilltime = 0;
	self.cur_death_streak = 0;
	self disabledeathstreak();
	self.death_streak = 0;
	self.kill_streak = 0;
	self.gametype_kill_streak = 0;
	self.spawnqueueindex = -1;
	self.deathtime = 0;
	player::function_5ae8566b(1, 0);
	self.lastgrenadesuicidetime = -1;
	self.teamkillsthisround = 0;
	if(isdefined(world.player_lives))
	{
		self.pers[#"lives"] = world.player_lives;
	}
	else if(!isdefined(level.livesdonotreset) || !level.livesdonotreset || !isdefined(self.pers[#"lives"]))
	{
		self.pers[#"lives"] = level.numlives;
	}
	self.pers[#"team"] = undefined;
	self.hasspawned = 0;
	self.waitingtospawn = 0;
	self.wantsafespawn = 0;
	self.deathcount = 0;
	self.connectedtime = gettime();
	self.meleekills = 0;
	self.wasaliveatmatchstart = 0;
	self.grenadesused = 0;
	if(level.splitscreen)
	{
		setdvar(#"splitscreen_playernum", level.players.size);
	}
	if(game.state == "postgame")
	{
		self.pers[#"needteam"] = 1;
		self.pers[#"team"] = "spectator";
		self.team = "spectator";
		self.sessionteam = "spectator";
		self val::set(#"player_connect", "show_hud", 0);
		self [[level.spawnintermission]]();
		self closeingamemenu();
		profilelog_endtiming(4, (("gs=" + game.state) + " zom=") + sessionmodeiszombiesgame());
		return;
	}
	level endon(#"game_ended");
	if(level.oldschool)
	{
		self.pers[#"class"] = undefined;
		self.curclass = self.pers[#"class"];
	}
	if(isdefined(self.pers[#"team"]))
	{
		self.team = self.pers[#"team"];
	}
	if(isdefined(self.pers[#"class"]))
	{
		self.curclass = self.pers[#"class"];
	}
	if(!isdefined(self.pers[#"team"]) || isdefined(self.pers[#"needteam"]))
	{
		self.pers[#"needteam"] = undefined;
		self.pers[#"team"] = "spectator";
		self.team = "spectator";
		self.sessionstate = "dead";
		self globallogic_ui::updateobjectivetext();
		[[level.spawnspectator]]();
		[[level.autoassign]](0);
		if(level.rankedmatch || level.leaguematch)
		{
			self thread globallogic_spawn::kickifdontspawn();
		}
		if(level.teambased)
		{
			self.sessionteam = self.pers[#"team"];
			if(!isalive(self))
			{
				self.statusicon = "hud_status_dead";
			}
			self thread spectating::set_permissions();
		}
	}
	else
	{
		self.sessionteam = self.pers[#"team"];
		self.sessionstate = "dead";
		self globallogic_ui::updateobjectivetext();
		[[level.spawnspectator]]();
		if(globallogic_utils::isvalidclass(self.pers[#"class"]))
		{
			self thread [[level.spawnclient]]();
		}
		else
		{
			self globallogic_ui::showmainmenuforteam();
		}
		self thread spectating::set_permissions();
	}
	if(self.sessionteam != "spectator")
	{
		self [[level.onspawnplayer]](1);
	}
	profilelog_endtiming(4, (("gs=" + game.state) + " zom=") + sessionmodeiszombiesgame());
	if(!isdefined(level.players))
	{
		level.players = [];
	}
	else if(!isarray(level.players))
	{
		level.players = array(level.players);
	}
	if(!isinarray(level.players, self))
	{
		level.players[level.players.size] = self;
	}
	level.player = self;
	globallogic::updateteamstatus();
	self function_eee2a9d2();
	var_c0fcc1e2 = self stats::get_stat(#"hash_34f35d8710b57e3a", #"unlocked");
	if(!isdefined(level.var_841888e0))
	{
		level.var_841888e0 = 1;
	}
	/#
		if(is_true(level.var_16f6fb10))
		{
			self thread function_16f6fb10();
		}
	#/
	level notify(#"connected", {#player:self});
	callback::callback(#"on_player_connect");
}

/*
	Name: function_d4d27d5b
	Namespace: globallogic_player
	Checksum: 0x50287F01
	Offset: 0x2C18
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_d4d27d5b()
{
	incaps = self stats::get_stat(#"playerstatslist", #"incaps", #"statvalue");
	if(!isdefined(incaps))
	{
		incaps = 0;
	}
	revives = self stats::get_stat(#"playerstatslist", #"revives", #"statvalue");
	if(!isdefined(revives))
	{
		revives = 0;
	}
	self setnoncheckpointdata("INCAPS", incaps);
	self setnoncheckpointdata("REVIVES", revives);
}

/*
	Name: function_f92e23de
	Namespace: globallogic_player
	Checksum: 0x88F9ABAB
	Offset: 0x2D18
	Size: 0x480
	Parameters: 0
	Flags: Linked
*/
function function_f92e23de()
{
	self endon(#"disconnect");
	var_11ffb46 = getrootmapname();
	if(!isdefined(var_11ffb46) || is_true(level.disablestattracking))
	{
		return;
	}
	while(true)
	{
		level waittill(#"save_restore");
		var_eeb08e4 = self getnoncheckpointdata("INCAPS");
		var_397a145d = self stats::get_stat(#"playerstatslist", #"incaps", #"statvalue");
		var_ebf6c5c6 = self stats::get_stat(#"playerstatsbymap", var_11ffb46, #"hash_2f236080a1058999", #"incaps");
		if(isdefined(var_eeb08e4))
		{
			/#
				assert(var_eeb08e4 >= var_397a145d, "");
			#/
			/#
				assert(var_eeb08e4 >= var_ebf6c5c6, "");
			#/
			self stats::set_stat(#"playerstatslist", #"incaps", #"statvalue", var_eeb08e4);
			self.incaps = var_eeb08e4 - self stats::get_stat(#"playerstatsbymap", var_11ffb46, #"hash_2f236080a1058999", #"incaps");
			self.pers[#"incaps"] = self.incaps;
		}
		var_cb9c2ac2 = self getnoncheckpointdata("REVIVES");
		var_a25504c0 = self stats::get_stat(#"playerstatslist", #"revives", #"statvalue");
		var_939d065a = self stats::get_stat(#"playerstatsbymap", var_11ffb46, #"hash_2f236080a1058999", #"revives");
		if(isdefined(var_cb9c2ac2))
		{
			/#
				assert(var_cb9c2ac2 >= var_a25504c0, "");
			#/
			/#
				assert(var_cb9c2ac2 >= var_939d065a, "");
			#/
			self stats::set_stat(#"playerstatslist", #"revives", #"statvalue", var_cb9c2ac2);
			self.revives = var_cb9c2ac2 - self stats::get_stat(#"playerstatsbymap", var_11ffb46, #"hash_2f236080a1058999", #"revives");
			/#
				assert(self.revives >= 0);
			#/
			self.pers[#"revives"] = self.revives;
		}
		var_28f0970b = self getnoncheckpointdata("lives");
		if(isdefined(var_28f0970b))
		{
			self.lives = var_28f0970b;
			self clearnoncheckpointdata("lives");
		}
	}
}

/*
	Name: callback_playermigrated
	Namespace: globallogic_player
	Checksum: 0x80F724D1
	Offset: 0x31A0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function callback_playermigrated()
{
}

/*
	Name: callback_playerdisconnect
	Namespace: globallogic_player
	Checksum: 0xB9F728BE
	Offset: 0x31B0
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function callback_playerdisconnect()
{
	checkpointclear();
	savegame::checkpoint_save();
	arrayremovevalue(level.players, self);
	[[level.onplayerdisconnect]]();
	self clearallnoncheckpointdata();
}

/*
	Name: callback_playermelee
	Namespace: globallogic_player
	Checksum: 0xB2AA2AAD
	Offset: 0x3230
	Size: 0xB4
	Parameters: 8
	Flags: Linked
*/
function callback_playermelee(eattacker, idamage, weapon, vorigin, vdir, boneindex, shieldhit, frombehind)
{
	hit = 1;
	if(level.teambased && self.team == idamage.team)
	{
		if(level.friendlyfire == 0)
		{
			hit = 0;
		}
	}
	self finishmeleehit(idamage, weapon, vorigin, vdir, boneindex, shieldhit, hit, frombehind);
}

/*
	Name: function_74b6d714
	Namespace: globallogic_player
	Checksum: 0xC978D956
	Offset: 0x32F0
	Size: 0xA4
	Parameters: 5
	Flags: Linked
*/
function function_74b6d714(attacker, effectname, var_894859a2, var_ab5b905e, weapon)
{
	var_20df3f41 = function_1115bceb(effectname);
	if(isdefined(var_ab5b905e) && var_ab5b905e > 0)
	{
		duration = var_ab5b905e;
	}
	else
	{
		duration = undefined;
	}
	self status_effect::status_effect_apply(var_20df3f41, weapon, attacker, undefined, duration, var_894859a2);
}

/*
	Name: custom_gamemodes_modified_damage
	Namespace: globallogic_player
	Checksum: 0xC83C00DF
	Offset: 0x33A0
	Size: 0xDA
	Parameters: 7
	Flags: Linked
*/
function custom_gamemodes_modified_damage(victim, eattacker, idamage, smeansofdeath, weapon, einflictor, shitloc)
{
	if(level.onlinegame && !sessionmodeisprivate())
	{
		return einflictor;
	}
	if(isdefined(weapon) && isdefined(weapon.damagemodifier))
	{
		einflictor = einflictor * weapon.damagemodifier;
	}
	if(shitloc == "MOD_PISTOL_BULLET" || shitloc == "MOD_RIFLE_BULLET")
	{
		einflictor = int(einflictor * level.bulletdamagescalar);
	}
	return einflictor;
}

/*
	Name: function_c2a2b500
	Namespace: globallogic_player
	Checksum: 0x5E5FC6DA
	Offset: 0x3488
	Size: 0x11A
	Parameters: 3
	Flags: Linked
*/
function function_c2a2b500(victim, dir, smeansofdeath)
{
	var_e3dbc335 = 0.64;
	if(is_true(victim.var_108942e2) && isdefined(dir))
	{
		if(smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET")
		{
			axis = undefined;
			if(isplayer(victim))
			{
				axis = anglestoaxis(victim getplayerangles());
			}
			else
			{
				axis = anglestoaxis(victim.angles);
			}
			if(vectordot(dir, axis.forward * -1) > var_e3dbc335)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: figureoutweapon
	Namespace: globallogic_player
	Checksum: 0x10D6A7B5
	Offset: 0x35B0
	Size: 0xE2
	Parameters: 2
	Flags: Linked
*/
function figureoutweapon(weapon, einflictor)
{
	if(weapon == level.weaponnone && isdefined(einflictor))
	{
		if(isdefined(einflictor.targetname) && einflictor.targetname == "explodable_barrel")
		{
			weapon = getweapon(#"explodable_barrel");
		}
		else if(isdefined(einflictor.destructible_type) && issubstr(einflictor.destructible_type, "vehicle_"))
		{
			weapon = getweapon(#"destructible_car");
		}
	}
	return weapon;
}

/*
	Name: figureoutfriendlyfire
	Namespace: globallogic_player
	Checksum: 0x1764DC01
	Offset: 0x36A0
	Size: 0x1E
	Parameters: 2
	Flags: Linked
*/
function figureoutfriendlyfire(victim, eattacker)
{
	return level.friendlyfire;
}

/*
	Name: isplayerimmunetokillstreak
	Namespace: globallogic_player
	Checksum: 0xEE9EDDE8
	Offset: 0x36C8
	Size: 0x4A
	Parameters: 2
	Flags: Linked
*/
function isplayerimmunetokillstreak(eattacker, weapon)
{
	if(level.hardcoremode)
	{
		return 0;
	}
	if(!isdefined(eattacker))
	{
		return 0;
	}
	if(self != eattacker)
	{
		return 0;
	}
	return weapon.donotdamageowner;
}

/*
	Name: function_7681dccc
	Namespace: globallogic_player
	Checksum: 0x7CDD6E27
	Offset: 0x3720
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function function_7681dccc()
{
	if(self isinvehicle())
	{
		vehicle = self getvehicleoccupied();
		if(isdefined(vehicle) && isdefined(vehicle.overrideplayerdamage))
		{
			return vehicle.overrideplayerdamage;
		}
	}
	if(isdefined(self.overrideplayerdamage))
	{
		return self.overrideplayerdamage;
	}
	if(isdefined(level.overrideplayerdamage))
	{
		return level.overrideplayerdamage;
	}
}

/*
	Name: callback_playerdamage
	Namespace: globallogic_player
	Checksum: 0x27891DB7
	Offset: 0x37B8
	Size: 0x22EC
	Parameters: 14
	Flags: Linked
*/
function callback_playerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal)
{
	profilelog_begintiming(6, "ship");
	if(game.state == "postgame")
	{
		return;
	}
	if(self.sessionteam == "spectator")
	{
		return;
	}
	if(self getinvulnerability())
	{
		return;
	}
	if(isdefined(self.candocombat) && !self.candocombat)
	{
		return;
	}
	if(level flag::get(#"chyron_active"))
	{
		return;
	}
	if(scene::is_igc_active() && !scene::function_871087b6())
	{
		return;
	}
	if(self.scene_takedamage === 0)
	{
		return;
	}
	if(is_true(self.b_game_start_invulnerability))
	{
		return;
	}
	if(is_true(self.b_teleport_invulnerability))
	{
		return;
	}
	if(isdefined(eattacker) && isplayer(eattacker) && isdefined(eattacker.candocombat) && !eattacker.candocombat)
	{
		return;
	}
	if(isdefined(level.hostmigrationtimer))
	{
		return;
	}
	if(smeansofdeath === "MOD_TRIGGER_HURT" && isdefined(einflictor) && isstring(einflictor.script_hazard))
	{
		if(einflictor.script_hazard != "none" && einflictor.script_hazard != "false")
		{
			var_e0445c07 = !isplayer(einflictor) && is_true(einflictor.var_860eee77);
			var_e44c571d = is_true(self.var_ac0c25c9) || var_e0445c07;
			hazard::do_damage(einflictor.script_hazard, idamage, einflictor, var_e44c571d);
			if(!var_e0445c07)
			{
				return;
			}
		}
	}
	weaponname = weapon.name;
	if(weaponname == "ai_tank_drone_gun" || weaponname == "ai_tank_drone_rocket" && !level.hardcoremode)
	{
		if(isdefined(eattacker) && eattacker == self)
		{
			if(isdefined(einflictor) && isdefined(einflictor.from_ai))
			{
				return;
			}
		}
		if(isdefined(eattacker) && isdefined(eattacker.owner) && eattacker.owner == self)
		{
			return;
		}
	}
	if(weapon.isemp)
	{
		if(self hasperk(#"specialty_immuneemp"))
		{
			return;
		}
		self notify(#"emp_grenaded", {#position:vpoint, #attacker:eattacker});
	}
	if(isdefined(eattacker) && isplayer(eattacker) && !weapons::ismeleemod(smeansofdeath))
	{
		var_8f516911 = function_b576d3d(weapon, shitloc);
		idamage = idamage * var_8f516911;
	}
	overrideplayerdamage = function_7681dccc();
	idamage = int(idamage);
	var_a1f8d00b = idamage;
	if(isdefined(overrideplayerdamage))
	{
		modifieddamage = self [[overrideplayerdamage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex);
		if(isdefined(modifieddamage))
		{
			if(modifieddamage <= 0)
			{
				return;
			}
			idamage = modifieddamage;
		}
	}
	/#
		assert(isdefined(idamage), "");
	#/
	params = spawnstruct();
	params.einflictor = einflictor;
	params.eattacker = eattacker;
	params.idamage = idamage;
	params.idflags = idflags;
	params.smeansofdeath = smeansofdeath;
	params.weapon = weapon;
	params.var_fd90b0bb = var_fd90b0bb;
	params.vpoint = vpoint;
	params.vdir = vdir;
	params.shitloc = shitloc;
	params.vdamageorigin = vdamageorigin;
	params.psoffsettime = psoffsettime;
	self.last_damaged_time = level.time;
	self callback::callback(#"on_player_damage", params);
	if(self hasperk(#"specialty_immuneparanoia"))
	{
		var_fa50ba5f = self getvelocity();
		if(lengthsquared(var_fa50ba5f) < 2500)
		{
			idamage = idamage * 0.7;
		}
	}
	if(self hasperk(#"specialty_flakjacket") && weapons::isexplosivedamage(smeansofdeath) && !is_true(weapon.ignoresflakjacket))
	{
		idamage = idamage * 0.5;
	}
	if(isdefined(eattacker) && (!isplayer(eattacker) || is_true(isbot(eattacker))))
	{
		if(self flag::get("player_is_invulnerable") && !self function_883dd64(idamage))
		{
			idamage = 0;
		}
	}
	idamage = custom_gamemodes_modified_damage(self, eattacker, idamage, smeansofdeath, weapon, einflictor, shitloc);
	idamage = int(idamage);
	self.idflags = idflags;
	self.idflagstime = gettime();
	eattacker = figureoutattacker(eattacker);
	idamage = gamedifficulty::adjust_melee_damage(self, eattacker, einflictor, idamage, weapon, shitloc, smeansofdeath);
	idamage = gamedifficulty::function_23dcd1f6(self, eattacker, einflictor, idamage, weapon, shitloc, smeansofdeath);
	idamage = int(idamage);
	pixbeginevent();
	if(!isdefined(vdir))
	{
		idflags = idflags | 4;
	}
	friendly = 0;
	if(self.health != self.maxhealth && !self util::function_a1d6293())
	{
		self notify(#"snd_pain_player", {#mod:smeansofdeath});
	}
	if(isdefined(einflictor) && isdefined(einflictor.script_noteworthy))
	{
		if(einflictor.script_noteworthy == "ragdoll_now")
		{
			smeansofdeath = "MOD_FALLING";
		}
		if(isdefined(level.overrideweaponfunc))
		{
			weapon = [[level.overrideweaponfunc]](weapon, einflictor.script_noteworthy);
		}
	}
	if(weapons::isheadshot(weapon, shitloc, smeansofdeath) && isplayer(eattacker))
	{
		smeansofdeath = "MOD_HEAD_SHOT";
	}
	if(level.onplayerdamage != (&globallogic::blank))
	{
		modifieddamage = [[level.onplayerdamage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime);
		if(isdefined(modifieddamage))
		{
			if(modifieddamage <= 0)
			{
				pixendevent();
				return;
			}
			idamage = modifieddamage;
		}
	}
	if(level.onlyheadshots)
	{
		if(smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET")
		{
			pixendevent();
			return;
		}
		if(smeansofdeath == "MOD_HEAD_SHOT")
		{
			idamage = 150;
		}
	}
	if(self player_is_occupant_invulnerable(smeansofdeath))
	{
		pixendevent();
		return;
	}
	same_team = isdefined(eattacker) && (self.team === eattacker.team || util::function_9b7092ef(self.team, eattacker.team));
	if(isdefined(eattacker) && isplayer(eattacker) && !same_team)
	{
		self.lastattackweapon = weapon;
	}
	weapon = figureoutweapon(weapon, einflictor);
	pixendevent();
	if(isdefined(eattacker) && isai(eattacker))
	{
		if(self.team == eattacker.team && smeansofdeath == "MOD_MELEE")
		{
			return;
		}
	}
	attackerishittingteammate = isplayer(eattacker) && self util::isenemyplayer(eattacker) == 0;
	if(shitloc == "riotshield")
	{
		if(attackerishittingteammate && level.friendlyfire == 0)
		{
			return;
		}
		if(smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET" && !attackerishittingteammate)
		{
			if(self.hasriotshieldequipped)
			{
				if(isplayer(eattacker))
				{
					eattacker.lastattackedshieldplayer = self;
					eattacker.lastattackedshieldtime = gettime();
				}
				previous_shield_damage = self.shielddamageblocked;
				self.shielddamageblocked = self.shielddamageblocked + idamage;
				if(self.shielddamageblocked % 400 < previous_shield_damage % 400)
				{
					score_event = "shield_blocked_damage";
					if(self.shielddamageblocked > 2000)
					{
						score_event = "shield_blocked_damage_reduced";
					}
					score = rank::getscoreinfovalue(score_event);
					if(score > 0)
					{
						self stats::function_e24eec31(level.weaponriotshield, #"score_from_blocked_damage", score);
					}
				}
			}
		}
		if(idflags & 32)
		{
			shitloc = "none";
			if(!idflags & 64)
			{
				idamage = idamage * 0;
			}
		}
		else
		{
			if(idflags & 128)
			{
				if(isdefined(einflictor) && isdefined(einflictor.stucktoplayer) && einflictor.stucktoplayer == self)
				{
					idamage = 101;
				}
				shitloc = "none";
			}
			else
			{
				return;
			}
		}
	}
	if(function_c2a2b500(self, vdir, smeansofdeath))
	{
		self notify(#"body_shield_damage", params);
		self.var_c3d9d4c9 = 1;
		var_709ce886 = 1;
		idamage = 0;
	}
	if(idamage > 0)
	{
		var_d020b056 = undefined;
		if(isdefined(einflictor) && isactor(einflictor))
		{
			var_d020b056 = einflictor getfiremode();
		}
		self thread gamedifficulty::function_fef4c10f(gamedifficulty::function_52f56aea(var_d020b056));
	}
	if(!idflags & 8192)
	{
		if(isdefined(einflictor) && (smeansofdeath == "MOD_GAS" || weapons::isexplosivedamage(smeansofdeath)))
		{
			if(einflictor.classname == "grenade" || weaponname == "tabun_gas" && isdefined(self.lastspawnpoint) && (self.lastspawntime + 3500) > gettime() && distancesquared(einflictor.origin, self.lastspawnpoint.origin) < 62500)
			{
				return;
			}
			if(self isplayerimmunetokillstreak(eattacker, weapon))
			{
				return;
			}
			self.explosiveinfo = [];
			self.explosiveinfo[#"damagetime"] = gettime();
			self.explosiveinfo[#"damageid"] = einflictor getentitynumber();
			self.explosiveinfo[#"originalownerkill"] = 0;
			self.explosiveinfo[#"bulletpenetrationkill"] = 0;
			self.explosiveinfo[#"chainkill"] = 0;
			self.explosiveinfo[#"damageexplosivekill"] = 0;
			self.explosiveinfo[#"chainkill"] = 0;
			self.explosiveinfo[#"cookedkill"] = 0;
			self.explosiveinfo[#"weapon"] = weapon;
			self.explosiveinfo[#"originalowner"] = einflictor.originalowner;
			isfrag = weaponname == "frag_grenade";
			if(isdefined(eattacker) && eattacker != self)
			{
				if(isdefined(eattacker) && isdefined(einflictor.owner) && (weapon.name == #"satchel_charge" || weapon.name == #"claymore" || weapon.name == #"bouncingbetty"))
				{
					self.explosiveinfo[#"originalownerkill"] = einflictor.owner == self;
					self.explosiveinfo[#"damageexplosivekill"] = isdefined(einflictor.wasdamaged);
					self.explosiveinfo[#"chainkill"] = isdefined(einflictor.waschained);
					self.explosiveinfo[#"wasjustplanted"] = isdefined(einflictor.wasjustplanted);
					self.explosiveinfo[#"bulletpenetrationkill"] = isdefined(einflictor.wasdamagedfrombulletpenetration);
					self.explosiveinfo[#"cookedkill"] = 0;
				}
				if(isdefined(einflictor) && isdefined(einflictor.stucktoplayer) && weapon.projexplosiontype == "grenade")
				{
					self.explosiveinfo[#"stucktoplayer"] = einflictor.stucktoplayer;
				}
				if(weapon.isstun)
				{
					self.laststunnedby = eattacker;
					self.laststunnedtime = self.idflagstime;
				}
				if(isdefined(eattacker.lastgrenadesuicidetime) && eattacker.lastgrenadesuicidetime >= (gettime() - 50) && isfrag)
				{
					self.explosiveinfo[#"suicidegrenadekill"] = 1;
				}
				else
				{
					self.explosiveinfo[#"suicidegrenadekill"] = 0;
				}
			}
			if(isfrag)
			{
				self.explosiveinfo[#"cookedkill"] = isdefined(einflictor.iscooked);
				self.explosiveinfo[#"throwbackkill"] = isdefined(einflictor.throwback);
			}
		}
		if(smeansofdeath == "MOD_IMPACT" && isdefined(eattacker) && isplayer(eattacker) && eattacker != self)
		{
			if(weapon.name == #"hatchet" && isdefined(einflictor))
			{
				self.explosiveinfo[#"projectile_bounced"] = isdefined(einflictor.bounced);
			}
		}
		if(isplayer(eattacker))
		{
			eattacker.pers[#"participation"]++;
		}
		prevhealthratio = self.health / self.maxhealth;
		if(idamage >= self.health && isdefined(eattacker) && eattacker != self && !same_team && !isplayer(eattacker))
		{
			if(array::contains(level.var_fd81f309, smeansofdeath) && self gamedifficulty::player_eligible_for_death_invulnerability())
			{
				var_1e4afbfd = (idamage - self.health) * (gamedifficulty::get_player_difficulty_health() / 100);
				if(!self function_883dd64(var_1e4afbfd))
				{
					self gamedifficulty::function_2339ca92();
					self clientfield::set_to_player("player_death_shield", 1);
					self thread function_d7f8c1b3();
					self setnormalhealth(2 / self.maxhealth);
					idamage = 1;
				}
			}
		}
		if(weapon.parentweaponname === "riotshield" && self != eattacker && !same_team)
		{
			earthquake(0.25, 0.1, self.origin, 16, self);
		}
		if(level.teambased && issentient(eattacker) && self != eattacker && same_team)
		{
			pixmarker("BEGIN: PlayerDamage player");
			if(level.friendlyfire == 0)
			{
				if(weapon.forcedamageshellshockandrumble)
				{
					self damageshellshockandrumble(eattacker, einflictor, weapon, smeansofdeath, idamage);
				}
				return;
			}
			if(level.friendlyfire == 1)
			{
				if(idamage < 1)
				{
					idamage = 1;
				}
				if(level.friendlyfiredelay && level.friendlyfiredelaytime >= (((gettime() - level.starttime) - level.discardtime) / 1000))
				{
					eattacker.lastdamagewasfromenemy = 0;
					eattacker.friendlydamage = 1;
					eattacker finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
					eattacker.friendlydamage = undefined;
				}
				else
				{
					self.lastdamagewasfromenemy = 0;
					self finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
				}
			}
			else
			{
				if(level.friendlyfire == 2 && isalive(eattacker))
				{
					idamage = int(idamage * 0.5);
					if(idamage < 1)
					{
						idamage = 1;
					}
					eattacker.lastdamagewasfromenemy = 0;
					eattacker.friendlydamage = 1;
					eattacker finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
					eattacker.friendlydamage = undefined;
				}
				else if(level.friendlyfire == 3 && isalive(eattacker))
				{
					idamage = int(idamage * 0.5);
					if(idamage < 1)
					{
						idamage = 1;
					}
					self.lastdamagewasfromenemy = 0;
					eattacker.lastdamagewasfromenemy = 0;
					self finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
					eattacker.friendlydamage = 1;
					eattacker finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
					eattacker.friendlydamage = undefined;
				}
			}
			friendly = 1;
			pixmarker("END: PlayerDamage player");
		}
		else
		{
			if(idamage < 1 && !is_true(var_709ce886) && !self flag::get("player_is_invulnerable"))
			{
				idamage = 1;
			}
			giveattackerandinflictorownerassist(eattacker, einflictor, idamage, smeansofdeath, weapon);
			if(isdefined(eattacker))
			{
				level.lastlegitimateattacker = eattacker;
			}
			if(smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" && isdefined(einflictor) && isdefined(einflictor.iscooked))
			{
				self.wascooked = gettime();
			}
			else
			{
				self.wascooked = undefined;
			}
			self.lastdamagewasfromenemy = isdefined(eattacker) && eattacker != self;
			if(self.lastdamagewasfromenemy)
			{
				if(isplayer(eattacker))
				{
					if(isdefined(eattacker.damagedplayers[self.clientid]) == 0)
					{
						eattacker.damagedplayers[self.clientid] = spawnstruct();
					}
					eattacker.damagedplayers[self.clientid].time = gettime();
					eattacker.damagedplayers[self.clientid].entity = self;
				}
			}
			if(is_true(var_709ce886))
			{
				self clientfield::set_to_player("player_damage_type", 1);
				self addtodamageindicator(50, vdir);
			}
			else
			{
				self clientfield::set_to_player("player_damage_type", 0);
				self finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
			}
		}
		if(isdefined(eattacker) && isplayer(eattacker) && eattacker != self)
		{
			if(damagefeedback::dodamagefeedback(weapon, einflictor, idamage, smeansofdeath))
			{
				if(idamage > 0)
				{
					if(self.health > 0)
					{
						perkfeedback = doperkfeedback(self, weapon, smeansofdeath, einflictor);
					}
					eattacker thread damagefeedback::update(smeansofdeath, einflictor, perkfeedback, weapon, self, psoffsettime, shitloc);
				}
			}
		}
		self.hasdonecombat = 1;
	}
	else
	{
		idamage = var_a1f8d00b;
		self finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
	}
	time = gettime();
	var_29532ab1 = getweapon(#"gadget_health_regen");
	slot = self gadgetgetslot(var_29532ab1);
	if(!isbot(self) && !self function_8bc54983() && !self scene::is_igc_active() && !self isplayinganimscripted() && !self isinvehicle() && isdefined(slot) && self gadgetisready(slot) && (self.health - idamage) <= 50 && (!isdefined(self.var_17a87fa6) || time >= (self.var_17a87fa6 + 15000)) && (!isdefined(self.var_40bbb505) || self.var_40bbb505 < 3))
	{
		self.var_17a87fa6 = time;
		if(!isdefined(self.var_40bbb505))
		{
			self.var_40bbb505 = 0;
		}
		self.var_40bbb505 = self.var_40bbb505 + 1;
		self thread util::show_hint_text(#"hash_2ad0f26e2ff481b7", 0, "healing_preamble");
	}
	pixbeginevent();
	/#
		if(getdvarint(#"g_debugdamage", 0))
		{
			if(isdefined(eattacker.clientid))
			{
				println(((((((((("" + self getentitynumber()) + "") + self.health) + "") + eattacker.clientid) + "") + isplayer(einflictor) + "") + idamage) + "") + shitloc);
			}
			else if(isdefined(eattacker))
			{
				println((((((((("" + self getentitynumber()) + "") + self.health) + "") + eattacker getentitynumber() + "") + isplayer(einflictor) + "") + idamage) + "") + shitloc);
			}
			loc = anglestoforward(self getplayerangles()) * 128;
			color = (1, 1, 0);
			dur = 15;
			height = vectorscale((0, 0, 1), 16);
			if(idamage >= 100)
			{
				dur = 40;
				color = (1, 0, 0);
				height = vectorscale((0, 0, 1), 32);
			}
			else if(idamage < 20)
			{
				dur = 8;
				height = (0, 0, 0);
				color = (0, 0, 1);
			}
			loc = loc + (self getorigin() + height);
			print3d(loc, "" + idamage, color, 1, 0.5, dur, 1);
			if(isdefined(eattacker.origin))
			{
				print3d(eattacker.origin + vectorscale((0, 0, 1), 72), "" + idamage, color, 1, 1, dur, 1);
				line(eattacker.origin + vectorscale((0, 0, 1), 72), loc, color, 1, 0, dur);
			}
		}
	#/
	if(self.sessionstate != "dead")
	{
		lpselfnum = self getentitynumber();
		lpselfname = self.name;
		lpselfteam = self.team;
		lpselfguid = self getguid();
		lpattackerteam = "";
		var_5a02d414 = 0;
		if(isplayer(eattacker))
		{
			lpattacknum = eattacker getentitynumber();
			var_c8fa9c41 = eattacker getxuid();
			lpattackguid = eattacker getguid();
			lpattackname = eattacker.name;
			lpattackerteam = eattacker.team;
		}
		else
		{
			var_74b485a4 = "world";
			lpattackerteam = "world";
			lpattacknum = -1;
			var_c8fa9c41 = 0;
			lpattackguid = "";
			lpattackname = "";
		}
		bb::logdamage(eattacker, self, weapon, idamage, smeansofdeath, shitloc, 0, var_5a02d414);
	}
	pixendevent();
	profilelog_endtiming(6, (("gs=" + game.state) + " zom=") + sessionmodeiszombiesgame());
}

/*
	Name: function_d7f8c1b3
	Namespace: globallogic_player
	Checksum: 0xC50E128D
	Offset: 0x5AB0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_d7f8c1b3()
{
	self notify("6828fb1dcef780d1");
	self endon("6828fb1dcef780d1");
	waitframe(1);
	self clientfield::set_to_player("player_death_shield", 0);
}

/*
	Name: function_8b3485
	Namespace: globallogic_player
	Checksum: 0x9C29F301
	Offset: 0x5B00
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_8b3485()
{
	self notify("4552894c407ee0ee");
	self endon("4552894c407ee0ee");
	waitframe(1);
	self clientfield::set_to_player("player_death_gesture", 0);
}

/*
	Name: function_883dd64
	Namespace: globallogic_player
	Checksum: 0x23EC8CBF
	Offset: 0x5B50
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function function_883dd64(idamage)
{
	var_e561f9d9 = gamedifficulty::get_worthy_damage_ratio();
	if(idamage / 100 < var_e561f9d9)
	{
		return false;
	}
	return true;
}

/*
	Name: player_is_occupant_invulnerable
	Namespace: globallogic_player
	Checksum: 0xEDE30C16
	Offset: 0x5B98
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function player_is_occupant_invulnerable(smeansofdeath)
{
	if(self isremotecontrolling())
	{
		return 0;
	}
	if(!isdefined(level.vehicle_drivers_are_invulnerable))
	{
		level.vehicle_drivers_are_invulnerable = 0;
	}
	invulnerable = level.vehicle_drivers_are_invulnerable && self vehicle::player_is_driver();
	return invulnerable;
}

/*
	Name: doperkfeedback
	Namespace: globallogic_player
	Checksum: 0x57AD083C
	Offset: 0x5C18
	Size: 0x12A
	Parameters: 4
	Flags: Linked
*/
function doperkfeedback(player, weapon, smeansofdeath, einflictor)
{
	perkfeedback = undefined;
	hastacticalmask = loadout::hastacticalmask(player);
	hasflakjacket = player hasperk(#"specialty_flakjacket");
	isexplosivedamage = weapons::isexplosivedamage(smeansofdeath);
	isflashorstundamage = weapons::isflashorstundamage(weapon, smeansofdeath);
	if(isflashorstundamage && hastacticalmask)
	{
		perkfeedback = "tacticalMask";
	}
	else if(isexplosivedamage && hasflakjacket && !weapon.ignoresflakjacket && !isaikillstreakdamage(weapon, einflictor))
	{
		perkfeedback = "flakjacket";
	}
	return perkfeedback;
}

/*
	Name: isaikillstreakdamage
	Namespace: globallogic_player
	Checksum: 0xC61C39C0
	Offset: 0x5D50
	Size: 0x52
	Parameters: 2
	Flags: Linked
*/
function isaikillstreakdamage(weapon, einflictor)
{
	if(weapon.isaikillstreakdamage)
	{
		if(weapon.name != "ai_tank_drone_rocket" || isdefined(einflictor.firedbyai))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: finishplayerdamagewrapper
	Namespace: globallogic_player
	Checksum: 0xC9912169
	Offset: 0x5DB0
	Size: 0x37E
	Parameters: 14
	Flags: Linked
*/
function finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal)
{
	pixbeginevent();
	if(!level.console && idflags & 8 && isplayer(eattacker))
	{
		/#
			println(((((((((("" + self getentitynumber()) + "") + self.health) + "") + eattacker.clientid) + "") + isplayer(einflictor) + "") + idamage) + "") + shitloc);
		#/
		eattacker stats::function_dad108fa(#"penetration_shots", 1);
	}
	if(!self util::function_a1d6293())
	{
		if(getdvarstring(#"scr_csmode") != "")
		{
			self shellshock(#"damage_mp", 0.2);
		}
		self damageshellshockandrumble(eattacker, einflictor, weapon, smeansofdeath, idamage);
		self ability_power::power_loss_event_took_damage(eattacker, einflictor, weapon, smeansofdeath, idamage);
	}
	if(function_6f08b381(idamage, smeansofdeath))
	{
		params = {#vsurfacenormal:vsurfacenormal, #boneindex:boneindex, #psoffsettime:psoffsettime, #vdamageorigin:vdamageorigin, #shitloc:shitloc, #vdir:vdir, #vpoint:vpoint, #hash_fd90b0bb:var_fd90b0bb, #weapon:weapon, #smeansofdeath:smeansofdeath, #idflags:idflags, #idamage:idamage, #eattacker:eattacker, #einflictor:einflictor};
		self thread function_7abbea8e(params);
	}
	else
	{
		self finishplayerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
	}
	pixendevent();
}

/*
	Name: function_6f08b381
	Namespace: globallogic_player
	Checksum: 0x5F27605A
	Offset: 0x6138
	Size: 0x1AA
	Parameters: 2
	Flags: Linked
*/
function function_6f08b381(idamage, smeansofdeath)
{
	player = self;
	if(self.health - idamage > 0)
	{
		return 0;
	}
	if(isgodmode(player))
	{
		return 0;
	}
	if(isdefined(player.allowdeath) && !player.allowdeath)
	{
		return 0;
	}
	if(!is_true(level.var_841888e0))
	{
		return 0;
	}
	if(player util::function_a1d6293())
	{
		return 0;
	}
	if(!player flag::get("death_gesture_skip_mod_check"))
	{
		if(!isinarray(level.var_1befd357, smeansofdeath))
		{
			return 0;
		}
	}
	player flag::clear("death_gesture_skip_mod_check");
	if(isdefined(player getlinkedent()) || player isinvehicle() || isdefined(player.ascender))
	{
		return 0;
	}
	if(player isonladder())
	{
		return 0;
	}
	if(player getstance() == "prone")
	{
		return 1;
	}
	return player function_39ab832f();
}

/*
	Name: function_39ab832f
	Namespace: globallogic_player
	Checksum: 0x1DF9ED7B
	Offset: 0x62F0
	Size: 0xEE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_39ab832f(debugdraw)
{
	player = self;
	player.var_d11f7daf = 0;
	var_d3eb1bf1 = [2:-90, 1:90, 0:0];
	if(math::cointoss())
	{
		var_d3eb1bf1 = [2:90, 1:-90, 0:0];
	}
	for(i = 0; i < var_d3eb1bf1.size; i++)
	{
		if(player function_bb371c3(var_d3eb1bf1[i], debugdraw))
		{
			player.var_d11f7daf = var_d3eb1bf1[i];
			return true;
		}
	}
	return false;
}

/*
	Name: function_bb371c3
	Namespace: globallogic_player
	Checksum: 0x110EE558
	Offset: 0x63E8
	Size: 0x514
	Parameters: 2
	Flags: Linked, Private
*/
function private function_bb371c3(var_b1630ef, debugdraw)
{
	player = self;
	angleoffset = (0, (isdefined(var_b1630ef) ? var_b1630ef : 0), 0);
	var_be9b9194 = anglestoaxis(player.angles + angleoffset);
	var_6ee16314 = 16;
	var_2ae934a0 = 12;
	var_c440a44e = 1;
	var_fd0c9f1c = player.origin + (var_be9b9194.up * 32);
	var_6e0e1c32 = var_fd0c9f1c + (var_be9b9194.forward * var_6ee16314);
	var_68e0f9e9 = (var_2ae934a0 * -1, var_2ae934a0 * -1, var_2ae934a0 * -1);
	var_4da0b949 = (var_2ae934a0, var_2ae934a0, var_2ae934a0);
	var_6c3bd059 = physicstrace(var_fd0c9f1c, var_6e0e1c32, var_68e0f9e9, var_4da0b949, player, 32);
	if(is_true(var_6c3bd059[#"hash_7f9ee3a239b86eea"]) || var_6c3bd059[#"fraction"] < 0.9)
	{
		var_c440a44e = 0;
	}
	if(!var_c440a44e)
	{
		/#
			if(is_true(debugdraw))
			{
				cylinder(var_fd0c9f1c, var_6e0e1c32, var_68e0f9e9[0], (1, 0, 0), 1, 400);
			}
		#/
		return 0;
	}
	var_f3002d70 = 1;
	var_c8e0e024 = (var_2ae934a0 * -1, var_2ae934a0 * -1, -0.1);
	var_288b287b = (var_2ae934a0, var_2ae934a0, 0.1);
	var_fe488304 = player.origin + (var_be9b9194.forward * var_6ee16314);
	startoffset = vectorscale((0, 0, 1), 5);
	var_770c351c = vectorscale((0, 0, -1), 8);
	var_891e5be8 = physicstrace(var_fe488304 + startoffset, var_fe488304 + var_770c351c, var_c8e0e024, var_288b287b, player, 32);
	if(is_true(var_891e5be8[#"hash_7f9ee3a239b86eea"]) || var_891e5be8[#"fraction"] > 0.9 || var_891e5be8[#"fraction"] < 0.1)
	{
		var_f3002d70 = 0;
	}
	/#
		if(is_true(debugdraw))
		{
			var_1c1cfbe7 = (var_c8e0e024[0], var_c8e0e024[1], var_770c351c[2]);
			var_d42e62c7 = (var_288b287b[0], var_288b287b[1], startoffset[2]);
			var_974e8d59 = (0, 1, 0);
			if(!var_f3002d70)
			{
				var_974e8d59 = (1, 0, 0);
			}
			box(var_fe488304, var_1c1cfbe7, var_d42e62c7, 0, var_974e8d59, 1, 1, 400);
			var_f7a96b34 = [3:var_fe488304 + (var_288b287b[0], var_288b287b[1], 0), 2:var_fe488304 + (var_c8e0e024[0], var_288b287b[1], 0), 1:var_fe488304 + (var_288b287b[0], var_c8e0e024[1], 0), 0:var_fe488304 + (var_c8e0e024[0], var_c8e0e024[1], 0)];
			foreach(corner in var_f7a96b34)
			{
				line(corner, corner + vectorscale((0, 0, 1), 99), var_974e8d59, 1, 1, 400);
			}
		}
	#/
	return var_f3002d70;
}

/*
	Name: function_7abbea8e
	Namespace: globallogic_player
	Checksum: 0x78562497
	Offset: 0x6908
	Size: 0x4DC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7abbea8e(params)
{
	player = self;
	player endon(#"disconnect");
	var_5d3a3f89 = 0;
	/#
		var_5d3a3f89 = isdefined(params.var_3ca8c1dc);
	#/
	if(!var_5d3a3f89)
	{
		/#
			assert(player.health <= params.idamage);
		#/
	}
	/#
		assert(!player util::function_a1d6293());
	#/
	audio::on_player_killed();
	healthoverlay::end_health_regen();
	player callback::callback(#"hash_2fea1d218f4c6a1f", params);
	player util::function_e05fc3fb(1);
	player clientfield::set_to_player("player_death_gesture", 1);
	player actions::function_202ab848(0);
	player thread function_8b3485();
	if(!var_5d3a3f89)
	{
		player val::set(#"hash_38a6778d2daddc56", "allowdeath", 0);
		player finishplayerdamage(params.einflictor, params.eattacker, params.idamage, params.idflags, params.smeansofdeath, params.weapon, params.var_fd90b0bb, params.vpoint, params.vdir, params.shitloc, params.vdamageorigin, params.psoffsettime, params.boneindex, params.vsurfacenormal);
	}
	player val::set(#"hash_38a6778d2daddc56", "takedamage", 0);
	player val::set(#"hash_38a6778d2daddc56", "hide", 2);
	player val::set(#"hash_38a6778d2daddc56", "freezecontrols", 1);
	player val::set(#"hash_38a6778d2daddc56", "show_crosshair", 0);
	player namespace_61e6d095::function_28027c42(#"hash_6bf3273fdaffc859");
	gesture = player function_39727d8d();
	/#
		if(isdefined(params.var_3ca8c1dc))
		{
			if(params.var_3ca8c1dc == "")
			{
				iprintlnbold(("" + gesture) + "");
			}
			else
			{
				gesture = params.var_3ca8c1dc;
				iprintlnbold("" + gesture);
			}
		}
	#/
	var_463ffce7 = player getgestureanimlength(gesture);
	player thread function_d2b1e36d(var_463ffce7);
	if(!var_5d3a3f89)
	{
		var_ba99925e = max(var_463ffce7 - 0.15, 0.1);
		level thread lui::screen_fade(var_ba99925e, 1, 0, "black", 0);
	}
	player playgestureviewmodel(gesture, undefined, 1, undefined, undefined, undefined, 1, 1);
	wait(var_463ffce7);
	player namespace_61e6d095::function_4279fd02(#"hash_6bf3273fdaffc859");
	player val::reset_all(#"hash_38a6778d2daddc56");
	if(!var_5d3a3f89)
	{
		player.allowdeath = 1;
		player kill(undefined, undefined, undefined, undefined, ((4 | 16384) | 8192) | 32768);
	}
}

/*
	Name: function_39727d8d
	Namespace: globallogic_player
	Checksum: 0x2051D12B
	Offset: 0x6DF0
	Size: 0xFA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_39727d8d()
{
	player = self;
	/#
		assert(isdefined(level.var_ee4d094a));
	#/
	currentweaponname = player getcurrentweapon().name;
	var_f0fdc6f6 = level.var_ee4d094a[currentweaponname];
	if(!isdefined(var_f0fdc6f6))
	{
		var_f0fdc6f6 = level.var_ee4d094a[#"hash_3a5790d783810d4a"];
	}
	currentstance = player getstance();
	var_c8299c32 = var_f0fdc6f6[currentstance];
	/#
		assert(isdefined(var_c8299c32));
	#/
	return array::random(var_c8299c32);
}

/*
	Name: function_d2b1e36d
	Namespace: globallogic_player
	Checksum: 0x89D7F1D1
	Offset: 0x6EF8
	Size: 0x264
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d2b1e36d(var_463ffce7)
{
	player = self;
	targetpitch = 0;
	var_944f41ea = (isdefined(player.var_d11f7daf) ? player.var_d11f7daf : 0);
	pitch = abs(angleclamp180(player getplayerangles()[0]));
	if(pitch != targetpitch || var_944f41ea != 0)
	{
		max_duration = max(var_463ffce7 - 0.15, 0.1);
		prep = util::spawn_model("tag_origin", player.origin, player.angles + (0, var_944f41ea, 0));
		duration = max(pitch / 180, abs(var_944f41ea) / 180);
		duration = min(duration, max_duration);
		player playerlinktoblend(prep, "tag_origin", duration, duration * 0.5, duration * 0.5);
		wait(duration + (float(function_60d95f53()) / 1000));
		player unlink();
		player val::reset(#"hash_38a6778d2daddc56", "freezecontrols");
		player val::set(#"hash_38a6778d2daddc56", "freezecontrols", 1);
		prep delete();
	}
}

/*
	Name: playerkilled_killstreaks
	Namespace: globallogic_player
	Checksum: 0xE5F8E193
	Offset: 0x7168
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function playerkilled_killstreaks(attacker, weapon)
{
}

/*
	Name: playerkilled_weaponstats
	Namespace: globallogic_player
	Checksum: 0xDCC941D9
	Offset: 0x7188
	Size: 0x25C
	Parameters: 6
	Flags: Linked
*/
function playerkilled_weaponstats(attacker, weapon, smeansofdeath, wasinlaststand, lastweaponbeforedroppingintolaststand, inflictor)
{
	if(isplayer(attacker) && attacker != self && (!level.teambased || (level.teambased && self.team != attacker.team)))
	{
		self stats::function_e24eec31(weapon, #"deaths", 1);
		if(wasinlaststand && isdefined(lastweaponbeforedroppingintolaststand))
		{
			victim_weapon = lastweaponbeforedroppingintolaststand;
		}
		else
		{
			victim_weapon = self.lastdroppableweapon;
		}
		if(isdefined(victim_weapon))
		{
			self stats::function_e24eec31(victim_weapon, #"deathsduringuse", 1);
		}
		if(smeansofdeath != "MOD_FALLING")
		{
			if(weapon.name == #"explosive_bolt" && isdefined(inflictor) && isdefined(inflictor.ownerweaponatlaunch) && inflictor.owneradsatlaunch)
			{
				attacker stats::function_eec52333(inflictor.ownerweaponatlaunch, #"kills", 1, attacker.class_num, 0, 1);
			}
			else
			{
				attacker stats::function_eec52333(weapon, #"kills", 1, attacker.class_num);
			}
		}
		if(smeansofdeath == "MOD_HEAD_SHOT")
		{
			attacker stats::function_e24eec31(weapon, #"headshots", 1);
		}
		if(smeansofdeath == "MOD_PROJECTILE")
		{
			attacker stats::function_e24eec31(weapon, #"direct_hit_kills", 1);
		}
	}
}

/*
	Name: playerkilled_obituary
	Namespace: globallogic_player
	Checksum: 0xB63A9FC6
	Offset: 0x73F0
	Size: 0x254
	Parameters: 4
	Flags: Linked
*/
function playerkilled_obituary(attacker, einflictor, weapon, smeansofdeath)
{
	if(!isplayer(attacker) || self util::isenemyplayer(attacker) == 0)
	{
		level notify(#"reset_obituary_count");
		level.lastobituaryplayercount = 0;
		level.lastobituaryplayer = undefined;
	}
	else
	{
		if(isdefined(level.lastobituaryplayer) && level.lastobituaryplayer == attacker)
		{
			level.lastobituaryplayercount++;
		}
		else
		{
			level notify(#"reset_obituary_count");
			level.lastobituaryplayer = attacker;
			level.lastobituaryplayercount = 1;
		}
		if(level.lastobituaryplayercount >= 4)
		{
			level notify(#"reset_obituary_count");
			level.lastobituaryplayercount = 0;
			level.lastobituaryplayer = undefined;
		}
	}
	if(level.teambased && isdefined(attacker.pers) && self.team == attacker.team && smeansofdeath == "MOD_GRENADE" && level.friendlyfire == 0)
	{
		if(isplayer(attacker) && level.gametype === "pvp")
		{
			obituary(self, self, weapon, smeansofdeath);
		}
		demo::function_ae3420ca(self, self, einflictor);
	}
	else
	{
		if(isplayer(attacker) && level.gametype === "pvp")
		{
			obituary(self, attacker, weapon, smeansofdeath);
		}
		demo::function_ae3420ca(self, attacker, einflictor);
	}
}

/*
	Name: playerkilled_suicide
	Namespace: globallogic_player
	Checksum: 0x1C182A23
	Offset: 0x7650
	Size: 0x110
	Parameters: 5
	Flags: Linked
*/
function playerkilled_suicide(einflictor, attacker, smeansofdeath, weapon, shitloc)
{
	awardassists = 0;
	if(weapon == "MOD_SUICIDE" && shitloc == "none" && self.throwinggrenade)
	{
		self.lastgrenadesuicidetime = gettime();
	}
	if(level.maxsuicidesbeforekick > 0 && level.maxsuicidesbeforekick <= self.suicides)
	{
		self notify(#"teamkillkicked");
		self suicidekick();
	}
	awardassists = 1;
	self.suicide = 1;
	if(isdefined(self.friendlydamage))
	{
		self iprintln(#"hash_7d1a0e5bd191fce");
	}
	return awardassists;
}

/*
	Name: wait_and_suicide
	Namespace: globallogic_player
	Checksum: 0x8A134013
	Offset: 0x7768
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function wait_and_suicide()
{
	self endon(#"disconnect");
	self val::set(#"suicide", "freezecontrols", 1);
	wait(0.25);
	self suicide();
}

/*
	Name: playerkilled_kill
	Namespace: globallogic_player
	Checksum: 0x10A4AA7F
	Offset: 0x77D8
	Size: 0x44C
	Parameters: 5
	Flags: Linked
*/
function playerkilled_kill(einflictor, attacker, smeansofdeath, weapon, shitloc)
{
	if(isalive(smeansofdeath))
	{
		pixbeginevent();
		if(!isdefined(attacker) || !isdefined(attacker.requireddeathcount) || smeansofdeath.deathcount == attacker.requireddeathcount)
		{
			smeansofdeath.pers[#"cur_total_kill_streak"]++;
			smeansofdeath setplayercurrentstreak(smeansofdeath.pers[#"cur_total_kill_streak"]);
			if(isdefined(level.killstreaks))
			{
				smeansofdeath.pers[#"cur_kill_streak"]++;
				if(smeansofdeath.pers[#"cur_kill_streak"] >= 2)
				{
					if((smeansofdeath.pers[#"cur_kill_streak"] % 5) == 0)
					{
						smeansofdeath activecamo::function_896ac347(shitloc, "killstreak_5", 1);
					}
					if(smeansofdeath.pers[#"cur_kill_streak"] == 10)
					{
						smeansofdeath challenges::killstreakten();
					}
				}
			}
		}
		pixendevent();
	}
	if(smeansofdeath.pers[#"cur_kill_streak"] > smeansofdeath.kill_streak)
	{
		if(level.rankedmatch && !level.disablestattracking)
		{
			smeansofdeath stats::set_stat(#"higheststats", #"kill_streak", smeansofdeath.pers[#"totalkillstreakcount"]);
		}
		smeansofdeath.kill_streak = smeansofdeath.pers[#"cur_kill_streak"];
	}
	if(smeansofdeath.pers[#"cur_kill_streak"] > smeansofdeath.gametype_kill_streak)
	{
		smeansofdeath stats::function_baa25a23(#"kill_streak", smeansofdeath.pers[#"cur_kill_streak"]);
		smeansofdeath.gametype_kill_streak = smeansofdeath.pers[#"cur_kill_streak"];
	}
	if(weapon == "MOD_HEAD_SHOT")
	{
	}
	else if(weapon == "MOD_MELEE" || weapon == "MOD_MELEE_ASSASSINATE")
	{
		if(shitloc.isriotshield)
		{
			if(isdefined(smeansofdeath.class_num))
			{
				primaryweaponnum = smeansofdeath getloadoutitem(smeansofdeath.class_num, "primary");
				secondaryweaponnum = smeansofdeath getloadoutitem(smeansofdeath.class_num, "secondary");
				if(primaryweaponnum && level.tbl_weaponids[primaryweaponnum][#"reference"] == "riotshield" && !secondaryweaponnum || (secondaryweaponnum && level.tbl_weaponids[secondaryweaponnum][#"reference"] == "riotshield" && !primaryweaponnum))
				{
					smeansofdeath stats::function_e24eec31(shitloc, #"nolethalkills", 1);
				}
			}
		}
	}
	attackername = smeansofdeath.name;
	self thread medals::setlastkilledby(smeansofdeath, attacker);
}

/*
	Name: callback_playerkilled
	Namespace: globallogic_player
	Checksum: 0x1DD82C11
	Offset: 0x7C30
	Size: 0x1C7E
	Parameters: 10
	Flags: Linked
*/
function callback_playerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration)
{
	profilelog_begintiming(7, "ship");
	self endon(#"spawned");
	self notify(#"killed_player");
	params = spawnstruct();
	params.einflictor = einflictor;
	params.eattacker = attacker;
	params.idamage = idamage;
	params.smeansofdeath = smeansofdeath;
	params.weapon = weapon;
	params.var_fd90b0bb = var_fd90b0bb;
	params.vdir = vdir;
	params.shitloc = shitloc;
	params.psoffsettime = psoffsettime;
	params.deathanimduration = deathanimduration;
	self callback::callback(#"on_player_killed", params);
	if(!self util::function_a1d6293())
	{
		self callback::callback(#"hash_2fea1d218f4c6a1f", params);
	}
	self flag::clear(#"loadout_given");
	if(self.sessionteam == "spectator")
	{
		return;
	}
	if(game.state == "postgame")
	{
		return;
	}
	self needsrevive(0);
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger delete();
	}
	self.revivetrigger = undefined;
	if(isdefined(self.burning) && self.burning == 1)
	{
		self setburn(0);
	}
	self.canbemeleed = 1;
	self.suicide = 0;
	self.teamkilled = 0;
	self.meleeattackers = undefined;
	if(isdefined(level.takelivesondeath) && level.takelivesondeath == 1)
	{
		if(self.pers[#"lives"])
		{
			self.pers[#"lives"]--;
			if(self.pers[#"lives"] == 0)
			{
				level notify(#"player_eliminated");
				self notify(#"player_eliminated");
			}
		}
	}
	weapon = updateweapon(einflictor, weapon);
	pixbeginevent();
	wasinlaststand = 0;
	deathtimeoffset = 0;
	lastweaponbeforedroppingintolaststand = undefined;
	attackerstance = undefined;
	self.laststandthislife = undefined;
	self.vattackerorigin = undefined;
	if(isdefined(self.uselaststandparams))
	{
		self.uselaststandparams = undefined;
		/#
			assert(isdefined(self.laststandparams));
		#/
		if(!level.teambased || (isdefined(self.laststandparams) && (!isdefined(attacker) || !isplayer(attacker) || attacker.team != self.team || attacker == self)))
		{
			einflictor = self.laststandparams.einflictor;
			attacker = self.laststandparams.attacker;
			attackerstance = self.laststandparams.attackerstance;
			idamage = self.laststandparams.idamage;
			smeansofdeath = self.laststandparams.smeansofdeath;
			weapon = self.laststandparams.weapon;
			var_fd90b0bb = self.laststandparams.var_fd90b0bb;
			vdir = self.laststandparams.vdir;
			shitloc = self.laststandparams.shitloc;
			self.vattackerorigin = self.laststandparams.vattackerorigin;
			deathtimeoffset = (gettime() - self.laststandparams.laststandstarttime) / 1000;
			self.bleedout_time = math::clamp(self.var_84c0402e - deathtimeoffset, 0, self.var_84c0402e);
			if(isdefined(self.previousprimary))
			{
				wasinlaststand = 1;
				lastweaponbeforedroppingintolaststand = self.previousprimary;
			}
			params.einflictor = einflictor;
			params.eattacker = attacker;
			params.idamage = idamage;
			params.smeansofdeath = smeansofdeath;
			params.weapon = weapon;
			params.var_fd90b0bb = var_fd90b0bb;
			params.vdir = vdir;
			params.shitloc = shitloc;
			self callback::callback(#"on_player_killed", params);
		}
		self.laststandparams = undefined;
	}
	bestplayer = undefined;
	bestplayermeansofdeath = undefined;
	obituarymeansofdeath = undefined;
	bestplayerweapon = undefined;
	obituaryweapon = weapon;
	assistedsuicide = 0;
	if(!isdefined(attacker) || attacker.classname == "trigger_hurt" || attacker.classname == "worldspawn" || (isdefined(attacker.ismagicbullet) && attacker.ismagicbullet == 1) || attacker == self && isdefined(self.attackers))
	{
		if(!isdefined(bestplayer))
		{
			for(i = 0; i < self.attackers.size; i++)
			{
				player = self.attackers[i];
				if(!isdefined(player))
				{
					continue;
				}
				if(!isdefined(self.attackerdamage[player.clientid]) || !isdefined(self.attackerdamage[player.clientid].damage))
				{
					continue;
				}
				if(player == self || (level.teambased && player.team == self.team))
				{
					continue;
				}
				if(self.attackerdamage[player.clientid].lasttimedamaged + 2500 < gettime())
				{
					continue;
				}
				if(!allowedassistweapon(self.attackerdamage[player.clientid].weapon))
				{
					continue;
				}
				if(self.attackerdamage[player.clientid].damage > 1 && !isdefined(bestplayer))
				{
					bestplayer = player;
					bestplayermeansofdeath = self.attackerdamage[player.clientid].meansofdeath;
					bestplayerweapon = self.attackerdamage[player.clientid].weapon;
					continue;
				}
				if(isdefined(bestplayer) && self.attackerdamage[player.clientid].damage > self.attackerdamage[bestplayer.clientid].damage)
				{
					bestplayer = player;
					bestplayermeansofdeath = self.attackerdamage[player.clientid].meansofdeath;
					bestplayerweapon = self.attackerdamage[player.clientid].weapon;
				}
			}
		}
		if(isdefined(bestplayer))
		{
			assistedsuicide = 1;
		}
	}
	if(isdefined(bestplayer))
	{
		attacker = bestplayer;
		obituarymeansofdeath = bestplayermeansofdeath;
		obituaryweapon = bestplayerweapon;
		if(isdefined(bestplayerweapon))
		{
			weapon = bestplayerweapon;
		}
	}
	if(isplayer(attacker))
	{
		attacker.damagedplayers[self.clientid] = undefined;
	}
	self.deathtime = gettime();
	self.pers[#"deathtime"] = self.deathtime;
	attacker = updateattacker(attacker, weapon);
	einflictor = updateinflictor(einflictor);
	smeansofdeath = self playerkilled_updatemeansofdeath(attacker, einflictor, weapon, smeansofdeath, shitloc);
	if(!isdefined(obituarymeansofdeath))
	{
		obituarymeansofdeath = smeansofdeath;
	}
	if(isdefined(self.hasriotshieldequipped) && self.hasriotshieldequipped == 1)
	{
		self.hasriotshield = 0;
		self.hasriotshieldequipped = 0;
	}
	self thread updateglobalbotkilledcounter();
	self playerkilled_weaponstats(attacker, weapon, smeansofdeath, wasinlaststand, lastweaponbeforedroppingintolaststand, einflictor);
	self playerkilled_obituary(attacker, einflictor, obituaryweapon, obituarymeansofdeath);
	self.sessionstate = "dead";
	self.statusicon = "hud_status_dead";
	self.pers[#"weapon"] = undefined;
	self.killedplayerscurrent = [];
	if(!isdefined(self.deathcount))
	{
		self.deathcount = 0;
	}
	self.deathcount++;
	/#
		println((("" + self.clientid) + "") + self.deathcount);
	#/
	self playerkilled_killstreaks(attacker, weapon);
	lpselfnum = self getentitynumber();
	lpselfname = self.name;
	lpattackguid = "";
	lpattackname = "";
	lpselfteam = self.team;
	lpselfguid = self getguid();
	lpattackteam = "";
	lpattacknum = -1;
	var_c8fa9c41 = 0;
	wasteamkill = 0;
	wassuicide = 0;
	pixendevent();
	if(isplayer(attacker))
	{
		lpattackguid = attacker getguid();
		lpattackname = attacker.name;
		lpattackteam = attacker.team;
		if(attacker == self || assistedsuicide == 1)
		{
			dokillcam = 0;
			wassuicide = 1;
			self playerkilled_suicide(einflictor, attacker, smeansofdeath, weapon, shitloc);
		}
		else
		{
			pixbeginevent();
			lpattacknum = attacker getentitynumber();
			var_c8fa9c41 = attacker getxuid();
			dokillcam = 1;
			if(level.teambased && self.team == attacker.team && smeansofdeath == "MOD_GRENADE" && level.friendlyfire == 0)
			{
			}
			else
			{
				self playerkilled_kill(einflictor, attacker, smeansofdeath, weapon, shitloc);
			}
			pixendevent();
		}
	}
	else
	{
		if(isdefined(attacker) && (attacker.classname == "trigger_hurt" || attacker.classname == "worldspawn"))
		{
			dokillcam = 0;
			lpattacknum = -1;
			var_c8fa9c41 = 0;
			lpattackguid = "";
			lpattackname = "";
			lpattackteam = "world";
			self.suicides = 0;
			self.suicide = 1;
			if(level.maxsuicidesbeforekick > 0 && level.maxsuicidesbeforekick <= self.suicides)
			{
				self notify(#"teamkillkicked");
				self suicidekick();
			}
		}
		else
		{
			dokillcam = 0;
			lpattacknum = -1;
			var_c8fa9c41 = 0;
			lpattackguid = "";
			lpattackname = "";
			lpattackteam = "world";
			wassuicide = 1;
			if(isdefined(einflictor) && isdefined(einflictor.killcament))
			{
				lpattacknum = self getentitynumber();
				var_c8fa9c41 = self getxuid();
				wassuicide = 0;
			}
			if(isdefined(attacker) && isdefined(attacker.team) && isdefined(level.teams[attacker.team]))
			{
				if(attacker.team != self.team)
				{
					wassuicide = 0;
				}
			}
			if(isai(attacker))
			{
				dokillcam = 1;
				lpattacknum = self getentitynumber();
				var_c8fa9c41 = 0;
			}
		}
	}
	if(!level.ingraceperiod)
	{
		if(smeansofdeath != "MOD_GRENADE" && smeansofdeath != "MOD_GRENADE_SPLASH" && smeansofdeath != "MOD_EXPLOSIVE" && smeansofdeath != "MOD_EXPLOSIVE_SPLASH" && smeansofdeath != "MOD_PROJECTILE_SPLASH")
		{
			self weapons::drop_scavenger_for_death(attacker);
		}
		if(!wasteamkill && !wassuicide)
		{
			self weapons::drop_for_death(attacker, weapon, smeansofdeath);
		}
	}
	if(!wasteamkill && !wassuicide)
	{
		self weapons::drop_for_death(attacker, weapon, smeansofdeath);
	}
	pixbeginevent();
	self.lastattacker = attacker;
	self.lastdeathpos = self.origin;
	if(isdefined(attacker) && isplayer(attacker) && attacker != self && (!level.teambased || attacker.team != self.team))
	{
		self thread challenges::playerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, shitloc, attackerstance);
	}
	else
	{
		self notify(#"playerkilledchallengesprocessed");
	}
	if(isdefined(self.attackers))
	{
		self.attackers = [];
	}
	bb::logdamage(attacker, self, weapon, idamage, smeansofdeath, shitloc, 1, !wasinlaststand);
	bb::logplayermapnotification("death", self);
	attackerstring = "none";
	if(isplayer(attacker))
	{
		attackerstring = ((attacker getxuid() + "(") + lpattackname) + ")";
	}
	/#
		println((((((((((((("" + smeansofdeath) + "") + weapon.name) + "") + attackerstring) + "") + idamage) + "") + shitloc) + "") + int(self.origin[0]) + "") + int(self.origin[1]) + "") + int(self.origin[2]));
	#/
	globallogic::updateteamstatus();
	self weapons::detach_carry_object_model();
	died_in_vehicle = 0;
	if(is_true(self.var_78ca5055))
	{
		died_in_vehicle = 1;
	}
	if(isdefined(self.diedonvehicle))
	{
		died_in_vehicle = self.diedonvehicle;
	}
	hit_by_train = 0;
	if(isdefined(attacker) && isdefined(attacker.targetname) && attacker.targetname == "train")
	{
		hit_by_train = 1;
	}
	pixendevent();
	var_2a8c097d = function_58385b58(self.team);
	pixbeginevent();
	if(!died_in_vehicle && !hit_by_train && (!is_true(level.var_6cc58e4b) || level.players.size > 1))
	{
		vattackerorigin = undefined;
		if(isdefined(attacker))
		{
			vattackerorigin = attacker.origin;
		}
		ragdoll_now = 0;
		if(isdefined(self.usingvehicle) && self.usingvehicle && isdefined(self.vehicleposition) && self.vehicleposition == 1)
		{
			ragdoll_now = 1;
		}
		deathfromabove = 0;
		if(!attacker isonground() && smeansofdeath == "MOD_MELEE_ASSASSINATE")
		{
			deathfromabove = 1;
		}
		body = self cloneplayer(deathanimduration, weapon, attacker, vdir);
		if(isdefined(body))
		{
			self createdeadbody(idamage, smeansofdeath, weapon, shitloc, vdir, vattackerorigin, deathanimduration, einflictor, ragdoll_now, body, deathfromabove);
			self.var_f8271fa3 = body;
			if(var_2a8c097d.size == 0)
			{
				self battlechatter::play_death_vox(body, attacker, weapon, smeansofdeath);
			}
		}
	}
	pixendevent();
	thread globallogic_spawn::spawnqueuedclient(self.team, attacker);
	self.switching_teams = undefined;
	self.joining_team = undefined;
	self.leaving_team = undefined;
	self thread [[level.onplayerkilled]](einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
	for(icb = 0; icb < level.onplayerkilledextraunthreadedcbs.size; icb++)
	{
		self [[level.onplayerkilledextraunthreadedcbs[icb]]](einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
	}
	self.wantsafespawn = 0;
	perks = [];
	killstreaks = globallogic::getkillstreaks(attacker);
	if(!isdefined(self.killstreak_waitamount))
	{
		self thread [[level.spawnplayerprediction]]();
	}
	profilelog_endtiming(7, (("gs=" + game.state) + " zom=") + sessionmodeiszombiesgame());
	if(!is_true(level.var_6cc58e4b) || level.players.size > 1)
	{
		defaultplayerdeathwatchtime = 4;
		if(getdvarint(#"hash_62b8db0428755a32", 1))
		{
			defaultplayerdeathwatchtime = getdvarfloat(#"defaultplayerdeathwatchtime", 2.5);
		}
		if(smeansofdeath == "MOD_MELEE_ASSASSINATE" || 0 > weapon.deathcamtime)
		{
			defaultplayerdeathwatchtime = (deathanimduration * 0.001) + 0.5;
		}
		else if(0 < weapon.deathcamtime)
		{
			defaultplayerdeathwatchtime = weapon.deathcamtime;
		}
		if(isdefined(level.overrideplayerdeathwatchtimer))
		{
			defaultplayerdeathwatchtime = [[level.overrideplayerdeathwatchtimer]](defaultplayerdeathwatchtime);
		}
		if(is_true(died_in_vehicle))
		{
			defaultplayerdeathwatchtime = 2;
			player_pos = self getplayercamerapos();
			player_ang = self getplayerangles();
			if(isdefined(self.var_80730518))
			{
				camera_pos = self.var_80730518 gettagorigin("tag_driver_camera");
				if(isdefined(camera_pos))
				{
					player_pos = camera_pos;
				}
				player_ang = self.var_80730518.angles;
			}
			self camerasetposition(player_pos, player_ang);
			self cameraactivate(1);
			self healthoverlay::function_8335b12();
			self thread lui::screen_fade_out(defaultplayerdeathwatchtime, "black");
			if(isdefined(self.var_80730518))
			{
				if(is_true(self.var_80730518.var_4dba1441))
				{
					wait(0.3);
					if(!isbot(self))
					{
						self.var_80730518 setinvisibletoall();
						self.var_80730518 setvisibletoplayer(self);
					}
				}
			}
		}
		wait(defaultplayerdeathwatchtime);
		if(is_true(died_in_vehicle))
		{
			self cameraactivate(0);
		}
	}
	else
	{
		if(isdefined(body))
		{
			codesetclientfield(body, "hide_body", 1);
		}
		self stats::function_dad108fa(#"incaps", 1);
		var_787cae74 = self stats::get_stat(#"playerstatslist", #"incaps", #"statvalue");
		self setnoncheckpointdata("INCAPS", var_787cae74);
		if(self util::function_a1d6293())
		{
			self namespace_5443b356::function_c6491fb8();
		}
		else if(!is_true(level.var_f5ebfda9))
		{
			namespace_5443b356::function_906e8496(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
		}
		self waittilltimeout(5, #"hash_eb0317ca3976bf9");
	}
	self notify(#"death_delay_finished");
	forcekillcam = 0;
	/#
		if(getdvarint(#"scr_forcekillcam", 0) != 0)
		{
			dokillcam = 1;
			forcekillcam = 1;
			if(lpattacknum < 0)
			{
				lpattacknum = self getentitynumber();
				var_c8fa9c41 = 0;
			}
		}
	#/
	self.respawntimerstarttime = gettime();
	if(is_true(self.var_e36aebf2))
	{
		self waittilltimeout(5, #"hash_4bd20f5c626eb3f0");
		self.var_e36aebf2 = undefined;
		return;
	}
	if(game.state != "playing")
	{
		self.sessionstate = "dead";
		self.spectatorclient = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		return;
	}
	waittillkillstreakdone();
	userespawntime = 1;
	if(isdefined(level.hostmigrationtimer))
	{
		userespawntime = 0;
	}
	if(isdefined(level.var_5be43b2d))
	{
		return;
	}
	if(globallogic_utils::isvalidclass(self.curclass))
	{
		timepassed = undefined;
		if(isdefined(self.respawntimerstarttime) && userespawntime)
		{
			timepassed = (gettime() - self.respawntimerstarttime) / 1000;
		}
		self thread [[level.spawnclient]](timepassed);
		self.respawntimerstarttime = undefined;
	}
}

/*
	Name: updateglobalbotkilledcounter
	Namespace: globallogic_player
	Checksum: 0xCE27266A
	Offset: 0x98B8
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function updateglobalbotkilledcounter()
{
	if(isbot(self))
	{
		level.globallarryskilled++;
	}
}

/*
	Name: waittillkillstreakdone
	Namespace: globallogic_player
	Checksum: 0xF97AAE22
	Offset: 0x98E8
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function waittillkillstreakdone()
{
	if(isdefined(self.killstreak_waitamount))
	{
		starttime = gettime();
		waittime = self.killstreak_waitamount * 1000;
		while(gettime() < (starttime + waittime) && isdefined(self.killstreak_waitamount))
		{
			wait(0.1);
		}
		var_5172a3b5 = 1;
		self.killstreak_waitamount = undefined;
	}
	else if(isdefined(self.killstreak_delay_killcam))
	{
		while(isdefined(self.killstreak_delay_killcam))
		{
			wait(0.1);
		}
		var_5172a3b5 = 1;
	}
	if(is_true(var_5172a3b5))
	{
		wait(2);
	}
}

/*
	Name: suicidekick
	Namespace: globallogic_player
	Checksum: 0x51EFDC3
	Offset: 0x99C0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function suicidekick()
{
	self endon(#"disconnect");
	waittillframeend();
	globallogic::gamehistoryplayerkicked();
	ban(self getentitynumber());
}

/*
	Name: teamkillkick
	Namespace: globallogic_player
	Checksum: 0xCF4BF5DD
	Offset: 0x9A20
	Size: 0x1D4
	Parameters: 0
	Flags: None
*/
function teamkillkick()
{
	self endon(#"disconnect");
	waittillframeend();
	playlistbanquantum = tweakables::gettweakablevalue("team", "teamkillerplaylistbanquantum");
	playlistbanpenalty = tweakables::gettweakablevalue("team", "teamkillerplaylistbanpenalty");
	if(playlistbanquantum > 0 && playlistbanpenalty > 0)
	{
		timeplayedtotal = self stats::get_stat(#"playerstatslist", #"time_played_total", #"statvalue");
		minutesplayed = timeplayedtotal / 60;
		freebees = 2;
		banallowance = (int(floor(minutesplayed / playlistbanquantum))) + freebees;
		if(self.sessionbans > banallowance)
		{
			self stats::set_stat(#"playerstatslist", #"gametypeban", #"statvalue", timeplayedtotal + (playlistbanpenalty * 60));
		}
	}
	globallogic::gamehistoryplayerkicked();
	ban(self getentitynumber());
}

/*
	Name: teamkilldelay
	Namespace: globallogic_player
	Checksum: 0xE8A4A2A
	Offset: 0x9C00
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function teamkilldelay()
{
	teamkills = self.pers[#"teamkills_nostats"];
	if(level.minimumallowedteamkills < 0 || teamkills <= level.minimumallowedteamkills)
	{
		return 0;
	}
	exceeded = teamkills - level.minimumallowedteamkills;
	return level.teamkillspawndelay * exceeded;
}

/*
	Name: shouldteamkillkick
	Namespace: globallogic_player
	Checksum: 0xA4A777E1
	Offset: 0x9C88
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function shouldteamkillkick(teamkilldelay)
{
	if(teamkilldelay && level.minimumallowedteamkills >= 0)
	{
		if(globallogic_utils::gettimepassed() >= 5000)
		{
			return true;
		}
		if(self.pers[#"teamkills_nostats"] > 1)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: reduceteamkillsovertime
	Namespace: globallogic_player
	Checksum: 0x777FE9BE
	Offset: 0x9D08
	Size: 0xDA
	Parameters: 0
	Flags: None
*/
function reduceteamkillsovertime()
{
	timeperoneteamkillreduction = 20;
	reductionpersecond = 1 / timeperoneteamkillreduction;
	while(true)
	{
		if(isalive(self))
		{
			self.pers[#"teamkills_nostats"] = self.pers[#"teamkills_nostats"] - reductionpersecond;
			if(self.pers[#"teamkills_nostats"] < level.minimumallowedteamkills)
			{
				self.pers[#"teamkills_nostats"] = level.minimumallowedteamkills;
				break;
			}
		}
		wait(1);
	}
}

/*
	Name: callback_playerlaststand
	Namespace: globallogic_player
	Checksum: 0x42B2DF69
	Offset: 0x9DF0
	Size: 0x54
	Parameters: 10
	Flags: None
*/
function callback_playerlaststand(einflictor, eattacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, delayoverride)
{
}

/*
	Name: damageshellshockandrumble
	Namespace: globallogic_player
	Checksum: 0x917C84F3
	Offset: 0x9E50
	Size: 0x6C
	Parameters: 5
	Flags: Linked
*/
function damageshellshockandrumble(eattacker, einflictor, weapon, smeansofdeath, idamage)
{
	self thread weapons::on_damage(eattacker, einflictor, weapon, smeansofdeath, idamage);
	self playrumbleonentity("damage_heavy");
}

/*
	Name: createdeadbody
	Namespace: globallogic_player
	Checksum: 0x4971B3D4
	Offset: 0x9EC8
	Size: 0x2D4
	Parameters: 11
	Flags: Linked
*/
function createdeadbody(idamage, smeansofdeath, weapon, shitloc, vdir, vattackerorigin, deathanimduration, einflictor, ragdoll_jib, body, deathfromabove)
{
	if(smeansofdeath == "MOD_HIT_BY_OBJECT" && self getstance() == "prone")
	{
		self.body = body;
		return;
	}
	if(isdefined(level.ragdoll_override) && self [[level.ragdoll_override]](idamage, smeansofdeath, weapon, shitloc, vdir, vattackerorigin, deathanimduration, einflictor, ragdoll_jib, body))
	{
		return;
	}
	if(ragdoll_jib || self isonladder() || self ismantling() || smeansofdeath == "MOD_CRUSH" || smeansofdeath == "MOD_HIT_BY_OBJECT")
	{
		body startragdoll();
	}
	if(!self isonground())
	{
		if(getdvarint(#"scr_disable_air_death_ragdoll", 0) == 0)
		{
			body startragdoll();
		}
	}
	if(smeansofdeath == "MOD_MELEE_ASSASSINATE" && isdefined(deathfromabove) && deathfromabove)
	{
		body start_death_from_above_ragdoll(vdir);
	}
	if(self is_explosive_ragdoll(weapon, einflictor))
	{
		body start_explosive_ragdoll(vdir, weapon);
	}
	thread delaystartragdoll(body, shitloc, vdir, weapon, einflictor, smeansofdeath);
	if(smeansofdeath == "MOD_CRUSH")
	{
		body globallogic_vehicle::vehiclecrush();
	}
	self.body = body;
	params = spawnstruct();
	params.smeansofdeath = smeansofdeath;
	params.weapon = weapon;
	self.body callback::callback(#"on_player_corpse", params);
}

/*
	Name: is_explosive_ragdoll
	Namespace: globallogic_player
	Checksum: 0xA9A2397B
	Offset: 0xA1A8
	Size: 0xB2
	Parameters: 2
	Flags: Linked
*/
function is_explosive_ragdoll(weapon, inflictor)
{
	if(!isdefined(weapon))
	{
		return false;
	}
	if(weapon.name == #"destructible_car" || weapon.name == #"explodable_barrel")
	{
		return true;
	}
	if(weapon.projexplosiontype == "grenade")
	{
		if(isdefined(inflictor) && isdefined(inflictor.stucktoplayer))
		{
			if(inflictor.stucktoplayer == self)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: start_explosive_ragdoll
	Namespace: globallogic_player
	Checksum: 0xFEB68E5A
	Offset: 0xA268
	Size: 0x1A4
	Parameters: 2
	Flags: Linked
*/
function start_explosive_ragdoll(dir, weapon)
{
	if(!isdefined(self))
	{
		return;
	}
	x = randomintrange(50, 100);
	y = randomintrange(50, 100);
	z = randomintrange(10, 20);
	if(isdefined(weapon) && (weapon.name == #"sticky_grenade" || weapon.name == #"explosive_bolt"))
	{
		if(isdefined(dir) && lengthsquared(dir) > 0)
		{
			x = dir[0] * x;
			y = dir[1] * y;
		}
	}
	else
	{
		if(math::cointoss())
		{
			x = x * -1;
		}
		if(math::cointoss())
		{
			y = y * -1;
		}
	}
	self startragdoll();
	self launchragdoll((x, y, z));
}

/*
	Name: start_death_from_above_ragdoll
	Namespace: globallogic_player
	Checksum: 0xE05D4937
	Offset: 0xA418
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function start_death_from_above_ragdoll(dir)
{
	if(!isdefined(self))
	{
		return;
	}
	self startragdoll();
	self launchragdoll(vectorscale((0, 0, -1), 100));
}

/*
	Name: notifyconnecting
	Namespace: globallogic_player
	Checksum: 0x898F2B25
	Offset: 0xA470
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function notifyconnecting()
{
	waittillframeend();
	if(isdefined(self))
	{
		level notify(#"connecting", {#player:self});
		callback::callback(#"on_player_connecting");
	}
}

/*
	Name: delaystartragdoll
	Namespace: globallogic_player
	Checksum: 0x9A65BDD3
	Offset: 0xA4D8
	Size: 0x31C
	Parameters: 6
	Flags: Linked
*/
function delaystartragdoll(ent, shitloc, vdir, weapon, einflictor, smeansofdeath)
{
	if(isdefined(vdir))
	{
		deathanim = vdir getcorpseanim();
		if(isdefined(deathanim) && animhasnotetrack(deathanim, "ignore_ragdoll"))
		{
			return;
		}
	}
	if(level.oldschool)
	{
		if(!isdefined(einflictor))
		{
			einflictor = (0, 0, 0);
		}
		explosionpos = vdir.origin + (0, 0, globallogic_utils::gethitlocheight(weapon));
		explosionpos = explosionpos - (einflictor * 20);
		explosionradius = 40;
		explosionforce = 0.75;
		if(smeansofdeath == "MOD_IMPACT" || smeansofdeath == "MOD_EXPLOSIVE" || issubstr(smeansofdeath, "MOD_GRENADE") || issubstr(smeansofdeath, "MOD_PROJECTILE") || weapon == "head" || weapon == "helmet")
		{
			explosionforce = 2.5;
		}
		vdir startragdoll(1);
		waitframe(1);
		if(!isdefined(vdir))
		{
			return;
		}
		physicsexplosionsphere(explosionpos, explosionradius, explosionradius / 2, explosionforce);
		return;
	}
	wait(0.2);
	if(!isdefined(vdir))
	{
		return;
	}
	if(vdir isragdoll())
	{
		return;
	}
	deathanim = vdir getcorpseanim();
	if(isdefined(deathanim) && animhasnotetrack(deathanim, "ignore_ragdoll"))
	{
		return;
	}
	startfrac = 0.35;
	if(animhasnotetrack(deathanim, "start_ragdoll"))
	{
		times = getnotetracktimes(deathanim, "start_ragdoll");
		if(isdefined(times))
		{
			startfrac = times[0];
		}
	}
	waittime = startfrac * getanimlength(deathanim);
	wait(waittime);
	if(isdefined(vdir))
	{
		vdir startragdoll(1);
	}
}

/*
	Name: playerkilled_updatemeansofdeath
	Namespace: globallogic_player
	Checksum: 0x845E0F03
	Offset: 0xA800
	Size: 0xE6
	Parameters: 5
	Flags: Linked
*/
function playerkilled_updatemeansofdeath(attacker, einflictor, weapon, smeansofdeath, shitloc)
{
	if(weapons::isheadshot(weapon, shitloc, smeansofdeath) && isplayer(einflictor))
	{
		return "MOD_HEAD_SHOT";
	}
	switch(weapon.name)
	{
		case "dog_bite":
		{
			smeansofdeath = "MOD_PISTOL_BULLET";
			break;
		}
		case "destructible_car":
		{
			smeansofdeath = "MOD_EXPLOSIVE";
			break;
		}
		case "explodable_barrel":
		{
			smeansofdeath = "MOD_EXPLOSIVE";
			break;
		}
	}
	return smeansofdeath;
}

/*
	Name: updateattacker
	Namespace: globallogic_player
	Checksum: 0x6962B918
	Offset: 0xA8F0
	Size: 0x204
	Parameters: 2
	Flags: Linked
*/
function updateattacker(attacker, weapon)
{
	if(isai(attacker) && isdefined(attacker.script_owner))
	{
		if(!level.teambased || attacker.script_owner.team != self.team)
		{
			attacker = attacker.script_owner;
		}
	}
	if(attacker.classname == "script_vehicle" && isdefined(attacker.owner))
	{
		attacker notify(#"killed", {#victim:self});
		attacker = attacker.owner;
	}
	if(isai(attacker))
	{
		attacker notify(#"killed", {#victim:self});
	}
	if(isdefined(self.capturinglastflag) && self.capturinglastflag == 1)
	{
		attacker.lastcapkiller = 1;
	}
	if(isdefined(attacker) && isdefined(weapon) && weapon.statname == #"planemortar")
	{
		if(!isdefined(attacker.planemortarbda))
		{
			attacker.planemortarbda = 0;
		}
		attacker.planemortarbda++;
	}
	if(isdefined(attacker) && isdefined(weapon) && (weapon.name == #"straferun_rockets" || weapon.name == #"straferun_gun"))
	{
		if(isdefined(attacker.straferunbda))
		{
			attacker.straferunbda++;
		}
	}
	return attacker;
}

/*
	Name: updateinflictor
	Namespace: globallogic_player
	Checksum: 0x642557DB
	Offset: 0xAB00
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function updateinflictor(einflictor)
{
	if(isdefined(einflictor) && einflictor.classname == "script_vehicle")
	{
		einflictor notify(#"killed", {#victim:self});
		if(isdefined(einflictor.bda))
		{
			einflictor.bda++;
		}
	}
	return einflictor;
}

/*
	Name: updateweapon
	Namespace: globallogic_player
	Checksum: 0x63C30E34
	Offset: 0xAB80
	Size: 0xE2
	Parameters: 2
	Flags: Linked
*/
function updateweapon(einflictor, weapon)
{
	if(weapon == level.weaponnone && isdefined(einflictor))
	{
		if(isdefined(einflictor.targetname) && einflictor.targetname == "explodable_barrel")
		{
			weapon = getweapon(#"explodable_barrel");
		}
		else if(isdefined(einflictor.destructible_type) && issubstr(einflictor.destructible_type, "vehicle_"))
		{
			weapon = getweapon(#"destructible_car");
		}
	}
	return weapon;
}

/*
	Name: function_4d3e38fb
	Namespace: globallogic_player
	Checksum: 0x32B57682
	Offset: 0xAC70
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function function_4d3e38fb()
{
	if(self == level)
	{
		foreach(player in level.players)
		{
			player function_4d3e38fb();
		}
	}
	else if(isplayer(self))
	{
		a_w_weapons = self getweaponslist();
		foreach(weapon in a_w_weapons)
		{
			if(is_true(weapon.isheavyweapon))
			{
				self savegame::set_player_data(savegame::get_mission_name() + "heavy_weapon", weapon.name);
				break;
			}
		}
	}
}

/*
	Name: function_c674fc77
	Namespace: globallogic_player
	Checksum: 0x401114B3
	Offset: 0xAE18
	Size: 0x94
	Parameters: 1
	Flags: Private
*/
function private function_c674fc77(statname)
{
	var_c0b8f5fd = self stats::get_stat(#"playerstatsbymap", getrootmapname(), #"hash_2f236080a1058999", statname);
	var_65442406 = self stats::get_stat(#"playerstatslist", statname, #"statvalue");
	return var_65442406 - var_c0b8f5fd;
}

/*
	Name: function_4b78690e
	Namespace: globallogic_player
	Checksum: 0xF18A2264
	Offset: 0xAEB8
	Size: 0x40C
	Parameters: 1
	Flags: None
*/
function function_4b78690e(var_8c0308ed)
{
	if(!isdefined(var_8c0308ed))
	{
		return;
	}
	for(i = 1; i < 58; i++)
	{
		var_813ca5ee = self getcurrentgunrank(i);
		if(!isdefined(var_813ca5ee))
		{
			var_813ca5ee = 0;
		}
		self stats::set_stat(#"currentweaponlevels", i, var_813ca5ee);
	}
	var_e461ad1 = self stats::get_stat(#"playerstatslist", #"rankxp", #"statvalue");
	self stats::set_stat(#"hash_6dcaad4976588a44", var_e461ad1);
	var_797451ed = [];
	array::add(var_797451ed, "KILLS");
	array::add(var_797451ed, "SCORE");
	array::add(var_797451ed, "ASSISTS");
	array::add(var_797451ed, "INCAPS");
	array::add(var_797451ed, "REVIVES");
	foreach(stat in var_797451ed)
	{
		statvalue = self stats::get_stat(#"playerstatslist", stat, #"statvalue");
		self stats::set_stat(#"playerstatsbymap", var_8c0308ed, #"hash_2f236080a1058999", stat, statvalue);
	}
	for(i = 0; i < 6; i++)
	{
		var_b69c01aa = self stats::get_stat(#"playerstatsbymap", var_8c0308ed, #"hash_1e0160af4fd80dff", i);
		self stats::set_stat(#"playerstatsbymap", var_8c0308ed, #"hash_518113a79b08988", i, var_b69c01aa);
		var_3f6b581d = self stats::get_stat(#"playerstatsbymap", var_8c0308ed, #"hash_657891d65d881524", i);
		self stats::set_stat(#"playerstatsbymap", var_8c0308ed, #"hash_233621878f97486b", i, var_3f6b581d);
	}
	for(i = 0; i < 20; i++)
	{
		var_d8bb48fd = self stats::get_stat(#"playercpdecorations", i);
		self stats::set_stat(#"hash_711b1260308620e7", i, var_d8bb48fd);
	}
	uploadstats(self);
}

/*
	Name: recordactiveplayersendgamematchrecordstats
	Namespace: globallogic_player
	Checksum: 0xEE457C79
	Offset: 0xB2D0
	Size: 0xA8
	Parameters: 0
	Flags: None
*/
function recordactiveplayersendgamematchrecordstats()
{
	foreach(player in level.players)
	{
		recordplayermatchend(player);
		recordplayerstats(player, "present_at_end", 1);
	}
}

/*
	Name: function_452827de
	Namespace: globallogic_player
	Checksum: 0x4A8F0E4E
	Offset: 0xB380
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_452827de(damage)
{
}

