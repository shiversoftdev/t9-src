#using script_1029986e2bc8ca8e;
#using script_1cf46b33555422b7;
#using script_3e25b5e703601101;
#using script_6c5b51f98cd04fa3;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_60bf0cf2;

/*
	Name: function_b7e75061
	Namespace: namespace_60bf0cf2
	Checksum: 0xB5449747
	Offset: 0x258
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b7e75061()
{
	level notify(1932947856);
}

/*
	Name: init
	Namespace: namespace_60bf0cf2
	Checksum: 0x405BEF2C
	Offset: 0x278
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	init_clientfields();
	function_ec9e5cf2();
	/#
		level thread function_c72df2e9();
	#/
}

/*
	Name: init_clientfields
	Namespace: namespace_60bf0cf2
	Checksum: 0xB62AE439
	Offset: 0x2C0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("scriptmover", "" + #"hash_5808d23568bc787", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_50dd9d9bf6b71a00", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_464c0289eeaff2a8", 1, 1, "int");
}

/*
	Name: function_ec9e5cf2
	Namespace: namespace_60bf0cf2
	Checksum: 0x71B9065D
	Offset: 0x390
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_ec9e5cf2()
{
	level namespace_ee206246::register(#"hash_11d6906cf162270f", #"open_door", #"hash_346a14cdb51a5ad2", &function_3e0af5bf, &function_d75885b9);
	level namespace_ee206246::register(#"hash_11d6906cf162270f", #"hash_4589490bb9502447", #"hash_346a13cdb51a591f", &function_53c64c7d, &function_bb997270);
	level namespace_ee206246::register(#"hash_11d6906cf162270f", #"hash_6b85b8caee97658f", #"hash_346a12cdb51a576c", &function_6d459f8c, &function_6c07d63);
	if(!zm_utility::function_e51dc2d8())
	{
		return;
	}
	level thread function_2abef8da();
}

/*
	Name: function_2abef8da
	Namespace: namespace_60bf0cf2
	Checksum: 0x160D369B
	Offset: 0x4E8
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2abef8da()
{
	level namespace_ee206246::start(#"hash_11d6906cf162270f", 1);
}

/*
	Name: function_3e0af5bf
	Namespace: namespace_60bf0cf2
	Checksum: 0x85983C7F
	Offset: 0x520
	Size: 0x334
	Parameters: 1
	Flags: Linked
*/
function function_3e0af5bf(var_a276c861)
{
	if(var_a276c861)
	{
		return;
	}
	level endon(#"end_game", #"hash_7c11e78fdf8aff43");
	level flag::wait_till("start_zombie_round_logic");
	level thread function_f71a8c71();
	var_73e56d89 = struct::get("pizza_kitchen_radio", "targetname");
	var_73888042 = getent("pizza_kitchen_door", "targetname");
	var_73888042 disconnectpaths();
	var_5a015138 = struct::get("ronnie_the_baker", "targetname");
	scene::add_scene_func(#"hash_414c49236edfc1d4", &function_a7cf8b16, "show");
	level thread scene::play(#"hash_414c49236edfc1d4", "show");
	level thread function_abd5cecb();
	var_363dd5ac = getent("vol_pizza_kitchen", "targetname");
	while(!level flag::get(#"hash_75daa75b71ca3c65"))
	{
		foreach(player in getplayers())
		{
			if(istouching(player.origin, var_363dd5ac))
			{
				level flag::set(#"hash_75daa75b71ca3c65");
				break;
			}
		}
		wait(1);
	}
	s_unitrigger = var_73888042 zm_unitrigger::create(#"hash_a3ff0135b4c5d4a", (56, 56, 100));
	zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
	s_unitrigger.origin = s_unitrigger.origin + (-24, 30, 0);
	var_73888042 thread function_372852d();
	var_73888042 util::delay_notify(5, "trigger_activated");
}

/*
	Name: function_f71a8c71
	Namespace: namespace_60bf0cf2
	Checksum: 0xB51B366F
	Offset: 0x860
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_f71a8c71()
{
	level endon(#"end_game", #"hash_4836d98aa6574edc");
	var_1efd6e0f = struct::get("pizza_box_loc");
	s_unitrigger = var_1efd6e0f zm_unitrigger::create(&function_75460593, 48, &function_16dfcdea);
	zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
	if(!isdefined(level.var_a70c997e))
	{
		level.var_a70c997e = 0;
	}
	if(!isdefined(level.var_421e3759))
	{
		level.var_421e3759 = 0;
	}
	while(level.var_a70c997e < 4)
	{
		wait(1);
	}
	function_dca028f();
}

/*
	Name: function_75460593
	Namespace: namespace_60bf0cf2
	Checksum: 0x49238ED8
	Offset: 0x978
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function function_75460593(e_player)
{
	if(!e_player flag::get(#"hash_467e4279ccacfd8a") && !e_player flag::get(#"hash_56cc1795fa5f8e21") && !namespace_96b7f11d::function_1fd1da2b(0))
	{
		return true;
	}
	return false;
}

/*
	Name: function_16dfcdea
	Namespace: namespace_60bf0cf2
	Checksum: 0xEAC908AF
	Offset: 0xA00
	Size: 0x148
	Parameters: 0
	Flags: Linked
*/
function function_16dfcdea()
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		e_player = waitresult.activator;
		e_player flag::set(#"hash_467e4279ccacfd8a");
		level flag::set(#"hash_7855ea5b15a4c861");
		level.var_a70c997e = level.var_a70c997e + 1;
		hidemiscmodels("ts_pz_bx_" + level.var_a70c997e);
		var_1efd6e0f = struct::get("pizza_box_loc");
		playsoundatposition(#"hash_5ee8279df26f0e2a", var_1efd6e0f.origin);
		e_player thread function_51989322(45);
	}
}

/*
	Name: function_dca028f
	Namespace: namespace_60bf0cf2
	Checksum: 0x80A29F71
	Offset: 0xB50
	Size: 0x56
	Parameters: 0
	Flags: Linked
*/
function function_dca028f()
{
	var_1efd6e0f = struct::get("pizza_box_loc");
	if(isdefined(var_1efd6e0f.s_unitrigger))
	{
		zm_unitrigger::unregister_unitrigger(var_1efd6e0f.s_unitrigger);
		var_1efd6e0f.s_unitrigger = undefined;
	}
}

/*
	Name: function_51989322
	Namespace: namespace_60bf0cf2
	Checksum: 0x470C3C77
	Offset: 0xBB0
	Size: 0x194
	Parameters: 1
	Flags: Linked
*/
function function_51989322(n_time)
{
	level endon(#"end_game");
	self endon(#"hash_56cc1795fa5f8e21", #"death", #"disconnect", #"hash_217479a2ecb64b4");
	self.var_349130f7 = gettime() + (n_time * 1000);
	self function_626741e8(n_time);
	self thread function_63cb47df();
	self thread function_667bc5b7();
	level waittilltimeout(n_time, #"hash_4836d98aa6574edc");
	self flag::clear(#"hash_467e4279ccacfd8a");
	self notify(#"hash_59a3fb539c4b93af");
	self playsoundtoplayer(#"hash_3c67d7e5a42f65d5", self);
	if(level.var_55fd9380 luielemtext::is_open(self))
	{
		level.var_55fd9380 luielemtext::close(self);
	}
	self thread objective_manager::function_a809e69a();
}

/*
	Name: function_626741e8
	Namespace: namespace_60bf0cf2
	Checksum: 0xFB9C1438
	Offset: 0xD50
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_626741e8(n_time)
{
	level.var_55fd9380 luielemtext::open(self, 1);
	level.var_55fd9380 luielemtext::function_d5ea17f0(self, #"hash_5f906edd77fa8485");
	level.var_55fd9380 luielemtext::function_f97e9049(self, 50, 550);
	level.var_55fd9380 luielemtext::set_color(self, 1, 1, 1);
	level.var_55fd9380 luielemtext::function_aa5c711d(self, 1);
	level.var_55fd9380 luielemtext::function_1bd2bb26(self, 1);
	self thread objective_manager::function_b8278876(n_time, "pizza_delivery");
}

/*
	Name: function_63cb47df
	Namespace: namespace_60bf0cf2
	Checksum: 0x59250AD1
	Offset: 0xE78
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_63cb47df()
{
	level endon(#"end_game");
	self endon(#"hash_59a3fb539c4b93af", #"death", #"disconnect", #"hash_217479a2ecb64b4");
	self waittill(#"hash_56cc1795fa5f8e21");
	if(level.var_55fd9380 luielemtext::is_open(self))
	{
		level.var_55fd9380 luielemtext::close(self);
	}
	self thread objective_manager::function_a809e69a();
}

/*
	Name: function_667bc5b7
	Namespace: namespace_60bf0cf2
	Checksum: 0xA775EA50
	Offset: 0xF48
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function function_667bc5b7()
{
	level endon(#"end_game");
	self endon(#"hash_59a3fb539c4b93af", #"death", #"disconnect", #"hash_56cc1795fa5f8e21");
	self waittill(#"hash_217479a2ecb64b4");
	self.n_time_left = self.var_349130f7 - gettime();
	if(level.var_55fd9380 luielemtext::is_open(self))
	{
		level.var_55fd9380 luielemtext::close(self);
	}
	self thread objective_manager::function_a809e69a();
	self waittill(#"fasttravel_over");
	self thread function_51989322((int(float(self.n_time_left) / 1000)) + 1);
}

/*
	Name: function_a7cf8b16
	Namespace: namespace_60bf0cf2
	Checksum: 0x7CF02FA3
	Offset: 0x1090
	Size: 0x274
	Parameters: 1
	Flags: Linked
*/
function function_a7cf8b16(a_ents)
{
	level endon(#"end_game", #"hash_bd7f36c4031280d");
	var_e82701bb = a_ents[#"hash_4b65a37172a01802"];
	var_e82701bb clientfield::set("" + #"hash_5808d23568bc787", 1);
	var_e82701bb setcandamage(1);
	var_e82701bb.health = 1000;
	var_22a80ca2 = getent("col_ronnie_raygun", "targetname");
	var_22a80ca2 disconnectpaths();
	while(var_e82701bb.health > 0)
	{
		var_be17187b = undefined;
		var_be17187b = var_e82701bb waittill(#"damage");
		var_e82701bb clientfield::increment("" + #"hash_50dd9d9bf6b71a00", 1);
		if(var_be17187b.amount > 0)
		{
			var_e82701bb.health = var_e82701bb.health - var_be17187b.amount;
			/#
				iprintlnbold("" + var_e82701bb.health);
			#/
		}
	}
	var_e82701bb clientfield::set("" + #"hash_464c0289eeaff2a8", 1);
	var_e82701bb clientfield::set("" + #"hash_5808d23568bc787", 0);
	var_22a80ca2 connectpaths();
	if(isdefined(var_22a80ca2))
	{
		var_22a80ca2 delete();
	}
	level flag::set(#"hash_4836d98aa6574edc");
}

/*
	Name: function_abd5cecb
	Namespace: namespace_60bf0cf2
	Checksum: 0x4CA59938
	Offset: 0x1310
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function function_abd5cecb()
{
	level endon(#"end_game");
	level flag::wait_till(#"hash_4836d98aa6574edc");
	scene::remove_scene_func(#"hash_414c49236edfc1d4", &function_a7cf8b16, "show");
	level thread scene::play(#"hash_414c49236edfc1d4", "dead");
	foreach(player in getplayers())
	{
		player flag::clear(#"hash_467e4279ccacfd8a");
	}
	function_dca028f();
	function_505b6d6d();
	function_6d3d697d();
}

/*
	Name: function_372852d
	Namespace: namespace_60bf0cf2
	Checksum: 0x2785434B
	Offset: 0x1480
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_372852d()
{
	level endon(#"end_game", #"hash_7c11e78fdf8aff43");
	self waittill(#"trigger_activated");
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
	self.s_unitrigger = undefined;
	level flag::set(#"hash_2ff6951e302ad791");
	self function_d4f11e34();
}

/*
	Name: function_d4f11e34
	Namespace: namespace_60bf0cf2
	Checksum: 0x78107CA2
	Offset: 0x1528
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function function_d4f11e34()
{
	level endon(#"end_game");
	self connectpaths();
	var_e2316f6f = getent(self.target, "targetname");
	var_6b28b1ce = struct::get("kitchen_door_node");
	var_458d730c = util::spawn_model("tag_origin", var_6b28b1ce.origin, var_6b28b1ce.angles);
	self linkto(var_458d730c);
	var_e2316f6f linkto(var_458d730c);
	var_458d730c rotateto(var_458d730c.angles + vectorscale((0, 1, 0), 105), 0.5);
	playsoundatposition(#"hash_7480a28d0d9f00f6", (3496, 8079, -332));
	var_458d730c waittill(#"rotatedone");
	self unlink();
	var_e2316f6f unlink();
	if(isdefined(var_458d730c))
	{
		var_458d730c delete();
	}
}

/*
	Name: function_d75885b9
	Namespace: namespace_60bf0cf2
	Checksum: 0xC67C7366
	Offset: 0x16E0
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function function_d75885b9(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		var_73888042 = getent("pizza_kitchen_door", "targetname");
		var_73888042 function_d4f11e34();
		level flag::set(#"hash_2ff6951e302ad791");
		level flag::set(#"hash_7c11e78fdf8aff43");
	}
}

/*
	Name: function_53c64c7d
	Namespace: namespace_60bf0cf2
	Checksum: 0x915C2C3C
	Offset: 0x1790
	Size: 0x110
	Parameters: 1
	Flags: Linked
*/
function function_53c64c7d(var_a276c861)
{
	if(var_a276c861)
	{
		return;
	}
	level endon(#"end_game", #"hash_2dfa9988c9edb5dc", #"hash_4836d98aa6574edc");
	level flag::wait_till(#"hash_7855ea5b15a4c861");
	var_175ec39d = struct::get_array("dest_pizza");
	foreach(s_dest in var_175ec39d)
	{
		s_dest thread function_4e808365();
	}
}

/*
	Name: function_4e808365
	Namespace: namespace_60bf0cf2
	Checksum: 0xDB85CF45
	Offset: 0x18A8
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_4e808365()
{
	level endon(#"end_game", #"hash_59a3fb539c4b93af", #"hash_2dfa9988c9edb5dc", #"hash_4836d98aa6574edc");
	var_64c09f7f = self zm_unitrigger::function_fac87205(&function_56d84, 64, 0, 1);
	var_64c09f7f flag::clear(#"hash_467e4279ccacfd8a");
	var_64c09f7f flag::set(#"hash_56cc1795fa5f8e21");
	util::spawn_model(self.model, self.origin, self.angles);
	playsoundatposition(#"hash_2b489ac23b273781", self.origin + vectorscale((0, 0, 1), 5));
}

/*
	Name: function_56d84
	Namespace: namespace_60bf0cf2
	Checksum: 0x2B6556D8
	Offset: 0x19D0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_56d84(e_player)
{
	if(zm_utility::is_player_valid(e_player) && e_player flag::get(#"hash_467e4279ccacfd8a"))
	{
		self sethintstringforplayer(e_player, #"hash_d8170fb913d4b5e");
		return true;
	}
	return false;
}

/*
	Name: function_bb997270
	Namespace: namespace_60bf0cf2
	Checksum: 0xCF880DFE
	Offset: 0x1A58
	Size: 0xE8
	Parameters: 2
	Flags: Linked
*/
function function_bb997270(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_2dfa9988c9edb5dc");
		function_505b6d6d();
		foreach(player in getplayers())
		{
			player flag::set(#"hash_56cc1795fa5f8e21");
		}
	}
}

/*
	Name: function_505b6d6d
	Namespace: namespace_60bf0cf2
	Checksum: 0xBFB0C327
	Offset: 0x1B48
	Size: 0xC2
	Parameters: 0
	Flags: Linked
*/
function function_505b6d6d()
{
	var_175ec39d = struct::get_array("dest_pizza");
	foreach(s_dest in var_175ec39d)
	{
		if(isdefined(s_dest.s_unitrigger))
		{
			zm_unitrigger::unregister_unitrigger(s_dest.s_unitrigger);
			s_dest.s_unitrigger = undefined;
		}
	}
}

/*
	Name: function_6d459f8c
	Namespace: namespace_60bf0cf2
	Checksum: 0xC5E1C4EA
	Offset: 0x1C18
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function function_6d459f8c(var_a276c861)
{
	if(var_a276c861)
	{
		return;
	}
	level endon(#"end_game", #"hash_bd7f36c4031280d", #"hash_4836d98aa6574edc");
	var_5a015138 = struct::get("ronnie_the_baker", "targetname");
	s_unitrigger = var_5a015138 zm_unitrigger::create(&function_810ff42, 48);
	zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
	var_5a015138 thread function_a32f14f8();
}

/*
	Name: function_810ff42
	Namespace: namespace_60bf0cf2
	Checksum: 0x892438E5
	Offset: 0x1D00
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_810ff42(e_player)
{
	if(zm_utility::is_player_valid(e_player) && e_player flag::get(#"hash_56cc1795fa5f8e21"))
	{
		self sethintstringforplayer(e_player, #"hash_2ed4696a3a664b8b");
		return true;
	}
	return false;
}

/*
	Name: function_a32f14f8
	Namespace: namespace_60bf0cf2
	Checksum: 0xA513816A
	Offset: 0x1D88
	Size: 0x32A
	Parameters: 0
	Flags: Linked
*/
function function_a32f14f8()
{
	level endon(#"end_game", #"hash_bd7f36c4031280d", #"hash_4836d98aa6574edc");
	var_e07849bb = struct::get_array("pizza_delivery_reward_loc");
	v_pos = self.origin;
	while(true)
	{
		s_notify = undefined;
		s_notify = self waittill(#"trigger_activated");
		var_64c09f7f = s_notify.e_who;
		var_64c09f7f flag::clear(#"hash_56cc1795fa5f8e21");
		if(level.var_421e3759 == struct::get_array("dest_pizza").size)
		{
			function_6d3d697d();
		}
		else
		{
			level.var_421e3759 = level.var_421e3759 + 1;
		}
		var_53313495 = array::function_a3b0f814(var_e07849bb);
		var_aa4f9213 = var_64c09f7f function_a42c42c2();
		if(is_true(var_64c09f7f.var_87eb8981))
		{
			zm_powerups::specific_powerup_drop(var_aa4f9213, var_53313495.origin - vectorscale((0, 0, 1), 28));
			playsoundatposition(#"hash_f7813ab3479b297", var_53313495.origin);
		}
		else
		{
			point = function_4ba8fde(var_aa4f9213);
			var_9e536071 = item_drop::drop_item(0, undefined, 1, 0, point.id, v_pos, var_53313495.angles, 0);
			var_9e536071.var_dd21aec2 = 1 | 16;
			if(var_aa4f9213 === #"hash_35675bbd363f934a" || var_aa4f9213 === #"hash_79d7d5e206eaf770")
			{
				var_53313495.origin = var_53313495.origin + vectorscale((0, 0, 1), 12);
			}
			n_power = (length(v_pos - var_53313495.origin)) * 2;
			var_9e536071 zm_utility::fake_physicslaunch(var_53313495.origin, n_power);
			var_9e536071 playsound(#"hash_f7813ab3479b297");
		}
		var_64c09f7f.var_87eb8981 = undefined;
	}
}

/*
	Name: function_6d3d697d
	Namespace: namespace_60bf0cf2
	Checksum: 0xB0598F32
	Offset: 0x20C0
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function function_6d3d697d()
{
	var_5a015138 = struct::get("ronnie_the_baker", "targetname");
	if(isdefined(var_5a015138.s_unitrigger))
	{
		zm_unitrigger::unregister_unitrigger(var_5a015138.s_unitrigger);
		var_5a015138.s_unitrigger = undefined;
	}
}

/*
	Name: function_a42c42c2
	Namespace: namespace_60bf0cf2
	Checksum: 0x3409BDAD
	Offset: 0x2128
	Size: 0x152
	Parameters: 0
	Flags: Linked
*/
function function_a42c42c2()
{
	var_e083ecbd = function_21a3a673(1, 100);
	if(var_e083ecbd <= 30)
	{
		if(var_e083ecbd <= 10)
		{
			if(function_f23f302d())
			{
				str_item = #"hash_2cdb76a587cf7a3b";
			}
			else
			{
				str_item = #"hash_35675bbd363f934a";
			}
		}
		else
		{
			if(var_e083ecbd <= 20)
			{
				str_item = "full_ammo";
				self.var_87eb8981 = 1;
			}
			else
			{
				str_item = "double_points";
				self.var_87eb8981 = 1;
			}
		}
	}
	else
	{
		if(var_e083ecbd <= 65)
		{
			if(var_e083ecbd <= 55)
			{
				str_item = #"hash_1824627ee79fed84";
			}
			else
			{
				str_item = #"hash_595bb7a30746b8f2";
			}
		}
		else
		{
			if(var_e083ecbd <= 95)
			{
				str_item = #"hash_69a628368f8263f";
			}
			else
			{
				str_item = #"hash_79d7d5e206eaf770";
			}
		}
	}
	return str_item;
}

/*
	Name: function_f23f302d
	Namespace: namespace_60bf0cf2
	Checksum: 0xF40E949E
	Offset: 0x2288
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function function_f23f302d()
{
	foreach(player in getplayers())
	{
		if(player.var_72249004 === 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_6c07d63
	Namespace: namespace_60bf0cf2
	Checksum: 0x739A48FC
	Offset: 0x2328
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_6c07d63(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_bd7f36c4031280d");
		function_6d3d697d();
	}
}

/*
	Name: function_c72df2e9
	Namespace: namespace_60bf0cf2
	Checksum: 0x463666AD
	Offset: 0x2388
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_c72df2e9()
{
	/#
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_60bf0cf2
	Checksum: 0x86251D36
	Offset: 0x23F0
	Size: 0x17A
	Parameters: 1
	Flags: None
*/
function cmd(s_text)
{
	/#
		var_329d95fb = struct::get_array("", "");
		switch(s_text)
		{
			case "hash_7acad1e41b4b7af3":
			{
				foreach(e_dest in var_329d95fb)
				{
					e_dest thread function_b7549e2f(1);
				}
				break;
			}
			case "hash_37bd682457b237c8":
			{
				foreach(e_dest in var_329d95fb)
				{
					e_dest thread function_b7549e2f(0);
				}
				break;
			}
		}
	#/
}

/*
	Name: function_b7549e2f
	Namespace: namespace_60bf0cf2
	Checksum: 0x1FEC6192
	Offset: 0x2578
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_b7549e2f(state)
{
	/#
		self notify("");
		self endon("");
		self endon(#"death");
		if(state)
		{
			while(true)
			{
				circle(self.origin, 10, (0, 0, 1), 0, 0, 10);
				wait(10 * (float(function_60d95f53()) / 1000));
			}
		}
	#/
}

