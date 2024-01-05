#using script_2fe8f3019ef027c7;
#using script_4dca2ab120688fc;
#using script_69d94a292b5a26e3;
#using script_4d1e366b77f0b4b;
#using script_35b8a6927c851193;
#using script_6dd97fb55af61274;
#using script_2cc90e725816de14;
#using script_20dc0f45753888c7;
#using script_789f2367a00401d8;
#using script_3e57cc1a9084fdd6;
#using script_5a0c35b811c39bea;
#using script_7c3f86aa290a6354;
#using script_5961deb533dad533;
#using script_62caa307a394c18c;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using script_3357acf79ce92f4b;
#using script_3411bb48d41bd3b;
#using script_2125dd4d7e4788a5;
#using script_31de501a61836a3a;
#using script_5dd920e119223a7c;
#using script_6fc1886ffe877d6;
#using script_7b1cd3908a825fdd;
#using script_2593b2b2f6452617;
#using script_1029986e2bc8ca8e;
#using script_66b094f566d08b1c;
#using script_194827006298caa3;
#using script_5b1e7b7ff6869723;
#using script_5b2a3c052bf17d0e;
#using script_59212975210c5bf2;
#using script_34328dad68218b76;
#using script_5ff9bbe37f3310b0;
#using script_1cd534c7e79b126f;
#using script_5ff04d724da1c002;
#using script_6b2d896ac43eb90;
#using script_32b18d9fb454babf;
#using script_fec6e2b970dd864;
#using script_2618e0f3e5e11649;
#using scripts\zm_common\zm_behavior.gsc;
#using script_13d5d0aa9140d362;
#using script_6155d71e1c9a57eb;
#using script_215d7818c548cb51;
#using script_5725a8301835a95d;
#using script_6fc2be37feeb317b;
#using script_7a5293d92c61c788;
#using script_4ccfb58a9443a60b;
#using script_12538a87a80a2978;
#using script_34ab99a4ca1a43d;
#using script_355c6e84a79530cb;
#using script_176597095ddfaa17;
#using script_3751b21462a54a7d;
#using script_18077945bb84ede7;
#using script_16b1b77a76492c6a;
#using script_6708b08fd2751700;
#using script_19367cd29a4485db;
#using script_113dd7f0ea2a1d4f;
#using script_7d7ac1f663edcdc8;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_player.gsc;
#using script_437ce686d29bb81b;
#using script_799de24f8ad427f7;
#using script_b9d273dc917ee1f;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\gametypes\globallogic_ui.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using script_41b18a77720c5395;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\aat_shared.gsc;
#using script_45fdb6cec5580007;
#using script_1cc417743d7c262d;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_7fc996fe8678852;
#using script_4108035fe400ce67;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\loadout_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using script_6167e26342be354b;
#using script_44b0b8420eabacad;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\player\player_free_fall.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using script_67ce8e728d8f37ba;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zsurvival;

/*
	Name: function_bfc8ee84
	Namespace: zsurvival
	Checksum: 0x5AD2030D
	Offset: 0x7F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bfc8ee84()
{
	level notify(1203603495);
}

/*
	Name: main
	Namespace: zsurvival
	Checksum: 0x85688F52
	Offset: 0x810
	Size: 0xBA4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.is_survival = 1;
	level.aat_in_use = 1;
	level.var_28ebc1e8 = 1;
	level.player_out_of_playable_area_monitor = 0;
	level.var_fdba6f4b = &function_889c6660;
	level.var_9602c8b2 = &function_5d7d3382;
	level.random_pandora_box_start = 1;
	level.var_3f945d0d = 1;
	level.var_f3901984 = undefined;
	level.var_8179368e = &function_452e5ad6;
	level.var_ea32773 = &on_end_game;
	level.var_68e3cf24 = 1;
	namespace_4abf1500::function_88645994(#"hash_1440a8afd0539909", #"hash_3e41166877185a54", undefined, undefined, undefined, #"hash_778743599747ead3", #"hash_6fd808779c3a9baf", #"hash_76ad101a51a56c6a", #"hash_5211f12ea197e258");
	val::register("b_ignore_fow_damage", 1);
	val::default_value("b_ignore_fow_damage", 0);
	/#
		level.var_37778628 = &function_37778628;
		level thread namespace_ce1f29cc::function_9b928fad();
		level function_4ddaff8e();
	#/
	level.var_72a4153b = 0;
	clientfield::register_clientuimodel("hudItems.streamerLoadFraction", 1, 5, "float", 1);
	clientfield::register_clientuimodel("hudItems.wzLoadFinished", 1, 1, "int", 1);
	clientfield::function_5b7d846d("hudItems.warzone.reinsertionPassengerCount", 1, 7, "int");
	clientfield::register_clientuimodel("hudItems.alivePlayerCount", 1, 7, "int", 0);
	clientfield::register_clientuimodel("hudItems.alivePlayerCountEnemy", 1, 7, "int", 0);
	clientfield::register_clientuimodel("hudItems.aliveTeammateCount", 1, 7, "int", 1);
	clientfield::register_clientuimodel("hudItems.spectatorsCount", 1, 7, "int", 1);
	clientfield::register_clientuimodel("hudItems.playerKills", 1, 9, "int", 0);
	clientfield::register_clientuimodel("hudItems.playerCleanUps", 1, 7, "int", 0);
	clientfield::register_clientuimodel("presence.modeparam", 1, 7, "int", 1);
	clientfield::register_clientuimodel("hudItems.showReinsertionPassengerCount", 1, 1, "int", 0);
	clientfield::register_clientuimodel("hudItems.playerLivesRemaining", 1, 3, "int");
	clientfield::register_clientuimodel("hudItems.playerCanRedeploy", 1, 1, "int");
	clientfield::register_clientuimodel("hudItems.zombiesSurvivalRespawn", 1, 1, "int");
	clientfield::function_5b7d846d("hudItems.warzone.collapse", 1, 21, "int");
	clientfield::function_5b7d846d("hudItems.warzone.waveRespawnTimer", 1, 21, "int");
	clientfield::function_5b7d846d("hudItems.warzone.collapseIndex", 1, 3, "int");
	clientfield::function_5b7d846d("hudItems.warzone.collapseCount", 1, 3, "int");
	clientfield::function_5b7d846d("hudItems.warzone.reinsertionIndex", 1, 3, "int");
	clientfield::register("world", "set_objective_fog", 1, 2, "int");
	clientfield::function_5b7d846d("hudItems.team1.roundsWon", 1, 4, "int");
	clientfield::function_5b7d846d("hudItems.team2.roundsWon", 1, 4, "int");
	level thread function_57292af3();
	zm_gametype::main();
	level.onprecachegametype = &onprecachegametype;
	level.onrespawndelay = &function_72d130aa;
	level.onstartgametype = &onstartgametype;
	level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
	level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
	level.customspawnlogic = &function_716def93;
	level.var_16918506 = &function_58d07657;
	level.var_4e1e5411 = &function_f30d46d0;
	level.var_d0ab70a2 = #"hash_2e67a581bd97b96c";
	level.var_946a4954 = 90;
	level.var_38743886 = &function_d7cf81e;
	callback::on_game_playing(&on_game_playing);
	callback::on_ai_spawned(&on_ai_spawned);
	callback::on_ai_killed(&on_ai_killed);
	callback::on_bleedout(&on_bleedout);
	callback::add_callback(#"objective_started", &function_e58dff05);
	callback::add_callback(#"objective_ended", &function_37c1c391);
	spawner::add_global_spawn_function(level.zombie_team, &namespace_85745671::function_2089690e);
	callback::on_spawned(&on_player_spawn);
	callback::on_connect(&on_player_connect);
	if(namespace_cf6efd05::function_85b812c9())
	{
		var_cc6e64ae = namespace_cf6efd05::function_21d402f4(#"hash_1601cc3215f4f8b3");
		setdvar(#"hash_325beef6162dc9c9", 1);
	}
	else
	{
		var_cc6e64ae = getdvarint(#"hash_7255c78e5d6bfa33", 1);
	}
	var_cc6e64ae = int(max(var_cc6e64ae, 1));
	namespace_553954de::function_7c97e961(var_cc6e64ae);
	namespace_ce1f29cc::function_15bf0b91(level.var_15d17eb2);
	setdvar(#"hash_50b18a791b1b5d34", 6);
	setdvar(#"hash_6e5f4d21ec1124ec", 4);
	setdvar(#"hash_51d59b9e94c5ff87", 1);
	setdvar(#"hash_40eb8467241c4747", 1);
	setdvar(#"hash_2f4280545354c82c", 1);
	setdvar(#"hash_2ac8ade37339f558", 0);
	setdvar(#"hash_5ea9a12f34af941e", 0);
	setdvar(#"hkai_pathfinditerationlimit", 2000);
	setsaveddvar(#"hash_1677d88b90b7fcf8", 1);
	level.var_13339abf = array(#"hash_41f5516d2a39d700", #"hash_7f522bf9ee249485", #"hash_2d2ce8582fb2b98", #"hash_68767e76af3b02ad", #"hash_294b09b399adeaf6", #"hash_335dbdca3e36e2bd");
	namespace_58949729::function_5a12541e();
	level.var_dcf5a517 = 1;
	namespace_d0ab5955::init();
	namespace_2c949ef8::init();
	level.progress_bar = luielembar::register();
	level thread function_33cac8e7();
	level.var_bc21b9a = &namespace_591b4396::function_b5019d74;
	callback::add_callback(#"hash_3b7d3ed9e484ef72", &give_match_bonus);
	callback::add_callback(#"hash_345e9169ebba28fb", &function_fa60a76c);
	spawner::add_ai_spawn_function(&function_4a9444dc);
}

/*
	Name: function_d7cf81e
	Namespace: zsurvival
	Checksum: 0x6CDEF67F
	Offset: 0x13C0
	Size: 0x160
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d7cf81e(targetplayer, &points)
{
	var_6bce8bda = [];
	players = getplayers();
	for(index = 0; index < points.size; index++)
	{
		point = points[index];
		valid = 1;
		foreach(player in players)
		{
			if(player === targetplayer || player == self)
			{
				continue;
			}
			dist_sq = distancesquared(player.origin, point);
			if(dist_sq < 256)
			{
				valid = 0;
				break;
			}
		}
		if(valid)
		{
			var_6bce8bda[var_6bce8bda.size] = point;
		}
	}
	return var_6bce8bda;
}

/*
	Name: function_4a9444dc
	Namespace: zsurvival
	Checksum: 0x179B4BE9
	Offset: 0x1528
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_4a9444dc()
{
	self thread function_acafdd66();
}

/*
	Name: function_acafdd66
	Namespace: zsurvival
	Checksum: 0xE7D7087A
	Offset: 0x1550
	Size: 0x230
	Parameters: 0
	Flags: Linked
*/
function function_acafdd66()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"bad_path");
		self callback::callback(#"bad_path");
		if(!is_false(self.var_7a6bf645))
		{
			self.var_4fe4e626 = 1;
		}
		enemy = zm_ai_utility::function_825317c(self);
		if(isdefined(self.enemy.var_125d950b) && isdefined(enemy))
		{
			enemy.var_125d950b = undefined;
		}
		if(!ispointonnavmesh(self.origin, self))
		{
			new_origin = getclosestpointonnavmesh(self.origin, 200, 90);
			if(isdefined(new_origin))
			{
				/#
					println((("" + self getentitynumber()) + "") + self.origin);
				#/
				self forceteleport(new_origin);
			}
		}
		else if(isdefined(enemy))
		{
			var_ca9a5b88 = distancesquared(self.origin, enemy.origin);
			if(var_ca9a5b88 < sqr(500))
			{
				self flag::set(#"hash_29e9ce4afa4f11d2");
				zm_ai_utility::function_68ab868a(self);
				if(isplayer(self.enemy))
				{
					self.enemy.var_dbb28b34 = -1;
				}
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_57292af3
	Namespace: zsurvival
	Checksum: 0xA4AAC5B
	Offset: 0x1788
	Size: 0x4B4
	Parameters: 0
	Flags: Linked
*/
function function_57292af3()
{
	callback::on_connect(&function_ee7f9c09);
	level flag::set(#"hash_4930756571725d11");
	level flag::wait_till(#"hash_7ace2c0d668c5128");
	if(!namespace_cf6efd05::function_85b812c9())
	{
		s_destination = level.var_7767cea8[0];
		if(isdefined(s_destination.target2) && !getdvarint(#"hash_2682124b2df6958e", 0))
		{
			foreach(player in getplayers())
			{
				player.var_f4e33249 = 1;
			}
			level.var_3dfa8db4 = 1;
			s_scene = struct::get(s_destination.target2);
			level scene::function_27f5972e(s_scene.scriptbundlename);
			level flag::wait_till("initial_blackscreen_passed");
			util::wait_network_frame(2);
			level thread namespace_9b972177::function_57292af3();
			namespace_66d6aa44::function_bb17da18();
			scene::function_497689f6(s_scene.scriptbundlename, "helicopter", "tag_probe_cabin", "prb_tn_us_heli_lg_cabin");
			scene::function_497689f6(s_scene.scriptbundlename, "helicopter", "tag_probe_cockpit", "prb_tn_us_heli_lg_cockpit");
			level scene::play(s_destination.target2, "targetname");
			level scene::function_f81475ae(s_scene.scriptbundlename);
			namespace_66d6aa44::function_db62d086();
			/#
				if(getdvarint(#"hash_6a54249f0cc48945", 0))
				{
					adddebugcommand("");
				}
			#/
			foreach(player in getplayers())
			{
				player dontinterpolate();
				player setorigin(player.resurrect_origin);
				player setplayerangles(player.resurrect_angles);
				player.var_f4e33249 = undefined;
			}
		}
	}
	else
	{
		level thread function_c8160daa();
	}
	music::setmusicstate("");
	level flag::clear(#"hash_4930756571725d11");
	callback::remove_on_connect(&function_ee7f9c09);
	array::thread_all(getplayers(), &val::reset, "intro_scene", "b_ignore_fow_damage");
	gamestate::set_state(#"playing");
	level flag::set(#"intro_scene_done");
}

/*
	Name: function_c8160daa
	Namespace: zsurvival
	Checksum: 0x9B3FE991
	Offset: 0x1C48
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_c8160daa()
{
	level flag::wait_till("initial_blackscreen_passed");
	music::setmusicstate("capsule_teleport_end");
}

/*
	Name: function_ee7f9c09
	Namespace: zsurvival
	Checksum: 0xF38CE7D1
	Offset: 0x1C90
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_ee7f9c09()
{
	self val::set("intro_scene", "b_ignore_fow_damage", 1);
}

/*
	Name: function_716def93
	Namespace: zsurvival
	Checksum: 0x25DC5048
	Offset: 0x1CC8
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function function_716def93(ispredictedspawn)
{
	if(ispredictedspawn)
	{
		self.resurrect_origin = (0, 0, 0);
		self.resurrect_angles = (0, 0, 0);
		spawn_point = {#angles:self.var_2e25e3b6, #origin:self.resurrect_origin};
		return spawn_point;
	}
	if(game.state == #"pregame" || game.state == #"playing")
	{
		return function_aad874d();
	}
	return friendly_respawn();
}

/*
	Name: function_aad874d
	Namespace: zsurvival
	Checksum: 0xC0380A8C
	Offset: 0x1DA0
	Size: 0x2F0
	Parameters: 0
	Flags: Linked
*/
function function_aad874d()
{
	if(!isdefined(level.var_7767cea8))
	{
		return undefined;
	}
	teammask = getteammask(self.team);
	teamindex = 0;
	while(teammask > 1)
	{
		teammask = teammask >> 1;
		teamindex++;
	}
	var_bae3dcae = teamindex % level.var_7767cea8.size;
	dest = level.var_7767cea8[var_bae3dcae];
	var_c1a973a4 = int(teamindex / level.var_7767cea8.size);
	var_92438b9c = (var_c1a973a4 * level.maxteamplayers) % dest.spawns.size;
	self.var_25fe2d03 = dest.var_343828ba;
	spawn = undefined;
	spawntime = gettime();
	if(!isdefined(dest.spawns[var_92438b9c].spawntime))
	{
		dest.spawns[var_92438b9c].spawntime = spawntime;
		spawn = dest.spawns[var_92438b9c];
	}
	else
	{
		var_f5bb80c2 = var_92438b9c;
		var_e34bb789 = dest.spawns[var_f5bb80c2].spawntime;
		for(idx = 0; idx < level.maxteamplayers; idx++)
		{
			spawnindex = (idx + var_92438b9c) % dest.spawns.size;
			if(!isdefined(dest.spawns[spawnindex].spawntime))
			{
				dest.spawns[spawnindex].spawntime = spawntime;
				spawn = dest.spawns[spawnindex];
				break;
				continue;
			}
			if(dest.spawns[spawnindex].spawntime < var_e34bb789)
			{
				var_f5bb80c2 = spawnindex;
				var_e34bb789 = dest.spawns[spawnindex].spawntime;
			}
		}
		if(!isdefined(spawn))
		{
			dest.spawns[var_f5bb80c2].spawntime = spawntime;
			spawn = dest.spawns[var_f5bb80c2];
		}
	}
	self.resurrect_origin = spawn.origin;
	self.resurrect_angles = spawn.angles;
	self spawn(spawn.origin, spawn.angles, "zsurvival");
	return spawn;
}

/*
	Name: friendly_respawn
	Namespace: zsurvival
	Checksum: 0x182448C
	Offset: 0x2098
	Size: 0x294
	Parameters: 0
	Flags: Linked
*/
function friendly_respawn()
{
	targetorigin = self.lastdeathpos;
	targetangles = self.angles;
	players = [];
	foreach(player in getplayers(self.team))
	{
		if(player != self && isalive(player))
		{
			players[players.size] = player;
		}
	}
	if(players.size > 0)
	{
		player = players[randomint(players.size)];
		targetorigin = player.origin;
		targetangles = player.angles;
	}
	else
	{
		if(isdefined(self.lastdeathpos))
		{
			targetorigin = self.lastdeathpos;
			if(isdefined(level.deathcircle) && isdefined(level.deathcircle.var_5c54ab33))
			{
				targetangles = vectortoangles(level.deathcircle.var_5c54ab33.origin - targetorigin);
			}
		}
		else
		{
			return function_aad874d();
		}
	}
	fwd = anglestoforward(targetangles);
	spawnorigin = (targetorigin - (fwd * 64)) + vectorscale((0, 0, 1), 50);
	self.resurrect_origin = spawnorigin;
	self.resurrect_angles = vectortoangles(fwd);
	self spawn(self.resurrect_origin, self.resurrect_angles, "zsurvival");
	spawn_point = {#angles:self.resurrect_angles, #origin:self.resurrect_origin};
	return spawn_point;
}

/*
	Name: on_player_spawn
	Namespace: zsurvival
	Checksum: 0x33A36090
	Offset: 0x2338
	Size: 0x3B4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawn()
{
	self.specialty = [];
	self.playleaderdialog = 1;
	targetplayer = undefined;
	if(isdefined(level.var_7d45d0d4.var_3385b421.var_543569ce))
	{
		spawn = level.var_7d45d0d4.var_3385b421 [[level.var_7d45d0d4.var_3385b421.var_543569ce]](self getentitynumber());
	}
	else
	{
		if(isdefined(self.var_f4710251))
		{
			targetplayer = getentbynum(self.var_f4710251);
		}
		else if(is_false(self.wasaliveatmatchstart) && getdvarint(#"hash_11cc747390ab2f74", 1))
		{
			var_67e0ed8d = array::randomize(function_a1ef346b());
			foreach(player in var_67e0ed8d)
			{
				if(player != self)
				{
					targetplayer = player;
					break;
				}
			}
		}
	}
	self.var_f4710251 = undefined;
	if(isdefined(targetplayer) && isalive(targetplayer))
	{
		spawn = squad_spawn::function_e402b74e(self, targetplayer);
		if(isdefined(spawn.angles) && (isfloat(spawn.angles[1]) || isint(spawn.angles[1])))
		{
			spawn.angles = (0, spawn.angles[1], 0);
		}
	}
	if(isdefined(spawn.origin) && isdefined(spawn.angles))
	{
		self dontinterpolate();
		self setorigin(spawn.origin);
		self setplayerangles(spawn.angles);
	}
	self player_free_fall::allow_player_basejumping(1);
	self squads::function_c70b26ea();
	if(namespace_cf6efd05::function_85b812c9() && !is_true(self.uspawn_already_spawned) && !is_true(self.is_hotjoin))
	{
		self luinotifyevent(#"hash_5b1ff06d07e9002a", 3, 2, level.var_b48509f9, 0);
	}
	self clientfield::set_player_uimodel("hudItems.zombiesSurvivalRespawn", 0);
}

/*
	Name: on_player_connect
	Namespace: zsurvival
	Checksum: 0x331F3C5B
	Offset: 0x26F8
	Size: 0xD2
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	level endon(#"game_ended");
	self endon(#"death", #"disconnect");
	level flag::wait_till(#"all_players_connected");
	waitframe(1);
	if(isdefined(self) && self.var_afe4efeb !== 1 && !getdvarint(#"hash_325beef6162dc9c9", 0))
	{
		self globallogic_ui::function_bc2eb1b8();
		self.var_afe4efeb = 1;
	}
}

/*
	Name: onprecachegametype
	Namespace: zsurvival
	Checksum: 0xFF2799B9
	Offset: 0x27D8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function onprecachegametype()
{
	level.canplayersuicide = &zm_gametype::canplayersuicide;
}

/*
	Name: onstartgametype
	Namespace: zsurvival
	Checksum: 0xFAA658D4
	Offset: 0x2800
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function onstartgametype()
{
	zm_behavior::function_70a657d8();
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
	spawning::function_7a87efaa();
	level thread function_e93291ff();
}

/*
	Name: function_e93291ff
	Namespace: zsurvival
	Checksum: 0x337D5CAF
	Offset: 0x2998
	Size: 0x30E
	Parameters: 0
	Flags: Linked
*/
function function_e93291ff()
{
	destinations = array(function_fef3deb1());
	if(destinations.size <= 0 || !isdefined(destinations[0]))
	{
		return;
	}
	destinations = arraysortclosest(destinations, (0, 0, 0));
	for(var_bae3dcae = 0; var_bae3dcae < destinations.size; var_bae3dcae++)
	{
		destinations[var_bae3dcae].var_343828ba = var_bae3dcae;
	}
	level.var_7767cea8 = [];
	/#
		if(getdvarint(#"hash_270a21a654a1a79f", 0))
		{
			level.var_94cbd997 = [];
			foreach(destination in destinations)
			{
				level.var_94cbd997 = arraycombine(level.var_94cbd997, namespace_8b6a9d79::function_f703a5a(destination), 0, 0);
			}
		}
	#/
	var_137456fd = getdvarint(#"wz_dest_id", -1);
	if(var_137456fd >= 0 && var_137456fd < destinations.size)
	{
		level.var_7767cea8[0] = destinations[var_137456fd];
		arrayremoveindex(destinations, var_137456fd);
	}
	else
	{
		while(destinations.size > 0 && level.var_7767cea8.size < 5)
		{
			var_bae3dcae = randomint(destinations.size);
			level.var_7767cea8[level.var_7767cea8.size] = destinations[var_bae3dcae];
			arrayremoveindex(destinations, var_bae3dcae);
		}
	}
	foreach(dest in level.var_7767cea8)
	{
		dest.spawns = namespace_8b6a9d79::function_f703a5a(dest);
	}
}

/*
	Name: on_game_playing
	Namespace: zsurvival
	Checksum: 0x563525EB
	Offset: 0x2CB0
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function on_game_playing()
{
	level thread function_9420630a();
	level flag::wait_till(#"intro_scene_done");
	array::delete_all(level.oob_triggers);
	/#
		if(getdvarint(#"hash_33b0be96bf3cd69a", 0))
		{
			level waittill(#"hash_581a9d913f67821a");
		}
	#/
	level thread namespace_ce1f29cc::function_5edfba39();
	level thread namespace_ce1f29cc::function_9e0aba37();
	level thread zm_powerups::powerup_round_start();
	level thread namespace_9b972177::function_5d985962(1);
	function_d547b972();
	level thread function_fbb2b180();
	if(namespace_cf6efd05::function_85b812c9())
	{
		level thread function_b0492e83();
		level flag::wait_till("initial_blackscreen_passed");
	}
	wait(1);
	if(!namespace_cf6efd05::function_85b812c9())
	{
		level thread zm_vo::function_7622cb70("objectiveBoostStart");
	}
}

/*
	Name: function_fbb2b180
	Namespace: zsurvival
	Checksum: 0x864272B
	Offset: 0x2E58
	Size: 0xC2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fbb2b180()
{
	function_3ca3c6e4();
	resetglass();
	if(isdefined(level.var_82eb1dab))
	{
		foreach(deathmodel in level.var_82eb1dab)
		{
			deathmodel delete();
		}
		level.var_82eb1dab = undefined;
	}
}

/*
	Name: function_b0492e83
	Namespace: zsurvival
	Checksum: 0x9D400D28
	Offset: 0x2F28
	Size: 0xFA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b0492e83()
{
	level endon(#"game_ended");
	level flag::wait_till(#"all_players_connected");
	level.var_c6dc0337 = 1;
	foreach(player in getplayers())
	{
		if(namespace_cf6efd05::function_99df13e0(player))
		{
			thread namespace_cf6efd05::function_642cc595(player);
		}
	}
	level.var_c6dc0337 = undefined;
}

/*
	Name: on_ai_spawned
	Namespace: zsurvival
	Checksum: 0x574B1E2E
	Offset: 0x3030
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function on_ai_spawned()
{
	if(!isactor(self))
	{
		return;
	}
	self function_8f8f0c52(800);
	self zm_score::function_82732ced();
	if(self.archetype === #"hash_7c0d83ac1e845ac2" && !isdefined(self.var_9fde8624) && self.team === level.zombie_team)
	{
		self thread function_398dbc69();
	}
}

/*
	Name: function_398dbc69
	Namespace: zsurvival
	Checksum: 0xB0B659BD
	Offset: 0x30E8
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_398dbc69()
{
	level endon(#"end_game", #"game_ended");
	self endon(#"death");
	n_delay = randomintrange(4, 7);
	wait(n_delay);
	while(true)
	{
		self zm_vo::function_d6f8bbd9(#"hash_2713f6cca57189d3");
		n_delay = randomintrange(60, 80);
		wait(n_delay);
	}
}

/*
	Name: on_ai_killed
	Namespace: zsurvival
	Checksum: 0xE48238E
	Offset: 0x31A8
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function on_ai_killed(s_params)
{
	if(!isactor(self))
	{
		return;
	}
	if(!isplayer(s_params.eattacker))
	{
		return;
	}
	self thread zm_powerups::function_b753385f(s_params.weapon);
}

/*
	Name: on_bleedout
	Namespace: zsurvival
	Checksum: 0x59FC5922
	Offset: 0x3218
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function on_bleedout()
{
	wait(2);
	self clientfield::set_player_uimodel("hudItems.zombiesSurvivalRespawn", 1);
	self thread function_3fd71c32();
	self thread [[level.spawnclient]](0);
}

/*
	Name: function_3fd71c32
	Namespace: zsurvival
	Checksum: 0x624D0A62
	Offset: 0x3278
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function function_3fd71c32()
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	self waittill(#"spawned");
	if(self.currentspectatingclient > -1)
	{
		self.var_f4710251 = self.currentspectatingclient;
	}
}

/*
	Name: function_889c6660
	Namespace: zsurvival
	Checksum: 0xD0DCF1D1
	Offset: 0x32E8
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function function_889c6660()
{
	wait(1);
}

/*
	Name: function_fef3deb1
	Namespace: zsurvival
	Checksum: 0x1B166F39
	Offset: 0x3300
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function function_fef3deb1()
{
	level flag::wait_till(#"hash_7ace2c0d668c5128");
	a_spawn_points = zm_destination_manager::function_f3be07d7(level.var_7d45d0d4.var_5f2429b1);
	var_58b02068 = struct::get(a_spawn_points[0].target, "targetname");
	level flag::set(#"hash_39574fd530246717");
	/#
		assert(isdefined(var_58b02068), "" + level.var_7d45d0d4.var_5f2429b1.targetname);
	#/
	return var_58b02068;
}

/*
	Name: function_33cac8e7
	Namespace: zsurvival
	Checksum: 0x9BEC007D
	Offset: 0x33E8
	Size: 0x1EC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_33cac8e7()
{
	level endon(#"game_ended");
	level flag::wait_till(#"hash_7ace2c0d668c5128");
	destinations = zm_destination_manager::function_2e165386();
	triggers = undefined;
	if(isdefined(destinations) && getdvarint(#"hash_d07e35f920d16a8", 1))
	{
		triggers = [];
		foreach(destination in destinations)
		{
			if(isdefined(destination.var_fe2612fe[#"hash_3460aae6bb799a99"]))
			{
				foreach(struct in destination.var_fe2612fe[#"hash_3460aae6bb799a99"])
				{
					triggers[triggers.size] = getent(struct.targetname, "target");
				}
			}
		}
	}
	namespace_85745671::function_b7dc3ab4(triggers);
}

/*
	Name: on_end_game
	Namespace: zsurvival
	Checksum: 0x4D19A679
	Offset: 0x35E0
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function on_end_game(waitresult)
{
	if(!is_true(level.var_1726e2c7))
	{
		if(waitresult.reason === #"all_players_dead" || waitresult.reason === #"last_player_died")
		{
			level notify(#"hash_8202877a3aadac8");
			if(level.var_7d45d0d4.var_3385b421.content_script_name !== "holdout")
			{
				level zm_vo::function_7622cb70("matchEndLose");
			}
		}
	}
	namespace_9b972177::on_end_game();
}

/*
	Name: give_custom_loadout
	Namespace: zsurvival
	Checksum: 0xE8849CE6
	Offset: 0x36B8
	Size: 0x330
	Parameters: 1
	Flags: None
*/
function give_custom_loadout(takeoldweapon)
{
	self endon(#"disconnect");
	if(!isdefined(takeoldweapon))
	{
		takeoldweapon = 0;
	}
	if(takeoldweapon)
	{
		oldweapon = self getcurrentweapon();
		weapons = self getweaponslist();
		foreach(weapon in weapons)
		{
			self takeweapon(weapon);
		}
	}
	nullprimary = getweapon(#"null_offhand_primary");
	self giveweapon(nullprimary);
	self setweaponammoclip(nullprimary, 0);
	self switchtooffhand(nullprimary);
	bare_hands = getweapon(#"bare_hands");
	self giveweapon(bare_hands);
	self function_c9a111a(bare_hands);
	self switchtoweapon(bare_hands, 1);
	if(self.firstspawn !== 0)
	{
		self setspawnweapon(bare_hands);
	}
	self.specialty = self getloadoutperks(0);
	self zm::register_perks();
	var_69126206 = [];
	var_2e1bd530 = [];
	var_2e1bd530[0] = 3;
	var_2e1bd530[1] = 1;
	var_2e1bd530[2] = 0;
	if(level.usingmomentum === 1)
	{
		for(sortindex = 0; sortindex < var_69126206.size && sortindex < var_2e1bd530.size; sortindex++)
		{
			if(var_69126206[sortindex].weapon != level.weaponnone)
			{
				self function_d9b9c4c6(var_2e1bd530[sortindex], var_69126206[sortindex].weapon);
			}
		}
	}
	self thread function_798c4aa9();
	return bare_hands;
}

/*
	Name: function_798c4aa9
	Namespace: zsurvival
	Checksum: 0x6B5DB1B3
	Offset: 0x39F0
	Size: 0x284
	Parameters: 0
	Flags: Linked
*/
function function_798c4aa9()
{
	self endon(#"disconnect");
	self notify("54bd3fdaa8dbe00b");
	self endon("54bd3fdaa8dbe00b");
	item_world::function_1b11e73c();
	while(!isdefined(self.inventory) || self.sessionstate !== "playing" || game.state !== #"playing")
	{
		waitframe(1);
	}
	backpack = function_4ba8fde(#"backpack_item");
	backpack.count = 1;
	var_fa3df96 = self item_inventory::function_e66dcff5(backpack);
	item_world::function_de2018e3(backpack, self, var_fa3df96);
	var_ea8725b3 = getdvarstring(#"hash_7187c1ee48f0a1a");
	if(!isdefined(var_ea8725b3) || var_ea8725b3 == "")
	{
		var_ea8725b3 = array::random(array(#"hash_4777f28d1a2ad7bf", #"hash_5d310a03cd9f9af4", #"hash_43e819ecb1562f21", #"hash_27a1d3b77a36f326", #"hash_2230087fda13a58c"));
	}
	item_weapon = function_4ba8fde(var_ea8725b3);
	var_fa3df96 = self item_inventory::function_e66dcff5(item_weapon);
	self item_world::function_de2018e3(item_weapon, self, var_fa3df96);
	weapon = namespace_a0d533d1::function_2b83d3ff(item_weapon);
	self setweaponammostock(weapon, weapon.maxammo);
	level flag::set(#"hash_394b4c458bf65ee1");
}

/*
	Name: give_match_bonus
	Namespace: zsurvival
	Checksum: 0x93B44E84
	Offset: 0x3C80
	Size: 0x388
	Parameters: 0
	Flags: Linked
*/
function give_match_bonus()
{
	players = getplayers();
	foreach(player in players)
	{
		var_22ba849f = getdvarint(#"hash_3f0689f4ecc2fbab", 0);
		var_19a80e4c = level.var_b48509f9;
		var_900d44db = zm::function_d3113f01(level.var_b48509f9);
		var_191f8e5e = var_900d44db.var_c6f2635d;
		var_7c032359 = var_900d44db.var_b93abbed[getplayers().size - 1];
		var_f65fd621 = function_7a2da789()[#"hash_31b5b9e273560fa9"];
		if(!isdefined(player.var_3b4f6b37))
		{
			player.var_3b4f6b37 = 0;
		}
		var_c602cc83 = player.var_3b4f6b37;
		var_47c394ad = var_19a80e4c - 1;
		for(var_173cd713 = 1; var_173cd713 <= var_47c394ad; var_173cd713++)
		{
			var_2a6bb6a1 = zm::function_d3113f01(var_173cd713).var_bd588afd;
			var_c602cc83 = var_c602cc83 - var_2a6bb6a1;
		}
		var_370ac26d = int(max(var_c602cc83, 0));
		player zm::function_78e7b549(var_370ac26d);
		if(var_370ac26d > 0)
		{
			player display_transition::function_d7b5082e();
		}
		/#
			println((((("" + player getentnum()) + "") + player.name) + "") + var_370ac26d);
			println("" + var_22ba849f);
			println("" + var_19a80e4c);
			println("" + var_191f8e5e);
			println("" + var_f65fd621);
			println("" + var_7c032359);
			println("" + var_c602cc83);
			println("");
		#/
	}
}

/*
	Name: function_fa60a76c
	Namespace: zsurvival
	Checksum: 0x3051DB7D
	Offset: 0x4010
	Size: 0x24A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fa60a76c(var_b48509f9)
{
	if(!isdefined(var_b48509f9))
	{
		var_b48509f9 = level.var_b48509f9;
	}
	if(!isdefined(level.var_64606faa))
	{
		level.var_64606faa = 0;
	}
	if(level.var_64606faa)
	{
		return;
	}
	level.var_64606faa = 1;
	var_370ac26d = zm::function_d3113f01(var_b48509f9).var_bd588afd;
	luinotifyevent(#"hash_3e6dd0ad7b864154", 1, var_370ac26d);
	foreach(player in getplayers())
	{
		if(!isdefined(player.var_3b4f6b37))
		{
			player.var_3b4f6b37 = 0;
		}
		player addrankxpvalue("capsule_end_xp", var_370ac26d, 4);
		var_1529f18e = getdvarint(#"hash_36b205ca21f0d3e2", 18);
		var_6474e59d = getdvarint(#"hash_7fd0f44fe160d41f", 300);
		var_3b5551ee = min((float(gettime() - (isdefined(level.starttime) ? level.starttime : 0))) / 60000, var_1529f18e);
		player.var_3b4f6b37 = player.var_3b4f6b37 + (int(var_6474e59d * var_3b5551ee));
	}
}

/*
	Name: function_37c1c391
	Namespace: zsurvival
	Checksum: 0x4AD67EEA
	Offset: 0x4268
	Size: 0x214
	Parameters: 1
	Flags: Linked
*/
function function_37c1c391(params)
{
	completed = params.completed;
	instance = params.instance;
	scriptname = instance.content_script_name;
	objectivenum = 0;
	if(isdefined(scriptname))
	{
		objectivenum = objective_manager::function_ae039b4(scriptname);
	}
	foreach(player in getplayers())
	{
		player luinotifyevent(#"hash_5b1ff06d07e9002a", 3, completed, 0, objectivenum);
		if(is_true(completed))
		{
			player zm_stats::function_945c7ce2(#"hash_629e66bd82d8cd38", 1);
			player zm_stats::increment_challenge_stat(#"hash_5381188bbb5fca9b");
			if(player.sessionstate === "spectator")
			{
				player notify(#"force_spawn");
			}
		}
	}
	util::delay(30, "game_ended", &namespace_ce1f29cc::function_fca72198);
	level util::delay(20, "game_ended", &flag::set, #"hash_44074059e3987765");
}

/*
	Name: function_e58dff05
	Namespace: zsurvival
	Checksum: 0x21AF7520
	Offset: 0x4488
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_e58dff05(params)
{
	namespace_ce1f29cc::function_368a7cde();
	level flag::clear(#"hash_44074059e3987765");
}

/*
	Name: function_5d7d3382
	Namespace: zsurvival
	Checksum: 0x8F000DC7
	Offset: 0x44D0
	Size: 0x1EC
	Parameters: 0
	Flags: Linked
*/
function function_5d7d3382()
{
	if(is_true(self.var_4439c2d9))
	{
		return;
	}
	var_481bf1b8 = (isdefined(level.var_b48509f9) ? level.var_b48509f9 : 1);
	var_3f20795a = var_481bf1b8 - 1;
	if(var_3f20795a <= 0)
	{
		var_3f20795a = 0;
	}
	var_30c91b24 = int(100 * (pow(1.1, var_3f20795a) - 1));
	var_16359d49 = int(100 * (pow(1.33, var_3f20795a) - 1));
	n_random = randomint(100);
	if(level.var_b48509f9 >= 10)
	{
		self namespace_85745671::function_9758722("super_sprint");
	}
	else
	{
		if(n_random <= var_30c91b24)
		{
			if(level.var_b48509f9 >= 5)
			{
				self namespace_85745671::function_9758722("super_sprint");
			}
			else
			{
				self namespace_85745671::function_9758722("sprint");
			}
		}
		else
		{
			if(n_random <= var_16359d49)
			{
				self namespace_85745671::function_9758722("sprint");
			}
			else
			{
				self namespace_85745671::function_9758722("run");
			}
		}
	}
}

/*
	Name: function_58d07657
	Namespace: zsurvival
	Checksum: 0x72BFF623
	Offset: 0x46C8
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_58d07657()
{
	var_697d7ff9 = 0;
	foreach(player in getplayers())
	{
		if(is_true(player.var_16735873))
		{
			var_697d7ff9 = 1;
			break;
		}
	}
	while(var_697d7ff9)
	{
		var_697d7ff9 = 0;
		foreach(player in getplayers())
		{
			if(is_true(player.var_16735873))
			{
				var_697d7ff9 = 1;
				break;
			}
		}
		if(!var_697d7ff9)
		{
			break;
		}
		wait(1);
	}
}

/*
	Name: function_f30d46d0
	Namespace: zsurvival
	Checksum: 0x46B60C4B
	Offset: 0x4848
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function function_f30d46d0()
{
	if(!is_true(self.hasspawned))
	{
		return true;
	}
	if(zm_player::function_3799b373())
	{
		return true;
	}
	return false;
}

/*
	Name: function_9420630a
	Namespace: zsurvival
	Checksum: 0xF8519026
	Offset: 0x4890
	Size: 0xF8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9420630a()
{
	level flag::wait_till(#"hash_5aca8d24a1f56ee1");
	if(!isdefined(level.var_86e072a5))
	{
		return;
	}
	var_86e072a5 = array::randomize(level.var_86e072a5);
	var_7005086c = min(level.var_b48509f9, 7);
	for(i = 0; i < var_86e072a5.size; i++)
	{
		struct = var_86e072a5[i];
		namespace_58949729::function_7e02195f(struct, struct.var_3a053962, struct.var_dae71351);
		if((i + 1) >= var_7005086c)
		{
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_452e5ad6
	Namespace: zsurvival
	Checksum: 0x357C381D
	Offset: 0x4990
	Size: 0x254
	Parameters: 0
	Flags: Linked
*/
function function_452e5ad6()
{
	if(isdefined(level.var_7d45d0d4.var_3385b421) && level.var_7d45d0d4.var_3385b421.content_script_name === "holdout")
	{
		s_instance = level.var_7d45d0d4.var_3385b421;
		if(isdefined(s_instance.a_s_teleports))
		{
			for(i = 0; i < s_instance.a_s_teleports.size; i++)
			{
				if(!positionwouldtelefrag(s_instance.a_s_teleports[i].origin))
				{
					v_teleport = s_instance.a_s_teleports[i];
					return v_teleport;
				}
			}
		}
	}
	a_spots = namespace_85745671::function_e4791424(self.origin, 16, 80, 2000, 1000, 0);
	a_spots = array::randomize(a_spots);
	v_teleport = {#origin:self.origin};
	foreach(spot in a_spots)
	{
		if(ispointonnavmesh(spot.origin, 15))
		{
			v_dest = function_9cc082d2(spot.origin, 128);
			if(isdefined(v_dest) && namespace_d0ab5955::function_3824d2dc(v_dest[#"point"]))
			{
				v_teleport = {#origin:v_dest[#"point"]};
				break;
			}
		}
	}
	return v_teleport;
}

/*
	Name: function_72d130aa
	Namespace: zsurvival
	Checksum: 0xDD4C59F0
	Offset: 0x4BF0
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_72d130aa()
{
	n_delay = (is_true(self.var_6d71557a) ? level.playerrespawndelay / 2 : level.playerrespawndelay);
	return n_delay;
}

/*
	Name: function_37778628
	Namespace: zsurvival
	Checksum: 0x368C1B2B
	Offset: 0x4C48
	Size: 0x1BE
	Parameters: 1
	Flags: None
*/
function function_37778628(var_cc6e64ae)
{
	/#
		if(var_cc6e64ae > 0)
		{
			if(!isdefined(level.var_7a303742))
			{
				level.var_7a303742 = level.var_b48509f9;
			}
			namespace_553954de::function_7c97e961(var_cc6e64ae);
			iprintlnbold("" + var_cc6e64ae);
		}
		else if(isdefined(level.var_7a303742))
		{
			namespace_553954de::function_7c97e961(level.var_7a303742);
			level.var_7a303742 = undefined;
			iprintlnbold("");
		}
		a_ai = getaiarray();
		foreach(ai in a_ai)
		{
			if(isalive(ai))
			{
				if(var_cc6e64ae > 0)
				{
					if(!isdefined(ai.var_fd23b38f))
					{
						ai.var_fd23b38f = ai.health;
					}
					continue;
				}
				if(isdefined(ai.var_fd23b38f))
				{
					ai.health = ai.var_fd23b38f;
					ai.var_fd23b38f = undefined;
				}
			}
		}
	#/
}

/*
	Name: function_4ddaff8e
	Namespace: zsurvival
	Checksum: 0x476FEBC5
	Offset: 0x4E10
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_4ddaff8e()
{
	/#
		function_128f8f9f();
		util::add_debug_command("");
		util::add_debug_command("");
		level.var_c7b02cfe = &function_447a93ab;
	#/
}

/*
	Name: function_128f8f9f
	Namespace: zsurvival
	Checksum: 0x3846DAB5
	Offset: 0x4E80
	Size: 0x194
	Parameters: 0
	Flags: Private
*/
function private function_128f8f9f()
{
	/#
		foreach(map in [2:{#hash_19a686ca:#"hash_15e3cdab677aed", #name:""}, 1:{#hash_19a686ca:#"hash_d9c18f112ff4552", #name:""}, 0:{#hash_19a686ca:#"hash_45f866da7af3a609", #name:""}])
		{
			util::add_debug_command(((("" + map.name) + "") + map.name) + "");
		}
		util::add_debug_command("");
	#/
}

/*
	Name: function_2531fcc8
	Namespace: zsurvival
	Checksum: 0x1DDA4A3A
	Offset: 0x5020
	Size: 0x21C
	Parameters: 0
	Flags: Private
*/
function private function_2531fcc8()
{
	/#
		foreach(map in [2:{#hash_19a686ca:#"hash_15e3cdab677aed", #name:""}, 1:{#hash_19a686ca:#"hash_d9c18f112ff4552", #name:""}, 0:{#hash_19a686ca:#"hash_45f866da7af3a609", #name:""}])
		{
			foreach(category in level.var_4e996a3f)
			{
				util::add_debug_command(((((("" + map.name) + "") + function_9e72a96(category) + "") + map.name) + "") + function_9e72a96(category) + "");
			}
		}
	#/
}

/*
	Name: function_447a93ab
	Namespace: zsurvival
	Checksum: 0x2EFB6F6E
	Offset: 0x5248
	Size: 0x262
	Parameters: 1
	Flags: None
*/
function function_447a93ab(params)
{
	/#
		switch(params.value)
		{
			case "hash_1460b3afd614fb6c":
			{
				namespace_ce1f29cc::function_368a7cde();
				wait(1);
				level flag::set(#"hash_1460b3afd614fb6c");
				level notify(#"objective_ended", {#completed:1});
				break;
			}
			case "hash_579280d018cff87a":
			{
				function_2531fcc8();
				break;
			}
			default:
			{
				if(issubstr(params.value, ""))
				{
					foreach(player in getplayers())
					{
						player.var_5d80a93b = player getcurrentweapon();
					}
					cmd_tokens = strtok(params.value, "");
					switch(cmd_tokens.size)
					{
						case 3:
						{
							namespace_18bbc38e::function_8e64a2b1(cmd_tokens[1], cmd_tokens[2]);
						}
						case 2:
						{
							namespace_553954de::function_1aa044d3(cmd_tokens[1]);
							break;
						}
						case 1:
						{
							zm_destination_manager::load_next_map();
							break;
						}
					}
				}
				break;
			}
		}
	#/
}

