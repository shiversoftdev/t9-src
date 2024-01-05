#using script_34ab99a4ca1a43d;
#using script_176597095ddfaa17;
#using script_4163291d6e693552;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using script_5a525a75a8f1f7e4;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using script_1029986e2bc8ca8e;
#using script_27347f09888ad15;
#using script_113dd7f0ea2a1d4f;
#using script_35598499769dbb3d;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using script_1471eea5d2e60f83;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_e69881c5;

/*
	Name: function_384bf4fd
	Namespace: namespace_e69881c5
	Checksum: 0xA2ACD6B7
	Offset: 0x488
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_384bf4fd()
{
	level notify(-2097393221);
}

/*
	Name: function_4f8b33df
	Namespace: namespace_e69881c5
	Checksum: 0xF89C4DC1
	Offset: 0x4A8
	Size: 0x22C
	Parameters: 1
	Flags: None
*/
function function_4f8b33df(instance)
{
	instance.var_7a9e6505 = 1;
	var_6201c191 = namespace_8b6a9d79::function_31e8da78(instance.location.destination, "loot_pods");
	instance thread function_c97fdd1d(var_6201c191);
	self function_9e96f231(#"laser");
	self.var_aa4b496 = 0;
	self.health = 6000;
	self.var_265cb589 = 1;
	self.var_a123c71 = 0;
	self vehicle::toggle_sounds(0);
	self vehicle::lights_off();
	self vehicle::get_on_path(getvehiclenode("node_phase_rover", "targetname"));
	self.overridevehicledamage = &function_978eec63;
	namespace_c09ae6c3::function_9ed7339b(instance);
	function_4e0f32cf(instance);
	self thread function_81f989d5(instance);
	level flag::wait_till(#"hash_4b060b9820d4141d");
	self.var_b7eee573.e_fx = util::spawn_model("tag_origin", self.var_b7eee573.origin, self.var_dafa2b89.angles);
	util::wait_network_frame();
	if(isdefined(self.var_b7eee573.e_fx))
	{
		self.var_b7eee573.e_fx linkto(self, "tag_cage_attach", vectorscale((0, 0, 1), 17));
	}
}

/*
	Name: function_540c0d15
	Namespace: namespace_e69881c5
	Checksum: 0x5620498A
	Offset: 0x6E0
	Size: 0x474
	Parameters: 1
	Flags: None
*/
function function_540c0d15(instance)
{
	if(level flag::get(#"hash_1558183088c6ccff"))
	{
		return;
	}
	self endon(#"death");
	instance endon(#"objective_ended");
	showmiscmodels("sv_phase_aetherfungus");
	instance thread function_17f1d0f3();
	instance thread function_a528be11();
	level thread zm_vo::function_7622cb70("Step4PhaseRoverStart");
	self vehicle::toggle_lights_group(4, 1);
	self vehicle::toggle_sounds(1);
	self vehicle::lights_on();
	self playsound(#"hash_388c12acd0e0928");
	self playrumblelooponentity(#"sr_machinery_rumble");
	self clientfield::increment("" + #"hash_738f0a13dc61e2ec");
	self clientfield::set("" + #"hash_711d7caaed939f5f", 1);
	self clientfield::set("" + #"hash_3178e1dcaee33fd3", 1);
	wait(2);
	if(isdefined(self.var_b7eee573))
	{
		if(isdefined(self.var_b7eee573.e_fx))
		{
			self.var_b7eee573.e_fx clientfield::set("" + #"hash_4bedc093642e28f6", 1);
		}
		self.var_b7eee573 notify(#"hash_62901a3385d3e7af");
		self.var_b7eee573 notify(#"hash_4708ec2a663db459");
	}
	wait(1);
	self clientfield::set("" + #"hash_1e59af4706036a79", 1);
	self playrumbleonentity(#"hash_2d43d9987e4a73a8");
	self thread function_3c40b07a();
	self thread function_1e4eea8e(instance);
	self thread function_d30f71c4(instance);
	wait(2);
	self clientfield::set("" + #"hash_3178e1dcaee33fd3", 0);
	wait(2);
	function_f928c8f5();
	self thread function_c8b3217e(instance);
	self thread function_a7ae3459(instance);
	self thread function_d4694f6c(instance);
	self thread function_7ae500b2(instance);
	self thread function_24735dd6(instance);
	self thread function_9072f256(instance);
	self thread function_a76b2c1f(instance);
	self thread function_738143f5(instance);
	self thread function_79ae8e99(instance);
	self thread function_2db63909(instance);
	self thread function_1eef26bc(instance);
	self thread function_ca92ed05(instance);
}

/*
	Name: function_206ee608
	Namespace: namespace_e69881c5
	Checksum: 0x9447407C
	Offset: 0xB60
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_206ee608()
{
	a_vehicles = getvehiclearray();
	foreach(vehicle in a_vehicles)
	{
		if(vehicle.vehicletype !== #"vehicle_motorcycle_mil_us_offroad")
		{
			if(isdefined(vehicle))
			{
				vehicle delete();
			}
		}
	}
}

/*
	Name: function_a528be11
	Namespace: namespace_e69881c5
	Checksum: 0x502915E1
	Offset: 0xC28
	Size: 0x160
	Parameters: 0
	Flags: None
*/
function function_a528be11()
{
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_37c638fd5c6acd16");
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 2);
	}
	self waittill(#"objective_ended");
	foreach(player in getplayers())
	{
		level.var_31028c5d thread prototype_hud::set_active_obj_visibility(player, 0);
	}
}

/*
	Name: function_17f1d0f3
	Namespace: namespace_e69881c5
	Checksum: 0xF96ACFA
	Offset: 0xD90
	Size: 0x8A
	Parameters: 0
	Flags: None
*/
function function_17f1d0f3()
{
	self.var_61c57c53 = self namespace_7589cf5c::function_1b53cdc7() + 3;
	self.var_5de17ec9 = self namespace_7589cf5c::function_56fa33d9() + 1;
	self.var_2133c784 = 0;
	self.var_b803db9c = 0;
	self.var_74ec00fb = 0;
	self.n_zombies_max = function_e677fbe0();
}

/*
	Name: function_c8b3217e
	Namespace: namespace_e69881c5
	Checksum: 0x188A462B
	Offset: 0xE28
	Size: 0x110
	Parameters: 1
	Flags: None
*/
function function_c8b3217e(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(distance2dsquared(player.origin, self.origin) <= 250000)
			{
				player.var_99582f14 = 1;
				continue;
			}
			player.var_99582f14 = 0;
		}
		wait(0.25);
	}
}

/*
	Name: function_a7ae3459
	Namespace: namespace_e69881c5
	Checksum: 0xA615E4A7
	Offset: 0xF40
	Size: 0x1E8
	Parameters: 1
	Flags: None
*/
function function_a7ae3459(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	a_vehicles = getvehiclearray();
	foreach(vehicle in a_vehicles)
	{
		if(isalive(vehicle) && distance2dsquared(vehicle.origin, self.origin) <= 250000)
		{
			vehicle.var_e5f956c5 = 1;
		}
	}
	while(true)
	{
		foreach(vehicle in a_vehicles)
		{
			if(isalive(vehicle))
			{
				if(distance2dsquared(vehicle.origin, self.origin) <= 250000)
				{
					vehicle.var_99582f14 = 1;
					continue;
				}
				vehicle.var_99582f14 = 0;
			}
		}
		wait(0.25);
	}
}

/*
	Name: function_f928c8f5
	Namespace: namespace_e69881c5
	Checksum: 0x2B03DFF4
	Offset: 0x1130
	Size: 0x138
	Parameters: 0
	Flags: None
*/
function function_f928c8f5()
{
	foreach(mdl_clip in getentarray("sr_boundary_clip", "targetname"))
	{
		mdl_clip notsolid();
	}
	foreach(mdl_clip in getentarray("sr_boundary_clip_island", "targetname"))
	{
		mdl_clip notsolid();
	}
}

/*
	Name: function_7ae500b2
	Namespace: namespace_e69881c5
	Checksum: 0x11479AE9
	Offset: 0x1270
	Size: 0x3A8
	Parameters: 1
	Flags: None
*/
function function_7ae500b2(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death", #"destruct");
	self.var_a123c71 = 0;
	self.var_f8edfabd = 0;
	self.var_59078fae = 0;
	self thread vehicle::go_path();
	self setbrake(1);
	self setspeedimmediate(0);
	self thread function_36359055(instance);
	while(true)
	{
		self.var_f4bd7934 = 1;
		self.n_players = 0;
		foreach(player in getplayers())
		{
			if(distance2dsquared(player.origin, self.origin) > 250000 || player laststand::player_is_in_laststand())
			{
				self.var_f4bd7934 = 0;
			}
		}
		wait(0.25);
		if(!self.var_f4bd7934 || is_true(self.abnormal_status.emped))
		{
			self setspeed(0, 5, 3);
			self.var_a123c71 = 0;
			self setbrake(1);
			self vehicle::toggle_lights_group(4, 1);
			self clientfield::set("" + #"hash_db052f565349c0d", 0);
			self notify(#"hash_4e0c5de3e24d5af8");
			if(!isdefined(self.var_b79a8ac7) && !self.var_f8edfabd)
			{
				self thread function_174dde71();
			}
		}
		else
		{
			self notify(#"hash_d2f2236898d7b64");
			self setspeed(6, 5, 3);
			self.var_a123c71 = 1;
			self setbrake(0);
			self vehicle::toggle_lights_group(4, 0);
			self clientfield::set("" + #"hash_db052f565349c0d", 1);
			self.var_f8edfabd = 0;
			namespace_85745671::function_b70e2a37(self);
			if(self.var_59078fae)
			{
				self.var_59078fae = 0;
				self connectpaths();
			}
		}
	}
}

/*
	Name: function_2db63909
	Namespace: namespace_e69881c5
	Checksum: 0xBFBC34F3
	Offset: 0x1620
	Size: 0x714
	Parameters: 1
	Flags: None
*/
function function_2db63909(instance)
{
	self endon(#"death");
	self waittill(#"hash_4d73332b0eee788d");
	exploder::exploder("fxexp_aether_state_new");
	exploder::exploder("fxexp_aether_state_new_2");
	exploder::exploder("lgtexp_dark_aether_bridge");
	exploder::exploder("lgtexp_dark_aether_bridge_2");
	exploder::exploder("fxexp_mq_phase_amb");
	level flag::set(#"in_dark_side");
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("" + #"hash_34af381c063f6611", 1);
		player.var_e5f956c5 = 1;
	}
	self waittill(#"hash_afde535fe1be7d0");
	namespace_d0ab5955::function_d4dec4e8(instance.location.destination, #"hash_77c04aaf41a18e41");
	self waittill(#"hash_654e85dc63fd03c5");
	exploder::stop_exploder("fxexp_aether_state_new");
	exploder::stop_exploder("fxexp_aether_state_new_2");
	exploder::stop_exploder("lgtexp_dark_aether_bridge");
	exploder::stop_exploder("lgtexp_dark_aether_bridge_2");
	exploder::stop_exploder("fxexp_mq_phase_amb");
	level flag::clear(#"in_dark_side");
	foreach(player in getplayers())
	{
		player.var_e5f956c5 = undefined;
		player.var_41c16555 = undefined;
	}
	self clientfield::set("" + #"hash_1e59af4706036a79", 0);
	self waittill(#"reached_end_node");
	foreach(mdl_clip in getentarray("sr_boundary_clip_island", "targetname"))
	{
		mdl_clip solid();
	}
	level flag::set(#"hash_2ae96d681e4ea79f");
	if(isdefined(self.var_b7eee573))
	{
		self.var_b7eee573 playsound(#"hash_f029e59bea76d50");
	}
	objective_manager::objective_ended(instance, 1);
	namespace_7589cf5c::function_3899cfea();
	level thread function_af7669e6();
	self vehicle::toggle_lights_group(4, 1);
	self vehicle::toggle_sounds(0);
	self vehicle::lights_off();
	wait(2);
	if(isdefined(self.var_b7eee573))
	{
		self.var_b7eee573.e_fx clientfield::set("" + #"hash_4bedc093642e28f6", 0);
		self.var_b7eee573 fx::play(#"hash_1b9b90f45278a5ae", self.var_b7eee573.origin + vectorscale((0, 0, 1), 22), self.var_b7eee573.angles, #"hash_62901a3385d3e7af", 1);
		self.var_b7eee573 playsound(#"hash_75c73a4779a02dbb");
	}
	util::wait_network_frame();
	if(isdefined(self.var_b7eee573.e_fx))
	{
		self.var_b7eee573.e_fx delete();
	}
	if(isdefined(self.var_b7eee573))
	{
		self.var_b7eee573 delete();
	}
	wait(0.25);
	level notify(#"hash_62901a3385d3e7af");
	foreach(player in getplayers())
	{
		player.var_99582f14 = 0;
	}
	level flag::set(#"hash_1558183088c6ccff");
	self playrumbleonentity(#"hash_2d43d9987e4a73a8");
	self kill();
}

/*
	Name: function_af7669e6
	Namespace: namespace_e69881c5
	Checksum: 0x43DEFB6F
	Offset: 0x1D40
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_af7669e6()
{
	level zm_vo::function_7622cb70("Step4PhaseRoverEnd");
	wait(0.5);
	level zm_vo::function_7622cb70("Step4PhaseRoverEndResponse");
}

/*
	Name: function_174dde71
	Namespace: namespace_e69881c5
	Checksum: 0x6C59A1C9
	Offset: 0x1D98
	Size: 0x122
	Parameters: 0
	Flags: None
*/
function function_174dde71()
{
	self endon(#"hash_d2f2236898d7b64", #"death");
	self.var_f8edfabd = 1;
	wait(1);
	self disconnectpaths();
	self.var_59078fae = 1;
	wait(1);
	slots = namespace_85745671::function_bdb2b85b(self, self.origin, self.angles, 64, 4, 300);
	if(!isdefined(slots) || slots.size <= 0)
	{
		self.var_f8edfabd = 0;
		return;
	}
	self.var_b79a8ac7 = {#slots:slots, #hash_f019ea1a:1000};
	level.attackables[level.attackables.size] = self;
	self.var_f8edfabd = 0;
}

/*
	Name: function_36359055
	Namespace: namespace_e69881c5
	Checksum: 0xAE16D0C5
	Offset: 0x1EC8
	Size: 0x86
	Parameters: 1
	Flags: None
*/
function function_36359055(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	while(true)
	{
		if(!is_true(self.var_a123c71))
		{
			self playsound(#"hash_52af5fa9a4db69a2");
		}
		wait(3);
	}
}

/*
	Name: function_a76b2c1f
	Namespace: namespace_e69881c5
	Checksum: 0x9AC8AFD5
	Offset: 0x1F58
	Size: 0x208
	Parameters: 1
	Flags: None
*/
function function_a76b2c1f(instance)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"bridge", #"stairs");
		if(s_result._notify === "bridge")
		{
			s_pos = struct::get("bridge_pos");
			self thread namespace_7589cf5c::function_ac709d66(instance, #"hash_206f96ca8a8b9649");
		}
		else
		{
			s_pos = struct::get("stairs_pos");
		}
		if(!isdefined(s_pos))
		{
			return;
		}
		a_s_pts = namespace_85745671::function_e4791424(s_pos.origin, 40, 40, s_pos.radius);
		if(!isdefined(a_s_pts))
		{
			return;
		}
		a_s_spawnpts = array::randomize(a_s_pts);
		n_spawns = function_dae1a57b() + (int(function_dae1a57b() * 0.5));
		for(i = 0; i < n_spawns; i++)
		{
			if(isdefined(a_s_spawnpts[i]))
			{
				self thread function_dd9b1007(instance, a_s_spawnpts[i].origin, a_s_spawnpts[i].angles);
			}
			wait(0.1);
		}
	}
}

/*
	Name: function_738143f5
	Namespace: namespace_e69881c5
	Checksum: 0x64BF4E5
	Offset: 0x2168
	Size: 0x70
	Parameters: 1
	Flags: None
*/
function function_738143f5(instance)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	while(true)
	{
		self waittill(#"assault");
		self thread function_95015f9a(instance);
	}
}

/*
	Name: function_95015f9a
	Namespace: namespace_e69881c5
	Checksum: 0xF3DED88
	Offset: 0x21E0
	Size: 0x14C
	Parameters: 1
	Flags: None
*/
function function_95015f9a(instance)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	v_ground = self function_6d122cef();
	if(!isdefined(v_ground))
	{
		return;
	}
	a_s_pts = namespace_85745671::function_e4791424(v_ground, 40, 40, 2400);
	if(!isdefined(a_s_pts))
	{
		return;
	}
	a_s_spawnpts = array::randomize(a_s_pts);
	n_spawns = function_dae1a57b();
	for(i = 0; i < n_spawns; i++)
	{
		if(isdefined(a_s_spawnpts[i]) && instance.var_74ec00fb < instance.n_zombies_max)
		{
			self thread function_dd9b1007(instance, a_s_spawnpts[i].origin, a_s_spawnpts[i].angles);
		}
		wait(0.1);
	}
}

/*
	Name: function_6d122cef
	Namespace: namespace_e69881c5
	Checksum: 0xB82013F6
	Offset: 0x2338
	Size: 0x14A
	Parameters: 0
	Flags: None
*/
function function_6d122cef()
{
	self endon(#"death");
	nd_current = self.currentnode;
	if(isdefined(nd_current))
	{
		v_forward = (vectornormalize(anglestoforward(nd_current.angles)) * 2400) + nd_current.origin;
	}
	else
	{
		v_forward = (vectornormalize(anglestoforward(self.angles)) * 2400) + self.origin;
	}
	if(isdefined(v_forward))
	{
		v_ground = groundtrace(v_forward + vectorscale((0, 0, 1), 1000), v_forward + (vectorscale((0, 0, -1), 1000)), 0, self)[#"position"];
	}
	if(!isdefined(v_ground))
	{
		if(isdefined(self.nextnode))
		{
			v_ground = self.nextnode.origin;
		}
		else
		{
			v_ground = self.origin;
		}
	}
	return v_ground;
}

/*
	Name: function_dd9b1007
	Namespace: namespace_e69881c5
	Checksum: 0x22EECC49
	Offset: 0x2490
	Size: 0x294
	Parameters: 3
	Flags: None
*/
function function_dd9b1007(instance, v_spawnpt, v_ang)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	level flag::wait_till("spawn_zombies");
	var_7ecdee63 = function_aece4588(level.var_b48509f9);
	if(namespace_7589cf5c::function_82e262cf(var_7ecdee63))
	{
		if(isdefined(instance.var_38c710c3))
		{
			n_cooldown = namespace_7589cf5c::function_190c51a9();
			var_be32c966 = (float(gettime()) / 1000) - instance.var_38c710c3;
			if(var_be32c966 < n_cooldown)
			{
				var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
			}
			else
			{
				instance.var_38c710c3 = undefined;
			}
		}
		if(instance.var_2133c784 >= instance.var_61c57c53 || instance.var_b803db9c >= instance.var_5de17ec9)
		{
			var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
		}
	}
	ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, v_spawnpt, v_ang, "rover_zombie");
	wait(0.1);
	if(isdefined(ai_spawned))
	{
		ai_spawned.var_a950813d = 1;
		instance.var_74ec00fb++;
		if(namespace_7589cf5c::function_82e262cf(ai_spawned.aitype))
		{
			instance.var_38c710c3 = float(gettime()) / 1000;
			instance.var_2133c784++;
			instance.var_b803db9c++;
			ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
		}
		else
		{
			ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &on_zombie_killed);
		}
		ai_spawned thread zombie_attack(self, instance);
	}
}

/*
	Name: function_dae1a57b
	Namespace: namespace_e69881c5
	Checksum: 0xAAA36F4D
	Offset: 0x2730
	Size: 0xCE
	Parameters: 0
	Flags: None
*/
function function_dae1a57b()
{
	n_players = getplayers().size;
	switch(n_players)
	{
		case 1:
		{
			n_spawns = 6;
			break;
		}
		case 2:
		{
			n_spawns = 9;
			break;
		}
		case 3:
		{
			n_spawns = 13;
			break;
		}
		case 4:
		{
			n_spawns = 18;
			break;
		}
		default:
		{
			n_spawns = 8;
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_e677fbe0
	Namespace: namespace_e69881c5
	Checksum: 0x451DD5C2
	Offset: 0x2808
	Size: 0x18E
	Parameters: 0
	Flags: None
*/
function function_e677fbe0()
{
	switch(getplayers().size)
	{
		case 1:
		{
			n_spawns = 8;
			n_spawns = min(12, int((level.var_b48509f9 * 0.5) + n_spawns));
			break;
		}
		case 2:
		{
			n_spawns = 12;
			n_spawns = min(16, int((level.var_b48509f9 * 0.5) + n_spawns));
			break;
		}
		case 3:
		{
			n_spawns = 18;
			n_spawns = min(22, int((level.var_b48509f9 * 0.5) + n_spawns));
			break;
		}
		case 4:
		{
			n_spawns = 24;
			n_spawns = min(28, int((level.var_b48509f9 * 0.5) + n_spawns));
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_aece4588
	Namespace: namespace_e69881c5
	Checksum: 0x1BD47C64
	Offset: 0x29A0
	Size: 0x186
	Parameters: 1
	Flags: None
*/
function function_aece4588(var_3afe334f)
{
	switch(var_3afe334f)
	{
		case 1:
		{
			var_e7a1cbae = #"hash_57db40fab3d9600a";
			break;
		}
		case 2:
		{
			var_e7a1cbae = #"hash_57db3ffab3d95e57";
			break;
		}
		case 3:
		{
			var_e7a1cbae = #"hash_57db3efab3d95ca4";
			break;
		}
		case 4:
		{
			var_e7a1cbae = #"hash_57db3dfab3d95af1";
			break;
		}
		case 5:
		{
			var_e7a1cbae = #"hash_57db3cfab3d9593e";
			break;
		}
		case 6:
		{
			var_e7a1cbae = #"hash_57db3bfab3d9578b";
			break;
		}
		case 7:
		{
			var_e7a1cbae = #"hash_57db3afab3d955d8";
			break;
		}
		default:
		{
			var_e7a1cbae = #"hash_57db39fab3d95425";
			break;
		}
	}
	var_6017f33e = namespace_679a22ba::function_ca209564(var_e7a1cbae);
	return var_6017f33e.var_990b33df;
}

/*
	Name: zombie_attack
	Namespace: namespace_e69881c5
	Checksum: 0x893C3B32
	Offset: 0x2B30
	Size: 0x15E
	Parameters: 2
	Flags: None
*/
function zombie_attack(var_29611f04, instance)
{
	self endon(#"death");
	var_29611f04 endon(#"death");
	instance endon(#"objective_ended");
	self.var_ed0e316b = "sprint";
	self callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
	wait(0.1);
	while(true)
	{
		a_players = getplayers();
		player = awareness::function_d7fedde2(self);
		if(!isdefined(self.is_attacking) && isalive(self) && isalive(player))
		{
			self.is_attacking = 1;
			awareness::function_c241ef9a(self, player, 16);
		}
		wait(15);
		self.is_attacking = undefined;
	}
}

/*
	Name: function_c36cb7b1
	Namespace: namespace_e69881c5
	Checksum: 0x829FD80F
	Offset: 0x2C98
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_c36cb7b1(params)
{
	if(isdefined(level.var_7d45d0d4.var_3385b421.var_b803db9c) && level.var_7d45d0d4.var_3385b421.var_b803db9c > 0)
	{
		level.var_7d45d0d4.var_3385b421.var_b803db9c--;
	}
}

/*
	Name: on_zombie_killed
	Namespace: namespace_e69881c5
	Checksum: 0xF6ECD7
	Offset: 0x2D10
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function on_zombie_killed(params)
{
	if(isdefined(level.var_7d45d0d4.var_3385b421.var_74ec00fb) && level.var_7d45d0d4.var_3385b421.var_74ec00fb > 0)
	{
		level.var_7d45d0d4.var_3385b421.var_74ec00fb--;
	}
}

/*
	Name: function_fd68cae4
	Namespace: namespace_e69881c5
	Checksum: 0x9D7FC9D5
	Offset: 0x2D88
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_fd68cae4()
{
	if(self.archetype == #"zombie")
	{
		self namespace_85745671::function_9758722("super_sprint");
	}
}

/*
	Name: function_79ae8e99
	Namespace: namespace_e69881c5
	Checksum: 0xFE3392B8
	Offset: 0x2DD0
	Size: 0x4BC
	Parameters: 1
	Flags: None
*/
function function_79ae8e99(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	while(true)
	{
		a_zombies = function_a38db454(self.origin, 200);
		foreach(zombie in a_zombies)
		{
			if(zombie.archetype === #"zombie" && is_true(self.var_a123c71) && !is_true(zombie.knockdown))
			{
				if(distance2dsquared(self.origin, zombie.origin) > sqr(60))
				{
					continue;
				}
				zombie dodamage(50, self.origin, self, undefined, undefined, "MOD_CRUSH");
				zombie.knockdown = 1;
				zombie.knockdown_type = "knockdown_shoved";
				zombie_to_target = self.origin - zombie.origin;
				zombie_to_target_2d = vectornormalize((zombie_to_target[0], zombie_to_target[1], 0));
				zombie_forward = anglestoforward(zombie.angles);
				zombie_forward_2d = vectornormalize((zombie_forward[0], zombie_forward[1], 0));
				zombie_right = anglestoright(zombie.angles);
				zombie_right_2d = vectornormalize((zombie_right[0], zombie_right[1], 0));
				dot = vectordot(zombie_to_target_2d, zombie_forward_2d);
				if(dot >= 0.5)
				{
					zombie.knockdown_direction = "front";
					zombie.getup_direction = "getup_back";
					zombie thread function_c93a6362(self);
				}
				else
				{
					if(dot < 0.5 && dot > -0.5)
					{
						dot = vectordot(zombie_to_target_2d, zombie_right_2d);
						if(dot > 0)
						{
							zombie.knockdown_direction = "right";
							if(math::cointoss())
							{
								zombie.getup_direction = "getup_back";
							}
							else
							{
								zombie.getup_direction = "getup_belly";
							}
						}
						else
						{
							zombie.knockdown_direction = "left";
							zombie.getup_direction = "getup_belly";
						}
					}
					else
					{
						zombie.knockdown_direction = "back";
						zombie.getup_direction = "getup_belly";
					}
				}
				continue;
			}
			if(zombie.archetype === #"zombie" && is_true(self.var_a123c71) && is_true(zombie.knockdown))
			{
				if(distance2dsquared(self.origin, zombie.origin) > sqr(60))
				{
					continue;
				}
				zombie thread function_c93a6362(self);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_c93a6362
	Namespace: namespace_e69881c5
	Checksum: 0x39993CF3
	Offset: 0x3298
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_c93a6362(var_b8ca9d7)
{
	self endon(#"death");
	var_b8ca9d7 endon(#"death");
	if(isdefined(self.knockdown_direction) && isalive(self))
	{
		self thread function_1b4b0c63(var_b8ca9d7);
	}
}

/*
	Name: function_1b4b0c63
	Namespace: namespace_e69881c5
	Checksum: 0x2E05485
	Offset: 0x3310
	Size: 0x14A
	Parameters: 1
	Flags: None
*/
function function_1b4b0c63(var_b8ca9d7)
{
	self endon(#"death");
	var_b8ca9d7 endon(#"death");
	wait(1);
	v_forward = var_b8ca9d7.origin + (anglestoforward(var_b8ca9d7.angles) * 60);
	if(distance2dsquared(var_b8ca9d7.origin, self.origin) < sqr(70))
	{
		gibserverutils::annihilate(self);
		if(isalive(self))
		{
			if(zm_utility::is_magic_bullet_shield_enabled(self))
			{
				self util::stop_magic_bullet_shield();
			}
			if(isalive(self))
			{
				self kill();
			}
		}
	}
	else
	{
		self.knockdown_direction = undefined;
	}
}

/*
	Name: function_8375e4a7
	Namespace: namespace_e69881c5
	Checksum: 0xF2A6DA27
	Offset: 0x3468
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function function_8375e4a7()
{
	level flag::wait_till("all_players_spawned");
	a_s_pos = struct::get_array("player_rover_pos");
	a_players = getplayers();
	for(i = 0; i < a_players.size; i++)
	{
		a_players[i] setorigin(a_s_pos[i].origin);
		a_players[i] setplayerangles(a_s_pos[i].angles);
	}
	level thread function_6b7297f6();
}

/*
	Name: function_3c40b07a
	Namespace: namespace_e69881c5
	Checksum: 0x87E2ABA3
	Offset: 0x3560
	Size: 0x160
	Parameters: 0
	Flags: None
*/
function function_3c40b07a()
{
	self endon(#"death");
	self.n_start_health = self.health;
	self.max_health = self.n_start_health;
	var_8da3e170 = self.health / self.n_start_health;
	zm_sq::sndonoverride_eye_(var_8da3e170);
	zm_sq::function_2398ab16("objective_ended");
	while(true)
	{
		var_c3a3ae13 = self.health / self.n_start_health;
		if(var_c3a3ae13 >= 0 && var_8da3e170 != var_c3a3ae13)
		{
			zm_sq::sndonoverride_eye_(var_c3a3ae13);
		}
		var_8da3e170 = var_c3a3ae13;
		if(var_c3a3ae13 <= 0.5 && !is_true(self.var_5e22f781))
		{
			self.var_5e22f781 = 1;
		}
		if(var_c3a3ae13 <= 0.2 && !is_true(self.var_2eb5c0e8))
		{
			self.var_2eb5c0e8 = 1;
		}
		waitframe(1);
	}
}

/*
	Name: function_1e4eea8e
	Namespace: namespace_e69881c5
	Checksum: 0x47D0E88
	Offset: 0x36C8
	Size: 0xE0
	Parameters: 1
	Flags: None
*/
function function_1e4eea8e(instance)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	var_ad5fcb11 = 0;
	while(true)
	{
		if(is_true(self.var_a123c71))
		{
			if(var_ad5fcb11 != 1)
			{
				self playsound(#"hash_432c591c600ef4d2");
				var_ad5fcb11 = 1;
			}
		}
		else if(var_ad5fcb11 != 0)
		{
			self playsound(#"hash_5d9bb1a3ab5cf792");
			var_ad5fcb11 = 0;
		}
		wait(0.25);
	}
}

/*
	Name: function_d30f71c4
	Namespace: namespace_e69881c5
	Checksum: 0x9610B09F
	Offset: 0x37B0
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_d30f71c4(instance)
{
	instance endon(#"objective_ended");
	self endon(#"reached_end_node");
	self waittill(#"death");
	if(isdefined(self))
	{
		self clientfield::set("" + #"hash_1e59af4706036a79", 0);
		self.var_a123c71 = 0;
	}
	if(isdefined(self))
	{
		radiusdamage(self.origin, 1200, 1000, 500, self, "MOD_EXPLOSIVE");
	}
	objective_manager::objective_ended(instance, 0);
}

/*
	Name: function_d4694f6c
	Namespace: namespace_e69881c5
	Checksum: 0x47B9F00C
	Offset: 0x3890
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_d4694f6c(instance)
{
	self.n_objective_id = zm_utility::function_f5a222a8(#"hash_33a2a5933ee65208", self);
	instance waittill(#"objective_ended");
	zm_utility::function_bc5a54a8(self.n_objective_id);
}

/*
	Name: function_24735dd6
	Namespace: namespace_e69881c5
	Checksum: 0x50FEEEB3
	Offset: 0x3900
	Size: 0x2E0
	Parameters: 1
	Flags: None
*/
function function_24735dd6(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"riser", #"bridge_riser");
		var_cec14fb9 = undefined;
		if(s_result._notify === "bridge_riser")
		{
			var_90a50598 = (isdefined(instance.var_fe2612fe[#"hash_49cdcfaa651f27b1"]) ? instance.var_fe2612fe[#"hash_49cdcfaa651f27b1"] : []);
			str_soundalias = #"hash_77ae7c9f20198410";
			n_dist = 600;
			n_speed = 100;
		}
		else
		{
			var_90a50598 = (isdefined(instance.var_fe2612fe[#"hash_2cbcef3b0e436f8f"]) ? instance.var_fe2612fe[#"hash_2cbcef3b0e436f8f"] : []);
			str_soundalias = #"hash_86b3b0126e9a252";
			var_cec14fb9 = #"";
			n_dist = 2400;
			n_speed = 150;
		}
		n_time = n_dist / n_speed;
		for(i = 0; i < var_90a50598.size; i++)
		{
			var_a989d2f6 = namespace_8b6a9d79::spawn_script_model(var_90a50598[i], #"p9_fxanim_zm_silver_jellyfish_large_xmodel", 0);
			if(isdefined(var_a989d2f6))
			{
				var_a989d2f6 setscale(var_90a50598[i].modelscale);
				var_a989d2f6 clientfield::set("" + #"ambient_fx", 1);
				wait(1);
				var_a989d2f6 movez(n_dist, n_time, 1, 1);
				var_a989d2f6 playsound(str_soundalias);
				if(isdefined(var_cec14fb9))
				{
					var_a989d2f6 playloopsound(#"hash_3deffccf71f6691f");
				}
				var_a989d2f6 thread function_753752c6(instance);
			}
		}
	}
}

/*
	Name: function_4e0f32cf
	Namespace: namespace_e69881c5
	Checksum: 0xCCC17DF5
	Offset: 0x3BE8
	Size: 0x1B8
	Parameters: 1
	Flags: None
*/
function function_4e0f32cf(instance)
{
	var_90a50598 = (isdefined(instance.var_fe2612fe[#"jellyfish_large"]) ? instance.var_fe2612fe[#"jellyfish_large"] : []);
	foreach(var_b6e76b65 in var_90a50598)
	{
		var_dafcbf83 = namespace_8b6a9d79::spawn_script_model(var_b6e76b65, #"p9_fxanim_zm_silver_jellyfish_large_xmodel", 0);
		util::wait_network_frame();
		if(isdefined(var_dafcbf83))
		{
			var_dafcbf83 thread function_6312130f(instance);
			var_dafcbf83 thread function_753752c6(instance);
			var_dafcbf83 setscale(var_b6e76b65.modelscale);
			wait(randomfloatrange(0.05, 0.25));
			var_dafcbf83 clientfield::set("" + #"ambient_fx", 1);
		}
	}
}

/*
	Name: function_6312130f
	Namespace: namespace_e69881c5
	Checksum: 0xE5312D6
	Offset: 0x3DA8
	Size: 0xF8
	Parameters: 1
	Flags: None
*/
function function_6312130f(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	level flag::wait_till("all_players_spawned");
	foreach(player in getplayers())
	{
		self setinvisibletoplayer(player);
		self thread function_aa475e00(instance, player);
	}
}

/*
	Name: function_753752c6
	Namespace: namespace_e69881c5
	Checksum: 0xB941B1FE
	Offset: 0x3EA8
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_753752c6(instance)
{
	self endon(#"death");
	level.var_c39a4b8f endon(#"death");
	instance endon(#"objective_ended");
	level.var_c39a4b8f waittill(#"hash_654e85dc63fd03c5");
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_aa475e00
	Namespace: namespace_e69881c5
	Checksum: 0xA92BAA62
	Offset: 0x3F38
	Size: 0x17C
	Parameters: 2
	Flags: None
*/
function function_aa475e00(instance, player)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	player endon(#"death");
	var_4c979c5b = getentarray("sr_boundary_clip", "targetname");
	while(true)
	{
		player.var_d3316c50 = 0;
		foreach(var_b7e0b1c0 in var_4c979c5b)
		{
			if(player istouching(var_b7e0b1c0))
			{
				player.var_d3316c50 = 1;
			}
		}
		if(isdefined(player) && is_true(player.var_d3316c50))
		{
			break;
		}
		wait(0.1);
	}
	if(isdefined(player))
	{
		self setvisibletoplayer(player);
	}
}

/*
	Name: function_81f989d5
	Namespace: namespace_e69881c5
	Checksum: 0x404A197F
	Offset: 0x40C0
	Size: 0x1C8
	Parameters: 1
	Flags: None
*/
function function_81f989d5(instance)
{
	self endon(#"death");
	self waittill(#"hash_4d73332b0eee788d");
	var_ee024c6b = (isdefined(instance.var_fe2612fe[#"hash_2401ff8cbe2bdd13"]) ? instance.var_fe2612fe[#"hash_2401ff8cbe2bdd13"] : []);
	instance.var_c851d175 = [];
	foreach(var_2fb4d3dd in var_ee024c6b)
	{
		var_b8b81de9 = util::spawn_model(#"hash_46cb6387fd2006a7", var_2fb4d3dd.origin, var_2fb4d3dd.angles);
		wait(randomfloatrange(0.1, 0.5));
		instance.var_c851d175[instance.var_c851d175.size] = var_b8b81de9;
		var_b8b81de9 clientfield::set("" + #"ambient_fx", 1);
		var_b8b81de9 thread scene::play(#"hash_76544dedcadfdf05", "idle", var_b8b81de9);
	}
}

/*
	Name: function_9072f256
	Namespace: namespace_e69881c5
	Checksum: 0x2FA7B61F
	Offset: 0x4290
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_9072f256(instance)
{
	instance endon(#"objective_ended");
	self waittill(#"hash_2401ff8cbe2bdd13");
	for(i = 0; i < instance.var_c851d175.size; i++)
	{
		instance.var_c851d175[i] thread function_12e2aa23();
		wait(randomfloatrange(0.5, 0.8));
	}
}

/*
	Name: function_12e2aa23
	Namespace: namespace_e69881c5
	Checksum: 0xF27826B4
	Offset: 0x4340
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_12e2aa23()
{
	self clientfield::set("" + #"ambient_fx", 0);
	self scene::play(#"hash_76544dedcadfdf05", "teleport_start", self);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_978eec63
	Namespace: namespace_e69881c5
	Checksum: 0xF8372446
	Offset: 0x43C0
	Size: 0x234
	Parameters: 15
	Flags: None
*/
function function_978eec63(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(isdefined(modelindex) && isplayer(modelindex))
	{
		partname = 0;
		return partname;
	}
	if(isalive(modelindex))
	{
		if(!self.var_aa4b496)
		{
			self thread function_cb660b90();
		}
		if(vsurfacenormal === "MOD_MELEE")
		{
			self playsound(#"hash_1ddeb8af5a217a6e");
		}
		if(modelindex.model === #"wpn_t9_sr_electric_avogadro_projectile")
		{
			partname = 60;
		}
		else
		{
			if(modelindex.var_6f84b820 === #"elite")
			{
				partname = 100;
			}
			else
			{
				if(modelindex.var_6f84b820 === #"special")
				{
					partname = 80;
				}
				else
				{
					if(modelindex.var_6f84b820 === #"normal")
					{
						partname = 50;
					}
					else if(vsurfacenormal === "MOD_UNKNOWN")
					{
						partname = 0;
					}
				}
			}
		}
	}
	else
	{
		if(!isdefined(modelindex) && !isdefined(damagefromunderneath) && vsurfacenormal === "MOD_UNKNOWN")
		{
			partname = 80;
		}
		else if(vsurfacenormal === "MOD_BURNED")
		{
			partname = 50;
		}
	}
	if(partname > 200)
	{
		partname = 200;
	}
	return partname;
}

/*
	Name: function_cb660b90
	Namespace: namespace_e69881c5
	Checksum: 0x128434DE
	Offset: 0x4600
	Size: 0x6E
	Parameters: 0
	Flags: None
*/
function function_cb660b90()
{
	self endon(#"death");
	self.var_aa4b496 = 1;
	self playloopsound(#"hash_2a034c2643fc1322");
	wait(4.75);
	self stoploopsound();
	self.var_aa4b496 = 0;
}

/*
	Name: function_c97fdd1d
	Namespace: namespace_e69881c5
	Checksum: 0x9A8E0F8B
	Offset: 0x4678
	Size: 0x400
	Parameters: 1
	Flags: None
*/
function function_c97fdd1d(var_6201c191)
{
	if(isdefined(var_6201c191))
	{
		self.var_55b8433b = [];
		var_5504b0b = var_6201c191.var_fe2612fe[#"hash_130282cd5152e410"];
		if(!isdefined(var_5504b0b))
		{
			return;
		}
		foreach(var_f721c918 in var_5504b0b)
		{
			a_spawn_points = var_f721c918.var_fe2612fe[#"hash_49340510783e32e4"];
			foreach(spawn in a_spawn_points)
			{
				if(math::cointoss(50))
				{
					model = #"p9_gold_surcrystal_medium_01";
					str_scene = "p9_zm_gold_sur_crystal_medium_01_bundle";
				}
				else
				{
					model = #"p9_gold_surcrystal_medium_02";
					str_scene = "p9_zm_gold_sur_crystal_medium_02_bundle";
				}
				e_pod = util::spawn_model(model, spawn.origin, spawn.angles, undefined, 1);
				if(isdefined(e_pod))
				{
					if(!isdefined(self.var_55b8433b))
					{
						self.var_55b8433b = [];
					}
					else if(!isarray(self.var_55b8433b))
					{
						self.var_55b8433b = array(self.var_55b8433b);
					}
					self.var_55b8433b[self.var_55b8433b.size] = e_pod;
					e_pod setscale(randomfloatrange(0.85, 1.2));
					e_pod function_619a5c20();
					e_pod val::set("loot_pod", "takedamage", 1);
					e_pod.health = 5;
					e_pod thread scene::play(str_scene, e_pod);
					e_pod fx::play(#"hash_6583defa5c93e609", e_pod.origin, e_pod.angles, #"hash_285fd9bc53c292d8", 1);
					level thread function_8265e656(e_pod);
					util::wait_network_frame();
				}
			}
		}
	}
	self waittill(#"objective_ended");
	if(isdefined(self.var_55b8433b))
	{
		foreach(pod in self.var_55b8433b)
		{
			pod delete();
		}
	}
}

/*
	Name: function_8265e656
	Namespace: namespace_e69881c5
	Checksum: 0x32F72A23
	Offset: 0x4A80
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_8265e656(e_pod)
{
	e_pod endon(#"death");
	e_pod callback::function_d8abfc3d(#"hash_5f0caa4b2d44fedf", &function_1cabf2e9);
	while(isdefined(e_pod) && e_pod.health > 0)
	{
		s_result = undefined;
		s_result = e_pod waittill(#"damage", #"death");
		if(isplayer(s_result.attacker) && isalive(s_result.attacker))
		{
			s_result.attacker util::show_hit_marker();
		}
	}
	e_pod callback::callback(#"hash_5f0caa4b2d44fedf", s_result);
}

/*
	Name: function_1cabf2e9
	Namespace: namespace_e69881c5
	Checksum: 0xB16658D4
	Offset: 0x4BB8
	Size: 0x13C
	Parameters: 1
	Flags: Private
*/
function private function_1cabf2e9(s_result)
{
	if(isplayer(s_result.attacker) || isai(s_result.attacker) || isvehicle(s_result.attacker))
	{
		ping::function_9455917d(self);
		self namespace_58949729::function_8ef626e3();
		playsoundatposition(#"hash_54c5c342b84cf845", self.origin);
		if(isplayer(s_result.attacker) && s_result.attacker isinvehicle())
		{
			var_80730518 = s_result.attacker getvehicleoccupied();
			if(isdefined(var_80730518))
			{
				var_80730518 thread namespace_58949729::function_df0dbb31();
			}
		}
	}
}

/*
	Name: function_1eef26bc
	Namespace: namespace_e69881c5
	Checksum: 0x88F853B4
	Offset: 0x4D00
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function function_1eef26bc(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	while(true)
	{
		if(!self.var_a123c71)
		{
			wait(10);
			if(!self.var_a123c71 && !is_true(self.abnormal_status.emped))
			{
				self namespace_7589cf5c::function_ac709d66(instance, #"hash_165229d1cb432efa");
				wait(2);
			}
		}
		wait(1);
	}
}

/*
	Name: function_ca92ed05
	Namespace: namespace_e69881c5
	Checksum: 0x158D5F80
	Offset: 0x4DD0
	Size: 0xF0
	Parameters: 1
	Flags: None
*/
function function_ca92ed05(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	while(true)
	{
		if(is_true(self.abnormal_status.emped))
		{
			self namespace_7589cf5c::function_ac709d66(instance, #"hash_42e191393187cfdb");
			while(is_true(self.abnormal_status.emped))
			{
				wait(0.5);
			}
			self namespace_7589cf5c::function_ac709d66(instance, #"hash_6170663b9a995a23");
		}
		wait(0.5);
	}
}

/*
	Name: function_6b7297f6
	Namespace: namespace_e69881c5
	Checksum: 0x80A273E3
	Offset: 0x4EC8
	Size: 0x25C
	Parameters: 0
	Flags: None
*/
function function_6b7297f6()
{
	while(!isdefined(level.var_c39a4b8f))
	{
		waitframe(1);
	}
	var_b7eee573 = util::spawn_model(#"hash_53079af25eecf35b", level.var_c39a4b8f gettagorigin("tag_cage_attach"));
	var_b7eee573 ghost();
	var_b7eee573 setscale(0.5);
	var_b7eee573 playsound(#"hash_55b5e35f7d261fee");
	var_b7eee573 playloopsound(#"hash_5dc7884f02e73776");
	var_b7eee573 fx::play(#"hash_c36745220550934", var_b7eee573.origin + vectorscale((0, 0, 1), 22), var_b7eee573.angles, #"hash_62901a3385d3e7af", 1);
	level.var_c39a4b8f.var_b7eee573 = var_b7eee573;
	var_b7eee573 endon(#"death");
	waitframe(1);
	v_offset = vectorscale((0, 0, -1), 5);
	str_tag = "tag_cage_attach";
	var_ec6068b9 = level.var_c39a4b8f gettagorigin(str_tag);
	var_b7eee573 moveto(var_ec6068b9 + v_offset, 0.75);
	var_b7eee573 waittill(#"movedone");
	level.var_c39a4b8f.var_b7eee573 = var_b7eee573;
	var_b7eee573 linkto(level.var_c39a4b8f, str_tag, v_offset, (0, 0, 0));
	var_b7eee573 bobbing((0, 0, 1), 5, 3);
}

