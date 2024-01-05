#using script_92d4d637814fefa;
#using script_190d6b82bcca0908;
#using script_113dd7f0ea2a1d4f;
#using scripts\zm_common\zm_zonemgr.gsc;
#using script_4421226bbc54b398;
#using script_669400ff5aadcc83;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using script_1029986e2bc8ca8e;
#using scripts\zm_common\callbacks.gsc;
#using script_27347f09888ad15;
#using scripts\killstreaks\helicopter_shared.gsc;
#using script_72d96920f15049b8;
#using script_1cc417743d7c262d;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_35598499769dbb3d;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_591b4396;

/*
	Name: main
	Namespace: namespace_591b4396
	Checksum: 0x60C7A295
	Offset: 0x480
	Size: 0x154
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	objective_manager::function_b3464a7c(#"exfil", undefined, &function_3b4a24e2, #"exfil", #"hash_550113857d521cf0", #"hash_7d1368d8d487beed", 4, #"hash_248bfcefe7e51481", &function_39eec401);
	hidemiscmodels("exfil_border");
	var_bbdb0dfe = getent("exfil_heli_slick", "targetname");
	if(isdefined(var_bbdb0dfe))
	{
		var_bbdb0dfe moveto(var_bbdb0dfe.origin + (vectorscale((0, 0, -1), 100)), 0.1);
		var_bbdb0dfe notsolid();
	}
	if(zm_utility::is_classic())
	{
		callback::on_round_end(&on_round_end);
	}
}

/*
	Name: function_3b4a24e2
	Namespace: namespace_591b4396
	Checksum: 0x8383FF6B
	Offset: 0x5E0
	Size: 0x564
	Parameters: 1
	Flags: Linked
*/
function function_3b4a24e2(instance)
{
	if(isdefined(level.var_fdcaf3a6))
	{
		return;
	}
	level.var_fdcaf3a6 = instance;
	level.var_fdcaf3a6.useweapon = getweapon(#"hash_52ea38778c7d2fb3");
	level.no_powerups = 1;
	level.var_fdcaf3a6.var_de401243 = 0;
	if(isdefined(level.var_baed3b8e))
	{
		setdvar(#"hkai_pathfinditerationlimit", level.var_baed3b8e);
	}
	if(isdefined(level.var_ac94c2b8))
	{
		function_9d4cc726(#"zombiefindfleshservice", level.var_ac94c2b8);
	}
	level flag::wait_till(#"gameplay_started");
	if(zm_utility::is_classic())
	{
		level notify(#"end_round_think");
		level notify(#"end_of_round");
		waitframe(1);
		level zm_utility::function_9ad5aeb1(0, 1);
		if(level clientfield::get("dog_round_fog_bank"))
		{
			level thread clientfield::set("dog_round_fog_bank", 0);
		}
		showmiscmodels("exfil_border");
		wait(0.75);
		level thread cleanup_main();
	}
	level callback::callback(#"hash_594217387367ebb4");
	if(isdefined(level.var_a353323e))
	{
		level thread [[level.var_a353323e]]();
	}
	else
	{
		music::setmusicstate("extraction");
	}
	if(isdefined(level.var_c29bf3b6))
	{
		if(level.var_c29bf3b6 != "none")
		{
			level thread util::delay(5, "end_game", &zm_vo::function_7622cb70, level.var_c29bf3b6);
		}
	}
	else
	{
		level thread util::delay(5, "end_game", &zm_vo::function_7622cb70, #"hash_42e688981c992280");
	}
	var_28bf3706 = instance.var_fe2612fe[#"heli_spawn"][0];
	do
	{
		waitframe(1);
		if(zm_utility::is_classic())
		{
			level.var_117d5f10 = vehicle::spawn(undefined, "exfil_heli", #"hash_437293ae239af1ab", var_28bf3706.origin, var_28bf3706.angles);
		}
		else
		{
			level.var_117d5f10 = vehicle::spawn(undefined, "exfil_heli", #"hash_50b5a1068a7647d3", var_28bf3706.origin, var_28bf3706.angles);
		}
	}
	while(!isdefined(level.var_117d5f10));
	level.var_117d5f10 function_d733412a(0);
	var_3ec7083c = instance.var_fe2612fe[#"hash_216188a7e7b381a6"][0];
	if(!isdefined(var_3ec7083c.radius))
	{
		var_3ec7083c.radius = 2000;
	}
	if(!isdefined(var_3ec7083c.height))
	{
		var_3ec7083c.height = 500;
	}
	var_3ec7083c.radius = int(var_3ec7083c.radius);
	var_3ec7083c.height = int(var_3ec7083c.height);
	if(isdefined(level.var_26ed6a07))
	{
		var_3ec7083c.radius = level.var_26ed6a07;
	}
	if(isdefined(level.var_c86f12d4))
	{
		var_3ec7083c.height = level.var_c86f12d4;
	}
	level thread function_839b3d5a(var_3ec7083c);
	if(is_true(getgametypesetting("zmExfilRound")))
	{
		wait(15);
	}
	level thread function_17f88f7c(var_3ec7083c);
	level.var_117d5f10 thread function_c70a47c(var_3ec7083c);
	level thread function_31125f54();
}

/*
	Name: function_c70a47c
	Namespace: namespace_591b4396
	Checksum: 0x44CAEF87
	Offset: 0xB50
	Size: 0x61C
	Parameters: 1
	Flags: Linked
*/
function function_c70a47c(var_3ec7083c)
{
	instance = var_3ec7083c.parent;
	self val::set("exfil_heli", "takedamage", 0);
	self makevehicleusable();
	self setrotorspeed(1);
	self setseatoccupied(0, 1);
	self vehicle::toggle_tread_fx(1);
	level thread helicopter::function_eca18f00(self, #"hash_5793213ec26a2aa5");
	function_3eef60e4(self);
	if(zm_utility::is_classic())
	{
		self.drivepath = 1;
	}
	self vehicle::get_on_and_go_path(function_60c104b6(instance, "heli_spawn"));
	level thread function_3919ed28();
	level flag::set("exfil_heli_arrived");
	objective_setposition(level.var_fdcaf3a6.var_e55c8b4e, self.origin + (vectorscale((0, 0, -1), 48)));
	objective_onentity(level.var_fdcaf3a6.var_e55c8b4e, self);
	level thread function_85679542();
	if(!zm_utility::is_classic())
	{
		level thread function_1913632(self);
	}
	else
	{
		self sethoverparams(30, 50, 50);
	}
	level flag::wait_till_any(array(#"hash_1442cccc0c2806d6", #"exfil_cleared"));
	if(isdefined(level.var_139ceb46))
	{
		if(level.var_139ceb46 != "none")
		{
			level thread zm_vo::function_7622cb70(level.var_139ceb46);
		}
	}
	else
	{
		level thread zm_vo::function_7622cb70(#"hash_6fdeb623f1cd8f6");
	}
	if(!level flag::get(#"exfil_cleared") && (getplayers().size > 1 || getdvarint(#"hash_33b0be96bf3cd69a", 0)))
	{
		self vehicle::get_off_path();
		self thread vehicle::get_on_and_go_path(function_60c104b6(instance, "exfil_circle_path_start"));
		level flag::wait_till_all(array(#"exfil_cleared", #"hash_fdc24944f59c262"));
	}
	else
	{
		if(isdefined(level.var_fdcaf3a6.gameobject))
		{
			level.var_fdcaf3a6.gameobject gameobjects::destroy_object(1, 1);
			self thread function_ce44e2a8(self);
		}
		level flag::wait_till(#"hash_fdc24944f59c262");
	}
	self vehicle::get_off_path();
	self makevehicleunusable();
	if(zm_utility::is_classic())
	{
		foreach(player in getplayers())
		{
			level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_1ea76eb37bb646db");
		}
		self vehicle::get_off_path();
		self sethoverparams(3, 5, 10);
		level thread function_595332df();
		level thread function_a13d2af8(var_3ec7083c);
		self pathvariableoffset(vectorscale((1, 1, 0), 10), 0.5);
		self vehicle::get_on_and_go_path(function_60c104b6(instance, "exfil_land_path_start"));
		return;
	}
	level thread function_17afb20e(1);
}

/*
	Name: function_a13d2af8
	Namespace: namespace_591b4396
	Checksum: 0x1E395002
	Offset: 0x1178
	Size: 0x114
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a13d2af8(var_3ec7083c)
{
	level endon(#"objective_ended", #"hash_158779eefe4893d1", #"hash_4fbe4720f6f13107", #"end_game");
	if(isdefined(level.var_de28bf87))
	{
		wait(level.var_de28bf87);
	}
	else
	{
		wait(5);
	}
	s_interact = spawnstruct();
	s_interact.origin = var_3ec7083c.origin;
	level.var_fdcaf3a6.trigger = namespace_8b6a9d79::function_214737c7(s_interact, &function_39f35c4e, #"hash_1192710f818f1e47", undefined, 450, 400, undefined, (0, 0, 0));
	level.var_fdcaf3a6.trigger usetriggerrequirelookat(0);
}

/*
	Name: function_3919ed28
	Namespace: namespace_591b4396
	Checksum: 0x507895EA
	Offset: 0x1298
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3919ed28()
{
	if(isdefined(level.var_6363395e))
	{
		if(level.var_6363395e != "none")
		{
			level zm_vo::function_7622cb70(level.var_6363395e);
		}
	}
	else
	{
		level zm_vo::function_7622cb70(#"hash_4e85c1603ed42114");
	}
	if(isdefined(level.var_7c027cbe))
	{
		if(level.var_7c027cbe != "none")
		{
			level thread zm_vo::function_7622cb70(level.var_7c027cbe, 2);
		}
	}
	else
	{
		level thread zm_vo::function_7622cb70(#"hash_362860f460a29841", 2);
	}
}

/*
	Name: function_39f35c4e
	Namespace: namespace_591b4396
	Checksum: 0xAEBB29B6
	Offset: 0x1388
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_39f35c4e(eventstruct)
{
	level.var_fdcaf3a6.trigger delete();
	foreach(player in getplayers())
	{
		objective_setinvisibletoplayer(level.var_fdcaf3a6.var_e55c8b4e, player);
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 0);
	}
	level thread function_17afb20e(1);
}

/*
	Name: function_60c104b6
	Namespace: namespace_591b4396
	Checksum: 0x3F5D4978
	Offset: 0x1498
	Size: 0x62
	Parameters: 2
	Flags: Linked
*/
function function_60c104b6(instance, var_eece1f6a)
{
	var_ec14921 = instance.var_fe2612fe[var_eece1f6a][0].targetname;
	node = getvehiclenode(var_ec14921, "target");
	return node;
}

/*
	Name: function_3eef60e4
	Namespace: namespace_591b4396
	Checksum: 0xF3F52CB3
	Offset: 0x1508
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3eef60e4(helicopter)
{
	/#
		assert(!isdefined(helicopter.rope));
	#/
	helicopter.rope = util::spawn_anim_model(#"p9_fxanim_gp_vehicle_heli_lrg_vip_rope_mod", helicopter.origin);
	/#
		assert(isdefined(helicopter.rope));
	#/
	helicopter.rope notsolid();
	helicopter.rope linkto(helicopter, "tag_origin_animate");
	helicopter.rope hide();
}

/*
	Name: function_7082507b
	Namespace: namespace_591b4396
	Checksum: 0xA4D8C845
	Offset: 0x15E8
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7082507b(helicopter)
{
	/#
		assert(isdefined(helicopter.rope));
	#/
	helicopter endon(#"death", #"hash_4c9df8896f727a2e");
	helicopter.rope endon(#"death");
	helicopter.rope show();
	helicopter.rope animation::play(#"hash_2216bcebd33b5779", helicopter, "tag_origin_animate", 1, 0.2, 0.1, undefined, undefined, undefined, 0);
	helicopter notify(#"hash_13b3aacf002f7c8f");
	childthread function_89baf3(helicopter);
}

/*
	Name: function_89baf3
	Namespace: namespace_591b4396
	Checksum: 0x9C13A758
	Offset: 0x16F8
	Size: 0x88
	Parameters: 1
	Flags: Linked, Private
*/
function private function_89baf3(helicopter)
{
	/#
		assert(isdefined(helicopter.rope));
	#/
	while(true)
	{
		helicopter.rope animation::play(#"hash_79f7c6405bc5958e", helicopter, "tag_origin_animate", 1, 0.1, 0.1, undefined, undefined, undefined, 0);
	}
}

/*
	Name: function_1913632
	Namespace: namespace_591b4396
	Checksum: 0xB0FE2C09
	Offset: 0x1788
	Size: 0x2F4
	Parameters: 1
	Flags: Linked
*/
function function_1913632(helicopter)
{
	level endon(#"exfil_cleared");
	wait(1.5);
	helicopter thread function_7082507b(helicopter);
	helicopter waittill(#"hash_13b3aacf002f7c8f");
	var_4adc70ee = vectorscale((0, 0, 1), 825);
	v_interact = helicopter.rope gettagorigin("carabiner_jnt") + var_4adc70ee;
	level.var_fdcaf3a6.trigger = spawn("trigger_radius_use", v_interact, 0, 80, 100);
	level.var_fdcaf3a6.trigger setcursorhint("HINT_NOICON");
	level.var_fdcaf3a6.trigger sethintstring(#"hash_611e948769ca0bdf");
	level.var_fdcaf3a6.trigger triggerignoreteam();
	var_8e875f24 = gameobjects::create_use_object(#"none", level.var_fdcaf3a6.trigger, [], (0, 0, 0), #"hash_4339ca3866fea623", 1);
	var_8e875f24 gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	var_8e875f24 gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
	var_8e875f24 gameobjects::set_use_time(1.5);
	var_8e875f24 gameobjects::set_onbeginuse_event(&onbeginuse);
	var_8e875f24 gameobjects::set_onenduse_event(&onenduse);
	var_8e875f24 gameobjects::set_onuse_event(&function_7c255771);
	var_8e875f24.useweapon = getweapon(#"hash_52ea38778c7d2fb3");
	var_8e875f24.var_dddda5d8 = 1;
	var_8e875f24.dontlinkplayertotrigger = 1;
	var_8e875f24 gameobjects::function_8f776dd0(1);
	level.var_fdcaf3a6.gameobject = var_8e875f24;
	level.var_b290ca72 = &function_d236f851;
}

/*
	Name: function_d236f851
	Namespace: namespace_591b4396
	Checksum: 0x4978EBBD
	Offset: 0x1A88
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function function_d236f851(player)
{
	if(isdefined(level.var_fdcaf3a6.trigger) && self istouching(level.var_fdcaf3a6.trigger))
	{
		return false;
	}
	return true;
}

/*
	Name: function_7c255771
	Namespace: namespace_591b4396
	Checksum: 0xEFA4E57D
	Offset: 0x1AE8
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_7c255771()
{
	var_3a8b4ddf = level.vip;
	if(!isdefined(var_3a8b4ddf) || is_true(var_3a8b4ddf.var_2c27f919))
	{
		return;
	}
	level.var_fdcaf3a6.gameobject gameobjects::set_visible(#"hash_161f03feaadc9b8f");
	level thread function_93ef48b(var_3a8b4ddf, level.var_117d5f10);
}

/*
	Name: function_93ef48b
	Namespace: namespace_591b4396
	Checksum: 0x1FAF259
	Offset: 0x1B88
	Size: 0x694
	Parameters: 2
	Flags: Linked
*/
function function_93ef48b(vip, helicopter)
{
	if(!isdefined(vip) || !isalive(vip) || !isdefined(helicopter) || !isdefined(self))
	{
		return;
	}
	helicopter endon(#"death");
	vip val::set(#"exfil", "show_hud", 0);
	vip dontinterpolate();
	vip val::set(#"exfil", "disable_weapon_fire", 1);
	vip val::set(#"exfil", "takedamage", 0);
	vip val::set(#"exfil", "freezecontrols", 1);
	vip.oobdisabled = 1;
	var_867f5d0 = spawn("script_model", vip.origin);
	var_867f5d0.angles = vip getplayerangles();
	var_867f5d0 dontinterpolate();
	vip playerlinkto(var_867f5d0, undefined, 0, 0, 0, 0, 0);
	var_2bf4050a = 0.6;
	var_d892ba80 = helicopter.rope gettagorigin("carabiner_jnt") + vectorscale((0, 0, 1), 825);
	var_de324c05 = 5;
	var_867f5d0 function_3b897a2(vip, var_d892ba80, var_de324c05, var_2bf4050a);
	waittillframeend();
	if(!isdefined(vip) || !isalive(vip) || !isdefined(var_867f5d0))
	{
		return;
	}
	helicopter thread function_ce44e2a8(helicopter);
	var_ba5977f4 = 40;
	var_a080de98 = helicopter gettagorigin("tag_enter_passenger1")[2] - var_ba5977f4;
	var_867f5d0.angles = vip getplayerangles();
	goalyaw = helicopter.angles[1] - 90;
	var_867f5d0 thread function_d914539a(goalyaw);
	while(isdefined(var_867f5d0) && isalive(vip) && var_867f5d0.origin[2] < var_a080de98 && isdefined(helicopter.rope))
	{
		var_443bf2ea = vip gettagorigin("j_spineupper");
		var_70f8d8e1 = vip.origin - (var_443bf2ea + (var_de324c05 * anglestoforward(vip.angles)));
		var_867f5d0.origin = (helicopter.rope gettagorigin("carabiner_jnt") + var_70f8d8e1) + vectorscale((0, 0, 1), 825);
		waitframe(1);
	}
	if(!isdefined(vip) || !isalive(vip) || !isdefined(var_867f5d0))
	{
		return;
	}
	level flag::set(#"hash_23a3320be9d9bcbb");
	vip unlink();
	var_867f5d0 delete();
	lerptime = 0.4;
	helicopter thread function_a34ad686();
	var_a3476af7 = helicopter gettagorigin("tag_passenger2");
	var_eb72be15 = helicopter gettagangles("tag_passenger2");
	vip startcameratween(lerptime, 0, 0);
	vip animation::play(#"hash_2021a3a93fd63eef", var_a3476af7, var_eb72be15, 1, 0, 0, lerptime, undefined, undefined, 1);
	waitframe(1);
	vip val::set(#"exfil", "disable_weapon_fire", 0);
	helicopter usevehicle(vip, 2);
	b_in_vehicle = 1;
	if(vip hasweapon(level.var_fdcaf3a6.useweapon))
	{
		vip takeweapon(level.var_fdcaf3a6.useweapon);
	}
	helicopter makevehicleunusable();
	level flag::set(#"hash_1442cccc0c2806d6");
	if(isdefined(level.var_fdcaf3a6.trigger))
	{
		level.var_fdcaf3a6.trigger delete();
	}
	vip function_9e79b1b7();
}

/*
	Name: function_a34ad686
	Namespace: namespace_591b4396
	Checksum: 0x64E69D46
	Offset: 0x2228
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_a34ad686()
{
	self animation::play(#"hash_2bf79afeff76c7d3", self, "tag_passenger2", 1, 0, 0, undefined, undefined, undefined, 0);
}

/*
	Name: function_3b897a2
	Namespace: namespace_591b4396
	Checksum: 0x28DF51A5
	Offset: 0x2270
	Size: 0x12E
	Parameters: 4
	Flags: Linked
*/
function function_3b897a2(vip, var_d892ba80, var_10890b28, movetime)
{
	self endon(#"death");
	endtime = gettime() + (int(movetime * 1000));
	while(isdefined(self) && isalive(vip) && gettime() < endtime)
	{
		var_443bf2ea = vip gettagorigin("j_spineupper");
		var_70f8d8e1 = vip.origin - (var_443bf2ea + (var_10890b28 * anglestoforward(vip.angles)));
		goalpos = var_d892ba80 + var_70f8d8e1;
		self moveto(goalpos, movetime);
		waitframe(1);
	}
}

/*
	Name: function_ce44e2a8
	Namespace: namespace_591b4396
	Checksum: 0xFED4355F
	Offset: 0x23A8
	Size: 0xEC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ce44e2a8(helicopter)
{
	if(!isdefined(helicopter.rope))
	{
		return;
	}
	helicopter endon(#"death");
	helicopter.rope endon(#"death");
	helicopter notify(#"hash_4c9df8896f727a2e");
	var_2e2c7ee7 = 0.5;
	helicopter.rope animation::play(#"hash_3f5deb4729726f2c", helicopter, "tag_origin_animate", var_2e2c7ee7, 0.2, 0.1, undefined, undefined, undefined, 0);
	if(isdefined(helicopter.rope))
	{
		helicopter.rope delete();
	}
}

/*
	Name: function_d914539a
	Namespace: namespace_591b4396
	Checksum: 0xB197FEB2
	Offset: 0x24A0
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function function_d914539a(goalyaw)
{
	self endon(#"death");
	var_ecaa456b = 1.9;
	var_9546359 = min(-75, self.angles[0]);
	var_64165cee = 0.6;
	var_44cf825 = math::clamp(var_64165cee / var_ecaa456b, 0, 1);
	var_bc4bc17d = anglelerp(self.angles[1], goalyaw, var_44cf825);
	var_fc27b3e3 = (var_9546359, var_bc4bc17d, 0);
	self rotateto(var_fc27b3e3, var_64165cee, 0.2, 0.1);
	wait(var_64165cee);
	if(!isdefined(self))
	{
		return;
	}
	var_3c4cc94a = -60;
	var_f0d8f62c = math::clamp(var_ecaa456b - var_64165cee, 0, var_ecaa456b);
	var_cbb558d8 = (var_3c4cc94a, goalyaw, 0);
	self rotateto(var_cbb558d8, var_f0d8f62c, 0, min(var_f0d8f62c, 0.5));
}

/*
	Name: function_9e79b1b7
	Namespace: namespace_591b4396
	Checksum: 0x2D1597EB
	Offset: 0x2658
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_9e79b1b7()
{
	objective_setinvisibletoplayer(level.var_fdcaf3a6.var_e55c8b4e, self);
	level.var_31028c5d prototype_hud::set_active_obj_visibility(self, 0);
	self function_3a488e53(0);
	self.var_2c27f919 = 1;
	self val::set(#"hash_4086023ba6ea23e2", "ignoreme", 1);
}

/*
	Name: function_17afb20e
	Namespace: namespace_591b4396
	Checksum: 0x674F57DF
	Offset: 0x2700
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function function_17afb20e(b_success)
{
	if(!isdefined(b_success))
	{
		b_success = 0;
	}
	level thread objective_manager::stop_timer();
	/#
		if(getdvarint(#"hash_33b0be96bf3cd69a", 0) && level flag::get(#"hash_23a3320be9d9bcbb"))
		{
			iprintlnbold("");
			return;
		}
	#/
	level notify(#"hash_4fbe4720f6f13107", {#b_success:b_success});
}

/*
	Name: function_839b3d5a
	Namespace: namespace_591b4396
	Checksum: 0x3E14DB63
	Offset: 0x27D0
	Size: 0x3E8
	Parameters: 1
	Flags: Linked
*/
function function_839b3d5a(var_48236d2c)
{
	level endon(#"objective_ended");
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_main_objective_string(player, #"hash_2138b0d3ea594968");
	}
	wait(5);
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_2138b0d3ea594968");
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 2);
	}
	n_time = function_385ab693(var_48236d2c.origin);
	level thread objective_manager::start_timer(n_time, "exfil");
	level thread function_c504b2d1();
	level thread function_8fcb0a(n_time);
	var_48236d2c.t_exfil = spawn("trigger_radius", var_48236d2c.origin - (0, 0, var_48236d2c.height), 0, var_48236d2c.radius, var_48236d2c.height * 2);
	if(zm_utility::is_classic())
	{
		var_652c0aa1 = 0;
		while(!var_652c0aa1)
		{
			foreach(player in getplayers())
			{
				if(player zm_zonemgr::is_player_in_zone(level.var_ad5e81fe))
				{
					var_652c0aa1 = 1;
					break;
				}
			}
			wait(0.5);
		}
	}
	else
	{
		var_48236d2c.t_exfil waittill(#"trigger");
	}
	level flag::set(#"hash_3babb5bf72d208da");
	foreach(player in getplayers())
	{
		player thread function_bf33dd82(var_48236d2c.t_exfil);
	}
}

/*
	Name: function_bf33dd82
	Namespace: namespace_591b4396
	Checksum: 0x6E0C857
	Offset: 0x2BC0
	Size: 0x28C
	Parameters: 1
	Flags: Linked
*/
function function_bf33dd82(t_exfil)
{
	self endon(#"death");
	self.v_train_inbound_igc = 0;
	while(!level flag::get(#"exfil_cleared") || !level flag::get(#"hash_fdc24944f59c262"))
	{
		if(isdefined(level.var_fdcaf3a6.var_d4245663))
		{
			t_exfil = level.var_fdcaf3a6.var_d4245663;
		}
		if(is_true(self.var_2c27f919) || (!self.v_train_inbound_igc && self function_591cb2f4(t_exfil)))
		{
			level flag::set(#"hash_fdc24944f59c262");
			if(!level flag::get(#"exfil_cleared"))
			{
				if(zm_utility::is_classic())
				{
					level.var_31028c5d prototype_hud::set_active_objective_string(self, #"hash_1530af61f721d3e7");
				}
				else
				{
					level.var_31028c5d prototype_hud::set_active_objective_string(self, #"hash_18a40982c5569db2");
				}
			}
			self.v_train_inbound_igc = 1;
		}
		else if(self.v_train_inbound_igc && !self function_591cb2f4(t_exfil))
		{
			level.var_31028c5d prototype_hud::set_active_objective_string(self, #"hash_2138b0d3ea594968");
			self.v_train_inbound_igc = 0;
		}
		wait(0.5);
	}
	if(!zm_utility::is_classic())
	{
		objective_setinvisibletoplayer(level.var_fdcaf3a6.var_e55c8b4e, self);
		level.var_31028c5d prototype_hud::set_active_obj_visibility(self, 0);
	}
	self function_3a488e53(0);
}

/*
	Name: function_8fcb0a
	Namespace: namespace_591b4396
	Checksum: 0x9C0CCD5
	Offset: 0x2E58
	Size: 0x3A4
	Parameters: 1
	Flags: Linked
*/
function function_8fcb0a(var_3aeede0b)
{
	level endon(#"objective_ended", #"hash_158779eefe4893d1", #"hash_4fbe4720f6f13107", #"end_game");
	if(var_3aeede0b >= 30)
	{
		var_cb54863d = max((var_3aeede0b - 30) - 1, 0);
		wait(var_cb54863d);
		if(isdefined(level.var_82a4a07))
		{
			if(level.var_82a4a07 != "none")
			{
				level thread zm_vo::function_7622cb70(level.var_82a4a07);
			}
		}
		else
		{
			level thread zm_vo::function_7622cb70(#"hash_3c826fece0b3646c");
		}
		wait(15);
		if(isdefined(level.var_ee721ef7))
		{
			if(level.var_ee721ef7 != "none")
			{
				level thread zm_vo::function_7622cb70(level.var_ee721ef7);
			}
		}
		else
		{
			level thread zm_vo::function_7622cb70(#"hash_785b3e9905f6511d");
		}
		wait(10);
		if(isdefined(level.var_24cfb8fb))
		{
			if(level.var_24cfb8fb != "none")
			{
				level thread zm_vo::function_7622cb70(level.var_24cfb8fb);
			}
		}
		else
		{
			level thread zm_vo::function_7622cb70(#"hash_2aeb990c0cb76e97");
		}
	}
	else
	{
		if(var_3aeede0b >= 15)
		{
			var_a079cb0a = max((var_3aeede0b - 15) - 1, 0);
			wait(var_a079cb0a);
			if(isdefined(level.var_ee721ef7))
			{
				if(level.var_ee721ef7 != "none")
				{
					level thread zm_vo::function_7622cb70(level.var_ee721ef7);
				}
			}
			else
			{
				level thread zm_vo::function_7622cb70(#"hash_785b3e9905f6511d");
			}
			wait(10);
			if(isdefined(level.var_24cfb8fb))
			{
				if(level.var_24cfb8fb != "none")
				{
					level thread zm_vo::function_7622cb70(level.var_24cfb8fb);
				}
			}
			else
			{
				level thread zm_vo::function_7622cb70(#"hash_2aeb990c0cb76e97");
			}
		}
		else
		{
			var_a079cb0a = (var_3aeede0b - 5) - 1;
			if(var_a079cb0a > 0)
			{
				wait(var_a079cb0a);
				if(isdefined(level.var_24cfb8fb))
				{
					if(level.var_24cfb8fb != "none")
					{
						level thread zm_vo::function_7622cb70(level.var_24cfb8fb);
					}
				}
				else
				{
					level thread zm_vo::function_7622cb70(#"hash_2aeb990c0cb76e97");
				}
			}
		}
	}
}

/*
	Name: function_385ab693
	Namespace: namespace_591b4396
	Checksum: 0x5A202528
	Offset: 0x3208
	Size: 0x1CA
	Parameters: 1
	Flags: Linked
*/
function function_385ab693(var_fda8dff8)
{
	if(isdefined(level.var_7d45d0d4.var_c4181ea))
	{
		v_start = level.var_7d45d0d4.var_c4181ea.origin;
	}
	else
	{
		v_start = (0, 0, 0);
		a_players = function_a1ef346b();
		foreach(player in a_players)
		{
			v_start = v_start + player.origin;
		}
		v_start = v_start / a_players.size;
	}
	n_dist = distance2d(var_fda8dff8, v_start);
	var_6b68b20f = n_dist / 10000;
	if(isdefined(level.var_aaf7505f))
	{
		var_5dc3d377 = level.var_aaf7505f;
	}
	else
	{
		var_5dc3d377 = ((max(var_6b68b20f * 60, 60)) + 90) + (5 * level.var_b48509f9);
	}
	return int(min(540, var_5dc3d377));
}

/*
	Name: function_c504b2d1
	Namespace: namespace_591b4396
	Checksum: 0x8DBCEC57
	Offset: 0x33E0
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_c504b2d1()
{
	level endon(#"objective_ended", #"hash_4fbe4720f6f13107");
	level waittill(#"hash_158779eefe4893d1");
	b_success = 0;
	if(level flag::get(#"exfil_cleared") && level flag::get(#"hash_fdc24944f59c262"))
	{
		b_success = 1;
	}
	level notify(#"hash_4fbe4720f6f13107", {#b_success:b_success});
}

/*
	Name: function_31125f54
	Namespace: namespace_591b4396
	Checksum: 0xFF4E7CCA
	Offset: 0x34B0
	Size: 0x88C
	Parameters: 0
	Flags: Linked
*/
function function_31125f54()
{
	if(isdefined(level.var_8bb7479c))
	{
		level thread scene::init_streamer(level.var_8bb7479c, getplayers(), 0, 0);
	}
	if(isdefined(level.var_72a3d8bc))
	{
		level thread scene::init_streamer(level.var_72a3d8bc, getplayers(), 0, 0);
	}
	waitresult = undefined;
	waitresult = level waittill(#"hash_4fbe4720f6f13107");
	level.var_117d5f10 makevehicleunusable();
	if(isdefined(level.var_ae2fe3bd))
	{
		level thread [[level.var_ae2fe3bd]](waitresult.b_success);
	}
	else
	{
		music::setmusicstate("none");
	}
	objective_setinvisibletoall(level.var_fdcaf3a6.var_e55c8b4e);
	level.var_117d5f10.animname = "helicopter";
	if(isdefined(level.var_fdcaf3a6.trigger))
	{
		level.var_fdcaf3a6.trigger delete();
	}
	b_success = waitresult.b_success;
	if(b_success)
	{
		foreach(player in function_a1ef346b())
		{
			player val::set("exfil", "takedamage", 0);
			player val::set("exfil", "allowdeath", 0);
			player namespace_d4ecbbf0::function_3a2e46e0(1);
			player zm_stats::increment_challenge_stat(#"hash_1a7ff6d1e1ff03b0");
			level.var_7c7c6c35 zm_game_over::set_state(player, #"hash_4677c7e6d02d1a65");
			player function_3a488e53(0);
		}
		foreach(player in getplayers())
		{
			player.pers[#"outcome"] = #"win";
			if(isdefined(level.var_72a3d8bc) && isarray(player.var_231881b1) && isdefined(player.var_231881b1[level.var_72a3d8bc]))
			{
				player playerstreamerrequest("clear", player.var_231881b1[level.var_72a3d8bc]);
			}
			if(is_true(player.var_1bee6f4b))
			{
				namespace_e8c18978::function_cf58dcdd(player, 1);
			}
		}
		level thread function_a7394b94(1);
		if(isdefined(level.var_6e297a0d))
		{
			level [[level.var_6e297a0d]]();
		}
		level.var_117d5f10 unlink();
		if(isdefined(level.var_8bb7479c))
		{
			level scene::play(level.var_8bb7479c, level.var_117d5f10);
			array::thread_all(getplayers(), &zm_utility::function_ee6da6f6);
		}
		else
		{
			if(!isdefined(level.var_fdcaf3a6.target2) || level flag::get(#"hash_69567098e4924a9c"))
			{
				if(level flag::get(#"hash_69567098e4924a9c"))
				{
					str_scene = #"hash_16618e46c01a6e91";
					level flag::wait_till(#"hash_1442cccc0c2806d6");
				}
				else
				{
					str_scene = #"hash_5505d04b48e43a18";
				}
				s_scene = spawnstruct();
				s_scene.origin = level.var_117d5f10.origin;
				s_scene.angles = level.var_117d5f10.angles;
				s_scene thread scene::play(str_scene, level.var_117d5f10);
			}
			else
			{
				level thread scene::play(level.var_fdcaf3a6.target2, "targetname", level.var_117d5f10);
			}
		}
	}
	else
	{
		foreach(player in getplayers())
		{
			if(isdefined(level.var_8bb7479c) && isarray(player.var_231881b1) && isdefined(player.var_231881b1[level.var_8bb7479c]))
			{
				player playerstreamerrequest("clear", player.var_231881b1[level.var_8bb7479c]);
			}
			level.var_7c7c6c35 zm_game_over::set_state(player, #"hash_5f1b73095bbb3a7a");
			if(is_true(player.var_1bee6f4b))
			{
				namespace_e8c18978::function_cf58dcdd(player, 1);
			}
		}
		level thread function_a7394b94(0);
		if(isdefined(level.var_3d458005))
		{
			level [[level.var_3d458005]]();
		}
		if(isdefined(level.var_72a3d8bc))
		{
			level.var_117d5f10 unlink();
			level.var_117d5f10 show();
			level scene::play(level.var_72a3d8bc, level.var_117d5f10);
			array::thread_all(getplayers(), &function_e0bf1963);
		}
	}
	objective_manager::objective_ended(level.var_fdcaf3a6, b_success);
}

/*
	Name: function_a7394b94
	Namespace: namespace_591b4396
	Checksum: 0x2186790
	Offset: 0x3D48
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_a7394b94(b_success)
{
	if(b_success)
	{
		if(isdefined(level.var_f1a8b5e6))
		{
			if(level.var_f1a8b5e6 != "none")
			{
				level zm_vo::function_7622cb70(level.var_f1a8b5e6);
			}
		}
		else
		{
			level zm_vo::function_7622cb70(#"hash_eab292e698335c7");
		}
		if(isdefined(level.var_6ceeb30a))
		{
			if(level.var_6ceeb30a != "none")
			{
				level zm_vo::function_7622cb70(level.var_6ceeb30a);
			}
		}
		else
		{
			level zm_vo::function_7622cb70(#"hash_1c2b56fb48ce36fa", 0.75);
		}
	}
	else
	{
		if(isdefined(level.var_f9d84559))
		{
			if(level.var_f9d84559 != "none")
			{
				level zm_vo::function_7622cb70(level.var_f9d84559);
			}
		}
		else
		{
			level zm_vo::function_7622cb70(#"hash_6779beacf80a7a26", 4);
		}
	}
}

/*
	Name: function_e0bf1963
	Namespace: namespace_591b4396
	Checksum: 0x47883089
	Offset: 0x3EC0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_e0bf1963()
{
	self function_3a488e53(0);
	self zm_utility::function_ee6da6f6();
}

/*
	Name: onbeginuse
	Namespace: namespace_591b4396
	Checksum: 0xF4F1F6C1
	Offset: 0x3F00
	Size: 0x2D4
	Parameters: 1
	Flags: Linked
*/
function onbeginuse(player)
{
	if(!isdefined(level.var_a5030fa0))
	{
		level.var_a5030fa0 = spawn("script_model", player.origin);
	}
	playerangles = player getplayerangles();
	level.var_a5030fa0 dontinterpolate();
	level.var_a5030fa0.origin = player.origin;
	level.var_a5030fa0.angles = playerangles;
	player playerlinkto(level.var_a5030fa0, undefined, 0, 0, 0, 0, 0);
	player function_66f3a713();
	var_a35cd71 = min(-14, playerangles[0]);
	lookat = (isdefined(self.helicopter.rope) ? self.helicopter.rope gettagorigin("carabiner_jnt") + vectorscale((0, 0, 1), 825) : self.origin);
	goalyaw = vectortoyaw(lookat - player getplayercamerapos());
	var_8eef4f81 = absangleclamp180(playerangles[0] - var_a35cd71);
	var_9756b1d4 = absangleclamp180(playerangles[1] - goalyaw);
	var_f4f58cca = 0.25;
	var_bd70ec3f = 0.75;
	var_d9a208ec = math::clamp(max(var_8eef4f81, var_9756b1d4) / 180, 0, 1);
	var_7e42472f = var_f4f58cca + (var_d9a208ec * (var_bd70ec3f - var_f4f58cca));
	level.var_a5030fa0 rotateto((var_a35cd71, goalyaw, 0), var_7e42472f, var_7e42472f * 0.25, var_7e42472f * 0.25);
	level.vip = player;
}

/*
	Name: onenduse
	Namespace: namespace_591b4396
	Checksum: 0xA8016EC5
	Offset: 0x41E0
	Size: 0x6E
	Parameters: 3
	Flags: Linked
*/
function onenduse(team, player, success)
{
	if(isdefined(level.var_a5030fa0))
	{
		player unlink();
		if(success)
		{
			level.var_a5030fa0 deletedelay();
			level.var_a5030fa0 = undefined;
		}
	}
}

/*
	Name: function_bf315481
	Namespace: namespace_591b4396
	Checksum: 0xF3CB60FF
	Offset: 0x4258
	Size: 0x1E
	Parameters: 1
	Flags: None
*/
function function_bf315481(player)
{
	self notify(#"hash_21fb1bf7c34422cd");
}

/*
	Name: function_17f88f7c
	Namespace: namespace_591b4396
	Checksum: 0xEF2D5C57
	Offset: 0x4280
	Size: 0x4CC
	Parameters: 1
	Flags: Linked
*/
function function_17f88f7c(var_68cc0f1f)
{
	level endon(#"objective_ended");
	level thread function_5ddbfe57(var_68cc0f1f);
	if(zm_utility::is_classic())
	{
		callback::on_ai_spawned(&on_ai_spawned);
	}
	var_fda8dff8 = var_68cc0f1f.origin;
	var_b538af19 = (isdefined(level.var_fdcaf3a6.var_fe2612fe[#"hash_1f59ed48456964e4"]) ? level.var_fdcaf3a6.var_fe2612fe[#"hash_1f59ed48456964e4"] : []);
	foreach(spawn in var_b538af19)
	{
		level thread function_4b115eba(spawn);
	}
	n_max_ai = (zm_utility::is_classic() ? level.zombie_ai_limit : getailimit());
	while(true)
	{
		if(level flag::get(#"hash_58df1e8b20eb71d2") && !level flag::get(#"hash_47ded767d48dfe83"))
		{
			function_9feae843(var_fda8dff8);
			level flag::set(#"hash_47ded767d48dfe83");
		}
		a_players = function_a1ef346b();
		if(zm_utility::is_classic())
		{
			var_62455b3e = 5;
		}
		else
		{
			var_62455b3e = min(n_max_ai / (a_players.size + 1), n_max_ai / 3);
		}
		foreach(player in a_players)
		{
			if(is_true(player.var_652c0aa1) || player laststand::player_is_in_laststand())
			{
				continue;
			}
			if(zm_utility::is_classic())
			{
				v_spawn = player.origin;
			}
			else
			{
				n_dist = distancesquared(var_fda8dff8, player.origin);
				if(sqr(3000) > n_dist)
				{
					v_spawn = var_fda8dff8;
				}
				else
				{
					var_b8af022a = function_411bb920(player);
					v_dir = vectornormalize((var_fda8dff8 - player.origin) + var_b8af022a);
					v_spawn = player.origin + (v_dir * 3000);
				}
			}
			/#
				if(getdvarint(#"hash_33b0be96bf3cd69a", 0))
				{
					cylinder(v_spawn, v_spawn + vectorscale((0, 0, 1), 5000), 500, (1, 0, 0), 0, 10000);
				}
			#/
			player thread function_64df57fc(v_spawn, var_62455b3e);
		}
		level waittilltimeout(10, #"hash_3babb5bf72d208da", #"hash_58df1e8b20eb71d2");
	}
}

/*
	Name: function_411bb920
	Namespace: namespace_591b4396
	Checksum: 0xE6E95E92
	Offset: 0x4758
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_411bb920(player)
{
	if(player isinvehicle())
	{
		velocity = player getvehicleoccupied() getvelocity();
		n_weight = 2;
	}
	else
	{
		velocity = player getvelocity();
		n_weight = 7;
	}
	return velocity * n_weight;
}

/*
	Name: function_5ddbfe57
	Namespace: namespace_591b4396
	Checksum: 0xFBDD5899
	Offset: 0x47F0
	Size: 0x19E
	Parameters: 1
	Flags: Linked
*/
function function_5ddbfe57(var_68cc0f1f)
{
	var_a789c878 = level.var_fdcaf3a6.var_fe2612fe[#"hash_4c80dd6ba453f9f9"][0];
	if(isdefined(var_a789c878))
	{
		n_radius = int(var_a789c878.radius);
		n_height = int(var_a789c878.height);
		v_origin = var_a789c878.origin;
	}
	else
	{
		n_radius = 4000;
		n_height = 2000;
		v_origin = var_68cc0f1f.origin - (0, 0, n_height / 2);
	}
	var_196e22fd = spawn("trigger_radius", v_origin, 0, n_radius, n_height);
	while(!level flag::get(#"exfil_cleared"))
	{
		s_result = undefined;
		s_result = var_196e22fd waittill(#"trigger");
		level flag::set(#"hash_58df1e8b20eb71d2");
		if(isplayer(s_result.activator))
		{
			s_result.activator.var_652c0aa1 = 1;
		}
	}
}

/*
	Name: function_64df57fc
	Namespace: namespace_591b4396
	Checksum: 0x951824EE
	Offset: 0x4998
	Size: 0x76E
	Parameters: 2
	Flags: Linked
*/
function function_64df57fc(v_spawn, n_max_ai)
{
	self notify("64ba57f3ba46ae25");
	self endon("64ba57f3ba46ae25");
	self endon(#"death");
	level endon(#"exfil_cleared");
	var_5789be51 = 1024;
	var_4c93765a = 512;
	n_z_offset = 0;
	if(isdefined(self.var_36462255))
	{
		function_1eaaceab(self.var_36462255);
		foreach(ai in self.var_36462255)
		{
			ai.var_921627ad = 0;
		}
	}
	n_z_diff = abs(v_spawn[2] - self.origin[2]);
	if(n_z_diff > var_4c93765a / 2)
	{
		n_z_offset = n_z_offset + n_z_diff;
	}
	var_51753f08 = 0;
	var_5bec4f0e = 0;
	if(zm_utility::is_classic())
	{
		var_4c93765a = 40;
		var_5789be51 = 300;
		var_51753f08 = 0;
		var_5bec4f0e = n_max_ai * 3;
		if(self === level.var_3c5bdfe7)
		{
			var_2041cc26 = struct::get(#"hash_5612e33fc1c84900");
			v_spawn = var_2041cc26.origin;
		}
		else
		{
			s_smoke = level.var_fdcaf3a6.var_fe2612fe[#"smoke"][0];
			pathdata = generatenavmeshpath(self.origin, s_smoke.origin, undefined, self getpathfindingradius(), self function_6a9ae71());
			if(pathdata.status === "succeeded")
			{
				a_v_points = arraysortclosest(pathdata.pathpoints, self.origin, undefined, 500, 1000);
				if(isdefined(a_v_points[0]))
				{
					v_spawn = a_v_points[0];
				}
			}
			else
			{
				v_spawn = self.origin;
				var_5bec4f0e = n_max_ai * 5;
				var_5789be51 = 400;
				var_51753f08 = 150;
			}
		}
	}
	self.var_36462255 = [];
	var_2eb61c8a = namespace_85745671::function_e4791424(v_spawn, n_max_ai + var_5bec4f0e, var_4c93765a + n_z_offset, var_5789be51, var_51753f08);
	if(!isarray(var_2eb61c8a))
	{
		return;
	}
	var_2eb61c8a = array::randomize(var_2eb61c8a);
	n_ai_count = 0;
	i = 0;
	var_15d17eb2 = min(3, level.var_15d17eb2);
	str_bundle = "exfil_per_player_realm_" + var_15d17eb2;
	if(isdefined(level.var_7f72eddd))
	{
		str_bundle = level.var_7f72eddd;
	}
	var_6443acc = namespace_679a22ba::function_77be8a83(str_bundle);
	while(var_2eb61c8a.size && n_ai_count < n_max_ai)
	{
		waitframe(randomintrange(3, 5));
		function_9782bc57();
		v_angles = vectortoangles(self.origin - v_spawn);
		var_4bf95f4c = namespace_679a22ba::function_ca209564(str_bundle, var_6443acc);
		if(!isdefined(var_4bf95f4c))
		{
			break;
		}
		if(zm_utility::is_classic() && !isdefined(zm_zonemgr::get_zone_from_position(var_2eb61c8a[i].origin)))
		{
			i++;
			if(i >= var_2eb61c8a.size)
			{
				i = 0;
			}
			continue;
		}
		if(var_4bf95f4c.var_990b33df == #"hash_1aff4b71635bda08" && getaiarchetypearray(#"avogadro").size > getplayers().size)
		{
			var_4bf95f4c.var_990b33df = #"hash_7cba8a05511ceedf";
		}
		ai = namespace_85745671::function_9d3ad056(var_4bf95f4c.var_990b33df, var_2eb61c8a[i].origin, (0, v_angles[1], 0), "exfil_ai");
		if(isalive(ai))
		{
			namespace_679a22ba::function_266ee075(var_4bf95f4c.var_29459a31, var_6443acc);
			if(zm_utility::is_classic())
			{
				ai.v_spawn_point = var_2eb61c8a[i].origin;
				level.var_cd95afd4++;
				ai callback::function_d8abfc3d(#"on_ai_killed", &function_9974f649);
				ai callback::function_dfd4b1a0(&function_98a1d2ef);
				ai.var_126d7bef = 1;
				ai.ignore_round_spawn_failsafe = 1;
				ai.b_ignore_cleanup = 1;
				ai.ignore_enemy_count = 1;
				ai.var_45063b80 = 1;
				ai thread function_9e722b25("sprint");
			}
			n_ai_count++;
			ai.var_921627ad = 0;
			ai thread awareness::function_c241ef9a(ai, self, 10);
			if(!isdefined(self.var_36462255))
			{
				self.var_36462255 = [];
			}
			else if(!isarray(self.var_36462255))
			{
				self.var_36462255 = array(self.var_36462255);
			}
			self.var_36462255[self.var_36462255.size] = ai;
		}
		i++;
		if(i >= var_2eb61c8a.size)
		{
			i = 0;
		}
	}
}

/*
	Name: function_4b115eba
	Namespace: namespace_591b4396
	Checksum: 0xC3E1EFEA
	Offset: 0x5110
	Size: 0x4C0
	Parameters: 1
	Flags: Linked
*/
function function_4b115eba(struct)
{
	if(!isdefined(struct.radius))
	{
		struct.radius = 1024;
	}
	if(!isdefined(struct.height))
	{
		struct.height = 256;
	}
	if(!isdefined(struct.var_9b178666))
	{
		struct.var_9b178666 = 256;
	}
	if(!isdefined(struct.var_48d0f926))
	{
		struct.var_48d0f926 = 64;
	}
	struct.radius = int(struct.radius);
	struct.height = int(struct.height);
	struct.var_9b178666 = int(struct.var_9b178666);
	struct.var_48d0f926 = int(struct.var_48d0f926);
	trigger = spawn("trigger_radius", struct.origin - (0, 0, struct.height), 0, struct.radius, struct.height * 2);
	s_result = undefined;
	s_result = trigger waittill(#"trigger");
	trigger delete();
	var_15d17eb2 = min(3, level.var_15d17eb2);
	str_bundle = "default_zombies_realm_" + var_15d17eb2;
	if(isdefined(level.var_7f72eddd))
	{
		str_bundle = level.var_7f72eddd;
	}
	var_e456940b = function_a1ef346b(#"allies", struct.origin, int(struct.radius + (struct.radius / 3))).size;
	n_ai_count = 0;
	i = 0;
	var_a77909d4 = function_21a3a673(3, 5) + var_e456940b;
	if(isplayer(s_result.activator))
	{
		v_angles = vectortoangles(s_result.activator.origin - struct.origin);
	}
	else
	{
		v_angles = struct.angles;
	}
	a_v_points = array::randomize(namespace_85745671::function_e4791424(struct.origin, var_a77909d4, struct.var_48d0f926, struct.var_9b178666));
	while(n_ai_count < var_a77909d4 && a_v_points.size)
	{
		function_9782bc57();
		var_4bf95f4c = namespace_679a22ba::function_ca209564(str_bundle);
		if(!isdefined(var_4bf95f4c))
		{
			break;
		}
		ai = namespace_85745671::function_9d3ad056(var_4bf95f4c.var_990b33df, a_v_points[i].origin, (0, v_angles[1], 0), "exfil_ai");
		if(isdefined(ai))
		{
			n_ai_count++;
			ai.var_921627ad = 0;
			if(isalive(s_result.activator))
			{
				target = s_result.activator;
			}
			else
			{
				target = arraysortclosest(function_a1ef346b(), a_v_points[i], 1)[0];
			}
			if(isdefined(target))
			{
				ai thread awareness::function_c241ef9a(ai, target, 10);
			}
		}
		i++;
		if(i >= a_v_points.size)
		{
			i = 0;
		}
		waitframe(randomintrange(1, 5));
	}
}

/*
	Name: function_9e722b25
	Namespace: namespace_591b4396
	Checksum: 0x78D43333
	Offset: 0x55D8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_9e722b25(speed)
{
	self endon(#"death");
	self waittilltimeout(0.1, #"zombie_init_done");
	self zombie_utility::set_zombie_run_cycle(speed);
}

/*
	Name: function_9feae843
	Namespace: namespace_591b4396
	Checksum: 0xE611BF8C
	Offset: 0x5638
	Size: 0xC94
	Parameters: 1
	Flags: Linked
*/
function function_9feae843(var_fda8dff8)
{
	var_3ec7083c = level.var_fdcaf3a6.var_fe2612fe[#"hash_216188a7e7b381a6"][0];
	var_5789be51 = 850;
	var_4c93765a = var_3ec7083c.height;
	var_15d17eb2 = min(3, level.var_15d17eb2);
	str_bundle = "exfil_realm_" + var_15d17eb2;
	level.var_fdcaf3a6.var_1961f29a = luielemcounter::register();
	if(isdefined(level.var_dafeed10))
	{
		var_15d17eb2 = math::clamp(level.var_b48509f9 - 1, 1, 4);
		str_bundle = level.var_dafeed10 + var_15d17eb2;
	}
	if(isdefined(level.var_26ed6a07))
	{
		var_5789be51 = level.var_26ed6a07;
	}
	if(isdefined(level.var_c86f12d4))
	{
		var_4c93765a = level.var_c86f12d4;
	}
	var_6443acc = namespace_679a22ba::function_77be8a83(str_bundle);
	var_560dcc36 = 0;
	foreach(spawn_list in var_6443acc.var_7c88c117)
	{
		var_bba6879d = namespace_679a22ba::function_b9ea4226((isdefined(spawn_list.var_cffbc08) ? spawn_list.var_cffbc08 : 0), var_6443acc.var_b0abb10e);
		var_560dcc36 = var_560dcc36 + var_bba6879d;
	}
	n_ai_count = 0;
	var_4ebe6ac0 = 0;
	b_force_spawn = 0;
	level.var_560dcc36 = int(var_560dcc36);
	s_spawn_struct = level.var_fdcaf3a6.var_fe2612fe[#"hash_67801799a6276af4"][0];
	var_bf2dd48a = struct::get_array(s_spawn_struct.targetname, "target");
	var_e17c6474 = int(var_560dcc36 * randomfloatrange(0.35, 0.45));
	var_52edf274 = [];
	n = 0;
	foreach(s_spawn in var_bf2dd48a)
	{
		if(n >= var_e17c6474)
		{
			break;
		}
		if(!isdefined(var_52edf274))
		{
			var_52edf274 = [];
		}
		else if(!isarray(var_52edf274))
		{
			var_52edf274 = array(var_52edf274);
		}
		var_52edf274[var_52edf274.size] = s_spawn;
		s_spawn.var_8789040f = 1;
		n++;
	}
	var_f39e9df9 = level.var_fdcaf3a6.var_fe2612fe[#"landing_zone"][0];
	var_addaff1 = (isdefined(var_f39e9df9) ? var_f39e9df9.origin : var_fda8dff8);
	var_16895360 = var_560dcc36 - var_52edf274.size;
	var_fc44ef88 = namespace_85745671::function_e4791424(var_addaff1, var_16895360, var_4c93765a, var_5789be51);
	a_s_points = arraycombine(var_fc44ef88, array::randomize(var_52edf274));
	var_9cc58c14 = (level.var_15d17eb2 < 3 ? 0 : 1);
	i = 0;
	level.var_fdcaf3a6.var_d4245663 = spawn("trigger_radius", var_fda8dff8 - (0, 0, var_4c93765a), 512 | 1, var_5789be51 + 1024, var_4c93765a * 2);
	if(isdefined(level.var_ad5e81fe))
	{
		if(!zm_zonemgr::zone_is_enabled(level.var_ad5e81fe[0]))
		{
			zm_zonemgr::zone_wait_till_enabled(level.var_ad5e81fe[0]);
			wait(3);
		}
		level function_91fb235d();
	}
	while(n_ai_count < var_560dcc36 && a_s_points.size)
	{
		function_9782bc57();
		var_4bf95f4c = namespace_679a22ba::function_ca209564(str_bundle, var_6443acc);
		if(!isdefined(var_4bf95f4c))
		{
			break;
		}
		var_e532fd36 = 0;
		if(var_9cc58c14 && var_4bf95f4c.var_29459a31 == #"hash_39b2df3c1e9f4a1")
		{
			var_82706add = array::random(array(#"spawner_zm_steiner", #"hash_704a090ff9fcffd0"));
			b_force_spawn = 1;
			var_e532fd36 = 1;
		}
		else
		{
			var_82706add = var_4bf95f4c.var_990b33df;
		}
		s_spawn_point = a_s_points[i];
		if(is_true(s_spawn_point.var_8789040f) && (var_82706add == #"spawner_zm_steiner" || var_82706add == #"hash_704a090ff9fcffd0" || var_82706add == #"hash_4f87aa2a203d37d0"))
		{
			s_spawn_point = array::random(var_fc44ef88);
		}
		if(zm_utility::is_classic())
		{
			ai = undefined;
			if(getaiarray().size < level.zombie_ai_limit)
			{
				if(math::cointoss(25))
				{
					ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "exfil_ai", undefined, level.round_number);
				}
				else
				{
					ai = namespace_85745671::function_9d3ad056(var_82706add, s_spawn_point.origin, (0, randomint(360), 0), "exfil_ai", 0, s_spawn_point.var_90d0c0ff);
				}
			}
		}
		else
		{
			ai = namespace_85745671::function_9d3ad056(var_82706add, s_spawn_point.origin, (0, randomint(360), 0), "exfil_ai", b_force_spawn, s_spawn_point.var_90d0c0ff);
		}
		if(isdefined(ai))
		{
			namespace_679a22ba::function_266ee075(var_4bf95f4c.var_29459a31, var_6443acc);
			var_9cc58c14 = (var_e532fd36 ? 0 : var_9cc58c14);
			n_ai_count++;
			var_4ebe6ac0 = 0;
			b_force_spawn = 0;
			if(zm_utility::is_classic())
			{
				if(ai.aitype == #"spawner_zm_steiner")
				{
					level.var_560dcc36 = level.var_560dcc36 + 2;
				}
				ai.var_126d7bef = 1;
				ai.ignore_round_spawn_failsafe = 1;
				ai.ignore_enemy_count = 1;
				ai.b_ignore_cleanup = 1;
				ai.v_spawn_point = s_spawn_point.origin;
				ai thread function_9e722b25("sprint");
				ai callback::function_dfd4b1a0(&function_98a1d2ef);
			}
			ai callback::function_d8abfc3d(#"on_ai_killed", &function_9974f649);
			if(is_true(s_spawn_point.var_8789040f))
			{
				event = {#position:var_fda8dff8, #type:0};
				ai callback::function_d8abfc3d(#"hash_790882ac8688cee5", &function_b5b18121, undefined, array(event));
			}
			if(n_ai_count >= var_560dcc36)
			{
				break;
			}
		}
		else
		{
			var_4ebe6ac0++;
			if(var_4ebe6ac0 > 10 && n_ai_count < (var_560dcc36 / 2))
			{
				b_force_spawn = 1;
			}
		}
		i++;
		if(i >= a_s_points.size)
		{
			i = 0;
		}
		if(level flag::get(#"hash_3babb5bf72d208da"))
		{
			if(n_ai_count < (var_560dcc36 * 0.666) && level.var_fdcaf3a6.var_de401243 < (var_560dcc36 * 0.333))
			{
				var_9427911d = int(var_560dcc36);
			}
			else
			{
				var_9427911d = function_9a11ff2(level.var_fdcaf3a6.var_d4245663);
			}
			foreach(player in getplayers())
			{
				if(is_true(player.v_train_inbound_igc))
				{
					player function_3a488e53(1, var_9427911d);
					continue;
				}
				player function_3a488e53(0);
			}
		}
		waitframe(randomintrange(2, 5));
	}
	level thread function_6cbcd4dd(level.var_fdcaf3a6.var_d4245663);
}

/*
	Name: function_9a11ff2
	Namespace: namespace_591b4396
	Checksum: 0x34FC8BA7
	Offset: 0x62D8
	Size: 0x1AA
	Parameters: 1
	Flags: Linked
*/
function function_9a11ff2(var_d4245663)
{
	level flag::clear(#"hash_111df3215a630023");
	if(zm_utility::is_classic())
	{
		var_9427911d = (level.var_560dcc36 + level.var_cd95afd4) - level.var_fdcaf3a6.var_de401243;
	}
	else
	{
		var_c7597757 = getaiteamarray(#"axis");
		function_1eaaceab(var_c7597757);
		var_c7597757 = array::get_touching(var_c7597757, var_d4245663);
		foreach(ai in var_c7597757)
		{
			if(ai.archetype !== #"zombie")
			{
				level flag::set(#"hash_111df3215a630023");
			}
		}
		var_9427911d = max(0, var_c7597757.size);
	}
	return int(var_9427911d);
}

/*
	Name: function_b5b18121
	Namespace: namespace_591b4396
	Checksum: 0x8EDCAB18
	Offset: 0x6490
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_b5b18121(params, event)
{
	awareness::function_1db27761(self, event);
	self.var_3eaac485 = gettime() + (int(3 * 1000));
	self callback::function_52ac9652(#"hash_790882ac8688cee5", &function_b5b18121);
}

/*
	Name: function_9974f649
	Namespace: namespace_591b4396
	Checksum: 0xD328B03
	Offset: 0x6520
	Size: 0x30C
	Parameters: 1
	Flags: Linked
*/
function function_9974f649(params)
{
	if(zm_utility::is_classic())
	{
		if(is_true(self.aat_turned))
		{
			return;
		}
		if(!isdefined(params.eattacker) && !is_true(self.var_8576e0be) || (isplayer(params.eattacker) && params.eattacker.v_train_inbound_igc !== 1 && params.weapon !== getweapon(#"hash_1734871fef9c0549")))
		{
			var_990b33df = self.aitype;
			v_spawn_point = self.v_spawn_point;
			var_45063b80 = self.var_45063b80;
			do
			{
				wait(0.1);
				if(getaiarray().size < level.zombie_ai_limit)
				{
					if(is_true(var_45063b80) && zm_zonemgr::zone_is_enabled(level.var_ad5e81fe[0]))
					{
						ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "exfil_ai", undefined, level.round_number);
					}
					else
					{
						ai = namespace_85745671::function_9d3ad056(var_990b33df, v_spawn_point, (0, randomint(360), 0), "exfil_ai", 0);
					}
				}
			}
			while(!isdefined(ai));
			if(isdefined(ai))
			{
				ai.var_126d7bef = 1;
				ai.ignore_round_spawn_failsafe = 1;
				ai.ignore_enemy_count = 1;
				ai.v_spawn_point = v_spawn_point;
				if(is_true(var_45063b80))
				{
					ai.var_45063b80 = 1;
				}
				ai zm_score::function_acaab828(1);
				ai thread function_9e722b25("sprint");
				ai callback::function_d8abfc3d(#"on_ai_killed", &function_9974f649);
				ai callback::function_dfd4b1a0(&function_98a1d2ef);
			}
		}
		else
		{
			level.var_fdcaf3a6.var_de401243++;
		}
	}
	else
	{
		level.var_fdcaf3a6.var_de401243++;
	}
}

/*
	Name: function_98a1d2ef
	Namespace: namespace_591b4396
	Checksum: 0xDE0F1D77
	Offset: 0x6838
	Size: 0x20
	Parameters: 1
	Flags: Linked
*/
function function_98a1d2ef(params)
{
	level.var_fdcaf3a6.var_de401243++;
}

/*
	Name: function_6cbcd4dd
	Namespace: namespace_591b4396
	Checksum: 0x1DEBD6DA
	Offset: 0x6860
	Size: 0x436
	Parameters: 1
	Flags: Linked
*/
function function_6cbcd4dd(var_d4245663)
{
	var_a328c44d = (zm_utility::is_classic() ? 0 : 3);
	do
	{
		if(level flag::get(#"hash_23a3320be9d9bcbb") && getplayers().size == 1 && !getdvarint(#"hash_33b0be96bf3cd69a", 0))
		{
			level flag::set(#"hash_69567098e4924a9c");
			break;
		}
		v_train_inbound_igc = 0;
		foreach(player in laststand::function_7fb2bbfc())
		{
			if(is_true(player.v_train_inbound_igc))
			{
				v_train_inbound_igc = 1;
				level flag::set(#"hash_fdc24944f59c262");
				break;
			}
		}
		if(!v_train_inbound_igc)
		{
			level flag::clear(#"hash_fdc24944f59c262");
		}
		wait(1);
		var_9427911d = function_9a11ff2(var_d4245663);
		foreach(player in getplayers())
		{
			if(is_true(player.v_train_inbound_igc))
			{
				player function_3a488e53(1, var_9427911d);
				continue;
			}
			player function_3a488e53(0);
		}
	}
	while(var_9427911d > var_a328c44d || level flag::get(#"hash_111df3215a630023"));
	level flag::set(#"exfil_cleared");
	if(!level flag::get(#"hash_69567098e4924a9c"))
	{
		var_4ba6c205 = getaiteamarray(#"axis");
		function_1eaaceab(var_4ba6c205);
		foreach(ai in var_4ba6c205)
		{
			if(isalive(ai))
			{
				gibserverutils::annihilate(ai);
				ai kill(undefined, undefined, undefined, undefined, undefined, 1);
			}
			waitframe(1);
		}
	}
}

/*
	Name: function_9782bc57
	Namespace: namespace_591b4396
	Checksum: 0xA2D167C0
	Offset: 0x6CA0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_9782bc57()
{
	if(!zm_utility::is_classic())
	{
		level flag::wait_till("spawn_zombies");
	}
}

/*
	Name: function_85679542
	Namespace: namespace_591b4396
	Checksum: 0x39B2D2D6
	Offset: 0x6CE0
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_85679542()
{
	s_smoke = level.var_fdcaf3a6.var_fe2612fe[#"smoke"][0];
	if(isdefined(s_smoke))
	{
		v_loc = s_smoke.origin;
	}
	else
	{
		v_loc = level.var_fdcaf3a6.var_fe2612fe[#"hash_216188a7e7b381a6"][0].origin;
	}
	playfx(#"hash_7475814841f63432", v_loc, (1, 0, 0));
}

/*
	Name: function_fa5bd408
	Namespace: namespace_591b4396
	Checksum: 0xF37843BC
	Offset: 0x6D98
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_fa5bd408(a_zones)
{
	if(isdefined(a_zones))
	{
		level.var_ad5e81fe = a_zones;
	}
}

/*
	Name: function_91fb235d
	Namespace: namespace_591b4396
	Checksum: 0x833FC0B0
	Offset: 0x6DC8
	Size: 0x1B6
	Parameters: 0
	Flags: Linked
*/
function function_91fb235d()
{
	foreach(zone in level.zones)
	{
		var_2757561 = (isinarray(level.var_ad5e81fe, zone.name) ? 1 : 0);
		if(var_2757561)
		{
			level.zones[zone.name].is_spawning_allowed = var_2757561;
			level.zones[zone.name].is_active = var_2757561;
		}
	}
	foreach(zone in level.zones)
	{
		var_2757561 = (isinarray(level.var_ad5e81fe, zone.name) ? 1 : 0);
		if(!var_2757561)
		{
			level.zones[zone.name].is_spawning_allowed = var_2757561;
		}
	}
}

/*
	Name: function_3a488e53
	Namespace: namespace_591b4396
	Checksum: 0x18CADA44
	Offset: 0x6F88
	Size: 0x284
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3a488e53(b_show, n_remaining)
{
	if(!isdefined(level.var_fdcaf3a6.var_1961f29a))
	{
		return;
	}
	if(b_show)
	{
		if(!level.var_fdcaf3a6.var_1961f29a luielemcounter::is_open(self))
		{
			level.var_fdcaf3a6.var_1961f29a luielemcounter::open(self, 1);
			waitframe(1);
			level.var_fdcaf3a6.var_1961f29a luielemcounter::set_number(self, n_remaining);
			level.var_fdcaf3a6.var_1961f29a luielemcounter::set_x(self, int(10));
			level.var_fdcaf3a6.var_1961f29a luielemcounter::set_y(self, int(26.66667));
			level.var_fdcaf3a6.var_1961f29a luielemcounter::set_green(self, 1);
			level.var_fdcaf3a6.var_1961f29a luielemcounter::set_blue(self, 1);
			level.var_fdcaf3a6.var_1961f29a luielemcounter::set_red(self, 1);
			level.var_fdcaf3a6.var_1961f29a luielemcounter::set_alpha(self, 0.75);
			level.var_fdcaf3a6.var_1961f29a luielemcounter::set_horizontal_alignment(self, 1);
		}
		else
		{
			level.var_fdcaf3a6.var_1961f29a luielemcounter::set_number(self, n_remaining);
		}
	}
	else if(level.var_fdcaf3a6.var_1961f29a luielemcounter::is_open(self))
	{
		level.var_fdcaf3a6.var_1961f29a luielemcounter::close(self);
	}
}

/*
	Name: function_591cb2f4
	Namespace: namespace_591b4396
	Checksum: 0xA9F5E459
	Offset: 0x7218
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_591cb2f4(t_exfil)
{
	if(zm_utility::is_classic())
	{
		return self zm_zonemgr::is_player_in_zone(level.var_ad5e81fe);
	}
	return self istouching(t_exfil);
}

/*
	Name: function_7c05a985
	Namespace: namespace_591b4396
	Checksum: 0x62FEDAB1
	Offset: 0x7278
	Size: 0x190
	Parameters: 1
	Flags: None
*/
function function_7c05a985(destination)
{
	level endon(#"hash_345e9169ebba28fb");
	if(!is_false(getgametypesetting(#"hash_7d1368d8d487beed")) || getdvarint(#"hash_33b0be96bf3cd69a", 0))
	{
		exfil = function_5a957da0(destination);
		if(isdefined(exfil))
		{
			namespace_8b6a9d79::function_20d7e9c7(exfil);
		}
		s_result = undefined;
		s_result = level waittill(#"objective_ended");
	}
	if(isdefined(level.var_7d45d0d4.var_14f09b99))
	{
		[[level.var_7d45d0d4.var_14f09b99]](s_result);
		return;
	}
	if(is_true(s_result.completed))
	{
		str_reason = #"hash_6ebafb1370ab6c93";
	}
	else
	{
		str_reason = #"hash_22a0611dcd352614";
	}
	level notify(#"end_game", {#reason:str_reason});
}

/*
	Name: function_5a957da0
	Namespace: namespace_591b4396
	Checksum: 0xBEAAA2A9
	Offset: 0x7418
	Size: 0x2EA
	Parameters: 1
	Flags: Linked
*/
function function_5a957da0(destination)
{
	var_1dc01e72 = [];
	foreach(location in destination.locations)
	{
		instances = array::randomize(namespace_8b6a9d79::function_f703a5a(location));
		foreach(instance in instances)
		{
			if(instance.content_script_name === #"exfil")
			{
				var_60bfdf49 = instance;
				var_3007472f = instance.var_d5b937da;
				if(isdefined(var_3007472f))
				{
					var_df889249 = array::random(strtok(var_3007472f, ","));
				}
				else
				{
					var_df889249 = undefined;
				}
				/#
					var_a9dd0fe1 = getdvarint(#"hash_33b0be96bf3cd69a", 0);
					if(var_a9dd0fe1)
					{
						if(var_a9dd0fe1 === instance.script_int)
						{
							return instance;
						}
						continue;
					}
				#/
				if(!isdefined(instance.var_a07fca34) || instance.var_a07fca34 <= zm_utility::function_e3025ca5())
				{
					if(!isdefined(var_df889249) || level.var_7d45d0d4.var_c4181ea.script_int === var_df889249)
					{
						if(!isdefined(var_1dc01e72))
						{
							var_1dc01e72 = [];
						}
						else if(!isarray(var_1dc01e72))
						{
							var_1dc01e72 = array(var_1dc01e72);
						}
						var_1dc01e72[var_1dc01e72.size] = instance;
					}
				}
			}
		}
	}
	exfil = array::random(var_1dc01e72);
	if(!isdefined(exfil))
	{
		exfil = var_60bfdf49;
	}
	return exfil;
}

/*
	Name: function_39eec401
	Namespace: namespace_591b4396
	Checksum: 0x50BF2380
	Offset: 0x7710
	Size: 0x196
	Parameters: 1
	Flags: Linked, Private
*/
function private function_39eec401(instance)
{
	script = namespace_8b6a9d79::function_85255d0f(instance.content_script_name);
	if(!getdvarint(#"hash_33b0be96bf3cd69a", 0))
	{
		s_result = undefined;
		s_result = level waittill(#"hash_345e9169ebba28fb", #"hash_3e765c26047c9f54");
	}
	if(s_result._notify === #"hash_3e765c26047c9f54" || getdvarint(#"hash_33b0be96bf3cd69a", 0))
	{
		objective_manager::start_objective(instance);
		objective_manager::function_9751c453(script.var_331b7cc3, instance.var_fe2612fe[#"hash_216188a7e7b381a6"][0].origin, instance);
	}
	else if(isdefined(instance.var_e55c8b4e))
	{
		var_7d0e37f8 = instance.var_fe2612fe[#"hash_3966465c498df3a6"][0];
		var_7d0e37f8 zm_utility::function_48d9a9c9();
		zm_utility::function_bc5a54a8(instance.var_e55c8b4e);
		instance.var_e55c8b4e = undefined;
	}
}

/*
	Name: function_595332df
	Namespace: namespace_591b4396
	Checksum: 0x65CD2EAD
	Offset: 0x78B0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_595332df()
{
	level endon(#"end_game");
	var_bbdb0dfe = getent("exfil_heli_slick", "targetname");
	if(isdefined(var_bbdb0dfe))
	{
		zombie_utility::clear_all_corpses();
		var_bbdb0dfe solid();
		var_bbdb0dfe moveto(var_bbdb0dfe.origin + vectorscale((0, 0, 1), 100), 3);
	}
}

/*
	Name: function_5a22584f
	Namespace: namespace_591b4396
	Checksum: 0x8B2378C6
	Offset: 0x7980
	Size: 0x488
	Parameters: 0
	Flags: None
*/
function function_5a22584f()
{
	level endon(#"end_game", #"hash_3e765c26047c9f54");
	v_trigger_offset = (0, 0, 0);
	level.var_560dcc36 = 0;
	level.var_cd95afd4 = 0;
	s_beacon = struct::get("exfil_radio");
	if(!isdefined(s_beacon))
	{
		return;
	}
	level flag::set("rbz_exfil_allowed");
	var_6afa034c = namespace_8b6a9d79::spawn_script_model(s_beacon, #"p9_zm_radio_pack_01_surface");
	var_6afa034c playloopsound(#"hash_1c4b0081e8984d28");
	var_6afa034c function_23a29590();
	while(true)
	{
		level flag::wait_till("rbz_exfil_beacon_active");
		var_6afa034c playloopsound(#"hash_48f43a95480d8b91");
		var_6afa034c function_619a5c20();
		level.var_1ea1d494 = spawn("trigger_radius_use", s_beacon.origin + v_trigger_offset, 0, 100);
		level.var_1ea1d494 setcursorhint("HINT_NOICON");
		level.var_1ea1d494 sethintstring(#"hash_24961462354ea22");
		level.var_1ea1d494 usetriggerignoreuseholdtime();
		level.var_1ea1d494 function_268e4500();
		level.var_1ea1d494 usetriggerrequirelookat(0);
		level.var_1ea1d494 triggerignoreteam();
		level.var_1ea1d494.var_9d7362a4 = #"hash_24961462354ea22";
		var_f354b9b2 = gameobjects::create_use_object(#"any", level.var_1ea1d494, [], (0, 0, 0), #"hash_3cf318117c602737", 1);
		var_f354b9b2 gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
		var_f354b9b2 gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
		var_f354b9b2 gameobjects::set_use_time(1.5);
		var_f354b9b2 gameobjects::set_onuse_event(&onuse);
		var_f354b9b2 gameobjects::set_onbeginuse_event(&function_69ea81e2);
		var_f354b9b2 gameobjects::set_onenduse_event(&function_6ab13d0f);
		var_f354b9b2.dontlinkplayertotrigger = 1;
		var_f354b9b2.keepweapon = 1;
		e_fx = util::spawn_model("tag_origin", var_6afa034c.origin, var_6afa034c.angles);
		playfxontag(#"hash_507d21e96f587fc4", e_fx, "tag_origin");
		level flag::wait_till_clear("rbz_exfil_beacon_active");
		if(isdefined(e_fx))
		{
			e_fx delete();
		}
		var_6afa034c playloopsound(#"hash_1c4b0081e8984d28");
		var_6afa034c function_23a29590();
		var_f354b9b2 function_992dc59a();
	}
}

/*
	Name: onuse
	Namespace: namespace_591b4396
	Checksum: 0x2BCC1D41
	Offset: 0x7E10
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function onuse(player)
{
	if(getgametypesetting(#"hash_704e4a94667cfe72"))
	{
		var_8e862768 = namespace_af5c1c0c::function_c65468ef(player, #"hash_575d68cca86c8df4", #"hash_37a354c147ec32f0");
		if(!var_8e862768)
		{
			return;
		}
	}
	if(isplayer(player))
	{
		player thread zm_vo::function_d342796e(#"hash_7e50fb36129dc24b", 1.5);
		level.var_3c5bdfe7 = player;
	}
	level flag::clear("spawn_zombies");
	level flag::set(#"hash_3e765c26047c9f54");
	self thread function_992dc59a();
}

/*
	Name: function_69ea81e2
	Namespace: namespace_591b4396
	Checksum: 0xAEB1352E
	Offset: 0x7F30
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_69ea81e2(player)
{
	self.trigger setinvisibletoplayer(player);
}

/*
	Name: function_6ab13d0f
	Namespace: namespace_591b4396
	Checksum: 0xA5F03078
	Offset: 0x7F60
	Size: 0x34
	Parameters: 3
	Flags: Linked
*/
function function_6ab13d0f(team, player, success)
{
	self.trigger setvisibletoplayer(success);
}

/*
	Name: function_992dc59a
	Namespace: namespace_591b4396
	Checksum: 0xB48073D
	Offset: 0x7FA0
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_992dc59a()
{
	self gameobjects::destroy_object(1, 1);
	level.var_1ea1d494 = undefined;
}

/*
	Name: on_round_end
	Namespace: namespace_591b4396
	Checksum: 0x2B1BBBDE
	Offset: 0x7FD8
	Size: 0xD4
	Parameters: 0
	Flags: Linked, Private
*/
function private on_round_end()
{
	round_number = zm_utility::get_round_number();
	if(round_number === getgametypesetting("zmExfilRound") && getgametypesetting("zmExfilRound") != 0)
	{
		level notify(#"hash_61e8a39b3a4bee6a");
		level flag::wait_till("rbz_exfil_allowed");
		level.var_aaf7505f = level.var_aaf7505f + 15;
		level flag::set(#"hash_3e765c26047c9f54");
	}
}

/*
	Name: on_ai_spawned
	Namespace: namespace_591b4396
	Checksum: 0x847989C0
	Offset: 0x80B8
	Size: 0x132
	Parameters: 0
	Flags: Linked
*/
function on_ai_spawned()
{
	if(!isactor(self) || !isdefined(self.aitype))
	{
		return;
	}
	switch(self.aitype)
	{
		case "spawner_zm_steiner_split_radiation_bomb":
		case "spawner_zm_steiner_split_radiation_blast":
		{
			self.var_126d7bef = 1;
			self.ignore_round_spawn_failsafe = 1;
			self.b_ignore_cleanup = 1;
			self.ignore_enemy_count = 1;
			var_f39e9df9 = level.var_fdcaf3a6.var_fe2612fe[#"landing_zone"][0];
			self.v_spawn_point = var_f39e9df9.origin;
			self callback::function_dfd4b1a0(&function_98a1d2ef);
			self callback::function_d8abfc3d(#"on_ai_killed", &function_9974f649);
			break;
		}
	}
}

/*
	Name: cleanup_main
	Namespace: namespace_591b4396
	Checksum: 0x63EE867B
	Offset: 0x81F8
	Size: 0x194
	Parameters: 0
	Flags: Linked, Private
*/
function private cleanup_main()
{
	level endon(#"end_game");
	n_next_eval = 0;
	while(true)
	{
		util::wait_network_frame();
		n_time = gettime();
		if(n_time < n_next_eval)
		{
			continue;
		}
		if(!level flag::get(#"hash_3babb5bf72d208da"))
		{
			continue;
		}
		n_next_eval = n_next_eval + 3000;
		a_ai_enemies = getaiteamarray(#"axis");
		foreach(ai_enemy in a_ai_enemies)
		{
			if(level.n_cleanups_processed_this_frame >= 1)
			{
				level.n_cleanups_processed_this_frame = 0;
				util::wait_network_frame();
			}
			ai_enemy do_cleanup_check(1000000);
		}
	}
}

/*
	Name: do_cleanup_check
	Namespace: namespace_591b4396
	Checksum: 0xC9D0F3F2
	Offset: 0x8398
	Size: 0x22C
	Parameters: 1
	Flags: Linked
*/
function do_cleanup_check(n_cleanup_dist_sq)
{
	if(!isalive(self))
	{
		return;
	}
	if(self.var_2bf69a41 === 1)
	{
		return;
	}
	n_time_alive = gettime() - self.spawn_time;
	if(n_time_alive < 5000)
	{
		return;
	}
	if(is_true(self.var_61c270))
	{
		return;
	}
	if(n_time_alive < 45000 && self.completed_emerging_into_playable_area !== 1 && !is_true(self.var_357c108b))
	{
		return;
	}
	var_846b034e = self function_268efd73();
	level.n_cleanups_processed_this_frame++;
	if(!var_846b034e)
	{
		n_dist_sq_min = 10000000;
		players = getplayers();
		e_closest_player = players[0];
		foreach(player in players)
		{
			if(!isalive(player))
			{
				continue;
			}
			n_dist_sq = distancesquared(self.origin, player.origin);
			if(n_dist_sq < n_dist_sq_min)
			{
				n_dist_sq_min = n_dist_sq;
				e_closest_player = player;
			}
		}
		if(n_dist_sq_min >= n_cleanup_dist_sq)
		{
			self thread function_96f7787d();
		}
	}
}

/*
	Name: function_268efd73
	Namespace: namespace_591b4396
	Checksum: 0xD263EAFB
	Offset: 0x85D0
	Size: 0xAA
	Parameters: 0
	Flags: Linked
*/
function function_268efd73()
{
	if(!isdefined(level.var_ad5e81fe))
	{
		return false;
	}
	foreach(zone in level.var_ad5e81fe)
	{
		if(self zm_zonemgr::entity_in_zone(zone))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_96f7787d
	Namespace: namespace_591b4396
	Checksum: 0x7C7A3EBE
	Offset: 0x8688
	Size: 0x36
	Parameters: 0
	Flags: Linked, Private
*/
function private function_96f7787d()
{
	self.var_61c270 = 1;
	self delete_zombie_noone_looking();
	if(isdefined(self))
	{
		self.var_61c270 = undefined;
	}
}

/*
	Name: delete_zombie_noone_looking
	Namespace: namespace_591b4396
	Checksum: 0x31A0A84B
	Offset: 0x86C8
	Size: 0xEC
	Parameters: 0
	Flags: Linked, Private
*/
function private delete_zombie_noone_looking()
{
	if(is_true(self.in_the_ground))
	{
		return;
	}
	if(!self.allowdeath)
	{
		return;
	}
	foreach(player in level.players)
	{
		if(player.sessionstate == "spectator")
		{
			continue;
		}
		if(self zm_cleanup::player_can_see_me(player))
		{
			return;
		}
	}
	self cleanup_zombie();
}

/*
	Name: cleanup_zombie
	Namespace: namespace_591b4396
	Checksum: 0x969485B4
	Offset: 0x87C0
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function cleanup_zombie()
{
	if(!isalive(self))
	{
		/#
			println("");
		#/
		return;
	}
	self zombie_utility::reset_attack_spot();
	/#
	#/
	self.var_c39323b5 = 1;
	self.var_e700d5e2 = 1;
	self.allowdeath = 1;
	self.var_98f1f37c = 1;
	self kill(undefined, undefined, undefined, undefined, undefined, 1);
	waitframe(1);
	if(isdefined(self))
	{
		self delete();
	}
}

