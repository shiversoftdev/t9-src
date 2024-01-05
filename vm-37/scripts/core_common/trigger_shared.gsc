#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\teleport_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace trigger;

/*
	Name: __init__system__
	Namespace: trigger
	Checksum: 0x1E68F43C
	Offset: 0x218
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"trigger", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: trigger
	Checksum: 0xBF4E28D4
	Offset: 0x260
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::function_27d9ab8(&trigger_think);
	level.var_53af20e = &set_flag_permissions;
}

/*
	Name: add_handler
	Namespace: trigger
	Checksum: 0xA3539346
	Offset: 0x2A8
	Size: 0xDC
	Parameters: 4
	Flags: Linked
*/
function add_handler(var_60ffbed2, func_handler, func_init, var_114fa26c)
{
	if(!isdefined(var_114fa26c))
	{
		var_114fa26c = is_trigger_once();
	}
	if((isfunctionptr(var_60ffbed2) ? [[var_60ffbed2]]() : isdefined(self.(var_60ffbed2))))
	{
		if(isdefined(func_handler))
		{
			if(var_114fa26c)
			{
				self callback::on_trigger_once(func_handler);
			}
			else
			{
				self callback::on_trigger(func_handler);
			}
		}
		if(isfunctionptr(func_init))
		{
			[[func_init]](var_60ffbed2);
		}
	}
}

/*
	Name: init_flags
	Namespace: trigger
	Checksum: 0x31A95713
	Offset: 0x390
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function init_flags(str_kvp)
{
	tokens = util::create_flags_and_return_tokens(self.(str_kvp));
	add_tokens_to_trigger_flags(tokens);
	update_based_on_flags();
}

/*
	Name: trigger_think
	Namespace: trigger
	Checksum: 0x39398390
	Offset: 0x3F8
	Size: 0x2C4
	Parameters: 0
	Flags: Linked
*/
function trigger_think()
{
	self endon(#"death");
	add_handler("target", &trigger_spawner);
	add_handler("script_flag_true", undefined, &init_flags);
	add_handler("script_flag_true_any", undefined, &init_flags);
	add_handler("script_flag_false_any", undefined, &init_flags);
	add_handler("script_flag_false", undefined, &init_flags);
	add_handler("script_flag_set", &flag_set_trigger, &init_flags);
	add_handler("script_flag_clear", &flag_clear_trigger, &init_flags);
	add_handler("script_trigger_group", &trigger_group);
	add_handler("script_notify", &trigger_notify);
	add_handler("script_killspawner", &kill_spawner_trigger);
	add_handler("script_teleport_location", &teleport::team);
	add_handler(&is_trigger_once, &trigger_once);
	if(isdefined(self.script_flag_set_on_touching) || isdefined(self.script_flag_set_on_not_touching))
	{
		level thread script_flag_set_touching(self);
	}
	if(is_look_trigger())
	{
		level thread look_trigger(self);
		s_info = undefined;
		s_info = self waittill(#"trigger_look");
		self thread callback::codecallback_trigger(s_info, 1);
	}
}

/*
	Name: add_flags
	Namespace: trigger
	Checksum: 0x5A21CF95
	Offset: 0x6C8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function add_flags(flags)
{
	trigger_flags = function_27f2ef17(self);
	function_4e3bb793(self, trigger_flags | flags);
}

/*
	Name: get_trigger_look_target
	Namespace: trigger
	Checksum: 0x112392E7
	Offset: 0x720
	Size: 0x1C8
	Parameters: 0
	Flags: Linked
*/
function get_trigger_look_target()
{
	if(isdefined(self.target))
	{
		a_potential_targets = getentarray(self.target, "targetname");
		a_targets = [];
		foreach(target in a_potential_targets)
		{
			if(target.classname === "script_origin")
			{
				if(!isdefined(a_targets))
				{
					a_targets = [];
				}
				else if(!isarray(a_targets))
				{
					a_targets = array(a_targets);
				}
				a_targets[a_targets.size] = target;
			}
		}
		a_potential_target_structs = struct::get_array(self.target);
		a_targets = arraycombine(a_targets, a_potential_target_structs, 1, 0);
		if(a_targets.size > 0)
		{
			/#
				assert(a_targets.size == 1, ("" + self.origin) + "");
			#/
			e_target = a_targets[0];
		}
	}
	return (isdefined(e_target) ? e_target : self);
}

/*
	Name: look_trigger
	Namespace: trigger
	Checksum: 0xDC44E2F3
	Offset: 0x8F0
	Size: 0x210
	Parameters: 1
	Flags: Linked
*/
function look_trigger(trigger)
{
	trigger endon(#"death");
	e_target = trigger get_trigger_look_target();
	if(isdefined(trigger.script_flag) && !isdefined(level.flag[trigger.script_flag]))
	{
		level function_ac2f203a(trigger.script_flag);
	}
	a_parameters = [];
	if(isdefined(trigger.script_parameters))
	{
		a_parameters = strtok(trigger.script_parameters, ",; ");
	}
	b_ads_check = isinarray(a_parameters, "check_ads");
	while(true)
	{
		waitresult = undefined;
		waitresult = trigger waittill(#"trigger");
		e_other = waitresult.activator;
		if(isplayer(e_other))
		{
			while(isdefined(e_other) && e_other istouching(trigger))
			{
				if(e_other util::is_looking_at(e_target, trigger.script_dot, is_true(trigger.script_trace)) && (!b_ads_check || !e_other util::is_ads()))
				{
					trigger notify(#"trigger_look", waitresult);
				}
				waitframe(1);
			}
		}
		else
		{
			/#
				assertmsg("");
			#/
		}
	}
}

/*
	Name: trigger_spawner
	Namespace: trigger
	Checksum: 0x4EA0FBF7
	Offset: 0xB08
	Size: 0x120
	Parameters: 1
	Flags: Linked
*/
function trigger_spawner(s_info)
{
	a_ai_spawners = getspawnerarray(self.target, "targetname");
	foreach(sp in a_ai_spawners)
	{
		if(isdefined(sp))
		{
			if(isvehiclespawner(sp))
			{
				level thread vehicle::_vehicle_spawn(sp);
				continue;
			}
			/#
				assert(isactorspawner(sp));
			#/
			sp thread trigger_spawner_spawn();
		}
	}
}

/*
	Name: trigger_spawner_spawn
	Namespace: trigger
	Checksum: 0xC3164B9A
	Offset: 0xC30
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function trigger_spawner_spawn()
{
	self endon(#"death");
	self flag::script_flag_wait();
	self util::script_delay();
	self spawner::spawn();
}

/*
	Name: trigger_notify
	Namespace: trigger
	Checksum: 0x5BD5CAD1
	Offset: 0xC98
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function trigger_notify(s_info)
{
	if(isdefined(self.target))
	{
		a_target_ents = getentarray(self.target, "targetname");
		foreach(notify_ent in a_target_ents)
		{
			notify_ent notify(self.script_notify, s_info);
		}
	}
	level notify(self.script_notify, s_info);
}

/*
	Name: function_ac2f203a
	Namespace: trigger
	Checksum: 0x34EE001F
	Offset: 0xD78
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function function_ac2f203a(str_flag)
{
	if(!level flag::exists(str_flag))
	{
		level flag::init(str_flag);
	}
	if(!isdefined(level.trigger_flags))
	{
		level.trigger_flags = [];
	}
	if(!isdefined(level.trigger_flags[str_flag]))
	{
		level.trigger_flags[str_flag] = [];
	}
}

/*
	Name: flag_set_trigger
	Namespace: trigger
	Checksum: 0x47019703
	Offset: 0xE00
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function flag_set_trigger()
{
	a_str_flags = util::create_flags_and_return_tokens(self.script_flag_set);
	foreach(str_flag in a_str_flags)
	{
		level flag::set(str_flag);
	}
}

/*
	Name: flag_clear_trigger
	Namespace: trigger
	Checksum: 0x835F530F
	Offset: 0xEB0
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function flag_clear_trigger(s_info)
{
	a_str_flags = util::create_flags_and_return_tokens(self.script_flag_clear);
	foreach(str_flag in a_str_flags)
	{
		level flag::clear(str_flag);
	}
}

/*
	Name: add_tokens_to_trigger_flags
	Namespace: trigger
	Checksum: 0x63F6237C
	Offset: 0xF68
	Size: 0x102
	Parameters: 1
	Flags: Linked
*/
function add_tokens_to_trigger_flags(tokens)
{
	for(i = 0; i < tokens.size; i++)
	{
		flag = tokens[i];
		if(!isdefined(level.trigger_flags[flag]))
		{
			level.trigger_flags[flag] = [];
		}
		else if(!isarray(level.trigger_flags[flag]))
		{
			level.trigger_flags[flag] = array(level.trigger_flags[flag]);
		}
		if(!isinarray(level.trigger_flags[flag], self))
		{
			level.trigger_flags[flag][level.trigger_flags[flag].size] = self;
		}
	}
}

/*
	Name: friendly_respawn_trigger
	Namespace: trigger
	Checksum: 0xCAEF8416
	Offset: 0x1078
	Size: 0x180
	Parameters: 1
	Flags: None
*/
function friendly_respawn_trigger(trigger)
{
	trigger endon(#"death");
	spawners = getentarray(trigger.target, "targetname");
	/#
		assert(spawners.size == 1, ("" + trigger.target) + "");
	#/
	spawner = spawners[0];
	/#
		assert(!isdefined(spawner.script_forcecolor), ("" + spawner.origin) + "");
	#/
	spawners = undefined;
	spawner endon(#"death");
	while(true)
	{
		trigger waittill(#"trigger");
		if(isdefined(trigger.script_forcecolor))
		{
			level.respawn_spawners_specific[trigger.script_forcecolor] = spawner;
		}
		else
		{
			level.respawn_spawner = spawner;
		}
		level flag::set("respawn_friendlies");
		wait(0.5);
	}
}

/*
	Name: friendly_respawn_clear
	Namespace: trigger
	Checksum: 0x28C42432
	Offset: 0x1200
	Size: 0x70
	Parameters: 1
	Flags: None
*/
function friendly_respawn_clear(trigger)
{
	trigger endon(#"death");
	while(true)
	{
		trigger waittill(#"trigger");
		level flag::clear("respawn_friendlies");
		wait(0.5);
	}
}

/*
	Name: script_flag_set_touching
	Namespace: trigger
	Checksum: 0xD861C485
	Offset: 0x1278
	Size: 0x1F8
	Parameters: 1
	Flags: Linked
*/
function script_flag_set_touching(trigger)
{
	trigger endon(#"death");
	if(isdefined(trigger.script_flag_set_on_touching))
	{
		level function_ac2f203a(trigger.script_flag_set_on_touching);
	}
	if(isdefined(trigger.script_flag_set_on_not_touching))
	{
		level function_ac2f203a(trigger.script_flag_set_on_not_touching);
	}
	trigger thread _detect_touched();
	while(true)
	{
		var_b26d1711 = trigger.script_touched;
		trigger.script_touched = 0;
		waitframe(1);
		waittillframeend();
		if(!trigger.script_touched)
		{
			waitframe(1);
			waittillframeend();
		}
		if(var_b26d1711 !== trigger.script_touched && (trigger istriggerenabled() || !is_true(trigger.var_949253fc)))
		{
			if(trigger.script_touched)
			{
				if(isdefined(trigger.script_flag_set_on_touching))
				{
					level flag::set(trigger.script_flag_set_on_touching);
				}
				if(isdefined(trigger.script_flag_set_on_not_touching))
				{
					level flag::clear(trigger.script_flag_set_on_not_touching);
				}
			}
			else
			{
				if(isdefined(trigger.script_flag_set_on_touching))
				{
					level flag::clear(trigger.script_flag_set_on_touching);
				}
				if(isdefined(trigger.script_flag_set_on_not_touching))
				{
					level flag::set(trigger.script_flag_set_on_not_touching);
				}
			}
		}
	}
}

/*
	Name: _detect_touched
	Namespace: trigger
	Checksum: 0xFD4A25AC
	Offset: 0x1478
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function _detect_touched()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"trigger");
		self.script_touched = 1;
	}
}

/*
	Name: trigger_delete_on_touch
	Namespace: trigger
	Checksum: 0x6EC4EC1D
	Offset: 0x14C8
	Size: 0x70
	Parameters: 1
	Flags: None
*/
function trigger_delete_on_touch(trigger)
{
	while(true)
	{
		waitresult = undefined;
		waitresult = trigger waittill(#"trigger");
		other = waitresult.activator;
		if(isdefined(other))
		{
			other delete();
		}
	}
}

/*
	Name: trigger_once
	Namespace: trigger
	Checksum: 0x55FC9E95
	Offset: 0x1540
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function trigger_once(s_info)
{
	waittillframeend();
	waittillframeend();
	if(isdefined(self))
	{
		/#
			println("");
			println((("" + self getentitynumber()) + "") + self.origin);
			println("");
		#/
		self delete();
	}
}

/*
	Name: get_all
	Namespace: trigger
	Checksum: 0xE564A3D9
	Offset: 0x15F0
	Size: 0xE8
	Parameters: 1
	Flags: Linked, Variadic
*/
function get_all(...)
{
	if(vararg.size == 1 && isarray(vararg[0]))
	{
		a_vararg = vararg[0];
	}
	else
	{
		a_vararg = vararg;
	}
	a_all = getentarraybytype(20);
	if(a_vararg.size)
	{
		for(i = a_all.size - 1; i >= 0; i--)
		{
			if(!isinarray(a_vararg, a_all[i].classname))
			{
				arrayremoveindex(a_all, i);
			}
		}
	}
	return a_all;
}

/*
	Name: is_trigger_of_type
	Namespace: trigger
	Checksum: 0x347C9628
	Offset: 0x16E0
	Size: 0x72
	Parameters: 1
	Flags: Linked, Variadic
*/
function is_trigger_of_type(...)
{
	if(vararg.size == 1 && isarray(vararg[0]))
	{
		a_vararg = vararg[0];
	}
	else
	{
		a_vararg = vararg;
	}
	return isinarray(a_vararg, self.classname);
}

/*
	Name: wait_till
	Namespace: trigger
	Checksum: 0xAB38514A
	Offset: 0x1760
	Size: 0x1B0
	Parameters: 4
	Flags: Linked
*/
function wait_till(str_name, str_key, e_entity, b_assert)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(b_assert))
	{
		b_assert = 1;
	}
	if(isdefined(str_name))
	{
		triggers = getentarray(str_name, str_key);
		/#
			assert(!b_assert || triggers.size > 0, (("" + str_name) + "") + str_key);
		#/
		if(triggers.size > 0)
		{
			if(triggers.size == 1)
			{
				trigger_hit = triggers[0];
				trigger_hit _trigger_wait(e_entity);
			}
			else
			{
				s_tracker = spawnstruct();
				array::thread_all(triggers, &_trigger_wait_think, s_tracker, e_entity);
				waitresult = undefined;
				waitresult = s_tracker waittill(#"trigger");
				trigger_hit = waitresult.trigger;
				trigger_hit.who = waitresult.activator;
			}
			return trigger_hit;
		}
	}
	else
	{
		_trigger_wait(e_entity);
		return self;
	}
}

/*
	Name: _trigger_wait
	Namespace: trigger
	Checksum: 0xBCB610F3
	Offset: 0x1918
	Size: 0x272
	Parameters: 1
	Flags: Linked
*/
function _trigger_wait(e_entity)
{
	self endon(#"death");
	if(isdefined(e_entity))
	{
		e_entity endon(#"death");
	}
	if(!isdefined(self.delaynotify))
	{
		self.delaynotify = 0;
	}
	/#
		if(is_look_trigger())
		{
			/#
				assert(!isarray(e_entity), "");
			#/
		}
		else if(self.classname === "")
		{
			/#
				assert(!isarray(e_entity), "");
			#/
		}
	#/
	while(true)
	{
		if(is_look_trigger())
		{
			waitresult = undefined;
			waitresult = self waittill(#"trigger_look");
			wait(self.delaynotify);
			e_other = waitresult.activator;
			if(isdefined(e_entity))
			{
				if(e_other !== e_entity)
				{
					continue;
				}
			}
		}
		else
		{
			if(self.classname === "trigger_damage")
			{
				waitresult = undefined;
				waitresult = self waittill(#"trigger");
				wait(self.delaynotify);
				e_other = waitresult.activator;
				if(isdefined(e_entity))
				{
					if(e_other !== e_entity)
					{
						continue;
					}
				}
			}
			else
			{
				waitresult = undefined;
				waitresult = self waittill(#"trigger");
				wait(self.delaynotify);
				e_other = waitresult.activator;
				if(isdefined(e_entity))
				{
					if(isarray(e_entity))
					{
						if(!array::is_touching(e_entity, self))
						{
							continue;
						}
					}
					else if(!e_entity istouching(self) && e_entity !== e_other)
					{
						continue;
					}
				}
			}
		}
		break;
	}
	self.who = e_other;
	return e_other;
}

/*
	Name: _trigger_wait_think
	Namespace: trigger
	Checksum: 0xC2BD270
	Offset: 0x1B98
	Size: 0x90
	Parameters: 2
	Flags: Linked
*/
function _trigger_wait_think(s_tracker, e_entity)
{
	self endon(#"death");
	s_tracker endon(#"trigger");
	e_other = _trigger_wait(e_entity);
	s_tracker notify(#"trigger", {#trigger:self, #activator:e_other});
}

/*
	Name: use
	Namespace: trigger
	Checksum: 0xE8DBC4CB
	Offset: 0x1C30
	Size: 0x17C
	Parameters: 4
	Flags: Linked
*/
function use(str_name, str_key, ent, b_assert)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(b_assert))
	{
		b_assert = 1;
	}
	if(!isdefined(ent))
	{
		ent = getplayers()[0];
	}
	if(isdefined(str_name))
	{
		e_trig = getent(str_name, str_key);
		if(!isdefined(e_trig))
		{
			if(b_assert)
			{
				/#
					assertmsg((("" + str_name) + "") + str_key);
				#/
			}
			return;
		}
	}
	else
	{
		e_trig = self;
		str_name = self.targetname;
	}
	if(isdefined(ent))
	{
		e_trig useby(ent);
	}
	else
	{
		e_trig useby(e_trig);
	}
	level notify(str_name, ent);
	if(e_trig is_look_trigger())
	{
		e_trig notify(#"trigger_look", {#entity:ent});
	}
	return e_trig;
}

/*
	Name: set_flag_permissions
	Namespace: trigger
	Checksum: 0x9232FF82
	Offset: 0x1DB8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function set_flag_permissions(msg)
{
	if(!isdefined(level.trigger_flags) || !isdefined(level.trigger_flags[msg]))
	{
		return;
	}
	arrayremovevalue(level.trigger_flags[msg], undefined);
	array::thread_all(level.trigger_flags[msg], &update_based_on_flags);
}

/*
	Name: update_based_on_flags
	Namespace: trigger
	Checksum: 0x9879DEE6
	Offset: 0x1E50
	Size: 0x23C
	Parameters: 0
	Flags: Linked
*/
function update_based_on_flags()
{
	true_on = 1;
	if(isdefined(self.script_flag_true))
	{
		tokens = util::create_flags_and_return_tokens(self.script_flag_true);
		for(i = 0; i < tokens.size; i++)
		{
			if(!level flag::get(tokens[i]))
			{
				true_on = 0;
				break;
			}
		}
	}
	false_on = 1;
	if(isdefined(self.script_flag_false))
	{
		tokens = util::create_flags_and_return_tokens(self.script_flag_false);
		for(i = 0; i < tokens.size; i++)
		{
			if(level flag::get(tokens[i]))
			{
				false_on = 0;
				break;
			}
		}
	}
	var_369930e5 = 1;
	if(isdefined(self.script_flag_true_any))
	{
		var_369930e5 = 0;
		tokens = util::create_flags_and_return_tokens(self.script_flag_true_any);
		for(i = 0; i < tokens.size; i++)
		{
			if(level flag::get(tokens[i]))
			{
				var_369930e5 = 1;
				break;
			}
		}
	}
	var_95bf6d6c = 1;
	if(isdefined(self.script_flag_false_any))
	{
		var_95bf6d6c = 0;
		tokens = util::create_flags_and_return_tokens(self.script_flag_false_any);
		for(i = 0; i < tokens.size; i++)
		{
			if(!level flag::get(tokens[i]))
			{
				var_95bf6d6c = 1;
				break;
			}
		}
	}
	self triggerenable(true_on && false_on && var_369930e5 && var_95bf6d6c);
}

/*
	Name: is_look_trigger
	Namespace: trigger
	Checksum: 0x2D128D6A
	Offset: 0x2098
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function is_look_trigger()
{
	return isdefined(self.spawnflags) && (self.spawnflags & 256) == 256 && !is_trigger_of_type("trigger_damage");
}

/*
	Name: is_trigger_once
	Namespace: trigger
	Checksum: 0x58ABE396
	Offset: 0x20E8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function is_trigger_once()
{
	return isdefined(self.spawnflags) && (self.spawnflags & 1024) == 1024 || is_trigger_of_type("trigger_once");
}

/*
	Name: wait_till_any
	Namespace: trigger
	Checksum: 0xF8600ADB
	Offset: 0x2138
	Size: 0x196
	Parameters: 1
	Flags: Linked, Variadic
*/
function wait_till_any(...)
{
	ent = spawnstruct();
	if(isarray(vararg[0]))
	{
		var_6a8e65fd = vararg[0];
	}
	else
	{
		var_6a8e65fd = vararg;
	}
	/#
		assert(var_6a8e65fd.size, "");
	#/
	a_triggers = [];
	a_triggers = arraycombine(a_triggers, getentarray(var_6a8e65fd[0], "targetname"), 1, 0);
	for(i = 1; i < var_6a8e65fd.size; i++)
	{
		a_triggers = arraycombine(a_triggers, getentarray(var_6a8e65fd[i], "targetname"), 1, 0);
	}
	for(i = 0; i < a_triggers.size; i++)
	{
		ent thread _ent_waits_for_trigger(a_triggers[i]);
	}
	waitresult = undefined;
	waitresult = ent waittill(#"done");
	return waitresult.trigger;
}

/*
	Name: wait_for_either
	Namespace: trigger
	Checksum: 0xFB9F0185
	Offset: 0x22D8
	Size: 0x3A
	Parameters: 2
	Flags: None
*/
function wait_for_either(str_targetname1, str_targetname2)
{
	trigger = wait_till_any(str_targetname1, str_targetname2);
	return trigger;
}

/*
	Name: _ent_waits_for_trigger
	Namespace: trigger
	Checksum: 0x17EBE1B1
	Offset: 0x2320
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function _ent_waits_for_trigger(trigger)
{
	self endon(#"done");
	trigger wait_till();
	self notify(#"done", {#trigger:trigger});
}

/*
	Name: wait_or_timeout
	Namespace: trigger
	Checksum: 0x7C5F4A74
	Offset: 0x2388
	Size: 0x84
	Parameters: 3
	Flags: None
*/
function wait_or_timeout(n_time, str_name, str_key)
{
	if(isdefined(n_time))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(n_time, "timeout");
	}
	wait_till(str_name, str_key);
}

/*
	Name: trigger_on_timeout
	Namespace: trigger
	Checksum: 0xBE003E89
	Offset: 0x2418
	Size: 0xF4
	Parameters: 4
	Flags: None
*/
function trigger_on_timeout(n_time, b_cancel_on_triggered, str_name, str_key)
{
	if(!isdefined(b_cancel_on_triggered))
	{
		b_cancel_on_triggered = 1;
	}
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	trig = self;
	if(isdefined(str_name))
	{
		trig = getent(str_name, str_key);
	}
	if(b_cancel_on_triggered)
	{
		if(trig is_look_trigger())
		{
			trig endon(#"trigger_look");
		}
		else
		{
			trig endon(#"trigger");
		}
	}
	trig endon(#"death");
	wait(n_time);
	trig use();
}

/*
	Name: multiple_waits
	Namespace: trigger
	Checksum: 0x8C997E0E
	Offset: 0x2518
	Size: 0xB0
	Parameters: 2
	Flags: None
*/
function multiple_waits(str_trigger_name, str_trigger_notify)
{
	foreach(trigger in getentarray(str_trigger_name, "targetname"))
	{
		trigger thread multiple_wait(str_trigger_notify);
	}
}

/*
	Name: multiple_wait
	Namespace: trigger
	Checksum: 0xDD5736E5
	Offset: 0x25D0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function multiple_wait(str_trigger_notify)
{
	level endon(str_trigger_notify);
	self waittill(#"trigger");
	level notify(str_trigger_notify);
}

/*
	Name: add_function
	Namespace: trigger
	Checksum: 0xAD239FD5
	Offset: 0x2610
	Size: 0x74
	Parameters: 9
	Flags: Linked
*/
function add_function(trigger, str_remove_on, func, param_1, param_2, param_3, param_4, param_5, param_6)
{
	self thread _do_trigger_function(trigger, str_remove_on, func, param_1, param_2, param_3, param_4, param_5, param_6);
}

/*
	Name: _do_trigger_function
	Namespace: trigger
	Checksum: 0x28882AEB
	Offset: 0x2690
	Size: 0xF0
	Parameters: 9
	Flags: Linked
*/
function _do_trigger_function(trigger, str_remove_on, func, param_1, param_2, param_3, param_4, param_5, param_6)
{
	self endon(#"death");
	trigger endon(#"death");
	if(isdefined(str_remove_on))
	{
		trigger endon(str_remove_on);
	}
	while(true)
	{
		if(isstring(trigger))
		{
			wait_till(trigger);
		}
		else
		{
			trigger wait_till();
		}
		util::single_thread(self, func, param_1, param_2, param_3, param_4, param_5, param_6);
	}
}

/*
	Name: kill_spawner_trigger
	Namespace: trigger
	Checksum: 0x963C4280
	Offset: 0x2788
	Size: 0x188
	Parameters: 1
	Flags: Linked
*/
function kill_spawner_trigger(s_info)
{
	a_spawners = getspawnerarray(self.script_killspawner, "script_killspawner");
	foreach(sp in a_spawners)
	{
		sp delete();
	}
	a_ents = getentarray(self.script_killspawner, "script_killspawner");
	foreach(ent in a_ents)
	{
		if(ent.classname === "spawn_manager" && ent != self)
		{
			ent delete();
		}
	}
}

/*
	Name: trigger_group
	Namespace: trigger
	Checksum: 0x8B0BBF46
	Offset: 0x2918
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function trigger_group(s_info)
{
	foreach(trig in getentarray(self.script_trigger_group, "script_trigger_group"))
	{
		if(trig != self)
		{
			trig delete();
		}
	}
}

/*
	Name: function_521edc64
	Namespace: trigger
	Checksum: 0x1E65D049
	Offset: 0x29D0
	Size: 0x11C
	Parameters: 3
	Flags: None
*/
function function_521edc64(ent, on_enter_payload, on_exit_payload)
{
	ent endon(#"death");
	if(!isdefined(self))
	{
		return;
	}
	var_f911c758 = self getentitynumber();
	if(ent ent_already_in(var_f911c758))
	{
		return;
	}
	add_to_ent(ent, var_f911c758);
	if(isdefined(on_enter_payload))
	{
		[[on_enter_payload]](ent);
	}
	while(isdefined(ent) && isdefined(self) && ent istouching(self))
	{
		waitframe(1);
	}
	if(isdefined(ent))
	{
		if(isdefined(on_exit_payload))
		{
			[[on_exit_payload]](ent);
		}
		remove_from_ent(ent, var_f911c758);
	}
}

/*
	Name: ent_already_in
	Namespace: trigger
	Checksum: 0xDA4CD6A7
	Offset: 0x2AF8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function ent_already_in(var_d35ff8d8)
{
	if(!isdefined(self._triggers))
	{
		return false;
	}
	if(!isdefined(self._triggers[var_d35ff8d8]))
	{
		return false;
	}
	if(!self._triggers[var_d35ff8d8])
	{
		return false;
	}
	return true;
}

/*
	Name: add_to_ent
	Namespace: trigger
	Checksum: 0x11D463A8
	Offset: 0x2B50
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function add_to_ent(ent, var_d35ff8d8)
{
	if(!isdefined(ent._triggers))
	{
		ent._triggers = [];
	}
	ent._triggers[var_d35ff8d8] = 1;
}

/*
	Name: remove_from_ent
	Namespace: trigger
	Checksum: 0x50F73123
	Offset: 0x2B98
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function remove_from_ent(ent, var_d35ff8d8)
{
	if(!isdefined(ent._triggers))
	{
		return;
	}
	if(!isdefined(ent._triggers[var_d35ff8d8]))
	{
		return;
	}
	ent._triggers[var_d35ff8d8] = 0;
}

/*
	Name: trigger_wait
	Namespace: trigger
	Checksum: 0x36B9C8BE
	Offset: 0x2BF0
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function trigger_wait()
{
	self endon(#"trigger");
	if(isdefined(self.targetname))
	{
		trig = getent(self.targetname, "target");
		if(isdefined(trig))
		{
			trig wait_till();
		}
	}
}

/*
	Name: run
	Namespace: trigger
	Checksum: 0xF1D4FE50
	Offset: 0x2C68
	Size: 0x114
	Parameters: 2
	Flags: Variadic
*/
function run(func, ...)
{
	var_3bdd90c2 = 0;
	if(isdefined(self.targetname))
	{
		foreach(trig in getentarraybytype(20))
		{
			if(trig.target === self.targetname)
			{
				trig callback::on_trigger(&function_996dfbe2, undefined, self, func, vararg);
				var_3bdd90c2 = 1;
			}
		}
	}
	if(!var_3bdd90c2)
	{
		util::single_thread_argarray(self, func, vararg);
	}
}

/*
	Name: function_996dfbe2
	Namespace: trigger
	Checksum: 0x3B25DC41
	Offset: 0x2D88
	Size: 0x3C
	Parameters: 4
	Flags: Linked
*/
function function_996dfbe2(s_info, ent, func, a_args)
{
	util::single_func_argarray(ent, func, a_args);
}

