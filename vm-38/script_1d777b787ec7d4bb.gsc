#using script_113dd7f0ea2a1d4f;
#using script_1df36deb5752c05d;
#using script_25ebc9ade08aed84;
#using script_3357acf79ce92f4b;
#using script_3411bb48d41bd3b;
#using script_35598499769dbb3d;
#using script_3f9e0dc8454d98e1;
#using script_46fe62930372dc4e;
#using script_52c6c2d1a2ef1b46;
#using script_5bb072c3abf4652c;
#using script_5fd73298643b6fff;
#using script_60d2812480bc5591;
#using script_663d23db6a134b9c;
#using script_6c5b51f98cd04fa3;
#using script_7e59d7bba853fe4b;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm\zm_gold_main_quest.gsc;
#using scripts\zm\zm_gold_pap_quest.gsc;
#using scripts\zm\zm_gold_util.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_f7b3ed9;

/*
	Name: function_251e723a
	Namespace: namespace_f7b3ed9
	Checksum: 0xAB85513F
	Offset: 0x380
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_251e723a()
{
	level notify(973372048);
}

/*
	Name: init
	Namespace: namespace_f7b3ed9
	Checksum: 0x7CDA6101
	Offset: 0x3A0
	Size: 0x35C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "" + #"hash_4824b5ad2c6adfcf", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_33fa936b763918a", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_20b22d2242b107cc", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_4cf52ac8c941f331", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_354f2f0ca110088b", 16000, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_221e597b28199323", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_48cdaba6cfee3ee8", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_11d9c3835adcaece", 16000, 1, "int");
	clientfield::register("actor", "" + #"zombie_soul", 16000, 1, "int");
	level.var_cc43b632 = struct::get_array("control_point_pos", "targetname");
	level.var_547f9dd5 = [];
	level.dont_unset_perk_when_machine_paused = 1;
	level.zone_occupied_func = &zone_occupied_func;
	array::thread_all(level.var_cc43b632, &function_e199d168);
	level thread function_ef4139d1();
	callback::add_callback(#"hash_594217387367ebb4", &function_d81240c3);
	callback::on_ai_spawned(&function_3a3787ec);
	level.var_7dbadc8c = namespace_72133e5::register();
	/#
		level thread function_37597f29();
	#/
}

/*
	Name: zone_occupied_func
	Namespace: namespace_f7b3ed9
	Checksum: 0x80D6BCB6
	Offset: 0x708
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function zone_occupied_func(str_zone)
{
	foreach(var_32f76af8 in level.var_cc43b632)
	{
		if(var_32f76af8.var_269ad176 === 1 && var_32f76af8.script_string === str_zone)
		{
			return 1;
		}
	}
	return zm_zonemgr::any_player_in_zone(str_zone);
}

/*
	Name: function_d81240c3
	Namespace: namespace_f7b3ed9
	Checksum: 0x30EC2D2A
	Offset: 0x7D8
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_d81240c3()
{
	callback::remove_callback(#"hash_594217387367ebb4", &function_d81240c3);
	foreach(var_32f76af8 in level.var_cc43b632)
	{
		level thread zm_unitrigger::unregister_unitrigger(var_32f76af8.objective_pos.s_unitrigger);
		if(var_32f76af8.var_269ad176 === 1)
		{
			var_32f76af8 thread function_21a9e71b(0);
		}
	}
	namespace_ee206246::objective_complete(#"hash_8602209567f541c");
	namespace_ee206246::objective_complete(#"hash_3e7926c5aefe4406");
	level thread zm_power::turn_power_on_and_open_doors(2);
}

/*
	Name: function_3a3787ec
	Namespace: namespace_f7b3ed9
	Checksum: 0xE6B655AC
	Offset: 0x940
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function function_3a3787ec()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"bad_path");
		if(isdefined(self.attackable))
		{
			self.var_12af7864 = 1;
			self.attackable = undefined;
			break;
		}
		wait(0.5);
	}
}

/*
	Name: function_e199d168
	Namespace: namespace_f7b3ed9
	Checksum: 0xC43B88E8
	Offset: 0x9B0
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_e199d168()
{
	self.var_af9beb09 = getent(self.target, "targetname");
	self.var_af9beb09 function_619a5c20();
	self.var_af9beb09 clientfield::set("set_compass_icon", 1);
	self.var_af9beb09.var_9fbdac89 = self;
	self.var_af9beb09 scene::init(#"hash_5ee79d3fbd128d25", self.var_af9beb09);
}

/*
	Name: function_60f09fb9
	Namespace: namespace_f7b3ed9
	Checksum: 0x5EDC9165
	Offset: 0xA68
	Size: 0xBA
	Parameters: 0
	Flags: Linked
*/
function function_60f09fb9()
{
	self scene::init(#"hash_e47497b4ff880f5");
	self.mdl = self.scene_ents[#"hash_7aff0ee60ddd937b"];
	self.mdl function_619a5c20();
	self.mdl clientfield::set("set_compass_icon", 1);
	self.mdl.var_9fbdac89 = self;
	self.objective_pos = struct::get(self.target, "targetname");
}

/*
	Name: function_ef4139d1
	Namespace: namespace_f7b3ed9
	Checksum: 0x307BA5F4
	Offset: 0xB30
	Size: 0x340
	Parameters: 0
	Flags: Linked
*/
function function_ef4139d1()
{
	level flag::wait_till("start_zombie_round_logic");
	foreach(var_d9f2e379 in level.var_cc43b632)
	{
		if(isdefined(var_d9f2e379))
		{
			var_d9f2e379.var_547f9dd5 = [];
			var_d9f2e379.var_56d2adea = 0;
			var_d9f2e379.var_269ad176 = 0;
			a_target_pos = struct::get_array(var_d9f2e379.target, "targetname");
			foreach(target_pos in a_target_pos)
			{
				if(target_pos.script_noteworthy === "satellite_pos")
				{
					if(!isdefined(var_d9f2e379.var_547f9dd5))
					{
						var_d9f2e379.var_547f9dd5 = [];
					}
					else if(!isarray(var_d9f2e379.var_547f9dd5))
					{
						var_d9f2e379.var_547f9dd5 = array(var_d9f2e379.var_547f9dd5);
					}
					if(!isinarray(var_d9f2e379.var_547f9dd5, target_pos))
					{
						var_d9f2e379.var_547f9dd5[var_d9f2e379.var_547f9dd5.size] = target_pos;
					}
					if(!isdefined(level.var_547f9dd5))
					{
						level.var_547f9dd5 = [];
					}
					else if(!isarray(level.var_547f9dd5))
					{
						level.var_547f9dd5 = array(level.var_547f9dd5);
					}
					if(!isinarray(level.var_547f9dd5, target_pos))
					{
						level.var_547f9dd5[level.var_547f9dd5.size] = target_pos;
					}
					continue;
				}
				if(target_pos.script_noteworthy === "objective_pos")
				{
					var_d9f2e379.objective_pos = target_pos;
				}
			}
			var_d9f2e379 thread function_6ed31494(var_d9f2e379.script_int);
			var_d9f2e379.mdl_tag = util::spawn_model("tag_origin", var_d9f2e379.origin, var_d9f2e379.angles);
			array::thread_all(var_d9f2e379.var_547f9dd5, &function_60f09fb9);
		}
	}
}

/*
	Name: function_6ed31494
	Namespace: namespace_f7b3ed9
	Checksum: 0xA3B2F9AC
	Offset: 0xE78
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function function_6ed31494(index)
{
	var_8c61185f = self.objective_pos zm_unitrigger::create(&function_c03a8002, 100, &function_789417a9);
	var_8c61185f.zone_index = index;
	var_8c61185f.var_9fbdac89 = self;
}

/*
	Name: function_c03a8002
	Namespace: namespace_f7b3ed9
	Checksum: 0x17F689E5
	Offset: 0xEE8
	Size: 0x24A
	Parameters: 1
	Flags: Linked
*/
function function_c03a8002(e_player)
{
	e_player globallogic::function_d96c031e();
	if(isplayer(e_player))
	{
		if(level flag::get(#"hash_1c70d74ceb5e9aa2") || level flag::get(#"hash_7752d012501cd222") || level flag::get(#"hash_49e515cdcf4bb8db"))
		{
			return false;
		}
		if(isdefined(level.var_28c80220) && level.var_28c80220 != 0 && !is_true(self.stub.var_9fbdac89.var_4e953b00))
		{
			self sethintstringforplayer(e_player, #"hash_308c87761b873a1b");
			return true;
		}
		if(level.round_number < self.stub.var_9fbdac89.var_56d2adea)
		{
			self sethintstringforplayer(e_player, #"hash_7925f5addbd983a8");
			return true;
		}
		if(self.stub.var_9fbdac89.var_269ad176 === 0)
		{
			self sethintstringforplayer(e_player, #"hash_1dea4a165481ef03", 500);
			if(!e_player zm_score::can_player_purchase(500))
			{
				e_player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
			}
			return true;
		}
		self sethintstringforplayer(e_player, #"");
		return false;
	}
	return false;
}

/*
	Name: function_789417a9
	Namespace: namespace_f7b3ed9
	Checksum: 0x8CEA66D1
	Offset: 0x1140
	Size: 0x208
	Parameters: 0
	Flags: Linked
*/
function function_789417a9()
{
	level endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		e_player = waitresult.activator;
		if(level flag::get(#"hash_1c70d74ceb5e9aa2") || level flag::get(#"hash_49e515cdcf4bb8db"))
		{
			continue;
		}
		if(isdefined(level.var_28c80220) && level.var_28c80220 != 0 && !is_true(self.stub.var_9fbdac89.var_4e953b00))
		{
			level thread function_b7c45db1(self.stub.var_9fbdac89, e_player);
			continue;
		}
		if(e_player zm_score::can_player_purchase(500) && level.round_number >= self.stub.var_9fbdac89.var_56d2adea && self.stub.var_9fbdac89.var_269ad176 === 0)
		{
			e_player thread zm_score::minus_to_player_score(500);
			self.stub.var_9fbdac89.activator = e_player;
			self.stub.var_9fbdac89 thread function_7df47abd();
			e_player function_bc82f900(#"hash_7ba664a71b6d6bc8");
		}
	}
}

/*
	Name: function_b7c45db1
	Namespace: namespace_f7b3ed9
	Checksum: 0x6BA2777A
	Offset: 0x1350
	Size: 0x4B4
	Parameters: 2
	Flags: Linked
*/
function function_b7c45db1(var_9fbdac89, e_player)
{
	e_player function_bc82f900(#"hash_3937704286348bfa");
	e_player playsound(#"hash_28c6c102591388a");
	level.var_28c80220--;
	if(level flag::get(#"hash_10087ff5db48e4db"))
	{
		level flag::clear(#"hash_10087ff5db48e4db");
		level namespace_6747c550::function_7df6bb60(#"hash_41f1735c1f1772a1", 2);
	}
	else
	{
		if(level flag::get(#"hash_dca80b283387742"))
		{
			level flag::clear(#"hash_dca80b283387742");
			level namespace_6747c550::function_7df6bb60(#"hash_41f1705c1f176d88", 2);
		}
		else
		{
			level flag::clear(#"hash_7a45234210f642a1");
			level namespace_6747c550::function_7df6bb60(#"hash_41f1715c1f176f3b", 2);
		}
	}
	var_9fbdac89.var_93623c13 = var_9fbdac89 util::spawn_model(#"hash_7cf020c84a283dd7", var_9fbdac89.origin, var_9fbdac89.angles);
	var_9fbdac89.var_93623c13 thread function_6ed4e713();
	var_9fbdac89.var_4e953b00 = 1;
	level flag::set(#"hash_647ab45ea0e2deb9" + var_9fbdac89.script_int);
	level.var_2912d8c5++;
	if(level.var_2912d8c5 < 3)
	{
		var_9fbdac89.mdl_tag zm_vo::function_d6f8bbd9(#"hash_15658e0da81868ac", 0, undefined, 1);
	}
	else
	{
		playsoundatposition(#"hash_7b48ab684f546cde", (0, 0, 0));
		foreach(player in function_a1ef346b())
		{
			earthquake(0.5, 4, player.origin, 2000);
			player function_bc82f900(#"hash_60f6431aa35823e4");
		}
		var_9fbdac89.mdl_tag zm_vo::function_d6f8bbd9(#"hash_15658e0da81868ac", 0, undefined, 1);
		var_9fbdac89.mdl_tag zm_vo::function_d6f8bbd9(#"hash_513b5b11b067f41e", 0, undefined, 1);
		level zm_vo::function_7622cb70(#"hash_725c10b600ae89b");
	}
	foreach(var_9673500d in struct::get_array(var_9fbdac89.target, "targetname"))
	{
		if(var_9673500d.script_noteworthy === "objective_pos")
		{
			namespace_ee206246::objective_complete(#"hash_520d09b88a205eac", var_9673500d);
		}
	}
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_6ed4e713
	Namespace: namespace_f7b3ed9
	Checksum: 0xBF234D90
	Offset: 0x1810
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_6ed4e713()
{
	self scene::play(#"hash_17724c22a7ab4091", "up", self);
	self scene::stop(#"hash_17724c22a7ab4091");
	self thread scene::play(#"hash_17724c22a7ab4091", "idle", self);
}

/*
	Name: function_7df47abd
	Namespace: namespace_f7b3ed9
	Checksum: 0x9D299494
	Offset: 0x1890
	Size: 0x47C
	Parameters: 0
	Flags: Linked
*/
function function_7df47abd()
{
	level endon(#"end_game", #"hash_3e765c26047c9f54");
	playsoundatposition(#"hash_2ea7b4a593646089", self.origin);
	level flag::set(#"hash_1c70d74ceb5e9aa2");
	level flag::set(#"hash_5dce120a8e013b48");
	thread namespace_4ce4e65e::function_4f292ffc();
	self.var_269ad176 = 1;
	if(level.var_2645bbc0 === 1)
	{
		namespace_ee206246::objective_complete(#"hash_69cca9825b7edc33");
	}
	if(level.var_2645bbc0 === 2)
	{
		namespace_ee206246::objective_complete(#"hash_2b663a5dd7beb565");
	}
	n_round = level.round_number;
	if(n_round < 5)
	{
		n_round = 5;
	}
	else if(n_round > 10)
	{
		n_round = 10;
	}
	n_players = getplayers().size;
	if(!isdefined(n_players))
	{
		return;
	}
	switch(n_players)
	{
		case 1:
		default:
		{
			var_4f886dd2 = 10;
			n_count_max = 12;
			break;
		}
		case 2:
		{
			var_4f886dd2 = 13;
			n_count_max = 15;
			break;
		}
		case 3:
		{
			var_4f886dd2 = 16;
			n_count_max = 18;
			break;
		}
		case 4:
		{
			var_4f886dd2 = 19;
			n_count_max = 21;
			break;
		}
	}
	var_37c20fcf = 5;
	var_4340bf8a = n_count_max - var_4f886dd2;
	var_3b3dba11 = var_4340bf8a / var_37c20fcf;
	n_count = int(var_4f886dd2 + (var_3b3dba11 * (n_round - var_37c20fcf)));
	if(n_count < var_4f886dd2)
	{
		n_count = var_4f886dd2;
	}
	else if(n_count > n_count_max)
	{
		n_count = n_count_max;
	}
	level.var_6fad6ea9 = level.zombie_ai_limit - n_count;
	level.zombie_ai_limit = level.zombie_ai_limit - level.var_6fad6ea9;
	callback::on_ai_spawned(&function_de517a00);
	foreach(ai_zombie in getaiteamarray(level.zombie_team))
	{
		ai_zombie thread function_de517a00();
	}
	self thread function_752dbea1(#"low");
	self function_1ef4bcd6();
	self thread function_bc369205();
	self thread function_e69a5ae5();
	self thread function_ca558ad5();
	self.var_af9beb09 thread zm_vo::function_d6f8bbd9(#"hash_8e1c13fa865fc0", 0, undefined, 1);
}

/*
	Name: function_752dbea1
	Namespace: namespace_f7b3ed9
	Checksum: 0x24B2ECA8
	Offset: 0x1D18
	Size: 0xE0
	Parameters: 1
	Flags: Linked
*/
function function_752dbea1(str_intensity)
{
	if(!isdefined(str_intensity))
	{
		str_intensity = #"low";
	}
	self notify("117a7689a7d01c77");
	self endon("117a7689a7d01c77");
	level endon(#"end_game");
	self endon(#"hash_327866e1223171e5");
	str_rumble = #"hash_4a5df674b579db5e";
	if(str_intensity == #"med")
	{
		str_rumble = #"hash_52050074b9862432";
	}
	while(true)
	{
		playrumbleonposition(str_rumble, self.origin);
		wait(0.5);
	}
}

/*
	Name: function_de517a00
	Namespace: namespace_f7b3ed9
	Checksum: 0x36B62D6E
	Offset: 0x1E00
	Size: 0x12A
	Parameters: 0
	Flags: Linked
*/
function function_de517a00()
{
	self notify("5fadc52d5fa39e8c");
	self endon("5fadc52d5fa39e8c");
	self endon(#"death");
	level endon(#"hash_397aa803a58d2ea3", #"hash_3e765c26047c9f54");
	self.var_6d81bf5c = self.var_126d7bef;
	self.var_c8a896e3 = self.ignore_round_spawn_failsafe;
	self.var_4e219048 = self.b_ignore_cleanup;
	while(true)
	{
		wait(randomfloatrange(0.8, 1.2));
		var_ad7db199 = self.attackable;
		if(isdefined(var_ad7db199.var_9fbdac89))
		{
			self.var_126d7bef = 1;
			self.ignore_round_spawn_failsafe = 1;
			self.b_ignore_cleanup = 1;
		}
		else
		{
			self.var_126d7bef = self.var_6d81bf5c;
			self.ignore_round_spawn_failsafe = self.var_c8a896e3;
			self.b_ignore_cleanup = self.var_4e219048;
		}
	}
}

/*
	Name: function_9112b94e
	Namespace: namespace_f7b3ed9
	Checksum: 0xF3D353E0
	Offset: 0x1F38
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function function_9112b94e(ai_zombie)
{
	if(!isdefined(ai_zombie))
	{
		return;
	}
	if(isdefined(ai_zombie.var_6d81bf5c))
	{
		ai_zombie.var_126d7bef = ai_zombie.var_6d81bf5c;
		ai_zombie.var_6d81bf5c = undefined;
	}
	if(isdefined(ai_zombie.var_c8a896e3))
	{
		ai_zombie.ignore_round_spawn_failsafe = ai_zombie.var_c8a896e3;
		ai_zombie.var_c8a896e3 = undefined;
	}
	if(isdefined(ai_zombie.var_4e219048))
	{
		ai_zombie.b_ignore_cleanup = ai_zombie.var_4e219048;
		ai_zombie.var_4e219048 = undefined;
	}
}

/*
	Name: function_1ef4bcd6
	Namespace: namespace_f7b3ed9
	Checksum: 0x2BA537EA
	Offset: 0x1FE0
	Size: 0x6D4
	Parameters: 1
	Flags: Linked
*/
function function_1ef4bcd6(var_14a22ccd)
{
	if(!isdefined(var_14a22ccd))
	{
		var_14a22ccd = 0;
	}
	level endon(#"end_game", #"hash_3e765c26047c9f54");
	level flag::clear("failed_control_point" + self.script_int);
	self.var_16ad7e31 = 0;
	self.var_ff770ca = 0;
	self.var_2b239c6f = 0;
	self.var_f303d9b0 = 0;
	self.var_cc514373 = [];
	self.var_fb721650 = [];
	if(self.var_269ad176 !== 2)
	{
		self.mdl_tag clientfield::set("" + #"hash_48cdaba6cfee3ee8", 1);
		self thread function_c1bde2a0();
	}
	self.mdl_tag clientfield::set("" + #"hash_4824b5ad2c6adfcf", 0);
	self.mdl_tag clientfield::set("" + #"hash_33fa936b763918a", 0);
	level.var_34bcb139 = [];
	if(!var_14a22ccd)
	{
		if(getplayers().size == 1)
		{
			var_8c10e30b = 2;
		}
		else
		{
			if(getplayers().size == 2)
			{
				var_8c10e30b = 3;
			}
			else
			{
				var_8c10e30b = 3;
			}
		}
	}
	foreach(var_3edac3b4 in self.var_547f9dd5)
	{
		if(self.var_269ad176 !== 2)
		{
			var_3edac3b4.mdl clientfield::set("" + #"hash_4cf52ac8c941f331", 1);
			var_3edac3b4 thread function_741d2259();
		}
	}
	if(!var_14a22ccd)
	{
		i = 0;
		while(i < var_8c10e30b)
		{
			satellite = array::random(array::randomize(self.var_547f9dd5));
			if(isdefined(satellite.mdl) && !is_true(satellite.mdl.is_active))
			{
				if(!isdefined(self.var_fb721650))
				{
					self.var_fb721650 = [];
				}
				else if(!isarray(self.var_fb721650))
				{
					self.var_fb721650 = array(self.var_fb721650);
				}
				if(!isinarray(self.var_fb721650, satellite))
				{
					self.var_fb721650[self.var_fb721650.size] = satellite;
				}
				satellite.mdl val::set("defend", "takedamage", 1);
				slots = function_bdb2b85b(satellite.mdl.origin, satellite.mdl.angles, 50, 3, satellite.script_string);
				if(isdefined(slots) && slots.size > 0)
				{
					satellite.mdl.is_active = 1;
					satellite.mdl.var_b79a8ac7 = {#slots:slots, #hash_f019ea1a:1024};
					level.attackables[level.attackables.size] = satellite.mdl;
					satellite.mdl thread function_30f8cfb4(satellite, self.script_int);
				}
				i++;
			}
		}
	}
	else
	{
		var_af9beb09 = self.var_af9beb09;
		if(isdefined(var_af9beb09) && !is_true(var_af9beb09.is_active))
		{
			var_af9beb09 val::set(#"hash_439fa8a074e8455c", "takedamage", 1);
			slots = function_bdb2b85b(var_af9beb09.origin, var_af9beb09.angles, 60, 6, self.script_string);
			if(isdefined(slots) && slots.size > 0)
			{
				var_af9beb09.is_active = 1;
				var_af9beb09.var_b79a8ac7 = {#slots:slots, #hash_f019ea1a:1024};
				level.attackables[level.attackables.size] = var_af9beb09;
				foreach(var_9ed85498 in struct::get_array(self.target))
				{
					if(var_9ed85498.script_noteworthy === #"obj_protect")
					{
						s_objective = var_9ed85498;
						break;
					}
				}
				var_af9beb09 thread function_30f8cfb4(self, self.script_int, 1);
			}
		}
	}
}

/*
	Name: function_c1bde2a0
	Namespace: namespace_f7b3ed9
	Checksum: 0x31DB1B69
	Offset: 0x26C0
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_c1bde2a0()
{
	self endon(#"hash_27ce7699e31c77b");
	self.var_af9beb09 scene::play(#"hash_5ee79d3fbd128d25", "activate", self.var_af9beb09);
	self.var_af9beb09 thread scene::play(#"hash_5ee79d3fbd128d25", "activate_idle", self.var_af9beb09);
}

/*
	Name: function_8ab36f01
	Namespace: namespace_f7b3ed9
	Checksum: 0x604CA3E6
	Offset: 0x2758
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function function_8ab36f01()
{
	self endon(#"hash_27ce7699e31c77b");
	self flag::set(#"exploded");
	self.var_af9beb09 clientfield::set("" + #"hash_11d9c3835adcaece", 1);
	wait(3);
	playrumbleonposition(#"hash_605684c23d123c36", self.origin);
	playsoundatposition(#"hash_302f5ee824b9e9eb", self.origin);
	self.var_af9beb09 scene::play(#"hash_5ee79d3fbd128d25", "explosion", self.var_af9beb09);
	self.var_af9beb09 thread scene::play(#"hash_5ee79d3fbd128d25", "explosion_idle", self.var_af9beb09);
	wait(3);
	self thread namespace_1812c3f4::function_891da57a();
}

/*
	Name: function_741d2259
	Namespace: namespace_f7b3ed9
	Checksum: 0xD799539F
	Offset: 0x28B8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_741d2259()
{
	self endon(#"hash_27ce7699e31c77b");
	self scene::play(#"hash_e47497b4ff880f5", "activate");
	self thread scene::play(#"hash_e47497b4ff880f5", "activate_idle");
}

/*
	Name: function_ca558ad5
	Namespace: namespace_f7b3ed9
	Checksum: 0x8F4BAD0B
	Offset: 0x2930
	Size: 0x2EC
	Parameters: 0
	Flags: Linked
*/
function function_ca558ad5()
{
	level endon(#"end_game", "failed_control_point" + self.script_int, #"hash_3e765c26047c9f54");
	callback::on_ai_killed(&function_559a9ad3);
	var_10ff40e4 = 7 + (function_a1ef346b().size * 5);
	if(level.round_number > 20)
	{
		var_10ff40e4 = var_10ff40e4 + (level.round_number - 20);
	}
	if(var_10ff40e4 > 50)
	{
		var_10ff40e4 = 50;
	}
	n_killed = 0;
	while(n_killed < var_10ff40e4)
	{
		result = undefined;
		result = level waittill(#"hash_7de17e8051b0d8d2");
		killed_ai = result.entity;
		attacker = result.attacker;
		if(isdefined(killed_ai) && isdefined(self.var_547f9dd5))
		{
			var_c2b976ac = namespace_af171776::function_db7e1556(killed_ai, self.var_547f9dd5);
			if(var_c2b976ac.dis <= 600)
			{
				killed_ai.var_923bed7a = var_c2b976ac.entity;
				killed_ai clientfield::set("" + #"zombie_soul", 1);
				n_killed++;
				sndonoverride_eye_(n_killed, var_10ff40e4);
			}
			if(!isinarray(self.var_cc514373, attacker))
			{
				if(!isdefined(self.var_cc514373))
				{
					self.var_cc514373 = [];
				}
				else if(!isarray(self.var_cc514373))
				{
					self.var_cc514373 = array(self.var_cc514373);
				}
				if(!isinarray(self.var_cc514373, attacker))
				{
					self.var_cc514373[self.var_cc514373.size] = attacker;
				}
			}
		}
	}
	var_3b0cab15 = 4000;
	if(is_true(self.var_3dacb34d))
	{
		var_3b0cab15 = 100000;
	}
	if(self.var_2b239c6f <= var_3b0cab15)
	{
		self thread function_21a9e71b(1);
	}
}

/*
	Name: function_559a9ad3
	Namespace: namespace_f7b3ed9
	Checksum: 0xEAC717FB
	Offset: 0x2C28
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function function_559a9ad3(params)
{
	e_attacker = params.eattacker;
	damage_mod = params.smeansofdeath;
	if(isplayer(e_attacker) || is_true(self.nuked))
	{
		level notify(#"hash_7de17e8051b0d8d2", {#attacker:e_attacker, #entity:self});
	}
}

/*
	Name: function_30f8cfb4
	Namespace: namespace_f7b3ed9
	Checksum: 0x32215AF9
	Offset: 0x2CD0
	Size: 0x2C0
	Parameters: 3
	Flags: Linked
*/
function function_30f8cfb4(satellite, zone_index, var_14a22ccd)
{
	if(!isdefined(var_14a22ccd))
	{
		var_14a22ccd = 0;
	}
	level endon(#"end_game", "captured_control_point" + zone_index, "failed_control_point" + zone_index, #"hash_8da573ff11210b6", #"hash_397aa803a58d2ea3", #"hash_3e765c26047c9f54");
	var_abc3ef9 = satellite.mdl;
	var_9bb2940e = #"hash_3859482a0c5aa91f";
	if(var_14a22ccd)
	{
		var_abc3ef9 = self;
		var_9bb2940e = #"hash_7918446edcdf4bdd";
	}
	namespace_ee206246::objective_set(#"hash_1598ff25b76743dd", var_abc3ef9, undefined, undefined, #"hash_8602209567f541c", undefined, &namespace_5c4c9a39::function_13ebb331, "vol_player_in_firebase");
	namespace_ee206246::function_3029d343(#"hash_8602209567f541c", var_abc3ef9);
	namespace_ee206246::objective_set(#"hash_68f4e9062d28524d", var_abc3ef9, undefined, var_9bb2940e, #"hash_3e7926c5aefe4406", undefined, &namespace_5c4c9a39::function_13ebb331, "vol_player_in_firebase");
	while(true)
	{
		result = undefined;
		result = self waittill(#"damage");
		if(!isplayer(result.attacker))
		{
			level notify("damage" + zone_index, {#hash_e3276b1e:satellite.mdl, #amount:result.amount});
			satellite thread function_49401276(var_abc3ef9);
			if(isdefined(result.attacker))
			{
				playsoundatposition(#"hash_2b4962dfa0b1e01", self.origin);
			}
			if(!var_14a22ccd && isdefined(satellite.mdl))
			{
				satellite.mdl clientfield::increment("" + #"hash_354f2f0ca110088b");
			}
		}
	}
}

/*
	Name: function_49401276
	Namespace: namespace_f7b3ed9
	Checksum: 0x268591A7
	Offset: 0x2F98
	Size: 0x194
	Parameters: 1
	Flags: Linked
*/
function function_49401276(var_abc3ef9)
{
	level endon(#"hash_3e765c26047c9f54");
	self endon(#"hash_3ff994bb36bd6fa0");
	self.var_94d080b = 3;
	if(self flag::get(#"hash_4677a94e0a997ed7"))
	{
		return;
	}
	self flag::set(#"hash_4677a94e0a997ed7");
	while(self.var_94d080b > 0)
	{
		for(i = 0; i < 2; i++)
		{
			var_cc3dc062 = #"hash_3e7926c5aefe4406";
			var_ff8e0f2d = #"hash_8602209567f541c";
			if(i > 0)
			{
				var_cc3dc062 = #"hash_8602209567f541c";
				var_ff8e0f2d = #"hash_3e7926c5aefe4406";
			}
			namespace_ee206246::function_aee0b4b4(var_ff8e0f2d, var_abc3ef9);
			waitframe(1);
			namespace_ee206246::function_3029d343(var_cc3dc062, var_abc3ef9);
			wait(0.5);
		}
		self.var_94d080b--;
	}
	self flag::clear(#"hash_4677a94e0a997ed7");
}

/*
	Name: function_640d77f3
	Namespace: namespace_f7b3ed9
	Checksum: 0xA223F0C5
	Offset: 0x3138
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_640d77f3(var_931d409)
{
	if(!isdefined(var_931d409))
	{
		var_931d409 = undefined;
	}
	if(isdefined(var_931d409))
	{
		if(var_931d409)
		{
			level flag::clear("spawn_zombies");
		}
		else
		{
			level flag::set("spawn_zombies");
		}
	}
	else
	{
		var_dc5c4436 = 0;
		foreach(var_9fbdac89 in level.var_cc43b632)
		{
			if(var_9fbdac89.var_269ad176 === 1)
			{
				var_dc5c4436 = 1;
				break;
			}
		}
		if(var_dc5c4436)
		{
			level flag::clear("spawn_zombies");
		}
		else
		{
			level flag::set("spawn_zombies");
		}
	}
}

/*
	Name: function_ea727237
	Namespace: namespace_f7b3ed9
	Checksum: 0x4F297450
	Offset: 0x3290
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_ea727237(params)
{
	function_1eaaceab(self.force_target.var_f8e2e6ae);
}

/*
	Name: function_e69a5ae5
	Namespace: namespace_f7b3ed9
	Checksum: 0x421444BC
	Offset: 0x32C8
	Size: 0x1E2
	Parameters: 0
	Flags: Linked
*/
function function_e69a5ae5()
{
	level endon(#"end_game", "captured_control_point" + self.script_int, "failed_control_point" + self.script_int, #"hash_3e765c26047c9f54");
	self endon(#"hash_8da573ff11210b6");
	while(true)
	{
		var_df9ba9f = getaiarchetypearray(#"zombie");
		foreach(ai in var_df9ba9f)
		{
			if(ai.zombie_move_speed !== "sprint" && !is_true(ai.in_the_ground) && ai getpathmode() !== "dont move")
			{
				str_zone = zm_zonemgr::get_zone_from_position(ai.origin, 1, 1);
				if(isdefined(str_zone) && isdefined(level.var_4b35561a) && isinarray(level.var_4b35561a, str_zone))
				{
					ai zombie_utility::set_zombie_run_cycle("sprint");
				}
			}
		}
		wait(1);
	}
}

/*
	Name: function_bc369205
	Namespace: namespace_f7b3ed9
	Checksum: 0x77C962D3
	Offset: 0x34B8
	Size: 0x590
	Parameters: 3
	Flags: Linked
*/
function function_bc369205(var_14a22ccd, var_17f8efd5, var_d219813c)
{
	if(!isdefined(var_14a22ccd))
	{
		var_14a22ccd = 0;
	}
	if(!isdefined(var_17f8efd5))
	{
		var_17f8efd5 = 0;
	}
	if(!isdefined(var_d219813c))
	{
		var_d219813c = 0;
	}
	level endon(#"end_game", "captured_control_point" + self.script_int, "failed_control_point" + self.script_int, #"hash_5dc90fb13f4ddf12", #"hash_22e4c4a43b33a4bd", #"hash_3e765c26047c9f54");
	self endon(#"hash_8da573ff11210b6");
	self thread function_2f28c166();
	if(!var_17f8efd5)
	{
		var_819b2764 = 1;
		var_7780c6f3 = 1;
		var_a79c7394 = 0;
		if(var_14a22ccd)
		{
			var_819b2764 = 0;
			if(level flag::get(#"hash_7a6662c944c5f275"))
			{
				var_a79c7394 = 1;
			}
		}
		foreach(e_player in getplayers())
		{
			if(!level.var_7dbadc8c namespace_72133e5::is_open(e_player))
			{
				level.var_7dbadc8c namespace_72133e5::open(e_player, 1);
			}
			level.var_7dbadc8c namespace_72133e5::function_751f7270(e_player, var_819b2764);
			level.var_7dbadc8c namespace_72133e5::function_338d48a0(e_player, var_7780c6f3);
			level.var_7dbadc8c namespace_72133e5::function_a95c34f3(e_player, var_a79c7394);
			level.var_7dbadc8c namespace_72133e5::function_a04ff29a(e_player, 0.025);
			if(var_819b2764 >= 1)
			{
				level.var_7dbadc8c namespace_72133e5::function_62264c81(e_player, 0.025);
			}
			if(!level.var_31028c5d prototype_hud::is_open(e_player))
			{
				level.var_31028c5d prototype_hud::open(e_player);
			}
		}
	}
	self flag::clear(#"hash_7288309470ca474f");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill("damage" + self.script_int);
		amount = waitresult.amount;
		var_3b0cab15 = 4000;
		if(!self flag::get(#"hash_7288309470ca474f"))
		{
			self flag::set(#"hash_7288309470ca474f");
			str_vo = #"hash_3029705148f472c1";
			if(!var_14a22ccd)
			{
				level thread function_9fed0352(self);
			}
			else
			{
				str_vo = #"hash_1f238da9ccf34af9";
			}
			level thread zm_vo::function_d6f8bbd9(str_vo, 0.5, function_a1ef346b());
		}
		if(is_true(self.var_3dacb34d))
		{
			var_3b0cab15 = 100000;
		}
		if(self.var_2b239c6f > var_3b0cab15)
		{
			self thread function_21a9e71b(0, var_14a22ccd, var_d219813c);
		}
		else
		{
			self.var_2b239c6f = self.var_2b239c6f + amount;
		}
		if(!var_17f8efd5)
		{
			sndonoverride_eye_(self.var_2b239c6f, var_3b0cab15, 1);
		}
		if(!self.var_16ad7e31 && self.var_2b239c6f >= 2000)
		{
			self.var_16ad7e31 = 1;
			self.mdl_tag clientfield::set("" + #"hash_4824b5ad2c6adfcf", 1);
		}
		if(!self.var_ff770ca && self.var_2b239c6f >= 3000)
		{
			self.var_ff770ca = 1;
			self.mdl_tag clientfield::set("" + #"hash_33fa936b763918a", 1);
		}
	}
}

/*
	Name: function_9fed0352
	Namespace: namespace_f7b3ed9
	Checksum: 0x43526941
	Offset: 0x3A50
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_9fed0352(var_32f76af8)
{
	level endon(#"end_game");
	level waittill(#"end_of_round");
	if(isdefined(var_32f76af8))
	{
		var_32f76af8 flag::clear(#"hash_7288309470ca474f");
	}
}

/*
	Name: sndonoverride_eye_
	Namespace: namespace_f7b3ed9
	Checksum: 0xC4D9D46C
	Offset: 0x3AC0
	Size: 0x158
	Parameters: 3
	Flags: Linked
*/
function sndonoverride_eye_(var_c8d0baba, var_cfcfe495, var_a80d5874)
{
	progress = var_c8d0baba / var_cfcfe495;
	if(progress < 0.025)
	{
		progress = 0.025;
	}
	else if(progress > 1)
	{
		progress = 1;
	}
	foreach(e_player in getplayers())
	{
		if(level.var_7dbadc8c namespace_72133e5::is_open(e_player))
		{
			if(is_true(var_a80d5874))
			{
				level.var_7dbadc8c namespace_72133e5::function_a04ff29a(e_player, progress);
				continue;
			}
			level.var_7dbadc8c namespace_72133e5::function_62264c81(e_player, progress);
		}
	}
}

/*
	Name: function_21a9e71b
	Namespace: namespace_f7b3ed9
	Checksum: 0x864294F5
	Offset: 0x3C20
	Size: 0xD14
	Parameters: 3
	Flags: Linked
*/
function function_21a9e71b(success, var_14a22ccd, var_d219813c)
{
	if(!isdefined(var_d219813c))
	{
		var_d219813c = 0;
	}
	level endon(#"end_game");
	callback::remove_on_ai_killed(&function_559a9ad3);
	callback::remove_on_ai_spawned(&function_de517a00);
	foreach(ai_zombie in getaiteamarray(level.zombie_team))
	{
		function_9112b94e(ai_zombie);
	}
	level notify(#"hash_397aa803a58d2ea3");
	a_cleanup = self.var_547f9dd5;
	if(var_d219813c)
	{
		a_cleanup = [0:self];
	}
	foreach(cleanup in a_cleanup)
	{
		if(var_d219813c)
		{
			attackable = cleanup.var_af9beb09;
		}
		else
		{
			attackable = cleanup.mdl;
		}
		if(isdefined(attackable))
		{
			attackable.is_active = 0;
			attackable thread namespace_85745671::function_b70e2a37(attackable);
			attackable notify(#"hash_3ff994bb36bd6fa0");
			attackable flag::clear(#"hash_4677a94e0a997ed7");
		}
	}
	namespace_ee206246::objective_complete(#"hash_8602209567f541c");
	namespace_ee206246::objective_complete(#"hash_3e7926c5aefe4406");
	foreach(e_player in getplayers())
	{
		if(isdefined(level.var_7dbadc8c) && level.var_7dbadc8c namespace_72133e5::is_open(e_player))
		{
			level.var_7dbadc8c namespace_72133e5::close(e_player);
			level.var_7dbadc8c namespace_72133e5::function_a95c34f3(e_player, 0);
		}
	}
	if(!var_d219813c && isdefined(level.var_6fad6ea9))
	{
		level.zombie_ai_limit = level.zombie_ai_limit + level.var_6fad6ea9;
		level.var_6fad6ea9 = undefined;
		self.mdl_tag clientfield::set("" + #"hash_48cdaba6cfee3ee8", 0);
	}
	if(is_true(var_14a22ccd))
	{
		namespace_b7a7e548::function_947330e6(self, #"power_on");
		self.var_269ad176 = 2;
		if(!var_d219813c)
		{
			self thread function_752dbea1(#"med");
			self thread function_8ab36f01();
			wait(3);
			level thread function_e8799ac6(self);
			self thread function_5bd01372(1);
			level thread zm_power::turn_power_on_and_open_doors(self.script_int);
			namespace_8dac58da::function_1a3aacac(self.script_int);
			self thread function_ef08f824();
			level thread namespace_47809ab2::function_b858693f(self.script_int);
			level notify(#"hash_40b4b8fc5453d00");
			level flag::set("captured_control_point" + self.script_int);
			self.mdl_tag clientfield::set("" + #"hash_221e597b28199323", 1);
			if(zm_utility::function_e51dc2d8())
			{
				level thread namespace_af171776::function_9e39dad3(self.script_int);
			}
			foreach(satellite in self.var_547f9dd5)
			{
				satellite.mdl clientfield::set("" + #"hash_4cf52ac8c941f331", 0);
				satellite.mdl clientfield::set("" + #"hash_20b22d2242b107cc", 1);
			}
			/#
				iprintlnbold("" + self.script_int);
				iprintlnbold("");
			#/
		}
	}
	else
	{
		namespace_b7a7e548::function_947330e6(self, #"power_off");
		namespace_b7a7e548::function_83285a17(self, 0);
		self thread function_5bd01372();
		self.var_269ad176 = 0;
		namespace_8dac58da::function_1a3aacac(self.script_int + 3);
		self.mdl_tag clientfield::set("" + #"hash_221e597b28199323", 0);
		self notify(#"hash_327866e1223171e5");
		self notify(#"hash_27ce7699e31c77b");
		if(self flag::get(#"exploded"))
		{
			self.var_af9beb09 clientfield::set("" + #"hash_11d9c3835adcaece", 0);
			self.var_af9beb09 thread scene::play(#"hash_5ee79d3fbd128d25", "collapse_fall", self.var_af9beb09);
			self flag::clear(#"exploded");
		}
		else
		{
			self.var_af9beb09 scene::stop();
			self.var_af9beb09 scene::init(#"hash_5ee79d3fbd128d25", self.var_af9beb09);
		}
		foreach(satellite in self.var_547f9dd5)
		{
			satellite.mdl clientfield::set("" + #"hash_20b22d2242b107cc", 0);
			satellite notify(#"hash_27ce7699e31c77b");
			satellite thread scene::play(#"hash_e47497b4ff880f5", "stop");
		}
		if(level flag::get("power_on" + self.script_int))
		{
			level flag::clear("power_on" + self.script_int);
		}
		if(var_d219813c)
		{
			level flag::set(#"hash_6b46a8438582259d");
			level notify(#"hash_63059cf6806229ba");
			self.var_56d2adea = level.round_number + 1;
			self thread function_afa5893c();
			level thread namespace_1812c3f4::function_df0c6e4e();
			foreach(e_player in getplayers())
			{
				level.var_31028c5d prototype_hud::function_953da284(e_player, #"");
				level.var_31028c5d prototype_hud::function_817e4d10(e_player, 0);
				level.var_31028c5d prototype_hud::function_1b05e380(e_player, 0);
			}
		}
		if(zm_utility::function_e51dc2d8())
		{
			level thread namespace_af171776::function_1621782d(self.script_int);
		}
		level thread namespace_47809ab2::function_1f622ac(self.script_int);
		level flag::set("failed_control_point" + self.script_int);
		level flag::clear("captured_control_point" + self.script_int);
		level notify(#"hash_26698e34c2af81d7");
		playsoundatposition(#"hash_1e81b38b571878ba", self.origin);
	}
	if(!level flag::get(#"pap_quest_completed"))
	{
		namespace_e0b1e9f5::function_b8854133();
	}
	level flag::clear(#"hash_1c70d74ceb5e9aa2");
	self.mdl_tag clientfield::set("" + #"hash_4824b5ad2c6adfcf", 0);
	self.mdl_tag clientfield::set("" + #"hash_33fa936b763918a", 0);
	if(!var_d219813c)
	{
		level flag::clear(#"hash_5dce120a8e013b48");
		thread namespace_4ce4e65e::function_453254ee();
	}
}

/*
	Name: function_5bd01372
	Namespace: namespace_f7b3ed9
	Checksum: 0xF28ED607
	Offset: 0x4940
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_5bd01372(var_5e21d8ec)
{
	if(!isdefined(var_5e21d8ec))
	{
		var_5e21d8ec = 0;
	}
	if(!isdefined(self.var_1c10e39f))
	{
		self.var_1c10e39f = 0;
	}
	if(self.var_1c10e39f != var_5e21d8ec)
	{
		self.var_1c10e39f = var_5e21d8ec;
		util::clientnotify(self.script_string);
	}
}

/*
	Name: function_e8799ac6
	Namespace: namespace_f7b3ed9
	Checksum: 0xC0CAC363
	Offset: 0x49B8
	Size: 0x2EC
	Parameters: 1
	Flags: Linked
*/
function function_e8799ac6(var_32f76af8)
{
	function_640d77f3(1);
	var_17c7dbe6 = arraysortclosest(zombie_utility::get_zombie_array(), var_32f76af8.origin, undefined, 0, 1024);
	foreach(var_ccea7dbf in var_17c7dbe6)
	{
		if(isalive(var_ccea7dbf))
		{
			level.zombie_total++;
			level.zombie_respawns++;
			level.zombie_total_subtract++;
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
			v_fling = 150 * (vectornormalize((var_ccea7dbf.origin - var_32f76af8.origin) + (n_random_x, n_random_y, 500)));
			var_ccea7dbf.var_d45ca662 = 1;
			var_ccea7dbf.var_98f1f37c = 1;
			var_ccea7dbf thread zm_utility::function_ffc279(v_fling, var_ccea7dbf);
		}
	}
	level thread zm_utility::function_9ad5aeb1(1, 1, 0, 0);
	wait(8);
	function_640d77f3(0);
}

/*
	Name: zombie_attack
	Namespace: namespace_f7b3ed9
	Checksum: 0x48FAAEB2
	Offset: 0x4CB0
	Size: 0x156
	Parameters: 0
	Flags: Linked
*/
function zombie_attack()
{
	level endon(#"hash_3e765c26047c9f54");
	self endon(#"death");
	self callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
	while(true)
	{
		a_players = getplayers();
		player = array::get_all_closest(self.origin, a_players)[0];
		namespace_85745671::function_744beb04(self);
		if(!isdefined(self.is_attacking) && isalive(self) && !isdefined(self.var_b238ef38) && isalive(player))
		{
			self.is_attacking = 1;
			awareness::function_c241ef9a(self, player, 15);
		}
		wait(15);
		self.is_attacking = undefined;
		self.var_ff290a61 = undefined;
	}
}

/*
	Name: function_fd68cae4
	Namespace: namespace_f7b3ed9
	Checksum: 0xB6AF6516
	Offset: 0x4E10
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_fd68cae4()
{
	if(self.archetype == #"zombie")
	{
		self namespace_85745671::function_9758722("sprint");
	}
}

/*
	Name: function_ef08f824
	Namespace: namespace_f7b3ed9
	Checksum: 0xFA46B8BC
	Offset: 0x4E58
	Size: 0x108
	Parameters: 0
	Flags: Linked
*/
function function_ef08f824()
{
	if(isdefined(self.var_cc514373))
	{
		foreach(player in getplayers())
		{
			if(isinarray(self.var_cc514373, player))
			{
				if(player === self.activator)
				{
					scoreevents::processscoreevent(#"hash_338f0007dcc1d9df", player);
					continue;
				}
				scoreevents::processscoreevent(#"hash_578cee6e9f63bcd3", player);
			}
		}
	}
}

/*
	Name: function_bdb2b85b
	Namespace: namespace_f7b3ed9
	Checksum: 0xCF1D0ADD
	Offset: 0x4F68
	Size: 0x37E
	Parameters: 6
	Flags: Linked
*/
function function_bdb2b85b(origin, angles, radius, num_spots, zone_name, max_height)
{
	if(!isdefined(max_height))
	{
		max_height = 512;
	}
	level endon(#"game_ended");
	slots = [];
	mins = vectorscale((-1, -1, 0), 10);
	maxs = (10, 10, 48);
	/#
		record3dtext("", origin, (0, 0, 1));
	#/
	for(i = 0; i < num_spots; i++)
	{
		t = mapfloat(0, num_spots, 0, 360, i);
		x = radius * (cos(t + angles[1]));
		y = radius * (sin(t + angles[1]));
		pos = (x, y, 0) + origin;
		var_e07c7e8 = physicstrace(pos + vectorscale((0, 0, 1), 10), pos + (vectorscale((0, 0, -1), 10)), mins, maxs, self, 1);
		var_c060661b = var_e07c7e8[#"position"];
		var_3e98a413 = getclosestpointonnavmesh(var_c060661b, 64, 15);
		if(isdefined(var_3e98a413))
		{
			if((abs(var_3e98a413[2] - origin[2])) <= max_height)
			{
				var_bb3288df = zm_zonemgr::get_zone_from_position(var_3e98a413, 1);
				if(var_bb3288df === zone_name)
				{
					/#
						recordstar(var_3e98a413, (0, 1, 0));
					#/
					if(!isdefined(level.var_34bcb139))
					{
						level.var_34bcb139 = [];
					}
					else if(!isarray(level.var_34bcb139))
					{
						level.var_34bcb139 = array(level.var_34bcb139);
					}
					if(!isinarray(level.var_34bcb139, var_3e98a413))
					{
						level.var_34bcb139[level.var_34bcb139.size] = var_3e98a413;
					}
					slots[slots.size] = {#hash_bb075e37:1, #origin:var_3e98a413};
				}
			}
		}
		if((i % 2) == 1)
		{
			waitframe(1);
		}
	}
	return slots;
}

/*
	Name: function_afa5893c
	Namespace: namespace_f7b3ed9
	Checksum: 0x559E00F
	Offset: 0x52F0
	Size: 0xB2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_afa5893c()
{
	self notify("69d00b780355467d");
	self endon("69d00b780355467d");
	level endon(#"end_game", #"game_ended", #"hash_3e765c26047c9f54");
	while(true)
	{
		if(level.round_number == self.var_56d2adea)
		{
			level zm_vo::function_d6f8bbd9(#"hash_51289ba87392a862", 5, function_a1ef346b());
			break;
		}
		wait(1);
	}
}

/*
	Name: function_2f28c166
	Namespace: namespace_f7b3ed9
	Checksum: 0xCE9986F4
	Offset: 0x53B0
	Size: 0x144
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2f28c166()
{
	self notify("49c2422d7007c933");
	self endon("49c2422d7007c933");
	level endon(#"end_game", "captured_control_point" + self.script_int, "failed_control_point" + self.script_int, #"hash_5dc90fb13f4ddf12", #"hash_22e4c4a43b33a4bd", #"hash_3e765c26047c9f54");
	while(true)
	{
		if(self.var_2b239c6f > 2000)
		{
			level thread zm_vo::function_d6f8bbd9(#"hash_5aa4b5320ce722e0", undefined, function_a1ef346b());
			break;
		}
		wait(0.5);
	}
	while(true)
	{
		if(self.var_2b239c6f > 3400)
		{
			level thread zm_vo::function_d6f8bbd9(#"hash_a7e5d16b0fe0df", undefined, function_a1ef346b());
			break;
		}
		wait(0.5);
	}
}

/*
	Name: function_37597f29
	Namespace: namespace_f7b3ed9
	Checksum: 0x2D03CECB
	Offset: 0x5500
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_37597f29()
{
	/#
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_f7b3ed9
	Checksum: 0x8E410318
	Offset: 0x5598
	Size: 0xD2
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_4d05810932ce7723":
			{
				function_2ecb6786();
				break;
			}
			case "hash_5076e04551545ed9":
			{
				function_b2d9913a();
				break;
			}
			case "hash_69d305bb8a491ab8":
			{
				function_c4d7b0f0();
				break;
			}
			case "hash_3cc8f8a1ca5d7c9b":
			{
				function_353c005c();
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

/*
	Name: function_2ecb6786
	Namespace: namespace_f7b3ed9
	Checksum: 0xB06BEA51
	Offset: 0x5678
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function function_2ecb6786()
{
	/#
		foreach(var_9fbdac89 in level.var_cc43b632)
		{
			var_9fbdac89.var_3dacb34d = 1;
		}
		iprintlnbold("");
	#/
}

/*
	Name: function_b2d9913a
	Namespace: namespace_f7b3ed9
	Checksum: 0x768BD3CA
	Offset: 0x5720
	Size: 0x1FC
	Parameters: 0
	Flags: None
*/
function function_b2d9913a()
{
	/#
		foreach(var_9fbdac89 in level.var_cc43b632)
		{
			if(isdefined(var_9fbdac89.mdl_tag))
			{
				var_9fbdac89.mdl_tag clientfield::set("" + #"hash_221e597b28199323", 0);
				var_9fbdac89.mdl_tag clientfield::set("" + #"hash_48cdaba6cfee3ee8", 1);
			}
			satellites = struct::get_array(var_9fbdac89.target, "");
			foreach(satellite in satellites)
			{
				if(isdefined(satellite.mdl))
				{
					satellite.mdl clientfield::set("" + #"hash_20b22d2242b107cc", 0);
					satellite.mdl clientfield::set("" + #"hash_4cf52ac8c941f331", 1);
				}
			}
		}
	#/
}

/*
	Name: function_c4d7b0f0
	Namespace: namespace_f7b3ed9
	Checksum: 0x241CE91B
	Offset: 0x5928
	Size: 0x1FC
	Parameters: 0
	Flags: None
*/
function function_c4d7b0f0()
{
	/#
		foreach(var_9fbdac89 in level.var_cc43b632)
		{
			if(isdefined(var_9fbdac89.mdl_tag))
			{
				var_9fbdac89.mdl_tag clientfield::set("" + #"hash_48cdaba6cfee3ee8", 0);
				var_9fbdac89.mdl_tag clientfield::set("" + #"hash_221e597b28199323", 1);
			}
			satellites = struct::get_array(var_9fbdac89.target, "");
			foreach(satellite in satellites)
			{
				if(isdefined(satellite.mdl))
				{
					satellite.mdl clientfield::set("" + #"hash_4cf52ac8c941f331", 0);
					satellite.mdl clientfield::set("" + #"hash_20b22d2242b107cc", 1);
				}
			}
		}
	#/
}

/*
	Name: function_353c005c
	Namespace: namespace_f7b3ed9
	Checksum: 0xB0204994
	Offset: 0x5B30
	Size: 0x1EC
	Parameters: 0
	Flags: None
*/
function function_353c005c()
{
	/#
		foreach(var_9fbdac89 in level.var_cc43b632)
		{
			if(isdefined(var_9fbdac89.mdl_tag))
			{
				var_9fbdac89.mdl_tag clientfield::set("" + #"hash_48cdaba6cfee3ee8", 0);
				var_9fbdac89.mdl_tag clientfield::set("" + #"hash_221e597b28199323", 0);
			}
			satellites = struct::get_array(var_9fbdac89.target, "");
			foreach(satellite in satellites)
			{
				if(isdefined(satellite.mdl))
				{
					satellite.mdl clientfield::set("" + #"hash_4cf52ac8c941f331", 0);
					satellite.mdl clientfield::set("" + #"hash_20b22d2242b107cc", 0);
				}
			}
		}
	#/
}

