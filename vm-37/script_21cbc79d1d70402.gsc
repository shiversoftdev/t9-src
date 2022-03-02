#using script_1883fa4e60abbf9f;
#using script_7e3221b6c80d8cc4;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace player;

/*
	Name: scalevolume
	Namespace: player
	Checksum: 0x1D6EAD3E
	Offset: 0x1E8
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

#namespace stealth_player;

/*
	Name: main
	Namespace: stealth_player
	Checksum: 0xF3DF9F68
	Offset: 0x208
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function main()
{
	if(isdefined(self.stealth))
	{
		return;
	}
	self endon(#"death");
	self endon(#"hash_6de499574267aed9");
	self.stealth = spawnstruct();
	self.stealth.var_103386e8 = self namespace_979752dc::group_flag_init("stealth_spotted");
	self flag::init("stealth_enabled");
	self flag::set("stealth_enabled");
	self flag::init("stealth_use_real_lighting");
	self flag::set("stealth_use_real_lighting");
	self.stealth.spotted_list = [];
	self namespace_979752dc::group_add();
	self thread maxvisibility_thread();
	if(sessionmodeiscampaigngame())
	{
		self thread stealthhints_thread();
	}
	/#
		self thread stealth_debug::debug_player();
	#/
}

/*
	Name: maxvisibility_thread
	Namespace: stealth_player
	Checksum: 0xAAA3789
	Offset: 0x388
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function maxvisibility_thread()
{
	self endon(#"death");
	self endon(#"disconnect");
	while(true)
	{
		if(self maxvisibility_shouldupdate())
		{
			self.maxvisibledist = self get_detect_range();
		}
		waitframe(1);
	}
}

/*
	Name: maxvisibility_shouldupdate
	Namespace: stealth_player
	Checksum: 0x68314971
	Offset: 0x400
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function maxvisibility_shouldupdate()
{
	if(is_true(self.maxvisibiltyupdate_disabled))
	{
		return false;
	}
	if(!self flag::get("stealth_enabled"))
	{
		return false;
	}
	if(self flag::get("stealth_in_shadow"))
	{
		return true;
	}
	if(isdefined(self.lightmeterdelay) && gettime() < self.lightmeterdelay)
	{
		return false;
	}
	return true;
}

/*
	Name: get_detect_range
	Namespace: stealth_player
	Checksum: 0xCF551584
	Offset: 0x498
	Size: 0x18A
	Parameters: 0
	Flags: Linked
*/
function get_detect_range()
{
	stance = self getstance();
	if(self namespace_979752dc::group_spotted_flag())
	{
		detection = "spotted";
	}
	else
	{
		detection = "hidden";
	}
	range = level.stealth.detect.range[detection][stance];
	if(self flag::get("stealth_in_shadow"))
	{
		range = range * level.stealth.detect.range[detection][#"shadow"];
		range = max(range, level.stealth.detect.minrangedarkness[detection][stance]);
	}
	if(isdefined(self.stealth.var_f6c2537d) && self.stealth.var_f6c2537d.size > 0)
	{
		range = max(range, (isdefined(self.var_1c936867) ? self.var_1c936867 : 850));
	}
	return range;
}

/*
	Name: combatstate_thread
	Namespace: stealth_player
	Checksum: 0xDFFDB7BE
	Offset: 0x630
	Size: 0x688
	Parameters: 1
	Flags: None
*/
function combatstate_thread(enabled)
{
	if(!isdefined(enabled))
	{
		enabled = 1;
	}
	if(!enabled)
	{
		self notify(#"hash_4330b0368e7f1373");
		self.stealth.combatstate = undefined;
		return;
	}
	if(isdefined(self.stealth.combatstate))
	{
		return;
	}
	self endon(#"death");
	self endon(#"hash_6de499574267aed9");
	self endon(#"hash_4330b0368e7f1373");
	self endon(#"disconnect");
	self thread playerattackedmonitor();
	self thread combatstate_updatethread();
	self.stealth.combatstate = spawnstruct();
	self.stealth.combatstate.name = "stealth";
	self.stealth.combatstate.type = "idle";
	self.stealth.combatstate.updatefuncs = [];
	var_e8c14f37 = [];
	var_41b7c5cb = [];
	while(true)
	{
		self flag::wait_till("stealth_enabled");
		arrayremovevalue(var_e8c14f37, undefined);
		function_1eaaceab(var_e8c14f37);
		arrayremovevalue(var_41b7c5cb, undefined);
		function_1eaaceab(var_41b7c5cb);
		var_2034f2e1 = [];
		var_a1a15b6c = [];
		var_a01740d6 = 0;
		if(isdefined(self.lastattackedtime) && !util::time_has_passed(self.lastattackedtime, 10))
		{
			var_a01740d6 = 1;
		}
		foreach(enemy in getactorteamarray("axis"))
		{
			if(!isalive(enemy))
			{
				continue;
			}
			if(!array::contains(var_e8c14f37, enemy))
			{
				if(!isalive(enemy))
				{
					continue;
				}
				if(enemy.script === "pain")
				{
					continue;
				}
			}
			if(!isdefined(enemy.fnisinstealthcombat) || enemy [[enemy.fnisinstealthcombat]]())
			{
				if(isdefined(self.stealth.combatstate.maxcombatdist))
				{
					dist = self.stealth.combatstate.maxcombatdist;
					if(distancesquared(self.origin, enemy.origin) > sqr(dist))
					{
						var_a1a15b6c[var_a1a15b6c.size] = enemy;
						continue;
					}
				}
				var_2034f2e1[var_2034f2e1.size] = enemy;
				if(var_a01740d6)
				{
					continue;
				}
				if(enemy.enemy !== self)
				{
					continue;
				}
				if(enemy cansee(self))
				{
					var_a01740d6 = 1;
				}
				continue;
			}
			if(enemy [[enemy.fnisinstealthhunt]]())
			{
				var_a1a15b6c[var_a1a15b6c.size] = enemy;
			}
		}
		lastname = self.stealth.combatstate.name;
		lasttype = self.stealth.combatstate.type;
		name = lastname;
		type = undefined;
		if(lastname == "combat")
		{
			if(var_2034f2e1.size == 0)
			{
				name = "stealth";
				if(arrayintersect(var_e8c14f37, var_a1a15b6c).size > 0)
				{
					type = "hunt";
				}
				else
				{
					if(var_a1a15b6c.size == 0)
					{
						type = "all_clear";
					}
					else
					{
						type = "combat_clear";
					}
				}
			}
			else if(lasttype === "unaware" && var_a01740d6)
			{
				type = "aware";
			}
		}
		else
		{
			if(var_2034f2e1.size > 0)
			{
				name = "combat";
				if(var_a01740d6)
				{
					type = "aware";
				}
				else
				{
					type = "unaware";
				}
			}
			else if(lasttype === "hunt" && var_a1a15b6c.size == 0)
			{
				type = "all_clear";
			}
		}
		if(name != lastname || (isdefined(type) && type !== lasttype))
		{
			self.stealth.combatstate.name = name;
			self.stealth.combatstate.type = type;
			self notify(#"hash_ec8c1a398bebc57", {#type:type, #name:name});
		}
		var_e8c14f37 = var_2034f2e1;
		var_41b7c5cb = var_a1a15b6c;
		waitframe(1);
	}
}

/*
	Name: combatstate_updatethread
	Namespace: stealth_player
	Checksum: 0x2E35E272
	Offset: 0xCC0
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function combatstate_updatethread()
{
	while(true)
	{
		result = undefined;
		result = self waittill(#"hash_ec8c1a398bebc57");
		foreach(func in self.stealth.combatstate.updatefuncs)
		{
			self thread [[func]](result.name, result.type);
		}
	}
}

/*
	Name: combatstate_addupdatefunc
	Namespace: stealth_player
	Checksum: 0x8983DC2D
	Offset: 0xDA0
	Size: 0x110
	Parameters: 2
	Flags: None
*/
function combatstate_addupdatefunc(key, func)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(self.stealth));
	#/
	/#
		assert(isdefined(self.stealth.combatstate));
	#/
	/#
		assert(isdefined(key), "");
	#/
	/#
		assert(!isdefined(self.stealth.combatstate.updatefuncs[key]), ("" + key) + "");
	#/
	self.stealth.combatstate.updatefuncs[key] = func;
}

/*
	Name: combatstate_removeupdatefunc
	Namespace: stealth_player
	Checksum: 0x37C56E71
	Offset: 0xEB8
	Size: 0x100
	Parameters: 1
	Flags: None
*/
function combatstate_removeupdatefunc(key)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(self.stealth));
	#/
	/#
		assert(isdefined(self.stealth.combatstate));
	#/
	/#
		assert(isdefined(key), "");
	#/
	/#
		assert(isdefined(self.stealth.combatstate.updatefuncs[key]), ("" + key) + "");
	#/
	self.stealth.combatstate.updatefuncs[key] = undefined;
}

/*
	Name: playerattackedmonitor
	Namespace: stealth_player
	Checksum: 0x5332FDE6
	Offset: 0xFC0
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function playerattackedmonitor()
{
	while(true)
	{
		level waittill(#"an_enemy_shot", #"hash_58419cfa256da59b");
		self.lastattackedtime = gettime();
	}
}

/*
	Name: stealthhints_thread
	Namespace: stealth_player
	Checksum: 0x4984B6C2
	Offset: 0x1010
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function stealthhints_thread()
{
	self endon(#"hash_6de499574267aed9");
	self.stealth.hints = spawnstruct();
	self.stealth.hints.causeofdeath = undefined;
	self.stealth.hints.investigators = [];
	self.stealth.hints.deathhints[#"hash_1d42f8a3b0f3b508"] = 6;
	self.stealth.hints.deathhints[#"gunshot"] = 8;
	self.stealth.hints.deathhints[#"hash_1041a2916f3a6632"] = 16;
	self.stealth.hints.deathhints[#"hash_5eaab7f613ca2883"] = 19;
	self thread stealthhints_eventmonitor();
	self thread stealthhints_deathmonitor();
	self thread stealthhints_combatmonitor();
}

/*
	Name: stealthhints_eventmonitor
	Namespace: stealth_player
	Checksum: 0x306B923
	Offset: 0x1170
	Size: 0x410
	Parameters: 0
	Flags: Linked
*/
function stealthhints_eventmonitor()
{
	self endon(#"death");
	while(true)
	{
		self flag::wait_till("stealth_enabled");
		var_7f729179 = undefined;
		var_7f729179 = level waittill(#"stealth_event");
		event = var_7f729179.event;
		receiver = var_7f729179.receiver;
		if(!isalive(receiver))
		{
			continue;
		}
		if(event.entity !== getplayers()[0])
		{
			continue;
		}
		if(!self flag::get("stealth_enabled"))
		{
			self.stealth.hints.causeofdeath = undefined;
			self.stealth.hints.investigators = [];
			continue;
		}
		if(namespace_979752dc::any_groups_in_combat())
		{
			if(event.type != "combat")
			{
				continue;
			}
			var_f2013641 = 0;
			foreach(guy in getactorteamarray(receiver.team))
			{
				if(guy == receiver)
				{
					continue;
				}
				if(!isdefined(guy.fnisinstealthcombat) || guy [[guy.fnisinstealthcombat]]())
				{
					var_f2013641 = 1;
					break;
				}
			}
			if(var_f2013641)
			{
				continue;
			}
		}
		eventtype = event.typeorig;
		if(eventtype == "gunshot" && !is_true(level.hassuppressedweapons))
		{
			continue;
		}
		if(eventtype == "sight" || eventtype == "proximity" && self issprinting())
		{
			eventtype = "footstep_sprint";
		}
		else
		{
			if(eventtype == "proximity" && lengthsquared((getplayers()[0] getvelocity()[0], getplayers()[0] getvelocity()[1], 0)) > 11025)
			{
				eventtype = "proximity_speed";
			}
			else if(eventtype == "sight" && self getstance() == "stand")
			{
				eventtype = "sight_standing";
			}
		}
		if(!isdefined(self.stealth.hints.deathhints[eventtype]))
		{
			continue;
		}
		if(array::contains(self.stealth.hints.investigators, receiver))
		{
			continue;
		}
		self thread stealthhints_aimonitor(receiver, eventtype);
	}
}

/*
	Name: stealthhints_aimonitor
	Namespace: stealth_player
	Checksum: 0xFD278999
	Offset: 0x1588
	Size: 0x216
	Parameters: 2
	Flags: Linked
*/
function stealthhints_aimonitor(ai, eventtype)
{
	self endon(#"hash_1623034e40340573");
	self endon(#"stealth_enabled");
	self.stealth.hints.investigators[self.stealth.hints.investigators.size] = ai;
	if(ai [[ai.fnisinstealthhunt]]())
	{
		ai util::delay(10, array("combat_started", "stealth_enabled"), &util::send_notify, "stealthHints_timeout");
		ai waittill(#"stealth_combat", #"death", #"hash_1b2a8b7fa7e73d9a");
	}
	else if(ai [[ai.fnisinstealthinvestigate]]())
	{
		ai waittill(#"hash_32b0a9d6ca03306f", #"stealth_combat", #"death");
	}
	arrayremovevalue(self.stealth.hints.investigators, ai);
	if(!isalive(ai) || (isdefined(ai.fnisinstealthcombat) && !ai [[ai.fnisinstealthcombat]]()))
	{
		return;
	}
	self.stealth.hints.causeofdeath = eventtype;
	self.stealth.hints.investigators = [];
	self notify(#"hash_1623034e40340573");
}

/*
	Name: stealthhints_deathmonitor
	Namespace: stealth_player
	Checksum: 0x3B481F85
	Offset: 0x17A8
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function stealthhints_deathmonitor()
{
	self waittill(#"death");
	if(!self flag::get("stealth_enabled"))
	{
		return;
	}
	if(isdefined(level.custom_death_quote))
	{
		return;
	}
	if(!isdefined(self.stealth.hints.causeofdeath))
	{
		return;
	}
	level.custom_death_quote = self.stealth.hints.deathhints[self.stealth.hints.causeofdeath];
}

/*
	Name: stealthhints_combatmonitor
	Namespace: stealth_player
	Checksum: 0x85721E2F
	Offset: 0x1858
	Size: 0x9A
	Parameters: 0
	Flags: Linked
*/
function stealthhints_combatmonitor()
{
	self endon(#"death");
	while(true)
	{
		self flag::wait_till("stealth_enabled");
		while(!isdefined(self.stealth.hints.causeofdeath))
		{
			waitframe(1);
		}
		while(namespace_979752dc::any_groups_in_combat())
		{
			waitframe(1);
		}
		self.stealth.hints.causeofdeath = undefined;
	}
}

