#using script_113dd7f0ea2a1d4f;
#using script_165beea08a63a243;
#using script_18077945bb84ede7;
#using script_193d6fcd3b319d05;
#using script_34ab99a4ca1a43d;
#using script_3751b21462a54a7d;
#using script_3f9e0dc8454d98e1;
#using script_5bb072c3abf4652c;
#using script_6196bd4e1ff26cc0;
#using script_67ce8e728d8f37ba;
#using script_6ce38ab036223e6e;
#using script_db06eb511bd9b36;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_ec502488;

/*
	Name: function_76f79d99
	Namespace: namespace_ec502488
	Checksum: 0xB1D2D8F3
	Offset: 0x3E8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_76f79d99()
{
	level notify(1298255719);
}

/*
	Name: main
	Namespace: namespace_ec502488
	Checksum: 0x2C5F7791
	Offset: 0x408
	Size: 0x44C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("allplayers", "cranked_explode_fx", 1, 1, "counter");
	clientfield::register("toplayer", "cranked_timer_sfx", 1, 1, "int");
	clientfield::function_a8bbc967("ZMHud.zmCrankedMax", 6000, 5, "int", 0);
	clientfield::function_a8bbc967("ZMHud.zmCrankedPct", 6000, 16, "float", 0);
	clientfield::function_a8bbc967("ZMHud.zmCrankedTimerReset", 6000, 1, "counter", 0);
	clientfield::function_a8bbc967("ZMHud.zmCrankedRoundNotification", 6000, 1, "int", 0);
	level.var_2f5a329e = 1;
	level.var_75c2c45f = 50;
	level.var_eaa19257 = 1;
	if(!isdefined(level.var_31028c5d))
	{
		level.var_31028c5d = prototype_hud::register();
	}
	zm_gametype::main();
	level.onprecachegametype = &onprecachegametype;
	level.onstartgametype = &onstartgametype;
	level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
	level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
	level._round_start_func = &namespace_a28acff3::round_start;
	level.round_wait_func = &function_b982cd4d;
	level.func_get_delay_between_rounds = &function_271fd5ed;
	level.var_54d9d726 = 2;
	level.var_4d30a9f0 = 1;
	level.var_cdc822b = &function_38499d79;
	level.callbackplayerkilled = &function_62dd8e0c;
	level.var_deb2145c = &zombie_move_speed_override;
	level.var_57cc29f3 = &function_aa5777b3;
	level.var_a4e9271b = &function_26cf03ff;
	level.musicsystemoverride = 1;
	zm_vo::function_2cf4b07f(#"hash_33e242de9ff79fce", #"hash_566a2e8557ec05e");
	spawner::add_ai_spawn_function(&function_a143f9d1);
	namespace_58949729::function_5a12541e();
	level thread intro_cinematic();
	level thread function_8e58680e();
	callback::function_74872db6(&function_74872db6);
	callback::function_189f87c1(&function_189f87c1);
	callback::add_callback(#"hash_3b7d3ed9e484ef72", &give_match_bonus);
	callback::on_spawned(&on_player_spawn);
	callback::on_actor_killed(&on_zombie_killed);
	callback::on_actor_damage(&function_3d2684c5);
	setdvar(#"hash_34cae673a047c202", 1);
}

/*
	Name: function_aa5777b3
	Namespace: namespace_ec502488
	Checksum: 0xD90FC6FB
	Offset: 0x860
	Size: 0x10
	Parameters: 1
	Flags: Private
*/
function private function_aa5777b3(player)
{
	return true;
}

/*
	Name: zombie_move_speed_override
	Namespace: namespace_ec502488
	Checksum: 0xA6A0F470
	Offset: 0x878
	Size: 0x3A
	Parameters: 0
	Flags: None
*/
function zombie_move_speed_override()
{
	if(math::cointoss())
	{
		self.zombie_move_speed = "sprint";
	}
	else
	{
		self.zombie_move_speed = "walk";
	}
}

/*
	Name: function_a143f9d1
	Namespace: namespace_ec502488
	Checksum: 0x92F31CCE
	Offset: 0x8C0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_a143f9d1(params)
{
	self.var_1b2af7dc = 1;
	self thread function_acafdd66();
}

/*
	Name: function_acafdd66
	Namespace: namespace_ec502488
	Checksum: 0xC80FCC16
	Offset: 0x8F8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_acafdd66()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"bad_path");
		self.var_4fe4e626 = 1;
		wait(0.5);
	}
}

/*
	Name: function_38499d79
	Namespace: namespace_ec502488
	Checksum: 0x6140D4BB
	Offset: 0x950
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_38499d79()
{
	return !is_true(self.cached_zone_volume.var_8e4005b6);
}

/*
	Name: onprecachegametype
	Namespace: namespace_ec502488
	Checksum: 0x2A0DC0EA
	Offset: 0x980
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
	level.canplayersuicide = &zm_gametype::canplayersuicide;
}

/*
	Name: onstartgametype
	Namespace: namespace_ec502488
	Checksum: 0x9714C0A6
	Offset: 0x9A8
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	zm_behavior::function_70a657d8();
	zm_cleanup::function_70a657d8();
	zm_spawner::init();
	zm_behavior::function_8ac3bea9();
	zm_cleanup::function_8ac3bea9();
	level.spawnmins = (0, 0, 0);
	level.spawnmaxs = (0, 0, 0);
	structs = struct::get_array("player_respawn_point", "targetname");
	foreach(struct in structs)
	{
		level.spawnmins = math::expand_mins(level.spawnmins, struct.origin);
		level.spawnmaxs = math::expand_maxs(level.spawnmaxs, struct.origin);
	}
	level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
	setmapcenter(level.mapcenter);
}

/*
	Name: on_player_spawn
	Namespace: namespace_ec502488
	Checksum: 0x7200AD23
	Offset: 0xB58
	Size: 0x174
	Parameters: 0
	Flags: None
*/
function on_player_spawn()
{
	self.specialty = self getloadoutperks(0);
	self.var_d66589da = 0;
	self.var_5d4c5daf = 0;
	self zm::register_perks();
	if(!level.var_31028c5d prototype_hud::is_open(self))
	{
		level.var_31028c5d prototype_hud::open(self, 1);
	}
	if(is_true(self.is_hotjoin))
	{
		var_c6b6dcea = level.round_number * 500;
		self.score = var_c6b6dcea;
		/#
			if(getdvarint(#"zombie_cheat", 0) >= 1)
			{
				self.score = 100000;
			}
		#/
		self.is_hotjoin = undefined;
	}
	if(!is_true(self.is_hotjoining) && !self util::is_spectating())
	{
		self thread function_89af9d5f();
		self thread function_cb952470();
	}
}

/*
	Name: function_89af9d5f
	Namespace: namespace_ec502488
	Checksum: 0x6B86C1F0
	Offset: 0xCD8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_89af9d5f()
{
	level endon(#"end_game");
	self endon(#"death", #"disconnect", #"hash_69cbfdd9542e6f85");
	level flag::wait_till("start_zombie_round_logic");
	wait(30);
	self function_5d44c2ba();
}

/*
	Name: function_cb952470
	Namespace: namespace_ec502488
	Checksum: 0xAF6DAB57
	Offset: 0xD68
	Size: 0xAC
	Parameters: 0
	Flags: Private
*/
function private function_cb952470()
{
	level endon(#"end_game");
	self endon(#"disconnect");
	self val::set(#"hash_47e92389d3114637", "ignoreme", 1);
	self waittilltimeout(5, #"death", #"hash_69cbfdd9542e6f85");
	self val::reset(#"hash_47e92389d3114637", "ignoreme");
}

/*
	Name: intro_cinematic
	Namespace: namespace_ec502488
	Checksum: 0xBD0BB808
	Offset: 0xE20
	Size: 0x2FC
	Parameters: 0
	Flags: Private
*/
function private intro_cinematic()
{
	level flag::wait_till("initial_blackscreen_passed");
	music::setmusicstate("cranked_intro");
	if(isdefined(level.var_dfee7fc2) && !getdvarint(#"hash_39af51993585a73e", 0))
	{
		foreach(player in getplayers())
		{
			player.var_f4e33249 = 1;
		}
		namespace_66d6aa44::function_bb17da18();
		level.var_3dfa8db4 = 1;
		util::wait_network_frame(2);
		level scene::play(level.var_dfee7fc2);
		callback::callback(#"hash_41e282f5ec98e877");
		namespace_66d6aa44::function_db62d086();
		level.var_dfee7fc2 = undefined;
		foreach(player in getplayers())
		{
			player dontinterpolate();
			player setorigin(player.spectator_respawn.origin);
			player setplayerangles(player.spectator_respawn.angles);
			player.var_f4e33249 = undefined;
		}
	}
	level flag::set(#"intro_scene_done");
	gamestate::set_state(#"playing");
	level flag::wait_till("start_zombie_round_logic");
	level thread zm_vo::function_8abe0568(#"hash_33e242de9ff79fce", 1);
}

/*
	Name: function_ef580a0c
	Namespace: namespace_ec502488
	Checksum: 0xF12F456E
	Offset: 0x1128
	Size: 0xBA
	Parameters: 1
	Flags: None
*/
function function_ef580a0c(round)
{
	switch(round)
	{
		case 5:
		{
			return 1;
			break;
		}
		case 10:
		{
			return 1;
			break;
		}
		case 15:
		{
			return 2;
			break;
		}
		case 20:
		{
			return 3;
			break;
		}
		case 25:
		{
			return 4;
			break;
		}
		default:
		{
			return 5;
			break;
		}
	}
}

/*
	Name: function_b03d7dd0
	Namespace: namespace_ec502488
	Checksum: 0xDEB360E4
	Offset: 0x11F0
	Size: 0xA2
	Parameters: 1
	Flags: None
*/
function function_b03d7dd0(round)
{
	switch(round)
	{
		case 5:
		{
			return 1;
			break;
		}
		case 10:
		{
			return 2;
			break;
		}
		case 15:
		{
			return 3;
			break;
		}
		case 20:
		{
			return 4;
			break;
		}
		default:
		{
			return 5;
			break;
		}
	}
}

/*
	Name: function_189f87c1
	Namespace: namespace_ec502488
	Checksum: 0x369DBEBE
	Offset: 0x12A0
	Size: 0x258
	Parameters: 0
	Flags: None
*/
function function_189f87c1()
{
	playsoundatposition(#"hash_409b69424385812a", (0, 0, 0));
	var_370ac26d = zm::function_d3113f01().var_bd588afd;
	luinotifyevent(#"hash_3e6dd0ad7b864154", 1, var_370ac26d);
	foreach(player in getplayers())
	{
		if(!isdefined(player.var_8d41c907))
		{
			player.var_8d41c907 = 0;
		}
		player addrankxpvalue("round_end_xp", var_370ac26d, 4);
		player.var_8d41c907 = player.var_8d41c907 + var_370ac26d;
		if((level.round_number % 5) == 0 && level.round_number >= 5)
		{
			var_36bda4b = function_ef580a0c(level.round_number);
			var_ef5aac55 = var_36bda4b * 100;
			var_ef5aac55 = math::clamp(var_ef5aac55, 0, 900);
			var_1ac981fc = function_b03d7dd0(level.round_number);
			var_a9b93bb4 = var_1ac981fc * 50;
			var_a9b93bb4 = math::clamp(var_a9b93bb4, 0, 450);
			player thread sr_scrap::function_afab250a(var_ef5aac55);
			player thread sr_scrap::function_a6d4221f(var_a9b93bb4);
		}
	}
}

/*
	Name: function_74872db6
	Namespace: namespace_ec502488
	Checksum: 0x24731C03
	Offset: 0x1500
	Size: 0x19C
	Parameters: 0
	Flags: None
*/
function function_74872db6()
{
	if(!isdefined(level.var_d041f60d))
	{
		level.var_d041f60d = 30;
	}
	if(!isdefined(level.var_e78b055a))
	{
		level.var_e78b055a = 30;
	}
	var_e4eea632 = 0;
	if(level.round_number > 0 && (level.round_number % 3) == 0)
	{
		level.var_e78b055a = level.var_d041f60d;
		level.var_d041f60d = level.var_d041f60d - 3;
		level.var_d041f60d = math::clamp(level.var_d041f60d, 5, 30);
		if(level.var_d041f60d > 6)
		{
			var_e4eea632 = 1;
		}
	}
	if(var_e4eea632)
	{
		playsoundatposition(#"hash_32635012b4632180", (0, 0, 0));
		array::thread_all(getplayers(), &clientfield::set_player_uimodel, "ZMHud.zmCrankedRoundNotification", 1);
	}
	else
	{
		array::thread_all(getplayers(), &clientfield::set_player_uimodel, "ZMHud.zmCrankedRoundNotification", 0);
	}
}

/*
	Name: give_match_bonus
	Namespace: namespace_ec502488
	Checksum: 0x93385634
	Offset: 0x16A8
	Size: 0x350
	Parameters: 1
	Flags: None
*/
function give_match_bonus(data)
{
	players = getplayers();
	foreach(player in players)
	{
		/#
			/#
				assert(isdefined(player.var_b6577248), "");
			#/
		#/
		var_22ba849f = getdvarint(#"hash_3f0689f4ecc2fbab", 0);
		var_3f8d170c = (zm_utility::get_round_number() - player.var_b6577248) + 1;
		var_900d44db = zm::function_d3113f01();
		var_191f8e5e = var_900d44db.var_c6f2635d;
		var_7c032359 = var_900d44db.var_b93abbed[getplayers().size - 1];
		var_f65fd621 = function_7a2da789()[#"hash_31b5b9e273560fa9"];
		if(!isdefined(player.var_8d41c907))
		{
			player.var_8d41c907 = 0;
		}
		var_c602cc83 = player.var_8d41c907;
		var_370ac26d = int(((((var_22ba849f * var_3f8d170c) * var_191f8e5e) * var_f65fd621) - var_c602cc83) * var_7c032359);
		player zm::function_78e7b549(var_370ac26d);
		/#
			println((((("" + player getentnum()) + "") + player.name) + "") + var_370ac26d);
			println("" + var_22ba849f);
			println("" + var_3f8d170c);
			println("" + var_191f8e5e);
			println("" + var_f65fd621);
			println("" + var_7c032359);
			println("" + var_c602cc83);
			println("");
		#/
	}
}

/*
	Name: function_271fd5ed
	Namespace: namespace_ec502488
	Checksum: 0x7FF10B7B
	Offset: 0x1A00
	Size: 0x8
	Parameters: 0
	Flags: Private
*/
function private function_271fd5ed()
{
	return 2;
}

/*
	Name: function_b982cd4d
	Namespace: namespace_ec502488
	Checksum: 0x8CA0A6B0
	Offset: 0x1A10
	Size: 0x232
	Parameters: 0
	Flags: Private
*/
function private function_b982cd4d()
{
	level endon(#"restart_round", #"kill_round_wait");
	/#
		level endon(#"kill_round");
		if(getdvarint(#"zombie_rise_test", 0))
		{
			level waittill(#"forever");
		}
	#/
	if(zm::cheat_enabled(2))
	{
		level waittill(#"forever");
	}
	/#
		if(getdvarint(#"zombie_default_max", 0) == 0)
		{
			level waittill(#"forever");
		}
	#/
	wait(1);
	while(true)
	{
		if(level.zombie_total <= 0 && !level.intermission && !level flag::get(#"infinite_round_spawning") && !level flag::get(#"hold_round_end"))
		{
			var_9427911d = zombie_utility::get_current_zombie_count();
			if(level.round_number > 1 || var_9427911d <= 2)
			{
				if(level.round_number == 1 || var_9427911d == 0)
				{
					wait(1);
				}
				else
				{
					wait(5);
				}
				return;
			}
		}
		if(level flag::get("end_round_wait"))
		{
			return;
		}
		if(level flag::get("round_reset"))
		{
			return;
		}
		wait(1);
	}
}

/*
	Name: function_26cf03ff
	Namespace: namespace_ec502488
	Checksum: 0x437EF8BA
	Offset: 0x1C50
	Size: 0x112
	Parameters: 0
	Flags: None
*/
function function_26cf03ff()
{
	var_c1abcf30 = 0;
	foreach(str_archetype in self.var_d7d3cd31)
	{
		a_ai_enemies = getaiarchetypearray(str_archetype, level.zombie_team);
		if(a_ai_enemies.size > 0)
		{
			var_c1abcf30 = 1;
			break;
		}
	}
	if(!var_c1abcf30 && level.zombie_total <= 0 && !level flag::get(#"hold_round_end"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_9b42df5c
	Namespace: namespace_ec502488
	Checksum: 0x7FF50E0
	Offset: 0x1D70
	Size: 0x3A
	Parameters: 1
	Flags: Private
*/
function private function_9b42df5c(round_number)
{
	return int((isdefined(level.var_d041f60d) ? level.var_d041f60d : 30));
}

/*
	Name: function_600547a4
	Namespace: namespace_ec502488
	Checksum: 0x77699AC1
	Offset: 0x1DB8
	Size: 0x3A
	Parameters: 0
	Flags: Private
*/
function private function_600547a4()
{
	/#
		assert(isdefined(level.round_number));
	#/
	return function_9b42df5c(level.round_number);
}

/*
	Name: function_3d2684c5
	Namespace: namespace_ec502488
	Checksum: 0x6FD964C0
	Offset: 0x1E00
	Size: 0xF0
	Parameters: 1
	Flags: Private
*/
function private function_3d2684c5(params)
{
	player = params.eattacker;
	if(!isplayer(player) || !isalive(player))
	{
		return;
	}
	if(!isdefined(self.var_68812391))
	{
		self.var_68812391 = [];
	}
	if(!isdefined(self.var_68812391))
	{
		self.var_68812391 = [];
	}
	else if(!isarray(self.var_68812391))
	{
		self.var_68812391 = array(self.var_68812391);
	}
	if(!isinarray(self.var_68812391, player))
	{
		self.var_68812391[self.var_68812391.size] = player;
	}
}

/*
	Name: on_zombie_killed
	Namespace: namespace_ec502488
	Checksum: 0x911A2422
	Offset: 0x1EF8
	Size: 0x14C
	Parameters: 1
	Flags: Private
*/
function private on_zombie_killed(params)
{
	if(isdefined(self.var_68812391) && self.var_68812391.size > 0)
	{
		arrayremovevalue(self.var_68812391, undefined);
		foreach(var_a8ff3fe1 in self.var_68812391)
		{
			var_a8ff3fe1 function_5d44c2ba(1);
			if(var_a8ff3fe1 !== params.eattacker)
			{
				var_a8ff3fe1.assists++;
			}
		}
	}
	player = params.eattacker;
	if(isplayer(player) && !player flag::get("become_cranked"))
	{
		player function_5d44c2ba();
	}
}

/*
	Name: function_5d44c2ba
	Namespace: namespace_ec502488
	Checksum: 0x56560E0D
	Offset: 0x2050
	Size: 0x18C
	Parameters: 1
	Flags: Private
*/
function private function_5d44c2ba(var_d02140db)
{
	if(!isdefined(var_d02140db))
	{
		var_d02140db = 0;
	}
	player = self;
	if(!isalive(player))
	{
		return;
	}
	if(is_true(var_d02140db) && !player flag::get("become_cranked"))
	{
		return;
	}
	if(!isdefined(player.var_5f356773))
	{
		player.var_5f356773 = 0;
	}
	player.var_5f356773 = int(max(player.var_5f356773, function_600547a4()));
	player clientfield::increment_uimodel("ZMHud.zmCrankedTimerReset");
	if(!player function_64030a52())
	{
		player thread function_bab1a386(player.var_5f356773);
	}
	if(!player flag::get("become_cranked"))
	{
		player thread function_bbdbb1b6();
	}
	else
	{
		scoreevents::processscoreevent(#"hash_1655db4904ecaf05", player);
	}
}

/*
	Name: function_52203507
	Namespace: namespace_ec502488
	Checksum: 0x6AD5E435
	Offset: 0x21E8
	Size: 0x146
	Parameters: 0
	Flags: Private
*/
function private function_52203507()
{
	level endon(#"end_game");
	self endon(#"disconnect");
	self notify(#"hash_196c728dd1cf1842");
	self endon(#"hash_196c728dd1cf1842");
	while(isdefined(self) && isalive(self))
	{
		if(isdefined(self.var_5f356773) && self.var_5f356773 > 0)
		{
			self clientfield::set_player_uimodel("ZMHud.zmCrankedPct", min(1, self.var_5f356773 / function_600547a4()));
		}
		else
		{
			self clientfield::set_player_uimodel("ZMHud.zmCrankedPct", 0);
		}
		self clientfield::set_player_uimodel("ZMHud.zmCrankedMax", function_600547a4());
		waitframe(1);
	}
}

/*
	Name: function_bbdbb1b6
	Namespace: namespace_ec502488
	Checksum: 0x1F776B98
	Offset: 0x2338
	Size: 0x3BC
	Parameters: 0
	Flags: Private
*/
function private function_bbdbb1b6()
{
	level endon(#"end_game");
	self endon(#"disconnect");
	self thread function_52203507();
	self flag::set("become_cranked");
	self playsoundtoplayer(#"hash_702e9fc4e46d0bf1", self);
	scoreevents::processscoreevent("cranked_start_zm", self, undefined, undefined);
	self perks::function_7637bafa(#"specialty_fastweaponswitch");
	self perks::function_7637bafa(#"specialty_staminup");
	self perks::function_7637bafa(#"specialty_fastreload");
	while(isalive(self) && self.var_5f356773 > 0)
	{
		self.var_5f356773 = self.var_5f356773 - (float(function_60d95f53()) / 1000);
		if(self function_64030a52())
		{
			self function_50454ebf(1);
			while(self function_64030a52())
			{
				waitframe(1);
			}
			self.var_5f356773 = int(ceil(self.var_5f356773));
			self thread function_bab1a386(self.var_5f356773);
		}
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	if(isalive(self))
	{
		self clientfield::set_player_uimodel("ZMHud.zmCrankedPct", 0);
		self clientfield::increment("cranked_explode_fx");
		wait(0.1);
		self dodamage(self.health + 1, self.origin);
		self thread function_50454ebf(0, 2);
	}
	else
	{
		self thread function_50454ebf(0);
	}
	if(self perks::function_be94fe26(#"specialty_fastweaponswitch"))
	{
		self perks::function_45d12554(#"specialty_fastweaponswitch");
	}
	if(self perks::function_be94fe26(#"specialty_staminup"))
	{
		self perks::function_45d12554(#"specialty_staminup");
	}
	if(self perks::function_be94fe26(#"specialty_fastreload"))
	{
		self perks::function_45d12554(#"specialty_fastreload");
	}
	self flag::clear("become_cranked");
}

/*
	Name: function_bab1a386
	Namespace: namespace_ec502488
	Checksum: 0xDE368A9B
	Offset: 0x2700
	Size: 0x13A
	Parameters: 1
	Flags: None
*/
function function_bab1a386(n_seconds)
{
	self notify(#"hash_2968dc9f8d9c8186");
	self endon(#"death", #"hash_2968dc9f8d9c8186");
	self clientfield::set_to_player("sr_defend_timer", 0);
	self clientfield::set_to_player("cranked_timer_sfx", 0);
	util::wait_network_frame();
	n_seconds = int(ceil(n_seconds));
	if(!level.var_4f12f6d0 sr_objective_timer::is_open(self))
	{
		level.var_4f12f6d0 sr_objective_timer::open(self, 0);
	}
	self clientfield::set_to_player("sr_defend_timer", n_seconds);
	self clientfield::set_to_player("cranked_timer_sfx", 1);
	wait(n_seconds);
}

/*
	Name: function_64030a52
	Namespace: namespace_ec502488
	Checksum: 0x7BE384AF
	Offset: 0x2848
	Size: 0x88
	Parameters: 0
	Flags: None
*/
function function_64030a52()
{
	if(level flag::get("cranked_pause") || isgodmode(self) || self isinmovemode("noclip", "ufo") || self getinvulnerability())
	{
		return true;
	}
	return false;
}

/*
	Name: function_50454ebf
	Namespace: namespace_ec502488
	Checksum: 0x497871E7
	Offset: 0x28D8
	Size: 0x10E
	Parameters: 2
	Flags: None
*/
function function_50454ebf(b_paused, waittime)
{
	if(!isdefined(waittime))
	{
		waittime = 0;
	}
	level endon(#"end_game");
	self endon(#"disconnect");
	self notify(#"hash_3d27f53ca284b924");
	self endon(#"hash_3d27f53ca284b924");
	if(isdefined(waittime) && waittime > 0)
	{
		wait(waittime);
	}
	if(!b_paused && level.var_4f12f6d0 sr_objective_timer::is_open(self))
	{
		level.var_4f12f6d0 sr_objective_timer::close(self);
	}
	self clientfield::set_to_player("cranked_timer_sfx", 0);
	self notify(#"hash_2968dc9f8d9c8186");
}

/*
	Name: function_62dd8e0c
	Namespace: namespace_ec502488
	Checksum: 0x56C7390
	Offset: 0x29F0
	Size: 0x304
	Parameters: 10
	Flags: Private
*/
function private function_62dd8e0c(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration)
{
	self endon(#"disconnect");
	globallogic::updateteamstatus(1);
	foreach(talent in self.var_7341f980)
	{
		namespace_791d0451::function_4c1d0e25(talent);
	}
	if(!isdefined(self.var_3b511a7c))
	{
		self.var_3b511a7c = 0;
	}
	self.var_3b511a7c++;
	self.deaths++;
	self.statusicon = "hud_status_dead";
	self recordplayerdeathzombies();
	self zm_stats::increment_player_stat("deaths");
	self zm_stats::increment_client_stat("deaths");
	self zm_stats::function_8f10788e("boas_deaths");
	body = self cloneplayer(deathanimduration, vdir, weapon, shitloc);
	self.body = body;
	body.player = self;
	body.iscorpse = 1;
	self thread delayed_ragdoll(body);
	var_a8cdcd4a = killcam::get_killcam_entity_info(weapon, smeansofdeath, vdir);
	clientnum = self getentitynumber();
	self thread killcam::killcam(clientnum, clientnum, var_a8cdcd4a, vdir, var_fd90b0bb, self.deathtime, 0, psoffsettime, 0, undefined, [], [], weapon, 0);
	wait(0.1);
	if(isdefined(level.player_becomes_zombie))
	{
		self util::delay(5, "disconnect", level.player_becomes_zombie);
	}
	level util::delay(2, undefined, &zm_player::function_8ef51109, self, 1);
}

/*
	Name: delayed_ragdoll
	Namespace: namespace_ec502488
	Checksum: 0x591280C7
	Offset: 0x2D00
	Size: 0x1D4
	Parameters: 1
	Flags: Private
*/
function private delayed_ragdoll(ent)
{
	if(isdefined(ent))
	{
		if(is_true(ent.var_6f9e9dc9))
		{
			if(!ent isragdoll())
			{
				ent startragdoll();
			}
			return;
		}
		deathanim = ent getcorpseanim();
		if(isdefined(deathanim) && animhasnotetrack(deathanim, "ignore_ragdoll"))
		{
			return;
		}
	}
	waittillframeend();
	if(!isdefined(ent))
	{
		return;
	}
	if(ent isragdoll())
	{
		return;
	}
	deathanim = ent getcorpseanim();
	if(!isdefined(deathanim) || animhasnotetrack(deathanim, "ignore_ragdoll"))
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
	if(waittime > 0)
	{
		wait(waittime);
	}
	if(isdefined(ent))
	{
		ent startragdoll();
	}
}

/*
	Name: function_8e58680e
	Namespace: namespace_ec502488
	Checksum: 0xB97F68DF
	Offset: 0x2EE0
	Size: 0x94
	Parameters: 0
	Flags: Private
*/
function private function_8e58680e()
{
	level endon(#"end_game");
	level flag::set("disable_weapon_machine");
	level flag::wait_till(#"power_on");
	level flag::clear("disable_weapon_machine");
	level flag::set(#"pap_quest_completed");
}

