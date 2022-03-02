#using script_1029986e2bc8ca8e;
#using script_113dd7f0ea2a1d4f;
#using script_12538a87a80a2978;
#using script_1cd491b1807da8f7;
#using script_27347f09888ad15;
#using script_3357acf79ce92f4b;
#using script_3411bb48d41bd3b;
#using script_34ab99a4ca1a43d;
#using script_35598499769dbb3d;
#using script_4163291d6e693552;
#using script_7fc996fe8678852;
#using script_fec6e2b970dd864;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_fa1c4f0a;

/*
	Name: function_aa409313
	Namespace: namespace_fa1c4f0a
	Checksum: 0x7CA9BD78
	Offset: 0x788
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_aa409313()
{
	level notify(975054303);
}

/*
	Name: main
	Namespace: namespace_fa1c4f0a
	Checksum: 0x94BF2EE3
	Offset: 0x7A8
	Size: 0x36C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("scriptmover", "" + #"portal", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_2a7da9a87ecef87b", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_7bfe2b6c24b46951", 1, 2, "int");
	clientfield::register("toplayer", "" + #"hash_19f93b2cb70ea2c5", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_75190371f51baf5f", 1, 1, "counter");
	clientfield::register("vehicle", "" + #"hash_85dd1e407a282d9", 1, 1, "int");
	clientfield::register("vehicle", "" + #"hash_738f0a13dc61e2ec", 1, 1, "counter");
	clientfield::register("vehicle", "" + #"hash_711d7caaed939f5f", 1, 1, "int");
	clientfield::register("vehicle", "" + #"hash_34f922424fc18bfb", 1, 1, "counter");
	clientfield::register("vehicle", "" + #"hash_db052f565349c0d", 1, 1, "int");
	clientfield::register("vehicle", "" + #"hash_357ba456a97117b8", 1, 1, "int");
	objective_manager::function_b3464a7c(#"hash_54b558d771506b36", &init, &function_d137dbd4, #"payload", #"hash_6df9aea076cea4ba", #"hash_4ddf1b97bee2b93", 6, #"hash_7cd75fcb4650df62");
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: init
	Namespace: namespace_fa1c4f0a
	Checksum: 0xAEB4A545
	Offset: 0xB20
	Size: 0x89C
	Parameters: 1
	Flags: Linked
*/
function init(instance)
{
	instance thread namespace_7589cf5c::function_34cc6b36("objectivePayloadAnnounce", "objectivePayloadAnnounceResponse");
	foreach(s_instance in instance.var_fe2612fe[#"payload"])
	{
		if(isdefined(s_instance.var_fe2612fe[#"truck"]))
		{
			s_instance.var_738e322b = namespace_8b6a9d79::spawn_script_model(s_instance.var_fe2612fe[#"truck"][0], #"hash_476204ed994318f", 1);
		}
		wait(0.1);
		s_instance.var_b8ca9d7 = spawnvehicle(#"hash_d069dee6a0076c8", s_instance.origin, s_instance.angles, "vehicle_payload", 0, undefined, "sensor");
		s_instance.var_b8ca9d7.team = "allies";
		s_instance.var_b8ca9d7.s_portal = s_instance.var_fe2612fe[#"portal"][0];
		s_instance.var_b8ca9d7.s_start = s_instance.var_fe2612fe[#"hash_13077c2a8907f2fe"][0];
		s_instance.var_b8ca9d7.a_s_spawnpts = s_instance.var_fe2612fe[#"hash_3d588f728a53044"];
		s_instance.var_b8ca9d7 vehicle::toggle_sounds(0);
		wait(1);
		s_instance.var_b8ca9d7 thread function_27033bf7(instance);
	}
	instance.var_7a9e6505 = 1;
	instance.var_4d0b3b87 = s_instance.var_fe2612fe[#"hash_41ae283ea203de66"][0];
	instance.mdl_truck = s_instance.var_738e322b;
	instance.var_b8ca9d7 = s_instance.var_b8ca9d7;
	instance.var_b8ca9d7.var_6a4ec994 = 0;
	instance.var_b8ca9d7.var_dd6fe31f = 1;
	instance.var_b8ca9d7.var_43123efe = util::spawn_model(#"c_t8_cottontop_monkey_fb1", instance.var_b8ca9d7 gettagorigin("tag_cage_attach"));
	instance.var_1cd294c7 = util::spawn_model("tag_origin", instance.var_b8ca9d7 gettagorigin("tag_cage_attach"), instance.var_b8ca9d7 gettagangles("tag_cage_attach"));
	if(isdefined(instance.var_b8ca9d7.var_43123efe) && isdefined(instance.var_1cd294c7))
	{
		instance.var_1cd294c7 linkto(instance.var_b8ca9d7, "tag_cage_attach", (0, 0, 0), vectorscale((0, -1, 0), 180));
		instance.var_b8ca9d7.var_43123efe linkto(instance.var_1cd294c7);
		if(instance.var_b8ca9d7.var_6a4ec994 == 0)
		{
			instance thread function_98da33e1();
		}
	}
	if(isdefined(s_instance.var_fe2612fe[#"hash_32414d1ff88a9506"]))
	{
		instance.var_d4f4d124 = s_instance.var_fe2612fe[#"hash_32414d1ff88a9506"];
	}
	if(isdefined(instance.var_fe2612fe[#"hash_441da645c3f27eea"]))
	{
		instance thread function_9bf6c44a();
	}
	if(isdefined(instance.var_fe2612fe[#"hash_130c46547a55657e"]))
	{
		var_111c92a8 = namespace_8b6a9d79::function_cfa4f1a0(instance.var_fe2612fe[#"hash_130c46547a55657e"], #"hash_d1690065401e43a", 0);
		foreach(mdl_collision in var_111c92a8)
		{
			mdl_collision ghost();
		}
	}
	if(isdefined(instance.var_fe2612fe[#"hash_26ce2cbc6b535bb"]))
	{
		var_111c92a8 = namespace_8b6a9d79::function_cfa4f1a0(instance.var_fe2612fe[#"hash_26ce2cbc6b535bb"], #"hash_1435198d5240ac8c", 0);
		foreach(mdl_collision in var_111c92a8)
		{
			mdl_collision ghost();
		}
	}
	instance thread function_6e7546c5();
	instance thread function_f5087df2();
	instance thread function_83e5a141();
	instance thread function_5466a4e2();
	if(instance.targetname === #"hash_3429791922dc96b9" || instance.targetname === #"hash_20249d5ba9de8314" || instance.targetname === #"hash_20ad7ee28d7ab2b7" || instance.targetname === #"hash_e02854677937598" || instance.targetname === #"hash_730035cd491da97f" || instance.targetname === #"hash_4167bb06bca79ef8" || instance.targetname === #"objective_sanatorium_payload_teleport")
	{
		instance.var_b8ca9d7 thread function_dcf94cdf(instance);
	}
	else
	{
		if(instance.targetname === #"hash_7d1a7cd215013b8b")
		{
			instance.var_b8ca9d7 thread function_753d6448(instance);
		}
		else if(instance.targetname === #"hash_57f0a312931f2fb8")
		{
			instance thread function_68ec5e25();
		}
	}
	level.var_acd0f67e = (instance.variant === "payload_teleport" ? 4 : 3);
	if(instance.variant === "payload_teleport")
	{
		showmiscmodels("payload_teleport_corpses");
	}
	if(instance.variant === "payload_noteleport")
	{
		showmiscmodels("payload_noteleport_corpses");
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_fa1c4f0a
	Checksum: 0x9180B737
	Offset: 0x13C8
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(level.var_7d45d0d4.var_3385b421.content_script_name === "payload_escort")
	{
		level.var_31028c5d prototype_hud::function_953da284(self, #"hash_838284821745ec7");
		level.var_31028c5d prototype_hud::function_817e4d10(self, 2);
		if(isdefined(level.progress_bar))
		{
			var_b8ca9d7 = level.var_7d45d0d4.var_3385b421.var_b8ca9d7;
			var_c3a3ae13 = var_b8ca9d7.health / var_b8ca9d7.n_start_health;
			self objective_manager::function_91574ec1(level.progress_bar, undefined, undefined, undefined, "objective_ended", var_c3a3ae13);
		}
	}
}

/*
	Name: function_17f1d0f3
	Namespace: namespace_fa1c4f0a
	Checksum: 0x36E1EC31
	Offset: 0x14C8
	Size: 0x6A
	Parameters: 0
	Flags: Linked
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
	Name: function_eb76d765
	Namespace: namespace_fa1c4f0a
	Checksum: 0x464CD4D5
	Offset: 0x1540
	Size: 0x19A
	Parameters: 0
	Flags: Linked
*/
function function_eb76d765()
{
	if(self.location.target === "destination_forest")
	{
		var_3b25dd0c = function_3236ac12();
	}
	else
	{
		if(self.location.target === "destination_golova")
		{
			var_3b25dd0c = function_44b02002();
		}
		else
		{
			if(self.location.target === "destination_sanatorium")
			{
				var_3b25dd0c = function_18973f36();
			}
			else if(self.location.target === "destination_ski")
			{
				var_3b25dd0c = function_7ae74cf3();
			}
		}
	}
	var_43123efe = util::spawn_model(var_3b25dd0c[0], self.var_b8ca9d7 gettagorigin("tag_cage_attach"));
	waitframe(1);
	if(isdefined(var_43123efe))
	{
		var_43123efe setscale(var_3b25dd0c[1]);
		var_43123efe.v_ang = var_3b25dd0c[2];
		var_43123efe.v_offset = var_3b25dd0c[3];
		var_43123efe notsolid();
		return var_43123efe;
	}
}

/*
	Name: function_3236ac12
	Namespace: namespace_fa1c4f0a
	Checksum: 0x7F16A67C
	Offset: 0x16E8
	Size: 0x14A
	Parameters: 0
	Flags: Linked
*/
function function_3236ac12()
{
	var_55b751c2 = array(#"p7_rus_light_lamp_oil", #"hash_7fd49bea40f14b60", #"p8_nt4_radio_transceiver_01", #"ach_sandbag_cover_03");
	str_model = array::random(var_55b751c2);
	n_scale = 1;
	v_ang = (0, 0, 0);
	v_offset = (0, 0, 0);
	if(str_model == #"hash_7fd49bea40f14b60")
	{
		n_scale = 0.9;
	}
	else
	{
		if(str_model == #"p8_nt4_radio_transceiver_01")
		{
			v_ang = vectorscale((0, 1, 0), 180);
		}
		else if(str_model == #"ach_sandbag_cover_03")
		{
			n_scale = 0.75;
		}
	}
	var_3b25dd0c = array(str_model, n_scale, v_ang, v_offset);
	return var_3b25dd0c;
}

/*
	Name: function_44b02002
	Namespace: namespace_fa1c4f0a
	Checksum: 0x2C3BC5F8
	Offset: 0x1840
	Size: 0x12A
	Parameters: 0
	Flags: Linked
*/
function function_44b02002()
{
	var_55b751c2 = array(#"p7_cai_weigh_scale_vintage_blue", #"hash_6a36354c90d4b281", #"p8_food_fruit_apple_crate", #"p8_food_meat_beef_shoulder_01");
	str_model = array::random(var_55b751c2);
	n_scale = 1;
	v_ang = (0, 0, 0);
	v_offset = (0, 0, 0);
	if(str_model == #"p7_cai_weigh_scale_vintage_blue")
	{
		v_ang = vectorscale((0, 1, 0), 180);
	}
	else if(str_model == #"p8_food_meat_beef_shoulder_01")
	{
		v_offset = vectorscale((0, 0, 1), 14);
	}
	var_3b25dd0c = array(str_model, n_scale, v_ang, v_offset);
	return var_3b25dd0c;
}

/*
	Name: function_18973f36
	Namespace: namespace_fa1c4f0a
	Checksum: 0xB32F1B29
	Offset: 0x1978
	Size: 0x192
	Parameters: 0
	Flags: Linked
*/
function function_18973f36()
{
	var_55b751c2 = array(#"hash_1c850e24d0892590", #"p9_rm_dwn_coffee_maker_vintage_espresso", #"p8_life_preserver_ring_old_01", #"p8_nt4_globe_earth");
	str_model = array::random(var_55b751c2);
	n_scale = 1;
	v_ang = (0, 0, 0);
	v_offset = (0, 0, 0);
	if(str_model == #"p8_life_preserver_ring_old_01")
	{
		n_scale = 0.75;
		v_offset = vectorscale((0, 0, 1), 16);
	}
	else
	{
		if(str_model == #"hash_1c850e24d0892590")
		{
			n_scale = 0.18;
			v_ang = vectorscale((0, 1, 0), 180);
		}
		else
		{
			if(str_model == #"p9_rm_dwn_coffee_maker_vintage_espresso")
			{
				v_ang = vectorscale((0, 1, 0), 180);
			}
			else if(str_model == #"p8_nt4_globe_earth")
			{
				n_scale = 1.5;
			}
		}
	}
	var_3b25dd0c = array(str_model, n_scale, v_ang, v_offset);
	return var_3b25dd0c;
}

/*
	Name: function_7ae74cf3
	Namespace: namespace_fa1c4f0a
	Checksum: 0xE6D2456
	Offset: 0x1B18
	Size: 0x1BA
	Parameters: 0
	Flags: Linked
*/
function function_7ae74cf3()
{
	var_55b751c2 = array(#"p8_aut_toys_christmas_globe_snow", #"p8_wmd_generator", #"p9_rm_stm_ice_hockey_goal_net", #"p8_wz_ep_snowman");
	str_model = array::random(var_55b751c2);
	n_scale = 1;
	v_ang = (0, 0, 0);
	v_offset = (0, 0, 0);
	if(str_model == #"p8_wmd_generator")
	{
		n_scale = 0.7;
		v_ang = vectorscale((0, 1, 0), 90);
	}
	else
	{
		if(str_model == #"p9_rm_stm_ice_hockey_goal_net")
		{
			n_scale = 0.45;
			v_ang = vectorscale((0, 1, 0), 180);
		}
		else
		{
			if(str_model == #"p8_wz_ep_snowman")
			{
				n_scale = 0.4;
				v_ang = vectorscale((0, 1, 0), 180);
			}
			else if(str_model == #"p8_aut_toys_christmas_globe_snow")
			{
				n_scale = 2;
				v_ang = vectorscale((0, -1, 0), 90);
			}
		}
	}
	var_3b25dd0c = array(str_model, n_scale, v_ang, v_offset);
	return var_3b25dd0c;
}

/*
	Name: function_dc378d61
	Namespace: namespace_fa1c4f0a
	Checksum: 0x2B497E36
	Offset: 0x1CE0
	Size: 0x22A
	Parameters: 0
	Flags: Linked
*/
function function_dc378d61()
{
	v_org = self.var_b8ca9d7 gettagorigin("tag_cage_attach");
	if(math::cointoss())
	{
		var_43123efe = zm_powerups::specific_powerup_drop(array("full_ammo", "bonus_points_team", "nuke", "insta_kill", "double_points"), v_org, #"allies", undefined, undefined, 1);
		if(isdefined(var_43123efe))
		{
			var_43123efe.var_5c6f6051 = 80;
			v_offset = v_org + vectorscale((0, 0, 1), 12);
			if(var_43123efe.model === #"p7_zm_power_up_nuke")
			{
				var_43123efe setscale(0.75);
			}
		}
	}
	else
	{
		var_43123efe = util::spawn_model(#"p9_sur_crystal_medium_01", v_org, self.var_b8ca9d7.angles, undefined, 1);
		if(isdefined(var_43123efe))
		{
			var_43123efe setscale(0.75);
			var_43123efe val::set("loot_pod", "takedamage", 1);
			var_43123efe.health = 5;
			v_offset = v_org;
			level thread namespace_58949729::function_8265e656(var_43123efe);
		}
	}
	if(isdefined(var_43123efe))
	{
		var_43123efe moveto(v_offset, 0.05);
		var_43123efe waittill(#"movedone");
		if(isdefined(var_43123efe))
		{
			return var_43123efe;
		}
	}
}

/*
	Name: function_5466a4e2
	Namespace: namespace_fa1c4f0a
	Checksum: 0xDC9FAC09
	Offset: 0x1F18
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_5466a4e2()
{
	self endon(#"hash_69090774fec4a17b");
	self waittill(#"hash_79ba3aede845bbcc");
	wait(1);
	level namespace_7589cf5c::play_vo("objectivePayloadStart");
	wait(1);
	level namespace_7589cf5c::play_vo("objectivePayloadStartResponse");
	self.var_b8ca9d7 waittill(#"active");
	self.var_b8ca9d7 namespace_7589cf5c::function_ac709d66(self, #"hash_52187d4a8a76de9f");
	while(!self.var_74ec00fb)
	{
		wait(1);
	}
	wait(1);
	self.var_b8ca9d7 namespace_7589cf5c::function_ac709d66(self, #"hash_206f96ca8a8b9649");
}

/*
	Name: function_9f91a425
	Namespace: namespace_fa1c4f0a
	Checksum: 0x3620F616
	Offset: 0x2030
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_9f91a425(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self waittill(#"hash_1db3434782ab777e");
	self thread namespace_7589cf5c::function_ac709d66(instance, #"hash_3fa31698f9825caf");
}

/*
	Name: function_28250c29
	Namespace: namespace_fa1c4f0a
	Checksum: 0x8A7F50B9
	Offset: 0x20A0
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_28250c29()
{
	self waittill(#"hash_69090774fec4a17b");
	wait(1);
	level namespace_7589cf5c::play_vo("objectivePayloadEnd");
	wait(1);
	level thread namespace_7589cf5c::play_vo("objectivePayloadEndResponse");
	level flag::set(#"hash_1460b3afd614fb6c");
}

/*
	Name: function_e45c5bc0
	Namespace: namespace_fa1c4f0a
	Checksum: 0x1A180FFC
	Offset: 0x2138
	Size: 0x1F2
	Parameters: 1
	Flags: Linked
*/
function function_e45c5bc0(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death");
	while(true)
	{
		self waittill(#"scan");
		self namespace_7589cf5c::function_ac709d66(self, #"hash_5ebc917253be6eba");
		if(isdefined(instance.var_f16db373))
		{
			while(distance2dsquared(self.origin, instance.var_f16db373.origin) > 160000)
			{
				wait(0.1);
			}
		}
		else if(isdefined(self.var_94b03771))
		{
			while(distance2dsquared(self.origin, self.var_94b03771.origin) > 160000)
			{
				wait(0.1);
			}
		}
		if(instance.variant === "payload_teleport")
		{
			self.var_e588b6c3 = 1;
		}
		self namespace_7589cf5c::function_ac709d66(self, #"hash_404e25761f89998b");
		self waittill(#"hash_d737648ea5715c3");
		if(instance.variant === "payload_noteleport")
		{
			self thread namespace_7589cf5c::function_ac709d66(self, #"hash_a983fbd390eeb63");
		}
		else
		{
			self thread namespace_7589cf5c::function_ac709d66(instance, "vox_obj_epl_rift_stbl_orvr");
		}
		wait(1.5);
		self notify(#"proceed");
	}
}

/*
	Name: function_1eef26bc
	Namespace: namespace_fa1c4f0a
	Checksum: 0xA0CCA103
	Offset: 0x2338
	Size: 0xE0
	Parameters: 1
	Flags: Linked
*/
function function_1eef26bc(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death");
	while(true)
	{
		if(!self.var_a123c71)
		{
			wait(10);
			if(!self.var_a123c71 && !self.is_teleporting && !self.var_ee53f643 && !is_true(self.abnormal_status.emped))
			{
				self namespace_7589cf5c::function_ac709d66(instance, #"hash_165229d1cb432efa");
				wait(2);
			}
		}
		wait(1);
	}
}

/*
	Name: function_98da33e1
	Namespace: namespace_fa1c4f0a
	Checksum: 0x8E218DAA
	Offset: 0x2420
	Size: 0x190
	Parameters: 0
	Flags: Linked
*/
function function_98da33e1()
{
	self endon(#"hash_69090774fec4a17b");
	self.var_b8ca9d7 endon(#"death");
	self.var_b8ca9d7.var_43123efe endon(#"death");
	self.var_b8ca9d7 thread function_46850180(self);
	while(true)
	{
		s_result = undefined;
		s_result = self.var_b8ca9d7 waittill(#"state_change");
		switch(s_result.state)
		{
			case "calm":
			{
				str_shot = "Shot 1";
				n_wait = 6.05;
				break;
			}
			case "stressed":
			{
				str_shot = "Shot 2";
				n_wait = 6.2;
				break;
			}
			case "hash_750d6346b2af7d18":
			{
				str_shot = "Shot 3";
				n_wait = 6.7;
				break;
			}
		}
		self thread function_8b312db9(str_shot);
		self.var_b8ca9d7.var_43123efe.str_shot = str_shot;
		wait(n_wait);
	}
}

/*
	Name: function_46850180
	Namespace: namespace_fa1c4f0a
	Checksum: 0x9DD92D14
	Offset: 0x25B8
	Size: 0x25C
	Parameters: 1
	Flags: Linked
*/
function function_46850180(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death");
	self.var_43123efe endon(#"death");
	while(true)
	{
		zombies = function_a38db454(self.origin, 1500);
		var_6d32286d = 0;
		foreach(zombie in zombies)
		{
			if(distance2dsquared(self.origin, zombie.origin) <= 2250000 && !isvehicle(zombie))
			{
				var_6d32286d = 1;
			}
		}
		if(var_6d32286d || is_true(self.var_e588b6c3) || !isdefined(self.is_deployed))
		{
			self notify(#"state_change", {#state:"agitated"});
			n_wait = 6.7;
		}
		else
		{
			if(isdefined(zombies) && zombies.size > 0)
			{
				self notify(#"state_change", {#state:"stressed"});
				n_wait = 6.2;
			}
			else
			{
				self notify(#"state_change", {#state:"calm"});
				n_wait = 6.05;
			}
		}
		wait(n_wait);
	}
}

/*
	Name: function_8b312db9
	Namespace: namespace_fa1c4f0a
	Checksum: 0xAF868DFD
	Offset: 0x2820
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_8b312db9(str_shot)
{
	self.var_1cd294c7 thread scene::play(#"hash_1d5a21a769272f94", str_shot, self.var_b8ca9d7.var_43123efe);
}

/*
	Name: function_68ec5e25
	Namespace: namespace_fa1c4f0a
	Checksum: 0x1DF212DE
	Offset: 0x2878
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_68ec5e25()
{
	self endon(#"hash_69090774fec4a17b");
	self.var_b8ca9d7 endon(#"death");
	self.var_b8ca9d7 waittill(#"ambush");
	n_spawns = function_1fdb6ebc();
	var_8be21cb = array::get_all_closest(self.var_b8ca9d7.origin, struct::get_array(#"hash_5b5314019699b18e"));
	for(i = 0; i < var_8be21cb.size; i++)
	{
		for(j = 0; j < n_spawns; j++)
		{
			self.var_b8ca9d7 thread function_dd9b1007(self, var_8be21cb[i].origin, var_8be21cb[i].angles);
			wait(0.1);
		}
		wait(0.5);
	}
}

/*
	Name: function_83e5a141
	Namespace: namespace_fa1c4f0a
	Checksum: 0xAB637399
	Offset: 0x29B8
	Size: 0x102
	Parameters: 0
	Flags: Linked
*/
function function_83e5a141()
{
	self waittill(#"hash_79ba3aede845bbcc");
	if(isdefined(self.var_fe2612fe[#"hash_5615a127abad1354"]))
	{
		self.var_bce10cdf = namespace_8b6a9d79::spawn_script_model(self.var_fe2612fe[#"hash_5615a127abad1354"][0], #"hash_6a83a06a639fcc6b", 1);
		self.var_bce10cdf ghost();
	}
	wait(0.1);
	self.var_b8ca9d7 notify(#"state_change", {#state:"calm"});
	self.var_b8ca9d7 waittill(#"deployed");
	wait(5);
	self.var_b8ca9d7.is_deployed = 1;
}

/*
	Name: function_f5087df2
	Namespace: namespace_fa1c4f0a
	Checksum: 0xDAD60EFA
	Offset: 0x2AC8
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_f5087df2()
{
	self waittill(#"hash_69090774fec4a17b");
	callback::remove_on_ai_killed(&zombie_death_watcher);
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::function_817e4d10(player, 0);
	}
	namespace_7589cf5c::function_ed193293(self);
	if(self.success)
	{
		level thread namespace_cda50904::function_a92a93e9(self.var_4d0b3b87.origin, self.var_4d0b3b87.angles);
	}
	else
	{
		wait(1);
		if(isdefined(self.var_b8ca9d7))
		{
			self.var_b8ca9d7 dodamage(self.var_b8ca9d7.health, self.var_b8ca9d7.origin);
		}
	}
}

/*
	Name: function_de42eeef
	Namespace: namespace_fa1c4f0a
	Checksum: 0xFF353C79
	Offset: 0x2C48
	Size: 0x132
	Parameters: 5
	Flags: None
*/
function function_de42eeef(str_model, v_offset, v_ang, n_forward, n_scale)
{
	self setbrake(1);
	wait(0.5);
	v_forward = self.origin + (vectornormalize(anglestoforward(self.angles)) * n_forward);
	var_6d29abb0 = util::spawn_model(str_model, v_forward + v_offset, v_ang);
	if(isdefined(var_6d29abb0))
	{
		wait(0.1);
		var_6d29abb0.health = int(self.health * 0.4);
		var_6d29abb0 setscale(n_scale);
		var_6d29abb0 linkto(self);
		self.var_a04ece6e = var_6d29abb0;
	}
}

/*
	Name: function_d137dbd4
	Namespace: namespace_fa1c4f0a
	Checksum: 0x3650D0AB
	Offset: 0x2D88
	Size: 0x318
	Parameters: 2
	Flags: Linked
*/
function function_d137dbd4(instance, activator)
{
	if(isplayer(activator))
	{
		callback::on_ai_killed(&zombie_death_watcher);
		instance notify(#"hash_79ba3aede845bbcc");
		instance thread function_17f1d0f3();
		instance.var_74ec00fb = 0;
		instance.var_63a54520 = function_23ab0822();
		foreach(player in getplayers())
		{
			level.var_31028c5d prototype_hud::function_7491d6c5(player, #"hash_838284821745ec7");
		}
		if(instance.targetname === "objective_golova_payload_noteleport")
		{
			var_cdce8e6f = instance.var_fe2612fe[#"hash_337a69099224ee4e"][0];
			if(isdefined(var_cdce8e6f.script_noteworthy))
			{
				instance flag::set(#"hash_12988a5a3e6a65d6");
				level.var_97e461d4 = var_cdce8e6f.script_noteworthy;
			}
		}
		else
		{
			if(instance.targetname === "objective_golova_payload_teleport")
			{
				var_cdce8e6f = instance.var_fe2612fe[#"hash_4aa154892b77eee1"][0];
				if(isdefined(var_cdce8e6f.script_noteworthy))
				{
					instance flag::set(#"hash_12988a5a3e6a65d6");
					level.var_97e461d4 = var_cdce8e6f.script_noteworthy;
				}
			}
			else
			{
				namespace_7589cf5c::function_1e45b156(instance);
			}
		}
		wait(6);
		foreach(player in getplayers())
		{
			level.var_31028c5d prototype_hud::function_953da284(player, #"hash_838284821745ec7");
			level.var_31028c5d prototype_hud::function_817e4d10(player, 2);
		}
	}
}

/*
	Name: function_23ab0822
	Namespace: namespace_fa1c4f0a
	Checksum: 0xBBE9F1EA
	Offset: 0x30A8
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function function_23ab0822()
{
	switch(getplayers().size)
	{
		case 1:
		{
			n_spawns = 8;
			break;
		}
		case 2:
		{
			n_spawns = 12;
			break;
		}
		case 3:
		{
			n_spawns = 16;
			break;
		}
		case 4:
		{
			n_spawns = 20;
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_27033bf7
	Namespace: namespace_fa1c4f0a
	Checksum: 0x9F7D9A43
	Offset: 0x3150
	Size: 0x5F4
	Parameters: 1
	Flags: Linked
*/
function function_27033bf7(instance)
{
	self endon(#"death");
	self val::set("payload", "takedamage", 1);
	self.overridevehicledamage = &function_ae595d6e;
	self.var_aa4b496 = 0;
	self.health = 6400;
	self.var_265cb589 = 1;
	self playrumblelooponentity(#"hash_726d9e09e25df4d5");
	self thread function_eb89f65f(instance);
	nd_start = getvehiclenode(self.s_start.target, "targetname");
	nd_start.var_d5ebc20b = getvehiclenode(nd_start.script_string, "targetname");
	n_time = nd_start.script_int;
	self vehicle::get_on_path(nd_start);
	instance waittill(#"hash_79ba3aede845bbcc");
	self thread function_9c54feb0(instance);
	instance.mdl_truck playrumblelooponentity(#"hash_1903f70fddbadc53");
	instance.mdl_truck scene::play(#"hash_56a14bcd4fb22528", instance.mdl_truck);
	instance.mdl_truck stoprumble(#"hash_1903f70fddbadc53");
	instance.mdl_truck playrumbleonentity(#"hash_f2d284831baa9ed");
	self notify(#"hash_13077c2a8907f2fe");
	self playsound(#"hash_388c12acd0e0928");
	wait(1);
	self thread vehicle::go_path();
	self thread function_87de8025(instance);
	self thread payload_think(instance);
	self thread function_8469f022(instance);
	self thread function_33284b66(instance);
	self thread function_612a9925();
	self thread function_ca92ed05(instance);
	self.var_a123c71 = 1;
	self waittill(#"deployed");
	self clientfield::increment("" + #"hash_738f0a13dc61e2ec");
	self.var_a123c71 = 0;
	self thread function_e45c5bc0(instance);
	self thread function_1eef26bc(instance);
	self thread function_9f91a425(instance);
	self thread function_77c42a22(instance);
	self thread function_79ae8e99(instance);
	self thread function_fe857bf3(instance);
	self thread function_7dc0fd48(instance);
	self thread function_f652e7a6(instance);
	self thread function_41bc60b6(instance);
	self thread function_7d3ebd69(instance);
	self thread function_6fb6800a(instance);
	self thread function_738143f5(instance);
	self thread zombie_dogs(instance);
	if(instance.variant === "payload_noteleport")
	{
		self waittill(#"hash_59cd13b953de9507");
	}
	self.var_94b03771 = util::spawn_model("tag_origin", nd_start.var_d5ebc20b.origin, vectorscale((0, 1, 0), 90));
	self.var_94b03771 clientfield::set("" + #"portal", 1);
	self.var_edbf8a99 = util::spawn_model("collision_player_only_192", self.var_94b03771.origin, self.var_94b03771.angles);
	self.var_3e5ed63d = util::spawn_model("tag_origin", self.var_94b03771.origin + (vectorscale((0, 0, -1), 1000)), self.var_94b03771.angles);
	self.var_94b03771 thread function_fd3059d0(instance);
	if(isdefined(self.var_edbf8a99))
	{
		self.var_edbf8a99 ghost();
	}
}

/*
	Name: function_3b34bc1b
	Namespace: namespace_fa1c4f0a
	Checksum: 0xD1A4C5C8
	Offset: 0x3750
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_3b34bc1b(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death");
	self waittill(#"hash_59cd13b953de9507");
	self.var_8999a4bf = util::spawn_model("tag_origin", instance.var_f16db373.origin);
	waitframe(1);
	if(isdefined(self.var_8999a4bf))
	{
		wait(1.5);
		self.var_8999a4bf clientfield::set("" + #"hash_7bfe2b6c24b46951", 2);
		self thread function_e0c5b0a4(instance);
	}
}

/*
	Name: function_ca92ed05
	Namespace: namespace_fa1c4f0a
	Checksum: 0xAB3624EB
	Offset: 0x3840
	Size: 0x108
	Parameters: 1
	Flags: Linked
*/
function function_ca92ed05(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death");
	while(true)
	{
		if(is_true(self.abnormal_status.emped))
		{
			level namespace_7589cf5c::play_vo("objectivePayloadMalfunction");
			wait(0.5);
			self namespace_7589cf5c::function_ac709d66(self, #"hash_42e191393187cfdb");
			while(is_true(self.abnormal_status.emped))
			{
				wait(0.5);
			}
			self namespace_7589cf5c::function_ac709d66(self, #"hash_6170663b9a995a23");
		}
		wait(0.5);
	}
}

/*
	Name: function_33284b66
	Namespace: namespace_fa1c4f0a
	Checksum: 0x902FC79B
	Offset: 0x3950
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function function_33284b66(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self waittill(#"activate");
	self clientfield::set("" + #"hash_711d7caaed939f5f", 1);
	wait(2);
	self notify(#"active");
}

/*
	Name: function_ae595d6e
	Namespace: namespace_fa1c4f0a
	Checksum: 0xED4528CC
	Offset: 0x39D8
	Size: 0x12C
	Parameters: 15
	Flags: Linked
*/
function function_ae595d6e(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
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
			self thread function_d5c3d218();
		}
		if(vsurfacenormal === "MOD_MELEE")
		{
			self playsound(#"hash_1ddeb8af5a217a6e");
		}
	}
	if(partname > 45)
	{
		partname = 45;
	}
	return partname;
}

/*
	Name: function_6e7546c5
	Namespace: namespace_fa1c4f0a
	Checksum: 0x9348981A
	Offset: 0x3B10
	Size: 0x448
	Parameters: 0
	Flags: Linked
*/
function function_6e7546c5()
{
	self endon(#"hash_69090774fec4a17b");
	self.var_b8ca9d7 endon(#"death");
	self.var_fa6b9965 = [];
	for(i = 0; i < self.var_d4f4d124.size; i++)
	{
		foreach(var_2b357ce9 in self.var_d4f4d124)
		{
			if(var_2b357ce9.script_int == i)
			{
				self.var_fa6b9965[i] = var_2b357ce9;
			}
		}
	}
	var_edf7d1ed = 0;
	self waittill(#"hash_79ba3aede845bbcc");
	self thread function_1c8e1b20();
	if(self.variant === "payload_noteleport")
	{
		self.var_f16db373 = util::spawn_model("tag_origin", self.var_fa6b9965[var_edf7d1ed].origin);
	}
	wait(0.1);
	if(isdefined(self.var_f16db373) || self.variant === "payload_teleport")
	{
		if(self.variant === "payload_noteleport")
		{
			self thread function_4ef90aaa();
		}
		while(true)
		{
			s_result = undefined;
			s_result = self.var_b8ca9d7 waittill(#"hash_32414d1ff88a9506", #"reached_end_node", #"hash_59cd13b953de9507");
			if(s_result !== "final_rift")
			{
				self.var_b8ca9d7.var_f5d0e3f6 = 1;
			}
			if(s_result._notify === "rift")
			{
				self.var_b8ca9d7 clientfield::increment("" + #"hash_34f922424fc18bfb");
				self.var_b8ca9d7.var_ee53f643 = 1;
				if(self.variant === "payload_noteleport")
				{
					var_edf7d1ed++;
					if(self.targetname === "objective_golova_payload_noteleport")
					{
						var_cdce8e6f = self.var_fe2612fe[#"hash_337a68099224ec9b"][0];
						if(isdefined(var_cdce8e6f.script_noteworthy))
						{
							self flag::set(#"hash_12988a5a3e6a65d6");
							level.var_97e461d4 = var_cdce8e6f.script_noteworthy;
						}
					}
					self function_c9b143b(var_edf7d1ed);
					if(var_edf7d1ed >= 2)
					{
						self.var_b8ca9d7 thread function_3b34bc1b(self);
					}
					self.var_b8ca9d7 notify(#"hash_d737648ea5715c3");
				}
				else
				{
					wait(6.5);
					self.var_b8ca9d7 notify(#"hash_d737648ea5715c3");
					self.var_b8ca9d7 waittill(#"proceed");
				}
			}
			else
			{
				self.var_b8ca9d7 notify(#"hash_d737648ea5715c3");
			}
			wait(1);
			self.var_b8ca9d7.var_f5d0e3f6 = 0;
			self.var_b8ca9d7.var_ee53f643 = 0;
			if(isdefined(self.var_f16db373) && self.variant === "payload_noteleport")
			{
				self thread function_4ef90aaa();
			}
		}
	}
}

/*
	Name: function_41bc60b6
	Namespace: namespace_fa1c4f0a
	Checksum: 0x744E6A97
	Offset: 0x3F60
	Size: 0xF0
	Parameters: 1
	Flags: Linked
*/
function function_41bc60b6(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death");
	while(true)
	{
		self waittill(#"enter");
		self thread function_1bb2940d(instance);
		self clientfield::set("" + #"hash_357ba456a97117b8", 1);
		self waittill(#"reached_end_node");
		self clientfield::set("" + #"hash_357ba456a97117b8", 0);
	}
}

/*
	Name: function_1bb2940d
	Namespace: namespace_fa1c4f0a
	Checksum: 0xF75BC079
	Offset: 0x4058
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_1bb2940d(instance)
{
	if(is_true(self.isspeaking))
	{
		self waittill(#"done_speaking");
	}
	wait(0.25);
	self thread namespace_7589cf5c::function_ac709d66(instance, #"hash_3b4b38d7e66e6880");
}

/*
	Name: function_c9b143b
	Namespace: namespace_fa1c4f0a
	Checksum: 0x56185E7E
	Offset: 0x40D0
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_c9b143b(var_edf7d1ed)
{
	self endon(#"hash_69090774fec4a17b");
	self.var_f16db373 playrumblelooponentity(#"hash_1903f70fddbadc53");
	wait(7.5);
	self.var_f16db373 stoprumble(#"hash_1903f70fddbadc53");
	self.var_f16db373 clientfield::set("" + #"hash_2a7da9a87ecef87b", 0);
	wait(3);
	self.var_f16db373 moveto(self.var_fa6b9965[var_edf7d1ed].origin, 0.05);
}

/*
	Name: function_4ef90aaa
	Namespace: namespace_fa1c4f0a
	Checksum: 0xB272A357
	Offset: 0x41C8
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_4ef90aaa()
{
	self endon(#"hash_69090774fec4a17b");
	self.var_b8ca9d7 endon(#"death");
	self.var_f16db373 endon(#"death");
	self.var_b8ca9d7 waittill(#"scan");
	self.var_f16db373 clientfield::set("" + #"hash_2a7da9a87ecef87b", 1);
}

/*
	Name: function_1c8e1b20
	Namespace: namespace_fa1c4f0a
	Checksum: 0x5B76C616
	Offset: 0x4268
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_1c8e1b20()
{
	self endon(#"hash_69090774fec4a17b");
	self.var_b8ca9d7 endon(#"death");
	self.var_b8ca9d7 waittill(#"hash_193c92bb1c6df0e7");
	if(isdefined(self.var_f16db373))
	{
		self.var_f16db373 delete();
	}
}

/*
	Name: function_d5c3d218
	Namespace: namespace_fa1c4f0a
	Checksum: 0x81623E58
	Offset: 0x42E0
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_d5c3d218()
{
	self endon(#"death");
	self.var_aa4b496 = 1;
	self playloopsound(#"hash_2a034c2643fc1322");
	wait(4.75);
	self stoploopsound();
	self.var_aa4b496 = 0;
}

/*
	Name: function_612a9925
	Namespace: namespace_fa1c4f0a
	Checksum: 0xBF965C25
	Offset: 0x4358
	Size: 0x1A6
	Parameters: 0
	Flags: Linked
*/
function function_612a9925()
{
	self endon(#"death");
	self.n_start_health = self.health;
	self.max_health = self.n_start_health;
	objective_manager::function_91574ec1(level.progress_bar, undefined, undefined, undefined, "objective_ended", 1);
	var_8da3e170 = self.health / self.n_start_health;
	objective_manager::function_5d1c184(var_8da3e170);
	while(true)
	{
		var_c3a3ae13 = self.health / self.n_start_health;
		if(var_c3a3ae13 >= 0 && var_8da3e170 != var_c3a3ae13)
		{
			objective_manager::function_5d1c184(var_c3a3ae13);
		}
		var_8da3e170 = var_c3a3ae13;
		if(var_c3a3ae13 <= 0.5 && !is_true(self.var_5e22f781))
		{
			self.var_5e22f781 = 1;
			level thread namespace_7589cf5c::play_vo("objectivePayloadHealthHalf");
		}
		if(var_c3a3ae13 <= 0.2 && !is_true(self.var_2eb5c0e8))
		{
			self.var_2eb5c0e8 = 1;
			level thread namespace_7589cf5c::play_vo("objectivePayloadHealthCritical");
		}
		waitframe(1);
	}
}

/*
	Name: function_7ae9616f
	Namespace: namespace_fa1c4f0a
	Checksum: 0x5FE8611A
	Offset: 0x4508
	Size: 0x1AC
	Parameters: 1
	Flags: None
*/
function function_7ae9616f(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	var_d730bd8c = getvehiclenode("sanatorium_path", "targetname");
	var_b54d7065 = getdynentarray("dynent_garage_button");
	doors = array::get_all_closest(var_d730bd8c.origin, var_b54d7065);
	var_dd05b6d = array(doors[0], doors[1]);
	foreach(door in var_dd05b6d)
	{
		if(function_ffdbe8c2(door))
		{
			return;
		}
	}
	for(i = 0; i < 2; i++)
	{
		dynent_use::function_bf7b8a27(var_dd05b6d[i]);
		wait(randomfloatrange(0.2, 0.5));
	}
}

/*
	Name: function_7dc0fd48
	Namespace: namespace_fa1c4f0a
	Checksum: 0x78C12C4E
	Offset: 0x46C0
	Size: 0x150
	Parameters: 1
	Flags: Linked
*/
function function_7dc0fd48(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	self waittill(#"door");
	var_4b03566e = (100, 100, 75);
	var_bcdc6e24 = self getcentroid();
	var_e86a4d9 = function_db4bc717(var_bcdc6e24, var_4b03566e);
	foreach(dynent in var_e86a4d9)
	{
		if(isdefined(dynent))
		{
			dynent dodamage(dynent.health, dynent.origin, undefined, undefined, "none", "MOD_EXPLOSIVE");
		}
	}
}

/*
	Name: function_dcf94cdf
	Namespace: namespace_fa1c4f0a
	Checksum: 0x8106D3F4
	Offset: 0x4818
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function function_dcf94cdf(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	self waittill(#"custom");
	s_pt = struct::get(instance.targetname, "script_noteworthy");
	if(!isdefined(s_pt))
	{
		s_pt = array::get_all_closest(self.origin, struct::get_array("payload_custom"))[0];
	}
	if(isdefined(s_pt))
	{
		var_8be21cb = namespace_85745671::function_e4791424(s_pt.origin, 32, 40, s_pt.radius);
		if(!isdefined(var_8be21cb))
		{
			return;
		}
		a_s_spawnpts = array::randomize(var_8be21cb);
		n_spawns = function_cb32786d();
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
	Name: function_753d6448
	Namespace: namespace_fa1c4f0a
	Checksum: 0x25580D08
	Offset: 0x49C8
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_753d6448(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	self waittill(#"custom");
	var_8be21cb = struct::get_array(#"hash_18fe18808e205477");
	if(!isdefined(var_8be21cb))
	{
		return;
	}
	n_spawns = function_cb32786d();
	for(i = 0; i < n_spawns; i++)
	{
		s_pt = array::random(var_8be21cb);
		if(isdefined(s_pt))
		{
			self thread function_dd9b1007(instance, s_pt.origin, s_pt.angles);
		}
		wait(randomfloatrange(0.5, 1));
	}
}

/*
	Name: function_cb32786d
	Namespace: namespace_fa1c4f0a
	Checksum: 0x4397FA17
	Offset: 0x4B08
	Size: 0xAE
	Parameters: 0
	Flags: Linked
*/
function function_cb32786d()
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
			n_spawns = 16;
			break;
		}
		case 3:
		{
			n_spawns = 22;
			break;
		}
		case 4:
		{
			n_spawns = 30;
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_6fb6800a
	Namespace: namespace_fa1c4f0a
	Checksum: 0xCF3A7A1
	Offset: 0x4BC0
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function function_6fb6800a(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	while(true)
	{
		self waittill(#"attack");
		self thread function_9d51d729(instance);
	}
}

/*
	Name: function_9d51d729
	Namespace: namespace_fa1c4f0a
	Checksum: 0x87A31447
	Offset: 0x4C38
	Size: 0x224
	Parameters: 1
	Flags: Linked
*/
function function_9d51d729(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	if(isdefined(self.currentnode.script_height))
	{
		v_height = (0, 0, self.currentnode.script_height);
	}
	else
	{
		v_height = (0, 0, 0);
	}
	v_forward = (vectornormalize(anglestoforward(self.currentnode.angles)) * self.currentnode.radius) + self.currentnode.origin;
	if(!isdefined(v_forward))
	{
		return;
	}
	if(isdefined(self.currentnode.script_radius))
	{
		n_radius = self.currentnode.script_radius;
	}
	else
	{
		n_radius = 100;
	}
	var_8be21cb = namespace_85745671::function_e4791424(v_forward + v_height, 16, 40, n_radius);
	if(!isdefined(var_8be21cb))
	{
		return;
	}
	a_s_spawnpts = array::randomize(var_8be21cb);
	n_spawns = function_1fdb6ebc();
	for(i = 0; i < n_spawns; i++)
	{
		if(isdefined(a_s_spawnpts[i]) && instance.var_74ec00fb < instance.var_63a54520)
		{
			self thread function_dd9b1007(instance, a_s_spawnpts[i].origin, a_s_spawnpts[i].angles);
		}
		wait(randomfloatrange(0.5, 1));
	}
}

/*
	Name: function_1fdb6ebc
	Namespace: namespace_fa1c4f0a
	Checksum: 0x3AA6A242
	Offset: 0x4E68
	Size: 0x12E
	Parameters: 0
	Flags: Linked
*/
function function_1fdb6ebc()
{
	n_players = getplayers().size;
	switch(n_players)
	{
		case 1:
		{
			n_spawns = randomintrange(2, 5);
			break;
		}
		case 2:
		{
			n_spawns = randomintrange(2, 5);
			break;
		}
		case 3:
		{
			n_spawns = randomintrange(3, 5);
			break;
		}
		case 4:
		{
			n_spawns = randomintrange(4, 6);
			break;
		}
		default:
		{
			n_spawns = randomintrange(3, 5);
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_738143f5
	Namespace: namespace_fa1c4f0a
	Checksum: 0x4A7438B9
	Offset: 0x4FA0
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function function_738143f5(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	while(true)
	{
		self waittill(#"assault");
		self thread function_95015f9a(instance);
	}
}

/*
	Name: zombie_dogs
	Namespace: namespace_fa1c4f0a
	Checksum: 0xB0629F70
	Offset: 0x5018
	Size: 0x120
	Parameters: 1
	Flags: Linked
*/
function zombie_dogs(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	while(true)
	{
		self waittill(#"dogs");
		n_players = getplayers().size;
		if(!isdefined(n_players))
		{
			continue;
		}
		v_ground = self function_6d122cef();
		if(!isdefined(v_ground))
		{
			return;
		}
		var_8be21cb = namespace_85745671::function_e4791424(v_ground, 24, 80, 200);
		if(!isdefined(var_8be21cb))
		{
			return;
		}
		a_s_spawnpts = array::randomize(var_8be21cb);
		self spawn_dogs(instance, n_players, a_s_spawnpts);
	}
}

/*
	Name: function_7d3ebd69
	Namespace: namespace_fa1c4f0a
	Checksum: 0xBFD5041A
	Offset: 0x5140
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function function_7d3ebd69(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	self waittill(#"heavy");
	level thread namespace_7589cf5c::play_vo("objectivePayloadFinalPortal");
	level flag::wait_till("spawn_zombies");
	var_3955def4 = self.s_portal.origin;
	v_ang = self.s_portal.angles;
	var_e4c6e64a = namespace_85745671::function_9d3ad056(#"hash_4f87aa2a203d37d0", var_3955def4, v_ang, "payload_zombie");
	wait(0.1);
	if(isdefined(var_e4c6e64a))
	{
		player = awareness::function_d7fedde2(var_e4c6e64a);
		awareness::function_c241ef9a(var_e4c6e64a, player, 10);
		var_e4c6e64a thread function_6f9744dc(instance, self);
	}
}

/*
	Name: function_6f9744dc
	Namespace: namespace_fa1c4f0a
	Checksum: 0x3E5B8D05
	Offset: 0x52A0
	Size: 0xAC
	Parameters: 2
	Flags: Linked
*/
function function_6f9744dc(instance, var_b8ca9d7)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death");
	var_b8ca9d7 endon(#"death");
	var_b8ca9d7 waittill(#"hash_32687071c727f6e4");
	level thread namespace_7589cf5c::play_vo("objectivePayloadFinalPortalResponse");
	self animation::play("ai_zm_dlc3_armored_zombie_enrage");
}

/*
	Name: function_95015f9a
	Namespace: namespace_fa1c4f0a
	Checksum: 0x604BA418
	Offset: 0x5358
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_95015f9a(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	v_ground = self function_6d122cef();
	if(!isdefined(v_ground))
	{
		return;
	}
	var_8be21cb = namespace_85745671::function_e4791424(v_ground, 32, 40, 1200);
	if(!isdefined(var_8be21cb))
	{
		return;
	}
	a_s_spawnpts = array::randomize(var_8be21cb);
	n_spawns = function_dae1a57b();
	for(i = 0; i < n_spawns; i++)
	{
		if(isdefined(a_s_spawnpts[i]) && instance.var_74ec00fb < instance.var_63a54520)
		{
			self thread function_dd9b1007(instance, a_s_spawnpts[i].origin, a_s_spawnpts[i].angles);
		}
		wait(0.1);
	}
}

/*
	Name: function_6d122cef
	Namespace: namespace_fa1c4f0a
	Checksum: 0xE3F4F63B
	Offset: 0x54B0
	Size: 0x14A
	Parameters: 0
	Flags: Linked
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
	Namespace: namespace_fa1c4f0a
	Checksum: 0xCB26EBD8
	Offset: 0x5608
	Size: 0x284
	Parameters: 3
	Flags: Linked
*/
function function_dd9b1007(instance, v_spawnpt, v_ang)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
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
	ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, v_spawnpt, v_ang, "payload_zombie");
	wait(0.1);
	if(isdefined(ai_spawned))
	{
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
	Name: function_c36cb7b1
	Namespace: namespace_fa1c4f0a
	Checksum: 0xED3B0F74
	Offset: 0x5898
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_c36cb7b1(params)
{
	if(isdefined(level.var_7d45d0d4.var_3385b421) && level.var_7d45d0d4.var_3385b421.var_b803db9c)
	{
		level.var_7d45d0d4.var_3385b421.var_b803db9c--;
	}
}

/*
	Name: on_zombie_killed
	Namespace: namespace_fa1c4f0a
	Checksum: 0xE5D1093A
	Offset: 0x5900
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function on_zombie_killed(instance)
{
	if(isdefined(level.var_7d45d0d4.var_3385b421) && level.var_7d45d0d4.var_3385b421.var_74ec00fb)
	{
		level.var_7d45d0d4.var_3385b421.var_74ec00fb--;
	}
}

/*
	Name: function_84d85877
	Namespace: namespace_fa1c4f0a
	Checksum: 0x29809CE9
	Offset: 0x5968
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_84d85877(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self waittill(#"death");
	instance.var_74ec00fb--;
}

/*
	Name: spawn_dogs
	Namespace: namespace_fa1c4f0a
	Checksum: 0xCB0F48C3
	Offset: 0x59B8
	Size: 0x23C
	Parameters: 3
	Flags: Linked
*/
function spawn_dogs(instance, n_players, a_s_spawnpts)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	var_de82b392 = [];
	instance.var_e00b0988 = min(function_21a3a673(n_players + level.var_b48509f9, n_players + (level.var_b48509f9 * 2)), 6);
	if(math::cointoss())
	{
		var_6b2ccc6b = #"hash_7a8b592728eec95d";
	}
	else
	{
		if(level.var_b48509f9 < 2)
		{
			var_6b2ccc6b = #"hash_7a8b592728eec95d";
		}
		else
		{
			var_6b2ccc6b = #"hash_12a17ab3df5889eb";
		}
	}
	for(i = 0; i < instance.var_e00b0988; i++)
	{
		if(math::cointoss(60))
		{
			var_de82b392[var_de82b392.size] = var_6b2ccc6b;
			continue;
		}
		var_de82b392[var_de82b392.size] = var_6b2ccc6b;
	}
	for(i = 0; i < var_de82b392.size; i++)
	{
		level flag::wait_till("spawn_zombies");
		if(isdefined(a_s_spawnpts[i]))
		{
			ai_spawned = namespace_85745671::function_9d3ad056(var_de82b392[i], a_s_spawnpts[i].origin, a_s_spawnpts[i].angles, "payload_zombie");
			wait(0.1);
			if(isdefined(ai_spawned))
			{
				ai_spawned thread zombie_attack(self, instance);
			}
		}
		wait(randomfloatrange(0.5, 1));
	}
}

/*
	Name: function_77c42a22
	Namespace: namespace_fa1c4f0a
	Checksum: 0x80FA80E0
	Offset: 0x5C00
	Size: 0x334
	Parameters: 1
	Flags: Linked
*/
function function_77c42a22(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	self waittill(#"hash_32687071c727f6e4");
	a_s_spawnpts = array::randomize(self.a_s_spawnpts);
	n_spawned = 0;
	n_total = function_ce92dcb0();
	for(i = 0; i < n_total; i++)
	{
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
		ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, a_s_spawnpts[i].origin, a_s_spawnpts[i].angles, "payload_zombie");
		wait(0.1);
		if(isdefined(ai_spawned))
		{
			if(namespace_7589cf5c::function_82e262cf(ai_spawned.aitype))
			{
				instance.var_38c710c3 = float(gettime()) / 1000;
				instance.var_2133c784++;
				instance.var_b803db9c++;
				ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
			}
			ai_spawned.var_8046dccf = 1;
			ai_spawned thread zombie_attack(self, instance);
			n_spawned++;
			if(n_spawned >= n_total)
			{
				break;
			}
		}
		if(i >= (self.a_s_spawnpts.size - 1))
		{
			i = 0;
		}
		waitframe(1);
	}
	self thread function_9b6490c4(instance);
}

/*
	Name: function_9b6490c4
	Namespace: namespace_fa1c4f0a
	Checksum: 0x5F257C5D
	Offset: 0x5F40
	Size: 0x310
	Parameters: 1
	Flags: Linked
*/
function function_9b6490c4(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death", #"approach");
	self waittill(#"portal");
	instance.n_active = function_dae1a57b();
	instance.n_spawned = 0;
	while(true)
	{
		level flag::wait_till("spawn_zombies");
		if(instance.n_spawned < instance.n_active)
		{
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
			ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, self.s_portal.origin + (randomintrange(-20, 20), randomintrange(-20, 20), 0), self.s_portal.angles, "payload_zombie");
			wait(0.1);
			if(isdefined(ai_spawned))
			{
				instance.n_spawned++;
				if(namespace_7589cf5c::function_82e262cf(ai_spawned.aitype))
				{
					instance.var_38c710c3 = float(gettime()) / 1000;
					instance.var_2133c784++;
					instance.var_b803db9c++;
					ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
				}
				ai_spawned thread zombie_attack(self, instance);
			}
		}
		wait(0.25);
	}
}

/*
	Name: zombie_death_watcher
	Namespace: namespace_fa1c4f0a
	Checksum: 0xC6A8584E
	Offset: 0x6258
	Size: 0x19C
	Parameters: 1
	Flags: Linked
*/
function zombie_death_watcher(params)
{
	if(self.aitype === #"hash_7a8b592728eec95d" && !is_true(self.b_exploded))
	{
		self.b_exploded = 1;
		if(isdefined(level.var_7d45d0d4.var_3385b421.var_b8ca9d7))
		{
			if(isdefined(self) && distance2dsquared(self.origin, level.var_7d45d0d4.var_3385b421.var_b8ca9d7.origin) <= sqr(200))
			{
				n_dmg = 20;
				level.var_7d45d0d4.var_3385b421.var_b8ca9d7 dodamage(n_dmg, level.var_7d45d0d4.var_3385b421.var_b8ca9d7.origin, self, undefined, undefined, "MOD_EXPLOSIVE");
			}
		}
	}
	if(isdefined(level.var_7d45d0d4.var_3385b421.n_active) && level.var_7d45d0d4.var_3385b421.n_active > 0)
	{
		level.var_7d45d0d4.var_3385b421.n_active--;
	}
}

/*
	Name: function_dae1a57b
	Namespace: namespace_fa1c4f0a
	Checksum: 0x1DCAE218
	Offset: 0x6400
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function function_dae1a57b()
{
	n_players = getplayers().size;
	switch(n_players)
	{
		case 1:
		{
			n_spawns = 4;
			break;
		}
		case 2:
		{
			n_spawns = 6;
			break;
		}
		case 3:
		{
			n_spawns = 9;
			break;
		}
		case 4:
		{
			n_spawns = 13;
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
	Name: function_ce92dcb0
	Namespace: namespace_fa1c4f0a
	Checksum: 0x714A2BFE
	Offset: 0x64D8
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function function_ce92dcb0()
{
	n_players = getplayers().size;
	switch(n_players)
	{
		case 1:
		{
			n_spawns = 8;
			break;
		}
		case 2:
		{
			n_spawns = 12;
			break;
		}
		case 3:
		{
			n_spawns = 16;
			break;
		}
		case 4:
		{
			n_spawns = 20;
			break;
		}
		default:
		{
			n_spawns = 14;
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_785ea4f4
	Namespace: namespace_fa1c4f0a
	Checksum: 0x375084B5
	Offset: 0x65B0
	Size: 0x2D0
	Parameters: 1
	Flags: Linked
*/
function function_785ea4f4(instance)
{
	self endon(#"death");
	objective_setinvisibletoall(self.n_objective_id);
	self ghost();
	wait(2);
	self notify(#"approach");
	if(isdefined(self.var_94b03771))
	{
		self.var_94b03771 clientfield::increment("" + #"hash_75190371f51baf5f");
		self.var_94b03771 clientfield::set("" + #"portal", 0);
	}
	wait(2.75);
	if(isdefined(self.var_43123efe))
	{
		if(instance.variant === "payload_teleport" && isdefined(self.var_43123efe.var_5c6f6051))
		{
			level thread function_ceab499d(self.var_43123efe.powerup_name, self.origin);
		}
		self.var_43123efe delete();
	}
	level thread namespace_7589cf5c::function_3899cfea(self.origin, 5000);
	self playrumbleonentity(#"hash_28141c6053705cd9");
	if(isdefined(self.var_94b03771))
	{
		self.var_94b03771 delete();
	}
	if(isdefined(self.var_3e5ed63d))
	{
		self.var_3e5ed63d delete();
	}
	if(isdefined(self.var_edbf8a99))
	{
		self.var_edbf8a99 delete();
	}
	foreach(player in getplayers())
	{
		player.var_d23362c = 0;
		player clientfield::set_to_player("" + #"hash_19f93b2cb70ea2c5", 0);
	}
}

/*
	Name: function_ceab499d
	Namespace: namespace_fa1c4f0a
	Checksum: 0xED318914
	Offset: 0x6888
	Size: 0x36
	Parameters: 2
	Flags: Linked
*/
function function_ceab499d(str_powerup, v_org)
{
	var_9c0bf2db = zm_powerups::specific_powerup_drop(str_powerup, v_org);
}

/*
	Name: function_69c0c9b6
	Namespace: namespace_fa1c4f0a
	Checksum: 0xE647461F
	Offset: 0x68C8
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_69c0c9b6()
{
	self endon(#"death");
	self.allowdeath = 1;
	if(self.archetype === #"zombie")
	{
		gibserverutils::annihilate(self);
	}
	self kill(undefined, undefined, undefined, undefined, undefined, 1);
}

/*
	Name: function_cd8da208
	Namespace: namespace_fa1c4f0a
	Checksum: 0x9BEF8DA2
	Offset: 0x6948
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function function_cd8da208(var_b8ca9d7, instance)
{
	self endon(#"death");
	var_b8ca9d7 endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	if(math::cointoss())
	{
		awareness::function_c241ef9a(self, var_b8ca9d7, 15);
	}
	else
	{
		self thread zombie_attack(var_b8ca9d7, instance);
	}
}

/*
	Name: zombie_attack
	Namespace: namespace_fa1c4f0a
	Checksum: 0xD5AEC597
	Offset: 0x69F8
	Size: 0x15E
	Parameters: 2
	Flags: Linked
*/
function zombie_attack(var_b8ca9d7, instance)
{
	self endon(#"death");
	var_b8ca9d7 endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	self.var_ed0e316b = "sprint";
	self callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
	wait(0.1);
	while(true)
	{
		a_players = getplayers();
		player = awareness::function_d7fedde2(var_b8ca9d7);
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
	Name: function_fd68cae4
	Namespace: namespace_fa1c4f0a
	Checksum: 0xCD14D204
	Offset: 0x6B60
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_fd68cae4()
{
	if(self.archetype == #"zombie")
	{
		if(level.var_b48509f9 < 5)
		{
			self namespace_85745671::function_9758722(self.var_ed0e316b);
		}
	}
}

/*
	Name: function_9049ebf8
	Namespace: namespace_fa1c4f0a
	Checksum: 0xC5BAA9F9
	Offset: 0x6BB8
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_9049ebf8(instance)
{
	self endon(#"death", #"reached_end_node");
	instance endon(#"hash_69090774fec4a17b");
	level waittill(#"hash_681a588173f0b1d7");
	if(is_true(self.var_a123c71))
	{
		level thread namespace_7589cf5c::play_vo("objectivePayloadSuddenDeath");
	}
	while(is_true(self.var_a123c71))
	{
		wait(0.1);
	}
	self thread function_dd677e5d();
	self notify(#"destruct");
	self setbrake(1);
	wait(2);
	self dodamage(self.health, self.origin);
}

/*
	Name: function_dd677e5d
	Namespace: namespace_fa1c4f0a
	Checksum: 0x75D2F8
	Offset: 0x6CF0
	Size: 0x108
	Parameters: 0
	Flags: Linked
*/
function function_dd677e5d()
{
	if(isdefined(self.var_94b03771))
	{
		self.var_94b03771 delete();
	}
	if(isdefined(self.var_3e5ed63d))
	{
		self.var_3e5ed63d delete();
	}
	foreach(player in getplayers())
	{
		player.var_d23362c = 0;
		player clientfield::set_to_player("" + #"hash_19f93b2cb70ea2c5", 0);
	}
}

/*
	Name: function_fe857bf3
	Namespace: namespace_fa1c4f0a
	Checksum: 0x4752D947
	Offset: 0x6E00
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_fe857bf3(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self waittill(#"death");
	if(isdefined(self))
	{
		self.var_a123c71 = 0;
	}
	if(isdefined(self))
	{
		radiusdamage(self.origin, 1200, 1000, 500, self, "MOD_EXPLOSIVE");
	}
	if(instance flag::get(#"hash_12988a5a3e6a65d6"))
	{
		level.var_97e461d4 = undefined;
		instance flag::clear(#"hash_12988a5a3e6a65d6");
	}
	objective_manager::function_2c679cc2(instance, 0);
}

/*
	Name: function_87de8025
	Namespace: namespace_fa1c4f0a
	Checksum: 0x97467859
	Offset: 0x6EF8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_87de8025(instance)
{
	instance waittill(#"hash_69090774fec4a17b");
	if(instance.success)
	{
		self delete();
	}
}

/*
	Name: payload_think
	Namespace: namespace_fa1c4f0a
	Checksum: 0x7E3BC803
	Offset: 0x6F48
	Size: 0x550
	Parameters: 1
	Flags: Linked
*/
function payload_think(instance)
{
	self endon(#"death", #"destruct");
	instance endon(#"hash_69090774fec4a17b");
	self.var_a123c71 = 0;
	self.var_f8edfabd = 0;
	self.var_f5d0e3f6 = 0;
	self.var_59078fae = 0;
	self.is_teleporting = 0;
	self.var_ee53f643 = 0;
	self waittill(#"deployed");
	self thread function_1e88c470(instance);
	if(getplayers().size === 1)
	{
		var_2a9d371 = 5;
	}
	else
	{
		var_2a9d371 = 4;
	}
	while(true)
	{
		self.var_f4bd7934 = 0;
		self.n_players = 0;
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(distancesquared(self.origin, player.origin) <= sqr(350) && !player laststand::player_is_in_laststand())
			{
				player scoreevents::function_31553fb3();
				self.var_f4bd7934 = 1;
				self.n_players++;
			}
		}
		if(isdefined(instance.var_f16db373))
		{
			if(distance2dsquared(instance.var_f16db373.origin, self.origin) <= sqr(300))
			{
				self.var_f4bd7934 = 1;
			}
		}
		if(isdefined(self.var_94b03771))
		{
			if(distance2dsquared(self.var_94b03771.origin, self.origin) <= sqr(300) && !self.var_ee53f643)
			{
				self.var_f4bd7934 = 1;
			}
		}
		n_speed = max(self.n_players + var_2a9d371, 6);
		wait(0.25);
		if(!self.var_f4bd7934 || is_true(self.abnormal_status.emped) || is_true(self.var_f5d0e3f6))
		{
			self setspeed(0, 5, 3);
			self.var_a123c71 = 0;
			self setbrake(1);
			self vehicle::toggle_lights_group(4, 1);
			self clientfield::set("" + #"hash_db052f565349c0d", 0);
			self notify(#"hash_734e3e2063a699a2");
			if(!isdefined(self.var_b79a8ac7) && !self.var_f8edfabd && !self.is_teleporting)
			{
				self thread function_fa1230e0(instance);
			}
		}
		else
		{
			self notify(#"hash_76f907c580cdbbc6");
			self setspeed(n_speed, 5, 3);
			self.var_a123c71 = 1;
			self setbrake(0);
			self vehicle::toggle_lights_group(4, 0);
			self clientfield::set("" + #"hash_db052f565349c0d", 1);
			self.var_a2c49add = undefined;
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
	Name: function_fa1230e0
	Namespace: namespace_fa1c4f0a
	Checksum: 0xD34BB24B
	Offset: 0x74A0
	Size: 0x142
	Parameters: 1
	Flags: Linked
*/
function function_fa1230e0(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"hash_76f907c580cdbbc6", #"death");
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
	Name: function_49ae80f0
	Namespace: namespace_fa1c4f0a
	Checksum: 0x8EA19FE7
	Offset: 0x75F0
	Size: 0x224
	Parameters: 1
	Flags: None
*/
function function_49ae80f0(instance)
{
	self notify("6918d8d90a7f1303");
	self endon("6918d8d90a7f1303");
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"hash_76f907c580cdbbc6", #"death");
	wait(20);
	var_8be21cb = namespace_85745671::function_e4791424(self.origin, 24, 40, 1200, 1000);
	n_spawns = function_4bed5fd6();
	for(i = 0; i < n_spawns; i++)
	{
		level flag::wait_till("spawn_zombies");
		if(math::cointoss())
		{
			var_7ecdee63 = #"hash_7a8b592728eec95d";
		}
		else
		{
			if(level.var_b48509f9 > 2)
			{
				var_7ecdee63 = #"hash_46c917a1b5ed91e7";
			}
			else
			{
				if(level.var_b48509f9 > 1)
				{
					var_7ecdee63 = #"hash_338eb4103e0ed797";
				}
				else
				{
					var_7ecdee63 = #"hash_7cba8a05511ceedf";
				}
			}
		}
		if(isdefined(var_8be21cb[i]))
		{
			ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, var_8be21cb[i].origin, self.angles, "payload_zombie");
			wait(0.1);
			if(isdefined(ai_spawned))
			{
				instance.var_74ec00fb++;
				ai_spawned thread function_84d85877(instance);
				ai_spawned thread zombie_attack(self, instance);
			}
		}
	}
}

/*
	Name: function_4bed5fd6
	Namespace: namespace_fa1c4f0a
	Checksum: 0x88E45FBC
	Offset: 0x7820
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function function_4bed5fd6()
{
	switch(getplayers().size)
	{
		case 1:
		{
			n_spawns = 8;
			break;
		}
		case 2:
		{
			n_spawns = 12;
			break;
		}
		case 3:
		{
			n_spawns = 16;
			break;
		}
		case 4:
		{
			n_spawns = 20;
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_8469f022
	Namespace: namespace_fa1c4f0a
	Checksum: 0x69917902
	Offset: 0x78C8
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function function_8469f022(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	var_ad5fcb11 = 0;
	while(true)
	{
		if(self.var_a123c71 == 1)
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
	Name: function_1e88c470
	Namespace: namespace_fa1c4f0a
	Checksum: 0xDE407C56
	Offset: 0x79A0
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function function_1e88c470(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
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
	Name: function_9c54feb0
	Namespace: namespace_fa1c4f0a
	Checksum: 0xA43FB803
	Offset: 0x7A28
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_9c54feb0(instance)
{
	self.n_objective_id = zm_utility::function_f5a222a8(#"hash_33a2a5933ee65208", self);
	instance waittill(#"hash_69090774fec4a17b");
	zm_utility::function_bc5a54a8(self.n_objective_id);
}

/*
	Name: function_f652e7a6
	Namespace: namespace_fa1c4f0a
	Checksum: 0xCD5021B4
	Offset: 0x7A98
	Size: 0x854
	Parameters: 1
	Flags: Linked
*/
function function_f652e7a6(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	self.var_c57af231 = 0;
	while(true)
	{
		self waittill(#"reached_end_node");
		if(isdefined(self.var_94b03771))
		{
			self.var_94b03771 playrumblelooponentity(#"hash_10f60372e6490dc0");
		}
		self.is_teleporting = 1;
		self setbrake(1);
		self objective_manager::function_811514c3();
		if(isdefined(self.currentnode.script_string))
		{
			self.var_6a4ec994++;
			var_b5ec4cd3 = getvehiclenode(self.currentnode.script_string, "targetname");
			var_b5ec4cd3.var_d5ebc20b = getvehiclenode(var_b5ec4cd3.script_string, "targetname");
			if(isdefined(var_b5ec4cd3))
			{
				n_time = var_b5ec4cd3.script_int;
			}
			self ghost();
			if(isdefined(self.var_43123efe))
			{
				self.var_43123efe delete();
			}
			objective_setinvisibletoall(self.n_objective_id);
			wait(1);
			level thread namespace_7589cf5c::play_vo("objectivePayloadRiftCollapse");
			wait(1);
			if(isdefined(self.var_94b03771))
			{
				self.var_94b03771 clientfield::increment("" + #"hash_75190371f51baf5f");
				self.var_94b03771 clientfield::set("" + #"portal", 0);
			}
			wait(2.75);
			level thread namespace_7589cf5c::function_3899cfea(self.origin, 5000);
			if(isdefined(self.var_94b03771))
			{
				self.var_94b03771 clientfield::set("" + #"hash_7bfe2b6c24b46951", 1);
			}
			wait(0.1);
			if(isdefined(self.var_94b03771))
			{
				self.var_94b03771 stoprumble(#"hash_10f60372e6490dc0");
				self.var_94b03771 delete();
			}
			if(isdefined(self.var_edbf8a99))
			{
				self.var_edbf8a99 notsolid();
			}
			self vehicle::get_off_path();
			waitframe(1);
			if(instance.targetname === "objective_golova_payload_teleport")
			{
				var_cdce8e6f = instance.var_fe2612fe[#"hash_4aa151892b77e9c8"][0];
				if(isdefined(var_cdce8e6f.script_noteworthy))
				{
					instance flag::set(#"hash_12988a5a3e6a65d6");
					level.var_97e461d4 = var_cdce8e6f.script_noteworthy;
				}
			}
			self function_42fbf5d9(instance, var_b5ec4cd3);
			wait(0.5);
			self notify(#"assault");
			self thread vehicle::go_path();
			self thread function_3c8781f3(instance);
			wait(2);
			if(isdefined(self.var_cb43e7ed))
			{
				self.var_cb43e7ed clientfield::set("" + #"portal", 0);
				self.var_cb43e7ed delete();
			}
			self setbrake(0);
			while(true)
			{
				if(is_true(self.var_e0c43095))
				{
					break;
				}
				if(!self.var_c57af231)
				{
					self.var_c57af231 = 1;
					while(!self.var_f4bd7934)
					{
						waitframe(1);
					}
					wait(0.5);
					level namespace_7589cf5c::play_vo("objectivePayloadReturned");
					self.var_e0c43095 = 1;
					break;
				}
				wait(0.1);
			}
			wait(0.5);
			level namespace_7589cf5c::play_vo("objectivePayloadReturnedResponse");
			self.is_teleporting = 0;
			if(self.variant === "payload_noteleport")
			{
				self waittill(#"hash_d737648ea5715c3");
			}
			if(self.var_6a4ec994 > 1)
			{
				self.var_8999a4bf = util::spawn_model("tag_origin", var_b5ec4cd3.var_d5ebc20b.origin);
				self waittill(#"hash_59cd13b953de9507");
				if(isdefined(self.var_8999a4bf))
				{
					wait(1.5);
					self.var_8999a4bf clientfield::set("" + #"hash_7bfe2b6c24b46951", 2);
					self thread function_e0c5b0a4(instance);
				}
			}
			self.var_94b03771 = util::spawn_model("tag_origin", var_b5ec4cd3.var_d5ebc20b.origin, vectorscale((0, 1, 0), 90));
			self.var_94b03771 clientfield::set("" + #"portal", 1);
			self.var_94b03771 thread function_fd3059d0(instance);
			if(isdefined(self.var_edbf8a99))
			{
				self.var_edbf8a99 moveto(self.var_94b03771.origin, 0.05);
				self.var_edbf8a99 waittill(#"movedone");
				self.var_edbf8a99 solid();
			}
		}
		else
		{
			self function_785ea4f4(instance);
			if(isdefined(self.health) && isdefined(self.max_health) && (self.health / self.max_health) >= 0.8)
			{
				level scoreevents::doscoreeventcallback("scoreEventSR", {#allplayers:1, #scoreevent:"escort_pristine_zm"});
			}
			instance thread function_28250c29();
			namespace_7589cf5c::function_3899cfea();
			objective_manager::function_2c679cc2(instance);
			break;
		}
	}
}

/*
	Name: function_e0c5b0a4
	Namespace: namespace_fa1c4f0a
	Checksum: 0xD5066397
	Offset: 0x82F8
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_e0c5b0a4(instance)
{
	self endon(#"death");
	instance endon(#"hash_69090774fec4a17b");
	wait(3);
	self notify(#"hash_1db3434782ab777e");
	self waittill(#"enter");
	if(isdefined(self.var_8999a4bf))
	{
		self.var_8999a4bf clientfield::set("" + #"hash_7bfe2b6c24b46951", 0);
	}
}

/*
	Name: function_3c8781f3
	Namespace: namespace_fa1c4f0a
	Checksum: 0x7F118ECE
	Offset: 0x83A8
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_3c8781f3(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death");
	while(!self.var_a123c71)
	{
		objective_setinvisibletoall(self.n_objective_id);
		wait(0.5);
		objective_setvisibletoall(self.n_objective_id);
		wait(0.5);
	}
	objective_setvisibletoall(self.n_objective_id);
}

/*
	Name: function_fd3059d0
	Namespace: namespace_fa1c4f0a
	Checksum: 0x8F6ACED3
	Offset: 0x8458
	Size: 0x424
	Parameters: 1
	Flags: Linked
*/
function function_fd3059d0(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(isalive(player))
			{
				if(distance2dsquared(self.origin, player.origin) <= sqr(120) && !is_true(player.var_d23362c))
				{
					player dodamage(20, self.origin, self, self, undefined, "MOD_DEATH_CIRCLE");
					player clientfield::set_to_player("" + #"hash_19f93b2cb70ea2c5", 1);
					player function_bc82f900("damage_heavy");
					player.var_d23362c = 1;
					continue;
				}
				if(distance2dsquared(self.origin, player.origin) <= sqr(150) && !is_true(player.var_d23362c))
				{
					player dodamage(10, self.origin, self, self, undefined, "MOD_DEATH_CIRCLE");
					player clientfield::set_to_player("" + #"hash_19f93b2cb70ea2c5", 1);
					player function_bc82f900("damage_heavy");
					player.var_d23362c = 1;
					continue;
				}
				if(distance2dsquared(self.origin, player.origin) <= sqr(180) && !is_true(player.var_d23362c))
				{
					player dodamage(5, self.origin, self, self, undefined, "MOD_DEATH_CIRCLE");
					player clientfield::set_to_player("" + #"hash_19f93b2cb70ea2c5", 1);
					player function_bc82f900("damage_light");
					player.var_d23362c = 1;
					continue;
				}
				if(is_true(player.var_d23362c))
				{
					player.var_d23362c = 0;
					player clientfield::set_to_player("" + #"hash_19f93b2cb70ea2c5", 0);
				}
			}
		}
		wait(1);
	}
}

/*
	Name: function_42fbf5d9
	Namespace: namespace_fa1c4f0a
	Checksum: 0xB543ECBF
	Offset: 0x8888
	Size: 0x61C
	Parameters: 2
	Flags: Linked
*/
function function_42fbf5d9(instance, nd_dest)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death");
	self.var_a0bd9710 = util::spawn_model("tag_origin", self.origin, nd_dest.angles);
	self.var_a0bd9710 rotateto(nd_dest.angles + (randomintrange(200, 270), randomintrange(200, 270), randomintrange(200, 270)), 0.05);
	wait(0.1);
	self linkto(self.var_a0bd9710);
	wait(0.1);
	n_dist = distance(self.var_a0bd9710.origin, nd_dest.origin);
	n_time = n_dist / 1000;
	var_7fd007f9 = distance2d(self.var_a0bd9710.origin, nd_dest.origin) * 0.5;
	n_inc = int(n_dist);
	self show();
	objective_setvisibletoall(self.n_objective_id);
	self.var_a0bd9710 rotateto(nd_dest.angles, n_time + 6);
	self.var_a0bd9710 playrumbleonentity(#"hash_2d43d9987e4a73a8");
	self clientfield::set("" + #"hash_85dd1e407a282d9", 1);
	level thread namespace_7589cf5c::play_vo("objectivePayloadRiftCollapseResponse");
	while(true)
	{
		n_current_dist = distance2d(self.var_a0bd9710.origin, nd_dest.origin);
		if(n_current_dist <= 100)
		{
			break;
		}
		v_dest = nd_dest.origin + (0, 0, n_inc);
		n_inc = n_inc - 30;
		if(v_dest[2] <= nd_dest.origin[2])
		{
			break;
		}
		self.var_a0bd9710 moveto(v_dest, n_time);
		waitframe(1);
	}
	foreach(player in getplayers())
	{
		player.var_d23362c = 0;
		player clientfield::set_to_player("" + #"hash_19f93b2cb70ea2c5", 0);
	}
	n_dist = distance(self.var_a0bd9710.origin, nd_dest.origin);
	n_time = n_dist / 600;
	self.var_a0bd9710 moveto(nd_dest.origin + vectorscale((0, 0, 1), 40), n_time);
	self.var_a0bd9710 waittill(#"movedone");
	self clientfield::set("" + #"hash_85dd1e407a282d9", 0);
	self.var_a0bd9710 playrumbleonentity(#"hash_2f2b4b86d2e5aa73");
	self thread function_de22e1a0();
	self unlink();
	waitframe(1);
	self.angles = nd_dest.angles;
	self vehicle::get_on_path(nd_dest);
	self playsound(#"hash_3a33f6dc09073444");
	wait(1);
	if(self.var_6a4ec994 < 2)
	{
		self.var_43123efe = instance function_eb76d765();
	}
	else
	{
		self.var_43123efe = instance function_dc378d61();
	}
	wait(0.25);
	if(isdefined(self.var_43123efe))
	{
		self.var_43123efe linkto(self, "tag_cage_attach");
	}
	self.var_a0bd9710 delete();
}

/*
	Name: function_de22e1a0
	Namespace: namespace_fa1c4f0a
	Checksum: 0xA76E1CD
	Offset: 0x8EB0
	Size: 0x170
	Parameters: 0
	Flags: Linked
*/
function function_de22e1a0()
{
	players = function_a1ef346b(undefined, self.origin, 500);
	foreach(player in players)
	{
		targetorigin = (player.origin[0], player.origin[1], self.origin[2]);
		var_a6470558 = vectornormalize(targetorigin - self.origin);
		player playerknockback(1);
		player applyknockback(100, var_a6470558);
		player playerknockback(0);
		player dodamage(100, self.origin);
	}
}

/*
	Name: function_4ebec20d
	Namespace: namespace_fa1c4f0a
	Checksum: 0xDF7A5214
	Offset: 0x9028
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_4ebec20d(nd_dest)
{
	self endon(#"death");
	if(!isdefined(self.var_cb43e7ed))
	{
		self.var_cb43e7ed = util::spawn_model("tag_origin", nd_dest.origin, vectorscale((0, 1, 0), 90));
		self.var_cb43e7ed clientfield::set("payload_teleport", 2);
	}
}

/*
	Name: timer_grace_period
	Namespace: namespace_fa1c4f0a
	Checksum: 0x7A050166
	Offset: 0x90B8
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function timer_grace_period(instance, n_time)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death");
	self waittilltimeout(8, #"hash_76f907c580cdbbc6");
	instance thread objective_manager::start_timer(n_time, "payload");
}

/*
	Name: function_eb89f65f
	Namespace: namespace_fa1c4f0a
	Checksum: 0xFB70282
	Offset: 0x9138
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_eb89f65f(instance)
{
	instance endon(#"hash_69090774fec4a17b");
	self endon(#"death");
	self vehicle::lights_off();
	self waittill(#"hash_13077c2a8907f2fe");
	self vehicle::toggle_sounds(1);
	self vehicle::lights_on();
}

/*
	Name: function_79ae8e99
	Namespace: namespace_fa1c4f0a
	Checksum: 0xAA198B2A
	Offset: 0x91D8
	Size: 0x4BC
	Parameters: 1
	Flags: Linked
*/
function function_79ae8e99(instance)
{
	instance endon(#"hash_69090774fec4a17b");
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
	Namespace: namespace_fa1c4f0a
	Checksum: 0x2513D9A8
	Offset: 0x96A0
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_c93a6362(var_b8ca9d7)
{
	self endon(#"death");
	var_b8ca9d7 endon(#"death");
	if(self.knockdown_direction === "front" && isalive(self) && distance2dsquared(var_b8ca9d7.origin, self.origin) < sqr(70))
	{
		self thread function_1b4b0c63();
	}
}

/*
	Name: function_1b4b0c63
	Namespace: namespace_fa1c4f0a
	Checksum: 0xA349601D
	Offset: 0x9760
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_1b4b0c63()
{
	self endon(#"death");
	self.allowdeath = 1;
	wait(1);
	gibserverutils::annihilate(self);
	if(isalive(self))
	{
		self kill(undefined, undefined, undefined, undefined, undefined, 1);
	}
}

/*
	Name: function_9bf6c44a
	Namespace: namespace_fa1c4f0a
	Checksum: 0xE0EF8C95
	Offset: 0x97F0
	Size: 0x210
	Parameters: 0
	Flags: Linked
*/
function function_9bf6c44a()
{
	self.var_d2af5572 = self.var_fe2612fe[#"hash_441da645c3f27eea"];
	self.var_c664f75c = [];
	foreach(s_blocker in self.var_d2af5572)
	{
		self.var_c664f75c[self.var_c664f75c.size] = namespace_8b6a9d79::spawn_script_model(s_blocker, s_blocker.model, 1);
	}
	foreach(mdl_blocker in self.var_c664f75c)
	{
		mdl_blocker ghost();
	}
	self waittill(#"hash_69090774fec4a17b");
	foreach(mdl_blocker in self.var_c664f75c)
	{
		mdl_blocker connectpaths();
		wait(0.1);
		mdl_blocker delete();
	}
}

/*
	Name: function_aece4588
	Namespace: namespace_fa1c4f0a
	Checksum: 0xF66342C4
	Offset: 0x9A08
	Size: 0x186
	Parameters: 1
	Flags: Linked
*/
function function_aece4588(var_3afe334f)
{
	switch(var_3afe334f)
	{
		case 1:
		{
			var_e7a1cbae = #"hash_79f4cd8d0836f9b0";
			break;
		}
		case 2:
		{
			var_e7a1cbae = #"hash_79f4d08d0836fec9";
			break;
		}
		case 3:
		{
			var_e7a1cbae = #"hash_79f4cf8d0836fd16";
			break;
		}
		case 4:
		{
			var_e7a1cbae = #"hash_79f4d28d0837022f";
			break;
		}
		case 5:
		{
			var_e7a1cbae = #"hash_79f4d18d0837007c";
			break;
		}
		case 6:
		{
			var_e7a1cbae = #"hash_79f4d48d08370595";
			break;
		}
		case 7:
		{
			var_e7a1cbae = #"hash_79f4d38d083703e2";
			break;
		}
		default:
		{
			var_e7a1cbae = #"hash_79f4d68d083708fb";
			break;
		}
	}
	var_6017f33e = namespace_679a22ba::function_ca209564(var_e7a1cbae);
	return var_6017f33e.var_990b33df;
}

