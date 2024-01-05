#using script_7e3221b6c80d8cc4;
#using script_1883fa4e60abbf9f;
#using script_3ad66e3076c279ab;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace event;

/*
	Name: scalevolume
	Namespace: event
	Checksum: 0xC897F9B3
	Offset: 0x288
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

#namespace stealth_event;

/*
	Name: event_init_entity
	Namespace: stealth_event
	Checksum: 0x934C9D73
	Offset: 0x2A8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function event_init_entity()
{
	self thread event_listener_thread();
	self event_entity_core_set_enabled(1);
}

/*
	Name: event_entity_core_set_enabled
	Namespace: stealth_event
	Checksum: 0xFFF8E0E3
	Offset: 0x2E8
	Size: 0x276
	Parameters: 1
	Flags: Linked
*/
function event_entity_core_set_enabled(enabled)
{
	if(!isdefined(level.stealth.core_events))
	{
		level.stealth.core_events = [9:"silenced_shot", 8:"projectile_impact", 7:"gunshot_teammate", 6:"gunshot", 5:"footstep_walk", 4:"footstep_sprint", 3:"footstep_run", 2:"footstep", 1:"explode", 0:"bulletwhizby"];
	}
	if(enabled && !is_true(self.stealth.var_6b368eb9))
	{
		foreach(eventname in level.stealth.core_events)
		{
			self addsentienteventlistener(eventname);
		}
		self.stealth.var_6b368eb9 = 1;
	}
	else if(!enabled && is_true(self.stealth.var_6b368eb9))
	{
		foreach(eventname in level.stealth.core_events)
		{
			self removesentienteventlistener(eventname);
		}
		self.stealth.var_6b368eb9 = undefined;
	}
}

/*
	Name: event_init_level
	Namespace: stealth_event
	Checksum: 0x40138D8
	Offset: 0x568
	Size: 0x484
	Parameters: 0
	Flags: Linked
*/
function event_init_level()
{
	if(!isdefined(level.stealth.event_priority))
	{
		level.stealth.event_priority = [];
	}
	level.stealth.event_priority["investigate"] = 0;
	level.stealth.event_priority["cover_blown"] = 1;
	level.stealth.event_priority["combat"] = 2;
	level.var_b19e4f0a = &event_broadcast_axis;
	level namespace_979752dc::set_stealth_func("broadcast", &event_broadcast_generic);
	event_severity_set("investigate", "footstep", 15, 0.07);
	event_severity_set("investigate", "footstep_sprint", 10, 0.1);
	event_severity_set("investigate", "unresponsive_teammate", 20, 0.05);
	event_severity_set("investigate", "window_open", 0, 0.2);
	event_severity_set("investigate", "ally_hurt_peripheral", 0, 0.1);
	event_severity_set("cover_blown", "sight", 2, 0.45);
	event_severity_set("cover_blown", "saw_corpse", 0, 0.3);
	event_severity_set("cover_blown", "found_corpse", 0, 0.3);
	event_severity_set("cover_blown", "thrown_projectile_impact", 6, 0.15);
	event_severity_set("cover_blown", "silenced_shot", 5, 0.23);
	event_severity_set("cover_blown", "explode", 2, 0.8);
	event_severity_set("cover_blown", "seek_backup", 0, 0);
	event_severity_set("cover_blown", "glass_destroyed", 2, 0.5);
	event_severity_set("cover_blown", "light_killed", 3, 0.4);
	event_severity_set("cover_blown", "door_bash", 4, 0.4);
	event_severity_set("combat", "bulletwhizby");
	event_severity_set("combat", "gunshot");
	event_severity_set("combat", "gunshot_teammate");
	event_severity_set("combat", "projectile_impact");
	event_severity_set("combat", "attack");
	event_severity_set("combat", "damage");
	event_severity_set("combat", "proximity");
	event_severity_set("combat", "ally_damaged");
	event_severity_set("combat", "ally_killed");
}

/*
	Name: event_severity_compare
	Namespace: stealth_event
	Checksum: 0xB7BE3A63
	Offset: 0x9F8
	Size: 0xFE
	Parameters: 2
	Flags: Linked
*/
function event_severity_compare(var_86dfea16, var_3ec8d9e9)
{
	/#
		assert(isdefined(level.stealth));
	#/
	/#
		assert(isdefined(level.stealth.event_priority));
	#/
	/#
		assert(isdefined(level.stealth.event_priority[var_86dfea16]));
	#/
	/#
		assert(isdefined(level.stealth.event_priority[var_3ec8d9e9]));
	#/
	result = level.stealth.event_priority[var_86dfea16] - level.stealth.event_priority[var_3ec8d9e9];
	return result;
}

/*
	Name: event_severity_shift
	Namespace: stealth_event
	Checksum: 0x97AA7E5
	Offset: 0xB00
	Size: 0x142
	Parameters: 2
	Flags: Linked
*/
function event_severity_shift(severity, direction)
{
	/#
		assert(isdefined(level.stealth));
	#/
	/#
		assert(isdefined(level.stealth.event_priority));
	#/
	/#
		assert(isdefined(level.stealth.event_priority[severity]));
	#/
	priority = level.stealth.event_priority[severity] + direction;
	foreach(var_64cba2ea, var_7b0f2b7f in level.stealth.event_priority)
	{
		if(var_7b0f2b7f == priority)
		{
			return var_64cba2ea;
		}
	}
	return severity;
}

/*
	Name: event_severity_set
	Namespace: stealth_event
	Checksum: 0x68254706
	Offset: 0xC50
	Size: 0x1AC
	Parameters: 5
	Flags: Linked
*/
function event_severity_set(severity, eventname, escalation, var_4cca9730, var_af2ae264)
{
	/#
		assert(!(severity == "" && isdefined(var_af2ae264)));
	#/
	/#
		assert(!(severity == "" && isdefined(escalation)));
	#/
	if(!isdefined(escalation))
	{
		escalation = 0;
	}
	if(!isdefined(var_4cca9730))
	{
		var_4cca9730 = 0;
	}
	if(!isdefined(level.stealth.event_severity))
	{
		level.stealth.event_severity = [];
	}
	if(!isdefined(level.stealth.event_escalation))
	{
		level.stealth.event_escalation = [];
	}
	if(!isdefined(level.stealth.event_escalation_scalars))
	{
		level.stealth.event_escalation_scalars = [];
	}
	if(!isdefined(level.stealth.event_escalation_to_combat))
	{
		level.stealth.event_escalation_to_combat = [];
	}
	level.stealth.event_severity[eventname] = severity;
	level.stealth.event_escalation[eventname] = escalation;
	level.stealth.event_escalation_scalars[eventname] = var_4cca9730;
	level.stealth.event_escalation_to_combat[eventname] = var_af2ae264;
}

/*
	Name: event_severity_get
	Namespace: stealth_event
	Checksum: 0x109945F8
	Offset: 0xE08
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function event_severity_get(eventname)
{
	/#
		assert(isdefined(level.stealth.event_severity));
	#/
	return level.stealth.event_severity[eventname];
}

/*
	Name: event_escalation_get
	Namespace: stealth_event
	Checksum: 0x2DBC77D0
	Offset: 0xE60
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function event_escalation_get(eventname)
{
	/#
		assert(isdefined(level.stealth.event_escalation));
	#/
	return level.stealth.event_escalation[eventname];
}

/*
	Name: event_escalation_scalar_get
	Namespace: stealth_event
	Checksum: 0x96046909
	Offset: 0xEB8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function event_escalation_scalar_get(eventname)
{
	/#
		assert(isdefined(level.stealth.event_escalation_scalars));
	#/
	return level.stealth.event_escalation_scalars[eventname];
}

/*
	Name: event_escalation_to_combat_get
	Namespace: stealth_event
	Checksum: 0x811F0A92
	Offset: 0xF10
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function event_escalation_to_combat_get(eventname)
{
	/#
		assert(isdefined(level.stealth.event_escalation_to_combat));
	#/
	return level.stealth.event_escalation_to_combat[eventname];
}

/*
	Name: event_escalation_clear
	Namespace: stealth_event
	Checksum: 0x172FAE52
	Offset: 0xF68
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function event_escalation_clear()
{
	self.stealth.event_escalation_count = undefined;
	self.stealth.event_escalation_scalar = 0;
}

/*
	Name: event_listener_thread
	Namespace: stealth_event
	Checksum: 0x987F84EB
	Offset: 0xFA0
	Size: 0x6E6
	Parameters: 0
	Flags: Linked
*/
function event_listener_thread()
{
	self notify(#"event_listener_thread");
	self endon(#"event_listener_thread");
	self endon(#"death");
	while(true)
	{
		self flag::wait_till("stealth_enabled");
		var_7f729179 = undefined;
		var_7f729179 = self waittill(#"hash_6db2b95877884141");
		waittillframeend();
		if(!self flag::get("stealth_enabled"))
		{
			continue;
		}
		if(self.ignoreall || self isragdoll())
		{
			continue;
		}
		foreach(event in var_7f729179.events)
		{
			if(!isdefined(event.entity))
			{
				continue;
			}
			if(issentient(event.entity) && (event.entity.ignoreme || is_true(event.entity isnotarget())))
			{
				continue;
			}
			event.typeorig = event.type;
			if(event.type == "projectile_impact")
			{
				if(function_961c59a4(event))
				{
					event.type = "thrown_projectile_impact";
				}
				if(isdefined(event.entity.owner))
				{
					event.entity = event.entity.owner;
				}
			}
			event.receiver = self;
			var_33a263c4 = event_severity_get(event.type);
			escalation = undefined;
			var_4cca9730 = undefined;
			var_af2ae264 = undefined;
			if(isdefined(var_33a263c4))
			{
				if(!isdefined(self.disableescalation) && var_33a263c4 != "combat")
				{
					escalation = event_escalation_get(event.type);
					var_4cca9730 = event_escalation_scalar_get(event.type);
					var_af2ae264 = event_escalation_to_combat_get(event.type);
					if(escalation > 0)
					{
						if(!isdefined(self.stealth.event_escalation_count))
						{
							self.stealth.event_escalation_count = [];
						}
						if(!isdefined(self.stealth.event_escalation_count[event.type]))
						{
							self.stealth.event_escalation_count[event.type] = 0;
						}
						if(isdefined(var_af2ae264) && (self.stealth.event_escalation_count[event.type] + 1) >= var_af2ae264)
						{
							var_33a263c4 = event_severity_shift(var_33a263c4, 2);
						}
						else
						{
							if((self.stealth.event_escalation_count[event.type] + 1) >= escalation)
							{
								var_33a263c4 = event_severity_shift(var_33a263c4, 1);
							}
							else if((self.stealth.event_escalation_scalar + var_4cca9730) >= 1)
							{
								var_33a263c4 = event_severity_shift(var_33a263c4, 1);
							}
						}
					}
				}
				event.type = var_33a263c4;
			}
			var_b3f16b56 = self namespace_b2b86d39::stealth_call(event.type, event);
			if(is_true(var_b3f16b56) && isdefined(escalation) && event.type != "combat")
			{
				if(escalation > 0)
				{
					if(!isdefined(self.stealth.event_escalation_count))
					{
						self.stealth.event_escalation_count = [];
					}
					if(!isdefined(self.stealth.event_escalation_count[event.typeorig]))
					{
						self.stealth.event_escalation_count[event.typeorig] = 0;
					}
					self.stealth.event_escalation_count[event.typeorig]++;
				}
				self.stealth.event_escalation_scalar = self.stealth.event_escalation_scalar + var_4cca9730;
			}
			/#
				typeorig = "";
				if(isdefined(event.typeorig))
				{
					typeorig = ("" + (ishash(event.typeorig) ? function_9e72a96(event.typeorig) : event.typeorig)) + "";
				}
				event_str = ("" + (ishash(event.type) ? function_9e72a96(event.type) : event.type)) + typeorig;
				if(isdefined(var_b3f16b56) && !var_b3f16b56)
				{
					event_str = event_str + "";
				}
				self thread stealth_debug::function_314b7255(event_str, (1, 1, 1), 1, 0.5, vectorscale((0, 0, 1), 40), 4);
				self.stealth.ai_event = event.type;
			#/
		}
	}
}

/*
	Name: event_broadcast_axis
	Namespace: stealth_event
	Checksum: 0x8385D3A5
	Offset: 0x1690
	Size: 0x2E8
	Parameters: 5
	Flags: Linked
*/
function event_broadcast_axis(eventtype, var_fafdc97e, enemy, var_b2a2de70, var_a3dc7b53)
{
	ais = getactorteamarray(self.team);
	var_1e5aa1c5 = sqr(var_b2a2de70);
	var_1cd11ac7 = sqr(var_a3dc7b53);
	foreach(ai in ais)
	{
		if(!isalive(ai))
		{
			continue;
		}
		if(ai == self)
		{
			continue;
		}
		if(!isdefined(ai.stealth))
		{
			continue;
		}
		broadcast = 0;
		distsq = distancesquared(ai.origin, self.origin);
		if(distsq <= var_1e5aa1c5)
		{
			broadcast = self util::has_tac_vis(ai);
		}
		if(!broadcast && distsq <= var_1cd11ac7)
		{
			if(ai namespace_979752dc::is_visible(self) || ai namespace_979752dc::is_visible(enemy))
			{
				broadcast = 1;
			}
		}
		if(!isdefined(ai.fnisinstealthcombat) || ai [[ai.fnisinstealthcombat]]())
		{
			if(broadcast)
			{
				ai getenemyinfo(enemy);
			}
			continue;
		}
		if(broadcast)
		{
			if(ai lastknowntime(enemy) == 0)
			{
				ai function_a3fcf9e0(eventtype, enemy, self.origin);
			}
			else
			{
				ai function_a3fcf9e0(eventtype, enemy, enemy.origin);
			}
			continue;
		}
		if(ai canseeperipheral(self))
		{
			ai function_a3fcf9e0(var_fafdc97e, enemy, self.origin);
		}
	}
}

/*
	Name: event_broadcast_generic
	Namespace: stealth_event
	Checksum: 0xA07813B7
	Offset: 0x1980
	Size: 0x170
	Parameters: 4
	Flags: Linked
*/
function event_broadcast_generic(eventtype, var_ef1d27a1, var_82ca3ad4, var_d3429c8c)
{
	ais = getactorteamarray("axis", "team3");
	if(!isdefined(var_d3429c8c))
	{
		var_d3429c8c = getplayers()[0];
	}
	var_1e5aa1c5 = sqr(var_82ca3ad4);
	foreach(ai in ais)
	{
		if(!isalive(ai))
		{
			continue;
		}
		if(!isdefined(ai.stealth))
		{
			continue;
		}
		if(distancesquared(ai.origin, var_ef1d27a1) <= var_1e5aa1c5)
		{
			ai function_a3fcf9e0(eventtype, var_d3429c8c, var_ef1d27a1);
		}
	}
}

/*
	Name: event_broadcast_axis_by_tacsight
	Namespace: stealth_event
	Checksum: 0xF9900327
	Offset: 0x1AF8
	Size: 0x1F0
	Parameters: 7
	Flags: None
*/
function event_broadcast_axis_by_tacsight(eventtype, enemy, var_ef1d27a1, var_82ca3ad4, var_c5108979, var_a2b0f54d, var_683e4bdc)
{
	ais = getactorteamarray("axis", "team3");
	var_4ab7d8de = var_82ca3ad4 * var_82ca3ad4;
	if(!isdefined(var_c5108979))
	{
		var_c5108979 = 1;
	}
	var_ca5ecc3c = undefined;
	if(isdefined(var_683e4bdc))
	{
		var_ca5ecc3c = var_683e4bdc * var_683e4bdc;
	}
	if(!isdefined(var_a2b0f54d))
	{
		var_a2b0f54d = var_ef1d27a1;
	}
	foreach(ai in ais)
	{
		if(!isalive(ai))
		{
			continue;
		}
		if(!isdefined(ai.stealth))
		{
			continue;
		}
		var_d60e3570 = distancesquared(ai.origin, var_ef1d27a1);
		if(var_d60e3570 > var_4ab7d8de)
		{
			continue;
		}
		var_b03a913a = var_c5108979;
		if(var_c5108979 && isdefined(var_ca5ecc3c) && var_d60e3570 <= var_ca5ecc3c)
		{
			var_b03a913a = 0;
		}
		if(!ai util::has_tac_vis(var_a2b0f54d, var_b03a913a))
		{
			continue;
		}
		ai function_a3fcf9e0(eventtype, enemy, var_ef1d27a1);
	}
}

/*
	Name: event_broadcast_axis_by_sight
	Namespace: stealth_event
	Checksum: 0x1F3729F6
	Offset: 0x1CF0
	Size: 0x5C
	Parameters: 7
	Flags: None
*/
function event_broadcast_axis_by_sight(eventtype, enemy, var_ef1d27a1, var_82ca3ad4, var_c5108979, var_a2b0f54d, var_aae03dee)
{
	thread event_broadcast_axis_by_sight_thread(eventtype, enemy, var_ef1d27a1, var_82ca3ad4, var_c5108979, var_a2b0f54d, var_aae03dee);
}

/*
	Name: event_broadcast_axis_by_sight_thread
	Namespace: stealth_event
	Checksum: 0xEA37123E
	Offset: 0x1D58
	Size: 0x278
	Parameters: 7
	Flags: Linked
*/
function event_broadcast_axis_by_sight_thread(eventtype, enemy, var_ef1d27a1, var_82ca3ad4, var_c5108979, var_a2b0f54d, var_aae03dee)
{
	ais = getactorteamarray("axis", "team3");
	var_4ab7d8de = var_82ca3ad4 * var_82ca3ad4;
	if(!isdefined(var_c5108979))
	{
		var_c5108979 = 1;
	}
	if(!isdefined(var_a2b0f54d))
	{
		var_a2b0f54d = var_ef1d27a1;
	}
	var_a0229356 = 3;
	var_1389681c = 0;
	foreach(ai in ais)
	{
		if(!isalive(ai))
		{
			continue;
		}
		if(!isdefined(ai.stealth))
		{
			continue;
		}
		distsq = distancesquared(ai.origin, var_ef1d27a1);
		if(distsq > var_4ab7d8de)
		{
			continue;
		}
		if(isdefined(var_aae03dee) && distsq <= sqr(var_aae03dee))
		{
			ai function_a3fcf9e0(eventtype, enemy, var_ef1d27a1);
			continue;
		}
		if(!ai util::has_tac_vis(var_a2b0f54d, var_c5108979))
		{
			if(var_c5108979 && !ai pointinfov(var_ef1d27a1))
			{
				continue;
			}
			var_1389681c++;
			if(var_1389681c > var_a0229356)
			{
				waitframe(1);
				var_1389681c = 0;
			}
			if(!sighttracepassed(ai geteye(), var_ef1d27a1, 0, enemy))
			{
				continue;
			}
		}
		ai function_a3fcf9e0(eventtype, enemy, var_ef1d27a1);
	}
}

/*
	Name: function_961c59a4
	Namespace: stealth_event
	Checksum: 0xBDB5380F
	Offset: 0x1FD8
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_961c59a4(event)
{
	/#
		assert(event.type == "");
	#/
	if(!isdefined(event.entity.item.name))
	{
		return false;
	}
	if(event.entity.item.name == #"hatchet")
	{
		return true;
	}
	if(event.entity.item.name == #"eq_flash_grenade")
	{
		return true;
	}
	return false;
}

