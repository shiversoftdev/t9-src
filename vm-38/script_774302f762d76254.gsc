#using script_6991584fc21f5ae8;
#using script_2c9915120c137848;
#using script_2474a362752098d2;
#using script_36fc02e86719d0f5;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_3bbf85ab4cb9f3c2;
#using script_40f967ad5d18ea74;
#using script_3faf478d5b0850fe;
#using script_47851dbeea22fe66;
#using script_1ce46999727f2f2b;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_f25df01962c79c6;
#using script_6b6510e124bad778;
#using script_634ae70c663d1cc9;
#using script_4d8045dbc17aa3ee;
#using script_1b0b07ff57d1dde3;
#using script_350cffecd05ef6cf;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_50fca1a24ae351;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_5549681e1669c11a;
#using script_f38dc50f0e82277;
#using script_413ab8fe25a61c50;
#using script_68cdf0ca5df5e;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_75d4e6ecb8f05163;

#namespace namespace_4dae815d;

/*
	Name: function_9e19a181
	Namespace: namespace_4dae815d
	Checksum: 0x476F80DA
	Offset: 0x530
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9e19a181()
{
	level notify(-840427643);
}

/*
	Name: init
	Namespace: namespace_4dae815d
	Checksum: 0x73E7377B
	Offset: 0x550
	Size: 0x37C
	Parameters: 0
	Flags: None
*/
function init()
{
	level.var_43cd3fe5 = doa_keytrade::register();
	level.doa = spawnstruct();
	level.doa.world_state = 0;
	level.doa.var_cf250523 = &namespace_b59ddbce::callback_playerkilled;
	level.doa.var_abe40be4 = &namespace_b59ddbce::callback_playerdamage;
	level.doa.var_cd10d20a = &namespace_b59ddbce::callback_playerlaststand;
	level.doa.var_16a35e94 = &namespace_7f5aeb59::function_ebcb2cca;
	level.doa.var_abd5eb1e = &function_d41688e3;
	level.doa.var_99ee4341 = &function_ce7e12de;
	level.doa.var_3bc55386 = &namespace_6e90e490::initplayerhud;
	level.doa.var_d0b39b1a = &namespace_eccff4fb::initplayer;
	level.doa.var_502e9288 = &namespace_d2efac9a::initplayer;
	namespace_13fefac0::init();
	clientfield::register("world", "world_state", 1, 3, "int");
	clientfield::register("world", "roundNumber", 1, 10, "int");
	clientfield::function_5b7d846d("DOA_GLOBALUIMODEL_WORLDSTATE", 1, 3, "int");
	clientfield::function_5b7d846d("DOA_GLOBALUIMODEL_COUNTDOWN", 1, 11, "int");
	clientfield::function_5b7d846d("DOA_GLOBALUIMODEL_ARENANUMBER", 1, 4, "int");
	clientfield::function_5b7d846d("DOA_GLOBALUIMODEL_ROUNDNUMBER", 1, 16, "int");
	mapcenter = struct::get("map_center", "targetname");
	if(isdefined(mapcenter))
	{
		level.mapcenter = mapcenter.origin;
	}
	else
	{
		level.mapcenter = (0, 0, 0);
	}
	setmapcenter(level.mapcenter);
	if(!isdefined(level.doa))
	{
		level.doa = spawnstruct();
	}
	level.doa.doa_bundle = getscriptbundle("doa_bundle");
	level thread function_170b90e5();
	callback::add_callback(#"menu_response", &on_menu_response);
}

/*
	Name: function_76322483
	Namespace: namespace_4dae815d
	Checksum: 0xFD70E43F
	Offset: 0x8D8
	Size: 0x202
	Parameters: 1
	Flags: None
*/
function function_76322483(player)
{
	foreach(guy in getplayers())
	{
		guy closeingamemenu();
	}
	if(isdefined(player) && !is_true(level.gameended))
	{
		player globallogic::gamehistoryplayerquit();
	}
	if(is_true(level.var_bc0ddd7d))
	{
		return;
	}
	namespace_1e25ad94::debugmsg("=========================================== DOA END =============================================");
	level.var_bc0ddd7d = 1;
	level notify(#"end_game");
	level notify(#"exit_level");
	level notify(#"game_over");
	level flag::set("doa_game_is_over");
	namespace_ec06fe4a::function_445bad70();
	skillupdate();
	level namespace_d2efac9a::function_47498d07(1);
	level namespace_d2efac9a::function_ca76d4a();
	namespace_1e25ad94::debugmsg("=========================================== EXIT LEVEL CALLED =============================================");
	exitlevel(0);
	wait(666);
}

/*
	Name: on_menu_response
	Namespace: namespace_4dae815d
	Checksum: 0xFFFA20C4
	Offset: 0xAE8
	Size: 0x8C
	Parameters: 1
	Flags: Private
*/
function private on_menu_response(eventstruct)
{
	if(eventstruct.response == "endround")
	{
		if(isdefined(level.doa.var_99ee4341))
		{
			level thread [[level.doa.var_99ee4341]](1);
			level waittill(#"hash_659967997e5f426e");
		}
		level thread function_76322483(self);
	}
}

/*
	Name: function_9ad4988
	Namespace: namespace_4dae815d
	Checksum: 0xF89ABF76
	Offset: 0xB80
	Size: 0x16C
	Parameters: 0
	Flags: None
*/
function function_9ad4988()
{
	objective_setstate(13, "invisible");
	objective_setstate(12, "invisible");
	objective_setstate(11, "invisible");
	objective_setstate(10, "invisible");
	objective_setstate(14 + 0, "invisible");
	objective_setstate(14 + 1, "invisible");
	objective_setstate(14 + 2, "invisible");
	objective_setstate(14 + 3, "invisible");
	objective_setstate(14 + 4, "invisible");
	objective_setstate(14 + 5, "invisible");
}

/*
	Name: function_32d5e898
	Namespace: namespace_4dae815d
	Checksum: 0x2E083A77
	Offset: 0xCF8
	Size: 0x49C
	Parameters: 0
	Flags: None
*/
function function_32d5e898()
{
	level.doa.world_state = 0;
	level.doa.roundnumber = 0;
	level.doa.var_4cfbc260 = 0;
	level.doa.var_997a0313 = 0;
	level.doa.var_6c58d51 = 0;
	level.doa.var_b456a02b = 0;
	level.doa.var_afae28e0 = 0;
	level.doa.var_3e7292fc = 100;
	level.doa.var_9f7a910d = undefined;
	level.doa.var_8be900a6 = undefined;
	level.doa.var_848746c8 = undefined;
	level.doa.var_a77e6349 = undefined;
	level.doa.var_1f2c7d5f = undefined;
	level.doa.var_a3e53b88 = undefined;
	level.doa.var_8f710e5d = undefined;
	level.doa.var_41adf604 = undefined;
	level.doa.var_318aa67a = getdvarint(#"hash_670ddb067d311f3d", 0);
	level.var_7dcdbe16 = level.doa.var_318aa67a;
	level.doa.var_13e8f9c9 = undefined;
	level.doa.var_25f4de97 = 0;
	level.doa.var_1e31cd70 = 0;
	level.doa.gamestarttime = gettime();
	level.doa.var_bcc1fc05 = 0;
	level.doa.var_4ebe1b74 = 0;
	level.doa.var_2e2d85d4 = 0;
	level.var_9fa19717 = 0;
	level.var_40d076a7 = 0;
	level.var_52f56101 = undefined;
	level.doa.var_af74d0b = 0;
	level.doa.var_4425d066 = undefined;
	level.doa.var_60e0f7a0 = gettime();
	level flag::clear("doa_game_is_over");
	level flag::clear("doa_round_paused");
	level flag::clear("doa_round_spawning");
	level flag::clear("doa_round_over");
	level flag::clear("doa_players_all_dead");
	level flag::clear("doa_rof_visited");
	level flag::clear("doa_roj_visited");
	level flag::clear("doa_podium_showPlaces");
	level.doa.downedplayers = [];
	level.var_68de7e10 = 0;
	level.var_52f56101 = undefined;
	if(isdefined(level.doa.var_5598fe58))
	{
		foreach(silverback in level.doa.var_5598fe58)
		{
			if(isdefined(silverback))
			{
				silverback delete();
			}
		}
	}
	level.doa.var_5598fe58 = [];
	level.doa.var_65a70dc = doa_enemy::function_d7c5adee("basic_zombie");
	function_3ca3c6e4();
	function_9ad4988();
	setdvar(#"hash_54488b7c651bd0ec", 0);
}

/*
	Name: function_170b90e5
	Namespace: namespace_4dae815d
	Checksum: 0x9638B9A8
	Offset: 0x11A0
	Size: 0x43C
	Parameters: 0
	Flags: None
*/
function function_170b90e5()
{
	if(!isdefined(level.flag) || !is_true(level.flag[#"load_main_complete"]))
	{
		level waittill(#"load_main_complete");
	}
	setdvar(#"compassmaxrange", 2100);
	level flag::init("doa_game_initialized", 0);
	level flag::init("doa_game_is_over", 0);
	level flag::init("doa_players_all_dead", 0);
	level flag::init("doa_round_paused", 0);
	level flag::init("doa_round_spawning", 0);
	level flag::init("doa_round_over", 0);
	level flag::init("doa_rof_visited", 0);
	level flag::init("doa_roj_visited", 0);
	level flag::init("doa_podium_showPlaces", 0);
	namespace_8c04284b::init();
	namespace_77eccc4f::init();
	namespace_a6ddb172::init();
	namespace_5a917022::init();
	namespace_1e25ad94::init();
	namespace_41cb996::init();
	doa_enemy::init();
	doa_fate::init();
	namespace_83eb6304::init();
	namespace_ed80aead::init();
	namespace_268747c0::init();
	namespace_6e90e490::init();
	namespace_b7d49cfd::init();
	doa_pickups::init();
	namespace_b59ddbce::init();
	namespace_eccff4fb::init();
	namespace_e32bb68::init();
	namespace_d2efac9a::init();
	namespace_9fc66ac::init();
	namespace_c85a46fe::init();
	doa_wild::init();
	namespace_491fa2b2::init();
	namespace_a6056a45::init();
	level thread namespace_981c1f3c::init();
	level thread namespace_e857b038::init();
	level flag::set("doa_game_initialized");
	level.doa.var_be74bf2c = -1;
	waitframe(1);
	game_reset();
	if(!is_true(getdvar(#"hash_613a0a3fd49510cd")))
	{
		function_eb9e8b26(0);
		level.callbackplayermigrated = &donothing;
		level.callbackhostmigration = &donothing;
		level.callbackhostmigrationsave = &donothing;
		level.callbackprehostmigrationsave = &donothing;
	}
}

/*
	Name: donothing
	Namespace: namespace_4dae815d
	Checksum: 0x80F724D1
	Offset: 0x15E8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function donothing()
{
}

/*
	Name: function_e22d3978
	Namespace: namespace_4dae815d
	Checksum: 0x8C8647C6
	Offset: 0x15F8
	Size: 0x1AC
	Parameters: 1
	Flags: None
*/
function function_e22d3978(number)
{
	if(!isdefined(number))
	{
		number = level.doa.roundnumber;
	}
	dx = number - level.doa.roundnumber;
	level.doa.roundnumber = number;
	level clientfield::set("roundNumber", level.doa.roundnumber);
	level clientfield::set_world_uimodel("DOA_GLOBALUIMODEL_ROUNDNUMBER", level.doa.roundnumber);
	foreach(player in getplayers())
	{
		if(!isdefined(player.doa))
		{
			continue;
		}
		player.doa.var_7e445455 = player.doa.var_7e445455 + dx;
	}
	setroundsplayed(level.doa.roundnumber);
	namespace_9fc66ac::function_2fc07d61();
}

/*
	Name: function_59a9cf1d
	Namespace: namespace_4dae815d
	Checksum: 0x6EA4DD02
	Offset: 0x17B0
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function function_59a9cf1d()
{
	return level.doa.world_state;
}

/*
	Name: function_21cd3890
	Namespace: namespace_4dae815d
	Checksum: 0x3EF1375F
	Offset: 0x17D0
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function function_21cd3890(state)
{
	laststate = level.doa.world_state;
	level.doa.world_state = state;
	level clientfield::set("world_state", level.doa.world_state);
	level clientfield::set_world_uimodel("DOA_GLOBALUIMODEL_WORLDSTATE", level.doa.world_state);
	namespace_9fc66ac::function_65fcd877();
	level notify(#"hash_460213205489abb4", {#state:state});
	return laststate;
}

/*
	Name: game_reset
	Namespace: namespace_4dae815d
	Checksum: 0x3784EE20
	Offset: 0x18B8
	Size: 0x2A4
	Parameters: 0
	Flags: None
*/
function game_reset()
{
	if(level.doa.var_be74bf2c > 0)
	{
		namespace_1e25ad94::debugmsg("DOA Game Reset:" + level.doa.var_be74bf2c);
	}
	level notify(#"game_reset");
	level.doa.var_c420eee9 = 1;
	level.doa.var_be74bf2c++;
	function_32d5e898();
	level thread function_8682e93e();
	level thread function_e591be12();
	level thread function_e60cadb8();
	doa_pickups::function_18372b20();
	namespace_491fa2b2::main();
	namespace_a6056a45::main();
	namespace_ec06fe4a::function_de70888a();
	namespace_ec06fe4a::clearallcorpses();
	function_21cd3890(0);
	function_e22d3978();
	namespace_a6ddb172::function_7a0e5387();
	level namespace_77eccc4f::main();
	level thread namespace_981c1f3c::main();
	level thread namespace_6e90e490::function_db945ce9();
	level thread namespace_b59ddbce::main();
	level thread namespace_8c04284b::main();
	level thread doa_enemy::main();
	level thread doa_fate::main();
	level thread doa_wild::main();
	level thread namespace_268747c0::main();
	level thread namespace_5a917022::main();
	level thread namespace_9fc66ac::main();
	level thread namespace_d2efac9a::main();
	level thread main();
}

/*
	Name: main
	Namespace: namespace_4dae815d
	Checksum: 0x4878C986
	Offset: 0x1B68
	Size: 0x424
	Parameters: 0
	Flags: None
*/
function main()
{
	self notify("5ccccfb7afd2af0a");
	self endon("5ccccfb7afd2af0a");
	level flag::wait_till("all_players_connected");
	while(level flag::get("gameplay_started") == 0)
	{
		waitframe(1);
	}
	wait(0.1);
	level notify(#"hash_671684f03a58b3a3");
	level.var_9dab87f7 = gettime();
	var_8d747a1 = 1;
	level.doa.var_c420eee9 = 0;
	while(var_8d747a1)
	{
		waitframe(1);
		var_8d747a1 = !level flag::get("doa_players_all_dead");
		if(!var_8d747a1)
		{
			result = undefined;
			if(!is_true(level.doa.var_8be900a6))
			{
				result = function_a511c7c4();
			}
			if(isdefined(result))
			{
				var_8d747a1 = result;
				if(result)
				{
					level flag::clear("doa_players_all_dead");
				}
			}
		}
	}
	player = getplayers()[0];
	if(isdefined(player) && level.var_43cd3fe5 doa_keytrade::is_open(player))
	{
		level.var_43cd3fe5 doa_keytrade::close();
	}
	level flag::set("doa_game_is_over");
	level notify(#"game_over");
	level.doa.var_318aa67a = 0;
	function_21cd3890(1);
	util::wait_network_frame();
	foreach(player in getplayers())
	{
		player notify(#"hash_7893364bd228d63e", {#hash_cff8d1e:1});
		player namespace_7f5aeb59::function_5b373dae();
	}
	if(isdefined(level.doa.var_99ee4341))
	{
		level thread [[level.doa.var_99ee4341]]();
		level waittill(#"hash_659967997e5f426e");
	}
	else
	{
		wait(15);
	}
	if(isdefined(level.doa.var_a77e6349))
	{
		[[ level.doa.var_a77e6349 ]]->deactivate();
		level namespace_c85a46fe::function_edfcfa44();
		level.doa.var_a77e6349 = undefined;
	}
	if(!getdvarint(#"hash_5913c79841cafe3e", 0))
	{
		level.gameended = 1;
		level thread function_76322483();
		return;
	}
	level namespace_d2efac9a::function_47498d07();
	level thread game_reset();
}

/*
	Name: function_d41688e3
	Namespace: namespace_4dae815d
	Checksum: 0xDADBFA1F
	Offset: 0x1F98
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_d41688e3()
{
	level flag::set("doa_players_all_dead");
}

/*
	Name: function_ce7e12de
	Namespace: namespace_4dae815d
	Checksum: 0xD6BF5E78
	Offset: 0x1FC8
	Size: 0x198
	Parameters: 1
	Flags: None
*/
function function_ce7e12de(var_c042523)
{
	if(!isdefined(var_c042523))
	{
		var_c042523 = 0;
	}
	level flag::set("doa_game_is_over");
	level notify(#"game_over");
	namespace_ec06fe4a::function_445bad70();
	level thread namespace_ec06fe4a::function_de70888a(0);
	level notify(#"hash_7893364bd228d63e");
	level namespace_6e90e490::function_fa6f7ba7();
	if(var_c042523 == 0 && isdefined(level.doa.var_cb342cbc))
	{
		level [[level.doa.var_cb342cbc]]();
	}
	function_21cd3890(1);
	level namespace_a6ddb172::function_7a0e5387(59);
	level thread namespace_9fc66ac::announce(72);
	luinotifyevent(#"force_scoreboard", 1, 0);
	wait(7);
	util::preload_frontend();
	wait(3);
	level namespace_7f5aeb59::function_67f054d7();
	level notify(#"hash_659967997e5f426e");
}

/*
	Name: function_a511c7c4
	Namespace: namespace_4dae815d
	Checksum: 0x2547B645
	Offset: 0x2168
	Size: 0x3E8
	Parameters: 0
	Flags: None
*/
function function_a511c7c4()
{
	if(is_true(level.doa.var_41adf604))
	{
		return 0;
	}
	players = namespace_7f5aeb59::function_23e1f90f();
	if(players.size > 1)
	{
		return 0;
	}
	player = players[0];
	if(!isdefined(player) || !isdefined(player.doa) || player.doa.score.keys <= 0)
	{
		return 0;
	}
	player endon(#"disconnect");
	player.doa.respawning = 0;
	var_4b98f072 = spawnstruct();
	var_4b98f072.var_917afa01 = 0;
	var_4b98f072.result = 0;
	var_4b98f072.timeleft = 15;
	var_4b98f072.var_5b55ba1f = function_21cd3890(2);
	level flag::set("doa_round_paused");
	if(!level.var_43cd3fe5 doa_keytrade::is_open(player))
	{
		if(!is_true(level.doa.var_318aa67a))
		{
			while(is_true(player.doa.var_3e81d24c))
			{
				waitframe(1);
			}
		}
		util::wait_network_frame(3);
		level.var_43cd3fe5 doa_keytrade::open(player, 1);
		level.var_efd3338c = 1;
	}
	player thread function_295c3381(var_4b98f072);
	while(var_4b98f072.timeleft > 0)
	{
		level clientfield::set_world_uimodel("DOA_GLOBALUIMODEL_COUNTDOWN", var_4b98f072.timeleft);
		wait(1);
		var_4b98f072.timeleft = var_4b98f072.timeleft - 1;
	}
	if(!isdefined(level.doa.var_6f3d327))
	{
		namespace_6e90e490::function_fa6f7ba7();
	}
	level.var_43cd3fe5 doa_keytrade::close(player);
	level notify(#"hash_47730e778d03543b");
	level.var_efd3338c = undefined;
	if(var_4b98f072.result)
	{
		player stats::inc_stat(#"hash_64fd75a9ce18b89f", #"keys", var_4b98f072.var_917afa01 * -1);
		uploadstats(player);
		level.doa.var_8be900a6 = 1;
		function_21cd3890(var_4b98f072.var_5b55ba1f);
	}
	player clientfield::increment_to_player("controlBinding");
	level flag::clear("doa_round_paused");
	return var_4b98f072.result && player.doa.score.lives > 0;
}

/*
	Name: function_49592bf9
	Namespace: namespace_4dae815d
	Checksum: 0x88FA2400
	Offset: 0x2558
	Size: 0x126
	Parameters: 1
	Flags: None
*/
function function_49592bf9(var_4b98f072)
{
	level endon(#"hash_47730e778d03543b");
	self endon(#"disconnect");
	var_7d86dbf8 = self gamepadusedlast();
	setdvar(#"hash_54488b7c651bd0ec", !var_7d86dbf8);
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		response = waitresult.response;
		if(response == "menu_second_chance_cancel")
		{
			var_4b98f072.result = 0;
			var_4b98f072.timeleft = 0;
			setdvar(#"hash_54488b7c651bd0ec", 0);
			level notify(#"hash_47730e778d03543b");
			return;
		}
	}
}

/*
	Name: function_295c3381
	Namespace: namespace_4dae815d
	Checksum: 0xF5988C53
	Offset: 0x2688
	Size: 0x428
	Parameters: 1
	Flags: None
*/
function function_295c3381(var_4b98f072)
{
	level endon(#"hash_47730e778d03543b");
	self endon(#"disconnect");
	var_7ce1e87 = 0;
	var_44294245 = 0;
	var_4b98f072.result = 0;
	self thread function_49592bf9(var_4b98f072);
	while(true)
	{
		if(self.doa.score.lives > 0 && self.doa.score.keys > 0)
		{
			level.var_43cd3fe5 doa_keytrade::set_textboxhint(self, hash(#"hash_66f6e25631ff2352"));
		}
		else
		{
			if(self.doa.score.keys > 0)
			{
				level.var_43cd3fe5 doa_keytrade::set_textboxhint(self, hash(#"hash_1c0a5279bafa7779"));
			}
			else
			{
				level.var_43cd3fe5 doa_keytrade::set_textboxhint(self, hash(#"hash_305f779ad154229"));
			}
		}
		if(self.doa.score.lives > 0)
		{
			level.var_43cd3fe5 doa_keytrade::set_confirmbtn(self, hash(#"hash_344d11efdbb3a755"));
		}
		else
		{
			level.var_43cd3fe5 doa_keytrade::set_confirmbtn(self, hash(""));
		}
		if(self usebuttonpressed() && self.doa.score.lives > 0)
		{
			var_4b98f072.result = 1;
			var_4b98f072.timeleft = 0;
			setdvar(#"hash_54488b7c651bd0ec", 0);
			return;
		}
		if(self secondaryoffhandbuttonpressed())
		{
			var_7ce1e87 = 1;
		}
		else
		{
			if(var_7ce1e87)
			{
				if(self.doa.score.lives > 0)
				{
					self.doa.score.lives--;
					var_4b98f072.var_917afa01--;
					self.doa.score.keys++;
				}
			}
			var_7ce1e87 = 0;
		}
		var_7d86dbf8 = self gamepadusedlast();
		if(var_7d86dbf8 && self fragbuttonpressed() || (!var_7d86dbf8 && self meleebuttonpressed()))
		{
			var_44294245 = 1;
		}
		else
		{
			if(var_44294245)
			{
				if(self.doa.score.keys > 0 && self.doa.score.lives < 3)
				{
					self.doa.score.lives++;
					var_4b98f072.var_917afa01++;
					self.doa.score.keys--;
				}
			}
			var_44294245 = 0;
		}
		waitframe(1);
	}
}

/*
	Name: function_8682e93e
	Namespace: namespace_4dae815d
	Checksum: 0x20D8FBD7
	Offset: 0x2AB8
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function function_8682e93e()
{
	self notify("66f20331233ffd5c");
	self endon("66f20331233ffd5c");
	if(level flag::get("doa_rof_visited"))
	{
		return;
	}
	result = undefined;
	result = level waittill(#"hash_77a8f97f2648672");
	if(result.name != "jungle_1")
	{
		level thread function_8682e93e();
	}
	level thread doa_fate::function_11463552();
	level waittill(#"hash_325440d5433be263", #"game_over");
	level thread function_8682e93e();
}

/*
	Name: function_e591be12
	Namespace: namespace_4dae815d
	Checksum: 0x338705EC
	Offset: 0x2BB0
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_e591be12()
{
	self notify("6e9bc0427b140bde");
	self endon("6e9bc0427b140bde");
	level endon(#"doa_roj_visited");
	if(level flag::get("doa_roj_visited"))
	{
		return;
	}
	while(true)
	{
		level waittill(#"hash_2282d796a1f7533a");
		if(level.doa.roundnumber > 64)
		{
			if(!level flag::get("doa_roj_visited"))
			{
				level.doa.var_848746c8 = "roj";
			}
			level waittill(#"hash_593a6814c28d14e7");
			if(level flag::get("doa_roj_visited"))
			{
				return;
			}
		}
	}
}

/*
	Name: function_e60cadb8
	Namespace: namespace_4dae815d
	Checksum: 0x175B96F2
	Offset: 0x2CB8
	Size: 0x6A
	Parameters: 0
	Flags: None
*/
function function_e60cadb8()
{
	level endon(#"game_over");
	self notify("1705ac3f1deb40a1");
	self endon("1705ac3f1deb40a1");
	while(true)
	{
		level waittill(#"hash_77e4bcc14697c018");
		level.doa.var_60e0f7a0 = 0;
	}
}

