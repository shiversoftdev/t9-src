#using script_1435f3c9fc699e04;
#using script_1cc417743d7c262d;
#using script_2c49ae69cd8ce30c;
#using script_335d0650ed05d36d;
#using script_44b0b8420eabacad;
#using script_47fb62300ac0bd60;
#using script_7a8059ca02b7b09e;
#using script_7d712f77ab8d0c16;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\medals_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\outcome.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\util.gsc;

#namespace namespace_d150537f;

/*
	Name: init
	Namespace: namespace_d150537f
	Checksum: 0xCCDE999D
	Offset: 0x5F8
	Size: 0x4E4
	Parameters: 0
	Flags: None
*/
function init()
{
	util::registerscorelimit(0, 1000);
	level.doprematch = 1;
	level.kothstarttime = 0;
	level.onstartgametype = &onstartgametype;
	player::function_3c5cc656(&function_610d3790);
	clientfield::register("scriptmover", "zone_id", 1, 5, "int");
	clientfield::register("scriptmover", "zone_state", 1, 3, "int");
	level.zoneautomovetime = getgametypesetting(#"autodestroytime");
	level.zonespawntime = getgametypesetting(#"objectivespawntime");
	level.shownextzoneobjective = getgametypesetting(#"shownextzoneobjective");
	level.kothmode = getgametypesetting(#"kothmode");
	level.capturetime = getgametypesetting(#"capturetime");
	level.destroytime = getgametypesetting(#"destroytime");
	level.delayplayer = getgametypesetting(#"delayplayer");
	level.randomzonespawn = getgametypesetting(#"randomobjectivelocations");
	level.scoreperplayer = getgametypesetting(#"scoreperplayer");
	level.var_5e8ffd3b = (isdefined(getgametypesetting(#"hash_38d6e4d91bbc82ee")) ? getgametypesetting(#"hash_38d6e4d91bbc82ee") : 0);
	level.timepauseswheninzone = getgametypesetting(#"timepauseswheninzone");
	level.var_a495fcf1 = max(getgametypesetting(#"hash_c0beb1e5a80c25c"), 1);
	level.timerpaused = 0;
	level.b_allow_vehicle_proximity_pickup = 1;
	level.var_c85170d1 = 1;
	level.var_10c0e6bb = &function_41224c9d;
	level.var_ab24f23b = 1;
	spawning::addsupportedspawnpointtype("koth");
	spawning::function_754c78a6(&function_259770ba);
	spawning::function_754c78a6(&function_40c08152);
	spawning::function_32b97d1b(&spawning::function_90dee50d);
	spawning::function_adbbb58a(&spawning::function_c24e290c);
	/#
		spawning::function_a860c440(&function_ed2b0a19);
	#/
	game.objective_gained_sound = "mpl_flagcapture_sting_friend";
	game.objective_lost_sound = "mpl_flagcapture_sting_enemy";
	game.objective_contested_sound = "mpl_flagreturn_sting";
	level.zonespawnqueue = [];
	level.active_zones = [];
	level.var_6d2f376a = &function_6d2f376a;
	level.var_e80a117f = 0;
	level callback::add_callback(#"on_end_game", &on_end_game);
	callback::on_connect(&function_e3aab320);
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_end_game
	Namespace: namespace_d150537f
	Checksum: 0xA7E1BCEE
	Offset: 0xAE8
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function on_end_game()
{
	matchrecordroundend();
	setmatchflag("bomb_timer_a", 0);
}

/*
	Name: function_941e9a96
	Namespace: namespace_d150537f
	Checksum: 0x9CC31252
	Offset: 0xB20
	Size: 0x1A4
	Parameters: 0
	Flags: Private
*/
function private function_941e9a96()
{
	level endon(#"game_ended");
	while(true)
	{
		waitframe(1);
		foreach(player in level.players)
		{
			if(isdefined(player.var_592f3e3c))
			{
				foreach(zone in level.active_zones)
				{
					if(isdefined(player.var_592f3e3c[zone.script_index]))
					{
						if(is_true(zone.gameobject.iscontested) || !isdefined(player.touchtriggers) || !isdefined(player.touchtriggers[zone.gameobject.entnum]))
						{
							player.var_592f3e3c[zone.script_index] = undefined;
						}
					}
				}
			}
		}
	}
}

/*
	Name: onstartgametype
	Namespace: namespace_d150537f
	Checksum: 0x12B571F7
	Offset: 0xCD0
	Size: 0x21C
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	globallogic_score::resetteamscores();
	level.kothtotalsecondsinzone = 0;
	luinotifyevent(#"round_start");
	spawning::function_fac242d0(10, "koth_zone_", &function_9dc6016e);
	if(getgametypesetting(#"hash_2a7683d2b8e8be59"))
	{
		level.ontimelimit = &function_35088f57;
	}
	if(!setup_zones())
	{
		return;
	}
	function_5b2a2486();
	foreach(zone in level.zones)
	{
		if(isdefined(zone.target))
		{
			var_ae149778 = getentarray(zone.target, "targetname");
			foreach(visual in var_ae149778)
			{
				visual notsolid();
			}
		}
	}
	thread function_ee725386();
	thread function_941e9a96();
}

/*
	Name: pause_time
	Namespace: namespace_d150537f
	Checksum: 0x4B18E518
	Offset: 0xEF8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function pause_time()
{
	if(level.timepauseswheninzone)
	{
		globallogic_utils::pausetimer();
		level.timerpaused = 1;
	}
}

/*
	Name: resume_time
	Namespace: namespace_d150537f
	Checksum: 0x73AAB23D
	Offset: 0xF38
	Size: 0x58
	Parameters: 0
	Flags: None
*/
function resume_time()
{
	if(level.timepauseswheninzone)
	{
		globallogic_utils::resumetimerdiscardoverride(int(level.kothtotalsecondsinzone * 1000));
		level.timerpaused = 0;
	}
}

/*
	Name: function_5b2a2486
	Namespace: namespace_d150537f
	Checksum: 0xB4700B22
	Offset: 0xF98
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_5b2a2486()
{
	level.playercapturelpm = getgametypesetting(#"maxplayereventsperminute");
	level.timepauseswheninzone = getgametypesetting(#"timepauseswheninzone");
}

/*
	Name: function_9695c3e3
	Namespace: namespace_d150537f
	Checksum: 0x72BFC3AE
	Offset: 0xFF8
	Size: 0x190
	Parameters: 0
	Flags: None
*/
function function_9695c3e3()
{
	/#
		assert(level.var_73377ee4.size > 0);
	#/
	count = 0;
	foreach(obj_id in level.var_73377ee4)
	{
		count++;
		if(level.randomzonespawn == 1)
		{
			nextzoneindex = function_ac4c0c88(1, count);
			nextzone = level.zonespawnqueue[nextzoneindex];
		}
		else
		{
			nextzoneindex = function_ac4c0c88(0, count);
			nextzone = level.zones[nextzoneindex];
		}
		objective_setstate(obj_id, "invisible");
		if(isdefined(nextzone))
		{
			objective_onentity(obj_id, nextzone.objectiveanchor);
			level.var_e89ee661 = 1;
			continue;
		}
		level.var_e89ee661 = 0;
	}
}

/*
	Name: function_9f81bb75
	Namespace: namespace_d150537f
	Checksum: 0x99032840
	Offset: 0x1190
	Size: 0xF8
	Parameters: 0
	Flags: None
*/
function function_9f81bb75()
{
	/#
		assert(level.var_73377ee4.size > 0);
	#/
	if(is_true(level.var_e89ee661) && !is_true(level.overtime))
	{
		foreach(obj_id in level.var_73377ee4)
		{
			objective_setstate(obj_id, "active");
		}
	}
}

/*
	Name: function_785aa606
	Namespace: namespace_d150537f
	Checksum: 0xA02D8FC1
	Offset: 0x1290
	Size: 0x198
	Parameters: 1
	Flags: None
*/
function function_785aa606(var_5ed6bcb0)
{
	if(level.randomzonespawn != 0)
	{
		zone = function_1949044f();
	}
	else
	{
		zone = [[var_5ed6bcb0]]();
	}
	if(!isdefined(zone))
	{
		globallogic_utils::add_map_error("No zones available");
		return;
	}
	/#
		print(((((("" + zone.trigorigin[0]) + "") + zone.trigorigin[1]) + "") + zone.trigorigin[2]) + "");
	#/
	zone enable_influencers(1);
	zone.gameobject.trigger allowtacticalinsertion(0);
	if(!isdefined(level.active_zones))
	{
		level.active_zones = [];
	}
	else if(!isarray(level.active_zones))
	{
		level.active_zones = array(level.active_zones);
	}
	level.active_zones[level.active_zones.size] = zone;
}

/*
	Name: function_86a05ad0
	Namespace: namespace_d150537f
	Checksum: 0xA0EB1A33
	Offset: 0x1430
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_86a05ad0(delay)
{
	function_785aa606(&get_first_zone);
	for(i = 0; i < level.var_a495fcf1 - 1; i++)
	{
		function_785aa606(&get_next_zone);
	}
	matchrecordroundstart();
	if(isdefined(level.var_73377ee4) && level.var_73377ee4.size > 0)
	{
		function_9695c3e3();
	}
}

/*
	Name: function_5bd81f4f
	Namespace: namespace_d150537f
	Checksum: 0x45E5F06B
	Offset: 0x1500
	Size: 0x10C
	Parameters: 0
	Flags: None
*/
function function_5bd81f4f()
{
	foreach(zone in level.active_zones)
	{
		zone.gameobject.trigger allowtacticalinsertion(1);
	}
	matchrecordroundend();
	for(i = 0; i < level.var_a495fcf1; i++)
	{
		function_785aa606(&get_next_zone);
	}
	matchrecordroundstart();
}

/*
	Name: function_fbce3808
	Namespace: namespace_d150537f
	Checksum: 0xC299D16D
	Offset: 0x1618
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_fbce3808(enabled)
{
	index = 0;
	if(enabled)
	{
		index = self.script_index;
		self.objectiveanchor clientfield::set("zone_state", 1);
	}
	else
	{
		self.objectiveanchor clientfield::set("zone_state", 0);
	}
}

/*
	Name: function_e221a1d1
	Namespace: namespace_d150537f
	Checksum: 0x81F17863
	Offset: 0x16A0
	Size: 0x1BC
	Parameters: 1
	Flags: None
*/
function function_e221a1d1(zone)
{
	zone.gameobject gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
	zone.gameobject gameobjects::set_use_time(level.capturetime);
	zone.gameobject gameobjects::set_use_text(#"hash_467145983994c6c2");
	zone.gameobject gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	zone.gameobject gameobjects::set_model_visibility(1, 1);
	zone.gameobject gameobjects::must_maintain_claim(0);
	zone.gameobject gameobjects::can_contest_claim(1);
	zone.gameobject.onuse = &function_631c3afc;
	zone.gameobject.onbeginuse = &function_b4ae9ca4;
	zone.gameobject.onenduse = &function_11e8bc02;
	zone.gameobject.ontouchuse = &function_ab09ff18;
	zone.gameobject.onupdateuserate = &function_9d7664e3;
	zone function_fbce3808(1);
}

/*
	Name: function_50a7f9ac
	Namespace: namespace_d150537f
	Checksum: 0x7088A78B
	Offset: 0x1868
	Size: 0x220
	Parameters: 1
	Flags: None
*/
function function_50a7f9ac(zone)
{
	level endon(#"game_ended", #"zone_moved");
	level.kothstarttime = gettime();
	while(true)
	{
		function_e221a1d1(zone);
		msg = undefined;
		msg = zone waittill(#"zone_captured", #"zone_destroyed");
		if(msg._notify == "zone_destroyed")
		{
			continue;
		}
		ownerteam = zone.gameobject gameobjects::get_owner_team();
		zone.gameobject gameobjects::allow_use(#"hash_161f03feaadc9b8f");
		zone.gameobject.onuse = undefined;
		zone.gameobject.onunoccupied = &function_32b7bf67;
		zone.gameobject.oncontested = &function_e4bd126f;
		zone.gameobject.onuncontested = &function_2a6caaff;
		waitresult = undefined;
		waitresult = zone waittill(#"zone_destroyed");
		if(!level.kothmode || level.zonedestroyedbytimer)
		{
			break;
		}
		thread function_7828f363(ownerteam);
		if(isdefined(waitresult.destroy_team))
		{
			zone.gameobject gameobjects::set_owner_team(waitresult.destroy_team);
		}
		else
		{
			zone.gameobject gameobjects::set_owner_team("none");
		}
	}
}

/*
	Name: function_cb0111f0
	Namespace: namespace_d150537f
	Checksum: 0x884E2941
	Offset: 0x1A90
	Size: 0x16C
	Parameters: 0
	Flags: None
*/
function function_cb0111f0()
{
	if(function_bfd92dc5())
	{
		globallogic_utils::pausetimer(1);
		level.timerpaused = 1;
		level.var_e80a117f = 1;
		luinotifyevent(#"hash_2f6b9eb577a60965", 1, 1);
		function_e947a80a();
		util::function_1c8873f6(1);
		util::function_a3f7de13(28, #"none");
		while(function_bfd92dc5())
		{
			waitframe(1);
		}
		thread globallogic::matchstarttimer(5);
		wait(5);
		globallogic_utils::resumetimer();
		level.timerpaused = 0;
		level.var_e80a117f = 0;
		luinotifyevent(#"hash_2f6b9eb577a60965", 1, 0);
		function_d533e53d();
		util::function_1c8873f6(0);
	}
}

/*
	Name: function_ee725386
	Namespace: namespace_d150537f
	Checksum: 0xE566FC1A
	Offset: 0x1C08
	Size: 0xB50
	Parameters: 0
	Flags: None
*/
function function_ee725386()
{
	level endon(#"game_ended");
	function_86a05ad0();
	while(level.inprematchperiod)
	{
		waitframe(1);
	}
	pause_time();
	wait(5);
	luinotifyevent(#"hash_12fdd5eec28f50ae");
	foreach(zone in level.zones)
	{
		if(isdefined(zone.target))
		{
			othervisuals = getentarray(zone.target, "targetname");
			foreach(visual in othervisuals)
			{
				visual clientfield::set("zone_id", zone.script_index);
			}
		}
		zone.objectiveanchor clientfield::set("zone_id", zone.script_index);
		zone.objectiveanchor clientfield::set("zone_state", 0);
	}
	waitframe(1);
	setbombtimer("A", 0);
	setmatchflag("bomb_timer_a", 0);
	while(true)
	{
		if(util::function_7f7a77ab())
		{
			function_cb0111f0();
		}
		resume_time();
		sound::play_on_players("mp_suitcase_pickup");
		globallogic_audio::leader_dialog("kothLocated", undefined, "gamemode_objective", undefined, "kothActiveDialogBuffer");
		foreach(zone in level.active_zones)
		{
			zone.gameobject gameobjects::set_model_visibility(1, 1);
		}
		if(level.zonespawntime)
		{
			foreach(zone in level.active_zones)
			{
				zone.gameobject gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
				zone.gameobject gameobjects::set_flags(1);
			}
			setmatchflag("bomb_timer_a", 1);
			setbombtimer("A", int((gettime() + 1000) + (int(level.zonespawntime * 1000))));
			wait(level.zonespawntime);
			foreach(zone in level.active_zones)
			{
				zone.gameobject gameobjects::set_flags(0);
			}
			globallogic_audio::leader_dialog("kothOnline", undefined, "gamemode_objective", undefined, "kothActiveDialogBuffer");
		}
		setmatchflag("bomb_timer_a", 0);
		waittillframeend();
		sound::play_on_players("mpl_hq_cap_us");
		util::function_a3f7de13(6, #"none");
		foreach(zone in level.active_zones)
		{
			zone.gameobject gameobjects::enable_object();
			function_18fbab10(zone.gameobject.objectiveid, #"hash_3f7d871e78c8264f");
			objective_onentity(zone.gameobject.objectiveid, zone.objectiveanchor);
			zone.gameobject.capturecount = 0;
		}
		thread function_899cf0b8();
		if(level.zoneautomovetime)
		{
			thread function_4a415293(level.zoneautomovetime);
			setmatchflag("bomb_timer_a", 1);
			setbombtimer("A", int((gettime() + 1000) + (int(level.zoneautomovetime * 1000))));
		}
		else
		{
			level.zonedestroyedbytimer = 0;
		}
		foreach(active_zone in level.active_zones)
		{
			thread function_50a7f9ac(active_zone);
		}
		level waittill(#"zone_moved");
		var_2db50872 = [];
		foreach(zone in level.active_zones)
		{
			if(!isdefined(var_2db50872))
			{
				var_2db50872 = [];
			}
			else if(!isarray(var_2db50872))
			{
				var_2db50872 = array(var_2db50872);
			}
			var_2db50872[var_2db50872.size] = zone.gameobject gameobjects::get_owner_team();
		}
		pause_time();
		foreach(zone in level.active_zones)
		{
			zone enable_influencers(0);
			zone.gameobject.lastcaptureteam = undefined;
			zone.gameobject gameobjects::disable_object();
			zone.gameobject gameobjects::allow_use(#"hash_161f03feaadc9b8f");
			zone.gameobject gameobjects::set_owner_team(#"neutral");
			zone.gameobject gameobjects::set_model_visibility(0, 1);
			zone.gameobject gameobjects::must_maintain_claim(0);
			zone function_fbce3808(0);
		}
		level notify(#"zone_reset");
		setmatchflag("bomb_timer_a", 0);
		level.active_zones = [];
		function_5bd81f4f();
		wait(0.5);
		foreach(team in var_2db50872)
		{
			thread function_7828f363(team);
		}
		wait(0.5);
		if(isdefined(level.var_73377ee4) && level.var_73377ee4.size > 0)
		{
			function_9695c3e3();
		}
	}
}

/*
	Name: function_899cf0b8
	Namespace: namespace_d150537f
	Checksum: 0xE4A74B22
	Offset: 0x2760
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_899cf0b8()
{
	wait(0.1);
	luinotifyevent(#"hash_12fdd5eec28f50ae");
}

/*
	Name: function_7828f363
	Namespace: namespace_d150537f
	Checksum: 0xB8AA7CDA
	Offset: 0x2798
	Size: 0x98
	Parameters: 1
	Flags: None
*/
function function_7828f363(team)
{
	players = level.players;
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(!isdefined(player))
		{
			continue;
		}
		if(player.pers[#"team"] == team)
		{
			player notify(#"force_spawn");
			wait(0.1);
		}
	}
}

/*
	Name: is_zone_contested
	Namespace: namespace_d150537f
	Checksum: 0x199DCE6D
	Offset: 0x2838
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private is_zone_contested(gameobject)
{
	if(gameobject gameobjects::get_num_touching(game.attackers) > 0 && gameobject gameobjects::get_num_touching(game.defenders) > 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_9d7664e3
	Namespace: namespace_d150537f
	Checksum: 0xA38A7298
	Offset: 0x28A8
	Size: 0x1FE
	Parameters: 0
	Flags: None
*/
function function_9d7664e3()
{
	if(!isdefined(self.iscontested))
	{
		self.iscontested = 0;
		self.var_464f0169 = 0;
	}
	self.iscontested = is_zone_contested(self);
	if(self.iscontested)
	{
		if(!self.var_464f0169)
		{
			foreach(user in self.users)
			{
				if(!isdefined(user.touching.players))
				{
					continue;
				}
				foreach(struct in user.touching.players)
				{
					if(!isdefined(struct))
					{
						continue;
					}
					player = struct.player;
					if(isdefined(player) && isplayer(player) && (isdefined(player.var_c8d27c06) ? player.var_c8d27c06 : 0) < gettime())
					{
						player playsoundtoplayer(#"hash_5daa27b37c13bc01", player);
						player.var_c8d27c06 = gettime() + 5000;
					}
				}
			}
		}
	}
}

/*
	Name: function_ab09ff18
	Namespace: namespace_d150537f
	Checksum: 0x1229E23D
	Offset: 0x2AB0
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_ab09ff18(sentient)
{
	if(isplayer(sentient))
	{
		self.var_464f0169 = self.iscontested;
		if(is_zone_contested(self))
		{
			if((isdefined(sentient.var_c8d27c06) ? sentient.var_c8d27c06 : 0) < gettime())
			{
				sentient playsoundtoplayer(#"hash_5daa27b37c13bc01", sentient);
				sentient.var_c8d27c06 = gettime() + 5000;
			}
		}
		else if(sentient.team !== self gameobjects::get_owner_team())
		{
			battlechatter::function_98898d14(sentient, self);
		}
	}
}

/*
	Name: function_b4ae9ca4
	Namespace: namespace_d150537f
	Checksum: 0xCBFB082B
	Offset: 0x2BA0
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function function_b4ae9ca4(sentient)
{
}

/*
	Name: function_11e8bc02
	Namespace: namespace_d150537f
	Checksum: 0x8F0D70AF
	Offset: 0x2BB8
	Size: 0x70
	Parameters: 3
	Flags: None
*/
function function_11e8bc02(team, sentient, success)
{
	if(!isdefined(success))
	{
		return;
	}
	player = success;
	if(!isplayer(player))
	{
		player = success.owner;
	}
	player notify(#"event_ended");
}

/*
	Name: function_631c3afc
	Namespace: namespace_d150537f
	Checksum: 0x29103B8A
	Offset: 0x2C30
	Size: 0x498
	Parameters: 1
	Flags: None
*/
function function_631c3afc(sentient)
{
	player = sentient;
	if(!isplayer(player))
	{
		player = sentient.owner;
	}
	capture_team = player.team;
	capturetime = gettime();
	/#
		print("");
	#/
	pause_time();
	string = #"hash_446b7b0b3e4df72e";
	zone = self.zone;
	/#
		assert(isdefined(zone));
	#/
	self.iscontested = 0;
	spawning::function_7a87efaa();
	if(!isdefined(self.lastcaptureteam) || self.lastcaptureteam != capture_team)
	{
		touchlist = arraycopy(self.users[capture_team].touching.players);
		self thread give_capture_credit(touchlist, string, capturetime, capture_team, self.lastcaptureteam);
	}
	self.kothcapteam = capture_team;
	self gameobjects::set_owner_team(capture_team);
	if(!level.kothmode)
	{
		self gameobjects::set_use_time(level.destroytime);
	}
	foreach(team, _ in level.teams)
	{
		if(team == capture_team)
		{
			if(!isdefined(self.lastcaptureteam) || self.lastcaptureteam != team)
			{
				globallogic_audio::leader_dialog("kothSecured", team, "gamemode_objective", undefined, "kothActiveDialogBuffer");
				foreach(player in level.players)
				{
					if(player.pers[#"team"] == team)
					{
						if(player.lastkilltime + 500 > gettime())
						{
							player challenges::killedlastcontester();
						}
					}
				}
			}
			thread sound::play_on_players(game.objective_gained_sound, team);
			continue;
		}
		if(!isdefined(self.lastcaptureteam))
		{
			globallogic_audio::leader_dialog("kothCaptured", team, "gamemode_objective", undefined, "kothActiveDialogBuffer");
		}
		else if(self.lastcaptureteam == team)
		{
			globallogic_audio::leader_dialog("kothLost", team, "gamemode_objective", undefined, "kothActiveDialogBuffer");
		}
		thread sound::play_on_players(game.objective_lost_sound, team);
	}
	zone thread award_capture_points(capture_team, self.lastcaptureteam);
	self.capturecount++;
	self.lastcaptureteam = capture_team;
	self gameobjects::must_maintain_claim(1);
	zone notify(#"zone_captured");
	zone notify("zone_captured" + capture_team);
	player notify(#"event_ended");
}

/*
	Name: track_capture_time
	Namespace: namespace_d150537f
	Checksum: 0x80F724D1
	Offset: 0x30D0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function track_capture_time()
{
}

/*
	Name: give_capture_credit
	Namespace: namespace_d150537f
	Checksum: 0xBBBEF36D
	Offset: 0x30E0
	Size: 0x4D8
	Parameters: 5
	Flags: None
*/
function give_capture_credit(touchlist, string, capturetime, capture_team, lastcaptureteam)
{
	waitframe(1);
	util::waittillslowprocessallowed();
	foreach(touch in touchlist)
	{
		player = gameobjects::function_73944efe(touchlist, touch);
		if(!isdefined(player))
		{
			continue;
		}
		player update_caps_per_minute(lastcaptureteam);
		if(!is_score_boosting(player))
		{
			challenges::function_783313d8(player);
			player challenges::capturedobjective(capturetime, self.trigger);
			if((level.kothstarttime + 3000) > capturetime && self.kothcapteam == capture_team)
			{
				scoreevents::processscoreevent(#"quickly_secure_point", player, undefined, undefined);
				player stats::function_dad108fa(#"hash_60545a50ce7c9791", 1);
				player stats::function_cc215323(#"hash_2c800d9270aea253", 1);
			}
			scoreevents::processscoreevent(#"koth_secure", player, undefined, undefined);
			player recordgameevent("capture");
			level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"capture", #player:player});
			player recordgameevent("hardpoint_captured");
			level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"hardpoint_captured", #player:player});
			battlechatter::function_924699f4(player, self);
			level thread popups::displayteammessagetoall(string, player);
			if(isdefined(player.pers[#"captures"]))
			{
				player.pers[#"captures"]++;
				player.captures = player.pers[#"captures"];
			}
			player.pers[#"objectives"]++;
			player.objectives = player.pers[#"objectives"];
			if(level.kothstarttime + 500 > capturetime)
			{
				player challenges::immediatecapture();
			}
			demo::bookmark(#"event", gettime(), player);
			potm::bookmark(#"event", gettime(), player);
			player stats::function_bb7eedf0(#"captures", 1);
			player stats::function_bb7eedf0(#"hash_2f1df496791a2f5f", 1);
			player contracts::function_a54e2068(#"hash_4fa0008b60deaab4");
			continue;
		}
		/#
			player iprintlnbold("");
		#/
	}
}

/*
	Name: function_32b7bf67
	Namespace: namespace_d150537f
	Checksum: 0x14584B0C
	Offset: 0x35C0
	Size: 0xBE
	Parameters: 0
	Flags: None
*/
function function_32b7bf67()
{
	self.zone notify(#"zone_destroyed");
	self.kothcapteam = #"neutral";
	self.wasleftunoccupied = 1;
	self.iscontested = 0;
	self recordgameeventnonplayer("hardpoint_empty");
	level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"capture"});
	resume_time();
	self.mustmaintainclaim = 0;
}

/*
	Name: function_e4bd126f
	Namespace: namespace_d150537f
	Checksum: 0x235C3393
	Offset: 0x3688
	Size: 0x198
	Parameters: 0
	Flags: None
*/
function function_e4bd126f()
{
	zoneowningteam = self gameobjects::get_owner_team();
	self.wascontested = 1;
	self.iscontested = 1;
	self recordgameeventnonplayer("hardpoint_contested");
	level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"hardpoint_contested"});
	resume_time();
	util::function_a3f7de13(8, #"none");
	foreach(team, _ in level.teams)
	{
		if(team == zoneowningteam)
		{
			thread sound::play_on_players(game.objective_contested_sound, team);
			globallogic_audio::leader_dialog("kothContested", team, "gamemode_objective", undefined, "kothActiveDialogBuffer");
		}
	}
}

/*
	Name: function_2a6caaff
	Namespace: namespace_d150537f
	Checksum: 0x24CEC878
	Offset: 0x3828
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_2a6caaff(lastclaimteam)
{
	/#
		assert(lastclaimteam == self gameobjects::get_owner_team());
	#/
	self.iscontested = 0;
	pause_time();
	self gameobjects::set_claim_team(lastclaimteam);
	self recordgameeventnonplayer("hardpoint_uncontested");
	level notify(#"hardpoint_uncontested");
	level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"hardpoint_uncontested"});
}

/*
	Name: function_4a415293
	Namespace: namespace_d150537f
	Checksum: 0xEE889331
	Offset: 0x3920
	Size: 0x390
	Parameters: 1
	Flags: None
*/
function function_4a415293(time)
{
	level endon(#"game_ended", #"zone_reset");
	level.zonemovetime = gettime() + (int(time * 1000));
	level.zonedestroyedbytimer = 0;
	if(isdefined(level.var_73377ee4) && level.var_73377ee4.size > 0)
	{
		if(level.shownextzoneobjective == 31)
		{
			level.shownextzoneobjective = time;
		}
		var_f03a7dfd = time - level.shownextzoneobjective;
		if(var_f03a7dfd <= 0)
		{
			function_9f81bb75();
			wait(time);
		}
		else
		{
			if(var_f03a7dfd >= time)
			{
				wait(time);
			}
			else
			{
				wait(var_f03a7dfd);
				function_9f81bb75();
				wait(level.shownextzoneobjective);
			}
		}
	}
	else
	{
		wait(time);
	}
	if(is_true(level.overtime))
	{
		return;
	}
	level.zonedestroyedbytimer = 1;
	foreach(zone in level.active_zones)
	{
		if(!isdefined(zone.gameobject.wascontested) || zone.gameobject.wascontested == 0)
		{
			if(!isdefined(zone.gameobject.wasleftunoccupied) || zone.gameobject.wasleftunoccupied == 0)
			{
				zoneowningteam = zone.gameobject gameobjects::get_owner_team();
				challenges::controlzoneentirely(zoneowningteam);
			}
		}
		zone.gameobject recordgameeventnonplayer("hardpoint_moved");
	}
	level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"hardpoint_moved"});
	playsoundatposition(#"hash_492b7638b1c9781a", (0, 0, 0));
	foreach(zone in level.active_zones)
	{
		zone.gameobject.onuse = undefined;
	}
	level notify(#"zone_moved");
}

/*
	Name: function_a84bac48
	Namespace: namespace_d150537f
	Checksum: 0xB02D2D25
	Offset: 0x3CB8
	Size: 0x32C
	Parameters: 1
	Flags: None
*/
function function_a84bac48(team)
{
	score = 1;
	if(level.scoreperplayer)
	{
		score = self.gameobject gameobjects::get_num_touching(team);
	}
	globallogic_score::giveteamscoreforobjective(team, score);
	foreach(player in function_a1ef346b(team))
	{
		if(!isdefined(player.touchtriggers[self.gameobject.entnum]))
		{
			continue;
		}
		if(isdefined(player.pers[#"objtime"]))
		{
			player.pers[#"objtime"]++;
			player.objtime = player.pers[#"objtime"];
			if((player.pers[#"objtime"] % 60) == 0)
			{
				player contracts::function_a54e2068(#"hash_92db988270f4f67");
			}
		}
		var_998771f0 = "hardpoint" + self.script_index;
		if(!isdefined(player.pers[var_998771f0]))
		{
			player.pers[var_998771f0] = 0;
		}
		player.pers[var_998771f0]++;
		player function_ef823e71(3, player.pers[var_998771f0], self.script_index - 1);
		player stats::function_bb7eedf0(#"objective_time", 1);
		player globallogic_score::incpersstat(#"objectivetime", 1, 0, 1);
		player function_ef823e71(2, player.pers[#"objtime"]);
		if(!isdefined(player.var_592f3e3c[self.script_index]))
		{
			player.var_592f3e3c[self.script_index] = gettime();
			continue;
		}
		if(player.var_592f3e3c[self.script_index] <= (gettime() - 5000))
		{
			player scoreevents::processscoreevent(#"hash_58b63cf172d29d0", player);
			player.var_592f3e3c[self.script_index] = gettime();
		}
	}
}

/*
	Name: award_capture_points
	Namespace: namespace_d150537f
	Checksum: 0x33AC7610
	Offset: 0x3FF0
	Size: 0x3D0
	Parameters: 2
	Flags: None
*/
function award_capture_points(team, lastcaptureteam)
{
	level endon(#"game_ended", #"zone_reset", #"zone_moved");
	self endon(#"zone_destroyed");
	level notify("award_capture_pointsRunning" + self.script_index);
	level endon("award_capture_pointsRunning" + self.script_index);
	foreach(player in level.players)
	{
		if(!isdefined(player.var_592f3e3c))
		{
			player.var_592f3e3c = [];
		}
		player.var_592f3e3c[self.script_index] = undefined;
	}
	if(level.active_zones.size > 1)
	{
		time = gettime();
		sync_time = 0;
		foreach(zone in level.active_zones)
		{
			if(isdefined(zone.var_72767cc4) && (time - zone.var_72767cc4) < 1000)
			{
				wait((float(1000 - (time - zone.var_72767cc4))) / 1000);
				break;
			}
		}
	}
	seconds = 1;
	while(!level.gameended)
	{
		self.var_72767cc4 = gettime();
		wait(seconds);
		hostmigration::waittillhostmigrationdone();
		if(level.var_5e8ffd3b)
		{
			var_95e19dc6 = self.gameobject gameobjects::function_e4cad37();
			if(var_95e19dc6.size > 0)
			{
				level.kothtotalsecondsinzone++;
				foreach(var_215dac08 in var_95e19dc6)
				{
					self function_a84bac48(var_215dac08);
				}
			}
		}
		else if(!self.gameobject.iscontested)
		{
			level.kothtotalsecondsinzone++;
			self function_a84bac48(lastcaptureteam);
			if(is_true(level.overtime) && isdefined(outcome::function_6d0354e3()))
			{
				round::function_870759fb();
				thread globallogic::end_round(2);
			}
		}
	}
}

/*
	Name: function_3c70f13f
	Namespace: namespace_d150537f
	Checksum: 0x9FEDE476
	Offset: 0x43C8
	Size: 0xE8
	Parameters: 2
	Flags: None
*/
function function_3c70f13f(zone_a, zone_b)
{
	script_index_a = zone_a.script_index;
	script_index_b = zone_b.script_index;
	if(!isdefined(script_index_a) && !isdefined(script_index_b))
	{
		return false;
	}
	if(!isdefined(script_index_a) && isdefined(script_index_b))
	{
		/#
			println("" + zone_a.origin);
		#/
		return true;
	}
	if(isdefined(script_index_a) && !isdefined(script_index_b))
	{
		/#
			println("" + zone_b.origin);
		#/
		return false;
	}
	if(script_index_a > script_index_b)
	{
		return true;
	}
	return false;
}

/*
	Name: get_zone_array
	Namespace: namespace_d150537f
	Checksum: 0x5B275633
	Offset: 0x44B8
	Size: 0x104
	Parameters: 0
	Flags: None
*/
function get_zone_array()
{
	zones = getentarray("koth_zone_center", "targetname");
	if(!isdefined(zones))
	{
		return undefined;
	}
	swapped = 1;
	n = zones.size;
	while(swapped)
	{
		swapped = 0;
		for(i = 0; i < n - 1; i++)
		{
			if(function_3c70f13f(zones[i], zones[i + 1]))
			{
				temp = zones[i];
				zones[i] = zones[i + 1];
				zones[i + 1] = temp;
				swapped = 1;
			}
		}
		n--;
	}
	return zones;
}

/*
	Name: setup_zones
	Namespace: namespace_d150537f
	Checksum: 0x72279A12
	Offset: 0x45C8
	Size: 0x598
	Parameters: 0
	Flags: None
*/
function setup_zones()
{
	zones = get_zone_array();
	if(zones.size == 0)
	{
		globallogic_utils::add_map_error("No zones found for KOTH in map " + util::function_53bbf9d2());
	}
	trigs = getentarray("koth_zone_trigger", "targetname");
	var_4cb5e04 = getentarray("koth_zone_trigger", "script_noteworthy");
	trigs = arraycombine(trigs, var_4cb5e04);
	/#
		assert(zones.size == trigs.size, "");
	#/
	for(i = 0; i < zones.size; i++)
	{
		errored = 0;
		zone = zones[i];
		zone.trig = undefined;
		for(j = 0; j < trigs.size; j++)
		{
			if(zone istouching(trigs[j]))
			{
				if(isdefined(zone.trig))
				{
					globallogic_utils::add_map_error(("Zone at " + zone.origin) + " is touching more than one \"zonetrigger\" trigger");
					errored = 1;
					break;
				}
				zone.trig = trigs[j];
				zone.var_b76aa8 = j;
				zone.trig trigger::add_flags(16);
				break;
			}
		}
		if(!isdefined(zone.trig))
		{
			if(!errored)
			{
				globallogic_utils::add_map_error(("Zone at " + zone.origin) + " is not inside any \"zonetrigger\" trigger");
				continue;
			}
		}
		/#
			assert(!errored);
		#/
		zone.trigorigin = zone.trig.origin;
		zone.objectiveanchor = spawn("script_model", zone.origin);
		visuals = [];
		visuals[0] = zone;
		if(isdefined(zone.target))
		{
			othervisuals = getentarray(zone.target, "targetname");
			for(j = 0; j < othervisuals.size; j++)
			{
				visuals[visuals.size] = othervisuals[j];
			}
		}
		zone.gameobject = gameobjects::create_use_object(#"neutral", zone.trig, visuals, (0, 0, 0), #"hardpoint");
		zone.gameobject gameobjects::set_objective_entity(zone);
		zone.gameobject gameobjects::disable_object();
		zone.gameobject gameobjects::set_model_visibility(0, 1);
		zone.gameobject.zone = zone;
		zone.trig.useobj = zone.gameobject;
		zone function_3098a12f();
	}
	if(is_true(level.shownextzoneobjective))
	{
		level.var_e89ee661 = 0;
		level.var_73377ee4 = [];
		for(i = 0; i < level.var_a495fcf1; i++)
		{
			obj_id = gameobjects::get_next_obj_id();
			objective_add(obj_id, "invisible", undefined, #"hash_6b3b9caf849099d6");
			function_18fbab10(obj_id, #"hash_1ff7adbf21cf79eb");
			if(!isdefined(level.var_73377ee4))
			{
				level.var_73377ee4 = [];
			}
			else if(!isarray(level.var_73377ee4))
			{
				level.var_73377ee4 = array(level.var_73377ee4);
			}
			level.var_73377ee4[level.var_73377ee4.size] = obj_id;
		}
	}
	if(globallogic_utils::print_map_errors())
	{
		return false;
	}
	level.zones = zones;
	level.prevzone = undefined;
	level.prevzone2 = undefined;
	setup_zone_exclusions();
	return true;
}

/*
	Name: setup_zone_exclusions
	Namespace: namespace_d150537f
	Checksum: 0x254603E4
	Offset: 0x4B68
	Size: 0x1B8
	Parameters: 0
	Flags: None
*/
function setup_zone_exclusions()
{
	if(!isdefined(level.levelkothdisable))
	{
		return;
	}
	foreach(nullzone in level.levelkothdisable)
	{
		mindist = 1410065408;
		foundzone = undefined;
		foreach(zone in level.zones)
		{
			distance = distancesquared(nullzone.origin, zone.origin);
			if(distance < mindist)
			{
				foundzone = zone;
				mindist = distance;
			}
		}
		if(isdefined(foundzone))
		{
			if(!isdefined(foundzone.gameobject.exclusions))
			{
				foundzone.gameobject.exclusions = [];
			}
			foundzone.gameobject.exclusions[foundzone.gameobject.exclusions.size] = nullzone;
		}
	}
}

/*
	Name: function_ac4c0c88
	Namespace: namespace_d150537f
	Checksum: 0xBE1D0678
	Offset: 0x4D28
	Size: 0xC2
	Parameters: 2
	Flags: None
*/
function function_ac4c0c88(var_6075f900, count)
{
	if(!isdefined(count))
	{
		count = 1;
	}
	if(var_6075f900)
	{
		/#
			assert(count == 1);
		#/
		if(level.zonespawnqueue.size == 0)
		{
			function_d04e9e07();
		}
		/#
			assert(level.zonespawnqueue.size > 0);
		#/
		return 0;
	}
	return (level.prevzoneindex + count) % level.zones.size;
}

/*
	Name: get_first_zone
	Namespace: namespace_d150537f
	Checksum: 0x2799FD33
	Offset: 0x4DF8
	Size: 0x80
	Parameters: 0
	Flags: None
*/
function get_first_zone()
{
	zone = level.zones[0];
	level.prevzone2 = level.prevzone;
	level.prevzone = zone;
	level.prevzoneindex = 0;
	function_d04e9e07();
	arrayremovevalue(level.zonespawnqueue, zone);
	return zone;
}

/*
	Name: get_next_zone
	Namespace: namespace_d150537f
	Checksum: 0x503A637A
	Offset: 0x4E80
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function get_next_zone()
{
	nextzoneindex = function_ac4c0c88(0);
	zone = level.zones[nextzoneindex];
	level.prevzone2 = level.prevzone;
	level.prevzone = zone;
	level.prevzoneindex = nextzoneindex;
	return zone;
}

/*
	Name: function_a65ee551
	Namespace: namespace_d150537f
	Checksum: 0xF38A270
	Offset: 0x4F00
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_a65ee551()
{
	level.prevzoneindex = randomint(level.zones.size);
	zone = level.zones[level.prevzoneindex];
	level.prevzone2 = level.prevzone;
	level.prevzone = zone;
	return zone;
}

/*
	Name: function_7c9bf7e1
	Namespace: namespace_d150537f
	Checksum: 0x279F8922
	Offset: 0x4F80
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function function_7c9bf7e1(zone)
{
	foreach(active_zone in level.active_zones)
	{
		if(zone == active_zone)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_d04e9e07
	Namespace: namespace_d150537f
	Checksum: 0xC4D9C110
	Offset: 0x5018
	Size: 0x12A
	Parameters: 0
	Flags: None
*/
function function_d04e9e07()
{
	level.zonespawnqueue = [];
	spawnqueue = arraycopy(level.zones);
	for(total_left = spawnqueue.size; total_left > 0; total_left--)
	{
		index = randomint(total_left);
		valid_zones = 0;
		for(zone = 0; zone < level.zones.size; zone++)
		{
			if(!isdefined(spawnqueue[zone]))
			{
				continue;
			}
			if(valid_zones == index)
			{
				if(level.zonespawnqueue.size == 0 && function_7c9bf7e1(spawnqueue[zone]))
				{
					continue;
				}
				level.zonespawnqueue[level.zonespawnqueue.size] = spawnqueue[zone];
				spawnqueue[zone] = undefined;
				break;
			}
			valid_zones++;
		}
	}
}

/*
	Name: function_1949044f
	Namespace: namespace_d150537f
	Checksum: 0xBCD4023F
	Offset: 0x5150
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_1949044f()
{
	nextzoneindex = function_ac4c0c88(1);
	next_zone = level.zonespawnqueue[nextzoneindex];
	arrayremoveindex(level.zonespawnqueue, nextzoneindex);
	level.prevzone2 = level.prevzone;
	level.prevzone = next_zone;
	level.prevzoneindex = nextzoneindex;
	return next_zone;
}

/*
	Name: function_2ff26e21
	Namespace: namespace_d150537f
	Checksum: 0xB12A9C54
	Offset: 0x51F0
	Size: 0xA2
	Parameters: 0
	Flags: None
*/
function function_2ff26e21()
{
	foreach(active_zone in level.active_zones)
	{
		if(self istouching(active_zone.trig))
		{
			return active_zone;
		}
	}
	return undefined;
}

/*
	Name: function_610d3790
	Namespace: namespace_d150537f
	Checksum: 0xC6DD0201
	Offset: 0x52A0
	Size: 0xD14
	Parameters: 4
	Flags: None
*/
function function_610d3790(einflictor, victim, idamage, weapon)
{
	attacker = self;
	if(!isplayer(attacker) || (level.capturetime && !idamage.touchtriggers.size && !attacker.touchtriggers.size) || attacker.pers[#"team"] == idamage.pers[#"team"])
	{
		return;
	}
	if(isdefined(weapon) && isdefined(level.iskillstreakweapon))
	{
		if([[level.iskillstreakweapon]](weapon) || (isdefined(weapon.statname) && [[level.iskillstreakweapon]](getweapon(weapon.statname))))
		{
			var_629fbd5c = 1;
		}
	}
	medalgiven = 0;
	scoreeventprocessed = 0;
	var_1cfdf798 = (isdefined(idamage.lastattacker) ? idamage.lastattacker === attacker : 0);
	ownerteam = undefined;
	if(level.capturetime == 0)
	{
		if(level.active_zones.size == 0)
		{
			return;
		}
		var_56bf37df = 0;
		foreach(zone in level.active_zones)
		{
			ownerteam = zone.gameobject gameobjects::get_owner_team();
			if(isdefined(ownerteam) && ownerteam != #"neutral")
			{
				var_56bf37df = 1;
				break;
			}
		}
		if(!var_56bf37df)
		{
			return;
		}
	}
	zone = idamage function_2ff26e21();
	if(isdefined(zone) && (idamage.touchtriggers.size || level.capturetime == 0))
	{
		if(level.capturetime > 0)
		{
			triggerids = getarraykeys(idamage.touchtriggers);
			ownerteam = idamage.touchtriggers[triggerids[0]].useobj gameobjects::get_owner_team();
		}
		if(ownerteam != #"neutral")
		{
			attacker.prevlastkilltime = attacker.lastkilltime;
			attacker.lastkilltime = gettime();
			team = attacker.pers[#"team"];
			if(team == ownerteam)
			{
				if(!medalgiven)
				{
					if(var_1cfdf798)
					{
						attacker medals::offenseglobalcount();
						attacker thread challenges::killedbaseoffender(zone.trig, weapon, victim);
					}
					attacker challenges::function_2f462ffd(idamage, weapon, victim, zone.gameobject);
					attacker.pers[#"objectiveekia"]++;
					attacker.objectiveekia = attacker.pers[#"objectiveekia"];
					attacker.pers[#"objectives"]++;
					attacker.objectives = attacker.pers[#"objectives"];
					medalgiven = 1;
				}
				if(var_1cfdf798)
				{
					if(!is_true(var_629fbd5c))
					{
						scoreevents::function_2a2e1723(#"hardpoint_kill", attacker, idamage, weapon);
					}
					level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"defending", #player:idamage});
				}
				scoreeventprocessed = 1;
			}
			else
			{
				if(!medalgiven)
				{
					if(var_1cfdf798)
					{
						if(isdefined(attacker.pers[#"defends"]))
						{
							attacker.pers[#"defends"]++;
							attacker.defends = attacker.pers[#"defends"];
						}
						attacker medals::defenseglobalcount();
						attacker thread challenges::killedbasedefender(zone.trig);
						attacker recordgameevent("defending");
						level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"defending", #player:attacker});
					}
					attacker challenges::function_2f462ffd(idamage, weapon, victim, zone.gameobject);
					attacker.pers[#"objectiveekia"]++;
					attacker.objectiveekia = attacker.pers[#"objectiveekia"];
					attacker.pers[#"objectives"]++;
					attacker.objectives = attacker.pers[#"objectives"];
					medalgiven = 1;
				}
				if(var_1cfdf798)
				{
					attacker challenges::killedzoneattacker(weapon);
					if(!is_true(var_629fbd5c))
					{
						scoreevents::function_2a2e1723(#"hardpoint_kill", attacker, idamage, weapon);
					}
				}
				scoreeventprocessed = 1;
				level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"assaulting", #player:idamage});
			}
		}
	}
	if(isdefined(zone))
	{
		if(isdefined(attacker) && isdefined(victim) && victim != attacker)
		{
			var_7901de48 = (distance2dsquared(zone.trig.maxs, zone.trig.mins) * 0.5) + sqr(350);
			dist = distance2dsquared(victim.origin, zone.origin);
			if(dist > var_7901de48)
			{
				return;
			}
		}
	}
	zone = attacker function_2ff26e21();
	if(isdefined(zone) && (attacker.touchtriggers.size || level.capturetime == 0))
	{
		if(level.capturetime > 0)
		{
			triggerids = getarraykeys(attacker.touchtriggers);
			ownerteam = attacker.touchtriggers[triggerids[0]].useobj gameobjects::get_owner_team();
		}
		if(ownerteam != #"neutral")
		{
			team = idamage.pers[#"team"];
			if(team == ownerteam)
			{
				if(!medalgiven)
				{
					if(isdefined(attacker.pers[#"defends"]))
					{
						attacker.pers[#"defends"]++;
						attacker.defends = attacker.pers[#"defends"];
					}
					if(var_1cfdf798)
					{
						attacker medals::defenseglobalcount();
						attacker thread challenges::killedbasedefender(zone.trig);
						attacker recordgameevent("defending");
						level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"defending", #player:attacker});
					}
					medalgiven = 1;
				}
				if(scoreeventprocessed == 0)
				{
					if(var_1cfdf798)
					{
						attacker challenges::killedzoneattacker(weapon);
						if(!is_true(var_629fbd5c))
						{
							scoreevents::function_2a2e1723(#"hardpoint_kill", attacker, idamage, weapon);
						}
						level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"assaulting", #player:idamage});
					}
					attacker challenges::function_2f462ffd(idamage, weapon, victim, zone.gameobject);
					attacker.pers[#"objectiveekia"]++;
					attacker.objectiveekia = attacker.pers[#"objectiveekia"];
					attacker.pers[#"objectives"]++;
					attacker.objectives = attacker.pers[#"objectives"];
				}
			}
			else
			{
				if(!medalgiven && var_1cfdf798)
				{
					attacker medals::offenseglobalcount();
					medalgiven = 1;
					attacker thread challenges::killedbaseoffender(zone.trig, weapon, victim);
				}
				if(scoreeventprocessed == 0)
				{
					if(var_1cfdf798)
					{
						if(!is_true(var_629fbd5c))
						{
							scoreevents::function_2a2e1723(#"hardpoint_kill", attacker, idamage, weapon);
						}
						level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"defending", #player:idamage});
					}
					attacker challenges::function_2f462ffd(idamage, weapon, victim, zone.gameobject);
					attacker.pers[#"objectiveekia"]++;
					attacker.objectiveekia = attacker.pers[#"objectiveekia"];
					attacker.pers[#"objectives"]++;
					attacker.objectives = attacker.pers[#"objectives"];
				}
			}
		}
	}
	if(var_1cfdf798 && scoreeventprocessed === 1)
	{
		attacker challenges::function_82bb78f7(weapon, idamage);
	}
}

/*
	Name: enable_influencers
	Namespace: namespace_d150537f
	Checksum: 0x3BFE12AF
	Offset: 0x5FC0
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function enable_influencers(enabled)
{
	if(is_true(level.var_3d984b4c))
	{
		enableinfluencer(self.influencer_large, enabled);
		enableinfluencer(self.influencer_small, enabled);
	}
}

/*
	Name: function_3098a12f
	Namespace: namespace_d150537f
	Checksum: 0x8F0362AE
	Offset: 0x6028
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_3098a12f()
{
	if(!is_true(level.var_3d984b4c))
	{
		return;
	}
	self.influencer_large = self influencers::create_influencer("koth_large", self.gameobject.curorigin, 0);
	self.influencer_small = influencers::create_influencer("koth_small", self.gameobject.curorigin, 0);
	self enable_influencers(0);
	if((isdefined(self.var_caa7270c) ? self.var_caa7270c : 0) > 0)
	{
		function_2e07e8f9(self.influencer_small, self.var_caa7270c);
	}
	if((isdefined(self.var_aa2f147a) ? self.var_aa2f147a : 0) > 0)
	{
		function_2e07e8f9(self.influencer_large, self.var_aa2f147a);
	}
}

/*
	Name: update_caps_per_minute
	Namespace: namespace_d150537f
	Checksum: 0x70D7EEB2
	Offset: 0x6150
	Size: 0x146
	Parameters: 1
	Flags: None
*/
function update_caps_per_minute(lastownerteam)
{
	if(!isdefined(self.capsperminute))
	{
		self.numcaps = 0;
		self.capsperminute = 0;
	}
	if(!isdefined(lastownerteam) || lastownerteam == #"neutral")
	{
		return;
	}
	self.numcaps++;
	minutespassed = float(globallogic_utils::gettimepassed()) / 60000;
	if(isplayer(self) && isdefined(self.timeplayed[#"total"]))
	{
		minutespassed = self.timeplayed[#"total"] / 60;
	}
	if(minutespassed <= 0)
	{
		self.capsperminute = self.numcaps;
		return;
	}
	self.capsperminute = self.numcaps / minutespassed;
	if(self.capsperminute > self.numcaps)
	{
		self.capsperminute = self.numcaps;
	}
}

/*
	Name: is_score_boosting
	Namespace: namespace_d150537f
	Checksum: 0x2BDC567A
	Offset: 0x62A0
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function is_score_boosting(player)
{
	if(!level.rankedmatch)
	{
		return false;
	}
	if(player.capsperminute > level.playercapturelpm)
	{
		return true;
	}
	return false;
}

/*
	Name: function_6d2f376a
	Namespace: namespace_d150537f
	Checksum: 0x356183F1
	Offset: 0x62E8
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_6d2f376a(entity)
{
	foreach(zone in level.active_zones)
	{
		if(isdefined(zone.trig) && entity istouching(zone.trig))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_35088f57
	Namespace: namespace_d150537f
	Checksum: 0x6CE55CE2
	Offset: 0x63A8
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_35088f57()
{
	if(is_true(level.overtime))
	{
		return;
	}
	if(isdefined(outcome::function_6d0354e3()))
	{
		round::function_870759fb();
		thread globallogic::end_round(2);
		return;
	}
	function_e7392e03();
}

/*
	Name: function_e7392e03
	Namespace: namespace_d150537f
	Checksum: 0xE6DF7C17
	Offset: 0x6430
	Size: 0x188
	Parameters: 0
	Flags: None
*/
function function_e7392e03()
{
	level.overtime = 1;
	setmatchflag("bomb_timer_a", 0);
	globallogic_audio::leader_dialog("roundOvertime");
	foreach(player in level.players)
	{
		player luinotifyevent(#"hash_6b67aa04e378d681", 1, 8);
	}
	if(is_true(level.var_e89ee661))
	{
		foreach(obj_id in level.var_73377ee4)
		{
			objective_setstate(obj_id, "invisible");
		}
	}
}

/*
	Name: function_9dc6016e
	Namespace: namespace_d150537f
	Checksum: 0x7BA23ABA
	Offset: 0x65C0
	Size: 0x11A
	Parameters: 1
	Flags: Private
*/
function private function_9dc6016e(var_f99d1b44)
{
	switch(var_f99d1b44)
	{
		case 0:
		{
			return "spl1";
		}
		case 1:
		{
			return "spl2";
		}
		case 2:
		{
			return "spl3";
		}
		case 3:
		{
			return "spl4";
		}
		case 4:
		{
			return "spl5";
		}
		case 5:
		{
			return "spl6";
		}
		case 6:
		{
			return "spl7";
		}
		case 7:
		{
			return "spl8";
		}
		case 8:
		{
			return "spl9";
		}
		case 9:
		{
			return "fallback";
		}
	}
	return "auto_normal";
}

/*
	Name: function_259770ba
	Namespace: namespace_d150537f
	Checksum: 0x74F533A2
	Offset: 0x66E8
	Size: 0x7A
	Parameters: 1
	Flags: Private
*/
function private function_259770ba(e_player)
{
	if(spawning::usestartspawns() || level.active_zones.size > 1 || !isdefined(level.active_zones[0].script_index))
	{
		return undefined;
	}
	return function_9dc6016e(level.active_zones[0].script_index);
}

/*
	Name: function_40c08152
	Namespace: namespace_d150537f
	Checksum: 0xF1D3FFBF
	Offset: 0x6770
	Size: 0x2A
	Parameters: 1
	Flags: Private
*/
function private function_40c08152(e_player)
{
	if(spawning::usestartspawns())
	{
		return undefined;
	}
	return "auto_normal";
}

/*
	Name: function_e3aab320
	Namespace: namespace_d150537f
	Checksum: 0x81A61B17
	Offset: 0x67A8
	Size: 0xCC
	Parameters: 0
	Flags: Private
*/
function private function_e3aab320()
{
	for(index = 0; index < 5; index++)
	{
		var_998771f0 = "hardpoint" + (index + 1);
		if(index < level.zones.size)
		{
			if(!isdefined(self.pers[var_998771f0]))
			{
				self.pers[var_998771f0] = 0;
			}
		}
		else if(!isdefined(self.pers[var_998771f0]))
		{
			self.pers[var_998771f0] = -1;
		}
		self function_ef823e71(3, self.pers[var_998771f0], index);
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_d150537f
	Checksum: 0x9E88D5BB
	Offset: 0x6880
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self function_4a5572c3("");
	if(util::function_7f7a77ab())
	{
		if(level.var_e80a117f)
		{
			util::function_256dd160(self);
		}
	}
}

/*
	Name: function_ed2b0a19
	Namespace: namespace_d150537f
	Checksum: 0x8F9C203B
	Offset: 0x68E0
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_ed2b0a19()
{
	/#
		for(index = 0; index < 10; index++)
		{
			spawning::function_25e7711a(function_9dc6016e(index), #"none", ("" + index) + "", "");
		}
	#/
}

/*
	Name: function_41224c9d
	Namespace: namespace_d150537f
	Checksum: 0x88A3CA51
	Offset: 0x6960
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_41224c9d(gameobject, starting)
{
	if(!isdefined(starting))
	{
		starting = 0;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(gameobject))
	{
		return;
	}
	if(starting)
	{
		self thread function_90fdfef6(gameobject);
	}
	else
	{
		self thread function_dd2fc4c3(gameobject);
	}
}

/*
	Name: function_90fdfef6
	Namespace: namespace_d150537f
	Checksum: 0x2CB3A336
	Offset: 0x69D8
	Size: 0x256
	Parameters: 1
	Flags: None
*/
function function_90fdfef6(gameobject)
{
	self notify("389ae92479091655");
	self endon("389ae92479091655");
	self endon(#"death", #"disconnect", #"hash_580789b91ba9f984");
	gameobject.trigger endon(#"destroyed", #"death");
	level endon(#"game_ended");
	level notify(#"hash_d50c83061fcd561");
	waitframe(1);
	while(true)
	{
		var_e672537f = function_896e36e0();
		iscontested = (isdefined(gameobject.contested) ? gameobject.contested : 0);
		if(is_true(gameobject.iscontested))
		{
			self function_a38cc2d7("cap_contested");
			self function_4a5572c3("cap_contested");
		}
		else
		{
			if(var_e672537f >= 0.8)
			{
				self function_4a5572c3("cap_war_percent_90");
			}
			else
			{
				if(var_e672537f >= 0.6)
				{
					self function_4a5572c3("cap_war_percent_75");
				}
				else
				{
					if(var_e672537f >= 0.4)
					{
						self function_4a5572c3("cap_war_percent_50");
					}
					else
					{
						if(var_e672537f >= 0.2)
						{
							self function_4a5572c3("cap_war_percent_25");
						}
						else if(var_e672537f >= 0)
						{
							self function_4a5572c3("cap_war_percent_0");
						}
					}
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_dd2fc4c3
	Namespace: namespace_d150537f
	Checksum: 0x45D08642
	Offset: 0x6C38
	Size: 0x82
	Parameters: 2
	Flags: None
*/
function function_dd2fc4c3(gameobject, success)
{
	if(!isdefined(success))
	{
		success = 0;
	}
	if(success)
	{
		self function_4a5572c3("cap_success");
	}
	else
	{
		self function_4a5572c3("cap_exit");
		self notify(#"hash_580789b91ba9f984");
		self.var_b3890fdf = 0;
	}
}

/*
	Name: function_4a5572c3
	Namespace: namespace_d150537f
	Checksum: 0x35D0DDB4
	Offset: 0x6CC8
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_4a5572c3(state)
{
	if(!isdefined(self.var_a022edea))
	{
		self.var_a022edea = "";
	}
	if(is_true(level.var_2179a6bf))
	{
		return;
	}
	if(state != self.var_a022edea)
	{
		self.var_a022edea = state;
		globallogic_audio::function_c246758e(state);
	}
}

/*
	Name: function_a38cc2d7
	Namespace: namespace_d150537f
	Checksum: 0x64CA903E
	Offset: 0x6D50
	Size: 0x254
	Parameters: 1
	Flags: None
*/
function function_a38cc2d7(state)
{
	if(!isdefined(self.var_b3890fdf))
	{
		self.var_b3890fdf = 0;
	}
	if(game.state != #"playing")
	{
		return;
	}
	str_alias = undefined;
	switch(state)
	{
		case "cap_low":
		{
			str_alias = #"hash_1c518fb856754e14";
			n_waittime = 2.5;
			break;
		}
		case "hash_736eee50e5b4b564":
		{
			str_alias = #"hash_1c5192b85675532d";
			n_waittime = 2.5;
			break;
		}
		case "cap_mid":
		{
			str_alias = #"hash_1c5191b85675517a";
			n_waittime = 2.5;
			break;
		}
		case "hash_3b47899904bb9c9e":
		{
			str_alias = #"hash_1c518cb8567548fb";
			n_waittime = 2.5;
			break;
		}
		case "cap_high":
		{
			str_alias = #"hash_1c518cb8567548fb";
			n_waittime = 1.25;
			break;
		}
		case "cap_contested":
		{
			str_alias = #"hash_43014e1f7354354f";
			n_waittime = 1.25;
			break;
		}
	}
	if(is_true(level.var_2179a6bf))
	{
		str_alias = #"hash_1c518cb8567548fb";
		n_waittime = 2;
	}
	if(isdefined(str_alias))
	{
		var_bb0c6711 = gettime();
		if(self.var_b3890fdf <= var_bb0c6711)
		{
			if(self.var_b3890fdf === 0)
			{
				self.var_b3890fdf = var_bb0c6711 - 50;
			}
			self.var_b3890fdf = self.var_b3890fdf + (int(n_waittime * 1000));
			self playlocalsound(str_alias);
		}
	}
}

/*
	Name: function_896e36e0
	Namespace: namespace_d150537f
	Checksum: 0xB2DC7653
	Offset: 0x6FB0
	Size: 0x112
	Parameters: 0
	Flags: None
*/
function function_896e36e0()
{
	if(!isdefined(level.teams))
	{
		return 0;
	}
	scorelimit = (level.scorelimit > 0 ? level.scorelimit : 1);
	var_ab9897d4 = [];
	foreach(team in level.teams)
	{
		array::add(var_ab9897d4, getteamscore(team) / scorelimit);
	}
	array::sort_by_value(var_ab9897d4);
	return var_ab9897d4[0];
}

