#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\teleport_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace trigger_shared;

/*
	Name: function_6d5ea4eb
	Namespace: trigger_shared
	Checksum: 0xCD66A68A
	Offset: 0x218
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6d5ea4eb()
{
	level notify(126689698);
}

#namespace trigger;

/*
	Name: function_89f2df9
	Namespace: trigger
	Checksum: 0x665AFA31
	Offset: 0x238
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"trigger", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: trigger
	Checksum: 0x6BEF66DD
	Offset: 0x280
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
	Name: function_cbf8fb6b
	Namespace: trigger
	Checksum: 0x602F8469
	Offset: 0x2C8
	Size: 0xDC
	Parameters: 4
	Flags: Linked
*/
function function_cbf8fb6b(var_60ffbed2, func_handler, func_init, var_114fa26c)
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
				self callback::function_a04381e0(func_handler);
			}
			else
			{
				self callback::function_35a12f19(func_handler);
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
	Checksum: 0xF9C59C82
	Offset: 0x3B0
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
	Checksum: 0x95C8D99A
	Offset: 0x418
	Size: 0x2C4
	Parameters: 0
	Flags: Linked
*/
function trigger_think()
{
	self endon(#"death");
	function_cbf8fb6b("target", &trigger_spawner);
	function_cbf8fb6b("script_flag_true", undefined, &init_flags);
	function_cbf8fb6b("script_flag_true_any", undefined, &init_flags);
	function_cbf8fb6b("script_flag_false_any", undefined, &init_flags);
	function_cbf8fb6b("script_flag_false", undefined, &init_flags);
	function_cbf8fb6b("script_flag_set", &flag_set_trigger, &init_flags);
	function_cbf8fb6b("script_flag_clear", &flag_clear_trigger, &init_flags);
	function_cbf8fb6b("script_trigger_group", &trigger_group);
	function_cbf8fb6b("script_notify", &trigger_notify);
	function_cbf8fb6b("script_killspawner", &kill_spawner_trigger);
	function_cbf8fb6b("script_teleport_location", &teleport::team);
	function_cbf8fb6b(&is_trigger_once, &trigger_once);
	if(isdefined(self.script_flag_set_on_touching) || isdefined(self.script_flag_set_on_not_touching))
	{
		level thread script_flag_set_touching(self);
	}
	if(is_look_trigger())
	{
		level thread look_trigger(self);
		s_info = undefined;
		s_info = self waittill(#"trigger_look");
		self thread callback::function_6eb09118(s_info, 1);
	}
}

/*
	Name: add_flags
	Namespace: trigger
	Checksum: 0x6AF1A29D
	Offset: 0x6E8
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
	Checksum: 0xD28EF4ED
	Offset: 0x740
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
	Checksum: 0x7D289733
	Offset: 0x910
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
	Checksum: 0x45FCFE51
	Offset: 0xB28
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
	Checksum: 0x664C0D54
	Offset: 0xC50
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
	Checksum: 0xC57758E1
	Offset: 0xCB8
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
	Checksum: 0xACCBAE2E
	Offset: 0xD98
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
	Checksum: 0x73B7A577
	Offset: 0xE20
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function flag_set_trigger()
{
	var_af1bea51 = util::create_flags_and_return_tokens(self.script_flag_set);
	foreach(str_flag in var_af1bea51)
	{
		level flag::set(str_flag);
	}
}

/*
	Name: flag_clear_trigger
	Namespace: trigger
	Checksum: 0x8D8C83A0
	Offset: 0xED0
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function flag_clear_trigger(s_info)
{
	var_af1bea51 = util::create_flags_and_return_tokens(self.script_flag_clear);
	foreach(str_flag in var_af1bea51)
	{
		level flag::clear(str_flag);
	}
}

/*
	Name: add_tokens_to_trigger_flags
	Namespace: trigger
	Checksum: 0xDECB7164
	Offset: 0xF88
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
	Checksum: 0xC2B06DF2
	Offset: 0x1098
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
	Checksum: 0xBE63BDE8
	Offset: 0x1220
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
	Checksum: 0xE236CFDD
	Offset: 0x1298
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
	Checksum: 0xB975432D
	Offset: 0x1498
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
	Checksum: 0x15669E06
	Offset: 0x14E8
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
	Checksum: 0x7AD2B871
	Offset: 0x1560
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
	Checksum: 0x24814820
	Offset: 0x1610
	Size: 0xE8
	Parameters: 1
	Flags: Linked, Variadic
*/
function get_all(...)
{
	if(vararg.size == 1 && isarray(vararg[0]))
	{
		var_b00e97e6 = vararg[0];
	}
	else
	{
		var_b00e97e6 = vararg;
	}
	a_all = getentarraybytype(20);
	if(var_b00e97e6.size)
	{
		for(i = a_all.size - 1; i >= 0; i--)
		{
			if(!isinarray(var_b00e97e6, a_all[i].classname))
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
	Checksum: 0x8C662510
	Offset: 0x1700
	Size: 0x72
	Parameters: 1
	Flags: Linked, Variadic
*/
function is_trigger_of_type(...)
{
	if(vararg.size == 1 && isarray(vararg[0]))
	{
		var_b00e97e6 = vararg[0];
	}
	else
	{
		var_b00e97e6 = vararg;
	}
	return isinarray(var_b00e97e6, self.classname);
}

/*
	Name: wait_till
	Namespace: trigger
	Checksum: 0xB217081E
	Offset: 0x1780
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
	Checksum: 0xE7DAADBA
	Offset: 0x1938
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
	Checksum: 0x6E2A3A32
	Offset: 0x1BB8
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
	Checksum: 0x3C62A02E
	Offset: 0x1C50
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
	Checksum: 0x8306F269
	Offset: 0x1DD8
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
	Checksum: 0x2F02FEFE
	Offset: 0x1E70
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
	Checksum: 0x73076252
	Offset: 0x20B8
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
	Checksum: 0xCF74BA63
	Offset: 0x2108
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
	Checksum: 0xEFA246AC
	Offset: 0x2158
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
	Checksum: 0xFEC46A0B
	Offset: 0x22F8
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
	Checksum: 0x6103C7FA
	Offset: 0x2340
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
	Checksum: 0xB37AFA2B
	Offset: 0x23A8
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
	Checksum: 0x32721877
	Offset: 0x2438
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
	Checksum: 0x79CFA997
	Offset: 0x2538
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
	Checksum: 0xBFF9F15B
	Offset: 0x25F0
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
	Checksum: 0xF5692A8C
	Offset: 0x2630
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
	Checksum: 0x92334B01
	Offset: 0x26B0
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
	Checksum: 0xF74B288A
	Offset: 0x27A8
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
	Checksum: 0xD821BDF
	Offset: 0x2938
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
	Checksum: 0xEA36A3F6
	Offset: 0x29F0
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
	Checksum: 0x4AB6471A
	Offset: 0x2B18
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
	Checksum: 0x1EF5ED75
	Offset: 0x2B70
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
	Checksum: 0x421D8D35
	Offset: 0x2BB8
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
	Checksum: 0x65EE0BEC
	Offset: 0x2C10
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
	Checksum: 0x80DB8896
	Offset: 0x2C88
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
				trig callback::function_35a12f19(&function_996dfbe2, undefined, self, func, vararg);
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
	Checksum: 0x582D8E76
	Offset: 0x2DA8
	Size: 0x3C
	Parameters: 4
	Flags: Linked
*/
function function_996dfbe2(s_info, ent, func, a_args)
{
	util::single_func_argarray(ent, func, a_args);
}

