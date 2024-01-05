#using script_2cb831533cab2794;
#using script_113dd7f0ea2a1d4f;
#using script_4163291d6e693552;
#using script_12538a87a80a2978;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using script_5f261a5d57de5f7c;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using script_1029986e2bc8ca8e;
#using script_72401f526ba71638;
#using script_27347f09888ad15;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_40fc784c60f9fa7b;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_b2add33c;

/*
	Name: function_f3b47388
	Namespace: namespace_b2add33c
	Checksum: 0x6DA67C9F
	Offset: 0x970
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f3b47388()
{
	level notify(-404375460);
}

/*
	Name: main
	Namespace: namespace_b2add33c
	Checksum: 0xCD7E32D7
	Offset: 0x990
	Size: 0x1FC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("scriptmover", "" + #"hash_699685336205339b", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_1cf7ea5253c0a857", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_2833af7211f19903", 1, 2, "int");
	clientfield::register("scriptmover", "" + #"hash_7434dc21c6d7b515", 1, 2, "int");
	clientfield::register("vehicle", "" + #"hash_2c70ab0c21e69749", 1, 1, "int");
	callback::add_callback(#"on_vehicle_enter", &on_vehicle_enter);
	objective_manager::function_b3464a7c(#"transport", &function_36718adf, &function_692bb7f7, #"transport", #"hash_57444f3eab1982a9", #"hash_6837e26094ac7578", 12, #"hash_47c06f652921c96f");
}

/*
	Name: function_36718adf
	Namespace: namespace_b2add33c
	Checksum: 0x861179BE
	Offset: 0xB98
	Size: 0x4EC
	Parameters: 1
	Flags: None
*/
function function_36718adf(instance)
{
	instance.var_c8c31c6e = instance.var_fe2612fe[#"hash_6163649ad4621f8d"][0];
	instance.var_32686fb7 = instance.var_fe2612fe[#"hash_6163619ad4621a74"][0];
	instance.var_c88cb786 = instance.var_fe2612fe[#"hash_745c00362791da90"];
	instance.var_b64812fd = instance.var_fe2612fe[#"hash_745c03362791dfa9"];
	instance.var_c30ec716 = instance.var_fe2612fe[#"hash_3873fe8f95c20cd1"];
	instance.var_f9d4b491 = instance.var_fe2612fe[#"hash_3873fb8f95c207b8"];
	instance.var_c7f8f5a6 = instance.var_fe2612fe[#"hash_5d0b2a57b7248513"];
	instance.var_d8633066 = instance.var_fe2612fe[#"harvester"];
	instance.var_ba46398 = instance.var_fe2612fe[#"hash_3b6657037c39a33"];
	instance.var_37ea0cc = instance.var_fe2612fe[#"hash_32f62e13bc497cb0"];
	instance.s_truck = instance.var_fe2612fe[#"truck"][0];
	instance.var_4f021309 = instance.var_fe2612fe[#"platform"][0];
	instance.var_25ad512b = instance.var_fe2612fe[#"deposit"][0];
	instance.var_9ec9bab = instance.var_fe2612fe[#"hash_6a6d95b6ac8da23"][0];
	instance.var_36f78af6 = instance.var_fe2612fe[#"hash_77f225eddc4cbc31"][0];
	instance.var_3bb47a83 = instance.var_fe2612fe[#"rocket"][0];
	instance.var_da3c0f01 = [];
	instance.var_bc70cd17 = [];
	instance.var_6dced364 = [];
	instance.var_53ba65b = [];
	instance.vh_truck = spawnvehicle(#"vehicle_t9_mil_ru_truck_transport_player_obj_sr", instance.s_truck.origin, instance.s_truck.angles, "transport_truck");
	instance.vh_truck.var_803b49ee = getvehiclenode(instance.s_truck.script_noteworthy, "targetname");
	instance.var_7a1183ab = namespace_8b6a9d79::spawn_script_model(instance.var_36f78af6, #"hash_2dc80625b5b6627a", 1);
	instance.var_5ea363c = namespace_8b6a9d79::spawn_script_model(instance.var_3bb47a83, #"hash_572ef2c74e1d80ef");
	instance thread function_2db56dcb();
	if(isdefined(instance.vh_truck))
	{
		instance.vh_truck thread truck_setup(instance);
		instance.vh_truck thread function_d63c4af(instance);
	}
	if(isdefined(instance.var_7a1183ab))
	{
		instance.var_7a1183ab thread function_9a17187a(instance);
	}
	instance.var_5ff65676 = 0;
	instance.var_2ad830b6 = 0;
	instance.var_7a9e6505 = 1;
	instance.var_5ea363c hide();
	instance.n_active = 0;
	instance thread function_17f1d0f3();
	level.vh_truck = instance.vh_truck;
	level.var_50cb7dc9 = 0;
	instance.var_1d61d338 = int(7.5);
	instance.var_f2842de3 = 37.5;
	instance.var_d4ef06c4 = 135;
	instance.var_cfa9ae84 = 0;
	instance.var_9d0832d6 = 0;
	instance thread namespace_7589cf5c::vo_start("objectiveTransportAnnounce", "objectiveTransportAnnounceResponse");
	instance thread function_836915b3();
	level.var_acd0f67e = 8;
	showmiscmodels("transport_corpses");
}

/*
	Name: function_d63c4af
	Namespace: namespace_b2add33c
	Checksum: 0xA5E8C087
	Offset: 0x1090
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_d63c4af(instance)
{
	instance endon(#"objective_ended", #"hash_6902b14d272e2eed");
	self endon(#"death");
	wait(3);
	v_start_pos = self.origin;
	v_start_ang = self.angles;
	while(true)
	{
		if(self.origin != v_start_pos)
		{
			self.origin = v_start_pos;
		}
		if(self.angles != v_start_ang)
		{
			self.angles = v_start_ang;
		}
		wait(0.5);
	}
}

/*
	Name: function_2db56dcb
	Namespace: namespace_b2add33c
	Checksum: 0x6592585E
	Offset: 0x1168
	Size: 0x184
	Parameters: 0
	Flags: None
*/
function function_2db56dcb()
{
	self endon(#"objective_ended");
	wait(2);
	foreach(var_758436f2 in self.var_d8633066)
	{
		self.var_da3c0f01[self.var_da3c0f01.size] = namespace_8b6a9d79::spawn_script_model(var_758436f2, "p9_fxanim_sv_harvester_vehicle_mod");
		waitframe(1);
		self.var_da3c0f01[self.var_da3c0f01.size - 1] notsolid();
		self.var_da3c0f01[self.var_da3c0f01.size - 1].n_id = var_758436f2.script_int;
	}
	self function_72e17baf();
	wait(1);
	for(i = 0; i < self.var_da3c0f01.size; i++)
	{
		self.var_da3c0f01[i] thread function_13a328f(self);
	}
}

/*
	Name: function_72e17baf
	Namespace: namespace_b2add33c
	Checksum: 0x50429C25
	Offset: 0x12F8
	Size: 0x390
	Parameters: 0
	Flags: None
*/
function function_72e17baf()
{
	self endon(#"objective_ended");
	foreach(var_758436f2 in self.var_d8633066)
	{
		if(var_758436f2.script_int)
		{
			v_pos = (vectornormalize(anglestoright(self.vh_truck gettagangles("tag_cargo_latch_right"))) * 28.9) + self.vh_truck gettagorigin("tag_cargo_latch_right");
			v_loc = (anglestoforward(self.vh_truck.angles) * 20) + v_pos;
			var_3955def4 = (anglestoright(self.vh_truck.angles) * -18) + v_loc;
			self.var_da3c0f01[1] moveto(var_3955def4, 0.05);
			self.var_da3c0f01[1].angles = self.vh_truck gettagangles("tag_cargo_latch_right") + (vectorscale((0, 0, -1), 90));
			wait(0.1);
			self.var_da3c0f01[1] linkto(self.vh_truck);
			continue;
		}
		v_pos = (vectornormalize(anglestoright(self.vh_truck gettagangles("tag_cargo_latch_left"))) * -28.9) + self.vh_truck gettagorigin("tag_cargo_latch_left");
		v_loc = (anglestoforward(self.vh_truck.angles) * 20) + v_pos;
		var_3955def4 = (anglestoright(self.vh_truck.angles) * 18) + v_loc;
		self.var_da3c0f01[0] moveto(var_3955def4, 0.05);
		self.var_da3c0f01[0].angles = self.vh_truck gettagangles("tag_cargo_latch_left") + vectorscale((0, 0, 1), 90);
		wait(0.1);
		self.var_da3c0f01[0] linkto(self.vh_truck);
	}
}

/*
	Name: function_17f1d0f3
	Namespace: namespace_b2add33c
	Checksum: 0x1E718ABE
	Offset: 0x1690
	Size: 0x6A
	Parameters: 0
	Flags: None
*/
function function_17f1d0f3()
{
	self.var_5e36739b = self namespace_7589cf5c::function_df911075();
	self.var_61c57c53 = self namespace_7589cf5c::function_1b53cdc7();
	self.var_5de17ec9 = self namespace_7589cf5c::function_56fa33d9();
	self.var_2133c784 = 0;
	self.var_b803db9c = 0;
}

/*
	Name: function_692bb7f7
	Namespace: namespace_b2add33c
	Checksum: 0x768AAE92
	Offset: 0x1708
	Size: 0x1E8
	Parameters: 2
	Flags: None
*/
function function_692bb7f7(instance, activator)
{
	if(isplayer(activator))
	{
		instance notify(#"hash_6902b14d272e2eed");
		instance.n_max = function_e97e2683();
		instance.var_6720064d = function_5ce9975c(level.var_b48509f9);
		instance thread function_f2659c3a();
		instance thread function_c13613e9(activator);
		instance thread machine_trigger();
		instance thread function_f5087df2();
		instance thread function_c4e85aeb();
		instance thread function_cfe051();
		instance thread function_390f1240();
		instance thread function_7b99a9c7();
		instance thread function_4fb241();
		foreach(player in getplayers())
		{
			level.var_31028c5d prototype_hud::set_main_objective_string(player, #"hash_23ebc154fc5d24b1");
		}
	}
}

/*
	Name: machine_trigger
	Namespace: namespace_b2add33c
	Checksum: 0x1559C4C
	Offset: 0x18F8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function machine_trigger()
{
	self endon(#"objective_ended");
	self.var_c1c0db3c = 0;
	self thread function_80fad2d4();
}

/*
	Name: function_80fad2d4
	Namespace: namespace_b2add33c
	Checksum: 0x8F048145
	Offset: 0x1938
	Size: 0x1B8
	Parameters: 0
	Flags: None
*/
function function_80fad2d4()
{
	self endon(#"objective_ended");
	while(true)
	{
		if(level.var_50cb7dc9 > 1)
		{
			self thread launch_rocket();
			if(isdefined(level.var_74d92ff6) && level.var_74d92ff6 <= 90)
			{
				level scoreevents::doscoreeventcallback("scoreEventSR", {#allplayers:1, #scoreevent:"transport_rapid_delivery_zm"});
			}
			if(isdefined(self.vh_truck.health) && isdefined(self.vh_truck.max_health) && (self.vh_truck.health / self.vh_truck.max_health) >= 0.8)
			{
				level scoreevents::doscoreeventcallback("scoreEventSR", {#allplayers:1, #scoreevent:"transport_pristine_zm"});
			}
			callback::remove_callback(#"on_vehicle_enter", &on_vehicle_enter);
			objective_manager::stop_timer();
			objective_manager::objective_ended(self, 1);
		}
		wait(0.1);
	}
}

/*
	Name: launch_rocket
	Namespace: namespace_b2add33c
	Checksum: 0x20030FA3
	Offset: 0x1AF8
	Size: 0x294
	Parameters: 0
	Flags: None
*/
function launch_rocket()
{
	level thread namespace_7589cf5c::function_3899cfea();
	self.var_7a1183ab thread function_e58db320();
	self.e_rocket = util::spawn_model("tag_origin", self.var_7a1183ab gettagorigin("tag_fx_rocket_exhaust_0"));
	wait(3);
	self.var_7a1183ab clientfield::set("" + #"hash_5bc7fe725b36bd67", 1);
	if(isdefined(self.e_rocket))
	{
		self.e_rocket playloopsound(#"hash_2eaf64217fead998");
		self.e_rocket linkto(self.var_7a1183ab, "tag_fx_rocket_exhaust_0");
	}
	wait(4);
	self.e_rocket playrumbleonentity("sr_retrieval_rocket_takeoff");
	self flag::wait_till(#"launch");
	self.var_7a1183ab playloopsound(#"hash_4a9a912c07ee63e");
	wait(1);
	self.var_7a1183ab clientfield::set("" + #"hash_5bc7fe725b36bd67", 0);
	self.var_7a1183ab thread scene::play(#"hash_3c1f6bee53f6bcc", "Shot 4", self.var_7a1183ab);
	wait(4.5);
	self thread function_1ed83293();
	self.e_rocket stoploopsound(5);
	wait(5);
	self notify(#"cleared");
	self.var_7a1183ab stoploopsound();
	wait(24);
	self.var_7a1183ab hidepart("tag_rocket_attach", "", 1);
}

/*
	Name: function_e58db320
	Namespace: namespace_b2add33c
	Checksum: 0xB1E02B1E
	Offset: 0x1D98
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_e58db320()
{
	wait(0.5);
	if(isdefined(self.var_55b38898))
	{
		zm_utility::function_bc5a54a8(self.var_55b38898);
	}
}

/*
	Name: function_ff03229a
	Namespace: namespace_b2add33c
	Checksum: 0xF0F16D49
	Offset: 0x1DD8
	Size: 0xEA
	Parameters: 1
	Flags: None
*/
function function_ff03229a(instance)
{
	self val::set("transport", "takedamage", 1);
	self.var_3800be7e = 1;
	self.var_265cb589 = 1;
	self.team = #"allies";
	self clientfield::increment("" + #"hash_738f0a13dc61e2ec");
	self callback::function_d8abfc3d("on_vehicle_killed", &function_c834e7ad);
	self.overridevehicledamage = &function_182bef13;
	self.var_da3c0f01 = instance.var_da3c0f01;
	self.var_e6604bb = self.var_da3c0f01;
}

/*
	Name: truck_setup
	Namespace: namespace_b2add33c
	Checksum: 0x9A2873D0
	Offset: 0x1ED0
	Size: 0x268
	Parameters: 1
	Flags: None
*/
function truck_setup(instance)
{
	self function_9e96f231(#"hash_4ee5da60349253ff");
	self.var_c62824cc = self.health;
	self thread function_c3b172e1(instance);
	self thread function_ff03229a(instance);
	wait(1);
	self.var_3ba4dc68 = util::spawn_model("collision_transport_truck", instance.var_9ec9bab.origin, instance.var_9ec9bab.angles);
	waitframe(1);
	self.var_3ba4dc68 ghost();
	self vehicle::get_on_path(self.var_803b49ee);
	self makevehicleunusable();
	s_result = undefined;
	s_result = self waittill(#"enter_vehicle");
	self vehicle::get_off_path();
	self.var_3ba4dc68 delete();
	self makevehicleusable();
	self thread function_bfdd779(instance);
	self thread function_6e3b7f88(instance);
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_23ebc154fc5d24b1");
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 2);
	}
}

/*
	Name: function_c834e7ad
	Namespace: namespace_b2add33c
	Checksum: 0x615F519D
	Offset: 0x2140
	Size: 0xF0
	Parameters: 0
	Flags: None
*/
function function_c834e7ad()
{
	if(isdefined(self.var_da3c0f01))
	{
		foreach(var_b3fb5814 in self.var_da3c0f01)
		{
			if(isdefined(var_b3fb5814))
			{
				if(!is_true(var_b3fb5814.var_57e77903.b_pickedup) && isdefined(var_b3fb5814.var_57e77903))
				{
					var_b3fb5814.var_57e77903 delete();
				}
				var_b3fb5814 delete();
			}
		}
	}
}

/*
	Name: function_8ac36091
	Namespace: namespace_b2add33c
	Checksum: 0xE831ABFB
	Offset: 0x2238
	Size: 0xA8
	Parameters: 1
	Flags: None
*/
function function_8ac36091(instance)
{
	self endon(#"death");
	instance endon(#"objective_started", #"objective_ended");
	while(true)
	{
		if(distance2dsquared(self.origin, self.var_803b49ee.origin) >= 900)
		{
			self vehicle::get_on_path(self.var_803b49ee);
		}
		wait(1);
	}
}

/*
	Name: function_c3b172e1
	Namespace: namespace_b2add33c
	Checksum: 0xE1C3A1F3
	Offset: 0x22E8
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_c3b172e1(instance)
{
	instance endon(#"objective_ended");
	self waittill(#"death");
	if(instance.var_cfa9ae84 < 2)
	{
		objective_manager::objective_ended(instance, 0);
	}
}

/*
	Name: function_c13613e9
	Namespace: namespace_b2add33c
	Checksum: 0x8EE7D2BB
	Offset: 0x2358
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_c13613e9(player)
{
	self endon(#"objective_ended");
	if(isalive(player) && isalive(self.vh_truck))
	{
		self.vh_truck useby(player);
	}
}

/*
	Name: function_bfdd779
	Namespace: namespace_b2add33c
	Checksum: 0xED40D6EE
	Offset: 0x23D0
	Size: 0x106
	Parameters: 1
	Flags: None
*/
function function_bfdd779(instance)
{
	instance endon(#"objective_ended");
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
		waitframe(1);
	}
}

/*
	Name: function_182bef13
	Namespace: namespace_b2add33c
	Checksum: 0x5B2D6C56
	Offset: 0x24E0
	Size: 0x12C
	Parameters: 15
	Flags: None
*/
function function_182bef13(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(isdefined(modelindex) && isplayer(modelindex))
	{
		partname = 0;
		return partname;
	}
	if(modelindex === self)
	{
		return partname;
	}
	if(isalive(modelindex))
	{
		if(vsurfacenormal === "MOD_MELEE")
		{
			self playsound(#"hash_1ddeb8af5a217a6e");
		}
	}
	if(partname > 30)
	{
		partname = 30;
	}
	return partname;
}

/*
	Name: function_de1bcd72
	Namespace: namespace_b2add33c
	Checksum: 0x2A3F7752
	Offset: 0x2618
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_de1bcd72(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	wait(3);
	slots = namespace_85745671::function_bdb2b85b(self, self.origin, self.angles, 120, 8, 300);
	if(!isdefined(slots) || slots.size <= 0)
	{
		return;
	}
	self.var_b79a8ac7 = {#slots:slots, #hash_f019ea1a:5000};
	level.attackables[level.attackables.size] = self;
}

/*
	Name: function_fcfd2a3
	Namespace: namespace_b2add33c
	Checksum: 0x72D37919
	Offset: 0x26F8
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_fcfd2a3(n_index)
{
	self endon(#"objective_ended");
	if(n_index == 1)
	{
		a_s_spawnpts = self.var_c88cb786;
		self.mdl_vortex = self.var_6135d9ba;
	}
	else
	{
		a_s_spawnpts = self.var_b64812fd;
		self.mdl_vortex = self.var_a8e6692e;
	}
	self thread function_fbaf0bd(a_s_spawnpts);
}

/*
	Name: function_fbaf0bd
	Namespace: namespace_b2add33c
	Checksum: 0x5FA3E6F3
	Offset: 0x2790
	Size: 0x390
	Parameters: 1
	Flags: None
*/
function function_fbaf0bd(a_s_pts)
{
	self endon(#"objective_ended", #"hash_7ae25b738e2655a3");
	n_delay = get_spawn_delay(level.var_b48509f9);
	a_s_pts = array::randomize(a_s_pts);
	i = 0;
	while(true)
	{
		level flag::wait_till("spawn_zombies");
		if(isdefined(a_s_pts[i]))
		{
			s_spawnpt = a_s_pts[i];
		}
		if(isdefined(s_spawnpt) && self.n_active < self.n_max)
		{
			var_7ecdee63 = function_aece4588(level.var_b48509f9);
			if(namespace_7589cf5c::function_82e262cf(var_7ecdee63))
			{
				if(isdefined(self.var_38c710c3))
				{
					n_cooldown = namespace_7589cf5c::function_190c51a9();
					var_be32c966 = (float(gettime()) / 1000) - self.var_38c710c3;
					if(var_be32c966 < n_cooldown)
					{
						var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
					}
					else
					{
						self.var_38c710c3 = undefined;
					}
				}
				if(self.var_2133c784 >= self.var_61c57c53 || self.var_b803db9c >= self.var_5de17ec9)
				{
					var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
				}
			}
			ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, s_spawnpt.origin, s_spawnpt.angles, "transport_zombie");
			wait(0.1);
			if(isdefined(ai_spawned))
			{
				i++;
				if(i > a_s_pts.size - 1)
				{
					i = 0;
					a_s_pts = array::randomize(a_s_pts);
				}
				if(namespace_7589cf5c::function_82e262cf(ai_spawned.aitype))
				{
					self.var_38c710c3 = float(gettime()) / 1000;
					self.var_2133c784++;
					self.var_b803db9c++;
					ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
				}
				else
				{
					ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &on_zombie_killed);
				}
				ai_spawned thread zombie_attack(self);
				ai_spawned thread function_3d030d9f(self, 16000000);
				self.n_active++;
			}
		}
		wait(randomfloatrange(0.5, 1));
	}
}

/*
	Name: function_5ce9975c
	Namespace: namespace_b2add33c
	Checksum: 0xF5857F76
	Offset: 0x2B28
	Size: 0xE0
	Parameters: 1
	Flags: None
*/
function function_5ce9975c(var_661691aa)
{
	n_players = getplayers().size;
	switch(n_players)
	{
		case 1:
		{
			n_max = 1;
			break;
		}
		case 2:
		case 3:
		{
			n_max = 2;
			break;
		}
		case 4:
		{
			n_max = 3;
			break;
		}
		default:
		{
			n_max = 2;
			break;
		}
	}
	if(var_661691aa > 8)
	{
		n_max = n_max + 1;
	}
	return n_max;
}

/*
	Name: function_6e3b7f88
	Namespace: namespace_b2add33c
	Checksum: 0xDDD6E654
	Offset: 0x2C10
	Size: 0x198
	Parameters: 1
	Flags: None
*/
function function_6e3b7f88(instance)
{
	self endon(#"death", #"hash_46ec4489ed0e4649");
	instance endon(#"objective_ended");
	while(true)
	{
		if(self getspeedmph() > 0)
		{
			break;
		}
		wait(1);
	}
	namespace_85745671::function_b70e2a37(self);
	wait(2);
	while(true)
	{
		driver = self getseatoccupant(0);
		if(isdefined(driver) && !is_true(self.abnormal_status.emped))
		{
			v_ground = self function_6d122cef();
			if(isdefined(v_ground))
			{
				a_s_pts = namespace_85745671::function_e4791424(v_ground, 4, 40, 200, 100);
				if(isdefined(a_s_pts))
				{
					s_pt = array::random(a_s_pts);
					instance thread function_57812547(s_pt);
				}
			}
		}
		wait(randomfloatrange(0.1, 0.3));
	}
}

/*
	Name: function_57812547
	Namespace: namespace_b2add33c
	Checksum: 0x6C51FCC3
	Offset: 0x2DB0
	Size: 0x3EC
	Parameters: 1
	Flags: None
*/
function function_57812547(s_pt)
{
	self endon(#"objective_ended");
	self function_af1955d4();
	n_max = function_c252cb90();
	if(isdefined(s_pt) && self.n_active < n_max)
	{
		var_7ecdee63 = function_aece4588(level.var_b48509f9);
		if(namespace_7589cf5c::function_82e262cf(var_7ecdee63))
		{
			if(isdefined(self.var_38c710c3))
			{
				n_cooldown = namespace_7589cf5c::function_190c51a9();
				var_be32c966 = (float(gettime()) / 1000) - self.var_38c710c3;
				if(var_be32c966 < n_cooldown)
				{
					var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
				}
				else
				{
					self.var_38c710c3 = undefined;
				}
			}
			if(self.var_2133c784 >= self.var_61c57c53 || self.var_b803db9c >= self.var_5de17ec9)
			{
				var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
			}
		}
		if(isalive(self.vh_truck))
		{
			v_ang = (self.vh_truck.angles[0], self.vh_truck.angles[1] + 180, self.vh_truck.angles[2]);
		}
		else
		{
			v_ang = s_pt.angles;
		}
		if(self flag::get(#"hash_2001caea1bbe9d01"))
		{
			if(self.var_9d0832d6 < self.var_6720064d)
			{
				var_7ecdee63 = #"hash_1aff4b71635bda08";
			}
		}
		ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, s_pt.origin, v_ang, "transport_zombie");
		wait(0.1);
		if(isdefined(ai_spawned))
		{
			if(namespace_7589cf5c::function_82e262cf(ai_spawned.aitype))
			{
				self.var_38c710c3 = float(gettime()) / 1000;
				self.var_2133c784++;
				self.var_b803db9c++;
				ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
			}
			else
			{
				ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &on_zombie_killed);
			}
			ai_spawned.var_c652ed00 = 1;
			ai_spawned thread zombie_attack(self);
			ai_spawned thread function_3d030d9f(self, 16000000);
			ai_spawned thread function_14cb5911(self);
			self.n_active++;
			if(self flag::get(#"hash_2001caea1bbe9d01") && var_7ecdee63 === #"hash_1aff4b71635bda08")
			{
				self.var_9d0832d6++;
			}
		}
	}
}

/*
	Name: function_14cb5911
	Namespace: namespace_b2add33c
	Checksum: 0x428DF5
	Offset: 0x31A8
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_14cb5911(instance)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	instance flag::wait_till(#"hash_45d859f77668dcd5");
	self thread function_3d030d9f(instance, 4000000);
}

/*
	Name: function_3d030d9f
	Namespace: namespace_b2add33c
	Checksum: 0x2288E634
	Offset: 0x3228
	Size: 0x1C0
	Parameters: 2
	Flags: None
*/
function function_3d030d9f(instance, n_dist)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	while(true)
	{
		if(distance2dsquared(self.origin, instance.vh_truck.origin) > n_dist)
		{
			foreach(player in getplayers())
			{
				if(player util::is_player_looking_at(self.origin, 0.3, 0) || player util::is_player_looking_at(self getcentroid(), 0.3, 0))
				{
					self.is_visible = 1;
				}
			}
			if(is_true(self.is_visible))
			{
				self.is_visible = undefined;
			}
			else
			{
				if(instance.n_active)
				{
					instance.n_active--;
				}
				self callback::callback(#"hash_10ab46b52df7967a");
			}
		}
		wait(1);
	}
}

/*
	Name: function_af1955d4
	Namespace: namespace_b2add33c
	Checksum: 0xCCC24D34
	Offset: 0x33F0
	Size: 0x3A4
	Parameters: 0
	Flags: None
*/
function function_af1955d4()
{
	self endon(#"objective_ended");
	actor_array = getaiarchetypearray(#"zombie");
	foreach(i, actor in actor_array)
	{
		if(is_true(actor.var_a950813d) || is_true(actor.var_4df707f6))
		{
			actor_array[i] = -1;
		}
	}
	arrayremovevalue(actor_array, -1);
	var_e9629e8e = (vectornormalize(anglestoforward(self.angles)) * -5000) + self.origin;
	if(isdefined(var_e9629e8e))
	{
		var_3817a6b3 = arraygetclosest(var_e9629e8e, actor_array);
	}
	if(isalive(self.vh_truck) && isdefined(var_3817a6b3))
	{
		v_eye = self.vh_truck.origin;
		v_view = anglestoforward(self.vh_truck.angles);
		v_delta = vectornormalize(var_3817a6b3.origin - v_eye);
		n_dot = vectordot(v_delta, v_view);
		if(n_dot > 0.3)
		{
			return;
		}
		foreach(player in getplayers())
		{
			if(player util::is_player_looking_at(var_3817a6b3.origin, 0.3, 0) || player util::is_player_looking_at(var_3817a6b3 getcentroid(), 0.3, 0))
			{
				var_3817a6b3.is_visible = 1;
			}
		}
	}
	if(is_true(var_3817a6b3.is_visible))
	{
		var_3817a6b3.is_visible = undefined;
		return;
	}
	if(!isdefined(var_3817a6b3))
	{
		return;
	}
	if(isdefined(var_3817a6b3))
	{
		if(self.n_active)
		{
			self.n_active--;
		}
		var_3817a6b3 callback::callback(#"hash_10ab46b52df7967a");
	}
}

/*
	Name: function_6d122cef
	Namespace: namespace_b2add33c
	Checksum: 0x966CEF00
	Offset: 0x37A0
	Size: 0xC6
	Parameters: 0
	Flags: None
*/
function function_6d122cef()
{
	self endon(#"death");
	v_forward = (vectornormalize(anglestoforward(self.angles)) * 3000) + self.origin;
	if(isdefined(v_forward))
	{
		v_ground = groundtrace(v_forward + vectorscale((0, 0, 1), 1000), v_forward + (vectorscale((0, 0, -1), 1000)), 0, self)[#"position"];
	}
	if(isdefined(v_ground))
	{
		return v_ground;
	}
}

/*
	Name: get_spawn_delay
	Namespace: namespace_b2add33c
	Checksum: 0xE00EF1F2
	Offset: 0x3870
	Size: 0x10E
	Parameters: 1
	Flags: None
*/
function get_spawn_delay(var_661691aa)
{
	switch(var_661691aa)
	{
		case 1:
		{
			n_delay = 1;
			break;
		}
		case 2:
		{
			n_delay = 0.5;
			break;
		}
		case 3:
		{
			n_delay = 0.25;
			break;
		}
		case 4:
		{
			n_delay = 0.15;
			break;
		}
		case 5:
		{
			n_delay = 0.1;
			break;
		}
		case 6:
		{
			n_delay = 0.05;
			break;
		}
		default:
		{
			n_delay = 0.1;
			break;
		}
	}
	return n_delay;
}

/*
	Name: zombie_attack
	Namespace: namespace_b2add33c
	Checksum: 0x147BC6EA
	Offset: 0x3988
	Size: 0x310
	Parameters: 1
	Flags: None
*/
function zombie_attack(instance)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	self callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
	while(true)
	{
		namespace_85745671::function_744beb04(self);
		util::wait_network_frame();
		player = awareness::function_d7fedde2(self);
		if(distance2dsquared(self.origin, instance.vh_truck.origin) > 1000000 && !isdefined(self.var_b238ef38))
		{
			self.var_ff290a61 = undefined;
			namespace_85745671::function_744beb04(self);
			if(!isdefined(self.var_b238ef38))
			{
				if(isalive(player))
				{
					player = awareness::function_d7fedde2(self);
					self.var_ff290a61 = player;
					awareness::function_c241ef9a(self, player, 4);
				}
			}
		}
		else
		{
			if(isdefined(instance.vh_truck) && isalive(player) && distance2dsquared(self.origin, player.origin) <= distance2dsquared(self.origin, instance.vh_truck.origin) && distance2dsquared(instance.vh_truck.origin, player.origin) <= 1000000 && !is_true(player.ignoreme) && !isdefined(self.var_b238ef38))
			{
				self.var_ff290a61 = player;
				awareness::function_c241ef9a(self, player, 4);
			}
			else if(!isdefined(self.var_b238ef38))
			{
				player = array::get_all_closest(instance.vh_truck.origin, getplayers())[0];
				self.var_ff290a61 = player;
				awareness::function_c241ef9a(self, player, 4);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_fd68cae4
	Namespace: namespace_b2add33c
	Checksum: 0x53676E42
	Offset: 0x3CA0
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_fd68cae4()
{
	if(self.archetype == #"zombie")
	{
		if(isdefined(self.var_b4e37a30) && level.var_b48509f9 > 4)
		{
			self namespace_85745671::function_9758722("super_sprint");
		}
		if(level.var_b48509f9 < 5)
		{
			self namespace_85745671::function_9758722("sprint");
		}
	}
}

/*
	Name: function_e97e2683
	Namespace: namespace_b2add33c
	Checksum: 0x14040F3B
	Offset: 0x3D38
	Size: 0x17E
	Parameters: 0
	Flags: None
*/
function function_e97e2683()
{
	n_players = getplayers().size;
	switch(n_players)
	{
		case 1:
		{
			n_spawns = 4;
			n_spawns = min(7, level.var_b48509f9 + n_spawns);
			break;
		}
		case 2:
		{
			n_spawns = 5;
			n_spawns = min(9, level.var_b48509f9 + n_spawns);
			break;
		}
		case 3:
		{
			n_spawns = 7;
			n_spawns = min(11, level.var_b48509f9 + n_spawns);
			break;
		}
		case 4:
		{
			n_spawns = 9;
			n_spawns = min(14, level.var_b48509f9 + n_spawns);
			break;
		}
		default:
		{
			n_spawns = 16;
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_c252cb90
	Namespace: namespace_b2add33c
	Checksum: 0x5326E26
	Offset: 0x3EC0
	Size: 0xCE
	Parameters: 0
	Flags: None
*/
function function_c252cb90()
{
	n_players = getplayers().size;
	switch(n_players)
	{
		case 1:
		{
			n_spawns = 10;
			break;
		}
		case 2:
		{
			n_spawns = 12;
			break;
		}
		case 3:
		{
			n_spawns = 14;
			break;
		}
		case 4:
		{
			n_spawns = 16;
			break;
		}
		default:
		{
			n_spawns = 16;
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_f2659c3a
	Namespace: namespace_b2add33c
	Checksum: 0x2082B7F8
	Offset: 0x3F98
	Size: 0x74C
	Parameters: 1
	Flags: None
*/
function function_f2659c3a(instance)
{
	self endon(#"objective_ended");
	self.var_6135d9ba = namespace_8b6a9d79::spawn_script_model(self.var_c8c31c6e, "tag_origin");
	self.var_a8e6692e = namespace_8b6a9d79::spawn_script_model(self.var_32686fb7, "tag_origin");
	if(isdefined(self.var_6135d9ba))
	{
		self.var_6135d9ba function_1ab4264a(self, 1);
		self.mdl_vortex = self.var_6135d9ba;
	}
	self.vh_truck thread function_b6e915a3(self, self.var_6135d9ba, 4000);
	self thread function_5671b2f0("vortex_1");
	self function_a7ccc673(1);
	wait(2.5);
	self thread function_deefa538(1);
	self flag::wait_till(#"hash_199da05489df8b42");
	self flag::clear(#"hash_199da05489df8b42");
	self thread function_fcfd2a3(1);
	self thread function_494fde88();
	wait(2);
	if(isdefined(self.var_e5464a7e))
	{
		self.var_e5464a7e thread function_f692b63a(self, 0);
		self.var_e5464a7e thread function_f692b63a(self, 1);
	}
	self flag::wait_till(#"hash_7ae25b738e2655a3");
	wait(0.5);
	self.vh_truck notify(#"hash_182388f89ef59840");
	self.vh_truck thread function_6e3b7f88(self);
	self.var_6135d9ba clientfield::set("" + #"hash_7434dc21c6d7b515", 0);
	self.var_6135d9ba.var_776aca17 clientfield::increment("" + #"hash_25f023cad32eccf0");
	self.var_6135d9ba function_545164ce();
	zm_utility::function_bc5a54a8(self.var_6135d9ba.n_objective_id);
	self function_7864688c(1);
	foreach(player in getplayers())
	{
		player thread function_55904a22(instance, 0);
	}
	if(isdefined(self.var_a8e6692e))
	{
		self.mdl_vortex = self.var_a8e6692e;
		self.var_a8e6692e function_1ab4264a(self, 2);
		self thread function_c37c7efe(self.var_a8e6692e);
	}
	self.vh_truck thread function_b6e915a3(self, self.var_a8e6692e, 6000);
	wait(0.1);
	self thread function_5671b2f0("vortex_2");
	self.vh_truck flag::wait_till(#"hash_46ec4489ed0e4649");
	self thread function_deefa538(2);
	self function_a7ccc673(2);
	wait(2);
	if(isdefined(self.var_e5464a7e))
	{
		self.var_e5464a7e thread function_f692b63a(self, 0);
		self.var_e5464a7e thread function_f692b63a(self, 1);
	}
	self thread function_fcfd2a3(2);
	self thread function_494fde88();
	self flag::wait_till(#"hash_7ae25b738e2655a3");
	wait(0.5);
	self.vh_truck notify(#"hash_182388f89ef59840");
	self.vh_truck thread function_6e3b7f88(self);
	self.var_a8e6692e clientfield::set("" + #"hash_7434dc21c6d7b515", 0);
	self.var_a8e6692e.var_776aca17 clientfield::increment("" + #"hash_25f023cad32eccf0");
	self.var_a8e6692e function_545164ce();
	zm_utility::function_bc5a54a8(self.var_a8e6692e.n_objective_id);
	self function_7864688c(2);
	foreach(player in getplayers())
	{
		player thread function_55904a22(instance, 0);
	}
	self flag::set(#"countdown");
	function_3ef1d58a(self, 3);
	self thread function_4b0ba39d();
	self thread function_8346a72c();
	self thread function_dd90167d();
	self thread function_2c8b441b();
	self thread function_8ec2f88a();
}

/*
	Name: function_7864688c
	Namespace: namespace_b2add33c
	Checksum: 0x17FD4B0A
	Offset: 0x46F0
	Size: 0x13C
	Parameters: 1
	Flags: None
*/
function function_7864688c(n_index)
{
	self endon(#"objective_ended");
	wait(0.5);
	if(n_index == 1)
	{
		if(isdefined(self.var_6135d9ba.mdl_clip))
		{
			self.var_6135d9ba.mdl_clip delete();
		}
		if(isdefined(self.var_6135d9ba))
		{
			self.var_6135d9ba delete();
		}
	}
	else
	{
		if(isdefined(self.var_a8e6692e.mdl_clip))
		{
			self.var_a8e6692e.mdl_clip delete();
		}
		if(isdefined(self.var_a8e6692e))
		{
			self.var_a8e6692e delete();
		}
	}
	if(isdefined(self.var_e5464a7e))
	{
		self.var_e5464a7e delete();
	}
	self flag::set(#"hash_7ae777d642643a3d");
}

/*
	Name: function_4b0ba39d
	Namespace: namespace_b2add33c
	Checksum: 0x1E0A4CF7
	Offset: 0x4838
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function function_4b0ba39d()
{
	self endon(#"objective_ended");
	foreach(var_b3fb5814 in self.var_da3c0f01)
	{
		var_b3fb5814 clientfield::set("" + #"hash_1cf7ea5253c0a857", 1);
	}
}

/*
	Name: function_5671b2f0
	Namespace: namespace_b2add33c
	Checksum: 0x125FFC69
	Offset: 0x48F8
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_5671b2f0(var_1d9bbfbb)
{
	self endon(#"objective_ended", #"hash_45d859f77668dcd5");
	objective_manager::start_timer(90, var_1d9bbfbb);
	objective_manager::stop_timer();
	if(!self.var_5ff65676)
	{
		objective_manager::objective_ended(self, 0);
	}
}

/*
	Name: function_51dd3846
	Namespace: namespace_b2add33c
	Checksum: 0xAE36453
	Offset: 0x4980
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_51dd3846()
{
	self endon(#"objective_ended");
	self flag::wait_till(#"hash_45d859f77668dcd5");
	objective_manager::stop_timer();
}

/*
	Name: function_2c8b441b
	Namespace: namespace_b2add33c
	Checksum: 0xC1009CD
	Offset: 0x49D8
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_2c8b441b()
{
	self.var_25ad512b gameobjects::init_game_objects(#"hash_1b4df744a87d96c0");
	self.var_25ad512b gameobjects::set_onbeginuse_event(&function_1fc51f74);
	self.var_25ad512b gameobjects::set_onenduse_event(&function_c8bfd10b);
	self.var_25ad512b.mdl_gameobject.t_interact function_268e4500();
	self.var_25ad512b.mdl_gameobject.var_2e39d9ef = 1;
	self.var_25ad512b.mdl_gameobject thread function_dacf0fdd(self);
}

/*
	Name: function_a7ccc673
	Namespace: namespace_b2add33c
	Checksum: 0x6FE6FFBE
	Offset: 0x4AC8
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_a7ccc673(n_index)
{
	self endon(#"objective_ended", #"hash_67ce5bb73581bdbe");
	self.vh_truck endon(#"death");
	if(n_index == 1)
	{
		self.mdl_vortex = self.var_6135d9ba;
	}
	else
	{
		self.mdl_vortex = self.var_a8e6692e;
	}
	while(true)
	{
		foreach(harvester in self.var_da3c0f01)
		{
			if(distance2dsquared(self.mdl_vortex.origin, harvester.origin) <= 640000)
			{
				self thread function_913f0e5a();
				self notify(#"hash_67ce5bb73581bdbe");
				break;
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_2200c72f
	Namespace: namespace_b2add33c
	Checksum: 0x5D645953
	Offset: 0x4C30
	Size: 0x92
	Parameters: 0
	Flags: None
*/
function function_2200c72f()
{
	self endon(#"objective_ended", #"hash_45d859f77668dcd5");
	wait(2);
	if(distance2dsquared(self.mdl_vortex.origin, self.vh_truck.origin) <= 640000)
	{
		self thread function_913f0e5a();
	}
	else
	{
		self.var_eee5f188 = 0;
	}
}

/*
	Name: function_913f0e5a
	Namespace: namespace_b2add33c
	Checksum: 0xEFAAD8C0
	Offset: 0x4CD0
	Size: 0x268
	Parameters: 0
	Flags: None
*/
function function_913f0e5a()
{
	self endon(#"objective_ended");
	self flag::set(#"hash_45d859f77668dcd5");
	objective_manager::stop_timer();
	playfx(#"sr/fx9_obj_holdout_crystal_bomb", self.mdl_vortex.origin, anglestoforward(self.mdl_vortex.angles), anglestoup(self.mdl_vortex.angles));
	wait(0.1);
	if(isdefined(self.vh_truck))
	{
		self.vh_truck.is_staircase_up = &function_990585f;
		self.vh_truck thread player_vehicle::is_staircase_up();
		self.vh_truck thread function_de1bcd72(self);
	}
	self.mdl_vortex.var_776aca17 clientfield::set("" + #"hash_bd6060c10031f98", 0);
	self thread function_7bde6917();
	self thread function_9458dd64();
	self.vh_truck flag::clear(#"hash_46ec4489ed0e4649");
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_5d39ad2d717d21c3");
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 2);
	}
}

/*
	Name: function_1ab4264a
	Namespace: namespace_b2add33c
	Checksum: 0x3CD8EA61
	Offset: 0x4F40
	Size: 0x1AC
	Parameters: 2
	Flags: None
*/
function function_1ab4264a(instance, n_index)
{
	self.var_776aca17 = util::spawn_model("tag_origin", self.origin + vectorscale((0, 0, 1), 100));
	self.var_776aca17 clientfield::set("" + #"hash_bd6060c10031f98", 1);
	if(n_index == 1)
	{
		var_291fc0f7 = instance.var_c8c31c6e;
	}
	else
	{
		var_291fc0f7 = instance.var_32686fb7;
	}
	self thread function_11e6d414(instance);
	function_3ef1d58a(instance, n_index);
	self clientfield::set("" + #"hash_7434dc21c6d7b515", 1);
	self.str_obj = #"hash_20fe9adfca116abb";
	self.n_objective_id = zm_utility::function_f5a222a8(self.str_obj, self);
	self.mdl_clip = namespace_8b6a9d79::spawn_script_model(var_291fc0f7, "collision_player_cylinder_192");
	instance.var_e5464a7e = namespace_8b6a9d79::spawn_script_model(var_291fc0f7, "tag_origin");
	waitframe(1);
	if(isdefined(self.mdl_clip))
	{
		self.mdl_clip ghost();
	}
}

/*
	Name: function_545164ce
	Namespace: namespace_b2add33c
	Checksum: 0x21A5E0D
	Offset: 0x50F8
	Size: 0xF8
	Parameters: 0
	Flags: None
*/
function function_545164ce()
{
	self endon(#"death");
	a_zombies = function_a38db454(self.origin, 1000);
	foreach(zombie in a_zombies)
	{
		if(isalive(zombie) && !isvehicle(zombie))
		{
			zombie thread function_6abe3eb2(self.origin);
		}
	}
}

/*
	Name: function_6abe3eb2
	Namespace: namespace_b2add33c
	Checksum: 0x28C86F98
	Offset: 0x51F8
	Size: 0x1A4
	Parameters: 1
	Flags: None
*/
function function_6abe3eb2(v_org)
{
	self endon(#"death");
	if(isdefined(self) && self.var_6f84b820 === #"normal")
	{
		v_dir = vectornormalize(self.origin - v_org);
		v_launch = (v_dir * randomintrange(100, 150)) + vectorscale((0, 0, 1), 150);
		self.allowdeath = 1;
		if(isalive(self) && !self isragdoll())
		{
			if(zm_utility::is_magic_bullet_shield_enabled(self))
			{
				self util::stop_magic_bullet_shield();
			}
			self zm_utility::start_ragdoll();
			waitframe(2);
			self launchragdoll(v_launch);
			if(isalive(self))
			{
				if(zm_utility::is_magic_bullet_shield_enabled(self))
				{
					self util::stop_magic_bullet_shield();
				}
				self kill();
			}
		}
	}
}

/*
	Name: function_11e6d414
	Namespace: namespace_b2add33c
	Checksum: 0x36FA4E93
	Offset: 0x53A8
	Size: 0x17C
	Parameters: 1
	Flags: None
*/
function function_11e6d414(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(distance2dsquared(player.origin, self.origin) <= 90000)
			{
				if(!is_true(player.var_cbf09f9f))
				{
					player.var_cbf09f9f = 1;
					player thread function_55904a22(instance, 1);
				}
				continue;
			}
			if(is_true(player.var_cbf09f9f))
			{
				player.var_cbf09f9f = 0;
				player thread function_55904a22(instance, 0);
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_55904a22
	Namespace: namespace_b2add33c
	Checksum: 0xCAEE2D45
	Offset: 0x5530
	Size: 0x9C
	Parameters: 2
	Flags: None
*/
function function_55904a22(instance, var_617b7cef)
{
	self endon(#"death");
	if(isdefined(self) && var_617b7cef)
	{
		self clientfield::set_to_player("" + #"hash_bd79b6ca5ca6bc0", 1);
	}
	else if(isdefined(self))
	{
		self clientfield::set_to_player("" + #"hash_bd79b6ca5ca6bc0", 0);
	}
}

/*
	Name: function_3ef1d58a
	Namespace: namespace_b2add33c
	Checksum: 0xE7E68FB6
	Offset: 0x55D8
	Size: 0x88
	Parameters: 2
	Flags: None
*/
function function_3ef1d58a(instance, n_path)
{
	var_cdce8e6f = instance.var_fe2612fe[#"hash_3e7c0b4f211e4717" + n_path][0];
	if(isdefined(var_cdce8e6f.script_noteworthy))
	{
		instance flag::set(#"hash_12988a5a3e6a65d6");
		level.var_97e461d4 = var_cdce8e6f.script_noteworthy;
	}
}

/*
	Name: function_8ec2f88a
	Namespace: namespace_b2add33c
	Checksum: 0xB0A18E3F
	Offset: 0x5668
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_8ec2f88a()
{
	self waittill(#"objective_ended");
	if(self flag::get(#"hash_12988a5a3e6a65d6"))
	{
		level.var_97e461d4 = undefined;
		self flag::clear(#"hash_12988a5a3e6a65d6");
	}
}

/*
	Name: function_deefa538
	Namespace: namespace_b2add33c
	Checksum: 0x251A4939
	Offset: 0x56E0
	Size: 0x448
	Parameters: 1
	Flags: None
*/
function function_deefa538(n_index)
{
	self endon(#"objective_ended", #"hash_199da05489df8b42");
	self thread function_acb29231();
	n_spawns = function_e97e2683();
	self.n_spawns = 0;
	if(n_index == 1)
	{
		s_pt = array::random(self.var_c30ec716);
	}
	else
	{
		s_pt = self.var_32686fb7;
	}
	a_s_pts = namespace_85745671::function_e4791424(s_pt.origin, 64, 80, 1500, 500);
	a_s_pts = array::randomize(a_s_pts);
	i = 0;
	while(true)
	{
		level flag::wait_till("spawn_zombies");
		if(self.n_active >= n_spawns)
		{
			self function_af1955d4();
		}
		if(isdefined(a_s_pts[i]))
		{
			s_spawnpt = a_s_pts[i];
		}
		if(isdefined(s_spawnpt) && self.n_active < self.n_max)
		{
			var_7ecdee63 = function_aece4588(level.var_b48509f9);
			if(namespace_7589cf5c::function_82e262cf(var_7ecdee63))
			{
				if(isdefined(self.var_38c710c3))
				{
					n_cooldown = namespace_7589cf5c::function_190c51a9();
					var_be32c966 = (float(gettime()) / 1000) - self.var_38c710c3;
					if(var_be32c966 < n_cooldown)
					{
						var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
					}
					else
					{
						self.var_38c710c3 = undefined;
					}
				}
				if(self.var_2133c784 >= self.var_61c57c53 || self.var_b803db9c >= self.var_5de17ec9)
				{
					var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
				}
			}
			ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, s_spawnpt.origin, s_spawnpt.angles, "transport_zombie");
			wait(0.1);
			if(isdefined(ai_spawned))
			{
				i++;
				if(i > a_s_pts.size - 1)
				{
					i = 0;
					a_s_pts = array::randomize(a_s_pts);
				}
				if(namespace_7589cf5c::function_82e262cf(ai_spawned.aitype))
				{
					self.var_38c710c3 = float(gettime()) / 1000;
					self.var_2133c784++;
					self.var_b803db9c++;
					ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
				}
				else
				{
					ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &on_zombie_killed);
				}
				ai_spawned thread zombie_attack(self);
				self.n_active++;
				self.n_spawns++;
				if(self.n_spawns >= n_spawns)
				{
					self flag::set(#"hash_199da05489df8b42");
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_acb29231
	Namespace: namespace_b2add33c
	Checksum: 0x10645745
	Offset: 0x5B30
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_acb29231()
{
	self endon(#"objective_ended", #"hash_199da05489df8b42");
	wait(7);
	self flag::set(#"hash_199da05489df8b42");
}

/*
	Name: function_b6e915a3
	Namespace: namespace_b2add33c
	Checksum: 0x541ECD87
	Offset: 0x5B90
	Size: 0xC4
	Parameters: 3
	Flags: None
*/
function function_b6e915a3(instance, var_d8f8912, var_e7201bd1)
{
	instance endon(#"objective_ended");
	self endon(#"hash_46ec4489ed0e4649");
	n_dist = sqr(var_e7201bd1);
	while(true)
	{
		if(distance2dsquared(var_d8f8912.origin, self.origin) <= n_dist)
		{
			self flag::set(#"hash_46ec4489ed0e4649");
			break;
		}
		wait(0.5);
	}
}

/*
	Name: function_dd90167d
	Namespace: namespace_b2add33c
	Checksum: 0x1D5068F0
	Offset: 0x5C60
	Size: 0x12C
	Parameters: 0
	Flags: None
*/
function function_dd90167d()
{
	self endon(#"objective_ended");
	self thread objective_manager::start_timer(150, "launch");
	self thread monitor_timer();
	self thread function_6828193b();
	wait(self.var_f2842de3);
	if(isdefined(self.vh_truck))
	{
		self.vh_truck namespace_7589cf5c::function_ac709d66(self, #"hash_7d76185cb6110ce4");
	}
	wait(self.var_f2842de3);
	if(isdefined(self.vh_truck))
	{
		self.vh_truck namespace_7589cf5c::function_ac709d66(self, #"hash_7fd3f8b541f288c3");
	}
	wait(self.var_f2842de3);
	if(isdefined(self.vh_truck))
	{
		self.vh_truck namespace_7589cf5c::function_ac709d66(self, #"hash_7c088c6611064b5f");
	}
}

/*
	Name: function_6828193b
	Namespace: namespace_b2add33c
	Checksum: 0xBD970585
	Offset: 0x5D98
	Size: 0x194
	Parameters: 0
	Flags: None
*/
function function_6828193b()
{
	self endon(#"objective_ended");
	wait(self.var_d4ef06c4);
	if(isdefined(self.vh_truck))
	{
		self.vh_truck namespace_7589cf5c::function_ac709d66(self, #"hash_350f95f2d7aadc8f");
	}
	foreach(var_b3fb5814 in self.var_da3c0f01)
	{
		if(!isdefined(var_b3fb5814))
		{
			continue;
		}
		var_b3fb5814 clientfield::set("" + #"hash_1cf7ea5253c0a857", 0);
		if(!is_true(var_b3fb5814.var_57e77903.b_pickedup))
		{
			var_b3fb5814 clientfield::set("" + #"hash_699685336205339b", 1);
		}
	}
	wait(10);
	if(isdefined(self.vh_truck))
	{
		self.vh_truck namespace_7589cf5c::function_ac709d66(self, #"hash_7a629bf9f0051768");
	}
}

/*
	Name: function_8346a72c
	Namespace: namespace_b2add33c
	Checksum: 0x40D5F2
	Offset: 0x5F38
	Size: 0x280
	Parameters: 0
	Flags: None
*/
function function_8346a72c()
{
	self endon(#"objective_ended", #"hash_8202877a3aadac8");
	self.vh_truck endon(#"death");
	self.var_77dec63f = 0;
	while(true)
	{
		if(!self.var_77dec63f && distance2dsquared(self.var_7a1183ab.origin, self.vh_truck.origin) <= 49000000)
		{
			self.var_77dec63f = 1;
			self flag::set(#"hash_2001caea1bbe9d01");
			self thread function_b588231f();
		}
		else if(distance2dsquared(self.var_7a1183ab.origin, self.vh_truck.origin) <= 16000000)
		{
			self flag::set(#"hash_3500bd24e9ec88a");
			self.vh_truck flag::set(#"hash_46ec4489ed0e4649");
			break;
		}
		wait(0.5);
	}
	self flag::set(#"hash_304ab3de1ffdb16");
	self thread function_fbaf0bd(self.var_c7f8f5a6);
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_759f0287fd5b1e64");
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 2);
	}
}

/*
	Name: function_b588231f
	Namespace: namespace_b2add33c
	Checksum: 0xE99B9CF2
	Offset: 0x61C0
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_b588231f()
{
	self endon(#"objective_ended", #"hash_8202877a3aadac8", #"hash_3500bd24e9ec88a");
	self flag::wait_till(#"hash_2001caea1bbe9d01");
	while(true)
	{
		if(is_true(self.vh_truck.abnormal_status.emped))
		{
			self.var_afb5c5 = 1;
			break;
		}
		waitframe(1);
	}
	wait(1);
	self flag::set(#"hash_6850d08488f52f5e");
}

/*
	Name: function_6e36834e
	Namespace: namespace_b2add33c
	Checksum: 0xA59AF640
	Offset: 0x62A0
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_6e36834e(instance)
{
	instance endon(#"objective_ended");
	self flag::wait_till(#"hash_1faf75ea07b99540");
	if(isdefined(self.var_44bcdedf))
	{
		self zm_utility::function_48d9a9c9();
		gameobjects::release_obj_id(self.var_44bcdedf);
	}
}

/*
	Name: function_dacf0fdd
	Namespace: namespace_b2add33c
	Checksum: 0x1C57DC6C
	Offset: 0x6328
	Size: 0x18C
	Parameters: 1
	Flags: None
*/
function function_dacf0fdd(instance)
{
	instance endon(#"objective_ended");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(is_true(player.var_28107825) && !is_true(level.var_5542906))
			{
				self gameobjects::function_664b40(player);
				objective_setinvisibletoplayer(instance.var_7a1183ab.var_55b38898, player);
				continue;
			}
			self gameobjects::function_7a00d78c(player);
			if(instance function_c91906c5())
			{
				objective_setvisibletoplayer(instance.var_7a1183ab.var_55b38898, player);
			}
		}
		wait(0.25);
	}
}

/*
	Name: function_c91906c5
	Namespace: namespace_b2add33c
	Checksum: 0xA68C9539
	Offset: 0x64C0
	Size: 0xA2
	Parameters: 0
	Flags: None
*/
function function_c91906c5()
{
	foreach(player in getplayers())
	{
		if(is_true(player.var_28107825))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_1fc51f74
	Namespace: namespace_b2add33c
	Checksum: 0x2F25992B
	Offset: 0x6570
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_1fc51f74(player)
{
	if(isplayer(player))
	{
		if(isdefined(player))
		{
			player playrumblelooponentity("damage_light");
			player clientfield::set_to_player("" + #"hash_502dbbefce1f656c", 0);
		}
	}
}

/*
	Name: function_c8bfd10b
	Namespace: namespace_b2add33c
	Checksum: 0x2757BE51
	Offset: 0x65F8
	Size: 0x564
	Parameters: 3
	Flags: None
*/
function function_c8bfd10b(str_team, e_player, b_result)
{
	e_player stoprumble("damage_light");
	if(b_result)
	{
		level.var_50cb7dc9++;
		if(isdefined(e_player.var_67aa3392))
		{
			var_67aa3392 = e_player.var_67aa3392;
		}
		v_org = self.e_object.origin;
		v_ang = self.e_object.angles;
		if(isdefined(var_67aa3392))
		{
			var_67aa3392 flag::set(#"hash_1af2713ef9bae31c");
			var_67aa3392 notify(#"installed");
			var_67aa3392 unlink();
			var_67aa3392 clientfield::set("" + #"hash_7e6957dfc36e2214", 0);
			if(isdefined(var_67aa3392.var_f71b7261))
			{
				var_67aa3392 zm_utility::function_48d9a9c9();
				gameobjects::release_obj_id(var_67aa3392.var_f71b7261);
				objective_delete(var_67aa3392.var_f71b7261);
				var_67aa3392.var_f71b7261 = undefined;
			}
		}
		e_player clientfield::set_to_player("" + #"hash_502dbbefce1f656c", 0);
		e_player.var_28107825 = 0;
		e_player.var_4cd303ca = 1;
		e_player notify(#"hash_6d2d12b8afe43c8e");
		e_player thread function_1a58f438();
		if(isdefined(e_player.var_57e77903))
		{
			e_player.var_57e77903 delete();
		}
		else
		{
			e_player detach(#"hash_18fe97c27ac7bf5b", "tag_stowed_back");
		}
		e_player.var_67aa3392 = undefined;
		e_player thread function_bd0bc40b(0);
		waitframe(1);
		if(isdefined(var_67aa3392))
		{
			var_67aa3392 rotateto(self.e_object.angles, 0.05);
			var_67aa3392 moveto(self.e_object.origin, 0.05);
			var_67aa3392 waittill(#"movedone");
			var_67aa3392 show();
			var_67aa3392.var_2e5efdc7 = 1;
			var_67aa3392.t_pickup delete();
			var_67aa3392 playsound(#"hash_59680d123025c6f0");
		}
		e_player.var_4cd303ca = 0;
		var_53ba65b = getentarray("transport_canister", "targetname");
		foreach(var_57e77903 in var_53ba65b)
		{
			if(isdefined(var_67aa3392) && var_57e77903 != var_67aa3392 && isdefined(var_57e77903.n_objective_id) && !is_true(var_57e77903.var_2e5efdc7))
			{
				objective_setvisibletoplayer(var_57e77903.n_objective_id, e_player);
			}
		}
		if(isdefined(var_67aa3392))
		{
			var_67aa3392 thread function_457be561(v_org, v_ang);
		}
		if(level.var_50cb7dc9 > 1)
		{
			self zm_utility::function_48d9a9c9();
			self gameobjects::destroy_object(1, 1);
			wait(5);
		}
		else
		{
			level.var_5542906 = 1;
			self thread namespace_7589cf5c::function_ac709d66(self, #"hash_6f4fe1415110a777");
			wait(5);
			level.var_5542906 = 0;
		}
	}
	else if(is_true(e_player.var_28107825))
	{
		e_player clientfield::set_to_player("" + #"hash_502dbbefce1f656c", 1);
	}
}

/*
	Name: function_457be561
	Namespace: namespace_b2add33c
	Checksum: 0x6CEC8F85
	Offset: 0x6B68
	Size: 0x10C
	Parameters: 2
	Flags: None
*/
function function_457be561(v_org, v_ang)
{
	if(is_true(self.var_2e5efdc7))
	{
		self scene::play(#"hash_4d978b2a49cbf4e9", self);
		self scene::stop();
		wait(1);
		self setmodel(#"hash_6a3359ce6cad3369");
		self rotateyaw(90, 0.05);
	}
	if(self.n_id)
	{
		str_scene = #"hash_662aeccce7bf6605";
	}
	else
	{
		str_scene = #"hash_52764fb3a2b546c2";
	}
	self thread scene::play(str_scene, self);
}

/*
	Name: function_f692b63a
	Namespace: namespace_b2add33c
	Checksum: 0xEA493E01
	Offset: 0x6C80
	Size: 0xE2
	Parameters: 2
	Flags: None
*/
function function_f692b63a(instance, n_index)
{
	instance endon(#"objective_ended", #"hash_7ae25b738e2655a3");
	if(isdefined(instance.vh_truck))
	{
		instance.vh_truck endon(#"death");
	}
	instance flag::wait_till(#"hash_1f275458db65249d");
	n_dist = distance(self.origin, instance.var_da3c0f01[n_index].origin);
	n_time = n_dist / 1500;
	self.v_start = self.origin;
}

/*
	Name: function_494fde88
	Namespace: namespace_b2add33c
	Checksum: 0xCEC516F6
	Offset: 0x6D70
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function function_494fde88()
{
	self endon(#"objective_ended");
	if(isdefined(self.vh_truck))
	{
		self.vh_truck endon(#"death");
		self.vh_truck.var_ba2e9c85 = self.vh_truck.health;
	}
	self waittill(#"hash_7ae25b738e2655a3");
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_23ebc154fc5d24b1");
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 2);
	}
	if(isdefined(self.vh_truck))
	{
		var_18acfe18 = self.vh_truck.var_ba2e9c85 - self.vh_truck.health;
		n_damage = var_18acfe18 - 400;
		if(n_damage)
		{
			self.vh_truck function_c4ca313e(self, n_damage);
		}
	}
}

/*
	Name: function_c4ca313e
	Namespace: namespace_b2add33c
	Checksum: 0x4914B9CA
	Offset: 0x6F20
	Size: 0x174
	Parameters: 2
	Flags: None
*/
function function_c4ca313e(instance, n_damage)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	util::wait_network_frame();
	if(n_damage > 0)
	{
		damage = self.healthdefault - (self.var_c62824cc - n_damage);
		if((self.healthdefault - damage) >= self.var_c62824cc)
		{
			return;
		}
		if((self.healthdefault - damage) <= 1400)
		{
			damage = (self.healthdefault - 1400) - 400;
		}
		self setvehicletype("vehicle_t9_mil_ru_truck_transport_player_obj_sr");
		util::wait_network_frame();
		self function_41b29ff0("destructible_veh_t9_mil_ru_truck_transport_player_wz");
		util::wait_network_frame();
		self function_ff03229a(instance);
		if(damage > 0)
		{
			self dodamage(damage, self.origin, self);
		}
	}
}

/*
	Name: function_2fa04222
	Namespace: namespace_b2add33c
	Checksum: 0x20DDB9E6
	Offset: 0x70A0
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_2fa04222(instance)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	while(true)
	{
		instance.var_67ed7be7 = self.health;
		waitframe(1);
	}
}

/*
	Name: function_c561af6e
	Namespace: namespace_b2add33c
	Checksum: 0x491AAF13
	Offset: 0x7100
	Size: 0x100
	Parameters: 1
	Flags: None
*/
function function_c561af6e(instance)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	self thread function_2fa04222(instance);
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"enter_vehicle");
		self.prev_health = instance.var_67ed7be7;
		if(isdefined(self) && s_result.seat_index === 0)
		{
			if(self.health > self.prev_health)
			{
				var_18acfe18 = self.var_c62824cc - self.prev_health;
				if(var_18acfe18)
				{
					self set_health(instance, var_18acfe18);
				}
			}
		}
	}
}

/*
	Name: set_health
	Namespace: namespace_b2add33c
	Checksum: 0x69997445
	Offset: 0x7208
	Size: 0x104
	Parameters: 2
	Flags: None
*/
function set_health(instance, n_damage)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	util::wait_network_frame();
	if(n_damage > 0)
	{
		self setvehicletype("vehicle_t9_mil_ru_truck_transport_player_obj_sr");
		util::wait_network_frame();
		self function_41b29ff0("destructible_veh_t9_mil_ru_truck_transport_player_wz");
		util::wait_network_frame();
		self function_ff03229a(instance);
		if(n_damage > 0)
		{
			self dodamage(n_damage, self.origin, self);
		}
	}
}

/*
	Name: function_9458dd64
	Namespace: namespace_b2add33c
	Checksum: 0x5F233B95
	Offset: 0x7318
	Size: 0x1C4
	Parameters: 0
	Flags: None
*/
function function_9458dd64()
{
	self endon(#"objective_ended", #"hash_7ae25b738e2655a3");
	if(isdefined(self.vh_truck))
	{
		self.vh_truck endon(#"death");
	}
	self flag::wait_till(#"hash_1f275458db65249d");
	wait(self.var_1d61d338);
	if(isdefined(self.vh_truck))
	{
		self.vh_truck namespace_7589cf5c::function_ac709d66(self, #"hash_5a8fc195328e8413");
	}
	wait(self.var_1d61d338);
	self.mdl_vortex clientfield::set("" + #"hash_7434dc21c6d7b515", 2);
	if(isdefined(self.vh_truck))
	{
		self.vh_truck namespace_7589cf5c::function_ac709d66(self, #"hash_72716702801db7c7");
	}
	wait(self.var_1d61d338);
	if(isdefined(self.vh_truck))
	{
		self.vh_truck namespace_7589cf5c::function_ac709d66(self, #"hash_144a929b5ff470");
	}
	wait(self.var_1d61d338);
	if(isdefined(self.vh_truck))
	{
		self.vh_truck namespace_7589cf5c::function_ac709d66(self, #"hash_27c8a95d2fc1804d");
	}
	self flag::set(#"hash_7ae25b738e2655a3");
}

/*
	Name: function_6a62464c
	Namespace: namespace_b2add33c
	Checksum: 0xDF8E7B7C
	Offset: 0x74E8
	Size: 0x162
	Parameters: 3
	Flags: None
*/
function function_6a62464c(v_goal, n_dist, n_time)
{
	self endon(#"death");
	self clientfield::set("" + #"hash_11838968b17d8418", 1);
	n_inc = 200;
	while(true)
	{
		n_current_dist = distance2d(self.origin, n_dist);
		if(n_current_dist < 15)
		{
			break;
		}
		v_dest = n_dist + (0, 0, n_inc);
		n_inc = n_inc - 10;
		self moveto(v_dest, n_time);
		waitframe(1);
	}
	self clientfield::set("" + #"hash_11838968b17d8418", 0);
	wait(0.1);
	self moveto(self.v_start, 0.05);
	self waittill(#"movedone");
}

/*
	Name: function_dc606bb2
	Namespace: namespace_b2add33c
	Checksum: 0xF2C50941
	Offset: 0x7658
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_dc606bb2(str_notify)
{
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_95763dcc
	Namespace: namespace_b2add33c
	Checksum: 0x8BF6AADC
	Offset: 0x7690
	Size: 0x19C
	Parameters: 0
	Flags: None
*/
function function_95763dcc()
{
	self endon(#"death");
	if(isdefined(self))
	{
		self clientfield::set("" + #"hash_2c70ab0c21e69749", 0);
		self clientfield::set("stunned", 0);
		self vehicle_ai::emp_startup_fx();
		self vehicle::toggle_emp_fx(0);
		self vehicle::toggle_sounds(1);
		self clientfield::set("isJammed", 0);
		self.isjammed = 0;
		self.emped = 0;
		self.abnormal_status.emped = 0;
		self.var_52e23e90 = 1;
		while(true)
		{
			driver = self getseatoccupant(0);
			if(isdefined(driver))
			{
				self setbrake(0);
				break;
			}
			waitframe(1);
		}
		if(vehicle_ai::function_329f45a4())
		{
			if(!is_false(self.var_cd4099ea))
			{
				self function_1a852d1d();
			}
		}
	}
}

/*
	Name: function_1a852d1d
	Namespace: namespace_b2add33c
	Checksum: 0xA316E011
	Offset: 0x7838
	Size: 0x104
	Parameters: 0
	Flags: None
*/
function function_1a852d1d()
{
	if(is_true(self.emped) || is_true(self.isjammed))
	{
		self takeplayercontrol();
		return;
	}
	if(isdefined(self.state_machines))
	{
		return;
	}
	if(is_true(self.var_52e23e90))
	{
		return;
	}
	turn_on();
	var_a56c96d1 = spawnstruct();
	var_a56c96d1.var_c2e048f9 = 1;
	var_a56c96d1.turn_off = &function_6c46026b;
	var_a56c96d1.var_7dabdc1b = !is_false(self.var_56b349b4);
	self vehicle_ai::defaultstate_driving_enter(var_a56c96d1);
}

/*
	Name: function_6c46026b
	Namespace: namespace_b2add33c
	Checksum: 0x5A470060
	Offset: 0x7948
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_6c46026b()
{
	if(isdefined(self.state_machines))
	{
		return;
	}
	self turn_off();
	self vehicle_ai::defaultstate_driving_exit();
}

/*
	Name: turn_on
	Namespace: namespace_b2add33c
	Checksum: 0x594CB056
	Offset: 0x7990
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function turn_on(params)
{
	var_9cd704a7 = spawnstruct();
	var_9cd704a7.var_da88902a = 1;
	if(isdefined(params))
	{
		var_9cd704a7.var_30a04b16 = params.var_30a04b16;
	}
	self vehicle_ai::defaultstate_off_exit(var_9cd704a7);
	self.var_52e23e90 = 1;
}

/*
	Name: turn_off
	Namespace: namespace_b2add33c
	Checksum: 0x72859283
	Offset: 0x7A10
	Size: 0x196
	Parameters: 0
	Flags: None
*/
function turn_off()
{
	if(is_true(self.var_52e23e90))
	{
		self vehicle::function_7f0bbde3();
	}
	self vehicle::toggle_tread_fx(0);
	self vehicle::toggle_exhaust_fx(0);
	self vehicle::toggle_sounds(0);
	self vehicle::function_bbc1d940(0);
	self vehicle::lights_off();
	self vehicle::toggle_lights_group(1, 0);
	self vehicle::toggle_lights_group(2, 0);
	self vehicle::toggle_lights_group(3, 0);
	self vehicle::toggle_lights_group(4, 0);
	self vehicle::toggle_force_driver_taillights(0);
	self vehicle_ai::turnoffallambientanims();
	if(isairborne(self))
	{
		self setphysacceleration(vectorscale((0, 0, -1), 300));
		self setrotorspeed(0);
	}
	self.var_52e23e90 = undefined;
}

/*
	Name: function_990585f
	Namespace: namespace_b2add33c
	Checksum: 0xD1342454
	Offset: 0x7BB0
	Size: 0x21C
	Parameters: 1
	Flags: None
*/
function function_990585f(params)
{
	self endon(#"death");
	self thread function_80cfa679();
	self clientfield::set("" + #"hash_2c70ab0c21e69749", 1);
	self setspeedimmediate(0);
	self setbrake(1);
	playrumbleonposition("sr_transmitter_impact", self.origin);
	self vehicle::function_bbc1d940(0);
	self vehicle::toggle_sounds(0);
	if(is_true(self.var_52e23e90))
	{
		self vehicle::function_7f0bbde3();
		self playsound(#"hash_d6643b88d0186ae");
	}
	self.var_52e23e90 = undefined;
	if(!isdefined(self.abnormal_status))
	{
		self.abnormal_status = spawnstruct();
	}
	self clientfield::set("stunned", 1);
	self.abnormal_status.emped = 1;
	self.abnormal_status.attacker = params.param1;
	self.abnormal_status.inflictor = params.param2;
	self waittill(#"hash_182388f89ef59840");
	self.is_staircase_up = undefined;
	self flag::clear(#"hash_45d859f77668dcd5");
	self function_95763dcc();
}

/*
	Name: function_80cfa679
	Namespace: namespace_b2add33c
	Checksum: 0xB6EAEF9E
	Offset: 0x7DD8
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_80cfa679()
{
	self endon(#"death");
	self setseatoccupied(0, 1);
	self waittill(#"hash_182388f89ef59840");
	self setseatoccupied(0, 0);
}

/*
	Name: function_aece4588
	Namespace: namespace_b2add33c
	Checksum: 0x62EFABBD
	Offset: 0x7E48
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
			var_e7a1cbae = #"hash_797644c634cd5115";
			break;
		}
		case 2:
		{
			var_e7a1cbae = #"hash_797641c634cd4bfc";
			break;
		}
		case 3:
		{
			var_e7a1cbae = #"hash_797642c634cd4daf";
			break;
		}
		case 4:
		{
			var_e7a1cbae = #"hash_79763fc634cd4896";
			break;
		}
		case 5:
		{
			var_e7a1cbae = #"hash_797640c634cd4a49";
			break;
		}
		case 6:
		{
			var_e7a1cbae = #"hash_79763dc634cd4530";
			break;
		}
		case 7:
		{
			var_e7a1cbae = #"hash_79763ec634cd46e3";
			break;
		}
		default:
		{
			var_e7a1cbae = #"hash_79764bc634cd5cfa";
			break;
		}
	}
	var_6017f33e = namespace_679a22ba::function_ca209564(var_e7a1cbae);
	return var_6017f33e.var_990b33df;
}

/*
	Name: function_c36cb7b1
	Namespace: namespace_b2add33c
	Checksum: 0xF424D65B
	Offset: 0x7FD8
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_c36cb7b1(params)
{
	if(isdefined(level.var_7d45d0d4.var_3385b421) && level.var_7d45d0d4.var_3385b421.var_b803db9c > 0)
	{
		level.var_7d45d0d4.var_3385b421.var_b803db9c--;
	}
	if(is_true(params.eattacker.var_28107825))
	{
		if(self.var_6f84b820 === #"elite")
		{
			level scoreevents::doscoreeventcallback("scoreEventSR", {#enemy:self, #attacker:params.eattacker, #scoreevent:"retrieve_cannister_elite_kill_zm"});
		}
		else if(self.var_6f84b820 === #"special")
		{
			level scoreevents::doscoreeventcallback("scoreEventSR", {#enemy:self, #attacker:params.eattacker, #scoreevent:"retrieve_cannister_special_kill_zm"});
		}
	}
}

/*
	Name: on_zombie_killed
	Namespace: namespace_b2add33c
	Checksum: 0x57E32DCA
	Offset: 0x8158
	Size: 0x80
	Parameters: 1
	Flags: None
*/
function on_zombie_killed(params)
{
	if(isdefined(level.var_7d45d0d4.var_3385b421) && isdefined(level.var_7d45d0d4.var_3385b421.n_active))
	{
		if(level.var_7d45d0d4.var_3385b421.n_active > 0)
		{
			level.var_7d45d0d4.var_3385b421.n_active--;
		}
	}
}

/*
	Name: function_31fe5df1
	Namespace: namespace_b2add33c
	Checksum: 0x96A144BE
	Offset: 0x81E0
	Size: 0x178
	Parameters: 1
	Flags: None
*/
function function_31fe5df1(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	while(true)
	{
		instance flag::wait_till(#"hash_1f275458db65249d");
		self playrumblelooponentity("sr_machinery_rumble");
		self clientfield::set("" + #"hash_2833af7211f19903", self.n_id + 1);
		wait(0.1);
		instance flag::clear(#"hash_1f275458db65249d");
		instance flag::wait_till(#"hash_7ae25b738e2655a3");
		wait(0.1);
		self stoprumble("sr_machinery_rumble");
		self clientfield::set("" + #"hash_2833af7211f19903", 0);
		instance flag::clear(#"hash_7ae25b738e2655a3");
	}
}

/*
	Name: function_13a328f
	Namespace: namespace_b2add33c
	Checksum: 0x2BA2DA3E
	Offset: 0x8360
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function function_13a328f(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	self thread function_31fe5df1(instance);
	self.var_57e77903 = util::spawn_model(#"hash_18fe97c27ac7bf5b", self gettagorigin("canister_jnt"), self.angles);
	waitframe(1);
	instance.var_53ba65b[instance.var_53ba65b.size] = self.var_57e77903;
	self.var_57e77903.targetname = "transport_canister";
	self.var_57e77903 ghost();
	self.var_57e77903 notsolid();
	self.var_57e77903 linkto(self, "canister_jnt");
	instance flag::wait_till_any(array(#"hash_304ab3de1ffdb16", #"hash_6850d08488f52f5e"));
	self thread function_d1a72932(instance);
	self thread function_f7616c2b(instance);
}

/*
	Name: function_f7616c2b
	Namespace: namespace_b2add33c
	Checksum: 0x66A2D964
	Offset: 0x8500
	Size: 0x1EC
	Parameters: 1
	Flags: None
*/
function function_f7616c2b(instance)
{
	instance endon(#"objective_ended");
	instance.vh_truck endon(#"death");
	if(self.n_id === 1)
	{
		wait(self.n_id);
	}
	self clientfield::set("" + #"hash_7e6957dfc36e2214", 1);
	self scene::play(#"hash_886be5b252cae0f", "Shot 1", self);
	self linkto(instance.vh_truck);
	self flag::set(#"hash_1faf75ea07b99540");
	if(isdefined(self.var_57e77903))
	{
		self.var_57e77903.n_id = self.n_id;
		self.var_57e77903 clientfield::set("" + #"hash_7e6957dfc36e2214", 1);
		self clientfield::set("" + #"hash_7e6957dfc36e2214", 0);
		self.var_57e77903 show();
		self.var_57e77903 solid();
		self.var_57e77903.v_start = self.var_57e77903.origin;
		wait(0.1);
		self hidepart("canister_jnt", "", 1);
	}
}

/*
	Name: function_d1a72932
	Namespace: namespace_b2add33c
	Checksum: 0x48439890
	Offset: 0x86F8
	Size: 0x22C
	Parameters: 1
	Flags: None
*/
function function_d1a72932(instance)
{
	instance endon(#"objective_ended");
	canister = self.var_57e77903;
	canister.var_b3fb5814 = self;
	self thread function_a4ea1b9e(instance, canister);
	canister.b_pickedup = 0;
	canister.var_2e5efdc7 = 0;
	canister.var_a325551c = 0;
	canister.t_pickup = spawn("trigger_radius_use", canister.origin + vectorscale((0, 0, 1), 8), 0, 96, 96, 1);
	canister.t_pickup triggerignoreteam();
	canister.t_pickup setcursorhint("HINT_NOICON");
	canister.t_pickup sethintstring(#"hash_c90fb1f338973f7");
	canister.t_pickup usetriggerrequirelookat(1);
	canister.t_pickup enablelinkto();
	canister.t_pickup linkto(canister);
	canister.t_pickup triggerenable(0);
	canister.t_pickup.var_489d6eaa = 1;
	self flag::wait_till(#"hash_1faf75ea07b99540");
	canister.t_pickup triggerenable(1);
	canister.t_pickup thread function_ac499c2b(instance);
	canister thread function_57d4f7c0(instance);
}

/*
	Name: function_ac499c2b
	Namespace: namespace_b2add33c
	Checksum: 0x5240FFCE
	Offset: 0x8930
	Size: 0x142
	Parameters: 1
	Flags: None
*/
function function_ac499c2b(instance)
{
	instance endon(#"objective_ended");
	self endon(#"picked_up", #"death");
	while(true)
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(isalive(player))
			{
				if(player zm_utility::function_ab9a9770())
				{
					self setvisibletoplayer(player);
					continue;
				}
				self setinvisibletoplayer(player);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_a4ea1b9e
	Namespace: namespace_b2add33c
	Checksum: 0xF7AFCE4D
	Offset: 0x8A80
	Size: 0x10C
	Parameters: 2
	Flags: None
*/
function function_a4ea1b9e(instance, canister)
{
	instance endon(#"objective_ended");
	self flag::wait_till(#"hash_1faf75ea07b99540");
	canister.var_965b64b0 = #"hash_24dc0bc90be2e74a";
	canister.var_3c7b1c1c = zm_utility::function_f5a222a8(canister.var_965b64b0, canister);
	canister zm_utility::function_747180ea(canister.var_3c7b1c1c, undefined, canister.t_pickup);
	canister flag::wait_till(#"hash_1af2713ef9bae31c");
	if(isdefined(canister.var_3c7b1c1c))
	{
		canister zm_utility::function_48d9a9c9();
		gameobjects::release_obj_id(canister.var_3c7b1c1c);
	}
}

/*
	Name: function_57d4f7c0
	Namespace: namespace_b2add33c
	Checksum: 0xD6DD96D3
	Offset: 0x8B98
	Size: 0x688
	Parameters: 1
	Flags: None
*/
function function_57d4f7c0(instance)
{
	self endon(#"installed", #"death");
	instance endon(#"objective_ended");
	while(true)
	{
		s_result = undefined;
		s_result = self.t_pickup waittill(#"trigger");
		player = s_result.activator;
		self clientfield::set("" + #"hash_7e6957dfc36e2214", 0);
		if(isdefined(player) && isplayer(player) && !is_true(player.var_28107825) && !is_true(self.b_pickedup))
		{
			instance notify(#"hash_33e194cec969b040");
			instance.var_cfa9ae84++;
			if(isdefined(self.var_b3fb5814))
			{
				if(self.var_b3fb5814 clientfield::get("" + #"hash_1cf7ea5253c0a857"))
				{
					self.var_b3fb5814 clientfield::set("" + #"hash_1cf7ea5253c0a857", 0);
				}
				if(self.var_b3fb5814 clientfield::get("" + #"hash_699685336205339b"))
				{
					self.var_b3fb5814 clientfield::set("" + #"hash_699685336205339b", 0);
				}
			}
			self notify(#"picked_up");
			self.t_pickup notify(#"picked_up");
			self.t_pickup setvisibletoall();
			playsoundatposition(#"hash_1105191492bc5a15", self.origin + vectorscale((0, 0, 1), 25));
			if(isdefined(player))
			{
				player playrumbleonentity("damage_heavy");
			}
			foreach(e_player in getplayers())
			{
				if(e_player != player)
				{
					self.t_pickup setinvisibletoplayer(e_player);
				}
			}
			objective_setinvisibletoall(self.var_3c7b1c1c);
			if(!isdefined(self.var_11cf37e3))
			{
				if(self.n_id === 0)
				{
					self.var_11cf37e3 = #"hash_61f64747e0c7fd48";
				}
				else
				{
					self.var_11cf37e3 = #"hash_61f64a47e0c80261";
				}
				self.var_f71b7261 = zm_utility::function_f5a222a8(self.var_11cf37e3, self);
			}
			if(isdefined(self.var_f71b7261))
			{
				objective_setinvisibletoplayer(self.var_f71b7261, player);
			}
			self.b_pickedup = 1;
			self.e_owner = player;
			tagname = "tag_stowed_back";
			if(!player haspart(tagname))
			{
				tagname = undefined;
			}
			self.t_pickup usetriggerrequirelookat(0);
			self.t_pickup sethintstring(#"hash_1bdc30d1c55f4de");
			player.var_28107825 = 1;
			player.var_67aa3392 = self;
			waitframe(1);
			if(isdefined(tagname))
			{
				self linkto(player, tagname, (8, 5, -4), vectorscale((1, 0, 0), 270));
			}
			else
			{
				self linkto(player, undefined, (-12, 0, 45), vectorscale((-1, 0, 0), 5));
			}
			waitframe(1);
			self clientfield::set("" + #"hash_7e6957dfc36e2214", 1);
			player clientfield::set_to_player("" + #"hash_502dbbefce1f656c", 1);
			if(!is_true(player.var_7cd1b025))
			{
				player.var_7cd1b025 = 1;
			}
			player thread function_bd0bc40b(1);
			player thread function_61ee3ab0(instance, self);
			player thread function_36821329(instance);
			player thread function_4be8796(instance);
			player thread function_d52adbbc(instance);
			player thread function_9181f7b3(instance);
			self thread function_2d670ab2(instance);
			waitframe(1);
			player thread function_50a7d571(self, instance);
		}
	}
}

/*
	Name: function_50a7d571
	Namespace: namespace_b2add33c
	Checksum: 0xBA35CCF1
	Offset: 0x9228
	Size: 0xE6
	Parameters: 2
	Flags: None
*/
function function_50a7d571(var_67aa3392, instance)
{
	self endon(#"disconnect", #"player_downed", #"hash_6d2d12b8afe43c8e");
	instance endon(#"objective_ended");
	while(true)
	{
		var_53044e8e = self gamepadusedlast();
		if(!var_53044e8e && self buttonbitstate("BUTTON_BIT_ANY_DOWN") || (var_53044e8e && self actionslottwobuttonpressed()))
		{
			self thread function_7d00b085();
		}
		waitframe(1);
	}
}

/*
	Name: function_2d670ab2
	Namespace: namespace_b2add33c
	Checksum: 0x73789292
	Offset: 0x9318
	Size: 0x1C4
	Parameters: 1
	Flags: None
*/
function function_2d670ab2(instance)
{
	instance endon(#"objective_ended");
	self endon(#"installed", #"failsafe", #"death");
	while(true)
	{
		if(isdefined(self) && self.origin[2] < (instance.origin[2] - 10000) && isdefined(self.e_owner) && !self.e_owner clientfield::get("phase_rift_player_fx"))
		{
			if(is_true(self.b_pickedup))
			{
				if(isdefined(self.e_owner))
				{
					self.e_owner thread function_7d00b085();
					wait(1.5);
					if(isdefined(self))
					{
						self moveto(self.v_start, 0.05);
					}
				}
			}
			else
			{
				self moveto(self.v_start, 0.05);
				self waittill(#"movedone");
				if(isdefined(self))
				{
					self thread function_6fd7f323();
				}
			}
			if(isdefined(self))
			{
				self notify(#"failsafe");
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_7d00b085
	Namespace: namespace_b2add33c
	Checksum: 0x85959801
	Offset: 0x94E8
	Size: 0x17C
	Parameters: 0
	Flags: None
*/
function function_7d00b085()
{
	if(is_true(self.var_28107825) && !self util::is_spectating())
	{
		if(isdefined(self.var_67aa3392))
		{
			self.var_67aa3392 zm_utility::function_747180ea(self.var_67aa3392.var_1474d2ee, undefined, self.var_67aa3392.t_pickup);
		}
		self clientfield::set_to_player("" + #"hash_502dbbefce1f656c", 0);
		self.var_28107825 = 0;
		self.var_67aa3392 = undefined;
		if(isdefined(self.var_57e77903))
		{
			self.var_57e77903 delete();
		}
		else
		{
			self detach(#"hash_18fe97c27ac7bf5b", "tag_stowed_back");
		}
		self notify(#"hash_6d2d12b8afe43c8e");
		self thread function_1a58f438();
		self thread function_bd0bc40b(0);
		if(isdefined(self))
		{
			self playrumbleonentity("zm_interact_rumble");
		}
	}
}

/*
	Name: function_94e78240
	Namespace: namespace_b2add33c
	Checksum: 0x5E7BBFAB
	Offset: 0x9670
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_94e78240(params)
{
	if(isdefined(self) && level.zm_hint_text zm_hint_text::is_open(self))
	{
		level.zm_hint_text zm_hint_text::close(self);
	}
	self namespace_1b527536::function_460882e2(0);
	if(isdefined(self.var_67aa3392))
	{
		self.var_67aa3392.var_5b5d9768 = 0;
		self.var_67aa3392 clientfield::increment("" + #"hash_25f023cad32eccf0");
	}
	self function_62801b2f();
}

/*
	Name: function_1a58f438
	Namespace: namespace_b2add33c
	Checksum: 0x78689B72
	Offset: 0x9750
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_1a58f438()
{
	if(isdefined(self) && level.zm_hint_text zm_hint_text::is_open(self))
	{
		level.zm_hint_text zm_hint_text::close(self);
	}
	self thread namespace_1b527536::function_69303ed3();
}

/*
	Name: function_4be8796
	Namespace: namespace_b2add33c
	Checksum: 0x5323CEF4
	Offset: 0x97C0
	Size: 0x24C
	Parameters: 1
	Flags: None
*/
function function_4be8796(instance)
{
	instance endon(#"objective_ended");
	self endon(#"disconnect", #"player_downed", #"hash_6d2d12b8afe43c8e");
	if(!is_true(self.var_67aa3392.var_a325551c))
	{
		self.var_67aa3392.var_a325551c = 1;
		self.var_67aa3392.var_5b5d9768 = 6;
		namespace_1b527536::function_7281de4d(#"hash_42722c5a5596cde2", &function_94e78240, #"hash_60cb3fd3716d711e", #"hash_1a2e7166e36c7ed1", 1, 6, 1);
	}
	else
	{
		var_5b5d9768 = (isdefined(self.var_67aa3392.var_5b5d9768) ? self.var_67aa3392.var_5b5d9768 : 0);
		if(var_5b5d9768 >= 6)
		{
			namespace_1b527536::function_7281de4d(#"hash_42722c5a5596cde2", &function_94e78240, #"hash_60cb3fd3716d711e", #"hash_1a2e7166e36c7ed1", 1, 6, 1);
		}
		else
		{
			namespace_1b527536::function_7281de4d(#"hash_42722c5a5596cde2", &function_94e78240, #"hash_60cb3fd3716d711e", #"hash_1a2e7166e36c7ed1", 1, 6, 0);
			self.var_8da24ed0 = var_5b5d9768;
			progress = self.var_8da24ed0 / self.var_fc8023b4;
			self clientfield::set_player_uimodel("hud_items.ammoCooldowns.fieldUpgrade", progress);
		}
	}
}

/*
	Name: function_d52adbbc
	Namespace: namespace_b2add33c
	Checksum: 0x7A2E511B
	Offset: 0x9A18
	Size: 0x1B8
	Parameters: 1
	Flags: None
*/
function function_d52adbbc(instance)
{
	instance endon(#"objective_ended");
	self endon(#"disconnect", #"player_downed", #"hash_6d2d12b8afe43c8e", #"sudden_death");
	var_4beb87c8 = self gamepadusedlast();
	while(true)
	{
		if(is_true(self.inventory.items[12].count))
		{
			var_c648969d = level.zm_hint_text zm_hint_text::is_open(self);
			if(var_4beb87c8 != self gamepadusedlast() || !var_c648969d)
			{
				hint = #"hash_41f8f4fb911cb409";
				if(!self gamepadusedlast())
				{
					hint = #"hash_17dc67453fe5d632";
				}
				if(var_c648969d)
				{
					level.zm_hint_text zm_hint_text::close(self);
				}
				self thread zm_equipment::show_hint_text(hint, 6);
			}
			var_4beb87c8 = self gamepadusedlast();
		}
		waitframe(1);
	}
}

/*
	Name: function_62801b2f
	Namespace: namespace_b2add33c
	Checksum: 0xC45DE988
	Offset: 0x9BD8
	Size: 0x15A
	Parameters: 0
	Flags: None
*/
function function_62801b2f()
{
	self endon(#"death");
	var_e766369f = function_a38db454(self.origin, 800);
	a_zombies = array::get_all_closest(self.origin, var_e766369f);
	for(i = 0; i < a_zombies.size; i++)
	{
		if(isalive(a_zombies[i]))
		{
			if(namespace_7589cf5c::function_82e262cf(a_zombies[i].aitype))
			{
				a_zombies[i] function_b61cfe16(self);
			}
			if(distance2dsquared(self.origin, a_zombies[i].origin) <= 250000)
			{
				self thread function_912eedf3(a_zombies[i]);
			}
			else
			{
				self thread knockdown_zombie(a_zombies[i]);
			}
			waitframe(1);
		}
	}
}

/*
	Name: knockdown_zombie
	Namespace: namespace_b2add33c
	Checksum: 0x531A7069
	Offset: 0x9D40
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function knockdown_zombie(ai_zombie)
{
	if(isdefined(ai_zombie))
	{
		if(ai_zombie.var_6f84b820 === #"normal")
		{
			ai_zombie zombie_utility::setup_zombie_knockdown(self.origin);
		}
		else if(ai_zombie.var_6f84b820 === #"special" || ai_zombie.var_6f84b820 === #"elite")
		{
			ai_zombie ai::stun(2);
		}
	}
}

/*
	Name: function_912eedf3
	Namespace: namespace_b2add33c
	Checksum: 0x476FB510
	Offset: 0x9DF8
	Size: 0x23C
	Parameters: 1
	Flags: None
*/
function function_912eedf3(zombie)
{
	self endon(#"death");
	zombie endon(#"death");
	if(isalive(zombie))
	{
		v_dir = vectornormalize(zombie.origin - self.origin);
		v_launch = (v_dir * randomintrange(80, 100)) + vectorscale((0, 0, 1), 150);
		zombie.allowdeath = 1;
		if(namespace_7589cf5c::function_82e262cf(zombie.aitype))
		{
			if(isdefined(zombie.var_320199e9))
			{
				zombie thread [[zombie.var_320199e9]]();
			}
		}
		else
		{
			if(zm_utility::is_player_valid(self, 0, 0))
			{
				self zm_stats::increment_challenge_stat(#"hash_6dcdf2fb5a6cf4a0");
			}
			level scoreevents::doscoreeventcallback("scoreEventSR", {#enemy:zombie, #attacker:self, #scoreevent:"retrieve_cannister_kill_zm"});
			if(!zombie isragdoll())
			{
				zombie zm_utility::start_ragdoll();
				waitframe(2);
				zombie launchragdoll(v_launch);
			}
			if(isalive(zombie))
			{
				if(zm_utility::is_magic_bullet_shield_enabled(zombie))
				{
					zombie util::stop_magic_bullet_shield();
				}
				zombie kill();
			}
		}
	}
}

/*
	Name: function_b61cfe16
	Namespace: namespace_b2add33c
	Checksum: 0x4C0002EA
	Offset: 0xA040
	Size: 0x19A
	Parameters: 1
	Flags: None
*/
function function_b61cfe16(player)
{
	if(isdefined(self) && isdefined(self.aitype))
	{
		switch(self.aitype)
		{
			case "hash_704a090ff9fcffd0":
			{
				self function_98139c38(player, 0.25);
				break;
			}
			case "hash_1aff4b71635bda08":
			case "hash_63cd2e85e68901a0":
			{
				self function_98139c38(player, 0.6);
				break;
			}
			case "spawner_bo5_mimic":
			{
				self function_98139c38(player, 0.6);
				break;
			}
			case "hash_4f87aa2a203d37d0":
			{
				self function_98139c38(player, 0.5);
				break;
			}
			case "spawner_zm_steiner":
			{
				self function_98139c38(player, 0.4);
				break;
			}
			default:
			{
				self function_98139c38(player, 0.5);
				break;
			}
		}
	}
}

/*
	Name: function_98139c38
	Namespace: namespace_b2add33c
	Checksum: 0xCE30EC7E
	Offset: 0xA1E8
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_98139c38(player, var_8de6cf73)
{
	self.var_320199e9 = &function_320199e9;
	self.var_15bd646a = var_8de6cf73;
	self.e_attacker = player;
}

/*
	Name: function_320199e9
	Namespace: namespace_b2add33c
	Checksum: 0x45C2F326
	Offset: 0xA238
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_320199e9()
{
	self endon(#"death");
	n_dmg = self.maxhealth * self.var_15bd646a;
	if(n_dmg < self.health)
	{
		self thread ai::stun();
		self dodamage(n_dmg, self.origin);
	}
	else if(isdefined(self.e_attacker))
	{
		self dodamage(n_dmg, self.origin, self.e_attacker);
	}
}

/*
	Name: function_7fb7c83c
	Namespace: namespace_b2add33c
	Checksum: 0x4ED84041
	Offset: 0xA2F0
	Size: 0x3A
	Parameters: 1
	Flags: Private
*/
function private function_7fb7c83c(weaponname)
{
	inarray = isinarray(level.var_1b527536, weaponname);
	return inarray;
}

/*
	Name: function_36821329
	Namespace: namespace_b2add33c
	Checksum: 0xCCEB456C
	Offset: 0xA338
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function function_36821329(instance)
{
	instance endon(#"objective_ended");
	self endon(#"disconnect", #"player_downed", #"hash_6d2d12b8afe43c8e");
}

/*
	Name: function_61ee3ab0
	Namespace: namespace_b2add33c
	Checksum: 0xFD2D9A4E
	Offset: 0xA398
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function function_61ee3ab0(instance, var_57e77903)
{
	instance endon(#"objective_ended");
	var_57e77903 endon(#"installed");
	self waittill(#"hash_6d2d12b8afe43c8e");
	if(!is_true(self.var_4cd303ca))
	{
		if(!is_true(instance.var_8240d3e4))
		{
			instance thread function_9f6ab3c7();
			level thread namespace_7589cf5c::play_vo("objectiveRetrievalCanisterDropped");
		}
	}
	var_57e77903 thread function_6fd7f323();
}

/*
	Name: function_6fd7f323
	Namespace: namespace_b2add33c
	Checksum: 0xA02DC242
	Offset: 0xA488
	Size: 0x384
	Parameters: 0
	Flags: None
*/
function function_6fd7f323()
{
	if(isdefined(self.e_owner))
	{
		v_org = self.e_owner.origin;
	}
	else
	{
		v_org = self.origin;
	}
	v_point = getclosestpointonnavmesh(v_org, 120, 16);
	if(isdefined(v_point))
	{
		v_ground = groundtrace(v_point + vectorscale((0, 0, 1), 50), v_point + (vectorscale((0, 0, -1), 15000)), 1, self.e_owner)[#"position"];
	}
	if(!isdefined(v_ground))
	{
		v_pos = self.e_owner.origin;
		v_ground = groundtrace(v_pos + vectorscale((0, 0, 1), 50), v_pos + (vectorscale((0, 0, -1), 15000)), 1, self.e_owner)[#"position"];
	}
	self.e_owner = undefined;
	self clientfield::set("" + #"hash_7e6957dfc36e2214", 0);
	self.b_pickedup = 0;
	self.var_470d03b1 = 1;
	self unlink();
	wait(0.1);
	self moveto(v_ground, 0.05);
	self waittill(#"movedone");
	self.angles = (0, 0, 0);
	if(abs(v_ground[2] - getwaterheight(v_ground)) < 30)
	{
		self moveto(self.v_start, 0.05);
		self waittill(#"movedone");
	}
	if(isdefined(self.t_pickup))
	{
		self.t_pickup usetriggerrequirelookat(1);
		self.t_pickup sethintstring(#"hash_c90fb1f338973f7");
	}
	playsoundatposition(#"hash_3047775b10faeffc", self.origin + vectorscale((0, 0, 1), 25));
	self clientfield::set("" + #"hash_7e6957dfc36e2214", 1);
	if(isdefined(self.var_f71b7261))
	{
		objective_setinvisibletoall(self.var_f71b7261);
	}
	if(isdefined(self.var_3c7b1c1c))
	{
		objective_setvisibletoall(self.var_3c7b1c1c);
	}
	if(isdefined(self.t_pickup))
	{
		self.t_pickup setvisibletoall();
	}
}

/*
	Name: monitor_timer
	Namespace: namespace_b2add33c
	Checksum: 0x2A9A93ED
	Offset: 0xA818
	Size: 0x394
	Parameters: 0
	Flags: None
*/
function monitor_timer()
{
	self endon(#"objective_ended");
	level waittill(#"hash_4dde1813f6b5d2d8");
	foreach(player in getplayers())
	{
		player notify(#"sudden_death");
	}
	self thread function_d4190619();
	var_42f3b393 = 0;
	while(true)
	{
		var_dc9a9acc = 0;
		foreach(var_57e77903 in self.var_53ba65b)
		{
			if(is_true(var_57e77903.b_pickedup) || is_true(var_57e77903.var_2e5efdc7))
			{
				var_dc9a9acc++;
			}
		}
		if(var_dc9a9acc < 2)
		{
			break;
		}
		if(!var_42f3b393)
		{
			var_42f3b393 = 1;
			self.var_5ff65676 = 1;
			foreach(zombie in getaiarray())
			{
				if(isalive(zombie))
				{
					zombie zm_score::function_acaab828();
				}
			}
			foreach(player in getplayers())
			{
				if(is_true(player.var_28107825))
				{
					player thread function_69438b00(self);
				}
			}
		}
		waitframe(1);
	}
	wait(0.2);
	players = function_a1ef346b();
	if(isdefined(players) && players.size > 0)
	{
		self.var_7a9e6505 = 1;
	}
	self.var_5ff65676 = 0;
	objective_manager::objective_ended(self, 0);
}

/*
	Name: function_d4190619
	Namespace: namespace_b2add33c
	Checksum: 0xC6F416AE
	Offset: 0xABB8
	Size: 0x1B8
	Parameters: 0
	Flags: None
*/
function function_d4190619()
{
	self endon(#"objective_ended");
	wait(0.3);
	foreach(var_57e77903 in self.var_53ba65b)
	{
		if(!var_57e77903.b_pickedup && !var_57e77903.var_2e5efdc7)
		{
			foreach(player in getplayers())
			{
				player thread function_7d00b085();
				level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 0);
				if(isdefined(player) && level.zm_hint_text zm_hint_text::is_open(player))
				{
					level.zm_hint_text zm_hint_text::close(player);
				}
			}
			objective_manager::objective_ended(self, 0);
		}
	}
}

/*
	Name: function_69438b00
	Namespace: namespace_b2add33c
	Checksum: 0xCFBECBB2
	Offset: 0xAD78
	Size: 0x100
	Parameters: 1
	Flags: None
*/
function function_69438b00(instance)
{
	self endon(#"disconnect", #"laststand");
	instance endon(#"objective_ended");
	if(isdefined(self) && level.zm_hint_text zm_hint_text::is_open(self))
	{
		level.zm_hint_text zm_hint_text::close(self);
	}
	waitframe(1);
	self thread zm_equipment::show_hint_text(#"hash_6a89bb99e54d4e8f", 60);
	while(true)
	{
		self dodamage(5, self.origin);
		self function_bc82f900("damage_light");
		wait(1);
	}
}

/*
	Name: function_9f6ab3c7
	Namespace: namespace_b2add33c
	Checksum: 0x7E742D80
	Offset: 0xAE80
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function function_9f6ab3c7()
{
	self endon(#"objective_ended");
	self.var_8240d3e4 = 1;
	wait(15);
	self.var_8240d3e4 = undefined;
}

/*
	Name: function_bd0bc40b
	Namespace: namespace_b2add33c
	Checksum: 0x6E1E7455
	Offset: 0xAEC0
	Size: 0x1E4
	Parameters: 1
	Flags: None
*/
function function_bd0bc40b(b_enabled)
{
	if(b_enabled)
	{
		self allowjump(0);
		self allowsprint(0);
		self allowcrouch(0);
		self allowprone(0);
		self setstance("stand");
		if(getplayers().size < 2)
		{
			if(self namespace_e86ffa8::function_3623f9d1(0))
			{
				self setmovespeedscale(0.9);
			}
			else
			{
				self setmovespeedscale(0.8);
			}
		}
		else
		{
			if(self namespace_e86ffa8::function_3623f9d1(0))
			{
				self setmovespeedscale(0.85);
			}
			else
			{
				self setmovespeedscale(0.7);
			}
		}
	}
	else
	{
		self allowjump(1);
		self allowsprint(1);
		self allowcrouch(1);
		self allowprone(1);
		self setmovespeedscale(1);
	}
}

/*
	Name: function_9181f7b3
	Namespace: namespace_b2add33c
	Checksum: 0x8BDF4972
	Offset: 0xB0B0
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_9181f7b3(instance)
{
	self notify("4c963a65fdec658f");
	self endon("4c963a65fdec658f");
	self endon(#"disconnect", #"hash_6d2d12b8afe43c8e");
	instance endon(#"objective_ended");
	s_result = undefined;
	s_result = self waittill(#"enter_vehicle");
	if(isdefined(s_result.vehicle))
	{
		s_result.vehicle thread function_eb9a0f67();
	}
}

/*
	Name: function_eb9a0f67
	Namespace: namespace_b2add33c
	Checksum: 0xF1D72F7
	Offset: 0xB160
	Size: 0x122
	Parameters: 0
	Flags: None
*/
function function_eb9a0f67()
{
	self notify("708a486493933455");
	self endon("708a486493933455");
	self endon(#"death");
	wait(2);
	while(true)
	{
		players = self getvehoccupants();
		if(isdefined(players))
		{
			foreach(player in players)
			{
				if(is_true(player.var_28107825))
				{
					self vehicle_damage(50, player);
				}
			}
		}
		else
		{
			break;
		}
		wait(1);
	}
}

/*
	Name: vehicle_damage
	Namespace: namespace_b2add33c
	Checksum: 0xE74958C
	Offset: 0xB290
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function vehicle_damage(damage_amount, player)
{
	if(isdefined(self))
	{
		if(isdefined(player))
		{
			self dodamage(player, self.origin, self, undefined, "MOD_MELEE");
		}
		playrumbleonposition("sr_canister_damage_vehicle_rumble", self.origin);
	}
}

/*
	Name: function_9a17187a
	Namespace: namespace_b2add33c
	Checksum: 0x61E18559
	Offset: 0xB310
	Size: 0x314
	Parameters: 1
	Flags: None
*/
function function_9a17187a(instance)
{
	instance endon(#"objective_ended");
	b_open_door = 0;
	var_2ccf018f = 0;
	self scene::play(#"hash_3c1f6bee53f6bcc", "Shot 1", self);
	instance flag::wait_till(#"countdown");
	self.var_f8446b0d = #"hash_380d5762018967b5";
	self.var_55b38898 = zm_utility::function_f5a222a8(self.var_f8446b0d, instance.var_25ad512b.origin);
	while(true)
	{
		foreach(player in getplayers())
		{
			if(isalive(player) && !var_2ccf018f)
			{
				if(distance2dsquared(instance.var_25ad512b.origin, player.origin) <= 4000000)
				{
					var_2ccf018f = 1;
					self playloopsound(#"hash_4a9a912c07ee63e");
					self playrumblelooponentity(#"hash_1903f70fddbadc53");
					self scene::play(#"hash_3c1f6bee53f6bcc", "Shot 2", self);
					self stoprumble(#"hash_1903f70fddbadc53");
					self stoploopsound();
				}
				continue;
			}
			if(isalive(player) && is_true(player.var_28107825))
			{
				if(distance2dsquared(instance.var_25ad512b.origin, player.origin) <= 90000)
				{
					b_open_door = 1;
				}
			}
		}
		if(b_open_door)
		{
			break;
		}
		wait(0.1);
	}
	self scene::play(#"hash_3c1f6bee53f6bcc", "Shot 3", self);
}

/*
	Name: function_1ed83293
	Namespace: namespace_b2add33c
	Checksum: 0x6A16908A
	Offset: 0xB630
	Size: 0x204
	Parameters: 0
	Flags: None
*/
function function_1ed83293()
{
	self endon(#"cleared");
	var_ee18397f = self.var_7a1183ab gettagorigin("tag_fx_rocket_exhaust_0");
	while(true)
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(zm_utility::is_player_valid(player))
			{
				n_distsq = distancesquared(var_ee18397f, player.origin);
				if(n_distsq <= sqr(150))
				{
					player dodamage(5, var_ee18397f, undefined, undefined, undefined, "MOD_BURNED");
					player playrumbleonentity("damage_heavy");
					continue;
				}
				if(n_distsq <= sqr(400))
				{
					player dodamage(2, var_ee18397f, undefined, undefined, undefined, "MOD_BURNED");
					player playrumbleonentity("damage_light");
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_f5087df2
	Namespace: namespace_b2add33c
	Checksum: 0x501B83DF
	Offset: 0xB840
	Size: 0x1D4
	Parameters: 0
	Flags: None
*/
function function_f5087df2()
{
	self waittill(#"objective_ended", #"hash_8202877a3aadac8");
	objective_manager::stop_timer();
	namespace_7589cf5c::function_ed193293(self);
	if(is_true(self.success))
	{
		level thread namespace_cda50904::function_a92a93e9(self.var_25ad512b.origin, self.var_25ad512b.angles);
	}
	wait(0.1);
	foreach(player in getplayers())
	{
		level.var_31028c5d thread prototype_hud::set_active_obj_visibility(player, 0);
		level.var_31028c5d prototype_hud::set_active_obj_progress_visibility(player, 0);
	}
	if(!is_true(self.success))
	{
		if(isalive(self.vh_truck) && self flag::get(#"countdown"))
		{
			self.vh_truck kill();
		}
	}
}

/*
	Name: function_836915b3
	Namespace: namespace_b2add33c
	Checksum: 0xCAE142E2
	Offset: 0xBA20
	Size: 0x1D4
	Parameters: 0
	Flags: None
*/
function function_836915b3()
{
	self endon(#"objective_ended");
	var_35dfb407 = 0;
	while(!var_35dfb407)
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(distance2dsquared(player.origin, self.vh_truck.origin) <= 2250000)
			{
				if(player util::is_looking_at(self.vh_truck, 0.7, 0) || player util::is_looking_at(self.origin, 0.7, 1) || distance2dsquared(player.origin, self.vh_truck.origin) <= 250000)
				{
					var_35dfb407 = 1;
					break;
				}
			}
		}
		wait(0.5);
	}
	level namespace_7589cf5c::play_vo("objectiveTransportApproach");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveTransportApproachResponse");
}

/*
	Name: function_c4e85aeb
	Namespace: namespace_b2add33c
	Checksum: 0x30A825C6
	Offset: 0xBC00
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_c4e85aeb()
{
	self endon(#"objective_ended");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveTransportStart");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveTransportStartResponse");
	self.vh_truck thread function_c561af6e(self);
}

/*
	Name: function_7bde6917
	Namespace: namespace_b2add33c
	Checksum: 0x7CB4499E
	Offset: 0xBC88
	Size: 0x18C
	Parameters: 0
	Flags: None
*/
function function_7bde6917()
{
	self endon(#"objective_ended");
	if(!is_true(self.var_2ad830b6))
	{
		self.var_2ad830b6 = 1;
		level namespace_7589cf5c::play_vo("objectiveTransportExtractionStart");
	}
	wait(0.5);
	if(isdefined(self.vh_truck))
	{
		self thread function_961c9807();
		while(true)
		{
			if(self flag::get(#"truck_stopped") || self.vh_truck getspeedmph() < 1)
			{
				self flag::set(#"truck_stopped");
				break;
			}
			wait(0.1);
		}
		self.vh_truck namespace_7589cf5c::function_ac709d66(self, #"hash_43486824bb729a38");
		self flag::clear(#"truck_stopped");
	}
	self flag::set(#"hash_1f275458db65249d");
	if(isdefined(self.var_6135d9ba))
	{
		self thread function_c37c7efe(self.var_6135d9ba);
	}
}

/*
	Name: function_961c9807
	Namespace: namespace_b2add33c
	Checksum: 0x19632D96
	Offset: 0xBE20
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_961c9807()
{
	self notify("5ec79853a9bb547f");
	self endon("5ec79853a9bb547f");
	self endon(#"objective_ended", #"truck_stopped");
	wait(5);
	self flag::set(#"truck_stopped");
}

/*
	Name: function_c37c7efe
	Namespace: namespace_b2add33c
	Checksum: 0x57386605
	Offset: 0xBE98
	Size: 0xF8
	Parameters: 1
	Flags: None
*/
function function_c37c7efe(mdl_vortex)
{
	self endon(#"objective_ended", #"hash_7ae25b738e2655a3");
	wait(function_21a3a673(2, 4));
	while(true)
	{
		a_players = function_a1ef346b(undefined, mdl_vortex.origin, 800);
		if(is_true(a_players.size) && isdefined(mdl_vortex))
		{
			mdl_vortex namespace_7589cf5c::function_ac709d66(self, #"hash_59b18ed62f383f96");
			wait(randomfloatrange(10, 15));
		}
		wait(0.1);
	}
}

/*
	Name: function_cfe051
	Namespace: namespace_b2add33c
	Checksum: 0xCC0DBDFD
	Offset: 0xBF98
	Size: 0x17C
	Parameters: 0
	Flags: None
*/
function function_cfe051()
{
	self endon(#"objective_ended");
	if(isdefined(self.vh_truck))
	{
		self.vh_truck endon(#"death");
		self.vh_truck flag::wait_till(#"hash_46ec4489ed0e4649");
		level namespace_7589cf5c::play_vo("objectiveTransportFirstVortexApproach");
	}
	self flag::wait_till(#"hash_7ae25b738e2655a3");
	wait(1);
	if(isdefined(self.vh_truck))
	{
		level namespace_7589cf5c::play_vo("objectiveTransportFirstVortexEnd");
	}
	if(isdefined(self.vh_truck))
	{
		self.vh_truck flag::wait_till(#"hash_46ec4489ed0e4649");
		level namespace_7589cf5c::play_vo("objectiveTransportSecondVortexApproach");
	}
	self flag::wait_till(#"hash_7ae25b738e2655a3");
	wait(1);
	if(isdefined(self.vh_truck))
	{
		level namespace_7589cf5c::play_vo("objectiveTransportSecondVortexEnd");
	}
}

/*
	Name: function_390f1240
	Namespace: namespace_b2add33c
	Checksum: 0xDC830F57
	Offset: 0xC120
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function function_390f1240()
{
	self waittill(#"objective_ended");
	level namespace_7589cf5c::play_vo("objectiveTransportEndSequence1");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveTransportEndSequence2");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveTransportEndSequence3");
	wait(0.5);
	self flag::set(#"launch");
	level namespace_7589cf5c::play_vo("objectiveTransportEndSequence4");
	level namespace_7589cf5c::play_vo("objectiveTransportEndSequence5");
	level namespace_7589cf5c::play_vo("objectiveTransportEndSequence6");
	wait(4.5);
	level namespace_7589cf5c::play_vo("objectiveTransportEndSequence7");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveTransportEndSequence8");
}

/*
	Name: function_7b99a9c7
	Namespace: namespace_b2add33c
	Checksum: 0xBECA36E1
	Offset: 0xC288
	Size: 0xE0
	Parameters: 0
	Flags: None
*/
function function_7b99a9c7()
{
	self endon(#"objective_ended");
	self.vh_truck endon(#"death");
	var_ca65e8bc = getent("trigger_transport_death", "targetname");
	if(!isdefined(var_ca65e8bc))
	{
		return;
	}
	while(true)
	{
		s_result = undefined;
		s_result = var_ca65e8bc waittill(#"trigger");
		if(s_result.activator === self.vh_truck)
		{
			wait(0.5);
			if(isalive(self.vh_truck))
			{
				self.vh_truck kill();
			}
		}
	}
}

/*
	Name: speed_test
	Namespace: namespace_b2add33c
	Checksum: 0x50CD8A3
	Offset: 0xC370
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function speed_test()
{
	wait(10);
	foreach(vh in getvehiclearray())
	{
		vh thread function_d1a21728();
	}
}

/*
	Name: function_d1a21728
	Namespace: namespace_b2add33c
	Checksum: 0xBAE26DDA
	Offset: 0xC410
	Size: 0x12C
	Parameters: 0
	Flags: None
*/
function function_d1a21728()
{
	self endon(#"death");
	self waittill(#"enter_vehicle");
	while(true)
	{
		if(self getspeedmph() > 1)
		{
			iprintlnbold("GO");
			n_start_time = float(gettime()) / 1000;
			break;
		}
		waitframe(1);
	}
	var_33c33403 = getent("trigger_speed_test", "targetname");
	var_33c33403 waittill(#"trigger");
	var_91c72c84 = float(gettime()) / 1000;
	iprintlnbold("TIME:  " + (var_91c72c84 - n_start_time));
}

/*
	Name: on_vehicle_enter
	Namespace: namespace_b2add33c
	Checksum: 0x8DE044E3
	Offset: 0xC548
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function on_vehicle_enter()
{
	if(isdefined(self.var_bf3cabc9) && isdefined(level.var_7d45d0d4.var_3385b421) && !is_true(self.var_bf3cabc9.abnormal_status.emped))
	{
		if(self.var_bf3cabc9.scriptvehicletype !== "player_truck_transport")
		{
			self.var_bf3cabc9 thread function_d45a8577(level.var_7d45d0d4.var_3385b421);
		}
	}
}

/*
	Name: function_4fb241
	Namespace: namespace_b2add33c
	Checksum: 0x7A521CD7
	Offset: 0xC5F8
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_4fb241()
{
	a_vehicles = getvehiclearray();
	foreach(vehicle in a_vehicles)
	{
		if(isdefined(vehicle getseatoccupant(0)))
		{
			vehicle thread function_d45a8577(self);
		}
	}
}

/*
	Name: function_d45a8577
	Namespace: namespace_b2add33c
	Checksum: 0x7D81D123
	Offset: 0xC6C0
	Size: 0x164
	Parameters: 1
	Flags: None
*/
function function_d45a8577(instance)
{
	self notify("546bfd917d857f33");
	self endon("546bfd917d857f33");
	instance endon(#"objective_ended");
	self endon(#"death");
	if(self.vehicletype === "vehicle_t9_mil_ru_truck_transport_player_obj_sr")
	{
		return;
	}
	while(true)
	{
		if(isdefined(instance.mdl_vortex) && distance2dsquared(instance.mdl_vortex.origin, self.origin) <= 640000)
		{
			playfx(#"sr/fx9_obj_holdout_crystal_bomb", instance.mdl_vortex.origin, anglestoforward(instance.mdl_vortex.angles), anglestoup(instance.mdl_vortex.angles));
			wait(0.1);
			self.is_staircase_up = &vehicle_emp;
			self thread player_vehicle::is_staircase_up();
			break;
		}
		wait(0.1);
	}
}

/*
	Name: vehicle_emp
	Namespace: namespace_b2add33c
	Checksum: 0x56C8B3F8
	Offset: 0xC830
	Size: 0x24C
	Parameters: 1
	Flags: None
*/
function vehicle_emp(params)
{
	self endon(#"death");
	if(!isdefined(level.var_7d45d0d4.var_3385b421))
	{
		return;
	}
	self setspeedimmediate(0);
	self setbrake(1);
	playrumbleonposition("sr_transmitter_impact", self.origin);
	self vehicle::toggle_emp_fx(1);
	self vehicle::function_bbc1d940(0);
	self vehicle::toggle_sounds(0);
	if(is_true(self.var_52e23e90))
	{
		self vehicle::function_7f0bbde3();
		self playsound(#"hash_d6643b88d0186ae");
	}
	self.var_52e23e90 = undefined;
	if(!isdefined(self.abnormal_status))
	{
		self.abnormal_status = spawnstruct();
	}
	self clientfield::set("stunned", 1);
	self.abnormal_status.emped = 1;
	self.abnormal_status.attacker = params.param1;
	self.abnormal_status.inflictor = params.param2;
	if(isdefined(level.var_7d45d0d4.var_3385b421))
	{
		level.var_7d45d0d4.var_3385b421 flag::wait_till(#"hash_7ae777d642643a3d");
		level.var_7d45d0d4.var_3385b421 flag::clear(#"hash_7ae777d642643a3d");
	}
	self.is_staircase_up = undefined;
	self function_95763dcc();
}

