#using script_1254ac024174d9c0;
#using script_2f9a68261f6a17be;
#using script_301f64a4090c381a;
#using script_5660bae5b402a1eb;
#using script_6e3c826b1814cab6;
#using script_ab890501c40b73c;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_net.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_traps;

/*
	Name: function_89f2df9
	Namespace: zm_traps
	Checksum: 0x454DDDD3
	Offset: 0x3E0
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_traps", &function_70a657d8, &function_8ac3bea9, &init, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_traps
	Checksum: 0xAD56BDC0
	Offset: 0x440
	Size: 0x38
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.trap_kills = 0;
	if(!isdefined(level._custom_traps))
	{
		level._custom_traps = [];
	}
	level.burning_zombies = [];
}

/*
	Name: init
	Namespace: zm_traps
	Checksum: 0xA547871E
	Offset: 0x480
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function init()
{
	if(!namespace_59ff1d6c::function_901b751c(#"hash_4b16b22d8a0d3301"))
	{
		return;
	}
	traps = getentarray("zombie_trap", "targetname");
	array::thread_all(traps, &trap_init);
}

/*
	Name: function_8ac3bea9
	Namespace: zm_traps
	Checksum: 0x5B68D6C3
	Offset: 0x500
	Size: 0x74
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	if(!namespace_59ff1d6c::function_901b751c(#"hash_4b16b22d8a0d3301"))
	{
		return;
	}
	traps = getentarray("zombie_trap", "targetname");
	array::thread_all(traps, &trap_main);
}

/*
	Name: trap_init
	Namespace: zm_traps
	Checksum: 0x410E22C0
	Offset: 0x580
	Size: 0x65C
	Parameters: 0
	Flags: Linked
*/
function trap_init()
{
	self flag::init("flag_active");
	self flag::init("flag_cooldown");
	self._trap_type = "";
	if(isdefined(self.script_noteworthy))
	{
		self._trap_type = self.script_noteworthy;
		if(isdefined(level._custom_traps) && isdefined(level._custom_traps[self.script_noteworthy]) && isdefined(level._custom_traps[self.script_noteworthy].activate))
		{
			self._trap_activate_func = level._custom_traps[self.script_noteworthy].activate;
		}
		else
		{
			switch(self.script_noteworthy)
			{
				case "rotating":
				{
					self._trap_activate_func = &trap_activate_rotating;
					break;
				}
				case "flipper":
				{
					self._trap_activate_func = &trap_activate_flipper;
					break;
				}
				default:
				{
					self._trap_activate_func = &trap_activate_fire;
				}
			}
		}
		if(isdefined(level._zombiemode_trap_use_funcs) && isdefined(level._zombiemode_trap_use_funcs[self._trap_type]))
		{
			self._trap_use_func = level._zombiemode_trap_use_funcs[self._trap_type];
		}
		else
		{
			self._trap_use_func = &trap_use_think;
		}
	}
	self trap_model_type_init();
	self._trap_use_trigs = [];
	self._trap_lights = [];
	self._trap_movers = [];
	self._trap_switches = [];
	components = getentarray(self.target, "targetname");
	for(i = 0; i < components.size; i++)
	{
		if(isdefined(components[i].script_noteworthy))
		{
			switch(components[i].script_noteworthy)
			{
				case "counter_1s":
				{
					self.counter_1s = components[i];
					continue;
				}
				case "counter_10s":
				{
					self.counter_10s = components[i];
					continue;
				}
				case "counter_100s":
				{
					self.counter_100s = components[i];
					continue;
				}
				case "mover":
				{
					self._trap_movers[self._trap_movers.size] = components[i];
					continue;
				}
				case "switch":
				{
					self._trap_switches[self._trap_switches.size] = components[i];
					continue;
				}
				case "light":
				{
					self._trap_lights[self._trap_lights.size] = components[i];
					continue;
				}
			}
		}
		if(isdefined(components[i].script_string))
		{
			switch(components[i].script_string)
			{
				case "flipper1":
				{
					self.flipper1 = components[i];
					continue;
				}
				case "flipper2":
				{
					self.flipper2 = components[i];
					continue;
				}
				case "flipper1_radius_check":
				{
					self.flipper1_radius_check = components[i];
					continue;
				}
				case "flipper2_radius_check":
				{
					self.flipper2_radius_check = components[i];
					continue;
				}
				case "target1":
				{
					self.target1 = components[i];
					continue;
				}
				case "target2":
				{
					self.target2 = components[i];
					continue;
				}
				case "target3":
				{
					self.target3 = components[i];
					continue;
				}
			}
		}
		switch(components[i].classname)
		{
			case "trigger_use":
			{
				self._trap_use_trigs[self._trap_use_trigs.size] = components[i];
				components[i]._trap = self;
				break;
			}
			case "script_model":
			{
				if(components[i].model == self._trap_light_model_off)
				{
					self._trap_lights[self._trap_lights.size] = components[i];
				}
				else if(components[i].model == self._trap_switch_model)
				{
					self._trap_switches[self._trap_switches.size] = components[i];
				}
			}
		}
	}
	self._trap_fx_structs = [];
	components = struct::get_array(self.target, "targetname");
	for(i = 0; i < components.size; i++)
	{
		if(isdefined(components[i].script_string) && components[i].script_string == "use_this_angle")
		{
			self.use_this_angle = components[i];
			continue;
		}
		self._trap_fx_structs[self._trap_fx_structs.size] = components[i];
	}
	if(!isdefined(self.zombie_cost))
	{
		self.zombie_cost = 1000;
	}
	self._trap_in_use = 0;
	self thread trap_dialog();
}

/*
	Name: trap_main
	Namespace: zm_traps
	Checksum: 0x7ED8F010
	Offset: 0xBE8
	Size: 0x28C
	Parameters: 0
	Flags: Linked
*/
function trap_main()
{
	level flag::wait_till("start_zombie_round_logic");
	for(i = 0; i < self._trap_use_trigs.size; i++)
	{
		self._trap_use_trigs[i] setcursorhint("HINT_NOICON");
	}
	if(!isdefined(self.script_string) || "disable_wait_for_power" != self.script_string)
	{
		self trap_set_string(#"hash_71158766520dc432");
		if(isdefined(self.script_int) && level flag::exists("power_on" + self.script_int))
		{
			level flag::wait_till("power_on" + self.script_int);
		}
		else
		{
			level flag::wait_till("power_on");
		}
	}
	if(isdefined(self.script_flag_wait))
	{
		self trap_set_string("");
		self triggerenable(0);
		self trap_lights_red();
		if(!level flag::exists(self.script_flag_wait))
		{
			level flag::init(self.script_flag_wait);
		}
		level flag::wait_till(self.script_flag_wait);
		self triggerenable(1);
	}
	self.var_b3166dc1 = 1;
	self function_783f63e9();
	for(i = 0; i < self._trap_use_trigs.size; i++)
	{
		self._trap_use_trigs[i] thread [[self._trap_use_func]](self);
		self._trap_use_trigs[i] thread update_trigger_visibility();
	}
}

/*
	Name: function_783f63e9
	Namespace: zm_traps
	Checksum: 0xB915DA44
	Offset: 0xE80
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function function_783f63e9(var_1c9c3123)
{
	if(!isdefined(var_1c9c3123))
	{
		var_1c9c3123 = 1;
	}
	if(namespace_497ab7da::is_active())
	{
		self trap_set_string(#"hash_55d25caf8f7bbb2f");
	}
	else
	{
		if(is_true(self.var_fc36786e) || is_true(level.var_4f7df1ac))
		{
			self trap_set_string(#"hash_2276db2c26ee907a");
		}
		else
		{
			if(zm_utility::is_standard() || namespace_b28d86fd::is_active())
			{
				cheat_too_friendly_s_ = #"hash_24a438482954901";
				self trap_set_string(cheat_too_friendly_s_);
				if(var_1c9c3123)
				{
					self trap_lights_green();
				}
			}
			else
			{
				cheat_too_friendly_s_ = #"hash_23c1c09e94181fdb";
				self trap_set_string(cheat_too_friendly_s_, self.zombie_cost);
				if(var_1c9c3123)
				{
					self trap_lights_green();
				}
			}
		}
	}
}

/*
	Name: trap_use_think
	Namespace: zm_traps
	Checksum: 0xBB82C819
	Offset: 0x1010
	Size: 0x148
	Parameters: 1
	Flags: Linked
*/
function trap_use_think(trap)
{
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		e_player = waitresult.activator;
		if(!zm_utility::can_use(e_player))
		{
			continue;
		}
		if(is_true(self.var_fc36786e) || is_true(level.var_4f7df1ac) || namespace_497ab7da::is_active())
		{
			continue;
		}
		if(zm_utility::is_player_valid(e_player) && !trap._trap_in_use)
		{
			b_purchased = self function_3f0a4c65(e_player, trap.zombie_cost);
			if(!b_purchased)
			{
				continue;
			}
			trap_activate(trap, e_player);
		}
	}
}

/*
	Name: function_3f0a4c65
	Namespace: zm_traps
	Checksum: 0x50751637
	Offset: 0x1160
	Size: 0xB6
	Parameters: 2
	Flags: Linked
*/
function function_3f0a4c65(e_player, n_cost)
{
	if(namespace_b28d86fd::is_active())
	{
		return true;
	}
	if(e_player zm_score::can_player_purchase(n_cost))
	{
		e_player zm_score::minus_to_player_score(n_cost);
		return true;
	}
	self playsound(#"zmb_trap_deny");
	e_player zm_audio::create_and_play_dialog(#"general", #"outofmoney");
	return false;
}

/*
	Name: trap_activate
	Namespace: zm_traps
	Checksum: 0x63A7F3E4
	Offset: 0x1220
	Size: 0x2AC
	Parameters: 2
	Flags: Linked
*/
function trap_activate(trap, who)
{
	trap.activated_by_player = who;
	trap._trap_in_use = 1;
	trap trap_set_string(#"hash_39d080503c6a8d96");
	if(isdefined(who))
	{
		zm_utility::play_sound_at_pos("purchase", who.origin);
		if(isdefined(trap._trap_type))
		{
			who zm_audio::create_and_play_dialog(#"trap_activate", trap._trap_type);
		}
		level notify(#"trap_activated", {#trap:trap, #hash_dd54ffdb:who});
	}
	if(isarray(trap._trap_switches) && trap._trap_switches.size)
	{
		trap thread trap_move_switches();
		trap waittill(#"switch_activated");
	}
	trap triggerenable(1);
	trap thread [[trap._trap_activate_func]]();
	trap waittill(#"trap_done");
	trap triggerenable(0);
	trap trap_set_string(#"hash_21db2780833a8bfd");
	/#
		if(getdvarint(#"zombie_cheat", 0) >= 1)
		{
			trap._trap_cooldown_time = 5;
		}
	#/
	n_cooldown = function_da13db45(trap._trap_cooldown_time, who);
	wait(n_cooldown);
	playsoundatposition(#"zmb_trap_ready", trap.origin);
	if(isdefined(level.sndtrapfunc))
	{
		level thread [[level.sndtrapfunc]](trap, 0);
	}
	trap notify(#"available");
	trap._trap_in_use = 0;
	trap function_783f63e9();
}

/*
	Name: update_trigger_visibility
	Namespace: zm_traps
	Checksum: 0x85E23DCA
	Offset: 0x14D8
	Size: 0x124
	Parameters: 0
	Flags: Linked, Private
*/
function private update_trigger_visibility()
{
	self endon(#"death");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(distancesquared(player.origin, self.origin) < 16384)
			{
				if(player zm_utility::is_drinking())
				{
					self setinvisibletoplayer(player, 1);
					continue;
				}
				self setinvisibletoplayer(player, 0);
			}
		}
		wait(0.25);
	}
}

/*
	Name: trap_lights_red
	Namespace: zm_traps
	Checksum: 0x704C9FAB
	Offset: 0x1608
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function trap_lights_red()
{
	if(isdefined(level._custom_traps[self._trap_type]) && isdefined(level._custom_traps[self._trap_type].var_75734507))
	{
		self [[level._custom_traps[self._trap_type].var_75734507]]();
	}
	else
	{
		for(i = 0; i < self._trap_lights.size; i++)
		{
			light = self._trap_lights[i];
			str_light_red = light.targetname + "_red";
			str_light_green = light.targetname + "_green";
			exploder::kill_exploder(str_light_green);
			exploder::exploder(str_light_red);
		}
	}
}

/*
	Name: trap_lights_green
	Namespace: zm_traps
	Checksum: 0x18ED9F24
	Offset: 0x1720
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function trap_lights_green()
{
	if(isdefined(level._custom_traps) && isdefined(level._custom_traps[self._trap_type]) && isdefined(level._custom_traps[self._trap_type].var_53d35f37))
	{
		self [[level._custom_traps[self._trap_type].var_53d35f37]]();
	}
	else
	{
		for(i = 0; i < self._trap_lights.size; i++)
		{
			light = self._trap_lights[i];
			if(isdefined(light._switch_disabled))
			{
				continue;
			}
			str_light_red = light.targetname + "_red";
			str_light_green = light.targetname + "_green";
			exploder::kill_exploder(str_light_red);
			exploder::exploder(str_light_green);
		}
	}
}

/*
	Name: trap_set_string
	Namespace: zm_traps
	Checksum: 0x6FD13FF5
	Offset: 0x1860
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function trap_set_string(string, param1, param2)
{
	if(isdefined(self) && isdefined(self._trap_use_trigs))
	{
		for(i = 0; i < self._trap_use_trigs.size; i++)
		{
			if(!isdefined(param1))
			{
				self._trap_use_trigs[i] sethintstring(string);
				continue;
			}
			if(!isdefined(param2))
			{
				self._trap_use_trigs[i] sethintstring(string, param1);
				continue;
			}
			self._trap_use_trigs[i] sethintstring(string, param1, param2);
		}
	}
}

/*
	Name: trap_move_switches
	Namespace: zm_traps
	Checksum: 0x38A5AF03
	Offset: 0x1948
	Size: 0x1FC
	Parameters: 0
	Flags: Linked
*/
function trap_move_switches()
{
	self trap_lights_red();
	for(i = 0; i < self._trap_switches.size; i++)
	{
		self._trap_switches[i] rotatepitch(180, 0.5);
		if(isdefined(self._trap_type) && self._trap_type == "fire")
		{
			self._trap_switches[i] playsound(#"evt_switch_flip_trap_fire");
			continue;
		}
		self._trap_switches[i] playsound(#"evt_switch_flip_trap");
	}
	self._trap_switches[0] waittill(#"rotatedone");
	self notify(#"switch_activated");
	self waittill(#"available");
	for(i = 0; i < self._trap_switches.size; i++)
	{
		self._trap_switches[i] rotatepitch(-180, 0.5);
	}
	self._trap_switches[0] waittill(#"rotatedone");
	if(!is_true(self.var_fc36786e) && !is_true(level.var_4f7df1ac))
	{
		self trap_lights_green();
	}
}

/*
	Name: trap_activate_fire
	Namespace: zm_traps
	Checksum: 0x85899572
	Offset: 0x1B50
	Size: 0xC6
	Parameters: 0
	Flags: Linked
*/
function trap_activate_fire()
{
	self._trap_duration = 40;
	self._trap_cooldown_time = 60;
	fx_points = struct::get_array(self.target, "targetname");
	for(i = 0; i < fx_points.size; i++)
	{
		util::wait_network_frame();
		fx_points[i] thread trap_audio_fx(self);
	}
	self thread trap_damage();
	wait(self._trap_duration);
	self notify(#"trap_done");
}

/*
	Name: trap_activate_rotating
	Namespace: zm_traps
	Checksum: 0xE8A3EAB2
	Offset: 0x1C20
	Size: 0x216
	Parameters: 0
	Flags: Linked
*/
function trap_activate_rotating()
{
	self endon(#"trap_done");
	self._trap_duration = 30;
	self._trap_cooldown_time = 60;
	self thread trap_damage();
	self thread trig_update(self._trap_movers[0]);
	old_angles = self._trap_movers[0].angles;
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] rotateyaw(360, 5, 4.5);
	}
	wait(5);
	step = 1.5;
	t = 0;
	while(t < self._trap_duration)
	{
		for(i = 0; i < self._trap_movers.size; i++)
		{
			self._trap_movers[i] rotateyaw(360, step);
		}
		wait(step);
		t = t + step;
	}
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i] rotateyaw(360, 5, 0, 4.5);
	}
	wait(5);
	for(i = 0; i < self._trap_movers.size; i++)
	{
		self._trap_movers[i].angles = old_angles;
	}
	self notify(#"trap_done");
}

/*
	Name: trap_activate_flipper
	Namespace: zm_traps
	Checksum: 0x80F724D1
	Offset: 0x1E40
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function trap_activate_flipper()
{
}

/*
	Name: trap_audio_fx
	Namespace: zm_traps
	Checksum: 0x9018071F
	Offset: 0x1E50
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function trap_audio_fx(trap)
{
	if(isdefined(level._custom_traps) && isdefined(level._custom_traps[trap.script_noteworthy]) && isdefined(level._custom_traps[trap.script_noteworthy].audio))
	{
		self [[level._custom_traps[trap.script_noteworthy].audio]](trap);
	}
	else
	{
		sound_origin = undefined;
		trap waittilltimeout(trap._trap_duration, #"trap_done");
		if(isdefined(sound_origin))
		{
			playsoundatposition(#"wpn_zmb_electrap_stop", sound_origin.origin);
			sound_origin stoploopsound();
			waitframe(1);
			sound_origin delete();
		}
	}
}

/*
	Name: trap_damage
	Namespace: zm_traps
	Checksum: 0xFCED9821
	Offset: 0x1F70
	Size: 0x386
	Parameters: 0
	Flags: Linked
*/
function trap_damage()
{
	self endon(#"trap_done");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		ent = waitresult.activator;
		if(isplayer(ent))
		{
			if(self function_3f401e8d(ent))
			{
				continue;
			}
			if(isdefined(level._custom_traps) && isdefined(level._custom_traps[self._trap_type]) && isdefined(level._custom_traps[self._trap_type].player_damage))
			{
				ent thread [[level._custom_traps[self._trap_type].player_damage]](self);
			}
			else
			{
				switch(self._trap_type)
				{
					case "rocket":
					{
						ent thread player_fire_damage();
						break;
					}
					case "rotating":
					{
						if(ent getstance() == "stand")
						{
							ent dodamage(50, ent.origin + vectorscale((0, 0, 1), 20));
							ent setstance("crouch");
						}
						break;
					}
				}
			}
			if(ent.health <= 1 && !is_true(ent.var_acc576f0))
			{
				ent thread function_783361ed(self);
			}
		}
		else if(!isdefined(ent.marked_for_death))
		{
			if(isdefined(level._custom_traps) && isdefined(level._custom_traps[self._trap_type]) && isdefined(level._custom_traps[self._trap_type].damage))
			{
				ent thread [[level._custom_traps[self._trap_type].damage]](self);
			}
			else
			{
				switch(self._trap_type)
				{
					case "rocket":
					{
						ent thread zombie_trap_death(self, 100);
						break;
					}
					case "rotating":
					{
						ent thread zombie_trap_death(self, 200);
						break;
					}
					case "werewolfer":
					{
						ent thread zombie_trap_death(self, 100);
						break;
					}
					default:
					{
						ent thread zombie_trap_death(self, randomint(100));
						break;
					}
				}
			}
		}
	}
}

/*
	Name: function_783361ed
	Namespace: zm_traps
	Checksum: 0xEBE3435C
	Offset: 0x2300
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function function_783361ed(e_trap)
{
	self endon(#"disconnect");
	self.var_acc576f0 = 1;
	level notify(#"hash_506a87adeefb4736", {#e_trap:e_trap, #e_victim:self});
	while(isalive(self) && self laststand::player_is_in_laststand())
	{
		waitframe(1);
	}
	self.var_acc576f0 = undefined;
}

/*
	Name: trig_update
	Namespace: zm_traps
	Checksum: 0x8775C418
	Offset: 0x23B8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function trig_update(parent)
{
	self endon(#"trap_done");
	start_angles = self.angles;
	while(true)
	{
		self.angles = parent.angles;
		waitframe(1);
	}
}

/*
	Name: player_elec_damage
	Namespace: zm_traps
	Checksum: 0x6591DA3E
	Offset: 0x2418
	Size: 0x1A2
	Parameters: 1
	Flags: None
*/
function player_elec_damage(trigger)
{
	self endon(#"death", #"disconnect");
	if(!isdefined(level.elec_loop))
	{
		level.elec_loop = 0;
	}
	if(!is_true(self.is_burning) && zm_utility::is_player_valid(self))
	{
		self.is_burning = 1;
		shocktime = 2.5;
		if(isdefined(level.str_elec_damage_shellshock_override))
		{
			str_elec_shellshock = level.str_elec_damage_shellshock_override;
		}
		else
		{
			str_elec_shellshock = "electrocution";
		}
		self shellshock(str_elec_shellshock, shocktime);
		self playrumbleonentity("damage_heavy");
		self playsound(#"hash_5af2a9d11f007b9");
		if(zm_utility::is_standard())
		{
			self dodamage(50, self.origin, undefined, trigger);
		}
		else
		{
			self dodamage(150, self.origin, undefined, trigger);
		}
		wait(1);
		self.is_burning = undefined;
	}
}

/*
	Name: player_fire_damage
	Namespace: zm_traps
	Checksum: 0x2597B4C6
	Offset: 0x25C8
	Size: 0x19E
	Parameters: 0
	Flags: Linked
*/
function player_fire_damage()
{
	self endon(#"death", #"disconnect");
	if(!is_true(self.is_burning) && !self laststand::player_is_in_laststand())
	{
		self.is_burning = 1;
		if(is_true(level.trap_fire_visionset_registered))
		{
			visionset_mgr::activate("overlay", "zm_trap_burn", self, 1.25, 1.25);
		}
		else
		{
			self setburn(1.25);
		}
		self notify(#"burned");
		if(!self hasperk(#"hash_47d7a8105237c88") || (self.health - 100) < 1)
		{
			radiusdamage(self.origin, 10, self.health + 100, self.health + 100);
			self.is_burning = undefined;
		}
		else
		{
			self dodamage(50, self.origin);
			wait(0.1);
			self.is_burning = undefined;
		}
	}
}

/*
	Name: zombie_trap_death
	Namespace: zm_traps
	Checksum: 0x719A6FD
	Offset: 0x2770
	Size: 0x4AC
	Parameters: 2
	Flags: Linked
*/
function zombie_trap_death(e_trap, param)
{
	self endon(#"death");
	self.marked_for_death = 1;
	switch(e_trap._trap_type)
	{
		case "rocket":
		{
			if(isdefined(self.animname) && self.animname != "zombie_dog")
			{
				if(param > 90 && level.burning_zombies.size < 6)
				{
					level.burning_zombies[level.burning_zombies.size] = self;
					self thread zombie_flame_watch();
					self playsound(#"zmb_ignite");
					self thread zombie_death::flame_death_fx();
					playfxontag(level._effect[#"character_fire_death_torso"], self, "J_SpineLower");
					wait(randomfloat(1.25));
				}
				else
				{
					refs[0] = "guts";
					refs[1] = "right_arm";
					refs[2] = "left_arm";
					refs[3] = "right_leg";
					refs[4] = "left_leg";
					refs[5] = "no_legs";
					refs[6] = "head";
					self.a.gib_ref = refs[randomint(refs.size)];
					playsoundatposition(#"wpn_zmb_electrap_zap", self.origin);
					wait(randomfloat(1.25));
					self playsound(#"wpn_zmb_electrap_zap");
				}
			}
			if(isdefined(self.fire_damage_func))
			{
				self [[self.fire_damage_func]](e_trap);
			}
			else
			{
				level notify(#"trap_kill", {#e_trap:e_trap, #e_victim:self});
				self dodamage(self.health + 666, self.origin, e_trap);
			}
			break;
		}
		case "rotating":
		case "centrifuge":
		{
			ang = vectortoangles(e_trap.origin - self.origin);
			direction_vec = vectorscale(anglestoright(ang), param);
			if(isdefined(self.trap_reaction_func))
			{
				self [[self.trap_reaction_func]](e_trap);
			}
			level notify(#"trap_kill", {#e_trap:e_trap, #e_victim:self});
			self startragdoll();
			self launchragdoll(direction_vec);
			util::wait_network_frame();
			self.a.gib_ref = "head";
			self dodamage(self.health, self.origin, e_trap);
			break;
		}
	}
	if(isdefined(e_trap.activated_by_player) && isplayer(e_trap.activated_by_player))
	{
		e_trap.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
		e_trap.activated_by_player contracts::function_5b88297d(#"hash_1f11b620a6de486b");
	}
}

/*
	Name: zombie_flame_watch
	Namespace: zm_traps
	Checksum: 0x9644FBAC
	Offset: 0x2C28
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function zombie_flame_watch()
{
	self waittill(#"death");
	if(isdefined(self))
	{
		self stoploopsound();
		arrayremovevalue(level.burning_zombies, self);
	}
}

/*
	Name: play_elec_vocals
	Namespace: zm_traps
	Checksum: 0xD8663DBC
	Offset: 0x2C88
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function play_elec_vocals()
{
	if(isdefined(self))
	{
		org = self.origin;
		wait(0.15);
		playsoundatposition(#"zmb_elec_vocals", org);
		playsoundatposition(#"wpn_zmb_electrap_zap", org);
		playsoundatposition(#"zmb_exp_jib_zombie", org);
	}
}

/*
	Name: electroctute_death_fx
	Namespace: zm_traps
	Checksum: 0x301A6444
	Offset: 0x2D20
	Size: 0x304
	Parameters: 0
	Flags: None
*/
function electroctute_death_fx()
{
	self endon(#"death");
	if(isdefined(self.is_electrocuted) && self.is_electrocuted)
	{
		return;
	}
	self.is_electrocuted = 1;
	self thread electrocute_timeout();
	if(self.team == level.zombie_team)
	{
		level.bconfiretime = gettime();
		level.bconfireorg = self.origin;
	}
	if(isdefined(level._effect[#"elec_torso"]))
	{
		playfxontag(level._effect[#"elec_torso"], self, "J_SpineLower");
	}
	self playsound(#"zmb_elec_jib_zombie");
	wait(1);
	tagarray = [];
	tagarray[0] = "J_Elbow_LE";
	tagarray[1] = "J_Elbow_RI";
	tagarray[2] = "J_Knee_RI";
	tagarray[3] = "J_Knee_LE";
	tagarray = array::randomize(tagarray);
	if(isdefined(level._effect[#"elec_md"]))
	{
		playfxontag(level._effect[#"elec_md"], self, tagarray[0]);
	}
	self playsound(#"zmb_elec_jib_zombie");
	wait(1);
	self playsound(#"zmb_elec_jib_zombie");
	tagarray[0] = "J_Wrist_RI";
	tagarray[1] = "J_Wrist_LE";
	if(!isdefined(self.a.gib_ref) || self.a.gib_ref != "no_legs")
	{
		tagarray[2] = "J_Ankle_RI";
		tagarray[3] = "J_Ankle_LE";
	}
	tagarray = array::randomize(tagarray);
	if(isdefined(level._effect[#"elec_sm"]))
	{
		playfxontag(level._effect[#"elec_sm"], self, tagarray[0]);
		playfxontag(level._effect[#"elec_sm"], self, tagarray[1]);
	}
}

/*
	Name: electrocute_timeout
	Namespace: zm_traps
	Checksum: 0x5638F826
	Offset: 0x3030
	Size: 0x96
	Parameters: 0
	Flags: Linked
*/
function electrocute_timeout()
{
	self endon(#"death");
	self playloopsound(#"amb_fire_manager_0");
	wait(12);
	self stoploopsound();
	if(isdefined(self) && isalive(self))
	{
		self.is_electrocuted = 0;
		self notify(#"stop_flame_damage");
	}
}

/*
	Name: trap_dialog
	Namespace: zm_traps
	Checksum: 0xB131DF59
	Offset: 0x30D0
	Size: 0x192
	Parameters: 0
	Flags: Linked
*/
function trap_dialog()
{
	self endon(#"warning_dialog");
	level endon(#"switch_flipped");
	timer = 0;
	while(true)
	{
		wait(0.5);
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			if(!isdefined(players[i]))
			{
				continue;
			}
			dist = distancesquared(players[i].origin, self.origin);
			if(dist > 4900)
			{
				timer = 0;
				continue;
			}
			if(dist < 4900 && timer < 3)
			{
				wait(0.5);
				timer++;
			}
			if(!isdefined(players[i]))
			{
				continue;
			}
			if(dist < 4900 && timer == 3)
			{
				index = zm_utility::get_player_index(players[i]);
				plr = ("plr_" + index) + "_";
				wait(3);
				self notify(#"warning_dialog");
			}
		}
	}
}

/*
	Name: get_trap_array
	Namespace: zm_traps
	Checksum: 0x38267369
	Offset: 0x3270
	Size: 0x92
	Parameters: 1
	Flags: None
*/
function get_trap_array(trap_type)
{
	ents = getentarray("zombie_trap", "targetname");
	traps = [];
	for(i = 0; i < ents.size; i++)
	{
		if(ents[i].script_noteworthy == trap_type)
		{
			traps[traps.size] = ents[i];
		}
	}
	return traps;
}

/*
	Name: trap_disable
	Namespace: zm_traps
	Checksum: 0xEC3BEB57
	Offset: 0x3310
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function trap_disable(var_ccf895cc)
{
	if(!isdefined(var_ccf895cc))
	{
		var_ccf895cc = #"hash_2276db2c26ee907a";
	}
	if(!is_true(self.var_b3166dc1))
	{
		return;
	}
	cooldown = self._trap_cooldown_time;
	if(self._trap_in_use)
	{
		self notify(#"trap_done");
		self notify(#"hash_2133afbbd7534561");
		self._trap_cooldown_time = 0.05;
		self waittill(#"available");
	}
	if(isarray(self._trap_use_trigs))
	{
		foreach(var_9bda8088 in self._trap_use_trigs)
		{
			var_9bda8088.var_fc36786e = 1;
		}
	}
	self trap_lights_red();
	self._trap_cooldown_time = cooldown;
	self trap_set_string(var_ccf895cc);
}

/*
	Name: trap_enable
	Namespace: zm_traps
	Checksum: 0xCE5BC34C
	Offset: 0x3490
	Size: 0x12C
	Parameters: 2
	Flags: Linked
*/
function trap_enable(var_f9afc2b3, var_b8c50025)
{
	if(!isdefined(var_b8c50025))
	{
		var_b8c50025 = #"hash_23c1c09e94181fdb";
	}
	if(!is_true(self.var_b3166dc1))
	{
		return;
	}
	if(isarray(self._trap_use_trigs))
	{
		foreach(var_9bda8088 in self._trap_use_trigs)
		{
			var_9bda8088.var_fc36786e = undefined;
		}
	}
	str_text = var_b8c50025;
	self trap_set_string(str_text, self.zombie_cost);
	self trap_lights_green();
}

/*
	Name: function_6966417b
	Namespace: zm_traps
	Checksum: 0x2692B66D
	Offset: 0x35C8
	Size: 0xE0
	Parameters: 1
	Flags: Linked
*/
function function_6966417b(var_ccf895cc)
{
	if(!isdefined(var_ccf895cc))
	{
		var_ccf895cc = #"hash_2276db2c26ee907a";
	}
	var_ec9e2b1d = getentarray("zombie_trap", "targetname");
	foreach(var_9bda8088 in var_ec9e2b1d)
	{
		var_9bda8088 thread trap_disable(var_ccf895cc);
	}
	level.var_4f7df1ac = 1;
}

/*
	Name: function_9d0c9706
	Namespace: zm_traps
	Checksum: 0x359927AD
	Offset: 0x36B0
	Size: 0xFA
	Parameters: 2
	Flags: Linked
*/
function function_9d0c9706(var_f9afc2b3, var_b8c50025)
{
	if(!isdefined(var_f9afc2b3))
	{
		var_f9afc2b3 = #"hash_23c1c09e94181fdb";
	}
	if(!isdefined(var_b8c50025))
	{
		var_b8c50025 = #"hash_6e8ef1b690e98e51";
	}
	var_ec9e2b1d = getentarray("zombie_trap", "targetname");
	foreach(var_9bda8088 in var_ec9e2b1d)
	{
		var_9bda8088 thread trap_enable(var_f9afc2b3, var_b8c50025);
	}
	level.var_4f7df1ac = undefined;
}

/*
	Name: trap_model_type_init
	Namespace: zm_traps
	Checksum: 0x608C2528
	Offset: 0x37B8
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function trap_model_type_init()
{
	if(!isdefined(self.script_parameters))
	{
		self.script_parameters = "default";
	}
	switch(self.script_parameters)
	{
		case "pentagon_electric":
		{
			self._trap_light_model_off = "zombie_trap_switch_light";
			self._trap_light_model_green = "zombie_trap_switch_light_on_green";
			self._trap_light_model_red = "zombie_trap_switch_light_on_red";
			self._trap_switch_model = "zombie_trap_switch_handle";
			break;
		}
		case "default":
		default:
		{
			self._trap_light_model_off = "zombie_zapper_cagelight";
			self._trap_light_model_green = "zombie_zapper_cagelight";
			self._trap_light_model_red = "zombie_zapper_cagelight";
			self._trap_switch_model = "zombie_zapper_handle";
			break;
		}
	}
}

/*
	Name: function_3f401e8d
	Namespace: zm_traps
	Checksum: 0x8834C6F0
	Offset: 0x38B8
	Size: 0x21C
	Parameters: 1
	Flags: Linked
*/
function function_3f401e8d(e_player)
{
	if(e_player hasperk(#"hash_6ca140703a87cd09") || is_true(self.var_efc76c5d) || is_true(e_player.var_c09a076a))
	{
		if(e_player issliding())
		{
			e_player thread function_a1812da9();
			return true;
		}
		if(is_true(e_player.var_9beb4442) || is_true(e_player.var_c09a076a))
		{
			return true;
		}
	}
	if(e_player bgb::is_enabled(#"hash_7c80df83e002a4d6"))
	{
		if(!isdefined(e_player.var_410e7c36))
		{
			e_player.var_410e7c36 = [];
		}
		else if(!isarray(e_player.var_410e7c36))
		{
			e_player.var_410e7c36 = array(e_player.var_410e7c36);
		}
		if(!isinarray(e_player.var_410e7c36, self))
		{
			if(!isdefined(e_player.var_410e7c36))
			{
				e_player.var_410e7c36 = [];
			}
			else if(!isarray(e_player.var_410e7c36))
			{
				e_player.var_410e7c36 = array(e_player.var_410e7c36);
			}
			e_player.var_410e7c36[e_player.var_410e7c36.size] = self;
			e_player zm_stats::increment_challenge_stat(#"hash_108042c8bd6693fb");
		}
		return true;
	}
	return false;
}

/*
	Name: function_a1812da9
	Namespace: zm_traps
	Checksum: 0x1FBB0AB5
	Offset: 0x3AE0
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_a1812da9()
{
	self notify(#"hash_337fc06844d7d1bb");
	self endon(#"disconnect", #"hash_337fc06844d7d1bb");
	self.var_9beb4442 = 1;
	wait(0.25);
	self.var_9beb4442 = undefined;
}

/*
	Name: function_19d61a68
	Namespace: zm_traps
	Checksum: 0x3A33CE22
	Offset: 0x3B48
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function function_19d61a68()
{
	self.var_efc76c5d = 1;
}

/*
	Name: function_da13db45
	Namespace: zm_traps
	Checksum: 0xA97F7761
	Offset: 0x3B68
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_da13db45(n_cooldown, e_player)
{
	if(isdefined(e_player) && e_player hasperk(#"hash_37aa3a5919757781"))
	{
		n_cooldown = n_cooldown * 0.5;
	}
	return n_cooldown;
}

/*
	Name: is_trap_registered
	Namespace: zm_traps
	Checksum: 0x9BCF9F35
	Offset: 0x3BC8
	Size: 0x18
	Parameters: 1
	Flags: None
*/
function is_trap_registered(a_registered_traps)
{
	return isdefined(a_registered_traps[self.script_noteworthy]);
}

/*
	Name: register_trap_basic_info
	Namespace: zm_traps
	Checksum: 0xAE109888
	Offset: 0x3BE8
	Size: 0xC6
	Parameters: 3
	Flags: None
*/
function register_trap_basic_info(str_trap, func_activate, func_audio)
{
	/#
		assert(isdefined(str_trap), "");
	#/
	/#
		assert(isdefined(func_activate), "");
	#/
	/#
		assert(isdefined(func_audio), "");
	#/
	_register_undefined_trap(str_trap);
	level._custom_traps[str_trap].activate = func_activate;
	level._custom_traps[str_trap].audio = func_audio;
}

/*
	Name: _register_undefined_trap
	Namespace: zm_traps
	Checksum: 0x28C75469
	Offset: 0x3CB8
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function _register_undefined_trap(str_trap)
{
	if(!isdefined(level._custom_traps))
	{
		level._custom_traps = [];
	}
	if(!isdefined(level._custom_traps[str_trap]))
	{
		level._custom_traps[str_trap] = spawnstruct();
	}
}

/*
	Name: register_trap_damage
	Namespace: zm_traps
	Checksum: 0x1D444C71
	Offset: 0x3D20
	Size: 0x86
	Parameters: 3
	Flags: None
*/
function register_trap_damage(str_trap, func_player_damage, func_damage)
{
	/#
		assert(isdefined(str_trap), "");
	#/
	_register_undefined_trap(str_trap);
	level._custom_traps[str_trap].player_damage = func_player_damage;
	level._custom_traps[str_trap].damage = func_damage;
}

/*
	Name: function_60d9e800
	Namespace: zm_traps
	Checksum: 0xADDBFC8D
	Offset: 0x3DB0
	Size: 0x86
	Parameters: 3
	Flags: None
*/
function function_60d9e800(str_trap, var_75734507, var_53d35f37)
{
	/#
		assert(isdefined(str_trap), "");
	#/
	_register_undefined_trap(str_trap);
	level._custom_traps[str_trap].var_75734507 = var_75734507;
	level._custom_traps[str_trap].var_53d35f37 = var_53d35f37;
}

