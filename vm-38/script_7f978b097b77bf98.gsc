#using script_34ab99a4ca1a43d;
#using script_16b1b77a76492c6a;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using script_3411bb48d41bd3b;
#using script_135d639e83b15d2f;
#using script_35598499769dbb3d;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_13c9b452;

/*
	Name: function_e4cca549
	Namespace: namespace_13c9b452
	Checksum: 0x366B723B
	Offset: 0x270
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e4cca549()
{
	level notify(1198631188);
}

#namespace namespace_5cc6d100;

/*
	Name: __init__system__
	Namespace: namespace_5cc6d100
	Checksum: 0xB28ECC83
	Offset: 0x290
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_24e8e2e7c9881782", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_5cc6d100
	Checksum: 0xEBB10BED
	Offset: 0x2E0
	Size: 0x14C
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(is_true(getgametypesetting(#"hash_1e1a5ebefe2772ba")))
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_3626be8164d82cbc")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	clientfield::register("scriptmover", "sr_black_chest_fx", 1, 2, "int");
	clientfield::register("scriptmover", "sr_black_chest_swarm_fx", 1, 3, "int");
	namespace_8b6a9d79::function_b3464a7c(#"hash_2b86662458d5de9a", &function_4d243036, 1);
}

/*
	Name: function_4d243036
	Namespace: namespace_5cc6d100
	Checksum: 0xB1CF2973
	Offset: 0x438
	Size: 0x24C
	Parameters: 1
	Flags: None
*/
function function_4d243036(instance)
{
	s_chest = instance.var_fe2612fe[#"chest"][0];
	instance.var_31919730 = namespace_8b6a9d79::spawn_script_model(s_chest, #"hash_52b22fc56fd98bd6");
	s_chest.scriptmodel = instance.var_31919730;
	instance.var_31919730 clientfield::set("sr_black_chest_fx", 1);
	instance.var_31919730 disconnectpaths();
	instance.n_obj_id = zm_utility::function_f5a222a8(#"hash_6f9aa3330822e0f1", s_chest.origin);
	forward = anglestoforward(s_chest.angles);
	forward = vectornormalize(forward);
	forward = (forward[0] * 16, forward[1] * 16, forward[2] * 16);
	forward = (forward[0], forward[1], forward[2] + 16);
	trigger = namespace_8b6a9d79::function_214737c7(s_chest, &function_b0c8ef74, #"hash_51885cacb17fc72", undefined, 64, 32, undefined, forward);
	trigger.instance = instance;
	trigger.s_chest = s_chest;
	instance.trigger = trigger;
	t_proximity = spawn("trigger_radius", s_chest.origin - (0, 0, 128 / 2), 0, 350, 128);
	t_proximity.instance = instance;
	t_proximity callback::on_trigger(&function_29d2d6a4);
}

/*
	Name: function_29d2d6a4
	Namespace: namespace_5cc6d100
	Checksum: 0x5BF7B05A
	Offset: 0x690
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_29d2d6a4(eventstruct)
{
	if(isdefined(self.instance) && isplayer(eventstruct.activator))
	{
		self.instance.var_31919730 thread zm_vo::function_d6f8bbd9(#"hash_4eb60c56d4a2af26");
		self deletedelay();
	}
}

/*
	Name: function_b0c8ef74
	Namespace: namespace_5cc6d100
	Checksum: 0x4289793F
	Offset: 0x720
	Size: 0x56C
	Parameters: 1
	Flags: Private
*/
function private function_b0c8ef74(eventstruct)
{
	if(!isplayer(eventstruct.activator))
	{
		return;
	}
	if(!is_true(self.b_activated))
	{
		self.b_activated = 1;
		self triggerenable(0);
		function_5338581(self.instance);
		function_91c5571b(self.instance);
		self triggerenable(1);
	}
	else if(is_true(self.b_complete) && isdefined(self.instance.var_31919730))
	{
		self.b_complete = undefined;
		self triggerenable(0);
		s_chest = self.instance.var_fe2612fe[#"chest"][0];
		self.instance.var_31919730 thread scene::play(#"hash_29ab5c78f46f19a3", self.instance.var_31919730);
		self.instance.var_85c920d0 = namespace_8b6a9d79::spawn_script_model(s_chest, #"hash_2641cfb5c2cdcc85");
		self.instance.var_85c920d0 clientfield::set("sr_demented_echo_fx", 1);
		self.instance.var_85c920d0 playsound(#"hash_36ac898552727197");
		self.instance.var_85c920d0 playloopsound(#"evt_sur_we_bc_ghost_lp");
		s_chest thread scene::play(#"hash_736661ee1ae2dc67", self.instance.var_85c920d0);
		level thread function_7914c7ef(self.instance.var_85c920d0, s_chest);
		eventstruct.activator function_bc82f900("damage_heavy");
		eventstruct.activator zm_stats::function_945c7ce2(#"hash_346e6565d0a79066", 1);
		level thread util::delay(1, undefined, &namespace_58949729::function_f82f361c, self.s_chest, namespace_58949729::function_fd5e77fa(#"black"), 3, 0, vectorscale((0, 0, -1), 8), 1);
		self.instance.var_31919730 thread namespace_58949729::function_1e2500f();
		level scoreevents::doscoreeventcallback("scoreEventSR", {#location:self.instance.var_31919730.origin, #hash_b0a57f8c:5000, #nearbyplayers:1, #scoreevent:"event_complete"});
		players = getplayers("all", self.instance.var_31919730.origin, 5000);
		foreach(player in players)
		{
			player zm_stats::function_945c7ce2(#"hash_165462f560a0538c", 1);
			player zm_stats::increment_challenge_stat(#"hash_6467b5d2acb35b8a");
		}
		if(isdefined(self.instance.var_31919730.n_obj_id))
		{
			objective_clearentity(self.instance.var_31919730.n_obj_id);
			zm_utility::function_bc5a54a8(self.instance.var_31919730.n_obj_id);
			self.instance.var_31919730.n_obj_id = undefined;
		}
		self deletedelay();
	}
}

/*
	Name: function_91c5571b
	Namespace: namespace_5cc6d100
	Checksum: 0x491FE787
	Offset: 0xC98
	Size: 0x3DC
	Parameters: 1
	Flags: Private
*/
function private function_91c5571b(instance)
{
	if(!isdefined(instance.trigger) || !isdefined(instance.var_fc398f5e) || !isdefined(instance.var_31919730))
	{
		return;
	}
	if(instance.var_31919730 clientfield::get("sr_black_chest_fx") === 3)
	{
		instance.var_31919730 clientfield::set("sr_black_chest_fx", 0);
		util::wait_network_frame();
	}
	switch(instance.var_fc398f5e)
	{
		case 0:
		{
			instance.trigger sethintstring(#"hash_1d1be5a6b69d6372");
			instance.trigger.b_complete = 1;
			wait(1.75);
			if(!isdefined(instance.var_31919730))
			{
				return;
			}
			if(isdefined(instance.n_obj_id))
			{
				objective_clearentity(instance.n_obj_id);
				zm_utility::function_bc5a54a8(instance.n_obj_id);
				instance.n_obj_id = undefined;
			}
			instance.var_31919730.n_obj_id = zm_utility::function_f5a222a8(#"hash_16f82bc525c40db7", instance.var_31919730.origin);
			instance.var_31919730 clientfield::set("sr_black_chest_fx", 3);
			level thread function_aa89ee85(instance.var_31919730.origin, 1, 0.5, undefined, 700);
			instance.var_31919730 thread zm_vo::function_d6f8bbd9(#"hash_3e6ead8d740a0ff8", undefined, undefined, 1);
			break;
		}
		case 1:
		{
			instance.trigger sethintstring(#"hash_5947924716292401");
			instance.var_31919730 clientfield::set("sr_black_chest_fx", 3);
			instance.var_31919730 thread zm_vo::function_d6f8bbd9(#"hash_32cc24bb8d3000c1", undefined, undefined, 1);
			break;
		}
		case 2:
		{
			instance.trigger sethintstring(#"hash_59478f4716291ee8");
			instance.var_31919730 clientfield::set("sr_black_chest_fx", 3);
			instance.var_31919730 thread zm_vo::function_d6f8bbd9(#"hash_189e0c21824b990a", undefined, undefined, 1);
			break;
		}
		case 3:
		{
			instance.trigger sethintstring(#"hash_594790471629209b");
			break;
		}
	}
	util::wait_network_frame();
	instance.var_31919730 clientfield::set("sr_black_chest_fx", 0);
}

/*
	Name: function_5338581
	Namespace: namespace_5cc6d100
	Checksum: 0x6412C116
	Offset: 0x1080
	Size: 0x3E4
	Parameters: 1
	Flags: Private
*/
function private function_5338581(instance)
{
	playsoundatposition(#"hash_6cad1d9a51f99476", instance.var_31919730.origin + vectorscale((0, 0, 1), 20));
	wait(0.25);
	foreach(player in function_a1ef346b("all", instance.var_31919730.origin, 2048))
	{
		player function_bc82f900("damage_heavy");
	}
	instance.var_31919730 clientfield::set("sr_black_chest_fx", 2);
	wait(2);
	playsoundatposition(#"hash_2cc0c33bfc0f9373", instance.var_31919730.origin + vectorscale((0, 0, 1), 20));
	instance.var_31919730 thread zm_vo::function_d6f8bbd9(#"hash_15b09a217e61af64", 2.5);
	instance.var_fc398f5e = 0;
	s_chest = instance.var_fe2612fe[#"chest"][0];
	v_height_offset = anglestoup(s_chest.angles) * 58;
	var_5086009e = anglestoright(s_chest.angles) * 12;
	var_42cc652b = anglestoup(s_chest.angles) * -8;
	var_2d0a39a7 = anglestoright(s_chest.angles) * -12;
	var_6ef72e62 = spawnstruct();
	var_5a4d050e = spawnstruct();
	var_440ed88e = spawnstruct();
	var_6ef72e62.origin = (s_chest.origin + v_height_offset) + var_5086009e;
	var_5a4d050e.origin = (s_chest.origin + v_height_offset) + var_42cc652b;
	var_440ed88e.origin = (s_chest.origin + v_height_offset) + var_2d0a39a7;
	var_21a5c532 = instance.var_fe2612fe[#"hash_5e01f407a95da14a"][0];
	var_306462af = instance.var_fe2612fe[#"hash_5e01f307a95d9f97"][0];
	var_b02fe248 = instance.var_fe2612fe[#"hash_5e01f207a95d9de4"][0];
	function_ed1e62c9(instance, var_21a5c532, var_6ef72e62);
	function_ed1e62c9(instance, var_306462af, var_5a4d050e);
	function_ed1e62c9(instance, var_b02fe248, var_440ed88e);
}

/*
	Name: function_ed1e62c9
	Namespace: namespace_5cc6d100
	Checksum: 0xDF504CAF
	Offset: 0x1470
	Size: 0x210
	Parameters: 3
	Flags: Private
*/
function private function_ed1e62c9(instance, var_5ec5a681, s_spawn)
{
	if(!(isdefined(var_5ec5a681) && isdefined(s_spawn)))
	{
		return;
	}
	var_d4358084 = namespace_8b6a9d79::spawn_script_model(s_spawn, #"hash_7a7aadfb584e0859");
	var_d4358084 clientfield::set("sr_black_chest_swarm_fx", 1);
	var_d4358084 val::set(#"hash_65a3f68c4d919b89", "allowdeath", 0);
	var_d4358084.var_e8280122 = var_5ec5a681.origin;
	var_d4358084.targetname = "world_event_black_chest_swarm";
	var_d4358084 playloopsound(#"hash_4c9124e9213250df");
	trigger = spawn("trigger_radius", var_5ec5a681.origin + (0, 0, 128 * -1), 0, 450, 128 * 2);
	trigger.var_d4358084 = var_d4358084;
	var_d4358084.trigger = trigger;
	trigger callback::on_trigger(&function_e03c6f84);
	var_d4358084.n_obj_id = zm_utility::function_f5a222a8(#"hash_4b8c0ed5c08eb78e", var_d4358084);
	n_move_time = distance(var_d4358084.origin, var_5ec5a681.origin) / 850;
	var_d4358084 moveto(var_5ec5a681.origin, n_move_time);
	var_d4358084 thread function_1f15d9fc(instance);
	instance.var_fc398f5e++;
}

/*
	Name: function_e03c6f84
	Namespace: namespace_5cc6d100
	Checksum: 0x3C40825C
	Offset: 0x1688
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_e03c6f84(eventstruct)
{
	if(isdefined(self.var_d4358084) && isplayer(eventstruct.activator))
	{
		self.var_d4358084 notify(#"hash_2cc769566d9f395a");
		self delete();
	}
}

/*
	Name: function_1f15d9fc
	Namespace: namespace_5cc6d100
	Checksum: 0x56CC900
	Offset: 0x1700
	Size: 0x438
	Parameters: 1
	Flags: Private
*/
function private function_1f15d9fc(instance)
{
	self endon(#"death", #"end_game");
	self.maxhealth = 500;
	var_35588796 = max(1, getplayers().size * 0.666);
	self namespace_3b3d42f::function_967133dc(0.02, var_35588796);
	self.health = int(self.maxhealth);
	self.health_state = 4;
	self clientfield::set("sr_black_chest_swarm_fx", 4);
	self waittill(#"movedone");
	self val::set(#"hash_65a3f68c4d919b89", "takedamage", 1);
	while(isdefined(self))
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage", #"hash_2cc769566d9f395a");
		if(isdefined(waitresult.amount))
		{
			self.health = self.health - waitresult.amount;
		}
		if(isplayer(waitresult.attacker))
		{
			self namespace_3b3d42f::function_b89cb3dc(waitresult);
		}
		if(self.health <= 1)
		{
			self.health = 1;
			self val::set(#"hash_65a3f68c4d919b89", "takedamage", 0);
			instance.var_fc398f5e--;
			self thread function_91c5571b(instance);
			if(isdefined(self.trigger))
			{
				self.trigger delete();
			}
			if(isdefined(self.n_obj_id))
			{
				objective_clearentity(self.n_obj_id);
				zm_utility::function_bc5a54a8(self.n_obj_id);
				self.n_obj_id = undefined;
			}
			self clientfield::set("sr_black_chest_swarm_fx", 1);
			util::wait_network_frame();
			self deletedelay();
			return;
		}
		if(self.health <= (0.33 * self.maxhealth))
		{
			self clientfield::set("sr_black_chest_swarm_fx", 2);
			self.health_state = 2;
		}
		else
		{
			if(self.health <= (0.67 * self.maxhealth))
			{
				self clientfield::set("sr_black_chest_swarm_fx", 3);
				self.health_state = 3;
			}
			else
			{
				self.health_state = 4;
			}
		}
		self.var_9cf16573 = arraygetclosest(self.origin, function_a1ef346b(), 5000);
		if(!is_true(self.var_6b5de8fd))
		{
			self.var_6b5de8fd = 1;
			self thread function_66afafad(waitresult.attacker);
			self thread namespace_3b3d42f::function_187bcbe();
		}
	}
}

/*
	Name: function_66afafad
	Namespace: namespace_5cc6d100
	Checksum: 0x3C3E40B8
	Offset: 0x1B40
	Size: 0x1E2
	Parameters: 1
	Flags: Private
*/
function private function_66afafad(attacker)
{
	self endon(#"death");
	if(isdefined(180))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(180, "timeout");
	}
	var_c8c520ef = 1;
	while(true)
	{
		if(isplayer(attacker) && isvec(attacker.origin))
		{
			v_loc = attacker.origin;
			a_spawns = namespace_85745671::function_e4791424(v_loc, 5, 80, 750, 350);
			if(isarray(a_spawns) && isdefined(a_spawns.size) && a_spawns.size < 5)
			{
				v_loc = self.origin;
			}
		}
		if(!isvec(v_loc))
		{
			v_loc = self.origin;
		}
		level namespace_2c949ef8::do_ambush(v_loc, undefined, 350, 750, undefined, undefined, var_c8c520ef, "black_chest_zombie", 80);
		v_loc = undefined;
		var_c8c520ef = 0;
		wait(5);
	}
}

/*
	Name: function_7914c7ef
	Namespace: namespace_5cc6d100
	Checksum: 0x2989F71E
	Offset: 0x1D30
	Size: 0x72C
	Parameters: 2
	Flags: Private
*/
function private function_7914c7ef(var_85c920d0, s_chest)
{
	/#
		var_89edfa = getdvarint(#"hash_6335bbebed01383f", 180);
	#/
	s_chest endon(#"death");
	if(!isdefined(var_89edfa))
	{
		var_89edfa = 180;
	}
	wait(1);
	s_chest thread zm_vo::function_d6f8bbd9(#"hash_3d0849b352e60084");
	wait(3);
	s_chest playsound(#"hash_47ee04e03e4bdd6");
	s_chest stoploopsound();
	s_chest clientfield::set("sr_demented_echo_fx", 2);
	wait(0.5);
	s_chest ghost();
	while(true)
	{
		level flag::set(#"hash_1681da514d47c415");
		if(!isdefined(s_chest.var_3608d414) || !s_chest.var_3608d414.size)
		{
			for(i = 0; i <= 9; i++)
			{
				s_chest.var_3608d414[i] = "vox_zobj_bc_lstsl_spawn_lost_" + i;
			}
		}
		var_1fee85c9 = level.player_death_override;
		level.player_death_override = &function_bfd926b1;
		var_ff1022f3 = undefined;
		foreach(player in function_a1ef346b())
		{
			if(player.health < 50 && !is_true(player.laststand) || player flag::get(#"hash_1f1e2c0dad1deebf"))
			{
				a_ai = getactorteamarray("axis");
				a_ai = arraysortclosest(a_ai, player.origin, undefined, undefined, 350);
				if(a_ai.size)
				{
					var_ff1022f3 = player;
					break;
				}
			}
		}
		if(isdefined(var_ff1022f3))
		{
			s_chest dontinterpolate();
			s_chest.origin = var_ff1022f3.origin + vectorscale((0, 0, 1), 40);
			s_chest.angles = var_ff1022f3.angles;
			s_chest show();
			s_chest thread fx::play(#"hash_6e08ff9234426629", var_ff1022f3.origin + vectorscale((0, 0, 1), 48), var_ff1022f3.angles);
			s_chest clientfield::set("sr_demented_echo_fx", 1);
			s_chest playsound(#"hash_36ac898552727197");
			s_chest playloopsound("evt_sur_we_bc_ghost_lp");
			s_chest thread scene::play(#"hash_767e7376a0ad6762", s_chest);
			str_vo = array::function_a3b0f814(s_chest.var_3608d414, 0);
			s_chest thread zm_vo::function_d6f8bbd9(str_vo);
			a_players = getplayers("all", var_ff1022f3.origin, 350);
			foreach(player in a_players)
			{
				player val::set(#"hash_7f8d812db471e5ed", "takedamage", 0);
				player val::set(#"hash_7f8d812db471e5ed", "allowdeath", 0);
				player flag::clear(#"hash_1f1e2c0dad1deebf");
			}
			level.player_death_override = var_1fee85c9;
			level flag::clear(#"hash_1681da514d47c415");
			level thread function_aa89ee85(s_chest.origin, undefined, undefined, a_ai);
			wait(5);
			s_chest thread scene::play(#"hash_767e7376a0ad6762", "outro", s_chest);
			wait(0.5);
			s_chest clientfield::set("sr_demented_echo_fx", 0);
			s_chest playsound(#"hash_47ee04e03e4bdd6");
			s_chest stoploopsound();
			wait(0.5);
			s_chest ghost();
			foreach(player in a_players)
			{
				if(isdefined(player))
				{
					player val::reset_all(#"hash_7f8d812db471e5ed");
				}
			}
			wait(var_89edfa);
		}
		else
		{
			waitframe(1);
		}
	}
}

/*
	Name: function_bfd926b1
	Namespace: namespace_5cc6d100
	Checksum: 0x12B74A39
	Offset: 0x2468
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_bfd926b1()
{
	if(level flag::get(#"hash_1681da514d47c415"))
	{
		self flag::set(#"hash_1f1e2c0dad1deebf");
		return true;
	}
	return false;
}

/*
	Name: function_aa89ee85
	Namespace: namespace_5cc6d100
	Checksum: 0x3AF85F11
	Offset: 0x24C0
	Size: 0x3BE
	Parameters: 5
	Flags: Private
*/
function private function_aa89ee85(v_center, n_duration, n_delay, a_ai, n_radius)
{
	if(!isdefined(n_duration))
	{
		n_duration = 5;
	}
	if(!isdefined(n_radius))
	{
		n_radius = 350;
	}
	if(isdefined(n_delay))
	{
		wait(n_delay);
	}
	if(!isdefined(a_ai))
	{
		a_ai = getactorteamarray("axis");
		a_ai = arraysortclosest(a_ai, v_center, undefined, undefined, n_radius);
	}
	n_start_time = gettime();
	while(true)
	{
		foreach(ai in a_ai)
		{
			if(isalive(ai))
			{
				ai clientfield::set("soul_capture_zombie_fire", 1);
				ai ai::stun(0.5);
			}
		}
		wait(0.5);
		a_ai = getactorteamarray("axis");
		a_ai = arraysortclosest(a_ai, v_center, undefined, undefined, n_radius);
		if((n_start_time + (int(n_duration * 1000))) <= gettime())
		{
			break;
		}
	}
	playsoundatposition(#"hash_215113ffa2718a92", v_center);
	playfx(#"hash_63333c881b0b81a3", v_center, undefined, (0, 0, 1));
	foreach(ai in a_ai)
	{
		if(isalive(ai))
		{
			if(ai.var_6f84b820 === #"normal")
			{
				ai function_9513424();
			}
			else
			{
				ai clientfield::set("soul_capture_zombie_fire", 0);
				if(ai.var_6f84b820 === #"special")
				{
					var_82b50c7 = ai.maxhealth * 0.75;
				}
				else if(ai.var_6f84b820 === #"elite")
				{
					var_82b50c7 = ai.maxhealth * 0.25;
				}
				if(isdefined(var_82b50c7))
				{
					ai dodamage(int(var_82b50c7), ai.origin);
				}
			}
			waitframe(1);
		}
	}
}

/*
	Name: function_9513424
	Namespace: namespace_5cc6d100
	Checksum: 0x4C631EB9
	Offset: 0x2888
	Size: 0x6C
	Parameters: 0
	Flags: Private
*/
function private function_9513424()
{
	if(isalive(self))
	{
		self.allowdeath = 1;
		self.var_98f1f37c = 1;
		gibserverutils::annihilate(self);
		self kill(undefined, undefined, undefined, undefined, undefined, 1);
	}
}

