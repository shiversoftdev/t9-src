#using script_4611af4073d18808;
#using script_36fc02e86719d0f5;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_774302f762d76254;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_50fca1a24ae351;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_5549681e1669c11a;
#using script_f38dc50f0e82277;
#using script_68cdf0ca5df5e;
#using scripts\core_common\bots\bot.gsc;
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

#namespace namespace_e857b038;

/*
	Name: function_7e9c94d2
	Namespace: namespace_e857b038
	Checksum: 0x99780428
	Offset: 0xC68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7e9c94d2()
{
	level notify(1230649119);
}

/*
	Name: init
	Namespace: namespace_e857b038
	Checksum: 0x6D80EC3E
	Offset: 0xC88
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	callback::on_spawned(&on_bot_spawned);
	level thread setupdevgui();
}

/*
	Name: on_bot_spawned
	Namespace: namespace_e857b038
	Checksum: 0xEFC93A89
	Offset: 0xCD0
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function on_bot_spawned()
{
	player = getplayers()[0];
	if(self istestclient())
	{
		origin = player.origin + (randomintrange(-100, 100), randomintrange(-100, 100), 30);
		self setorigin(origin);
	}
}

/*
	Name: setupdevgui
	Namespace: namespace_e857b038
	Checksum: 0x1E393F2B
	Offset: 0xD80
	Size: 0x264
	Parameters: 0
	Flags: Linked
*/
function setupdevgui()
{
	/#
		if(getdvarint(#"hash_dfb36b6ef77c4fe", 0) == 1)
		{
			level thread function_8f024d05();
		}
		if(getdvarint(#"hash_5b503e419423d065", 0) == 1)
		{
			level thread function_9ec06f93();
		}
		level waittill(#"doa_game_initialized");
		execdevgui("");
		function_61b604bf();
		level thread devguithink();
	#/
	level.doa.var_598305fe = 0;
	level.doa.var_2e491399 = 0;
	level.doa.var_ca7d285b = 15;
	if(getdvarint(#"hash_56a6b1d074ad2f5d", 0) == 1)
	{
		level.doa.var_2e491399 = 1;
		level thread function_507d29b2();
	}
	if(getdvarint(#"hash_63b27cb45671e35c", 0))
	{
		setdvar(#"hash_63b27cb45671e35c", 0);
		setdvar(#"hash_d874e4e73e9f18", 1);
		level thread function_8cac3f8c();
	}
	if(getdvarint(#"hash_d874e4e73e9f18", 0) && !is_true(level.var_a095060b))
	{
		level thread function_1552e594();
	}
}

/*
	Name: devguithink
	Namespace: namespace_e857b038
	Checksum: 0x4A7EEAD1
	Offset: 0xFF0
	Size: 0x2C30
	Parameters: 0
	Flags: None
*/
function devguithink()
{
	setdvar(#"zombie_devgui", "");
	setdvar(#"scr_spawn_pickup", "");
	setdvar(#"hash_58c5fb7998861ea3", "basic_zombie");
	setdvar(#"hash_4e8b5bae739da5a", "zombietron_lmg");
	setdvar(#"hash_1c923c83363c543b", "");
	setdvar(#"scr_spawn_room", "");
	setdvar(#"scr_arena_activate", "");
	setdvar(#"scr_bonus_room_activate", "");
	setdvar(#"scr_spawn_enemy", "");
	setdvar(#"scr_wild_activate", "");
	setdvar(#"hash_2d6ac7bedd2e2d8", "");
	while(true)
	{
		if(getdvarint(#"hash_d874e4e73e9f18", 0))
		{
			if(!is_true(level.var_a095060b))
			{
				level thread function_1552e594();
			}
		}
		else if(is_true(level.var_a095060b))
		{
			level notify(#"hash_12d79bc0fed4ee5a");
		}
		cmd = getdvarstring(#"zombie_devgui");
		if(cmd == "")
		{
			wait(0.5);
			continue;
		}
		origin = namespace_7f5aeb59::function_23e1f90f()[0].origin;
		namespace_1e25ad94::debugmsg(("Devgui Cmd-->") + cmd);
		switch(cmd)
		{
			case "hash_5ed1696f28fe5666":
			{
				if(!isdefined(level.doa.var_ade3e372))
				{
					level.doa.var_ade3e372 = 0;
				}
				level.doa.var_ade3e372 = !level.doa.var_ade3e372;
				level thread function_ade3e372();
				break;
			}
			case "hash_5e0fc049ab86a8c0":
			{
				level notify(#"round_over");
				level flag::set("arena_zero_rounds");
				level flag::clear("doa_round_spawning");
				level thread function_de70888a();
				level namespace_ec06fe4a::function_b6b79fd1();
				break;
			}
			case "hash_e172fdc803f50b":
			{
				if(is_true(level.doa.var_c93506fb))
				{
					level.doa.var_c93506fb = undefined;
					level notify(#"hash_39ebcccef3aa05c6");
					break;
				}
				level.doa.var_c93506fb = 1;
				idx = 0;
				level thread function_c93506fb();
			}
			case "hash_4599146c78031b2d":
			{
				if(!isdefined(level.doa.var_39e3fa99))
				{
					break;
				}
				if(([[ level.doa.var_39e3fa99 ]]->getname()) != "island")
				{
					namespace_1e25ad94::debugmsg("ROF cmd only works from island level");
					break;
				}
				level.doa.var_e15152e6 = "jungle_1";
				level.doa.var_baeb966b = 0;
				level notify(#"round_over");
				level flag::set("arena_zero_rounds");
				level flag::clear("doa_round_spawning");
				level thread function_de70888a();
				level namespace_ec06fe4a::function_b6b79fd1();
				namespace_ec06fe4a::clearallcorpses();
				level waittill(#"waiting_on_player_exit_decidechoice");
				wait(0.2);
				level notify(#"hash_45f77908e3043522", {#note:"enter_the_wild"});
				level waittilltimeout(3, #"hash_58caf0ade03043bb");
				wait(2);
				level namespace_a6ddb172::function_7a0e5387();
				wait(1);
				if(!isdefined(idx))
				{
					idx = namespace_981c1f3c::function_61e1a1cb(getdvarstring(#"hash_2d6ac7bedd2e2d8"));
				}
				var_4bd98f7c = getentarray("dungeon_generator", "targetname");
				if(!isdefined(idx) || idx == 0)
				{
					level.doa.var_8823e378 = var_4bd98f7c[randomint(var_4bd98f7c.size)].origin;
				}
				else
				{
					foreach(var_1c59693d in var_4bd98f7c)
					{
						if(var_1c59693d.target === getdvarstring(#"hash_2d6ac7bedd2e2d8"))
						{
							level.doa.var_8823e378 = var_1c59693d.origin;
							break;
						}
					}
					if(!isdefined(level.doa.var_8823e378))
					{
						level.doa.var_8823e378 = var_4bd98f7c[randomint(var_4bd98f7c.size)].origin;
					}
				}
				foreach(player in getplayers())
				{
					player setorigin(level.doa.var_8823e378);
				}
				break;
			}
			case "hash_596169604e05dd60":
			{
				if(!isdefined(level.doa.var_39e3fa99))
				{
					break;
				}
				if(([[ level.doa.var_39e3fa99 ]]->getname()) != "island")
				{
					namespace_1e25ad94::debugmsg("ROF cmd only works from island level");
					return;
				}
				level.doa.var_e15152e6 = "jungle_1";
				level.doa.var_baeb966b = 0;
				level notify(#"round_over");
				level flag::set("arena_zero_rounds");
				level flag::clear("doa_round_spawning");
				level thread function_de70888a();
				level namespace_ec06fe4a::function_b6b79fd1();
				namespace_ec06fe4a::clearallcorpses();
				level waittill(#"waiting_on_player_exit_decidechoice");
				wait(0.2);
				level notify(#"hash_45f77908e3043522", {#note:"enter_the_wild"});
				level waittilltimeout(3, #"hash_58caf0ade03043bb");
				level namespace_a6ddb172::function_7a0e5387();
				var_6fdeb679 = getent("room_of_fate_shaft_trigger", "targetname").origin;
				foreach(player in getplayers())
				{
					player setorigin(var_6fdeb679);
				}
				break;
			}
			case "hash_192ba0c0796a9ce8":
			{
				var_28979c91 = array::randomize(level.doa.var_fe92efd8);
				i = 0;
				foreach(player in getplayers())
				{
					fate = var_28979c91[i];
					i++;
					player thread doa_fate::function_15a789ab(fate.var_c8386627);
					wait(0.5);
				}
				break;
			}
			case "fate":
			{
				player = namespace_7f5aeb59::function_23e1f90f()[0];
				var_c8386627 = int(getdvarstring(#"scr_spawn_pickup"));
				player thread doa_fate::function_15a789ab(var_c8386627);
				break;
			}
			case "hash_516660c49395257f":
			{
				level notify(#"round_over");
				level flag::clear("doa_round_spawning");
				level thread function_de70888a();
				level namespace_ec06fe4a::function_b6b79fd1();
				namespace_ec06fe4a::clearallcorpses();
				level.doa.var_848746c8 = getdvarstring(#"scr_bonus_room_activate");
				namespace_1e25ad94::debugmsg("Bonus room being forced to: " + level.doa.var_848746c8);
				break;
			}
			case "hash_4d164e6a1ddc33e1":
			{
				level.doa.var_848746c8 = getdvarstring(#"scr_bonus_room_activate");
				namespace_1e25ad94::debugmsg("Bonus room soak being forced to: " + level.doa.var_848746c8);
				level thread namespace_5a917022::function_e5c7bce7();
				break;
			}
			case "enemy":
			{
				if(!isdefined(level.doa.var_39e3fa99))
				{
					break;
				}
				spot = [[ level.doa.var_39e3fa99 ]]->function_70fb5745().origin;
				doa_enemy::function_a6b807ea(doa_enemy::function_d7c5adee(getdvarstring(#"scr_spawn_enemy")), 1, spot);
				break;
			}
			case "corner":
			{
				level thread function_43548cd2();
				break;
			}
			case "fly":
			{
				/#
					player = namespace_7f5aeb59::function_23e1f90f()[0];
					player thread namespace_a4bedd45::function_1f704cee(1);
					adddebugcommand("");
					setsaveddvar(#"hash_7aa67f68d1a1b28d", 10);
					level namespace_a6ddb172::function_7a0e5387();
					objective_setstate(10, "");
					namespace_1e25ad94::function_8225da57();
					player notify(#"hash_7893364bd228d63e", {#hash_cff8d1e:1});
					adddebugcommand("");
				#/
				if(!is_true(player.doa.var_3e81d24c))
				{
				}
				else
				{
				}
				break;
			}
			case "hash_2f0f3c1aee7828d7":
			{
				foreach(player in namespace_7f5aeb59::function_23e1f90f())
				{
					player.doa.var_3cf36932 = !player.doa.var_3cf36932;
					namespace_1e25ad94::debugmsg((("Arena Saftey for player (" + player.doa.color) + ") is set to:") + (player.doa.var_3cf36932 ? "ON" : "OFF"));
				}
				break;
			}
			case "arena":
			{
				level.doa.var_39459d49 = 0;
				var_e1dd1170 = namespace_8c04284b::function_a7c5291d(getdvarstring(#"scr_arena_activate"));
				level thread namespace_8c04284b::function_41e097fc(var_e1dd1170);
				break;
			}
			case "hash_348a45c1bc20d9b6":
			{
				namespace_1e25ad94::function_4e3cfad("Forcing waveSpawner to CLASSIC");
				setdvar(#"hash_23f1ebb21fe023b", 1);
				level flag::clear("doa_round_spawning");
				level notify(#"round_over");
				namespace_1e25ad94::debugmsg("Killing all enemy AI");
				waitframe(1);
				level.doa.var_dcbded2 = [];
				level thread function_de70888a();
				level namespace_ec06fe4a::function_b6b79fd1();
				namespace_ec06fe4a::clearallcorpses();
				break;
			}
			case "hash_4d7f5258f341a427":
			{
				namespace_1e25ad94::function_4e3cfad("Forcing waveSpawner to HERD");
				setdvar(#"hash_23f1ebb21fe023b", 2);
				level flag::clear("doa_round_spawning");
				level notify(#"round_over");
				namespace_1e25ad94::debugmsg("Killing all enemy AI");
				waitframe(1);
				level.doa.var_dcbded2 = [];
				level thread function_de70888a();
				level namespace_ec06fe4a::function_b6b79fd1();
				namespace_ec06fe4a::clearallcorpses();
				break;
			}
			case "hash_3e86f92f4dae558d":
			{
				namespace_1e25ad94::function_4e3cfad("Forcing waveSpawner to GATEMASTER");
				setdvar(#"hash_23f1ebb21fe023b", 3);
				level flag::clear("doa_round_spawning");
				level notify(#"round_over");
				namespace_1e25ad94::debugmsg("Killing all enemy AI");
				waitframe(1);
				level.doa.var_dcbded2 = [];
				level thread function_de70888a();
				level namespace_ec06fe4a::function_b6b79fd1();
				namespace_ec06fe4a::clearallcorpses();
				break;
			}
			case "hash_48c1404bafded35f":
			{
				namespace_1e25ad94::function_4e3cfad("Forcing waveSpawner to DEFAULT");
				setdvar(#"hash_23f1ebb21fe023b", 3);
				level flag::clear("doa_round_spawning");
				level notify(#"round_over");
				namespace_1e25ad94::debugmsg("Killing all enemy AI");
				waitframe(1);
				level.doa.var_dcbded2 = [];
				level thread function_de70888a();
				level namespace_ec06fe4a::function_b6b79fd1();
				namespace_ec06fe4a::clearallcorpses();
				break;
			}
			case "itemstats":
			{
				if(is_true(level.doa.var_3beef3ad))
				{
					level notify(#"hash_5775b641c4a1dff6");
					level.doa.var_3beef3ad = 0;
				}
				else
				{
					level thread function_9ec06f93();
				}
				break;
			}
			case "hash_23c602341a3f0d8c":
			{
				if((level.doa.var_ca7d285b & 1) != 0)
				{
					level.doa.var_ca7d285b = level.doa.var_ca7d285b & (~1);
				}
				else
				{
					level.doa.var_ca7d285b = level.doa.var_ca7d285b | 1;
				}
				break;
			}
			case "hash_23c603341a3f0f3f":
			{
				if((level.doa.var_ca7d285b & 2) != 0)
				{
					level.doa.var_ca7d285b = level.doa.var_ca7d285b & (~2);
				}
				else
				{
					level.doa.var_ca7d285b = level.doa.var_ca7d285b | 2;
				}
				break;
			}
			case "hash_23c604341a3f10f2":
			{
				if((level.doa.var_ca7d285b & 4) != 0)
				{
					level.doa.var_ca7d285b = level.doa.var_ca7d285b & (~4);
				}
				else
				{
					level.doa.var_ca7d285b = level.doa.var_ca7d285b | 4;
				}
				break;
			}
			case "hash_23c605341a3f12a5":
			{
				if((level.doa.var_ca7d285b & 8) != 0)
				{
					level.doa.var_ca7d285b = level.doa.var_ca7d285b & (~8);
				}
				else
				{
					level.doa.var_ca7d285b = level.doa.var_ca7d285b | 8;
				}
				break;
			}
			case "roundstats":
			{
				if(is_true(level.doa.var_c560430c))
				{
					level notify(#"hash_32fcc4870af9184f");
					level.doa.var_c560430c = 0;
				}
				else
				{
					level thread function_8f024d05();
				}
				break;
			}
			case "wild":
			{
				if(isdefined(level.doa.var_a77e6349))
				{
					exit = [[ level.doa.var_a77e6349 ]]->function_5acbc98e();
					exit.trigger notify(#"trigger");
					level waittill(#"hash_325440d5433be263");
					level waittill(#"hash_28b51ed78ee920f1");
					wait(1);
				}
				cmd = getdvarstring(#"scr_wild_activate");
				args = strtok(cmd, "@");
				level.doa.var_e15152e6 = args[0];
				level.doa.var_baeb966b = int(args[1]);
				level.doa.zombie_health = doa_wild::function_271e0d71(level.doa.var_e15152e6, level.doa.var_baeb966b);
				level notify(#"round_over");
				level flag::set("arena_zero_rounds");
				level flag::clear("doa_round_spawning");
				level thread function_de70888a();
				level namespace_ec06fe4a::function_b6b79fd1();
				namespace_ec06fe4a::clearallcorpses();
				break;
			}
			case "flip":
			{
				namespace_8c04284b::function_a70ff03e(!level.doa.var_ecff3871);
				break;
			}
			case "hash_4ce30f9f2b25ddae":
			{
				namespace_1e25ad94::function_8225da57();
				break;
			}
			case "hash_2a09add45a0410e7":
			{
				namespace_1e25ad94::function_d88064ec();
				break;
			}
			case "weaponcharger":
			{
				level.doa.var_11623c49 = 0;
				level.doa.var_a6cd0cb7 = 1;
				break;
			}
			case "pickup":
			{
				namespace_1e25ad94::debugmsg("spawning pickup " + getdvarstring(#"scr_spawn_pickup"));
				item = doa_pickups::function_6265bde4(getdvarstring(#"scr_spawn_pickup"));
				if(isdefined(item))
				{
					if(isdefined(level.doa.var_39e3fa99))
					{
						origin = [[ level.doa.var_39e3fa99 ]]->function_70fb5745(origin).origin;
					}
					if(([[ item ]]->function_5ce4fb28()) == 13)
					{
						level doa_pickups::function_d06cbfe8(origin, 1, 256, undefined, item, 1);
					}
					else
					{
						level doa_pickups::function_83aea294(origin, 5, 256, item, undefined, 1);
					}
				}
				break;
			}
			case "hash_5ae8c695795780ae":
			{
				namespace_1e25ad94::debugmsg("Here is a bunch of stuff for you!");
				level doa_pickups::function_ad7ac41b(origin, 20, 256, 0, 1);
				break;
			}
			case "hash_186fa8790696385a":
			{
				namespace_1e25ad94::debugmsg("Weapon aresenal incomming!!");
				level doa_pickups::function_ad7ac41b(origin, 20, 256, 6, 1);
				break;
			}
			case "money":
			{
				namespace_1e25ad94::debugmsg("big money, BIG PRIZES!");
				level doa_pickups::function_68442ee7(origin, 20, 256);
				level doa_pickups::function_68442ee7(origin, 20, 128, 1);
				break;
			}
			case "hash_340cf8f497c2fa9":
			{
				namespace_1e25ad94::debugmsg("Max Score Multiplier!");
				foreach(player in namespace_7f5aeb59::function_23e1f90f())
				{
					player.doa.score.var_a928c52e = level.doa.var_88be0b68;
				}
				break;
			}
			case "gem":
			{
				namespace_1e25ad94::debugmsg("Gems!");
				doa_pickups::function_d06cbfe8(origin, 20, 256);
				break;
			}
			case "hash_5677f59ee744ad3":
			{
				namespace_1e25ad94::debugmsg("Gems Launching!");
				doa_pickups::function_d06cbfe8(origin, 1, 128, 1);
				break;
			}
			case "king":
			{
				namespace_1e25ad94::debugmsg("Hail to the King baby!");
				foreach(player in namespace_7f5aeb59::function_23e1f90f())
				{
					player thread function_ddde8af6();
				}
				break;
			}
			case "hash_32f10e7eebda6ed5":
			{
				level notify(#"hash_6b0c389ef8ac36b4");
				break;
			}
			case "kill":
			{
				namespace_1e25ad94::debugmsg("death has been notified ...");
				players = namespace_7f5aeb59::function_23e1f90f();
				if(players.size == 1)
				{
					player = players[0];
				}
				else
				{
					player = players[randomint(players.size)];
				}
				player dodamage(player.health + 100, player.origin);
				break;
			}
			case "kill_all":
			{
				namespace_1e25ad94::debugmsg("death to all...");
				players = namespace_7f5aeb59::function_23e1f90f();
				foreach(player in players)
				{
					player dodamage(player.health + 100, player.origin);
				}
				break;
			}
			case "hash_ca0bb68723c267c":
			{
				namespace_1e25ad94::debugmsg("death to all bots...");
				players = namespace_7f5aeb59::function_23e1f90f();
				bots = [];
				var_c8dd979c = (0, 0, 0);
				targetplayer = players[randomint(players.size)];
				foreach(player in players)
				{
					if(player == targetplayer)
					{
						var_c8dd979c = player.origin + vectorscale((0, 0, 1), 20);
						player dodamage(player.health + 100, player.origin);
						continue;
					}
					bots[bots.size] = player;
				}
				foreach(bot in bots)
				{
					bot setorigin(var_c8dd979c);
				}
				break;
			}
			case "max_score":
			{
				foreach(player in namespace_7f5aeb59::function_23e1f90f())
				{
					player.doa.score.var_1397c196 = 115115115;
					player.doa.score.var_96798a01 = player.doa.score.var_1397c196;
				}
				break;
			}
			case "hash_35dc70d843071d01":
			{
				level.doa.var_2e491399 = !level.doa.var_2e491399;
				if(level.doa.var_2e491399)
				{
					foreach(player in namespace_7f5aeb59::function_23e1f90f())
					{
						player thread namespace_7f5aeb59::function_19616199();
					}
				}
				break;
			}
			case "hash_653100f8b6de2231":
			{
				namespace_5a917022::function_9da359eb();
				break;
			}
			case "hash_7fafc90102def2d4":
			{
				level.doa.var_8f710e5d = 1;
				setdvar(#"hash_267a8e5d4aab4191", 1);
			}
			case "hash_10ad94be51c3eb8e":
			{
				level flag::clear("doa_round_spawning");
				level notify(#"round_over");
				namespace_1e25ad94::debugmsg("Killing all enemy AI");
				waitframe(1);
				level.doa.var_dcbded2 = [];
				level thread function_de70888a();
				level namespace_ec06fe4a::function_b6b79fd1();
				namespace_ec06fe4a::clearallcorpses();
				break;
			}
			case "hash_7fe8e0602be387d1":
			{
				setdvar(#"hash_d874e4e73e9f18", (getdvarint(#"hash_d874e4e73e9f18", 0) > 0 ? 0 : 1));
				break;
			}
			case "hash_2de1d3669fb18997":
			{
				setdvar(#"hash_d874e4e73e9f18", 2);
				break;
			}
			case "hash_5f8b768219110179":
			{
				setdvar(#"hash_d874e4e73e9f18", 3);
				break;
			}
			case "hash_157b8f006d6b5973":
			{
				setdvar(#"hash_d874e4e73e9f18", 4);
				break;
			}
			case "hash_5701d70855a0ab97":
			{
				namespace_4dae815d::function_21cd3890((level.doa.world_state == 4 ? 0 : 4));
				break;
			}
			case "hash_733328256697a260":
			{
				setdvar(#"hash_18f07d96e21f2083", 1);
			}
			case "gameover":
			{
				players = namespace_7f5aeb59::function_23e1f90f();
				foreach(player in players)
				{
					player.doa.score.lives = 0;
					player dodamage(player.health + 100, player.origin);
				}
				break;
			}
			case "hash_74c80147d91d653e":
			{
				level.doa.var_598305fe = !level.doa.var_598305fe;
				level thread function_598305fe();
				break;
			}
			case "hash_6f957c9ffba3bfe1":
			{
				level.doa.roundnumber = level.doa.roundnumber + 10;
				level.doa.var_f4cf4e3 = namespace_8c04284b::function_f15b9f04(level.doa.roundnumber);
				level.doa.zombie_health = namespace_8c04284b::function_962e9d92(level.doa.roundnumber);
				namespace_4dae815d::function_e22d3978(level.doa.roundnumber);
				namespace_1e25ad94::debugmsg("Round set to: " + level.doa.roundnumber);
				break;
			}
			case "hash_23b75207d8e015d4":
			{
				level.doa.roundnumber = level.doa.roundnumber - 10;
				if(level.doa.roundnumber < 1)
				{
					level.doa.roundnumber = 1;
				}
				level.doa.var_f4cf4e3 = namespace_8c04284b::function_f15b9f04(level.doa.roundnumber);
				level.doa.zombie_health = namespace_8c04284b::function_962e9d92(level.doa.roundnumber);
				namespace_4dae815d::function_e22d3978(level.doa.roundnumber);
				namespace_1e25ad94::debugmsg("Round set to: " + level.doa.roundnumber);
				break;
			}
			case "hash_1e8483160e436b06":
			{
				var_94f3b914 = getdvar(#"hash_58c5fb7998861ea3");
				break;
			}
			case "hash_609ef494db2ab837":
			{
				player = getplayers()[0];
				level doa_pickups::itemspawn(doa_pickups::function_6265bde4(getdvar(#"hash_4e8b5bae739da5a", "zombietron_lmg")), player.origin, undefined, undefined, 1, undefined, undefined, undefined, player);
				break;
			}
		}
		setdvar(#"zombie_devgui", "");
		setdvar(#"scr_spawn_pickup", "");
	}
}

/*
	Name: function_9ec06f93
	Namespace: namespace_e857b038
	Checksum: 0x526B96FA
	Offset: 0x3C28
	Size: 0x89C
	Parameters: 0
	Flags: Linked
*/
function function_9ec06f93()
{
	self notify("28086a2fae2b7907");
	self endon("28086a2fae2b7907");
	level endon(#"hash_5775b641c4a1dff6", #"game_over");
	level.doa.var_3beef3ad = 1;
	xoff = 100;
	yoff = 200;
	level namespace_a6ddb172::function_7a0e5387();
	itemdefs = [];
	foreach(def in level.doa.pickups.itemdefs)
	{
		/#
			def.var_88ce3439 = function_9e72a96([[ def ]]->getname());
		#/
		if(!isdefined(itemdefs))
		{
			itemdefs = [];
		}
		else if(!isarray(itemdefs))
		{
			itemdefs = array(itemdefs);
		}
		itemdefs[itemdefs.size] = def;
	}
	while(true)
	{
		waitframe(1);
		x = xoff;
		y = yoff;
		namespace_1e25ad94::function_70e370a(x, y, "ITEM STATS", (1, 1, 1), 1, 2, 0.05);
		y = y + 40;
		var_914554bd = 0;
		foreach(def in level.doa.pickups.itemdefs)
		{
			other = 1;
			if(([[ def ]]->function_2c127eb5()) == 999999)
			{
				continue;
			}
			if(([[ def ]]->function_5ce4fb28()) == 1 || ([[ def ]]->function_5ce4fb28()) == 2 || ([[ def ]]->function_5ce4fb28()) == 13)
			{
				other = 0;
				if((level.doa.var_ca7d285b & 1) == 0)
				{
					continue;
				}
			}
			if(([[ def ]]->function_5ce4fb28()) == 6)
			{
				other = 0;
				if((level.doa.var_ca7d285b & 2) == 0)
				{
					continue;
				}
			}
			if(doa_pickups::function_4821dfcf([[ def ]]->function_5ce4fb28()))
			{
				other = 0;
				if((level.doa.var_ca7d285b & 4) == 0)
				{
					continue;
				}
			}
			if(other && (level.doa.var_ca7d285b & 8) == 0)
			{
				continue;
			}
			var_914554bd = var_914554bd + doa_pickups::function_72e8509(def);
		}
		loc_00004090:
		loc_000040CC:
		loc_00004108:
		text = (((("ITEMS SPAWNED: " + var_914554bd) + ("   ITEM MASK - MONEY(") + ((level.doa.var_ca7d285b & 1) != 0 ? "ON" : "OFF") + ")  WEAPONS(") + ((level.doa.var_ca7d285b & 2) != 0 ? "ON" : "OFF") + ")  VEHICLES(") + ((level.doa.var_ca7d285b & 4) != 0 ? "ON" : "OFF") + ")  OHTER(") + ((level.doa.var_ca7d285b & 8) != 0 ? "ON" : "OFF") + ")";
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1.3, 0.05);
		y = y + 30;
		if(var_914554bd == 0)
		{
			continue;
		}
		var_db7cb1ce = array::quick_sort(itemdefs, &function_2dbde8cf);
		counter = 1;
		for(idx = var_db7cb1ce.size - 1; idx >= 0; idx--)
		{
			other = 1;
			def = var_db7cb1ce[idx];
			if(([[ def ]]->function_2c127eb5()) == 999999)
			{
				continue;
			}
			if(([[ def ]]->function_5ce4fb28()) == 1 || ([[ def ]]->function_5ce4fb28()) == 2 || ([[ def ]]->function_5ce4fb28()) == 13)
			{
				other = 0;
				if((level.doa.var_ca7d285b & 1) == 0)
				{
					continue;
				}
			}
			if(([[ def ]]->function_5ce4fb28()) == 6)
			{
				other = 0;
				if((level.doa.var_ca7d285b & 2) == 0)
				{
					continue;
				}
			}
			if(doa_pickups::function_4821dfcf([[ def ]]->function_5ce4fb28()))
			{
				other = 0;
				if((level.doa.var_ca7d285b & 4) == 0)
				{
					continue;
				}
			}
			if(other && (level.doa.var_ca7d285b & 8) == 0)
			{
				continue;
			}
			text = (("" + def.var_88ce3439) + " count: ") + ([[ def ]]->function_b3131904());
			if(var_914554bd > 0)
			{
				var_d905e426 = (" [ " + (int(((([[ def ]]->function_b3131904()) / var_914554bd) * 100) + 0.5))) + (" % ]");
			}
			namespace_1e25ad94::function_70e370a(x, y, ("" + counter) + ". ", (1, 1, 1), 1, 1, 0.05);
			namespace_1e25ad94::function_70e370a(x + 50, y, text, (1, 1, 1), 1, 1, 0.05);
			namespace_1e25ad94::function_70e370a(x + 500, y, var_d905e426, (1, 1, 1), 1, 1, 0.05);
			counter++;
			y = y + 20;
			if(y >= 1020)
			{
				y = yoff + 70;
				x = x + 770;
			}
		}
	}
}

/*
	Name: function_2dbde8cf
	Namespace: namespace_e857b038
	Checksum: 0xC4962CAE
	Offset: 0x44D0
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function function_2dbde8cf(a, b)
{
	return ([[ a ]]->function_b3131904()) < ([[ b ]]->function_b3131904());
}

/*
	Name: function_8f024d05
	Namespace: namespace_e857b038
	Checksum: 0x761B5113
	Offset: 0x4508
	Size: 0xFAC
	Parameters: 0
	Flags: Linked
*/
function function_8f024d05()
{
	self notify("1dcd781c8849eb9b");
	self endon("1dcd781c8849eb9b");
	level endon(#"hash_32fcc4870af9184f", #"game_over");
	level.doa.var_c560430c = 1;
	xoff = 100;
	yoff = 200;
	while(true)
	{
		waitframe(1);
		if(!isdefined(level.doa.roundstarttime))
		{
			continue;
		}
		if(namespace_4dae815d::function_59a9cf1d() != 0)
		{
			continue;
		}
		x = xoff;
		y = yoff;
		namespace_1e25ad94::function_70e370a(x, y, ("ROUND " + level.doa.roundnumber) + " STATS", (1, 1, 1), 1, 2, 0.05);
		y = y + 40;
		if(is_true(level.doa.challengeactive))
		{
			text = "CHALLENGE ROUND ACTIVE";
			if(level flag::get("challenge_round_spawnOverride"))
			{
				text = text + " [Challenge logic is controlling spawning]";
			}
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 0.5, 0), 1, 1, 0.05);
			y = y + 20;
		}
		wavetype = "(CLASSIC DOA)";
		if(level.doa.var_6a0340ad === 2)
		{
			wavetype = "(HERD)";
		}
		if(level.doa.var_6a0340ad === 3)
		{
			wavetype = "(GATEMASTER)";
		}
		text = "WAVE SYSTEM " + wavetype;
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1.3, 0.05);
		y = y + 30;
		if(level flag::get("doa_round_spawning"))
		{
			text = "Round: SPAWNING";
			namespace_1e25ad94::function_70e370a(x, y, text, (0, 1, 0), 1, 1.3, 0.05);
		}
		else
		{
			text = "Round: NOT SPAWNING";
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1.3, 0.05);
		}
		y = y + 30;
		if(level.doa.var_f66b524a !== 0)
		{
			duration = level.doa.var_f66b524a;
		}
		else
		{
			duration = gettime() - level.doa.roundstarttime;
		}
		timetext = function_71719130(duration);
		text = "DURATION: " + timetext;
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
		y = y + 20;
		if(level.doa.var_6a0340ad != 3)
		{
			text = "WAVES REMAINING: " + level.doa.var_aa7fba18;
		}
		else
		{
			remaining = (float(level.doa.var_8f91d36b - gettime())) / 1000;
			if(remaining < 0)
			{
				remaining = 0;
			}
			text = "TIME REMAINING: " + int(remaining);
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 20;
			if(level.doa.var_654a3ea9 > 0)
			{
				text = "OVERTIME: " + level.doa.var_654a3ea9;
				namespace_1e25ad94::function_70e370a(x, y, text, (1, 0, 0), 1, 1, 0.05);
				y = y + 20;
			}
			text = "GATES OPEN: ";
			var_8c2908e3 = namespace_8c04284b::function_53678480();
			foreach(gate in var_8c2908e3)
			{
				text = (text + gate) + " ";
			}
		}
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
		y = y + 20;
		if(level.doa.var_6a0340ad == 2)
		{
			text = (("QUEUE SPAWN ENTRIES: " + level.doa.var_dcbded2.size) + " AI SPAWN EXPIRED: ") + level.doa.var_2b4e2465;
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 20;
		}
		text = "AI SPAWNED: " + level.doa.var_9fcf26ea;
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
		y = y + 20;
		if(isdefined(level.doa.var_3ed31a82) && level.doa.var_3ed31a82 >= 0)
		{
			text = "AI LEFT TO SPAWN: " + level.doa.var_3ed31a82;
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 20;
		}
		if(level.doa.var_9fcf26ea > 0)
		{
			text = (("NON BASIC AI SPAWNED: " + level.doa.var_5de71250) + " Ratio: ") + ((level.doa.var_5de71250 / level.doa.var_9fcf26ea) * 100) + ("%");
		}
		else
		{
			text = "NON BASIC AI SPAWNED: " + level.doa.var_5de71250;
		}
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
		y = y + 20;
		text = (("BASE AI HEALTH: " + level.doa.zombie_health) + " BASE AI SPEED: ") + level.doa.var_f4cf4e3;
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
		y = y + 20;
		if(isdefined(level.doa.var_39e3fa99))
		{
			text = (("MAX AI ALLOWED: " + ([[ level.doa.var_39e3fa99 ]]->function_c892290a())) + " CUR ALIVE: ") + namespace_ec06fe4a::function_38de0ce8();
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 20;
		}
		text = (("AI SPAWN CAPPED: " + level.doa.var_cde5274e) + " AI SPAWN FAILS: ") + level.doa.var_de939ab7;
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
		y = y + 20;
		text = "ROUND PLAYER DEATHS: " + level.doa.var_465867b;
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
		y = y + 40;
		timetext = gettime();
		text = "GAME TIME: " + timetext;
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
		y = y + 20;
		timetext = function_71719130(gettime() - level.doa.gamestarttime);
		text = "GAME DURATION: " + timetext;
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
		y = y + 20;
		text = "TOTAL PLAYER DEATHS: " + level.doa.var_bcc1fc05;
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
		foreach(player in namespace_7f5aeb59::function_23e1f90f())
		{
			if(isdefined(player.doa.color))
			{
				y = y + 20;
				text = (((("PLAYER (" + player.doa.color) + ") TARGETED BY ") + player.doa.var_ab338943) + " BASIC AI") + (is_true(player.laststand) ? " (laststand)" : "");
				namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			}
		}
		y = y + 40;
		text = "PLAYER PELTS";
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
		foreach(player in namespace_7f5aeb59::function_23e1f90f())
		{
			if(isdefined(player.doa.color))
			{
				y = y + 20;
				text = ("PLAYER (" + player.doa.color) + ") PELTMASK: ";
				for(i = level.doa.var_4eb7c3f0 - 1; i >= 0; i--)
				{
					var_5159caf4 = 1 << i;
					set = player.doa.var_f240d1a5 & var_5159caf4;
					text = text + (set ? "1" : "0");
				}
				namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			}
		}
		y = y + 40;
		text = "PLAYER GRIND";
		namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
		foreach(player in namespace_7f5aeb59::function_23e1f90f())
		{
			if(isdefined(player.doa.color))
			{
				y = y + 20;
				text = (((("PLAYER (" + player.doa.color) + ")  XP_GAIN: ") + player.doa.var_370ac26d) + " GRIND CURRENCY: ") + player.doa.var_d362196a;
				namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			}
		}
	}
}

/*
	Name: function_71719130
	Namespace: namespace_e857b038
	Checksum: 0x5D8B4809
	Offset: 0x54C0
	Size: 0x142
	Parameters: 1
	Flags: Linked
*/
function function_71719130(var_576c65c6)
{
	duration = int(float(var_576c65c6) / 1000);
	hours = int(duration / 3600);
	duration = duration - (hours * 3600);
	minutes = int(duration / 60);
	duration = duration - (minutes * 60);
	seconds = duration;
	loc_000055C0:
	text = (((("" + hours) + ":") + (minutes < 10 ? "0" : "") + minutes) + ":") + (seconds < 10 ? "0" : "") + seconds;
	return text;
}

/*
	Name: function_1a837918
	Namespace: namespace_e857b038
	Checksum: 0x86B6D028
	Offset: 0x5610
	Size: 0x528
	Parameters: 0
	Flags: Linked
*/
function function_1a837918()
{
	self notify("4af2ea6a5276f79f");
	self endon("4af2ea6a5276f79f");
	level endon(#"hash_39ebcccef3aa05c6", #"game_over");
	while(true)
	{
		x = 800;
		y = 300;
		namespace_1e25ad94::function_70e370a(x, y, "DUNGEON STATISTICS", (1, 1, 1), 1, 2, 0.05);
		y = y + 40;
		if(isdefined(level.doa.var_fa21a3aa) && level.doa.var_fa21a3aa > 0)
		{
			text = "Total Builds: " + level.doa.var_f33bb10;
			namespace_1e25ad94::function_70e370a(x, y, text, (0.4392157, 0.5019608, 0.5647059), 1, 1, 0.05);
			y = y + 20;
			text = (("Total Tiles:" + level.doa.var_fa21a3aa) + "\tAvg Tile Count:") + (level.doa.var_fa21a3aa / level.doa.var_f33bb10);
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 20;
			text = (("Total Rooms:" + level.doa.var_f5f2b4e8) + "\tAvg Room Count:") + (level.doa.var_f5f2b4e8 / level.doa.var_f33bb10);
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 20;
			text = (("Total Halls:" + level.doa.var_f23e2931) + "\tAvg Hall Count:") + (level.doa.var_f23e2931 / level.doa.var_f33bb10);
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 20;
			text = "PT = percentage of tiles";
			namespace_1e25ad94::function_70e370a(x, y, text, vectorscale((1, 1, 1), 0.5), 1, 1, 0.05);
			y = y + 20;
			text = "PB = percentage of builds";
			namespace_1e25ad94::function_70e370a(x, y, text, vectorscale((1, 1, 1), 0.5), 1, 1, 0.05);
			y = y + 30;
			foreach(var_a557de6c in level.doa.var_830f8412)
			{
				tile = {#count:level.doa.var_4cdaff39[var_a557de6c], #name:var_a557de6c};
				if(tile.count == 0)
				{
					continue;
				}
				text = ((((tile.name + "\tinstance count: ") + tile.count) + "\tPT: ") + ((tile.count / level.doa.var_fa21a3aa) * 100) + ("%") + "\tPB: ") + ((tile.count / level.doa.var_f33bb10) * 100) + ("%");
				namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
				y = y + 20;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_c93506fb
	Namespace: namespace_e857b038
	Checksum: 0xBCDA1475
	Offset: 0x5B40
	Size: 0x268
	Parameters: 0
	Flags: Linked
*/
function function_c93506fb()
{
	self notify("5735d1d868128983");
	self endon("5735d1d868128983");
	level endon(#"hash_39ebcccef3aa05c6", #"game_over");
	level.doa.var_f33bb10 = 1;
	self thread function_1a837918();
	while(true)
	{
		namespace_1e25ad94::function_4e3cfad((("Dungeon Evolution: " + level.doa.var_f33bb10) + " started at:") + gettime(), undefined, undefined, undefined, 10);
		namespace_1e25ad94::debugmsg("###DungeonMasterSupreme Cycle:" + level.doa.var_f33bb10);
		while(!level flag::get("dungeon_building"))
		{
			waitframe(1);
		}
		while(level flag::get("dungeon_building"))
		{
			waitframe(1);
		}
		wait(1);
		level notify(#"ladder_up");
		level waittilltimeout(30, #"hash_df3bb53ea54541f");
		wait(2);
		namespace_1e25ad94::function_4e3cfad((("\tDungeon Evolution: " + level.doa.var_f33bb10) + " completed at:") + gettime(), undefined, undefined, undefined, 60);
		foreach(player in getplayers())
		{
			player setorigin(level.doa.var_8823e378);
		}
		level.doa.var_f33bb10++;
	}
}

/*
	Name: function_507d29b2
	Namespace: namespace_e857b038
	Checksum: 0xC4D07F
	Offset: 0x5DB0
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_507d29b2()
{
	while(namespace_7f5aeb59::function_23e1f90f().size == 0)
	{
		waitframe(1);
	}
	foreach(player in namespace_7f5aeb59::function_23e1f90f())
	{
		player thread namespace_7f5aeb59::function_19616199();
	}
}

/*
	Name: function_8cac3f8c
	Namespace: namespace_e857b038
	Checksum: 0xA0115CD9
	Offset: 0x5E70
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function function_8cac3f8c()
{
	while(namespace_7f5aeb59::function_23e1f90f().size == 0)
	{
		waitframe(1);
	}
	namespace_1e25ad94::debugmsg("Hail to the King baby!");
	foreach(player in namespace_7f5aeb59::function_23e1f90f())
	{
		player thread function_ddde8af6(1);
	}
}

/*
	Name: function_de70888a
	Namespace: namespace_e857b038
	Checksum: 0x7100033A
	Offset: 0x5F48
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_de70888a()
{
	level.doa.var_3ec3c9aa = 1;
	namespace_ec06fe4a::function_de70888a();
}

/*
	Name: function_ddde8af6
	Namespace: namespace_e857b038
	Checksum: 0xB011471C
	Offset: 0x5F80
	Size: 0x158
	Parameters: 1
	Flags: Linked
*/
function function_ddde8af6(delay)
{
	if(!isdefined(delay))
	{
		delay = 0.1;
	}
	self notify("3605ac4d83fe74aa");
	self endon("3605ac4d83fe74aa");
	self endon(#"disconnect");
	level endon(#"hash_6b0c389ef8ac36b4", #"game_over");
	wait(delay);
	while(true)
	{
		if(self.doa.score.lives <= 3)
		{
			self.doa.score.lives = 9;
		}
		if(getdvarint(#"hash_7aecb0e8e1c66d5e", 1))
		{
			if(self.doa.score.bombs <= 1)
			{
				self.doa.score.bombs = 9;
			}
			if(self.doa.score.boosts <= 1)
			{
				self.doa.score.boosts = 9;
			}
		}
		wait(1);
	}
}

/*
	Name: function_1552e594
	Namespace: namespace_e857b038
	Checksum: 0x72F911D8
	Offset: 0x60E0
	Size: 0x840
	Parameters: 0
	Flags: Linked
*/
function function_1552e594()
{
	self notify("1514d1a29d7f2727");
	self endon("1514d1a29d7f2727");
	level endon(#"hash_12d79bc0fed4ee5a");
	level.botcount = 0;
	level thread function_db3aef8f();
	level.var_a095060b = 1;
	level.var_96f7e84e = 1;
	setdvar(#"hash_2167ce61af5dc0b0", 0);
	while(true)
	{
		waitframe(1);
		guys = namespace_7f5aeb59::function_23e1f90f();
		if(guys.size == 0)
		{
			continue;
		}
		foreach(guy in guys)
		{
			guy.doa.var_11abc438 = guy.origin + vectorscale((0, 0, 1), 34);
		}
		break;
	}
	while(!isdefined(level.doa.var_39e3fa99))
	{
		waitframe(1);
	}
	namespace_1e25ad94::debugmsg("DOA Soak Test [ON]");
	level thread function_b255a702();
	level thread function_e5266c17();
	while(is_true(level.var_a095060b))
	{
		if(getdvarint(#"hash_d874e4e73e9f18", 0) == 2)
		{
			wait(randomfloatrange(0.2, 0.6));
		}
		else
		{
			wait(randomintrange(2, 6));
		}
		if(level flag::get("doa_game_is_over"))
		{
			break;
		}
		guys = namespace_7f5aeb59::function_23e1f90f();
		if(isdefined(level.doa.var_39e3fa99))
		{
			var_271662e8 = [[ level.doa.var_39e3fa99 ]]->function_dfb49846();
			if(var_271662e8.size)
			{
				exit = var_271662e8[randomint(var_271662e8.size)];
				exit notify(#"trigger", {#activator:guys[randomint(guys.size)]});
			}
		}
		if(isdefined(level.doa.teleporter) && randomint(5) == 0)
		{
			guys[0] setorigin(level.doa.teleporter.origin + vectorscale((0, 0, 1), 32));
		}
		foreach(guy in guys)
		{
			if(!isdefined(guy))
			{
				continue;
			}
			if(isdefined(level.doa.teleporter) && randomint(100) > 97)
			{
				guy setorigin(level.doa.teleporter.origin + vectorscale((0, 0, 1), 24));
			}
			guy thread function_be602f7c();
			if(guy isinmovemode("ufo", "noclip"))
			{
				wait(0.4);
				continue;
			}
			roll = randomint(100);
			if(roll > 90)
			{
				guy setplayerangles((0, randomint(360), 0));
				guy.doa.var_d524abd8 = 1;
				namespace_1e25ad94::debugmsg("Bot is boosting.  Boosts Left:" + guy.doa.score.boosts);
			}
			if(roll == 0)
			{
				guy.doa.var_640df11b = 1;
				namespace_1e25ad94::debugmsg("Bot is dropping nuke.  Bombs Left:" + guy.doa.score.bombs);
			}
		}
		if(level.botcount > 0 && randomint(100) > 70)
		{
			bot::remove_random_bot();
			level.botcount--;
			namespace_1e25ad94::debugmsg("Bot is being removed.   Count=" + level.botcount);
		}
		else if(getdvarint(#"hash_4a0c2338e71a658e", 1) && getplayers().size < 4 && randomint(100) < 30)
		{
			bot = bot::add_bot(#"allies", function_a161addf(), "DOA");
			if(isdefined(bot) && level.doa.world_state == 0 && isdefined(level.doa.var_39e3fa99))
			{
				bot.var_bbc4df09 = 1;
				spot = [[ level.doa.var_39e3fa99 ]]->function_fc81ec00(bot getentitynumber());
				bot setorigin(spot.origin);
				bot setplayerangles(spot.angles);
				level.botcount++;
				namespace_1e25ad94::debugmsg("Bot is being added.  Count=" + level.botcount);
				waitframe(1);
			}
			else
			{
				bot::remove_bot(bot);
			}
		}
	}
	level notify(#"hash_12d79bc0fed4ee5a");
}

/*
	Name: function_b255a702
	Namespace: namespace_e857b038
	Checksum: 0xB2C316ED
	Offset: 0x6928
	Size: 0xFE
	Parameters: 0
	Flags: Linked
*/
function function_b255a702()
{
	level endon(#"hash_12d79bc0fed4ee5a");
	while(true)
	{
		arena = getdvar(#"skipto_jump", "");
		if(arena != "")
		{
			setdvar(#"skipto_jump", "");
			arena = int(arena);
			if(arena < 0 || arena >= level.doa.arenas.size)
			{
				arena = 0;
			}
			level thread namespace_8c04284b::function_41e097fc(arena);
		}
		waitframe(1);
	}
}

/*
	Name: function_a161addf
	Namespace: namespace_e857b038
	Checksum: 0xAC763F73
	Offset: 0x6A30
	Size: 0x128
	Parameters: 0
	Flags: Linked
*/
function function_a161addf()
{
	colors = array("green", "blue", "red", "yellow");
	used = [];
	guys = namespace_7f5aeb59::function_23e1f90f();
	foreach(guy in guys)
	{
		used[used.size] = guy.doa.color;
	}
	valid = array::exclude(colors, used);
	return ("TEST MONKEY (" + valid[0]) + ")";
}

/*
	Name: function_b4d99705
	Namespace: namespace_e857b038
	Checksum: 0x4457B072
	Offset: 0x6B60
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
*/
function function_b4d99705()
{
	self notify("2ad591951c8ecd6c");
	self endon("2ad591951c8ecd6c");
	level endon(#"hash_12d79bc0fed4ee5a");
	wait(randomintrange(30, 180));
	if(level.doa.world_state == 4)
	{
		guys = namespace_7f5aeb59::function_23e1f90f();
		foreach(guy in guys)
		{
			guy setorigin(guy.doa.var_11abc438);
			guy.doa.var_4f3aee7b = 0;
			namespace_1e25ad94::debugmsg((("Sending " + guy.name) + " back to home:") + guy.doa.var_11abc438);
		}
	}
	level.doa.var_a7fad318 = undefined;
	if(isdefined(level.doa.var_182fb75a))
	{
		namespace_981c1f3c::function_8790b64a();
	}
	level thread function_b4d99705();
}

/*
	Name: function_be602f7c
	Namespace: namespace_e857b038
	Checksum: 0x8AC59D32
	Offset: 0x6D28
	Size: 0x300
	Parameters: 0
	Flags: Linked
*/
function function_be602f7c()
{
	self endon(#"disconnect");
	self notify("e579f6aada7534b");
	self endon("e579f6aada7534b");
	level endon(#"hash_12d79bc0fed4ee5a");
	if(randomint(100) > 70)
	{
		self notify(#"hash_279998c5df86c04d");
	}
	if(randomint(100) > 80)
	{
		self notify(#"hash_7893364bd228d63e");
	}
	while(isdefined(self))
	{
		if(self isinmovemode("ufo", "noclip"))
		{
			wait(1);
			continue;
		}
		if(randomint(100) > 50)
		{
			var_9cf94ae9 = undefined;
			pickupsitems = getentarray("a_pickup_item", "script_noteworthy");
			foreach(item in pickupsitems)
			{
				if(([[ item.def ]]->function_5ce4fb28()) === 15)
				{
					var_9cf94ae9 = item;
				}
			}
			if(pickupsitems.size > 0 && !isdefined(var_9cf94ae9))
			{
				var_9cf94ae9 = pickupsitems[randomint(pickupsitems.size)];
			}
			if(isdefined(var_9cf94ae9))
			{
				self function_a4037f83(var_9cf94ae9);
			}
		}
		else
		{
			for(var_b779ea9b = randomint(6); var_b779ea9b; var_b779ea9b--)
			{
				if(self isinmovemode("ufo", "noclip"))
				{
					break;
				}
				self.doa.var_d524abd8 = 1;
				angles = (0, randomint(360), 0);
				self setplayerangles(angles);
				wait(0.5);
			}
		}
		wait(randomint(10));
	}
}

/*
	Name: function_a4037f83
	Namespace: namespace_e857b038
	Checksum: 0x293BEFBD
	Offset: 0x7030
	Size: 0x270
	Parameters: 1
	Flags: Linked
*/
function function_a4037f83(pickup)
{
	self endon(#"disconnect");
	pickup endon(#"death");
	wait(randomfloatrange(0.1, 1));
	if(self isinmovemode("ufo", "noclip"))
	{
		return;
	}
	level thread namespace_1e25ad94::debugcircle(pickup.origin + vectorscale((0, 0, 1), 20), 30, 3, self namespace_7f5aeb59::function_5934bbc8());
	level thread namespace_1e25ad94::debugline(self.origin + vectorscale((0, 0, 1), 20), pickup.origin + vectorscale((0, 0, 1), 20), 3, self namespace_7f5aeb59::function_5934bbc8());
	while(isdefined(pickup))
	{
		if(self isinmovemode("ufo", "noclip"))
		{
			wait(1);
			continue;
		}
		if(self.doa.score.boosts == 0 && randomint(500) == 0)
		{
			self.doa.score.boosts = 2;
		}
		yaw = self namespace_ec06fe4a::getyaw2d(pickup.origin);
		angles = (0, yaw, 0);
		self setplayerangles(angles);
		self.doa.var_d524abd8 = 1;
		namespace_1e25ad94::debugmsg((("Bot is boosting at pickup:" + ([[ pickup.def ]]->getname())) + ".  Boosts Left:") + self.doa.score.boosts);
		wait(0.5);
	}
}

/*
	Name: function_e5266c17
	Namespace: namespace_e857b038
	Checksum: 0x95C271DE
	Offset: 0x72A8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_e5266c17()
{
	self notify("1f4664f22ccdd6cc");
	self endon("1f4664f22ccdd6cc");
	level waittill(#"hash_12d79bc0fed4ee5a");
	bot::remove_bots();
}

/*
	Name: function_db3aef8f
	Namespace: namespace_e857b038
	Checksum: 0x38C44E6E
	Offset: 0x72F8
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_db3aef8f()
{
	self notify("6a2ba883d7ffd6d9");
	self endon("6a2ba883d7ffd6d9");
	level waittill(#"hash_12d79bc0fed4ee5a");
	level.var_a095060b = 0;
	namespace_1e25ad94::debugmsg("DOA Soak Test [OFF]");
	setdvar(#"hash_2167ce61af5dc0b0", 1);
}

/*
	Name: function_3a2701da
	Namespace: namespace_e857b038
	Checksum: 0xDA72D45
	Offset: 0x7388
	Size: 0xE8
	Parameters: 0
	Flags: None
*/
function function_3a2701da()
{
	level endon(#"game_over");
	level endon(#"hash_12d79bc0fed4ee5a");
	while(true)
	{
		wait(10);
		if(doa_pickups::function_69cafbe0() < 5)
		{
			doa_pickups::function_ad7ac41b(level.players[0].origin, 12, 1024);
			doa_pickups::function_ad7ac41b(level.players[0].origin, 8, 1024, 6);
			doa_pickups::function_ad7ac41b(level.players[0].origin, 8, 1024, 1);
		}
	}
}

/*
	Name: function_61b604bf
	Namespace: namespace_e857b038
	Checksum: 0xDE756087
	Offset: 0x7478
	Size: 0x4A0
	Parameters: 0
	Flags: None
*/
function function_61b604bf()
{
	/#
		var_663588d = "";
		var_b0d28a7 = "";
		foreach(def in level.doa.pickups.itemdefs)
		{
			if(([[ def ]]->function_5ce4fb28()) == 1)
			{
				continue;
			}
			if(([[ def ]]->function_5ce4fb28()) == 6)
			{
				continue;
			}
			if(([[ def ]]->function_5ce4fb28()) == 13)
			{
				continue;
			}
			name = function_9e72a96([[ def ]]->getname());
			toks = strtok(name, var_b0d28a7);
			label = var_663588d;
			for(i = 1; i < toks.size; i++)
			{
				if(i > 1)
				{
					label = label + "";
				}
				label = label + toks[i];
			}
			var_59ea00e = ("" + name) + "";
			util::add_devgui(label, var_59ea00e);
		}
		var_663588d = "";
		foreach(def in level.doa.pickups.itemdefs)
		{
			if(([[ def ]]->function_5ce4fb28()) != 6)
			{
				continue;
			}
			name = function_9e72a96([[ def ]]->getname());
			toks = strtok(name, var_b0d28a7);
			label = var_663588d;
			for(i = 1; i < toks.size; i++)
			{
				if(i > 1)
				{
					label = label + "";
				}
				label = label + toks[i];
			}
			var_59ea00e = ("" + name) + "";
			util::add_devgui(label, var_59ea00e);
		}
		var_663588d = "";
		foreach(def in level.doa.pickups.itemdefs)
		{
			if(!(([[ def ]]->function_5ce4fb28()) == 1 || ([[ def ]]->function_5ce4fb28()) == 13))
			{
				continue;
			}
			name = function_9e72a96([[ def ]]->getname());
			toks = strtok(name, var_b0d28a7);
			label = var_663588d;
			for(i = 1; i < toks.size; i++)
			{
				if(i > 1)
				{
					label = label + "";
				}
				label = label + toks[i];
			}
			var_59ea00e = ("" + name) + "";
			util::add_devgui(label, var_59ea00e);
		}
	#/
}

/*
	Name: function_43548cd2
	Namespace: namespace_e857b038
	Checksum: 0x93E6761
	Offset: 0x7920
	Size: 0x298
	Parameters: 0
	Flags: Linked
*/
function function_43548cd2()
{
	self notify("586e1f5e3a39b715");
	self endon("586e1f5e3a39b715");
	if(is_true(level.doa.var_23ae0778))
	{
		level.doa.var_23ae0778 = 0;
		return;
	}
	level.doa.var_23ae0778 = 1;
	player = getplayers()[0];
	var_bead1873 = 13500;
	topy = 30000;
	var_d7e22d96 = 20000;
	bottomy = 30000;
	if(is_true(level.doa.var_ecff3871))
	{
		var_bead1873 = var_bead1873 * -1;
		topy = topy * -1;
		var_d7e22d96 = var_d7e22d96 * -1;
		bottomy = bottomy * -1;
	}
	while(true)
	{
		var_eb40b4af = (var_bead1873, topy, 10000);
		var_5d5e18e0 = (var_bead1873, topy * -1, 10000);
		var_a515abf2 = (var_d7e22d96 * -1, bottomy, 10000);
		var_157b8cbc = (var_d7e22d96 * -1, bottomy * -1, 10000);
		level thread namespace_1e25ad94::debugline(player.origin, player.origin + var_eb40b4af, 0.1, (0, 1, 0));
		level thread namespace_1e25ad94::debugline(player.origin, player.origin + var_5d5e18e0, 0.1, (0, 0, 1));
		level thread namespace_1e25ad94::debugline(player.origin, player.origin + var_a515abf2, 0.1, (1, 0, 0));
		level thread namespace_1e25ad94::debugline(player.origin, player.origin + var_157b8cbc, 0.1, (1, 1, 0));
		wait(0.1);
	}
}

/*
	Name: function_a2a93037
	Namespace: namespace_e857b038
	Checksum: 0x4A8B8C35
	Offset: 0x7BC0
	Size: 0x12E
	Parameters: 1
	Flags: None
*/
function function_a2a93037(var_1d62f124)
{
	if(!isdefined(var_1d62f124))
	{
		var_1d62f124 = 5;
	}
	self endon(#"death");
	if(!isdefined(self.var_588775c1))
	{
		self.var_588775c1 = 0;
	}
	if(!isdefined(self.var_98f48bd3))
	{
		self.var_98f48bd3 = [];
	}
	if(!isdefined(self.var_cb0de45e))
	{
		self.var_cb0de45e = 0;
	}
	if(!isdefined(self.var_3d8e0261))
	{
		self.var_3d8e0261 = 0;
	}
	while(true)
	{
		waitframe(1);
		self.var_588775c1 = 0;
		self.var_3d8e0261 = 0;
		for(i = 0; i < self.var_98f48bd3.size; i++)
		{
			if(self.var_98f48bd3[i] > 0)
			{
				self.var_588775c1 = self.var_588775c1 + self.var_98f48bd3[i];
				self.var_3d8e0261++;
			}
		}
		self.var_588775c1 = self.var_588775c1 / var_1d62f124;
	}
}

/*
	Name: function_f451bc26
	Namespace: namespace_e857b038
	Checksum: 0x9D0AD1D
	Offset: 0x7CF8
	Size: 0x148
	Parameters: 1
	Flags: None
*/
function function_f451bc26(var_1d62f124)
{
	if(!isdefined(var_1d62f124))
	{
		var_1d62f124 = 5;
	}
	self endon(#"death");
	if(!isdefined(self.var_588775c1))
	{
		self.var_588775c1 = 0;
	}
	if(!isdefined(self.var_98f48bd3))
	{
		self.var_98f48bd3 = [];
	}
	var_36d61f3a = 1 / (float(function_60d95f53()) / 1000);
	var_8f4c3718 = var_1d62f124 * var_36d61f3a;
	for(i = 0; i < var_8f4c3718; i++)
	{
		self.var_98f48bd3[i] = 0;
	}
	var_bb435707 = self.health;
	idx = 0;
	while(true)
	{
		self.var_98f48bd3[idx] = var_bb435707 - self.health;
		var_bb435707 = self.health;
		waitframe(1);
		idx++;
		if(idx >= var_8f4c3718)
		{
			idx = 0;
		}
	}
}

/*
	Name: function_6790d816
	Namespace: namespace_e857b038
	Checksum: 0x9902110C
	Offset: 0x7E48
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function function_6790d816()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"damage");
		self.var_cb0de45e++;
		self namespace_ec06fe4a::function_2f4b0f9(self.health);
	}
}

/*
	Name: function_626d10c0
	Namespace: namespace_e857b038
	Checksum: 0x103374FD
	Offset: 0x7EB0
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_626d10c0(victimnum)
{
	birthtime = gettime();
	self waittill(#"death");
	deathtime = gettime();
	seconds = (float(deathtime - birthtime)) / 1000;
	namespace_1e25ad94::function_4e3cfad(((("Victim Number: " + victimnum) + " lasted ") + seconds) + " seconds", (1, 1, 1), 1, 1.5, 3);
}

/*
	Name: function_598305fe
	Namespace: namespace_e857b038
	Checksum: 0xB41CB97A
	Offset: 0x7F78
	Size: 0x106E
	Parameters: 0
	Flags: Linked
*/
function function_598305fe()
{
	/#
		level notify(#"round_over");
		level thread function_de70888a();
		level namespace_ec06fe4a::function_b6b79fd1();
		wait(2);
		namespace_ec06fe4a::clearallcorpses();
		level.doa.var_ecff3871 = 0;
		namespace_8c04284b::function_a70ff03e(level.doa.var_ecff3871);
		namespace_a6ddb172::function_7a0e5387();
		level notify(#"hash_40a4d01c20db352c");
		[[ level.doa.var_39e3fa99 ]]->function_4aca7529(1);
		level util::set_lighting_state(3, 0);
		level clientfield::set("", 3);
		player1 = getplayers()[0];
		if(!isdefined(level.doa.dev))
		{
			level.doa.dev = spawnstruct();
			playerspot = struct::get("");
			var_e2fdda78 = struct::get("");
			level.doa.dev.playerorg = namespace_ec06fe4a::function_e22ae9b3(playerspot.origin, "", playerspot.angles, "");
			level.doa.dev.var_85d6cfdf = namespace_ec06fe4a::function_e22ae9b3(var_e2fdda78.origin, "", var_e2fdda78.angles, "");
			player1 linkto(level.doa.dev.playerorg);
			player1.doa.var_57eaec6e = 1;
		}
		victim = undefined;
		victimnum = 0;
		var_94f3b914 = "";
		var_b18e4c25 = [];
		right = vectornormalize(anglestoright(level.doa.dev.var_85d6cfdf.angles));
		forward = vectornormalize(anglestoright(level.doa.dev.var_85d6cfdf.angles));
		while(is_true(level.doa.var_598305fe))
		{
			if(!isdefined(victim))
			{
				victimnum++;
				var_94f3b914 = getdvar(#"hash_58c5fb7998861ea3", "");
				victim = doa_enemy::function_db55a448(doa_enemy::function_d7c5adee(var_94f3b914), level.doa.dev.var_85d6cfdf.origin);
				victim.var_6ea9e4cf = 1;
				victim.var_9540e8e7 = 1;
				victim namespace_83eb6304::turnofffx("");
				victim.takedamage = 1;
				victim namespace_ec06fe4a::function_2f4b0f9(victim.health);
				victim forceteleport(level.doa.dev.var_85d6cfdf.origin, level.doa.dev.var_85d6cfdf.angles);
				victim.ignoreall = 1;
				victim.var_227e7c79 = 1;
				victim linkto(level.doa.dev.var_85d6cfdf);
				victim thread function_f451bc26(1);
				victim thread function_a2a93037(1);
				victim thread function_6790d816();
				victim thread function_626d10c0(victimnum);
			}
			function_1eaaceab(var_b18e4c25);
			if(var_b18e4c25.size < 6)
			{
				foreach(guy in var_b18e4c25)
				{
					if(isdefined(guy))
					{
						guy thread namespace_ec06fe4a::function_570729f0(0);
					}
				}
				var_b18e4c25 = [];
				if(!isdefined(var_b18e4c25))
				{
					var_b18e4c25 = [];
				}
				else if(!isarray(var_b18e4c25))
				{
					var_b18e4c25 = array(var_b18e4c25);
				}
				var_b18e4c25[var_b18e4c25.size] = doa_enemy::function_db55a448(doa_enemy::function_d7c5adee(""), level.doa.dev.var_85d6cfdf.origin + (right * 20));
				if(!isdefined(var_b18e4c25))
				{
					var_b18e4c25 = [];
				}
				else if(!isarray(var_b18e4c25))
				{
					var_b18e4c25 = array(var_b18e4c25);
				}
				var_b18e4c25[var_b18e4c25.size] = doa_enemy::function_db55a448(doa_enemy::function_d7c5adee(""), level.doa.dev.var_85d6cfdf.origin - (right * 20));
				if(!isdefined(var_b18e4c25))
				{
					var_b18e4c25 = [];
				}
				else if(!isarray(var_b18e4c25))
				{
					var_b18e4c25 = array(var_b18e4c25);
				}
				var_b18e4c25[var_b18e4c25.size] = doa_enemy::function_db55a448(doa_enemy::function_d7c5adee(""), (level.doa.dev.var_85d6cfdf.origin + (right * 40)) - (forward * 28));
				if(!isdefined(var_b18e4c25))
				{
					var_b18e4c25 = [];
				}
				else if(!isarray(var_b18e4c25))
				{
					var_b18e4c25 = array(var_b18e4c25);
				}
				var_b18e4c25[var_b18e4c25.size] = doa_enemy::function_db55a448(doa_enemy::function_d7c5adee(""), (level.doa.dev.var_85d6cfdf.origin - (right * 40)) - (forward * 28));
				if(!isdefined(var_b18e4c25))
				{
					var_b18e4c25 = [];
				}
				else if(!isarray(var_b18e4c25))
				{
					var_b18e4c25 = array(var_b18e4c25);
				}
				var_b18e4c25[var_b18e4c25.size] = doa_enemy::function_db55a448(doa_enemy::function_d7c5adee(""), (level.doa.dev.var_85d6cfdf.origin + (right * 96)) - (forward * 56));
				if(!isdefined(var_b18e4c25))
				{
					var_b18e4c25 = [];
				}
				else if(!isarray(var_b18e4c25))
				{
					var_b18e4c25 = array(var_b18e4c25);
				}
				var_b18e4c25[var_b18e4c25.size] = doa_enemy::function_db55a448(doa_enemy::function_d7c5adee(""), (level.doa.dev.var_85d6cfdf.origin - (right * 96)) - (forward * 56));
				foreach(guy in var_b18e4c25)
				{
					guy.ignoreall = 1;
					guy.allow_movement = 0;
					guy.var_834ad023 = 1;
					guy.var_6edab899 = 1;
					guy setgoal(guy.origin);
					guy.health = 60000;
					guy.maxhealth = 60000;
				}
			}
			foreach(guy in var_b18e4c25)
			{
				if(isdefined(guy))
				{
					guy setgoal(guy.origin);
				}
			}
			victim.ignoreall = 1;
			victim clearenemy();
			x = 800;
			y = 530;
			namespace_1e25ad94::function_70e370a(x, y, "", (1, 1, 1), 1, 2, 0.05);
			y = y + 40;
			text = "" + level.doa.roundnumber;
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 20;
			text = (("" + var_94f3b914) + "") + victimnum;
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 20;
			text = "" + victim.health;
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 20;
			text = "" + victim.maxhealth;
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 30;
			text = "" + function_9e72a96(player1.doa.currentweaponname);
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 20;
			text = (("" + victim.var_3d8e0261) + "") + victim.var_cb0de45e;
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 1, 0.05);
			y = y + 20;
			text = "" + victim.var_588775c1;
			namespace_1e25ad94::function_70e370a(x, y, text, (1, 1, 1), 1, 2, 0.05);
			y = y + 30;
			waitframe(1);
		}
		foreach(guy in var_b18e4c25)
		{
			if(isdefined(guy))
			{
				guy thread namespace_ec06fe4a::function_570729f0(0.1);
			}
		}
		if(isdefined(victim))
		{
			victim thread namespace_ec06fe4a::function_570729f0(0.1);
		}
		if(isdefined(level.doa.dev))
		{
			if(isdefined(player1))
			{
				player1 unlink();
			}
			if(isdefined(level.doa.dev.playerorg))
			{
				level.doa.dev.playerorg unlink();
				level.doa.dev.playerorg delete();
			}
			if(isdefined(level.doa.dev.var_85d6cfdf))
			{
				level.doa.dev.var_85d6cfdf unlink();
				level.doa.dev.var_85d6cfdf delete();
			}
			level.doa.dev = undefined;
		}
	#/
}

/*
	Name: function_ade3e372
	Namespace: namespace_e857b038
	Checksum: 0xAC3640AA
	Offset: 0x8FF0
	Size: 0x1A0
	Parameters: 0
	Flags: Linked
*/
function function_ade3e372()
{
	self notify("dcb655f46f4958b");
	self endon("dcb655f46f4958b");
	if(!level.doa.var_ade3e372)
	{
		level notify(#"hash_6b0c389ef8ac36b4");
		return;
	}
	foreach(player in namespace_7f5aeb59::function_23e1f90f())
	{
		player thread function_ddde8af6();
	}
	while(true)
	{
		foreach(player in namespace_7f5aeb59::function_23e1f90f())
		{
			player dodamage(player.health + 100, player.origin);
		}
		wait(randomintrange(4, 10));
	}
}

