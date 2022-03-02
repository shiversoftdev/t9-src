#using script_1029986e2bc8ca8e;
#using script_113dd7f0ea2a1d4f;
#using script_12538a87a80a2978;
#using script_18077945bb84ede7;
#using script_1c65dbfc2f1c8d8f;
#using script_2618e0f3e5e11649;
#using script_340a2e805e35f7a2;
#using script_4421226bbc54b398;
#using script_5bb072c3abf4652c;
#using script_6155d71e1c9a57eb;
#using script_7224d61ed502ea07;
#using script_7b1cd3908a825fdd;
#using script_7bacb32f8222fa3e;
#using script_7d7ac1f663edcdc8;
#using script_7e59d7bba853fe4b;
#using script_7fc996fe8678852;
#using script_f11fc6f7a3ad5b9;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_85b89288;

/*
	Name: function_22292902
	Namespace: namespace_85b89288
	Checksum: 0x895D424E
	Offset: 0x3D0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_22292902()
{
	level notify(771791058);
}

/*
	Name: function_89f2df9
	Namespace: namespace_85b89288
	Checksum: 0x17441D39
	Offset: 0x3F0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_621e37612030164f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_85b89288
	Checksum: 0xF5752C25
	Offset: 0x438
	Size: 0x114
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(is_true(getgametypesetting(#"hash_1e1a5ebefe2772ba")))
	{
		level.var_53bc31ad = 1;
		level.var_149a60e7 = 1;
		level.var_f045e945 = 30;
		level.var_11cc6ef9 = 0.5;
		level.var_9fbbf524 = &function_1bcf260b;
		level.var_acd0f67e = 9;
		setgametypesetting(#"hash_f3d3533f21841ae", 1);
		level callback::add_callback(#"hash_3ca80e35288a78d0", &function_1f01cc3b);
		callback::function_98a0917d(&function_98a0917d);
	}
}

/*
	Name: function_98a0917d
	Namespace: namespace_85b89288
	Checksum: 0xBC321B09
	Offset: 0x558
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_98a0917d()
{
	level thread function_c8fb4513();
}

/*
	Name: function_c8fb4513
	Namespace: namespace_85b89288
	Checksum: 0x927E8BB1
	Offset: 0x580
	Size: 0x578
	Parameters: 2
	Flags: None
*/
function function_c8fb4513(var_63c85287, var_1f7b3936)
{
	if(!isdefined(var_63c85287))
	{
		var_63c85287 = 600;
	}
	if(!isdefined(var_1f7b3936))
	{
		var_1f7b3936 = int(600 / 5);
	}
	level flag::wait_till_all([1:#"start_zombie_round_logic", 0:#"intro_scene_done"]);
	var_9c1ed9ea = "collapse_underscore";
	if(isdefined(level.var_f546b995))
	{
		var_9c1ed9ea = "collapse_underscore_" + level.var_f546b995;
		level.var_75b02512 = "objective_" + level.var_f546b995;
		level.var_e6512c09 = "gameover_survival_halloween";
	}
	namespace_9b972177::function_9f5c2ff2(var_9c1ed9ea);
	level thread function_e0d97436();
	var_135e25da = function_a42a57d2();
	foreach(var_495727a3 in var_135e25da)
	{
		namespace_8b6a9d79::function_20d7e9c7(var_495727a3);
	}
	level.var_20c6962b = array::random([2:#"carver", 1:#"grey", 0:#"hash_583a7c6fc0d127b0"]);
	function_877c8d9c("objectiveBoostStartCollapseStrauss", "objectiveBoostStartCollapseGrey", "objectiveBoostStartCollapseCarver", 2);
	level thread zm_vo::function_7622cb70("objectiveBoostStartCollapseResponse", 2);
	level thread objective_manager::start_timer(var_63c85287, "collapse");
	level thread function_ab0f88ca();
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::function_953da284(player, #"hash_513d77a3a7ff9312");
		level.var_31028c5d prototype_hud::function_817e4d10(player, 2);
	}
	n_time_remaining = var_63c85287 + 1;
	var_13bba26f = 0;
	while(n_time_remaining > 0)
	{
		if(level flag::get(#"hash_742b43f40747c72a"))
		{
			break;
		}
		if(var_13bba26f == var_1f7b3936)
		{
			var_13bba26f = 0;
			level thread function_8c6ab347();
		}
		n_time_remaining = n_time_remaining - 1;
		var_13bba26f = var_13bba26f + 1;
		wait(1);
	}
	objective_manager::stop_timer();
	var_e2062f3 = function_a68a96e7();
	level.var_f045e945 = undefined;
	level notify(#"hash_58abffc4e8e535c7");
	namespace_8b6a9d79::function_20d7e9c7(var_e2062f3);
	level notify(#"hash_3e765c26047c9f54");
	level flag::set(#"hash_742b43f40747c72a");
	s_result = undefined;
	s_result = level waittill(#"hash_69090774fec4a17b");
	if(is_true(s_result.completed))
	{
		str_reason = #"hash_6ebafb1370ab6c93";
		level.winningteam = #"allies";
	}
	else
	{
		str_reason = #"hash_22a0611dcd352614";
		level.winningteam = #"axis";
	}
	level notify(#"end_game", {#reason:str_reason});
}

/*
	Name: function_e0d97436
	Namespace: namespace_85b89288
	Checksum: 0xA12260B5
	Offset: 0xB00
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_e0d97436()
{
	wait(1);
	namespace_ce1f29cc::function_368a7cde();
	level flag::clear(#"hash_44074059e3987765");
}

/*
	Name: function_8c6ab347
	Namespace: namespace_85b89288
	Checksum: 0x33CD386F
	Offset: 0xB48
	Size: 0x6B4
	Parameters: 0
	Flags: None
*/
function function_8c6ab347()
{
	self notify("29a717fc79054d29");
	self endon("29a717fc79054d29");
	revive_players();
	callback::callback(#"hash_4ce318cfe14b54e7");
	level.var_64606faa = 0;
	namespace_553954de::function_7c97e961(level.var_b48509f9 + 1);
	level notify(#"hash_6a805bca389d1daf");
	level flag::wait_till_clear(#"hash_21921ed511559aa3");
	switch(level.var_b48509f9)
	{
		case 2:
		{
			changeadvertisedstatus(0);
			level thread function_877c8d9c("objectiveCollapseDifficultyIncreaseTwoStrauss", "objectiveCollapseDifficultyIncreaseTwoGrey", "objectiveCollapseDifficultyIncreaseTwoCarver", 3);
			break;
		}
		case 3:
		{
			level thread function_877c8d9c("objectiveCollapseDifficultyIncreaseTwoStrauss", "objectiveCollapseDifficultyIncreaseTwoGrey", "objectiveCollapseDifficultyIncreaseTwoCarver", 3);
			break;
		}
		case 4:
		{
			level thread zm_vo::function_7622cb70("objectiveCollapseDifficultyIncreaseThree", 3);
			break;
		}
		case 5:
		{
			level thread zm_vo::function_7622cb70("objectiveCollapseDifficultyIncreaseFour", 3);
			break;
		}
		case 6:
		{
			break;
		}
	}
	a_ai = getaiteamarray(level.zombie_team);
	foreach(ai in a_ai)
	{
		if(!ai.var_6f84b820 === #"normal")
		{
			ai.var_d45ca662 = 1;
		}
	}
	array::thread_all(getplayers(), &val::set, #"hash_7a406b91ff079d07", "takedamage", 0);
	array::thread_all(getplayers(), &val::set, #"hash_7a406b91ff079d07", "ignoreme", 1);
	foreach(player in getplayers())
	{
		player playlocalsound(#"evt_nuke_flash");
	}
	level thread zm_utility::function_9ad5aeb1(0, 1, 1, 1);
	level thread function_ec609754(level.var_b48509f9);
	wait(3);
	array::thread_all(getplayers(), &val::reset, #"hash_7a406b91ff079d07", "takedamage");
	array::thread_all(getplayers(), &val::reset, #"hash_7a406b91ff079d07", "ignoreme");
	level thread function_4b10f2d6();
	level flag::clear("spawn_zombies");
	players = getplayers();
	foreach(player in players)
	{
		player luinotifyevent(#"hash_5b1ff06d07e9002a", 3, 2, level.var_b48509f9, 0);
	}
	foreach(player in getplayers())
	{
		player namespace_d4ecbbf0::function_a2d61378(level.var_b48509f9 - 1, 3);
		player namespace_d4ecbbf0::function_e32813ee(level.var_b48509f9 - 1, 3, 1);
	}
	wait(10);
	level flag::set("spawn_zombies");
	level thread function_ab0f88ca();
}

/*
	Name: function_ec609754
	Namespace: namespace_85b89288
	Checksum: 0xFB62BE45
	Offset: 0x1208
	Size: 0x60A
	Parameters: 1
	Flags: None
*/
function function_ec609754(n_difficulty)
{
	if(!isarray(level.var_7d45d0d4.var_5eba96b3[#"wallbuy"]))
	{
		return;
	}
	self notify("22ae80425b51cae3");
	self endon("22ae80425b51cae3");
	foreach(instance in level.var_7d45d0d4.var_5eba96b3[#"wallbuy"])
	{
		foreach(chalk in instance.var_fe2612fe[#"wallbuy_chalk"])
		{
			if(isdefined(chalk.trigger) && (isdefined(chalk.trigger.rarity) && (isdefined(chalk.trigger.weapon.name) && isdefined(chalk.trigger.weapon.displayname))) && is_true(chalk.trigger.var_9f32a5f4) && chalk.trigger.rarity != "orange")
			{
				n_chance = 0;
				switch(n_difficulty)
				{
					case 1:
					{
						break;
					}
					case 2:
					{
						if(chalk.trigger.rarity == "green")
						{
							n_chance = 45;
						}
						else
						{
							if(chalk.trigger.rarity == "blue")
							{
								n_chance = 10;
							}
							else if(chalk.trigger.rarity == "purple")
							{
								n_chance = 7;
							}
						}
						break;
					}
					case 3:
					{
						if(chalk.trigger.rarity == "green")
						{
							n_chance = 74;
						}
						else
						{
							if(chalk.trigger.rarity == "blue")
							{
								n_chance = 19;
							}
							else if(chalk.trigger.rarity == "purple")
							{
								n_chance = 9;
							}
						}
						break;
					}
					case 4:
					{
						if(chalk.trigger.rarity == "green")
						{
							n_chance = 95;
						}
						else
						{
							if(chalk.trigger.rarity == "blue")
							{
								n_chance = 73;
							}
							else if(chalk.trigger.rarity == "purple")
							{
								n_chance = 18;
							}
						}
						break;
					}
					case 5:
					{
						if(chalk.trigger.rarity == "green")
						{
							n_chance = 100;
						}
						else
						{
							if(chalk.trigger.rarity == "blue")
							{
								n_chance = 100;
							}
							else if(chalk.trigger.rarity == "purple")
							{
								n_chance = 63;
							}
						}
						break;
					}
					case 6:
					default:
					{
						if(chalk.trigger.rarity == "green")
						{
							n_chance = 100;
						}
						else
						{
							if(chalk.trigger.rarity == "blue")
							{
								n_chance = 100;
							}
							else if(chalk.trigger.rarity == "purple")
							{
								n_chance = 90;
							}
						}
						break;
					}
				}
				if(math::cointoss(n_chance))
				{
					switch(chalk.trigger.rarity)
					{
						case "green":
						{
							var_3d2cce9 = "blue";
							break;
						}
						case "blue":
						{
							var_3d2cce9 = "purple";
							break;
						}
						case "purple":
						default:
						{
							var_3d2cce9 = "orange";
							break;
						}
					}
					zm_wallbuy::function_26b21477(chalk, var_3d2cce9);
					waitframe(1);
				}
			}
		}
	}
}

/*
	Name: revive_players
	Namespace: namespace_85b89288
	Checksum: 0x772078D
	Offset: 0x1820
	Size: 0x90
	Parameters: 0
	Flags: Private
*/
function private revive_players()
{
	foreach(player in getplayers())
	{
		player zm_player::spectator_respawn_player();
	}
}

/*
	Name: function_1bcf260b
	Namespace: namespace_85b89288
	Checksum: 0x63BF16AC
	Offset: 0x18B8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_1bcf260b()
{
	wait(randomfloatrange(0.5, 2));
}

/*
	Name: function_877c8d9c
	Namespace: namespace_85b89288
	Checksum: 0x9DA653F3
	Offset: 0x18E8
	Size: 0xD2
	Parameters: 4
	Flags: None
*/
function function_877c8d9c(var_b2825a6f, var_bee6a2c9, var_eb773ad6, n_delay)
{
	switch(level.var_20c6962b)
	{
		case "hash_583a7c6fc0d127b0":
		{
			level zm_vo::function_7622cb70(var_b2825a6f, n_delay);
			break;
		}
		case "grey":
		{
			level zm_vo::function_7622cb70(var_bee6a2c9, n_delay);
			break;
		}
		case "carver":
		{
			level zm_vo::function_7622cb70(var_eb773ad6, n_delay);
			break;
		}
	}
}

/*
	Name: function_4b10f2d6
	Namespace: namespace_85b89288
	Checksum: 0x8AE78C06
	Offset: 0x19C8
	Size: 0x190
	Parameters: 0
	Flags: None
*/
function function_4b10f2d6()
{
	a_ai = getaiteamarray(level.zombie_team);
	foreach(ai in a_ai)
	{
		if(isalive(ai))
		{
			var_bb17225f = ai.health / ai.maxhealth;
			ai zm_utility::init_zombie_run_cycle();
			ai._starting_round_number = zm_utility::get_round_number();
			var_d0aa45b6 = ai namespace_e0710ee6::function_f7014c3d(ai.basehealth);
			if(isdefined(var_d0aa45b6) && var_d0aa45b6 > ai.maxhealth)
			{
				ai.maxhealth = int(var_d0aa45b6);
				ai setmaxhealth(ai.maxhealth);
				ai setnormalhealth(var_bb17225f);
			}
		}
	}
}

/*
	Name: function_ab0f88ca
	Namespace: namespace_85b89288
	Checksum: 0xD8074DD6
	Offset: 0x1B60
	Size: 0x3AC
	Parameters: 0
	Flags: None
*/
function function_ab0f88ca()
{
	self notify("ace9e0d4c46214a");
	self endon("ace9e0d4c46214a");
	level endon(#"hash_58abffc4e8e535c7", #"hash_6a805bca389d1daf", #"end_game");
	if(level.script === #"hash_6619ffb38c2e7458")
	{
		var_2a291abf = 1500;
		n_delay = 15;
	}
	else
	{
		var_2a291abf = 3000;
		n_delay = 20;
	}
	n_max_ai = getailimit();
	while(true)
	{
		a_players = function_a1ef346b();
		var_62455b3e = min(n_max_ai / (a_players.size + 1), n_max_ai / 3);
		foreach(player in a_players)
		{
			if(player laststand::player_is_in_laststand())
			{
				continue;
			}
			v_front = player.origin + (anglestoforward(player.angles) * 300);
			var_b8af022a = namespace_591b4396::function_411bb920(player);
			v_dir = vectornormalize((v_front - player.origin) + var_b8af022a);
			v_spawn = player.origin + (v_dir * var_2a291abf);
			if(level.script === #"hash_6619ffb38c2e7458")
			{
				var_c8311b6d = getnavfaceregion(v_spawn, 100);
				var_69ad0d71 = getnavfaceregion(player.origin, 100);
				if(!(isdefined(var_69ad0d71) && isdefined(var_c8311b6d)) || var_69ad0d71 !== var_c8311b6d)
				{
					v_spawn = player.origin;
				}
			}
			/#
				if(getdvarint(#"hash_33b0be96bf3cd69a", 0) || getdvarint(#"hash_7466f1c38ea3ceab", 0))
				{
					cylinder(v_spawn, v_spawn + vectorscale((0, 0, 1), 5000), 500, (1, 0, 0), 0, n_delay * 20);
				}
			#/
			player thread namespace_591b4396::function_64df57fc(v_spawn, var_62455b3e);
		}
		level waittilltimeout(n_delay, #"hash_3babb5bf72d208da", #"hash_58df1e8b20eb71d2");
	}
}

/*
	Name: function_a42a57d2
	Namespace: namespace_85b89288
	Checksum: 0xD203A412
	Offset: 0x1F18
	Size: 0x1C6
	Parameters: 0
	Flags: None
*/
function function_a42a57d2()
{
	var_6581be33 = [];
	if(isdefined(level.var_7d45d0d4.currentdestination))
	{
		foreach(location in level.var_7d45d0d4.currentdestination.locations)
		{
			instances = array::randomize(namespace_8b6a9d79::function_f703a5a(location));
			foreach(instance in instances)
			{
				if(instance.content_script_name === #"safehouse")
				{
					if(!isdefined(var_6581be33))
					{
						var_6581be33 = [];
					}
					else if(!isarray(var_6581be33))
					{
						var_6581be33 = array(var_6581be33);
					}
					if(!isinarray(var_6581be33, instance))
					{
						var_6581be33[var_6581be33.size] = instance;
					}
				}
			}
		}
	}
	return var_6581be33;
}

/*
	Name: function_a68a96e7
	Namespace: namespace_85b89288
	Checksum: 0x6EDB7597
	Offset: 0x20E8
	Size: 0x2CA
	Parameters: 0
	Flags: None
*/
function function_a68a96e7()
{
	var_1dc01e72 = [];
	if(isdefined(level.var_7d45d0d4.currentdestination))
	{
		foreach(location in level.var_7d45d0d4.currentdestination.locations)
		{
			instances = array::randomize(namespace_8b6a9d79::function_f703a5a(location));
			foreach(instance in instances)
			{
				if(instance.content_script_name === #"exfil" && !is_true(instance.var_ea25c617))
				{
					if(!isdefined(var_1dc01e72))
					{
						var_1dc01e72 = [];
					}
					else if(!isarray(var_1dc01e72))
					{
						var_1dc01e72 = array(var_1dc01e72);
					}
					if(!isinarray(var_1dc01e72, instance))
					{
						var_1dc01e72[var_1dc01e72.size] = instance;
					}
				}
			}
		}
	}
	v_pos = (0, 0, 0);
	foreach(player in function_a1ef346b())
	{
		v_pos = v_pos + player.origin;
	}
	v_pos = v_pos / function_a1ef346b().size;
	var_e2062f3 = arraygetfarthest(v_pos, var_1dc01e72);
	return var_e2062f3;
}

/*
	Name: function_1f01cc3b
	Namespace: namespace_85b89288
	Checksum: 0xA63587E0
	Offset: 0x23C0
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function function_1f01cc3b()
{
	objective_manager::stop_timer();
}

