#using script_1c65dbfc2f1c8d8f;
#using script_20683aa2e054ec89;
#using script_252989ab0c1d9a4c;
#using script_2ddf7d76494fb52;
#using script_35598499769dbb3d;
#using script_3a88f428c6d8ef90;
#using script_3cebb48c37fc271;
#using script_3e25b5e703601101;
#using script_3f9e0dc8454d98e1;
#using script_44c2a1259e14bef1;
#using script_48f7c4ab73137f8;
#using script_4acbbbcdc7ef16a0;
#using script_58860a35d0555f74;
#using script_5bb072c3abf4652c;
#using script_61fcfebb2f3a00e0;
#using script_65488ba3b5a08252;
#using script_676fc0767562bc02;
#using script_68d2ee1489345a1d;
#using script_6990cca6577c3abc;
#using script_6c5b51f98cd04fa3;
#using script_72401f526ba71638;
#using script_76a8f964e4309959;
#using script_77b61a4178efdbc4;
#using script_7e59d7bba853fe4b;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm\zm_ai_raz.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_95c839d1;

/*
	Name: function_a371e16c
	Namespace: namespace_95c839d1
	Checksum: 0x649DBA86
	Offset: 0xDC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a371e16c()
{
	level notify(1993215868);
}

/*
	Name: init
	Namespace: namespace_95c839d1
	Checksum: 0xB7429C85
	Offset: 0xDE0
	Size: 0x88C
	Parameters: 0
	Flags: None
*/
function init()
{
	clientfield::register("world", "" + #"hash_2d23097ea9cdf1ec", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_33b8059f5b3f18b1", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_d92501ab1efcdd", 28000, getminbitcountfornum(3), "int");
	clientfield::register("scriptmover", "" + #"hash_2fc89133ccd7b0df", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_399e2afd773621df", 28000, getminbitcountfornum(5), "int");
	clientfield::register("scriptmover", "" + #"hash_43c4039b38b89f56", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_4e6fb90b199f15be", 28000, 1, "int");
	clientfield::register("actor", "" + #"hash_30c23067d05386c1", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_9ef13a567692f32", 28000, getminbitcountfornum(2), "int");
	clientfield::register("scriptmover", "" + #"hash_25155d60768d46e4", 28000, 1, "int");
	clientfield::register("vehicle", "" + #"hash_469f6acd46f13b91", 28000, getminbitcountfornum(3), "int");
	clientfield::register("scriptmover", "" + #"hash_1e031a294b1db7de", 28000, getminbitcountfornum(2), "int");
	clientfield::register("scriptmover", "" + #"hash_4259da501d7deb09", 28000, getminbitcountfornum(2), "int");
	clientfield::register("scriptmover", "" + #"hash_1c5cfe17e34e65aa", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_1875c2a7206c5167", 28000, 1, "int");
	clientfield::register("toplayer", "" + #"hash_159dc2bca63111fc", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_5c06c72dd28da75a", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_442272758f2bf947", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_5b501a097c44b478", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_665a7e18e3f5f896", 28000, getminbitcountfornum(2), "int");
	clientfield::register("scriptmover", "" + #"hash_196f85a0e323cdeb", 28000, getminbitcountfornum(2), "int");
	clientfield::register("world", "" + #"hash_6c47531bdf01d52c", 28000, 1, "int");
	clientfield::register("world", "" + #"hash_78e149e0b7cb80e8", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_6cc7dece6cee40e1", 28000, 1, "int");
	level.var_87a3c4d1 = namespace_fb27ba0b::register();
	level.var_75a7d6 = struct::get(#"hash_5d6c93a20ed01a31");
	level.var_75a7d6.var_c20e460e = spawnstruct();
	foreach(struct in struct::get_array(level.var_75a7d6.target))
	{
		if(struct.var_fdd68e6f === #"hash_415e056a9db2491e" || struct.var_fdd68e6f === #"hash_413c156a9d957de8")
		{
			level thread function_bc175096(struct);
		}
	}
	if(!zm_utility::function_e51dc2d8())
	{
		foreach(var_a43a7410 in getentarray("roots_charge_support", "targetname"))
		{
			var_a43a7410 delete();
		}
		return;
	}
	/#
		level thread devgui_setup();
	#/
}

/*
	Name: function_79868b3b
	Namespace: namespace_95c839d1
	Checksum: 0xA8838FCA
	Offset: 0x1678
	Size: 0x1BAC
	Parameters: 1
	Flags: None
*/
function function_79868b3b(b_skipped)
{
	level flag::set(#"hash_2145c074d359b87d");
	level flag::clear(#"hash_21921ed511559aa3");
	level flag::set(#"pause_round_timeout");
	level flag::set(#"hold_round_end");
	level flag::clear(#"spawn_zombies");
	level flag::set(#"hash_5fff608f0c23a53f");
	level flag::set(#"hash_14ac8b5a5e403984");
	level.var_43fb4347 = "sprint";
	callback::on_ai_spawned(&on_ai_spawned);
	n_players = getplayers().size;
	if(n_players < 1)
	{
		n_players = 1;
	}
	else if(n_players > 4)
	{
		n_players = 4;
	}
	switch(n_players)
	{
		case 1:
		{
			var_772164a6 = 15;
			var_3887bcb7 = 10;
			break;
		}
		case 2:
		{
			var_772164a6 = 17;
			var_3887bcb7 = 15;
			break;
		}
		case 3:
		{
			var_772164a6 = 19;
			var_3887bcb7 = 20;
			break;
		}
		case 4:
		{
			var_772164a6 = 21;
			var_3887bcb7 = 25;
			break;
		}
	}
	level.var_75a7d6.var_772164a6 = var_772164a6;
	level.var_75a7d6.var_c20e460e.var_3887bcb7 = var_3887bcb7;
	level.var_75a7d6.var_cd0c8367 = [];
	level.var_75a7d6.var_e97bb91a = [];
	level.var_75a7d6.var_6359299f = [];
	level thread zm_utility::function_9ad5aeb1(0, 1, 0, 0);
	level clientfield::set("" + #"hash_5a36f05cbdf2580", 5);
	level thread namespace_297ae820::function_3528419f(1);
	exploder::exploder("lgt_env_boss_left_arm_long");
	exploder::exploder("lgt_env_boss_right_arm_long");
	function_e324aad2();
	level.var_dbf9c70d = &function_dbf9c70d;
	var_eda0bf20 = getent("vol_end_fight_forced", "targetname");
	if(isdefined(var_eda0bf20))
	{
		namespace_1fd59e39::function_4a05e25f(var_eda0bf20);
	}
	level.var_97e461d4 = "end_fight_chopper_gunner";
	level clientfield::set("" + #"hash_2d23097ea9cdf1ec", 1);
	level.var_75a7d6.var_e890a8bc = [];
	level.var_75a7d6.var_8f1d54b1 = [];
	level.var_75a7d6.var_fc32fb8d = [];
	level.var_75a7d6.var_1aa34baf = [];
	level.var_75a7d6.var_4b6d9c4a = [];
	level.var_75a7d6.var_df953d57 = [];
	level.var_75a7d6.var_1ec89ecd[#"ground"] = 0;
	level.var_75a7d6.var_1ec89ecd[#"mine"] = 0;
	level.var_75a7d6.var_1ec89ecd[#"frost"] = 0;
	level.var_75a7d6.var_1ec89ecd[#"eyes"] = 0;
	level.var_75a7d6.var_815eeaa4[#"zombie"] = [];
	level.var_75a7d6.var_815eeaa4[#"hash_1bc8194446d4722f"] = [];
	level.var_75a7d6.var_815eeaa4[#"hash_24c829c980982c1"] = [];
	level.var_75a7d6.var_815eeaa4[#"hash_643d498546885532"] = [];
	level.var_75a7d6.var_815eeaa4[#"raz"] = [];
	level.var_75a7d6.var_815eeaa4[#"mechz"] = [];
	level.var_75a7d6.var_c20e460e.var_529d63dd = [];
	level.var_75a7d6.var_c20e460e.var_8a337eba = 0;
	level thread function_60c68651();
	foreach(struct in struct::get_array(level.var_75a7d6.target))
	{
		if(isdefined(struct.var_fdd68e6f))
		{
			switch(struct.var_fdd68e6f)
			{
				case "stand":
				{
					level.var_75a7d6.var_d7f18c34 = struct;
					break;
				}
				case "hash_3bffc6cd547d8d78":
				{
					level.var_75a7d6.var_101a7fee = struct;
					level.var_75a7d6.var_101a7fee.var_a56afaf6 = function_5db5dfb(level.var_75a7d6.var_101a7fee);
					break;
				}
				case "hash_3b99decd5427030e":
				{
					level.var_75a7d6.var_9ec26d20 = struct;
					level.var_75a7d6.var_9ec26d20.var_a56afaf6 = function_5db5dfb(level.var_75a7d6.var_9ec26d20);
					break;
				}
				case "frost":
				{
					if(!isdefined(level.var_75a7d6.var_64e1d42a))
					{
						level.var_75a7d6.var_64e1d42a = [];
					}
					else if(!isarray(level.var_75a7d6.var_64e1d42a))
					{
						level.var_75a7d6.var_64e1d42a = array(level.var_75a7d6.var_64e1d42a);
					}
					level.var_75a7d6.var_64e1d42a[level.var_75a7d6.var_64e1d42a.size] = struct;
					break;
				}
				case "mine":
				{
					if(!isdefined(level.var_75a7d6.var_97f69bd4))
					{
						level.var_75a7d6.var_97f69bd4 = [];
					}
					else if(!isarray(level.var_75a7d6.var_97f69bd4))
					{
						level.var_75a7d6.var_97f69bd4 = array(level.var_75a7d6.var_97f69bd4);
					}
					level.var_75a7d6.var_97f69bd4[level.var_75a7d6.var_97f69bd4.size] = struct;
					break;
				}
				case "portal":
				{
					level.var_75a7d6.var_be9eb6ec = struct;
					break;
				}
				case "float":
				{
					if(!isdefined(level.var_75a7d6.var_c20e460e.var_529d63dd))
					{
						level.var_75a7d6.var_c20e460e.var_529d63dd = [];
					}
					else if(!isarray(level.var_75a7d6.var_c20e460e.var_529d63dd))
					{
						level.var_75a7d6.var_c20e460e.var_529d63dd = array(level.var_75a7d6.var_c20e460e.var_529d63dd);
					}
					level.var_75a7d6.var_c20e460e.var_529d63dd[level.var_75a7d6.var_c20e460e.var_529d63dd.size] = struct;
					break;
				}
				case "hash_10c37584f73ee50b":
				case "spawn":
				{
					var_9893d55e = [7:#"hash_7c09b683edfb0e96", 6:#"mechz", 5:#"mimic", 4:#"raz", 3:#"hash_643d498546885532", 2:#"hash_24c829c980982c1", 1:#"hash_1bc8194446d4722f", 0:#"zombie"];
					if(isstring(struct.blacklist))
					{
						var_d7cf1504 = strtok(struct.blacklist, ", ");
						if(isarray(var_d7cf1504))
						{
							foreach(var_929141c6 in var_d7cf1504)
							{
								arrayremovevalue(var_9893d55e, var_929141c6);
							}
						}
					}
					if(struct.var_fdd68e6f == #"spawn")
					{
						foreach(var_791e9349 in var_9893d55e)
						{
							if(!isdefined(level.var_75a7d6.var_815eeaa4[var_791e9349]))
							{
								level.var_75a7d6.var_815eeaa4[var_791e9349] = [];
							}
							else if(!isarray(level.var_75a7d6.var_815eeaa4[var_791e9349]))
							{
								level.var_75a7d6.var_815eeaa4[var_791e9349] = array(level.var_75a7d6.var_815eeaa4[var_791e9349]);
							}
							level.var_75a7d6.var_815eeaa4[var_791e9349][level.var_75a7d6.var_815eeaa4[var_791e9349].size] = struct;
						}
					}
					else
					{
						foreach(var_791e9349 in var_9893d55e)
						{
							if(!isdefined(level.var_75a7d6.var_1d10f036[var_791e9349]))
							{
								level.var_75a7d6.var_1d10f036[var_791e9349] = [];
							}
							else if(!isarray(level.var_75a7d6.var_1d10f036[var_791e9349]))
							{
								level.var_75a7d6.var_1d10f036[var_791e9349] = array(level.var_75a7d6.var_1d10f036[var_791e9349]);
							}
							level.var_75a7d6.var_1d10f036[var_791e9349][level.var_75a7d6.var_1d10f036[var_791e9349].size] = struct;
						}
					}
					break;
				}
				case "hash_413c156a9d957de8":
				case "hash_415e056a9db2491e":
				{
					vh_turret = struct.vh_turret;
					if(isvehicle(vh_turret))
					{
						namespace_ee206246::objective_set(#"hash_380134b80e0ab939", vh_turret, 0, undefined, #"cannon", undefined, &function_ab16ea40);
					}
					foreach(var_51e7d54e in struct::get_array(struct.target))
					{
						if(var_51e7d54e.var_fdd68e6f === #"mount")
						{
							s_unitrigger = var_51e7d54e zm_unitrigger::create(&function_401c03c5, 96);
							zm_unitrigger::function_89380dda(s_unitrigger, 0);
							s_unitrigger.s_cannon = struct;
							var_51e7d54e.s_cannon = struct;
							level thread function_38e2dcaa(var_51e7d54e);
							break;
						}
					}
					break;
				}
				case "warp":
				{
					if(!isdefined(level.var_75a7d6.var_62b6205d))
					{
						level.var_75a7d6.var_62b6205d = [];
					}
					else if(!isarray(level.var_75a7d6.var_62b6205d))
					{
						level.var_75a7d6.var_62b6205d = array(level.var_75a7d6.var_62b6205d);
					}
					level.var_75a7d6.var_62b6205d[level.var_75a7d6.var_62b6205d.size] = struct;
					break;
				}
				case "hash_38777979a8348e98":
				{
					level.var_75a7d6.var_b62c0fab = struct;
					break;
				}
				case "hash_1f6d12a9a1fb37b6":
				{
					if(!isdefined(level.var_75a7d6.var_4d537044))
					{
						level.var_75a7d6.var_4d537044 = [];
					}
					else if(!isarray(level.var_75a7d6.var_4d537044))
					{
						level.var_75a7d6.var_4d537044 = array(level.var_75a7d6.var_4d537044);
					}
					level.var_75a7d6.var_4d537044[level.var_75a7d6.var_4d537044.size] = struct;
					break;
				}
				case "impact":
				{
					if(!isdefined(level.var_75a7d6.var_58004de6))
					{
						level.var_75a7d6.var_58004de6 = [];
					}
					else if(!isarray(level.var_75a7d6.var_58004de6))
					{
						level.var_75a7d6.var_58004de6 = array(level.var_75a7d6.var_58004de6);
					}
					level.var_75a7d6.var_58004de6[level.var_75a7d6.var_58004de6.size] = struct;
					s_crystal = struct;
					while(true)
					{
						mdl_clip = getent(s_crystal.target, "targetname");
						if(isdefined(mdl_clip))
						{
							s_crystal.mdl_clip = mdl_clip;
							s_crystal.mdl_clip notsolid();
						}
						var_70a0a8d3 = struct::get_array(s_crystal.target);
						foreach(s_child in var_70a0a8d3)
						{
							if(isdefined(s_child.var_fdd68e6f))
							{
								switch(s_child.var_fdd68e6f)
								{
									case "impact":
									{
										s_crystal.s_next = s_child;
										break;
									}
									case "hash_5644b3f69f4e3ee5":
									{
										if(!isdefined(s_crystal.var_255e01f1))
										{
											s_crystal.var_255e01f1 = [];
										}
										else if(!isarray(s_crystal.var_255e01f1))
										{
											s_crystal.var_255e01f1 = array(s_crystal.var_255e01f1);
										}
										s_crystal.var_255e01f1[s_crystal.var_255e01f1.size] = s_child;
										break;
									}
								}
							}
						}
						if(!isstruct(s_crystal.s_next))
						{
							break;
						}
						s_crystal = s_crystal.s_next;
					}
					break;
				}
			}
		}
	}
	level.var_75a7d6.var_64e1d42a = array::sort_by_script_int(level.var_75a7d6.var_64e1d42a, 1);
	level.var_75a7d6.var_97f69bd4 = array::sort_by_script_int(level.var_75a7d6.var_97f69bd4, 1);
	level.var_75a7d6.var_c20e460e.var_529d63dd = array::sort_by_script_int(level.var_75a7d6.var_c20e460e.var_529d63dd, 1);
	level.var_75a7d6.var_c20e460e.var_6615b9fe = array::randomize(arraycopy(level.var_75a7d6.var_c20e460e.var_529d63dd));
	level.var_75a7d6.var_62b6205d = array::sort_by_script_int(level.var_75a7d6.var_62b6205d, 1);
	level.var_75a7d6.var_4d537044 = array::sort_by_script_int(level.var_75a7d6.var_4d537044, 1);
	level.var_75a7d6 flag::set(#"hash_15ced8000939a79b");
	level.var_75a7d6 flag::set(#"hash_71a8b0cba966f837");
	level thread function_658da77b();
	if(b_skipped)
	{
		return;
	}
	var_92bcfbc2 = level.var_75a7d6.var_c20e460e.var_529d63dd[0];
	if(isstruct(var_92bcfbc2))
	{
		var_92bcfbc2 flag::set(#"disabled");
	}
	function_bb7202a2();
	callback::on_ai_spawned(&function_1f80b24d);
	foreach(ai_zombie in getaiteamarray(level.zombie_team))
	{
		if(isalive(ai_zombie))
		{
			ai_zombie thread function_1f80b24d();
		}
	}
	callback::on_ai_killed(&function_e543d649);
	namespace_ee206246::objective_set(#"hash_1c8b4e14ac690a43", level.var_75a7d6.var_c20e460e.var_2644aca3, 0, #"hash_90d41432e6bd428", #"maxis", undefined, &function_a4650866);
	function_4ba59ffe();
	level thread function_768e1bba();
	level.var_75a7d6.var_8d31700f = int(4000);
	level.var_75a7d6.var_3f956940 = level.var_75a7d6.var_8d31700f;
	level.var_75a7d6.var_79aa3ebd = function_5f36e356(100000, 240000);
	level.var_75a7d6.var_6a7d3d39 = int(level.var_75a7d6.var_79aa3ebd * 2);
	level.var_75a7d6.var_9b4b863f = level.var_75a7d6.var_6a7d3d39;
	foreach(e_player in getplayers())
	{
		level.var_87a3c4d1 namespace_fb27ba0b::set_health(e_player, 1);
		level.var_87a3c4d1 namespace_fb27ba0b::set_armor(e_player, 1);
		level.var_87a3c4d1 namespace_fb27ba0b::function_74adcd8a(e_player, 1);
		if(!level.var_87a3c4d1 namespace_fb27ba0b::is_open(e_player))
		{
			level.var_87a3c4d1 namespace_fb27ba0b::open(e_player);
		}
	}
	function_6a3704cb(level.var_75a7d6.var_d7f18c34);
	callback::on_spawned(&function_775a15ec);
	callback::on_player_killed(&function_da1d0aae);
	foreach(e_player in function_a1ef346b())
	{
		e_player thread function_775a15ec();
	}
	level thread function_85f68dd4();
	level.var_75a7d6 flag::wait_till(#"defeated");
}

/*
	Name: function_ec198408
	Namespace: namespace_95c839d1
	Checksum: 0x9C4DCCE3
	Offset: 0x3230
	Size: 0x674
	Parameters: 2
	Flags: None
*/
function function_ec198408(b_skipped, var_19e802fa)
{
	level.var_75a7d6 flag::set(#"defeated");
	function_480e30e5();
	namespace_ee206246::objective_complete(#"cannon");
	namespace_ee206246::objective_complete(#"maxis");
	callback::remove_on_ai_spawned(&function_1f80b24d);
	callback::remove_on_ai_killed(&function_e543d649);
	foreach(ai_zombie in getaiteamarray(level.zombie_team))
	{
		if(isdefined(ai_zombie))
		{
			ai_zombie notify(#"hash_6c8affb0cdce9e5");
			ai_zombie clientfield::set("" + #"hash_30c23067d05386c1", 0);
		}
	}
	function_9a39a4c();
	if(isdefined(level.var_75a7d6.var_c20e460e.var_2644aca3))
	{
		level.var_75a7d6.var_c20e460e.var_2644aca3 clientfield::set("" + #"hash_9ef13a567692f32", 1);
	}
	if(isdefined(level.var_75a7d6.var_a17b2556) && isdefined(level.var_75a7d6.var_b9f89aa6))
	{
		level.var_75a7d6.var_a17b2556 clientfield::set("" + #"hash_399e2afd773621df", 4);
		level.var_75a7d6.var_b9f89aa6 clientfield::set("" + #"hash_399e2afd773621df", 4);
		level thread function_a39582f9(3);
	}
	if(!var_19e802fa)
	{
		function_7a35edd2();
	}
	else
	{
		level clientfield::set("" + #"hash_5a36f05cbdf2580", 6);
	}
	level clientfield::set("" + #"hash_2d23097ea9cdf1ec", 0);
	level flag::set(#"hash_4b00aa230ebbe82b");
	level.var_75a7d6 notify(#"hash_21eabf998a71487a");
	level thread zm_utility::function_9ad5aeb1(0, 0, 1, 0);
	if(isdefined(level.var_75a7d6.mdl_head))
	{
		level.var_75a7d6.mdl_head delete();
	}
	if(isdefined(level.var_75a7d6.mdl_body))
	{
		level.var_75a7d6.mdl_body delete();
	}
	if(isarray(level.var_75a7d6.var_e890a8bc))
	{
		foreach(var_ce34262e in level.var_75a7d6.var_e890a8bc)
		{
			if(isdefined(var_ce34262e))
			{
				var_ce34262e deletedelay();
			}
		}
	}
	function_968e2ead();
	function_df782b45();
	if(isdefined(level.var_75a7d6.var_c20e460e.var_2644aca3))
	{
		level.var_75a7d6.var_c20e460e.var_2644aca3 delete();
	}
	if(isdefined(level.var_75a7d6.var_c20e460e.mdl_anchor))
	{
		level.var_75a7d6.var_c20e460e.mdl_anchor delete();
	}
	level.var_75a7d6.var_b9f89aa6 clientfield::set("" + #"hash_399e2afd773621df", 0);
	if(isdefined(level.var_75a7d6.var_a17b2556))
	{
		level.var_75a7d6.var_a17b2556 delete();
	}
	if(isdefined(level.var_75a7d6.var_b9f89aa6))
	{
		level.var_75a7d6.var_b9f89aa6 scene::stop(1);
		if(isdefined(level.var_75a7d6.var_b9f89aa6))
		{
			level.var_75a7d6.var_b9f89aa6 delete();
		}
	}
}

/*
	Name: function_dbf9c70d
	Namespace: namespace_95c839d1
	Checksum: 0xE33C631
	Offset: 0x38B0
	Size: 0x104
	Parameters: 0
	Flags: None
*/
function function_dbf9c70d()
{
	self endon(#"disconnect");
	var_eda0bf20 = getent("vol_end_fight_forced", "targetname");
	if(isdefined(var_eda0bf20))
	{
		s_spawn = zm_player::check_for_valid_spawn_near_team(self, 1);
		if(isvec(s_spawn.origin) && istouching(s_spawn.origin, var_eda0bf20))
		{
			return s_spawn;
		}
	}
	if(isarray(level.var_75a7d6.var_4d537044))
	{
		return array::random(level.var_75a7d6.var_4d537044);
	}
}

/*
	Name: function_85f68dd4
	Namespace: namespace_95c839d1
	Checksum: 0xC2E1E9B6
	Offset: 0x39C0
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_85f68dd4()
{
	level endon(#"end_game");
	level thread namespace_c097de49::function_8f85d169();
	music::setmusicstate("boss_part1");
	wait(2);
	level thread play_intro_vo();
	wait(5);
	level thread function_4346157c();
	wait(1);
	level thread function_2dc91d9f();
}

/*
	Name: play_intro_vo
	Namespace: namespace_95c839d1
	Checksum: 0xC65FED74
	Offset: 0x3A78
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function play_intro_vo()
{
	level endon(#"end_game");
	level zm_vo::function_7622cb70(#"hash_3afdc6bb5d5fd312");
	wait(1);
	level function_fee3db9("bf_intro_fskn_2");
	wait(3);
	level zm_vo::function_7622cb70(#"hash_16988f895a9e8803");
	wait(1);
	level.var_75a7d6 flag::set(#"hash_287677ffb745b0e2");
}

/*
	Name: function_480e30e5
	Namespace: namespace_95c839d1
	Checksum: 0x81A71D7E
	Offset: 0x3B38
	Size: 0xD8
	Parameters: 0
	Flags: None
*/
function function_480e30e5()
{
	foreach(e_player in getplayers())
	{
		if(e_player.sessionstate === "spectator")
		{
			e_player thread [[level.spawnplayer]]();
			continue;
		}
		if(e_player laststand::player_is_in_laststand())
		{
			e_player thread zm_laststand::auto_revive(e_player);
		}
	}
}

/*
	Name: function_e324aad2
	Namespace: namespace_95c839d1
	Checksum: 0xBA2715B6
	Offset: 0x3C18
	Size: 0x18C
	Parameters: 0
	Flags: None
*/
function function_e324aad2()
{
	foreach(struct in struct::get_array(level.var_75a7d6.target))
	{
		if(struct.var_fdd68e6f === #"capture")
		{
			level.var_75a7d6.var_a17b2556 = util::spawn_model(#"hash_705f86d0aeb3ebdb", struct.origin, struct.angles);
			level.var_75a7d6.var_b9f89aa6 = util::spawn_model(#"hash_43a78e1e93887332", struct.origin, struct.angles);
			a_ents[#"eye"] = level.var_75a7d6.var_b9f89aa6;
			level.var_75a7d6.var_b9f89aa6 scene::init(#"hash_66fb9111d689a98e", a_ents);
			break;
		}
	}
}

/*
	Name: function_6a3704cb
	Namespace: namespace_95c839d1
	Checksum: 0xB86A755
	Offset: 0x3DB0
	Size: 0x5BC
	Parameters: 1
	Flags: None
*/
function function_6a3704cb(s_spawn)
{
	if(!isstruct(s_spawn))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	level.var_75a7d6.mdl_body = util::spawn_model(#"hash_b7cea188cbd2e02", s_spawn.origin, s_spawn.angles);
	level.var_75a7d6.mdl_body setforcenocull();
	level.var_75a7d6.mdl_body clientfield::set("" + #"hash_2fc89133ccd7b0df", 1);
	level.var_75a7d6.mdl_body clientfield::set("" + #"hash_33b8059f5b3f18b1", 1);
	level.var_75a7d6.mdl_body clientfield::set("" + #"hash_d92501ab1efcdd", 1);
	foreach(str_tag in [3:"j_spinelower_tentacle_root", 2:"j_spineupper_tentacle_root", 1:"j_tentacle_root_ri", 0:"j_tentacle_root_le"])
	{
		level.var_75a7d6.mdl_body hidepart(str_tag, "", 1);
	}
	level.var_75a7d6.mdl_anchor = util::spawn_model(#"tag_origin", level.var_75a7d6.mdl_body gettagorigin("j_head"), level.var_75a7d6.mdl_body gettagangles("j_head"));
	level.var_75a7d6.mdl_anchor linkto(level.var_75a7d6.mdl_body, "j_head");
	level.var_75a7d6.mdl_anchor setforcenocull();
	level.var_75a7d6.mdl_head = util::spawn_model(#"hash_49275da2ee5d6c3f", level.var_75a7d6.mdl_body gettagorigin("j_head"), level.var_75a7d6.mdl_body gettagangles("j_head"));
	level.var_75a7d6.mdl_head setforcenocull();
	level.var_75a7d6.mdl_head linkto(level.var_75a7d6.mdl_anchor);
	level.var_75a7d6.mdl_head clientfield::set("" + #"hash_2fc89133ccd7b0df", 1);
	foreach(var_a07ea3db in [1:#"right", 0:#"left"])
	{
		level thread function_7ed3f4dd(var_a07ea3db);
	}
	a_ents = [];
	a_ents[#"boss"] = level.var_75a7d6.mdl_body;
	s_spawn thread scene::play(#"hash_5ffc9256a4340dcb", "idle_both_arms", a_ents);
	a_ents = [];
	a_ents[#"head"] = level.var_75a7d6.mdl_head;
	level.var_75a7d6.mdl_anchor thread scene::play(#"hash_4dae4f482421b3ed", "idle", a_ents);
}

/*
	Name: function_5f36e356
	Namespace: namespace_95c839d1
	Checksum: 0x1D6F9CE9
	Offset: 0x4378
	Size: 0x18A
	Parameters: 2
	Flags: None
*/
function function_5f36e356(n_health_min, n_health_max)
{
	n_round = level.round_number;
	if(!isdefined(n_round))
	{
		n_round = 20;
	}
	if(n_round < 20)
	{
		n_round = 20;
	}
	else if(n_round > 50)
	{
		n_round = 50;
	}
	n_percent = 1 - ((50 - n_round) / 30);
	if(n_percent < 0)
	{
		n_percent = 0;
	}
	else if(n_percent > 1)
	{
		n_percent = 1;
	}
	n_players = getplayers().size;
	if(n_players < 1)
	{
		n_players = 1;
	}
	else if(n_players > 4)
	{
		n_players = 4;
	}
	var_1bb081d7 = 1 + ((n_players - 1) * 0.5);
	if(n_health_min < n_health_max)
	{
		var_c835c552 = int(lerpfloat(n_health_min, n_health_max, n_percent) * var_1bb081d7);
	}
	else
	{
		var_c835c552 = int(n_health_min * var_1bb081d7);
	}
	return var_c835c552;
}

/*
	Name: get_weapon_damage
	Namespace: namespace_95c839d1
	Checksum: 0x4C6521E4
	Offset: 0x4510
	Size: 0x3B2
	Parameters: 13
	Flags: None
*/
function get_weapon_damage(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(weapon.offhandslot === "Tactical grenade" || weapon.offhandslot === "Lethal grenade" || weapon.offhandslot === "Special" || killstreaks::is_killstreak_weapon(weapon))
	{
		if(!zm_equipment::function_4f51b6ea(weapon, meansofdeath) && meansofdeath !== "MOD_MELEE")
		{
			damage = zm_equipment::function_379f6b5d(damage);
			if(killstreaks::is_killstreak_weapon(weapon))
			{
				damage = damage * 0.5;
				if(weapon.firetype === "Minigun")
				{
					damage = damage * 0.5;
				}
			}
			else
			{
				damage = damage * 0.1;
			}
		}
	}
	item = attacker namespace_b376ff3f::function_230ceec4(weapon);
	if(isdefined(item))
	{
		var_528363fd = self namespace_b61a349a::function_b3496fde(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
		damage = damage + var_528363fd;
		if(meansofdeath != "MOD_MELEE")
		{
			var_4d1602de = zm_weapons::function_d85e6c3a(item.var_a6762160);
			damage = damage * var_4d1602de;
			if(isdefined(item.var_a8bccf69))
			{
				var_645b8bb = zm_weapons::function_896671d5(item.var_a6762160.weapon, item.var_a8bccf69);
				if(isplayer(attacker))
				{
					if(namespace_6fc19861::function_1b662278(weapon) && meansofdeath !== "MOD_EXPLOSIVE" || namespace_6fc19861::function_565c848a(weapon))
					{
						var_645b8bb = attacker namespace_6fc19861::function_e5469f27(weapon, namespace_6fc19861::function_565c848a(weapon));
					}
				}
				if(isdefined(var_645b8bb))
				{
					damage = damage * var_645b8bb;
				}
			}
		}
	}
	else
	{
		var_fd72ea28 = self namespace_b61a349a::function_b3496fde(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
		damage = damage + var_fd72ea28;
	}
	damage = namespace_1b527536::actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
	if(zm_weapons::is_wonder_weapon(weapon))
	{
		damage = damage * 0.3;
	}
	return int(damage);
}

/*
	Name: function_51846e52
	Namespace: namespace_95c839d1
	Checksum: 0xE42AACED
	Offset: 0x48D0
	Size: 0x8C
	Parameters: 2
	Flags: None
*/
function function_51846e52(meansofdeath, weapon)
{
	if(meansofdeath === "MOD_HEAD_SHOT" || meansofdeath === "MOD_RIFLE_BULLET" || meansofdeath === "MOD_PISTOL_BULLET")
	{
		n_damage_cap = 1500;
	}
	else
	{
		if(weapon.guidedmissiletype === "Ballistic")
		{
			n_damage_cap = 1500;
		}
		else
		{
			n_damage_cap = 3000;
		}
	}
	return n_damage_cap;
}

/*
	Name: function_7ed3f4dd
	Namespace: namespace_95c839d1
	Checksum: 0xAE9CF6B2
	Offset: 0x4968
	Size: 0xC74
	Parameters: 1
	Flags: None
*/
function function_7ed3f4dd(var_a07ea3db)
{
	if(!isdefined(var_a07ea3db))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	switch(var_a07ea3db)
	{
		case "left":
		{
			str_tag = "j_shoulder_le";
			var_3d9f256d = "tag_fx_crystal_shoulder_le";
			break;
		}
		case "right":
		{
			str_tag = "j_shoulder_ri";
			var_3d9f256d = "tag_fx_crystal_shoulder_ri";
			break;
		}
		case "hash_565d5e19da6fb336":
		{
			str_tag = "tag_fx_crystal_belly";
			var_3d9f256d = "tag_fx_crystal_belly";
			break;
		}
		case "head":
		{
			str_tag = "j_head";
			var_3d9f256d = "tag_head_crystal_fx";
			break;
		}
	}
	if(!isdefined(str_tag) || str_tag == "")
	{
		return;
	}
	while(true)
	{
		var_ce34262e = spawncollision(#"hash_45a1036c3bd2f2da", "roots_shoot", level.var_75a7d6.mdl_body gettagorigin(str_tag), (0, 0, 0));
		if(isdefined(var_ce34262e))
		{
			break;
		}
		waitframe(1);
	}
	var_ce34262e endon(#"death");
	if(!isdefined(level.var_75a7d6.var_e890a8bc))
	{
		level.var_75a7d6.var_e890a8bc = [];
	}
	else if(!isarray(level.var_75a7d6.var_e890a8bc))
	{
		level.var_75a7d6.var_e890a8bc = array(level.var_75a7d6.var_e890a8bc);
	}
	level.var_75a7d6.var_e890a8bc[level.var_75a7d6.var_e890a8bc.size] = var_ce34262e;
	var_ce34262e setteam(#"axis");
	var_ce34262e linkto(level.var_75a7d6.mdl_body, str_tag);
	var_ce34262e flag::set(#"hash_7808b840308266e0");
	var_ce34262e val::set(#"hash_1e031a294b1db7de", "allowdeath", 0);
	var_ce34262e val::set(#"hash_1e031a294b1db7de", "takedamage", 1);
	var_ce34262e.health = 1;
	var_a8c53cf5 = 0;
	var_7c8baf2 = level.var_75a7d6.var_79aa3ebd;
	var_fd8ded06 = {#health:1000, #maxhealth:1000};
	var_90796363 = 0;
	function_773cc50a(var_a07ea3db, 1);
	while(!var_90796363)
	{
		var_be17187b = undefined;
		var_be17187b = var_ce34262e waittill(#"damage");
		e_attacker = var_be17187b.attacker;
		var_9b676843 = isdefined(e_attacker) && e_attacker flag::get(#"hash_737ee671a33a84b7");
		if(isplayer(e_attacker) || var_9b676843)
		{
			damage = var_be17187b.amount;
			weapon = var_be17187b.weapon;
			inflictor = var_be17187b.inflictor;
			flags = var_be17187b.flags;
			meansofdeath = var_be17187b.mod;
			var_fd90b0bb = var_be17187b.var_fd90b0bb;
			vpoint = var_be17187b.position;
			vdir = var_be17187b.direction;
			shitloc = var_be17187b.shitloc;
			psoffsettime = var_be17187b.psoffsettime;
			boneindex = var_be17187b.boneindex;
			surfacetype = var_be17187b.surfacetype;
			if(!var_9b676843)
			{
				damage = var_ce34262e get_weapon_damage(inflictor, e_attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
				if(!zm_weapons::is_wonder_weapon(weapon))
				{
					n_damage_cap = function_51846e52(meansofdeath, weapon);
					if(isdefined(n_damage_cap) && damage > n_damage_cap)
					{
						damage = n_damage_cap;
					}
				}
			}
			b_immune = 0;
			var_db2a8c7a = 3;
			if(var_9b676843)
			{
				if(var_a8c53cf5)
				{
					var_db2a8c7a = 2;
					if(!level.var_75a7d6 flag::get_any([2:#"hash_4e953b3843bae375", 1:#"intermission", 0:#"defeated"]))
					{
						str_vo = #"hash_2543c53a17547f61";
						if(level.var_75a7d6 flag::get(#"hash_17c454e32450dd92"))
						{
							str_vo = #"hash_1b714dba19ea3e0f";
						}
						else
						{
							if(level.var_75a7d6 flag::get(#"hash_4ae068100a9d8c76"))
							{
								str_vo = #"hash_1b88d2ba19fdfeef";
							}
							else if(level.var_75a7d6 flag::get_any([1:#"hash_48bc8345fad29b74", 0:#"hash_12678fff6a404d29"]))
							{
								str_vo = #"hash_1b81e1ba19f7f9be";
							}
						}
						level thread function_f83c329c(str_vo, 0, 0.5, {#n_time:10, #str_id:#"hash_711ebafa8fd9f78b"}, 0);
					}
				}
				else
				{
					b_immune = 1;
					level thread function_f83c329c(#"hash_34751c9f81d0e94f", 0, 0.5, {#n_time:60, #str_id:#"hash_34751c9f81d0e94f"}, 0);
				}
			}
			else if(var_a8c53cf5)
			{
				b_immune = 1;
			}
			if(b_immune)
			{
				var_db2a8c7a = 4;
				damage = 0;
			}
			var_51de3a6c = 0;
			if(!b_immune)
			{
				if(!var_a8c53cf5)
				{
					level.var_75a7d6.var_9b4b863f = int(max(level.var_75a7d6.var_9b4b863f - damage, 0));
					function_f3ac29fc();
					var_7c8baf2 = int(max(var_7c8baf2 - damage, 0));
					if(var_7c8baf2 <= 0)
					{
						var_51de3a6c = 1;
						function_773cc50a(var_a07ea3db, 2);
						if(isdefined(var_3d9f256d))
						{
							level.var_75a7d6.mdl_body hidepart(var_3d9f256d, "", 1);
						}
						foreach(e_player in getplayers())
						{
							e_player function_bc82f900(#"hash_7a31ddffe230057b");
						}
					}
				}
				else
				{
					level.var_75a7d6.var_3f956940 = int(max(level.var_75a7d6.var_3f956940 - 25, 0));
					function_73f95a0c();
					var_fd8ded06.health = int(max(var_fd8ded06.health - 25, 0));
					if(var_fd8ded06.health <= 0)
					{
						var_90796363 = 1;
						var_51de3a6c = 1;
					}
					else
					{
						level thread function_a617da35(var_fd8ded06);
					}
				}
			}
			e_player = e_attacker;
			if(!isplayer(e_player))
			{
				e_player = e_attacker getseatoccupant(0);
			}
			if(isplayer(e_player))
			{
				if(!b_immune)
				{
					var_fa2da0a = undefined;
					if(!var_a8c53cf5)
					{
						flags = 2048;
						var_fa2da0a = "armor";
						if(var_51de3a6c)
						{
							var_a8c53cf5 = 1;
							var_ce34262e.var_426947c4 = 1;
							var_fa2da0a = "armorBroke";
						}
						else
						{
							var_ce34262e.var_426947c4 = undefined;
						}
					}
					e_player thread damagefeedback::update(meansofdeath, e_player, var_fa2da0a, weapon, var_ce34262e, psoffsettime, shitloc, var_51de3a6c, flags, 0);
				}
				level thread hud::function_c9800094(e_player, vpoint, damage, var_db2a8c7a);
			}
		}
	}
	var_fd8ded06 notify(#"destroyed");
	level thread weakpoint_destroyed(var_a07ea3db);
	arrayremovevalue(level.var_75a7d6.var_e890a8bc, var_ce34262e);
	if(isdefined(var_ce34262e))
	{
		var_ce34262e deletedelay();
	}
}

/*
	Name: function_f3ac29fc
	Namespace: namespace_95c839d1
	Checksum: 0xC18E0470
	Offset: 0x55E8
	Size: 0x118
	Parameters: 0
	Flags: None
*/
function function_f3ac29fc()
{
	var_867fbcae = level.var_75a7d6.var_9b4b863f / level.var_75a7d6.var_6a7d3d39;
	foreach(e_player in getplayers())
	{
		if(level.var_87a3c4d1 namespace_fb27ba0b::is_open(e_player))
		{
			level.var_87a3c4d1 namespace_fb27ba0b::set_armor(e_player, var_867fbcae);
			if(var_867fbcae <= 0)
			{
				level.var_87a3c4d1 namespace_fb27ba0b::function_74adcd8a(e_player, 0);
			}
		}
	}
}

/*
	Name: function_73f95a0c
	Namespace: namespace_95c839d1
	Checksum: 0x8010ACE7
	Offset: 0x5708
	Size: 0x1A8
	Parameters: 0
	Flags: None
*/
function function_73f95a0c()
{
	var_867fbcae = level.var_75a7d6.var_3f956940 / level.var_75a7d6.var_8d31700f;
	if(var_867fbcae <= 0)
	{
		foreach(e_player in getplayers())
		{
			if(level.var_87a3c4d1 namespace_fb27ba0b::is_open(e_player))
			{
				level.var_87a3c4d1 namespace_fb27ba0b::close(e_player);
			}
		}
	}
	else
	{
		foreach(e_player in getplayers())
		{
			if(level.var_87a3c4d1 namespace_fb27ba0b::is_open(e_player))
			{
				level.var_87a3c4d1 namespace_fb27ba0b::set_health(e_player, var_867fbcae);
			}
		}
	}
}

/*
	Name: function_a617da35
	Namespace: namespace_95c839d1
	Checksum: 0x538440E1
	Offset: 0x58B8
	Size: 0x1A6
	Parameters: 1
	Flags: None
*/
function function_a617da35(var_fd8ded06)
{
	if(!isstruct(var_fd8ded06))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	var_fd8ded06 notify(#"regen");
	var_fd8ded06 endon(#"regen", #"destroyed");
	wait(2);
	level thread function_6074ced6();
	var_f4fd3a25 = 1000 / (3 / (float(function_60d95f53()) / 1000));
	while(var_fd8ded06.health < var_fd8ded06.maxhealth)
	{
		var_e852d8c3 = var_f4fd3a25;
		if(var_fd8ded06.health + var_e852d8c3 > var_fd8ded06.maxhealth)
		{
			var_e852d8c3 = var_fd8ded06.maxhealth - var_fd8ded06.health;
		}
		level.var_75a7d6.var_3f956940 = level.var_75a7d6.var_3f956940 + var_e852d8c3;
		var_fd8ded06.health = var_fd8ded06.health + var_e852d8c3;
		function_73f95a0c();
		waitframe(1);
	}
}

/*
	Name: function_6074ced6
	Namespace: namespace_95c839d1
	Checksum: 0x55929BC3
	Offset: 0x5A68
	Size: 0x174
	Parameters: 0
	Flags: None
*/
function function_6074ced6()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	if(level.var_75a7d6 flag::get(#"hash_2df8e5e552b6acc4"))
	{
		return;
	}
	level.var_75a7d6 flag::set(#"hash_2df8e5e552b6acc4");
	level function_f83c329c(#"hash_68fef8aec4a2ac38", 0, 0, {#n_time:5, #str_id:#"hash_68fef8aec4a2ac38"}, 0);
	wait(0.5);
	level function_f83c329c(#"hash_3c3b7fabf09654bf", 1, 0, {#n_time:60, #str_id:#"hash_3c3b7fabf09654bf"});
	level.var_75a7d6 flag::clear(#"hash_2df8e5e552b6acc4");
}

/*
	Name: weakpoint_destroyed
	Namespace: namespace_95c839d1
	Checksum: 0x4353784E
	Offset: 0x5BE8
	Size: 0xC2A
	Parameters: 1
	Flags: None
*/
function weakpoint_destroyed(var_a07ea3db)
{
	if(!isdefined(var_a07ea3db))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	level.var_75a7d6 notify(#"weakpoint_destroyed");
	level.var_75a7d6 endon(#"weakpoint_destroyed");
	level thread function_e788990d();
	level thread function_b17579();
	level thread function_b852652a();
	switch(var_a07ea3db)
	{
		case "left":
		{
			str_shot = "left_arm_break";
			str_flag = #"hash_12678fff6a404d29";
			var_fae691b = [2:"j_shoulder_skin_le", 1:"j_shouldertwist_le", 0:"j_elbow_le"];
			var_ae4e0e20 = [0:"j_tentacle_root_le"];
			level.var_75a7d6 flag::clear(#"hash_25f8eaaceeb93d67");
			level.var_75a7d6 flag::clear(#"hash_1bd28fc130c9aad2");
			level.var_75a7d6.mdl_body clientfield::set("" + #"hash_d92501ab1efcdd", 2);
			exploder::kill_exploder("lgt_env_boss_left_arm_long");
			exploder::exploder("lgt_env_boss_left_arm_short");
			function_968e2ead();
			if(level.var_75a7d6 flag::get(#"hash_48bc8345fad29b74"))
			{
				level thread function_3d5eabf(str_shot);
				return;
			}
			var_f0d1671b = #"mine";
			level.var_75a7d6.var_a17b2556 clientfield::set("" + #"hash_399e2afd773621df", 1);
			level.var_75a7d6.var_b9f89aa6 clientfield::set("" + #"hash_399e2afd773621df", 1);
			level thread function_a39582f9(1);
			break;
		}
		case "right":
		{
			str_shot = "right_arm_break";
			str_flag = #"hash_48bc8345fad29b74";
			var_fae691b = [2:"j_shoulder_skin_ri", 1:"j_shouldertwist_ri", 0:"j_elbow_ri"];
			var_ae4e0e20 = [0:"j_tentacle_root_ri"];
			level.var_75a7d6 flag::clear(#"hash_25f8eaaceeb93d67");
			level.var_75a7d6 flag::clear(#"hash_1bd28fc130c9aad2");
			level.var_75a7d6.mdl_body clientfield::set("" + #"hash_d92501ab1efcdd", 3);
			exploder::kill_exploder("lgt_env_boss_right_arm_long");
			exploder::exploder("lgt_env_boss_right_arm_short");
			if(level.var_75a7d6 flag::get(#"hash_12678fff6a404d29"))
			{
				level thread function_3d5eabf(str_shot);
				return;
			}
			var_f0d1671b = #"frost";
			level.var_75a7d6.var_a17b2556 clientfield::set("" + #"hash_399e2afd773621df", 1);
			level.var_75a7d6.var_b9f89aa6 clientfield::set("" + #"hash_399e2afd773621df", 1);
			level thread function_a39582f9(1);
			break;
		}
		case "hash_565d5e19da6fb336":
		{
			str_shot = "stomach_break";
			str_flag = #"hash_17c454e32450dd92";
			var_ae4e0e20 = [1:"j_spinelower_tentacle_root", 0:"j_spineupper_tentacle_root"];
			level thread function_315805c0();
			level.var_75a7d6 notify(#"hash_21eabf998a71487a");
			level thread function_658da77b(1);
			level.var_75a7d6.var_a17b2556 clientfield::set("" + #"hash_399e2afd773621df", 3);
			level.var_75a7d6.var_b9f89aa6 clientfield::set("" + #"hash_399e2afd773621df", 3);
			level thread function_a39582f9(2);
			break;
		}
		case "head":
		{
			level.var_75a7d6 flag::set(#"defeated");
			return;
		}
	}
	if(isdefined(str_flag))
	{
		level.var_75a7d6 flag::set(str_flag);
	}
	if(level.var_75a7d6 flag::get_all([1:#"hash_48bc8345fad29b74", 0:#"hash_12678fff6a404d29"]))
	{
		level.var_75a7d6 flag::set(#"hash_4ae068100a9d8c76");
	}
	if(isdefined(str_shot))
	{
		function_773cc50a(var_a07ea3db, 0);
		if(isarray(var_fae691b))
		{
			foreach(str_tag in var_fae691b)
			{
				level.var_75a7d6.mdl_body hidepart(str_tag, "", 1);
			}
		}
		if(isarray(var_ae4e0e20))
		{
			foreach(str_tag in var_ae4e0e20)
			{
				level.var_75a7d6.mdl_body showpart(str_tag, "", 1);
			}
		}
		foreach(e_player in getplayers())
		{
			e_player function_bc82f900(#"hash_2933dbe91eb483ab");
		}
		a_ents[#"boss"] = level.var_75a7d6.mdl_body;
		level.var_75a7d6.var_d7f18c34 scene::play(#"hash_5ffc9256a4340dcb", str_shot, a_ents);
		level thread function_a3a141fe();
	}
	if(level.var_75a7d6 flag::get(#"hash_4ae068100a9d8c76"))
	{
		level.var_75a7d6.var_6a7d3d39 = level.var_75a7d6.var_79aa3ebd;
		level.var_75a7d6.var_9b4b863f = level.var_75a7d6.var_6a7d3d39;
		function_f3ac29fc();
		foreach(e_player in getplayers())
		{
			if(level.var_87a3c4d1 namespace_fb27ba0b::is_open(e_player))
			{
				level.var_87a3c4d1 namespace_fb27ba0b::function_74adcd8a(e_player, 1);
			}
		}
	}
	if(!level.var_75a7d6 flag::get(#"hash_30aaa6a4e90a9527"))
	{
		if(level.var_75a7d6 flag::get(#"hash_17c454e32450dd92"))
		{
			level thread function_7ed3f4dd(#"head");
		}
		if(!isdefined(var_f0d1671b))
		{
			level thread function_4346157c();
		}
		else
		{
			switch(var_f0d1671b)
			{
				case "mine":
				{
					level thread function_a6da15be();
					break;
				}
				case "frost":
				{
					level thread function_ecf643d2();
					break;
				}
			}
		}
	}
}

/*
	Name: function_968e2ead
	Namespace: namespace_95c839d1
	Checksum: 0xC12FB45
	Offset: 0x6820
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_968e2ead()
{
	mdl_clip = getent("end_fight_stand_clip_le", "targetname");
	if(isdefined(mdl_clip))
	{
		mdl_clip delete();
	}
}

/*
	Name: function_df782b45
	Namespace: namespace_95c839d1
	Checksum: 0x5631EAC8
	Offset: 0x6878
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_df782b45()
{
	mdl_clip = getent("end_fight_stand_clip_main", "targetname");
	if(isdefined(mdl_clip))
	{
		mdl_clip delete();
	}
}

/*
	Name: function_2c0b8bf0
	Namespace: namespace_95c839d1
	Checksum: 0xF6A7249C
	Offset: 0x68D0
	Size: 0x8A
	Parameters: 1
	Flags: None
*/
function function_2c0b8bf0(var_a07ea3db)
{
	if(!isdefined(var_a07ea3db))
	{
		return;
	}
	switch(var_a07ea3db)
	{
		case "left":
		{
			return "tag_fx_crystal_shoulder_le";
		}
		case "right":
		{
			return "tag_fx_crystal_shoulder_ri";
		}
		case "hash_565d5e19da6fb336":
		{
			return "tag_fx_crystal_belly";
		}
		case "head":
		{
			return "tag_head_crystal_fx";
		}
	}
}

/*
	Name: function_773cc50a
	Namespace: namespace_95c839d1
	Checksum: 0xBEB3A2FB
	Offset: 0x6968
	Size: 0x214
	Parameters: 2
	Flags: None
*/
function function_773cc50a(var_a07ea3db, n_cf)
{
	if(!isdefined(n_cf))
	{
		return;
	}
	str_tag = function_2c0b8bf0(var_a07ea3db);
	if(!isdefined(str_tag))
	{
		return;
	}
	mdl_fx = level.var_75a7d6.var_8f1d54b1[var_a07ea3db];
	if(!isdefined(mdl_fx) && n_cf > 0)
	{
		level.var_75a7d6.var_8f1d54b1[var_a07ea3db] = util::spawn_model(#"tag_origin", level.var_75a7d6.mdl_body gettagorigin(str_tag), level.var_75a7d6.mdl_body gettagangles(str_tag));
		mdl_fx = level.var_75a7d6.var_8f1d54b1[var_a07ea3db];
		mdl_fx linkto(level.var_75a7d6.mdl_body, str_tag);
	}
	if(isdefined(mdl_fx))
	{
		var_c674c4ec = "" + #"hash_1e031a294b1db7de";
		if(var_a07ea3db == #"head")
		{
			var_c674c4ec = "" + #"hash_4259da501d7deb09";
		}
		mdl_fx clientfield::set(var_c674c4ec, n_cf);
		if(n_cf <= 0)
		{
			level thread function_d1acf958(var_a07ea3db);
			level.var_75a7d6.var_8f1d54b1[var_a07ea3db] = undefined;
			mdl_fx thread util::delayed_delete(1);
		}
	}
}

/*
	Name: function_3f9ee018
	Namespace: namespace_95c839d1
	Checksum: 0x38FE9A85
	Offset: 0x6B88
	Size: 0xE8
	Parameters: 0
	Flags: None
*/
function function_3f9ee018()
{
	foreach(var_a07ea3db in [3:#"head", 2:#"hash_565d5e19da6fb336", 1:#"right", 0:#"left"])
	{
		function_773cc50a(var_a07ea3db, 0);
	}
}

/*
	Name: function_d1acf958
	Namespace: namespace_95c839d1
	Checksum: 0x8BC55937
	Offset: 0x6C78
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_d1acf958(var_a07ea3db)
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"hash_610f67b9b5f9b320");
	for(i = 0; i < 20; i++)
	{
		level thread function_4a0ebe24(var_a07ea3db);
		wait(randomfloatrange(0.1, 0.2));
	}
}

/*
	Name: function_4a0ebe24
	Namespace: namespace_95c839d1
	Checksum: 0x4C8828F6
	Offset: 0x6D20
	Size: 0x644
	Parameters: 1
	Flags: None
*/
function function_4a0ebe24(var_a07ea3db)
{
	str_tag = function_2c0b8bf0(var_a07ea3db);
	if(!isdefined(str_tag))
	{
		return;
	}
	v_start = level.var_75a7d6.mdl_body gettagorigin(str_tag);
	if(var_a07ea3db == #"left" || var_a07ea3db == #"right")
	{
		v_start = v_start - (0, 0, randomfloatrange(50, 250));
	}
	v_end = level.var_75a7d6.var_b9f89aa6 gettagorigin("tag_fx");
	n_total_time = distance(v_start, v_end) / 1000;
	if(n_total_time <= 0)
	{
		return;
	}
	mdl_fx = util::spawn_model(#"tag_origin", v_start);
	mdl_fx endon(#"death");
	mdl_fx clientfield::set("" + #"hash_1c5cfe17e34e65aa", 1);
	if(var_a07ea3db == #"hash_565d5e19da6fb336")
	{
		mdl_fx moveto(v_end, n_total_time);
		mdl_fx waittill(#"movedone");
	}
	else
	{
		var_f8c30dac = undefined;
		var_8a4df751 = undefined;
		v_facing = vectortoangles(v_end - v_start);
		v_right = anglestoright(v_facing);
		v_up = anglestoup(v_facing);
		var_6ff1e8c = 1000;
		var_58fa6e59 = 2000;
		var_b8005499 = 0;
		var_d0d079ca = 500;
		switch(var_a07ea3db)
		{
			case "left":
			{
				var_6ff1e8c = var_6ff1e8c * -1;
				var_58fa6e59 = var_58fa6e59 * -1;
				break;
			}
			case "head":
			{
				var_f8c30dac = 0;
				break;
			}
		}
		if(!isdefined(var_f8c30dac))
		{
			if(var_6ff1e8c == var_58fa6e59)
			{
				var_f8c30dac = var_6ff1e8c;
			}
			else
			{
				if(var_6ff1e8c < var_58fa6e59)
				{
					var_f8c30dac = randomfloatrange(var_6ff1e8c, var_58fa6e59);
				}
				else
				{
					var_f8c30dac = randomfloatrange(var_58fa6e59, var_6ff1e8c);
				}
			}
		}
		if(!isdefined(var_8a4df751))
		{
			if(var_b8005499 == var_d0d079ca)
			{
				var_8a4df751 = var_b8005499;
			}
			else
			{
				if(var_b8005499 < var_d0d079ca)
				{
					var_8a4df751 = randomfloatrange(var_b8005499, var_d0d079ca);
				}
				else
				{
					var_8a4df751 = randomfloatrange(var_d0d079ca, var_b8005499);
				}
			}
		}
		var_480c0d5e = randomfloatrange(0.1, 0.2);
		var_422b06ce = randomfloatrange(0.4, 0.5);
		n_start_time = gettime();
		while(true)
		{
			n_time_passed = (float(gettime() - n_start_time)) / 1000;
			n_time_left = n_total_time - n_time_passed;
			if(n_time_left <= 0)
			{
				break;
			}
			n_percent = n_time_passed / n_total_time;
			if(n_percent < 0)
			{
				n_percent = 0;
			}
			else if(n_percent > 1)
			{
				n_percent = 1;
			}
			v_move = v_end;
			if(n_percent <= var_480c0d5e)
			{
				var_32b2288d = n_percent / var_480c0d5e;
				var_d7015271 = lerpfloat(0, var_f8c30dac, var_32b2288d);
				var_5b6e1d07 = lerpfloat(0, var_8a4df751, var_32b2288d);
			}
			else
			{
				if(n_percent <= var_422b06ce)
				{
					var_32b2288d = (n_percent - var_480c0d5e) / var_422b06ce;
					var_d7015271 = lerpfloat(var_f8c30dac, 0, var_32b2288d);
					var_5b6e1d07 = lerpfloat(var_8a4df751, 0, var_32b2288d);
				}
				else
				{
					var_d7015271 = 0;
					var_5b6e1d07 = 0;
				}
			}
			v_move = v_move + (v_right * var_d7015271);
			v_move = v_move + (v_up * var_5b6e1d07);
			mdl_fx moveto(v_move, n_time_left);
			waitframe(1);
		}
	}
	mdl_fx clientfield::set("" + #"hash_1c5cfe17e34e65aa", 0);
	wait(1);
	mdl_fx delete();
}

/*
	Name: function_a39582f9
	Namespace: namespace_95c839d1
	Checksum: 0x602F906A
	Offset: 0x7370
	Size: 0x1F0
	Parameters: 1
	Flags: None
*/
function function_a39582f9(n_level)
{
	if(!isdefined(n_level))
	{
		n_level = 1;
	}
	var_433eb1d7 = level.var_75a7d6.var_b9f89aa6;
	if(!isdefined(var_433eb1d7))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"hash_77857ae271f589c7");
	var_433eb1d7 endon(#"death");
	level.var_75a7d6.var_307f9dcc = n_level;
	if(level.var_75a7d6 flag::get(#"hash_76938fcd446f94b5"))
	{
		return;
	}
	level.var_75a7d6 flag::set(#"hash_76938fcd446f94b5");
	a_ents[#"eye"] = var_433eb1d7;
	while(true)
	{
		if(!isdefined(level.var_75a7d6.var_307f9dcc))
		{
			return;
		}
		switch(level.var_75a7d6.var_307f9dcc)
		{
			case 1:
			{
				str_shot = "Shot 1";
				break;
			}
			case 2:
			{
				str_shot = "Shot 2";
				break;
			}
			case 3:
			{
				str_shot = "Shot 3";
				break;
			}
		}
		if(!isdefined(str_shot))
		{
			return;
		}
		var_433eb1d7 scene::play(#"hash_66fb9111d689a98e", str_shot, a_ents);
	}
}

/*
	Name: function_768e1bba
	Namespace: namespace_95c839d1
	Checksum: 0xA82D6DF2
	Offset: 0x7568
	Size: 0x1FC
	Parameters: 0
	Flags: None
*/
function function_768e1bba()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	level.var_75a7d6 flag::wait_till_any([1:#"hash_48bc8345fad29b74", 0:#"hash_12678fff6a404d29"]);
	level.var_75a7d6 flag::increment(#"hash_3201bcb3cc3b7209");
	wait(2);
	level function_f83c329c(#"hash_6c4553137f1098ec", 0, 0, undefined, 0, 1);
	wait(2);
	level function_fee3db9("bf_fsnrtv75_fskn_0", 1);
	level.var_75a7d6 flag::decrement(#"hash_3201bcb3cc3b7209");
	level.var_75a7d6 flag::wait_till(#"hash_17c454e32450dd92");
	level.var_75a7d6 flag::increment(#"hash_3201bcb3cc3b7209");
	wait(2);
	level function_f83c329c(#"hash_6c4553137f1098ec", 0, 0, undefined, 0, 1);
	wait(2);
	level function_fee3db9("bf_fsnrtv25_fskn_0", 1);
	level.var_75a7d6 flag::decrement(#"hash_3201bcb3cc3b7209");
}

/*
	Name: function_60c68651
	Namespace: namespace_95c839d1
	Checksum: 0x64345807
	Offset: 0x7770
	Size: 0x83E
	Parameters: 0
	Flags: None
*/
function function_60c68651()
{
	level.var_75a7d6.var_a6d734ec = [];
	foreach(str_id in [13:#"hash_1b714dba19ea3e0f", 12:#"hash_1b88d2ba19fdfeef", 11:#"hash_1b81e1ba19f7f9be", 10:#"hash_2543c53a17547f61", 9:#"hash_7a617db243a2fb6f", 8:#"hash_3c3b7fabf09654bf", 7:#"hash_6c4553137f1098ec", 6:#"hash_68fef8aec4a2ac38", 5:#"hash_34751c9f81d0e94f", 4:#"hash_3ae5c3c2322b1c03", 3:#"eyes", 2:#"mine", 1:#"frost", 0:#"ground"])
	{
		switch(str_id)
		{
			case "ground":
			{
				var_3608d414 = [4:"bf_electric_fskn_4", 3:"bf_electric_fskn_3", 2:"bf_electric_fskn_2", 1:"bf_electric_fskn_1", 0:"bf_electric_fskn_0"];
				break;
			}
			case "frost":
			{
				var_3608d414 = [4:"frost_blast_4", 3:"frost_blast_3", 2:"frost_blast_2", 1:"frost_blast_1", 0:"frost_blast_0"];
				break;
			}
			case "mine":
			{
				var_3608d414 = [4:"energy_mine_4", 3:"energy_mine_3", 2:"energy_mine_2", 1:"energy_mine_1", 0:"energy_mine_0"];
				break;
			}
			case "eyes":
			{
				var_3608d414 = [4:"eyebeam_4", 3:"eyebeam_3", 2:"eyebeam_2", 1:"eyebeam_1", 0:"eyebeam_0"];
				break;
			}
			case "hash_3ae5c3c2322b1c03":
			{
				var_3608d414 = [4:#"hash_1139351a3d32e3ac", 3:#"hash_1139361a3d32e55f", 2:#"hash_1139331a3d32e046", 1:#"hash_1139341a3d32e1f9", 0:#"hash_1139311a3d32dce0"];
				break;
			}
			case "hash_34751c9f81d0e94f":
			{
				var_3608d414 = [2:#"hash_691136558077ea42", 1:#"hash_691137558077ebf5", 0:#"hash_691134558077e6dc"];
				break;
			}
			case "hash_68fef8aec4a2ac38":
			{
				var_3608d414 = [4:#"hash_4f985bb4179d3217", 3:#"hash_4f985ab4179d3064", 2:#"hash_4f9859b4179d2eb1", 1:#"hash_4f9858b4179d2cfe", 0:#"hash_4f9857b4179d2b4b"];
				break;
			}
			case "hash_6c4553137f1098ec":
			{
				var_3608d414 = [4:#"hash_5420aa71d07e03d1", 3:#"hash_5420a971d07e021e", 2:#"hash_5420ac71d07e0737", 1:#"hash_5420ab71d07e0584", 0:#"hash_5420ae71d07e0a9d"];
				break;
			}
			case "hash_3c3b7fabf09654bf":
			{
				var_3608d414 = [4:"hregen_fskn_4", 3:"hregen_fskn_3", 2:"hregen_fskn_2", 1:"hregen_fskn_1", 0:"hregen_fskn_0"];
				break;
			}
			case "hash_7a617db243a2fb6f":
			{
				var_3608d414 = [3:"end_fight_maxis_move_04", 2:"end_fight_maxis_move_03", 1:"end_fight_maxis_move_02", 0:"end_fight_maxis_move_01"];
				break;
			}
			case "hash_2543c53a17547f61":
			{
				var_3608d414 = [2:"end_fight_maxis_taunt_100_03", 1:"end_fight_maxis_taunt_100_02", 0:"end_fight_maxis_taunt_100_01"];
				break;
			}
			case "hash_1b81e1ba19f7f9be":
			{
				var_3608d414 = [2:"end_fight_maxis_taunt_75_03", 1:"end_fight_maxis_taunt_75_02", 0:"end_fight_maxis_taunt_75_01"];
				break;
			}
			case "hash_1b88d2ba19fdfeef":
			{
				var_3608d414 = [2:"end_fight_maxis_taunt_50_03", 1:"end_fight_maxis_taunt_50_02", 0:"end_fight_maxis_taunt_50_01"];
				break;
			}
			case "hash_1b714dba19ea3e0f":
			{
				var_3608d414 = [2:"end_fight_maxis_taunt_25_03", 1:"end_fight_maxis_taunt_25_02", 0:"end_fight_maxis_taunt_25_01"];
				break;
			}
		}
		if(isdefined(var_3608d414))
		{
			level.var_75a7d6.var_3608d414[str_id][#"all"] = array::randomize(var_3608d414);
			level.var_75a7d6.var_3608d414[str_id][#"remaining"] = arraycopy(level.var_75a7d6.var_3608d414[str_id][#"all"]);
		}
	}
}

/*
	Name: function_f83c329c
	Namespace: namespace_95c839d1
	Checksum: 0x5EDD235
	Offset: 0x7FB8
	Size: 0x3B4
	Parameters: 6
	Flags: None
*/
function function_f83c329c(str_id, var_2adc0309, n_delay, var_591caa3e, var_127a2393, b_priority)
{
	if(!isdefined(var_2adc0309))
	{
		var_2adc0309 = 0;
	}
	if(!isdefined(n_delay))
	{
		n_delay = 0.5;
	}
	if(!isdefined(var_127a2393))
	{
		var_127a2393 = 1;
	}
	if(!isdefined(b_priority))
	{
		b_priority = 0;
	}
	if(!(isdefined(str_id) && isdefined(level.var_75a7d6.var_3608d414[str_id])))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	if(n_delay > 0)
	{
		wait(n_delay);
	}
	if(!level.var_75a7d6 flag::get(#"hash_287677ffb745b0e2"))
	{
		return;
	}
	if(!b_priority && level.var_75a7d6 flag::get(#"hash_3201bcb3cc3b7209"))
	{
		return;
	}
	if(!var_2adc0309 && function_ef8d1319())
	{
		return;
	}
	if(level.var_75a7d6.var_3608d414[str_id][#"remaining"].size <= 0)
	{
		if(!var_127a2393)
		{
			return;
		}
		level.var_75a7d6.var_3608d414[str_id][#"remaining"] = arraycopy(level.var_75a7d6.var_3608d414[str_id][#"all"]);
	}
	str_vo = level.var_75a7d6.var_3608d414[str_id][#"remaining"][0];
	var_cb85d3b5 = var_591caa3e.str_id;
	n_cooldown = var_591caa3e.n_time;
	b_cooldown = isdefined(var_cb85d3b5) && isdefined(n_cooldown) && n_cooldown > 0;
	if(b_cooldown)
	{
		if(is_true(level.var_75a7d6.var_a6d734ec[var_cb85d3b5]))
		{
			return;
		}
		if(!isdefined(level.var_75a7d6.var_a6d734ec[var_cb85d3b5]))
		{
			level.var_75a7d6.var_a6d734ec[var_cb85d3b5] = 0;
		}
		level.var_75a7d6.var_a6d734ec[var_cb85d3b5]++;
	}
	arrayremoveindex(level.var_75a7d6.var_3608d414[str_id][#"remaining"], 0);
	if(var_2adc0309)
	{
		level function_fee3db9(str_vo);
	}
	else
	{
		level zm_vo::function_7622cb70(str_vo, 0, 0);
	}
	if(b_cooldown)
	{
		level thread function_dbbcebc8(var_cb85d3b5, n_cooldown);
	}
}

/*
	Name: function_ef8d1319
	Namespace: namespace_95c839d1
	Checksum: 0xA048067
	Offset: 0x8378
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function function_ef8d1319()
{
	foreach(e_player in getplayers())
	{
		if(zm_vo::function_d122265c(e_player) || zm_vo::function_c10c4064(e_player))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_dbbcebc8
	Namespace: namespace_95c839d1
	Checksum: 0xA943EDD9
	Offset: 0x8438
	Size: 0x70
	Parameters: 2
	Flags: None
*/
function function_dbbcebc8(var_cb85d3b5, n_cooldown)
{
	wait(n_cooldown);
	level.var_75a7d6.var_a6d734ec[var_cb85d3b5] = int(max(0, level.var_75a7d6.var_a6d734ec[var_cb85d3b5] - 1));
}

/*
	Name: function_fee3db9
	Namespace: namespace_95c839d1
	Checksum: 0xF588611
	Offset: 0x84B0
	Size: 0x194
	Parameters: 2
	Flags: None
*/
function function_fee3db9(str_shot, b_priority)
{
	if(!isdefined(b_priority))
	{
		b_priority = 0;
	}
	if(!isdefined(str_shot))
	{
		return;
	}
	if(!b_priority && level.var_75a7d6 flag::get_any([1:#"hash_4e953b3843bae375", 0:#"hash_3201bcb3cc3b7209"]))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 flag::increment(#"hash_4e953b3843bae375");
	a_ents[#"head"] = level.var_75a7d6.mdl_head;
	level.var_75a7d6.mdl_anchor scene::play(#"hash_4dae4f482421b3ed", str_shot, a_ents);
	level.var_75a7d6.mdl_anchor thread scene::play(#"hash_4dae4f482421b3ed", "idle", a_ents);
	waitframe(1);
	level.var_75a7d6 flag::decrement(#"hash_4e953b3843bae375");
}

/*
	Name: function_3d5eabf
	Namespace: namespace_95c839d1
	Checksum: 0xDD1D5403
	Offset: 0x8650
	Size: 0x12D4
	Parameters: 1
	Flags: None
*/
function function_3d5eabf(str_shot)
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	level.var_75a7d6 flag::set(#"hash_12678fff6a404d29");
	level.var_75a7d6 flag::set(#"hash_48bc8345fad29b74");
	level.var_75a7d6 flag::set(#"hash_4ae068100a9d8c76");
	foreach(var_ce34262e in level.var_75a7d6.var_e890a8bc)
	{
		if(isdefined(var_ce34262e))
		{
			var_ce34262e deletedelay();
		}
	}
	function_3f9ee018();
	var_fae691b = [7:"tag_fx_crystal_shoulder_ri", 6:"tag_fx_crystal_shoulder_le", 5:"j_shoulder_skin_ri", 4:"j_shouldertwist_ri", 3:"j_elbow_ri", 2:"j_shoulder_skin_le", 1:"j_shouldertwist_le", 0:"j_elbow_le"];
	foreach(var_676e0814 in var_fae691b)
	{
		level.var_75a7d6.mdl_body hidepart(var_676e0814, "", 1);
	}
	var_ae4e0e20 = [1:"j_tentacle_root_ri", 0:"j_tentacle_root_le"];
	foreach(var_eabfe72c in var_ae4e0e20)
	{
		level.var_75a7d6.mdl_body showpart(var_eabfe72c, "", 1);
	}
	foreach(e_player in getplayers())
	{
		e_player function_bc82f900(#"hash_2933dbe91eb483ab");
	}
	level.var_75a7d6 notify(#"weakpoint_destroyed");
	level thread function_e788990d();
	level thread function_b17579();
	level thread function_b852652a();
	level.var_75a7d6.mdl_body clientfield::set("" + #"hash_d92501ab1efcdd", 0);
	function_968e2ead();
	level.var_75a7d6.var_a17b2556 clientfield::set("" + #"hash_399e2afd773621df", 2);
	level.var_75a7d6.var_b9f89aa6 clientfield::set("" + #"hash_399e2afd773621df", 2);
	level thread function_a39582f9(1);
	zm_zonemgr::enable_zone("zone_intermission");
	level flag::set(#"in_dark_side");
	level thread function_bf51b2c6(str_shot);
	var_92bcfbc2 = level.var_75a7d6.var_c20e460e.var_529d63dd[0];
	if(isstruct(var_92bcfbc2))
	{
		var_92bcfbc2 flag::clear(#"disabled");
	}
	wait(2);
	level thread function_f83c329c(#"hash_6c4553137f1098ec", 0, 0, undefined, 0);
	wait(3);
	level.var_75a7d6 flag::wait_till(#"hash_363e22e57480b98d");
	music::setmusicstate("boss_intermission");
	level thread function_fee3db9("intermission_enough", 1);
	s_earthquake = {#n_duration:4, #n_end:0.4, #n_start:0, #radius:9999, #origin:level.var_75a7d6.var_d7f18c34.origin};
	level thread function_a7978694(s_earthquake);
	callback::on_spawned(&function_9ae7cdd5);
	foreach(e_player in function_a1ef346b())
	{
		e_player thread function_9ae7cdd5();
	}
	function_480e30e5();
	wait(0.5);
	a_ents[#"boss"] = level.var_75a7d6.mdl_body;
	level.var_75a7d6.var_d7f18c34 thread scene::play(#"hash_5ffc9256a4340dcb", "beam_intro", a_ents);
	wait(1.5);
	level clientfield::set("" + #"hash_5a36f05cbdf2580", 7);
	level thread lui::screen_fade(2, 0.1, 0, (1, 1, 1), undefined, undefined, 1);
	wait(2);
	level lui::screen_fade_out(0, (0, 0, 0), undefined, 1);
	level.var_75a7d6 flag::set(#"intermission");
	level.var_75a7d6 flag::set(#"hash_2c72f33c763d5790");
	s_earthquake notify(#"stop");
	level.var_75a7d6 notify(#"hash_21eabf998a71487a");
	level thread zm_utility::function_9ad5aeb1(0, 1, 0, 0);
	foreach(e_player in getplayers())
	{
		if(level.var_87a3c4d1 namespace_fb27ba0b::is_open(e_player))
		{
			level.var_87a3c4d1 namespace_fb27ba0b::close(e_player);
		}
	}
	namespace_ee206246::objective_complete(#"maxis");
	level.var_75a7d6.var_c20e460e.var_2644aca3 clientfield::set("" + #"hash_25155d60768d46e4", 0);
	wait(1);
	if(isarray(level.var_75a7d6.var_62b6205d))
	{
		foreach(i, e_player in function_a1ef346b())
		{
			s_teleport = level.var_75a7d6.var_62b6205d[i];
			if(isstruct(s_teleport))
			{
				e_player setorigin(s_teleport.origin);
				e_player setplayerangles(s_teleport.angles);
			}
		}
	}
	level thread function_a3a141fe();
	wait(2);
	level thread zm_utility::function_9ad5aeb1(0, 1, 0, 0);
	level zm_vo::function_d6f8bbd9(#"hash_61e6a8ba57ce80bf", 0, getplayers());
	level.var_75a7d6 flag::set(#"hash_196a9e138aead1fd");
	level clientfield::set("" + #"hash_5a36f05cbdf2580", 8);
	level lui::screen_fade_in(0, (1, 1, 1));
	level lui::screen_fade_in(0, (0, 0, 0));
	wait(2);
	level zm_vo::function_d6f8bbd9(#"hash_61e6a9ba57ce8272", 0, getplayers());
	level thread function_151b84df();
	level thread namespace_96b7f11d::function_4cc5fca6();
	level zm_vo::function_7622cb70(#"hash_1c3c016ac370822e");
	level clientfield::set("" + #"hash_5a36f05cbdf2580", 9);
	callback::remove_on_spawned(&function_9ae7cdd5);
	level.var_75a7d6 notify(#"hash_282133e71284d937");
	var_267ff905 = level.var_75a7d6.var_4d537044;
	if(isarray(var_267ff905))
	{
		foreach(e_player in function_a1ef346b())
		{
			s_return = var_267ff905[i];
			if(isstruct(s_return))
			{
				level thread function_d0abbc0a(e_player, s_return);
			}
		}
	}
	wait(1);
	level.var_75a7d6 flag::set(#"hash_1410e6fe1e67d4fd");
	level.var_75a7d6.var_c20e460e.var_2644aca3 clientfield::set("" + #"hash_25155d60768d46e4", 1);
	wait(3);
	level thread function_fee3db9("intermission_5", 1);
	wait(3);
	music::setmusicstate("boss_part2");
	level.var_75a7d6 flag::clear(#"intermission");
	level flag::clear(#"in_dark_side");
	foreach(e_player in getplayers())
	{
		level.var_87a3c4d1 namespace_fb27ba0b::function_74adcd8a(e_player, 1);
		if(!level.var_87a3c4d1 namespace_fb27ba0b::is_open(e_player))
		{
			level.var_87a3c4d1 namespace_fb27ba0b::open(e_player);
		}
	}
	level.var_75a7d6.var_3f956940 = int(level.var_75a7d6.var_8d31700f - 2000);
	function_73f95a0c();
	level.var_75a7d6.var_6a7d3d39 = level.var_75a7d6.var_79aa3ebd;
	level.var_75a7d6.var_9b4b863f = level.var_75a7d6.var_6a7d3d39;
	function_f3ac29fc();
	level thread function_7ed3f4dd(#"hash_565d5e19da6fb336");
	e_target = function_8407e36d();
	if(isdefined(e_target))
	{
		level thread function_f68fc7a0(e_target, 0);
	}
	else
	{
		level thread function_4346157c(undefined, 0);
	}
	namespace_ee206246::objective_set(#"hash_1c8b4e14ac690a43", level.var_75a7d6.var_c20e460e.var_2644aca3, 0, #"hash_90d41432e6bd428", #"maxis", undefined, &function_a4650866);
	function_4ba59ffe();
	level.var_75a7d6 flag::clear(#"hash_15ced8000939a79b");
	level.var_75a7d6 flag::clear(#"hash_71a8b0cba966f837");
	level.var_75a7d6 flag::clear(#"hash_88667c18a4cff07");
	level.var_75a7d6 flag::clear(#"hash_1bd28fc130c9aad2");
	level.var_75a7d6 flag::clear(#"hash_25f8eaaceeb93d67");
	level thread function_658da77b();
}

/*
	Name: function_bf51b2c6
	Namespace: namespace_95c839d1
	Checksum: 0x7FBE1646
	Offset: 0x9930
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_bf51b2c6(str_shot)
{
	if(!isdefined(str_shot))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	a_ents[#"boss"] = level.var_75a7d6.mdl_body;
	level.var_75a7d6.var_d7f18c34 scene::play(#"hash_5ffc9256a4340dcb", str_shot, a_ents);
	level thread function_a3a141fe();
	waitframe(1);
	level.var_75a7d6 flag::set(#"hash_363e22e57480b98d");
}

/*
	Name: function_9ae7cdd5
	Namespace: namespace_95c839d1
	Checksum: 0x5F10E46F
	Offset: 0x9A28
	Size: 0x27C
	Parameters: 0
	Flags: None
*/
function function_9ae7cdd5()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"hash_282133e71284d937");
	self endon(#"death");
	self callback::function_d8abfc3d(#"on_player_killed", &function_3f4e7d9c);
	self val::set(#"hash_135155741ee551dc", "allowdeath", 0);
	level.var_75a7d6 flag::wait_till(#"hash_2c72f33c763d5790");
	self.var_f22c83f5 = 1;
	self.var_f4e33249 = 1;
	self val::set(#"hash_135155741ee551dc", "takedamage", 0);
	self val::set(#"hash_135155741ee551dc", "ignoreme", 1);
	self clientfield::set_to_player("" + #"hash_721d42a28d7461ea", 1);
	if(!level.var_75a7d6 flag::get(#"hash_196a9e138aead1fd"))
	{
		self val::set(#"hash_135155741ee551dc", "freezecontrols", 1);
		self val::set(#"hash_135155741ee551dc", "show_crosshair", 0);
		level.var_75a7d6 flag::wait_till(#"hash_196a9e138aead1fd");
		self val::reset(#"hash_135155741ee551dc", "freezecontrols");
		self val::reset(#"hash_135155741ee551dc", "show_crosshair");
	}
}

/*
	Name: function_3f4e7d9c
	Namespace: namespace_95c839d1
	Checksum: 0x924CDD00
	Offset: 0x9CB0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_3f4e7d9c(s_params)
{
	function_c618b503(self);
}

/*
	Name: function_c618b503
	Namespace: namespace_95c839d1
	Checksum: 0xA8018E21
	Offset: 0x9CE0
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_c618b503(e_player)
{
	if(!isdefined(e_player))
	{
		return;
	}
	e_player callback::function_52ac9652(#"on_player_killed", &function_3f4e7d9c);
	e_player val::reset_all(#"hash_135155741ee551dc");
	e_player.var_f22c83f5 = undefined;
	e_player.var_f4e33249 = undefined;
	e_player clientfield::set_to_player("" + #"hash_721d42a28d7461ea", 0);
}

/*
	Name: function_151b84df
	Namespace: namespace_95c839d1
	Checksum: 0x88DE8079
	Offset: 0x9D98
	Size: 0x164
	Parameters: 0
	Flags: None
*/
function function_151b84df()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	wait(2);
	s_portal = level.var_75a7d6.var_b62c0fab;
	if(isstruct(s_portal))
	{
		var_94b03771 = util::spawn_model(#"tag_origin", s_portal.origin, s_portal.angles);
		var_94b03771 clientfield::set("" + #"hash_442272758f2bf947", 1);
		level.var_75a7d6 flag::wait_till(#"hash_1410e6fe1e67d4fd");
		var_94b03771 clientfield::set("" + #"hash_442272758f2bf947", 1);
		wait(1);
		if(isdefined(var_94b03771))
		{
			var_94b03771 delete();
		}
	}
}

/*
	Name: function_d0abbc0a
	Namespace: namespace_95c839d1
	Checksum: 0xB4798421
	Offset: 0x9F08
	Size: 0xAC
	Parameters: 2
	Flags: None
*/
function function_d0abbc0a(e_player, s_return)
{
	if(!isdefined(e_player) || !isstruct(s_return))
	{
		return;
	}
	level endon(#"end_game");
	e_player endon(#"disconnect");
	e_player zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, s_return, undefined, undefined, 1);
	function_c618b503(e_player);
}

/*
	Name: function_315805c0
	Namespace: namespace_95c839d1
	Checksum: 0x9674C6DB
	Offset: 0x9FC0
	Size: 0x144
	Parameters: 0
	Flags: None
*/
function function_315805c0()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"hash_4662a2496f03b94");
	s_fx = level.var_75a7d6.var_be9eb6ec;
	if(isstruct(s_fx) && !level.var_75a7d6 flag::get(#"hash_54846992148a189f"))
	{
		level.var_75a7d6 flag::set(#"hash_54846992148a189f");
		level.var_75a7d6.var_89324ead = util::spawn_model(#"tag_origin", s_fx.origin, s_fx.angles);
		level.var_75a7d6.var_89324ead clientfield::set("" + #"hash_5b501a097c44b478", 1);
	}
}

/*
	Name: function_6c567aad
	Namespace: namespace_95c839d1
	Checksum: 0xB21C8E97
	Offset: 0xA110
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_6c567aad()
{
	level.var_75a7d6 notify(#"hash_4662a2496f03b94");
	level.var_75a7d6 flag::clear(#"hash_54846992148a189f");
	if(isdefined(level.var_75a7d6.var_89324ead))
	{
		level.var_75a7d6.var_89324ead clientfield::set("" + #"hash_5b501a097c44b478", 0);
		level.var_75a7d6.var_89324ead thread util::delayed_delete(1);
	}
}

/*
	Name: function_a3a141fe
	Namespace: namespace_95c839d1
	Checksum: 0xC0075059
	Offset: 0xA1D8
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_a3a141fe()
{
	str_idle = "idle_both_arms";
	if(level.var_75a7d6 flag::get(#"hash_4ae068100a9d8c76"))
	{
		str_idle = "idle_no_arms";
	}
	else
	{
		if(level.var_75a7d6 flag::get(#"hash_12678fff6a404d29"))
		{
			str_idle = "idle_right_arm";
		}
		else if(level.var_75a7d6 flag::get(#"hash_48bc8345fad29b74"))
		{
			str_idle = "idle_left_arm";
		}
	}
	if(isdefined(str_idle))
	{
		a_ents[#"boss"] = level.var_75a7d6.mdl_body;
		level.var_75a7d6.var_d7f18c34 thread scene::play(#"hash_5ffc9256a4340dcb", str_idle, a_ents);
	}
}

/*
	Name: function_4346157c
	Namespace: namespace_95c839d1
	Checksum: 0xE603C427
	Offset: 0xA308
	Size: 0xA28
	Parameters: 2
	Flags: None
*/
function function_4346157c(var_9161d39c, b_play_vo)
{
	if(!isdefined(var_9161d39c))
	{
		var_9161d39c = #"";
	}
	if(!isdefined(b_play_vo))
	{
		b_play_vo = 1;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed", #"hash_35eefe12894036fd");
	if(var_9161d39c != #"")
	{
		if(!isdefined(level.var_75a7d6.var_9d7dfc4c) && !level.var_75a7d6 flag::get(#"hash_4ae068100a9d8c76"))
		{
			level thread function_42baf70a();
		}
		var_190b1087 = 13;
		if(level.var_75a7d6 flag::get(#"hash_17c454e32450dd92"))
		{
			var_190b1087 = 7;
		}
		else if(level.var_75a7d6 flag::get(#"hash_4ae068100a9d8c76"))
		{
			var_190b1087 = 10;
		}
		/#
			if(isdefined(level.var_75a7d6.var_9d7dfc4c))
			{
				var_190b1087 = 2;
			}
		#/
		wait(var_190b1087);
	}
	level.var_75a7d6 notify(#"hash_580c593762794508");
	if(!isdefined(level.var_75a7d6.var_9d7dfc4c))
	{
		var_60cde293 = function_eadf62a1();
		var_abef106b = var_60cde293.var_abef106b;
		if(isarray(var_abef106b) && var_abef106b.size > 0)
		{
			str_side = array::random(var_abef106b);
			if(isdefined(str_side))
			{
				level thread function_360256d0(str_side, b_play_vo);
				return;
			}
		}
	}
	var_acd1a5c4 = [];
	var_2cb97f5a = var_60cde293.var_2cb97f5a;
	if(isarray(var_2cb97f5a))
	{
		if(level.var_75a7d6.var_9d7dfc4c === #"hash_35eefe12894036fd" || !level.var_75a7d6 flag::get_any([1:#"hash_48bc8345fad29b74", 0:#"hash_12678fff6a404d29"]) || var_9161d39c != #"ground" || (level.var_75a7d6.var_1ec89ecd[#"ground"] + 1) <= 1)
		{
			var_acd1a5c4 = arraycombine(var_acd1a5c4, var_2cb97f5a);
		}
	}
	if(level.var_75a7d6.var_9d7dfc4c === #"hash_11bc100a0e014371" || (level.var_75a7d6 flag::get(#"hash_12678fff6a404d29") && (var_9161d39c != #"mine" || (level.var_75a7d6.var_1ec89ecd[#"mine"] + 1) <= 1)))
	{
		if(!isdefined(var_acd1a5c4))
		{
			var_acd1a5c4 = [];
		}
		else if(!isarray(var_acd1a5c4))
		{
			var_acd1a5c4 = array(var_acd1a5c4);
		}
		var_acd1a5c4[var_acd1a5c4.size] = #"mine";
	}
	if(level.var_75a7d6.var_9d7dfc4c === #"hash_3d123fac1908cd30" || (level.var_75a7d6 flag::get(#"hash_48bc8345fad29b74") && (var_9161d39c != #"frost" || (level.var_75a7d6.var_1ec89ecd[#"frost"] + 1) <= 1)))
	{
		if(!isdefined(var_acd1a5c4))
		{
			var_acd1a5c4 = [];
		}
		else if(!isarray(var_acd1a5c4))
		{
			var_acd1a5c4 = array(var_acd1a5c4);
		}
		var_acd1a5c4[var_acd1a5c4.size] = #"frost";
	}
	if(level.var_75a7d6.var_9d7dfc4c === #"hash_4a50cd145965b8cd" || (level.var_75a7d6 flag::get(#"hash_4ae068100a9d8c76") && (var_9161d39c != #"eyes" || (level.var_75a7d6.var_1ec89ecd[#"eyes"] + 1) <= 1)))
	{
		var_407a52db = function_8407e36d();
		if(isdefined(var_407a52db))
		{
			if(!isdefined(var_acd1a5c4))
			{
				var_acd1a5c4 = [];
			}
			else if(!isarray(var_acd1a5c4))
			{
				var_acd1a5c4 = array(var_acd1a5c4);
			}
			var_acd1a5c4[var_acd1a5c4.size] = #"eyes";
		}
	}
	var_b5714783 = array::random(var_acd1a5c4);
	/#
		if(isdefined(level.var_75a7d6.var_9d7dfc4c))
		{
			switch(level.var_75a7d6.var_9d7dfc4c)
			{
				case "hash_35eefe12894036fd":
				{
					if(isinarray(var_acd1a5c4, #"hash_3bffc6cd547d8d78") || isinarray(var_acd1a5c4, #"hash_3b99decd5427030e"))
					{
						var_b5714783 = array::random(var_2cb97f5a);
					}
					break;
				}
				case "hash_11bc100a0e014371":
				{
					if(isinarray(var_acd1a5c4, #"mine"))
					{
						var_b5714783 = #"mine";
					}
					break;
				}
				case "hash_3d123fac1908cd30":
				{
					if(isinarray(var_acd1a5c4, #"frost"))
					{
						var_b5714783 = #"frost";
					}
					break;
				}
				case "hash_4a50cd145965b8cd":
				{
					if(isinarray(var_acd1a5c4, #"eyes"))
					{
						var_b5714783 = #"eyes";
					}
					break;
				}
			}
		}
	#/
	if(isdefined(var_b5714783))
	{
		switch(var_b5714783)
		{
			case "hash_3b99decd5427030e":
			case "hash_3bffc6cd547d8d78":
			{
				level thread function_360256d0(var_b5714783, b_play_vo);
				arrayremovevalue(var_acd1a5c4, #"hash_3bffc6cd547d8d78");
				arrayremovevalue(var_acd1a5c4, #"hash_3b99decd5427030e");
				var_b5714783 = #"ground";
				break;
			}
			case "mine":
			{
				level thread function_a6da15be(b_play_vo);
				break;
			}
			case "frost":
			{
				level thread function_ecf643d2(b_play_vo);
				break;
			}
			case "eyes":
			{
				level thread function_f68fc7a0(var_407a52db, b_play_vo);
				break;
			}
		}
		if(var_9161d39c == var_b5714783)
		{
			level.var_75a7d6.var_1ec89ecd[var_b5714783]++;
			arrayremovevalue(var_acd1a5c4, var_b5714783);
		}
		foreach(var_b5714783 in var_acd1a5c4)
		{
			level.var_75a7d6.var_1ec89ecd[var_b5714783] = 0;
		}
	}
}

/*
	Name: function_42baf70a
	Namespace: namespace_95c839d1
	Checksum: 0x3B1E83E9
	Offset: 0xAD38
	Size: 0x112
	Parameters: 0
	Flags: None
*/
function function_42baf70a()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed", #"hash_580c593762794508");
	while(true)
	{
		wait(3);
		var_60cde293 = function_eadf62a1();
		var_abef106b = var_60cde293.var_abef106b;
		if(isarray(var_abef106b) && var_abef106b.size > 0)
		{
			str_side = array::random(var_abef106b);
			if(isdefined(str_side))
			{
				level.var_75a7d6 notify(#"hash_35eefe12894036fd");
				level thread function_360256d0(str_side);
				return;
			}
		}
	}
}

/*
	Name: function_eadf62a1
	Namespace: namespace_95c839d1
	Checksum: 0x70DAB73F
	Offset: 0xAE58
	Size: 0x324
	Parameters: 0
	Flags: None
*/
function function_eadf62a1()
{
	if(level.var_75a7d6 flag::get(#"hash_4ae068100a9d8c76"))
	{
		return;
	}
	var_2cb97f5a = [];
	if(!level.var_75a7d6 flag::get(#"hash_12678fff6a404d29"))
	{
		if(!isdefined(var_2cb97f5a))
		{
			var_2cb97f5a = [];
		}
		else if(!isarray(var_2cb97f5a))
		{
			var_2cb97f5a = array(var_2cb97f5a);
		}
		var_2cb97f5a[var_2cb97f5a.size] = #"hash_3bffc6cd547d8d78";
	}
	if(!level.var_75a7d6 flag::get(#"hash_48bc8345fad29b74"))
	{
		if(!isdefined(var_2cb97f5a))
		{
			var_2cb97f5a = [];
		}
		else if(!isarray(var_2cb97f5a))
		{
			var_2cb97f5a = array(var_2cb97f5a);
		}
		var_2cb97f5a[var_2cb97f5a.size] = #"hash_3b99decd5427030e";
	}
	var_abef106b = [];
	foreach(str_side in var_2cb97f5a)
	{
		s_smash = function_d9cc7790(str_side);
		if(isstruct(s_smash))
		{
			var_f07b30d6 = 0;
			foreach(e_player in function_a1ef346b(undefined, s_smash.origin, 350))
			{
				if(zm_utility::is_player_valid(e_player))
				{
					if(!isdefined(var_abef106b))
					{
						var_abef106b = [];
					}
					else if(!isarray(var_abef106b))
					{
						var_abef106b = array(var_abef106b);
					}
					var_abef106b[var_abef106b.size] = str_side;
					var_f07b30d6 = 1;
				}
			}
			if(var_f07b30d6)
			{
				continue;
			}
		}
	}
	return {#hash_abef106b:var_abef106b, #hash_2cb97f5a:var_2cb97f5a};
}

/*
	Name: function_360256d0
	Namespace: namespace_95c839d1
	Checksum: 0xD06C1882
	Offset: 0xB188
	Size: 0x1D4
	Parameters: 2
	Flags: None
*/
function function_360256d0(str_side, b_play_vo)
{
	if(!isdefined(b_play_vo))
	{
		b_play_vo = 1;
	}
	if(!isdefined(str_side))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	s_smash = function_d9cc7790(str_side);
	if(!isstruct(s_smash))
	{
		return;
	}
	level.var_75a7d6 flag::clear(#"hash_6807f54ba604f6ab");
	level thread function_85fbdab6(str_side);
	if(b_play_vo)
	{
		level thread function_f83c329c(#"ground", 1, 0.5, {#n_time:30, #str_id:#"boss_attack"});
	}
	level waittilltimeout(10, #"hash_4bf628b758247885");
	level thread function_7321121b(s_smash);
	level.var_75a7d6 flag::wait_till_timeout(10, #"hash_6807f54ba604f6ab");
	level thread function_4346157c(#"ground");
}

/*
	Name: function_d9cc7790
	Namespace: namespace_95c839d1
	Checksum: 0xC6E0C950
	Offset: 0xB368
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function function_d9cc7790(str_side)
{
	if(!isdefined(str_side))
	{
		return;
	}
	switch(str_side)
	{
		case "hash_3bffc6cd547d8d78":
		{
			return level.var_75a7d6.var_101a7fee;
		}
		case "hash_3b99decd5427030e":
		{
			return level.var_75a7d6.var_9ec26d20;
		}
	}
}

/*
	Name: function_85fbdab6
	Namespace: namespace_95c839d1
	Checksum: 0x2E384403
	Offset: 0xB3E8
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_85fbdab6(str_side)
{
	if(!isdefined(str_side))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	switch(str_side)
	{
		case "hash_3bffc6cd547d8d78":
		{
			str_shot = "smash_left_arm";
			break;
		}
		case "hash_3b99decd5427030e":
		{
			str_shot = "smash_right_arm";
			break;
		}
	}
	if(isdefined(str_shot))
	{
		a_ents[#"boss"] = level.var_75a7d6.mdl_body;
		level.var_75a7d6.var_d7f18c34 scene::play(#"hash_5ffc9256a4340dcb", str_shot, a_ents);
		level thread function_a3a141fe();
		level.var_75a7d6 flag::set(#"hash_6807f54ba604f6ab");
	}
}

/*
	Name: function_5db5dfb
	Namespace: namespace_95c839d1
	Checksum: 0xCB8284B8
	Offset: 0xB550
	Size: 0x3EE
	Parameters: 1
	Flags: None
*/
function function_5db5dfb(s_smash)
{
	if(!isstruct(s_smash))
	{
		return;
	}
	var_f0816cbc = s_smash.origin;
	var_a56afaf6 = [];
	for(i = 0; i < 7; i++)
	{
		for(j = 0; j < 5; j++)
		{
			var_296670f2 = 90 - (j * 45);
			n_dist = 250 + (300 * (i + 1));
			var_a6ddbc10 = var_f0816cbc + (sin(var_296670f2) * n_dist, cos(var_296670f2) * n_dist, 0);
			a_result = function_9cc082d2(var_a6ddbc10 + (0, 0, 256), 1024);
			v_navmesh = a_result[#"point"];
			if(isvec(v_navmesh))
			{
				var_943c7562 = {#a_v_points:[0:v_navmesh], #origin:v_navmesh};
				var_49b29c16 = (anglestoright(vectortoangles(v_navmesh - var_f0816cbc))) * 128;
				var_8efdecd9 = var_a6ddbc10 + var_49b29c16;
				var_8631b9c0 = var_a6ddbc10 - var_49b29c16;
				foreach(var_8487602c in [1:var_8631b9c0, 0:var_8efdecd9])
				{
					a_result = function_9cc082d2(var_8487602c + (0, 0, 256), 1024);
					v_navmesh = a_result[#"point"];
					if(isvec(v_navmesh))
					{
						if(!isdefined(var_943c7562.a_v_points))
						{
							var_943c7562.a_v_points = [];
						}
						else if(!isarray(var_943c7562.a_v_points))
						{
							var_943c7562.a_v_points = array(var_943c7562.a_v_points);
						}
						var_943c7562.a_v_points[var_943c7562.a_v_points.size] = v_navmesh;
					}
				}
				if(!isdefined(var_a56afaf6[i]))
				{
					var_a56afaf6[i] = [];
				}
				else if(!isarray(var_a56afaf6[i]))
				{
					var_a56afaf6[i] = array(var_a56afaf6[i]);
				}
				var_a56afaf6[i][var_a56afaf6[i].size] = var_943c7562;
			}
		}
	}
	return var_a56afaf6;
}

/*
	Name: function_7321121b
	Namespace: namespace_95c839d1
	Checksum: 0xB371B076
	Offset: 0xB948
	Size: 0x660
	Parameters: 1
	Flags: None
*/
function function_7321121b(s_smash)
{
	if(!isstruct(s_smash))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	var_f0816cbc = s_smash.origin;
	playfx(#"hash_7a69021eca63c8a8", var_f0816cbc, anglestoforward((0, 0, 0)), anglestoup((0, 0, 0)));
	playrumbleonposition(#"hash_5a9dc570c6066eef", var_f0816cbc);
	foreach(e_player in function_a1ef346b(undefined, var_f0816cbc, 250))
	{
		if(zm_utility::is_player_valid(e_player))
		{
			e_player dodamage(666, var_f0816cbc);
		}
	}
	foreach(e_player in function_a1ef346b(undefined, var_f0816cbc, 350))
	{
		if(zm_utility::is_player_valid(e_player))
		{
			e_player dodamage(100, var_f0816cbc, undefined, undefined, undefined, "MOD_EXPLOSIVE");
		}
	}
	var_a56afaf6 = s_smash.var_a56afaf6;
	if(isarray(var_a56afaf6))
	{
		foreach(var_cdc928cc in var_a56afaf6)
		{
			wait(0.5);
			foreach(var_943c7562 in var_cdc928cc)
			{
				a_v_points = var_943c7562.a_v_points;
				if(isarray(a_v_points))
				{
					var_722ef4d7 = [];
					foreach(v_point in a_v_points)
					{
						if(isvec(v_point))
						{
							playfx(#"hash_122277729dcbecd2", v_point);
							playsoundatposition(#"hash_722c8e8bcd6a9ad6", v_point);
							foreach(e_player in function_a1ef346b(undefined, v_point, 150))
							{
								if(zm_utility::is_player_valid(e_player))
								{
									if(!isdefined(var_722ef4d7))
									{
										var_722ef4d7 = [];
									}
									else if(!isarray(var_722ef4d7))
									{
										var_722ef4d7 = array(var_722ef4d7);
									}
									if(!isinarray(var_722ef4d7, e_player))
									{
										var_722ef4d7[var_722ef4d7.size] = e_player;
									}
								}
							}
						}
					}
					v_center = var_943c7562.origin;
					if(isvec(v_center))
					{
						playrumbleonposition(#"hash_279c4d5749de63bc", v_center);
						foreach(e_player in var_722ef4d7)
						{
							e_player dodamage(100, v_center, undefined, undefined, undefined, "MOD_EXPLOSIVE");
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_ecf643d2
	Namespace: namespace_95c839d1
	Checksum: 0xD8FFF0DC
	Offset: 0xBFB0
	Size: 0x2E4
	Parameters: 1
	Flags: None
*/
function function_ecf643d2(b_play_vo)
{
	if(!isdefined(b_play_vo))
	{
		b_play_vo = 1;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	var_f81a99e5 = level.var_75a7d6.var_64e1d42a[0];
	level thread function_9042d18c();
	if(b_play_vo)
	{
		var_591caa3e = {#n_time:30, #str_id:#"boss_attack"};
		if(!level.var_75a7d6 flag::get(#"hash_222fadd3d299cd5f"))
		{
			level.var_75a7d6 flag::set(#"hash_222fadd3d299cd5f");
			var_591caa3e = undefined;
		}
		level thread function_f83c329c(#"frost", 1, 0.5, var_591caa3e);
	}
	var_eb3b90d = struct::get_array(var_f81a99e5.target);
	var_eb3b90d = array::randomize(var_eb3b90d);
	foreach(s_spawn in var_eb3b90d)
	{
		level thread function_9df1d3c8(s_spawn);
	}
	wait(3);
	foreach(s_spawn in var_eb3b90d)
	{
		s_spawn notify(#"activate");
	}
	wait(10);
	level thread function_6c54dff5();
	level thread function_4346157c(#"frost");
}

/*
	Name: function_9042d18c
	Namespace: namespace_95c839d1
	Checksum: 0x2B57AC06
	Offset: 0xC2A0
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_9042d18c()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	a_ents[#"boss"] = level.var_75a7d6.mdl_body;
	level.var_75a7d6.var_d7f18c34 scene::play(#"hash_5ffc9256a4340dcb", "frost_intro", a_ents);
	level.var_75a7d6.var_d7f18c34 thread scene::play(#"hash_5ffc9256a4340dcb", "frost_loop", a_ents);
}

/*
	Name: function_6c54dff5
	Namespace: namespace_95c839d1
	Checksum: 0xFC2647B6
	Offset: 0xC390
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_6c54dff5()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	a_ents[#"boss"] = level.var_75a7d6.mdl_body;
	level.var_75a7d6.var_d7f18c34 scene::play(#"hash_5ffc9256a4340dcb", "frost_outro", a_ents);
	level thread function_a3a141fe();
}

/*
	Name: function_9df1d3c8
	Namespace: namespace_95c839d1
	Checksum: 0xFB099DCB
	Offset: 0xC460
	Size: 0x314
	Parameters: 1
	Flags: None
*/
function function_9df1d3c8(s_spawn)
{
	if(!isstruct(s_spawn))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	var_4e1bd1ba = util::spawn_model(#"tag_origin", s_spawn.origin, s_spawn.angles);
	var_4e1bd1ba endon(#"death");
	if(!isdefined(level.var_75a7d6.var_1aa34baf))
	{
		level.var_75a7d6.var_1aa34baf = [];
	}
	else if(!isarray(level.var_75a7d6.var_1aa34baf))
	{
		level.var_75a7d6.var_1aa34baf = array(level.var_75a7d6.var_1aa34baf);
	}
	level.var_75a7d6.var_1aa34baf[level.var_75a7d6.var_1aa34baf.size] = var_4e1bd1ba;
	var_4e1bd1ba flag::set(#"hash_2a8f13a829d42a07");
	var_4e1bd1ba clientfield::set("" + #"hash_1875c2a7206c5167", 1);
	s_spawn waittilltimeout(10, #"activate");
	var_4e1bd1ba flag::set(#"hash_6b60ff3b039d7e7e");
	s_dest = struct::get(s_spawn.target);
	var_4e1bd1ba moveto(s_dest.origin, 10);
	var_4e1bd1ba waittill(#"movedone");
	var_4e1bd1ba clientfield::set("" + #"hash_1875c2a7206c5167", 0);
	var_4e1bd1ba flag::clear(#"hash_2a8f13a829d42a07");
	var_4e1bd1ba flag::clear(#"hash_6b60ff3b039d7e7e");
	wait(1);
	arrayremovevalue(level.var_75a7d6.var_1aa34baf, var_4e1bd1ba);
	var_4e1bd1ba delete();
}

/*
	Name: function_e788990d
	Namespace: namespace_95c839d1
	Checksum: 0xE517D76F
	Offset: 0xC780
	Size: 0x238
	Parameters: 0
	Flags: None
*/
function function_e788990d()
{
	if(isarray(level.var_75a7d6.var_1aa34baf))
	{
		var_1aa34baf = arraycopy(level.var_75a7d6.var_1aa34baf);
		level.var_75a7d6.var_1aa34baf = [];
		foreach(var_4e1bd1ba in var_1aa34baf)
		{
			if(isdefined(var_4e1bd1ba))
			{
				var_4e1bd1ba flag::clear(#"hash_2a8f13a829d42a07");
				var_4e1bd1ba flag::clear(#"hash_6b60ff3b039d7e7e");
				var_4e1bd1ba clientfield::set("" + #"hash_1875c2a7206c5167", 0);
				var_4e1bd1ba thread util::delayed_delete(1);
			}
		}
	}
	foreach(e_player in getplayers())
	{
		e_player clientfield::set_to_player("" + #"hash_159dc2bca63111fc", 0);
		e_player val::reset_all(#"hash_1875c2a7206c5167");
	}
}

/*
	Name: function_775a15ec
	Namespace: namespace_95c839d1
	Checksum: 0xFD3DA64E
	Offset: 0xC9C0
	Size: 0x3AE
	Parameters: 0
	Flags: None
*/
function function_775a15ec()
{
	self notify("52a221870a338a7b");
	self endon("52a221870a338a7b");
	self endon(#"death");
	self clientfield::set_to_player("" + #"hash_159dc2bca63111fc", 0);
	self val::reset_all(#"hash_1875c2a7206c5167");
	var_855b4886 = 0;
	var_61c960ef = 0;
	while(true)
	{
		var_17f4a48e = 0;
		var_67c43623 = 0;
		foreach(var_4e1bd1ba in level.var_75a7d6.var_1aa34baf)
		{
			if(isdefined(var_4e1bd1ba) && var_4e1bd1ba flag::get_any([1:#"hash_6b60ff3b039d7e7e", 0:#"hash_2a8f13a829d42a07"]))
			{
				n_dist = distancesquared(self.origin, var_4e1bd1ba.origin);
				if(var_4e1bd1ba flag::get(#"hash_2a8f13a829d42a07") && !var_17f4a48e && n_dist <= sqr(250))
				{
					var_17f4a48e = 1;
				}
				if(var_4e1bd1ba flag::get(#"hash_6b60ff3b039d7e7e") && !var_67c43623 && n_dist <= sqr(250))
				{
					var_67c43623 = 1;
				}
				if(var_17f4a48e && var_67c43623)
				{
					break;
				}
			}
		}
		if(var_17f4a48e)
		{
			if(!var_855b4886)
			{
				var_855b4886 = 1;
				self clientfield::set_to_player("" + #"hash_159dc2bca63111fc", 1);
			}
		}
		else if(var_855b4886)
		{
			var_855b4886 = 0;
			self clientfield::set_to_player("" + #"hash_159dc2bca63111fc", 0);
		}
		if(var_67c43623)
		{
			if(!var_61c960ef)
			{
				var_61c960ef = 1;
				self val::set(#"hash_1875c2a7206c5167", "allow_sprint", 0);
				self val::set(#"hash_1875c2a7206c5167", "move_speed_scale", 0.5);
			}
		}
		else if(var_61c960ef)
		{
			var_61c960ef = 0;
			self val::reset_all(#"hash_1875c2a7206c5167");
		}
		waitframe(1);
	}
}

/*
	Name: function_da1d0aae
	Namespace: namespace_95c839d1
	Checksum: 0xCECB59D7
	Offset: 0xCD78
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_da1d0aae(s_params)
{
	self clientfield::set_to_player("" + #"hash_159dc2bca63111fc", 0);
	self val::reset_all(#"hash_1875c2a7206c5167");
}

/*
	Name: function_a6da15be
	Namespace: namespace_95c839d1
	Checksum: 0x783CE6CD
	Offset: 0xCDD8
	Size: 0x1EC
	Parameters: 1
	Flags: None
*/
function function_a6da15be(b_play_vo)
{
	if(!isdefined(b_play_vo))
	{
		b_play_vo = 1;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	var_f81a99e5 = level.var_75a7d6.var_97f69bd4[0];
	level thread function_3ac42e92();
	if(b_play_vo)
	{
		var_591caa3e = {#n_time:30, #str_id:#"boss_attack"};
		if(!level.var_75a7d6 flag::get(#"hash_312af0ec2a927f58"))
		{
			level.var_75a7d6 flag::set(#"hash_312af0ec2a927f58");
			var_591caa3e = undefined;
		}
		level thread function_f83c329c(#"mine", 1, 0.5, var_591caa3e);
	}
	wait(3);
	var_eb3b90d = struct::get_array(var_f81a99e5.target);
	var_eb3b90d = array::randomize(var_eb3b90d);
	level thread function_30d13387(var_eb3b90d);
	wait(10);
	level thread function_4346157c(#"mine");
}

/*
	Name: function_3ac42e92
	Namespace: namespace_95c839d1
	Checksum: 0xCA4D23B5
	Offset: 0xCFD0
	Size: 0x13C
	Parameters: 0
	Flags: None
*/
function function_3ac42e92()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	a_ents[#"boss"] = level.var_75a7d6.mdl_body;
	level.var_75a7d6.var_d7f18c34 scene::play(#"hash_5ffc9256a4340dcb", "mine_intro", a_ents);
	level.var_75a7d6.var_d7f18c34 thread scene::play(#"hash_5ffc9256a4340dcb", "mine_loop", a_ents);
	wait(1);
	level.var_75a7d6.var_d7f18c34 scene::play(#"hash_5ffc9256a4340dcb", "mine_outro", a_ents);
	level thread function_a3a141fe();
}

/*
	Name: function_30d13387
	Namespace: namespace_95c839d1
	Checksum: 0xB96A8BD3
	Offset: 0xD118
	Size: 0x1B8
	Parameters: 1
	Flags: None
*/
function function_30d13387(var_eb3b90d)
{
	if(!isarray(var_eb3b90d))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	foreach(s_spawn in var_eb3b90d)
	{
		b_safe = 1;
		foreach(e_player in function_a1ef346b(undefined, s_spawn.origin, 500))
		{
			if(zm_utility::is_player_valid(e_player))
			{
				b_safe = 0;
				break;
			}
		}
		if(b_safe)
		{
			level thread function_15e00116(s_spawn);
			wait(0.2);
		}
	}
}

/*
	Name: function_15e00116
	Namespace: namespace_95c839d1
	Checksum: 0xE7110C98
	Offset: 0xD2D8
	Size: 0x598
	Parameters: 1
	Flags: None
*/
function function_15e00116(s_spawn)
{
	if(!isstruct(s_spawn))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	var_8c50f796 = util::spawn_model(#"tag_origin", s_spawn.origin, s_spawn.angles);
	var_8c50f796 endon(#"death");
	if(!isdefined(level.var_75a7d6.var_4b6d9c4a))
	{
		level.var_75a7d6.var_4b6d9c4a = [];
	}
	else if(!isarray(level.var_75a7d6.var_4b6d9c4a))
	{
		level.var_75a7d6.var_4b6d9c4a = array(level.var_75a7d6.var_4b6d9c4a);
	}
	level.var_75a7d6.var_4b6d9c4a[level.var_75a7d6.var_4b6d9c4a.size] = var_8c50f796;
	while(true)
	{
		var_8c50f796.var_7e2d3fc6 = spawncollision(#"hash_54ae3ca6346eae5f", "", var_8c50f796.origin + vectorscale((0, 0, 1), 130), var_8c50f796.angles);
		if(isdefined(var_8c50f796.var_7e2d3fc6))
		{
			break;
		}
		waitframe(1);
	}
	var_8c50f796.var_7e2d3fc6 setteam(level.zombie_team);
	var_8c50f796.var_7e2d3fc6 linkto(var_8c50f796);
	var_8c50f796 clientfield::set("" + #"hash_5c06c72dd28da75a", 1);
	level thread function_91fec1bb(var_8c50f796);
	level thread function_dfcf55a9(var_8c50f796);
	level thread function_edcb998b(var_8c50f796);
	level thread function_963a5888(var_8c50f796);
	if(isdefined(s_spawn.target))
	{
		s_target = struct::get(s_spawn.target);
		n_move_time = distance(s_spawn.origin, s_target.origin) / 170;
		if(n_move_time <= 0)
		{
			return;
		}
		s_dest = s_target;
		while(true)
		{
			var_8c50f796 moveto(s_dest.origin, n_move_time);
			var_8c50f796 waittill(#"movedone");
			if(s_dest == s_target)
			{
				s_dest = s_spawn;
			}
			else
			{
				s_dest = s_target;
			}
		}
	}
	else
	{
		while(true)
		{
			a_e_players = [];
			foreach(e_player in function_a1ef346b())
			{
				if(zm_utility::is_player_valid(e_player))
				{
					if(!isdefined(a_e_players))
					{
						a_e_players = [];
					}
					else if(!isarray(a_e_players))
					{
						a_e_players = array(a_e_players);
					}
					a_e_players[a_e_players.size] = e_player;
				}
			}
			if(isarray(a_e_players) && a_e_players.size > 0)
			{
				e_closest = arraygetclosest(var_8c50f796.origin, a_e_players);
				var_947b4032 = e_closest.origin;
				if(isvec(var_947b4032))
				{
					n_move_time = distance(var_8c50f796.origin, var_947b4032) / 170;
					v_dest = var_947b4032;
					if(n_move_time <= 0)
					{
						v_dest = var_8c50f796.origin;
						n_move_time = 0.1;
					}
					var_8c50f796 moveto(v_dest, n_move_time);
				}
			}
			wait(0.1);
		}
	}
}

/*
	Name: function_91fec1bb
	Namespace: namespace_95c839d1
	Checksum: 0xB2C853CC
	Offset: 0xD878
	Size: 0x39C
	Parameters: 1
	Flags: None
*/
function function_91fec1bb(var_8c50f796)
{
	var_7e2d3fc6 = var_8c50f796.var_7e2d3fc6;
	if(!isdefined(var_7e2d3fc6))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	var_8c50f796 endon(#"death", #"deactivate");
	var_7e2d3fc6 endon(#"death");
	var_7e2d3fc6 val::set(#"energy_mine", "allowdeath", 0);
	var_7e2d3fc6 val::set(#"energy_mine", "takedamage", 1);
	var_7e2d3fc6.health = 1;
	n_health = function_5f36e356(10000, 20000);
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = var_7e2d3fc6 waittill(#"damage");
		e_attacker = var_be17187b.attacker;
		if(isplayer(e_attacker))
		{
			damage = var_be17187b.amount;
			weapon = var_be17187b.weapon;
			inflictor = var_be17187b.inflictor;
			flags = var_be17187b.flags;
			meansofdeath = var_be17187b.mod;
			var_fd90b0bb = var_be17187b.var_fd90b0bb;
			vpoint = var_be17187b.position;
			vdir = var_be17187b.direction;
			shitloc = var_be17187b.shitloc;
			psoffsettime = var_be17187b.psoffsettime;
			boneindex = var_be17187b.boneindex;
			surfacetype = var_be17187b.surfacetype;
			damage = var_7e2d3fc6 get_weapon_damage(inflictor, e_attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
			if(!zm_weapons::is_wonder_weapon(weapon))
			{
				n_damage_cap = function_51846e52(meansofdeath, weapon);
				if(isdefined(n_damage_cap) && damage > n_damage_cap)
				{
					damage = n_damage_cap;
				}
			}
			n_health = n_health - damage;
			var_51de3a6c = n_health <= 0;
			e_attacker thread damagefeedback::update(meansofdeath, e_attacker, undefined, weapon, var_7e2d3fc6, psoffsettime, shitloc, var_51de3a6c, flags, 0);
			level thread hud::function_c9800094(e_attacker, vpoint, damage, 1);
			if(var_51de3a6c)
			{
				break;
			}
		}
	}
	level thread function_31a8910(var_8c50f796, 0);
}

/*
	Name: function_dfcf55a9
	Namespace: namespace_95c839d1
	Checksum: 0xE019ECA2
	Offset: 0xDC20
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_dfcf55a9(var_8c50f796)
{
	if(!isdefined(var_8c50f796))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	var_8c50f796 endon(#"death", #"deactivate");
	wait(10);
	level thread function_31a8910(var_8c50f796);
}

/*
	Name: function_edcb998b
	Namespace: namespace_95c839d1
	Checksum: 0x4531F811
	Offset: 0xDCC8
	Size: 0x142
	Parameters: 1
	Flags: None
*/
function function_edcb998b(var_8c50f796)
{
	if(!isdefined(var_8c50f796))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	var_8c50f796 endon(#"death", #"deactivate");
	while(true)
	{
		foreach(e_player in function_a1ef346b(undefined, var_8c50f796.origin, 64))
		{
			if(zm_utility::is_player_valid(e_player))
			{
				level thread function_31a8910(var_8c50f796);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_31a8910
	Namespace: namespace_95c839d1
	Checksum: 0x4113D3C9
	Offset: 0xDE18
	Size: 0x26C
	Parameters: 2
	Flags: None
*/
function function_31a8910(var_8c50f796, b_do_damage)
{
	if(!isdefined(b_do_damage))
	{
		b_do_damage = 1;
	}
	if(!isdefined(var_8c50f796))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	var_8c50f796 endon(#"death");
	var_8c50f796 notify(#"deactivate");
	if(isdefined(var_8c50f796.var_7e2d3fc6))
	{
		var_8c50f796.var_7e2d3fc6 deletedelay();
	}
	playfx(#"hash_3c469c72db197b13", var_8c50f796.origin, anglestoforward(var_8c50f796.angles), anglestoup(var_8c50f796.angles));
	var_8c50f796 clientfield::set("" + #"hash_5c06c72dd28da75a", 0);
	if(b_do_damage)
	{
		playrumbleonposition(#"hash_35da66e38e176e1f", var_8c50f796.origin);
		foreach(e_player in function_a1ef346b(undefined, var_8c50f796.origin, 250))
		{
			if(zm_utility::is_player_valid(e_player))
			{
				e_player dodamage(200, var_8c50f796.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
			}
		}
	}
	wait(1);
	var_8c50f796 delete();
}

/*
	Name: function_963a5888
	Namespace: namespace_95c839d1
	Checksum: 0x26BE29C6
	Offset: 0xE090
	Size: 0x1BA
	Parameters: 1
	Flags: None
*/
function function_963a5888(var_8c50f796)
{
	if(!isdefined(var_8c50f796))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	var_8c50f796 endon(#"death", #"deactivate");
	while(true)
	{
		foreach(e_player in function_a1ef346b(undefined, var_8c50f796.origin, 250))
		{
			if(zm_utility::is_player_valid(e_player) && !e_player flag::get(#"hash_6dd3b2d364bd2677"))
			{
				e_player dodamage(25, var_8c50f796.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
				e_player flag::set(#"hash_6dd3b2d364bd2677");
				level thread function_7c38a1c4(e_player);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_7c38a1c4
	Namespace: namespace_95c839d1
	Checksum: 0xA30E01E0
	Offset: 0xE258
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_7c38a1c4(e_player)
{
	wait(0.5);
	if(isdefined(e_player))
	{
		e_player flag::clear(#"hash_6dd3b2d364bd2677");
	}
}

/*
	Name: function_b17579
	Namespace: namespace_95c839d1
	Checksum: 0x2F5AF788
	Offset: 0xE2A0
	Size: 0x140
	Parameters: 0
	Flags: None
*/
function function_b17579()
{
	var_4b6d9c4a = arraycopy(level.var_75a7d6.var_4b6d9c4a);
	level.var_75a7d6.var_4b6d9c4a = [];
	foreach(var_8c50f796 in var_4b6d9c4a)
	{
		if(isdefined(var_8c50f796))
		{
			var_8c50f796 notify(#"deactivate");
			if(isdefined(var_8c50f796.var_7e2d3fc6))
			{
				var_8c50f796.var_7e2d3fc6 deletedelay();
			}
			var_8c50f796 clientfield::set("" + #"hash_5c06c72dd28da75a", 0);
			var_8c50f796 thread util::delayed_delete(1);
		}
	}
}

/*
	Name: function_f68fc7a0
	Namespace: namespace_95c839d1
	Checksum: 0x2A13C9F7
	Offset: 0xE3E8
	Size: 0x2DC
	Parameters: 2
	Flags: None
*/
function function_f68fc7a0(e_target, b_play_vo)
{
	if(!isdefined(b_play_vo))
	{
		b_play_vo = 1;
	}
	if(!isdefined(e_target))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	level.var_75a7d6 flag::clear(#"hash_30c93e279eb03e9c");
	level thread function_a25101c(e_target);
	if(b_play_vo)
	{
		var_591caa3e = {#n_time:30, #str_id:#"boss_attack"};
		if(!level.var_75a7d6 flag::get(#"hash_731fdd93c792799c"))
		{
			level.var_75a7d6 flag::set(#"hash_731fdd93c792799c");
			var_591caa3e = undefined;
		}
		level thread function_f83c329c(#"eyes", 1, 0.5, var_591caa3e);
	}
	a_ents[#"boss"] = level.var_75a7d6.mdl_body;
	level.var_75a7d6.var_d7f18c34 scene::play(#"hash_5ffc9256a4340dcb", "beam_intro", a_ents);
	level.var_75a7d6.var_d7f18c34 thread scene::play(#"hash_5ffc9256a4340dcb", "beam_loop", a_ents);
	level.var_75a7d6 flag::set(#"hash_30c93e279eb03e9c");
	wait(5);
	level thread function_b852652a();
	level.var_75a7d6.var_d7f18c34 scene::play(#"hash_5ffc9256a4340dcb", "beam_outro", a_ents);
	level thread function_a3a141fe();
	level thread function_4346157c(#"eyes");
}

/*
	Name: function_8407e36d
	Namespace: namespace_95c839d1
	Checksum: 0x3C9FCCC5
	Offset: 0xE6D0
	Size: 0x400
	Parameters: 0
	Flags: None
*/
function function_8407e36d()
{
	a_e_players = [];
	foreach(e_player in function_a1ef346b())
	{
		if(zm_utility::is_player_valid(e_player))
		{
			if(!isdefined(a_e_players))
			{
				a_e_players = [];
			}
			else if(!isarray(a_e_players))
			{
				a_e_players = array(a_e_players);
			}
			a_e_players[a_e_players.size] = e_player;
		}
	}
	n_players = a_e_players.size;
	if(n_players > 0)
	{
		if(n_players <= 1)
		{
			e_target = a_e_players[0];
		}
		else
		{
			e_target = undefined;
			var_ab7bc2c6 = 0;
			foreach(var_bb8c6cc9 in a_e_players)
			{
				if(distance2dsquared(level.var_75a7d6.var_d7f18c34.origin, var_bb8c6cc9.origin) >= sqr(1024) && level.var_75a7d6.var_d7f18c34 math::get_dot_forward(var_bb8c6cc9.origin, 1) >= 0.6)
				{
					var_b500b370 = [];
					foreach(e_player in function_a1ef346b(undefined, var_bb8c6cc9.origin, 250))
					{
						if(zm_utility::is_player_valid(e_player))
						{
							if(!isdefined(var_b500b370))
							{
								var_b500b370 = [];
							}
							else if(!isarray(var_b500b370))
							{
								var_b500b370 = array(var_b500b370);
							}
							var_b500b370[var_b500b370.size] = e_player;
						}
					}
					arrayremovevalue(var_b500b370, var_bb8c6cc9);
					if(var_b500b370.size > var_ab7bc2c6)
					{
						var_ab7bc2c6 = var_b500b370.size;
						e_target = var_bb8c6cc9;
					}
				}
			}
		}
		if(isdefined(e_target) && distance2dsquared(level.var_75a7d6.var_d7f18c34.origin, e_target.origin) >= sqr(1024) && level.var_75a7d6.var_d7f18c34 math::get_dot_forward(e_target.origin, 1) >= 0.6)
		{
			return e_target;
		}
	}
}

/*
	Name: function_a25101c
	Namespace: namespace_95c839d1
	Checksum: 0x262E640
	Offset: 0xEAD8
	Size: 0x590
	Parameters: 1
	Flags: None
*/
function function_a25101c(e_target)
{
	var_faf3b547 = e_target.origin;
	if(!isvec(var_faf3b547))
	{
		return;
	}
	var_faf3b547 = getclosestpointonnavmesh(var_faf3b547, 1024);
	if(!isvec(var_faf3b547))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed", #"hash_308e76fae63e354c");
	var_f36dbf1b = util::spawn_model(#"tag_origin", var_faf3b547);
	if(!isdefined(level.var_75a7d6.var_df953d57))
	{
		level.var_75a7d6.var_df953d57 = [];
	}
	else if(!isarray(level.var_75a7d6.var_df953d57))
	{
		level.var_75a7d6.var_df953d57 = array(level.var_75a7d6.var_df953d57);
	}
	level.var_75a7d6.var_df953d57[level.var_75a7d6.var_df953d57.size] = var_f36dbf1b;
	v_spacing = (anglestoright(vectortoangles(var_faf3b547 - level.var_75a7d6.mdl_body gettagorigin("j_head")))) * 32;
	var_b63f9f4f = util::spawn_model(#"tag_origin", var_faf3b547 - v_spacing);
	if(!isdefined(level.var_75a7d6.var_df953d57))
	{
		level.var_75a7d6.var_df953d57 = [];
	}
	else if(!isarray(level.var_75a7d6.var_df953d57))
	{
		level.var_75a7d6.var_df953d57 = array(level.var_75a7d6.var_df953d57);
	}
	level.var_75a7d6.var_df953d57[level.var_75a7d6.var_df953d57.size] = var_b63f9f4f;
	var_586de175 = util::spawn_model(#"tag_origin", var_faf3b547 + v_spacing);
	if(!isdefined(level.var_75a7d6.var_df953d57))
	{
		level.var_75a7d6.var_df953d57 = [];
	}
	else if(!isarray(level.var_75a7d6.var_df953d57))
	{
		level.var_75a7d6.var_df953d57 = array(level.var_75a7d6.var_df953d57);
	}
	level.var_75a7d6.var_df953d57[level.var_75a7d6.var_df953d57.size] = var_586de175;
	level thread function_260cd6e6(var_b63f9f4f, var_586de175);
	while(true)
	{
		if(isvec(e_target.origin))
		{
			v_navmesh = getclosestpointonnavmesh(e_target.origin, 1024);
			if(isvec(v_navmesh) && distance2dsquared(level.var_75a7d6.var_d7f18c34.origin, e_target.origin) >= sqr(1024) && level.var_75a7d6.var_d7f18c34 math::get_dot_forward(v_navmesh, 1) >= 0.6)
			{
				var_faf3b547 = v_navmesh;
			}
		}
		v_spacing = (anglestoright(vectortoangles(var_faf3b547 - level.var_75a7d6.mdl_body gettagorigin("j_head")))) * 32;
		var_f36dbf1b moveto(var_faf3b547, 1);
		var_b63f9f4f moveto(var_faf3b547 - v_spacing, 1);
		var_586de175 moveto(var_faf3b547 + v_spacing, 1);
		wait(0.2);
	}
}

/*
	Name: function_260cd6e6
	Namespace: namespace_95c839d1
	Checksum: 0x6D05701F
	Offset: 0xF070
	Size: 0x598
	Parameters: 2
	Flags: None
*/
function function_260cd6e6(var_b63f9f4f, var_586de175)
{
	if(!(isdefined(var_b63f9f4f) && isdefined(var_586de175)))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed", #"hash_308e76fae63e354c");
	var_b63f9f4f endon(#"death");
	var_586de175 endon(#"death");
	level.var_75a7d6.var_97a7fa13 = util::spawn_model(#"tag_origin", var_b63f9f4f.origin);
	level.var_75a7d6.var_97a7fa13 endon(#"death");
	level thread function_fc7c8eaf(#"left", level.var_75a7d6.var_97a7fa13);
	level thread function_7123b990(level.var_75a7d6.var_97a7fa13);
	level.var_75a7d6.var_30d513af = util::spawn_model(#"tag_origin", var_586de175.origin);
	level.var_75a7d6.var_30d513af endon(#"death");
	level thread function_fc7c8eaf(#"right", level.var_75a7d6.var_30d513af);
	var_97a7fa13 = level.var_75a7d6.var_97a7fa13;
	var_30d513af = level.var_75a7d6.var_30d513af;
	var_97a7fa13.origin = var_b63f9f4f.origin;
	var_30d513af.origin = var_586de175.origin;
	while(true)
	{
		var_d6701dd5 = var_b63f9f4f.origin;
		var_91d0f678 = var_586de175.origin;
		var_fcf361b6 = bullettrace(level.var_75a7d6.mdl_body gettagorigin("tag_eye_fx_le"), var_d6701dd5, 0, undefined);
		var_33849f98 = bullettrace(level.var_75a7d6.mdl_body gettagorigin("tag_eye_fx_ri"), var_91d0f678, 0, undefined);
		var_5e5262ae = var_fcf361b6[#"entity"];
		var_b3317ca3 = var_33849f98[#"entity"];
		var_eb864879 = 0;
		if(var_5e5262ae === level.var_75a7d6.var_a17b2556 || var_b3317ca3 === level.var_75a7d6.var_a17b2556)
		{
			var_35b0ea35 = var_fcf361b6[#"position"];
			var_17ac2be8 = var_33849f98[#"position"];
			if(var_5e5262ae !== level.var_75a7d6.var_a17b2556)
			{
				var_35b0ea35 = var_17ac2be8;
			}
			if(var_b3317ca3 !== level.var_75a7d6.var_a17b2556)
			{
				var_17ac2be8 = var_35b0ea35;
			}
			if(isvec(var_35b0ea35) && isvec(var_17ac2be8))
			{
				var_eb864879 = 1;
				var_d6701dd5 = var_35b0ea35;
				var_91d0f678 = var_17ac2be8;
			}
		}
		if(!var_eb864879)
		{
			var_bb4f4d61 = getclosestpointonnavmesh(var_d6701dd5, 1024);
			var_cf4fdcae = getclosestpointonnavmesh(var_91d0f678, 1024);
			if(!isvec(var_bb4f4d61))
			{
				var_bb4f4d61 = var_cf4fdcae;
			}
			if(!isvec(var_cf4fdcae))
			{
				var_cf4fdcae = var_bb4f4d61;
			}
			if(isvec(var_bb4f4d61) && isvec(var_cf4fdcae))
			{
				var_d6701dd5 = var_bb4f4d61;
				var_91d0f678 = var_cf4fdcae;
			}
		}
		var_97a7fa13 moveto(var_d6701dd5, 0.05);
		var_30d513af moveto(var_91d0f678, 0.05);
		var_97a7fa13 waittill(#"movedone");
	}
}

/*
	Name: function_fc7c8eaf
	Namespace: namespace_95c839d1
	Checksum: 0x996F9772
	Offset: 0xF610
	Size: 0x114
	Parameters: 2
	Flags: None
*/
function function_fc7c8eaf(str_side, var_8999a4bf)
{
	if(!(isdefined(str_side) && isdefined(var_8999a4bf)))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed", #"hash_308e76fae63e354c");
	var_8999a4bf endon(#"death");
	level.var_75a7d6 flag::wait_till(#"hash_30c93e279eb03e9c");
	n_cf = 1;
	if(str_side === #"right")
	{
		n_cf = 2;
	}
	var_8999a4bf clientfield::set("" + #"hash_665a7e18e3f5f896", n_cf);
}

/*
	Name: function_7123b990
	Namespace: namespace_95c839d1
	Checksum: 0x89D0D940
	Offset: 0xF730
	Size: 0x21A
	Parameters: 1
	Flags: None
*/
function function_7123b990(var_8999a4bf)
{
	if(!isdefined(var_8999a4bf))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed", #"hash_308e76fae63e354c");
	var_8999a4bf endon(#"death");
	level.var_75a7d6 flag::wait_till(#"hash_30c93e279eb03e9c");
	while(true)
	{
		foreach(e_player in function_a1ef346b(undefined, var_8999a4bf.origin, 150))
		{
			if(zm_utility::is_player_valid(e_player) && !e_player flag::get(#"hash_6fc6431ba8b80ea9"))
			{
				if(bullettracepassed(var_8999a4bf.origin, e_player.origin + vectorscale((0, 0, 1), 16), 0, e_player))
				{
					e_player dodamage(25, var_8999a4bf.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
					e_player flag::set(#"hash_6fc6431ba8b80ea9");
					level thread function_94a67382(e_player);
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_94a67382
	Namespace: namespace_95c839d1
	Checksum: 0xB0141161
	Offset: 0xF958
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_94a67382(e_player)
{
	wait(0.25);
	if(isdefined(e_player))
	{
		e_player flag::clear(#"hash_6fc6431ba8b80ea9");
	}
}

/*
	Name: function_b852652a
	Namespace: namespace_95c839d1
	Checksum: 0x51F66AD4
	Offset: 0xF9A0
	Size: 0x222
	Parameters: 0
	Flags: None
*/
function function_b852652a()
{
	level.var_75a7d6 notify(#"hash_308e76fae63e354c");
	level.var_75a7d6 flag::clear(#"hash_30c93e279eb03e9c");
	if(isdefined(level.var_75a7d6.var_97a7fa13))
	{
		level.var_75a7d6.var_97a7fa13 clientfield::set("" + #"hash_665a7e18e3f5f896", 0);
		level.var_75a7d6.var_97a7fa13 thread util::delayed_delete(1);
		level.var_75a7d6.var_97a7fa13 = undefined;
	}
	if(isdefined(level.var_75a7d6.var_30d513af))
	{
		level.var_75a7d6.var_30d513af clientfield::set("" + #"hash_665a7e18e3f5f896", 0);
		level.var_75a7d6.var_30d513af thread util::delayed_delete(1);
		level.var_75a7d6.var_30d513af = undefined;
	}
	if(isarray(level.var_75a7d6.var_df953d57))
	{
		foreach(var_121fd991 in level.var_75a7d6.var_df953d57)
		{
			if(isdefined(var_121fd991))
			{
				var_121fd991 delete();
			}
		}
	}
	level.var_75a7d6.var_df953d57 = [];
}

/*
	Name: function_3d66224b
	Namespace: namespace_95c839d1
	Checksum: 0x1A5B3512
	Offset: 0xFBD0
	Size: 0x38
	Parameters: 1
	Flags: None
*/
function function_3d66224b(n_position)
{
	if(!isdefined(n_position))
	{
		n_position = 0;
	}
	return level.var_75a7d6.var_c20e460e.var_529d63dd[n_position];
}

/*
	Name: function_bb7202a2
	Namespace: namespace_95c839d1
	Checksum: 0x190B6416
	Offset: 0xFC10
	Size: 0x294
	Parameters: 0
	Flags: None
*/
function function_bb7202a2()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	var_135e3159 = function_3d66224b(0);
	level.var_75a7d6.var_c20e460e.var_135e3159 = var_135e3159;
	level.var_75a7d6.var_c20e460e.mdl_anchor = util::spawn_model(#"tag_origin", var_135e3159.origin, var_135e3159.angles);
	level.var_75a7d6.var_c20e460e.mdl_anchor setforcenocull();
	level.var_75a7d6.var_c20e460e.var_2644aca3 = util::spawn_model(#"hash_372a3e033a18dfed");
	level.var_75a7d6.var_c20e460e.var_2644aca3 setforcenocull();
	level.var_75a7d6.var_c20e460e.var_2644aca3 setteam(#"allies");
	level.var_75a7d6.var_c20e460e.var_2644aca3 clientfield::set("" + #"hash_9ef13a567692f32", 1);
	level.var_75a7d6.var_c20e460e.var_2644aca3 clientfield::set("" + #"hash_25155d60768d46e4", 1);
	function_9965670d();
	a_ents[#"maxis"] = level.var_75a7d6.var_c20e460e.var_2644aca3;
	level.var_75a7d6.var_c20e460e.mdl_anchor thread scene::play(#"hash_5b405bfccbbf2def", "charging_loop", a_ents);
}

/*
	Name: function_a4650866
	Namespace: namespace_95c839d1
	Checksum: 0x67E3DF4D
	Offset: 0xFEB0
	Size: 0x11E
	Parameters: 1
	Flags: None
*/
function function_a4650866(var_2644aca3)
{
	if(!level.var_75a7d6 flag::get(#"intermission"))
	{
		var_e9abcfcb = level.var_75a7d6.var_1f6f9128;
		if(isarray(var_e9abcfcb))
		{
			var_33353957 = 0;
			foreach(s_cannon in var_e9abcfcb)
			{
				if(s_cannon flag::get(#"charged"))
				{
					var_33353957 = 1;
					break;
				}
			}
			if(!var_33353957)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_2dc91d9f
	Namespace: namespace_95c839d1
	Checksum: 0x781F92A1
	Offset: 0xFFD8
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_2dc91d9f()
{
	level endon(#"end_game");
	level.var_75a7d6.var_c20e460e endon(#"stop_think");
	if(!level.var_75a7d6.var_c20e460e flag::get(#"hash_382481ac36f5fbaa"))
	{
		var_135e3159 = level.var_75a7d6.var_c20e460e.var_529d63dd[3];
		if(isstruct(var_135e3159))
		{
			function_91b8984b(var_135e3159.origin, var_135e3159.angles, var_135e3159);
			if(!level.var_75a7d6.var_c20e460e flag::get(#"hash_382481ac36f5fbaa"))
			{
				level thread function_cdc05f45();
			}
		}
	}
}

/*
	Name: function_cdc05f45
	Namespace: namespace_95c839d1
	Checksum: 0x4DF01AF9
	Offset: 0x10100
	Size: 0x1E0
	Parameters: 2
	Flags: None
*/
function function_cdc05f45(var_973c5c71, var_bad95e69)
{
	if(!isdefined(var_973c5c71))
	{
		var_973c5c71 = 0;
	}
	if(!isdefined(var_bad95e69))
	{
		var_bad95e69 = 1;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	level.var_75a7d6.var_c20e460e endon(#"stop_think");
	if(level.var_75a7d6 flag::get(#"defeated"))
	{
		return;
	}
	while(true)
	{
		if(var_973c5c71)
		{
			var_973c5c71 = 0;
		}
		else
		{
			wait(60);
			if(!level.var_75a7d6 flag::get(#"intermission"))
			{
				level thread function_f83c329c(#"hash_7a617db243a2fb6f", 0, 0.5, {#n_time:5, #str_id:#"hash_711ebafa8fd9f78b"});
			}
		}
		var_135e3159 = function_83ffaa02();
		if(!function_8a1f5c87(var_135e3159.origin))
		{
			function_7c6aaab3(1, 0);
		}
		function_91b8984b(var_135e3159.origin, var_135e3159.angles, var_135e3159, undefined, undefined, var_bad95e69);
		var_bad95e69 = 1;
	}
}

/*
	Name: function_8a1f5c87
	Namespace: namespace_95c839d1
	Checksum: 0xDC3DAFCD
	Offset: 0x102E8
	Size: 0xD0
	Parameters: 1
	Flags: None
*/
function function_8a1f5c87(v_dest)
{
	v_start = level.var_75a7d6.var_c20e460e.var_2644aca3.origin;
	if(!isvec(v_start) || !isvec(v_dest))
	{
		return 0;
	}
	a_trace = bullettrace(v_start, v_dest, 0, level.var_75a7d6.var_c20e460e.var_2644aca3);
	return a_trace[#"entity"] !== level.var_75a7d6.var_a17b2556;
}

/*
	Name: function_7c6aaab3
	Namespace: namespace_95c839d1
	Checksum: 0xCB318E6A
	Offset: 0x103C0
	Size: 0x114
	Parameters: 2
	Flags: None
*/
function function_7c6aaab3(var_bad95e69, var_58a45754)
{
	if(!isdefined(var_bad95e69))
	{
		var_bad95e69 = 1;
	}
	if(!isdefined(var_58a45754))
	{
		var_58a45754 = 0;
	}
	var_a06f7c57 = [1:level.var_75a7d6.var_c20e460e.var_529d63dd[4], 0:level.var_75a7d6.var_c20e460e.var_529d63dd[1]];
	s_safe = arraygetclosest(level.var_75a7d6.var_c20e460e.var_2644aca3.origin, var_a06f7c57);
	if(isstruct(s_safe))
	{
		function_91b8984b(s_safe.origin, s_safe.angles, undefined, undefined, 400, var_bad95e69, var_58a45754);
	}
}

/*
	Name: function_83ffaa02
	Namespace: namespace_95c839d1
	Checksum: 0x7B0BEC0A
	Offset: 0x104E0
	Size: 0x466
	Parameters: 0
	Flags: None
*/
function function_83ffaa02()
{
	if(level.var_75a7d6.var_c20e460e.var_6615b9fe.size <= 0)
	{
		level.var_75a7d6.var_c20e460e.var_6615b9fe = array::randomize(arraycopy(level.var_75a7d6.var_c20e460e.var_6615b9fe));
		arrayremovevalue(level.var_75a7d6.var_c20e460e.var_6615b9fe, level.var_75a7d6.var_c20e460e.var_135e3159);
	}
	foreach(var_135e3159 in level.var_75a7d6.var_c20e460e.var_6615b9fe)
	{
		if(var_135e3159 !== level.var_75a7d6.var_c20e460e.var_135e3159 && !var_135e3159 flag::get(#"disabled") && function_8a1f5c87(var_135e3159.origin))
		{
			arrayremovevalue(level.var_75a7d6.var_c20e460e.var_6615b9fe, var_135e3159);
			return var_135e3159;
		}
	}
	var_529d63dd = array::randomize(arraycopy(level.var_75a7d6.var_c20e460e.var_529d63dd));
	foreach(var_135e3159 in level.var_75a7d6.var_c20e460e.var_6615b9fe)
	{
		arrayremovevalue(var_529d63dd, var_135e3159);
	}
	foreach(var_135e3159 in var_529d63dd)
	{
		if(var_135e3159 !== level.var_75a7d6.var_c20e460e.var_135e3159 && !var_135e3159 flag::get(#"disabled") && function_8a1f5c87(var_135e3159.origin))
		{
			arrayremovevalue(level.var_75a7d6.var_c20e460e.var_6615b9fe, var_135e3159);
			return var_135e3159;
		}
	}
	foreach(var_135e3159 in var_529d63dd)
	{
		if(!var_135e3159 flag::get(#"disabled"))
		{
			arrayremovevalue(level.var_75a7d6.var_c20e460e.var_6615b9fe, var_135e3159);
			return var_135e3159;
		}
	}
}

/*
	Name: function_91b8984b
	Namespace: namespace_95c839d1
	Checksum: 0x57AFDDCD
	Offset: 0x10950
	Size: 0x5D4
	Parameters: 7
	Flags: None
*/
function function_91b8984b(v_dest, v_angles, var_135e3159, var_2dba142c, n_speed, var_bad95e69, var_58a45754)
{
	if(!isdefined(var_2dba142c))
	{
		var_2dba142c = 0;
	}
	if(!isdefined(n_speed))
	{
		n_speed = 300;
	}
	if(!isdefined(var_bad95e69))
	{
		var_bad95e69 = 1;
	}
	if(!isdefined(var_58a45754))
	{
		var_58a45754 = 1;
	}
	if(!isvec(v_dest) || !isvec(v_angles))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6.var_c20e460e notify(#"stop_moving");
	level.var_75a7d6.var_c20e460e endon(#"stop_moving");
	mdl_anchor = level.var_75a7d6.var_c20e460e.mdl_anchor;
	var_2644aca3 = level.var_75a7d6.var_c20e460e.var_2644aca3;
	a_ents[#"maxis"] = var_2644aca3;
	var_b2def274 = getanimlength(#"hash_7561312f18595cfa");
	var_9b0fc1bf = getanimlength(#"hash_e3ddb6bca42ba1f");
	var_90a7fa47 = level.var_75a7d6.var_c20e460e flag::get(#"moving");
	level.var_75a7d6.var_c20e460e flag::set(#"moving");
	if(!var_90a7fa47 && var_bad95e69)
	{
		mdl_anchor scene::play(#"hash_5b405bfccbbf2def", "charging_out", a_ents);
	}
	if(isstruct(var_135e3159))
	{
		level.var_75a7d6.var_c20e460e.var_135e3159 = var_135e3159;
	}
	mdl_anchor thread scene::play(#"hash_5b405bfccbbf2def", "move_in", a_ents);
	n_move_time = distance(mdl_anchor.origin, v_dest) / n_speed;
	var_f7607c14 = 0;
	if(n_move_time > 0)
	{
		if(n_move_time >= 1)
		{
			var_f7607c14 = 1;
		}
		var_50be58cf = 0.5;
		var_8789d7b1 = 0.5;
		if((var_50be58cf + var_8789d7b1) >= n_move_time)
		{
			var_50be58cf = 0;
			var_8789d7b1 = 0;
		}
	}
	var_e425c762 = v_angles;
	if(var_f7607c14)
	{
		var_e425c762 = vectortoangles(v_dest - mdl_anchor.origin);
	}
	mdl_anchor rotateto(var_e425c762, var_b2def274, 0.2, 0.2);
	mdl_anchor waittill(#"rotatedone");
	mdl_anchor flag::wait_till_clear(#"scene");
	if(n_move_time > 0)
	{
		var_818c24ea = n_move_time - var_9b0fc1bf;
		if(var_818c24ea > 0)
		{
			mdl_anchor thread scene::play(#"hash_5b405bfccbbf2def", "move_loop", a_ents);
		}
		mdl_anchor moveto(v_dest, n_move_time, var_50be58cf, var_8789d7b1);
		if(var_818c24ea > 0)
		{
			wait(var_818c24ea);
		}
	}
	mdl_anchor thread scene::play(#"hash_5b405bfccbbf2def", "move_out", a_ents);
	mdl_anchor rotateto(v_angles, var_9b0fc1bf, 0.2, 0.2);
	mdl_anchor waittill(#"rotatedone");
	mdl_anchor flag::wait_till_clear(#"scene");
	if(var_58a45754)
	{
		if(!var_2dba142c)
		{
			mdl_anchor scene::play(#"hash_5b405bfccbbf2def", "charging_in", a_ents);
			mdl_anchor thread scene::play(#"hash_5b405bfccbbf2def", "charging_loop", a_ents);
		}
		else
		{
			mdl_anchor thread scene::play(#"hash_5b405bfccbbf2def", "charged_loop", a_ents);
			wait(0.5);
		}
	}
	level.var_75a7d6.var_c20e460e flag::clear(#"moving");
}

/*
	Name: function_1f80b24d
	Namespace: namespace_95c839d1
	Checksum: 0x630B6E27
	Offset: 0x10F30
	Size: 0x296
	Parameters: 0
	Flags: None
*/
function function_1f80b24d()
{
	self notify("3a4449fa391ef473");
	self endon("3a4449fa391ef473");
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	self endon(#"death", #"hash_6c8affb0cdce9e5");
	self flag::clear(#"hash_5d6df1818897df5c");
	self flag::clear(#"hash_21fe92f29511661c");
	if(self.team !== level.zombie_team)
	{
		return;
	}
	while(true)
	{
		var_2644aca3 = level.var_75a7d6.var_c20e460e.var_2644aca3;
		if(level.var_75a7d6.var_c20e460e flag::get(#"hash_f6fa640d2850acd") && isdefined(var_2644aca3) && distance2dsquared(self.origin, var_2644aca3.origin) <= sqr(256))
		{
			self flag::clear(#"hash_21fe92f29511661c");
			if(!self flag::get(#"hash_5d6df1818897df5c"))
			{
				self flag::set(#"hash_5d6df1818897df5c");
				self clientfield::set("" + #"hash_30c23067d05386c1", 1);
			}
		}
		else if(self flag::get(#"hash_5d6df1818897df5c") && !self flag::get(#"hash_21fe92f29511661c"))
		{
			self flag::set(#"hash_21fe92f29511661c");
			level thread function_84d95ae(self);
		}
		waitframe(1);
	}
}

/*
	Name: function_84d95ae
	Namespace: namespace_95c839d1
	Checksum: 0xE0DB6029
	Offset: 0x111D0
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function function_84d95ae(ai_zombie)
{
	if(!isalive(ai_zombie))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	ai_zombie endon(#"death", #"hash_6c8affb0cdce9e5", #"hash_5d6df1818897df5c");
	wait(1);
	if(ai_zombie flag::get(#"hash_21fe92f29511661c"))
	{
		ai_zombie clientfield::set("" + #"hash_30c23067d05386c1", 0);
		ai_zombie flag::clear(#"hash_5d6df1818897df5c");
	}
}

/*
	Name: function_e543d649
	Namespace: namespace_95c839d1
	Checksum: 0x80AA1F20
	Offset: 0x112E8
	Size: 0x23C
	Parameters: 1
	Flags: None
*/
function function_e543d649(s_params)
{
	if(self.team !== level.zombie_team)
	{
		return;
	}
	self notify(#"hash_6c8affb0cdce9e5");
	self clientfield::set("" + #"hash_30c23067d05386c1", 0);
	if(isplayer(s_params.eattacker))
	{
		var_2644aca3 = level.var_75a7d6.var_c20e460e.var_2644aca3;
		if(!isdefined(var_2644aca3))
		{
			return;
		}
		if(self flag::get(#"hash_5d6df1818897df5c") && level.var_75a7d6.var_c20e460e.var_8a337eba < level.var_75a7d6.var_c20e460e.var_3887bcb7)
		{
			var_8a337eba = 1;
			if(self.var_6f84b820 === #"special")
			{
				var_8a337eba = 5;
			}
			else if(self.var_6f84b820 === #"elite")
			{
				var_8a337eba = 10;
			}
			level.var_75a7d6.var_c20e460e.var_8a337eba = int(min(level.var_75a7d6.var_c20e460e.var_3887bcb7, level.var_75a7d6.var_c20e460e.var_8a337eba + var_8a337eba));
			function_4ba59ffe();
			level thread function_1c6d2370();
			for(i = 0; i < var_8a337eba; i++)
			{
				level thread function_8c6bf36e(var_2644aca3, self);
				wait(0.2);
			}
		}
	}
}

/*
	Name: function_90051ca0
	Namespace: namespace_95c839d1
	Checksum: 0x7B857E1B
	Offset: 0x11530
	Size: 0x2DA
	Parameters: 0
	Flags: None
*/
function function_90051ca0()
{
	var_e9abcfcb = arraycopy(level.var_75a7d6.var_1f6f9128);
	arrayremovevalue(var_e9abcfcb, level.var_75a7d6.var_c20e460e.var_3b85c6cf);
	foreach(s_cannon in var_e9abcfcb)
	{
		if(!s_cannon flag::get(#"charged") && function_8a1f5c87(s_cannon.var_e35c2428.origin))
		{
			return s_cannon;
		}
	}
	if(isdefined(level.var_75a7d6.var_c20e460e.var_3b85c6cf) && !level.var_75a7d6.var_c20e460e.var_3b85c6cf flag::get(#"charged") && function_8a1f5c87(level.var_75a7d6.var_c20e460e.var_3b85c6cf.var_e35c2428.origin))
	{
		return level.var_75a7d6.var_c20e460e.var_3b85c6cf;
	}
	if(isdefined(level.var_75a7d6.var_c20e460e.var_3b85c6cf) && !level.var_75a7d6.var_c20e460e.var_3b85c6cf flag::get(#"charged"))
	{
		return level.var_75a7d6.var_c20e460e.var_3b85c6cf;
	}
	foreach(s_cannon in var_e9abcfcb)
	{
		if(!s_cannon flag::get(#"charged"))
		{
			return s_cannon;
		}
	}
	return undefined;
}

/*
	Name: function_1c6d2370
	Namespace: namespace_95c839d1
	Checksum: 0x2F1D226
	Offset: 0x11818
	Size: 0x57C
	Parameters: 0
	Flags: None
*/
function function_1c6d2370()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated");
	if(level.var_75a7d6 flag::get(#"defeated") || level.var_75a7d6.var_c20e460e flag::get(#"hash_382481ac36f5fbaa") || level.var_75a7d6.var_c20e460e.var_8a337eba < level.var_75a7d6.var_c20e460e.var_3887bcb7)
	{
		return;
	}
	level.var_75a7d6.var_c20e460e.var_2644aca3 clientfield::set("" + #"hash_9ef13a567692f32", 2);
	function_9a39a4c();
	s_cannon = function_90051ca0();
	if(!isstruct(s_cannon))
	{
		return;
	}
	var_e35c2428 = s_cannon.var_e35c2428;
	if(!isdefined(var_e35c2428))
	{
		return;
	}
	level.var_75a7d6.var_c20e460e.var_3b85c6cf = s_cannon;
	level.var_75a7d6.var_c20e460e flag::set(#"hash_382481ac36f5fbaa");
	level.var_75a7d6.var_c20e460e notify(#"stop_think");
	level.var_75a7d6.var_c20e460e notify(#"stop_moving");
	level thread function_35058c30();
	var_bad95e69 = 1;
	n_speed = undefined;
	if(!function_8a1f5c87(var_e35c2428.origin))
	{
		function_7c6aaab3(1, 0);
		var_bad95e69 = 0;
		n_speed = 400;
	}
	function_91b8984b(var_e35c2428.origin, var_e35c2428.angles, undefined, 1, n_speed, var_bad95e69);
	a_ents[#"maxis"] = level.var_75a7d6.var_2644aca3;
	level.var_75a7d6.var_c20e460e.mdl_anchor scene::play(#"hash_5b405bfccbbf2def", "cannon_in", a_ents);
	level.var_75a7d6.var_c20e460e.mdl_anchor thread scene::play(#"hash_5b405bfccbbf2def", "cannon_loop", a_ents);
	vh_turret = s_cannon.vh_turret;
	if(isdefined(vh_turret))
	{
		vh_turret clientfield::set("" + #"hash_469f6acd46f13b91", 1);
		vh_turret playsound(#"hash_6ab009ae4142d4ec");
	}
	wait(1);
	s_cannon flag::set(#"charged");
	level thread function_57858b58(s_cannon);
	level.var_75a7d6.var_c20e460e.var_2644aca3 clientfield::set("" + #"hash_9ef13a567692f32", 1);
	level.var_75a7d6.var_c20e460e.var_8a337eba = 0;
	function_4ba59ffe();
	level thread function_f83c329c(#"hash_3ae5c3c2322b1c03", 0, 0, {#n_time:30, #str_id:#"hash_3ae5c3c2322b1c03"});
	level.var_75a7d6.var_c20e460e.mdl_anchor scene::play(#"hash_5b405bfccbbf2def", "cannon_out", a_ents);
	level.var_75a7d6.var_c20e460e flag::clear(#"hash_382481ac36f5fbaa");
	function_9965670d();
	level thread function_cdc05f45(1, 0);
}

/*
	Name: function_35058c30
	Namespace: namespace_95c839d1
	Checksum: 0xE8C82993
	Offset: 0x11DA0
	Size: 0x1DC
	Parameters: 0
	Flags: None
*/
function function_35058c30()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"intermission");
	if(!level.var_75a7d6 flag::get(#"hash_287677ffb745b0e2") || level.var_75a7d6 flag::get_any([1:#"intermission", 0:#"defeated"]) || level.var_75a7d6.var_c20e460e flag::get(#"hash_58ea62b85fb9afed"))
	{
		return;
	}
	wait(1);
	if(!level.var_75a7d6.var_c20e460e flag::get(#"hash_58ea62b85fb9afed") && level.var_75a7d6.var_c20e460e flag::get(#"hash_382481ac36f5fbaa") && !function_ef8d1319())
	{
		level.var_75a7d6.var_c20e460e flag::set(#"hash_58ea62b85fb9afed");
		level thread zm_vo::function_7622cb70(#"hash_48a6eabf092e71b1");
	}
}

/*
	Name: function_8c6bf36e
	Namespace: namespace_95c839d1
	Checksum: 0x608A6617
	Offset: 0x11F88
	Size: 0x1A4
	Parameters: 2
	Flags: None
*/
function function_8c6bf36e(var_2644aca3, var_a132edb9)
{
	if(!(isdefined(var_2644aca3) && isdefined(var_a132edb9)))
	{
		return;
	}
	v_start = var_a132edb9 getcentroid();
	if(!isdefined(v_start))
	{
		v_start = var_a132edb9.origin;
	}
	if(isvec(v_start))
	{
		mdl_fx = util::spawn_model(#"tag_origin", v_start);
		if(isdefined(var_2644aca3))
		{
			mdl_fx clientfield::set("" + #"hash_4e6fb90b199f15be", 1);
			v_end = var_2644aca3 getcentroid();
			if(!isdefined(v_end))
			{
				v_end = var_2644aca3.origin;
			}
			if(isvec(v_end))
			{
				mdl_fx moveto(v_end, 1);
				mdl_fx waittill(#"movedone");
			}
			mdl_fx clientfield::set("" + #"hash_4e6fb90b199f15be", 0);
		}
		mdl_fx thread util::delayed_delete(1);
	}
}

/*
	Name: function_4ba59ffe
	Namespace: namespace_95c839d1
	Checksum: 0x19AD0599
	Offset: 0x12138
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_4ba59ffe()
{
	if(!level.var_75a7d6 flag::get(#"intermission"))
	{
		n_progress = max(0.025, level.var_75a7d6.var_c20e460e.var_8a337eba / level.var_75a7d6.var_c20e460e.var_3887bcb7);
		if(n_progress < 0)
		{
			n_progress = 0;
		}
		else if(n_progress > 1)
		{
			n_progress = 1;
		}
		namespace_ee206246::sndonoverride_eye_(n_progress);
	}
}

/*
	Name: function_9965670d
	Namespace: namespace_95c839d1
	Checksum: 0x86E499C9
	Offset: 0x12208
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function function_9965670d()
{
	level.var_75a7d6.var_c20e460e flag::set(#"hash_f6fa640d2850acd");
	if(isdefined(level.var_75a7d6.var_c20e460e.var_2644aca3))
	{
		level.var_75a7d6.var_c20e460e.var_2644aca3 clientfield::set("" + #"hash_43c4039b38b89f56", 1);
	}
}

/*
	Name: function_9a39a4c
	Namespace: namespace_95c839d1
	Checksum: 0xBD6D8081
	Offset: 0x122B0
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_9a39a4c()
{
	level.var_75a7d6.var_c20e460e flag::clear(#"hash_f6fa640d2850acd");
	if(isdefined(level.var_75a7d6.var_c20e460e.var_2644aca3))
	{
		level.var_75a7d6.var_c20e460e.var_2644aca3 clientfield::set("" + #"hash_43c4039b38b89f56", 0);
	}
}

/*
	Name: function_bc175096
	Namespace: namespace_95c839d1
	Checksum: 0x75CB174F
	Offset: 0x12350
	Size: 0x3C4
	Parameters: 1
	Flags: None
*/
function function_bc175096(s_cannon)
{
	if(!zm_utility::function_e51dc2d8() || !isdefined(s_cannon.target))
	{
		return;
	}
	if(!isdefined(level.var_75a7d6.var_1f6f9128))
	{
		level.var_75a7d6.var_1f6f9128 = [];
	}
	else if(!isarray(level.var_75a7d6.var_1f6f9128))
	{
		level.var_75a7d6.var_1f6f9128 = array(level.var_75a7d6.var_1f6f9128);
	}
	level.var_75a7d6.var_1f6f9128[level.var_75a7d6.var_1f6f9128.size] = s_cannon;
	sp_turret = getent(s_cannon.target, "targetname");
	if(isspawner(sp_turret))
	{
		while(true)
		{
			s_cannon.vh_turret = sp_turret spawnfromspawner(undefined, 1, 1, 1);
			if(isdefined(s_cannon.vh_turret))
			{
				break;
			}
			waitframe(1);
		}
	}
	vh_turret = s_cannon.vh_turret;
	vh_turret endon(#"death");
	vh_turret.s_cannon = s_cannon;
	vh_turret makeunusable();
	vh_turret callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_733c1a3f);
	vh_turret callback::function_d8abfc3d(#"hash_55f29e0747697500", &function_bc6c4c25);
	vh_turret flag::set(#"hash_737ee671a33a84b7");
	vh_turret setteam(#"allies");
	vh_turret val::set(#"hash_3a9e9a3f3f770d4a", "allowdeath", 0);
	vh_turret val::set(#"hash_3a9e9a3f3f770d4a", "takedamage", 1);
	vh_turret.health = 1;
	foreach(struct in struct::get_array(s_cannon.target))
	{
		if(struct.var_fdd68e6f === #"charge")
		{
			s_cannon.var_e35c2428 = util::spawn_model(#"tag_origin", struct.origin, struct.angles);
			s_cannon.var_e35c2428 linkto(vh_turret, "tag_flash");
			break;
		}
	}
}

/*
	Name: function_ab16ea40
	Namespace: namespace_95c839d1
	Checksum: 0xDE623E30
	Offset: 0x12720
	Size: 0xCA
	Parameters: 1
	Flags: None
*/
function function_ab16ea40(vh_turret)
{
	s_cannon = vh_turret.s_cannon;
	if(!level.var_75a7d6 flag::get(#"intermission") && isstruct(s_cannon) && s_cannon flag::get(#"charged") && !isplayer(vh_turret getseatoccupant(0)))
	{
		return true;
	}
	return false;
}

/*
	Name: function_733c1a3f
	Namespace: namespace_95c839d1
	Checksum: 0xA9CAB08B
	Offset: 0x127F8
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function function_733c1a3f(s_params)
{
	self makeusable();
	e_player = s_params.player;
	if(isplayer(e_player))
	{
		e_player.var_f22c83f5 = 1;
	}
}

/*
	Name: function_bc6c4c25
	Namespace: namespace_95c839d1
	Checksum: 0x114D61AB
	Offset: 0x12860
	Size: 0x76
	Parameters: 1
	Flags: None
*/
function function_bc6c4c25(s_params)
{
	self makeunusable();
	e_player = s_params.player;
	if(isplayer(e_player))
	{
		e_player val::reset_all(#"hash_41e0ea13e56b1f40");
		e_player.var_f22c83f5 = undefined;
	}
}

/*
	Name: function_401c03c5
	Namespace: namespace_95c839d1
	Checksum: 0xC2C99BC7
	Offset: 0x128E0
	Size: 0x14E
	Parameters: 1
	Flags: None
*/
function function_401c03c5(e_player)
{
	s_cannon = self.stub.s_cannon;
	vh_turret = s_cannon.vh_turret;
	if(isvehicle(vh_turret) && zm_utility::is_player_valid(e_player))
	{
		var_734a260 = vh_turret getseatoccupant(0);
		if(!isplayer(var_734a260))
		{
			if(s_cannon flag::get(#"charged"))
			{
				self sethintstringforplayer(e_player, #"hash_1902e860cf0c6134");
			}
			else
			{
				self sethintstringforplayer(e_player, #"hash_65d561f7532ae5ba");
			}
			return true;
		}
	}
	self sethintstringforplayer(e_player, #"");
	return false;
}

/*
	Name: function_38e2dcaa
	Namespace: namespace_95c839d1
	Checksum: 0xC6C0903C
	Offset: 0x12A38
	Size: 0x150
	Parameters: 1
	Flags: None
*/
function function_38e2dcaa(s_interact)
{
	s_cannon = s_interact.s_cannon;
	if(!isdefined(s_cannon))
	{
		return;
	}
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = s_interact waittill(#"trigger_activated");
		e_player = var_be17187b.e_who;
		if(s_cannon flag::get(#"charged") && zm_utility::is_player_valid(e_player))
		{
			vh_turret = s_cannon.vh_turret;
			if(isvehicle(vh_turret))
			{
				var_734a260 = vh_turret getseatoccupant(0);
				if(!isplayer(var_734a260))
				{
					vh_turret usevehicle(e_player, 0);
					vh_turret playsound(#"hash_5abf8b261a1c3fb2");
				}
			}
		}
	}
}

/*
	Name: function_57858b58
	Namespace: namespace_95c839d1
	Checksum: 0x346C8C37
	Offset: 0x12B90
	Size: 0x52C
	Parameters: 1
	Flags: None
*/
function function_57858b58(s_cannon)
{
	vh_turret = s_cannon.vh_turret;
	if(!isdefined(vh_turret))
	{
		return;
	}
	vh_turret endon(#"death");
	vh_turret disabledriverfiring(0);
	while(!vh_turret isdriverfiring())
	{
		waitframe(1);
	}
	var_3ef4b5cf = vh_turret getseatoccupant(0);
	if(isplayer(var_3ef4b5cf))
	{
		var_3ef4b5cf val::set(#"hash_41e0ea13e56b1f40", "ignoreme", 1);
		var_3ef4b5cf val::set(#"hash_41e0ea13e56b1f40", "takedamage", 0);
		var_3ef4b5cf val::set(#"hash_41e0ea13e56b1f40", "allowdeath", 0);
	}
	vh_turret disabledriverfiring(1);
	vh_turret makeunusable();
	vh_turret clientfield::set("" + #"hash_469f6acd46f13b91", 2);
	s_earthquake = {#n_duration:2, #n_end:0.3, #n_start:0, #radius:1024, #origin:vh_turret.origin};
	level thread function_a7978694(s_earthquake);
	vh_turret playsound(#"hash_1b48225ef68f87b2");
	wait(2);
	s_earthquake notify(#"stop");
	s_earthquake struct::delete();
	vh_turret clientfield::set("" + #"hash_469f6acd46f13b91", 3);
	s_earthquake = {#n_start:0.4, #radius:1024, #origin:vh_turret.origin};
	level thread function_a7978694(s_earthquake);
	level thread function_cd50501e(vh_turret);
	level thread function_2bc1ab1(vh_turret.origin);
	wait(5);
	s_cannon flag::clear(#"charged");
	vh_turret notify(#"stop_damage");
	s_earthquake notify(#"stop");
	s_earthquake struct::delete();
	vh_turret clientfield::set("" + #"hash_469f6acd46f13b91", 0);
	s_earthquake = {#hash_2d65be8d:1, #n_duration:1, #n_end:0, #n_start:0.4, #radius:1024, #origin:vh_turret.origin};
	level thread function_a7978694(s_earthquake);
	level thread function_2bc1ab1(vh_turret.origin);
	wait(1);
	var_3ef4b5cf = vh_turret getseatoccupant(0);
	if(isplayer(var_3ef4b5cf))
	{
		vh_turret usevehicle(var_3ef4b5cf, 0);
		vh_turret playsound(#"hash_14c2e1af25683524");
	}
	level thread function_1c6d2370();
}

/*
	Name: function_866fc84d
	Namespace: namespace_95c839d1
	Checksum: 0xCBBF2EA4
	Offset: 0x130C8
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_866fc84d(s_cannon)
{
	if(!isstruct(s_cannon))
	{
		return;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"defeated", #"weakpoint_destroyed");
	s_cannon flag::wait_till_clear(#"charged");
	level thread function_f83c329c(#"hash_68fef8aec4a2ac38", 0, 0.5, {#n_time:30, #str_id:#"hash_68fef8aec4a2ac38"}, 0);
}

/*
	Name: function_cd50501e
	Namespace: namespace_95c839d1
	Checksum: 0x965B9496
	Offset: 0x131B8
	Size: 0x37E
	Parameters: 1
	Flags: None
*/
function function_cd50501e(vh_turret)
{
	if(!isdefined(vh_turret))
	{
		return;
	}
	vh_turret endon(#"death", #"stop_damage");
	while(true)
	{
		var_deda81c2 = vh_turret gettagorigin("tag_flash");
		var_f2658966 = anglestoforward(vh_turret gettagangles("tag_flash"));
		var_b700f817 = undefined;
		n_closest_dot = 0;
		foreach(var_ce34262e in level.var_75a7d6.var_e890a8bc)
		{
			var_1ec33c70 = var_ce34262e.origin;
			if(isvec(var_1ec33c70))
			{
				n_dot = vectordot(anglestoforward(vectortoangles(var_1ec33c70 - var_deda81c2)), var_f2658966);
				if(n_dot > 0 && n_dot >= 0.99 && n_dot > n_closest_dot)
				{
					var_b700f817 = var_ce34262e;
					n_closest_dot = n_dot;
				}
			}
		}
		if(!isdefined(var_b700f817))
		{
			v_start = var_deda81c2 + (var_f2658966 * 256);
			v_end = var_deda81c2 + (var_f2658966 * 2048);
			a_trace = bullettrace(v_start, v_end, 0, undefined);
			if(isarray(a_trace))
			{
				e_hit = a_trace[#"entity"];
				if(isdefined(e_hit) && e_hit flag::get(#"hash_7808b840308266e0"))
				{
					var_b700f817 = e_hit;
				}
			}
		}
		if(isdefined(var_b700f817) && !var_b700f817 flag::get(#"damage_cooldown"))
		{
			var_b700f817 dodamage(9999, var_deda81c2, vh_turret, vh_turret, "none", "MOD_UNKNOWN", 0, getweapon(#"hash_44b6ac9de3d37ee1"));
			var_b700f817 flag::set(#"damage_cooldown");
			level thread function_ea336b90(var_b700f817);
		}
		waitframe(1);
	}
}

/*
	Name: function_ea336b90
	Namespace: namespace_95c839d1
	Checksum: 0xF2B08E2F
	Offset: 0x13540
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_ea336b90(var_ce34262e)
{
	wait(0.1);
	if(isdefined(var_ce34262e))
	{
		var_ce34262e flag::clear(#"damage_cooldown");
	}
}

/*
	Name: function_2bc1ab1
	Namespace: namespace_95c839d1
	Checksum: 0x7C34A88A
	Offset: 0x13588
	Size: 0x180
	Parameters: 1
	Flags: None
*/
function function_2bc1ab1(v_center)
{
	if(!isvec(v_center))
	{
		return;
	}
	level function_e8799ac6(v_center, 512);
	var_eb5353bb = arraysortclosest(getaiarray(), v_center, undefined, 0, 512);
	foreach(ai_kill in var_eb5353bb)
	{
		if(isalive(ai_kill) && !is_true(ai_kill.var_c71090dd) && ai_kill.team === level.zombie_team && (!isdefined(ai_kill.allowdeath) || ai_kill.allowdeath))
		{
			ai_kill kill(undefined, undefined, undefined, undefined, undefined, 1);
		}
	}
}

/*
	Name: function_e8799ac6
	Namespace: namespace_95c839d1
	Checksum: 0xDAB6C746
	Offset: 0x13710
	Size: 0x2C0
	Parameters: 2
	Flags: None
*/
function function_e8799ac6(v_center, n_radius)
{
	if(!isdefined(n_radius))
	{
		n_radius = 512;
	}
	if(!isvec(v_center))
	{
		return;
	}
	var_17c7dbe6 = arraysortclosest(zombie_utility::get_zombie_array(), v_center, undefined, 0, n_radius);
	foreach(var_ccea7dbf in var_17c7dbe6)
	{
		if(isalive(var_ccea7dbf) && !is_true(var_ccea7dbf.var_c71090dd))
		{
			if(math::cointoss())
			{
				gibserverutils::gibhead(var_ccea7dbf);
			}
			if(math::cointoss())
			{
				if(math::cointoss())
				{
					gibserverutils::gibleftarm(var_ccea7dbf);
				}
				else
				{
					gibserverutils::gibrightarm(var_ccea7dbf);
				}
			}
			if(math::cointoss())
			{
				if(math::cointoss())
				{
					gibserverutils::gibleftleg(var_ccea7dbf);
				}
				else
				{
					gibserverutils::gibrightleg(var_ccea7dbf);
				}
			}
			n_random_x = randomfloatrange(-3, 3);
			n_random_y = randomfloatrange(-3, 3);
			v_fling = 200 * (vectornormalize((var_ccea7dbf.origin - v_center) + (n_random_x, n_random_y, 100)));
			var_ccea7dbf.var_c71090dd = 1;
			var_ccea7dbf.var_d45ca662 = 1;
			var_ccea7dbf.var_98f1f37c = 1;
			var_ccea7dbf thread zm_utility::function_ffc279(v_fling, var_ccea7dbf);
		}
	}
}

/*
	Name: function_a7978694
	Namespace: namespace_95c839d1
	Checksum: 0x81A9A011
	Offset: 0x139D8
	Size: 0x232
	Parameters: 1
	Flags: None
*/
function function_a7978694(s_earthquake)
{
	v_origin = s_earthquake.origin;
	n_radius = s_earthquake.radius;
	n_start = s_earthquake.n_start;
	if(!(isdefined(v_origin) && (isdefined(n_radius) && isdefined(n_start))))
	{
		return;
	}
	s_earthquake endon(#"stop");
	n_end = s_earthquake.n_end;
	n_duration = s_earthquake.n_duration;
	n_start_time = gettime();
	while(true)
	{
		if(!isdefined(n_duration))
		{
			earthquake(n_start, float(function_60d95f53()) / 1000, v_origin, n_radius);
		}
		else
		{
			n_percent = ((float(gettime() - n_start_time)) / 1000) / n_duration;
			if(n_percent < 0)
			{
				n_percent = 0;
			}
			else if(n_percent > 1)
			{
				n_percent = 1;
			}
			n_earthquake = lerpfloat(n_start, n_end, n_percent);
			if(n_earthquake > 0)
			{
				earthquake(n_earthquake, float(function_60d95f53()) / 1000, v_origin, n_radius);
			}
			if(is_true(s_earthquake.var_2d65be8d) && n_earthquake >= 1)
			{
				s_earthquake struct::delete();
				break;
			}
		}
		waitframe(1);
	}
}

/*
	Name: on_ai_spawned
	Namespace: namespace_95c839d1
	Checksum: 0x44F87318
	Offset: 0x13C18
	Size: 0x6A
	Parameters: 0
	Flags: None
*/
function on_ai_spawned()
{
	self endon(#"death");
	if(self.team !== level.zombie_team)
	{
		return;
	}
	if(level.round_number < 20)
	{
		self.maxhealth = self namespace_e0710ee6::function_b5fe98(20);
		self.health = self.maxhealth;
	}
}

/*
	Name: function_658da77b
	Namespace: namespace_95c839d1
	Checksum: 0x9CBBB8B7
	Offset: 0x13C90
	Size: 0x72E
	Parameters: 1
	Flags: None
*/
function function_658da77b(var_41ca011b)
{
	if(!isdefined(var_41ca011b))
	{
		var_41ca011b = 0;
	}
	level endon(#"end_game");
	level.var_75a7d6 endon(#"hash_21eabf998a71487a");
	n_players = getplayers().size;
	if(n_players < 1)
	{
		n_players = 1;
	}
	else if(n_players > 4)
	{
		n_players = 4;
	}
	switch(n_players)
	{
		case 1:
		{
			var_b9420427 = 1;
			if(var_41ca011b)
			{
				var_b9420427 = 0.5;
			}
			break;
		}
		case 2:
		{
			var_b9420427 = 1;
			if(var_41ca011b)
			{
				var_b9420427 = 0.5;
			}
			break;
		}
		case 3:
		{
			var_b9420427 = 0.5;
			if(var_41ca011b)
			{
				var_b9420427 = 0.5;
			}
			break;
		}
		case 4:
		{
			var_b9420427 = 0.5;
			if(var_41ca011b)
			{
				var_b9420427 = 0.5;
			}
			break;
		}
	}
	while(true)
	{
		n_ai = getaicount();
		if(!level.var_75a7d6 flag::get(#"hash_1e2734204ab845a2") && n_ai < getailimit() && n_ai < level.zombie_ai_limit && n_ai < level.var_75a7d6.var_772164a6)
		{
			var_949e9e59 = function_544d0383(var_41ca011b);
			if(isstruct(var_949e9e59))
			{
				var_abd5166d = var_949e9e59.var_abd5166d;
				s_spawn = var_949e9e59.s_spawn;
				if(isdefined(var_abd5166d) && isdefined(s_spawn))
				{
					switch(var_abd5166d)
					{
						case "hash_7c09b683edfb0e96":
						{
							ai_spawned = namespace_7cadb1cc::spawn_single(1, s_spawn);
							break;
						}
						case "mechz":
						{
							ai_spawned = zm_ai_mechz::spawn_single(1, s_spawn);
							break;
						}
						case "hash_643d498546885532":
						{
							ai_spawned = namespace_c80d5389::function_e803632f(1, s_spawn);
							break;
						}
						case "hash_24c829c980982c1":
						{
							ai_spawned = namespace_f7516cdf::spawn_single(1, s_spawn);
							break;
						}
						case "hash_1bc8194446d4722f":
						{
							ai_spawned = namespace_abfee9ba::spawn_single(1, s_spawn);
							break;
						}
						case "raz":
						{
							ai_spawned = zm_ai_raz::spawn_single(1, s_spawn);
							break;
						}
						case "mimic":
						{
							ai_spawned = namespace_14c07d4f::spawn_single(s_spawn);
							break;
						}
						case "zombie":
						{
							sp_zombie = namespace_96b7f11d::function_ddc13fd6();
							if(isdefined(sp_zombie))
							{
								ai_spawned = zombie_utility::spawn_zombie(sp_zombie, undefined, s_spawn);
							}
							break;
						}
					}
					if(isdefined(ai_spawned))
					{
						level thread function_6ea14df0(var_abd5166d);
						if(var_abd5166d == #"zombie")
						{
							function_1eaaceab(level.var_75a7d6.var_6359299f);
							if(!isdefined(level.var_75a7d6.var_6359299f))
							{
								level.var_75a7d6.var_6359299f = [];
							}
							else if(!isarray(level.var_75a7d6.var_6359299f))
							{
								level.var_75a7d6.var_6359299f = array(level.var_75a7d6.var_6359299f);
							}
							level.var_75a7d6.var_6359299f[level.var_75a7d6.var_6359299f.size] = ai_spawned;
						}
						else
						{
							function_1eaaceab(level.var_75a7d6.var_cd0c8367);
							if(!isdefined(level.var_75a7d6.var_cd0c8367))
							{
								level.var_75a7d6.var_cd0c8367 = [];
							}
							else if(!isarray(level.var_75a7d6.var_cd0c8367))
							{
								level.var_75a7d6.var_cd0c8367 = array(level.var_75a7d6.var_cd0c8367);
							}
							level.var_75a7d6.var_cd0c8367[level.var_75a7d6.var_cd0c8367.size] = ai_spawned;
							if(var_abd5166d == #"mechz" || var_abd5166d == #"hash_7c09b683edfb0e96")
							{
								function_1eaaceab(level.var_75a7d6.var_e97bb91a);
								if(!isdefined(level.var_75a7d6.var_e97bb91a))
								{
									level.var_75a7d6.var_e97bb91a = [];
								}
								else if(!isarray(level.var_75a7d6.var_e97bb91a))
								{
									level.var_75a7d6.var_e97bb91a = array(level.var_75a7d6.var_e97bb91a);
								}
								level.var_75a7d6.var_e97bb91a[level.var_75a7d6.var_e97bb91a.size] = ai_spawned;
							}
						}
					}
				}
			}
		}
		wait(var_b9420427);
	}
}

/*
	Name: function_a831c582
	Namespace: namespace_95c839d1
	Checksum: 0x911E72EF
	Offset: 0x143C8
	Size: 0x5FA
	Parameters: 1
	Flags: None
*/
function function_a831c582(var_abd5166d)
{
	if(!isdefined(var_abd5166d))
	{
		return;
	}
	n_players = getplayers().size;
	if(n_players < 1)
	{
		n_players = 1;
	}
	else if(n_players > 4)
	{
		n_players = 4;
	}
	switch(var_abd5166d)
	{
		case "hash_7c09b683edfb0e96":
		{
			switch(n_players)
			{
				case 1:
				{
					n_time = 180;
					break;
				}
				case 2:
				{
					n_time = 180;
					break;
				}
				case 3:
				{
					n_time = 120;
					break;
				}
				case 4:
				{
					n_time = 120;
					break;
				}
			}
			return {#n_time:n_time, #str_flag:#"hash_15ced8000939a79b"};
		}
		case "mechz":
		{
			switch(n_players)
			{
				case 1:
				{
					n_time = 180;
					break;
				}
				case 2:
				{
					n_time = 180;
					break;
				}
				case 3:
				{
					n_time = 120;
					break;
				}
				case 4:
				{
					n_time = 120;
					break;
				}
			}
			return {#n_time:n_time, #str_flag:#"hash_71a8b0cba966f837"};
		}
		case "hash_643d498546885532":
		{
			switch(n_players)
			{
				case 1:
				{
					n_time = 60;
					break;
				}
				case 2:
				{
					n_time = 60;
					break;
				}
				case 3:
				{
					n_time = 30;
					break;
				}
				case 4:
				{
					n_time = 30;
					break;
				}
			}
			return {#n_time:n_time, #str_flag:#"hash_25f8eaaceeb93d67"};
		}
		case "hash_24c829c980982c1":
		{
			switch(n_players)
			{
				case 1:
				{
					n_time = 120;
					break;
				}
				case 2:
				{
					n_time = 120;
					break;
				}
				case 3:
				{
					n_time = 60;
					break;
				}
				case 4:
				{
					n_time = 60;
					break;
				}
			}
			return {#n_time:n_time, #str_flag:#"hash_1bd28fc130c9aad2"};
		}
		case "hash_1bc8194446d4722f":
		{
			switch(n_players)
			{
				case 1:
				{
					n_time = 10;
					break;
				}
				case 2:
				{
					n_time = 10;
					break;
				}
				case 3:
				{
					n_time = 5;
					break;
				}
				case 4:
				{
					n_time = 5;
					break;
				}
			}
			return {#n_time:n_time, #str_flag:#"hash_3cd746b1b8037a98"};
		}
		case "raz":
		{
			switch(n_players)
			{
				case 1:
				{
					n_time = 60;
					break;
				}
				case 2:
				{
					n_time = 60;
					break;
				}
				case 3:
				{
					n_time = 30;
					break;
				}
				case 4:
				{
					n_time = 30;
					break;
				}
			}
			return {#n_time:n_time, #str_flag:#"hash_88667c18a4cff07"};
		}
		case "mimic":
		{
			switch(n_players)
			{
				case 1:
				{
					n_time = 60;
					break;
				}
				case 2:
				{
					n_time = 60;
					break;
				}
				case 3:
				{
					n_time = 30;
					break;
				}
				case 4:
				{
					n_time = 30;
					break;
				}
			}
			return {#n_time:n_time, #str_flag:#"hash_51c765cb33419613"};
		}
	}
}

/*
	Name: function_6ea14df0
	Namespace: namespace_95c839d1
	Checksum: 0xB9DE6801
	Offset: 0x149D0
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_6ea14df0(var_abd5166d)
{
	level endon(#"end_game");
	var_591caa3e = function_a831c582(var_abd5166d);
	str_flag = var_591caa3e.str_flag;
	n_time = var_591caa3e.n_time;
	if(!(isdefined(str_flag) && isdefined(n_time)))
	{
		return;
	}
	level.var_75a7d6 flag::set(str_flag);
	wait(n_time);
	level.var_75a7d6 flag::clear(str_flag);
}

/*
	Name: function_fcfae7e2
	Namespace: namespace_95c839d1
	Checksum: 0x9F41067A
	Offset: 0x14A90
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function function_fcfae7e2(var_abd5166d, var_41ca011b)
{
	if(!isdefined(var_41ca011b))
	{
		var_41ca011b = 0;
	}
	if(!isdefined(var_abd5166d))
	{
		return;
	}
	var_815eeaa4 = level.var_75a7d6.var_815eeaa4;
	if(var_41ca011b)
	{
		var_815eeaa4 = level.var_75a7d6.var_1d10f036;
	}
	var_eb3b90d = var_815eeaa4[var_abd5166d];
	if(isarray(var_eb3b90d))
	{
		return array::random(var_eb3b90d);
	}
}

/*
	Name: function_544d0383
	Namespace: namespace_95c839d1
	Checksum: 0xB7D0AA89
	Offset: 0x14B40
	Size: 0xDF6
	Parameters: 1
	Flags: None
*/
function function_544d0383(var_41ca011b)
{
	if(!isdefined(var_41ca011b))
	{
		var_41ca011b = 0;
	}
	n_players = getplayers().size;
	if(n_players < 1)
	{
		n_players = 1;
	}
	else if(n_players > 4)
	{
		n_players = 4;
	}
	switch(n_players)
	{
		case 1:
		{
			var_b849ca6e = 2;
			var_48857b80 = 1;
			break;
		}
		case 2:
		{
			var_b849ca6e = 2;
			var_48857b80 = 1;
			break;
		}
		case 3:
		{
			var_b849ca6e = 3;
			var_48857b80 = 1;
			break;
		}
		case 4:
		{
			var_b849ca6e = 3;
			var_48857b80 = 1;
			break;
		}
	}
	function_1eaaceab(level.var_75a7d6.var_cd0c8367);
	if(level.var_75a7d6.var_cd0c8367.size < var_b849ca6e)
	{
		function_1eaaceab(level.var_75a7d6.var_e97bb91a);
		if(level.var_75a7d6.var_e97bb91a.size < var_48857b80)
		{
			if(math::cointoss(5))
			{
				var_591caa3e = function_a831c582(#"hash_7c09b683edfb0e96");
				str_flag = var_591caa3e.str_flag;
				if(!isdefined(str_flag) || !level.var_75a7d6 flag::get(str_flag))
				{
					switch(n_players)
					{
						case 1:
						{
							var_c663e5dc = 1;
							break;
						}
						case 2:
						{
							var_c663e5dc = 1;
							break;
						}
						case 3:
						{
							var_c663e5dc = 2;
							break;
						}
						case 4:
						{
							var_c663e5dc = 2;
							break;
						}
					}
					if(isdefined(var_c663e5dc) && getaiarchetypearray(#"hash_7c09b683edfb0e96").size < var_c663e5dc)
					{
						s_spawn = function_fcfae7e2(#"hash_7c09b683edfb0e96", var_41ca011b);
						if(isstruct(s_spawn))
						{
							return {#s_spawn:s_spawn, #hash_abd5166d:#"hash_7c09b683edfb0e96"};
						}
					}
				}
			}
			if(math::cointoss(5))
			{
				var_591caa3e = function_a831c582(#"mechz");
				str_flag = var_591caa3e.str_flag;
				if(!isdefined(str_flag) || !level.var_75a7d6 flag::get(str_flag))
				{
					switch(n_players)
					{
						case 1:
						{
							var_5211199d = 1;
							break;
						}
						case 2:
						{
							var_5211199d = 1;
							break;
						}
						case 3:
						{
							var_5211199d = 2;
							break;
						}
						case 4:
						{
							var_5211199d = 2;
							break;
						}
					}
					if(isdefined(var_5211199d) && getaiarchetypearray(#"mechz").size < var_5211199d)
					{
						s_spawn = function_fcfae7e2(#"mechz", var_41ca011b);
						if(isstruct(s_spawn))
						{
							return {#s_spawn:s_spawn, #hash_abd5166d:#"mechz"};
						}
					}
				}
			}
		}
		if(math::cointoss(5))
		{
			var_591caa3e = function_a831c582(#"hash_643d498546885532");
			str_flag = var_591caa3e.str_flag;
			if(!isdefined(str_flag) || !level.var_75a7d6 flag::get(str_flag))
			{
				switch(n_players)
				{
					case 1:
					{
						var_1010e70f = 1;
						break;
					}
					case 2:
					{
						var_1010e70f = 1;
						break;
					}
					case 3:
					{
						var_1010e70f = 2;
						break;
					}
					case 4:
					{
						var_1010e70f = 2;
						break;
					}
				}
				if(isdefined(var_1010e70f) && getaiarchetypearray(#"hash_24f9e195cf2de42").size < var_1010e70f)
				{
					s_spawn = function_fcfae7e2(#"hash_643d498546885532", var_41ca011b);
					if(isstruct(s_spawn))
					{
						return {#s_spawn:s_spawn, #hash_abd5166d:#"hash_643d498546885532"};
					}
				}
			}
		}
		if(math::cointoss(0))
		{
			var_591caa3e = function_a831c582(#"hash_24c829c980982c1");
			str_flag = var_591caa3e.str_flag;
			if(!isdefined(str_flag) || !level.var_75a7d6 flag::get(str_flag))
			{
				switch(n_players)
				{
					case 1:
					{
						var_73489a82 = 1;
						break;
					}
					case 2:
					{
						var_73489a82 = 1;
						break;
					}
					case 3:
					{
						var_73489a82 = 2;
						break;
					}
					case 4:
					{
						var_73489a82 = 2;
						break;
					}
				}
				if(isdefined(var_73489a82) && getaiarchetypearray(#"avogadro").size < var_73489a82)
				{
					s_spawn = function_fcfae7e2(#"hash_24c829c980982c1", var_41ca011b);
					if(isstruct(s_spawn))
					{
						return {#s_spawn:s_spawn, #hash_abd5166d:#"hash_24c829c980982c1"};
					}
				}
			}
		}
		if(math::cointoss(5))
		{
			var_591caa3e = function_a831c582(#"hash_1bc8194446d4722f");
			str_flag = var_591caa3e.str_flag;
			if(!isdefined(str_flag) || !level.var_75a7d6 flag::get(str_flag))
			{
				switch(n_players)
				{
					case 1:
					{
						var_60625635 = 1;
						break;
					}
					case 2:
					{
						var_60625635 = 1;
						break;
					}
					case 3:
					{
						var_60625635 = 2;
						break;
					}
					case 4:
					{
						var_60625635 = 2;
						break;
					}
				}
				if(isdefined(var_60625635) && getaiarchetypearray(#"hash_1bc8194446d4722f").size < var_60625635)
				{
					s_spawn = function_fcfae7e2(#"hash_1bc8194446d4722f", var_41ca011b);
					if(isstruct(s_spawn))
					{
						return {#s_spawn:s_spawn, #hash_abd5166d:#"hash_1bc8194446d4722f"};
					}
				}
			}
		}
		if(math::cointoss(5))
		{
			var_591caa3e = function_a831c582(#"raz");
			str_flag = var_591caa3e.str_flag;
			if(!isdefined(str_flag) || !level.var_75a7d6 flag::get(str_flag))
			{
				switch(n_players)
				{
					case 1:
					{
						var_cd1a1fde = 1;
						break;
					}
					case 2:
					{
						var_cd1a1fde = 1;
						break;
					}
					case 3:
					{
						var_cd1a1fde = 2;
						break;
					}
					case 4:
					{
						var_cd1a1fde = 2;
						break;
					}
				}
				if(isdefined(var_cd1a1fde) && getaiarchetypearray(#"raz").size < var_cd1a1fde)
				{
					s_spawn = function_fcfae7e2(#"raz", var_41ca011b);
					if(isstruct(s_spawn))
					{
						return {#s_spawn:s_spawn, #hash_abd5166d:#"raz"};
					}
				}
			}
		}
		if(math::cointoss(5))
		{
			var_591caa3e = function_a831c582(#"mimic");
			str_flag = var_591caa3e.str_flag;
			if(!isdefined(str_flag) || !level.var_75a7d6 flag::get(str_flag))
			{
				switch(n_players)
				{
					case 1:
					{
						var_aa963e5b = 1;
						break;
					}
					case 2:
					{
						var_aa963e5b = 1;
						break;
					}
					case 3:
					{
						var_aa963e5b = 2;
						break;
					}
					case 4:
					{
						var_aa963e5b = 2;
						break;
					}
				}
				if(isdefined(var_aa963e5b) && getaiarchetypearray(#"mimic").size < var_aa963e5b)
				{
					s_spawn = function_fcfae7e2(#"mimic", var_41ca011b);
					if(isstruct(s_spawn))
					{
						return {#s_spawn:s_spawn, #hash_abd5166d:#"mimic"};
					}
				}
			}
		}
	}
	s_spawn = function_fcfae7e2(#"zombie", var_41ca011b);
	if(isstruct(s_spawn))
	{
		return {#s_spawn:s_spawn, #hash_abd5166d:#"zombie"};
	}
}

/*
	Name: function_4cc9e609
	Namespace: namespace_95c839d1
	Checksum: 0x987FFC9C
	Offset: 0x15940
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_4cc9e609()
{
	if(isdefined(level.var_75a7d6.var_772164a6))
	{
		level.var_75a7d6.var_772164a6--;
		function_886e403b();
	}
}

/*
	Name: function_a0f1fc1d
	Namespace: namespace_95c839d1
	Checksum: 0xD02D8D21
	Offset: 0x15990
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function function_a0f1fc1d()
{
	if(isdefined(level.var_75a7d6.var_772164a6))
	{
		level.var_75a7d6.var_772164a6++;
	}
}

/*
	Name: function_886e403b
	Namespace: namespace_95c839d1
	Checksum: 0x702A2CD5
	Offset: 0x159C8
	Size: 0x256
	Parameters: 0
	Flags: None
*/
function function_886e403b()
{
	if(getaicount() >= level.var_75a7d6.var_772164a6)
	{
		n_loops = 0;
		function_1eaaceab(level.var_75a7d6.var_6359299f);
		foreach(ai_zombie in level.var_75a7d6.var_6359299f)
		{
			if(isalive(ai_zombie))
			{
				b_can_see = 0;
				foreach(e_player in function_a1ef346b())
				{
					if(e_player zm_utility::is_player_looking_at(ai_zombie.origin, undefined, 0, e_player))
					{
						b_can_see = 1;
						break;
					}
				}
				if(!b_can_see)
				{
					ai_cleanup = ai_zombie;
					break;
				}
				n_loops++;
				if((n_loops % 5) == 0)
				{
					waitframe(1);
				}
			}
		}
		if(!isdefined(ai_cleanup))
		{
			function_1eaaceab(level.var_75a7d6.var_6359299f);
			ai_cleanup = array::random(level.var_75a7d6.var_6359299f);
		}
		if(isdefined(ai_cleanup))
		{
			ai_cleanup deletedelay();
			while(isdefined(ai_cleanup))
			{
				waitframe(1);
			}
		}
	}
}

/*
	Name: function_7a35edd2
	Namespace: namespace_95c839d1
	Checksum: 0xB79D61A5
	Offset: 0x15C28
	Size: 0xB0C
	Parameters: 0
	Flags: None
*/
function function_7a35edd2()
{
	level endon(#"end_game");
	level.var_f3b7c276 = &function_c835e3c4;
	level clientfield::set("" + #"hash_5a36f05cbdf2580", 11);
	level.var_75a7d6.var_9f7af8ca = [];
	foreach(e_player in getplayers())
	{
		if(level.var_87a3c4d1 namespace_fb27ba0b::is_open(e_player))
		{
			level.var_87a3c4d1 namespace_fb27ba0b::close(e_player);
		}
	}
	foreach(var_ce34262e in level.var_75a7d6.var_e890a8bc)
	{
		if(isdefined(var_ce34262e))
		{
			var_ce34262e deletedelay();
		}
	}
	function_3f9ee018();
	var_fae691b = [9:"tag_head_crystal_fx", 8:"tag_fx_crystal_belly", 7:"tag_fx_crystal_shoulder_ri", 6:"tag_fx_crystal_shoulder_le", 5:"j_shoulder_skin_ri", 4:"j_shouldertwist_ri", 3:"j_elbow_ri", 2:"j_shoulder_skin_le", 1:"j_shouldertwist_le", 0:"j_elbow_le"];
	foreach(var_676e0814 in var_fae691b)
	{
		level.var_75a7d6.mdl_body hidepart(var_676e0814, "", 1);
	}
	var_ae4e0e20 = [3:"j_spinelower_tentacle_root", 2:"j_spineupper_tentacle_root", 1:"j_tentacle_root_ri", 0:"j_tentacle_root_le"];
	foreach(var_eabfe72c in var_ae4e0e20)
	{
		level.var_75a7d6.mdl_body showpart(var_eabfe72c, "", 1);
	}
	foreach(e_player in getplayers())
	{
		e_player function_bc82f900(#"hash_2933dbe91eb483ab");
	}
	level.var_75a7d6 flag::function_c58ecb49(#"hash_3201bcb3cc3b7209");
	level thread function_315805c0();
	level.var_75a7d6 notify(#"hash_21eabf998a71487a");
	level thread function_658da77b(1);
	level.var_75a7d6 notify(#"weakpoint_destroyed");
	level thread function_e788990d();
	level thread function_b17579();
	level thread function_b852652a();
	level.var_75a7d6.mdl_body clientfield::set("" + #"hash_d92501ab1efcdd", 0);
	if(!level.var_75a7d6 flag::get(#"hash_12678fff6a404d29"))
	{
		exploder::kill_exploder("lgt_env_boss_left_arm_long");
		exploder::exploder("lgt_env_boss_left_arm_short");
	}
	if(!level.var_75a7d6 flag::get(#"hash_48bc8345fad29b74"))
	{
		exploder::kill_exploder("lgt_env_boss_right_arm_long");
		exploder::exploder("lgt_env_boss_right_arm_short");
	}
	function_968e2ead();
	level.var_75a7d6.var_c20e460e notify(#"stop_think");
	var_1bb57bae = level.var_75a7d6.var_c20e460e.var_529d63dd[3];
	if(level.var_75a7d6.var_c20e460e.var_135e3159 !== var_1bb57bae)
	{
		level thread function_91b8984b(var_1bb57bae.origin, var_1bb57bae.angles);
	}
	level thread zm_vo::function_d6f8bbd9(#"hash_1bcfa276c21b734c", 1, getplayers());
	a_ents[#"boss"] = level.var_75a7d6.mdl_body;
	level.var_75a7d6.var_d7f18c34 scene::play(#"hash_5ffc9256a4340dcb", "head_break", a_ents);
	music::setmusicstate("boss_outro");
	level thread function_64a4bf62();
	scene::add_scene_func(#"hash_2df6760d47b5c6ef", &function_4d5c5f2, "vignette_start");
	scene::add_scene_func(#"hash_2df6760d47b5c6ef", &function_38c740f4, "shot_01");
	scene::add_scene_func(#"hash_2df6760d47b5c6ef", &function_2f062d72, "shot_02");
	scene::add_scene_func(#"hash_2df6760d47b5c6ef", &function_1d4489ef, "shot_03");
	scene::add_scene_func(#"hash_2df6760d47b5c6ef", &function_3585613, "shot_04");
	scene::add_scene_func(#"hash_2df6760d47b5c6ef", &function_f199b296, "shot_05");
	scene::add_scene_func(#"hash_2df6760d47b5c6ef", &function_f1261395, "vignette_end");
	a_ents = [];
	a_ents[#"boss"] = level.var_75a7d6.mdl_body;
	a_ents[#"maxis"] = level.var_75a7d6.var_c20e460e.var_2644aca3;
	level scene::play(#"hash_2df6760d47b5c6ef", a_ents);
	level.var_75a7d6.var_a17b2556 clientfield::set("" + #"hash_399e2afd773621df", 5);
	level.var_75a7d6.var_b9f89aa6 clientfield::set("" + #"hash_399e2afd773621df", 5);
	wait(5);
	level clientfield::set("" + #"hash_5a36f05cbdf2580", 6);
	level zm_vo::function_7622cb70(#"hash_b4585c0ad32814");
	wait(3);
	level flag::set(#"hash_16783a54b8777dc");
	level lui::screen_fade_out(3, (0, 0, 0));
}

/*
	Name: function_4d5c5f2
	Namespace: namespace_95c839d1
	Checksum: 0x67830367
	Offset: 0x16740
	Size: 0x1F4
	Parameters: 1
	Flags: None
*/
function function_4d5c5f2(a_ents)
{
	var_da05d30e[#"head"] = level.var_75a7d6.mdl_head;
	level.var_75a7d6.mdl_anchor thread scene::play(#"hash_c1a40f41ec49882", "vignette_start", var_da05d30e);
	level waittill(#"hash_50262659f48fa243");
	level clientfield::set("" + #"hash_5a36f05cbdf2580", 10);
	level thread zm_vo::function_7622cb70(#"hash_b4555c0ad322fb");
	level waittill(#"hash_50262759f48fa3f6");
	level thread zm_vo::function_7622cb70(#"hash_b4565c0ad324ae");
	level waittill(#"hash_50262859f48fa5a9");
	foreach(e_player in function_a1ef346b())
	{
		e_player dodamage(666, e_player.origin);
	}
	level thread zm_vo::function_7622cb70(#"hash_b4575c0ad32661");
}

/*
	Name: function_38c740f4
	Namespace: namespace_95c839d1
	Checksum: 0x39EF4060
	Offset: 0x16940
	Size: 0x478
	Parameters: 1
	Flags: None
*/
function function_38c740f4(a_ents)
{
	level.var_75a7d6.var_c20e460e.var_2644aca3 clientfield::set("" + #"hash_25155d60768d46e4", 0);
	level.var_75a7d6.var_c20e460e.var_2644aca3 sethighdetail(1);
	var_da05d30e[#"head"] = level.var_75a7d6.mdl_head;
	level.var_75a7d6.mdl_anchor thread scene::play(#"hash_c1a40f41ec49882", "shot_01", var_da05d30e);
	level clientfield::set("" + #"hash_763dd8035e80f7c", 1);
	level clientfield::set("" + #"hash_1fb207d10fbe27ce", 1);
	level clientfield::set("" + #"hash_5a36f05cbdf2580", 13);
	level.var_75a7d6 notify(#"hash_1c0cb374de1cb6db");
	callback::remove_on_spawned(&function_b5db06b1);
	level.var_75a7d6 notify(#"hash_40ddf92b93b3b8fd");
	level.var_75a7d6 notify(#"hash_65bfb575e5f27617");
	level.var_75a7d6 notify(#"hash_21eabf998a71487a");
	level thread zm_utility::function_9ad5aeb1(0, 0, 1, 0);
	var_a347ab1 = level.var_75a7d6.var_4d537044;
	foreach(e_player in getplayers())
	{
		function_c69bc55b(e_player);
		e_player function_230fb4b1();
		e_player clientfield::set("zmbLastStand", 0);
		e_player clientfield::set("zm_last_stand_postfx", 0);
		e_player zm_utility::function_e0448fec();
		if(isarray(var_a347ab1))
		{
			s_teleport = var_a347ab1[i];
			v_teleport = s_teleport.origin;
			if(isvec(v_teleport))
			{
				e_player setorigin(v_teleport);
				if(isdefined(level.var_75a7d6.mdl_body) && level.var_75a7d6.mdl_body haspart("j_spine4"))
				{
					var_1979248a = level.var_75a7d6.mdl_body gettagorigin("j_spine4");
					if(isvec(var_1979248a))
					{
						e_player setplayerangles(vectortoangles(var_1979248a - v_teleport));
					}
				}
			}
		}
	}
}

/*
	Name: function_2f062d72
	Namespace: namespace_95c839d1
	Checksum: 0x14D8753C
	Offset: 0x16DC0
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_2f062d72(a_ents)
{
	var_da05d30e[#"head"] = level.var_75a7d6.mdl_head;
	level.var_75a7d6.mdl_anchor thread scene::play(#"hash_c1a40f41ec49882", "shot_02", var_da05d30e);
}

/*
	Name: function_1d4489ef
	Namespace: namespace_95c839d1
	Checksum: 0x17853697
	Offset: 0x16E40
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_1d4489ef(a_ents)
{
	var_da05d30e[#"head"] = level.var_75a7d6.mdl_head;
	level.var_75a7d6.mdl_anchor thread scene::play(#"hash_c1a40f41ec49882", "shot_03", var_da05d30e);
}

/*
	Name: function_3585613
	Namespace: namespace_95c839d1
	Checksum: 0xF49B6768
	Offset: 0x16EC0
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_3585613(a_ents)
{
	var_da05d30e[#"head"] = level.var_75a7d6.mdl_head;
	level.var_75a7d6.mdl_anchor thread scene::play(#"hash_c1a40f41ec49882", "shot_04", var_da05d30e);
}

/*
	Name: function_f199b296
	Namespace: namespace_95c839d1
	Checksum: 0x685284B
	Offset: 0x16F40
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_f199b296(a_ents)
{
	var_da05d30e[#"head"] = level.var_75a7d6.mdl_head;
	level.var_75a7d6.mdl_anchor thread scene::play(#"hash_c1a40f41ec49882", "shot_05", var_da05d30e);
}

/*
	Name: function_f1261395
	Namespace: namespace_95c839d1
	Checksum: 0xC197B60A
	Offset: 0x16FC0
	Size: 0x41C
	Parameters: 1
	Flags: None
*/
function function_f1261395(a_ents)
{
	var_da05d30e[#"head"] = level.var_75a7d6.mdl_head;
	level.var_75a7d6.mdl_anchor thread scene::play(#"hash_c1a40f41ec49882", "vignette_end", var_da05d30e);
	level clientfield::set("" + #"hash_763dd8035e80f7c", 0);
	level clientfield::set("" + #"hash_1fb207d10fbe27ce", 0);
	level.var_75a7d6.mdl_body playsound(#"hash_5c8a35cd1fd3a5eb");
	level flag::set(#"hash_4b00aa230ebbe82b");
	if(isdefined(level.var_75a7d6.var_c20e460e.var_2644aca3))
	{
		level.var_75a7d6.var_c20e460e.var_2644aca3 hide();
	}
	level thread function_a854e962();
	level thread function_eb4af590();
	level thread zm_utility::function_9ad5aeb1(0, 1, 0, 0);
	level waittill(#"hash_3a2628f365b5fdda");
	level.var_75a7d6.mdl_body playsound(#"hash_185ff25449560e2e");
	level.var_75a7d6.mdl_body clientfield::set("" + #"hash_6cc7dece6cee40e1", 1);
	level waittill(#"hash_42923ed5ab4264f");
	level.var_75a7d6.mdl_body clientfield::set("" + #"hash_33b8059f5b3f18b1", 0);
	level.var_75a7d6.mdl_body clientfield::set("" + #"hash_d92501ab1efcdd", 0);
	level.var_75a7d6.mdl_body clientfield::set("" + #"hash_2fc89133ccd7b0df", 0);
	level.var_75a7d6.mdl_head clientfield::set("" + #"hash_2fc89133ccd7b0df", 0);
	function_6c567aad();
	level.var_75a7d6.mdl_body playsound(#"hash_10f1bb5bbeca1d49");
	level thread function_d122270f();
	wait(3);
	level.var_75a7d6.mdl_body clientfield::set("" + #"hash_6cc7dece6cee40e1", 0);
	function_df782b45();
	wait(1);
	level clientfield::set("" + #"hash_78e149e0b7cb80e8", 0);
}

/*
	Name: function_d122270f
	Namespace: namespace_95c839d1
	Checksum: 0x1490E88A
	Offset: 0x173E8
	Size: 0x148
	Parameters: 0
	Flags: None
*/
function function_d122270f()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"hash_610f67b9b5f9b320");
	foreach(str_id in array::randomize([3:#"head", 2:#"hash_565d5e19da6fb336", 1:#"right", 0:#"left"]))
	{
		level thread function_d1acf958(str_id);
		wait(randomfloatrange(0.1, 0.2));
	}
}

/*
	Name: function_c835e3c4
	Namespace: namespace_95c839d1
	Checksum: 0x5D67B978
	Offset: 0x17538
	Size: 0x2F4
	Parameters: 10
	Flags: None
*/
function function_c835e3c4(einflictor, eattacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration)
{
	self flag::set(#"hash_2a03bf51cb24c450");
	function_c69bc55b(self);
	self.var_65c4e049 = self zm_laststand::function_618fd37e();
	self zm_laststand::function_3d685b5f(0);
	if(self isskydiving())
	{
		self function_8cf53a19();
	}
	self disableweaponcycling();
	self zm_laststand::registerfxanim_warehouse_explo(1);
	clientfield::set_world_uimodel(("PlayerList.client" + self.entnum) + ".playerIsDowned", 1);
	self allowjump(0);
	self zm_utility::clear_is_drinking();
	self disableoffhandweapons();
	self disableoffhandspecial();
	if(self isusingoffhand())
	{
		self forceoffhandend();
	}
	if(isdefined(level._zombie_minigun_powerup_last_stand_func))
	{
		self thread [[level._zombie_minigun_powerup_last_stand_func]]();
	}
	if(isdefined(level._zombie_tesla_powerup_last_stand_func))
	{
		self thread [[level._zombie_tesla_powerup_last_stand_func]]();
	}
	self clientfield::set("zm_last_stand_postfx", 1);
	self.var_bd4dd069 = gettime();
	self.health = 1;
	self.laststand = 1;
	self val::set(#"laststand", "ignoreme");
	self zm_laststand::laststand_disable_player_weapons();
	self zm_laststand::laststand_give_pistol();
	if(isdefined(self.var_c4890291))
	{
		self.var_c4890291 = [];
	}
	self thread function_cd0a15b5(60);
}

/*
	Name: function_cd0a15b5
	Namespace: namespace_95c839d1
	Checksum: 0x9115D5B5
	Offset: 0x17838
	Size: 0x248
	Parameters: 1
	Flags: None
*/
function function_cd0a15b5(delay)
{
	self endoncallback(&function_230fb4b1, #"player_revived", #"zombified", #"disconnect", #"hash_257d7f8fe6f97830", #"fake_death", #"hash_3e64b05a1f125db8");
	level endoncallback(&function_20bc0a74, #"end_game", #"round_reset", #"hash_65bfb575e5f27617");
	self clientfield::set("zmbLastStand", 1);
	self.bleedout_time = delay;
	if(!level.var_ff482f76 zm_laststand_client::is_open(self))
	{
		level.var_ff482f76 zm_laststand_client::open(self, 0);
	}
	level.var_ff482f76 zm_laststand_client::function_d50fdde9(self, 0);
	while(self.bleedout_time > 0)
	{
		if(!level.var_ff482f76 zm_laststand_client::is_open(self))
		{
			level.var_ff482f76 zm_laststand_client::open(self, 0);
			level.var_ff482f76 zm_laststand_client::function_d50fdde9(self, 0);
		}
		self.bleedout_time = self.bleedout_time - 0.2;
		var_76a1ade7 = self.bleedout_time / delay;
		level clientfield::set("laststand_update" + self getentitynumber(), var_76a1ade7);
		level.var_ff482f76 zm_laststand_client::function_67bdfe40(self, var_76a1ade7);
		wait(0.2);
	}
}

/*
	Name: function_230fb4b1
	Namespace: namespace_95c839d1
	Checksum: 0xC7FF4E3A
	Offset: 0x17A88
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_230fb4b1(notifyhash)
{
	if(isplayer(self) && isdefined(level.var_ff482f76) && level.var_ff482f76 zm_laststand_client::is_open(self))
	{
		level.var_ff482f76 zm_laststand_client::close(self);
	}
	self laststand::function_f5714974();
}

/*
	Name: function_20bc0a74
	Namespace: namespace_95c839d1
	Checksum: 0x3FDFC5F4
	Offset: 0x17B20
	Size: 0xA8
	Parameters: 1
	Flags: None
*/
function function_20bc0a74(notifyhash)
{
	a_e_players = getplayers();
	foreach(player in a_e_players)
	{
		player function_230fb4b1();
	}
}

/*
	Name: function_6096239d
	Namespace: namespace_95c839d1
	Checksum: 0xBE22423C
	Offset: 0x17BD0
	Size: 0x3F0
	Parameters: 0
	Flags: None
*/
function function_6096239d()
{
	level endon(#"end_game");
	self endon(#"death");
	if(!isplayer(self))
	{
		self notify(#"hash_3e64b05a1f125db8");
		return;
	}
	self thread lui::screen_fade(1, 0, 0.5, (1, 1, 1));
	self flag::clear(#"hash_2a03bf51cb24c450");
	clientfield::set_world_uimodel(("PlayerList.client" + self.entnum) + ".playerIsDowned", 0);
	self.var_1bee6f4b = undefined;
	self val::reset(#"chopper_gunner", "ignoreme");
	self val::reset(#"chopper_gunner", "takedamage");
	self val::reset(#"remote_missile", "ignoreme");
	self val::reset(#"remote_missile", "takedamage");
	self reviveplayer();
	self zm_utility::function_e0448fec();
	self clientfield::set("zmbLastStand", 0);
	self clientfield::set("zm_last_stand_postfx", 0);
	self val::set("zm_laststand", "allowdeath", 0);
	self util::delay(2, "death", &val::reset, "zm_laststand", "allowdeath");
	self util::delay(2, "death", &val::reset, "laststand", "ignoreme");
	self.laststand = undefined;
	self.var_d1e03242 = undefined;
	self setmovespeedscale(1);
	self allowjump(1);
	self notify(#"hash_3e64b05a1f125db8");
	if(isdefined(self.var_65c4e049))
	{
		self zm_laststand::function_3d685b5f(self.var_65c4e049);
	}
	waitframe(1);
	if(isdefined(self))
	{
		self thread zm_laststand::laststand_enable_player_weapons();
	}
	if(getplayers().size == 1)
	{
		ais = getactorarray();
		foreach(ai in ais)
		{
			zm_utility::get_closest_valid_player(ai.origin, undefined, 1);
		}
	}
}

/*
	Name: function_96a74deb
	Namespace: namespace_95c839d1
	Checksum: 0xE5129B3B
	Offset: 0x17FC8
	Size: 0xF0
	Parameters: 0
	Flags: None
*/
function function_96a74deb()
{
	level endon(#"end_game");
	wait(4);
	gestures::function_ba4529d4(#"hash_114ba314a93a4562");
	callback::on_spawned(&function_b5db06b1);
	foreach(e_player in function_a1ef346b())
	{
		e_player thread function_b5db06b1();
	}
}

/*
	Name: function_c69bc55b
	Namespace: namespace_95c839d1
	Checksum: 0x7E15FD37
	Offset: 0x180C0
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function function_c69bc55b(e_player)
{
	if(!isdefined(e_player))
	{
		return;
	}
	e_player notify(#"hash_40ddf92b93b3b8fd");
	e_player callback::function_52ac9652(#"on_player_killed", &function_cb6da13c);
	e_player flag::clear(#"hash_ed78dbda7cf8228");
	e_player val::reset_all(#"hash_48aef5b4fba4687c");
	if(e_player isgestureplaying(#"hash_114ba314a93a4562"))
	{
		e_player stopgestureviewmodel(#"hash_114ba314a93a4562");
	}
}

/*
	Name: function_b5db06b1
	Namespace: namespace_95c839d1
	Checksum: 0x7EE189EC
	Offset: 0x181A8
	Size: 0x26E
	Parameters: 0
	Flags: None
*/
function function_b5db06b1()
{
	self notify("ebad8b1b72ee261");
	self endon("ebad8b1b72ee261");
	level endon(#"end_game");
	level.var_75a7d6 endon(#"hash_40ddf92b93b3b8fd");
	self endon(#"death", #"hash_40ddf92b93b3b8fd");
	self callback::function_d8abfc3d(#"on_player_killed", &function_cb6da13c);
	self val::set(#"hash_48aef5b4fba4687c", "allow_sprint", 0);
	self val::set(#"hash_48aef5b4fba4687c", "move_speed_scale", 0.5);
	while(true)
	{
		var_35f9203c = 0;
		if(self isfiring() || self isreloading() || !self gestures::function_8cc27b6d(#"hash_114ba314a93a4562"))
		{
			self flag::set(#"hash_ed78dbda7cf8228");
			self thread function_fce96674();
		}
		else if(!self flag::get(#"hash_ed78dbda7cf8228"))
		{
			var_35f9203c = 1;
			if(!self isgestureplaying(#"hash_114ba314a93a4562"))
			{
				self playgestureviewmodel(#"hash_114ba314a93a4562");
			}
		}
		if(!var_35f9203c && self isgestureplaying(#"hash_114ba314a93a4562"))
		{
			self stopgestureviewmodel(#"hash_114ba314a93a4562");
		}
		waitframe(1);
	}
}

/*
	Name: function_fce96674
	Namespace: namespace_95c839d1
	Checksum: 0xBBED19A8
	Offset: 0x18420
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_fce96674()
{
	self notify("3a2f6d1be2b6d2e5");
	self endon("3a2f6d1be2b6d2e5");
	self endon(#"death");
	wait(2);
	self flag::clear(#"hash_ed78dbda7cf8228");
}

/*
	Name: function_cb6da13c
	Namespace: namespace_95c839d1
	Checksum: 0x5B7BF2AD
	Offset: 0x18480
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_cb6da13c(s_params)
{
	self callback::function_52ac9652(#"on_player_killed", &function_cb6da13c);
	function_c69bc55b(self);
}

/*
	Name: function_64a4bf62
	Namespace: namespace_95c839d1
	Checksum: 0x21D278D5
	Offset: 0x184E0
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_64a4bf62()
{
	level endon(#"end_game");
	foreach(s_crystal in level.var_75a7d6.var_58004de6)
	{
		level thread function_26a3bcef(s_crystal);
	}
	level.var_75a7d6 waittilltimeout(20, #"hash_46e83a86017495a9");
	wait(1);
	level clientfield::set("" + #"hash_6c47531bdf01d52c", 1);
}

/*
	Name: function_26a3bcef
	Namespace: namespace_95c839d1
	Checksum: 0xC683825B
	Offset: 0x185E8
	Size: 0x336
	Parameters: 1
	Flags: None
*/
function function_26a3bcef(s_crystal)
{
	if(!isstruct(s_crystal))
	{
		return;
	}
	level endon(#"end_game");
	b_first = 1;
	while(true)
	{
		mdl_clip = s_crystal.mdl_clip;
		if(isdefined(mdl_clip))
		{
			var_255e01f1 = s_crystal.var_255e01f1;
			if(isarray(var_255e01f1))
			{
				foreach(e_player in function_a1ef346b())
				{
					if(e_player istouching(mdl_clip))
					{
						var_2561ecde = var_255e01f1[i];
						if(isvec(var_2561ecde.origin))
						{
							e_player setorigin(var_2561ecde.origin);
						}
					}
				}
			}
			mdl_clip solid();
			mdl_clip disconnectpaths();
		}
		var_3128fb28 = util::spawn_model(#"hash_e4acd0d27d95fd0", s_crystal.origin + vectorscale((0, 0, 1), 4096), s_crystal.angles);
		if(!isdefined(level.var_75a7d6.var_9f7af8ca))
		{
			level.var_75a7d6.var_9f7af8ca = [];
		}
		else if(!isarray(level.var_75a7d6.var_9f7af8ca))
		{
			level.var_75a7d6.var_9f7af8ca = array(level.var_75a7d6.var_9f7af8ca);
		}
		level.var_75a7d6.var_9f7af8ca[level.var_75a7d6.var_9f7af8ca.size] = var_3128fb28;
		var_3128fb28 notsolid();
		var_3128fb28.mdl_clip = mdl_clip;
		level thread function_d426b29d(s_crystal, var_3128fb28, b_first);
		if(!isstruct(s_crystal.s_next))
		{
			break;
		}
		n_wait = 1;
		if(!b_first)
		{
			b_first = 0;
			n_wait = 3;
		}
		wait(n_wait);
		s_crystal = s_crystal.s_next;
	}
}

/*
	Name: function_d426b29d
	Namespace: namespace_95c839d1
	Checksum: 0xBB126F5D
	Offset: 0x18928
	Size: 0x2B4
	Parameters: 3
	Flags: None
*/
function function_d426b29d(s_crystal, var_3128fb28, b_first)
{
	if(!isdefined(b_first))
	{
		b_first = 0;
	}
	if(!(isdefined(s_crystal) && isdefined(var_3128fb28)))
	{
		return;
	}
	level endon(#"end_game");
	var_3128fb28 endon(#"death");
	if(b_first)
	{
		b_first = !level.var_75a7d6 flag::get(#"hash_3741b540fe013684");
		level.var_75a7d6 flag::set(#"hash_3741b540fe013684");
	}
	var_3128fb28 clientfield::set("" + #"hash_196f85a0e323cdeb", 1);
	var_3128fb28 moveto(s_crystal.origin, 1);
	var_3128fb28 waittill(#"movedone");
	var_3128fb28 clientfield::set("" + #"hash_196f85a0e323cdeb", 2);
	foreach(e_player in getplayers())
	{
		e_player function_bc82f900(#"hash_eb686a42b133d2a");
	}
	if(is_true(s_crystal.var_8046dccf))
	{
		level.var_75a7d6 notify(#"hash_46e83a86017495a9");
	}
	if(b_first)
	{
		level clientfield::set("" + #"hash_78e149e0b7cb80e8", 1);
		wait(1);
		level thread function_96a74deb();
		level thread function_3fcf0dd8();
	}
}

/*
	Name: function_3fcf0dd8
	Namespace: namespace_95c839d1
	Checksum: 0xC9E91798
	Offset: 0x18BE8
	Size: 0x19A
	Parameters: 0
	Flags: None
*/
function function_3fcf0dd8()
{
	level endon(#"end_game");
	level.var_75a7d6 endon(#"hash_1c0cb374de1cb6db");
	wait(2);
	while(true)
	{
		foreach(e_player in function_a1ef346b())
		{
			v_damage = e_player.origin;
			if(isarray(level.var_75a7d6.var_9f7af8ca))
			{
				var_a737f570 = arraygetclosest(e_player.origin, level.var_75a7d6.var_9f7af8ca);
				if(isvec(var_a737f570.origin))
				{
					v_damage = var_a737f570.origin;
				}
			}
			e_player dodamage(10, v_damage);
			e_player playsound(#"hash_138fba0237073649");
		}
		wait(1);
	}
}

/*
	Name: function_a854e962
	Namespace: namespace_95c839d1
	Checksum: 0xC7B02E9C
	Offset: 0x18D90
	Size: 0x17C
	Parameters: 0
	Flags: None
*/
function function_a854e962()
{
	level endon(#"end_game");
	foreach(e_player in function_a1ef346b())
	{
		if(e_player flag::get(#"hash_2a03bf51cb24c450"))
		{
			e_player thread function_6096239d();
		}
	}
	foreach(e_player in getplayers())
	{
		e_player thread function_230fb4b1();
		e_player thread namespace_32e85820::function_910d332f();
	}
	level thread namespace_32e85820::function_27b2aab7();
}

/*
	Name: function_eb4af590
	Namespace: namespace_95c839d1
	Checksum: 0xB41B134D
	Offset: 0x18F18
	Size: 0x198
	Parameters: 0
	Flags: None
*/
function function_eb4af590()
{
	level endon(#"end_game");
	level clientfield::set("" + #"hash_6c47531bdf01d52c", 0);
	wait(3);
	foreach(var_3128fb28 in level.var_75a7d6.var_9f7af8ca)
	{
		if(isdefined(var_3128fb28))
		{
			var_3128fb28 clientfield::set("" + #"hash_196f85a0e323cdeb", 0);
			mdl_clip = var_3128fb28.mdl_clip;
			if(isdefined(mdl_clip))
			{
				mdl_clip connectpaths();
				mdl_clip delete();
			}
			var_3128fb28 setmodel(#"hash_5ac0d6b687cca87c");
			var_3128fb28 thread scene::play(#"hash_4b3d6ea055c23e20", var_3128fb28);
			wait(0.5);
		}
	}
}

/*
	Name: function_14a35d6f
	Namespace: namespace_95c839d1
	Checksum: 0x7B2917F1
	Offset: 0x190B8
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_14a35d6f()
{
	/#
		a_e_players = function_a1ef346b();
		var_a347ab1 = struct::get_array(#"hash_5c9e57cec1f8655b");
		for(i = 0; i < a_e_players.size; i++)
		{
			e_player = a_e_players[i];
			s_teleport = var_a347ab1[i];
			if(isdefined(e_player) && isdefined(s_teleport))
			{
				e_player setorigin(s_teleport.origin);
				e_player setplayerangles(s_teleport.angles);
			}
		}
	#/
}

/*
	Name: devgui_setup
	Namespace: namespace_95c839d1
	Checksum: 0x80C22ADB
	Offset: 0x191A8
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function devgui_setup()
{
	/#
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		zm_devgui::add_custom_devgui_callback(&function_6361fb61);
	#/
}

/*
	Name: function_6361fb61
	Namespace: namespace_95c839d1
	Checksum: 0xD15625EB
	Offset: 0x19270
	Size: 0x142
	Parameters: 1
	Flags: None
*/
function function_6361fb61(str_cmd)
{
	/#
		if(!isdefined(str_cmd))
		{
			return;
		}
		switch(str_cmd)
		{
			case "hash_1a1d15f1da1fd948":
			{
				level.var_75a7d6.var_9d7dfc4c = undefined;
				break;
			}
			case "hash_11bc100a0e014371":
			case "hash_35eefe12894036fd":
			case "hash_3d123fac1908cd30":
			case "hash_4a50cd145965b8cd":
			{
				level.var_75a7d6.var_9d7dfc4c = str_cmd;
				break;
			}
			case "hash_2a7935567fe375b4":
			{
				if(level flag::get(#"hash_2145c074d359b87d"))
				{
					level.var_75a7d6.var_c20e460e.var_8a337eba = level.var_75a7d6.var_c20e460e.var_3887bcb7;
					function_4ba59ffe();
					level thread function_1c6d2370();
				}
				break;
			}
		}
	#/
}

