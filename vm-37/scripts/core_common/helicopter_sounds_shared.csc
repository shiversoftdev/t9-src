#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\audio_shared.csc;

#namespace helicopter_sounds;

/*
	Name: __init__system__
	Namespace: helicopter_sounds
	Checksum: 0x415A0B1B
	Offset: 0x228
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"helicopter_sounds", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: helicopter_sounds
	Checksum: 0x185595C3
	Offset: 0x270
	Size: 0x5CC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level._entityshutdowncbfunc = &heli_linkto_sound_ents_delete;
	level.helisoundvalues = [];
	init_heli_sound_values("cobra", "turbine", 65, 0.6, 0.8, 65, 1, 1.1);
	init_heli_sound_values("cobra", "top_rotor", 45, 0.7, 1, 45, 0.95, 1.1);
	init_heli_sound_values("cobra", "tail_rotor", 45, 0.5, 1, 45, 0.95, 1.1);
	init_heli_sound_values("hind", "turbine", 65, 0.6, 0.8, 65, 1, 1.1);
	init_heli_sound_values("hind", "top_rotor", 45, 0.7, 1, 45, 0.95, 1.1);
	init_heli_sound_values("hind", "tail_rotor", 45, 0.5, 1, 45, 0.95, 1.1);
	init_heli_sound_values("supply", "turbine", 65, 0.7, 1, 65, 1, 1.1);
	init_heli_sound_values("supply", "top_rotor", 35, 0.95, 1, 100, 1, 1.1);
	init_heli_sound_values("supply", "tail_rotor", 35, 0.95, 1, 45, 1, 1.1);
	init_heli_sound_values("huey", "turbine", 65, 0.7, 0.8, 65, 1, 1.1);
	init_heli_sound_values("huey", "top_rotor", 45, 0.8, 1, 45, 0.95, 1.1);
	init_heli_sound_values("huey", "tail_rotor", 45, 0.6, 1, 45, 0.95, 1);
	init_heli_sound_values("huey", "wind_rt", 45, 0.6, 1, 45, 0.95, 1);
	init_heli_sound_values("huey", "wind_lft", 45, 0.6, 1, 45, 0.95, 1);
	init_heli_sound_values("qrdrone", "turbine_idle", 30, 0.8, 0, 16, 0.9, 1.1);
	init_heli_sound_values("qrdrone", "turbine_moving", 30, 0, 0.9, 20, 0.9, 1.1);
	init_heli_sound_values("qrdrone", "turn", 5, 0, 1, 1, 1, 1);
	init_heli_sound_values("heli_guard", "turbine", 10, 0.9, 1, 30, 0.9, 1.05);
	init_heli_sound_values("heli_guard", "rotor", 10, 0.9, 1, 30, 0.9, 1.1);
	/#
		if(getdvarstring(#"helisounds") == "")
		{
			setdvar(#"helisounds", "");
		}
		level thread command_parser();
	#/
}

/*
	Name: vehicle_is_firing_function
	Namespace: helicopter_sounds
	Checksum: 0x8A8143F1
	Offset: 0x848
	Size: 0x8A
	Parameters: 7
	Flags: None
*/
function vehicle_is_firing_function(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	/#
		println("" + bwastimejump);
	#/
	if(bwastimejump == 0)
	{
		self.isfiring = 0;
	}
	else
	{
		self.isfiring = 1;
	}
}

/*
	Name: init_heli_sound_values
	Namespace: helicopter_sounds
	Checksum: 0x4FBAF5B1
	Offset: 0x8E0
	Size: 0x27C
	Parameters: 8
	Flags: None
*/
function init_heli_sound_values(heli_type, part_type, max_speed_vol, min_vol, max_vol, max_speed_pitch, min_pitch, max_pitch)
{
	if(!isdefined(level.helisoundvalues[heli_type]))
	{
		level.helisoundvalues[heli_type] = [];
	}
	if(!isdefined(level.helisoundvalues[heli_type][part_type]))
	{
		level.helisoundvalues[heli_type][part_type] = spawnstruct();
	}
	level.helisoundvalues[heli_type][part_type].speedvolumemax = max_speed_vol;
	level.helisoundvalues[heli_type][part_type].speedpitchmax = max_speed_pitch;
	level.helisoundvalues[heli_type][part_type].volumemin = min_vol;
	level.helisoundvalues[heli_type][part_type].volumemax = max_vol;
	level.helisoundvalues[heli_type][part_type].pitchmin = min_pitch;
	level.helisoundvalues[heli_type][part_type].pitchmax = max_pitch;
	/#
		if(getdvarint(#"debug_heli", 0) > 0)
		{
			println("" + heli_type);
			println("" + part_type);
			println("" + max_speed_vol);
			println("" + min_vol);
			println("" + max_vol);
			println("" + max_speed_pitch);
			println("" + min_pitch);
			println("" + max_pitch);
		}
	#/
}

/*
	Name: command_parser
	Namespace: helicopter_sounds
	Checksum: 0x43BEDC73
	Offset: 0xB68
	Size: 0x538
	Parameters: 0
	Flags: None
*/
function command_parser()
{
	/#
		while(true)
		{
			command = getdvarstring(#"helisounds");
			if(command != "")
			{
				success = 1;
				tokens = strtok(command, "");
				if(!isdefined(tokens[0]) || !isdefined(level.helisoundvalues[tokens[0]]))
				{
					if(isdefined(tokens[0]))
					{
						println("" + tokens[0]);
					}
					else
					{
						println("");
					}
					println("");
					success = 0;
				}
				else
				{
					if(!isdefined(tokens[1]))
					{
						if(isdefined(tokens[1]))
						{
							println((("" + tokens[0]) + "") + tokens[1]);
						}
						else
						{
							println("" + tokens[0]);
						}
						println("");
						success = 0;
					}
					else
					{
						if(!isdefined(tokens[2]))
						{
							println((("" + tokens[0]) + "") + tokens[1]);
							println("");
							success = 0;
						}
						else if(!isdefined(tokens[3]))
						{
							println((("" + tokens[0]) + "") + tokens[1]);
							println("");
							success = 0;
						}
					}
				}
				if(success)
				{
					heli_type = tokens[0];
					heli_part = tokens[1];
					value_name = tokens[2];
					value = float(tokens[3]);
					switch(value_name)
					{
						case "volumemin":
						{
							level.helisoundvalues[heli_type][heli_part].volumemin = value;
							println("" + value);
							break;
						}
						case "volumemax":
						{
							level.helisoundvalues[heli_type][heli_part].volumemax = value;
							println("" + value);
							break;
						}
						case "pitchmin":
						{
							level.helisoundvalues[heli_type][heli_part].pitchmin = value;
							println("" + value);
							break;
						}
						case "pitchmax":
						{
							level.helisoundvalues[heli_type][heli_part].pitchmax = value;
							println("" + value);
							break;
						}
						case "speedvolumemax":
						{
							level.helisoundvalues[heli_type][heli_part].speedvolumemax = value;
							println("" + value);
							break;
						}
						case "speedpitchmax":
						{
							level.helisoundvalues[heli_type][heli_part].speedpitchmax = value;
							println("" + value);
							break;
						}
						default:
						{
							println("");
						}
					}
				}
				setdvar(#"helisounds", "");
			}
			wait(0.1);
		}
	#/
}

/*
	Name: init_heli_sounds_gunner
	Namespace: helicopter_sounds
	Checksum: 0xB6D5D032
	Offset: 0x10A8
	Size: 0x162
	Parameters: 0
	Flags: None
*/
function init_heli_sounds_gunner()
{
	setup_heli_sounds("lfe", "engine", "snd_cockpit", #"veh_huey_rotor_lfe");
	setup_heli_sounds("turbine", "engine", "snd_rotor", #"veh_huey_turbine");
	setup_heli_sounds("top_rotor", "engine", "snd_rotor", #"veh_huey_rotor");
	setup_heli_sounds("tail_rotor", "engine", "snd_tail_rotor", #"veh_huey_tail");
	setup_heli_sounds("wind_rt", "engine", "snd_wind_right", #"veh_huey_door_wind");
	setup_heli_sounds("radio", "engine", "snd_cockpit", #"veh_huey_radio");
	self.warning_tag = "snd_cockpit";
}

/*
	Name: init_heli_sounds_player_controlled
	Namespace: helicopter_sounds
	Checksum: 0x4275370E
	Offset: 0x1218
	Size: 0xF2
	Parameters: 0
	Flags: None
*/
function init_heli_sounds_player_controlled()
{
	setup_heli_sounds("lfe", "engine", "snd_cockpit", #"veh_cobra_rotor_lfe");
	setup_heli_sounds("turbine", "engine", "snd_rotor", #"veh_cobra_turbine");
	setup_heli_sounds("top_rotor", "engine", "snd_rotor", #"veh_cobra_rotor");
	setup_heli_sounds("tail_rotor", "engine", "snd_tail_rotor", #"veh_cobra_tail");
	self.warning_tag = "snd_cockpit";
}

/*
	Name: init_heli_sounds_supply
	Namespace: helicopter_sounds
	Checksum: 0x5AEC189C
	Offset: 0x1318
	Size: 0x9E
	Parameters: 0
	Flags: None
*/
function init_heli_sounds_supply()
{
	setup_heli_sounds("lfe", "engine", undefined, #"veh_supply_rotor_lfe");
	setup_heli_sounds("turbine", "engine", undefined, #"veh_supply_turbine");
	setup_heli_sounds("top_rotor", "engine", undefined, #"veh_supply_rotor");
	self.warning_tag = undefined;
}

/*
	Name: init_heli_sounds_ai_attack
	Namespace: helicopter_sounds
	Checksum: 0x4C851EAE
	Offset: 0x13C0
	Size: 0xCE
	Parameters: 0
	Flags: None
*/
function init_heli_sounds_ai_attack()
{
	setup_heli_sounds("lfe", "engine", undefined, #"veh_hind_rotor_lfe");
	setup_heli_sounds("turbine", "engine", undefined, #"veh_hind_turbine");
	setup_heli_sounds("top_rotor", "engine", undefined, #"veh_hind_rotor");
	setup_heli_sounds("tail_rotor", "engine", undefined, #"veh_hind_tail");
	self.warning_tag = undefined;
}

/*
	Name: init_heli_sounds_player_drone
	Namespace: helicopter_sounds
	Checksum: 0xA9283C63
	Offset: 0x1498
	Size: 0xB6
	Parameters: 0
	Flags: None
*/
function init_heli_sounds_player_drone()
{
	setup_heli_sounds("turbine_idle", "engine", "tag_body", #"veh_qrdrone_turbine_idle");
	setup_heli_sounds("turbine_moving", "engine", "tag_body", #"veh_qrdrone_turbine_moving");
	setup_heli_sounds("turn", "engine", "tag_body", #"veh_qrdrone_idle_rotate");
	self.warning_tag = undefined;
}

/*
	Name: init_heli_sounds_heli_guard
	Namespace: helicopter_sounds
	Checksum: 0x259AD9F7
	Offset: 0x1558
	Size: 0x9E
	Parameters: 0
	Flags: None
*/
function init_heli_sounds_heli_guard()
{
	setup_heli_sounds("lfe", "engine", undefined, #"veh_overwatch_lfe");
	setup_heli_sounds("turbine", "engine", undefined, #"veh_overwatch_turbine");
	setup_heli_sounds("rotor", "engine", undefined, #"veh_overwatch_rotor");
	self.warning_tag = undefined;
}

/*
	Name: sound_linkto
	Namespace: helicopter_sounds
	Checksum: 0x2E7F919E
	Offset: 0x1600
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function sound_linkto(parent, tag)
{
	if(isdefined(tag))
	{
		self linkto(parent, tag);
	}
	else
	{
		self linkto(parent, "tag_body");
	}
}

/*
	Name: setup_heli_sounds
	Namespace: helicopter_sounds
	Checksum: 0xF603644
	Offset: 0x1668
	Size: 0x324
	Parameters: 7
	Flags: None
*/
function setup_heli_sounds(bone_location, type, tag, run, dmg1, dmg2, dmg3)
{
	self.heli[bone_location] = spawnstruct();
	self.heli[bone_location].sound_type = type;
	self.heli[bone_location].run = spawn(0, self.origin, "script_origin");
	self.heli[bone_location].run sound_linkto(self, tag);
	self.heli[bone_location].run.alias = run;
	self thread heli_loop_sound_delete(self.heli[bone_location].run);
	if(isdefined(dmg1))
	{
		self.heli[bone_location].idle = spawn(0, self.origin, "script_origin");
		self.heli[bone_location].idle sound_linkto(self, tag);
		self.heli[bone_location].idle.alias = dmg1;
		self thread heli_loop_sound_delete(self.heli[bone_location].dmg1);
	}
	if(isdefined(dmg2))
	{
		self.heli[bone_location].idle = spawn(0, self.origin, "script_origin");
		self.heli[bone_location].idle sound_linkto(self, tag);
		self.heli[bone_location].idle.alias = dmg2;
		self thread heli_loop_sound_delete(self.heli[bone_location].dmg2);
	}
	if(isdefined(dmg3))
	{
		self.heli[bone_location].idle = spawn(0, self.origin, "script_origin");
		self.heli[bone_location].idle sound_linkto(self, tag);
		self.heli[bone_location].idle.alias = dmg3;
		self thread heli_loop_sound_delete(self.heli[bone_location].dmg3);
	}
}

/*
	Name: init_terrain_sounds
	Namespace: helicopter_sounds
	Checksum: 0x4E3DB1A0
	Offset: 0x1998
	Size: 0x27C
	Parameters: 0
	Flags: None
*/
function init_terrain_sounds()
{
	self.surface_type = [];
	self.surface_type[#"default"] = "dirt";
	self.surface_type[#"metal"] = "dirt";
	self.surface_type[#"concrete"] = "dirt";
	self.surface_type[#"wood"] = "dirt";
	self.surface_type[#"dirt"] = "dirt";
	self.surface_type[#"gravel"] = "dirt";
	self.surface_type[#"grass"] = "dirt";
	self.surface_type[#"mud"] = "dirt";
	self.surface_type[#"snow"] = "dirt";
	self.surface_type[#"asphalt"] = "dirt";
	self.surface_type[#"brick"] = "dirt";
	self.surface_type[#"glass"] = "dirt";
	self.surface_type[#"plaster"] = "dirt";
	self.surface_type[#"sand"] = "dirt";
	self.surface_type[#"rock"] = "dirt";
	self.surface_type[#"water"] = "water";
	self.surface_type[#"foliage"] = "dirt";
	self setup_terrain_sounds("dirt", "veh_chopper_prop_wash_dirt");
	self setup_terrain_sounds("water", "veh_chopper_prop_wash_water");
}

/*
	Name: setup_terrain_sounds
	Namespace: helicopter_sounds
	Checksum: 0x4B6262B9
	Offset: 0x1C20
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function setup_terrain_sounds(surface_type, alias)
{
	self.terrain_ent_array[surface_type] = spawn(0, self.origin, "script_origin");
	self.terrain_ent_array[surface_type].alias = alias;
	self thread heli_loop_sound_delete(self.terrain_ent_array[surface_type]);
}

/*
	Name: setup_terrain_brass_sounds
	Namespace: helicopter_sounds
	Checksum: 0xFFB0A7B4
	Offset: 0x1CA8
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function setup_terrain_brass_sounds(surface_type, alias)
{
	self.terrain_brass_ent_array[surface_type] = spawn(0, self.origin, "script_origin");
	self.terrain_brass_ent_array[surface_type].alias = alias;
	self thread heli_loop_sound_delete(self.terrain_brass_ent_array[surface_type]);
}

/*
	Name: start_helicopter_sounds
	Namespace: helicopter_sounds
	Checksum: 0xC8770994
	Offset: 0x1D30
	Size: 0x1E4
	Parameters: 1
	Flags: None
*/
function start_helicopter_sounds(localclientnum)
{
	if(isdefined(self.sounddef))
	{
		self.heli = [];
		self.terrain = [];
		self.sound_ents = [];
		self.cur_speed = 0;
		self.mph_to_inches_per_sec = 17.6;
		self.speed_of_wind = 20;
		self.idle_run_trans_speed = 5;
		switch(self.sounddef)
		{
			case "veh_heli_ai_mp":
			{
				break;
			}
			case "veh_heli_guard_mp":
			{
				break;
			}
			case "veh_heli_supplydrop_mp":
			{
				break;
			}
			case "veh_heli_gunner_mp":
			{
				break;
			}
			case "veh_heli_player_gunner_mp":
			{
				break;
			}
			case "veh_drn_qrdrone_mp":
			{
				break;
			}
			default:
			{
				/#
					println(("" + self.vehicletype) + "");
				#/
				break;
			}
		}
		self init_terrain_sounds();
		self thread terrain_trace();
		/#
			if(getdvarint(#"debug_heli", 0) > 0)
			{
				iprintlnbold(("" + self.vehicletype) + "");
			}
		#/
	}
	else
	{
		/#
			println("");
		#/
	}
}

/*
	Name: heli_loop_sound_delete
	Namespace: helicopter_sounds
	Checksum: 0x145CF409
	Offset: 0x1F20
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function heli_loop_sound_delete(real_ent)
{
	self waittill(#"death");
	real_ent unlink();
	real_ent stopallloopsounds(4);
	real_ent delete();
}

/*
	Name: heli_linkto_sound_ents_delete
	Namespace: helicopter_sounds
	Checksum: 0x8C1A46BC
	Offset: 0x1F90
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function heli_linkto_sound_ents_delete(localclientnum, entity)
{
	entity notify(#"death");
}

/*
	Name: heli_sound_play
	Namespace: helicopter_sounds
	Checksum: 0x2D93377A
	Offset: 0x1FC0
	Size: 0xC2
	Parameters: 1
	Flags: None
*/
function heli_sound_play(heli_bone)
{
	switch(heli_bone.sound_type)
	{
		case "engine":
		{
			heli_bone.run playloopsound(heli_bone.run.alias, 2);
			break;
		}
		case "wind":
		{
			break;
		}
		default:
		{
			/#
				println(("" + heli_bone.type) + "");
			#/
			break;
		}
	}
}

/*
	Name: play_player_controlled_sounds
	Namespace: helicopter_sounds
	Checksum: 0xF5313BB5
	Offset: 0x2090
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function play_player_controlled_sounds()
{
	self heli_sound_play(self.heli[#"lfe"]);
	self thread heli_idle_run_transition("cobra", "turbine");
	self thread heli_idle_run_transition("cobra", "top_rotor");
	self thread heli_idle_run_transition("cobra", "tail_rotor");
}

/*
	Name: play_attack_ai_sounds
	Namespace: helicopter_sounds
	Checksum: 0x26BB8640
	Offset: 0x2140
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function play_attack_ai_sounds()
{
	self heli_sound_play(self.heli[#"lfe"]);
	self thread heli_idle_run_transition("hind", "turbine");
	self thread heli_idle_run_transition("hind", "top_rotor");
	self thread heli_idle_run_transition("hind", "tail_rotor");
}

/*
	Name: play_supply_sounds
	Namespace: helicopter_sounds
	Checksum: 0x76256BED
	Offset: 0x21F0
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function play_supply_sounds()
{
	self thread heli_idle_run_transition("supply", "turbine");
	self thread heli_idle_run_transition("supply", "top_rotor");
	self heli_sound_play(self.heli[#"lfe"]);
}

/*
	Name: play_gunner_sounds
	Namespace: helicopter_sounds
	Checksum: 0xB92965B8
	Offset: 0x2278
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function play_gunner_sounds()
{
	self heli_sound_play(self.heli[#"lfe"]);
	self heli_sound_play(self.heli[#"radio"]);
	self thread heli_idle_run_transition("huey", "turbine");
	self thread heli_idle_run_transition("huey", "top_rotor");
	self thread heli_idle_run_transition("huey", "tail_rotor");
	self thread heli_idle_run_transition("huey", "wind_rt");
}

/*
	Name: play_player_drone_sounds
	Namespace: helicopter_sounds
	Checksum: 0x80F724D1
	Offset: 0x2378
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function play_player_drone_sounds()
{
}

/*
	Name: play_heli_guard_sounds
	Namespace: helicopter_sounds
	Checksum: 0x483D1CBA
	Offset: 0x2388
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function play_heli_guard_sounds()
{
	self heli_sound_play(self.heli[#"lfe"]);
	self thread heli_idle_run_transition("heli_guard", "turbine");
	self thread heli_idle_run_transition("heli_guard", "rotor");
	self thread terrain_trace_brass();
}

/*
	Name: heli_idle_run_transition
	Namespace: helicopter_sounds
	Checksum: 0x346E4C06
	Offset: 0x2428
	Size: 0x426
	Parameters: 4
	Flags: None
*/
function heli_idle_run_transition(heli_type, heli_part, wait_time, updown)
{
	self endon(#"death");
	heli_bone = self.heli[heli_part];
	run_id = heli_bone.run playloopsound(heli_bone.run.alias, 0.5);
	if(!isdefined(wait_time))
	{
		wait_time = 0.5;
	}
	while(isdefined(self))
	{
		if(!isdefined(level.helisoundvalues[heli_type]) || !isdefined(level.helisoundvalues[heli_type][heli_part]))
		{
			/#
				println("");
			#/
			return;
		}
		max_speed_vol = level.helisoundvalues[heli_type][heli_part].speedvolumemax;
		min_vol = level.helisoundvalues[heli_type][heli_part].volumemin;
		max_vol = level.helisoundvalues[heli_type][heli_part].volumemax;
		max_speed_pitch = level.helisoundvalues[heli_type][heli_part].speedpitchmax;
		min_pitch = level.helisoundvalues[heli_type][heli_part].pitchmin;
		max_pitch = level.helisoundvalues[heli_type][heli_part].pitchmax;
		plr_vel = self getvelocity();
		self.cur_speed = abs(sqrt(vectordot(plr_vel, plr_vel))) / self.mph_to_inches_per_sec;
		run_volume = audio::scale_speed(self.idle_run_trans_speed, max_speed_vol, min_vol, max_vol, self.cur_speed);
		run_pitch = audio::scale_speed(self.idle_run_trans_speed, max_speed_pitch, min_pitch, max_pitch, self.cur_speed);
		if(isdefined(updown))
		{
			if(!isdefined(self.qrdrone_z_difference))
			{
				self.qrdrone_z_difference = 0;
			}
			run_volume_vertical = audio::scale_speed(5, 50, 0, 1, abs(self.qrdrone_z_difference));
			run_volume = run_volume - run_volume_vertical;
		}
		if(isdefined(run_volume) && isdefined(run_pitch))
		{
			heli_bone.run setloopstate(heli_bone.run.alias, run_volume, run_pitch, 1, 0.15);
			/#
				if(getdvarint(#"debug_heli", 0) > 0)
				{
					println("" + self.cur_speed);
					println("" + run_pitch);
					println("" + self.cur_speed);
					println("" + run_volume);
				}
			#/
		}
		wait(wait_time);
	}
}

/*
	Name: terrain_trace_brass
	Namespace: helicopter_sounds
	Checksum: 0x94AEA3C1
	Offset: 0x2858
	Size: 0x370
	Parameters: 0
	Flags: None
*/
function terrain_trace_brass()
{
	self endon(#"death");
	self setup_terrain_brass_sounds("dirt", "prj_brass_loop_dirt");
	self setup_terrain_brass_sounds("water", "prj_brass_loop_water");
	self.isfiring = 0;
	trace = undefined;
	trace_ent = self;
	pre_terrain = undefined;
	next_terrain = undefined;
	pre_trace_real_ent = undefined;
	trace_real_ent = undefined;
	pre_origin = vectorscale((1, 1, 1), 100000);
	while(isdefined(self))
	{
		wait(1 + randomfloatrange(0, 0.2));
		if(distancesquared(pre_origin, trace_ent.origin) < 144)
		{
			continue;
		}
		pre_origin = trace_ent.origin;
		trace = tracepoint(trace_ent.origin, trace_ent.origin - vectorscale((0, 0, 1), 100000));
		trace_surface_type = trace[#"surfacetype"];
		if(!isdefined(trace))
		{
			continue;
		}
		pre_terrain = next_terrain;
		next_terrain = trace_surface_type;
		if(!isdefined(pre_terrain) || !isdefined(next_terrain))
		{
			continue;
		}
		if(!isdefined(self.surface_type[next_terrain]) || !isdefined(self.surface_type[pre_terrain]))
		{
			/#
			#/
			continue;
		}
		surf_type = self.surface_type[next_terrain];
		trace_real_ent = self.terrain_brass_ent_array[surf_type];
		pre_surf_type = self.surface_type[pre_terrain];
		pre_trace_real_ent = self.terrain_brass_ent_array[pre_surf_type];
		if(!isdefined(trace[#"position"]))
		{
			if(isdefined(pre_trace_real_ent))
			{
				pre_trace_real_ent stopallloopsounds(0.5);
			}
			continue;
		}
		if(!self.isfiring)
		{
			pre_trace_real_ent stopallloopsounds(0.5);
		}
		trace_real_ent.origin = trace[#"position"];
		pre_trace_real_ent.origin = trace[#"position"];
		if(isdefined(surf_type) && self.isfiring)
		{
			if(surf_type == pre_surf_type && pre_trace_real_ent isplayingloopsound())
			{
				continue;
			}
			pre_trace_real_ent stopallloopsounds(0.5);
			trace_real_ent playloopsound(trace_real_ent.alias, 0.75);
		}
	}
}

/*
	Name: terrain_trace
	Namespace: helicopter_sounds
	Checksum: 0xC2D0257A
	Offset: 0x2BD0
	Size: 0x2E0
	Parameters: 0
	Flags: None
*/
function terrain_trace()
{
	self endon(#"death");
	trace = undefined;
	trace_ent = self;
	pre_terrain = undefined;
	next_terrain = undefined;
	pre_trace_real_ent = undefined;
	trace_real_ent = undefined;
	pre_origin = vectorscale((1, 1, 1), 100000);
	while(isdefined(self))
	{
		wait(1 + randomfloatrange(0, 0.2));
		if(distancesquared(pre_origin, trace_ent.origin) < 144)
		{
			continue;
		}
		pre_origin = trace_ent.origin;
		trace = tracepoint(trace_ent.origin, trace_ent.origin - vectorscale((0, 0, 1), 100000));
		trace_surface_type = trace[#"surfacetype"];
		if(!isdefined(trace))
		{
			continue;
		}
		pre_terrain = next_terrain;
		next_terrain = trace_surface_type;
		if(!isdefined(pre_terrain) || !isdefined(next_terrain))
		{
			continue;
		}
		if(!isdefined(self.surface_type[next_terrain]) || !isdefined(self.surface_type[pre_terrain]))
		{
			/#
			#/
			continue;
		}
		surf_type = self.surface_type[next_terrain];
		trace_real_ent = self.terrain_ent_array[surf_type];
		pre_surf_type = self.surface_type[pre_terrain];
		pre_trace_real_ent = self.terrain_ent_array[pre_surf_type];
		if(!isdefined(trace[#"position"]))
		{
			if(isdefined(pre_trace_real_ent))
			{
				pre_trace_real_ent stopallloopsounds(0.5);
			}
			continue;
		}
		trace_real_ent.origin = trace[#"position"];
		pre_trace_real_ent.origin = trace[#"position"];
		if(isdefined(surf_type))
		{
			if(surf_type == pre_surf_type && pre_trace_real_ent isplayingloopsound())
			{
				continue;
			}
			pre_trace_real_ent stopallloopsounds(0.5);
			trace_real_ent playloopsound(trace_real_ent.alias, 0.5);
		}
	}
}

/*
	Name: aircraft_dustkick
	Namespace: helicopter_sounds
	Checksum: 0x68EB65CF
	Offset: 0x2EB8
	Size: 0x3D8
	Parameters: 1
	Flags: None
*/
function aircraft_dustkick(localclientnum)
{
	/#
		println("");
	#/
	self endon(#"death");
	maxheight = 1200;
	minheight = 350;
	if(self.vehicletype == #"qrdrone_mp")
	{
		maxheight = 120;
		minheight = 1;
	}
	slowestrepeatwait = 0.15;
	fastestrepeatwait = 0.05;
	numframespertrace = 3;
	dotracethisframe = numframespertrace;
	defaultrepeatrate = 1;
	repeatrate = defaultrepeatrate;
	trace = undefined;
	d = undefined;
	trace_ent = self;
	while(isdefined(self))
	{
		if(repeatrate <= 0)
		{
			repeatrate = defaultrepeatrate;
		}
		if(!util::server_wait(localclientnum, repeatrate))
		{
			continue;
		}
		if(!isdefined(self))
		{
			return;
		}
		dotracethisframe--;
		if(dotracethisframe <= 0)
		{
			dotracethisframe = numframespertrace;
			trace = bullettrace(trace_ent.origin, trace_ent.origin - vectorscale((0, 0, 1), 100000), 0, trace_ent, 1);
			d = distance(trace_ent.origin, trace[#"position"]);
			repeatrate = (d - minheight) / (maxheight - minheight) * (slowestrepeatwait - fastestrepeatwait) + fastestrepeatwait;
		}
		if(!isdefined(trace))
		{
			continue;
		}
		/#
			assert(isdefined(d));
		#/
		if(d > maxheight)
		{
			repeatrate = defaultrepeatrate;
			continue;
		}
		if(isdefined(trace[#"entity"]))
		{
			repeatrate = defaultrepeatrate;
			continue;
		}
		if(!isdefined(trace[#"position"]))
		{
			repeatrate = defaultrepeatrate;
			continue;
		}
		if(!isdefined(trace[#"surfacetype"]))
		{
			trace[#"surfacetype"] = "dirt";
		}
		if(!isdefined(self.treadfxnamearray) || !isdefined(self.treadfxnamearray[trace[#"surfacetype"]]))
		{
			/#
				if(isdefined(self.vehicletype))
				{
					println((("" + trace[#"surfacetype"]) + "") + self.vehicletype);
				}
				else
				{
					println(("" + trace[#"surfacetype"]) + "");
				}
			#/
			return;
		}
		if(isdefined(self.treadfxnamearray[trace[#"surfacetype"]]))
		{
			playfx(localclientnum, self.treadfxnamearray[trace[#"surfacetype"]], trace[#"position"]);
		}
	}
}

/*
	Name: play_targeting_sound
	Namespace: helicopter_sounds
	Checksum: 0xAB0144B6
	Offset: 0x3298
	Size: 0x80
	Parameters: 3
	Flags: None
*/
function play_targeting_sound(play, sound, handle)
{
	sound_ent = get_lock_sound_ent();
	if(play)
	{
		return sound_ent playloopsound(sound);
	}
	if(isdefined(handle))
	{
		sound_ent stopallloopsounds(0.1);
		return undefined;
	}
}

/*
	Name: play_targeted_sound
	Namespace: helicopter_sounds
	Checksum: 0x387253D1
	Offset: 0x3320
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function play_targeted_sound(play)
{
	self.lockingsound = play_targeting_sound(play, #"veh_hind_alarm_missile_locking_mp", self.lockingsound);
}

/*
	Name: play_locked_sound
	Namespace: helicopter_sounds
	Checksum: 0xA61F7E4C
	Offset: 0x3368
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function play_locked_sound(play)
{
	self.lockedsound = play_targeting_sound(play, #"veh_hind_alarm_missile_locked_mp", self.lockedsound);
}

/*
	Name: play_fired_sound
	Namespace: helicopter_sounds
	Checksum: 0x35183645
	Offset: 0x33B0
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function play_fired_sound(play)
{
	self.firedsound = play_targeting_sound(play, #"veh_hind_alarm_missile_fired", self.firedsound);
}

/*
	Name: play_leaving_battlefield_alarm
	Namespace: helicopter_sounds
	Checksum: 0xFE483B2B
	Offset: 0x33F8
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function play_leaving_battlefield_alarm(play)
{
	sound_ent = get_leaving_sound_ent();
	if(play)
	{
		self.leavingbattlefieldsound = sound_ent playloopsound(#"veh_helicopter_alarm");
	}
	else if(isdefined(self.leavingbattlefieldsound) && self.leavingbattlefieldsound)
	{
		sound_ent stopallloopsounds(0.1);
	}
}

/*
	Name: get_heli_sound_ent
	Namespace: helicopter_sounds
	Checksum: 0x5B899139
	Offset: 0x3490
	Size: 0xA8
	Parameters: 1
	Flags: None
*/
function get_heli_sound_ent(sound_ent)
{
	if(!isdefined(sound_ent))
	{
		tag = "tag_origin";
		if(isdefined(self.warning_tag))
		{
			tag = self.warning_tag;
		}
		sound_ent = spawn(0, self gettagorigin(tag), "script_origin");
		sound_ent linkto(self, tag);
		self thread heli_sound_ent_delete(sound_ent);
	}
	return sound_ent;
}

/*
	Name: get_lock_sound_ent
	Namespace: helicopter_sounds
	Checksum: 0xC6A9836A
	Offset: 0x3540
	Size: 0x2A
	Parameters: 0
	Flags: None
*/
function get_lock_sound_ent()
{
	self.lock_sound_ent = get_heli_sound_ent(self.lock_sound_ent);
	return self.lock_sound_ent;
}

/*
	Name: get_leaving_sound_ent
	Namespace: helicopter_sounds
	Checksum: 0x200A70EE
	Offset: 0x3578
	Size: 0x2A
	Parameters: 0
	Flags: None
*/
function get_leaving_sound_ent()
{
	self.leaving_sound_ent = get_heli_sound_ent(self.leaving_sound_ent);
	return self.leaving_sound_ent;
}

/*
	Name: heli_sound_ent_delete
	Namespace: helicopter_sounds
	Checksum: 0x12391E2A
	Offset: 0x35B0
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function heli_sound_ent_delete(real_ent)
{
	self waittill(#"death");
	real_ent stopallloopsounds(0.1);
	real_ent delete();
}

/*
	Name: drone_up_down_transition
	Namespace: helicopter_sounds
	Checksum: 0xC179A19B
	Offset: 0x3610
	Size: 0x4F0
	Parameters: 0
	Flags: None
*/
function drone_up_down_transition()
{
	self endon(#"death");
	volumerate = 1;
	qr_ent_up = spawn(0, self.origin, "script_origin");
	qr_ent_down = spawn(0, self.origin, "script_origin");
	qr_ent_either = spawn(0, self.origin, "script_origin");
	qr_ent_up thread qr_ent_cleanup(self);
	qr_ent_down thread qr_ent_cleanup(self);
	qr_ent_either thread qr_ent_cleanup(self);
	self.qrdrone_z_difference = 0;
	down = qr_ent_down playloopsound(#"veh_qrdrone_move_down");
	qr_ent_down setloopstate(#"veh_qrdrone_move_down", 0, 0);
	up = qr_ent_up playloopsound(#"veh_qrdrone_move_up");
	qr_ent_up setloopstate(#"veh_qrdrone_move_up", 0, 0);
	either = qr_ent_either playloopsound(#"veh_qrdrone_vertical");
	qr_ent_either setloopstate(#"veh_qrdrone_vertical", 0, 0);
	tag = "tag_body";
	qr_ent_up linkto(self, tag);
	qr_ent_down linkto(self, tag);
	qr_ent_either linkto(self, tag);
	self thread drone_button_watch();
	while(true)
	{
		last_pos = self.origin[2];
		wait(0.1);
		self.qrdrone_z_difference = last_pos - self.origin[2];
		if(self.qrdrone_z_difference < 0)
		{
			up_difference = self.qrdrone_z_difference * -1;
			run_volume_up = audio::scale_speed(5, 40, 0, 1, up_difference);
			run_pitch_up = audio::scale_speed(5, 40, 0.9, 1.1, up_difference);
			run_volume_either = audio::scale_speed(5, 50, 0, 1, up_difference);
			run_pitch_either = audio::scale_speed(5, 50, 0.9, 1.1, up_difference);
		}
		else
		{
			run_volume_up = 0;
			run_pitch_up = 1;
			run_volume_either = audio::scale_speed(5, 50, 0, 1, self.qrdrone_z_difference);
			run_pitch_either = audio::scale_speed(5, 50, 0.95, 0.8, self.qrdrone_z_difference);
		}
		run_volume_down = audio::scale_speed(5, 50, 0, 1, self.qrdrone_z_difference);
		run_pitch_down = audio::scale_speed(5, 50, 1, 0.8, self.qrdrone_z_difference);
		qr_ent_down setloopstate(#"veh_qrdrone_move_down", run_volume_down, run_pitch_down, volumerate);
		qr_ent_up setloopstate(#"veh_qrdrone_move_up", run_volume_up, run_pitch_up, volumerate);
		qr_ent_either setloopstate(#"veh_qrdrone_vertical", run_volume_either, run_pitch_either, volumerate);
	}
}

/*
	Name: qr_ent_cleanup
	Namespace: helicopter_sounds
	Checksum: 0x11F8242D
	Offset: 0x3B08
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function qr_ent_cleanup(veh_ent)
{
	veh_ent waittill(#"death");
	self delete();
}

/*
	Name: drone_rotate_angle
	Namespace: helicopter_sounds
	Checksum: 0xC334FDEA
	Offset: 0x3B50
	Size: 0x220
	Parameters: 2
	Flags: None
*/
function drone_rotate_angle(heli_type, heli_part)
{
	self endon(#"death");
	level endon(#"save_restore");
	volumerate = 2.5;
	qr_ent_angle = spawn(0, self.origin, "script_origin");
	qr_ent_angle thread qr_ent_cleanup(self);
	angle = qr_ent_angle playloopsound(#"veh_qrdrone_idle_rotate");
	setsoundvolume(angle, 0);
	tag = "tag_body";
	qr_ent_angle linkto(self, tag);
	while(true)
	{
		last_angle = abs(self.angles[1]);
		wait(0.1);
		turning_speed = last_angle - abs(self.angles[1]);
		abs_turning_speed = abs(turning_speed);
		jet_stick_vol = audio::scale_speed(0, 5, 0, 0.4, abs_turning_speed);
		jet_stick_pitch = audio::scale_speed(0, 4, 0.9, 1.05, abs_turning_speed);
		qr_ent_angle setloopstate(#"veh_qrdrone_idle_rotate", jet_stick_vol, jet_stick_pitch, volumerate);
	}
}

/*
	Name: drone_button_watch
	Namespace: helicopter_sounds
	Checksum: 0x7BBE22A
	Offset: 0x3D78
	Size: 0xE2
	Parameters: 0
	Flags: None
*/
function drone_button_watch()
{
	self endon(#"death");
	player = getlocalplayers()[0];
	return_to_zero = 1;
	while(true)
	{
		if(abs(self.qrdrone_z_difference) > 5 && return_to_zero)
		{
			self playsound(0, #"veh_qrdrone_move_start");
			return_to_zero = 0;
		}
		else if(abs(self.qrdrone_z_difference) < 5 && !return_to_zero)
		{
			return_to_zero = 1;
		}
		waitframe(1);
	}
}

