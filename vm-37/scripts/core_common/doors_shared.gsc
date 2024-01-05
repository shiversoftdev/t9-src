#using script_6423505476898f6d;
#using script_7cc5fb39b97494c4;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

class cdoor 
{
	var m_e_door;
	var var_a2f96f78;
	var m_str_type;
	var var_9bc2acd6;
	var var_c4c3fa39;
	var var_22fae777;
	var var_d1c4f848;
	var m_s_bundle;
	var angles;
	var v_trigger_offset;
	var origin;
	var m_e_trigger;
	var var_9b9642be;
	var m_v_close_pos;
	var var_19fde5b7;
	var var_fb8a6fcc;
	var var_e1a5a27e;
	var var_ca91d615;
	var var_15695d13;
	var var_32c4021e;
	var var_85f2454d;
	var var_e1477b7c;
	var var_7d28591d;
	var var_81f24576;
	var var_d587661f;
	var var_7c9174d1;
	var m_n_trigger_height;
	var m_v_open_pos;
	var var_3c6838bc;
	var flag;
	var var_4882ff02;

	/*
		Name: constructor
		Namespace: cdoor
		Checksum: 0xB16E9A29
		Offset: 0x5A8
		Size: 0x5E
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
		self.m_n_trigger_height = 80;
		self.m_door_open_delay_time = 0;
		self.var_9b9642be = undefined;
		self.m_str_type = "door";
		self.var_fb8a6fcc = [];
		self.var_e1a5a27e = [];
		self.var_7d28591d = 0;
	}

	/*
		Name: destructor
		Namespace: cdoor
		Checksum: 0x6D136121
		Offset: 0x610
		Size: 0x2C
		Parameters: 0
		Flags: 16
	*/
	destructor()
	{
		if(isdefined(m_e_trigger))
		{
			m_e_trigger delete();
		}
	}

	/*
		Name: function_3e0853d
		Namespace: cdoor
		Checksum: 0x692A051
		Offset: 0x1A80
		Size: 0xE4
		Parameters: 2
		Flags: None
	*/
	function function_3e0853d(v_angle, var_1b13d203)
	{
		physicsexplosionsphere(m_e_door.origin, 64, 0, 0);
		m_e_door setforcenocull();
		m_e_door rotateto(v_angle, var_1b13d203, var_1b13d203 * 0.1, var_1b13d203 * 0.3);
		m_e_door waittill(#"rotatedone");
		m_e_door removeforcenocull();
		physicsexplosionsphere(m_e_door.origin, 64, 0, 0);
	}

	/*
		Name: set_script_flags
		Namespace: cdoor
		Checksum: 0xD9E7F82
		Offset: 0x4B80
		Size: 0x100
		Parameters: 1
		Flags: None
	*/
	function set_script_flags(b_set)
	{
		if(isdefined(var_a2f96f78.script_flag))
		{
			a_flags = strtok(var_a2f96f78.script_flag, ",");
			foreach(str_flag in a_flags)
			{
				if(b_set)
				{
					level flag::set(str_flag);
					continue;
				}
				level flag::clear(str_flag);
			}
		}
	}

	/*
		Name: open
		Namespace: cdoor
		Checksum: 0xCBCF3848
		Offset: 0x1190
		Size: 0x1A0
		Parameters: 1
		Flags: None
	*/
	function open(opener)
	{
		if(m_str_type === "breach" && !is_true(var_9bc2acd6))
		{
			self notify(#"hash_722c5466076f75cf");
			self.var_9bc2acd6 = 1;
		}
		else
		{
			set_player_who_opened(opener);
			if(self flag::get("open") && self flag::get("door_pushable") && is_true(var_c4c3fa39))
			{
				self namespace_64f6ea7a::push_door(var_22fae777, 1);
			}
			else
			{
				self flag::set("open");
			}
		}
		if(isdefined(var_d1c4f848) && var_d1c4f848.c_door flag::get("open") == 0)
		{
			var_d1c4f848.c_door.var_c4c3fa39 = var_c4c3fa39;
			thread [[ var_d1c4f848.c_door ]]->open(opener);
		}
	}

	/*
		Name: function_145675ba
		Namespace: cdoor
		Checksum: 0x90DEDFB2
		Offset: 0x4138
		Size: 0x54
		Parameters: 4
		Flags: None
	*/
	function function_145675ba(e_player, str_anim, var_f40ac45d, n_start_time)
	{
		e_player thread animation::play(str_anim, e_player, undefined, var_f40ac45d, 0.2, 0, 0, n_start_time);
	}

	/*
		Name: update_use_message
		Namespace: cdoor
		Checksum: 0x48B8D81B
		Offset: 0x3C98
		Size: 0x14C
		Parameters: 0
		Flags: None
	*/
	function update_use_message()
	{
		var_5bc6eed = self function_a5fa0850();
		if(!isdefined(var_5bc6eed))
		{
			return;
		}
		if(!is_true(m_s_bundle.door_use_trigger))
		{
			return;
		}
		if(self doors::function_19b91fc1())
		{
			if(self flag::get("locked"))
			{
				if(isdefined(m_e_door.mdl_gameobject.objectiveid))
				{
					m_e_door.mdl_gameobject gameobjects::disable_object(1);
				}
			}
			else if(!isdefined(m_e_door.mdl_gameobject.objectiveid))
			{
				m_e_door.mdl_gameobject gameobjects::enable_object(1);
			}
			return;
		}
		if(m_e_door doors::function_82f0f91b())
		{
			self thread doors::function_191c5a63();
		}
	}

	/*
		Name: init_player_spawns
		Namespace: cdoor
		Checksum: 0xDCC49153
		Offset: 0x5000
		Size: 0xC6
		Parameters: 0
		Flags: None
	*/
	function init_player_spawns()
	{
		if(isdefined(var_a2f96f78.targetname))
		{
			a_structs = struct::get_array(var_a2f96f78.targetname, "target");
			foreach(struct in a_structs)
			{
				struct.c_door = self;
			}
		}
	}

	/*
		Name: function_323b4378
		Namespace: cdoor
		Checksum: 0xF6B9AB88
		Offset: 0x45F0
		Size: 0xD6
		Parameters: 0
		Flags: None
	*/
	function function_323b4378()
	{
		level flag::wait_till("radiant_gameobjects_initialized");
		m_e_door.func_custom_gameobject_position = &function_4fe7d9d5;
		m_e_door.v_trigger_offset = m_s_bundle.v_trigger_offset;
		m_e_door gameobjects::init_game_objects(m_s_bundle.door_interact);
		m_e_door.mdl_gameobject.t_interact usetriggerrequirelookat();
		m_e_door.mdl_gameobject.trigger.c_door = self;
	}

	/*
		Name: function_4fe7d9d5
		Namespace: cdoor
		Checksum: 0xE598998F
		Offset: 0x4020
		Size: 0x10A
		Parameters: 0
		Flags: None
	*/
	function function_4fe7d9d5()
	{
		v_angles = angles;
		v_offset = v_trigger_offset;
		v_pos = origin;
		if(isdefined(v_offset))
		{
			if(v_offset[0])
			{
				v_side = anglestoforward(v_angles);
				v_pos = v_pos + (v_offset[0] * v_side);
			}
			if(v_offset[1])
			{
				v_dir = anglestoright(v_angles);
				v_pos = v_pos + (v_offset[1] * v_dir);
			}
			if(v_offset[2])
			{
				v_up = anglestoup(v_angles);
				v_pos = v_pos + (v_offset[2] * v_up);
			}
		}
		return v_pos;
	}

	/*
		Name: function_54605e70
		Namespace: cdoor
		Checksum: 0xAD10369F
		Offset: 0x4440
		Size: 0x1A6
		Parameters: 0
		Flags: None
	*/
	function function_54605e70()
	{
		m_e_trigger endon(#"death");
		while(true)
		{
			m_e_door waittill(#"damage");
			if(!is_open() && !self flag::get("animating"))
			{
				open(undefined);
				flag::wait_till_clear("animating");
				if(is_true(m_s_bundle.var_6270dafc))
				{
					wait((isdefined(m_s_bundle.var_be86269a) ? m_s_bundle.var_be86269a : 0));
					if(isdefined(var_9b9642be))
					{
						var_ceedbc10 = m_e_trigger.maxs[0] * m_e_trigger.maxs[0];
						while(isdefined(var_9b9642be) && var_9b9642be istouching(m_e_trigger))
						{
							waitframe(1);
						}
						close();
					}
					else
					{
						close();
					}
				}
			}
			waitframe(1);
		}
	}

	/*
		Name: run_lock_fx
		Namespace: cdoor
		Checksum: 0x4021AAA1
		Offset: 0x3DF0
		Size: 0x228
		Parameters: 0
		Flags: None
	*/
	function run_lock_fx()
	{
		if(!isdefined(m_s_bundle.door_locked_fx) && !isdefined(m_s_bundle.door_unlocked_fx))
		{
			return;
		}
		e_fx = undefined;
		v_pos = get_hack_pos();
		v_angles = get_hack_angles();
		while(true)
		{
			self flag::wait_till("locked");
			if(isdefined(e_fx))
			{
				e_fx delete();
				e_fx = undefined;
			}
			if(isdefined(m_s_bundle.door_locked_fx))
			{
				e_fx = spawn("script_model", v_pos);
				e_fx setmodel(#"tag_origin");
				e_fx.angles = v_angles;
				playfxontag(m_s_bundle.door_locked_fx, e_fx, "tag_origin");
			}
			self flag::wait_till_clear("locked");
			if(isdefined(e_fx))
			{
				e_fx delete();
				e_fx = undefined;
			}
			if(isdefined(m_s_bundle.door_unlocked_fx))
			{
				e_fx = spawn("script_model", v_pos);
				e_fx setmodel(#"tag_origin");
				e_fx.angles = v_angles;
				playfxontag(m_s_bundle.door_unlocked_fx, e_fx, "tag_origin");
			}
		}
	}

	/*
		Name: close
		Namespace: cdoor
		Checksum: 0x7E58590D
		Offset: 0x26D0
		Size: 0x88
		Parameters: 0
		Flags: None
	*/
	function close()
	{
		self.var_14439ba5 = undefined;
		self flag::clear("open");
		if(isdefined(var_d1c4f848) && var_d1c4f848.c_door flag::get("open") == 1)
		{
			thread [[ var_d1c4f848.c_door ]]->close();
		}
	}

	/*
		Name: function_5abbe871
		Namespace: cdoor
		Checksum: 0xFB2D5842
		Offset: 0x1B70
		Size: 0xE4
		Parameters: 2
		Flags: None
	*/
	function function_5abbe871(var_ce02fcb7, var_1b13d203)
	{
		physicsexplosionsphere(m_e_door.origin, 64, 0, 0);
		m_e_door setforcenocull();
		m_e_door moveto(var_ce02fcb7, var_1b13d203, var_1b13d203 * 0.1, var_1b13d203 * 0.3);
		m_e_door waittill(#"movedone");
		m_e_door removeforcenocull();
		physicsexplosionsphere(m_e_door.origin, 64, 0, 0);
	}

	/*
		Name: function_61c13b93
		Namespace: cdoor
		Checksum: 0x2B6E1711
		Offset: 0x648
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_61c13b93()
	{
		return m_v_close_pos;
	}

	/*
		Name: function_61d3d3da
		Namespace: cdoor
		Checksum: 0xC5A060F4
		Offset: 0x2DB8
		Size: 0x1B2
		Parameters: 1
		Flags: None
	*/
	function function_61d3d3da(opener)
	{
		var_cd167873 = 1;
		if(sessionmodeiscampaigngame())
		{
			if(!isdefined(opener))
			{
				opener = getplayers()[0];
			}
		}
		if(isdefined(opener))
		{
			v_player_forward = undefined;
			if(isactor(opener))
			{
				v_velocity = opener getvelocity();
				v_velocity = (v_velocity[0], v_velocity[1], 0);
				if(length2dsquared(v_velocity) == 0)
				{
					v_player_forward = anglestoforward(opener.angles);
				}
				else
				{
					v_player_forward = vectornormalize(v_velocity);
				}
			}
			else
			{
				v_player_angles = opener getplayerangles();
				v_player_forward = anglestoforward((0, v_player_angles[1], 0));
			}
			var_7a69da4c = anglestoforward(m_e_door.angles);
			var_fb8f4ca = self doors::function_fb354714();
			var_cd167873 = vectordot(var_fb8f4ca, v_player_forward);
		}
		return var_cd167873;
	}

	/*
		Name: function_64c97cc9
		Namespace: cdoor
		Checksum: 0x82C32579
		Offset: 0x1560
		Size: 0x1B0
		Parameters: 2
		Flags: None
	*/
	function function_64c97cc9(var_79579129, var_b64ae7bb)
	{
		if(isdefined(var_b64ae7bb))
		{
			if(var_b64ae7bb)
			{
				self.var_d587661f = undefined;
			}
			else
			{
				self.var_d587661f = 1;
			}
		}
		if(isdefined(m_e_door.var_645eee83))
		{
			if(is_true(var_79579129))
			{
				[[ m_e_door.var_645eee83 ]]->enable();
			}
			else
			{
				[[ m_e_door.var_645eee83 ]]->disable();
			}
		}
		if(sessionmodeiscampaigngame() && isdefined(level.var_6a7fb742))
		{
			return true;
		}
		var_5bc6eed = self function_a5fa0850();
		if(!isdefined(var_5bc6eed))
		{
			return false;
		}
		if(isdefined(var_79579129))
		{
			if(var_79579129)
			{
				var_5bc6eed makeusable();
				if(var_5bc6eed getentitytype() == 20)
				{
					var_5bc6eed triggerenable(1);
				}
			}
			else
			{
				var_5bc6eed makeunusable();
				if(var_5bc6eed getentitytype() == 20)
				{
					var_5bc6eed triggerenable(0);
				}
			}
		}
		return true;
	}

	/*
		Name: function_670cd4a3
		Namespace: cdoor
		Checksum: 0x238C6DBA
		Offset: 0x56E0
		Size: 0x80
		Parameters: 0
		Flags: None
	*/
	function function_670cd4a3()
	{
		self endon(#"death");
		self.var_19fde5b7 = [];
		while(true)
		{
			waitresult = undefined;
			waitresult = self waittill(#"grenade_stuck");
			if(isdefined(waitresult.projectile))
			{
				array::add(var_19fde5b7, waitresult.projectile);
			}
		}
	}

	/*
		Name: open_internal
		Namespace: cdoor
		Checksum: 0xB7483453
		Offset: 0x2F78
		Size: 0xD14
		Parameters: 2
		Flags: None
	*/
	function open_internal(b_malfunction, var_8e2567b1)
	{
		if(!isdefined(b_malfunction))
		{
			b_malfunction = 0;
		}
		var_f10e2163 = 0;
		if(m_e_door scene::function_c935c42())
		{
			[[ m_e_door._scene_object ]]->stop();
		}
		m_e_door unlink();
		var_1b13d203 = (isdefined(var_8e2567b1) ? var_8e2567b1 : m_s_bundle.door_open_time);
		if(is_true(var_c4c3fa39))
		{
			var_1b13d203 = m_s_bundle.var_f275e953;
		}
		else if(!b_malfunction && !isdefined(var_8e2567b1) && self namespace_64f6ea7a::function_9d109db6(1))
		{
			var_f10e2163 = 1;
			var_1b13d203 = namespace_64f6ea7a::function_cecca69c();
		}
		var_1b13d203 = float(var_1b13d203);
		self flag::set("animating");
		if(isdefined(var_a2f96f78.groupname))
		{
			a_door_structs = struct::get_array(var_a2f96f78.groupname, "groupname");
			foreach(s_door_struct in a_door_structs)
			{
				b_animating = s_door_struct.c_door flag::get("animating");
				if(s_door_struct.c_door.m_e_door != m_e_door)
				{
					if(!([[ s_door_struct.c_door ]]->is_open()) && !b_animating)
					{
						s_door_struct.c_door.var_9b9642be = var_9b9642be;
						[[ s_door_struct.c_door ]]->open(var_9b9642be);
					}
				}
			}
		}
		m_e_door notify(#"door_opening");
		update_use_message();
		if(var_f10e2163)
		{
			[[ self ]]->function_f657b618(0);
		}
		if(isdefined(var_9b9642be))
		{
			var_9b9642be notify(#"hash_7a96e443b93cd211");
		}
		m_e_door function_e0954c11();
		self function_d1e7faca(0);
		var_478039b9 = is_true(var_c4c3fa39) && isdefined(m_s_bundle.var_cebf7d8f);
		if(var_478039b9)
		{
			m_e_door playsound(m_s_bundle.var_cebf7d8f);
		}
		else
		{
			if(isdefined(m_s_bundle.door_start_sound) && m_s_bundle.door_start_sound != "")
			{
				m_e_door playsound(m_s_bundle.door_start_sound);
			}
			if(is_true(m_s_bundle.b_loop_sound))
			{
				sndent = spawn("script_origin", m_e_door.origin);
				sndent linkto(m_e_door);
				sndent playloopsound(m_s_bundle.door_loop_sound, 1);
			}
		}
		if(m_s_bundle.door_open_method == "slide")
		{
			if(!b_malfunction)
			{
				function_e4659543(1);
			}
			var_7256682e = function_f1a2a15f(b_malfunction, 1);
			m_e_door setforcenocull();
			m_e_door moveto(var_7256682e, var_1b13d203);
			m_e_door waittill(#"movedone");
			m_e_door removeforcenocull();
		}
		else
		{
			if(m_s_bundle.door_open_method == "swing_away_from_player")
			{
				self.var_32c4021e = 0;
				if(!isdefined(var_9b9642be))
				{
					if(isdefined(var_a2f96f78.groupname))
					{
						a_door_structs = struct::get_array(var_a2f96f78.groupname, "groupname");
						foreach(s_door_struct in a_door_structs)
						{
							if(s_door_struct.c_door.m_e_door != m_e_door)
							{
								if(isdefined(s_door_struct.c_door.var_9b9642be))
								{
									self.var_9b9642be = s_door_struct.c_door.var_9b9642be;
									break;
								}
							}
						}
					}
				}
				var_cd167873 = function_61d3d3da(var_9b9642be);
				var_b7e6de19 = undefined;
				if(var_f10e2163)
				{
					var_b7e6de19 = namespace_64f6ea7a::function_1bf7f7e5();
				}
				if(var_cd167873 > 0)
				{
					v_angle = function_d36318ad(b_malfunction, 1, 0, m_s_bundle.var_16a4e229, m_s_bundle.var_16e3e29b, var_b7e6de19);
					m_e_door setforcenocull();
					m_e_door rotateto(v_angle, var_1b13d203, var_1b13d203 * 0.1, var_1b13d203 * 0.3);
					m_e_door waittill(#"rotatedone");
					m_e_door removeforcenocull();
				}
				else
				{
					self.var_32c4021e = 1;
					v_angle = function_d36318ad(b_malfunction, 1, 1, m_s_bundle.var_16a4e229, m_s_bundle.var_16e3e29b, var_b7e6de19);
					m_e_door setforcenocull();
					m_e_door rotateto(v_angle, var_1b13d203, var_1b13d203 * 0.1, var_1b13d203 * 0.3);
					m_e_door waittill(#"rotatedone");
					m_e_door removeforcenocull();
				}
			}
			else
			{
				if(m_s_bundle.door_open_method == "swing")
				{
					var_b7e6de19 = undefined;
					if(var_f10e2163)
					{
						var_b7e6de19 = namespace_64f6ea7a::function_1bf7f7e5();
					}
					v_angle = function_d36318ad(b_malfunction, 1, 0, m_s_bundle.var_16a4e229, m_s_bundle.var_16e3e29b, var_b7e6de19);
					m_e_door setforcenocull();
					m_e_door rotateto(v_angle, var_1b13d203, var_1b13d203 * 0.1, var_1b13d203 * 0.3);
					m_e_door waittill(#"rotatedone");
					m_e_door removeforcenocull();
				}
				else if(m_s_bundle.door_open_method == "animated")
				{
					var_cd167873 = 1;
					self.var_32c4021e = 0;
					if(isdefined(m_s_bundle.var_f6f170))
					{
						var_cd167873 = function_61d3d3da(var_9b9642be);
					}
					var_3463e288 = undefined;
					if(var_cd167873 > 0)
					{
						if(is_true(var_c4c3fa39) && isdefined(m_s_bundle.var_3408d820))
						{
							var_3463e288 = m_s_bundle.var_3408d820;
						}
						else
						{
							var_3463e288 = m_s_bundle.door_animated_open_bundle;
						}
					}
					else
					{
						if(is_true(var_c4c3fa39) && isdefined(m_s_bundle.var_f1c36c8b))
						{
							var_3463e288 = m_s_bundle.var_f1c36c8b;
						}
						else
						{
							var_3463e288 = m_s_bundle.var_f6f170;
						}
						if(isdefined(var_3463e288))
						{
							self.var_32c4021e = 1;
						}
					}
					if(isdefined(var_3463e288))
					{
						if(scene::get_player_count(var_3463e288) > 0)
						{
							m_e_door scene::play(var_3463e288, array(m_e_door, var_9b9642be));
						}
						else
						{
							m_e_door scene::play(var_3463e288, m_e_door);
						}
					}
				}
			}
		}
		m_e_door notify(#"door_opened");
		if(!var_478039b9)
		{
			if(is_true(m_s_bundle.b_loop_sound))
			{
				sndent deletedelay();
			}
		}
		if(var_f10e2163)
		{
			self flag::set("door_pushable");
		}
		else
		{
			self flag::set("door_fully_open");
			self flag::set("door_second_interact");
			self function_f584b243(1);
			var_da3e0b97 = isdefined(var_9b9642be) && isplayer(var_9b9642be);
			self thread namespace_64f6ea7a::suspicious_door_stealth_check(var_da3e0b97);
			if(self namespace_64f6ea7a::function_9d109db6())
			{
				self flag::set("door_pushable");
			}
		}
		self flag::clear("animating");
		set_script_flags(1);
		function_7d2c33c4(1);
		update_use_message();
	}

	/*
		Name: function_7d2c33c4
		Namespace: cdoor
		Checksum: 0x6FBF0235
		Offset: 0x1848
		Size: 0x230
		Parameters: 1
		Flags: None
	*/
	function function_7d2c33c4(b_opened)
	{
		if(!isdefined(b_opened))
		{
			b_opened = 1;
		}
		if(b_opened)
		{
			foreach(node in var_fb8a6fcc)
			{
				setenablenode(node, 1);
			}
			foreach(node in var_e1a5a27e)
			{
				setenablenode(node, 0);
			}
		}
		else
		{
			foreach(node in var_fb8a6fcc)
			{
				setenablenode(node, 0);
			}
			foreach(node in var_e1a5a27e)
			{
				setenablenode(node, 1);
			}
		}
	}

	/*
		Name: function_830dc907
		Namespace: cdoor
		Checksum: 0x18006989
		Offset: 0x42E8
		Size: 0x14C
		Parameters: 1
		Flags: None
	*/
	function function_830dc907(e_player)
	{
		if(isdefined(m_s_bundle.var_a22b716))
		{
			var_f40ac45d = float((isdefined(m_s_bundle.var_bbbdcca7) ? m_s_bundle.var_bbbdcca7 : 0));
			var_3488a701 = float((isdefined(m_s_bundle.var_52b6e5e9) ? m_s_bundle.var_52b6e5e9 : 0));
			thread function_145675ba(e_player, m_s_bundle.var_a22b716, var_f40ac45d, var_3488a701);
		}
		else
		{
			gesture = "ges_drophand";
			if(isdefined(m_s_bundle.var_3fbbd06c))
			{
				gesture = m_s_bundle.var_3fbbd06c;
			}
			e_player thread doors::player_door_gesture(gesture);
		}
		m_e_door notify(#"hash_7166c13e79b73f9");
	}

	/*
		Name: set_door_paths
		Namespace: cdoor
		Checksum: 0x5DAFD9A6
		Offset: 0x50D0
		Size: 0x1A
		Parameters: 1
		Flags: None
	*/
	function set_door_paths(n_door_connect_paths)
	{
		self.m_n_door_connect_paths = n_door_connect_paths;
	}

	/*
		Name: function_85fe0c35
		Namespace: cdoor
		Checksum: 0x6B05482
		Offset: 0x51F8
		Size: 0x102
		Parameters: 2
		Flags: None
	*/
	function function_85fe0c35(b_reverse, var_e9da1d4e)
	{
		if(!isdefined(var_e9da1d4e))
		{
			var_e9da1d4e = 0;
		}
		if(var_e9da1d4e)
		{
			if(b_reverse)
			{
				return m_s_bundle.var_f2943dab * -1;
			}
			return m_s_bundle.var_f2943dab;
		}
		if(isdefined(var_ca91d615) && b_reverse)
		{
			return var_ca91d615;
		}
		if(isdefined(var_15695d13) && !b_reverse)
		{
			return var_15695d13;
		}
		if(b_reverse)
		{
			if(m_s_bundle.door_open_method == "swing_away_from_player")
			{
				return m_s_bundle.door_swing_angle * -1;
			}
			return 0;
		}
		return m_s_bundle.door_swing_angle;
	}

	/*
		Name: close_internal
		Namespace: cdoor
		Checksum: 0x160C7399
		Offset: 0x1C60
		Size: 0x850
		Parameters: 2
		Flags: None
	*/
	function close_internal(b_malfunction, var_8e2567b1)
	{
		if(!isdefined(b_malfunction))
		{
			b_malfunction = 0;
		}
		if(m_e_door scene::function_c935c42())
		{
			[[ m_e_door._scene_object ]]->stop();
		}
		m_e_door unlink();
		if(self flag::get("door_fully_closed"))
		{
			return;
		}
		self flag::clear("open");
		self flag::clear("door_fully_open");
		self flag::clear("door_pushable");
		self flag::clear("door_second_interact");
		self notify(#"hash_6162e3d94ad294c7");
		if(isdefined(var_a2f96f78.groupname))
		{
			a_door_structs = struct::get_array(var_a2f96f78.groupname, "groupname");
			foreach(s_door_struct in a_door_structs)
			{
				b_animating = s_door_struct.c_door flag::get("animating");
				if(s_door_struct.c_door.m_e_door != m_e_door)
				{
					if([[ s_door_struct.c_door ]]->is_open() && !b_animating)
					{
						[[ s_door_struct.c_door ]]->close();
					}
				}
			}
		}
		var_1b13d203 = float((isdefined(var_8e2567b1) ? var_8e2567b1 : m_s_bundle.door_open_time));
		set_script_flags(0);
		self flag::set("animating");
		m_e_door notify(#"door_closing");
		self thread function_cbbcc8ab();
		update_use_message();
		if(is_true(m_s_bundle.b_loop_sound))
		{
			m_e_door playsound(m_s_bundle.door_start_sound);
			sndent = spawn("script_origin", m_e_door.origin);
			sndent linkto(m_e_door);
			sndent playloopsound(m_s_bundle.door_loop_sound, 1);
		}
		else if(isdefined(m_s_bundle.door_stop_sound) && m_s_bundle.door_stop_sound != "")
		{
			m_e_door playsound(m_s_bundle.door_stop_sound);
		}
		if(m_s_bundle.door_open_method == "slide")
		{
			if(!b_malfunction)
			{
				function_e4659543(0);
			}
			var_ce02fcb7 = function_f1a2a15f(b_malfunction, 0);
			function_5abbe871(var_ce02fcb7, var_1b13d203);
		}
		else
		{
			if(m_s_bundle.door_open_method == "swing_away_from_player")
			{
				v_angle = function_d36318ad(b_malfunction, 0, 0, m_s_bundle.var_16a4e229, m_s_bundle.var_16e3e29b);
				function_3e0853d(v_angle, var_1b13d203);
			}
			else
			{
				if(m_s_bundle.door_open_method == "swing")
				{
					v_angle = function_d36318ad(b_malfunction, 0, 0, m_s_bundle.var_16a4e229, m_s_bundle.var_16e3e29b);
					function_3e0853d(v_angle, var_1b13d203);
				}
				else if(m_s_bundle.door_open_method == "animated")
				{
					var_d70be901 = undefined;
					if(!var_32c4021e)
					{
						var_d70be901 = m_s_bundle.door_animated_close_bundle;
					}
					else
					{
						var_d70be901 = m_s_bundle.var_6a49a5cf;
					}
					if(isdefined(var_d70be901))
					{
						physicsexplosionsphere(m_e_door.origin, 64, 0, 0);
						m_e_door setforcenocull();
						if(scene::get_player_count(var_d70be901) > 0)
						{
							m_e_door notify(#"hash_3803c0c576f1982b", {#player:var_9b9642be});
							m_e_door scene::play(var_d70be901, array(m_e_door, var_9b9642be));
						}
						else
						{
							m_e_door scene::play(var_d70be901, m_e_door);
						}
						m_e_door removeforcenocull();
						physicsexplosionsphere(m_e_door.origin, 64, 0, 0);
					}
				}
			}
		}
		self.var_32c4021e = 0;
		m_e_door notify(#"door_closed");
		self function_d1e7faca(1);
		self.var_c4c3fa39 = 0;
		self function_f584b243(0);
		if(is_true(m_s_bundle.b_loop_sound))
		{
			sndent delete();
			m_e_door playsound(m_s_bundle.door_stop_sound);
		}
		flag::clear("animating");
		function_7d2c33c4(0);
		update_use_message();
		if(self namespace_64f6ea7a::function_9d109db6())
		{
			[[ self ]]->function_f657b618(1);
		}
	}

	/*
		Name: unlock
		Namespace: cdoor
		Checksum: 0xCEA721BD
		Offset: 0xFE0
		Size: 0xBC
		Parameters: 0
		Flags: None
	*/
	function unlock()
	{
		self function_f584b243(0);
		self function_d8ff021f(1);
		self flag::clear("locked");
		update_use_message();
		if(isdefined(var_d1c4f848) && var_d1c4f848.c_door flag::get("locked"))
		{
			thread [[ var_d1c4f848.c_door ]]->unlock();
		}
	}

	/*
		Name: function_a5fa0850
		Namespace: cdoor
		Checksum: 0xA7BAA0A0
		Offset: 0x1718
		Size: 0x96
		Parameters: 0
		Flags: None
	*/
	function function_a5fa0850()
	{
		var_5bc6eed = undefined;
		if(!isdefined(var_5bc6eed) && (isdefined(m_e_door.mdl_gameobject) && isdefined(m_e_door.mdl_gameobject.trigger)))
		{
			var_5bc6eed = m_e_door.mdl_gameobject.trigger;
		}
		if(!isdefined(var_5bc6eed))
		{
			var_5bc6eed = m_e_trigger;
		}
		if(!isdefined(var_5bc6eed))
		{
			var_5bc6eed = m_e_door;
		}
		return var_5bc6eed;
	}

	/*
		Name: set_player_who_opened
		Namespace: cdoor
		Checksum: 0x13311EC7
		Offset: 0x17B8
		Size: 0x1A
		Parameters: 1
		Flags: None
	*/
	function set_player_who_opened(e_player)
	{
		self.var_9b9642be = e_player;
	}

	/*
		Name: lock
		Namespace: cdoor
		Checksum: 0xB4AF3207
		Offset: 0xF18
		Size: 0xC0
		Parameters: 0
		Flags: None
	*/
	function lock()
	{
		self function_f584b243(1);
		self function_d8ff021f(0);
		self flag::set("locked");
		update_use_message();
		if(isdefined(var_d1c4f848) && var_d1c4f848.c_door flag::get("locked") == 0)
		{
			thread [[ var_d1c4f848.c_door ]]->lock();
		}
	}

	/*
		Name: init_door_model
		Namespace: cdoor
		Checksum: 0x3E28B154
		Offset: 0x660
		Size: 0x3B6
		Parameters: 2
		Flags: None
	*/
	function init_door_model(e_or_str_model, s_door_instance)
	{
		if(isentity(e_or_str_model))
		{
			self.m_e_door = e_or_str_model;
		}
		else if(!isdefined(e_or_str_model) && !isdefined(s_door_instance.model))
		{
			e_or_str_model = "tag_origin";
		}
		if(!isdefined(m_e_door))
		{
			self.m_e_door = util::spawn_model(e_or_str_model, s_door_instance.origin, s_door_instance.angles);
			m_e_door.targetname = s_door_instance.targetname;
			m_e_door.var_9e238e15 = s_door_instance.var_9e238e15;
			self function_d1e7faca(1);
		}
		if(is_true(var_a2f96f78.var_7b21ae7d))
		{
			self function_f584b243(1, 2);
		}
		else
		{
			if(is_true(m_s_bundle.door_connect_paths))
			{
				self function_f584b243(0);
			}
			else
			{
				m_e_door function_881077b4(32, 1);
				m_e_door function_df3a1348();
			}
		}
		m_e_door.script_objective = s_door_instance.script_objective;
		self doors::function_7fe6d007(m_s_bundle.model);
		self.var_85f2454d = spawnstruct();
		var_85f2454d.origin = m_e_door.origin;
		var_85f2454d.angles = m_e_door.angles;
		var_85f2454d.var_c4269c41 = self doors::function_eea7cdb4();
		var_85f2454d.doorbottomcenter = self doors::get_door_bottom_center();
		m_e_door thread doors::function_fa74d5cd(self);
		if(isdefined(s_door_instance.linkname))
		{
			self.var_e1477b7c = getentarray(s_door_instance.linkname, "linkto");
			array::run_all(var_e1477b7c, &enablelinkto);
			if(isdefined(s_door_instance.script_tag))
			{
				array::run_all(var_e1477b7c, &linkto, m_e_door, s_door_instance.script_tag);
			}
			else
			{
				array::run_all(var_e1477b7c, &linkto, m_e_door);
			}
		}
		m_e_door.var_4f564337 = 1;
		m_e_door thread function_670cd4a3();
		m_e_door.c_door = self;
	}

	/*
		Name: init_movement
		Namespace: cdoor
		Checksum: 0xF3FC3FF6
		Offset: 0x4F48
		Size: 0xAA
		Parameters: 2
		Flags: None
	*/
	function init_movement(str_slide_dir, n_slide_amount)
	{
		if(m_s_bundle.door_open_method == "slide")
		{
			v_offset = function_e61944fa(str_slide_dir, n_slide_amount);
			self.m_v_open_pos = calculate_offset_position(m_e_door.origin, m_e_door.angles, v_offset);
			self.m_v_close_pos = m_e_door.origin;
		}
	}

	/*
		Name: get_hack_angles
		Namespace: cdoor
		Checksum: 0x2ACFE3D
		Offset: 0xB08
		Size: 0x7C
		Parameters: 0
		Flags: None
	*/
	function get_hack_angles()
	{
		v_angles = m_e_door.angles;
		if(isdefined(var_a2f96f78.target))
		{
			e_target = getent(var_a2f96f78.target, "targetname");
			if(isdefined(e_target))
			{
				return e_target.angles;
			}
		}
		return v_angles;
	}

	/*
		Name: remove_door_trigger
		Namespace: cdoor
		Checksum: 0x67A8FE59
		Offset: 0x1810
		Size: 0x2C
		Parameters: 0
		Flags: None
	*/
	function remove_door_trigger()
	{
		if(isdefined(m_e_trigger))
		{
			m_e_trigger delete();
		}
	}

	/*
		Name: function_cbbcc8ab
		Namespace: cdoor
		Checksum: 0x4BBDF1F4
		Offset: 0x2648
		Size: 0x80
		Parameters: 0
		Flags: None
	*/
	function function_cbbcc8ab()
	{
		self flag::wait_till("door_fully_closed");
		while(isdefined(var_9b9642be) && distance2d(var_9b9642be.origin, m_e_door.origin) < 16)
		{
			waitframe(1);
		}
	}

	/*
		Name: function_d1e7faca
		Namespace: cdoor
		Checksum: 0x5C915233
		Offset: 0x24B8
		Size: 0x184
		Parameters: 1
		Flags: None
	*/
	function function_d1e7faca(closed)
	{
		if(closed)
		{
			if(is_true(m_e_door.var_9e238e15))
			{
				if(!isdefined(level.var_b4749b2e))
				{
					level.var_b4749b2e = util::spawn_model("tag_origin", (0, 0, 0), (0, 0, 0));
				}
				m_e_door util::delay(0.05, "door_not_fully_closed", &linkto, level.var_b4749b2e);
			}
			self flag::set("door_fully_closed");
		}
		else
		{
			m_e_door notify(#"door_not_fully_closed");
			if(isdefined(level.var_b4749b2e) && is_true(m_e_door.var_9e238e15) && m_e_door islinkedto(level.var_b4749b2e))
			{
				m_e_door unlink();
			}
			self flag::clear("door_fully_closed");
		}
	}

	/*
		Name: function_d30d9f47
		Namespace: cdoor
		Checksum: 0x85DD1597
		Offset: 0x4198
		Size: 0x144
		Parameters: 1
		Flags: None
	*/
	function function_d30d9f47(e_player)
	{
		if(isdefined(m_s_bundle.var_b8824800))
		{
			var_f40ac45d = float((isdefined(m_s_bundle.var_66bbc6d6) ? m_s_bundle.var_66bbc6d6 : 0));
			var_3488a701 = float((isdefined(m_s_bundle.var_f5bea36f) ? m_s_bundle.var_f5bea36f : 0));
			thread function_145675ba(e_player, m_s_bundle.var_b8824800, var_f40ac45d, var_3488a701);
		}
		else
		{
			gesture = undefined;
			if(isdefined(m_s_bundle.var_b06bad19))
			{
				gesture = m_s_bundle.var_b06bad19;
			}
			e_player thread doors::player_door_gesture(gesture);
		}
		m_e_door notify(#"hash_923096b653062ea");
	}

	/*
		Name: function_d36318ad
		Namespace: cdoor
		Checksum: 0xDE6B7319
		Offset: 0x5308
		Size: 0x3A2
		Parameters: 8
		Flags: None
	*/
	function function_d36318ad(b_malfunction, b_open_door, b_reverse, var_682c0d1c, var_a7fd1c5, var_d6cc2350, var_58c4c830, var_b0a715f2)
	{
		if(!isdefined(b_malfunction))
		{
			b_malfunction = 0;
		}
		if(!isdefined(b_open_door))
		{
			b_open_door = 1;
		}
		if(!isdefined(b_reverse))
		{
			b_reverse = 0;
		}
		if(!isdefined(var_682c0d1c))
		{
			var_682c0d1c = 0;
		}
		if(!isdefined(var_a7fd1c5))
		{
			var_a7fd1c5 = 0;
		}
		if(!isdefined(var_d6cc2350))
		{
			var_d6cc2350 = undefined;
		}
		if(!isdefined(var_58c4c830))
		{
			var_58c4c830 = 0;
		}
		if(!isdefined(var_b0a715f2))
		{
			var_b0a715f2 = undefined;
		}
		var_f83a32a1 = function_85fe0c35(b_reverse, var_7d28591d);
		if(b_malfunction)
		{
			if(b_open_door)
			{
				var_bf73cb70 = (isdefined(m_s_bundle.var_ba0e0b07) ? m_s_bundle.var_ba0e0b07 : 0);
				var_ad9c43d9 = (isdefined(m_s_bundle.var_3a2b94e8) ? m_s_bundle.var_3a2b94e8 : 0);
			}
			else
			{
				var_bf73cb70 = (isdefined(m_s_bundle.var_cb1b0a1d) ? m_s_bundle.var_cb1b0a1d : 0);
				var_ad9c43d9 = (isdefined(m_s_bundle.var_40c7110b) ? m_s_bundle.var_40c7110b : 0);
			}
			if(var_bf73cb70 == 0 && var_ad9c43d9 == 0)
			{
				var_3880cb10 = 0;
			}
			else
			{
				if(var_ad9c43d9 > var_bf73cb70)
				{
					var_3880cb10 = randomfloatrange(var_bf73cb70, var_ad9c43d9);
				}
				else
				{
					/#
						assertmsg("");
					#/
				}
			}
			if(b_open_door)
			{
				var_2b9a525f = var_f83a32a1 + var_3880cb10;
			}
			else
			{
				var_2b9a525f = var_3880cb10;
			}
		}
		else
		{
			if(isdefined(var_d6cc2350))
			{
				var_2b9a525f = namespace_64f6ea7a::function_9670a4a4(var_f83a32a1, b_reverse, var_d6cc2350, var_58c4c830, var_b0a715f2);
			}
			else
			{
				if(b_open_door)
				{
					var_2b9a525f = var_f83a32a1;
				}
				else
				{
					var_2b9a525f = 0;
				}
			}
		}
		if(var_682c0d1c)
		{
			v_angle = (var_85f2454d.angles[0], var_85f2454d.angles[1], var_85f2454d.angles[2] + var_2b9a525f);
		}
		else
		{
			if(var_a7fd1c5)
			{
				v_angle = (var_85f2454d.angles[0] + var_2b9a525f, var_85f2454d.angles[1], var_85f2454d.angles[2]);
			}
			else
			{
				v_angle = (var_85f2454d.angles[0], var_85f2454d.angles[1] + var_2b9a525f, var_85f2454d.angles[2]);
			}
		}
		return v_angle;
	}

	/*
		Name: function_d8ff021f
		Namespace: cdoor
		Checksum: 0xDFC2AA86
		Offset: 0x1498
		Size: 0x54
		Parameters: 1
		Flags: None
	*/
	function function_d8ff021f(do_enable)
	{
		if(is_true(var_81f24576))
		{
			return;
		}
		if(var_d587661f === 2)
		{
			do_enable = undefined;
		}
		function_64c97cc9(do_enable, do_enable);
	}

	/*
		Name: is_open
		Namespace: cdoor
		Checksum: 0x2546E0E0
		Offset: 0x17E0
		Size: 0x22
		Parameters: 0
		Flags: None
	*/
	function is_open()
	{
		return self flag::get("open");
	}

	/*
		Name: get_hack_pos
		Namespace: cdoor
		Checksum: 0xAA23575D
		Offset: 0xA20
		Size: 0xDC
		Parameters: 0
		Flags: None
	*/
	function get_hack_pos()
	{
		v_trigger_offset = m_s_bundle.v_trigger_offset;
		v_pos = calculate_offset_position(m_e_door.origin, m_e_door.angles, v_trigger_offset);
		v_pos = (v_pos[0], v_pos[1], v_pos[2] + 50);
		if(isdefined(var_a2f96f78.target))
		{
			e_target = getent(var_a2f96f78.target, "targetname");
			if(isdefined(e_target))
			{
				return e_target.origin;
			}
		}
		return v_pos;
	}

	/*
		Name: calculate_offset_position
		Namespace: cdoor
		Checksum: 0xC6B0638E
		Offset: 0x50F8
		Size: 0xF2
		Parameters: 3
		Flags: None
	*/
	function calculate_offset_position(v_origin, v_angles, v_offset)
	{
		v_pos = v_origin;
		if(v_offset[0])
		{
			v_side = anglestoforward(v_angles);
			v_pos = v_pos + (v_offset[0] * v_side);
		}
		if(v_offset[1])
		{
			v_dir = anglestoright(v_angles);
			v_pos = v_pos + (v_offset[1] * v_dir);
		}
		if(v_offset[2])
		{
			v_up = anglestoup(v_angles);
			v_pos = v_pos + (v_offset[2] * v_up);
		}
		return v_pos;
	}

	/*
		Name: function_e0954c11
		Namespace: cdoor
		Checksum: 0x95237828
		Offset: 0x2CF8
		Size: 0xB8
		Parameters: 0
		Flags: None
	*/
	function function_e0954c11()
	{
		if(!isdefined(var_7c9174d1))
		{
			return;
		}
		foreach(var_221be278 in var_7c9174d1)
		{
			if(!isdefined(var_221be278))
			{
				continue;
			}
			var_221be278 dodamage(500, origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
		}
	}

	/*
		Name: init_trigger
		Namespace: cdoor
		Checksum: 0x2C47A5C5
		Offset: 0x46D0
		Size: 0x4A4
		Parameters: 2
		Flags: None
	*/
	function init_trigger(v_offset, n_radius)
	{
		if(!sessionmodeiscampaigngame() || !isdefined(level.var_6a7fb742))
		{
			if(isdefined(m_s_bundle.door_interact))
			{
				thread function_323b4378();
			}
			else
			{
				v_pos = calculate_offset_position(m_e_door.origin, m_e_door.angles, v_offset);
				offset_z = 50;
				v_pos = (v_pos[0], v_pos[1], v_pos[2] + offset_z);
				if(is_true(m_s_bundle.door_trigger_at_target) && isdefined(var_a2f96f78.target))
				{
					a_e_targets = getentarray(var_a2f96f78.target, "targetname");
					e_target = a_e_targets[0];
					if(isdefined(e_target))
					{
						if(e_target trigger::is_trigger_of_type("trigger_multiple", "trigger_radius", "trigger_box"))
						{
							t_radius_or_multiple = e_target;
							v_pos = e_target.origin;
						}
						else if(e_target trigger::is_trigger_of_type("trigger_use", "trigger_use_touch"))
						{
							t_use = e_target;
							m_s_bundle.door_use_trigger = 1;
						}
					}
				}
				if(is_true(m_s_bundle.door_use_trigger))
				{
					if(isdefined(t_use))
					{
						self.m_e_trigger = t_use;
						m_e_trigger.var_2dbb0ac1 = 1;
					}
					else
					{
						self.m_e_trigger = spawn("trigger_radius_use", v_pos, 16384 | 4096, n_radius, m_n_trigger_height);
					}
					m_e_trigger triggerignoreteam();
					m_e_trigger setvisibletoall();
					m_e_trigger setteamfortrigger(#"none");
					m_e_trigger usetriggerrequirelookat();
					m_e_trigger setcursorhint("HINT_NOICON");
					if(is_true(m_s_bundle.door_closes) && !is_true(m_e_trigger.var_2dbb0ac1))
					{
						local_offset = coordtransformtranspose(m_e_trigger.origin, m_e_door.origin, m_e_door.angles);
						m_e_trigger enablelinkto();
						m_e_trigger linkto(m_e_door, undefined, local_offset);
					}
				}
				else
				{
					if(isdefined(t_radius_or_multiple))
					{
						self.m_e_trigger = t_radius_or_multiple;
					}
					else
					{
						self.m_e_trigger = spawn("trigger_radius", v_pos, ((16384 | 4096) | 16) | 512, n_radius, m_n_trigger_height);
					}
				}
				m_e_trigger.c_door = self;
			}
		}
		if(is_true(m_s_bundle.var_e182494f))
		{
			m_e_door setcandamage(1);
			thread function_54605e70();
		}
	}

	/*
		Name: function_e4659543
		Namespace: cdoor
		Checksum: 0x3AD1D444
		Offset: 0x4DB0
		Size: 0x18A
		Parameters: 1
		Flags: None
	*/
	function function_e4659543(var_9bbee0ba)
	{
		if(!isdefined(var_9bbee0ba))
		{
			var_9bbee0ba = 1;
		}
		if(var_9bbee0ba)
		{
			self.m_v_close_pos = m_e_door.origin;
			v_offset = function_e61944fa(undefined, m_s_bundle.door_slide_open_units);
			self.m_v_open_pos = calculate_offset_position(m_v_close_pos, m_e_door.angles, v_offset);
			var_85f2454d.origin = m_e_door.origin;
			var_85f2454d.angles = m_e_door.angles;
		}
		else
		{
			self.m_v_open_pos = m_e_door.origin;
			v_offset = function_e61944fa(undefined, m_s_bundle.door_slide_open_units * -1);
			self.m_v_close_pos = calculate_offset_position(m_v_open_pos, m_e_door.angles, v_offset);
			var_85f2454d.origin = m_v_close_pos;
			var_85f2454d.angles = m_e_door.angles;
		}
	}

	/*
		Name: function_e61944fa
		Namespace: cdoor
		Checksum: 0x7968C315
		Offset: 0x4C88
		Size: 0x11E
		Parameters: 2
		Flags: None
	*/
	function function_e61944fa(var_f770af7e, n_slide_amount)
	{
		str_slide_dir = (isdefined(var_3c6838bc) ? var_3c6838bc : var_f770af7e);
		switch(str_slide_dir)
		{
			case "x":
			{
				v_offset = (n_slide_amount, 0, 0);
				self.var_3c6838bc = "X";
				break;
			}
			case "y":
			{
				v_offset = (0, n_slide_amount, 0);
				self.var_3c6838bc = "Y";
				break;
			}
			case "z":
			{
				v_offset = (0, 0, n_slide_amount);
				self.var_3c6838bc = "Z";
				break;
			}
			default:
			{
				v_offset = (0, 0, n_slide_amount);
				self.var_3c6838bc = "Z";
				break;
			}
		}
		return v_offset;
	}

	/*
		Name: function_e7be6e76
		Namespace: cdoor
		Checksum: 0x7E5E7685
		Offset: 0x1338
		Size: 0x154
		Parameters: 4
		Flags: None
	*/
	function function_e7be6e76(var_79579129, var_b64ae7bb, var_8372bfa0, var_c4304c95)
	{
		if(var_81f24576 === 2 && !var_8372bfa0)
		{
			var_79579129 = undefined;
		}
		if(var_d587661f === 2 && !var_c4304c95)
		{
			var_b64ae7bb = undefined;
		}
		success = function_64c97cc9(var_79579129, var_b64ae7bb);
		if(success)
		{
			if(isdefined(var_79579129))
			{
				if(var_79579129)
				{
					self.var_81f24576 = undefined;
				}
				else
				{
					self.var_81f24576 = 1;
				}
			}
			update_use_message();
			if(is_true(flag[#"locked"]) && is_true(var_79579129))
			{
				var_318cd8de = m_e_door.var_645eee83;
				if(isdefined(var_318cd8de))
				{
					waittillframeend();
					[[ var_318cd8de ]]->function_8650ea49(var_318cd8de.var_b5a03b21);
				}
			}
		}
	}

	/*
		Name: function_ea9e96ca
		Namespace: cdoor
		Checksum: 0x88D175D2
		Offset: 0x56B8
		Size: 0x1A
		Parameters: 1
		Flags: None
	*/
	function function_ea9e96ca(delay_time)
	{
		self.m_door_open_delay_time = delay_time;
	}

	/*
		Name: function_f1a2a15f
		Namespace: cdoor
		Checksum: 0xF8F627DD
		Offset: 0x2A30
		Size: 0x2BA
		Parameters: 2
		Flags: None
	*/
	function function_f1a2a15f(b_malfunction, b_open_door)
	{
		if(!isdefined(b_malfunction))
		{
			b_malfunction = 0;
		}
		if(!isdefined(b_open_door))
		{
			b_open_door = 1;
		}
		if(b_malfunction)
		{
			if(b_open_door)
			{
				var_27c5527f = (isdefined(m_s_bundle.var_52a07bbb) ? m_s_bundle.var_52a07bbb : 0);
				var_ef3feac9 = (isdefined(m_s_bundle.var_7ffecd77) ? m_s_bundle.var_7ffecd77 : 0);
			}
			else
			{
				var_27c5527f = (isdefined(m_s_bundle.var_afd6d156) ? m_s_bundle.var_afd6d156 : 0);
				var_ef3feac9 = (isdefined(m_s_bundle.var_acfdd537) ? m_s_bundle.var_acfdd537 : 0);
			}
			if(var_27c5527f == 0 && var_ef3feac9 == 0)
			{
				var_42cf6fbd = 0;
			}
			else
			{
				if(var_ef3feac9 > var_27c5527f)
				{
					var_42cf6fbd = randomfloatrange(var_27c5527f, var_ef3feac9);
				}
				else
				{
					/#
						assertmsg("");
					#/
				}
			}
			switch(var_3c6838bc)
			{
				case "x":
				{
					v_offset = (var_42cf6fbd, 0, 0);
					break;
				}
				case "y":
				{
					v_offset = (0, var_42cf6fbd, 0);
					break;
				}
				case "z":
				{
					v_offset = (0, 0, var_42cf6fbd);
					break;
				}
				default:
				{
					v_offset = (0, 0, 0);
				}
			}
			if(b_open_door)
			{
				var_58636008 = calculate_offset_position(m_v_open_pos, var_85f2454d.angles, v_offset);
			}
			else
			{
				var_58636008 = calculate_offset_position(m_v_close_pos, var_85f2454d.angles, v_offset);
			}
		}
		else
		{
			if(b_open_door)
			{
				var_58636008 = m_v_open_pos;
			}
			else
			{
				var_58636008 = m_v_close_pos;
			}
		}
		return var_58636008;
	}

	/*
		Name: function_f50c09b3
		Namespace: cdoor
		Checksum: 0xE5740D3A
		Offset: 0x2760
		Size: 0x2C4
		Parameters: 1
		Flags: None
	*/
	function function_f50c09b3(b_enable)
	{
		self notify(#"hash_50b9293fc24e2756");
		self endon(#"hash_50b9293fc24e2756");
		m_e_door endon(#"death");
		if(m_e_door scene::function_c935c42())
		{
			[[ m_e_door._scene_object ]]->stop();
		}
		m_e_door unlink();
		if(b_enable)
		{
			self notify(#"hash_3becf718b3c58ac9");
		}
		n_delay_min = (isdefined(m_s_bundle.var_b7a623f5) ? m_s_bundle.var_b7a623f5 : 0.1);
		n_delay_max = (isdefined(m_s_bundle.var_5cac6503) ? m_s_bundle.var_5cac6503 : 1);
		if(m_s_bundle.door_open_method === "slide" || m_s_bundle.door_open_method === "swing")
		{
			if(b_enable)
			{
				while(true)
				{
					open_internal(b_enable, randomfloatrange(n_delay_min, n_delay_max));
					wait(randomfloatrange(n_delay_min, n_delay_max));
					close_internal(b_enable, randomfloatrange(n_delay_min, n_delay_max));
				}
			}
			else
			{
				close_internal(b_enable);
				level thread doors::door_update(self);
			}
		}
		else if(m_s_bundle.door_open_method == "animated" && isdefined(m_s_bundle.var_6a0dae54))
		{
			if(b_enable)
			{
				var_85f2454d thread scene::play(m_s_bundle.var_6a0dae54, m_e_door);
			}
			else
			{
				var_85f2454d thread scene::stop(m_s_bundle.var_6a0dae54);
			}
		}
	}

	/*
		Name: function_f584b243
		Namespace: cdoor
		Checksum: 0x6F5D54C
		Offset: 0xB90
		Size: 0x37C
		Parameters: 2
		Flags: None
	*/
	function function_f584b243(var_2b08c4ad, var_297e1b79)
	{
		if(!is_true(var_297e1b79) && !is_true(m_s_bundle.door_connect_paths))
		{
			return;
		}
		if(is_true(var_297e1b79))
		{
			if(isdefined(var_4882ff02) && var_4882ff02 == 2 && var_297e1b79 == 1)
			{
			}
			else
			{
				if(var_2b08c4ad)
				{
					if(var_297e1b79 == 3)
					{
						self.var_4882ff02 = 1;
					}
					else
					{
						self.var_4882ff02 = var_297e1b79;
					}
				}
				else
				{
					self.var_4882ff02 = undefined;
				}
			}
		}
		if(var_2b08c4ad || is_true(var_4882ff02))
		{
			if(isdefined(m_e_door.var_4101ccab))
			{
				var_8d684abd = m_e_door.var_4101ccab;
				if(m_e_door function_1bd32235() & 536870912)
				{
					var_8d684abd = var_8d684abd | 536870912;
				}
				m_e_door setcontents(var_8d684abd);
			}
			m_e_door function_881077b4(4194303, 0);
			m_e_door function_881077b4(32, 1);
			m_e_door function_df3a1348(0, 0);
		}
		else
		{
			var_1ce7d3b0 = m_e_door function_1bd32235();
			if(var_1ce7d3b0 & ((1 | 131072) | 16))
			{
				var_8d684abd = var_1ce7d3b0;
				if(!isdefined(m_e_door.var_4101ccab))
				{
					m_e_door.var_4101ccab = var_1ce7d3b0;
				}
				if(var_1ce7d3b0 & 1)
				{
					var_8d684abd = var_1ce7d3b0 & (~1);
					var_8d684abd = (((((((var_8d684abd | 64) | 128) | 512) | 1024) | 4096) | 8192) | 65536) | 1048576;
				}
				if(var_1ce7d3b0 & 16)
				{
					var_8d684abd = var_8d684abd & (~16);
				}
				if(var_1ce7d3b0 & 131072)
				{
					var_8d684abd = var_8d684abd & (~131072);
				}
				m_e_door setcontents(var_8d684abd);
			}
			m_e_door function_881077b4(4194303, 0);
			m_e_door function_881077b4(4097, 1);
			m_e_door function_df3a1348(0, 0);
		}
	}

	/*
		Name: function_f657b618
		Namespace: cdoor
		Checksum: 0xD5D14280
		Offset: 0x14F8
		Size: 0x5C
		Parameters: 1
		Flags: None
	*/
	function function_f657b618(do_enable)
	{
		if(is_true(var_81f24576))
		{
			return;
		}
		if(self namespace_64f6ea7a::function_e9823650())
		{
			return;
		}
		function_64c97cc9(do_enable, undefined);
	}

	/*
		Name: delete_door
		Namespace: cdoor
		Checksum: 0x2DAD012F
		Offset: 0x10A8
		Size: 0xDE
		Parameters: 0
		Flags: None
	*/
	function delete_door()
	{
		self doors::function_656c898c();
		if(isdefined(m_e_door))
		{
			if(isdefined(m_e_door.mdl_gameobject))
			{
				m_e_door.mdl_gameobject gameobjects::disable_object(1);
				m_e_door.mdl_gameobject gameobjects::destroy_object(1, 1);
			}
			m_e_door delete();
			self.m_e_door = undefined;
		}
		if(isdefined(m_e_trigger))
		{
			m_e_trigger delete();
			self.m_e_trigger = undefined;
		}
	}

}

#namespace doors;

/*
	Name: __init__system__
	Namespace: doors
	Checksum: 0xE4056F36
	Offset: 0x6120
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"doors", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: doors
	Checksum: 0xB95930FF
	Offset: 0x6178
	Size: 0xE4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_1def7d37 = [];
	util::init_dvar("scr_door_bash_requires_use", 0, &function_bae7ed2e);
	util::init_dvar("scr_door_player_gestures", 1, &function_bae7ed2e);
	util::init_dvar(#"disabledoors", 0, &function_bae7ed2e);
	/#
		util::init_dvar("", 0, &function_bae7ed2e);
	#/
	callback::on_spawned(&bash_monitor);
}

/*
	Name: function_bae7ed2e
	Namespace: doors
	Checksum: 0xBDF5C3DA
	Offset: 0x6268
	Size: 0x58
	Parameters: 1
	Flags: Private
*/
function private function_bae7ed2e(dvar)
{
	level.var_1def7d37[dvar.name] = dvar.value;
	/#
		if(dvar.name == "")
		{
			level notify(#"hash_5171254138328d84");
		}
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: doors
	Checksum: 0x4E01BD69
	Offset: 0x62C8
	Size: 0x334
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	level flag::wait_till("radiant_gameobjects_initialized");
	var_1cde154f = getgametypesetting(#"use_doors");
	if(isstring(var_1cde154f) || ishash(var_1cde154f))
	{
		var_1cde154f = 1;
	}
	var_1cde154f = int(var_1cde154f);
	var_5a23774b = int(level.var_1def7d37[#"disabledoors"]);
	if(!is_true(var_1cde154f) || is_true(var_5a23774b))
	{
		return;
	}
	a_doors = struct::get_array("scriptbundle_doors", "classname");
	a_doors = arraycombine(a_doors, getentarray("smart_object_door", "script_noteworthy"), 0, 0);
	foreach(s_instance in a_doors)
	{
		c_door = s_instance init();
		if(isdefined(c_door))
		{
			s_instance.c_door = c_door;
		}
	}
	foreach(s_instance in a_doors)
	{
		if(isdefined(s_instance.linkname))
		{
			var_5d2cd0d9 = struct::get_script_bundle_instances("doors", array(s_instance.linkname, "linkto"));
			if(isdefined(var_5d2cd0d9[0]))
			{
				s_instance.c_door.var_d1c4f848 = var_5d2cd0d9[0];
				var_5d2cd0d9[0].c_door.var_d1c4f848 = s_instance;
			}
		}
	}
	level.var_1da7d7a6 = 1;
	level thread init_door_panels();
	thread function_d2a304e(a_doors);
}

/*
	Name: init_door_panels
	Namespace: doors
	Checksum: 0x2DA1B914
	Offset: 0x6608
	Size: 0x170
	Parameters: 0
	Flags: None
*/
function init_door_panels()
{
	a_door_panels = struct::get_array("smart_object_door_panel", "script_noteworthy");
	a_door_panels = arraycombine(a_door_panels, getentarray("smart_object_door_panel", "script_noteworthy"), 0, 0);
	a_door_panels = arraycombine(a_door_panels, struct::get_array("scriptbundle_gameobject", "classname"), 0, 0);
	foreach(door_panel in a_door_panels)
	{
		if(isdefined(door_panel.script_gameobject) || isdefined(door_panel.mdl_gameobject))
		{
			if(!isdefined(door_panel.mdl_gameobject))
			{
				door_panel gameobjects::init_game_objects(door_panel.script_gameobject);
			}
			door_panel setup_doors_with_panel();
		}
	}
}

/*
	Name: setup_doors_with_panel
	Namespace: doors
	Checksum: 0x7FE325AF
	Offset: 0x6780
	Size: 0x190
	Parameters: 0
	Flags: None
*/
function setup_doors_with_panel()
{
	var_c1157335 = 0;
	if(isdefined(self.target))
	{
		a_e_doors = getentarray(self.target, "targetname");
		a_e_doors = arraycombine(a_e_doors, struct::get_array(self.target, "targetname"), 0, 0);
		foreach(e_door in a_e_doors)
		{
			if(isdefined(e_door) && isdefined(e_door.c_door))
			{
				door = e_door.c_door;
				[[ door ]]->remove_door_trigger();
				if(!var_c1157335)
				{
					if(is_true(door.m_s_bundle.door_closes))
					{
						var_ce2455a3 = 1;
					}
					else
					{
						var_ce2455a3 = 0;
					}
					var_c1157335 = 1;
					self thread door_panel_interact(var_ce2455a3);
				}
			}
		}
	}
}

/*
	Name: door_panel_interact
	Namespace: doors
	Checksum: 0x7DB317EE
	Offset: 0x6918
	Size: 0x396
	Parameters: 1
	Flags: None
*/
function door_panel_interact(b_is_panel_reusable)
{
	self endon(#"death");
	self.mdl_gameobject endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self.mdl_gameobject waittill(#"gameobject_end_use_player");
		e_player = waitresult.player;
		self.mdl_gameobject gameobjects::disable_object(1);
		if(isdefined(self.target))
		{
			a_e_doors = getentarray(self.target, "targetname");
			a_e_doors = arraycombine(a_e_doors, struct::get_array(self.target, "targetname"), 0, 0);
			foreach(e_door in a_e_doors)
			{
				if(isdefined(e_door) && isdefined(e_door.c_door))
				{
					door = e_door.c_door;
					[[ door ]]->unlock();
					[[ door ]]->set_player_who_opened(e_player);
					if([[ door ]]->is_open())
					{
						[[ door ]]->close();
						if(!is_true(door.m_s_bundle.door_closes) && is_true(door.m_s_bundle.var_d37e8f3e))
						{
							door notify(#"set_destructible", {#player:e_player});
						}
						continue;
					}
					[[ door ]]->open(e_player);
				}
			}
			waitframe(1);
			if(is_true(b_is_panel_reusable))
			{
				while(true)
				{
					b_door_animating = 0;
					foreach(e_door in a_e_doors)
					{
						if(isdefined(e_door) && isdefined(e_door.c_door))
						{
							door = e_door.c_door;
							if(door flag::get("animating"))
							{
								b_door_animating = 1;
								break;
							}
						}
					}
					if(!b_door_animating)
					{
						break;
					}
					waitframe(1);
				}
				self.mdl_gameobject gameobjects::enable_object(1);
			}
			else
			{
				return;
			}
		}
	}
}

/*
	Name: init
	Namespace: doors
	Checksum: 0x3B6674FD
	Offset: 0x6CB8
	Size: 0xAA
	Parameters: 0
	Flags: None
*/
function init()
{
	if(!isdefined(self.angles))
	{
		self.angles = (0, 0, 0);
	}
	var_fc96f513 = (isdefined(self.var_e87a94f3) ? self.var_e87a94f3 : self.scriptbundlename);
	if(!isdefined(var_fc96f513))
	{
		return;
	}
	s_door_bundle = getscriptbundle(var_fc96f513);
	c_door = new cdoor();
	return setup_door_info(s_door_bundle, self, c_door);
}

/*
	Name: setup_door_info
	Namespace: doors
	Checksum: 0xE6292AB6
	Offset: 0x6D70
	Size: 0xAA8
	Parameters: 3
	Flags: None
*/
function setup_door_info(s_door_bundle, s_door_instance, c_door)
{
	if(!isdefined(s_door_bundle))
	{
		s_door_bundle = spawnstruct();
		s_door_bundle.door_open_method = s_door_instance.door_open_method;
		s_door_bundle.door_slide_horizontal = s_door_instance.door_slide_horizontal;
		s_door_bundle.door_slide_horizontal_y = s_door_instance.door_slide_horizontal_y;
		s_door_bundle.door_open_time = s_door_instance.door_open_time;
		s_door_bundle.door_slide_open_units = s_door_instance.door_slide_open_units;
		s_door_bundle.door_swing_angle = s_door_instance.door_swing_angle;
		s_door_bundle.var_f2943dab = s_door_instance.var_f2943dab;
		s_door_bundle.door_closes = s_door_instance.door_closes;
		s_door_bundle.var_d37e8f3e = s_door_instance.var_d37e8f3e;
		s_door_bundle.door_start_open = s_door_instance.door_start_open;
		s_door_bundle.door_triggeroffsetx = s_door_instance.door_triggeroffset[0];
		s_door_bundle.door_triggeroffsety = s_door_instance.door_triggeroffset[1];
		s_door_bundle.door_triggeroffsetz = s_door_instance.door_triggeroffset[2];
		s_door_bundle.door_trigger_radius = s_door_instance.door_trigger_radius;
		s_door_bundle.door_start_sound = s_door_instance.door_start_sound;
		s_door_bundle.door_loop_sound = s_door_instance.door_loop_sound;
		s_door_bundle.door_stop_sound = s_door_instance.door_stop_sound;
		s_door_bundle.door_animated_open_bundle = s_door_instance.door_animated_open_bundle;
		s_door_bundle.door_animated_close_bundle = s_door_instance.door_animated_close_bundle;
		s_door_bundle.var_4123e857 = s_door_instance.var_4123e857;
		s_door_bundle.var_b24cba18 = s_door_instance.var_b24cba18;
		s_door_bundle.model = s_door_instance;
		s_door_instance.door_open_method = undefined;
		s_door_instance.door_slide_horizontal = undefined;
		s_door_instance.door_slide_horizontal_y = undefined;
		s_door_instance.door_open_time = undefined;
		s_door_instance.door_slide_open_units = undefined;
		s_door_instance.door_swing_angle = undefined;
		s_door_instance.var_f2943dab = undefined;
		s_door_instance.door_closes = undefined;
		s_door_instance.var_d37e8f3e = undefined;
		s_door_instance.door_start_open = undefined;
		s_door_instance.door_triggeroffsetx = undefined;
		s_door_instance.door_triggeroffsety = undefined;
		s_door_instance.door_triggeroffsetz = undefined;
		s_door_instance.door_trigger_radius = undefined;
		s_door_instance.door_start_sound = undefined;
		s_door_instance.door_loop_sound = undefined;
		s_door_instance.door_stop_sound = undefined;
		s_door_instance.door_animated_open_bundle = undefined;
		s_door_instance.door_animated_close_bundle = undefined;
		s_door_instance.var_b24cba18 = undefined;
		s_door_instance.var_ee1b0615 = undefined;
		s_door_instance.var_3b86b7db = undefined;
		s_door_instance.var_16a4e229 = undefined;
		s_door_instance.var_16e3e29b = undefined;
		s_door_instance.var_4123e857 = undefined;
	}
	c_door.m_s_bundle = s_door_bundle;
	c_door.var_a2f96f78 = s_door_instance;
	if(isdefined(s_door_instance.target))
	{
		a_target_ents = getentarray(s_door_instance.target, "targetname");
		foreach(ent in a_target_ents)
		{
			if(ent.objectid === "clip_player_doorway")
			{
				if(is_true(ent.script_door_enable_player_clip))
				{
					ent.targetname = undefined;
					c_door.m_e_player_clip = ent;
				}
				else
				{
					ent delete();
				}
				continue;
			}
			if(ent trigger::is_trigger_of_type())
			{
				c_door.m_s_bundle.door_trigger_at_target = 1;
			}
		}
	}
	if(c_door.m_s_bundle.door_unlock_method === "hack" && !is_true(level.door_hack_precached))
	{
		level.door_hack_precached = 1;
	}
	e_or_str_door_model = c_door.m_s_bundle.model;
	if(isdefined(c_door.m_s_bundle.door_triggeroffsetx))
	{
		n_xoffset = c_door.m_s_bundle.door_triggeroffsetx;
	}
	else
	{
		n_xoffset = 0;
	}
	if(isdefined(c_door.m_s_bundle.door_triggeroffsety))
	{
		n_yoffset = c_door.m_s_bundle.door_triggeroffsety;
	}
	else
	{
		n_yoffset = 0;
	}
	if(isdefined(c_door.m_s_bundle.door_triggeroffsetz))
	{
		n_zoffset = c_door.m_s_bundle.door_triggeroffsetz;
	}
	else
	{
		n_zoffset = 0;
	}
	v_trigger_offset = (n_xoffset, n_yoffset, n_zoffset);
	c_door.m_s_bundle.v_trigger_offset = v_trigger_offset;
	n_trigger_radius = c_door.m_s_bundle.door_trigger_radius;
	if(is_true(c_door.m_s_bundle.door_slide_horizontal))
	{
		if(is_true(c_door.m_s_bundle.door_slide_horizontal_y))
		{
			str_slide_dir = "Y";
		}
		else
		{
			str_slide_dir = "X";
		}
	}
	else
	{
		str_slide_dir = "Z";
	}
	n_open_time = c_door.m_s_bundle.door_open_time;
	n_slide_amount = c_door.m_s_bundle.door_slide_open_units;
	if(!isdefined(c_door.m_s_bundle.door_swing_angle))
	{
		c_door.m_s_bundle.door_swing_angle = 0;
	}
	if(!isdefined(c_door.m_s_bundle.var_f2943dab))
	{
		c_door.m_s_bundle.var_f2943dab = 0;
	}
	if(is_true(c_door.m_s_bundle.door_closes))
	{
		n_door_closes = 1;
	}
	else
	{
		n_door_closes = 0;
	}
	if(isdefined(s_door_instance.script_obstruction_cover_open))
	{
		c_door.var_fb8a6fcc = getnodearray(s_door_instance.script_obstruction_cover_open, "script_obstruction_cover_open");
	}
	if(isdefined(s_door_instance.script_obstruction_cover_close))
	{
		c_door.var_e1a5a27e = getnodearray(s_door_instance.script_obstruction_cover_close, "script_obstruction_cover_close");
	}
	[[ c_door ]]->function_7d2c33c4(0);
	if(is_true(c_door.m_s_bundle.door_start_open))
	{
		c_door flag::set("open");
	}
	if(isdefined(c_door.var_a2f96f78.script_flag))
	{
		a_flags = strtok(c_door.var_a2f96f78.script_flag, ",");
		foreach(str_flag in a_flags)
		{
			level flag::init(str_flag);
		}
	}
	[[ c_door ]]->set_door_paths(is_true(c_door.m_s_bundle.door_connect_paths));
	[[ c_door ]]->init_door_model(e_or_str_door_model, s_door_instance);
	[[ c_door ]]->init_trigger(v_trigger_offset, n_trigger_radius, c_door.m_s_bundle);
	c_door function_d374e3dd(0);
	c_door thread namespace_64f6ea7a::init_max_yaws();
	[[ c_door ]]->init_player_spawns();
	thread [[ c_door ]]->run_lock_fx();
	[[ c_door ]]->init_movement(str_slide_dir, n_slide_amount);
	if(!isdefined(c_door.m_s_bundle.door_open_time))
	{
		c_door.m_s_bundle.door_open_time = 0.4;
	}
	if(isdefined(s_door_instance.script_delay))
	{
		[[ c_door ]]->function_ea9e96ca(s_door_instance.script_delay);
	}
	c_door.m_s_bundle.b_loop_sound = isdefined(c_door.m_s_bundle.door_loop_sound) && c_door.m_s_bundle.door_loop_sound != "";
	if(is_true(s_door_instance.var_d7532565))
	{
		c_door thread function_83929c65(1);
	}
	else
	{
		level thread door_update(c_door);
	}
	if(is_true(c_door.var_81f24576))
	{
		[[ c_door ]]->function_e7be6e76(0, 0, 0, 0);
	}
	/#
		c_door thread debug_draw();
	#/
	if(is_true(c_door.m_s_bundle.var_d37e8f3e))
	{
		level thread function_dc98f943(c_door);
	}
	return c_door;
}

/*
	Name: debug_draw
	Namespace: doors
	Checksum: 0x193FF6F9
	Offset: 0x7820
	Size: 0xDE
	Parameters: 0
	Flags: None
*/
function debug_draw()
{
	/#
		if(isdefined(self.m_e_door))
		{
			self.m_e_door endon(#"death");
			ent_num = self.m_e_door getentitynumber();
			while(true)
			{
				var_9599e270 = level.var_1def7d37[#"hash_5171254138328d84"];
				if(var_9599e270 <= 0)
				{
					level waittill(#"hash_5171254138328d84");
					continue;
				}
				if(var_9599e270 == 1 || var_9599e270 == ent_num)
				{
					self function_75697b7d(ent_num);
				}
				waitframe(1);
			}
		}
	#/
}

/*
	Name: function_75697b7d
	Namespace: doors
	Checksum: 0x553B1DAD
	Offset: 0x7908
	Size: 0xAF4
	Parameters: 1
	Flags: None
*/
function function_75697b7d(ent_num)
{
	/#
		/#
			assert(isdefined(self.m_e_door));
		#/
		angles = self.m_e_door.angles;
		var_ed80ebc4 = self function_fb354714();
		var_5e92800d = self function_eea7cdb4();
		debugaxis(self.m_e_door.origin, angles);
		start = self.m_e_door.origin + vectorscale((0, 0, 1), 20);
		line(start, start + (var_ed80ebc4 * 5), (0, 1, 0), 1);
		line(start, start + (var_5e92800d * 5), (1, 0, 0), 1);
		print3d(self.m_e_door.origin + (vectorscale((0, 0, -1), 5)), (("" + self.m_s_bundle.name) + "") + ent_num, (1, 1, 1), 1, 0.1);
		center = self get_door_center(1);
		center = center + (vectorscale((0, 0, -1), 5));
		if(is_true(self.var_d587661f))
		{
			print3d(center + (vectorscale((0, 0, -1), 5)), "" + self.var_d587661f, (1, 0, 0), 1, 0.1);
		}
		temp = "";
		if(is_true(self.var_81f24576))
		{
			temp = ("" + self.var_81f24576) + "";
		}
		if(is_true(self.var_4882ff02))
		{
			temp = ((temp + "") + self.var_4882ff02) + "";
		}
		if(temp != "")
		{
			print3d(center + (vectorscale((0, 0, -1), 6.5)), temp, (1, 0, 0), 1, 0.1);
		}
		if(self flag::get(""))
		{
			print3d(center + (vectorscale((0, 0, -1), 8)), "", (1, 0, 0), 1, 0.1);
		}
		else
		{
			print3d(center + (vectorscale((0, 0, -1), 8)), "", (0, 1, 0), 1, 0.1);
		}
		var_e9846847 = undefined;
		if(isdefined(self.var_a2f96f78.var_ea225236))
		{
			print3d(center + (vectorscale((0, 0, -1), 9.5)), "", vectorscale((0, 1, 0), 0.5), 1, 0.1);
			var_e9846847 = self.var_a2f96f78.var_ea225236;
		}
		else if(isdefined(self.var_a2f96f78.targetname))
		{
			var_a20f663b = struct::get_script_bundle_instances("", array(self.var_a2f96f78.targetname, ""));
			if(isdefined(var_a20f663b) && var_a20f663b.size > 0)
			{
				var_e9846847 = var_a20f663b[0];
				print3d(center + (vectorscale((0, 0, -1), 9.5)), "", vectorscale((0, 1, 0), 0.5), 1, 0.1);
			}
		}
		if(isdefined(var_e9846847) && isdefined(var_e9846847.mdl_gameobject) && isdefined(var_e9846847.mdl_gameobject.trigger))
		{
			var_ed6e11b4 = "";
			var_7520fb92 = (1, 1, 1);
			if(!var_e9846847.mdl_gameobject.trigger isusable())
			{
				var_ed6e11b4 = "";
				var_7520fb92 = vectorscale((1, 1, 1), 0.5);
			}
			debugstar(var_e9846847.mdl_gameobject.trigger.origin, 1, var_7520fb92, (("" + var_e9846847.mdl_gameobject getentitynumber()) + "") + var_e9846847.mdl_gameobject.trigger getentitynumber() + var_ed6e11b4, 0.05);
		}
		print3d(center + (vectorscale((0, 0, -1), 11)), "" + self.m_s_bundle.door_open_method, vectorscale((0, 1, 0), 0.5), 1, 0.1);
		temp = ("" + is_true(self.m_s_bundle.var_7bbc4039)) + "";
		if(isdefined(self.var_f97eab64))
		{
			temp = ((temp + "") + self.var_f97eab64) + "";
		}
		print3d(center + (vectorscale((0, 0, -1), 13.5)), temp, vectorscale((0, 1, 0), 0.5), 1, 0.1);
		if(function_4011a3d9())
		{
			print3d(center + (vectorscale((0, 0, -1), 16)), "", vectorscale((0, 1, 0), 0.5), 1, 0.1);
		}
		if(function_53f46e97())
		{
			print3d(center + (vectorscale((0, 0, -1), 16)), "", vectorscale((0, 1, 0), 0.5), 1, 0.1);
		}
		var_6143a8d8 = "";
		var_a011b978 = (1, 1, 1);
		var_d5587654 = [[ self ]]->function_a5fa0850();
		if(isdefined(self.m_e_trigger))
		{
			var_920bc240 = "";
			if(is_true(self.m_e_trigger.var_2dbb0ac1))
			{
				var_920bc240 = "";
			}
			debugstar(self.m_e_trigger.origin, 1, var_a011b978, ((self.m_e_trigger.classname + "") + self.m_e_trigger getentitynumber() + var_920bc240) + var_6143a8d8, 0.1);
		}
		else
		{
			if(isdefined(self.m_e_door.mdl_gameobject) && isdefined(self.m_e_door.mdl_gameobject.trigger))
			{
				debugstar(self.m_e_door.mdl_gameobject.trigger.origin, 1, var_a011b978, (("" + self.m_e_door.mdl_gameobject getentitynumber()) + "") + self.m_e_door.mdl_gameobject.trigger getentitynumber() + var_6143a8d8, 0.1);
			}
			else
			{
				print3d(self.m_e_door.origin, ("" + ent_num) + var_6143a8d8, var_a011b978, 1, 0.1, 1);
			}
		}
		if(isdefined(self.m_s_bundle) && (self.m_s_bundle.door_open_method == "" || self.m_s_bundle.door_open_method == ""))
		{
			if(isdefined(self.var_15695d13))
			{
				self thread namespace_64f6ea7a::draw_max_yaw(1);
			}
			if(isdefined(self.var_ca91d615))
			{
				self thread namespace_64f6ea7a::draw_max_yaw(0);
			}
		}
		if(ent_num === level.var_8e7ad5cb)
		{
			before = level.var_1def7d37[#"hash_5171254138328d84"];
			level.var_1def7d37[#"hash_5171254138328d84"] = 2;
			self namespace_64f6ea7a::init_max_yaws();
			level.var_8e7ad5cb = undefined;
			level.var_1def7d37[#"hash_5171254138328d84"] = before;
		}
	#/
}

/*
	Name: function_2150e56f
	Namespace: doors
	Checksum: 0x4334F7
	Offset: 0x8408
	Size: 0x1C4
	Parameters: 1
	Flags: None
*/
function function_2150e56f(flags)
{
	/#
		retval = "";
		if(flags & 1)
		{
			retval = retval + "";
		}
		if(flags & 2)
		{
			retval = retval + "";
		}
		if(flags & 4)
		{
			retval = retval + "";
		}
		if(flags & 8)
		{
			retval = retval + "";
		}
		if(flags & 16)
		{
			retval = retval + "";
		}
		if(flags & 32)
		{
			retval = retval + "";
		}
		if(flags & 64)
		{
			retval = retval + "";
		}
		if(flags & 128)
		{
			retval = retval + "";
		}
		if(flags & 256)
		{
			retval = retval + "";
		}
		if(flags & 512)
		{
			retval = retval + "";
		}
		if(flags & 1024)
		{
			retval = retval + "";
		}
		if(flags & 2048)
		{
			retval = retval + "";
		}
		if(flags & 4096)
		{
			retval = retval + "";
		}
		return retval;
	#/
}

/*
	Name: function_81fba61a
	Namespace: doors
	Checksum: 0xA12AA7B4
	Offset: 0x85D8
	Size: 0x444
	Parameters: 1
	Flags: None
*/
function function_81fba61a(flags)
{
	/#
		retval = "";
		if(flags & 1)
		{
			retval = retval + "";
		}
		if(flags & 2)
		{
			retval = retval + "";
		}
		if(flags & 4)
		{
			retval = retval + "";
		}
		if(flags & 8)
		{
			retval = retval + "";
		}
		if(flags & 16)
		{
			retval = retval + "";
		}
		if(flags & 32)
		{
			retval = retval + "";
		}
		if(flags & 64)
		{
			retval = retval + "";
		}
		if(flags & 128)
		{
			retval = retval + "";
		}
		if(flags & 256)
		{
			retval = retval + "";
		}
		if(flags & 512)
		{
			retval = retval + "";
		}
		if(flags & 1024)
		{
			retval = retval + "";
		}
		if(flags & 2048)
		{
			retval = retval + "";
		}
		if(flags & 4096)
		{
			retval = retval + "";
		}
		if(flags & 524288)
		{
			retval = retval + "";
		}
		if(flags & 8192)
		{
			retval = retval + "";
		}
		if(flags & 16384)
		{
			retval = retval + "";
		}
		if(flags & 32768)
		{
			retval = retval + "";
		}
		if(flags & 32768)
		{
			retval = retval + "";
		}
		if(flags & 65536)
		{
			retval = retval + "";
		}
		if(flags & 131072)
		{
			retval = retval + "";
		}
		if(flags & 262144)
		{
			retval = retval + "";
		}
		if(flags & 1073741824)
		{
			retval = retval + "";
		}
		if(flags & 536870912)
		{
			retval = retval + "";
		}
		if(flags & 1048576)
		{
			retval = retval + "";
		}
		if(flags & 2097152)
		{
			retval = retval + "";
		}
		if(flags & 4194304)
		{
			retval = retval + "";
		}
		if(flags & 8388608)
		{
			retval = retval + "";
		}
		if(flags & 16777216)
		{
			retval = retval + "";
		}
		if(flags & 134217728)
		{
			retval = retval + "";
		}
		if(flags & 268435456)
		{
			retval = retval + "";
		}
		if(flags & 2147483648)
		{
			retval = retval + "";
		}
		if(flags & 33554432)
		{
			retval = retval + "";
		}
		if(flags & 67108864)
		{
			retval = retval + "";
		}
		return retval;
	#/
}

/*
	Name: function_e173262f
	Namespace: doors
	Checksum: 0x39A52163
	Offset: 0x8A28
	Size: 0xBE
	Parameters: 0
	Flags: Private
*/
function private function_e173262f()
{
	if(isdefined(self.m_e_door.mdl_gameobject))
	{
		waitresult = undefined;
		waitresult = self.m_e_door.mdl_gameobject waittill(#"gameobject_end_use_player");
		waitresult.activator = waitresult.player;
	}
	else
	{
		if(isdefined(self.m_e_trigger))
		{
			waitresult = undefined;
			waitresult = self.m_e_trigger waittill(#"trigger");
		}
		else
		{
			waitresult = undefined;
			waitresult = self.m_e_door waittill(#"trigger");
		}
	}
	return waitresult;
}

/*
	Name: function_4011a3d9
	Namespace: doors
	Checksum: 0x9F85E95B
	Offset: 0x8AF0
	Size: 0x14C
	Parameters: 0
	Flags: None
*/
function function_4011a3d9()
{
	if(isdefined(self.var_a2f96f78.linkname))
	{
		return false;
	}
	if(isdefined(self.var_a2f96f78.linkto))
	{
		if(isdefined(self.var_d1c4f848))
		{
			return true;
		}
		if(!isdefined(level.var_1da7d7a6) || !level.var_1da7d7a6)
		{
			var_4ac9b3ea = struct::get_array(self.var_a2f96f78.linkto, "linkname");
			foreach(struct in var_4ac9b3ea)
			{
				if(isdefined(struct.classname) && (struct.classname == "scriptbundle_doors" || struct.classname == "scriptbundle_windows"))
				{
					return true;
				}
			}
		}
	}
	return false;
}

/*
	Name: function_53f46e97
	Namespace: doors
	Checksum: 0xF57D779
	Offset: 0x8C48
	Size: 0xAA
	Parameters: 0
	Flags: None
*/
function function_53f46e97()
{
	if(isdefined(self.var_a2f96f78.linkto))
	{
		return false;
	}
	if(isdefined(self.var_a2f96f78.linkname))
	{
		if(isdefined(self.var_d1c4f848))
		{
			return true;
		}
		if(!isdefined(level.var_1da7d7a6) || !level.var_1da7d7a6)
		{
			var_26bf2138 = struct::get_array(self.var_a2f96f78.linkname, "linkto");
			if(var_26bf2138.size > 0)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: door_open_update
	Namespace: doors
	Checksum: 0x13672DBE
	Offset: 0x8D00
	Size: 0x88
	Parameters: 1
	Flags: None
*/
function door_open_update(c_door)
{
	use_trigger = [[ c_door ]]->function_a5fa0850();
	if(!isdefined(use_trigger))
	{
		return;
	}
	use_trigger endon(#"death");
	while(true)
	{
		waitresult = c_door function_e173262f();
		self function_16136fe9(c_door, waitresult);
	}
}

/*
	Name: function_16136fe9
	Namespace: doors
	Checksum: 0x2C384E85
	Offset: 0x8D90
	Size: 0x390
	Parameters: 2
	Flags: None
*/
function function_16136fe9(c_door, waitresult)
{
	b_auto_close = is_true(c_door.m_s_bundle.door_closes) && !is_true(c_door.m_s_bundle.door_use_trigger);
	b_hold_open = is_true(c_door.m_s_bundle.door_use_hold);
	b_manual_close = is_true(c_door.m_s_bundle.door_use_trigger) && is_true(c_door.m_s_bundle.door_closes);
	e_who = waitresult.activator;
	c_door.var_9b9642be = e_who;
	if(isdefined(c_door.var_a2f96f78.script_team) && (c_door.var_a2f96f78.script_team != #"any" && !c_door.var_9b9642be util::is_on_side(c_door.var_a2f96f78.script_team)))
	{
		return;
	}
	if(!c_door flag::get("open"))
	{
		if(!c_door flag::get("locked"))
		{
			if(b_hold_open || b_auto_close)
			{
				[[ c_door ]]->open(e_who);
				[[ c_door ]]->function_830dc907(e_who);
				if(b_hold_open)
				{
					if(isplayer(e_who))
					{
						e_who player_freeze_in_place(1);
						e_who disableweapons();
						e_who disableoffhandweapons();
					}
				}
				door_wait_until_clear(c_door, e_who);
				[[ c_door ]]->close();
				[[ c_door ]]->function_d30d9f47(e_who);
				if(b_hold_open)
				{
					waitframe(1);
					c_door flag::wait_till_clear("animating");
					if(isplayer(e_who))
					{
						e_who player_freeze_in_place(0);
						e_who enableweapons();
						e_who enableoffhandweapons();
					}
				}
			}
			else
			{
				[[ c_door ]]->open(e_who);
				[[ c_door ]]->function_830dc907(e_who);
			}
		}
	}
	else if(b_manual_close)
	{
		[[ c_door ]]->close();
		[[ c_door ]]->function_d30d9f47(e_who);
	}
}

/*
	Name: door_update
	Namespace: doors
	Checksum: 0xA4A0C776
	Offset: 0x9128
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function door_update(c_door)
{
	c_door notify(#"hash_3becf718b3c58ac9");
	c_door endon(#"hash_3becf718b3c58ac9");
	if(is_true(c_door.m_s_bundle.door_locked))
	{
		[[ c_door ]]->lock();
		if(isdefined(c_door.var_a2f96f78.targetname) && isdefined(c_door.m_e_trigger))
		{
			self childthread door_update_lock_scripted(c_door);
		}
	}
	self childthread door_open_update(c_door);
	[[ c_door ]]->update_use_message();
	self childthread function_463715ec(c_door);
}

/*
	Name: function_463715ec
	Namespace: doors
	Checksum: 0x117CF89B
	Offset: 0x9218
	Size: 0x126
	Parameters: 1
	Flags: None
*/
function function_463715ec(c_door)
{
	while(true)
	{
		if(c_door flag::get("locked"))
		{
			[[ c_door ]]->function_f584b243(1);
			c_door flag::wait_till_clear("locked");
		}
		c_door flag::wait_till("open");
		if(!is_true(c_door.var_c4c3fa39) && isplayer(c_door.var_9b9642be))
		{
			wait(0.2);
		}
		self function_5db0cee5(c_door);
		c_door flag::wait_till_clear("open");
		self function_426a2a1b(c_door);
		waitframe(1);
	}
}

/*
	Name: function_5db0cee5
	Namespace: doors
	Checksum: 0x21519110
	Offset: 0x9348
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_5db0cee5(c_door)
{
	waittillframeend();
	if(isdefined(c_door.var_d1c4f848))
	{
		c_door.var_d1c4f848.c_door flag::set("open");
	}
	if(c_door.m_door_open_delay_time > 0)
	{
		c_door.m_e_door notify(#"door_waiting_to_open", {#player:c_door.var_9b9642be});
		wait(c_door.m_door_open_delay_time);
	}
	thread [[ c_door ]]->open_internal();
	if(c_door namespace_64f6ea7a::function_9d109db6())
	{
		c_door thread namespace_64f6ea7a::monitor_door_push();
	}
}

/*
	Name: function_426a2a1b
	Namespace: doors
	Checksum: 0x982A6892
	Offset: 0x9428
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_426a2a1b(c_door)
{
	waittillframeend();
	thread [[ c_door ]]->close_internal();
	if(isdefined(c_door.var_d1c4f848))
	{
		c_door.var_d1c4f848.c_door flag::clear("open");
	}
	if(!is_true(c_door.m_s_bundle.door_closes))
	{
		if(is_true(c_door.m_s_bundle.var_d37e8f3e))
		{
			c_door notify(#"set_destructible", {#player:c_door.var_9b9642be});
		}
	}
}

/*
	Name: door_update_lock_scripted
	Namespace: doors
	Checksum: 0x4EB572BE
	Offset: 0x9508
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function door_update_lock_scripted(c_door)
{
	door_str = c_door.var_a2f96f78.targetname;
	c_door.m_e_trigger.targetname = door_str + "_trig";
	c_door.m_e_trigger endon(#"death");
	while(true)
	{
		c_door.m_e_trigger waittill(#"unlocked");
		[[ c_door ]]->unlock();
	}
}

/*
	Name: function_dc98f943
	Namespace: doors
	Checksum: 0xAFF28C63
	Offset: 0x95B0
	Size: 0x468
	Parameters: 1
	Flags: None
*/
function function_dc98f943(c_door)
{
	e_door = c_door.m_e_door;
	e_door endon(#"door_cleared", #"death");
	/#
		assert(isdefined(e_door), "");
	#/
	e_door setcandamage(0);
	waitresult = undefined;
	waitresult = c_door waittill(#"set_destructible");
	e_door waittill(#"door_closed");
	e_door setcandamage(1);
	e_door setteam(waitresult.player.team);
	if(isdefined(c_door.var_a2f96f78) && is_true(c_door.var_a2f96f78.var_dc13f874))
	{
		e_door makesentient();
		e_door.canbemeleed = 0;
	}
	else
	{
		e_door util::function_5d36c37a();
	}
	target_set(e_door);
	level notify(#"hash_9db88375ef038b", {#player:waitresult.player, #c_door:c_door});
	e_door val::set(#"hash_25bedd86747e41e1", "takedamage", 1);
	e_door val::set(#"hash_25bedd86747e41e1", "allowdeath", 1);
	if(isdefined(c_door.m_s_bundle.registersidestepshouldstun))
	{
		e_door.health = c_door.m_s_bundle.registersidestepshouldstun;
	}
	else
	{
		e_door.health = 10000;
	}
	if(isdefined(c_door.m_s_bundle.var_8bed02db))
	{
		e_door.script_health = e_door.health;
		e_door thread scene::init(c_door.m_s_bundle.var_8bed02db, e_door);
		e_door waittill(#"hash_18be12558bc58fe");
	}
	else
	{
		while(e_door.health > 0)
		{
			e_door waittill(#"damage");
		}
		e_door ghost();
	}
	target_remove(e_door);
	if(issentient(e_door))
	{
		e_door function_60d50ea4();
	}
	else if(function_ffa5b184(e_door))
	{
		e_door function_dfee3dec();
	}
	e_door val::reset(#"hash_25bedd86747e41e1", "takedamage");
	e_door val::reset(#"hash_25bedd86747e41e1", "allowdeath");
	e_door.health = 0;
	if(isdefined(c_door.m_s_bundle.var_ffb77aca))
	{
		playfxontag(c_door.m_s_bundle.var_ffb77aca, e_door, "tag_origin");
	}
	e_door notsolid();
	[[ c_door ]]->function_f584b243(0);
	e_door notify(#"door_cleared");
}

/*
	Name: player_freeze_in_place
	Namespace: doors
	Checksum: 0x639B6911
	Offset: 0x9A20
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function player_freeze_in_place(b_do_freeze)
{
	if(!b_do_freeze)
	{
		if(isdefined(self.freeze_origin))
		{
			self unlink();
			self.freeze_origin delete();
			self.freeze_origin = undefined;
		}
	}
	else if(!isdefined(self.freeze_origin))
	{
		self.freeze_origin = spawn("script_model", self.origin);
		self.freeze_origin setmodel(#"tag_origin");
		self.freeze_origin.angles = self getplayerangles();
		self playerlinktodelta(self.freeze_origin, "tag_origin", 1, 45, 45, 45, 45);
	}
}

/*
	Name: function_4fb146e4
	Namespace: doors
	Checksum: 0x3EB4B684
	Offset: 0x9B58
	Size: 0x17C
	Parameters: 1
	Flags: None
*/
function function_4fb146e4(c_door)
{
	allentities = [];
	var_f9ec23eb = (isdefined([[ c_door ]]->function_61c13b93()) ? [[ c_door ]]->function_61c13b93() : c_door.m_e_door.origin);
	allentities = getentitiesinradius(var_f9ec23eb, 30);
	entcount = 0;
	foreach(entity in allentities)
	{
		if(isplayer(entity))
		{
			continue;
		}
		if(iscorpse(entity) && is_true(level.var_a348230f))
		{
			entity delete();
			continue;
		}
		if(!isdefined(entity.weapon))
		{
			continue;
		}
		entcount++;
	}
	return entcount == 0;
}

/*
	Name: trigger_wait_until_clear
	Namespace: doors
	Checksum: 0xCFF3D9C9
	Offset: 0x9CE0
	Size: 0x126
	Parameters: 1
	Flags: None
*/
function trigger_wait_until_clear(c_door)
{
	self endon(#"death");
	last_trigger_time = gettime();
	self.ents_in_trigger = 1;
	str_kill_trigger_notify = "trigger_now_clear";
	self thread trigger_check_for_ents_touching(str_kill_trigger_notify);
	while(true)
	{
		time = gettime();
		if(self.ents_in_trigger == 1)
		{
			self.ents_in_trigger = 0;
			last_trigger_time = time;
		}
		var_39533c4 = 0;
		dt = (float(time - last_trigger_time)) / 1000;
		if(dt >= 0.3)
		{
			var_39533c4 = 1;
		}
		if(var_39533c4 && function_4fb146e4(c_door))
		{
			break;
		}
		waitframe(1);
	}
	self notify(str_kill_trigger_notify);
}

/*
	Name: door_wait_until_user_release
	Namespace: doors
	Checksum: 0x85E7D232
	Offset: 0x9E10
	Size: 0xDA
	Parameters: 3
	Flags: None
*/
function door_wait_until_user_release(c_door, e_triggerer, str_kill_on_door_notify)
{
	if(isdefined(str_kill_on_door_notify))
	{
		c_door endon(str_kill_on_door_notify);
	}
	wait(0.25);
	max_dist_sq = c_door.m_s_bundle.door_trigger_radius * c_door.m_s_bundle.door_trigger_radius;
	b_pressed = 1;
	n_dist = 0;
	do
	{
		waitframe(1);
		b_pressed = e_triggerer usebuttonpressed();
		n_dist = distancesquared(e_triggerer.origin, self.origin);
	}
	while(b_pressed && n_dist < max_dist_sq);
}

/*
	Name: door_wait_until_clear
	Namespace: doors
	Checksum: 0x8843DA88
	Offset: 0x9EF8
	Size: 0x9C
	Parameters: 2
	Flags: None
*/
function door_wait_until_clear(c_door, e_triggerer)
{
	e_trigger = c_door.m_e_trigger;
	if(isplayer(e_triggerer) && is_true(c_door.m_s_bundle.door_use_hold))
	{
		c_door.m_e_trigger door_wait_until_user_release(c_door, e_triggerer);
	}
	e_trigger trigger_wait_until_clear(c_door);
}

/*
	Name: trigger_check_for_ents_touching
	Namespace: doors
	Checksum: 0x8390A48A
	Offset: 0x9FA0
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function trigger_check_for_ents_touching(str_kill_trigger_notify)
{
	self endon(#"death", str_kill_trigger_notify);
	while(true)
	{
		self waittill(#"trigger");
		self.ents_in_trigger = 1;
	}
}

/*
	Name: door_debug_line
	Namespace: doors
	Checksum: 0xD7784352
	Offset: 0x9FF8
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function door_debug_line(v_origin)
{
	self endon(#"death");
	while(true)
	{
		v_start = v_origin;
		v_end = v_start + vectorscale((0, 0, 1), 1000);
		v_col = (0, 0, 1);
		/#
			line(v_start, v_end, (0, 0, 1));
		#/
		wait(0.1);
	}
}

/*
	Name: unlock
	Namespace: doors
	Checksum: 0xFF2609E3
	Offset: 0xA090
	Size: 0x164
	Parameters: 4
	Flags: None
*/
function unlock(str_value, str_key, b_do_open, e_player)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(b_do_open))
	{
		b_do_open = 1;
	}
	if(!isdefined(e_player))
	{
		e_player = undefined;
	}
	if(isdefined(self.c_door))
	{
		[[ self.c_door ]]->unlock();
		if(b_do_open)
		{
			[[ self.c_door ]]->open(e_player);
		}
	}
	else
	{
		a_e_doors = get_doors(str_value, str_key);
		foreach(e_door in a_e_doors)
		{
			if(isdefined(e_door.c_door))
			{
				[[ e_door.c_door ]]->unlock();
				if(b_do_open)
				{
					[[ e_door.c_door ]]->open(e_player);
				}
			}
		}
	}
}

/*
	Name: unlock_all
	Namespace: doors
	Checksum: 0x36C45D85
	Offset: 0xA200
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function unlock_all(b_do_open)
{
	if(!isdefined(b_do_open))
	{
		b_do_open = 1;
	}
	unlock(undefined, undefined, b_do_open);
}

/*
	Name: lock
	Namespace: doors
	Checksum: 0xC8B03B17
	Offset: 0xA240
	Size: 0x150
	Parameters: 3
	Flags: None
*/
function lock(str_value, str_key, b_do_close)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(b_do_close))
	{
		b_do_close = 1;
	}
	if(isdefined(self.c_door))
	{
		if(b_do_close)
		{
			[[ self.c_door ]]->close();
		}
		[[ self.c_door ]]->lock();
	}
	else
	{
		a_e_doors = get_doors(str_value, str_key);
		foreach(e_door in a_e_doors)
		{
			if(isdefined(e_door.c_door))
			{
				if(b_do_close)
				{
					[[ e_door.c_door ]]->close();
				}
				[[ e_door.c_door ]]->lock();
			}
		}
	}
}

/*
	Name: lock_all
	Namespace: doors
	Checksum: 0xACE1E9
	Offset: 0xA398
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function lock_all(b_do_close)
{
	if(!isdefined(b_do_close))
	{
		b_do_close = 1;
	}
	lock(undefined, undefined, b_do_close);
}

/*
	Name: open
	Namespace: doors
	Checksum: 0xA1902FC5
	Offset: 0xA3D8
	Size: 0x118
	Parameters: 3
	Flags: None
*/
function open(str_value, str_key, e_player)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(e_player))
	{
		e_player = undefined;
	}
	if(isdefined(self.c_door))
	{
		[[ self.c_door ]]->open(e_player);
	}
	else
	{
		a_e_doors = get_doors(str_value, str_key);
		foreach(e_door in a_e_doors)
		{
			if(isdefined(e_door.c_door))
			{
				[[ e_door.c_door ]]->open(e_player);
			}
		}
	}
}

/*
	Name: open_all
	Namespace: doors
	Checksum: 0xE995C6C
	Offset: 0xA4F8
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function open_all()
{
	open();
}

/*
	Name: close
	Namespace: doors
	Checksum: 0xF31C00BA
	Offset: 0xA518
	Size: 0xFC
	Parameters: 2
	Flags: None
*/
function close(str_value, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(isdefined(self.c_door))
	{
		[[ self.c_door ]]->close();
	}
	else
	{
		a_e_doors = get_doors(str_value, str_key);
		foreach(e_door in a_e_doors)
		{
			if(isdefined(e_door.c_door))
			{
				[[ e_door.c_door ]]->close();
			}
		}
	}
}

/*
	Name: close_all
	Namespace: doors
	Checksum: 0xA127C9C9
	Offset: 0xA620
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function close_all()
{
	close();
}

/*
	Name: is_open
	Namespace: doors
	Checksum: 0x87DA55CF
	Offset: 0xA640
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function is_open()
{
	return self.c_door flag::get("open");
}

/*
	Name: waittill_door_opened
	Namespace: doors
	Checksum: 0xE02B332B
	Offset: 0xA670
	Size: 0x140
	Parameters: 2
	Flags: None
*/
function waittill_door_opened(str_value, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(isdefined(self.c_door))
	{
		self.c_door flag::wait_till("open");
	}
	else
	{
		a_e_doors = get_doors(str_value, str_key);
		while(true)
		{
			var_8c4538df = 1;
			foreach(e_door in a_e_doors)
			{
				if(!e_door.c_door flag::get("open"))
				{
					var_8c4538df = 0;
					break;
				}
			}
			if(var_8c4538df)
			{
				return;
			}
			waitframe(1);
		}
	}
}

/*
	Name: waittill_door_closed
	Namespace: doors
	Checksum: 0xE999893D
	Offset: 0xA7B8
	Size: 0x182
	Parameters: 2
	Flags: None
*/
function waittill_door_closed(str_value, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(isdefined(self.c_door))
	{
		self.c_door flag::wait_till_clear("open");
		self.c_door flag::wait_till_clear("animating");
	}
	else
	{
		a_e_doors = get_doors(str_value, str_key);
		while(true)
		{
			var_a644cd9e = 1;
			foreach(e_door in a_e_doors)
			{
				if(e_door.c_door flag::get("open") || e_door.c_door flag::get("animating"))
				{
					var_a644cd9e = 0;
					break;
				}
			}
			if(var_a644cd9e)
			{
				return;
			}
			waitframe(1);
		}
	}
}

/*
	Name: function_e990dbc6
	Namespace: doors
	Checksum: 0x840BA1
	Offset: 0xA948
	Size: 0x15A
	Parameters: 3
	Flags: None
*/
function function_e990dbc6(var_db99bbb, str_value, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(isdefined(self.c_door))
	{
		self.c_door.var_f97eab64 = var_db99bbb;
		if(isdefined(self.c_door.var_d1c4f848))
		{
			self.c_door.var_d1c4f848.var_f97eab64 = var_db99bbb;
		}
	}
	else
	{
		a_e_doors = get_doors(str_value, str_key);
		foreach(e_door in a_e_doors)
		{
			if(isdefined(e_door.c_door))
			{
				e_door.c_door.var_f97eab64 = var_db99bbb;
				if(isdefined(e_door.c_door.var_d1c4f848))
				{
					e_door.c_door.var_f97eab64 = var_db99bbb;
				}
			}
		}
	}
}

/*
	Name: function_1f15ea13
	Namespace: doors
	Checksum: 0x609A027B
	Offset: 0xAAB0
	Size: 0x1A0
	Parameters: 4
	Flags: Private
*/
function private function_1f15ea13(var_518664d2, str_value, str_key, var_28c92434)
{
	var_c7d32773 = 1;
	if(var_28c92434)
	{
		var_c7d32773 = 3;
	}
	if(isdefined(self.c_door))
	{
		[[ self.c_door ]]->function_f584b243(var_518664d2, var_c7d32773);
		if(isdefined(self.c_door.var_d1c4f848))
		{
			[[ self.c_door.var_d1c4f848.c_door ]]->function_f584b243(var_518664d2, var_c7d32773);
		}
	}
	else
	{
		a_e_doors = get_doors(str_value, str_key);
		foreach(e_door in a_e_doors)
		{
			if(isdefined(e_door.c_door))
			{
				[[ e_door.c_door ]]->function_f584b243(var_518664d2, var_c7d32773);
				if(isdefined(e_door.c_door.var_d1c4f848))
				{
					[[ e_door.c_door.var_d1c4f848.c_door ]]->function_f584b243(var_518664d2, var_c7d32773);
				}
			}
		}
	}
}

/*
	Name: function_c3bee983
	Namespace: doors
	Checksum: 0xF6CB9414
	Offset: 0xAC58
	Size: 0x5A
	Parameters: 3
	Flags: None
*/
function function_c3bee983(str_value, str_key, var_28c92434)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(var_28c92434))
	{
		var_28c92434 = 0;
	}
	return function_1f15ea13(1, str_value, str_key, var_28c92434);
}

/*
	Name: function_7ea976d3
	Namespace: doors
	Checksum: 0x11472F6A
	Offset: 0xACC0
	Size: 0x52
	Parameters: 3
	Flags: None
*/
function function_7ea976d3(str_value, str_key, var_28c92434)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(var_28c92434))
	{
		var_28c92434 = 0;
	}
	return function_1f15ea13(0, str_value, str_key, var_28c92434);
}

/*
	Name: get_doors
	Namespace: doors
	Checksum: 0xE1662973
	Offset: 0xAD20
	Size: 0x246
	Parameters: 3
	Flags: None
*/
function get_doors(str_value, str_key, var_9b51a805)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(var_9b51a805))
	{
		var_9b51a805 = 0;
	}
	if(isdefined(str_value))
	{
		a_e_doors = struct::get_array(str_value, str_key);
		a_e_doors = arraycombine(a_e_doors, getentarray(str_value, str_key), 0, 0);
	}
	else
	{
		a_e_doors = struct::get_array("scriptbundle_doors", "classname");
		a_e_doors = arraycombine(a_e_doors, struct::get_array("scriptbundle_obstructions", "classname"), 0, 0);
		a_e_doors = arraycombine(a_e_doors, getentarray("smart_object_door", "script_noteworthy"), 0, 0);
	}
	if(var_9b51a805 > 0)
	{
		var_378279b6 = [];
		foreach(e_door in a_e_doors)
		{
			c_door = e_door.c_door;
			if(!isdefined(c_door))
			{
				continue;
			}
			if(var_9b51a805 == 1 && is_true(c_door.var_81f24576))
			{
				continue;
			}
			if(var_9b51a805 == 2 && is_true(c_door.var_d587661f))
			{
				continue;
			}
			var_378279b6[var_378279b6.size] = e_door;
		}
		return var_378279b6;
	}
	return a_e_doors;
}

/*
	Name: function_3353d645
	Namespace: doors
	Checksum: 0x3D3DA167
	Offset: 0xAF70
	Size: 0x1A0
	Parameters: 2
	Flags: None
*/
function function_3353d645(str_value, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(isdefined(self.c_door))
	{
		[[ self.c_door ]]->delete_door();
		if(isstruct(self))
		{
			self struct::delete();
		}
		else
		{
			self delete();
		}
	}
	else
	{
		a_e_doors = get_doors(str_value, str_key);
		foreach(e_door in a_e_doors)
		{
			if(isdefined(e_door.c_door))
			{
				[[ e_door.c_door ]]->delete_door();
				if(isstruct(e_door))
				{
					e_door struct::delete();
					continue;
				}
				if(isentity(e_door))
				{
					e_door delete();
				}
			}
		}
	}
}

/*
	Name: function_83929c65
	Namespace: doors
	Checksum: 0xEAFAFE93
	Offset: 0xB118
	Size: 0x148
	Parameters: 3
	Flags: None
*/
function function_83929c65(b_enable, str_value, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(isclass(self))
	{
		self thread function_fcadd390(b_enable);
	}
	else
	{
		if(isdefined(self.c_door))
		{
			self.c_door thread function_fcadd390(b_enable);
		}
		else
		{
			a_e_doors = get_doors(str_value, str_key);
			foreach(e_door in a_e_doors)
			{
				if(isdefined(e_door.c_door))
				{
					e_door.c_door thread function_fcadd390(b_enable);
				}
			}
		}
	}
}

/*
	Name: function_fcadd390
	Namespace: doors
	Checksum: 0xE969ACBB
	Offset: 0xB268
	Size: 0x68
	Parameters: 1
	Flags: Private
*/
function private function_fcadd390(b_enable)
{
	self.m_e_door endon(#"death");
	self notify(#"hash_50b9293fc24e2756");
	self endon(#"hash_50b9293fc24e2756");
	[[ self ]]->close_internal();
	thread [[ self ]]->function_f50c09b3(b_enable);
}

/*
	Name: function_fa74d5cd
	Namespace: doors
	Checksum: 0xBE73728F
	Offset: 0xB2D8
	Size: 0x28
	Parameters: 1
	Flags: Private
*/
function private function_fa74d5cd(c_door)
{
	self waittill(#"death");
	c_door = undefined;
}

/*
	Name: function_73f09315
	Namespace: doors
	Checksum: 0xFB4885FE
	Offset: 0xB308
	Size: 0x82
	Parameters: 2
	Flags: None
*/
function function_73f09315(str_value, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(isdefined(self.c_door))
	{
		return self.c_door.m_e_door;
	}
	a_e_doors = get_doors(str_value, str_key);
	return a_e_doors[0].c_door.m_e_door;
}

/*
	Name: function_f35467ac
	Namespace: doors
	Checksum: 0x20F96E7B
	Offset: 0xB398
	Size: 0x1C8
	Parameters: 4
	Flags: None
*/
function function_f35467ac(str_value, str_key, var_8372bfa0, var_c4304c95)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(var_8372bfa0))
	{
		var_8372bfa0 = 0;
	}
	if(!isdefined(var_c4304c95))
	{
		var_c4304c95 = 0;
	}
	if(isdefined(self.c_door))
	{
		[[ self.c_door ]]->function_e7be6e76(0, 0, var_8372bfa0, var_c4304c95);
		if(isdefined(self.c_door.var_d1c4f848))
		{
			[[ self.c_door.var_d1c4f848.c_door ]]->function_e7be6e76(0, 0, var_8372bfa0, var_c4304c95);
		}
	}
	else
	{
		a_e_doors = get_doors(str_value, str_key);
		foreach(e_door in a_e_doors)
		{
			if(isdefined(e_door.c_door))
			{
				[[ e_door.c_door ]]->function_e7be6e76(0, 0, var_8372bfa0, var_c4304c95);
				if(isdefined(e_door.c_door.var_d1c4f848))
				{
					[[ e_door.c_door.var_d1c4f848.c_door ]]->function_e7be6e76(0, 0, var_8372bfa0, var_c4304c95);
				}
			}
		}
	}
}

/*
	Name: function_f5dd4f8f
	Namespace: doors
	Checksum: 0x4EA98840
	Offset: 0xB568
	Size: 0x1D8
	Parameters: 4
	Flags: None
*/
function function_f5dd4f8f(str_value, str_key, var_8372bfa0, var_c4304c95)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(var_8372bfa0))
	{
		var_8372bfa0 = 0;
	}
	if(!isdefined(var_c4304c95))
	{
		var_c4304c95 = 0;
	}
	if(isdefined(self.c_door))
	{
		[[ self.c_door ]]->function_e7be6e76(1, 1, var_8372bfa0, var_c4304c95);
		if(isdefined(self.c_door.var_d1c4f848))
		{
			[[ self.c_door.var_d1c4f848.c_door ]]->function_e7be6e76(1, 1, var_8372bfa0, var_c4304c95);
		}
	}
	else
	{
		a_e_doors = get_doors(str_value, str_key);
		foreach(e_door in a_e_doors)
		{
			if(isdefined(e_door.c_door))
			{
				[[ e_door.c_door ]]->function_e7be6e76(1, 1, var_8372bfa0, var_c4304c95);
				if(isdefined(e_door.c_door.var_d1c4f848))
				{
					[[ e_door.c_door.var_d1c4f848.c_door ]]->function_e7be6e76(1, 1, var_8372bfa0, var_c4304c95);
				}
			}
		}
	}
}

/*
	Name: function_b391c0a0
	Namespace: doors
	Checksum: 0x5B01D8A3
	Offset: 0xB748
	Size: 0xEE
	Parameters: 2
	Flags: Private
*/
function private function_b391c0a0(gesture, target)
{
	if(is_true(self.var_99ce8ae))
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	self.var_99ce8ae = 1;
	self val::set("player_door_gesture", "allow_melee", 0);
	if(level.var_1def7d37[#"scr_door_player_gestures"])
	{
		self playgestureviewmodel(gesture, target, 1);
	}
	wait(0.05);
	self val::set("player_door_gesture", "allow_melee", 1);
	self.var_99ce8ae = undefined;
}

/*
	Name: function_d374e3dd
	Namespace: doors
	Checksum: 0x3A1B5B5C
	Offset: 0xB840
	Size: 0x166
	Parameters: 1
	Flags: Private
*/
function private function_d374e3dd(reset)
{
	if(is_true(self.var_a2f96f78.var_c85eda92))
	{
		if(!is_true(reset))
		{
			[[ self ]]->lock();
		}
	}
	if(is_true(self.var_a2f96f78.var_aff33935))
	{
		if(!is_true(reset))
		{
			[[ self ]]->lock();
		}
	}
	if(is_true(self.var_a2f96f78.var_f3475e51))
	{
		self.var_d587661f = 2;
	}
	if(is_true(self.var_a2f96f78.var_b2948217))
	{
		self.var_81f24576 = 2;
	}
	if(isdefined(self.var_a2f96f78.var_31d51062))
	{
		if(self.var_a2f96f78.var_31d51062 == "FORCE_OFF")
		{
			self.var_f97eab64 = 0;
		}
		else if(self.var_a2f96f78.var_31d51062 == "FORCE_ON")
		{
			self.var_f97eab64 = 1;
		}
	}
}

/*
	Name: function_7fe6d007
	Namespace: doors
	Checksum: 0x1F9299A9
	Offset: 0xB9B0
	Size: 0x3BA
	Parameters: 1
	Flags: Private
*/
function private function_7fe6d007(e_or_str_model)
{
	modelname = undefined;
	if(isentity(e_or_str_model))
	{
		modelname = e_or_str_model.model;
	}
	else
	{
		modelname = e_or_str_model;
	}
	extents = function_c440d28e(modelname, 1);
	dimensions = extents.maxs - extents.mins;
	var_9542dc61 = (dimensions[0], dimensions[1], 0);
	var_9542dc61 = vectornormalize(var_9542dc61);
	if(abs(dimensions[0]) > abs(dimensions[1]))
	{
		if(abs(extents.maxs[0]) > abs(extents.mins[0]))
		{
			self.var_e73bf21e = "-y";
			self.var_b25124c7 = "x";
		}
		else
		{
			self.var_e73bf21e = "y";
			self.var_b25124c7 = "-x";
		}
		if(isdefined(self.m_s_bundle) && (self.m_s_bundle.door_open_method == "swing_away_from_player" || self.m_s_bundle.door_open_method == "swing"))
		{
			if(self.m_s_bundle.door_swing_angle > 0 && self.var_b25124c7 == "x" || (self.m_s_bundle.door_swing_angle < 0 && self.var_b25124c7 == ("-x")))
			{
				self.var_e73bf21e = "y";
			}
			else
			{
				self.var_e73bf21e = "-y";
			}
		}
		self.var_e9da41b9 = abs(dimensions[0]);
	}
	else
	{
		if(abs(extents.maxs[1]) > abs(extents.mins[1]))
		{
			self.var_e73bf21e = "-x";
			self.var_b25124c7 = "y";
		}
		else
		{
			self.var_e73bf21e = "x";
			self.var_b25124c7 = "-y";
		}
		if(isdefined(self.m_s_bundle) && self.m_s_bundle.door_open_method == "swing_away_from_player")
		{
			if(self.m_s_bundle.door_swing_angle > 0 && self.var_b25124c7 == "y" || (self.m_s_bundle.door_swing_angle < 0 && self.var_b25124c7 == ("-y")))
			{
				self.var_e73bf21e = "-x";
			}
			else
			{
				self.var_e73bf21e = "x";
			}
		}
		self.var_e9da41b9 = abs(dimensions[1]);
	}
}

/*
	Name: function_fb354714
	Namespace: doors
	Checksum: 0xAE6DBC2E
	Offset: 0xBD78
	Size: 0xDA
	Parameters: 1
	Flags: None
*/
function function_fb354714(var_225a57cd)
{
	if(!isdefined(var_225a57cd))
	{
		var_225a57cd = 0;
	}
	dir = undefined;
	if(isdefined(self.var_e73bf21e))
	{
		if(isvec(var_225a57cd))
		{
			dir = function_98d85e14(self.var_e73bf21e, var_225a57cd);
		}
		else
		{
			if(var_225a57cd)
			{
				dir = function_98d85e14(self.var_e73bf21e, self.var_85f2454d.angles);
			}
			else
			{
				dir = function_98d85e14(self.var_e73bf21e, self.m_e_door.angles);
			}
		}
	}
	return dir;
}

/*
	Name: function_eea7cdb4
	Namespace: doors
	Checksum: 0x5649C33
	Offset: 0xBE60
	Size: 0xDA
	Parameters: 1
	Flags: None
*/
function function_eea7cdb4(var_225a57cd)
{
	if(!isdefined(var_225a57cd))
	{
		var_225a57cd = 0;
	}
	dir = undefined;
	if(isdefined(self.var_b25124c7))
	{
		if(isvec(var_225a57cd))
		{
			dir = function_98d85e14(self.var_b25124c7, var_225a57cd);
		}
		else
		{
			if(var_225a57cd)
			{
				dir = function_98d85e14(self.var_b25124c7, self.var_85f2454d.angles);
			}
			else
			{
				dir = function_98d85e14(self.var_b25124c7, self.m_e_door.angles);
			}
		}
	}
	return dir;
}

/*
	Name: function_98d85e14
	Namespace: doors
	Checksum: 0x1DB368B6
	Offset: 0xBF48
	Size: 0xD4
	Parameters: 2
	Flags: Private
*/
function private function_98d85e14(var_27f61ee5, angles)
{
	if(var_27f61ee5 == "y")
	{
		dir = anglestoright(angles) * -1;
	}
	else
	{
		if(var_27f61ee5 == ("-y"))
		{
			dir = anglestoright(angles);
		}
		else
		{
			if(var_27f61ee5 == "x")
			{
				dir = anglestoforward(angles);
			}
			else
			{
				dir = anglestoforward(angles) * -1;
			}
		}
	}
	return dir;
}

/*
	Name: function_c2758350
	Namespace: doors
	Checksum: 0x77321818
	Offset: 0xC028
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_c2758350()
{
	v_angles = self getplayerangles();
	return (0, v_angles[1], 0);
}

/*
	Name: get_door_center
	Namespace: doors
	Checksum: 0x5041870C
	Offset: 0xC068
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function get_door_center(var_225a57cd)
{
	if(!isdefined(var_225a57cd))
	{
		var_225a57cd = 0;
	}
	if(var_225a57cd && isdefined(self.var_48f481cb))
	{
		return self.var_48f481cb + vectorscale((0, 0, 1), 55);
	}
	angles = self get_door_angles(var_225a57cd);
	var_9ba2a2c = getxmodelcenteroffset(self.m_e_door.model, 1);
	var_9998d3ec = rotatepoint(var_9ba2a2c, angles);
	return self.m_e_door.origin + (var_9998d3ec[0], var_9998d3ec[1], 55);
}

/*
	Name: get_door_bottom_center
	Namespace: doors
	Checksum: 0xDD9F03D
	Offset: 0xC158
	Size: 0xE2
	Parameters: 1
	Flags: None
*/
function get_door_bottom_center(var_225a57cd)
{
	if(!isdefined(var_225a57cd))
	{
		var_225a57cd = 0;
	}
	if(var_225a57cd == 0)
	{
		point = self.m_e_door.origin + ((self function_eea7cdb4() * self.var_e9da41b9) * 0.5);
		return point;
	}
	if(isdefined(self.var_48f481cb))
	{
		return self.var_48f481cb;
	}
	self.var_48f481cb = self get_door_center();
	self.var_48f481cb = (self.var_48f481cb[0], self.var_48f481cb[1], self.m_e_door.origin[2]);
	return self.var_48f481cb;
}

/*
	Name: get_door_angles
	Namespace: doors
	Checksum: 0x20CA143C
	Offset: 0xC248
	Size: 0x56
	Parameters: 1
	Flags: None
*/
function get_door_angles(var_225a57cd)
{
	if(!isdefined(var_225a57cd))
	{
		var_225a57cd = 0;
	}
	if(isdefined(self.m_e_door) && !var_225a57cd)
	{
		return self.m_e_door.angles;
	}
	return self.var_85f2454d.angles;
}

/*
	Name: door_bashable_by_player
	Namespace: doors
	Checksum: 0x4CC5568B
	Offset: 0xC2A8
	Size: 0x286
	Parameters: 1
	Flags: Private
*/
function private door_bashable_by_player(player)
{
	if(is_true(self.var_d587661f) || is_true(self.var_14382d8d) || (!self flag::get("door_pushable") && (is_true(self flag::get("door_fully_open")) || is_true(self.var_c4c3fa39))))
	{
		/#
			self.debug_activity = "";
		#/
		return false;
	}
	if(player getcurrentweapon() == level.weaponnone)
	{
		return false;
	}
	var_9c77e513 = anglestoforward((0, self.m_e_door.angles[1], 0));
	var_7636f9c2 = anglestoforward((0, self.var_85f2454d.angles[1], 0));
	if(vectordot(var_9c77e513, var_7636f9c2) < 0.5)
	{
		return false;
	}
	var_e5959a30 = self get_door_bottom_center();
	var_e5959a30 = (var_e5959a30[0], var_e5959a30[1], player.origin[2]);
	if(util::within_fov(player.origin, player function_c2758350(), var_e5959a30, 0.77))
	{
		return true;
	}
	var_dec83597 = self function_c177702e();
	var_dec83597 = (var_dec83597[0], var_dec83597[1], player.origin[2]);
	if(util::within_fov(player.origin, player function_c2758350(), var_dec83597, 0.866))
	{
		return true;
	}
	return false;
}

/*
	Name: function_c177702e
	Namespace: doors
	Checksum: 0xC5D835C
	Offset: 0xC538
	Size: 0x38
	Parameters: 0
	Flags: Private
*/
function private function_c177702e()
{
	return self.m_e_door.origin + (self function_eea7cdb4() * (self.var_e9da41b9 - 7));
}

/*
	Name: should_bash_open
	Namespace: doors
	Checksum: 0x27000085
	Offset: 0xC578
	Size: 0x1DC
	Parameters: 1
	Flags: Private
*/
function private should_bash_open(player)
{
	/#
		self thread bash_debug(1);
	#/
	if(door_bashable_by_player(player))
	{
		if(player ismeleeing())
		{
			/#
				self thread bash_debug(1000);
			#/
			return true;
		}
		if(!player issprinting())
		{
			return false;
		}
		if(level.var_1def7d37[#"scr_door_bash_requires_use"])
		{
			if(!player usebuttonpressed())
			{
				return false;
			}
		}
		playerspeed = length(player getvelocity());
		if(playerspeed < 50)
		{
			return false;
		}
		vec = vectornormalize(player getplayercamerapos() - self get_door_center());
		var_ed80ebc4 = self function_fb354714();
		var_9bd4d937 = vectordot(vec, var_ed80ebc4);
		if(abs(var_9bd4d937) < 0.4)
		{
			return false;
		}
		/#
			self thread bash_debug(1000);
		#/
		return true;
	}
	return false;
}

/*
	Name: bash_debug
	Namespace: doors
	Checksum: 0xC18D366
	Offset: 0xC760
	Size: 0x394
	Parameters: 1
	Flags: Private
*/
function private bash_debug(duration)
{
	/#
		if(level.var_1def7d37[#"hash_5171254138328d84"])
		{
			var_1a23fa7 = [];
			var_c03beac5 = [];
			var_1a23fa7[0] = self get_door_bottom_center();
			var_c03beac5[0] = 0.77;
			var_1a23fa7[1] = self function_c177702e();
			var_c03beac5[1] = 0.866;
			center = self get_door_center();
			player = level.players[0];
			line(player.origin, center, (1, 1, 1), 1, 0, duration);
			line(player.origin, player.origin + (anglestoforward(player getplayerangles()) * 32), (1, 0.5, 0), 1, 0, duration);
			for(i = 0; i < var_1a23fa7.size; i++)
			{
				var_6dcc5f28 = var_1a23fa7[i] - player.origin;
				var_6dcc5f28 = (var_6dcc5f28[0], var_6dcc5f28[1], 0);
				normal = vectornormalize(var_6dcc5f28);
				forward = anglestoforward(player getplayerangles());
				dot = vectordot(forward, normal);
				color = (dot >= var_c03beac5[i] ? (0, 1, 0) : (1, 0, 0));
				debugstar(var_1a23fa7[i], duration, color, "" + dot, 0.05);
				line(player.origin, var_1a23fa7[i], color, 1, 0, duration);
			}
			vec = vectornormalize(player getplayercamerapos() - center);
			var_ed80ebc4 = self function_fb354714();
			dot = vectordot(vec, var_ed80ebc4);
			color = (abs(dot) >= 0.4 ? (0, 1, 0) : (1, 0, 0));
			print3d(center + (vectorscale((0, 0, -1), 1.5)), "" + dot, color, 1, 0.1, duration);
		}
	#/
}

/*
	Name: bashed_locked_door
	Namespace: doors
	Checksum: 0x49F0F51C
	Offset: 0xCB00
	Size: 0x122
	Parameters: 1
	Flags: Private
*/
function private bashed_locked_door(velocity)
{
	velocity = velocity;
	player = self.var_22fae777;
	player endon(#"death");
	if(isdefined(self.var_85a57869))
	{
		return;
	}
	self.var_85a57869 = 1;
	thread bashed_locked_door_sfx();
	self notify(#"hash_55f12a31ee0b246e");
	player viewkick(10, self get_door_center());
	earthquake(1, 0.3, player.origin, 75);
	player playrumbleonentity("damage_heavy");
	while(player ismeleeing())
	{
		waitframe(1);
	}
	self.var_85a57869 = undefined;
}

/*
	Name: bashed_locked_door_sfx
	Namespace: doors
	Checksum: 0x16AB463
	Offset: 0xCC30
	Size: 0x154
	Parameters: 0
	Flags: Private
*/
function private bashed_locked_door_sfx()
{
	player = self.var_22fae777;
	if(isdefined(self.m_s_bundle.var_7240cb7d))
	{
		playfx(self.m_s_bundle.var_7240cb7d, self.m_e_door.origin + vectorscale((0, 0, 1), 42));
	}
	if(isdefined(self.m_s_bundle.var_8c3db964))
	{
		if(randomint(100) < 40)
		{
			player playsound("breathing_limp");
		}
		org = spawn("script_origin", self.m_e_door.origin + vectorscale((0, 0, 1), 42));
		org playsoundwithnotify(self.m_s_bundle.var_8c3db964, "sounddone");
		org waittill(#"sounddone");
		org deletedelay();
	}
}

/*
	Name: bash_monitor
	Namespace: doors
	Checksum: 0x1DD31BC1
	Offset: 0xCD90
	Size: 0x1BA
	Parameters: 0
	Flags: Private
*/
function private bash_monitor()
{
	self endon(#"death");
	while(true)
	{
		ents = getentitiesinradius(self.origin, 60, 6);
		foreach(ent in ents)
		{
			if(isdefined(ent.c_door))
			{
				c_door = ent.c_door;
				if(c_door flag::get("door_pushable") || !c_door flag::get("open") && !c_door flag::get("locked") && !c_door flag::get("animating"))
				{
					if(c_door bash_door_isplayerclose(self) && c_door should_bash_open(self))
					{
						c_door thread door_bash_open(self);
					}
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: bash_door_isplayerclose
	Namespace: doors
	Checksum: 0xC02EC2BA
	Offset: 0xCF58
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function bash_door_isplayerclose(player)
{
	z = abs(player.origin[2] - self.m_e_door.origin[2]);
	if(z < 35)
	{
		endpoint = self get_door_bottom_center();
		if(!isdefined(endpoint))
		{
			endpoint = self.m_e_door.origin;
		}
		d = distancesquared(player.origin, endpoint);
		range = (self flag::get("locked") ? 60 : 60);
		if(d < range * range)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: door_bash_open
	Namespace: doors
	Checksum: 0x7FBE5ACD
	Offset: 0xD068
	Size: 0x16C
	Parameters: 3
	Flags: None
*/
function door_bash_open(var_84e2c431, var_a6028302, var_d14527df)
{
	if(!isdefined(var_a6028302))
	{
		var_a6028302 = 0;
	}
	self endon(#"entitydeleted");
	self.var_22fae777 = var_84e2c431;
	if(self flag::get("locked") && isinarray(level.players, var_84e2c431))
	{
		self bashed_locked_door(var_84e2c431 getvelocity());
		return;
	}
	if(isplayer(var_84e2c431))
	{
		if(!var_a6028302)
		{
			self door_bash_presentation(var_84e2c431);
		}
		var_84e2c431 notify(#"hash_5676dcd12f1089f9", self);
		level thread function_df978de8(450, "door_bash", var_84e2c431, var_d14527df);
	}
	else
	{
		self notify(#"hash_1fb508e70d76c269");
	}
	self.var_c4c3fa39 = 1;
	self.m_e_door thread open(undefined, undefined, var_84e2c431);
}

/*
	Name: function_14c2fe40
	Namespace: doors
	Checksum: 0x83C1C22E
	Offset: 0xD1E0
	Size: 0xD8
	Parameters: 1
	Flags: Private
*/
function private function_14c2fe40(player)
{
	weapon = player getcurrentweapon();
	if(weapon.displayname == #"hash_5fe1e4f4cfb91755" || (is_true(weapon.ismeleeweapon) && !is_true(weapon.isbulletweapon) && !is_true(weapon.isprojectileweapon)))
	{
		return true;
	}
	if(weapon.name == #"eq_spy_camera")
	{
		return true;
	}
	return false;
}

/*
	Name: door_bash_presentation
	Namespace: doors
	Checksum: 0xDD91C3B3
	Offset: 0xD2C0
	Size: 0xF4
	Parameters: 1
	Flags: Private
*/
function private door_bash_presentation(player)
{
	if(player meleebuttonpressed() && !player issprinting())
	{
		if(function_14c2fe40(player))
		{
			player thread function_b391c0a0("ges_door_bash", undefined);
		}
		wait(0.1);
	}
	screenshake(player.origin, 16, 0, 0, 0.45);
	player playrumbleonentity("grenade_rumble");
	earthquake(0.6, 0.75, player.origin, 200);
}

/*
	Name: function_df978de8
	Namespace: doors
	Checksum: 0xE7A71824
	Offset: 0xD3C0
	Size: 0x148
	Parameters: 4
	Flags: Private
*/
function private function_df978de8(radius, event, var_84e2c431, var_d14527df)
{
	dist = (isdefined(radius) ? radius : event);
	guys = getaiteamarray("axis");
	guys = arraysortclosest(guys, (isdefined(var_d14527df) ? var_d14527df : var_84e2c431.origin), undefined, undefined, dist);
	foreach(guy in guys)
	{
		if(isdefined(guy.stealth))
		{
			guy function_a3fcf9e0(event, var_84e2c431, (isdefined(var_d14527df) ? var_d14527df : var_84e2c431.origin));
		}
	}
}

/*
	Name: function_65028b88
	Namespace: doors
	Checksum: 0x6B32CBDE
	Offset: 0xD510
	Size: 0x2C
	Parameters: 1
	Flags: Private
*/
function private function_65028b88(var_248cbbcf)
{
	self.c_door thread door_bash_open(var_248cbbcf.player);
}

/*
	Name: function_8d016934
	Namespace: doors
	Checksum: 0xDDDB689E
	Offset: 0xD548
	Size: 0x22
	Parameters: 1
	Flags: Private
*/
function private function_8d016934(var_248cbbcf)
{
	return function_14c2fe40(var_248cbbcf.player);
}

/*
	Name: should_do_gesture
	Namespace: doors
	Checksum: 0x84F750F4
	Offset: 0xD578
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private should_do_gesture()
{
	if(level.var_1def7d37[#"scr_door_player_gestures"] == 0)
	{
		return 0;
	}
	return self getcurrentweapon() != level.weaponnone;
}

/*
	Name: player_door_gesture
	Namespace: doors
	Checksum: 0xC7EC9F25
	Offset: 0xD5C8
	Size: 0x10C
	Parameters: 1
	Flags: Private
*/
function private player_door_gesture(gesture)
{
	self notify(#"player_door_gesture");
	self endon(#"player_door_gesture");
	if(!isdefined(gesture))
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	target = util::spawn_model("tag_origin", self.origin, self function_c2758350());
	if(self should_do_gesture())
	{
		self function_b391c0a0(gesture, target);
		time = self getgestureanimlength(gesture);
		wait(time);
	}
	if(isdefined(target))
	{
		target delete();
	}
}

/*
	Name: function_d2a304e
	Namespace: doors
	Checksum: 0x71D62B1F
	Offset: 0xD6E0
	Size: 0x1BE
	Parameters: 1
	Flags: Private
*/
function private function_d2a304e(a_doors)
{
	foreach(s_instance in a_doors)
	{
		if(is_true(s_instance.var_aff33935))
		{
			var_1ab5a0b8 = struct::get_script_bundle_instances("minigame_lockpick", array((isdefined(s_instance.targetname) ? s_instance.targetname : ""), "target"));
			var_928d15df = 0;
			foreach(var_d2029cba in var_1ab5a0b8)
			{
				if(isdefined(var_d2029cba.var_5350598b))
				{
					continue;
				}
				var_928d15df = 1;
				break;
			}
			if(!var_928d15df)
			{
				var_10d2a490 = s_instance function_1e18148c();
				s_instance.var_ea225236 = var_10d2a490;
			}
		}
	}
}

/*
	Name: function_1e18148c
	Namespace: doors
	Checksum: 0xF0A61F60
	Offset: 0xD8A8
	Size: 0x2FE
	Parameters: 0
	Flags: Private
*/
function private function_1e18148c()
{
	/#
		assert(is_false(level flag::get(#"hash_ead1c2fc78eb61c")));
	#/
	s_minigame = spawnstruct();
	var_33468886 = spawnstruct();
	var_33468886 function_7fe6d007(self.model);
	var_3d88b74f = function_98d85e14(var_33468886.var_b25124c7, self.angles);
	var_69ede289 = vectortoangles(var_3d88b74f);
	local_offset = (var_33468886.var_e9da41b9 - 5) * function_98d85e14(var_33468886.var_b25124c7, (0, 0, 0)) + vectorscale((0, 0, 1), 47);
	world_offset = rotatepoint(local_offset, var_69ede289);
	level minigame::function_63673f23(s_minigame, "lockpick");
	s_minigame.angles = self.angles;
	s_minigame.classname = "scriptbundle_minigame_lockpick";
	s_minigame.modelscale = 1;
	s_minigame.origin = self.origin + world_offset;
	s_minigame.require_look_at = 1;
	s_minigame.var_4e0f62f3 = "Exclusive";
	s_minigame.script_delete = 1;
	s_minigame.script_difficulty = self.script_difficulty;
	s_minigame.script_enable_on_start = 1;
	s_minigame.var_42c5101 = self.var_42c5101;
	s_minigame.var_5ebe1cc1 = 0;
	s_minigame.var_3b6bc456 = self.var_3b6bc456;
	s_minigame.script_team = (isdefined(self.script_team) ? self.script_team : #"any");
	s_minigame.scriptbundlename = #"minigame_lockpick";
	s_minigame.var_5350598b = self;
	s_minigame.ent = self.c_door.m_e_door;
	s_minigame.local_offset = local_offset;
	s_minigame.var_ac5b22fa = self;
	if(isdefined(self.targetname))
	{
		s_minigame.target = self.targetname;
	}
	else
	{
		self.targetname = "auto_assigned_name: " + s_minigame.str_identifier;
		s_minigame.target = self.targetname;
	}
	return s_minigame;
}

/*
	Name: function_191c5a63
	Namespace: doors
	Checksum: 0x8383E44D
	Offset: 0xDBB0
	Size: 0x5F0
	Parameters: 0
	Flags: None
*/
function function_191c5a63()
{
	offset = undefined;
	if(!sessionmodeiscampaigngame() || !isdefined(level.var_6a7fb742))
	{
		return;
	}
	player = getplayers()[0];
	while(!isdefined(player))
	{
		player = getplayers()[0];
		waitframe(1);
	}
	if(!isdefined(self.m_e_door))
	{
		return;
	}
	close = self flag::get("door_fully_open") && is_true(self.m_s_bundle.door_closes);
	if(!is_true(close) && self function_53f46e97())
	{
		z_offset = max((isdefined(self.m_s_bundle.door_triggeroffsetz) ? self.m_s_bundle.door_triggeroffsetz : 47), 0);
		offset = (self.var_e9da41b9 - 2) * function_98d85e14(self.var_b25124c7, (0, 0, 0)) + (0, 0, z_offset);
	}
	else
	{
		loc_0000DDB0:
		offset = ((isdefined(self.m_s_bundle.door_triggeroffsetx) ? self.m_s_bundle.door_triggeroffsetx : 0), (isdefined(self.m_s_bundle.door_triggeroffsety) ? self.m_s_bundle.door_triggeroffsety : 0), max((isdefined(self.m_s_bundle.door_triggeroffsetz) ? self.m_s_bundle.door_triggeroffsetz : 0), 0));
	}
	var_754bedbb = offset[2] <= 0;
	var_c29308f4 = {#hash_531201f1:&function_82f0f91b, #groups:#"doors", #hash_9a27c4ee:1, #hash_8ce60046:1, #hash_be77841a:0, #hash_3c8a8153:1, #hash_5e83875a:30, #hash_71b9f0c0:240};
	if(isdefined(self.var_d1c4f848.c_door.m_e_door))
	{
		var_c29308f4.var_27a7ecaa = self.var_d1c4f848.c_door.m_e_door;
		var_c29308f4.var_1e4cbecf = self.var_d1c4f848.c_door.m_e_door;
	}
	if(is_true(close))
	{
		var_c29308f4.var_4d98c3ce = #"hash_13649de3a914d713";
		var_c29308f4.var_de6f0004 = self.m_s_bundle.var_4123e857;
		self.m_e_door thread [[level.var_6a7fb742]](#"use", var_c29308f4);
	}
	else
	{
		hint = #"hash_7b4d7f70e8bef419";
		if(isdefined(self.m_s_bundle.door_interact))
		{
			var_b4d98031 = getscriptbundle(self.m_s_bundle.door_interact);
			if(isdefined(var_b4d98031.str_hint))
			{
				hint = var_b4d98031.str_hint;
			}
		}
		var_c29308f4.var_4d98c3ce = hint;
		var_c29308f4.var_de6f0004 = self.m_s_bundle.var_4123e857;
		self.m_e_door thread [[level.var_6a7fb742]](#"use", var_c29308f4);
		if(!is_true(self.var_d587661f) && !is_true(self.var_c4c3fa39))
		{
			var_c29308f4.var_4d98c3ce = #"hash_33182658cd3b9acf";
			var_c29308f4.var_de6f0004 = 0;
			var_c29308f4.var_4ac77177 = 0;
			var_c29308f4.var_9cc6a78e = 60;
			var_c29308f4.var_5e83875a = 75;
			var_c29308f4.var_531201f1 = &function_cd4bfc24;
			var_c29308f4.complete_callback = &function_65028b88;
			var_c29308f4.var_8cff8c16 = &function_8d016934;
			self.m_e_door thread [[level.var_6a7fb742]](#"melee", var_c29308f4);
		}
	}
	if(isdefined(level.var_a29d8d23))
	{
		self.m_e_door thread [[level.var_a29d8d23]]({#hash_754bedbb:var_754bedbb, #offset:offset});
	}
}

/*
	Name: function_cd4bfc24
	Namespace: doors
	Checksum: 0xD57E595E
	Offset: 0xE1A8
	Size: 0xEA
	Parameters: 1
	Flags: Private
*/
function private function_cd4bfc24(var_248cbbcf)
{
	result = !is_true(self.c_door.var_d587661f) && !is_true(self.c_door.var_c4c3fa39) && self.c_door door_bashable_by_player(var_248cbbcf.player);
	if(!result && isdefined(self.c_door.var_d1c4f848.c_door))
	{
		result = self.c_door.var_d1c4f848.c_door door_bashable_by_player(var_248cbbcf.player);
	}
	return result;
}

/*
	Name: function_82f0f91b
	Namespace: doors
	Checksum: 0x4E75D483
	Offset: 0xE2A0
	Size: 0x118
	Parameters: 1
	Flags: Private
*/
function private function_82f0f91b(var_248cbbcf)
{
	return !is_true(self.c_door.var_81f24576) && !self.c_door flag::get("locked") && !self.c_door flag::get("animating") && (!self.c_door flag::get("open") && !self.c_door function_4011a3d9() || (self.c_door flag::get("door_fully_open") && is_true(self.c_door.m_s_bundle.door_closes)));
}

/*
	Name: function_656c898c
	Namespace: doors
	Checksum: 0x56A1FF3B
	Offset: 0xE3C0
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function function_656c898c()
{
	if(!sessionmodeiscampaigngame() || !isdefined(level.var_3626dfc))
	{
		return;
	}
	if(isdefined(self.m_e_door))
	{
		self.m_e_door thread [[level.var_3626dfc]](#"use");
		if(isdefined(self.m_e_door.var_3e95b88f.var_294a441e[#"melee"]))
		{
			self.m_e_door thread [[level.var_3626dfc]](#"melee");
		}
	}
}

/*
	Name: function_19b91fc1
	Namespace: doors
	Checksum: 0x990FD2C3
	Offset: 0xE478
	Size: 0xBE
	Parameters: 0
	Flags: None
*/
function function_19b91fc1()
{
	if(!sessionmodeiscampaigngame() || !isdefined(level.var_6a7fb742))
	{
		if(isdefined(self.m_s_bundle.door_interact))
		{
			var_b4d98031 = getscriptbundle(self.m_s_bundle.door_interact);
			/#
				assert(isdefined(var_b4d98031));
			#/
			if(is_true(var_b4d98031.var_a865c2cd) || isdefined(var_b4d98031.str_hint))
			{
				return true;
			}
		}
	}
	return false;
}

