#using scripts\weapons\weaponobjects.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using script_5f261a5d57de5f7c;
#using script_3751b21462a54a7d;
#using scripts\zm_common\trials\zm_trial_disable_buys.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using script_301f64a4090c381a;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using script_73bd646be3641c07;
#using scripts\zm_common\bb.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using script_1471eea5d2e60f83;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_blockers;

/*
	Name: __init__system__
	Namespace: zm_blockers
	Checksum: 0x4C2D9002
	Offset: 0xAA8
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_blockers", &function_70a657d8, &function_8ac3bea9, undefined, #"zm");
}

/*
	Name: function_70a657d8
	Namespace: zm_blockers
	Checksum: 0xDDA491A7
	Offset: 0xB08
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(isdefined(level.var_c621179))
	{
		thread [[level.var_c621179]]();
	}
	else
	{
		zm_utility::add_zombie_hint("default_buy_debris", #"hash_1595dd9d4d64f37b");
	}
	zm_utility::add_zombie_hint("default_buy_door", #"hash_456cd0f0d10be48b");
	zm_utility::add_zombie_hint("default_buy_door_close", #"hash_261288d018c0e7e5");
	init_blockers();
}

/*
	Name: function_8ac3bea9
	Namespace: zm_blockers
	Checksum: 0x95792932
	Offset: 0xBC8
	Size: 0xEC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	if(isdefined(level.quantum_bomb_register_result_func))
	{
		[[level.quantum_bomb_register_result_func]]("open_nearest_door", &quantum_bomb_open_nearest_door_result, 35, &quantum_bomb_open_nearest_door_validation);
	}
	zombie_doors = getentarray("zombie_door", "targetname");
	if(isdefined(zombie_doors))
	{
		array::thread_all(zombie_doors, &function_ff88a016);
	}
	zombie_debris = getentarray("zombie_debris", "targetname");
	if(isdefined(zombie_debris))
	{
		array::thread_all(zombie_debris, &function_7325d8d2);
	}
}

/*
	Name: function_ff88a016
	Namespace: zm_blockers
	Checksum: 0x31DEE748
	Offset: 0xCC0
	Size: 0x128
	Parameters: 0
	Flags: Linked
*/
function function_ff88a016()
{
	foreach(door in self.doors)
	{
		if(self.script_noteworthy === "electric_door")
		{
			door namespace_5b1144e::function_9e0598bb(4);
			continue;
		}
		if(door.script_string === "dynamite")
		{
			door namespace_5b1144e::function_9e0598bb(2);
			continue;
		}
		if(isdefined(door.target))
		{
			door namespace_5b1144e::function_9e0598bb(3);
			continue;
		}
		door namespace_5b1144e::function_9e0598bb(1);
	}
}

/*
	Name: function_7325d8d2
	Namespace: zm_blockers
	Checksum: 0xF92FF2BE
	Offset: 0xDF0
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function function_7325d8d2()
{
	foreach(door in self.doors)
	{
		door namespace_5b1144e::function_9e0598bb(2);
	}
}

/*
	Name: init_blockers
	Namespace: zm_blockers
	Checksum: 0x4312D81
	Offset: 0xE88
	Size: 0x17C
	Parameters: 0
	Flags: Linked
*/
function init_blockers()
{
	level.exterior_goals = struct::get_array("exterior_goal", "targetname");
	array::thread_all(level.exterior_goals, &blocker_init);
	level.barrier_align = struct::get_array("barrier_align", "targetname");
	zombie_doors = getentarray("zombie_door", "targetname");
	if(isdefined(zombie_doors))
	{
		level flag::init("door_can_close");
		array::thread_all(zombie_doors, &door_init);
	}
	zombie_debris = getentarray("zombie_debris", "targetname");
	array::thread_all(zombie_debris, &debris_init);
	flag_blockers = getentarray("flag_blocker", "targetname");
	array::thread_all(flag_blockers, &flag_blocker);
}

/*
	Name: function_ba58e1be
	Namespace: zm_blockers
	Checksum: 0x405984F7
	Offset: 0x1010
	Size: 0x174
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ba58e1be(str_type)
{
	if(self.script_noteworthy === "electric_buyable_door" || self.script_noteworthy === "local_electric_door")
	{
		return;
	}
	if(isdefined(self.var_8d3fc50c))
	{
		params = {#hash_5068abe1:self.var_8d3fc50c};
	}
	door_ents = self function_53117870();
	var_8ccff0c9 = (isdefined(door_ents) ? door_ents : self.origin);
	if(!isdefined(self.var_e01b3fc7))
	{
		self.var_e01b3fc7 = [];
	}
	if(isarray(var_8ccff0c9))
	{
		foreach(ent in var_8ccff0c9)
		{
			function_a5c8dce5(ent, str_type, params);
		}
	}
	else
	{
		function_a5c8dce5(var_8ccff0c9, str_type, params);
	}
}

/*
	Name: function_a5c8dce5
	Namespace: zm_blockers
	Checksum: 0x2FE6E89B
	Offset: 0x1190
	Size: 0x160
	Parameters: 3
	Flags: Linked, Private
*/
function private function_a5c8dce5(var_c282fd0f, str_type, params)
{
	if(!isdefined(params))
	{
		params = undefined;
	}
	if(isentity(var_c282fd0f))
	{
		if(is_true(var_c282fd0f.var_4e14a19))
		{
			return;
		}
		var_c282fd0f.var_4e14a19 = 1;
		var_c282fd0f function_619a5c20();
	}
	if(str_type == "debris")
	{
		self.var_e01b3fc7[self.var_e01b3fc7.size] = zm_utility::function_4a4cf79a(#"hash_7e2e59246be3c3c9", var_c282fd0f, params);
	}
	if(self.script_noteworthy === "electric_door")
	{
		self.var_e01b3fc7[self.var_e01b3fc7.size] = zm_utility::function_4a4cf79a(#"hash_255e6c8cbb3d4503", var_c282fd0f, params);
	}
	else
	{
		self.var_e01b3fc7[self.var_e01b3fc7.size] = zm_utility::function_4a4cf79a(#"hash_1b7c3d825c8b5c1a", var_c282fd0f, params);
	}
}

/*
	Name: function_6747a910
	Namespace: zm_blockers
	Checksum: 0x3825659A
	Offset: 0x12F8
	Size: 0x258
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6747a910()
{
	if(isdefined(self.var_e01b3fc7))
	{
		var_e01b3fc7 = self.var_e01b3fc7;
		self.var_e01b3fc7 = undefined;
		if(isarray(self.doors))
		{
			foreach(e_door in self.doors)
			{
				if(e_door function_807c87e7() && e_door.script_string === "dynamite")
				{
					if(isdefined(e_door.var_f912ea8d))
					{
						n_delay = e_door.var_f912ea8d;
					}
					else
					{
						n_delay = 5;
					}
					break;
				}
			}
			if(isdefined(n_delay))
			{
				wait(n_delay);
			}
		}
		foreach(id in var_e01b3fc7)
		{
			zm_utility::function_bc5a54a8(id);
		}
		if(isarray(self.doors))
		{
			foreach(e_door in self.doors)
			{
				e_door function_23a29590();
				ping::function_9455917d(e_door);
			}
		}
	}
}

/*
	Name: door_init
	Namespace: zm_blockers
	Checksum: 0x36D40467
	Offset: 0x1558
	Size: 0x50C
	Parameters: 0
	Flags: Linked
*/
function door_init()
{
	self.type = undefined;
	self.purchaser = undefined;
	self._door_open = 0;
	ent_targets = getentarray(self.target, "targetname");
	node_targets = getnodearray(self.target, "targetname");
	targets = arraycombine(ent_targets, node_targets, 0, 0);
	if(isdefined(self.script_flag) && !isdefined(level.flag[self.script_flag]))
	{
		if(isdefined(self.script_flag))
		{
			tokens = strtok(self.script_flag, ",");
			for(i = 0; i < tokens.size; i++)
			{
				if(!level flag::exists(tokens[i]))
				{
					level flag::init(tokens[i]);
				}
			}
		}
	}
	if(!isdefined(self.script_noteworthy))
	{
		self.script_noteworthy = "default";
	}
	self.doors = [];
	for(i = 0; i < targets.size; i++)
	{
		targets[i] door_classify(self);
		if(!isdefined(targets[i].og_origin))
		{
			targets[i].og_origin = targets[i].origin;
			targets[i].og_angles = targets[i].angles;
		}
	}
	if(zm_custom::function_901b751c(#"zmdoorstate") == 0)
	{
		self setinvisibletoall();
		self.var_1661d836 = 1;
		return;
	}
	cost = function_a9bf8f6c(self);
	self function_ba58e1be("door");
	self setcursorhint("HINT_NOICON");
	self thread blocker_update_prompt_visibility();
	self thread door_think();
	if(isdefined(self.script_noteworthy))
	{
		if(self.script_noteworthy == "electric_door" || self.script_noteworthy == "electric_buyable_door")
		{
			if(zm_utility::is_grief() || zm_custom::function_901b751c(#"zmpowerstate") == 0)
			{
				self setinvisibletoall();
				return;
			}
			self thread function_dafd2e5a();
			if(isdefined(level.door_dialog_function))
			{
				self thread [[level.door_dialog_function]]();
			}
			return;
		}
		if(self.script_noteworthy == "local_electric_door")
		{
			if(zm_utility::is_grief())
			{
				self setinvisibletoall();
				return;
			}
			self sethintstring(#"hash_671e980430950a22");
			if(isdefined(level.door_dialog_function))
			{
				self thread [[level.door_dialog_function]]();
			}
			return;
		}
		if(self.script_noteworthy == "kill_counter_door")
		{
			self sethintstring(#"hash_25a2adc4e37f3813", cost);
			return;
		}
	}
	if(isdefined(level.var_d0b54199))
	{
		self thread [[level.var_d0b54199]](self, cost);
	}
	else
	{
		if(self.clip.script_string === "dynamite" && !is_true(self.script_num))
		{
			self zm_utility::set_hint_string(self, "default_buy_debris", cost);
		}
		else
		{
			self zm_utility::set_hint_string(self, "default_buy_door", cost);
		}
	}
}

/*
	Name: door_classify
	Namespace: zm_blockers
	Checksum: 0xEFDF6761
	Offset: 0x1A70
	Size: 0x1EC
	Parameters: 1
	Flags: Linked
*/
function door_classify(parent_trig)
{
	if(self.script_noteworthy === "air_buy_gate")
	{
		unlinktraversal(self);
		parent_trig.doors[parent_trig.doors.size] = self;
		return;
	}
	if(self.script_noteworthy === "clip")
	{
		parent_trig.clip = self;
		parent_trig.script_string = "clip";
	}
	else
	{
		if(!isdefined(self.script_string))
		{
			if(isdefined(self.script_angles))
			{
				self.script_string = "rotate";
			}
			else if(isdefined(self.script_vector))
			{
				self.script_string = "move";
			}
		}
		else
		{
			if(!isdefined(self.script_string))
			{
				self.script_string = "";
			}
			switch(self.script_string)
			{
				case "anim":
				{
					/#
						assert(isdefined(self.script_animname), "" + self.targetname);
					#/
					/#
						assert(isdefined(level.scr_anim[self.script_animname]), "" + self.script_animname);
					#/
					/#
						assert(isdefined(level.blocker_anim_func), "");
					#/
					break;
				}
			}
		}
	}
	if(self function_807c87e7())
	{
		self disconnectpaths();
	}
	parent_trig.doors[parent_trig.doors.size] = self;
}

/*
	Name: door_buy
	Namespace: zm_blockers
	Checksum: 0x5C05BD3C
	Offset: 0x1C68
	Size: 0x4B8
	Parameters: 0
	Flags: Linked
*/
function door_buy()
{
	waitresult = undefined;
	waitresult = self waittill(#"trigger");
	who = waitresult.activator;
	force = waitresult.is_forced;
	if(getdvarint(#"zombie_unlock_all", 0) > 0 || is_true(force) || is_true(level.var_5791d548))
	{
		return true;
	}
	if(!isdefined(who))
	{
		return false;
	}
	if(isdefined(level.custom_door_buy_check))
	{
		if(!who [[level.custom_door_buy_check]](self))
		{
			return false;
		}
	}
	if(who zm_utility::in_revive_trigger())
	{
		return false;
	}
	if(who zm_utility::is_drinking())
	{
		return false;
	}
	if(zm_trial_disable_buys::is_active())
	{
		return false;
	}
	cost = 0;
	upgraded = 0;
	if(zm_utility::is_player_valid(who))
	{
		players = getplayers();
		cost = self.zombie_cost;
		if(self._door_open == 1)
		{
			self.purchaser = undefined;
		}
		else
		{
			if(who zm_score::can_player_purchase(cost))
			{
				who zm_score::minus_to_player_score(cost);
				scoreevents::processscoreevent("open_door", who);
				demo::bookmark(#"zm_player_door", gettime(), who);
				potm::bookmark(#"zm_player_door", gettime(), who);
				who zm_stats::increment_client_stat("doors_purchased");
				who zm_stats::increment_player_stat("doors_purchased");
				who zm_stats::function_2726a7c2("doors_purchased");
				who zm_stats::increment_challenge_stat(#"survivalist_buy_door");
				who zm_stats::function_8f10788e("boas_doors_purchased");
				who zm_stats::function_c0c6ab19(#"doorbuys", 1, 1);
				who contracts::increment_zm_contract(#"hash_4807d62dfb0df4a2", 1, #"zstandard");
				self.purchaser = who;
				who namespace_e38c57c1::function_c3f3716();
			}
			else
			{
				zm_utility::play_sound_at_pos("no_purchase", self.origin);
				if(isdefined(level.custom_door_deny_vo_func))
				{
					who thread [[level.custom_door_deny_vo_func]]();
				}
				else
				{
					if(isdefined(level.custom_generic_deny_vo_func))
					{
						who thread [[level.custom_generic_deny_vo_func]](1);
					}
					else
					{
						who zm_audio::create_and_play_dialog(#"general", #"outofmoney");
					}
				}
				return false;
			}
		}
	}
	if(isdefined(level._door_open_rumble_func))
	{
		who thread [[level._door_open_rumble_func]]();
	}
	who recordmapevent(5, gettime(), who.origin, level.round_number, cost);
	bb::logpurchaseevent(who, self, cost, self.target, upgraded, "_door", "_purchase");
	return true;
}

/*
	Name: function_db84b4f4
	Namespace: zm_blockers
	Checksum: 0x20DAD45F
	Offset: 0x2128
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_db84b4f4()
{
	a_zombie_doors = getentarray("zombie_door", "targetname");
	level thread function_5989dd12(a_zombie_doors);
	var_38a6b7d0 = getentarray("zombie_airlock_buy", "targetname");
	level thread function_5989dd12(var_38a6b7d0);
	a_zombie_debris = getentarray("zombie_debris", "targetname");
	level thread function_5989dd12(a_zombie_debris);
}

/*
	Name: function_5989dd12
	Namespace: zm_blockers
	Checksum: 0x6604BB5F
	Offset: 0x21F8
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function function_5989dd12(a_doors)
{
	foreach(door in a_doors)
	{
		door force_open_door();
		waitframe(1);
	}
}

/*
	Name: force_open_door
	Namespace: zm_blockers
	Checksum: 0x49A8A4D9
	Offset: 0x2298
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function force_open_door(e_activator)
{
	self notify(#"trigger", {#is_forced:1, #activator:e_activator});
}

/*
	Name: blocker_update_prompt_visibility
	Namespace: zm_blockers
	Checksum: 0xEC38CBF2
	Offset: 0x22E8
	Size: 0x398
	Parameters: 0
	Flags: Linked
*/
function blocker_update_prompt_visibility()
{
	self endon(#"kill_door_think", #"kill_debris_prompt_thread", #"death");
	if(!isdefined(level.var_cef2e607[#"blocker_update_prompt_visibility"]))
	{
		level.var_cef2e607[#"blocker_update_prompt_visibility"] = -1;
	}
	level.var_cef2e607[#"blocker_update_prompt_visibility"]++;
	wait((float(function_60d95f53()) / 1000) * ((level.var_cef2e607[#"blocker_update_prompt_visibility"] % (int(0.25 / (float(function_60d95f53()) / 1000)))) + 1));
	dist = 16384;
	while(true)
	{
		a_players = function_a1ef346b();
		for(i = 0; i < a_players.size; i++)
		{
			if(distancesquared(a_players[i].origin, self.origin) < dist)
			{
				a_players[i].var_a359a8b4 = self;
				if(a_players[i] zm_utility::is_drinking())
				{
					a_players[i] globallogic::function_d96c031e();
					self setinvisibletoplayer(a_players[i], 1);
				}
				else
				{
					if(a_players[i] zm_score::can_player_purchase(self.zombie_cost))
					{
						a_players[i] globallogic::function_d96c031e();
					}
					else
					{
						if(self.script_noteworthy == "electric_door" || self.script_noteworthy == "electric_buyable_door" && !is_true(self.power_on))
						{
							a_players[i] globallogic::function_d96c031e();
						}
						else
						{
							if(self zm_utility::function_4f593819(a_players[i]))
							{
								a_players[i] globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
							}
							else
							{
								a_players[i] globallogic::function_d96c031e();
							}
						}
					}
					self setinvisibletoplayer(a_players[i], 0);
				}
				continue;
			}
			if(isdefined(a_players[i].var_a359a8b4) && a_players[i].var_a359a8b4 == self)
			{
				a_players[i].var_a359a8b4 = undefined;
				a_players[i] globallogic::function_d96c031e();
			}
		}
		wait(0.25);
	}
}

/*
	Name: door_delay
	Namespace: zm_blockers
	Checksum: 0xFE1E69F9
	Offset: 0x2688
	Size: 0xD2
	Parameters: 0
	Flags: Linked
*/
function door_delay()
{
	if(!isdefined(self.script_int))
	{
		self.script_int = 5;
	}
	a_trigs = getentarray(self.target, "target");
	for(i = 0; i < a_trigs.size; i++)
	{
		a_trigs[i] triggerenable(0);
	}
	wait(self.script_int);
	for(i = 0; i < self.script_int; i++)
	{
		/#
			iprintln(self.script_int - i);
		#/
		wait(1);
	}
}

/*
	Name: door_activate
	Namespace: zm_blockers
	Checksum: 0x2253A29D
	Offset: 0x2768
	Size: 0xB9C
	Parameters: 4
	Flags: Linked
*/
function door_activate(time, open, quick, use_blocker_clip_for_pathing)
{
	if(!isdefined(open))
	{
		open = 1;
	}
	if(isdefined(self.script_noteworthy) && self.script_noteworthy == "air_buy_gate")
	{
		if(open)
		{
			linktraversal(self);
		}
		else
		{
			unlinktraversal(self);
		}
		return;
	}
	if(!isdefined(time))
	{
		time = 1;
		if(isdefined(self.script_transition_time))
		{
			time = self.script_transition_time;
		}
	}
	if(isdefined(self.door_moving))
	{
		if(self function_807c87e7())
		{
			if(!is_true(use_blocker_clip_for_pathing))
			{
				if(!open)
				{
					return;
				}
			}
		}
		else
		{
			return;
		}
	}
	self.door_moving = 1;
	if(self function_807c87e7() && self.script_string === "dynamite" && open)
	{
		if(isdefined(self.var_f912ea8d))
		{
			n_delay = self.var_f912ea8d;
		}
		else
		{
			n_delay = 5;
		}
		wait(n_delay);
	}
	if(open || !is_true(quick))
	{
		self notsolid();
	}
	if(self.classname == "script_brushmodel" || self.classname == "script_model")
	{
		if(open)
		{
			self connectpaths();
			if(isdefined(self.var_b9a09166))
			{
				setenablenode(self.var_b9a09166, 1);
				linktraversal(self.var_b9a09166);
			}
		}
	}
	if(self function_807c87e7())
	{
		if(!open)
		{
			self util::delay(time, undefined, &self_disconnectpaths);
			wait(0.1);
			self solid();
		}
		else if(open && self.script_noteworthy !== "model_clip" && is_true(level.var_bb6bf2e0))
		{
			if(isdefined(n_delay))
			{
				self thread util::delay(n_delay, undefined, &notsolid);
				self thread util::delay(n_delay, undefined, &connectpaths);
			}
			else
			{
				self delete();
			}
		}
		if(self.script_noteworthy !== "model_clip")
		{
			return;
		}
	}
	if(isdefined(self.script_sound))
	{
		if(open)
		{
			playsoundatposition(self.script_sound, self.origin);
		}
		else
		{
			playsoundatposition(self.script_sound + "_close", self.origin);
		}
	}
	else
	{
		zm_utility::play_sound_at_pos("zmb_heavy_door_open", self.origin);
	}
	scale = 1;
	if(!open)
	{
		scale = -1;
	}
	switch(self.script_string)
	{
		case "rotate":
		{
			if(isdefined(self.script_angles))
			{
				rot_angle = self.script_angles;
				if(!open)
				{
					rot_angle = self.og_angles;
				}
				self rotateto(rot_angle, time, 0, 0);
				self thread door_solid_thread();
				if(!open)
				{
					self thread disconnect_paths_when_done();
				}
			}
			wait(randomfloat(0.15));
			break;
		}
		case "move":
		case "slide_apart":
		{
			if(isdefined(self.script_vector))
			{
				vector = vectorscale(self.script_vector, scale);
				if(time >= 0.5)
				{
					self moveto(self.origin + vector, time, time * 0.25, time * 0.25);
				}
				else
				{
					self moveto(self.origin + vector, time);
				}
				self thread door_solid_thread();
				if(!open)
				{
					self thread disconnect_paths_when_done();
				}
			}
			wait(randomfloat(0.15));
			break;
		}
		case "anim":
		{
			self [[level.blocker_anim_func]](self.script_animname);
			self thread door_solid_thread_anim();
			wait(randomfloat(0.15));
			break;
		}
		case "physics":
		{
			self thread physics_launch_door(self);
			wait(0.1);
			break;
		}
		case "zbarrier":
		{
			self thread door_zbarrier_move();
			break;
		}
		case "dynamite":
		{
			if(is_true(self.var_4ef01794) && open)
			{
				bomb = util::spawn_model(#"p9_fxanim_zm_ndu_essence_bomb_body_mod", self.origin, self.angles);
				bomb playsound(#"hash_1c30789401e4a67a");
				if(isdefined(self.var_f912ea8d))
				{
					timer = int(self.var_f912ea8d);
					while(timer)
					{
						var_19719503 = 0;
						var_67c95546 = int(timer / 60);
						var_16782a41 = int((timer % 60) / 10);
						var_b30bc24e = (timer % 60) % 10;
						bomb thread function_e02a26f6();
						bomb showpart("tag_slot1_digi_" + var_19719503);
						bomb showpart("tag_slot2_digi_" + var_67c95546);
						bomb showpart("tag_slot3_digi_" + var_16782a41);
						bomb showpart("tag_slot4_digi_" + var_b30bc24e);
						bomb showpart("tag_sign");
						wait(0.5);
						bomb hidepart("tag_sign");
						wait(0.5);
						timer = timer - 1;
						/#
							iprintlnbold(timer);
						#/
					}
				}
				else
				{
					wait(5);
				}
				bomb playsound(#"hash_1371389f48e55f05");
				bomb delete();
				self function_c1342dc1();
			}
			else
			{
				if(!open)
				{
					self show();
					break;
				}
				if(isdefined(self.var_f912ea8d))
				{
					wait(self.var_f912ea8d);
				}
				else
				{
					wait(5);
				}
				if(isdefined(self.script_firefx))
				{
					playfx(level._effect[self.script_firefx], self.origin);
				}
				if(isdefined(self.script_bundle))
				{
					self scene::play(self.script_bundle, self);
				}
				self hide();
				playsoundatposition(#"hash_5679e16b17c350a1", self.origin);
			}
			break;
		}
	}
	if(isdefined(self))
	{
		children = self getlinkedchildren();
		foreach(child in children)
		{
			if(isdefined(child.classname) && child.classname == "grenade")
			{
				weaponobjects::waitandfizzleout(child, 0);
			}
		}
	}
	level notify(#"snddooropening");
	if(isdefined(self.script_firefx) && !isdefined(self.script_bundle) && open)
	{
		playfx(level._effect[self.script_firefx], self.origin);
	}
}

/*
	Name: function_e02a26f6
	Namespace: zm_blockers
	Checksum: 0xD7DD8D76
	Offset: 0x3310
	Size: 0x384
	Parameters: 0
	Flags: Linked
*/
function function_e02a26f6()
{
	self hidepart("tag_slot1_digi_0");
	self hidepart("tag_slot1_digi_1");
	self hidepart("tag_slot2_digi_0");
	self hidepart("tag_slot2_digi_1");
	self hidepart("tag_slot2_digi_2");
	self hidepart("tag_slot2_digi_3");
	self hidepart("tag_slot2_digi_4");
	self hidepart("tag_slot2_digi_5");
	self hidepart("tag_slot2_digi_6");
	self hidepart("tag_slot2_digi_7");
	self hidepart("tag_slot2_digi_8");
	self hidepart("tag_slot2_digi_9");
	self hidepart("tag_slot3_digi_0");
	self hidepart("tag_slot3_digi_1");
	self hidepart("tag_slot3_digi_2");
	self hidepart("tag_slot3_digi_3");
	self hidepart("tag_slot3_digi_4");
	self hidepart("tag_slot3_digi_5");
	self hidepart("tag_slot4_digi_0");
	self hidepart("tag_slot4_digi_1");
	self hidepart("tag_slot4_digi_2");
	self hidepart("tag_slot4_digi_3");
	self hidepart("tag_slot4_digi_4");
	self hidepart("tag_slot4_digi_5");
	self hidepart("tag_slot4_digi_6");
	self hidepart("tag_slot4_digi_7");
	self hidepart("tag_slot4_digi_8");
	self hidepart("tag_slot4_digi_9");
}

/*
	Name: function_c1342dc1
	Namespace: zm_blockers
	Checksum: 0x6173A0B5
	Offset: 0x36A0
	Size: 0x128
	Parameters: 0
	Flags: Linked
*/
function function_c1342dc1()
{
	a_players = getplayers();
	foreach(player in a_players)
	{
		if(distancesquared(self.origin, player.origin) <= 16384)
		{
			player playrumbleonentity("damage_heavy");
			continue;
		}
		if(distancesquared(self.origin, player.origin) <= 65536)
		{
			player playrumbleonentity("damage_light");
		}
	}
}

/*
	Name: kill_trapped_zombies
	Namespace: zm_blockers
	Checksum: 0x6510632A
	Offset: 0x37D0
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function kill_trapped_zombies(trigger)
{
	zombies = getaiteamarray(level.zombie_team);
	if(!isdefined(zombies))
	{
		return;
	}
	for(i = 0; i < zombies.size; i++)
	{
		if(!isdefined(zombies[i]))
		{
			continue;
		}
		if(zombies[i] istouching(trigger))
		{
			zombies[i].marked_for_recycle = 1;
			zombies[i] dodamage(zombies[i].health + 666, trigger.origin, self);
			wait(randomfloat(0.15));
			continue;
		}
		if(isdefined(level.custom_trapped_zombies))
		{
			zombies[i] thread [[level.custom_trapped_zombies]]();
			wait(randomfloat(0.15));
		}
	}
}

/*
	Name: any_player_touching
	Namespace: zm_blockers
	Checksum: 0xF6BB1B9D
	Offset: 0x3908
	Size: 0xAA
	Parameters: 1
	Flags: None
*/
function any_player_touching(trigger)
{
	foreach(player in getplayers())
	{
		if(player istouching(trigger))
		{
			return true;
		}
		wait(0.01);
	}
	return false;
}

/*
	Name: any_player_touching_any
	Namespace: zm_blockers
	Checksum: 0x406125F5
	Offset: 0x39C0
	Size: 0x180
	Parameters: 2
	Flags: Linked
*/
function any_player_touching_any(trigger, more_triggers)
{
	foreach(player in getplayers())
	{
		if(zm_utility::is_player_valid(player, 0, 1))
		{
			if(isdefined(trigger) && player istouching(trigger))
			{
				return true;
			}
			if(isdefined(more_triggers) && more_triggers.size > 0)
			{
				foreach(trig in more_triggers)
				{
					if(isdefined(trig) && player istouching(trig))
					{
						return true;
					}
				}
			}
		}
	}
	return false;
}

/*
	Name: any_zombie_touching_any
	Namespace: zm_blockers
	Checksum: 0x807BEA8A
	Offset: 0x3B48
	Size: 0x178
	Parameters: 2
	Flags: Linked
*/
function any_zombie_touching_any(trigger, more_triggers)
{
	zombies = getaiteamarray(level.zombie_team);
	foreach(zombie in zombies)
	{
		if(isdefined(trigger) && zombie istouching(trigger))
		{
			return true;
		}
		if(isdefined(more_triggers) && more_triggers.size > 0)
		{
			foreach(trig in more_triggers)
			{
				if(isdefined(trig) && zombie istouching(trig))
				{
					return true;
				}
			}
		}
	}
	return false;
}

/*
	Name: wait_trigger_clear
	Namespace: zm_blockers
	Checksum: 0xB7B385DC
	Offset: 0x3CC8
	Size: 0x8E
	Parameters: 3
	Flags: Linked
*/
function wait_trigger_clear(trigger, more_triggers, end_on)
{
	self endon(end_on);
	while(any_player_touching_any(trigger, more_triggers) || any_zombie_touching_any(trigger, more_triggers))
	{
		wait(1);
	}
	/#
		println("");
	#/
	self notify(#"trigger_clear");
}

/*
	Name: waittill_door_trigger_clear_local_power_off
	Namespace: zm_blockers
	Checksum: 0xED26124
	Offset: 0x3D60
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function waittill_door_trigger_clear_local_power_off(trigger, a_trigs)
{
	self endon(#"trigger_clear");
	while(true)
	{
		if(is_true(self.local_power_on))
		{
			self waittill(#"local_power_off");
		}
		/#
			println("");
		#/
		self wait_trigger_clear(trigger, a_trigs, "local_power_on");
	}
}

/*
	Name: waittill_door_trigger_clear_global_power_off
	Namespace: zm_blockers
	Checksum: 0x646F5878
	Offset: 0x3E08
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function waittill_door_trigger_clear_global_power_off(trigger, a_trigs)
{
	self endon(#"trigger_clear");
	while(true)
	{
		if(is_true(self.power_on))
		{
			self waittill(#"power_off");
		}
		/#
			println("");
		#/
		self wait_trigger_clear(trigger, a_trigs, "power_on");
	}
}

/*
	Name: waittill_door_can_close
	Namespace: zm_blockers
	Checksum: 0x17078A05
	Offset: 0x3EB0
	Size: 0x1AA
	Parameters: 0
	Flags: Linked
*/
function waittill_door_can_close()
{
	trigger = undefined;
	if(isdefined(self.door_hold_trigger))
	{
		trigger = getent(self.door_hold_trigger, "targetname");
	}
	a_trigs = getentarray(self.target, "target");
	switch(self.script_noteworthy)
	{
		case "local_electric_door":
		{
			if(isdefined(trigger) || isdefined(a_trigs))
			{
				self waittill_door_trigger_clear_local_power_off(trigger, a_trigs);
				self thread kill_trapped_zombies(trigger);
			}
			else if(is_true(self.local_power_on))
			{
				self waittill(#"local_power_off");
			}
			return;
		}
		case "electric_door":
		{
			if(isdefined(trigger) || isdefined(a_trigs))
			{
				self waittill_door_trigger_clear_global_power_off(trigger, a_trigs);
				if(isdefined(trigger))
				{
					self thread kill_trapped_zombies(trigger);
				}
			}
			else if(is_true(self.power_on))
			{
				self waittill(#"power_off");
			}
			return;
		}
	}
}

/*
	Name: door_think
	Namespace: zm_blockers
	Checksum: 0x58B6134F
	Offset: 0x4068
	Size: 0x5BE
	Parameters: 0
	Flags: Linked
*/
function door_think()
{
	self endon(#"kill_door_think");
	n_cost = self.zombie_cost;
	self sethintlowpriority(1);
	while(true)
	{
		switch(self.script_noteworthy)
		{
			case "local_electric_door":
			{
				if(zm_custom::function_901b751c(#"zmpowerdoorstate") == 0)
				{
					return;
				}
				if(!is_true(self.local_power_on))
				{
					self waittill(#"local_power_on");
				}
				if(!is_true(self._door_open))
				{
					/#
						println("");
					#/
					self door_opened(n_cost, 1);
					if(!isdefined(self.power_cost))
					{
						self.power_cost = 0;
					}
					self.power_cost = self.power_cost + 200;
				}
				self sethintstring("");
				if(is_true(level.local_doors_stay_open))
				{
					return;
				}
				wait(3);
				self waittill_door_can_close();
				self door_block();
				if(is_true(self._door_open))
				{
					/#
						println("");
					#/
					self door_opened(n_cost, 1);
				}
				self sethintstring(#"hash_671e980430950a22");
				wait(3);
				continue;
			}
			case "electric_door":
			{
				if(zm_custom::function_901b751c(#"zmpowerdoorstate") == 0)
				{
					return;
				}
				if(!is_true(self.power_on))
				{
					self waittill(#"power_on");
				}
				if(isdefined(self.script_flag_wait))
				{
					level flag::wait_till(self.script_flag_wait);
				}
				if(!is_true(self._door_open))
				{
					/#
						println("");
					#/
					self door_opened(n_cost, 1);
					if(!isdefined(self.power_cost))
					{
						self.power_cost = 0;
					}
					self.power_cost = self.power_cost + 200;
				}
				self sethintstring("");
				if(is_true(level.local_doors_stay_open))
				{
					return;
				}
				wait(3);
				self waittill_door_can_close();
				self door_block();
				if(is_true(self._door_open))
				{
					/#
						println("");
					#/
					self door_opened(n_cost, 1);
				}
				self thread function_dafd2e5a();
				wait(3);
				continue;
			}
			case "electric_buyable_door":
			{
				if(zm_custom::function_901b751c(#"zmpowerdoorstate") == 0)
				{
					return;
				}
				if(!is_true(self.power_on))
				{
					self waittill(#"power_on");
				}
				self zm_utility::set_hint_string(self, "default_buy_door", n_cost);
				if(!self door_buy())
				{
					continue;
				}
				break;
			}
			case "delay_door":
			{
				if(!self door_buy())
				{
					continue;
				}
				self door_delay();
				break;
			}
			default:
			{
				if(isdefined(level._default_door_custom_logic))
				{
					self [[level._default_door_custom_logic]]();
					break;
				}
				if(!self door_buy())
				{
					continue;
				}
				break;
			}
		}
		self door_opened(n_cost);
		if(!level flag::get("door_can_close"))
		{
			break;
		}
	}
}

/*
	Name: self_and_flag_wait
	Namespace: zm_blockers
	Checksum: 0x19BED038
	Offset: 0x4630
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function self_and_flag_wait(msg)
{
	self endon(msg);
	if(is_true(self.power_door_ignore_flag_wait))
	{
		level waittill(#"forever");
	}
	else
	{
		level flag::wait_till(msg);
	}
}

/*
	Name: door_block
	Namespace: zm_blockers
	Checksum: 0x6195116A
	Offset: 0x46A0
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function door_block()
{
	if(isdefined(self.doors))
	{
		foreach(door in self.doors)
		{
			if(door function_807c87e7())
			{
				door solid();
			}
		}
	}
}

/*
	Name: door_opened
	Namespace: zm_blockers
	Checksum: 0x1419DB60
	Offset: 0x4750
	Size: 0x8FC
	Parameters: 2
	Flags: Linked
*/
function door_opened(cost, quick_close)
{
	if(is_true(self.door_is_moving))
	{
		return;
	}
	self.has_been_opened = 1;
	self thread function_6747a910();
	a_trigs = getentarray(self.target, "target");
	self.door_is_moving = 1;
	foreach(trig in a_trigs)
	{
		trig.door_is_moving = 1;
		trig triggerenable(0);
		trig thread function_6747a910();
		trig.has_been_opened = 1;
		if(!isdefined(trig._door_open) || trig._door_open == 0)
		{
			trig._door_open = 1;
			trig notify(#"door_opened");
		}
		else
		{
			trig._door_open = 0;
		}
		if(isdefined(trig.script_flag) && trig._door_open == 1)
		{
			tokens = strtok(trig.script_flag, ",");
			for(i = 0; i < tokens.size; i++)
			{
				level flag::set(tokens[i]);
			}
		}
		else if(isdefined(trig.script_flag) && trig._door_open == 0)
		{
			tokens = strtok(trig.script_flag, ",");
			for(i = 0; i < tokens.size; i++)
			{
				level flag::clear(tokens[i]);
			}
		}
		if(is_true(quick_close))
		{
			trig zm_utility::set_hint_string(trig, "");
			continue;
		}
		if(trig._door_open == 1 && level flag::get("door_can_close"))
		{
			trig zm_utility::set_hint_string(trig, "default_buy_door_close");
			continue;
		}
		if(trig._door_open == 0)
		{
			trig zm_utility::set_hint_string(trig, "default_buy_door", cost);
		}
	}
	level notify(#"door_opened", {#t_blocker:self, #e_player:self.purchaser});
	if(isplayer(self.purchaser))
	{
		self.purchaser playrumbleonentity(#"damage_light");
	}
	if(isdefined(self.doors))
	{
		is_script_model_door = 0;
		have_moving_clip_for_door = 0;
		use_blocker_clip_for_pathing = 0;
		arrayremovevalue(self.doors, undefined);
		foreach(door in self.doors)
		{
			if(is_true(door.ignore_use_blocker_clip_for_pathing_check))
			{
				continue;
			}
			if(isdefined(door.script_noteworthy) && door.script_noteworthy == "air_buy_gate")
			{
				continue;
			}
			if(door.classname == "script_model")
			{
				is_script_model_door = 1;
				continue;
			}
			if(door.classname == "script_brushmodel" && (!isdefined(door.script_noteworthy) || door.script_noteworthy != "clip") && (!isdefined(door.script_string) || door.script_string != "clip"))
			{
				have_moving_clip_for_door = 1;
			}
		}
		use_blocker_clip_for_pathing = is_script_model_door && !have_moving_clip_for_door;
		for(i = 0; i < self.doors.size; i++)
		{
			if(self.doors[i] zm_utility::function_1a4d2910())
			{
				continue;
			}
			self.doors[i] thread door_activate(self.doors[i].script_transition_time, self._door_open, quick_close, use_blocker_clip_for_pathing);
		}
		if(self.doors.size)
		{
			zm_utility::play_sound_at_pos("purchase", self.origin);
			if(isplayer(self.purchaser))
			{
				self.purchaser util::delay(1.25, "death", &zm_audio::create_and_play_dialog, #"door", #"open");
			}
		}
	}
	if(isdefined(level.var_27028b8e) && isplayer(self.purchaser))
	{
		var_dba3d9ab = [[level.var_27028b8e]](zm_zonemgr::function_8a130a46(self, self.purchaser));
		if(isdefined(var_dba3d9ab))
		{
			var_ee3c60e = #"hash_156427c599c42bdb";
			if(self.clip.script_string === "dynamite")
			{
				var_ee3c60e = #"hash_72191038da6410db";
			}
			level thread popups::displayteammessagetoteam(var_ee3c60e, self.purchaser, self.purchaser.team, var_dba3d9ab, undefined);
		}
	}
	level.active_zone_names = zm_zonemgr::get_active_zone_names();
	wait(1);
	self.door_is_moving = 0;
	foreach(trig in a_trigs)
	{
		trig.door_is_moving = 0;
	}
	if(is_true(quick_close))
	{
		for(i = 0; i < a_trigs.size; i++)
		{
			a_trigs[i] triggerenable(1);
		}
		return;
	}
	if(level flag::get("door_can_close"))
	{
		wait(2);
		for(i = 0; i < a_trigs.size; i++)
		{
			a_trigs[i] triggerenable(1);
		}
	}
}

/*
	Name: physics_launch_door
	Namespace: zm_blockers
	Checksum: 0x20502A0D
	Offset: 0x5058
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function physics_launch_door(door_trig)
{
	vec = vectorscale(vectornormalize(self.script_vector), 10);
	self rotateroll(5, 0.05);
	waitframe(1);
	self moveto(self.origin + vec, 0.1);
	self waittill(#"movedone");
	self physicslaunch(self.origin, self.script_vector * 300);
	wait(60);
	self delete();
}

/*
	Name: door_solid_thread
	Namespace: zm_blockers
	Checksum: 0x3EA7825B
	Offset: 0x5148
	Size: 0xE8
	Parameters: 0
	Flags: Linked
*/
function door_solid_thread()
{
	self waittill(#"rotatedone", #"movedone", #"death");
	if(isdefined(self))
	{
		self.door_moving = undefined;
	}
	while(isdefined(self))
	{
		players = getplayers();
		player_touching = 0;
		for(i = 0; i < players.size; i++)
		{
			if(players[i] istouching(self))
			{
				player_touching = 1;
				break;
			}
		}
		if(!player_touching)
		{
			self solid();
			return;
		}
		wait(1);
	}
}

/*
	Name: door_solid_thread_anim
	Namespace: zm_blockers
	Checksum: 0xA11C5DF
	Offset: 0x5238
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function door_solid_thread_anim()
{
	self waittillmatch({#notetrack:"end"}, #"door_anim");
	self.door_moving = undefined;
	while(true)
	{
		players = getplayers();
		player_touching = 0;
		for(i = 0; i < players.size; i++)
		{
			if(players[i] istouching(self))
			{
				player_touching = 1;
				break;
			}
		}
		if(!player_touching)
		{
			self solid();
			return;
		}
		wait(1);
	}
}

/*
	Name: disconnect_paths_when_done
	Namespace: zm_blockers
	Checksum: 0xB5CAD6E9
	Offset: 0x5320
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function disconnect_paths_when_done()
{
	self waittill(#"rotatedone", #"movedone");
	self disconnectpaths();
}

/*
	Name: self_disconnectpaths
	Namespace: zm_blockers
	Checksum: 0x2F7932D0
	Offset: 0x5368
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function self_disconnectpaths()
{
	self disconnectpaths();
}

/*
	Name: debris_init
	Namespace: zm_blockers
	Checksum: 0xB89D6E22
	Offset: 0x5390
	Size: 0x34C
	Parameters: 0
	Flags: Linked
*/
function debris_init()
{
	n_cost = function_a9bf8f6c(self);
	if(isdefined(self.script_flag) && !isdefined(level.flag[self.script_flag]))
	{
		level flag::init(self.script_flag);
	}
	if(isdefined(level.var_9093a47e))
	{
		self thread [[level.var_9093a47e]](self, n_cost);
	}
	else
	{
		self zm_utility::set_hint_string(self, "default_buy_debris", n_cost);
	}
	self setcursorhint("HINT_NOICON");
	if(zm_custom::function_901b751c(#"zmdoorstate") == 0)
	{
		self setinvisibletoall();
		self.var_1661d836 = 1;
		return;
	}
	if(isdefined(self.target))
	{
		targets = getentarray(self.target, "targetname");
		foreach(target in targets)
		{
			if(target iszbarrier())
			{
				for(i = 0; i < target getnumzbarrierpieces(); i++)
				{
					target setzbarrierpiecestate(i, "closed");
				}
			}
		}
		a_nd_targets = getnodearray(self.target, "targetname");
		foreach(nd_target in a_nd_targets)
		{
			if(isdefined(nd_target.script_noteworthy) && nd_target.script_noteworthy == "air_buy_gate")
			{
				unlinktraversal(nd_target);
			}
		}
	}
	self function_ba58e1be("debris");
	self thread blocker_update_prompt_visibility();
	self thread debris_think();
}

/*
	Name: debris_think
	Namespace: zm_blockers
	Checksum: 0x9C69165F
	Offset: 0x56E8
	Size: 0xF14
	Parameters: 0
	Flags: Linked
*/
function debris_think()
{
	self endon(#"death");
	if(isdefined(level.custom_debris_function))
	{
		self [[level.custom_debris_function]]();
	}
	junk = getentarray(self.target, "targetname");
	for(i = 0; i < junk.size; i++)
	{
		if(isdefined(junk[i].script_noteworthy))
		{
			if(junk[i].script_noteworthy == "clip")
			{
				if(junk[i].script_string !== "skip_disconnectpaths")
				{
					junk[i] disconnectpaths();
				}
			}
		}
	}
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		who = waitresult.activator;
		if(isdefined(who))
		{
			if(isdefined(level.var_2e93df96))
			{
				if(!who [[level.var_2e93df96]](self))
				{
					continue;
				}
			}
			else
			{
				if(getdvarint(#"zombie_unlock_all", 0) > 0 || is_true(waitresult.is_forced) || is_true(level.var_5791d548))
				{
				}
				else
				{
					if(!who usebuttonpressed())
					{
						continue;
					}
					if(who zm_utility::is_drinking())
					{
						continue;
					}
					if(who zm_utility::in_revive_trigger())
					{
						continue;
					}
					if(is_true(level.var_1092025b))
					{
						zm_utility::play_sound_at_pos("no_purchase", self.origin);
						continue;
					}
					if(zm_trial_disable_buys::is_active())
					{
						continue;
					}
				}
			}
		}
		if(zm_utility::is_player_valid(who))
		{
			players = getplayers();
			if(getdvarint(#"zombie_unlock_all", 0) > 0 || is_true(waitresult.is_forced) || is_true(level.var_5791d548))
			{
			}
			else
			{
				if(who zm_score::can_player_purchase(self.zombie_cost))
				{
					who zm_score::minus_to_player_score(self.zombie_cost);
					scoreevents::processscoreevent("open_door", who);
					demo::bookmark(#"zm_player_door", gettime(), who);
					potm::bookmark(#"zm_player_door", gettime(), who);
					who zm_stats::increment_client_stat("doors_purchased");
					who zm_stats::increment_player_stat("doors_purchased");
					who zm_stats::function_2726a7c2("doors_purchased");
					who zm_stats::increment_challenge_stat(#"survivalist_buy_door", undefined, 1);
					who zm_stats::function_8f10788e("boas_doors_purchased");
					who zm_stats::function_c0c6ab19(#"doorbuys", 1, 1);
					who contracts::increment_zm_contract(#"hash_4807d62dfb0df4a2", 1, #"zstandard");
					who namespace_e38c57c1::function_c3f3716();
				}
				else
				{
					zm_utility::play_sound_at_pos("no_purchase", self.origin);
					who zm_audio::create_and_play_dialog(#"general", #"outofmoney");
					continue;
				}
			}
			self notify(#"kill_debris_prompt_thread");
			self thread function_6747a910();
			junk = getentarray(self.target, "targetname");
			if(isdefined(self.script_flag))
			{
				tokens = strtok(self.script_flag, ",");
				for(i = 0; i < tokens.size; i++)
				{
					level flag::set(tokens[i]);
				}
			}
			zm_utility::play_sound_at_pos("purchase", self.origin);
			level notify(#"junk purchased", {#t_blocker:self, #e_player:who});
			move_ent = undefined;
			a_clip = [];
			for(i = 0; i < junk.size; i++)
			{
				junk[i] connectpaths();
				if(isdefined(junk[i].script_noteworthy))
				{
					if(junk[i].script_noteworthy == "clip")
					{
						a_clip[a_clip.size] = junk[i];
						continue;
					}
				}
				struct = undefined;
				if(junk[i] iszbarrier())
				{
					move_ent = junk[i];
					junk[i] thread debris_zbarrier_move();
					continue;
				}
				if(isdefined(junk[i].script_linkto))
				{
					struct = struct::get(junk[i].script_linkto, "script_linkname");
					if(isdefined(struct))
					{
						move_ent = junk[i];
						junk[i] thread debris_move(struct);
					}
					else
					{
						junk[i] delete();
					}
					continue;
				}
				if(isdefined(junk[i].target))
				{
					struct = struct::get(junk[i].target, "targetname");
					if(isdefined(struct))
					{
						move_ent = junk[i];
						junk[i] thread debris_move(struct);
					}
					else
					{
						junk[i] delete();
					}
					continue;
				}
				if(isdefined(junk[i].objectid) && (junk[i].objectid == "symbol_front_debris" || junk[i].objectid == "symbol_back_debris"))
				{
					move_ent = junk[i];
					junk[i] thread debris_move();
					continue;
				}
				junk[i] delete();
			}
			a_nd_targets = getnodearray(self.target, "targetname");
			foreach(nd_target in a_nd_targets)
			{
				if(isdefined(nd_target.script_noteworthy) && nd_target.script_noteworthy == "air_buy_gate")
				{
					linktraversal(nd_target);
				}
			}
			a_trigs = getentarray(self.target, "target");
			for(i = 0; i < a_trigs.size; i++)
			{
				if(a_trigs[i] != self)
				{
					a_trigs[i] thread function_6747a910();
					a_trigs[i] delete();
				}
			}
			for(i = 0; i < a_clip.size; i++)
			{
				a_clip[i] delete();
			}
			if(isdefined(move_ent))
			{
				move_ent waittill(#"movedone");
			}
			self delete();
			break;
		}
		if(is_true(waitresult.is_forced))
		{
			self notify(#"kill_debris_prompt_thread");
			a_e_junk = getentarray(self.target, "targetname");
			if(isdefined(self.script_flag))
			{
				tokens = strtok(self.script_flag, ",");
				for(i = 0; i < tokens.size; i++)
				{
					level flag::set(tokens[i]);
				}
			}
			move_ent = undefined;
			a_clip = [];
			for(i = 0; i < a_e_junk.size; i++)
			{
				a_e_junk[i] connectpaths();
				if(isdefined(a_e_junk[i].script_noteworthy))
				{
					if(a_e_junk[i].script_noteworthy == "clip")
					{
						a_clip[a_clip.size] = a_e_junk[i];
						continue;
					}
				}
				struct = undefined;
				if(a_e_junk[i] iszbarrier())
				{
					move_ent = a_e_junk[i];
					a_e_junk[i] thread debris_zbarrier_move();
					continue;
				}
				if(isdefined(a_e_junk[i].script_linkto))
				{
					struct = struct::get(a_e_junk[i].script_linkto, "script_linkname");
					if(isdefined(struct))
					{
						move_ent = a_e_junk[i];
						a_e_junk[i] thread debris_move(struct);
					}
					else
					{
						a_e_junk[i] delete();
					}
					continue;
				}
				if(isdefined(a_e_junk[i].target))
				{
					struct = struct::get(a_e_junk[i].target, "targetname");
					if(isdefined(struct))
					{
						move_ent = a_e_junk[i];
						a_e_junk[i] thread debris_move(struct);
					}
					else
					{
						a_e_junk[i] delete();
					}
					continue;
				}
				a_e_junk[i] delete();
			}
			a_nd_targets = getnodearray(self.target, "targetname");
			foreach(nd_target in a_nd_targets)
			{
				if(isdefined(nd_target.script_noteworthy) && nd_target.script_noteworthy == "air_buy_gate")
				{
					linktraversal(nd_target);
				}
			}
			a_trigs = getentarray(self.target, "target");
			for(i = 0; i < a_trigs.size; i++)
			{
				if(a_trigs[i] != self)
				{
					a_trigs[i] delete();
				}
			}
			for(i = 0; i < a_clip.size; i++)
			{
				a_clip[i] delete();
			}
			if(isdefined(move_ent))
			{
				move_ent waittill(#"movedone");
			}
			self delete();
			break;
		}
	}
}

/*
	Name: debris_zbarrier_move
	Namespace: zm_blockers
	Checksum: 0x35726898
	Offset: 0x6608
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function debris_zbarrier_move()
{
	if(self.script_noteworthy !== "skip_buy_fx")
	{
		playfx(level._effect[#"poltergeist"], self.origin);
	}
	for(i = 0; i < self getnumzbarrierpieces(); i++)
	{
		self thread move_chunk(i, 1);
	}
}

/*
	Name: door_zbarrier_move
	Namespace: zm_blockers
	Checksum: 0x745E201B
	Offset: 0x66B0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function door_zbarrier_move()
{
	for(i = 0; i < self getnumzbarrierpieces(); i++)
	{
		self thread move_chunk(i, 0);
	}
}

/*
	Name: move_chunk
	Namespace: zm_blockers
	Checksum: 0x6988FAFC
	Offset: 0x6710
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function move_chunk(index, b_hide)
{
	self setzbarrierpiecestate(index, "opening");
	while(self getzbarrierpiecestate(index) == "opening")
	{
		wait(0.1);
	}
	self notify(#"movedone");
	if(b_hide)
	{
		self hidezbarrierpiece(index);
	}
}

/*
	Name: debris_move
	Namespace: zm_blockers
	Checksum: 0xD822D68
	Offset: 0x67B0
	Size: 0x2FC
	Parameters: 1
	Flags: Linked
*/
function debris_move(struct)
{
	self util::script_delay();
	self notsolid();
	self zm_utility::play_sound_on_ent("debris_move");
	if(isdefined(self.script_firefx))
	{
		playfx(level._effect[self.script_firefx], self.origin);
	}
	if(isdefined(self.script_noteworthy))
	{
		if(self.script_noteworthy == "jiggle")
		{
			num = randomintrange(3, 5);
			og_angles = self.angles;
			for(i = 0; i < num; i++)
			{
				angles = og_angles + (-5 + randomfloat(10), -5 + randomfloat(10), -5 + randomfloat(10));
				time = randomfloatrange(0.1, 0.4);
				self rotateto(angles, time);
				wait(time - 0.05);
			}
		}
	}
	time = 0.5;
	if(isdefined(self.script_transition_time))
	{
		time = self.script_transition_time;
	}
	if(isdefined(self.script_vector))
	{
		self moveto(self.origin + self.script_vector, time);
	}
	else
	{
		self moveto(struct.origin, time, time * 0.5);
		self rotateto(struct.angles, time * 0.75);
	}
	self waittill(#"movedone");
	if(isdefined(self.script_fxid))
	{
		playfx(level._effect[self.script_fxid], self.origin);
		playsoundatposition(#"zmb_zombie_spawn", self.origin);
	}
	self delete();
}

/*
	Name: function_a9bf8f6c
	Namespace: zm_blockers
	Checksum: 0x9A24DF28
	Offset: 0x6AB8
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function function_a9bf8f6c(t_door)
{
	while(!isdefined(level.is_forever_solo_game))
	{
		wait(0.1);
	}
	cost = 1000;
	if(isdefined(t_door.zombie_cost))
	{
		if(is_true(level.is_forever_solo_game))
		{
			if(t_door.zombie_cost >= 750)
			{
				t_door.zombie_cost = t_door.zombie_cost - 250;
			}
		}
		cost = t_door.zombie_cost;
	}
	return cost;
}

/*
	Name: blocker_disconnect_paths
	Namespace: zm_blockers
	Checksum: 0x1A9C1D00
	Offset: 0x6B78
	Size: 0x1C
	Parameters: 3
	Flags: Linked
*/
function blocker_disconnect_paths(start_node, end_node, two_way)
{
}

/*
	Name: blocker_connect_paths
	Namespace: zm_blockers
	Checksum: 0xB700E46B
	Offset: 0x6BA0
	Size: 0x1C
	Parameters: 3
	Flags: Linked
*/
function blocker_connect_paths(start_node, end_node, two_way)
{
}

/*
	Name: blocker_init
	Namespace: zm_blockers
	Checksum: 0xC6E7692F
	Offset: 0x6BC8
	Size: 0x844
	Parameters: 0
	Flags: Linked
*/
function blocker_init()
{
	if(!isdefined(self.target))
	{
		return;
	}
	pos = zm_utility::groundpos(self.origin) + vectorscale((0, 0, 1), 8);
	if(isdefined(pos))
	{
		self.origin = pos;
	}
	targets = getentarray(self.target, "targetname");
	self.barrier_chunks = [];
	for(j = 0; j < targets.size; j++)
	{
		if(targets[j] iszbarrier())
		{
			if(isdefined(level.zbarrier_override))
			{
				self thread [[level.zbarrier_override]](targets[j]);
				continue;
			}
			self.zbarrier = targets[j];
			self.zbarrier function_619a5c20();
			self.zbarrier namespace_5b1144e::function_550247bd(12);
			self.zbarrier.chunk_health = [];
			for(i = 0; i < self.zbarrier getnumzbarrierpieces(); i++)
			{
				self.zbarrier.chunk_health[i] = 0;
			}
			continue;
		}
		if(isdefined(targets[j].script_string) && targets[j].script_string == "rock")
		{
			targets[j].material = "rock";
		}
		if(isdefined(targets[j].script_parameters))
		{
			if(targets[j].script_parameters == "grate")
			{
				if(isdefined(targets[j].script_noteworthy))
				{
					if(targets[j].script_noteworthy == "2" || targets[j].script_noteworthy == "3" || targets[j].script_noteworthy == "4" || targets[j].script_noteworthy == "5" || targets[j].script_noteworthy == "6")
					{
						targets[j] hide();
						/#
							iprintlnbold("");
						#/
					}
				}
			}
			else
			{
				if(targets[j].script_parameters == "repair_board")
				{
					targets[j].unbroken_section = getent(targets[j].target, "targetname");
					if(isdefined(targets[j].unbroken_section))
					{
						targets[j].unbroken_section linkto(targets[j]);
						targets[j] hide();
						targets[j] notsolid();
						targets[j].unbroken = 1;
						if(isdefined(targets[j].unbroken_section.script_noteworthy) && targets[j].unbroken_section.script_noteworthy == "glass")
						{
							targets[j].material = "glass";
							targets[j] thread destructible_glass_barricade(targets[j].unbroken_section, self);
						}
						else if(isdefined(targets[j].unbroken_section.script_noteworthy) && targets[j].unbroken_section.script_noteworthy == "metal")
						{
							targets[j].material = "metal";
						}
					}
				}
				else if(targets[j].script_parameters == "barricade_vents")
				{
					targets[j].material = "metal_vent";
				}
			}
		}
		if(isdefined(targets[j].targetname))
		{
		}
		targets[j] update_states("repaired");
		targets[j].destroyed = 0;
		targets[j] show();
		targets[j].claimed = 0;
		targets[j].anim_grate_index = 0;
		targets[j].og_origin = targets[j].origin;
		targets[j].og_angles = targets[j].angles;
		self.barrier_chunks[self.barrier_chunks.size] = targets[j];
	}
	target_nodes = getnodearray(self.target, "targetname");
	for(j = 0; j < target_nodes.size; j++)
	{
		if(target_nodes[j].type == #"begin")
		{
			self.neg_start = target_nodes[j];
			if(isdefined(self.neg_start.target))
			{
				self.neg_end = getnode(self.neg_start.target, "targetname");
			}
			blocker_disconnect_paths(self.neg_start, self.neg_end);
		}
	}
	if(isdefined(self.zbarrier))
	{
		if(isdefined(self.barrier_chunks))
		{
			for(i = 0; i < self.barrier_chunks.size; i++)
			{
				self.barrier_chunks[i] delete();
			}
			self.barrier_chunks = [];
		}
	}
	self blocker_attack_spots();
	if(isdefined(self.zbarrier) && should_delete_zbarriers())
	{
		self.zbarrier_origin = self.zbarrier.origin;
		self.var_f4b27846 = self.zbarrier.angles;
		self.zbarrier delete();
		return;
	}
	a_s_parts = struct::get_array(self.target);
	foreach(s_part in a_s_parts)
	{
		if(s_part.script_noteworthy === "trigger_location")
		{
			self.trigger_location = s_part;
			break;
		}
	}
	self thread blocker_think();
}

/*
	Name: should_delete_zbarriers
	Namespace: zm_blockers
	Checksum: 0x8C681E06
	Offset: 0x7418
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function should_delete_zbarriers()
{
	return getdvarint(#"splitscreen_playercount", 1) > 2;
}

/*
	Name: function_22642075
	Namespace: zm_blockers
	Checksum: 0xA975775F
	Offset: 0x7450
	Size: 0x266
	Parameters: 0
	Flags: Linked
*/
function function_22642075()
{
	a_s_barriers = struct::get_array("exterior_goal", "targetname");
	if(isdefined(level._additional_carpenter_nodes))
	{
		a_s_barriers = arraycombine(a_s_barriers, level._additional_carpenter_nodes, 0, 0);
	}
	foreach(s_barrier in a_s_barriers)
	{
		if(isdefined(s_barrier.zbarrier))
		{
			a_pieces = s_barrier.zbarrier getzbarrierpieceindicesinstate("open");
			if(isdefined(a_pieces))
			{
				for(xx = 0; xx < a_pieces.size; xx++)
				{
					chunk = a_pieces[xx];
					s_barrier.zbarrier zbarrierpieceusedefaultmodel(chunk);
					s_barrier.zbarrier.chunk_health[chunk] = 0;
				}
			}
			for(x = 0; x < s_barrier.zbarrier getnumzbarrierpieces(); x++)
			{
				s_barrier.zbarrier setzbarrierpiecestate(x, "open");
				s_barrier.zbarrier showzbarrierpiece(x);
			}
		}
		if(isdefined(s_barrier.clip))
		{
			s_barrier.clip triggerenable(1);
			s_barrier.clip disconnectpaths();
		}
		else
		{
			blocker_connect_paths(s_barrier.neg_start, s_barrier.neg_end);
		}
		waitframe(1);
	}
}

/*
	Name: destructible_glass_barricade
	Namespace: zm_blockers
	Checksum: 0x8DD58F71
	Offset: 0x76C0
	Size: 0x11A
	Parameters: 2
	Flags: Linked
*/
function destructible_glass_barricade(unbroken_section, node)
{
	unbroken_section setcandamage(1);
	unbroken_section.health = 99999;
	waitresult = undefined;
	waitresult = unbroken_section waittill(#"damage");
	if(zm_utility::is_player_valid(waitresult.attacker) || waitresult.attacker laststand::player_is_in_laststand())
	{
		self thread zm_spawner::zombie_boardtear_offset_fx_horizontle(self, node);
		level thread remove_chunk(self, node, 1);
		self update_states("destroyed");
		self notify(#"destroyed");
		self.unbroken = 0;
	}
}

/*
	Name: blocker_attack_spots
	Namespace: zm_blockers
	Checksum: 0xBBB99502
	Offset: 0x77E8
	Size: 0x334
	Parameters: 0
	Flags: Linked
*/
function blocker_attack_spots()
{
	if(self.content_key === "barricade_window")
	{
		str_target = self.target2;
	}
	else
	{
		str_target = self.target;
	}
	spots = [];
	a_s_parts = struct::get_array(str_target);
	foreach(s_part in a_s_parts)
	{
		if(s_part.script_noteworthy === "attack_spots")
		{
			s_attack_spots = s_part;
			break;
		}
	}
	numslots = self.zbarrier getzbarriernumattackslots();
	numslots = int(max(numslots, 1));
	if(numslots % 2)
	{
		spots[spots.size] = zm_utility::groundpos_ignore_water_new(s_attack_spots.origin + vectorscale((0, 0, 1), 60));
	}
	if(numslots > 1)
	{
		reps = floor(numslots / 2);
		slot = 1;
		for(i = 0; i < reps; i++)
		{
			offset = self.zbarrier getzbarrierattackslothorzoffset() * (i + 1);
			spots[spots.size] = zm_utility::groundpos_ignore_water_new((spots[0] + (anglestoright(s_attack_spots.angles) * offset)) + vectorscale((0, 0, 1), 60));
			slot++;
			if(slot < numslots)
			{
				spots[spots.size] = zm_utility::groundpos_ignore_water_new((spots[0] + (anglestoright(s_attack_spots.angles) * (offset * -1))) + vectorscale((0, 0, 1), 60));
				slot++;
			}
		}
	}
	taken = [];
	for(i = 0; i < spots.size; i++)
	{
		taken[i] = 0;
	}
	self.attack_spots_taken = taken;
	self.attack_spots = spots;
	/#
		self thread zm_utility::debug_attack_spots_taken();
	#/
}

/*
	Name: blocker_choke
	Namespace: zm_blockers
	Checksum: 0x3A4C2263
	Offset: 0x7B28
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function blocker_choke()
{
	level._blocker_choke = 0;
	level endon(#"stop_blocker_think");
	while(true)
	{
		waitframe(1);
		level._blocker_choke = 0;
	}
}

/*
	Name: blocker_think
	Namespace: zm_blockers
	Checksum: 0x1791BC8E
	Offset: 0x7B70
	Size: 0x110
	Parameters: 0
	Flags: Linked
*/
function blocker_think()
{
	level endon(#"stop_blocker_think");
	if(!isdefined(level._blocker_choke))
	{
		level thread blocker_choke();
	}
	use_choke = 0;
	if(isdefined(level._use_choke_blockers) && level._use_choke_blockers == 1)
	{
		use_choke = 1;
	}
	while(true)
	{
		wait(0.5);
		if(use_choke)
		{
			if(level._blocker_choke > 3)
			{
				waitframe(1);
			}
		}
		level._blocker_choke++;
		if(zm_utility::all_chunks_intact(self, self.barrier_chunks))
		{
			continue;
		}
		if(zm_utility::no_valid_repairable_boards(self, self.barrier_chunks))
		{
			continue;
		}
		self blocker_trigger_think();
	}
}

/*
	Name: player_fails_blocker_repair_trigger_preamble
	Namespace: zm_blockers
	Checksum: 0x82E903F9
	Offset: 0x7C88
	Size: 0x14E
	Parameters: 4
	Flags: Linked
*/
function player_fails_blocker_repair_trigger_preamble(player, players, trigger, hold_required)
{
	if(!isdefined(trigger))
	{
		return true;
	}
	if(!player istouching(trigger, vectorscale((1, 1, 1), 10)))
	{
		return true;
	}
	if(!zm_utility::is_player_valid(player))
	{
		return true;
	}
	if(players.size == 1 && isdefined(players[0].intermission) && players[0].intermission == 1)
	{
		return true;
	}
	if(hold_required && !player usebuttonpressed())
	{
		return true;
	}
	if(!hold_required && !player util::use_button_held())
	{
		return true;
	}
	if(player zm_utility::in_revive_trigger())
	{
		return true;
	}
	if(player zm_utility::is_drinking())
	{
		return true;
	}
	return false;
}

/*
	Name: has_blocker_affecting_perk
	Namespace: zm_blockers
	Checksum: 0x9BA0A3BB
	Offset: 0x7DE0
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function has_blocker_affecting_perk()
{
	has_perk = undefined;
	if(isdefined(self) && self namespace_e86ffa8::function_efb6dedf(4))
	{
		has_perk = #"hash_5930cf0eb070e35a";
	}
	return has_perk;
}

/*
	Name: do_post_chunk_repair_delay
	Namespace: zm_blockers
	Checksum: 0x8D215E08
	Offset: 0x7E38
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function do_post_chunk_repair_delay(has_perk)
{
	if(!self util::script_delay())
	{
		wait(1);
	}
}

/*
	Name: handle_post_board_repair_rewards
	Namespace: zm_blockers
	Checksum: 0xBC008A53
	Offset: 0x7E70
	Size: 0x296
	Parameters: 2
	Flags: Linked
*/
function handle_post_board_repair_rewards(cost, zbarrier)
{
	self zm_stats::increment_client_stat("boards");
	self zm_stats::increment_player_stat("boards");
	self zm_stats::function_8f10788e("boas_boards");
	self thread zm_audio::create_and_play_dialog(#"general", #"rebuild_boards");
	if(!isdefined(self.rebuild_barrier_reward))
	{
		self.rebuild_barrier_reward = 0;
	}
	var_fe6ea5a4 = (isdefined(zombie_utility::function_d2dfacfd(#"rebuild_barrier_cap_per_round")) ? zombie_utility::function_d2dfacfd(#"rebuild_barrier_cap_per_round") : 0);
	self.rebuild_barrier_reward = self.rebuild_barrier_reward + zbarrier;
	if(self.var_d1463e1e === 0 && (self.rebuild_barrier_reward - zbarrier) <= var_fe6ea5a4 && self.rebuild_barrier_reward > var_fe6ea5a4)
	{
		self.var_d1463e1e = 1;
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"secure_barrier_round_limit_zm", #attacker:self});
		self zm_utility::play_sound_on_ent("purchase");
	}
	else if(self.rebuild_barrier_reward <= var_fe6ea5a4)
	{
		if(isdefined(self.var_7e008e0c) && self.var_7e008e0c > 0)
		{
			zbarrier = zbarrier * self.var_7e008e0c;
		}
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"boarded_up_entrance_zm", #attacker:self});
		self zm_utility::play_sound_on_ent("purchase");
	}
	if(isdefined(self.board_repair))
	{
		self.board_repair = self.board_repair + 1;
	}
}

/*
	Name: blocker_unitrigger_think
	Namespace: zm_blockers
	Checksum: 0x92295E59
	Offset: 0x8110
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function blocker_unitrigger_think()
{
	self endon(#"kill_trigger");
	while(true)
	{
		self.stub.trigger_target notify(#"trigger", self waittill(#"trigger"));
	}
}

/*
	Name: blocker_trigger_think
	Namespace: zm_blockers
	Checksum: 0x54E92F94
	Offset: 0x8170
	Size: 0xB06
	Parameters: 0
	Flags: Linked
*/
function blocker_trigger_think()
{
	self endon(#"blocker_hacked");
	if(is_true(level.no_board_repair))
	{
		return;
	}
	/#
		println("");
	#/
	level endon(#"stop_blocker_think");
	cost = 10;
	if(isdefined(self.zombie_cost))
	{
		cost = self.zombie_cost;
	}
	original_cost = cost;
	if(!isdefined(self.unitrigger_stub))
	{
		radius = 94.21;
		height = 94.21;
		if(isdefined(self.trigger_location))
		{
			trigger_location = self.trigger_location;
		}
		else
		{
			trigger_location = self;
		}
		if(isdefined(trigger_location.radius))
		{
			radius = trigger_location.radius;
		}
		if(isdefined(trigger_location.height))
		{
			height = trigger_location.height;
		}
		trigger_pos = zm_utility::groundpos(trigger_location.origin) + vectorscale((0, 0, 1), 4);
		self.unitrigger_stub = spawnstruct();
		self.unitrigger_stub.origin = trigger_pos;
		self.unitrigger_stub.radius = radius;
		self.unitrigger_stub.height = height;
		self.unitrigger_stub.script_unitrigger_type = "unitrigger_radius";
		self.unitrigger_stub.hint_string = zm_utility::get_hint_string(self, "default_reward_barrier_piece");
		self.unitrigger_stub.cursor_hint = "HINT_NOICON";
		self.unitrigger_stub.trigger_target = self;
		zm_unitrigger::unitrigger_force_per_player_triggers(self.unitrigger_stub, 1);
		self.unitrigger_stub.prompt_and_visibility_func = &blockertrigger_update_prompt;
		zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &blocker_unitrigger_think);
		zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
		if(!isdefined(trigger_location.angles))
		{
			trigger_location.angles = (0, 0, 0);
		}
		self.unitrigger_stub.origin = (zm_utility::groundpos(trigger_location.origin) + vectorscale((0, 0, 1), 4)) + (anglestoforward(trigger_location.angles) * -11);
	}
	self thread trigger_delete_on_repair();
	thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &blocker_unitrigger_think);
	/#
		if(getdvarint(#"zombie_debug", 0) > 0)
		{
			thread zm_utility::debug_blocker(trigger_pos, radius, height);
		}
	#/
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		if(is_true(level.var_aef7f7d5))
		{
			if(isdefined(self.unitrigger_stub) && !isdefined(self.unitrigger_stub.var_88312f4))
			{
				self.unitrigger_stub.var_88312f4 = self.unitrigger_stub.hint_string;
				self.unitrigger_stub.hint_string = (isdefined(level.var_b0612462) ? level.var_b0612462 : #"");
			}
			continue;
		}
		else if(isdefined(self.unitrigger_stub) && isdefined(self.unitrigger_stub.var_88312f4))
		{
			self.unitrigger_stub.hint_string = self.unitrigger_stub.var_88312f4;
			self.unitrigger_stub.var_88312f4 = undefined;
		}
		has_perk = player has_blocker_affecting_perk();
		if(zm_utility::all_chunks_intact(self, self.barrier_chunks))
		{
			self notify(#"all_boards_repaired");
			return;
		}
		if(zm_utility::no_valid_repairable_boards(self, self.barrier_chunks))
		{
			self notify(#"no valid boards");
			return;
		}
		if(isdefined(level._zm_blocker_trigger_think_return_override))
		{
			if(self [[level._zm_blocker_trigger_think_return_override]](player))
			{
				return;
			}
		}
		while(true)
		{
			players = getplayers();
			trigger = self.unitrigger_stub zm_unitrigger::unitrigger_trigger(player);
			if(player_fails_blocker_repair_trigger_preamble(player, players, trigger, 0))
			{
				break;
			}
			player notify(#"boarding_window", self);
			if(zm_utility::all_chunks_destroyed(self, self.barrier_chunks))
			{
				self callback::callback(#"hash_25e53b7f7249adb7");
			}
			if(isdefined(self.zbarrier))
			{
				chunk = zm_utility::get_random_destroyed_chunk(self, self.barrier_chunks);
				self thread replace_chunk(self, chunk, has_perk, 0, player);
			}
			else
			{
				chunk = zm_utility::get_random_destroyed_chunk(self, self.barrier_chunks);
				if(isdefined(chunk.script_parameter) && chunk.script_parameters == "repair_board" || chunk.script_parameters == "barricade_vents")
				{
					if(isdefined(chunk.unbroken_section))
					{
						chunk show();
						chunk solid();
						chunk.unbroken_section zm_utility::self_delete();
					}
				}
				else
				{
					chunk show();
				}
				if(!isdefined(chunk.script_parameters) || chunk.script_parameters == "board" || chunk.script_parameters == "repair_board" || chunk.script_parameters == "barricade_vents")
				{
					if(!is_true(level.use_clientside_board_fx))
					{
						if(!isdefined(chunk.material) || (isdefined(chunk.material) && chunk.material != "rock"))
						{
							chunk zm_utility::play_sound_on_ent("rebuild_barrier_piece");
						}
						playsoundatposition(#"zmb_cha_ching", (0, 0, 0));
					}
				}
				if(chunk.script_parameters == "bar")
				{
					chunk zm_utility::play_sound_on_ent("rebuild_barrier_piece");
					playsoundatposition(#"zmb_cha_ching", (0, 0, 0));
				}
				if(isdefined(chunk.script_parameters))
				{
					if(chunk.script_parameters == "bar")
					{
						if(isdefined(chunk.script_noteworthy))
						{
							if(chunk.script_noteworthy == "5")
							{
								chunk hide();
							}
							else if(chunk.script_noteworthy == "3")
							{
								chunk hide();
							}
						}
					}
				}
				self thread replace_chunk(self, chunk, has_perk, 0, player);
			}
			if(isdefined(self.clip))
			{
				self.clip triggerenable(1);
				self.clip disconnectpaths();
			}
			else
			{
				blocker_disconnect_paths(self.neg_start, self.neg_end);
			}
			self do_post_chunk_repair_delay(has_perk);
			if(!zm_utility::is_player_valid(player))
			{
				break;
			}
			player handle_post_board_repair_rewards(cost, self);
			level notify(#"board_repaired", {#s_board:self, #player:player});
			if(zm_utility::all_chunks_intact(self, self.barrier_chunks))
			{
				self notify(#"all_boards_repaired");
				player increment_window_repaired();
				return;
			}
			if(zm_utility::no_valid_repairable_boards(self, self.barrier_chunks))
			{
				self notify(#"no valid boards");
				player increment_window_repaired(self);
				return;
			}
		}
	}
}

/*
	Name: increment_window_repaired
	Namespace: zm_blockers
	Checksum: 0xD27304C1
	Offset: 0x8C80
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function increment_window_repaired(s_barrier)
{
	self zm_stats::increment_challenge_stat(#"survivalist_board");
	self zm_stats::function_8f10788e("boas_windowsBoarded");
	self incrementplayerstat("windowsBoarded", 1);
}

/*
	Name: blockertrigger_update_prompt
	Namespace: zm_blockers
	Checksum: 0xB4818781
	Offset: 0x8CF8
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function blockertrigger_update_prompt(player)
{
	can_use = self.stub blockerstub_update_prompt(player);
	self setinvisibletoplayer(player, !can_use);
	self sethintstring(self.stub.hint_string);
	return can_use;
}

/*
	Name: blockerstub_update_prompt
	Namespace: zm_blockers
	Checksum: 0xD4EE7646
	Offset: 0x8D78
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function blockerstub_update_prompt(player)
{
	if(!zm_utility::is_player_valid(player))
	{
		return false;
	}
	if(player zm_utility::in_revive_trigger())
	{
		return false;
	}
	if(player zm_utility::is_drinking())
	{
		return false;
	}
	return true;
}

/*
	Name: random_destroyed_chunk_show
	Namespace: zm_blockers
	Checksum: 0x3F21E235
	Offset: 0x8DE0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function random_destroyed_chunk_show()
{
	wait(0.5);
	self show();
}

/*
	Name: door_repaired_rumble_n_sound
	Namespace: zm_blockers
	Checksum: 0xB948C4F4
	Offset: 0x8E10
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function door_repaired_rumble_n_sound()
{
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		if(distance(players[i].origin, self.origin) < 150)
		{
			if(isalive(players[i]))
			{
				players[i] thread board_completion();
			}
		}
	}
}

/*
	Name: board_completion
	Namespace: zm_blockers
	Checksum: 0x75A088C
	Offset: 0x8EB8
	Size: 0x18
	Parameters: 0
	Flags: Linked
*/
function board_completion()
{
	self endon(#"disconnect");
}

/*
	Name: trigger_delete_on_repair
	Namespace: zm_blockers
	Checksum: 0xBA0FF0BE
	Offset: 0x8ED8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function trigger_delete_on_repair()
{
	while(true)
	{
		self waittill(#"all_boards_repaired", #"no valid boards");
		zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
		break;
	}
}

/*
	Name: rebuild_barrier_reward_reset
	Namespace: zm_blockers
	Checksum: 0xC4CAC550
	Offset: 0x8F38
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function rebuild_barrier_reward_reset()
{
	self.rebuild_barrier_reward = 0;
	self.var_d1463e1e = 0;
}

/*
	Name: remove_chunk
	Namespace: zm_blockers
	Checksum: 0x315EF8CB
	Offset: 0x8F60
	Size: 0xD98
	Parameters: 4
	Flags: Linked
*/
function remove_chunk(chunk, node, destroy_immediately, zomb)
{
	destroy_immediately update_states("mid_tear");
	if(isdefined(destroy_immediately.script_parameters))
	{
		if(destroy_immediately.script_parameters == "board" || destroy_immediately.script_parameters == "repair_board" || destroy_immediately.script_parameters == "barricade_vents")
		{
			destroy_immediately thread zombie_boardtear_audio_offset(destroy_immediately);
		}
	}
	if(isdefined(destroy_immediately.script_parameters))
	{
		if(destroy_immediately.script_parameters == "bar")
		{
			destroy_immediately thread zombie_bartear_audio_offset(destroy_immediately);
		}
	}
	destroy_immediately notsolid();
	fx = "wood_chunk_destory";
	if(isdefined(self.script_fxid))
	{
		fx = self.script_fxid;
	}
	if(isdefined(destroy_immediately.script_moveoverride) && destroy_immediately.script_moveoverride)
	{
		destroy_immediately hide();
	}
	if(isdefined(destroy_immediately.script_parameters) && destroy_immediately.script_parameters == "bar")
	{
		if(isdefined(destroy_immediately.script_noteworthy) && destroy_immediately.script_noteworthy == "4")
		{
			ent = spawn("script_origin", destroy_immediately.origin);
			ent.angles = zomb.angles + vectorscale((0, 1, 0), 180);
			dist = 100;
			if(isdefined(destroy_immediately.script_move_dist))
			{
				dist_max = destroy_immediately.script_move_dist - 100;
				dist = 100 + randomint(dist_max);
			}
			else
			{
				dist = 100 + randomint(100);
			}
			dest = ent.origin + (anglestoforward(ent.angles) * dist);
			trace = bullettrace(dest + vectorscale((0, 0, 1), 16), dest + (vectorscale((0, 0, -1), 200)), 0, undefined);
			if(trace[#"fraction"] == 1)
			{
				dest = dest + (vectorscale((0, 0, -1), 200));
			}
			else
			{
				dest = trace[#"position"];
			}
			destroy_immediately linkto(ent);
			time = ent zm_utility::fake_physicslaunch(dest, 300 + randomint(100));
			if(randomint(100) > 40)
			{
				ent rotatepitch(180, time * 0.5);
			}
			else
			{
				ent rotatepitch(90, time, time * 0.5);
			}
			wait(time);
			destroy_immediately hide();
			wait(0.1);
			ent delete();
		}
		else
		{
			ent = spawn("script_origin", destroy_immediately.origin);
			ent.angles = zomb.angles + vectorscale((0, 1, 0), 180);
			dist = 100;
			if(isdefined(destroy_immediately.script_move_dist))
			{
				dist_max = destroy_immediately.script_move_dist - 100;
				dist = 100 + randomint(dist_max);
			}
			else
			{
				dist = 100 + randomint(100);
			}
			dest = ent.origin + (anglestoforward(ent.angles) * dist);
			trace = bullettrace(dest + vectorscale((0, 0, 1), 16), dest + (vectorscale((0, 0, -1), 200)), 0, undefined);
			if(trace[#"fraction"] == 1)
			{
				dest = dest + (vectorscale((0, 0, -1), 200));
			}
			else
			{
				dest = trace[#"position"];
			}
			destroy_immediately linkto(ent);
			time = ent zm_utility::fake_physicslaunch(dest, 260 + randomint(100));
			if(randomint(100) > 40)
			{
				ent rotatepitch(180, time * 0.5);
			}
			else
			{
				ent rotatepitch(90, time, time * 0.5);
			}
			wait(time);
			destroy_immediately hide();
			wait(0.1);
			ent delete();
		}
		destroy_immediately update_states("destroyed");
		destroy_immediately notify(#"destroyed");
	}
	if(isdefined(destroy_immediately.script_parameters) && destroy_immediately.script_parameters == "board" || destroy_immediately.script_parameters == "repair_board" || destroy_immediately.script_parameters == "barricade_vents")
	{
		ent = spawn("script_origin", destroy_immediately.origin);
		ent.angles = zomb.angles + vectorscale((0, 1, 0), 180);
		dist = 100;
		if(isdefined(destroy_immediately.script_move_dist))
		{
			dist_max = destroy_immediately.script_move_dist - 100;
			dist = 100 + randomint(dist_max);
		}
		else
		{
			dist = 100 + randomint(100);
		}
		dest = ent.origin + (anglestoforward(ent.angles) * dist);
		trace = bullettrace(dest + vectorscale((0, 0, 1), 16), dest + (vectorscale((0, 0, -1), 200)), 0, undefined);
		if(trace[#"fraction"] == 1)
		{
			dest = dest + (vectorscale((0, 0, -1), 200));
		}
		else
		{
			dest = trace[#"position"];
		}
		destroy_immediately linkto(ent);
		time = ent zm_utility::fake_physicslaunch(dest, 200 + randomint(100));
		if(isdefined(destroy_immediately.unbroken_section))
		{
			if(!isdefined(destroy_immediately.material) || destroy_immediately.material != "metal")
			{
				destroy_immediately.unbroken_section zm_utility::self_delete();
			}
		}
		if(randomint(100) > 40)
		{
			ent rotatepitch(180, time * 0.5);
		}
		else
		{
			ent rotatepitch(90, time, time * 0.5);
		}
		wait(time);
		if(isdefined(destroy_immediately.unbroken_section))
		{
			if(isdefined(destroy_immediately.material) && destroy_immediately.material == "metal")
			{
				destroy_immediately.unbroken_section zm_utility::self_delete();
			}
		}
		destroy_immediately hide();
		wait(0.1);
		ent delete();
		destroy_immediately update_states("destroyed");
		destroy_immediately notify(#"destroyed");
	}
	if(isdefined(destroy_immediately.script_parameters) && destroy_immediately.script_parameters == "grate")
	{
		if(isdefined(destroy_immediately.script_noteworthy) && destroy_immediately.script_noteworthy == "6")
		{
			ent = spawn("script_origin", destroy_immediately.origin);
			ent.angles = zomb.angles + vectorscale((0, 1, 0), 180);
			dist = 100 + randomint(100);
			dest = ent.origin + (anglestoforward(ent.angles) * dist);
			trace = bullettrace(dest + vectorscale((0, 0, 1), 16), dest + (vectorscale((0, 0, -1), 200)), 0, undefined);
			if(trace[#"fraction"] == 1)
			{
				dest = dest + (vectorscale((0, 0, -1), 200));
			}
			else
			{
				dest = trace[#"position"];
			}
			destroy_immediately linkto(ent);
			time = ent zm_utility::fake_physicslaunch(dest, 200 + randomint(100));
			if(randomint(100) > 40)
			{
				ent rotatepitch(180, time * 0.5);
			}
			else
			{
				ent rotatepitch(90, time, time * 0.5);
			}
			wait(time);
			destroy_immediately hide();
			ent delete();
			destroy_immediately update_states("destroyed");
			destroy_immediately notify(#"destroyed");
		}
		else
		{
			destroy_immediately hide();
			destroy_immediately update_states("destroyed");
			destroy_immediately notify(#"destroyed");
		}
	}
}

/*
	Name: remove_chunk_rotate_grate
	Namespace: zm_blockers
	Checksum: 0x42696817
	Offset: 0x9D00
	Size: 0x76
	Parameters: 1
	Flags: None
*/
function remove_chunk_rotate_grate(chunk)
{
	if(isdefined(chunk.script_parameters) && chunk.script_parameters == "grate")
	{
		chunk vibrate(vectorscale((0, 1, 0), 270), 0.2, 0.4, 0.4);
		return;
	}
}

/*
	Name: zombie_boardtear_audio_offset
	Namespace: zm_blockers
	Checksum: 0xDB63C796
	Offset: 0x9D80
	Size: 0x342
	Parameters: 1
	Flags: Linked
*/
function zombie_boardtear_audio_offset(chunk)
{
	if(isdefined(chunk.material) && !isdefined(chunk.already_broken))
	{
		chunk.already_broken = 0;
	}
	if(isdefined(chunk.material) && chunk.material == "glass" && chunk.already_broken == 0)
	{
		chunk playsound(#"zmb_break_glass_barrier");
		wait(randomfloatrange(0.3, 0.6));
		chunk playsound(#"zmb_break_glass_barrier");
		chunk.already_broken = 1;
	}
	else
	{
		if(isdefined(chunk.material) && chunk.material == "metal" && chunk.already_broken == 0)
		{
			chunk playsound(#"grab_metal_bar");
			wait(randomfloatrange(0.3, 0.6));
			chunk playsound(#"break_metal_bar");
			chunk.already_broken = 1;
		}
		else
		{
			if(isdefined(chunk.material) && chunk.material == "rock")
			{
				if(!is_true(level.use_clientside_rock_tearin_fx))
				{
					chunk playsound(#"zmb_break_rock_barrier");
					wait(randomfloatrange(0.3, 0.6));
					chunk playsound(#"zmb_break_rock_barrier");
				}
				chunk.already_broken = 1;
			}
			else
			{
				if(isdefined(chunk.material) && chunk.material == "metal_vent")
				{
					if(!is_true(level.use_clientside_board_fx))
					{
						chunk playsound(#"evt_vent_slat_remove");
					}
				}
				else
				{
					if(!is_true(level.use_clientside_board_fx))
					{
						chunk zm_utility::play_sound_on_ent("break_barrier_piece");
						wait(randomfloatrange(0.3, 0.6));
						chunk zm_utility::play_sound_on_ent("break_barrier_piece");
					}
					chunk.already_broken = 1;
				}
			}
		}
	}
}

/*
	Name: zombie_bartear_audio_offset
	Namespace: zm_blockers
	Checksum: 0x6D534C55
	Offset: 0xA0D0
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function zombie_bartear_audio_offset(chunk)
{
	chunk zm_utility::play_sound_on_ent("grab_metal_bar");
	wait(randomfloatrange(0.3, 0.6));
	chunk zm_utility::play_sound_on_ent("break_metal_bar");
	wait(randomfloatrange(1, 1.3));
	chunk zm_utility::play_sound_on_ent("drop_metal_bar");
}

/*
	Name: ensure_chunk_is_back_to_origin
	Namespace: zm_blockers
	Checksum: 0x809A26F
	Offset: 0xA188
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function ensure_chunk_is_back_to_origin(chunk)
{
	if(chunk.origin != chunk.og_origin)
	{
		chunk notsolid();
		chunk waittill(#"movedone");
	}
}

/*
	Name: replace_chunk
	Namespace: zm_blockers
	Checksum: 0xC3D6E83D
	Offset: 0xA1E8
	Size: 0x224
	Parameters: 5
	Flags: Linked
*/
function replace_chunk(barrier, chunk, has_perk, via_powerup, player)
{
	if(!isdefined(via_powerup))
	{
		via_powerup = 0;
	}
	if(!isdefined(barrier.zbarrier))
	{
		chunk update_states("mid_repair");
		/#
			assert(isdefined(chunk.og_origin));
		#/
		/#
			assert(isdefined(chunk.og_angles));
		#/
		sound = "rebuild_barrier_hover";
		if(isdefined(chunk.script_presound))
		{
			sound = chunk.script_presound;
		}
	}
	if(!isdefined(via_powerup) && isdefined(sound))
	{
		zm_utility::play_sound_at_pos(sound, chunk.origin);
	}
	barrier.zbarrier zbarrierpieceusedefaultmodel(chunk);
	barrier.zbarrier.chunk_health[chunk] = 0;
	scalar = 1;
	if(has_perk === #"hash_5930cf0eb070e35a")
	{
		scalar = 0.31;
	}
	barrier.zbarrier showzbarrierpiece(chunk);
	barrier.zbarrier setzbarrierpiecestate(chunk, "closing", scalar);
	waitduration = barrier.zbarrier getzbarrierpieceanimlengthforstate(chunk, "closing", scalar);
	wait(waitduration);
	if(isplayer(player))
	{
		player playrumbleonentity(#"zm_interact_rumble");
	}
}

/*
	Name: open_zbarrier
	Namespace: zm_blockers
	Checksum: 0x3BB57D8D
	Offset: 0xA418
	Size: 0x17C
	Parameters: 2
	Flags: Linked
*/
function open_zbarrier(barrier, var_56646e12)
{
	if(!isdefined(var_56646e12))
	{
		var_56646e12 = 0;
	}
	if(isdefined(barrier.zbarrier))
	{
		for(x = 0; x < barrier.zbarrier getnumzbarrierpieces(); x++)
		{
			if(barrier.zbarrier getzbarrierpiecestate(x) == "closed" || barrier.zbarrier getzbarrierpiecestate(x) == "closing")
			{
				if(var_56646e12)
				{
					barrier.zbarrier setzbarrierpiecestate(x, "open");
					continue;
				}
				barrier.zbarrier setzbarrierpiecestate(x, "opening");
			}
		}
	}
	if(isdefined(barrier.clip))
	{
		barrier.clip triggerenable(0);
		barrier.clip connectpaths();
	}
	else
	{
		blocker_connect_paths(barrier.neg_start, barrier.neg_end);
	}
}

/*
	Name: open_all_zbarriers
	Namespace: zm_blockers
	Checksum: 0x69C595A7
	Offset: 0xA5A0
	Size: 0x88
	Parameters: 0
	Flags: None
*/
function open_all_zbarriers()
{
	foreach(barrier in level.exterior_goals)
	{
		open_zbarrier(barrier);
	}
}

/*
	Name: function_6f01c3cf
	Namespace: zm_blockers
	Checksum: 0x68115596
	Offset: 0xA630
	Size: 0x344
	Parameters: 3
	Flags: None
*/
function function_6f01c3cf(str_value, str_key, b_hidden)
{
	if(!isdefined(b_hidden))
	{
		b_hidden = 0;
	}
	a_s_barriers = [];
	foreach(s_barrier in level.exterior_goals)
	{
		if(s_barrier.(str_key) === str_value && s_barrier.targetname === "exterior_goal")
		{
			if(!isdefined(a_s_barriers))
			{
				a_s_barriers = [];
			}
			else if(!isarray(a_s_barriers))
			{
				a_s_barriers = array(a_s_barriers);
			}
			a_s_barriers[a_s_barriers.size] = s_barrier;
		}
	}
	for(i = 0; i < a_s_barriers.size; i++)
	{
		barrier = a_s_barriers[i];
		if(isdefined(barrier.zbarrier))
		{
			a_pieces = barrier.zbarrier getzbarrierpieceindicesinstate("closed");
			if(isdefined(a_pieces))
			{
				for(xx = 0; xx < a_pieces.size; xx++)
				{
					chunk = a_pieces[xx];
					barrier.zbarrier zbarrierpieceusedefaultmodel(chunk);
					barrier.zbarrier.chunk_health[chunk] = 0;
				}
			}
			for(x = 0; x < barrier.zbarrier getnumzbarrierpieces(); x++)
			{
				barrier.zbarrier setzbarrierpiecestate(x, "open");
				if(b_hidden)
				{
					barrier.zbarrier hidezbarrierpiece(x);
					continue;
				}
				barrier.zbarrier showzbarrierpiece(x);
			}
		}
		if(isdefined(barrier.clip))
		{
			barrier.clip triggerenable(0);
			barrier.clip connectpaths();
		}
		else
		{
			blocker_connect_paths(barrier.neg_start, barrier.neg_end);
		}
		if((i % 4) == 0)
		{
			util::wait_network_frame();
		}
	}
}

/*
	Name: zombie_boardtear_audio_plus_fx_offset_repair_horizontal
	Namespace: zm_blockers
	Checksum: 0xE7713346
	Offset: 0xA980
	Size: 0x1F4
	Parameters: 1
	Flags: None
*/
function zombie_boardtear_audio_plus_fx_offset_repair_horizontal(chunk)
{
	if(isdefined(chunk.material) && chunk.material == "rock")
	{
		if(is_true(level.use_clientside_rock_tearin_fx))
		{
			chunk clientfield::set("tearin_rock_fx", 0);
		}
		else
		{
			earthquake(randomfloatrange(0.3, 0.4), randomfloatrange(0.2, 0.4), chunk.origin, 150);
			wait(randomfloatrange(0.3, 0.6));
			chunk zm_utility::play_sound_on_ent("break_barrier_piece");
		}
	}
	else
	{
		if(is_true(level.use_clientside_board_fx))
		{
			chunk clientfield::set("tearin_board_vertical_fx", 0);
		}
		else
		{
			earthquake(randomfloatrange(0.3, 0.4), randomfloatrange(0.2, 0.4), chunk.origin, 150);
			wait(randomfloatrange(0.3, 0.6));
			chunk zm_utility::play_sound_on_ent("break_barrier_piece");
		}
	}
}

/*
	Name: zombie_boardtear_audio_plus_fx_offset_repair_verticle
	Namespace: zm_blockers
	Checksum: 0x765F854B
	Offset: 0xAB80
	Size: 0x1F4
	Parameters: 1
	Flags: None
*/
function zombie_boardtear_audio_plus_fx_offset_repair_verticle(chunk)
{
	if(isdefined(chunk.material) && chunk.material == "rock")
	{
		if(is_true(level.use_clientside_rock_tearin_fx))
		{
			chunk clientfield::set("tearin_rock_fx", 0);
		}
		else
		{
			earthquake(randomfloatrange(0.3, 0.4), randomfloatrange(0.2, 0.4), chunk.origin, 150);
			wait(randomfloatrange(0.3, 0.6));
			chunk zm_utility::play_sound_on_ent("break_barrier_piece");
		}
	}
	else
	{
		if(is_true(level.use_clientside_board_fx))
		{
			chunk clientfield::set("tearin_board_horizontal_fx", 0);
		}
		else
		{
			earthquake(randomfloatrange(0.3, 0.4), randomfloatrange(0.2, 0.4), chunk.origin, 150);
			wait(randomfloatrange(0.3, 0.6));
			chunk zm_utility::play_sound_on_ent("break_barrier_piece");
		}
	}
}

/*
	Name: zombie_gratetear_audio_plus_fx_offset_repair_horizontal
	Namespace: zm_blockers
	Checksum: 0x40A00B05
	Offset: 0xAD80
	Size: 0x5AA
	Parameters: 1
	Flags: None
*/
function zombie_gratetear_audio_plus_fx_offset_repair_horizontal(chunk)
{
	earthquake(randomfloatrange(0.3, 0.4), randomfloatrange(0.2, 0.4), chunk.origin, 150);
	chunk zm_utility::play_sound_on_ent("bar_rebuild_slam");
	switch(randomint(9))
	{
		case 0:
		{
			playfx(level._effect[#"fx_zombie_bar_break"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			wait(randomfloatrange(0, 0.3));
			playfx(level._effect[#"fx_zombie_bar_break_lite"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			break;
		}
		case 1:
		{
			playfx(level._effect[#"fx_zombie_bar_break"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			wait(randomfloatrange(0, 0.3));
			playfx(level._effect[#"fx_zombie_bar_break"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			break;
		}
		case 2:
		{
			playfx(level._effect[#"fx_zombie_bar_break_lite"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			wait(randomfloatrange(0, 0.3));
			playfx(level._effect[#"fx_zombie_bar_break"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			break;
		}
		case 3:
		{
			playfx(level._effect[#"fx_zombie_bar_break"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			wait(randomfloatrange(0, 0.3));
			playfx(level._effect[#"fx_zombie_bar_break_lite"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			break;
		}
		case 4:
		{
			playfx(level._effect[#"fx_zombie_bar_break_lite"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			wait(randomfloatrange(0, 0.3));
			playfx(level._effect[#"fx_zombie_bar_break_lite"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			break;
		}
		case 5:
		{
			playfx(level._effect[#"fx_zombie_bar_break_lite"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			break;
		}
		case 6:
		{
			playfx(level._effect[#"fx_zombie_bar_break_lite"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			break;
		}
		case 7:
		{
			playfx(level._effect[#"fx_zombie_bar_break"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			break;
		}
		case 8:
		{
			playfx(level._effect[#"fx_zombie_bar_break"], chunk.origin + (vectorscale((-1, 0, 0), 30)));
			break;
		}
	}
}

/*
	Name: zombie_bartear_audio_plus_fx_offset_repair_horizontal
	Namespace: zm_blockers
	Checksum: 0xDB709DAD
	Offset: 0xB338
	Size: 0x4F2
	Parameters: 1
	Flags: None
*/
function zombie_bartear_audio_plus_fx_offset_repair_horizontal(chunk)
{
	earthquake(randomfloatrange(0.3, 0.4), randomfloatrange(0.2, 0.4), chunk.origin, 150);
	chunk zm_utility::play_sound_on_ent("bar_rebuild_slam");
	switch(randomint(9))
	{
		case 0:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_left");
			wait(randomfloatrange(0, 0.3));
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_right");
			break;
		}
		case 1:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_left");
			wait(randomfloatrange(0, 0.3));
			playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_right");
			break;
		}
		case 2:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_left");
			wait(randomfloatrange(0, 0.3));
			playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_right");
			break;
		}
		case 3:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_left");
			wait(randomfloatrange(0, 0.3));
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_right");
			break;
		}
		case 4:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_left");
			wait(randomfloatrange(0, 0.3));
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_right");
			break;
		}
		case 5:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_left");
			break;
		}
		case 6:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_right");
			break;
		}
		case 7:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_left");
			break;
		}
		case 8:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_right");
			break;
		}
	}
}

/*
	Name: zombie_bartear_audio_plus_fx_offset_repair_verticle
	Namespace: zm_blockers
	Checksum: 0x27C619A2
	Offset: 0xB838
	Size: 0x4F2
	Parameters: 1
	Flags: None
*/
function zombie_bartear_audio_plus_fx_offset_repair_verticle(chunk)
{
	earthquake(randomfloatrange(0.3, 0.4), randomfloatrange(0.2, 0.4), chunk.origin, 150);
	chunk zm_utility::play_sound_on_ent("bar_rebuild_slam");
	switch(randomint(9))
	{
		case 0:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_top");
			wait(randomfloatrange(0, 0.3));
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_bottom");
			break;
		}
		case 1:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_top");
			wait(randomfloatrange(0, 0.3));
			playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_bottom");
			break;
		}
		case 2:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_top");
			wait(randomfloatrange(0, 0.3));
			playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_bottom");
			break;
		}
		case 3:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_top");
			wait(randomfloatrange(0, 0.3));
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_bottom");
			break;
		}
		case 4:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_top");
			wait(randomfloatrange(0, 0.3));
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_bottom");
			break;
		}
		case 5:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_top");
			break;
		}
		case 6:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_bottom");
			break;
		}
		case 7:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_top");
			break;
		}
		case 8:
		{
			playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_bottom");
			break;
		}
	}
}

/*
	Name: flag_blocker
	Namespace: zm_blockers
	Checksum: 0x11E8A8CE
	Offset: 0xBD38
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function flag_blocker()
{
	if(!isdefined(self.script_flag_wait))
	{
		/#
			assertmsg(("" + self.origin) + "");
		#/
		return;
	}
	if(!isdefined(level.flag[self.script_flag_wait]))
	{
		level flag::init(self.script_flag_wait);
	}
	type = "connectpaths";
	if(isdefined(self.script_noteworthy))
	{
		type = self.script_noteworthy;
	}
	level flag::wait_till(self.script_flag_wait);
	self util::script_delay();
	if(type == "connectpaths")
	{
		self connectpaths();
		self triggerenable(0);
		return;
	}
	if(type == "disconnectpaths")
	{
		self disconnectpaths();
		self triggerenable(0);
		return;
	}
	/#
		assertmsg(((("" + self.origin) + "") + type) + "");
	#/
}

/*
	Name: update_states
	Namespace: zm_blockers
	Checksum: 0x935262DE
	Offset: 0xBEE0
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function update_states(states)
{
	/#
		assert(isdefined(states));
	#/
	self.state = states;
}

/*
	Name: quantum_bomb_open_nearest_door_validation
	Namespace: zm_blockers
	Checksum: 0x1481F906
	Offset: 0xBF20
	Size: 0x172
	Parameters: 1
	Flags: Linked
*/
function quantum_bomb_open_nearest_door_validation(position)
{
	range_squared = 32400;
	zombie_doors = getentarray("zombie_door", "targetname");
	for(i = 0; i < zombie_doors.size; i++)
	{
		if(distancesquared(zombie_doors[i].origin, position) < range_squared)
		{
			return true;
		}
	}
	zombie_airlock_doors = getentarray("zombie_airlock_buy", "targetname");
	for(i = 0; i < zombie_airlock_doors.size; i++)
	{
		if(distancesquared(zombie_airlock_doors[i].origin, position) < range_squared)
		{
			return true;
		}
	}
	zombie_debris = getentarray("zombie_debris", "targetname");
	for(i = 0; i < zombie_debris.size; i++)
	{
		if(distancesquared(zombie_debris[i].origin, position) < range_squared)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: quantum_bomb_open_nearest_door_result
	Namespace: zm_blockers
	Checksum: 0x76D3211D
	Offset: 0xC0A0
	Size: 0x1EA
	Parameters: 1
	Flags: Linked
*/
function quantum_bomb_open_nearest_door_result(position)
{
	range_squared = 32400;
	zombie_doors = getentarray("zombie_door", "targetname");
	for(i = 0; i < zombie_doors.size; i++)
	{
		if(distancesquared(zombie_doors[i].origin, position) < range_squared)
		{
			zombie_doors[i] force_open_door(self);
			[[level.quantum_bomb_play_area_effect_func]](position);
			return;
		}
	}
	zombie_airlock_doors = getentarray("zombie_airlock_buy", "targetname");
	for(i = 0; i < zombie_airlock_doors.size; i++)
	{
		if(distancesquared(zombie_airlock_doors[i].origin, position) < range_squared)
		{
			zombie_airlock_doors[i] force_open_door(self);
			[[level.quantum_bomb_play_area_effect_func]](position);
			return;
		}
	}
	zombie_debris = getentarray("zombie_debris", "targetname");
	for(i = 0; i < zombie_debris.size; i++)
	{
		if(distancesquared(zombie_debris[i].origin, position) < range_squared)
		{
			zombie_debris[i] force_open_door(self);
			[[level.quantum_bomb_play_area_effect_func]](position);
			return;
		}
	}
}

/*
	Name: function_dafd2e5a
	Namespace: zm_blockers
	Checksum: 0x892CC843
	Offset: 0xC298
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_dafd2e5a()
{
	level flag::wait_till("start_zombie_round_logic");
	if(isdefined(level.var_ddcd74c6))
	{
		thread [[level.var_ddcd74c6]](self);
	}
	else
	{
		if(isdefined(level.var_d5bd7049))
		{
			self sethintstring(level.var_d5bd7049);
		}
		else
		{
			self sethintstring(#"hash_71158766520dc432");
		}
	}
}

/*
	Name: function_807c87e7
	Namespace: zm_blockers
	Checksum: 0xF336E9C8
	Offset: 0xC348
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function function_807c87e7()
{
	if(self.script_noteworthy === "clip" || self.script_string === "clip" || self.script_noteworthy === "model_clip")
	{
		return true;
	}
	return false;
}

/*
	Name: function_53117870
	Namespace: zm_blockers
	Checksum: 0x49D8B6DB
	Offset: 0xC3A0
	Size: 0x2EE
	Parameters: 0
	Flags: Linked
*/
function function_53117870()
{
	if(isdefined(self.doors) && self.doors.size == 1)
	{
		return [0:self.doors[0]];
	}
	var_a0878328 = [];
	foreach(door in self.doors)
	{
		if(is_true(door.var_5d16ec51))
		{
			ent = door;
			if(isdefined(door.target))
			{
				var_da3e7018 = struct::get(door.target, "targetname");
				if(var_da3e7018.script_noteworthy === "ping_objective_ent")
				{
					ent = var_da3e7018.origin;
				}
			}
			array::add(var_a0878328, ent, 0);
		}
	}
	if(var_a0878328.size > 0)
	{
		return var_a0878328;
	}
	foreach(door in self.doors)
	{
		if(door.classname === "script_model" && isdefined(door.script_noteworthy) && door.script_noteworthy === "model_clip")
		{
			return [0:door];
		}
	}
	foreach(door in self.doors)
	{
		if(door.classname === "script_model" && !isdefined(door.script_noteworthy))
		{
			return [0:door];
		}
	}
	/#
		println("" + self.script_flag);
	#/
	return undefined;
}

