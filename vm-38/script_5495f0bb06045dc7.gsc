#using scripts\wz_common\wz_ignore_systems.gsc;
#using scripts\wz_common\wz_progression.gsc;
#using scripts\wz_common\util.gsc;
#using scripts\wz_common\teams\teams.gsc;
#using scripts\wz_common\spawn.gsc;
#using scripts\wz_common\oob.gsc;
#using scripts\wz_common\hud.gsc;
#using script_6652a3edaad1063c;
#using script_277bc0c5e470495e;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\teams\team_assignment.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\player\player_killed.gsc;
#using scripts\mp_common\gametypes\menus.gsc;
#using scripts\mp_common\laststand.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using script_1cc417743d7c262d;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\dogtags.gsc;
#using scripts\mp_common\gameadvertisement.gsc;
#using scripts\mp_common\bb.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using script_44b0b8420eabacad;
#using script_5ee699b0aaf564c4;
#using scripts\core_common\scene_shared.gsc;
#using script_335d0650ed05d36d;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_reinsertion.gsc;
#using scripts\core_common\player\player_insertion.gsc;
#using script_1467cf24b0d4ee55;
#using scripts\core_common\laststand_shared.gsc;
#using script_67ce8e728d8f37ba;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;

#namespace namespace_17baa64d;

/*
	Name: function_2fe7dbee
	Namespace: namespace_17baa64d
	Checksum: 0x49952F7
	Offset: 0x3D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2fe7dbee()
{
	level notify(1258308739);
}

/*
	Name: init
	Namespace: namespace_17baa64d
	Checksum: 0x86C08EDD
	Offset: 0x3F8
	Size: 0x6F4
	Parameters: 0
	Flags: None
*/
function init()
{
	globallogic::init();
	level.var_79219af4 = 0;
	if(getdvarint(#"hash_2cc9b0ef1896d89a", 1) != 0)
	{
		level.var_79219af4 = (isdefined(getgametypesetting(#"startplayers")) ? getgametypesetting(#"startplayers") : 0);
	}
	level.var_f2814a96 = (isdefined(getgametypesetting(#"hash_6be1c95551e78384")) ? getgametypesetting(#"hash_6be1c95551e78384") : 0);
	if(level.var_f2814a96 !== 1 && level.var_f2814a96 !== 2)
	{
		level.var_3d984b4c = 0;
	}
	level.var_153e7dad = 1;
	level.var_4cea2bec = (isdefined(getgametypesetting(#"hash_6cc7b012775d9662")) ? getgametypesetting(#"hash_6cc7b012775d9662") : 0);
	level.var_6c900548 = (isdefined(getgametypesetting(#"hash_2b3e56efad3a1504")) ? getgametypesetting(#"hash_2b3e56efad3a1504") : 0);
	level.var_e16a689f = (isdefined(getgametypesetting(#"hash_557cb4680634f585")) ? getgametypesetting(#"hash_557cb4680634f585") : 0);
	level.onstartgametype = &on_start_game_type;
	level.onspawnplayer = &on_spawn_player;
	level.onendround = &on_end_round;
	level.onendgame = &on_end_game;
	level.ondeadevent = &on_dead_event;
	level.ononeleftevent = &on_one_left_event;
	level.var_a3e209ba = &function_a3e209ba;
	if((isdefined(getgametypesetting(#"disableclassselection")) ? getgametypesetting(#"disableclassselection") : 0))
	{
		level.var_86513cd0 = &function_3b0db3c2;
	}
	level.var_74b10e67 = &loadout::register_perks;
	level.var_5495fbf1 = 0;
	level.var_e7b05b51 = 0;
	level.var_674e8051 = 1;
	level.var_f48e69e7 = 1;
	level.var_f97a6ba3 = 1;
	level.var_806e130d = 1;
	if((isdefined(getgametypesetting(#"disableweapondrop")) ? getgametypesetting(#"disableweapondrop") : 0))
	{
		level.var_827f5a28 = 1;
	}
	level.var_eed7c027 = [];
	level.on_spawn_player = &spawn::on_spawn_player;
	insertion::init();
	hud::function_9b9cecdf();
	death_circle::init_vo();
	oob::init();
	callback::on_player_killed(&function_c1a417ee);
	player::function_cf3aa03d(&player_killed);
	callback::on_spawned(&on_player_spawned);
	callback::on_connect(&on_player_connect);
	callback::on_disconnect(&on_player_disconnect);
	callback::on_game_playing(&start_warzone);
	callback::add_callback(#"on_last_alive", &function_5af3a29);
	callback::add_callback(#"hash_40cd438036ae13df", &function_1f93e91f);
	callback::on_item_pickup(&on_item_pickup);
	callback::add_callback(#"hash_1019ab4b81d07b35", &team_eliminated);
	function_aaa24662();
	level.wound_disabled = 1;
	level.var_b219667f = 1;
	level.var_606becce = [];
	level thread function_23600e7d();
	/#
		callback::on_vehicle_spawned(&function_5d7553c9);
		level.var_5efad16e = &function_73b0f715;
		forcedplayerteam = getdvarstring(#"forcedplayerteam", "");
		if(forcedplayerteam != "")
		{
			level.forcedplayerteam = forcedplayerteam;
		}
		level thread function_c2a75696();
	#/
}

/*
	Name: on_spawn_player
	Namespace: namespace_17baa64d
	Checksum: 0x8EF89575
	Offset: 0xAF8
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function on_spawn_player(predictedspawn)
{
	if(level.var_f2814a96 === 1 || level.var_f2814a96 === 2)
	{
		namespace_ce472ff1::on_spawn_player(predictedspawn);
	}
	else
	{
		spawn::on_spawn_player(predictedspawn);
	}
}

/*
	Name: on_start_game_type
	Namespace: namespace_17baa64d
	Checksum: 0x834AB4F9
	Offset: 0xB68
	Size: 0x1AC
	Parameters: 0
	Flags: None
*/
function on_start_game_type()
{
	level.displayroundendtext = 0;
	level.var_992e9235 = [];
	level thread spawn::function_e93291ff();
	level callback::add_callback(#"hash_774be40ec06d5212", &function_bcde1e07);
	level flag::clear(#"spawning_allowed");
	laststand_mp::function_414115a0(90, 150);
	laststand_mp::function_414115a0(25, 150);
	laststand_mp::function_414115a0(15, 150);
	laststand_mp::function_414115a0(10, 150);
	laststand_mp::function_414115a0(5, 150);
	laststand_mp::function_414115a0(3, 150);
	laststand_mp::function_414115a0(1, 150);
	laststand_mp::function_414115a0(0, 150);
	death_circle::init();
	if(is_true(level.var_4cea2bec))
	{
		level thread function_6ee52dd0(level.var_6c900548, level.var_e16a689f);
	}
	level thread hud::function_5db32126();
}

/*
	Name: function_bcde1e07
	Namespace: namespace_17baa64d
	Checksum: 0xE34F3847
	Offset: 0xD20
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_bcde1e07()
{
	level flag::clear(#"spawning_allowed");
	player_insertion::function_bcde1e07();
}

/*
	Name: function_3b0db3c2
	Namespace: namespace_17baa64d
	Checksum: 0xDE597437
	Offset: 0xD60
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_3b0db3c2()
{
	if(!util::isfirstround())
	{
		return;
	}
	/#
		if(function_7373cc35())
		{
			return;
		}
	#/
	level.prematchperiod = max(level.prematchperiod, 5);
	level waittill(#"hash_78e53817cafb5265");
	/#
		println("");
	#/
	if(level.var_b02808b6)
	{
		gameadvertisement::setadvertisedstatus(0);
	}
}

/*
	Name: function_70171add
	Namespace: namespace_17baa64d
	Checksum: 0xA5877D17
	Offset: 0xE18
	Size: 0x7E
	Parameters: 0
	Flags: Private
*/
function private function_70171add()
{
	if(randomfloat(1) <= getdvarfloat(#"survey_chance", 0))
	{
		return randomintrange(1, getdvarint(#"survey_count", 0) + 1);
	}
	return 0;
}

/*
	Name: start_warzone
	Namespace: namespace_17baa64d
	Checksum: 0x62B4D785
	Offset: 0xEA0
	Size: 0x27C
	Parameters: 0
	Flags: None
*/
function start_warzone()
{
	level notify(#"start_warzone");
	/#
		println("");
	#/
	if(level.var_b02808b6)
	{
		gameadvertisement::setadvertisedstatus(0);
	}
	teams::function_344e464d();
	if(is_true(level.spawnsystem.deathcirclerespawn))
	{
		level callback::add_callback(#"hash_3057417db7f8acdd", &function_77319881);
	}
	function_65469e2e();
	if(spawning::function_daa5852f())
	{
		level player_insertion::function_8dcd8623();
	}
	level.ingraceperiod = 0;
	spawning::function_7a87efaa();
	level.var_bde3d03 = undefined;
	var_f9adbf05 = function_70171add();
	foreach(player in getplayers())
	{
		player spawn::function_8cef1872();
		player val::reset(#"warzonestaging", "takedamage");
		if(sessionmodeisonlinegame())
		{
			player stats::function_7a850245(#"demofileid", getdemofileid());
			if(level.rankedmatch)
			{
				player stats::function_7a850245("surveyId", var_f9adbf05);
			}
		}
	}
	spawn::function_cb5864fc();
}

/*
	Name: on_player_connect
	Namespace: namespace_17baa64d
	Checksum: 0xF3BDA2AD
	Offset: 0x1128
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	self.var_63af7f75 = -1;
	self.var_c5134737 = 1;
	level hud::function_22df4165();
	self wz_progression::player_connected();
}

/*
	Name: on_player_disconnect
	Namespace: namespace_17baa64d
	Checksum: 0x8EEBDA49
	Offset: 0x1180
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function on_player_disconnect()
{
	self wz_progression::player_disconnected();
	level hud::function_22df4165();
	dogtag = self.var_c0ad34c;
	if(isdefined(dogtag))
	{
		item_drop::function_ccba50c6(dogtag);
	}
}

/*
	Name: team_eliminated
	Namespace: namespace_17baa64d
	Checksum: 0xA602430C
	Offset: 0x11F0
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function team_eliminated(params)
{
	team = params.team;
	foreach(player in getplayers(team))
	{
		dogtag = player.var_c0ad34c;
		if(isdefined(dogtag))
		{
			item_drop::function_ccba50c6(dogtag);
		}
	}
}

/*
	Name: function_5d7553c9
	Namespace: namespace_17baa64d
	Checksum: 0xCFDF129A
	Offset: 0x12C0
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_5d7553c9()
{
	/#
		if(game.state == #"pregame")
		{
			return;
		}
		if(level flag::get(#"item_world_reset"))
		{
			return;
		}
		if(!is_true(self.var_46439e18))
		{
			return;
		}
		if(!isdefined(level.var_c18a1e6b))
		{
			level.var_c18a1e6b = 0;
		}
		level.var_c18a1e6b++;
		if(getdvarint(#"hash_10daadecda56ef52", 1) && level.var_c18a1e6b > 120)
		{
			/#
				assert(level.var_c18a1e6b <= 120, "");
			#/
		}
	#/
}

/*
	Name: function_c2a75696
	Namespace: namespace_17baa64d
	Checksum: 0xA7BDDC9D
	Offset: 0x13C8
	Size: 0x130
	Parameters: 0
	Flags: Private
*/
function private function_c2a75696()
{
	/#
		mapname = util::get_map_name();
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		while(true)
		{
			waitframe(1);
			string = getdvarstring(#"warzone_devgui_cmd", "");
			switch(string)
			{
				case "start":
				{
					function_73b0f715();
					break;
				}
				default:
				{
					break;
				}
			}
			setdvar(#"warzone_devgui_cmd", "");
		}
	#/
}

/*
	Name: function_75189494
	Namespace: namespace_17baa64d
	Checksum: 0x61C65370
	Offset: 0x1500
	Size: 0x84
	Parameters: 3
	Flags: Private
*/
function private function_75189494(var_c6ce2627, playercount, var_404397c4)
{
	data = {#hash_4a2854ac:var_404397c4, #hash_f388074a:playercount, #hash_19b5b856:var_c6ce2627};
	function_92d1707f(#"hash_7bcd081bd6940681", data);
}

/*
	Name: function_23600e7d
	Namespace: namespace_17baa64d
	Checksum: 0x32E4F013
	Offset: 0x1590
	Size: 0xFC0
	Parameters: 0
	Flags: Private
*/
function private function_23600e7d()
{
	var_26ef8eea = (isdefined(getgametypesetting(#"hash_bd1199baafe11fe")) ? getgametypesetting(#"hash_bd1199baafe11fe") : 1);
	/#
		var_26ef8eea = 0;
	#/
	if(var_26ef8eea && !isdedicated())
	{
		/#
			println("");
		#/
		return;
	}
	if(getdvarint(#"hash_2cc9b0ef1896d89a", 1) != 0)
	{
		/#
			println("");
		#/
		return;
	}
	while(!isdefined(game.state) || game.state != #"pregame")
	{
		waitframe(1);
	}
	while(function_a1ef346b().size == 0)
	{
		waitframe(1);
	}
	if(getdvarint(#"wz_test_mode", 0) != 0)
	{
		/#
			println("");
		#/
		level function_73b0f715();
		return;
	}
	/#
		if(function_7373cc35())
		{
			return;
		}
	#/
	level endon(#"start_warzone");
	level.var_8fcd8a61 = (isdefined(getgametypesetting(#"hash_35c2d850e39fa704")) ? getgametypesetting(#"hash_35c2d850e39fa704") : 100);
	level.var_e9d6c52f = (isdefined(getgametypesetting(#"hash_46f957248efbd39a")) ? getgametypesetting(#"hash_46f957248efbd39a") : 10);
	level.player_reduction = (isdefined(getgametypesetting(#"player_reduction")) ? getgametypesetting(#"player_reduction") : 4);
	level.evolution_interval = (isdefined(getgametypesetting(#"evolution_interval")) ? getgametypesetting(#"evolution_interval") : 20);
	level.var_8ca0499 = (isdefined(getgametypesetting(#"hash_ad6c0d1cd92c1fe")) ? getgametypesetting(#"hash_ad6c0d1cd92c1fe") : 30);
	level.var_493d04d3 = (isdefined(getgametypesetting(#"hash_28233b1037888945")) ? getgametypesetting(#"hash_28233b1037888945") : 15);
	level.max_wait_time = (isdefined(getgametypesetting(#"max_wait_time")) ? getgametypesetting(#"max_wait_time") : 0);
	level.var_3f631d69 = (isdefined(getgametypesetting(#"hash_2d4ff63e866cdd74")) ? getgametypesetting(#"hash_2d4ff63e866cdd74") : 120);
	if(level.evolution_interval <= 0)
	{
		level.evolution_interval = 1;
	}
	level.var_25fc8e84 = int(ceil((level.max_wait_time * 60) / level.evolution_interval));
	starttime = gettime();
	var_fb9555e1 = 3;
	level.var_a132ca2b = level.var_8fcd8a61;
	level.var_7dc1df3a = spawnstruct();
	level.var_7dc1df3a.var_e2382b29 = level.var_8fcd8a61;
	var_e09e5160 = function_a1ef346b().size;
	evolution = 0;
	/#
		println("" + starttime);
	#/
	/#
		println("" + level.var_8fcd8a61);
	#/
	/#
		println("" + level.var_e9d6c52f);
	#/
	/#
		println("" + level.player_reduction);
	#/
	/#
		println("" + level.evolution_interval);
	#/
	/#
		println("" + level.var_8ca0499);
	#/
	/#
		println("" + level.var_493d04d3);
	#/
	/#
		println("" + level.max_wait_time);
	#/
	/#
		println("" + level.var_3f631d69);
	#/
	/#
		println("" + level.var_25fc8e84);
	#/
	/#
		println("" + level.var_a132ca2b);
	#/
	while(true)
	{
		/#
			println("");
		#/
		/#
			println("" + evolution);
		#/
		if(getdvarint(#"hash_2cc9b0ef1896d89a", 1) != 0)
		{
			/#
				println("");
			#/
			level.var_7dc1df3a = undefined;
			return;
		}
		if(level.max_wait_time > 0 && level.var_25fc8e84 <= 0)
		{
			level.var_a132ca2b = level.var_e9d6c52f;
			level.var_8ca0499 = level.var_3f631d69;
			level.var_493d04d3 = 0;
			/#
				println(("" + level.max_wait_time) + "");
			#/
			/#
				println((("" + level.var_a132ca2b) + "") + level.var_8ca0499);
			#/
		}
		if(function_a1ef346b().size >= level.var_a132ca2b)
		{
			level.var_7dc1df3a.var_7be962bb = function_a1ef346b().size;
			level.var_7dc1df3a.var_7d960258 = level.var_a132ca2b;
			if(function_a1ef346b().size < level.var_8fcd8a61)
			{
				/#
					println((("" + level.var_8fcd8a61) + "") + function_a1ef346b().size);
				#/
				if(level.var_8ca0499 > 0)
				{
					timeleft = level.var_8ca0499;
					/#
						println("" + level.var_8ca0499);
					#/
					while(timeleft > 0)
					{
						timeleft = timeleft - 1;
						wait(1);
						if(function_a1ef346b().size >= level.var_8fcd8a61)
						{
							break;
						}
					}
					level.var_7dc1df3a.var_a104a7da = function_a1ef346b().size - level.var_7dc1df3a.var_7be962bb;
				}
			}
			if(function_a1ef346b().size < level.var_a132ca2b)
			{
				wait(5);
				var_fb9555e1 = 3;
				continue;
			}
			if(level.var_b02808b6)
			{
				/#
					println("");
				#/
				gameadvertisement::setadvertisedstatus(0);
			}
			level.var_7dc1df3a.duration = gettime() - starttime;
			/#
				println("" + gettime());
			#/
			level function_73b0f715();
			return;
		}
		if(level.var_493d04d3 <= 0 && function_a1ef346b().size < level.var_e9d6c52f)
		{
			if(var_fb9555e1 > 0)
			{
				/#
					println("" + function_a1ef346b().size);
				#/
				wait(5);
				var_fb9555e1--;
				/#
					println("" + var_fb9555e1);
				#/
				continue;
			}
			function_75189494(gettime() - starttime, function_a1ef346b().size, level.var_e9d6c52f);
			/#
				println("" + gettime());
			#/
			level.var_7dc1df3a = undefined;
			exitlevel(0, #"hash_35b5848d9f1b58e0");
			return;
		}
		/#
			println("");
		#/
		/#
			println("" + function_a1ef346b().size);
		#/
		/#
			println("" + level.var_a132ca2b);
		#/
		if(function_a1ef346b().size < level.var_a132ca2b)
		{
			var_7bce82a7 = function_a1ef346b().size - var_e09e5160;
			if(var_7bce82a7 >= 3)
			{
				/#
					println("" + var_7bce82a7);
				#/
				if(level.var_a132ca2b < level.var_8fcd8a61 - level.maxteamplayers)
				{
					var_b0c8b797 = level.var_a132ca2b - function_a1ef346b().size;
					if(var_b0c8b797 < 4 * level.maxteamplayers)
					{
						level.var_a132ca2b = level.var_a132ca2b + level.maxteamplayers;
						/#
							println("" + level.var_a132ca2b);
						#/
					}
				}
				var_e09e5160 = function_a1ef346b().size;
				wait(2);
				/#
					println("" + evolution);
				#/
				continue;
			}
		}
		evolution++;
		var_e09e5160 = function_a1ef346b().size;
		/#
			println("" + level.evolution_interval);
		#/
		timeleft = level.evolution_interval;
		while(timeleft > 0)
		{
			timeleft = timeleft - 1;
			wait(1);
			if(function_a1ef346b().size >= level.var_a132ca2b)
			{
				break;
			}
		}
		if(function_a1ef346b().size < level.var_a132ca2b)
		{
			level.var_a132ca2b = level.var_a132ca2b - level.player_reduction;
			if(level.var_a132ca2b < level.var_e9d6c52f)
			{
				level.var_a132ca2b = level.var_e9d6c52f;
			}
		}
		if(level.var_25fc8e84 > 0)
		{
			level.var_25fc8e84--;
		}
		if(level.var_493d04d3 > 0)
		{
			level.var_493d04d3--;
		}
		/#
			println("" + level.var_a132ca2b);
		#/
		/#
			println("" + level.var_493d04d3);
		#/
		/#
			println("");
		#/
	}
}

/*
	Name: function_ec2c9808
	Namespace: namespace_17baa64d
	Checksum: 0x97F24950
	Offset: 0x2558
	Size: 0x1A8
	Parameters: 2
	Flags: Private
*/
function private function_ec2c9808(response, intpayload)
{
	if(!isalive(self) && !player::function_21695e86())
	{
		return;
	}
	foreach(player in getplayers())
	{
		if(player.team === self.team)
		{
			if(response == "placed")
			{
				xcoord = int(intpayload / 1000);
				ycoord = intpayload - (xcoord * 1000);
				player luinotifyevent(#"teammate_waypoint_placed", 3, self getentitynumber(), xcoord, ycoord);
				continue;
			}
			if(response == "removed")
			{
				player luinotifyevent(#"teammate_waypoint_removed", 1, self getentitynumber());
			}
		}
	}
}

/*
	Name: function_cc47bb2f
	Namespace: namespace_17baa64d
	Checksum: 0xBA734C74
	Offset: 0x2708
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_cc47bb2f()
{
	if(game.state == #"pregame")
	{
		return true;
	}
	return false;
}

/*
	Name: on_player_spawned
	Namespace: namespace_17baa64d
	Checksum: 0x1762840C
	Offset: 0x2738
	Size: 0x542
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self endon(#"death");
	level endon(#"game_ended");
	self.var_1ab1ec0c = self.origin;
	self laststand_mp::function_7e714b6a();
	dogtag = self.var_c0ad34c;
	if(isdefined(dogtag))
	{
		item_drop::function_ccba50c6(dogtag);
	}
	self clientfield::set_player_uimodel("hudItems.playerCleanUps", self.cleanups);
	self clientfield::set_player_uimodel("hudItems.playerKills", self.kills);
	level hud::function_22df4165();
	character_index = self getcharacterbodytype();
	fields = getcharacterfields(character_index, currentsessionmode());
	if(isdefined(fields))
	{
		if(isdefined(fields.var_9c1be670) && fields.var_9c1be670)
		{
			self hidepart("tag_ability_hero");
		}
		if(isdefined(fields.var_1b216715) && fields.var_1b216715)
		{
			self hidepart("tag_equipment_hero");
		}
	}
	if(isdefined(self.pers) && isdefined(self.pers[#"lives"]))
	{
		self spawn::function_1390f875();
		if(self.pers[#"lives"] != 1 && !is_true(self.var_874448e8))
		{
			self clientfield::set_player_uimodel("hudItems.playerCanRedeploy", 1);
			self.var_874448e8 = 1;
		}
		if(self.pers[#"lives"] == 1)
		{
			self clientfield::set_player_uimodel("hudItems.playerCanRedeploy", 0);
		}
	}
	if(function_cc47bb2f())
	{
		if(is_true(getgametypesetting("allowPlayerMovementPrematch")))
		{
			self val::reset(#"spawn_player", "freezecontrols");
		}
		self val::reset(#"spawn_player", "disablegadgets");
		self val::set(#"warzonestaging", "takedamage", 0);
		if(level.var_79219af4 > 0 && (function_a1ef346b().size + 1) >= level.var_79219af4)
		{
			level function_73b0f715();
		}
	}
	else
	{
		if(player_reinsertion::function_42a8e289())
		{
			self thread player_reinsertion::function_1579c63e();
		}
		else if(level.var_f2814a96 === 0)
		{
			/#
				if(getdvarint(#"scr_disable_infiltration", 0))
				{
					return;
				}
			#/
			var_7eb8f61a = (isdefined(getgametypesetting(#"wzplayerinsertiontypeindex")) ? getgametypesetting(#"wzplayerinsertiontypeindex") : 0);
			switch(var_7eb8f61a)
			{
				case 0:
				{
					self thread player_reinsertion::function_584c9f1();
					break;
				}
				case 1:
				{
					self thread player_reinsertion::function_39a51e47();
					break;
				}
				case 2:
				{
					self thread player_reinsertion::function_3c4884f1();
					break;
				}
				case 3:
				{
					self thread namespace_aaddef5a::function_96d350e9(self);
					break;
				}
			}
		}
	}
}

/*
	Name: on_end_round
	Namespace: namespace_17baa64d
	Checksum: 0x70C58E11
	Offset: 0x2C88
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function on_end_round(var_c1e98979)
{
	teams::function_f1394038();
	function_16e6bd2e(var_c1e98979);
}

/*
	Name: on_dead_event
	Namespace: namespace_17baa64d
	Checksum: 0x55D6A50C
	Offset: 0x2CC8
	Size: 0x1E4
	Parameters: 1
	Flags: None
*/
function on_dead_event(team)
{
	if(team == "all")
	{
		var_d72df62 = teams::function_c7eae573();
		winning_team = teams::function_c2f2fb84(var_d72df62);
		count = 2;
		foreach(final_team in var_d72df62)
		{
			if(!isdefined(winning_team) || util::function_fbce7263(winning_team, final_team.team))
			{
				teams::team_eliminated(final_team.team, count);
				count++;
			}
		}
		teams::function_5fed3908(winning_team);
		round::function_af2e264f(winning_team);
		thread globallogic::end_round(6);
	}
	else if(teams::function_9dd75dad(team) && !is_true(level.var_606becce[team]) && teams::is_all_dead(team))
	{
		teams::team_eliminated(team, globallogic::function_e9e52d05() + 1);
	}
}

/*
	Name: function_5af3a29
	Namespace: namespace_17baa64d
	Checksum: 0x9F938DE4
	Offset: 0x2EB8
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_5af3a29(params)
{
	level thread function_3832a0d2(params.teams_alive[0]);
	teams::function_5fed3908(params.teams_alive[0]);
}

/*
	Name: function_3832a0d2
	Namespace: namespace_17baa64d
	Checksum: 0x1D474DC
	Offset: 0x2F18
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_3832a0d2(team)
{
	winner = function_b5f4c9d8(team);
	if(isdefined(winner))
	{
		var_fc96f513 = winner getmpdialogname();
		if(isdefined(var_fc96f513))
		{
			player_bundle = getscriptbundle(var_fc96f513);
			if(isdefined(player_bundle))
			{
				var_520b24a = player_bundle.boostwin;
				if(isdefined(var_520b24a))
				{
					level.var_fec861a7 = 1;
					winner battlechatter::function_a48c33ff(var_520b24a, 148, 5);
					level.var_fec861a7 = undefined;
				}
			}
		}
	}
	wait(5);
	globallogic_audio::leader_dialog("warTeamWon", team);
}

/*
	Name: function_b5f4c9d8
	Namespace: namespace_17baa64d
	Checksum: 0x94AEB146
	Offset: 0x3020
	Size: 0x106
	Parameters: 1
	Flags: Private
*/
function private function_b5f4c9d8(team)
{
	winner = undefined;
	players = getplayers(team);
	foreach(player in players)
	{
		if(!isalive(player))
		{
			continue;
		}
		if(!isdefined(player.lastkilltime))
		{
			player.lastkilltime = 0;
		}
		if(!isdefined(winner) || player.lastkilltime > winner.lastkilltime)
		{
			winner = player;
		}
	}
	return winner;
}

/*
	Name: on_one_left_event
	Namespace: namespace_17baa64d
	Checksum: 0xB29A9639
	Offset: 0x3130
	Size: 0xEA
	Parameters: 1
	Flags: None
*/
function on_one_left_event(team)
{
	if(team == "all")
	{
		return;
	}
	foreach(player in getplayers(team))
	{
		if(isalive(player) && !player laststand::player_is_in_laststand())
		{
			player globallogic_audio::leader_dialog_on_player("warLastManStanding");
			return;
		}
	}
}

/*
	Name: function_379afb41
	Namespace: namespace_17baa64d
	Checksum: 0x9457484B
	Offset: 0x3228
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function function_379afb41()
{
	death_circle::function_27d5d349();
}

/*
	Name: on_end_game
	Namespace: namespace_17baa64d
	Checksum: 0x33CD03B5
	Offset: 0x3248
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function on_end_game(var_c1e98979)
{
	function_379afb41();
	level.var_bde3d03 = &oob::function_b777ff94;
	level thread globallogic_audio::function_85818e24("matchcomplete");
	winner = round::get_winner();
	match::function_af2e264f(winner);
	setmatchflag("game_ended", 1);
}

/*
	Name: function_c1a417ee
	Namespace: namespace_17baa64d
	Checksum: 0x5EEA28F
	Offset: 0x32F8
	Size: 0x264
	Parameters: 1
	Flags: None
*/
function function_c1a417ee(params)
{
	level hud::function_22df4165();
	attacker = params.attacker;
	weapon = params.weapon;
	smeansofdeath = params.smeansofdeath;
	if(isdefined(params.laststandparams))
	{
		attacker = params.laststandparams.attacker;
		weapon = params.laststandparams.weapon;
		smeansofdeath = params.laststandparams.smeansofdeath;
	}
	if(isplayer(attacker))
	{
		itemindex = getitemindexfromref(weapon.name);
		if(itemindex == 0)
		{
			itemindex = getitemindexfromref(weapon.statname);
		}
		var_97dcd0a5 = getunlockableiteminfofromindex(itemindex, 1);
		if(isdefined(var_97dcd0a5))
		{
			attackerid = attacker getentitynumber();
			self luinotifyevent(#"eliminator_info", 3, attackerid, 0, weapon.statindex);
		}
		else
		{
			self luinotifyevent(#"eliminator_info", 3, 0, function_4a856ead(smeansofdeath), 0);
		}
	}
	else
	{
		self luinotifyevent(#"eliminator_info", 3, 0, function_4a856ead(smeansofdeath), 0);
	}
	self function_e6f9e3cd();
	self.specialty = self getloadoutperks(0);
	self loadout::register_perks();
}

/*
	Name: on_item_pickup
	Namespace: namespace_17baa64d
	Checksum: 0xCE2DAD3D
	Offset: 0x3568
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function on_item_pickup(params)
{
	item = params.item;
	var_a6762160 = item.var_a6762160;
	if(var_a6762160.itemtype != #"dogtag")
	{
		return;
	}
	if(isfunctionptr(level.var_c4dc9178))
	{
		item [[level.var_c4dc9178]](self);
	}
}

/*
	Name: function_c14ef1aa
	Namespace: namespace_17baa64d
	Checksum: 0x9BA8B136
	Offset: 0x35F8
	Size: 0x150
	Parameters: 1
	Flags: None
*/
function function_c14ef1aa(attacker)
{
	if(getdvarint(#"hash_10c3f1c0958c1fba", 0) == 0)
	{
		return false;
	}
	if(!isdedicated())
	{
		return false;
	}
	if(isalive(self))
	{
		return false;
	}
	if(isdefined(self.switching_teams))
	{
		return false;
	}
	if(isdefined(attacker) && attacker == self)
	{
		return false;
	}
	if(level.teambased && isdefined(attacker) && isdefined(attacker.team) && attacker.team == self.team)
	{
		return false;
	}
	if(isdefined(attacker) && (!isdefined(attacker.team) || attacker.team == #"none") && (attacker.classname == "trigger_hurt" || attacker.classname == "worldspawn"))
	{
		return false;
	}
	return true;
}

/*
	Name: player_killed
	Namespace: namespace_17baa64d
	Checksum: 0xA94F05B0
	Offset: 0x3750
	Size: 0x304
	Parameters: 9
	Flags: None
*/
function player_killed(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	self clientfield::set_to_player("realtime_multiplay", 0);
	if(smeansofdeath == "MOD_META")
	{
		return;
	}
	if(is_true(level.droppedtagrespawn) && !is_true(getgametypesetting(#"useitemspawns")))
	{
		thread dogtags::checkallowspectating();
		should_spawn_tags = self dogtags::should_spawn_tags(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
		should_spawn_tags = should_spawn_tags && !globallogic_spawn::mayspawn();
		if(should_spawn_tags)
		{
			level thread dogtags::spawn_dog_tag(self, attacker, &dogtags::onusedogtag, 0);
		}
	}
	if(isplayer(attacker) && self function_c14ef1aa(attacker))
	{
		var_27a8d662 = self getxuid(1) + attacker getxuid(1);
		self function_b096092b(var_27a8d662);
		attacker function_b096092b(var_27a8d662);
	}
	if(isplayer(attacker) && attacker.team != self.team)
	{
		if(!isdefined(killstreaks::get_killstreak_for_weapon(weapon)) || is_true(level.killstreaksgivegamescore))
		{
			attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperkill);
			self globallogic_score::giveteamscoreforobjective(self.team, level.teamscoreperdeath * -1);
			if(smeansofdeath == "MOD_HEAD_SHOT")
			{
				attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperheadshot);
			}
		}
	}
}

/*
	Name: function_16e6bd2e
	Namespace: namespace_17baa64d
	Checksum: 0x7FBC9D6C
	Offset: 0x3A60
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function function_16e6bd2e(var_c1e98979)
{
	var_1e866967 = spawnstruct();
	var_1e866967.remainingtime = max(0, globallogic_utils::gettimeremaining());
	switch(var_c1e98979)
	{
		case 2:
		{
			var_1e866967.wintype = "time_limit_reached";
			break;
		}
		case 3:
		{
			var_1e866967.wintype = "score_limit_reached";
			break;
		}
		case 9:
		case 10:
		default:
		{
			var_1e866967.wintype = "NA";
			break;
		}
	}
	bb::function_bf5cad4e(var_1e866967);
}

/*
	Name: function_73b0f715
	Namespace: namespace_17baa64d
	Checksum: 0x824F45C2
	Offset: 0x3B70
	Size: 0x80
	Parameters: 1
	Flags: None
*/
function function_73b0f715(player)
{
	if(game.state != #"pregame")
	{
		return;
	}
	if(isdedicated())
	{
		if(getdvarint(#"hash_41feb500743b0d15", 0) != 0)
		{
			return;
		}
	}
	level notify(#"hash_78e53817cafb5265");
}

/*
	Name: function_a3e209ba
	Namespace: namespace_17baa64d
	Checksum: 0xFB6B4AF9
	Offset: 0x3BF8
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function function_a3e209ba()
{
	if(player_insertion::function_6660c1f())
	{
		return false;
	}
	return true;
}

/*
	Name: function_aaa24662
	Namespace: namespace_17baa64d
	Checksum: 0x30733C89
	Offset: 0x3C20
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_aaa24662()
{
	belowworldtrigger = getent("below_world_trigger", "targetname");
	if(!isentity(belowworldtrigger))
	{
		return;
	}
	belowworldtrigger callback::on_trigger(&function_3c8be2d2);
}

/*
	Name: function_1e150a0b
	Namespace: namespace_17baa64d
	Checksum: 0x3CCE3563
	Offset: 0x3C98
	Size: 0x264
	Parameters: 1
	Flags: Private
*/
function private function_1e150a0b(player)
{
	if(!isplayer(player))
	{
		/#
			assert(0);
		#/
		return;
	}
	var_9c24b065 = 5;
	var_2497d4aa = 100;
	var_9a5b8004 = 250;
	var_3a60655f = 100;
	var_50c30b0c = 250;
	var_5988a0d = 10000;
	var_85d40a8 = player.origin[2] + 500;
	startpos = (player.origin[0] + randomintrange(var_2497d4aa, var_9a5b8004), player.origin[1] + randomintrange(var_3a60655f, var_50c30b0c), var_5988a0d);
	endpos = (startpos[0], startpos[1], var_85d40a8);
	for(index = 0; index < var_9c24b065; index++)
	{
		var_708a2754 = physicstrace(startpos, endpos, (0, 0, 0), (0, 0, 0), player, 32);
		if(var_708a2754[#"fraction"] < 1)
		{
			player setorigin(var_708a2754[#"position"]);
			return;
		}
		startpos = (startpos[0] + randomintrange(var_2497d4aa, var_9a5b8004), startpos[1] + randomintrange(var_3a60655f, var_50c30b0c), var_5988a0d);
		endpos = (startpos[0], startpos[1], var_85d40a8);
	}
	player dodamage(player.health * 100, player.origin);
}

/*
	Name: function_6ee52dd0
	Namespace: namespace_17baa64d
	Checksum: 0x8D984C02
	Offset: 0x3F08
	Size: 0x264
	Parameters: 2
	Flags: Private
*/
function private function_6ee52dd0(damage, damageinterval)
{
	level flag::wait_till(#"insertion_teleport_completed");
	var_366959 = 0;
	var_1b5e849 = int(damageinterval * 1000);
	while(!is_true(level.gameended))
	{
		time = gettime();
		foreach(i, player in getplayers())
		{
			if(!isalive(player))
			{
				continue;
			}
			if(!isdefined(player.var_21b83511))
			{
				if(player ishidden() || player isinfreefall() || player isparachuting())
				{
					continue;
				}
				player.var_21b83511 = time + var_1b5e849;
				continue;
			}
			if(player.heal.enabled)
			{
				delta = player.var_21b83511 - time;
				player.var_21b83511 = time + delta;
				continue;
			}
			if((i % 10) == var_366959 && player.var_21b83511 < time)
			{
				player dodamage(damage, player.origin, undefined, undefined, undefined, "MOD_BLED_OUT");
				player.var_21b83511 = time + var_1b5e849;
			}
		}
		var_366959 = (var_366959 + 1) % 10;
		waitframe(1);
	}
}

/*
	Name: function_77319881
	Namespace: namespace_17baa64d
	Checksum: 0xECC0C4E8
	Offset: 0x4178
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_77319881()
{
	if(!is_true(level.spawnsystem.deathcirclerespawn))
	{
		return;
	}
	level flag::set(#"spawning_allowed");
	/#
		function_cc5d43a1("");
	#/
	level player_reinsertion::function_fec68e5c();
	/#
		function_cc5d43a1("");
	#/
	level flag::clear(#"spawning_allowed");
	waitframe(1);
	if(!util::function_47851c07())
	{
		player_reinsertion::function_8ea9be1c();
		level callback::remove_callback(#"hash_3057417db7f8acdd", &function_77319881);
	}
}

/*
	Name: function_cc5d43a1
	Namespace: namespace_17baa64d
	Checksum: 0x95467039
	Offset: 0x42A8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_cc5d43a1(msg)
{
	/#
		println(msg);
		adddebugcommand("");
	#/
}

/*
	Name: function_1f93e91f
	Namespace: namespace_17baa64d
	Checksum: 0xCA0967D8
	Offset: 0x42F0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_1f93e91f(params)
{
	util::function_8076d591("warSupplyDropIncoming");
}

/*
	Name: function_293cd859
	Namespace: namespace_17baa64d
	Checksum: 0x334A01DE
	Offset: 0x4320
	Size: 0x16C
	Parameters: 1
	Flags: Private
*/
function private function_293cd859(ent)
{
	if(isplayer(ent))
	{
		data = {#type:#"player", #pos_z:ent.origin[2], #pos_y:ent.origin[1], #pos_x:ent.origin[0]};
		function_92d1707f(#"hash_5820ed7a498888c4", data);
	}
	else
	{
		data = {#type:ent.model, #pos_z:ent.origin[2], #pos_y:ent.origin[1], #pos_x:ent.origin[0]};
		function_92d1707f(#"hash_5820ed7a498888c4", data);
	}
}

/*
	Name: function_3ca20639
	Namespace: namespace_17baa64d
	Checksum: 0x8F19F4F2
	Offset: 0x4498
	Size: 0x140
	Parameters: 1
	Flags: Private
*/
function private function_3ca20639(vehicle)
{
	occupants = vehicle getvehoccupants();
	foreach(occupant in occupants)
	{
		occupant unlink();
	}
	vehicle delete();
	foreach(occupant in occupants)
	{
		function_1e150a0b(occupant);
	}
}

/*
	Name: function_3c8be2d2
	Namespace: namespace_17baa64d
	Checksum: 0x8255C6ED
	Offset: 0x45E0
	Size: 0x3BC
	Parameters: 1
	Flags: Private
*/
function private function_3c8be2d2(trigger_struct)
{
	level endon(#"game_ended");
	self endon(#"death");
	usetrigger = self;
	activator = trigger_struct.activator;
	if(isplayer(activator))
	{
		/#
			iprintlnbold(((((("" + activator.origin[0]) + "") + activator.origin[1]) + "") + activator.origin[2]) + "");
		#/
		function_293cd859(activator);
		if(activator isinvehicle())
		{
			vehicle = activator getvehicleoccupied();
			function_3ca20639(vehicle);
		}
		else
		{
			function_1e150a0b(activator);
		}
	}
	else
	{
		if(isvehicle(activator))
		{
			/#
				iprintlnbold(((((("" + activator.origin[0]) + "") + activator.origin[1]) + "") + activator.origin[2]) + "");
				print((((((("" + activator.origin[0]) + "") + activator.origin[1]) + "") + activator.origin[2]) + "") + "");
			#/
			function_293cd859(activator);
			function_3ca20639(activator);
		}
		else if(isentity(activator))
		{
			/#
				iprintlnbold(((((("" + activator.origin[0]) + "") + activator.origin[1]) + "") + activator.origin[2]) + "");
				print((((((("" + activator.origin[0]) + "") + activator.origin[1]) + "") + activator.origin[2]) + "") + "");
			#/
			function_293cd859(activator);
			activator delete();
		}
	}
}

