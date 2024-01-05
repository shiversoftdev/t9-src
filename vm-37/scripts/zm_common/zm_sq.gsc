#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using script_113dd7f0ea2a1d4f;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace zm_sq;

/*
	Name: init
	Namespace: zm_sq
	Checksum: 0x72FFAFB6
	Offset: 0x160
	Size: 0x84
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec init()
{
	/#
		if(getdvarint(#"hash_7919e37cd5d57659", 0))
		{
			adddebugcommand("");
		}
	#/
	callback::on_disconnect(&on_player_disconnect);
	callback::on_connect(&on_player_connect);
}

/*
	Name: on_player_disconnect
	Namespace: zm_sq
	Checksum: 0x12C6CBAF
	Offset: 0x1F0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function on_player_disconnect()
{
	/#
		if(getdvarint(#"zm_debug_ee", 0))
		{
			self thread function_fa5a5bfd();
		}
	#/
}

/*
	Name: on_player_connect
	Namespace: zm_sq
	Checksum: 0xA1B68E7C
	Offset: 0x240
	Size: 0x1FC
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self endon(#"disconnect");
	self.var_4fcae9dc = [];
	self.var_e453e8a5 = [];
	waittillframeend();
	if(is_true(self.is_hotjoining))
	{
		foreach(other_player in function_a1ef346b())
		{
			if(other_player == self || !isdefined(level.var_31028c5d))
			{
				continue;
			}
			if(isarray(other_player.var_4fcae9dc) && other_player.var_4fcae9dc.size > 0)
			{
				self.var_4fcae9dc = arraycopy(other_player.var_4fcae9dc);
				a_keys = getarraykeys(self.var_4fcae9dc);
				var_ff6498a7 = a_keys[a_keys.size - 1];
				str_objective_text = self.var_4fcae9dc[var_ff6498a7];
				level.var_31028c5d prototype_hud::set_active_objective_string(self, str_objective_text);
				level.var_31028c5d prototype_hud::set_active_obj_visibility(self, 2);
				level.var_31028c5d prototype_hud::set_active_obj_progress_visibility(self, 0);
				break;
			}
		}
	}
}

/*
	Name: register
	Namespace: zm_sq
	Checksum: 0xA1DBDF24
	Offset: 0x448
	Size: 0x694
	Parameters: 10
	Flags: None
*/
function register(name, step_name, var_e788cdd7, setup_func, cleanup_func, var_d6ca4caf, var_27465eb4, var_6cc77d4e, a_targets, str_objective_text)
{
	/#
		/#
			assert(ishash(name), "");
		#/
		/#
			assert(ishash(step_name), "");
		#/
		/#
			assert(ishash(var_e788cdd7), "");
		#/
		if(!isdefined(name))
		{
			if(getdvarint(#"hash_7919e37cd5d57659", 0))
			{
				iprintlnbold("");
				println("");
			}
			return;
		}
		if(!isdefined(step_name))
		{
			if(getdvarint(#"hash_7919e37cd5d57659", 0))
			{
				iprintlnbold("");
				println("");
			}
			return;
		}
		if(!isdefined(setup_func))
		{
			if(getdvarint(#"hash_7919e37cd5d57659", 0))
			{
				iprintlnbold("");
				println("");
			}
			return;
		}
		if(!isdefined(cleanup_func))
		{
			if(getdvarint(#"hash_7919e37cd5d57659", 0))
			{
				iprintlnbold("");
				println("");
			}
			return;
		}
		if(isdefined(self._ee) && isdefined(self._ee[name]) && isdefined(var_d6ca4caf) && isdefined(self._ee[name].record_stat))
		{
			if(getdvarint(#"hash_7919e37cd5d57659", 0))
			{
				iprintlnbold("");
				println("");
			}
			return;
		}
	#/
	if(!isdefined(self._ee))
	{
		self._ee = [];
	}
	if(!isdefined(self._ee[name]))
	{
		self._ee[name] = {#skip_to_step:-1, #owner:self, #started:0, #current_step:0, #steps:[], #completed:0, #name:name};
		/#
			if(getdvarint(#"zm_debug_ee", 0))
			{
				thread function_28aee167(name);
			}
		#/
	}
	ee = self._ee[name];
	if(!isdefined(ee.record_stat))
	{
		ee.record_stat = var_d6ca4caf;
	}
	if(!isdefined(ee.var_35ccab99))
	{
		ee.var_35ccab99 = var_27465eb4;
	}
	new_step = {#str_objective_text:str_objective_text, #a_targets:a_targets, #hash_6cc77d4e:var_6cc77d4e, #cleaned_up:0, #completed:0, #started:0, #cleanup_func:cleanup_func, #setup_func:setup_func, #hash_e788cdd7:var_e788cdd7, #ee:ee, #name:step_name};
	previous_step = ee.steps[self._ee[name].steps.size - 1];
	if(isdefined(previous_step))
	{
		previous_step.next_step = new_step;
	}
	if(!isdefined(ee.steps))
	{
		ee.steps = [];
	}
	else if(!isarray(ee.steps))
	{
		ee.steps = array(ee.steps);
	}
	ee.steps[ee.steps.size] = new_step;
	self flag::init(var_e788cdd7 + "_completed");
	if(!self flag::exists(ee.name + "_completed"))
	{
		self flag::init(ee.name + "_completed");
	}
	/#
		if(getdvarint(#"zm_debug_ee", 0))
		{
			thread function_b3da1a16(ee.name, new_step.name);
			thread devgui_think();
		}
	#/
}

/*
	Name: start
	Namespace: zm_sq
	Checksum: 0xE9654901
	Offset: 0xAE8
	Size: 0x244
	Parameters: 2
	Flags: None
*/
function start(name, var_9d8cf7f)
{
	if(!isdefined(var_9d8cf7f))
	{
		var_9d8cf7f = 0;
	}
	if(!zm_utility::is_ee_enabled() && !var_9d8cf7f)
	{
		return;
	}
	/#
		assert(ishash(name), "");
	#/
	/#
		/#
			assert(isdefined(self._ee[name]), ("" + function_9e72a96(name)) + "");
		#/
	#/
	if(self._ee[name].started)
	{
		/#
			if(getdvarint(#"hash_7919e37cd5d57659", 0))
			{
				iprintlnbold(("" + function_9e72a96(name)) + "");
				println(("" + function_9e72a96(name)) + "");
			}
		#/
		return;
	}
	ee = self._ee[name];
	var_5ea5c94d = 0;
	/#
		if(ee.skip_to_step > -1)
		{
			/#
				assert(0 <= ee.skip_to_step, "");
			#/
			if(0 < ee.skip_to_step)
			{
				var_5ea5c94d = 1;
			}
			else if(0 == ee.skip_to_step)
			{
				ee.skip_to_step = -1;
			}
		}
	#/
	self thread run_step(ee, ee.steps[0], var_5ea5c94d);
}

/*
	Name: is_complete
	Namespace: zm_sq
	Checksum: 0x8789941F
	Offset: 0xD38
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function is_complete(name)
{
	/#
		assert(ishash(name), "");
	#/
	/#
		/#
			assert(isdefined(self._ee[name]), ("" + function_9e72a96(name)) + "");
		#/
	#/
	return self._ee[name].completed;
}

/*
	Name: function_9212ff4d
	Namespace: zm_sq
	Checksum: 0xD917BA61
	Offset: 0xDE0
	Size: 0x142
	Parameters: 2
	Flags: None
*/
function function_9212ff4d(ee_name, step_name)
{
	/#
		assert(ishash(ee_name), "");
	#/
	/#
		assert(ishash(step_name), "");
	#/
	/#
		assert(isdefined(self._ee[ee_name]), ("" + ee_name) + "");
	#/
	foreach(ee_index, ee_step in self._ee[ee_name].steps)
	{
		if(step_name == ee_step.name)
		{
			return ee_index;
		}
	}
	return -1;
}

/*
	Name: run_step
	Namespace: zm_sq
	Checksum: 0x164670EC
	Offset: 0xF30
	Size: 0x934
	Parameters: 3
	Flags: Linked, Private
*/
function private run_step(ee, step, var_5ea5c94d)
{
	var_4ef8d79b = isentity(self);
	if(var_4ef8d79b)
	{
		self endon(#"death");
		self endon(#"disconnect");
	}
	self endon(#"game_ended");
	/#
		if(getdvarint(#"hash_7919e37cd5d57659", 0))
		{
			iprintlnbold((function_9e72a96(ee.name) + "") + function_9e72a96(step.name) + "");
			println((function_9e72a96(ee.name) + "") + function_9e72a96(step.name) + "");
		}
	#/
	ee.started = 1;
	step.started = 1;
	self thread function_3f795dc3(ee, step, var_5ea5c94d);
	if(!step.completed)
	{
		waitresult = undefined;
		waitresult = self waittill(step.var_e788cdd7 + "_setup_completed", step.var_e788cdd7 + "_ended_early");
	}
	/#
		if(getdvarint(#"hash_7919e37cd5d57659", 0))
		{
			iprintlnbold((function_9e72a96(ee.name) + "") + function_9e72a96(step.name) + "");
			println((function_9e72a96(ee.name) + "") + function_9e72a96(step.name) + "");
		}
	#/
	if(game.state === #"postgame")
	{
		return;
	}
	ended_early = isdefined(waitresult) && waitresult._notify == (step.var_e788cdd7 + "_ended_early");
	[[step.cleanup_func]](var_5ea5c94d, ended_early);
	/#
		if(getdvarint(#"hash_7919e37cd5d57659", 0))
		{
			iprintlnbold((function_9e72a96(ee.name) + "") + function_9e72a96(step.name) + "");
			println((function_9e72a96(ee.name) + "") + function_9e72a96(step.name) + "");
		}
	#/
	step.cleaned_up = 1;
	if(game.state === #"postgame")
	{
		return;
	}
	self flag::set(step.var_e788cdd7 + "_completed");
	if(ee.current_step === 0 && is_true(ee.record_stat))
	{
		if(var_4ef8d79b)
		{
			self.var_897fa11b = 1;
		}
		else
		{
			players = getplayers();
			foreach(player in players)
			{
				player.var_897fa11b = 1;
			}
		}
	}
	if(isdefined(step.next_step))
	{
		var_5ea5c94d = 0;
		/#
			if(ee.skip_to_step > -1)
			{
				var_7f1ec3f3 = ee.current_step + 1;
				/#
					assert(var_7f1ec3f3 <= ee.skip_to_step, "");
				#/
				if(var_7f1ec3f3 < ee.skip_to_step)
				{
					var_5ea5c94d = 1;
				}
				else if(var_7f1ec3f3 == ee.skip_to_step)
				{
					ee.skip_to_step = -1;
				}
				wait(0.5);
			}
		#/
		ee.current_step++;
		self thread run_step(ee, step.next_step, var_5ea5c94d);
	}
	else
	{
		ee.completed = 1;
		self flag::set(ee.name + "_completed");
		if(sessionmodeisonlinegame() && is_true(ee.record_stat))
		{
			players = [];
			if(var_4ef8d79b)
			{
				players[0] = self;
			}
			else
			{
				players = getplayers();
			}
			foreach(player in players)
			{
				if(is_true(player.var_897fa11b))
				{
					player zm_stats::set_map_stat(#"main_quest_completed", 1);
					player zm_stats::function_a6efb963(#"main_quest_completed", 1);
					player zm_stats::function_9288c79b(#"main_quest_completed", 1);
					n_time_elapsed = gettime() - level.var_21e22beb;
					player zm_stats::function_366b6fb9("FASTEST_QUEST_COMPLETION_TIME", n_time_elapsed);
					player zm_stats::function_5addf1fc("FASTEST_QUEST_COMPLETION_TIME", n_time_elapsed);
					scoreevents::processscoreevent(#"main_ee", player);
					if(isdefined(ee.var_35ccab99))
					{
						player thread [[ee.var_35ccab99]]();
					}
				}
			}
			zm_stats::set_match_stat(#"main_quest_completed", 1);
			if(isdefined(level.var_3034d7b8))
			{
				[[level.var_3034d7b8]]();
			}
			zm_stats::function_ea5b4947();
		}
		/#
			if(getdvarint(#"hash_7919e37cd5d57659", 0))
			{
				iprintlnbold(("" + function_9e72a96(ee.name)) + "");
				println(("" + function_9e72a96(ee.name)) + "");
			}
		#/
	}
}

/*
	Name: function_3f795dc3
	Namespace: zm_sq
	Checksum: 0x7C567755
	Offset: 0x1870
	Size: 0x154
	Parameters: 3
	Flags: Linked, Private
*/
function private function_3f795dc3(ee, step, var_5ea5c94d)
{
	if(isentity(self))
	{
		self endon(#"death");
		self endon(#"disconnect");
	}
	self endon(#"game_ended");
	step endoncallback(&function_df365859, #"end_early");
	self notify(step.var_e788cdd7 + "_started");
	if(isdefined(step.var_6cc77d4e))
	{
		level objective_set(step.var_6cc77d4e, step.a_targets, undefined, step.str_objective_text);
	}
	[[step.setup_func]](var_5ea5c94d);
	step.completed = 1;
	if(isdefined(step.var_6cc77d4e))
	{
		level objective_complete(step.var_6cc77d4e, step.a_targets);
	}
	self notify(step.var_e788cdd7 + "_setup_completed");
}

/*
	Name: function_df365859
	Namespace: zm_sq
	Checksum: 0xB7DE97A
	Offset: 0x19D0
	Size: 0x174
	Parameters: 1
	Flags: Linked, Private
*/
function private function_df365859(notifyhash)
{
	/#
		if(getdvarint(#"hash_7919e37cd5d57659", 0))
		{
			iprintlnbold((function_9e72a96(self.ee.name) + "") + function_9e72a96(self.name) + "");
			println((function_9e72a96(self.ee.name) + "") + function_9e72a96(self.name) + "");
		}
	#/
	self.completed = 1;
	if(isdefined(self.var_6cc77d4e))
	{
		level objective_complete(self.var_6cc77d4e, self.a_targets);
	}
	waittillframeend();
	self.ee.owner notify(self.var_e788cdd7 + "_ended_early");
	self.ee.owner notify(self.var_e788cdd7 + "_setup_completed");
}

/*
	Name: objective_set
	Namespace: zm_sq
	Checksum: 0x35545FF6
	Offset: 0x1B50
	Size: 0xA38
	Parameters: 6
	Flags: Linked
*/
function objective_set(var_6cc77d4e, var_54829af, var_8c7ec5ce, str_objective_text, var_4cfa0710, var_df2aef7b)
{
	if(!isdefined(var_8c7ec5ce))
	{
		var_8c7ec5ce = 1;
	}
	if(!isdefined(var_4cfa0710))
	{
		var_4cfa0710 = var_6cc77d4e;
	}
	var_7f05db6 = [];
	if(isplayer(self))
	{
		a_players = array(self);
	}
	else
	{
		a_players = getplayers();
	}
	if(isdefined(var_54829af))
	{
		if(!isdefined(var_54829af))
		{
			var_54829af = [];
		}
		else if(!isarray(var_54829af))
		{
			var_54829af = array(var_54829af);
		}
		foreach(var_ff48959 in var_54829af)
		{
			n_obj_id = zm_utility::function_f5a222a8(var_6cc77d4e, var_ff48959);
			if(!isdefined(var_7f05db6))
			{
				var_7f05db6 = [];
			}
			else if(!isarray(var_7f05db6))
			{
				var_7f05db6 = array(var_7f05db6);
			}
			if(!isinarray(var_7f05db6, n_obj_id))
			{
				var_7f05db6[var_7f05db6.size] = n_obj_id;
			}
			if(isentity(var_ff48959))
			{
				if(!isdefined(var_ff48959.var_e453e8a5[var_4cfa0710]))
				{
					var_ff48959.var_e453e8a5[var_4cfa0710] = [];
				}
				if(!isdefined(var_ff48959.var_e453e8a5[var_4cfa0710]))
				{
					var_ff48959.var_e453e8a5[var_4cfa0710] = [];
				}
				else if(!isarray(var_ff48959.var_e453e8a5[var_4cfa0710]))
				{
					var_ff48959.var_e453e8a5[var_4cfa0710] = array(var_ff48959.var_e453e8a5[var_4cfa0710]);
				}
				if(!isinarray(var_ff48959.var_e453e8a5[var_4cfa0710], n_obj_id))
				{
					var_ff48959.var_e453e8a5[var_4cfa0710][var_ff48959.var_e453e8a5[var_4cfa0710].size] = n_obj_id;
				}
				if(isdefined(var_df2aef7b))
				{
					if(isentity(var_df2aef7b) && var_df2aef7b trigger::is_trigger_of_type("trigger_use", "trigger_use_touch", "trigger_radius_use"))
					{
						var_ff48959 thread zm_utility::function_747180ea(n_obj_id, undefined, var_df2aef7b);
					}
					else if(isint(var_df2aef7b) || isfloat(var_df2aef7b))
					{
						var_ff48959 thread zm_utility::function_747180ea(n_obj_id, var_df2aef7b);
					}
				}
				if(var_8c7ec5ce)
				{
					var_ff48959 thread function_8a11442f(var_4cfa0710);
				}
			}
			else if(isstruct(var_ff48959))
			{
				if(!isdefined(var_ff48959.var_e453e8a5[var_4cfa0710]))
				{
					var_ff48959.var_e453e8a5[var_4cfa0710] = [];
				}
				if(!isdefined(var_ff48959.var_e453e8a5[var_4cfa0710]))
				{
					var_ff48959.var_e453e8a5[var_4cfa0710] = [];
				}
				else if(!isarray(var_ff48959.var_e453e8a5[var_4cfa0710]))
				{
					var_ff48959.var_e453e8a5[var_4cfa0710] = array(var_ff48959.var_e453e8a5[var_4cfa0710]);
				}
				if(!isinarray(var_ff48959.var_e453e8a5[var_4cfa0710], n_obj_id))
				{
					var_ff48959.var_e453e8a5[var_4cfa0710][var_ff48959.var_e453e8a5[var_4cfa0710].size] = n_obj_id;
				}
				if(isdefined(var_df2aef7b))
				{
					if(isentity(var_df2aef7b) && var_df2aef7b trigger::is_trigger_of_type("trigger_use", "trigger_use_touch", "trigger_radius_use"))
					{
						var_ff48959 thread zm_utility::function_747180ea(n_obj_id, undefined, var_df2aef7b);
					}
					else if(isint(var_df2aef7b) || isfloat(var_df2aef7b))
					{
						var_ff48959 thread zm_utility::function_747180ea(n_obj_id, var_df2aef7b);
					}
				}
				var_ff48959 = var_ff48959.origin;
			}
			foreach(player in a_players)
			{
				if(!isdefined(player.var_e453e8a5[var_4cfa0710]))
				{
					player.var_e453e8a5[var_4cfa0710] = [];
				}
				if(!isdefined(player.var_e453e8a5[var_4cfa0710]))
				{
					player.var_e453e8a5[var_4cfa0710] = [];
				}
				else if(!isarray(player.var_e453e8a5[var_4cfa0710]))
				{
					player.var_e453e8a5[var_4cfa0710] = array(player.var_e453e8a5[var_4cfa0710]);
				}
				if(!isinarray(player.var_e453e8a5[var_4cfa0710], n_obj_id))
				{
					player.var_e453e8a5[var_4cfa0710][player.var_e453e8a5[var_4cfa0710].size] = n_obj_id;
				}
			}
		}
	}
	else
	{
		n_obj_id = zm_utility::function_f5a222a8(var_6cc77d4e, (0, 0, 0));
		if(!isdefined(var_7f05db6))
		{
			var_7f05db6 = [];
		}
		else if(!isarray(var_7f05db6))
		{
			var_7f05db6 = array(var_7f05db6);
		}
		if(!isinarray(var_7f05db6, n_obj_id))
		{
			var_7f05db6[var_7f05db6.size] = n_obj_id;
		}
		foreach(player in a_players)
		{
			if(!isdefined(player.var_e453e8a5[var_4cfa0710]))
			{
				player.var_e453e8a5[var_4cfa0710] = [];
			}
			if(!isdefined(player.var_e453e8a5[var_4cfa0710]))
			{
				player.var_e453e8a5[var_4cfa0710] = [];
			}
			else if(!isarray(player.var_e453e8a5[var_4cfa0710]))
			{
				player.var_e453e8a5[var_4cfa0710] = array(player.var_e453e8a5[var_4cfa0710]);
			}
			if(!isinarray(player.var_e453e8a5[var_4cfa0710], n_obj_id))
			{
				player.var_e453e8a5[var_4cfa0710][player.var_e453e8a5[var_4cfa0710].size] = n_obj_id;
			}
		}
		function_4339912c(n_obj_id);
		/#
			/#
				assert(isdefined(str_objective_text), ("" + function_9e72a96(var_6cc77d4e)) + "");
			#/
		#/
	}
	if(isdefined(str_objective_text))
	{
		foreach(player in a_players)
		{
			foreach(n_obj_id in var_7f05db6)
			{
				player.var_4fcae9dc[n_obj_id] = str_objective_text;
				level.var_31028c5d prototype_hud::set_active_objective_string(player, str_objective_text);
				level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 2);
				level.var_31028c5d prototype_hud::set_active_obj_progress_visibility(player, 0);
			}
		}
	}
	return var_7f05db6;
}

/*
	Name: sndonoverride_eye_
	Namespace: zm_sq
	Checksum: 0x5CBD657C
	Offset: 0x2590
	Size: 0x108
	Parameters: 1
	Flags: None
*/
function sndonoverride_eye_(n_progress)
{
	if(isplayer(self))
	{
		a_players = array(self);
	}
	else
	{
		a_players = getplayers();
	}
	foreach(player in a_players)
	{
		level.var_31028c5d prototype_hud::set_active_objective_progress(player, n_progress);
		level.var_31028c5d prototype_hud::set_active_obj_progress_visibility(player, 1);
	}
}

/*
	Name: objective_complete
	Namespace: zm_sq
	Checksum: 0xC86A8992
	Offset: 0x26A0
	Size: 0x944
	Parameters: 2
	Flags: Linked
*/
function objective_complete(var_7f440703, a_targets)
{
	var_6261674 = [];
	if(isplayer(self))
	{
		a_players = array(self);
	}
	else
	{
		a_players = getplayers();
	}
	if(isdefined(a_targets))
	{
		if(!isdefined(a_targets))
		{
			a_targets = [];
		}
		else if(!isarray(a_targets))
		{
			a_targets = array(a_targets);
		}
		foreach(target in a_targets)
		{
			if(!isentity(target) && !isstruct(target))
			{
				if(isvec(target))
				{
					var_8861fa85 = function_e883632(a_players, var_7f440703);
					if(isarray(var_8861fa85))
					{
						var_6261674 = arraycombine(var_6261674, var_8861fa85, 0, 0);
					}
				}
				continue;
			}
			var_8861fa85 = target.var_e453e8a5[var_7f440703];
			if(!isarray(var_8861fa85) || !var_8861fa85.size)
			{
				/#
					println(("" + function_9e72a96(var_7f440703)) + "");
				#/
				continue;
			}
			var_6261674 = arraycombine(var_6261674, var_8861fa85, 0, 0);
			foreach(player in a_players)
			{
				foreach(n_obj_id in var_8861fa85)
				{
					zm_utility::function_e8f4d47b(player, n_obj_id, 1);
					objective_setinvisibletoplayer(n_obj_id, player);
					if(isarray(player.var_e453e8a5) && isarray(player.var_e453e8a5[var_7f440703]))
					{
						arrayremovevalue(player.var_e453e8a5[var_7f440703], n_obj_id);
						if(!player.var_e453e8a5[var_7f440703].size)
						{
							player.var_e453e8a5[var_7f440703] = undefined;
						}
					}
				}
			}
			var_e3ee5414 = function_5c98edf1(var_7f440703, var_8861fa85);
			if(!var_e3ee5414)
			{
				target zm_utility::function_48d9a9c9();
				foreach(n_obj_id in var_8861fa85)
				{
					objective_setstate(n_obj_id, "done");
					zm_utility::function_bc5a54a8(n_obj_id);
				}
				target.var_e453e8a5[var_7f440703] = undefined;
				target notify("complete_objective_" + var_7f440703);
			}
		}
	}
	else
	{
		foreach(player in a_players)
		{
			var_8861fa85 = player.var_e453e8a5[var_7f440703];
			if(!isarray(var_8861fa85) || !var_8861fa85.size)
			{
				/#
					println((("" + player getentitynumber()) + "") + function_9e72a96(var_7f440703) + "");
				#/
				continue;
			}
			var_6261674 = arraycombine(var_6261674, var_8861fa85, 0, 0);
			foreach(n_obj_id in var_8861fa85)
			{
				zm_utility::function_e8f4d47b(player, n_obj_id, 1);
				objective_setinvisibletoplayer(n_obj_id, player);
				if(isarray(player.var_e453e8a5) && isarray(player.var_e453e8a5[var_7f440703]))
				{
					arrayremovevalue(player.var_e453e8a5[var_7f440703], n_obj_id);
					if(!player.var_e453e8a5[var_7f440703].size)
					{
						player.var_e453e8a5[var_7f440703] = undefined;
					}
				}
			}
		}
		var_e3ee5414 = function_5c98edf1(var_7f440703, var_8861fa85);
		if(isarray(var_8861fa85) && !var_e3ee5414)
		{
			foreach(n_obj_id in var_8861fa85)
			{
				objective_setstate(n_obj_id, "done");
				zm_utility::function_bc5a54a8(n_obj_id);
			}
		}
	}
	foreach(player in a_players)
	{
		foreach(n_obj_id in var_6261674)
		{
			if(isarray(player.var_4fcae9dc))
			{
				arrayremoveindex(player.var_4fcae9dc, n_obj_id, 1);
				if(!player.var_4fcae9dc.size)
				{
					level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 0);
					level.var_31028c5d prototype_hud::set_active_obj_progress_visibility(player, 0);
				}
			}
		}
	}
}

/*
	Name: function_8a11442f
	Namespace: zm_sq
	Checksum: 0xB1990FDF
	Offset: 0x2FF0
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8a11442f(str_objective)
{
	self endon(#"deleted", "complete_objective_" + str_objective);
	self waittill(#"death", #"hash_26d74c393e63d809");
	thread objective_complete(str_objective, self);
}

/*
	Name: function_e883632
	Namespace: zm_sq
	Checksum: 0xCDE17CF3
	Offset: 0x3060
	Size: 0x29C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e883632(a_players, var_7f440703)
{
	foreach(player in a_players)
	{
		var_8861fa85 = player.var_e453e8a5[var_7f440703];
		if(isarray(var_8861fa85))
		{
			foreach(n_obj_id in var_8861fa85)
			{
				objective_setinvisibletoplayer(n_obj_id, player);
			}
			if(isarray(player.var_e453e8a5) && isarray(player.var_e453e8a5[var_7f440703]))
			{
				arrayremovevalue(player.var_e453e8a5[var_7f440703], n_obj_id);
				if(!player.var_e453e8a5[var_7f440703].size)
				{
					player.var_e453e8a5[var_7f440703] = undefined;
				}
			}
		}
	}
	var_e3ee5414 = function_5c98edf1(var_7f440703, var_8861fa85);
	if(!var_e3ee5414 && isarray(var_8861fa85))
	{
		foreach(n_obj_id in var_8861fa85)
		{
			objective_setstate(n_obj_id, "done");
			zm_utility::function_bc5a54a8(n_obj_id);
		}
	}
	return var_8861fa85;
}

/*
	Name: function_5c98edf1
	Namespace: zm_sq
	Checksum: 0xEA345572
	Offset: 0x3308
	Size: 0x19E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_5c98edf1(var_7f440703, var_8861fa85)
{
	if(!isdefined(var_8861fa85))
	{
		var_8861fa85 = [];
	}
	else if(!isarray(var_8861fa85))
	{
		var_8861fa85 = array(var_8861fa85);
	}
	foreach(player in getplayers())
	{
		if(isarray(player.var_e453e8a5[var_7f440703]) && player.var_e453e8a5[var_7f440703].size)
		{
			foreach(n_obj_id in var_8861fa85)
			{
				if(isinarray(player.var_e453e8a5[var_7f440703], n_obj_id))
				{
					return true;
				}
			}
		}
	}
	return false;
}

/*
	Name: function_aee0b4b4
	Namespace: zm_sq
	Checksum: 0x8F2AC82E
	Offset: 0x34B0
	Size: 0x18C
	Parameters: 2
	Flags: None
*/
function function_aee0b4b4(var_7f440703, a_targets)
{
	if(isplayer(self))
	{
		a_players = array(self);
	}
	else
	{
		a_players = getplayers();
	}
	var_8861fa85 = function_407dcc8d(var_7f440703, a_targets);
	foreach(n_obj_id in var_8861fa85)
	{
		foreach(player in a_players)
		{
			zm_utility::function_e8f4d47b(player, n_obj_id, 0);
			objective_setvisibletoplayer(n_obj_id, player);
		}
	}
}

/*
	Name: function_3029d343
	Namespace: zm_sq
	Checksum: 0x19268D57
	Offset: 0x3648
	Size: 0x194
	Parameters: 2
	Flags: None
*/
function function_3029d343(var_7f440703, a_targets)
{
	if(isplayer(self))
	{
		a_players = array(self);
	}
	else
	{
		a_players = getplayers();
	}
	var_8861fa85 = function_407dcc8d(var_7f440703, a_targets);
	foreach(n_obj_id in var_8861fa85)
	{
		foreach(player in a_players)
		{
			zm_utility::function_e8f4d47b(player, n_obj_id, 1);
			objective_setinvisibletoplayer(n_obj_id, player);
		}
	}
}

/*
	Name: function_97aa577f
	Namespace: zm_sq
	Checksum: 0x52182BD9
	Offset: 0x37E8
	Size: 0x2D8
	Parameters: 0
	Flags: None
*/
function function_97aa577f()
{
	if(isplayer(self))
	{
		if(isdefined(self.var_e453e8a5))
		{
			foreach(objective_ids in self.var_e453e8a5)
			{
				foreach(objective_id in objective_ids)
				{
					zm_utility::function_e8f4d47b(self, objective_id, 1);
					objective_setinvisibletoplayer(objective_id, self);
				}
			}
		}
	}
	else
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(isdefined(player.var_e453e8a5))
			{
				foreach(objective_ids in player.var_e453e8a5)
				{
					foreach(objective_id in objective_ids)
					{
						zm_utility::function_e8f4d47b(player, objective_id, 1);
						objective_setinvisibletoplayer(objective_id, player);
					}
				}
			}
		}
	}
}

/*
	Name: function_87bf9705
	Namespace: zm_sq
	Checksum: 0x96FB42F8
	Offset: 0x3AC8
	Size: 0x2D8
	Parameters: 0
	Flags: None
*/
function function_87bf9705()
{
	if(isplayer(self))
	{
		if(isdefined(self.var_e453e8a5))
		{
			foreach(objective_ids in self.var_e453e8a5)
			{
				foreach(objective_id in objective_ids)
				{
					zm_utility::function_e8f4d47b(self, objective_id, 0);
					objective_setvisibletoplayer(objective_id, self);
				}
			}
		}
	}
	else
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(isdefined(player.var_e453e8a5))
			{
				foreach(objective_ids in player.var_e453e8a5)
				{
					foreach(objective_id in objective_ids)
					{
						zm_utility::function_e8f4d47b(player, objective_id, 0);
						objective_setvisibletoplayer(objective_id, player);
					}
				}
			}
		}
	}
}

/*
	Name: function_407dcc8d
	Namespace: zm_sq
	Checksum: 0xAA8D012
	Offset: 0x3DA8
	Size: 0x1EE
	Parameters: 2
	Flags: Linked
*/
function function_407dcc8d(var_7f440703, a_targets)
{
	a_n_objective_ids = [];
	if(isdefined(a_targets))
	{
		if(!isdefined(a_targets))
		{
			a_targets = [];
		}
		else if(!isarray(a_targets))
		{
			a_targets = array(a_targets);
		}
		foreach(target in a_targets)
		{
			if(isarray(target.var_e453e8a5[var_7f440703]))
			{
				a_n_objective_ids = arraycombine(a_n_objective_ids, target.var_e453e8a5[var_7f440703], 0, 0);
			}
		}
	}
	else
	{
		foreach(player in getplayers())
		{
			if(isarray(player.var_e453e8a5[var_7f440703]))
			{
				a_n_objective_ids = arraycombine(a_n_objective_ids, player.var_e453e8a5[var_7f440703], 0, 0);
			}
		}
	}
	return a_n_objective_ids;
}

/*
	Name: function_f09763fd
	Namespace: zm_sq
	Checksum: 0x9428D6A5
	Offset: 0x3FA0
	Size: 0x1D4
	Parameters: 2
	Flags: None
*/
function function_f09763fd(ee_name, step_name)
{
	/#
		/#
			assert(ishash(ee_name), "");
		#/
		/#
			assert(isdefined(self._ee[ee_name]), ("" + ee_name) + "");
		#/
		var_da601d7f = function_44e256d8(ee_name);
		index = function_9212ff4d(ee_name, step_name);
		if(index == -1)
		{
			if(getdvarint(#"hash_7919e37cd5d57659", 0))
			{
				iprintlnbold((("" + function_9e72a96(ee_name)) + "") + function_9e72a96(step_name));
				println((("" + function_9e72a96(ee_name)) + "") + function_9e72a96(step_name));
			}
			return;
		}
		return (((var_da601d7f + "") + function_9e72a96(step_name) + "") + index) + "";
	#/
}

/*
	Name: function_44e256d8
	Namespace: zm_sq
	Checksum: 0x7F1F890D
	Offset: 0x4180
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_44e256d8(ee_name)
{
	/#
		/#
			assert(ishash(ee_name), "");
		#/
		owner = "";
		if(isentity(self))
		{
			entitynum = self getentitynumber();
			owner = ("" + entitynum) + "";
		}
		return ("" + owner) + function_9e72a96(ee_name) + "";
	#/
}

/*
	Name: function_28aee167
	Namespace: zm_sq
	Checksum: 0x79027266
	Offset: 0x4260
	Size: 0x114
	Parameters: 1
	Flags: None
*/
function function_28aee167(ee_name)
{
	/#
		/#
			assert(ishash(ee_name), "");
		#/
		ee_path = function_44e256d8(ee_name);
		owner = "";
		if(isentity(self))
		{
			owner = self getentitynumber();
		}
		util::waittill_can_add_debug_command();
		adddebugcommand((((("" + ee_path) + "") + owner) + "") + function_9e72a96(ee_name) + "");
	#/
}

/*
	Name: function_b3da1a16
	Namespace: zm_sq
	Checksum: 0x58239EE0
	Offset: 0x4380
	Size: 0x1E4
	Parameters: 2
	Flags: None
*/
function function_b3da1a16(ee_name, step_name)
{
	/#
		/#
			assert(ishash(ee_name), "");
		#/
		/#
			assert(ishash(step_name), "");
		#/
		step_path = function_f09763fd(ee_name, step_name);
		index = function_9212ff4d(ee_name, step_name);
		owner = "";
		if(isentity(self))
		{
			owner = self getentitynumber();
		}
		util::waittill_can_add_debug_command();
		adddebugcommand((((((("" + step_path) + "") + owner) + "") + function_9e72a96(ee_name) + "") + index) + "");
		adddebugcommand((((((("" + step_path) + "") + owner) + "") + function_9e72a96(ee_name) + "") + index) + "");
	#/
}

/*
	Name: function_fa5a5bfd
	Namespace: zm_sq
	Checksum: 0x3DAA6EF1
	Offset: 0x4570
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_fa5a5bfd()
{
	/#
		if(isdefined(self._ee))
		{
			playernum = self getentitynumber();
			path = "" + playernum;
			util::waittill_can_add_debug_command();
			adddebugcommand(("" + path) + "");
		}
	#/
}

/*
	Name: function_87306f8a
	Namespace: zm_sq
	Checksum: 0x9C4A00E8
	Offset: 0x4608
	Size: 0xC8
	Parameters: 2
	Flags: None
*/
function function_87306f8a(ee_name, step_name)
{
	/#
		ee = self._ee[ee_name];
		step_index = function_9212ff4d(ee_name, step_name);
		if(ee.started && step_index <= ee.current_step)
		{
			return false;
		}
		ee.skip_to_step = step_index;
		if(ee.started)
		{
			function_614612f(ee_name);
		}
		else
		{
			level start(ee.name);
		}
		return true;
	#/
}

/*
	Name: function_614612f
	Namespace: zm_sq
	Checksum: 0xBBD16EA2
	Offset: 0x46E0
	Size: 0x14C
	Parameters: 1
	Flags: None
*/
function function_614612f(ee_name)
{
	/#
		ee = self._ee[ee_name];
		if(ee.started)
		{
			ee.steps[ee.current_step] notify(#"end_early");
		}
		else if(getdvarint(#"hash_7919e37cd5d57659", 0))
		{
			iprintlnbold((("" + function_9e72a96(ee_name)) + "") + function_9e72a96(ee.steps[ee.current_step].name) + "");
			println((("" + function_9e72a96(ee_name)) + "") + function_9e72a96(ee.steps[ee.current_step].name) + "");
		}
	#/
}

/*
	Name: function_f2dd8601
	Namespace: zm_sq
	Checksum: 0xD50D3CD6
	Offset: 0x4838
	Size: 0x324
	Parameters: 2
	Flags: None
*/
function function_f2dd8601(ee_name, var_f2c264bb)
{
	/#
		if(isentity(self))
		{
			self endon(#"death");
			self endon(#"disconnect");
		}
		self endon(#"game_ended");
		ee = self._ee[ee_name];
		step = ee.steps[var_f2c264bb];
		if(function_87306f8a(ee_name, step.name))
		{
			if(!step.started)
			{
				wait_time = 10 * ee.steps.size;
				waitresult = undefined;
				waitresult = self waittilltimeout(wait_time, step.var_e788cdd7 + "");
				if(waitresult._notify == #"timeout")
				{
					if(getdvarint(#"hash_7919e37cd5d57659", 0))
					{
						iprintlnbold((("" + function_9e72a96(ee_name)) + "") + function_9e72a96(ee.steps[ee.current_step].name));
						println((("" + function_9e72a96(ee_name)) + "") + function_9e72a96(ee.steps[ee.current_step].name));
					}
					return;
				}
			}
			wait(1);
		}
		if(getdvarint(#"hash_7919e37cd5d57659", 0))
		{
			iprintlnbold((("" + function_9e72a96(ee.name)) + "") + function_9e72a96(ee.steps[ee.current_step].name) + "");
			println((("" + function_9e72a96(ee.name)) + "") + function_9e72a96(ee.steps[ee.current_step].name) + "");
		}
		function_614612f(ee_name);
	#/
}

/*
	Name: devgui_think
	Namespace: zm_sq
	Checksum: 0x1539EF03
	Offset: 0x4B68
	Size: 0x8DE
	Parameters: 0
	Flags: None
*/
function devgui_think()
{
	/#
		self notify(#"hash_6d8b1a4c632ecc9");
		self endon(#"hash_6d8b1a4c632ecc9");
		while(true)
		{
			wait(1);
			cmd = getdvarstring(#"hash_319d902ea18eb39");
			setdvar(#"hash_319d902ea18eb39", "");
			cmd = strtok(cmd, "");
			if(cmd.size == 0)
			{
				continue;
			}
			targetval = cmd[1];
			target = undefined;
			if(targetval == "")
			{
				target = level;
			}
			else
			{
				foreach(player in getplayers())
				{
					if(player getentitynumber() == targetval)
					{
						target = player;
						break;
					}
				}
			}
			/#
				assert(isdefined(target));
			#/
			switch(cmd[0])
			{
				case "skip_to":
				{
					ee = target._ee[cmd[2]];
					if(!isdefined(ee))
					{
						continue;
					}
					var_f2c264bb = int(cmd[3]);
					step_name = ee.steps[var_f2c264bb].name;
					if(var_f2c264bb < ee.current_step)
					{
						if(getdvarint(#"hash_7919e37cd5d57659", 0))
						{
							iprintlnbold(((("" + function_9e72a96(ee.name)) + "") + function_9e72a96(ee.steps[ee.current_step].name) + "") + targetval);
							println(((("" + function_9e72a96(ee.name)) + "") + function_9e72a96(ee.steps[ee.current_step].name) + "") + targetval);
						}
					}
					else
					{
						if(var_f2c264bb == ee.current_step)
						{
							if(getdvarint(#"hash_7919e37cd5d57659", 0))
							{
								iprintlnbold(((("" + function_9e72a96(ee.name)) + "") + function_9e72a96(step_name) + "") + targetval);
								println(((("" + function_9e72a96(ee.name)) + "") + function_9e72a96(step_name) + "") + targetval);
							}
						}
						else
						{
							if(getdvarint(#"hash_7919e37cd5d57659", 0))
							{
								iprintlnbold((((("" + function_9e72a96(ee.name)) + "") + function_9e72a96(step_name) + "") + targetval) + "");
								println((((("" + function_9e72a96(ee.name)) + "") + function_9e72a96(step_name) + "") + targetval) + "");
							}
							target function_87306f8a(ee.name, step_name);
						}
					}
					break;
				}
				case "complete":
				{
					ee = target._ee[cmd[2]];
					if(!isdefined(ee))
					{
						continue;
					}
					var_f2c264bb = int(cmd[3]);
					if(var_f2c264bb < ee.current_step)
					{
						if(getdvarint(#"hash_7919e37cd5d57659", 0))
						{
							iprintlnbold(((("" + function_9e72a96(ee.name)) + "") + function_9e72a96(ee.steps[ee.current_step].name) + "") + targetval);
							println(((("" + function_9e72a96(ee.name)) + "") + function_9e72a96(ee.steps[ee.current_step].name) + "") + targetval);
						}
					}
					else
					{
						target thread function_f2dd8601(ee.name, var_f2c264bb);
					}
					break;
				}
				case "start":
				{
					if(isdefined(target._ee[cmd[2]]))
					{
						target start(hash(cmd[2]));
					}
					break;
				}
				case "show_status":
				{
					if(is_true(level.var_7f2ca392))
					{
						function_c1d3567c();
					}
					else
					{
						function_5df75220();
						level thread function_9bee49bf();
					}
					break;
				}
				case "outro":
				{
					if(cmd.size < 2 || !isdefined(target._ee[cmd[2]]))
					{
						break;
					}
					ee = target._ee[cmd[2]];
					if(isdefined(ee))
					{
						target waittill(#"start_zombie_round_logic");
						step_name = ee.steps[ee.steps.size - 1].name;
						target function_87306f8a(ee.name, step_name);
					}
					break;
				}
			}
		}
	#/
}

/*
	Name: create_hudelem
	Namespace: zm_sq
	Checksum: 0x1D62D759
	Offset: 0x5450
	Size: 0xA2
	Parameters: 2
	Flags: Private
*/
function private create_hudelem(y, x)
{
	/#
		if(!isdefined(x))
		{
			x = 0;
		}
		var_aa917a22 = newdebughudelem();
		var_aa917a22.alignx = "";
		var_aa917a22.horzalign = "";
		var_aa917a22.aligny = "";
		var_aa917a22.vertalign = "";
		var_aa917a22.y = y;
		var_aa917a22.x = x;
		return var_aa917a22;
	#/
}

/*
	Name: function_5df75220
	Namespace: zm_sq
	Checksum: 0xC5574A63
	Offset: 0x5500
	Size: 0x248
	Parameters: 0
	Flags: None
*/
function function_5df75220()
{
	/#
		current_y = 30;
		foreach(ee in level._ee)
		{
			current_x = 30;
			if(!isdefined(ee.debug_hudelem))
			{
				ee.debug_hudelem = create_hudelem(current_y, current_x);
			}
			ee.debug_hudelem settext(function_9e72a96(ee.name));
			ee.debug_hudelem.fontscale = 1.5;
			current_x = current_x + 5;
			step_string = "";
			foreach(step in ee.steps)
			{
				current_y = current_y + 15;
				if(!isdefined(step.debug_hudelem))
				{
					step.debug_hudelem = create_hudelem(current_y, current_x);
				}
				step.debug_hudelem settext(step_string + function_9e72a96(step.name));
				step.debug_hudelem.fontscale = 1.5;
			}
			current_y = current_y + 30;
		}
		level.var_7f2ca392 = 1;
	#/
}

/*
	Name: function_c1d3567c
	Namespace: zm_sq
	Checksum: 0xF8FE0672
	Offset: 0x5750
	Size: 0x172
	Parameters: 0
	Flags: None
*/
function function_c1d3567c()
{
	/#
		level notify(#"hash_21c0567b0010f696");
		foreach(ee in level._ee)
		{
			if(isdefined(ee.debug_hudelem))
			{
				ee.debug_hudelem destroy();
			}
			ee.debug_hudelem = undefined;
			foreach(step in ee.steps)
			{
				if(isdefined(step.debug_hudelem))
				{
					step.debug_hudelem destroy();
				}
				step.debug_hudelem = undefined;
			}
		}
		level.var_7f2ca392 = undefined;
	#/
}

/*
	Name: function_9bee49bf
	Namespace: zm_sq
	Checksum: 0xBB05064B
	Offset: 0x58D0
	Size: 0x156
	Parameters: 0
	Flags: None
*/
function function_9bee49bf()
{
	/#
		level endon(#"hash_21c0567b0010f696");
		while(true)
		{
			waitframe(1);
			foreach(ee in level._ee)
			{
				ee.debug_hudelem.color = function_1091b2a0(ee);
				foreach(step in ee.steps)
				{
					step.debug_hudelem.color = function_1091b2a0(step);
				}
			}
		}
	#/
}

/*
	Name: function_1091b2a0
	Namespace: zm_sq
	Checksum: 0x6DBE28DE
	Offset: 0x5A30
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function function_1091b2a0(var_4f1c1316)
{
	/#
		if(!var_4f1c1316.started)
		{
			color = vectorscale((1, 1, 1), 0.75);
		}
		else
		{
			if(!var_4f1c1316.completed)
			{
				color = (1, 0, 0);
			}
			else
			{
				color = (0, 1, 0);
			}
		}
		return color;
	#/
}

