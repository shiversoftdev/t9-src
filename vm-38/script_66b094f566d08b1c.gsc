#using scripts\zm_common\zm_sq.gsc;
#using script_6fc2be37feeb317b;
#using script_7a5293d92c61c788;
#using script_3751b21462a54a7d;
#using script_2618e0f3e5e11649;
#using script_3411bb48d41bd3b;
#using script_1029986e2bc8ca8e;
#using script_34ab99a4ca1a43d;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_1b312da5;

/*
	Name: function_25fc29f3
	Namespace: namespace_1b312da5
	Checksum: 0x8C0C441F
	Offset: 0x508
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_25fc29f3()
{
	level notify(-1460131628);
}

/*
	Name: __init__system__
	Namespace: namespace_1b312da5
	Checksum: 0xFE33BC89
	Offset: 0x528
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_3cd3b81be4386726", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_1b312da5
	Checksum: 0x69C86ED4
	Offset: 0x578
	Size: 0x204
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!zm_utility::is_ee_enabled())
	{
		return;
	}
	clientfield::register("world", "" + #"hash_1ff35e37755facac", 1, getminbitcountfornum(6), "int");
	clientfield::register("scriptmover", "" + #"hash_33efd42a2437edc1", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_3fa05b65abd13e3d", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_22f5493de4d47138", 1, getminbitcountfornum(2), "int");
	namespace_8b6a9d79::function_b3464a7c(#"hash_1f5e56ff4b3c50e2", &function_abb99222);
	objective_manager::function_b3464a7c(#"reveal", &function_7c583c30, &function_b6b9b6e6, #"ee", #"hash_b418b036831ea2a", #"hash_3c5363541b97ca3e", undefined, #"hash_78aab711c79ec4a");
}

/*
	Name: function_abb99222
	Namespace: namespace_1b312da5
	Checksum: 0x7E81544E
	Offset: 0x788
	Size: 0x32C
	Parameters: 1
	Flags: Linked
*/
function function_abb99222(s_instance)
{
	callback::add_callback(#"on_item_pickup", &function_910ec836);
	var_db9e2dd = (isdefined(s_instance.var_fe2612fe[#"hash_1d0b38fd6d8376de"]) ? s_instance.var_fe2612fe[#"hash_1d0b38fd6d8376de"] : []);
	foreach(var_e24a3dff in var_db9e2dd)
	{
		var_77cb4212 = namespace_8b6a9d79::spawn_script_model(var_e24a3dff, #"hash_2313390b260dd0bc");
		var_77cb4212.var_e24a3dff = var_e24a3dff;
		var_e24a3dff.var_77cb4212 = var_77cb4212;
		var_77cb4212 val::set(#"hash_1d0b38fd6d8376de", "takedamage", 1);
		var_77cb4212 val::set(#"hash_1d0b38fd6d8376de", "allowdeath", 0);
		var_77cb4212.health = 1;
		var_77cb4212 thread function_33a937d1();
	}
	if(zm_utility::function_e3025ca5() >= 4)
	{
		var_2cc0d452 = [0:array::random(var_db9e2dd)];
		/#
			if(getdvarint(#"hash_4ad4c65169ae3c37", 0) > 0)
			{
				var_2cc0d452 = arraycopy(var_db9e2dd);
			}
		#/
		foreach(var_4684f38d in var_2cc0d452)
		{
			var_4684f38d flag::set(#"lucky");
			var_255f195e = var_4684f38d.var_fe2612fe[#"hash_17c776cd274246f7"][0];
			namespace_8b6a9d79::spawn_script_model(var_255f195e, #"hash_fdee149365a3a0a");
		}
	}
	level thread function_5b063814();
	level thread function_e86bf3f6();
}

/*
	Name: function_33a937d1
	Namespace: namespace_1b312da5
	Checksum: 0x518EE15
	Offset: 0xAC0
	Size: 0x204
	Parameters: 0
	Flags: Linked
*/
function function_33a937d1()
{
	self endon(#"death");
	while(true)
	{
		s_waitresult = undefined;
		s_waitresult = self waittill(#"damage");
		if((self.health - s_waitresult.amount) <= 0)
		{
			e_attacker = s_waitresult.attacker;
			if(isvehicle(e_attacker))
			{
				break;
			}
			else if(isplayer(e_attacker) && isalive(e_attacker))
			{
				e_attacker util::show_hit_marker();
				break;
			}
		}
	}
	playfx(#"hash_6a05a61d60674941", self.origin);
	var_9eb321a4 = #"hash_1f9d6c49bb7e687a";
	if(self.var_e24a3dff flag::get(#"lucky"))
	{
		var_9eb321a4 = #"hash_73fa5bac6acd4671";
	}
	s_spawn = {#scriptmodel:self, #hash_738dfc81:1, #angles:self.angles, #origin:self.origin};
	namespace_58949729::function_f82f361c(s_spawn, var_9eb321a4, 3);
	s_spawn struct::delete();
	self deletedelay();
}

/*
	Name: function_910ec836
	Namespace: namespace_1b312da5
	Checksum: 0xBCC5A82C
	Offset: 0xCD0
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_910ec836(s_params)
{
	if(isplayer(self) && s_params.item.var_a6762160.name === #"hash_7f84b365b2cc9223")
	{
		callback::remove_callback(#"on_item_pickup", &function_910ec836);
		level flag::set(#"hash_4b6a4d58908490c7");
	}
}

/*
	Name: function_5b063814
	Namespace: namespace_1b312da5
	Checksum: 0x62857834
	Offset: 0xD80
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_5b063814()
{
	level flag::wait_till(#"hash_4b6a4d58908490c7");
	var_7d8d1545 = struct::get(#"hash_11d094b3d64e7524");
	var_7d8d1545.var_a440edde = namespace_8b6a9d79::spawn_script_model(var_7d8d1545, #"tag_origin", 0, 0);
	var_7d8d1545.var_a440edde playloopsound(#"hash_7b112ed62e5af352");
	callback::add_callback(#"on_item_pickup", &function_87528dce);
	var_9489860d = struct::get(#"hash_408fe7cd53675acd");
	point = function_4ba8fde(#"hash_9853cc6c19e9098");
	item_drop::drop_item(0, undefined, 1, 0, point.id, var_9489860d.origin, var_9489860d.angles, 0);
}

/*
	Name: function_87528dce
	Namespace: namespace_1b312da5
	Checksum: 0x1239B14F
	Offset: 0xEE8
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_87528dce(s_params)
{
	if(isplayer(self) && s_params.item.var_a6762160.name === #"hash_9853cc6c19e9098")
	{
		callback::remove_callback(#"on_item_pickup", &function_87528dce);
		level flag::set(#"hash_389597c20633a9d8");
		var_7d8d1545 = struct::get(#"hash_11d094b3d64e7524");
		var_7d8d1545.var_a440edde stoploopsound();
		var_7d8d1545.var_a440edde deletedelay();
		playsoundatposition(#"hash_33e551681ec4e02b", var_7d8d1545.origin);
	}
}

/*
	Name: function_e86bf3f6
	Namespace: namespace_1b312da5
	Checksum: 0x6296E4A7
	Offset: 0x1020
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function function_e86bf3f6()
{
	var_a1823f64 = struct::get(#"hash_511f9212a15c3942");
	if(!isdefined(var_a1823f64))
	{
		return;
	}
	var_a1823f64.var_6d46fd65 = namespace_8b6a9d79::spawn_script_model(var_a1823f64, #"hash_57ffaf2f98a015ed");
	a_ents[#"hash_57fac357c7a82475"] = var_a1823f64.var_6d46fd65;
	var_a1823f64.var_6d46fd65 thread scene::play(#"hash_1adf1ed4ae576a63", "idle", a_ents);
	var_b2c833ba = struct::get(#"hash_5e482124870437aa");
	namespace_8b6a9d79::spawn_script_model(var_b2c833ba, #"p7_medical_surgical_cart_metal_03");
	level flag::wait_till(#"hash_389597c20633a9d8");
	namespace_8b6a9d79::function_214737c7(var_a1823f64, &function_f7af7970, #"");
}

/*
	Name: function_f7af7970
	Namespace: namespace_1b312da5
	Checksum: 0x696ADA56
	Offset: 0x1180
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_f7af7970(s_params)
{
	level thread function_3e5ee10c();
	self delete();
}

/*
	Name: function_3e5ee10c
	Namespace: namespace_1b312da5
	Checksum: 0x69ED76CD
	Offset: 0x11C8
	Size: 0x2C4
	Parameters: 0
	Flags: Linked
*/
function function_3e5ee10c()
{
	level clientfield::set("" + #"hash_1ff35e37755facac", 1);
	var_a1823f64 = struct::get(#"hash_511f9212a15c3942");
	a_ents[#"hash_57fac357c7a82475"] = var_a1823f64.var_6d46fd65;
	for(i = 0; i < 4; i++)
	{
		if(isdefined(var_a1823f64.var_c723c49e))
		{
			var_a1823f64.var_c723c49e hide();
		}
		var_a1823f64.var_6d46fd65 scene::play(#"hash_1adf1ed4ae576a63", "advance_slide", a_ents);
		switch(i)
		{
			case 0:
			{
				var_5495b01f = struct::get(#"hash_4b3167af52dc542a");
				var_a1823f64.var_c723c49e = namespace_8b6a9d79::spawn_script_model(var_5495b01f, #"hash_172b09aab70a65da", 0, 0);
				var_a1823f64.var_c723c49e setscale(0.7);
				break;
			}
			case 1:
			{
				var_a1823f64.var_c723c49e setmodel(#"hash_172b03aab70a5ba8");
				break;
			}
			case 2:
			{
				var_a1823f64.var_c723c49e setmodel(#"hash_172b05aab70a5f0e");
				break;
			}
			case 3:
			{
				var_a1823f64.var_c723c49e setmodel(#"hash_172b05aab70a5f0e");
				break;
			}
		}
		var_a1823f64.var_c723c49e show();
		wait(4);
	}
	level clientfield::set("" + #"hash_1ff35e37755facac", 2);
}

/*
	Name: function_7c583c30
	Namespace: namespace_1b312da5
	Checksum: 0xE71A708C
	Offset: 0x1498
	Size: 0x700
	Parameters: 1
	Flags: Linked
*/
function function_7c583c30(s_instance)
{
	/#
		if(getdvarint(#"hash_153275e5b2bd9972", 0))
		{
			s_instance flag::set(#"hash_70b6311d703afa2e");
			s_instance.starttrigger triggerenable(0);
			s_instance.starttrigger.origin = s_instance.starttrigger.origin - vectorscale((0, 0, 1), 2048);
			var_6bc2752 = s_instance.var_fe2612fe[#"debug_start"][0];
			objective_setposition(s_instance.var_e55c8b4e, var_6bc2752.origin);
			a_s_start = (isdefined(s_instance.var_fe2612fe[#"start"]) ? s_instance.var_fe2612fe[#"start"] : []);
			foreach(s_start in a_s_start)
			{
				if(!is_true(s_start.b_guns))
				{
					str_fx = #"hash_194fead3457d21f5";
					str_hint = #"hash_d5017e9a504063f";
				}
				else
				{
					str_fx = #"hash_7b7ba0ac0755a064";
					str_hint = #"hash_6126df53cb8cea89";
				}
				s_start.var_360148 = namespace_8b6a9d79::spawn_script_model(s_start, #"tag_origin");
				playfxontag(str_fx, s_start.var_360148, "");
				s_start.t_start = namespace_8b6a9d79::function_214737c7(s_start, &function_fd8dcbe8, str_hint);
				s_start.t_start usetriggerrequirelookat(0);
				s_start.t_start.s_instance = s_instance;
				s_start.t_start.b_guns = s_start.b_guns;
				s_start.var_360148 bobbing((0, 0, 1), 7, 4);
			}
			return;
		}
	#/
	level clientfield::set("" + #"hash_1ff35e37755facac", 3);
	s_instance.starttrigger usetriggerrequirelookat(0);
	a_s_blockers = (isdefined(s_instance.var_fe2612fe[#"blocker"]) ? s_instance.var_fe2612fe[#"blocker"] : []);
	foreach(s_blocker in a_s_blockers)
	{
		if(isdefined(s_blocker.model))
		{
			switch(s_blocker.model)
			{
				case "hash_6128aa13628ae467":
				{
					str_model = #"hash_6128aa13628ae467";
					break;
				}
			}
			if(isdefined(str_model))
			{
				s_blocker.mdl_blocker = util::spawn_model(str_model, s_blocker.origin, s_blocker.angles);
				s_blocker.mdl_blocker disconnectpaths();
			}
		}
		if(!is_true(s_blocker.var_974d1fda))
		{
			s_blocker.radius = float((isdefined(s_blocker.radius) ? s_blocker.radius : 60));
			foreach(dyn in function_c3d68575(s_blocker.origin, (s_blocker.radius, s_blocker.radius, s_blocker.radius)))
			{
				bundle = function_489009c1(dyn);
				if(isdefined(bundle.destroyed) && isdefined(dyn.health))
				{
					dyn dodamage(dyn.health, dyn.origin, undefined, undefined, "none", "MOD_EXPLOSIVE");
					continue;
				}
				function_e2a06860(dyn, bundle.dynentstates.size - 1);
			}
		}
	}
	var_ef3728d2 = getentarray("mdl_sr_ee_hulk_blocker_brush", "targetname");
	foreach(var_6da4f2bd in var_ef3728d2)
	{
		var_6da4f2bd.origin = var_6da4f2bd.origin + (0, 0, 2048);
		var_6da4f2bd disconnectpaths();
	}
}

/*
	Name: function_fd8dcbe8
	Namespace: namespace_1b312da5
	Checksum: 0x18879E0
	Offset: 0x1BA0
	Size: 0x26C
	Parameters: 1
	Flags: None
*/
function function_fd8dcbe8(s_params)
{
	s_instance = self.s_instance;
	a_s_start = (isdefined(s_instance.var_fe2612fe[#"start"]) ? s_instance.var_fe2612fe[#"start"] : []);
	foreach(s_start in a_s_start)
	{
		s_start.t_start triggerenable(0);
		s_start.t_start deletedelay();
	}
	if(is_true(self.b_guns))
	{
		foreach(e_player in function_a1ef346b())
		{
			if(isalive(e_player))
			{
				e_player function_ac0a88f7();
			}
		}
	}
	foreach(s_start in a_s_start)
	{
		s_start.var_360148 delete();
	}
	level thread function_86fbcb7e(s_instance, 1);
}

/*
	Name: function_ac0a88f7
	Namespace: namespace_1b312da5
	Checksum: 0x82CAEFDC
	Offset: 0x1E18
	Size: 0x2F8
	Parameters: 0
	Flags: Linked
*/
function function_ac0a88f7()
{
	self endon(#"death");
	a_str_perks = [];
	foreach(var_50846129 in level.var_c723ac75)
	{
		if(!isdefined(a_str_perks))
		{
			a_str_perks = [];
		}
		else if(!isarray(a_str_perks))
		{
			a_str_perks = array(a_str_perks);
		}
		a_str_perks[a_str_perks.size] = str_perk;
	}
	a_str_perks = array::randomize(a_str_perks);
	array::push_front(a_str_perks, #"hash_47d7a8105237c88");
	var_6013cb70 = 0;
	while(var_6013cb70 < 2 && a_str_perks.size > 0)
	{
		var_e7d935ed = a_str_perks[0];
		arrayremoveindex(a_str_perks, 0);
		str_perk = self namespace_791d0451::function_b852953c(var_e7d935ed);
		if(!self namespace_791d0451::function_56cedda7(str_perk))
		{
			self namespace_791d0451::function_3fecad82(str_perk, 0);
			var_6013cb70++;
		}
	}
	self namespace_dd7e54e3::give_armor(#"hash_7777b2b5970da847");
	foreach(w_weapon in self getweaponslistprimaries())
	{
		item = item_inventory::function_230ceec4(w_weapon);
		if(isdefined(item) && item.var_bd027dd9 != 32767 && !killstreaks::is_killstreak_weapon(w_weapon) && !namespace_4b9fccd8::function_ef9d58d0(item))
		{
			self item_inventory::function_73ae3380(item, 1);
		}
	}
}

/*
	Name: function_86fbcb7e
	Namespace: namespace_1b312da5
	Checksum: 0x42075FF3
	Offset: 0x2118
	Size: 0x37C
	Parameters: 2
	Flags: Linked
*/
function function_86fbcb7e(s_instance, b_debug)
{
	if(!isdefined(b_debug))
	{
		b_debug = 0;
	}
	if(b_debug)
	{
		foreach(e_player in function_a1ef346b())
		{
			e_player val::set(#"hash_6eb00b16d3628642", "takedamage", 0);
			e_player val::set(#"hash_6eb00b16d3628642", "allowdeath", 0);
			e_player val::set(#"hash_6eb00b16d3628642", "ignoreme", 1);
		}
		namespace_ce1f29cc::function_368a7cde();
		level flag::clear(#"hash_44074059e3987765");
		foreach(ai in getaiarray())
		{
			ai deletedelay();
		}
		lui::screen_fade_out(2, "white");
		wait(0.5);
		level scene::init(#"hash_55efe66493d75543");
		wait(1);
		level thread lui::screen_fade_in(2, "white");
		wait(2);
		b_triggered = 0;
		foreach(e_player in function_a1ef346b())
		{
			if(!b_triggered && zm_utility::is_player_valid(e_player))
			{
				b_triggered = 1;
				s_instance.starttrigger callback::callback(#"on_trigger", {#activator:e_player});
			}
			e_player thread function_8f246228();
		}
	}
	level scene::play(#"hash_55efe66493d75543");
}

/*
	Name: function_8f246228
	Namespace: namespace_1b312da5
	Checksum: 0xB0AE1AD0
	Offset: 0x24A0
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_8f246228()
{
	self endon(#"death");
	self flag::wait_till(#"scene");
	self flag::wait_till_clear(#"scene");
	self val::reset_all(#"hash_6eb00b16d3628642");
}

/*
	Name: function_b6b9b6e6
	Namespace: namespace_1b312da5
	Checksum: 0x4B1BDC8D
	Offset: 0x2528
	Size: 0x7B4
	Parameters: 2
	Flags: Linked
*/
function function_b6b9b6e6(s_instance, e_player)
{
	/#
		if(s_instance flag::get(#"hash_70b6311d703afa2e"))
		{
			level thread function_db60d774(s_instance);
			return;
		}
	#/
	s_lock = s_instance.var_fe2612fe[#"lock"][0];
	var_8861fa85 = zm_sq::objective_set(#"hash_66884519b9716488", s_lock);
	s_lock.n_obj_id = var_8861fa85[0];
	callback::on_spawned(&function_4b5147fe);
	foreach(e_player in function_a1ef346b())
	{
		e_player thread function_4b5147fe();
	}
	s_lock.var_3e1b52d5 = namespace_8b6a9d79::function_214737c7(s_lock, &function_a998b7a0, #"hash_52da8aeb6366964");
	s_lock.var_3e1b52d5.s_instance = s_instance;
	var_89d8ddb9 = s_instance.var_fe2612fe[#"hash_369c62a53eb3da90"][0];
	zm_sq::objective_set(#"hash_722dd0d6df1704a0", var_89d8ddb9, 0, #"hash_44648ec2e6c0f486", #"explode");
	level thread objective_manager::start_timer(5);
	s_explode = s_instance.var_fe2612fe[#"hash_3966465c498df3a6"][0];
	var_183885ec = util::spawn_model(#"p9_fxanim_zm_ndu_essence_bomb_body_mod", s_explode.origin, s_explode.angles);
	var_183885ec function_97e39c34();
	var_183885ec showpart("tag_slot1_digi_0");
	var_183885ec showpart("tag_slot3_digi_0");
	var_183885ec showpart("tag_slot4_digi_0");
	for(i = 0; i < 5; i++)
	{
		str_tag = "tag_slot2_digi_" + (5 - i);
		var_183885ec showpart(str_tag);
		var_183885ec showpart("tag_sign");
		wait(0.5);
		var_183885ec hidepart("tag_sign");
		wait(0.5);
		var_183885ec hidepart(str_tag);
	}
	playfx(#"hash_122277729dcbecd2", s_explode.origin);
	var_183885ec delete();
	level clientfield::set("" + #"hash_1ff35e37755facac", 4);
	var_234f6dad = getent("mdl_sr_ee_hulk_drop", "targetname");
	var_234f6dad delete();
	wait(1);
	zm_sq::objective_complete(#"explode");
	var_3ec71cdc = s_instance.var_fe2612fe[#"hash_2bf01a38c96560a3"][0];
	zm_sq::objective_set(#"hash_40a57b9cd878085b", var_3ec71cdc, 0, #"hash_4086732556bb14d", #"enter");
	var_32ebc528 = s_instance.var_fe2612fe[#"enter"][0];
	var_f059ae2a = 0;
	while(!var_f059ae2a)
	{
		waitframe(1);
		foreach(e_player in function_a1ef346b())
		{
			if(zm_utility::is_player_valid(e_player) && (abs(e_player.origin[2] - var_32ebc528.origin[2])) <= 100)
			{
				var_f059ae2a = 1;
				break;
			}
		}
	}
	zm_sq::objective_complete(#"enter");
	var_d9e2a479 = s_instance.var_fe2612fe[#"search"][0];
	zm_sq::objective_set(#"hash_b418b036831ea2a", var_d9e2a479, 0, #"hash_6ec7fa5aeb44ce09", #"search");
	var_d9e2a479.radius = float(var_d9e2a479.radius);
	b_found = 0;
	while(!b_found)
	{
		waitframe(1);
		foreach(e_player in function_a1ef346b(undefined, var_d9e2a479.origin, var_d9e2a479.radius))
		{
			if(zm_utility::is_player_valid(e_player))
			{
				b_found = 1;
				break;
			}
		}
	}
	zm_sq::objective_complete(#"search");
}

/*
	Name: function_4b5147fe
	Namespace: namespace_1b312da5
	Checksum: 0xA6FCACC5
	Offset: 0x2CE8
	Size: 0x170
	Parameters: 0
	Flags: Linked
*/
function function_4b5147fe()
{
	self notify("348671186b78c9e0");
	self endon("348671186b78c9e0");
	self endon(#"death");
	s_instance = level.var_7d45d0d4.var_3385b421;
	if(!s_instance flag::get(#"hash_3bdf681d1906d7e5"))
	{
		s_instance endon(#"hash_3bdf681d1906d7e5");
		s_lock = s_instance.var_fe2612fe[#"lock"][0];
		n_obj_id = s_lock.n_obj_id;
		var_e4bf4e4 = getent(s_lock.targetname, "target");
		while(true)
		{
			while(self istouching(var_e4bf4e4))
			{
				waitframe(1);
			}
			objective_setinvisibletoplayer(n_obj_id, self);
			while(!self istouching(var_e4bf4e4))
			{
				waitframe(1);
			}
			objective_setvisibletoplayer(n_obj_id, self);
		}
	}
}

/*
	Name: function_a998b7a0
	Namespace: namespace_1b312da5
	Checksum: 0xB65E02AA
	Offset: 0x2E60
	Size: 0x2FC
	Parameters: 1
	Flags: Linked
*/
function function_a998b7a0(s_params)
{
	self triggerenable(0);
	s_instance = self.s_instance;
	s_instance flag::set(#"hash_3bdf681d1906d7e5");
	callback::remove_on_spawned(&function_4b5147fe);
	zm_sq::objective_complete(#"hash_66884519b9716488");
	a_s_blockers = (isdefined(s_instance.var_fe2612fe[#"blocker"]) ? s_instance.var_fe2612fe[#"blocker"] : []);
	foreach(s_blocker in a_s_blockers)
	{
		if(isdefined(s_blocker.mdl_blocker) && !is_true(s_blocker.var_2561faba))
		{
			s_blocker.mdl_blocker movez(80, 6);
		}
	}
	var_ef3728d2 = getentarray("mdl_sr_ee_hulk_blocker_brush", "targetname");
	foreach(var_6da4f2bd in var_ef3728d2)
	{
		if(!isdefined(var_6da4f2bd.var_1d8bbbf6) || !isdefined(var_6da4f2bd.n_time))
		{
			var_6da4f2bd delete();
			continue;
		}
		var_6da4f2bd.var_1d8bbbf6 = float(var_6da4f2bd.var_1d8bbbf6);
		var_6da4f2bd.n_time = float(var_6da4f2bd.n_time);
		var_6da4f2bd movez(var_6da4f2bd.var_1d8bbbf6, var_6da4f2bd.n_time);
	}
	self deletedelay();
}

/*
	Name: function_97e39c34
	Namespace: namespace_1b312da5
	Checksum: 0x9B454AFB
	Offset: 0x3168
	Size: 0x384
	Parameters: 0
	Flags: Linked
*/
function function_97e39c34()
{
	self hidepart("tag_slot1_digi_0");
	self hidepart("tag_slot1_digi_1");
	self hidepart("tag_slot2_digi_0");
	self hidepart("tag_slot2_digi_1");
	self hidepart("tag_slot2_digi_2");
	self hidepart("tag_slot2_digi_3");
	self hidepart("tag_slot2_digi_4");
	self hidepart("tag_slot2_digi_5");
	self hidepart("tag_slot2_digi_6");
	self hidepart("tag_slot2_digi_7");
	self hidepart("tag_slot2_digi_8");
	self hidepart("tag_slot2_digi_9");
	self hidepart("tag_slot3_digi_0");
	self hidepart("tag_slot3_digi_1");
	self hidepart("tag_slot3_digi_2");
	self hidepart("tag_slot3_digi_3");
	self hidepart("tag_slot3_digi_4");
	self hidepart("tag_slot3_digi_5");
	self hidepart("tag_slot4_digi_0");
	self hidepart("tag_slot4_digi_1");
	self hidepart("tag_slot4_digi_2");
	self hidepart("tag_slot4_digi_3");
	self hidepart("tag_slot4_digi_4");
	self hidepart("tag_slot4_digi_5");
	self hidepart("tag_slot4_digi_6");
	self hidepart("tag_slot4_digi_7");
	self hidepart("tag_slot4_digi_8");
	self hidepart("tag_slot4_digi_9");
}

/*
	Name: function_db60d774
	Namespace: namespace_1b312da5
	Checksum: 0xE8B90FF1
	Offset: 0x34F8
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_db60d774(s_instance)
{
	s_instance.var_4a53ac3 = 50;
	s_instance.var_db03ba6b = 60;
	s_instance.var_b287ebc5 = 75;
	s_instance.var_ff8f632d = 25;
	s_instance.var_60d272ab = 0;
	function_e408a8af(s_instance);
	function_ef891f45(s_instance, #"static", 1);
	level thread function_99142075(s_instance);
	level thread function_a735633b(s_instance);
	s_instance flag::wait_till_any([1:#"failed", 0:#"succeeded"]);
}

/*
	Name: function_a735633b
	Namespace: namespace_1b312da5
	Checksum: 0x719471FA
	Offset: 0x3600
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_a735633b(s_instance)
{
	s_instance endon(#"succeeded");
	wait(5);
	objective_manager::start_timer(int(min(540, 600)));
	s_instance flag::set(#"failed");
}

/*
	Name: function_e408a8af
	Namespace: namespace_1b312da5
	Checksum: 0x810D697F
	Offset: 0x3690
	Size: 0x6CE
	Parameters: 1
	Flags: Linked
*/
function function_e408a8af(s_instance)
{
	level clientfield::set("" + #"hash_1ff35e37755facac", 5);
	var_be0691ad = getentarray("mdl_hulk_beast_view", "targetname");
	foreach(var_616de5dc in var_be0691ad)
	{
		a_info = [];
		a_info[#"model"] = var_616de5dc;
		a_info[#"origin"] = var_616de5dc.origin;
		a_info[#"angles"] = var_616de5dc.angles;
		s_instance.var_4cd68ffe[var_616de5dc.script_noteworthy] = a_info;
		var_616de5dc hide();
	}
	var_5f5c7cc9 = s_instance.var_4cd68ffe[#"static"][#"model"];
	s_instance.var_2b08d972 = #"static";
	a_s_cracks = struct::get_array(var_5f5c7cc9.target);
	foreach(s_crack in a_s_cracks)
	{
		str_model = #"p8_zm_red_dks_chaos_crystal_cluster_sml_01b";
		if(s_crack.model == #"hash_31150cf4ae726381")
		{
			str_model = #"hash_31150cf4ae726381";
		}
		var_ff2636d3 = util::spawn_model(str_model, s_crack.origin, s_crack.angles);
		var_ff2636d3 function_619a5c20();
		if(isdefined(s_crack.modelscale))
		{
			var_ff2636d3 setscale(float(s_crack.modelscale));
		}
		var_ff2636d3 linkto(var_5f5c7cc9);
		var_ff2636d3 thread function_48833eab();
		s_instance.var_a455ba34[s_crack.script_int] = var_ff2636d3;
	}
	foreach(var_3bd552f in [])
	{
		s_instance.var_c9def52d[var_3bd552f.script_int] = var_3bd552f;
	}
	var_3bd552f = s_instance.var_c9def52d[1];
	var_d28d9501 = var_3bd552f.var_fe2612fe[#"view"][0];
	var_5f5c7cc9 dontinterpolate();
	var_5f5c7cc9.origin = var_d28d9501.origin;
	var_5f5c7cc9.angles = var_d28d9501.angles;
	var_5f5c7cc9 show();
	s_instance.var_2ac574c1 = var_5f5c7cc9;
	s_instance.var_92418447 = var_3bd552f;
	function_f1c971f8(s_instance);
	foreach(var_6e5b2d0d in [])
	{
		switch(var_6e5b2d0d.model)
		{
			case "hash_7044c2ad444e3901":
			{
				str_model = #"hash_7044c2ad444e3901";
				break;
			}
			case "hash_2f81d755d60576ed":
			{
				str_model = #"hash_2f81d755d60576ed";
				break;
			}
			case "hash_1b2f38a1fb4170b2":
			{
				str_model = #"hash_1b2f38a1fb4170b2";
				break;
			}
			case "hash_3b8a24bc259e5fed":
			{
				str_model = #"hash_3b8a24bc259e5fed";
				break;
			}
		}
		var_adef30f8 = util::spawn_model(str_model, var_6e5b2d0d.origin, var_6e5b2d0d.angles);
		s_instance.var_ea5eb836[var_6e5b2d0d.script_int] = var_adef30f8;
		mdl_clip = getent(var_6e5b2d0d.targetname, "target");
		mdl_clip.origin = mdl_clip.origin + (0, 0, 4096);
		mdl_clip disconnectpaths();
		var_adef30f8.mdl_clip = mdl_clip;
	}
}

/*
	Name: function_10ebe761
	Namespace: namespace_1b312da5
	Checksum: 0xF6EC2167
	Offset: 0x3D68
	Size: 0x534
	Parameters: 2
	Flags: Linked
*/
function function_10ebe761(s_instance, var_9161d39c)
{
	if(!isdefined(var_9161d39c))
	{
		var_9161d39c = "";
	}
	if(s_instance flag::get(#"hash_30fdb94435464bba"))
	{
		level thread function_e2ada674(s_instance);
		return;
	}
	var_3bd552f = s_instance.var_92418447;
	var_b113347a = var_3bd552f.var_fe2612fe[#"hash_3d3744e25faabfc5"][0];
	var_9f22f1ef = 0;
	foreach(e_player in function_a1ef346b(undefined, var_b113347a.origin, 256))
	{
		if(zm_utility::is_player_valid(e_player))
		{
			var_9f22f1ef = 1;
			break;
		}
	}
	if(var_9f22f1ef)
	{
		if(math::cointoss(s_instance.var_4a53ac3))
		{
			s_instance.var_4a53ac3 = 50;
			level thread function_99142075(s_instance);
			return;
		}
		s_instance.var_4a53ac3 = min(100, s_instance.var_4a53ac3 + 5);
	}
	if(s_instance flag::get(#"hash_62264be933a95dea"))
	{
		if(!s_instance flag::get(#"hash_3287ab347d542c5f"))
		{
			s_instance flag::set(#"hash_3287ab347d542c5f");
			level thread function_7d7508e1(s_instance);
			return;
		}
		var_83c61a2f = 1;
		var_a4f2512f = var_3bd552f.var_fe2612fe[#"hash_1a3b20cdbde37b30"][0];
		foreach(e_player in function_a1ef346b(undefined, var_a4f2512f.origin, 2000))
		{
			if(zm_utility::is_player_valid(e_player))
			{
				var_83c61a2f = 0;
				break;
			}
		}
		if(var_83c61a2f)
		{
			s_instance.var_ff8f632d = min(100, s_instance.var_ff8f632d + 25);
		}
		if(math::cointoss(s_instance.var_ff8f632d))
		{
			s_instance.var_ff8f632d = 25;
			level thread function_7d7508e1(s_instance);
			return;
		}
		if(!var_83c61a2f)
		{
			s_instance.var_ff8f632d = min(100, s_instance.var_ff8f632d + 5);
		}
	}
	if(s_instance flag::get(#"hash_28fc39d01e613e67"))
	{
		if(function_c8e09e6a(s_instance) && math::cointoss(s_instance.var_db03ba6b))
		{
			s_instance.var_db03ba6b = 60;
			level thread function_450200ab(s_instance);
			return;
		}
		s_instance.var_db03ba6b = min(100, s_instance.var_db03ba6b + 10);
	}
	if(function_b252d34d() > 0)
	{
		if(math::cointoss(s_instance.var_b287ebc5))
		{
			s_instance.var_b287ebc5 = 75;
			level thread function_99142075(s_instance);
			return;
		}
		s_instance.var_b287ebc5 = min(100, s_instance.var_b287ebc5 + 5);
	}
	wait(1);
	level thread function_10ebe761(s_instance, var_9161d39c);
}

/*
	Name: function_392aeaef
	Namespace: namespace_1b312da5
	Checksum: 0x6AC89456
	Offset: 0x42A8
	Size: 0x13C
	Parameters: 2
	Flags: Linked
*/
function function_392aeaef(s_instance, var_9161d39c)
{
	if(!isdefined(var_9161d39c))
	{
		var_9161d39c = "";
	}
	switch(var_9161d39c)
	{
		default:
		{
			var_2c9106c1 = 0;
			var_c5751036 = 5;
			var_14544f3 = 15;
			break;
		}
		case "area":
		{
			var_2c9106c1 = 1;
			var_c5751036 = 5;
			var_14544f3 = 15;
			break;
		}
		case "yell":
		{
			var_2c9106c1 = 1;
			var_c5751036 = 5;
			var_14544f3 = 15;
			break;
		}
	}
	if(var_2c9106c1 && function_b252d34d() > 0)
	{
		var_c5751036 = 1;
		var_14544f3 = 2;
	}
	s_instance flag::wait_till_timeout(randomfloatrange(var_c5751036, var_14544f3), #"hash_30fdb94435464bba");
}

/*
	Name: function_ef891f45
	Namespace: namespace_1b312da5
	Checksum: 0x26871318
	Offset: 0x43F0
	Size: 0xEE
	Parameters: 3
	Flags: Linked
*/
function function_ef891f45(s_instance, str_pose, n_stop)
{
	if(!isdefined(n_stop))
	{
		var_3bd552f = s_instance.var_92418447;
	}
	else
	{
		var_3bd552f = s_instance.var_c9def52d[n_stop];
	}
	var_7c0ce44b = #"view";
	if(str_pose == #"hash_30fdb94435464bba")
	{
		var_7c0ce44b = #"hash_30fdb94435464bba";
	}
	var_d28d9501 = var_3bd552f.var_fe2612fe[var_7c0ce44b][0];
	var_616de5dc = function_6ee26472(s_instance, str_pose, var_d28d9501.origin, var_d28d9501.angles);
	s_instance.var_92418447 = var_3bd552f;
	return var_616de5dc;
}

/*
	Name: function_6ee26472
	Namespace: namespace_1b312da5
	Checksum: 0x388476D3
	Offset: 0x44E8
	Size: 0x2D8
	Parameters: 4
	Flags: Linked
*/
function function_6ee26472(s_instance, str_pose, v_origin, v_angles)
{
	s_instance.var_2ac574c1 unlink();
	var_616de5dc = s_instance.var_4cd68ffe[str_pose][#"model"];
	var_616de5dc show();
	var_9288cfd3 = struct::get_array(var_616de5dc.target);
	foreach(s_piece in var_9288cfd3)
	{
		if(s_piece.content_key === #"dig")
		{
			if(!isdefined(var_616de5dc.var_31b025b5))
			{
				var_616de5dc.var_31b025b5 = util::spawn_model(#"tag_origin", s_piece.origin, s_piece.angles);
				var_616de5dc.var_31b025b5 linkto(var_616de5dc);
			}
			continue;
		}
		if(isdefined(s_piece.script_int))
		{
			var_ff2636d3 = s_instance.var_a455ba34[s_piece.script_int];
			if(isdefined(var_ff2636d3) && var_ff2636d3.health > 0)
			{
				var_ff2636d3.origin = s_piece.origin;
				var_ff2636d3.angles = s_piece.angles;
				var_ff2636d3 linkto(var_616de5dc);
			}
		}
	}
	var_616de5dc.origin = v_origin;
	var_616de5dc.angles = v_angles;
	a_info = s_instance.var_4cd68ffe[s_instance.var_2b08d972];
	s_instance.var_2ac574c1.origin = a_info[#"origin"];
	s_instance.var_2ac574c1.angles = a_info[#"angles"];
	s_instance.var_2ac574c1 hide();
	s_instance.var_2b08d972 = str_pose;
	s_instance.var_2ac574c1 = var_616de5dc;
	function_f1c971f8(s_instance);
	return var_616de5dc;
}

/*
	Name: function_f1c971f8
	Namespace: namespace_1b312da5
	Checksum: 0x44533AD0
	Offset: 0x47C8
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function function_f1c971f8(s_instance)
{
	var_767362c3 = s_instance.var_2ac574c1 gettagorigin("j_head");
	var_3bd552f = s_instance.var_92418447;
	s_anchor = var_3bd552f.var_fe2612fe[#"anchor"][0];
	v_up = anglestoup(s_anchor.angles);
	var_767362c3 = var_767362c3 - (v_up * 20);
	s_instance.var_767362c3 = var_767362c3;
}

/*
	Name: function_48833eab
	Namespace: namespace_1b312da5
	Checksum: 0xE2C5FA1E
	Offset: 0x4888
	Size: 0x1DA
	Parameters: 0
	Flags: Linked
*/
function function_48833eab()
{
	self endoncallback(&function_8cf0e2c, #"death");
	self val::set(#"hash_48d5e7de1ef41436", "takedamage", 1);
	switch(function_a1ef346b().size)
	{
		default:
		{
			n_health = 10000;
			break;
		}
		case 2:
		{
			n_health = 15000;
			break;
		}
		case 3:
		{
			n_health = 20000;
			break;
		}
		case 4:
		{
			n_health = 25000;
			break;
		}
	}
	self.health = n_health;
	while(true)
	{
		s_waitresult = undefined;
		s_waitresult = self waittill(#"damage");
		n_amount = s_waitresult.amount;
		e_player = s_waitresult.attacker;
		if(isplayer(e_player))
		{
			e_player util::show_hit_marker(self.health <= 0);
			level thread function_f010e60f((isdefined(s_waitresult.position) ? s_waitresult.position : self.origin));
		}
		else
		{
			self.health = self.health + n_amount;
		}
	}
}

/*
	Name: function_8cf0e2c
	Namespace: namespace_1b312da5
	Checksum: 0xFAA64611
	Offset: 0x4A70
	Size: 0x18C
	Parameters: 1
	Flags: Linked
*/
function function_8cf0e2c(str_notify)
{
	self ghost();
	var_183885ec = util::spawn_model(#"tag_origin", self.origin, self.angles);
	playfxontag(#"hash_49fac56c5087e005", var_183885ec, "tag_origin");
	s_instance = level.var_7d45d0d4.var_3385b421;
	s_instance.var_60d272ab++;
	var_adef30f8 = s_instance.var_ea5eb836[s_instance.var_60d272ab];
	level thread function_469d6ad9(var_adef30f8);
	s_instance flag::set(#"hash_62264be933a95dea");
	if(s_instance.var_60d272ab >= 2 && !s_instance flag::get(#"flipped"))
	{
		function_e08d51cb(s_instance);
	}
	wait(5);
	var_183885ec delete();
	self deletedelay();
}

/*
	Name: function_469d6ad9
	Namespace: namespace_1b312da5
	Checksum: 0x5D3A04F3
	Offset: 0x4C08
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_469d6ad9(var_adef30f8)
{
	wait(1);
	if(isdefined(var_adef30f8.mdl_clip))
	{
		var_adef30f8.mdl_clip delete();
	}
	if(isdefined(var_adef30f8))
	{
		var_adef30f8 delete();
	}
}

/*
	Name: function_f010e60f
	Namespace: namespace_1b312da5
	Checksum: 0x55AFB1D9
	Offset: 0x4C70
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_f010e60f(v_origin)
{
	if(level flag::get(#"hash_513b1cdc06d05486"))
	{
		return;
	}
	level flag::set(#"hash_513b1cdc06d05486");
	level thread function_3cb9186e();
	mdl_fx = util::spawn_model(#"tag_origin", v_origin);
	mdl_fx clientfield::set("" + #"hash_1aba59a4e6f9fc9d", 1);
	wait(2);
	mdl_fx clientfield::set("" + #"hash_1aba59a4e6f9fc9d", 0);
	wait(1);
	mdl_fx delete();
}

/*
	Name: function_3cb9186e
	Namespace: namespace_1b312da5
	Checksum: 0xBC10BD75
	Offset: 0x4D98
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_3cb9186e()
{
	util::wait_network_frame();
	level flag::clear(#"hash_513b1cdc06d05486");
}

/*
	Name: function_450200ab
	Namespace: namespace_1b312da5
	Checksum: 0x8193E45A
	Offset: 0x4DD8
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function function_450200ab(s_instance)
{
	function_ef891f45(s_instance, #"hash_2e5297571da36e70");
	wait(3);
	function_ef891f45(s_instance, #"static");
	level thread function_2c2be0d6(s_instance);
	wait(5);
	level notify(#"hash_774dd5cdde2a4509");
	function_392aeaef(s_instance, #"yell");
	s_instance.var_db03ba6b = 0;
	level thread function_10ebe761(s_instance, #"yell");
}

/*
	Name: function_2c2be0d6
	Namespace: namespace_1b312da5
	Checksum: 0x4F529573
	Offset: 0x4EC0
	Size: 0x3A0
	Parameters: 1
	Flags: Linked
*/
function function_2c2be0d6(s_instance)
{
	level endoncallback(&function_53548032, #"hash_774dd5cdde2a4509");
	var_3bd552f = s_instance.var_92418447;
	s_anchor = var_3bd552f.var_fe2612fe[#"anchor"][0];
	playrumbleonposition(#"hash_64aefa647b1698fb", s_anchor.origin);
	callback::on_spawned(&function_a756e2d5);
	callback::on_spawned(&function_6a66d59c);
	foreach(e_player in function_a1ef346b())
	{
		e_player thread function_a756e2d5();
		e_player thread function_6a66d59c();
	}
	v_up = anglestoup(s_anchor.angles);
	v_forward = anglestoforward(s_anchor.angles);
	v_right = anglestoright(s_anchor.angles);
	var_767362c3 = s_instance.var_767362c3;
	while(true)
	{
		var_196306b3 = v_up * randomfloat(8);
		if(math::cointoss())
		{
			var_196306b3 = var_196306b3 * -1;
		}
		var_82747a68 = var_767362c3 + var_196306b3;
		var_32a345cc = v_right * randomfloat(8);
		if(math::cointoss())
		{
			var_32a345cc = var_32a345cc * -1;
		}
		var_82747a68 = var_82747a68 + var_32a345cc;
		var_7fd8e505 = var_82747a68 + (v_forward * randomfloatrange(300, 1800));
		var_edd14ca = v_right * randomfloat(400);
		if(math::cointoss())
		{
			var_edd14ca = var_edd14ca * -1;
		}
		var_7fd8e505 = var_7fd8e505 + var_edd14ca;
		var_7fd8e505 = function_9cc082d2(var_7fd8e505, 2048)[#"point"];
		if(isdefined(var_7fd8e505))
		{
			level thread function_d5a3649b(var_82747a68, var_7fd8e505);
		}
		wait(0.1);
	}
}

/*
	Name: function_53548032
	Namespace: namespace_1b312da5
	Checksum: 0xDB937EF7
	Offset: 0x5268
	Size: 0xD8
	Parameters: 1
	Flags: Linked
*/
function function_53548032(str_notify)
{
	callback::remove_on_spawned(&function_a756e2d5);
	callback::remove_on_spawned(&function_6a66d59c);
	foreach(e_player in getplayers())
	{
		e_player function_53d0c1f7();
	}
}

/*
	Name: function_d5a3649b
	Namespace: namespace_1b312da5
	Checksum: 0x87EB137
	Offset: 0x5348
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_d5a3649b(v_start, v_end)
{
	mdl_fx = util::spawn_model(#"tag_origin", v_start);
	playfxontag(#"blood/fx_blood_trail_lg_zmb", mdl_fx, "tag_origin");
	n_time = mdl_fx zm_utility::fake_physicslaunch(v_end, 1500);
	wait(n_time);
	playfx(#"hash_6798e5226d9ae470", v_end);
	mdl_fx delete();
}

/*
	Name: function_c8e09e6a
	Namespace: namespace_1b312da5
	Checksum: 0x9B8B78ED
	Offset: 0x5428
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_c8e09e6a(s_instance)
{
	var_78d1a23a = getent("vol_sr_ee_hulk_beast_blood", "targetname");
	var_616de5dc = s_instance.var_2ac574c1;
	var_767362c3 = s_instance.var_767362c3;
	foreach(e_player in function_a1ef346b())
	{
		if(zm_utility::is_player_valid(e_player) && e_player istouching(var_78d1a23a) && bullettracepassed(var_767362c3, e_player getcentroid(), 0, e_player, var_616de5dc))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_a756e2d5
	Namespace: namespace_1b312da5
	Checksum: 0x248494BE
	Offset: 0x5578
	Size: 0x15A
	Parameters: 0
	Flags: Linked
*/
function function_a756e2d5()
{
	level endon(#"hash_774dd5cdde2a4509");
	self endon(#"death");
	wait(1);
	var_78d1a23a = getent("vol_sr_ee_hulk_beast_blood", "targetname");
	s_instance = level.var_7d45d0d4.var_3385b421;
	var_616de5dc = s_instance.var_2ac574c1;
	var_767362c3 = s_instance.var_767362c3;
	while(true)
	{
		while(!self istouching(var_78d1a23a))
		{
			waitframe(1);
		}
		while(self istouching(var_78d1a23a))
		{
			if(zm_utility::is_player_valid(self) && bullettracepassed(var_767362c3, self getcentroid(), 0, self, var_616de5dc))
			{
				self dodamage(50, var_767362c3);
			}
			wait(1);
		}
	}
}

/*
	Name: function_6a66d59c
	Namespace: namespace_1b312da5
	Checksum: 0x6F24370C
	Offset: 0x56E0
	Size: 0x170
	Parameters: 0
	Flags: Linked
*/
function function_6a66d59c()
{
	level endon(#"hash_774dd5cdde2a4509");
	self endoncallback(&function_53d0c1f7, #"death");
	s_instance = level.var_7d45d0d4.var_3385b421;
	var_3bd552f = s_instance.var_92418447;
	s_anchor = var_3bd552f.var_fe2612fe[#"anchor"][0];
	while(true)
	{
		while(distancesquared(self.origin, s_anchor.origin) > sqr(2500))
		{
			waitframe(1);
		}
		self clientfield::set_to_player("" + #"hash_3fa05b65abd13e3d", 1);
		while(distancesquared(self.origin, s_anchor.origin) <= sqr(2500))
		{
			waitframe(1);
		}
		self function_53d0c1f7();
	}
}

/*
	Name: function_53d0c1f7
	Namespace: namespace_1b312da5
	Checksum: 0x3A5B414
	Offset: 0x5858
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_53d0c1f7(str_notify)
{
	self clientfield::set_to_player("" + #"hash_3fa05b65abd13e3d", 0);
}

/*
	Name: function_99142075
	Namespace: namespace_1b312da5
	Checksum: 0x55005F38
	Offset: 0x5898
	Size: 0x1C4
	Parameters: 6
	Flags: Linked
*/
function function_99142075(s_instance, var_ffcdfc70, var_5a98f417, var_85931797, var_531cd749, var_ff2a165c)
{
	if(!isdefined(var_85931797))
	{
		var_85931797 = 1;
	}
	if(!isdefined(var_531cd749))
	{
		var_531cd749 = 0;
	}
	if(!isdefined(var_ff2a165c))
	{
		var_ff2a165c = 1;
	}
	if(var_85931797)
	{
		function_ef891f45(s_instance, #"hash_1078574b7a2bc5d");
		wait(1);
		function_ef891f45(s_instance, #"static");
	}
	var_3bd552f = s_instance.var_92418447;
	if(!isdefined(var_ffcdfc70))
	{
		var_ffcdfc70 = var_3bd552f.var_fe2612fe[#"hash_3d3744e25faabfc5"][0];
	}
	if(!isdefined(var_5a98f417))
	{
		var_5a98f417 = [1:var_3bd552f.var_fe2612fe[#"hash_6a9e7d3011f3c65e"][0], 0:var_3bd552f.var_fe2612fe[#"hash_3d3744e25faabfc5"][0]];
	}
	if(!isdefined(var_5a98f417))
	{
		var_5a98f417 = [];
	}
	else if(!isarray(var_5a98f417))
	{
		var_5a98f417 = array(var_5a98f417);
	}
	boom(var_ffcdfc70);
	level thread dig(s_instance, var_5a98f417, var_531cd749, var_ff2a165c);
}

/*
	Name: boom
	Namespace: namespace_1b312da5
	Checksum: 0x5C0A6BC4
	Offset: 0x5A68
	Size: 0x218
	Parameters: 1
	Flags: Linked
*/
function boom(var_ffcdfc70)
{
	playrumbleonposition(#"hash_1b6b46fc921acb78", var_ffcdfc70.origin);
	playfx(#"hash_992fe8f8e8dfb1", var_ffcdfc70.origin, anglestoforward(var_ffcdfc70.angles), anglestoup(var_ffcdfc70.angles));
	foreach(e_player in function_a1ef346b(undefined, var_ffcdfc70.origin, 128))
	{
		if(zm_utility::is_player_valid(e_player))
		{
			e_player dodamage(666, var_ffcdfc70.origin);
		}
	}
	foreach(e_player in function_a1ef346b(undefined, var_ffcdfc70.origin, 256))
	{
		if(zm_utility::is_player_valid(e_player))
		{
			e_player dodamage(50, var_ffcdfc70.origin);
		}
	}
}

/*
	Name: function_b252d34d
	Namespace: namespace_1b312da5
	Checksum: 0x8734F90B
	Offset: 0x5C88
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function function_b252d34d()
{
	switch(function_a1ef346b().size)
	{
		default:
		{
			n_max_spawns = 8;
			break;
		}
		case 2:
		{
			n_max_spawns = 10;
			break;
		}
		case 3:
		{
			n_max_spawns = 12;
			break;
		}
		case 4:
		{
			n_max_spawns = 14;
			break;
		}
	}
	for(n_to_spawn = n_max_spawns; n_to_spawn > 0 && (getaiarchetypearray(#"zombie").size + n_to_spawn) > n_max_spawns; n_to_spawn--)
	{
	}
	return n_to_spawn;
}

/*
	Name: dig
	Namespace: namespace_1b312da5
	Checksum: 0xA28DF42D
	Offset: 0x5D88
	Size: 0x554
	Parameters: 4
	Flags: Linked
*/
function dig(s_instance, var_5a98f417, var_531cd749, var_ff2a165c)
{
	if(!isdefined(var_531cd749))
	{
		var_531cd749 = 0;
	}
	if(!isdefined(var_ff2a165c))
	{
		var_ff2a165c = 1;
	}
	n_to_spawn = function_b252d34d();
	if(n_to_spawn > 0)
	{
		foreach(var_275ce1e in var_5a98f417)
		{
			var_275ce1e.mdl_fx = util::spawn_model(#"tag_origin", var_275ce1e.origin - (anglestoforward(var_275ce1e.angles) * 128), var_275ce1e.angles);
			playfxontag(#"hash_1401f31999ef6b93", var_275ce1e.mdl_fx, "tag_origin");
			if(!var_275ce1e flag::get(#"hash_3b82fec1d3d5a8fb"))
			{
				var_275ce1e.spawn_points = [];
				var_275ce1e.var_9b178666 = 130;
				var_275ce1e.var_48d0f926 = 64;
				var_275ce1e.var_783fc5e = 6;
				var_275ce1e.spawn_points = namespace_85745671::function_e4791424(var_275ce1e.origin, var_275ce1e.var_783fc5e, var_275ce1e.var_48d0f926, var_275ce1e.var_9b178666, 80);
				var_275ce1e flag::set(#"hash_3b82fec1d3d5a8fb");
			}
			var_275ce1e.var_2eb61c8a = arraycopy(var_275ce1e.spawn_points);
		}
		n_spawned = 0;
		while(n_spawned < n_to_spawn)
		{
			var_275ce1e = array::random(var_5a98f417);
			if(var_275ce1e.var_2eb61c8a.size > 0)
			{
				v_spawn = array::random(var_275ce1e.var_2eb61c8a);
				arrayremovevalue(var_275ce1e.var_2eb61c8a, v_spawn);
				level thread function_16ab6058(var_275ce1e, v_spawn);
				v_spawn = v_spawn.origin;
				while(true)
				{
					ai_spawned = namespace_85745671::function_9d3ad056(#"hash_7cba8a05511ceedf", v_spawn, (0, randomfloat(360), 0));
					if(isdefined(ai_spawned))
					{
						break;
					}
					util::wait_network_frame();
				}
				ai_spawned callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_df7d32bc);
				ai_spawned thread namespace_85745671::function_9456addc();
				n_spawned++;
			}
			wait(randomfloatrange(0.5, 1));
		}
		foreach(var_275ce1e in var_5a98f417)
		{
			if(isdefined(var_275ce1e.mdl_fx))
			{
				var_275ce1e.mdl_fx delete();
			}
		}
	}
	if(!var_ff2a165c)
	{
		foreach(var_275ce1e in var_5a98f417)
		{
			var_275ce1e.spawn_points = undefined;
			var_275ce1e flag::clear(#"hash_3b82fec1d3d5a8fb");
		}
	}
	if(var_531cd749)
	{
		return;
	}
	function_392aeaef(s_instance, #"dig");
	level thread function_10ebe761(s_instance, #"dig");
}

/*
	Name: function_16ab6058
	Namespace: namespace_1b312da5
	Checksum: 0x70D33195
	Offset: 0x62E8
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_16ab6058(var_275ce1e, v_spawn)
{
	wait(5);
	if(isdefined(var_275ce1e))
	{
		if(!isdefined(var_275ce1e.var_2eb61c8a))
		{
			var_275ce1e.var_2eb61c8a = [];
		}
		else if(!isarray(var_275ce1e.var_2eb61c8a))
		{
			var_275ce1e.var_2eb61c8a = array(var_275ce1e.var_2eb61c8a);
		}
		var_275ce1e.var_2eb61c8a[var_275ce1e.var_2eb61c8a.size] = v_spawn;
	}
}

/*
	Name: function_df7d32bc
	Namespace: namespace_1b312da5
	Checksum: 0xD07C3CBB
	Offset: 0x6390
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_df7d32bc()
{
	if(self.current_state.name == #"chase" && self.archetype == #"zombie")
	{
		var_8c6394e3 = "sprint";
		var_481bf1b8 = (isdefined(level.var_b48509f9) ? level.var_b48509f9 : 1);
		if(var_481bf1b8 > 1 && math::cointoss(25))
		{
			var_8c6394e3 = "super_sprint";
		}
		self namespace_85745671::function_9758722(var_8c6394e3);
	}
}

/*
	Name: function_e08d51cb
	Namespace: namespace_1b312da5
	Checksum: 0xAB84E5EF
	Offset: 0x6468
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function function_e08d51cb(s_instance)
{
	s_instance flag::set(#"hash_30fdb94435464bba");
	foreach(var_ff2636d3 in s_instance.var_a455ba34)
	{
		if(isdefined(var_ff2636d3) && var_ff2636d3.health > 0)
		{
			var_ff2636d3.allowdeath = 0;
		}
	}
}

/*
	Name: function_88a5a072
	Namespace: namespace_1b312da5
	Checksum: 0x540C74FC
	Offset: 0x6538
	Size: 0x102
	Parameters: 1
	Flags: Linked
*/
function function_88a5a072(s_instance)
{
	s_instance flag::clear(#"hash_30fdb94435464bba");
	s_instance flag::set(#"hash_28fc39d01e613e67");
	foreach(var_ff2636d3 in s_instance.var_a455ba34)
	{
		if(isdefined(var_ff2636d3) && var_ff2636d3.health > 0)
		{
			var_ff2636d3.allowdeath = 1;
			if(var_ff2636d3.health < 1000)
			{
				var_ff2636d3.health = 1000;
			}
		}
	}
}

/*
	Name: function_e2ada674
	Namespace: namespace_1b312da5
	Checksum: 0x4EC7AF5B
	Offset: 0x6648
	Size: 0x2AC
	Parameters: 1
	Flags: Linked
*/
function function_e2ada674(s_instance)
{
	s_instance flag::set(#"flipped");
	while(true)
	{
		var_15619d6c = spawner::simple_spawn_single("sp_vh_hulk_unplug");
		if(isdefined(var_15619d6c))
		{
			break;
		}
		waitframe(1);
	}
	wait(3);
	function_ef891f45(s_instance, #"hash_30fdb94435464bba", 1);
	wait(3);
	var_dd6851a9 = getvehiclenode(var_15619d6c.target, "targetname");
	var_15619d6c vehicle::get_on_path(var_dd6851a9);
	level thread function_12c59919(s_instance, var_15619d6c);
	wait(2);
	var_15619d6c vehicle::go_path();
	wait(2);
	function_ef891f45(s_instance, #"hash_30fdb94435464bba", 2);
	foreach(str_pose in [3:#"hash_9bd2d8f4620ec78", 2:#"hash_4b8af2e778c73689", 1:#"hash_791aba533b6cd351", 0:#"hash_148e8ac0e3473b70"])
	{
		if(isdefined(s_instance.var_4cd68ffe[str_pose][#"model"]))
		{
			s_instance.var_4cd68ffe[str_pose][#"model"] delete();
		}
		s_instance.var_4cd68ffe[str_pose] = undefined;
	}
	var_15619d6c delete();
	wait(2);
	function_88a5a072(s_instance);
	level thread function_450200ab(s_instance);
}

/*
	Name: function_12c59919
	Namespace: namespace_1b312da5
	Checksum: 0xF15183CE
	Offset: 0x6900
	Size: 0x22E
	Parameters: 2
	Flags: Linked
*/
function function_12c59919(s_instance, var_15619d6c)
{
	s_instance endon(#"hash_1ce4862271d5768c");
	b_right = 1;
	for(i = 0; i < 4; i++)
	{
		str_start = #"hash_148e8ac0e3473b70";
		str_end = #"hash_791aba533b6cd351";
		if(!b_right)
		{
			str_start = #"hash_4b8af2e778c73689";
			str_end = #"hash_9bd2d8f4620ec78";
		}
		var_616de5dc = function_6ee26472(s_instance, str_start, var_15619d6c.origin - (0, 0, 100), var_15619d6c.angles);
		var_616de5dc linkto(var_15619d6c);
		if(i <= 0)
		{
			wait(2);
		}
		var_15619d6c vehicle::resume_path();
		if(i < 3)
		{
			wait(3);
			var_616de5dc unlink();
			var_616de5dc = function_6ee26472(s_instance, str_end, var_15619d6c.origin - (0, 0, 150), var_15619d6c.angles);
			var_616de5dc linkto(var_15619d6c);
			var_15619d6c vehicle::pause_path();
			waitframe(1);
			level thread function_99142075(s_instance, var_616de5dc.var_31b025b5, var_616de5dc.var_31b025b5, 0, 1, 0);
			wait(5);
			var_616de5dc unlink();
			b_right = !b_right;
		}
	}
}

/*
	Name: function_7d7508e1
	Namespace: namespace_1b312da5
	Checksum: 0x965F2CA
	Offset: 0x6B38
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_7d7508e1(s_instance)
{
	function_ef891f45(s_instance, #"area");
	wait(3);
	level thread area(s_instance);
	wait(3);
	level notify(#"hash_340db360d22016a");
	function_ef891f45(s_instance, #"static");
	function_df2acad6();
	function_392aeaef(s_instance, #"area");
	s_instance.var_ff8f632d = 0;
	level thread function_10ebe761(s_instance, #"area");
}

/*
	Name: area
	Namespace: namespace_1b312da5
	Checksum: 0x59E957F2
	Offset: 0x6C30
	Size: 0x378
	Parameters: 1
	Flags: Linked
*/
function area(s_instance)
{
	level endon(#"hash_340db360d22016a");
	var_3bd552f = s_instance.var_92418447;
	s_launch = var_3bd552f.var_fe2612fe[#"launch"][0];
	if(!s_launch flag::get(#"hash_3b82fec1d3d5a8fb"))
	{
		var_e41dced6 = 360 / 10;
		for(i = 0; i < 10; i++)
		{
			var_296670f2 = var_e41dced6 * i;
			var_26c827e8 = sin(var_296670f2);
			var_c575b928 = cos(var_296670f2);
			n_start_x = var_26c827e8 * 100;
			n_start_y = var_c575b928 * 100;
			v_start = s_launch.origin + (n_start_x, n_start_y, 0);
			var_4c162941 = var_26c827e8 * 500;
			var_5ed8cec6 = var_c575b928 * 500;
			v_end = s_launch.origin + (var_4c162941, var_5ed8cec6, 1024);
			v_angles = vectortoangles(v_end - v_start);
			a_info = [];
			a_info[#"start"] = v_start;
			a_info[#"end"] = v_end;
			a_info[#"angles"] = v_angles;
			if(!isdefined(s_launch.var_2eb61c8a))
			{
				s_launch.var_2eb61c8a = [];
			}
			else if(!isarray(s_launch.var_2eb61c8a))
			{
				s_launch.var_2eb61c8a = array(s_launch.var_2eb61c8a);
			}
			s_launch.var_2eb61c8a[s_launch.var_2eb61c8a.size] = a_info;
		}
		s_launch flag::set(#"hash_3b82fec1d3d5a8fb");
	}
	var_58d1b08a = array::randomize(s_launch.var_2eb61c8a);
	while(true)
	{
		if(var_58d1b08a.size <= 0)
		{
			var_58d1b08a = array::randomize(s_launch.var_2eb61c8a);
		}
		var_bb956a6c = var_58d1b08a[0];
		arrayremoveindex(var_58d1b08a, 0);
		level thread function_182bb2f5(var_bb956a6c);
		wait(0.1);
	}
}

/*
	Name: function_182bb2f5
	Namespace: namespace_1b312da5
	Checksum: 0xFDCCCADA
	Offset: 0x6FB0
	Size: 0x1CC
	Parameters: 1
	Flags: Linked
*/
function function_182bb2f5(var_bb956a6c)
{
	v_start = var_bb956a6c[#"start"];
	v_end = var_bb956a6c[#"end"];
	v_angles = var_bb956a6c[#"angles"];
	var_817d3434 = util::spawn_model(#"tag_origin", v_start, v_angles);
	var_817d3434 rotatepitch(90, 0.1);
	var_817d3434 waittilltimeout(0.1, #"rotatedone");
	playfx(#"hash_21a25ae3fcd081e2", var_817d3434.origin, anglestoforward(var_817d3434.angles), anglestoup(var_817d3434.angles));
	playfxontag(#"hash_44ebb699144cf713", var_817d3434, "tag_origin");
	var_817d3434 moveto(v_end, 0.2);
	var_817d3434 waittilltimeout(0.2, #"movedone");
	var_817d3434 delete();
}

/*
	Name: function_df2acad6
	Namespace: namespace_1b312da5
	Checksum: 0x3B98026D
	Offset: 0x7188
	Size: 0x240
	Parameters: 0
	Flags: Linked
*/
function function_df2acad6()
{
	var_161a160a = function_a1ef346b();
	var_36064303 = 0;
	while(function_a1ef346b().size > 0 && var_36064303 < 30)
	{
		function_1eaaceab(var_161a160a);
		if(var_161a160a.size <= 0)
		{
			var_161a160a = array::randomize(function_a1ef346b());
		}
		e_player = var_161a160a[0];
		arrayremoveindex(var_161a160a, 0);
		v_forward = anglestoforward(e_player.angles) * randomfloat(1024);
		if(math::cointoss())
		{
			v_forward = v_forward * -1;
		}
		v_right = anglestoright(e_player.angles) * randomfloat(1024);
		if(math::cointoss())
		{
			v_right = v_right * -1;
		}
		v_start = ((e_player.origin + v_forward) + v_right) + vectorscale((0, 0, 1), 2048);
		a_info = bullettrace(v_start, v_start - vectorscale((0, 0, 1), 2148), 0, e_player);
		v_hit = a_info[#"position"];
		if(isdefined(v_hit))
		{
			var_36064303++;
			level thread function_eb055045(v_hit);
		}
		wait(0.1);
	}
}

/*
	Name: function_eb055045
	Namespace: namespace_1b312da5
	Checksum: 0x12CA3AD8
	Offset: 0x73D0
	Size: 0x164
	Parameters: 1
	Flags: Linked
*/
function function_eb055045(v_hit)
{
	mdl_fx = util::spawn_model(#"tag_origin", v_hit);
	mdl_fx clientfield::set("" + #"hash_22f5493de4d47138", 1);
	wait(3);
	mdl_fx clientfield::set("" + #"hash_22f5493de4d47138", 2);
	struct = {#v_hit:v_hit};
	level thread function_b5365755(struct);
	wait(3);
	struct notify(#"hash_7548dc5bcfb53a12");
	mdl_fx clientfield::set("" + #"hash_22f5493de4d47138", 0);
	wait(1);
	struct struct::delete();
	mdl_fx delete();
}

/*
	Name: function_b5365755
	Namespace: namespace_1b312da5
	Checksum: 0x863F8570
	Offset: 0x7540
	Size: 0x26A
	Parameters: 1
	Flags: Linked
*/
function function_b5365755(struct)
{
	struct endon(#"hash_7548dc5bcfb53a12");
	foreach(e_player in function_a1ef346b(undefined, struct.v_hit, 128))
	{
		if(zm_utility::is_player_valid(e_player) && !e_player flag::get(#"hash_5054ba0aeb5a713b"))
		{
			e_player dodamage(100, struct.v_hit);
			e_player flag::set(#"hash_5054ba0aeb5a713b");
			e_player thread function_681a3f6a();
		}
	}
	while(true)
	{
		foreach(e_player in function_a1ef346b(undefined, struct.v_hit, 128))
		{
			if(zm_utility::is_player_valid(e_player) && !e_player flag::get(#"hash_5054ba0aeb5a713b"))
			{
				e_player dodamage(50, struct.v_hit);
				e_player flag::set(#"hash_5054ba0aeb5a713b");
				e_player thread function_681a3f6a();
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_681a3f6a
	Namespace: namespace_1b312da5
	Checksum: 0xDC184503
	Offset: 0x77B8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_681a3f6a()
{
	self notify("6ed35f52d68b8d94");
	self endon("6ed35f52d68b8d94");
	self endon(#"death");
	wait(1);
	self flag::clear(#"hash_5054ba0aeb5a713b");
}

