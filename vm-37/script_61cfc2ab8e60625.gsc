#using script_1292451e284848cc;
#using script_4ccd0c3512b52a10;
#using script_6809bf766eba194a;
#using script_73e0d5e10c6348fa;
#using script_7cf3e180e994d17f;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\objectives.gsc;
#using scripts\cp_common\util.gsc;

#namespace namespace_b100dd86;

/*
	Name: init_clientfields
	Namespace: namespace_b100dd86
	Checksum: 0xD0CE6C9D
	Offset: 0x418
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("toplayer", "lerp_fov", 1, 3, "int");
	clientfield::register("toplayer", "force_stream_weapons", 1, 2, "int");
}

/*
	Name: function_9109a1fe
	Namespace: namespace_b100dd86
	Checksum: 0xAFE34CA7
	Offset: 0x488
	Size: 0xD2
	Parameters: 0
	Flags: Linked
*/
function function_9109a1fe()
{
	level.adler = self;
	self function_854b5376(1);
	self.radius = 32;
	level thread util::magic_bullet_shield(self);
	var_7e4a7b32 = getweapon(#"ar_accurate_t9", "steadyaim", "reflex");
	self namespace_c25eb016::function_65d14a19(var_7e4a7b32);
	self ai::set_behavior_attribute("useGrenades", 0);
	self.script_forcecolor = "o";
}

/*
	Name: function_87d56d50
	Namespace: namespace_b100dd86
	Checksum: 0x6F8FDBB1
	Offset: 0x568
	Size: 0xD2
	Parameters: 0
	Flags: Linked
*/
function function_87d56d50()
{
	level.woods = self;
	self function_854b5376(1);
	self.radius = 32;
	self ai::set_behavior_attribute("useGrenades", 0);
	level thread util::magic_bullet_shield(self);
	var_7e4a7b32 = getweapon(#"ar_standard_t9", "steadyaim", "reflex");
	self namespace_c25eb016::function_65d14a19(var_7e4a7b32);
	self.script_forcecolor = "c";
}

/*
	Name: function_b61ea696
	Namespace: namespace_b100dd86
	Checksum: 0x8AE6B792
	Offset: 0x648
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_b61ea696()
{
	self.radius = 32;
	self.ignoresuppression = 1;
	self.forcesprint = 1;
	self val::set("sprinter_guy", "ignoreme", 1);
	self val::set("sprinter_guy", "ignoreall", 1);
	self ai::set_behavior_attribute("sprint", 1);
	self waittill(#"goal");
	self val::reset("sprinter_guy", "ignoreme");
	self val::reset("sprinter_guy", "ignoreall");
}

/*
	Name: function_ea49bc9
	Namespace: namespace_b100dd86
	Checksum: 0x62B2FBB6
	Offset: 0x750
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_ea49bc9()
{
	level.wife = self;
	self.radius = 32;
	self.ignoreall = 1;
	level thread util::magic_bullet_shield(self);
}

/*
	Name: function_c3eb1449
	Namespace: namespace_b100dd86
	Checksum: 0xD408AE33
	Offset: 0x7A0
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function function_c3eb1449()
{
	level.var_2e5999de = self;
	self.ignoreall = 1;
	self.ignoreme = 1;
}

/*
	Name: function_170c5fef
	Namespace: namespace_b100dd86
	Checksum: 0xF16D5969
	Offset: 0x7D8
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function function_170c5fef()
{
	level.var_cb7eb1d8 = self;
}

/*
	Name: function_f82142f8
	Namespace: namespace_b100dd86
	Checksum: 0x4B7C37E7
	Offset: 0x7F0
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_f82142f8(notify_str, body_model)
{
	if(isdefined(notify_str))
	{
		level waittill(notify_str);
	}
	self setmodel(body_model);
}

/*
	Name: function_76bbdeec
	Namespace: namespace_b100dd86
	Checksum: 0x33670F9F
	Offset: 0x840
	Size: 0xA2
	Parameters: 2
	Flags: Linked
*/
function function_76bbdeec(notify_str, head_model)
{
	if(isdefined(notify_str))
	{
		level waittill(notify_str);
	}
	if(isdefined(self.hatmodel))
	{
		self detach(self.hatmodel);
	}
	if(isdefined(self.head))
	{
		self detach(self.head);
	}
	self attach(head_model);
	self.head = head_model;
}

/*
	Name: function_6578b894
	Namespace: namespace_b100dd86
	Checksum: 0xBA34F15F
	Offset: 0x8F0
	Size: 0x21C
	Parameters: 0
	Flags: Linked
*/
function function_6578b894()
{
	self endon(#"death");
	level notify(#"hash_530a04ce72c2c9");
	self thread function_a0f1fa27();
	objectives::follow("obj_takedown_qasim", self, undefined, undefined, 0, #"hash_29f1e9a2d045faaf");
	self val::set(#"qasim", "ignoreall", 1);
	self val::set(#"qasim", "ignoreme", 1);
	self.var_c681e4c1 = 1;
	self.forcesprint = 1;
	self disableaimassist();
	self function_854b5376(1);
	self function_2ce879d2(260);
	lmg = getweapon(#"lmg_light_t9");
	self setweapon(lmg);
	self thread set_ignoreall();
	self thread function_b1518d0e();
	self waittill(#"reached_path_end");
	objectives::remove("obj_takedown_qasim");
	level thread function_c212022b(180);
	self notify(#"hash_637416a1c8f37fe3");
	self deletedelay();
}

/*
	Name: function_c212022b
	Namespace: namespace_b100dd86
	Checksum: 0x9E04FBE4
	Offset: 0xB18
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_c212022b(seconds)
{
	level endon(#"hash_530a04ce72c2c9");
	wait(seconds);
	util::missionfailedwrapper(#"hash_556f31329ba0db54");
}

/*
	Name: function_a66feb27
	Namespace: namespace_b100dd86
	Checksum: 0x4A737901
	Offset: 0xB70
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function function_a66feb27()
{
	self thread function_a0f1fa27();
	level notify(#"hash_530a04ce72c2c9");
	objectives::follow("obj_takedown_qasim", self, undefined, undefined, 0, #"hash_29f1e9a2d045faaf");
	self.ignoreall = 1;
	self.ignoreme = 1;
	self.forcesprint = 1;
	self disableaimassist();
	self ai::set_behavior_attribute("sprint", 1);
	level thread scene::play("scene_tkd_hit2_qasim_vault", "Vault", self);
	self waittill(#"hash_49e6b2675defe779");
	objectives::hide("obj_takedown_qasim");
	self notify(#"hash_637416a1c8f37fe3");
	self deletedelay();
	level thread function_a3c6d04c();
}

/*
	Name: function_a3c6d04c
	Namespace: namespace_b100dd86
	Checksum: 0xD604060
	Offset: 0xCD0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_a3c6d04c()
{
	objloc = struct::get("obj_jump", "targetname");
	objectives::complete("follow_adler", level.adler);
	objectives::follow("obj_rooftop_jump", objloc.origin, undefined, undefined, 0, #"hash_579ea815337d21d3");
	level flag::wait_till("flag_start_roof_slide");
	objectives::remove("obj_rooftop_jump");
}

/*
	Name: function_b1518d0e
	Namespace: namespace_b100dd86
	Checksum: 0xEF68688C
	Offset: 0xDA0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_b1518d0e()
{
	self endon(#"death");
	self flag::wait_till("ignoreall_false");
	self val::reset(#"qasim", "ignoreall");
}

/*
	Name: set_ignoreall
	Namespace: namespace_b100dd86
	Checksum: 0x70942F56
	Offset: 0xE08
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function set_ignoreall()
{
	self endon(#"death");
	self flag::wait_till("ignoreall_true");
	self val::set(#"qasim", "ignoreall", 1);
}

/*
	Name: function_a0f1fa27
	Namespace: namespace_b100dd86
	Checksum: 0x165F73C9
	Offset: 0xE78
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_a0f1fa27()
{
	self endon(#"hash_637416a1c8f37fe3");
	self waittill(#"death");
	util::missionfailedwrapper(#"hash_acfc290b8145de6");
}

/*
	Name: function_3e6a0d68
	Namespace: namespace_b100dd86
	Checksum: 0x44F3052C
	Offset: 0xED0
	Size: 0x13A
	Parameters: 1
	Flags: None
*/
function function_3e6a0d68(str_aigroup)
{
	var_523ed269 = getspawnerarray(str_aigroup, "script_aigroup");
	aiarray = array();
	foreach(spawner in var_523ed269)
	{
		guy = spawner spawner::spawn(1);
		if(!isdefined(aiarray))
		{
			aiarray = [];
		}
		else if(!isarray(aiarray))
		{
			aiarray = array(aiarray);
		}
		aiarray[aiarray.size] = guy;
	}
	return aiarray;
}

/*
	Name: array_spawn
	Namespace: namespace_b100dd86
	Checksum: 0x22767936
	Offset: 0x1018
	Size: 0x142
	Parameters: 2
	Flags: Linked
*/
function array_spawn(name, key)
{
	var_523ed269 = getspawnerarray(name, key);
	aiarray = array();
	foreach(spawner in var_523ed269)
	{
		guy = spawner spawnfromspawner(spawner.targetname, 1);
		if(!isdefined(aiarray))
		{
			aiarray = [];
		}
		else if(!isarray(aiarray))
		{
			aiarray = array(aiarray);
		}
		aiarray[aiarray.size] = guy;
	}
	return aiarray;
}

/*
	Name: function_53531f27
	Namespace: namespace_b100dd86
	Checksum: 0x6B0859C
	Offset: 0x1168
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_53531f27(key, val)
{
	if(!isdefined(val))
	{
		val = "targetname";
	}
	trig = getent(key, val);
	if(isdefined(trig) && trig istriggerenabled())
	{
		trig trigger::use();
	}
}

/*
	Name: function_5431431d
	Namespace: namespace_b100dd86
	Checksum: 0xB4B976AF
	Offset: 0x11F0
	Size: 0x2D8
	Parameters: 0
	Flags: Linked
*/
function function_5431431d()
{
	plane = getent("cargo_plane", "targetname");
	plane notsolid();
	things = getentarray("af_plane_triggers", "targetname");
	things = arraycombine(things, getentarray("plane_floor_clip", "targetname"));
	things = arraycombine(things, getentarray("plane_cargo", "targetname"));
	foreach(thing in things)
	{
		thing enablelinkto();
		thing linkto(plane, "tag_body_animate");
	}
	snd::function_b23661d5(plane, "cargo_plane");
	plane namespace_db2381c4::function_8e4c996d();
	plane namespace_db2381c4::function_b6cccb8();
	scene::add_scene_func("scene_tkd_hit3_chase_plane", &function_d804fc99, "init");
	plane thread scene::init("scene_tkd_hit3_chase_plane");
	thread function_d60a1c78(plane);
	level.var_2762a9c = plane;
	thread scene::init("scene_tkd_hit3_intro_overlook_arash", [0:level.var_2762a9c]);
	level.var_c7b3a621 = util::spawn_model("tag_origin", plane.origin - (200, 0, 175), plane.angles);
	level.var_c7b3a621 linkto(plane);
	return plane;
}

/*
	Name: function_d804fc99
	Namespace: namespace_b100dd86
	Checksum: 0x24FF7EC4
	Offset: 0x14D0
	Size: 0x148
	Parameters: 1
	Flags: Linked
*/
function function_d804fc99(a_ents)
{
	var_936fb5e7 = [3:"Prop 4", 2:"Prop 3", 1:"Prop 2", 0:"Prop 1"];
	foreach(prop in var_936fb5e7)
	{
		if(isdefined(a_ents[prop]) && !isdefined(a_ents[prop].clip))
		{
			clip = getent(prop, "script_noteworthy");
			a_ents[prop].clip = clip;
			clip linkto(a_ents[prop], undefined, (0, 0, 0), (0, 0, 0));
		}
	}
}

/*
	Name: function_c8381339
	Namespace: namespace_b100dd86
	Checksum: 0xE570C864
	Offset: 0x1620
	Size: 0x2E4
	Parameters: 2
	Flags: Linked
*/
function function_c8381339(plane, var_857b0901)
{
	probe = getent("cargo_probe_1", "targetname");
	if(isdefined(probe))
	{
		probe linkto(plane, "tag_body_animate", vectorscale((-1, 0, 1), 24), (0, 0, 0));
	}
	probe = getent("cargo_probe_2", "targetname");
	if(isdefined(probe))
	{
		probe linkto(plane, "tag_body_animate", (-152, 0, 24), (0, 0, 0));
	}
	probe = getent("cargo_probe_3", "targetname");
	if(isdefined(probe))
	{
		probe linkto(plane, "tag_body_animate", (-288, 0, 24), (0, 0, 0));
	}
	probe = getent("cargo_probe_4", "targetname");
	if(isdefined(probe))
	{
		probe linkto(plane, "tag_body_animate", (-408, 0, -40), (0, 0, 0));
	}
	if(var_857b0901)
	{
		probe = getent("cargo_probe_5", "targetname");
		if(isdefined(probe))
		{
			probe linkto(plane, "tag_body_animate", (-72, 0, -88), (0, 0, 0));
		}
		probe = getent("cargo_probe_6", "targetname");
		if(isdefined(probe))
		{
			probe linkto(plane, "tag_body_animate", (72, 280, -48), (0, 0, 0));
		}
		probe = getent("cargo_probe_7", "targetname");
		if(isdefined(probe))
		{
			probe linkto(plane, "tag_body_animate", (72, -280, -48), (0, 0, 0));
		}
		probe = getent("cargo_probe_8", "targetname");
		if(isdefined(probe))
		{
			probe linkto(plane, "tag_body_animate", (-664, 0, -40), (0, 0, 0));
		}
	}
}

/*
	Name: function_1c77193b
	Namespace: namespace_b100dd86
	Checksum: 0x29A28C4
	Offset: 0x1910
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_1c77193b(plane)
{
	level waittill(#"hash_1e1d8f91cb3b7e82");
	plane namespace_db2381c4::function_675a8b8c();
	self waittill(#"start_slowmo");
	plane namespace_db2381c4::function_ee23b003();
}

/*
	Name: function_d60a1c78
	Namespace: namespace_b100dd86
	Checksum: 0x59ACDBD4
	Offset: 0x1980
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_d60a1c78(plane)
{
	wait(0.2);
	level.var_7929453e = util::spawn_model("tag_origin", plane.origin, plane.angles);
	plane linkto(level.var_7929453e, undefined, (0, 0, 0), (0, 0, 0));
}

/*
	Name: function_19919872
	Namespace: namespace_b100dd86
	Checksum: 0x70CBF60B
	Offset: 0x19F8
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_19919872()
{
	level.var_2e151cca = spawner::simple_spawn("af_plane_guy");
	foreach(guy in level.var_2e151cca)
	{
		guy linkto(level.var_2762a9c, "tag_body_animate");
	}
}

/*
	Name: setup_objectives
	Namespace: namespace_b100dd86
	Checksum: 0x37B9C743
	Offset: 0x1AB8
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function setup_objectives(var_567f1ddd)
{
	switch(var_567f1ddd)
	{
		default:
		{
			break;
		}
	}
}

/*
	Name: function_5aabc3fb
	Namespace: namespace_b100dd86
	Checksum: 0x19EB93B3
	Offset: 0x1AF8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_5aabc3fb()
{
	ents = getentarray("intro_runway_lights", "targetname");
	array::delete_all(ents);
}

