#using script_1d77abab28b21372;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\statemachine_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\cp_common\util.gsc;

class cpickupitem : cbaseinteractable
{
	var m_e_carry_model;
	var m_e_model;
	var m_n_despawn_wait;
	var m_custom_despawn_func;
	var m_e_body_trigger;
	var m_n_drop_offset;
	var m_str_modelname;
	var m_fx_glow;
	var m_str_itemname;
	var m_str_pickup_hintstring;
	var m_iscarryable;
	var m_n_respawn_rounds;
	var m_n_respawn_time;
	var m_custom_spawn_func;

	/*
		Name: constructor
		Namespace: cpickupitem
		Checksum: 0x5B01D494
		Offset: 0x210
		Size: 0xF8
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
		self.m_n_respawn_time = 1;
		self.m_n_respawn_rounds = 0;
		self.m_n_throw_distance_min = 128;
		self.m_n_throw_distance_max = 256;
		self.m_n_throw_max_hold_duration = 2;
		self.m_v_holding_angle = (0, 0, 0);
		self.m_n_despawn_wait = 0;
		self.m_v_holding_offset_angle = vectorscale((1, 0, 0), 45);
		self.m_n_holding_distance = 64;
		self.m_n_drop_offset = 0;
		self.m_iscarryable = 1;
		self.a_carry_threads = [];
		self.a_carry_threads[0] = &carry_pickupitem;
		self.a_drop_funcs = [];
		self.a_drop_funcs[0] = &drop_pickupitem;
	}

	/*
		Name: destructor
		Namespace: cpickupitem
		Checksum: 0x405284B4
		Offset: 0x970
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: spawn_at_struct
		Namespace: cpickupitem
		Checksum: 0xE0F4BCD5
		Offset: 0x350
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function spawn_at_struct(str_struct)
	{
		if(!isdefined(str_struct.angles))
		{
			str_struct.angles = (0, 0, 0);
		}
		respawn_loop(str_struct.origin, str_struct.angles);
	}

	/*
		Name: spawn_at_position
		Namespace: cpickupitem
		Checksum: 0x68AA80A1
		Offset: 0x3A8
		Size: 0x2C
		Parameters: 2
		Flags: None
	*/
	function spawn_at_position(v_pos, v_angles)
	{
		respawn_loop(v_pos, v_angles);
	}

	/*
		Name: get_model
		Namespace: cpickupitem
		Checksum: 0x729DD2AC
		Offset: 0x310
		Size: 0x32
		Parameters: 0
		Flags: None
	*/
	function get_model()
	{
		if(isdefined(m_e_carry_model))
		{
			return m_e_carry_model;
		}
		if(isdefined(m_e_model))
		{
			return m_e_model;
		}
		return undefined;
	}

	/*
		Name: pickupitem_despawn_timer
		Namespace: cpickupitem
		Checksum: 0xF68DC1E6
		Offset: 0x770
		Size: 0x74
		Parameters: 0
		Flags: None
	*/
	function pickupitem_despawn_timer()
	{
		self endon(#"cancel_despawn");
		if(m_n_despawn_wait <= 0)
		{
			return;
		}
		self thread debug_despawn_timer();
		wait(m_n_despawn_wait);
		if(isdefined(m_custom_despawn_func))
		{
			[[m_custom_despawn_func]]();
		}
		else
		{
			pickupitem_despawn();
		}
	}

	/*
		Name: carry_pickupitem
		Namespace: cpickupitem
		Checksum: 0x675465AE
		Offset: 0x8F0
		Size: 0x3C
		Parameters: 1
		Flags: None
	*/
	function carry_pickupitem(e_triggerer)
	{
		m_e_model delete();
		m_e_body_trigger setinvisibletoall();
	}

	/*
		Name: drop_pickupitem
		Namespace: cpickupitem
		Checksum: 0x495E1C01
		Offset: 0x938
		Size: 0x2C
		Parameters: 1
		Flags: None
	*/
	function drop_pickupitem(e_triggerer)
	{
		pickupitem_spawn(e_triggerer.origin, e_triggerer.angles);
	}

	/*
		Name: pickupitem_despawn
		Namespace: cpickupitem
		Checksum: 0x1F2EB2F4
		Offset: 0x8A0
		Size: 0x16
		Parameters: 0
		Flags: None
	*/
	function pickupitem_despawn()
	{
		self notify(#"respawn_pickupitem");
	}

	/*
		Name: pickupitem_spawn
		Namespace: cpickupitem
		Checksum: 0xD652FA1C
		Offset: 0x488
		Size: 0x2DC
		Parameters: 2
		Flags: None
	*/
	function pickupitem_spawn(v_pos, v_angles)
	{
		if(!isdefined(m_e_model))
		{
			self.m_e_model = util::spawn_model(m_str_modelname, v_pos + (0, 0, m_n_drop_offset), v_angles);
			m_e_model notsolid();
			if(isdefined(m_fx_glow))
			{
				playfxontag(m_fx_glow, m_e_model, "tag_origin");
			}
		}
		self.m_str_pickup_hintstring = ("Press and hold ^3[{+activate}]^7 to pick up ") + m_str_itemname;
		if(!isdefined(m_e_body_trigger))
		{
			e_trigger = cbaseinteractable::spawn_body_trigger(v_pos);
			cbaseinteractable::set_body_trigger(e_trigger);
		}
		m_e_body_trigger setvisibletoall();
		m_e_body_trigger.origin = v_pos;
		m_e_body_trigger notify(#"upgrade_trigger_moved");
		m_e_body_trigger notify(#"upgrade_trigger_enable", {#is_enabled:1});
		m_e_body_trigger sethintstring(m_str_pickup_hintstring);
		m_e_body_trigger.str_itemname = m_str_itemname;
		if(!isdefined(m_e_body_trigger.targetname))
		{
			m_str_targetname = "";
			m_a_str_targetname = strtok(tolower(m_str_itemname), " ");
			foreach(n_index, m_str_targetname_piece in m_a_str_targetname)
			{
				if(n_index > 0)
				{
					m_str_targetname = m_str_targetname + "_";
				}
				m_str_targetname = m_str_targetname + m_str_targetname_piece;
			}
			m_e_body_trigger.targetname = "trigger_" + m_str_targetname;
		}
		if(m_iscarryable)
		{
			self thread cbaseinteractable::thread_allow_carry();
		}
	}

	/*
		Name: pickupitem_respawn_delay
		Namespace: cpickupitem
		Checksum: 0xECC218DD
		Offset: 0x8C0
		Size: 0x28
		Parameters: 0
		Flags: None
	*/
	function pickupitem_respawn_delay()
	{
		if(m_n_respawn_rounds > 0)
		{
		}
		else if(m_n_respawn_time > 0)
		{
			wait(m_n_respawn_time);
		}
	}

	/*
		Name: respawn_loop
		Namespace: cpickupitem
		Checksum: 0xE276176
		Offset: 0x3E0
		Size: 0xA0
		Parameters: 2
		Flags: None
	*/
	function respawn_loop(v_pos, v_angles)
	{
		while(true)
		{
			if(isdefined(m_custom_spawn_func))
			{
				[[m_custom_spawn_func]](v_pos, v_angles);
			}
			else
			{
				self.m_str_holding_hintstring = ("Press ^3[{+usereload}]^7 to drop ") + m_str_itemname;
				pickupitem_spawn(v_pos, v_angles);
			}
			self waittill(#"respawn_pickupitem");
			pickupitem_respawn_delay();
		}
	}

	/*
		Name: debug_despawn_timer
		Namespace: cpickupitem
		Checksum: 0x2DC368E
		Offset: 0x7F0
		Size: 0xA4
		Parameters: 0
		Flags: None
	*/
	function debug_despawn_timer()
	{
		self endon(#"cancel_despawn");
		n_time_remaining = m_n_despawn_wait;
		while(n_time_remaining >= 0 && isdefined(m_e_model))
		{
			/#
				print3d(m_e_model.origin + vectorscale((0, 0, 1), 15), n_time_remaining, (1, 0, 0), 1, 1, 20);
			#/
			wait(1);
			n_time_remaining = n_time_remaining - 1;
		}
	}

}

class cbaseinteractable 
{
	var m_e_body_trigger;
	var m_iscarryable;
	var m_allow_carry_custom_conditions_func;
	var a_carry_threads;
	var m_str_itemname;
	var m_v_holding_offset_angle;
	var m_v_holding_angle;
	var m_n_holding_distance;
	var m_str_carry_model;
	var m_str_modelname;
	var m_e_carry_model;
	var m_n_body_trigger_height;
	var m_n_body_trigger_radius;
	var a_drop_funcs;
	var m_repair_custom_complete_func;
	var m_e_player_currently_holding;
	var m_repair_complete_func;
	var m_prompt_manager_custom_func;
	var m_isfunctional;
	var m_n_repair_height;
	var m_n_repair_radius;

	/*
		Name: constructor
		Namespace: cbaseinteractable
		Checksum: 0x15A19908
		Offset: 0x1138
		Size: 0x82
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
		self.m_isfunctional = 1;
		self.m_ishackable = 0;
		self.m_iscarryable = 0;
		self.m_n_body_trigger_radius = 36;
		self.m_n_body_trigger_height = 128;
		self.m_n_repair_radius = 72;
		self.m_n_repair_height = 128;
		self.m_repair_complete_func = &repair_completed;
		self.m_str_itemname = "Item";
	}

	/*
		Name: destructor
		Namespace: cbaseinteractable
		Checksum: 0x80F724D1
		Offset: 0x21E0
		Size: 0x4
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: thread_allow_carry
		Namespace: cbaseinteractable
		Checksum: 0xAD2B60E
		Offset: 0x1418
		Size: 0x1CA
		Parameters: 0
		Flags: None
	*/
	function thread_allow_carry()
	{
		self notify(#"thread_allow_carry");
		self endon(#"thread_allow_carry", #"unmake");
		if(1)
		{
			for(;;)
			{
				waitframe(1);
				return;
				waitresult = undefined;
				waitresult = m_e_body_trigger waittill(#"trigger");
				e_triggerer = waitresult.activator;
				m_e_body_trigger sethintstringforplayer(e_triggerer, "");
			}
			for(;;)
			{
			}
			for(;;)
			{
			}
			for(;;)
			{
			}
			for(;;)
			{
			}
			for(;;)
			{
				return;
			}
			for(;;)
			{
			}
			if(!isdefined(m_e_body_trigger))
			{
			}
			if(is_true(e_triggerer.is_carrying_pickupitem))
			{
			}
			if(!m_iscarryable)
			{
			}
			if(is_true(e_triggerer.disable_object_pickup))
			{
			}
			if(!e_triggerer util::use_button_held())
			{
			}
			if(isdefined(m_allow_carry_custom_conditions_func) && ![[m_allow_carry_custom_conditions_func]]())
			{
			}
			if(!isdefined(m_e_body_trigger))
			{
			}
			if(!e_triggerer istouching(m_e_body_trigger))
			{
			}
			if(is_true(e_triggerer.is_carrying_pickupitem))
			{
			}
			e_triggerer.is_carrying_pickupitem = 1;
			self thread carry(e_triggerer);
			return;
		}
	}

	/*
		Name: disable_carry
		Namespace: cbaseinteractable
		Checksum: 0x6041FFCE
		Offset: 0x13F0
		Size: 0x1E
		Parameters: 0
		Flags: None
	*/
	function disable_carry()
	{
		self.m_iscarryable = 0;
		self notify(#"thread_allow_carry");
	}

	/*
		Name: carry
		Namespace: cbaseinteractable
		Checksum: 0x4698E69D
		Offset: 0x15F0
		Size: 0x1A4
		Parameters: 1
		Flags: None
	*/
	function carry(e_triggerer)
	{
		e_triggerer endon(#"death", #"player_downed");
		e_triggerer.o_pickupitem = self;
		self.m_e_player_currently_holding = e_triggerer;
		m_e_body_trigger notify(#"upgrade_trigger_enable", {#is_enabled:0});
		self notify(#"cancel_despawn");
		e_triggerer val::set(#"pickups", "disable_weapons");
		wait(0.5);
		if(isdefined(a_carry_threads))
		{
			foreach(carry_thread in a_carry_threads)
			{
				self thread [[carry_thread]](e_triggerer);
			}
		}
		else
		{
			e_triggerer allowjump(0);
		}
		self thread show_drop_prompt(e_triggerer);
		self thread show_carry_model(e_triggerer);
		self thread thread_allow_drop(e_triggerer);
	}

	/*
		Name: get_drop_prompt
		Namespace: cbaseinteractable
		Checksum: 0x658C1A7B
		Offset: 0x17A0
		Size: 0x14
		Parameters: 0
		Flags: None
	*/
	function get_drop_prompt()
	{
		return ("Press ^3[{+usereload}]^7 to drop ") + m_str_itemname;
	}

	/*
		Name: flash_drop_prompt_stop
		Namespace: cbaseinteractable
		Checksum: 0xCE73835
		Offset: 0x1898
		Size: 0x3C
		Parameters: 1
		Flags: None
	*/
	function flash_drop_prompt_stop(player)
	{
		player notify(#"stop_flashing_drop_prompt");
		/#
			player util::screen_message_delete_client();
		#/
	}

	/*
		Name: show_carry_model
		Namespace: cbaseinteractable
		Checksum: 0x50A8BBA7
		Offset: 0x19A0
		Size: 0x208
		Parameters: 1
		Flags: None
	*/
	function show_carry_model(e_triggerer)
	{
		e_triggerer endon(#"restore_player_controls_from_carry", #"death", #"player_downed");
		v_eye_origin = e_triggerer geteye();
		v_player_angles = e_triggerer getplayerangles();
		v_player_angles = v_player_angles + m_v_holding_offset_angle;
		v_player_angles = anglestoforward(v_player_angles);
		v_angles = e_triggerer.angles + m_v_holding_angle;
		v_origin = v_eye_origin + (v_player_angles * m_n_holding_distance);
		if(!isdefined(m_str_carry_model))
		{
			if(isdefined(m_str_modelname))
			{
				self.m_str_carry_model = m_str_modelname;
			}
			else
			{
				self.m_str_carry_model = "script_origin";
			}
		}
		self.m_e_carry_model = util::spawn_model(m_str_carry_model, v_origin, v_angles);
		m_e_carry_model notsolid();
		while(isdefined(m_e_carry_model))
		{
			v_eye_origin = e_triggerer geteye();
			v_player_angles = e_triggerer getplayerangles();
			v_player_angles = v_player_angles + m_v_holding_offset_angle;
			v_player_angles = anglestoforward(v_player_angles);
			m_e_carry_model.angles = e_triggerer.angles + m_v_holding_angle;
			m_e_carry_model.origin = v_eye_origin + (v_player_angles * m_n_holding_distance);
			waitframe(1);
		}
	}

	/*
		Name: spawn_body_trigger
		Namespace: cbaseinteractable
		Checksum: 0xA91B9ED1
		Offset: 0x2020
		Size: 0x68
		Parameters: 1
		Flags: None
	*/
	function spawn_body_trigger(v_origin)
	{
		e_trigger = spawn_interact_trigger(v_origin, m_n_body_trigger_radius, m_n_body_trigger_height, "");
		e_trigger sethintlowpriority(1);
		return e_trigger;
	}

	/*
		Name: thread_allow_drop
		Namespace: cbaseinteractable
		Checksum: 0x3C41BDF0
		Offset: 0x18E0
		Size: 0xB4
		Parameters: 1
		Flags: None
	*/
	function thread_allow_drop(e_triggerer)
	{
		e_triggerer endon(#"restore_player_controls_from_carry", #"death", #"player_downed");
		self thread drop_on_death(e_triggerer);
		while(e_triggerer usebuttonpressed())
		{
			waitframe(1);
		}
		while(!e_triggerer usebuttonpressed())
		{
			waitframe(1);
		}
		self thread drop(e_triggerer);
	}

	/*
		Name: spawn_interact_trigger
		Namespace: cbaseinteractable
		Checksum: 0xE86A1096
		Offset: 0x2090
		Size: 0x148
		Parameters: 4
		Flags: None
	*/
	function spawn_interact_trigger(v_origin, n_radius, n_height, str_hint)
	{
		/#
			assert(isdefined(v_origin), "");
		#/
		/#
			assert(isdefined(n_radius), "");
		#/
		/#
			assert(isdefined(n_height), "");
		#/
		e_trigger = spawn("trigger_radius", v_origin, 0, n_radius, n_height);
		e_trigger triggerignoreteam();
		e_trigger setvisibletoall();
		e_trigger setteamfortrigger(#"none");
		e_trigger setcursorhint("HINT_NOICON");
		if(isdefined(str_hint))
		{
			e_trigger sethintstring(str_hint);
		}
		return e_trigger;
	}

	/*
		Name: drop
		Namespace: cbaseinteractable
		Checksum: 0x6A3C02F2
		Offset: 0x1C68
		Size: 0x124
		Parameters: 1
		Flags: None
	*/
	function drop(e_triggerer)
	{
		restore_player_controls_from_carry(e_triggerer);
		/#
			e_triggerer util::screen_message_delete_client();
		#/
		if(isdefined(m_e_carry_model))
		{
			m_e_carry_model delete();
		}
		if(isdefined(a_drop_funcs))
		{
			foreach(drop_func in a_drop_funcs)
			{
				[[drop_func]](e_triggerer);
			}
		}
		self.m_e_player_currently_holding = undefined;
		self thread thread_allow_carry();
		e_triggerer thread wait_for_button_release();
	}

	/*
		Name: repair_completed
		Namespace: cbaseinteractable
		Checksum: 0x3A99E635
		Offset: 0x1258
		Size: 0x40
		Parameters: 1
		Flags: None
	*/
	function repair_completed(player)
	{
		self notify(#"repair_completed");
		if(isdefined(m_repair_custom_complete_func))
		{
			self thread [[m_repair_custom_complete_func]](player);
		}
	}

	/*
		Name: flash_drop_prompt
		Namespace: cbaseinteractable
		Checksum: 0x7DD95D61
		Offset: 0x1800
		Size: 0x90
		Parameters: 1
		Flags: None
	*/
	function flash_drop_prompt(player)
	{
		self endon(#"death");
		player endon(#"death", #"stop_flashing_drop_prompt");
		while(true)
		{
			/#
				player util::screen_message_create_client(get_drop_prompt(), undefined, undefined, 0, 0.35);
			#/
			wait(0.35);
		}
	}

	/*
		Name: wait_for_button_release
		Namespace: cbaseinteractable
		Checksum: 0x39ABD6C1
		Offset: 0x1EA8
		Size: 0x56
		Parameters: 0
		Flags: None
	*/
	function wait_for_button_release()
	{
		self endon(#"death", #"disconnect");
		self.disable_object_pickup = 1;
		self _wait_for_button_release();
		self.disable_object_pickup = undefined;
	}

	/*
		Name: drop_on_death
		Namespace: cbaseinteractable
		Checksum: 0x6627664C
		Offset: 0x1F48
		Size: 0x74
		Parameters: 1
		Flags: None
	*/
	function drop_on_death(e_triggerer)
	{
		self notify(#"drop_on_death");
		self endon(#"drop_on_death");
		e_triggerer waittill(#"player_downed", #"death");
		if(isdefined(m_e_player_currently_holding))
		{
			drop(e_triggerer);
		}
	}

	/*
		Name: show_drop_prompt
		Namespace: cbaseinteractable
		Checksum: 0xCB435213
		Offset: 0x17C0
		Size: 0x34
		Parameters: 1
		Flags: None
	*/
	function show_drop_prompt(player)
	{
		/#
			player util::screen_message_create_client(get_drop_prompt());
		#/
	}

	/*
		Name: enable_carry
		Namespace: cbaseinteractable
		Checksum: 0x545C5ED5
		Offset: 0x13C0
		Size: 0x24
		Parameters: 0
		Flags: None
	*/
	function enable_carry()
	{
		self.m_iscarryable = 1;
		self thread thread_allow_carry();
	}

	/*
		Name: _wait_for_button_release
		Namespace: cbaseinteractable
		Checksum: 0x8A46EA8F
		Offset: 0x1F08
		Size: 0x38
		Parameters: 0
		Flags: None
	*/
	function _wait_for_button_release()
	{
		self endon(#"player_downed");
		while(self usebuttonpressed())
		{
			waitframe(1);
		}
	}

	/*
		Name: remove
		Namespace: cbaseinteractable
		Checksum: 0xF836CD5A
		Offset: 0x1D98
		Size: 0x7E
		Parameters: 1
		Flags: None
	*/
	function remove(e_triggerer)
	{
		restore_player_controls_from_carry(e_triggerer);
		/#
			e_triggerer util::screen_message_delete_client();
		#/
		if(isdefined(m_e_carry_model))
		{
			m_e_carry_model delete();
		}
		self.m_e_player_currently_holding = undefined;
		self notify(#"respawn_pickupitem");
	}

	/*
		Name: repair_trigger
		Namespace: cbaseinteractable
		Checksum: 0xB7F465E9
		Offset: 0x12A0
		Size: 0xCE
		Parameters: 0
		Flags: None
	*/
	function repair_trigger()
	{
		self endon(#"unmake");
		while(true)
		{
			waitresult = undefined;
			waitresult = m_e_body_trigger waittill(#"trigger");
			player = waitresult.activator;
			if(is_true(player.is_carrying_pickupitem) && player.o_pickupitem.m_str_itemname == "Toolbox")
			{
				[[ player.o_pickupitem ]]->remove(player);
				[[m_repair_complete_func]](player);
			}
			waitframe(1);
		}
	}

	/*
		Name: destroy
		Namespace: cbaseinteractable
		Checksum: 0xF2333439
		Offset: 0x1E20
		Size: 0x7E
		Parameters: 0
		Flags: None
	*/
	function destroy()
	{
		if(isdefined(m_e_player_currently_holding))
		{
			restore_player_controls_from_carry(m_e_player_currently_holding);
			/#
				m_e_player_currently_holding util::screen_message_delete_client();
			#/
		}
		if(isdefined(m_e_carry_model))
		{
			m_e_carry_model delete();
		}
		self.m_e_player_currently_holding = undefined;
	}

	/*
		Name: set_body_trigger
		Namespace: cbaseinteractable
		Checksum: 0x782ABAE0
		Offset: 0x1378
		Size: 0x3A
		Parameters: 1
		Flags: None
	*/
	function set_body_trigger(e_trigger)
	{
		/#
			assert(!isdefined(m_e_body_trigger));
		#/
		self.m_e_body_trigger = e_trigger;
	}

	/*
		Name: restore_player_controls_from_carry
		Namespace: cbaseinteractable
		Checksum: 0x7ECEC86D
		Offset: 0x1BB0
		Size: 0xAC
		Parameters: 1
		Flags: None
	*/
	function restore_player_controls_from_carry(e_triggerer)
	{
		e_triggerer endon(#"death", #"player_downed");
		if(!e_triggerer.is_carrying_pickupitem)
		{
			return;
		}
		e_triggerer notify(#"restore_player_controls_from_carry");
		e_triggerer val::reset(#"pickups", "disable_weapons");
		e_triggerer.is_carrying_pickupitem = 0;
		e_triggerer allowjump(1);
	}

	/*
		Name: get_player_currently_holding
		Namespace: cbaseinteractable
		Checksum: 0x8D03A2A3
		Offset: 0x11C8
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function get_player_currently_holding()
	{
		return m_e_player_currently_holding;
	}

	/*
		Name: prompt_manager
		Namespace: cbaseinteractable
		Checksum: 0xB1995A80
		Offset: 0x11E0
		Size: 0x70
		Parameters: 0
		Flags: None
	*/
	function prompt_manager()
	{
		if(isdefined(m_prompt_manager_custom_func))
		{
			self thread [[m_prompt_manager_custom_func]]();
		}
		else
		{
			while(isdefined(m_e_body_trigger))
			{
				if(!m_isfunctional)
				{
					m_e_body_trigger sethintstring("Bring Toolbox to repair");
					waitframe(1);
					continue;
				}
				waitframe(1);
			}
		}
	}

	/*
		Name: spawn_repair_trigger
		Namespace: cbaseinteractable
		Checksum: 0x26925ACA
		Offset: 0x1FC8
		Size: 0x4A
		Parameters: 1
		Flags: None
	*/
	function spawn_repair_trigger(v_origin)
	{
		e_repair_trigger = spawn_interact_trigger(v_origin, m_n_repair_radius, m_n_repair_height, "Bring Toolbox to repair");
		return e_repair_trigger;
	}

}

