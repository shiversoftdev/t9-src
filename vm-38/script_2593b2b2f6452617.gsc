#using script_113dd7f0ea2a1d4f;
#using script_4163291d6e693552;
#using script_12538a87a80a2978;
#using scripts\zm_common\zm_utility.gsc;
#using script_b9d273dc917ee1f;
#using scripts\zm_common\zm_equipment.gsc;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using script_1029986e2bc8ca8e;
#using script_27347f09888ad15;
#using script_40fc784c60f9fa7b;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_7bacb32f8222fa3e;
#using script_1cd491b1807da8f7;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_cb308359;

/*
	Name: function_f435b8c5
	Namespace: namespace_cb308359
	Checksum: 0xD447A6D5
	Offset: 0x5D0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f435b8c5()
{
	level notify(-1681804895);
}

#namespace namespace_bff7ce85;

/*
	Name: main
	Namespace: namespace_bff7ce85
	Checksum: 0x83EB9C22
	Offset: 0x5F0
	Size: 0x2EC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	objective_manager::function_b3464a7c(#"hash_3386f30228d9a983", &init, &defend_start, #"defend", #"hash_2e632d14a18ddc0", #"hash_7a6bdc0af120a35f", 2, #"hash_568700cc399c09f0");
	clientfield::register("scriptmover", "" + #"hash_cd445ad9f4974c7", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_3c6d30dcb24fbef8", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_51c88d2d00905c2d", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_225aa48dd3b91fe7", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_5244004f911badae", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_3eeee7f3f5bdb9ff", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_18bcf106c476dfeb", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_186c35405f4624bc", 1, 2, "int");
	clientfield::register("vehicle", "" + #"vehicle_teleport", 1, 1, "counter");
	callback::on_item_pickup(&function_e1ea43c1);
}

/*
	Name: init
	Namespace: namespace_bff7ce85
	Checksum: 0xC94E4E1
	Offset: 0x8E8
	Size: 0x490
	Parameters: 1
	Flags: Linked
*/
function init(instance)
{
	foreach(s_instance in instance.var_fe2612fe[#"console"])
	{
		s_instance.var_a43a7410 = namespace_8b6a9d79::spawn_script_model(s_instance.var_fe2612fe[#"platform"][0], #"hash_35b9c02d1d33868f", 1);
		s_instance.var_4a416ea9 = namespace_8b6a9d79::spawn_script_model(s_instance, #"hash_5cb2edd3633e3fdb", 1);
		s_instance.var_4a416ea9.targetname = "defend_object";
		s_instance.var_4a416ea9.var_4d0b3b87 = s_instance.var_fe2612fe[#"hash_41ae283ea203de66"][0];
		s_instance.var_4a416ea9.a_s_spawnpts = s_instance.var_fe2612fe[#"spawn_pt"];
		s_instance.var_4a416ea9.var_a74eba1b = s_instance.var_fe2612fe[#"spawn_dog"];
		s_instance.var_4a416ea9.var_ac77e384 = s_instance.var_fe2612fe[#"hash_794fd61036053410"];
		s_instance.var_b416cb87 = s_instance.var_fe2612fe[#"hash_35004e30142fc2db"];
		if(isdefined(s_instance.var_fe2612fe[#"attack_spot"]))
		{
			s_instance.var_4a416ea9.var_b69e83ca = s_instance.var_fe2612fe[#"attack_spot"];
		}
		if(isdefined(s_instance.var_fe2612fe[#"hash_794fd61036053410"]))
		{
			s_instance.var_4a416ea9.var_e3e66c83 = s_instance.var_fe2612fe[#"hash_34a1ea2340de4993"];
		}
	}
	if(isdefined(instance.var_fe2612fe[#"blocker"]))
	{
		instance thread function_3a6b15fd();
	}
	instance.var_7a9e6505 = 1;
	instance.var_586c917d = array::random(s_instance.var_fe2612fe[#"hash_35004e30142fc2db"]);
	instance thread function_2cfaf9d7();
	instance.var_43123efe = spawn_head(instance.var_586c917d.origin, instance.var_586c917d.angles);
	instance.var_43123efe ghost();
	instance.var_4a416ea9 = s_instance.var_4a416ea9;
	instance.var_4a416ea9 function_41b29ff0(#"hash_46b1078a533a5a9f");
	instance.var_a43a7410 = s_instance.var_a43a7410;
	instance.var_75d7aa63 = s_instance.var_4a416ea9.var_ac77e384;
	instance thread function_15f3c92();
	instance thread function_7cf83691();
	instance thread function_cf55f07a();
	if(instance.targetname === #"hash_4a1f96b194525b0")
	{
		instance thread function_bc04a76b();
	}
	instance thread namespace_7589cf5c::vo_start("objectiveDefendAnnounce", "objectiveDefendAnnounceResponse");
	instance thread vo_defend();
	instance thread function_4065a0e0();
	level.var_e4731251 = getweapon("equip_head_sr");
	level.var_acd0f67e = 0;
}

/*
	Name: function_4065a0e0
	Namespace: namespace_bff7ce85
	Checksum: 0x9AF1530B
	Offset: 0xD80
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function function_4065a0e0()
{
	self endon(#"objective_ended");
	var_35dfb407 = 0;
	while(!var_35dfb407)
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(distance2dsquared(player.origin, self.var_43123efe.origin) <= 1000000)
			{
				if(player util::is_looking_at(self.var_43123efe, 0.7, 0) || player util::is_looking_at(self.origin, 0.7, 1) || distance2dsquared(player.origin, self.var_43123efe.origin) <= 250000)
				{
					var_35dfb407 = 1;
					break;
				}
			}
		}
		wait(0.5);
	}
	level namespace_7589cf5c::play_vo("objectiveDefendApproach");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveDefendApproachResponse");
}

/*
	Name: function_2cfaf9d7
	Namespace: namespace_bff7ce85
	Checksum: 0xADA09D5B
	Offset: 0xF60
	Size: 0xC2
	Parameters: 0
	Flags: Linked
*/
function function_2cfaf9d7()
{
	if(isdefined(self.var_586c917d.script_int))
	{
		switch(self.var_586c917d.script_int)
		{
			case 1:
			{
				showmiscmodels("defend_corpses_1");
				break;
			}
			case 2:
			{
				showmiscmodels("defend_corpses_2");
				break;
			}
			case 3:
			{
				showmiscmodels("defend_corpses_3");
				break;
			}
		}
	}
}

/*
	Name: function_cf55f07a
	Namespace: namespace_bff7ce85
	Checksum: 0x3CA1035F
	Offset: 0x1030
	Size: 0x724
	Parameters: 0
	Flags: Linked
*/
function function_cf55f07a()
{
	self endon(#"objective_ended");
	self.var_5cc2eee8 = util::spawn_model(#"hash_266d8b7b1d1bec85", self.var_4a416ea9.origin, self.var_4a416ea9.angles);
	self.var_b68642a4 = util::spawn_model(#"hash_1d9c052533aadd6f", self.var_4a416ea9.origin, self.var_4a416ea9.angles);
	self.var_f02db10e = util::spawn_model(#"hash_4c85eb6d915fab1f", self.var_4a416ea9.origin, self.var_4a416ea9.angles);
	self.var_ff2d00f3 = util::spawn_model(#"hash_277c746d8d5f86a9", self.var_4a416ea9.origin, self.var_4a416ea9.angles);
	self.var_171f635e = util::spawn_model(#"hash_198df127040f257c", self.var_4a416ea9.origin, self.var_4a416ea9.angles);
	self.var_854a6b87 = util::spawn_model(#"hash_4c85ec6d915facd2", self.var_4a416ea9.origin, self.var_4a416ea9.angles);
	self.var_be2f6224 = util::spawn_model(#"hash_55735273f06e9432", self.var_4a416ea9.origin, self.var_4a416ea9.angles);
	self.var_d3426a39 = util::spawn_model(#"hash_762f93017354f611", self.var_4a416ea9.origin, self.var_4a416ea9.angles);
	wait(0.1);
	if(isdefined(self.var_5cc2eee8))
	{
		self.a_models[self.a_models.size] = self.var_5cc2eee8;
		self.var_5cc2eee8 thread function_a8cf448(self, #"activate", "" + #"hash_51c88d2d00905c2d", 1);
		self.var_5cc2eee8 thread function_62ff42e2(self, #"objective_ended", "" + #"hash_51c88d2d00905c2d", 0);
	}
	if(isdefined(self.var_b68642a4))
	{
		self.a_models[self.a_models.size] = self.var_b68642a4;
		self.var_b68642a4 thread function_a8cf448(self, #"success", "" + #"hash_51c88d2d00905c2d", 0.1);
	}
	if(isdefined(self.var_ff2d00f3))
	{
		self.a_models[self.a_models.size] = self.var_ff2d00f3;
		self.var_ff2d00f3 thread function_a8cf448(self, #"activate", "" + #"hash_cd445ad9f4974c7");
		self.var_ff2d00f3 thread function_62ff42e2(self, #"damage_1", "" + #"hash_cd445ad9f4974c7", 0);
		self.var_ff2d00f3 thread function_62ff42e2(self, #"fail", "" + #"hash_cd445ad9f4974c7", 0);
	}
	if(isdefined(self.var_171f635e))
	{
		self.a_models[self.a_models.size] = self.var_171f635e;
		self.var_171f635e thread function_a8cf448(self, #"damage_1");
		self.var_171f635e thread function_62ff42e2(self, #"fail", "" + #"hash_cd445ad9f4974c7", 1);
	}
	if(isdefined(self.var_f02db10e))
	{
		self.a_models[self.a_models.size] = self.var_f02db10e;
		self.var_f02db10e thread function_a8cf448(self, #"fail");
	}
	if(isdefined(self.var_be2f6224))
	{
		self.a_models[self.a_models.size] = self.var_be2f6224;
		self.var_be2f6224 thread function_a8cf448(self, #"activate", "" + #"hash_3c6d30dcb24fbef8");
		self.var_be2f6224 thread function_62ff42e2(self, #"damage_2", "" + #"hash_3c6d30dcb24fbef8", 0);
		self.var_be2f6224 thread function_62ff42e2(self, #"fail", "" + #"hash_3c6d30dcb24fbef8", 0);
	}
	if(isdefined(self.var_d3426a39))
	{
		self.a_models[self.a_models.size] = self.var_d3426a39;
		self.var_d3426a39 thread function_a8cf448(self, #"damage_2");
		self.var_d3426a39 thread function_62ff42e2(self, #"fail", "" + #"hash_3c6d30dcb24fbef8", 1);
	}
	if(isdefined(self.var_854a6b87))
	{
		self.a_models[self.a_models.size] = self.var_854a6b87;
		self.var_854a6b87 thread function_a8cf448(self, #"fail");
	}
}

/*
	Name: function_a8cf448
	Namespace: namespace_bff7ce85
	Checksum: 0x5CE47302
	Offset: 0x1760
	Size: 0xAC
	Parameters: 4
	Flags: Linked
*/
function function_a8cf448(instance, str_notify, str_clientfield, n_delay)
{
	self endon(#"death");
	self hide();
	instance waittill(str_notify);
	if(isdefined(n_delay))
	{
		wait(n_delay);
	}
	if(isdefined(str_clientfield))
	{
		instance.var_4a416ea9 clientfield::set(str_clientfield, 1);
	}
	if(isdefined(self))
	{
		self show();
	}
}

/*
	Name: function_62ff42e2
	Namespace: namespace_bff7ce85
	Checksum: 0x52A6A681
	Offset: 0x1818
	Size: 0x94
	Parameters: 4
	Flags: Linked
*/
function function_62ff42e2(instance, str_notify, str_clientfield, n_value)
{
	self endon(#"death");
	instance waittill(str_notify);
	if(isdefined(str_clientfield) && isdefined(n_value))
	{
		instance.var_4a416ea9 clientfield::set(str_clientfield, n_value);
	}
	waitframe(1);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_17f1d0f3
	Namespace: namespace_bff7ce85
	Checksum: 0xA565C392
	Offset: 0x18B8
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
	Name: spawn_head
	Namespace: namespace_bff7ce85
	Checksum: 0xA17F63EE
	Offset: 0x1930
	Size: 0x9E
	Parameters: 2
	Flags: Linked
*/
function spawn_head(v_position, v_angles)
{
	if(!isdefined(v_angles))
	{
		v_angles = (0, 0, 0);
	}
	point = function_4ba8fde(#"hash_5bb462d0c86d343b");
	e_head = item_drop::drop_item(0, undefined, 1, 0, point.id, v_position, v_angles, 0);
	e_head.var_dd21aec2 = 1 | 16;
	return e_head;
}

/*
	Name: function_e1ea43c1
	Namespace: namespace_bff7ce85
	Checksum: 0x6CC1BF58
	Offset: 0x19D8
	Size: 0x17C
	Parameters: 1
	Flags: Linked
*/
function function_e1ea43c1(params)
{
	if(isplayer(self))
	{
		item = params.item;
		if(item.var_a6762160.name === #"hash_5bb462d0c86d343b")
		{
			array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_5d80e5f5d61d2c8f");
			level notify(#"hash_28c14046706f2648");
			self thread function_c64d2826();
			self function_bc82f900("damage_light");
			if(isdefined(level.e_obj) && isdefined(level.e_obj.n_objective_id))
			{
				level.e_obj zm_utility::function_48d9a9c9();
				objective_setinvisibletoall(level.e_obj.n_objective_id);
			}
			if(isdefined(level.var_11af7d74))
			{
				objective_setvisibletoall(level.var_11af7d74);
			}
		}
	}
}

/*
	Name: function_c64d2826
	Namespace: namespace_bff7ce85
	Checksum: 0x4E287C56
	Offset: 0x1B60
	Size: 0x1C6
	Parameters: 0
	Flags: Linked
*/
function function_c64d2826()
{
	self endon(#"hash_31f98f1ef1f33ee1", #"disconnect");
	self val::set(#"hash_5f4be7238bf3892b", "disable_weapon_cycling", 1);
	self giveweapon(level.var_e4731251);
	self switchtoweapon(level.var_e4731251, 1);
	self thread function_f4b436d5();
	self waittill(#"weapon_change_complete");
	callback::on_weapon_change(&function_2c951177);
	callback::function_33f0ddd3(&function_2056cd79);
	self thread function_50d04ccb();
	self val::reset(#"hash_5f4be7238bf3892b", "disable_weapon_cycling");
	self thread zm_equipment::show_hint_text(#"hash_303616f97ddfb53e", 10);
	level thread function_9c294ad5(self);
	self waittill(#"inserted");
	self notify(#"inserted", {#str_result:"placed"});
}

/*
	Name: function_9c294ad5
	Namespace: namespace_bff7ce85
	Checksum: 0xC7E0D62C
	Offset: 0x1D30
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_9c294ad5(e_player)
{
	e_player endon(#"disconnect");
	s_result = undefined;
	s_result = e_player waittill(#"hash_31f98f1ef1f33ee1", #"fake_death", #"inserted");
	callback::remove_on_weapon_change(&function_2c951177);
	callback::function_824d206(&function_2056cd79);
	e_player takeweapon(level.var_e4731251);
	e_player notify(#"hide_equipment_hint_text");
	if(s_result.str_result === "dropped" || s_result._notify == "fake_death")
	{
		e_player function_98957f5b();
	}
}

/*
	Name: function_98957f5b
	Namespace: namespace_bff7ce85
	Checksum: 0xF0A62297
	Offset: 0x1E58
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function function_98957f5b()
{
	level endon(#"end_game");
	v_start = self.origin + vectorscale((0, 0, 1), 32);
	v_end = self.origin - vectorscale((0, 0, 1), 1000);
	a_trace = groundtrace(v_start, v_end, 0, self, 1);
	v_ground = (isdefined(a_trace[#"position"]) ? a_trace[#"position"] : self.origin);
	self playsound(#"hash_6143657d9c796b81");
	level.e_head = level spawn_head(v_ground + vectorscale((0, 0, 1), 8));
	if(isdefined(level.e_head))
	{
		level.e_head thread function_beaa3f66();
	}
}

/*
	Name: function_50d04ccb
	Namespace: namespace_bff7ce85
	Checksum: 0x2ABF9B78
	Offset: 0x1FA8
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function function_50d04ccb()
{
	self endon(#"disconnect", #"hash_31f98f1ef1f33ee1", #"fake_death");
	self waittill(#"hash_4506f189fa360331");
	self notify(#"hash_31f98f1ef1f33ee1", {#str_result:"dropped"});
}

/*
	Name: function_2c951177
	Namespace: namespace_bff7ce85
	Checksum: 0xBCD99C2C
	Offset: 0x2028
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_2c951177(s_params)
{
	self notify(#"hash_31f98f1ef1f33ee1", {#str_result:"dropped"});
}

/*
	Name: function_2056cd79
	Namespace: namespace_bff7ce85
	Checksum: 0x693EF21A
	Offset: 0x2068
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_2056cd79(s_event)
{
	w_weapon = s_event.weapon;
	if(w_weapon.inventorytype === "ability")
	{
		return;
	}
	if(s_event.event === "take_weapon" && (w_weapon.inventorytype === "offhand" || w_weapon.inventorytype === "offhand_primary"))
	{
		return;
	}
	self notify(#"hash_31f98f1ef1f33ee1", {#str_result:"dropped"});
}

/*
	Name: function_f4b436d5
	Namespace: namespace_bff7ce85
	Checksum: 0x347CB4B4
	Offset: 0x2128
	Size: 0x1EC
	Parameters: 0
	Flags: Linked
*/
function function_f4b436d5()
{
	self endon(#"disconnect");
	self.is_drinking = 1;
	self val::set(#"hash_5f4be7238bf3892b", "disable_weapon_fire", 1);
	self val::set(#"hash_5f4be7238bf3892b", "allow_melee", 0);
	self val::set(#"hash_5f4be7238bf3892b", "allow_mantle", 0);
	self val::set(#"hash_5f4be7238bf3892b", "allow_sprint", 0);
	self val::set(#"hash_5f4be7238bf3892b", "allow_jump", 0);
	self waittill(#"hash_31f98f1ef1f33ee1", #"inserted");
	self.is_drinking = 0;
	self val::reset(#"hash_5f4be7238bf3892b", "disable_weapon_fire");
	self val::reset(#"hash_5f4be7238bf3892b", "allow_melee");
	self val::reset(#"hash_5f4be7238bf3892b", "allow_mantle");
	self val::reset(#"hash_5f4be7238bf3892b", "allow_sprint");
	self val::reset(#"hash_5f4be7238bf3892b", "allow_jump");
}

/*
	Name: vo_defend
	Namespace: namespace_bff7ce85
	Checksum: 0xB7EF13D6
	Offset: 0x2320
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function vo_defend()
{
	self endon(#"objective_ended");
	self waittill(#"hash_17c21fa8ca15c918");
	self thread function_a56e1736();
	wait(1);
	level namespace_7589cf5c::play_vo("objectiveDefendStart");
	playsoundatposition(#"hash_1fe69eb0d3391a76", self.var_4a416ea9.origin);
	wait(1);
	level namespace_7589cf5c::play_vo("objectiveDefendStartResponse");
	self flag::set(#"hash_5afa3625eb7ee268");
	self waittill(#"wave_start");
	playsoundatposition(#"hash_1fe69eb0d3391a76", self.var_4a416ea9.origin);
	level namespace_7589cf5c::play_vo("objectiveDefendWave2");
	self waittill(#"wave_start");
	playsoundatposition(#"hash_1fe69eb0d3391a76", self.var_4a416ea9.origin);
	level namespace_7589cf5c::play_vo("objectiveDefendWave3");
}

/*
	Name: function_a56e1736
	Namespace: namespace_bff7ce85
	Checksum: 0x1806EE6D
	Offset: 0x24D8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_a56e1736()
{
	self endon(#"objective_ended");
	self waittill(#"hash_295695008869aed5");
	self flag::wait_till(#"hash_5afa3625eb7ee268");
	level namespace_7589cf5c::play_vo("objectiveDefendUnderAttack");
}

/*
	Name: function_15f3c92
	Namespace: namespace_bff7ce85
	Checksum: 0xB81500B5
	Offset: 0x2550
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function function_15f3c92()
{
	self endon(#"objective_ended");
	self.var_4a416ea9 endon(#"death");
	self.var_4a416ea9.var_c54337b2 = zm_utility::function_f5a222a8(#"hash_69a419877aee1334", self.var_4a416ea9.origin + vectorscale((0, 0, 1), 70));
	objective_setinvisibletoall(self.var_4a416ea9.var_c54337b2);
	self waittill(#"inserted");
	self.var_43123efe = util::spawn_model("c_t9_zmb_defense_console_head1_male", self.var_4a416ea9.origin + vectorscale((0, 0, 1), 46), self.var_4a416ea9.angles);
	if(isdefined(self.var_43123efe))
	{
		self.var_43123efe show();
		self.var_43123efe thread scene::play(#"hash_53a014896b2ff626", "tank_loop", self.var_43123efe);
	}
}

/*
	Name: function_3a6b15fd
	Namespace: namespace_bff7ce85
	Checksum: 0xF3734954
	Offset: 0x26C0
	Size: 0x180
	Parameters: 0
	Flags: Linked
*/
function function_3a6b15fd()
{
	if(isdefined(self.var_fe2612fe[#"blocker"]))
	{
		self.a_mdl_blockers = [];
		foreach(s_blocker in self.var_fe2612fe[#"blocker"])
		{
			self.a_mdl_blockers[self.a_mdl_blockers.size] = namespace_8b6a9d79::spawn_script_model(s_blocker, s_blocker.model, 1);
		}
		foreach(mdl_blocker in self.a_mdl_blockers)
		{
			mdl_blocker disconnectpaths();
			mdl_blocker ghost();
		}
	}
}

/*
	Name: function_bc04a76b
	Namespace: namespace_bff7ce85
	Checksum: 0x756C53F3
	Offset: 0x2848
	Size: 0x120
	Parameters: 0
	Flags: Linked
*/
function function_bc04a76b()
{
	self endon(#"objective_ended");
	self waittill(#"inserted");
	wait(1);
	var_b54d7065 = getdynentarray("dynent_garage_button");
	doors = array::get_all_closest(self.origin, var_b54d7065, undefined, 4, self.script_radius);
	foreach(door in doors)
	{
		if(!function_ffdbe8c2(door))
		{
			dynent_use::use_dynent(door);
		}
	}
}

/*
	Name: function_f5087df2
	Namespace: namespace_bff7ce85
	Checksum: 0x8B42E2DC
	Offset: 0x2970
	Size: 0x2AC
	Parameters: 0
	Flags: Linked
*/
function function_f5087df2()
{
	s_result = undefined;
	s_result = self waittill(#"objective_ended", #"hash_8202877a3aadac8");
	objective_manager::stop_timer();
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 0);
	}
	if(self flag::get(#"hash_12988a5a3e6a65d6"))
	{
		level.var_97e461d4 = undefined;
		self flag::clear(#"hash_12988a5a3e6a65d6");
	}
	if(is_true(self.success))
	{
		level thread namespace_cda50904::function_a92a93e9(self.var_4a416ea9.var_4d0b3b87.origin, self.var_4a416ea9.var_4d0b3b87.angles);
		self.var_4a416ea9 clientfield::increment("" + #"hash_3eeee7f3f5bdb9ff");
		self.var_4a416ea9 playrumbleonentity("sr_prototype_generator_explosion");
		waitframe(1);
		namespace_7589cf5c::function_3899cfea();
		wait(2);
		level namespace_7589cf5c::play_vo("objectiveDefendEnd");
		wait(1);
		level thread namespace_7589cf5c::play_vo("objectiveDefendEndResponse");
		level flag::set(#"hash_1460b3afd614fb6c");
	}
	else if(s_result._notify !== #"hash_8202877a3aadac8")
	{
		self.var_4a416ea9 thread function_b11358ce();
	}
}

/*
	Name: defend_start
	Namespace: namespace_bff7ce85
	Checksum: 0x70D8A09C
	Offset: 0x2C28
	Size: 0x268
	Parameters: 2
	Flags: Linked
*/
function defend_start(instance, activator)
{
	instance endon(#"objective_ended");
	if(isplayer(activator))
	{
		instance thread function_f5087df2();
		instance thread function_17f1d0f3();
		instance thread namespace_7589cf5c::function_f10301b0();
		instance.var_4a416ea9 thread function_b9fb6c3a(instance);
		instance.var_4a416ea9 thread function_677356aa(instance);
		instance.var_4a416ea9 thread clear_vehicles(instance);
		instance.var_4a416ea9 thread function_e132cdc7(instance);
		instance notify(#"hash_17c21fa8ca15c918");
		level notify(#"defend_start");
		var_cdce8e6f = instance.var_fe2612fe[#"hash_5819d8571ea7c838"][0];
		if(isdefined(var_cdce8e6f.script_noteworthy))
		{
			instance flag::set(#"hash_12988a5a3e6a65d6");
			level.var_97e461d4 = var_cdce8e6f.script_noteworthy;
		}
		wait(5);
		foreach(player in getplayers())
		{
			level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_237b8c297f7c5730");
			level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 2);
		}
	}
}

/*
	Name: function_e132cdc7
	Namespace: namespace_bff7ce85
	Checksum: 0x44E4238C
	Offset: 0x2E98
	Size: 0x21C
	Parameters: 1
	Flags: Linked
*/
function function_e132cdc7(instance)
{
	wait(1);
	self clientfield::set("" + #"hash_225aa48dd3b91fe7", 1);
	wait(0.5);
	self clientfield::set("" + #"hash_5244004f911badae", 1);
	wait(0.25);
	instance notify(#"activate");
	self scene::play(#"hash_3726f03b11802205", "Shot 1", self);
	self playrumblelooponentity("sr_machinery_rumble");
	self thread scene::play(#"hash_3726f03b11802205", "Shot 2", self);
	instance waittill(#"objective_ended");
	if(instance.success)
	{
		instance notify(#"success");
		self clientfield::set("" + #"hash_225aa48dd3b91fe7", 0);
		if(isdefined(instance.var_43123efe))
		{
			instance.var_43123efe delete();
		}
	}
	else
	{
		instance notify(#"fail");
	}
	wait(1);
	self scene::stop();
	self scene::play(#"hash_3726f03b11802205", "Shot 3", self);
	self stoprumble("sr_machinery_rumble");
}

/*
	Name: function_9c54feb0
	Namespace: namespace_bff7ce85
	Checksum: 0xD2D84C7A
	Offset: 0x30C0
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_9c54feb0(instance)
{
	self.n_objective_id = zm_utility::function_f5a222a8(#"hash_48db6906777e28d6", self.origin + vectorscale((0, 0, 1), 70));
	self thread function_80ba1bc8(instance, self.n_objective_id);
	instance waittill(#"objective_ended");
	zm_utility::function_bc5a54a8(self.n_objective_id);
	zm_utility::function_bc5a54a8(self.var_c54337b2);
}

/*
	Name: function_7cf83691
	Namespace: namespace_bff7ce85
	Checksum: 0x8568554A
	Offset: 0x3180
	Size: 0x3BC
	Parameters: 0
	Flags: Linked
*/
function function_7cf83691()
{
	self endon(#"objective_ended");
	self.starttrigger triggerenable(0);
	objective_setinvisibletoall(self.var_e55c8b4e);
	self thread function_5839db26();
	var_43123efe = self.var_43123efe;
	var_43123efe show();
	level.e_obj = util::spawn_model("tag_origin", self.var_4a416ea9.origin);
	n_objective_id = zm_utility::function_f5a222a8(#"hash_2e632d14a18ddc0", level.e_obj);
	objective_setprogress(n_objective_id, 1);
	var_f4bd7934 = 0;
	while(true)
	{
		foreach(player in getplayers())
		{
			if(distance2dsquared(level.e_obj.origin, player.origin) <= sqr(3000))
			{
				var_f4bd7934 = 1;
			}
		}
		if(var_f4bd7934)
		{
			break;
		}
		wait(1);
	}
	level.e_obj moveto(var_43123efe.origin, 0.05);
	zm_utility::function_bc5a54a8(n_objective_id);
	level.e_obj.n_objective_id = zm_utility::function_f5a222a8(#"hash_a7e9aa24c3b886d", level.e_obj);
	objective_setprogress(level.e_obj.n_objective_id, 1);
	level.e_obj zm_utility::function_747180ea(level.e_obj.n_objective_id, 96);
	level waittill(#"hash_28c14046706f2648");
	self notify(#"pickup");
	level.e_obj zm_utility::function_48d9a9c9();
	objective_setinvisibletoall(level.e_obj.n_objective_id);
	self thread function_57cc3128();
	self waittill(#"inserted");
	zm_utility::function_bc5a54a8(level.e_obj.n_objective_id);
	callback::remove_callback(#"on_item_pickup", &function_e1ea43c1);
}

/*
	Name: function_beaa3f66
	Namespace: namespace_bff7ce85
	Checksum: 0xFA6C0236
	Offset: 0x3548
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_beaa3f66()
{
	level endon(#"defend_start", #"hash_28c14046706f2648");
	self endon(#"death");
	level.e_obj moveto(self.origin, 0.05);
	level.e_obj waittill(#"movedone");
	level.e_obj zm_utility::function_747180ea(level.e_obj.n_objective_id, 96);
	objective_setvisibletoall(level.e_obj.n_objective_id);
	objective_setinvisibletoall(level.var_11af7d74);
}

/*
	Name: function_57cc3128
	Namespace: namespace_bff7ce85
	Checksum: 0x9F12A1A3
	Offset: 0x3640
	Size: 0x3C4
	Parameters: 0
	Flags: Linked
*/
function function_57cc3128()
{
	self endon(#"objective_ended");
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_4546417366cc7a50");
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 2);
	}
	var_4a416ea9 = self.var_4a416ea9;
	level.var_11af7d74 = zm_utility::function_f5a222a8(#"hash_39f360c41bb85464", var_4a416ea9.origin + vectorscale((0, 0, 1), 30));
	var_7631cbaa = spawn("trigger_radius_use", var_4a416ea9.origin + vectorscale((0, 0, 1), 24), 0, 96, 96, 1);
	var_7631cbaa triggerignoreteam();
	var_7631cbaa setcursorhint("HINT_NOICON");
	var_7631cbaa sethintstring(#"hash_6442cecaf6cfb0dc");
	var_7631cbaa usetriggerrequirelookat(1);
	var_7631cbaa thread function_c4712107();
	var_4a416ea9 zm_utility::function_747180ea(level.var_11af7d74, undefined, var_7631cbaa);
	s_result = undefined;
	s_result = var_7631cbaa waittill(#"trigger");
	if(isalive(s_result.activator))
	{
		s_result.activator notify(#"inserted");
		s_result.activator function_bc82f900("damage_heavy");
	}
	var_7631cbaa delete();
	var_4a416ea9 zm_utility::function_48d9a9c9();
	zm_utility::function_bc5a54a8(level.var_11af7d74);
	self notify(#"inserted");
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 0);
	}
	self.starttrigger triggerenable(1);
	self.starttrigger useby(s_result.activator);
}

/*
	Name: function_c4712107
	Namespace: namespace_bff7ce85
	Checksum: 0x59B2BD6A
	Offset: 0x3A10
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_c4712107()
{
	self endon(#"death");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(player hasweapon(level.var_e4731251))
			{
				self setvisibletoplayer(player);
				if(player istouching(self))
				{
					player notify(#"hide_equipment_hint_text");
				}
				else
				{
					player thread zm_equipment::show_hint_text(#"hash_303616f97ddfb53e", 10);
				}
				continue;
			}
			self setinvisibletoplayer(player);
		}
		wait(0.5);
	}
}

/*
	Name: function_5839db26
	Namespace: namespace_bff7ce85
	Checksum: 0xA3446318
	Offset: 0x3B68
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_5839db26()
{
	self endon(#"objective_ended");
	n_spawns = randomintrange(2, 5);
	a_s_pts = namespace_85745671::function_e4791424(self.var_43123efe.origin, 32, 80, 400);
	for(i = 0; i < n_spawns; i++)
	{
		level flag::wait_till("spawn_zombies");
		if(isdefined(a_s_pts[i]))
		{
			var_7ecdee63 = function_2631fff1(self, level.var_b48509f9);
			ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, a_s_pts[i].origin, self.var_43123efe.angles, "defend_zombie");
		}
		wait(0.1);
	}
}

/*
	Name: function_5f91d0c7
	Namespace: namespace_bff7ce85
	Checksum: 0xF85AE86D
	Offset: 0x3CA0
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_5f91d0c7(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	self thread function_9c54feb0(instance);
	level thread objective_manager::start_timer(180, "defend");
	instance thread function_c043100e(180);
	instance thread function_b3615a60();
}

/*
	Name: function_c043100e
	Namespace: namespace_bff7ce85
	Checksum: 0x8E543F87
	Offset: 0x3D48
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function function_c043100e(n_time)
{
	self endon(#"objective_ended");
	while(true)
	{
		if(n_time == 30)
		{
			return;
		}
		wait(1);
		n_time = n_time - 1;
	}
}

/*
	Name: function_677356aa
	Namespace: namespace_bff7ce85
	Checksum: 0x814ADCD2
	Offset: 0x3DB0
	Size: 0x344
	Parameters: 1
	Flags: Linked
*/
function function_677356aa(instance)
{
	instance endon(#"objective_ended");
	self playsound(#"hash_67cbf2e985e3d9aa");
	instance waittill(#"activate");
	level flag::set("obj_defend_start");
	self thread function_763876af(instance);
	self thread function_5f91d0c7(instance);
	a_players = getplayers();
	n_players = a_players.size;
	switch(n_players)
	{
		case 1:
		{
			var_fd6a4001 = 5;
			var_102fe58c = 6;
			var_3b743c0c = 7;
			var_7dbbc09a = 10;
			break;
		}
		case 2:
		{
			var_fd6a4001 = 7;
			var_102fe58c = 9;
			var_3b743c0c = 11;
			var_7dbbc09a = 15;
			break;
		}
		case 3:
		{
			var_fd6a4001 = 9;
			var_102fe58c = 12;
			var_3b743c0c = 14;
			var_7dbbc09a = 18;
			break;
		}
		case 4:
		{
			var_fd6a4001 = 12;
			var_102fe58c = 14;
			var_3b743c0c = 16;
			var_7dbbc09a = 22;
			break;
		}
	}
	self thread function_34ac205(instance, var_fd6a4001, self.a_s_spawnpts, 1);
	wait(30 - function_21a3a673(10, 20));
	self thread spawn_dogs(instance);
	instance waittill(#"wave_start");
	self thread function_34ac205(instance, var_102fe58c, self.a_s_spawnpts, 2);
	wait(30 - function_21a3a673(10, 20));
	self thread spawn_dogs(instance);
	instance waittill(#"wave_start");
	self thread function_34ac205(instance, var_3b743c0c, self.a_s_spawnpts, 3);
	self thread spawn_dogs(instance);
	instance waittill(#"wave_start");
	self thread function_34ac205(instance, var_7dbbc09a, self.a_s_spawnpts, 4);
}

/*
	Name: function_b3615a60
	Namespace: namespace_bff7ce85
	Checksum: 0x21DB3874
	Offset: 0x4100
	Size: 0xA6
	Parameters: 0
	Flags: Linked
*/
function function_b3615a60()
{
	self endon(#"objective_ended");
	wait(30);
	self notify(#"wave_done");
	wait(15);
	self notify(#"wave_start");
	wait(30);
	self notify(#"wave_done");
	wait(15);
	self notify(#"wave_start");
	wait(30);
	self notify(#"wave_done");
	wait(15);
	self notify(#"wave_start");
}

/*
	Name: function_a2254b83
	Namespace: namespace_bff7ce85
	Checksum: 0x2FB1FCEE
	Offset: 0x41B0
	Size: 0xF2
	Parameters: 2
	Flags: None
*/
function function_a2254b83(instance, n_time)
{
	instance endon(#"objective_ended", #"wave_done");
	self endon(#"death");
	n_count = 0;
	while(true)
	{
		a_ai_zombies = getentarray("defend_zombie", "targetname");
		if(!isdefined(a_ai_zombies) || a_ai_zombies.size < 3)
		{
			instance notify(#"wave_done");
		}
		else
		{
			n_count++;
			if(n_count >= n_time)
			{
				instance notify(#"wave_done");
			}
		}
		wait(1);
	}
}

/*
	Name: function_809b1986
	Namespace: namespace_bff7ce85
	Checksum: 0x945E9B8B
	Offset: 0x42B0
	Size: 0xF2
	Parameters: 1
	Flags: Linked
*/
function function_809b1986(goalpos)
{
	if(isdefined(level.var_7d45d0d4.currentdestination) && level.var_7d45d0d4.currentdestination.targetname === "destination_ski")
	{
		if(isdefined(level.var_7d45d0d4.var_3385b421.origin))
		{
			var_82bf669e = 490000;
			if(distancesquared(self.origin, level.var_7d45d0d4.var_3385b421.origin) > var_82bf669e)
			{
				self.var_a44ca810 = 250;
				self.var_62561fdc = 500;
				self.var_cfb82e92 = 4;
			}
			else
			{
				self.var_a44ca810 = undefined;
				self.var_62561fdc = undefined;
			}
		}
	}
}

/*
	Name: function_fd68cae4
	Namespace: namespace_bff7ce85
	Checksum: 0xA437AF87
	Offset: 0x43B0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_fd68cae4()
{
	self endon(#"death");
	if(self.archetype == #"zombie")
	{
		if(level.var_b48509f9 < 5)
		{
			self namespace_85745671::function_9758722("sprint");
		}
	}
}

/*
	Name: zombie_attack
	Namespace: namespace_bff7ce85
	Checksum: 0xB0D6527D
	Offset: 0x4418
	Size: 0x15E
	Parameters: 0
	Flags: Linked
*/
function zombie_attack()
{
	self endon(#"death");
	self callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
	self flag::set(#"hash_52d6a75cdbf101f3");
	self.var_40e7d5fb = &function_809b1986;
	while(true)
	{
		player = awareness::function_d7fedde2(self);
		if(math::cointoss(25))
		{
			if(isalive(player))
			{
				self.var_ff290a61 = player;
			}
		}
		namespace_85745671::function_744beb04(self);
		if(!isdefined(self.var_b238ef38) && isalive(player))
		{
			self.is_attacking = 1;
			awareness::function_c241ef9a(self, player, 11);
		}
		wait(5);
		self.var_ff290a61 = undefined;
		self.is_attacking = undefined;
	}
}

/*
	Name: function_34ac205
	Namespace: namespace_bff7ce85
	Checksum: 0xF70D4056
	Offset: 0x4580
	Size: 0x3B2
	Parameters: 4
	Flags: Linked
*/
function function_34ac205(instance, n_active, a_s_spawnpts, n_wave)
{
	instance endon(#"objective_ended", #"wave_done");
	self endon(#"death");
	instance.n_wave = n_wave;
	instance.n_active = 0;
	n_delay = 1 / (n_wave * 3);
	a_s_locs = instance function_94e50668(a_s_spawnpts, n_wave);
	a_s_pts = arraycopy(a_s_locs);
	while(true)
	{
		level flag::wait_till("spawn_zombies");
		if(instance.n_active < n_active)
		{
			if(!a_s_pts.size)
			{
				a_s_pts = arraycopy(a_s_locs);
			}
			s_loc = a_s_pts[0];
			arrayremovevalue(a_s_pts, a_s_pts[0]);
			var_7ecdee63 = function_2631fff1(instance, level.var_b48509f9);
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
				if(instance.var_2133c784 >= instance.var_61c57c53 || instance.var_b803db9c >= instance.var_5de17ec9 || n_wave === 1)
				{
					var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
				}
			}
			ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, s_loc.origin, s_loc.angles, "defend_zombie");
			if(isdefined(ai_spawned))
			{
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
				ai_spawned thread zombie_attack();
				instance.n_active++;
			}
		}
		wait(n_delay);
	}
}

/*
	Name: function_c36cb7b1
	Namespace: namespace_bff7ce85
	Checksum: 0x6CC94DC2
	Offset: 0x4940
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
	Namespace: namespace_bff7ce85
	Checksum: 0x1626D376
	Offset: 0x49A8
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function on_zombie_killed(instance)
{
	if(isdefined(level.var_7d45d0d4.var_3385b421) && level.var_7d45d0d4.var_3385b421.n_active)
	{
		level.var_7d45d0d4.var_3385b421.n_active--;
	}
}

/*
	Name: spawn_dogs
	Namespace: namespace_bff7ce85
	Checksum: 0xAD19E054
	Offset: 0x4A10
	Size: 0x240
	Parameters: 1
	Flags: Linked
*/
function spawn_dogs(instance)
{
	instance endon(#"objective_ended", #"hash_49d2713028fdc353");
	self endon(#"death");
	n_players = getplayers().size;
	n_total = function_b37294d5(n_players);
	a_s_pts = array::randomize(self.var_a74eba1b);
	i = 0;
	if(level.var_b48509f9 < 2)
	{
		var_ac011846 = #"hash_1aad87070ee50927";
	}
	else
	{
		if(math::cointoss())
		{
			var_ac011846 = #"hash_1aad87070ee50927";
		}
		else
		{
			var_ac011846 = #"hash_3355ad7db8a25b2b";
		}
	}
	for(j = 0; j < n_total; j++)
	{
		level flag::wait_till("spawn_zombies");
		var_6017f33e = namespace_679a22ba::function_ca209564(var_ac011846);
		var_7ecdee63 = var_6017f33e.var_990b33df;
		ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, a_s_pts[i].origin, a_s_pts[i].angles, "defend_zombie");
		if(isdefined(ai_spawned))
		{
			ai_spawned thread zombie_attack();
			ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &on_dog_killed);
		}
		i++;
		if(i >= (a_s_pts.size - 1))
		{
			i = 0;
		}
		wait(0.5);
	}
}

/*
	Name: on_dog_killed
	Namespace: namespace_bff7ce85
	Checksum: 0x4CB0677B
	Offset: 0x4C58
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function on_dog_killed(params)
{
	var_4a416ea9 = getent("defend_object", "targetname");
	if(self.aitype === #"hash_7a8b592728eec95d" && isdefined(var_4a416ea9))
	{
		if(isdefined(self) && isdefined(var_4a416ea9) && distance2dsquared(self.origin, var_4a416ea9.origin) <= sqr(200))
		{
			n_dmg = 20;
			var_4a416ea9 dodamage(n_dmg, var_4a416ea9.origin, undefined, undefined, undefined, "MOD_UNKNOWN");
		}
	}
}

/*
	Name: function_b37294d5
	Namespace: namespace_bff7ce85
	Checksum: 0xF92B5F71
	Offset: 0x4D48
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function function_b37294d5(n_players)
{
	switch(n_players)
	{
		case 1:
		{
			var_e00b0988 = 4;
			break;
		}
		case 2:
		{
			var_e00b0988 = 6;
			break;
		}
		case 3:
		{
			var_e00b0988 = 8;
			break;
		}
		case 4:
		{
			var_e00b0988 = 10;
			break;
		}
	}
	return var_e00b0988;
}

/*
	Name: function_2631fff1
	Namespace: namespace_bff7ce85
	Checksum: 0x6D006736
	Offset: 0x4DF0
	Size: 0x1BA
	Parameters: 2
	Flags: Linked
*/
function function_2631fff1(instance, var_661691aa)
{
	switch(var_661691aa)
	{
		case 1:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_11850ea2af356794");
			break;
		}
		case 2:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_118511a2af356cad");
			break;
		}
		case 3:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_118510a2af356afa");
			break;
		}
		case 4:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_11850ba2af35627b");
			break;
		}
		case 5:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_11850aa2af3560c8");
			break;
		}
		case 6:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_11850da2af3565e1");
			break;
		}
		default:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_11850ca2af35642e");
			break;
		}
	}
	return var_6017f33e.var_990b33df;
}

/*
	Name: function_94e50668
	Namespace: namespace_bff7ce85
	Checksum: 0x6E12653E
	Offset: 0x4FB8
	Size: 0x1C2
	Parameters: 2
	Flags: Linked
*/
function function_94e50668(a_s_pts, n_wave)
{
	a_s_spawnpts = [];
	foreach(s_pt in a_s_pts)
	{
		if(n_wave == 4)
		{
			if(s_pt.script_int === 4)
			{
				a_s_spawnpts[a_s_spawnpts.size] = s_pt;
			}
			continue;
		}
		if(n_wave == 1)
		{
			if(s_pt.script_int === 1)
			{
				a_s_spawnpts[a_s_spawnpts.size] = s_pt;
			}
			continue;
		}
		if(n_wave == 2)
		{
			if(s_pt.script_int === 1 || s_pt.script_int === 2)
			{
				a_s_spawnpts[a_s_spawnpts.size] = s_pt;
			}
			continue;
		}
		if(n_wave == 3)
		{
			if(s_pt.script_int === 1 || s_pt.script_int === 2 || s_pt.script_int === 3)
			{
				a_s_spawnpts[a_s_spawnpts.size] = s_pt;
			}
			continue;
		}
		a_s_spawnpts = a_s_pts;
	}
	if(!isdefined(a_s_spawnpts))
	{
		return a_s_pts;
	}
	a_s_spawnpts = array::randomize(a_s_spawnpts);
	return a_s_spawnpts;
}

/*
	Name: function_763876af
	Namespace: namespace_bff7ce85
	Checksum: 0xBBB68BDB
	Offset: 0x5188
	Size: 0x2CC
	Parameters: 1
	Flags: Linked
*/
function function_763876af(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	self thread function_b70e2a37(instance);
	if(isdefined(self.var_b69e83ca))
	{
		foreach(var_ebc16ebc in self.var_b69e83ca)
		{
			space = 20;
			if(ispointonnavmesh(var_ebc16ebc.origin, space))
			{
				var_ebc16ebc.on_navmesh = 1;
				continue;
			}
			pt = getclosestpointonnavmesh(var_ebc16ebc.origin, 100, space);
			if(isdefined(pt))
			{
				s_attackpt = struct::spawn(pt);
				self.var_b69e83ca[self.var_b69e83ca.size] = s_attackpt;
			}
		}
	}
	else
	{
		slots = namespace_85745671::function_bdb2b85b(self, self.origin, self.angles, 40, 5, 16);
	}
	slots = self.var_b69e83ca;
	if(!isdefined(slots) || slots.size <= 0)
	{
		return;
	}
	self.var_b79a8ac7 = {#slots:slots, #hash_f019ea1a:6000};
	level.attackables[level.attackables.size] = self;
	level waittill(#"timer_defend");
	if(isdefined(self.health) && isdefined(self.max_health) && (self.health / self.max_health) >= 0.8)
	{
		level scoreevents::doscoreeventcallback("scoreEventSR", {#allplayers:1, #scoreevent:"defend_pristine_zm"});
	}
	objective_manager::objective_ended(instance);
}

/*
	Name: function_b11358ce
	Namespace: namespace_bff7ce85
	Checksum: 0x9F9CE39B
	Offset: 0x5460
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_b11358ce()
{
	self clientfield::increment("" + #"hash_3eeee7f3f5bdb9ff");
	self playrumbleonentity("sr_prototype_generator_explosion");
}

/*
	Name: function_b70e2a37
	Namespace: namespace_bff7ce85
	Checksum: 0x6F330841
	Offset: 0x54B8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_b70e2a37(instance)
{
	instance waittill(#"objective_ended");
	namespace_85745671::function_b70e2a37(self);
}

/*
	Name: function_b9fb6c3a
	Namespace: namespace_bff7ce85
	Checksum: 0xD6E31C32
	Offset: 0x5500
	Size: 0x38C
	Parameters: 1
	Flags: Linked
*/
function function_b9fb6c3a(instance)
{
	instance endon(#"objective_ended");
	switch(getplayers().size)
	{
		case 1:
		{
			self.health = 2500;
			self.max_health = 2500;
			break;
		}
		case 2:
		{
			self.health = 2400;
			self.max_health = 2400;
			break;
		}
		case 3:
		{
			self.health = 2200;
			self.max_health = 2200;
			break;
		}
		case 4:
		{
			self.health = 2000;
			self.max_health = 2000;
			break;
		}
	}
	self.var_aa4b496 = 0;
	self.var_792df3e7 = 0;
	self val::set("defend", "takedamage", 1);
	self thread function_51779021(instance, 3, 10);
	instance.n_damage_1 = 0;
	instance.n_damage_2 = 0;
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"damage");
		if(isdefined(s_result.attacker) && isplayer(s_result.attacker))
		{
			if(isdefined(s_result.amount))
			{
				self.health = self.health + s_result.amount;
			}
		}
		else if(!isplayer(s_result.attacker))
		{
			if(!self.var_792df3e7)
			{
				self.var_792df3e7 = 1;
				instance notify(#"hash_295695008869aed5");
			}
			if(!self.var_aa4b496)
			{
				self thread function_43a1096c();
			}
			self clientfield::increment("" + #"hash_18bcf106c476dfeb");
			if(s_result.part_name === "tag_screens_01_d0")
			{
				instance.n_damage_1++;
				if(instance.n_damage_1 >= 3)
				{
					instance notify(#"damage_1");
				}
			}
			else if(s_result.part_name === "tag_screens_02_d0" || s_result.part_name === "tag_tech_d0")
			{
				instance.n_damage_2++;
				if(instance.n_damage_2 >= 3)
				{
					instance notify(#"damage_2");
				}
			}
		}
		if(self.health <= 0)
		{
			break;
		}
	}
	self clientfield::set("" + #"hash_5244004f911badae", 0);
	objective_manager::objective_ended(instance, 0);
}

/*
	Name: function_43a1096c
	Namespace: namespace_bff7ce85
	Checksum: 0x423E9A18
	Offset: 0x5898
	Size: 0x13E
	Parameters: 0
	Flags: Linked
*/
function function_43a1096c()
{
	self endon(#"death");
	self.var_aa4b496 = 1;
	for(n_count = 0; n_count < 16; n_count++)
	{
		if(isdefined(self.n_objective_id) && isdefined(self.var_c54337b2))
		{
			objective_setinvisibletoall(self.n_objective_id);
			objective_setvisibletoall(self.var_c54337b2);
		}
		wait(0.25);
		if(isdefined(self.n_objective_id) && isdefined(self.var_c54337b2))
		{
			objective_setvisibletoall(self.n_objective_id);
			objective_setinvisibletoall(self.var_c54337b2);
		}
		wait(0.25);
	}
	if(isdefined(self.n_objective_id) && isdefined(self.var_c54337b2))
	{
		objective_setvisibletoall(self.n_objective_id);
		objective_setinvisibletoall(self.var_c54337b2);
	}
	self.var_aa4b496 = 0;
}

/*
	Name: function_51779021
	Namespace: namespace_bff7ce85
	Checksum: 0x13201CF
	Offset: 0x59E0
	Size: 0x166
	Parameters: 3
	Flags: Linked
*/
function function_51779021(instance, var_63e8f3af, var_321cde74)
{
	if(!isdefined(var_63e8f3af))
	{
		var_63e8f3af = 3;
	}
	if(!isdefined(var_321cde74))
	{
		var_321cde74 = 10;
	}
	instance endon(#"objective_ended");
	self endon(#"death");
	var_3057025e = 0;
	var_1a944fca = gettime();
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"damage");
		if(self.health <= 0)
		{
			break;
		}
		if(isai(s_result.attacker))
		{
			var_c4bac09b = gettime() - var_1a944fca;
			if(float(var_c4bac09b) / 1000 < var_63e8f3af)
			{
				var_3057025e = var_3057025e + var_c4bac09b;
			}
			else
			{
				var_3057025e = 0;
			}
			if((float(var_3057025e) / 1000) >= var_321cde74)
			{
				var_3057025e = 0;
			}
			var_1a944fca = gettime();
		}
	}
}

/*
	Name: function_80ba1bc8
	Namespace: namespace_bff7ce85
	Checksum: 0x1D718C75
	Offset: 0x5B50
	Size: 0x230
	Parameters: 2
	Flags: Linked
*/
function function_80ba1bc8(instance, n_objective_id)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	n_start_health = self.health;
	var_359ac97a = 0;
	objective_manager::function_91574ec1(level.progress_bar, undefined, undefined, undefined, "timer_stop", 1);
	var_8da3e170 = self.health / n_start_health;
	objective_setprogress(n_objective_id, var_8da3e170);
	objective_manager::function_5d1c184(var_8da3e170);
	while(true)
	{
		var_c3a3ae13 = self.health / n_start_health;
		if(var_c3a3ae13 >= 0 && var_8da3e170 != var_c3a3ae13)
		{
			var_8da3e170 = var_c3a3ae13;
			objective_manager::function_5d1c184(var_c3a3ae13);
		}
		if(var_c3a3ae13 <= 0.66 && var_c3a3ae13 > 0.33)
		{
			if(!self clientfield::get("" + #"hash_186c35405f4624bc"))
			{
				self clientfield::set("" + #"hash_186c35405f4624bc", 1);
			}
		}
		else if(var_c3a3ae13 <= 0.33)
		{
			if((self clientfield::get("" + #"hash_186c35405f4624bc")) == 1)
			{
				self clientfield::set("" + #"hash_186c35405f4624bc", 2);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_c10cfcb5
	Namespace: namespace_bff7ce85
	Checksum: 0x97A5AD19
	Offset: 0x5D88
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function function_c10cfcb5()
{
	wait(2);
	a_ai_zombies = getentarray("defend_zombie", "targetname");
	foreach(ai_zombie in a_ai_zombies)
	{
		ai_zombie thread cleanup_zombie();
	}
}

/*
	Name: cleanup_zombie
	Namespace: namespace_bff7ce85
	Checksum: 0x950FC806
	Offset: 0x5E48
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function cleanup_zombie()
{
	self endon(#"death");
	while(true)
	{
		wait(0.1);
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(distance2dsquared(self.origin, player.origin) <= sqr(1000))
			{
				continue;
			}
		}
		break;
	}
	wait(randomfloatrange(0.1, 0.5));
	self.allowdeath = 1;
	self kill(undefined, undefined, undefined, undefined, 0, 1);
}

/*
	Name: clear_vehicles
	Namespace: namespace_bff7ce85
	Checksum: 0xA4B1FFE2
	Offset: 0x5FA8
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function clear_vehicles(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	var_453e0a89 = getvehiclearray();
	var_453e0a89 = array::get_all_closest(self.origin, var_453e0a89);
	for(i = 0; i < var_453e0a89.size; i++)
	{
		if(distance2dsquared(self.origin, var_453e0a89[i].origin) <= sqr(180))
		{
			var_453e0a89[i] thread player_vehicle::is_staircase_up();
			var_453e0a89[i] thread function_81d3631c(self);
			wait(0.1);
		}
	}
	self thread function_ab97e04b(instance, var_453e0a89);
}

/*
	Name: function_ab97e04b
	Namespace: namespace_bff7ce85
	Checksum: 0xD7514B10
	Offset: 0x60E0
	Size: 0x15C
	Parameters: 2
	Flags: Linked
*/
function function_ab97e04b(instance, var_453e0a89)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	while(true)
	{
		foreach(vehicle in var_453e0a89)
		{
			if(isdefined(vehicle) && distance2dsquared(self.origin, vehicle.origin) <= sqr(800))
			{
				if(!is_true(vehicle.abnormal_status.emped))
				{
					vehicle thread player_vehicle::is_staircase_up();
					vehicle thread function_81d3631c(self);
				}
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_81d3631c
	Namespace: namespace_bff7ce85
	Checksum: 0x469A1CED
	Offset: 0x6248
	Size: 0x18C
	Parameters: 1
	Flags: Linked
*/
function function_81d3631c(var_4a416ea9)
{
	self endon(#"death");
	self val::set("vehicle_teleport", "takedamage", 0);
	wait(2.5);
	while(true)
	{
		a_riders = self getvehoccupants();
		if(!isdefined(a_riders) || a_riders.size === 0)
		{
			self makevehicleunusable();
			break;
		}
		wait(0.1);
	}
	wait(1);
	var_4a416ea9 playrumbleonentity("sr_transmitter_clear");
	if(isdefined(self))
	{
		self clientfield::increment("" + #"vehicle_teleport");
		wait(1.9);
		if(isdefined(self.v_org))
		{
			self.origin = self.v_org;
			self makevehicleusable();
			self thread function_1fe3eb34();
		}
		if(isdefined(self.v_ang))
		{
			self.angles = self.v_ang;
		}
		else
		{
			self delete();
		}
	}
}

/*
	Name: function_1fe3eb34
	Namespace: namespace_bff7ce85
	Checksum: 0x31FF4A2F
	Offset: 0x63E0
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function function_1fe3eb34()
{
	self endon(#"death");
	while(true)
	{
		if(!self.abnormal_status.emped)
		{
			self vehicle::function_bbc1d940(0);
		}
		wait(0.1);
	}
}

/*
	Name: function_58ec23ca
	Namespace: namespace_bff7ce85
	Checksum: 0xE4D1B62
	Offset: 0x6440
	Size: 0x264
	Parameters: 2
	Flags: None
*/
function function_58ec23ca(instance, defend_object)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	var_dbe41436 = 50;
	current_damage = 0;
	var_9543c27c = self.health;
	var_dbe41436 = 40;
	current_target = 0;
	self.time_to_wait = 0;
	self thread function_df9979de(instance);
	self.var_cdf71d99 = 0;
	while(true)
	{
		if(current_target == 1)
		{
			current_time = gettime();
			if(isdefined(defend_object))
			{
				if(current_time > self.time_to_wait || distance(defend_object.origin, self.origin) > 2500)
				{
					if(distance(defend_object.origin, self.origin) > 2500)
					{
						self.var_cdf71d99 = gettime() + 8000;
					}
					else
					{
						self.var_cdf71d99 = gettime() + 3000;
					}
					self.var_ff290a61 = undefined;
					self.attackable = defend_object;
					current_target = 0;
				}
			}
		}
		else if(current_target == 0)
		{
			if(isdefined(self.var_cdf71d99) && self.var_cdf71d99 < gettime())
			{
				current_damage = var_9543c27c - self.health;
				if(current_damage > var_dbe41436)
				{
					if(isdefined(self.attacker) && isplayer(self.attacker))
					{
						if(isalive(self.attacker))
						{
							if(distance(self.attacker.origin, self.origin) < 2500)
							{
								self.var_ff290a61 = self.attacker;
								current_target = 1;
							}
						}
					}
					current_damage = 0;
					var_9543c27c = self.health;
				}
			}
		}
		wait(1);
	}
}

/*
	Name: function_df9979de
	Namespace: namespace_bff7ce85
	Checksum: 0x2BCE2DF1
	Offset: 0x66B0
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private function_df9979de(instance)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		self.time_to_wait = gettime() + 8000;
	}
}

