#using script_59f07c660e6710a5;
#using script_4c5c4a64a59247a2;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\colors_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace ai_shared;

/*
	Name: function_154e8d93
	Namespace: ai_shared
	Checksum: 0xF4E5E3E4
	Offset: 0x3C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_154e8d93()
{
	level notify(619674278);
}

#namespace ai;

/*
	Name: set_pacifist
	Namespace: ai
	Checksum: 0x9E9BB0D2
	Offset: 0x3E0
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function set_pacifist(val)
{
	/#
		assert(issentient(self), "");
	#/
	self.pacifist = val;
}

/*
	Name: disable_pain
	Namespace: ai
	Checksum: 0x2B4A9D95
	Offset: 0x438
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function disable_pain()
{
	/#
		assert(isai(self), "");
	#/
	self.allowpain = 0;
}

/*
	Name: enable_pain
	Namespace: ai
	Checksum: 0xA02B603A
	Offset: 0x480
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function enable_pain()
{
	/#
		assert(isai(self), "");
	#/
	self.allowpain = 1;
}

/*
	Name: gun_remove
	Namespace: ai
	Checksum: 0xAF43C2E0
	Offset: 0x4D0
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function gun_remove()
{
	self shared::placeweaponon(self.weapon, "none");
	self.gun_removed = 1;
}

/*
	Name: gun_switchto
	Namespace: ai
	Checksum: 0x4D46C394
	Offset: 0x518
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function gun_switchto(weapon, whichhand)
{
	self shared::placeweaponon(weapon, whichhand);
}

/*
	Name: gun_recall
	Namespace: ai
	Checksum: 0xAD19018C
	Offset: 0x550
	Size: 0x36
	Parameters: 0
	Flags: Linked
*/
function gun_recall()
{
	self shared::placeweaponon(self.primaryweapon, "right");
	self.gun_removed = undefined;
}

/*
	Name: set_behavior_attribute
	Namespace: ai
	Checksum: 0xD0ACA1AC
	Offset: 0x590
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function set_behavior_attribute(attribute, value)
{
	if(has_behavior_attribute(attribute))
	{
		setaiattribute(self, attribute, value);
	}
}

/*
	Name: get_behavior_attribute
	Namespace: ai
	Checksum: 0xB0170380
	Offset: 0x5E8
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function get_behavior_attribute(attribute)
{
	return getaiattribute(self, attribute);
}

/*
	Name: has_behavior_attribute
	Namespace: ai
	Checksum: 0x9ACFC63
	Offset: 0x618
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function has_behavior_attribute(attribute)
{
	return hasaiattribute(self, attribute);
}

/*
	Name: is_dead_sentient
	Namespace: ai
	Checksum: 0xDACEEB06
	Offset: 0x648
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function is_dead_sentient()
{
	if(issentient(self) && !isalive(self))
	{
		return true;
	}
	return false;
}

/*
	Name: waittill_dead
	Namespace: ai
	Checksum: 0x8009EA17
	Offset: 0x698
	Size: 0x1D0
	Parameters: 3
	Flags: Linked
*/
function waittill_dead(guys, num, timeoutlength)
{
	allalive = 1;
	for(i = 0; i < guys.size; i++)
	{
		if(isalive(guys[i]))
		{
			continue;
		}
		allalive = 0;
		break;
	}
	/#
		assert(allalive, "");
	#/
	if(!allalive)
	{
		newarray = [];
		for(i = 0; i < guys.size; i++)
		{
			if(isalive(guys[i]))
			{
				newarray[newarray.size] = guys[i];
			}
		}
		guys = newarray;
	}
	ent = spawnstruct();
	if(isdefined(timeoutlength))
	{
		ent endon(#"thread_timed_out");
		ent thread waittill_dead_timeout(timeoutlength);
	}
	ent.count = guys.size;
	if(isdefined(num) && num < ent.count)
	{
		ent.count = num;
	}
	array::thread_all(guys, &waittill_dead_thread, ent);
	while(ent.count > 0)
	{
		ent waittill(#"waittill_dead guy died");
	}
}

/*
	Name: waittill_dead_or_dying
	Namespace: ai
	Checksum: 0x727AF70
	Offset: 0x870
	Size: 0x1A0
	Parameters: 4
	Flags: None
*/
function waittill_dead_or_dying(guys, num, timeoutlength, var_76f40c79)
{
	newarray = [];
	for(i = 0; i < guys.size; i++)
	{
		if(isalive(guys[i]))
		{
			newarray[newarray.size] = guys[i];
		}
	}
	guys = newarray;
	ent = spawnstruct();
	if(isdefined(timeoutlength))
	{
		ent endon(#"thread_timed_out");
		ent thread waittill_dead_timeout(timeoutlength);
	}
	ent.count = guys.size;
	if(isdefined(num) && num < ent.count)
	{
		ent.count = num;
	}
	if(is_true(var_76f40c79))
	{
		array::thread_all(guys, &function_abdc188, ent);
	}
	else
	{
		array::thread_all(guys, &waittill_dead_or_dying_thread, ent);
	}
	while(ent.count > 0)
	{
		ent waittill(#"waittill_dead_guy_dead_or_dying");
	}
}

/*
	Name: waittill_dead_thread
	Namespace: ai
	Checksum: 0x939F1ACD
	Offset: 0xA18
	Size: 0x40
	Parameters: 1
	Flags: Linked, Private
*/
function private waittill_dead_thread(ent)
{
	self waittill(#"death");
	ent.count--;
	ent notify(#"waittill_dead guy died");
}

/*
	Name: function_abdc188
	Namespace: ai
	Checksum: 0xFE186CB1
	Offset: 0xA60
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_abdc188(ent)
{
	self waittill(#"death", #"pain_death", #"in_action");
	ent.count--;
	ent notify(#"waittill_dead_guy_dead_or_dying");
}

/*
	Name: waittill_dead_or_dying_thread
	Namespace: ai
	Checksum: 0x735582BF
	Offset: 0xAC8
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function waittill_dead_or_dying_thread(ent)
{
	self waittill(#"death", #"pain_death");
	ent.count--;
	ent notify(#"waittill_dead_guy_dead_or_dying");
}

/*
	Name: waittill_dead_timeout
	Namespace: ai
	Checksum: 0x80F9E887
	Offset: 0xB20
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function waittill_dead_timeout(timeoutlength)
{
	wait(timeoutlength);
	self notify(#"thread_timed_out");
}

/*
	Name: wait_for_shoot
	Namespace: ai
	Checksum: 0x4756F52C
	Offset: 0xB50
	Size: 0x8E
	Parameters: 0
	Flags: Linked, Private
*/
function private wait_for_shoot()
{
	self endon(#"stop_shoot_at_target", #"death");
	if(isvehicle(self) || isbot(self))
	{
		self waittill(#"weapon_fired");
	}
	else
	{
		self waittill(#"shoot");
	}
	self.start_duration_comp = 1;
}

/*
	Name: shoot_at_target
	Namespace: ai
	Checksum: 0x6311DE81
	Offset: 0xBE8
	Size: 0x424
	Parameters: 6
	Flags: None
*/
function shoot_at_target(mode, target, tag, duration, sethealth, ignorefirstshotwait)
{
	/#
		assert(isdefined(self));
	#/
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death", #"stop_shoot_at_target");
	/#
		assert(isdefined(target), "");
	#/
	/#
		assert(isdefined(mode), "");
	#/
	mode_flag = mode === "normal" || mode === "shoot_until_target_dead" || mode === "kill_within_time";
	/#
		assert(mode_flag, "");
	#/
	if(isdefined(duration))
	{
		/#
			assert(duration >= 0, "");
		#/
	}
	else
	{
		duration = 0;
	}
	if(isdefined(sethealth) && isdefined(target))
	{
		target.health = sethealth;
	}
	if(!isdefined(target) || (mode === "shoot_until_target_dead" && target.health <= 0))
	{
		return;
	}
	if(isdefined(self.var_728f218b))
	{
		if(!self [[self.var_728f218b]]())
		{
			return;
		}
	}
	if(isdefined(tag) && tag != "")
	{
		self setentitytarget(target, 1, tag);
	}
	else
	{
		self setentitytarget(target, 1);
	}
	self.start_duration_comp = 0;
	switch(mode)
	{
		case "normal":
		{
			break;
		}
		case "shoot_until_target_dead":
		{
			duration = -1;
			break;
		}
		case "kill_within_time":
		{
			target damagemode("next_shot_kills");
			break;
		}
	}
	if(isvehicle(self))
	{
		self util::clearallcooldowns();
	}
	if(ignorefirstshotwait === 1)
	{
		self.start_duration_comp = 1;
	}
	else
	{
		self thread wait_for_shoot();
	}
	if(isdefined(duration) && isdefined(target) && target.health > 0)
	{
		if(duration >= 0)
		{
			elapsed = 0;
			while(isdefined(target) && target.health > 0 && elapsed <= duration)
			{
				elapsed = elapsed + 0.05;
				if(!is_true(self.start_duration_comp))
				{
					elapsed = 0;
				}
				waitframe(1);
			}
			if(isdefined(target) && mode == "kill_within_time")
			{
				self.perfectaim = 1;
				self.aim_set_by_shoot_at_target = 1;
				target waittill(#"death");
			}
		}
		else if(duration == -1)
		{
			target waittill(#"death");
		}
	}
	stop_shoot_at_target();
}

/*
	Name: stop_shoot_at_target
	Namespace: ai
	Checksum: 0x560CD931
	Offset: 0x1018
	Size: 0x7E
	Parameters: 0
	Flags: Linked
*/
function stop_shoot_at_target()
{
	self clearentitytarget();
	if(isdefined(self.var_e892f39b))
	{
		self [[self.var_e892f39b]]();
	}
	if(is_true(self.aim_set_by_shoot_at_target))
	{
		self.perfectaim = 0;
		self.aim_set_by_shoot_at_target = 0;
	}
	self notify(#"stop_shoot_at_target");
}

/*
	Name: wait_until_done_speaking
	Namespace: ai
	Checksum: 0x38420B6
	Offset: 0x10A0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function wait_until_done_speaking()
{
	self endon(#"death");
	while(self.isspeaking)
	{
		waitframe(1);
	}
}

/*
	Name: function_620eeb6b
	Namespace: ai
	Checksum: 0xD1D8D6DC
	Offset: 0x10D8
	Size: 0x48A
	Parameters: 1
	Flags: Linked
*/
function function_620eeb6b(goalent)
{
	if(is_true(self.var_8f561628))
	{
		self.var_2925fedc = undefined;
	}
	if(isdefined(goalent) && !isvec(goalent) && isdefined(goalent.script_likelyenemy))
	{
		var_4c719501 = struct::get_array(goalent.script_likelyenemy, "script_likelyenemy");
		targetent = undefined;
		var_b266f03e = "";
		if(self.team == #"allies")
		{
			var_b266f03e = "ai_likelyenemydir_allies";
		}
		else if(self.team == #"axis")
		{
			var_b266f03e = "ai_likelyenemydir_axis";
		}
		foreach(struct in var_4c719501)
		{
			if(struct.variantname === var_b266f03e)
			{
				if(isdefined(targetent))
				{
					/#
						assertmsg(("" + var_b266f03e) + "");
					#/
				}
				if(goalent == struct)
				{
					/#
						assertmsg("");
					#/
				}
				targetent = struct;
			}
		}
		foreach(struct in var_4c719501)
		{
			if(struct.variantname === "ai_likelyenemydir")
			{
				if(isdefined(targetent))
				{
					/#
						assertmsg("");
					#/
				}
				if(goalent == struct)
				{
					/#
						assertmsg("");
					#/
				}
				targetent = struct;
			}
		}
		if(!isdefined(targetent))
		{
			linkedents = getentarray(goalent.script_likelyenemy, "script_likelyenemy");
			var_666dc042 = getnodearray(goalent.script_likelyenemy, "script_likelyenemy");
			var_d1535971 = arraycombine(arraycombine(linkedents, var_666dc042), var_4c719501);
			var_2188535d = array::exclude(var_d1535971, goalent);
			if(var_2188535d.size == 1)
			{
				targetent = var_2188535d[0];
			}
			else
			{
				var_215ed720 = "";
				foreach(target in var_2188535d)
				{
					var_215ed720 = var_215ed720 + (" " + target.origin);
				}
				/#
					assertmsg("" + var_215ed720);
				#/
			}
		}
		if(!isdefined(targetent))
		{
			/#
				assertmsg("");
			#/
		}
		self.var_2925fedc = targetent.origin;
		self.var_8f561628 = 1;
	}
}

/*
	Name: function_54115a91
	Namespace: ai
	Checksum: 0x3C019AA1
	Offset: 0x1570
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function function_54115a91(goal)
{
	self function_620eeb6b(goal);
	if(isdefined(goal) && ispathnode(goal))
	{
		self.var_11b1735a = 1;
	}
}

/*
	Name: set_goal_node
	Namespace: ai
	Checksum: 0xD5AE4433
	Offset: 0x15D0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function set_goal_node(node)
{
	self setgoal(node);
	self function_54115a91(node);
}

/*
	Name: set_goal_ent
	Namespace: ai
	Checksum: 0xE38B7429
	Offset: 0x1618
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function set_goal_ent(ent)
{
	self setgoal(ent);
	self function_54115a91(ent);
}

/*
	Name: set_goal
	Namespace: ai
	Checksum: 0xAC5BA3EF
	Offset: 0x1660
	Size: 0x130
	Parameters: 3
	Flags: Linked
*/
function set_goal(value, key, b_force)
{
	if(!isdefined(key))
	{
		key = "targetname";
	}
	if(!isdefined(b_force))
	{
		b_force = 0;
	}
	goal = getnode(value, key);
	if(isdefined(goal))
	{
		self setgoal(goal, b_force);
	}
	else
	{
		goal = getent(value, key);
		if(isdefined(goal))
		{
			self setgoal(goal, b_force);
		}
		else
		{
			goal = struct::get(value, key);
			if(isdefined(goal))
			{
				self setgoal(goal.origin, b_force);
			}
		}
	}
	self function_54115a91(goal);
	return goal;
}

/*
	Name: force_goal
	Namespace: ai
	Checksum: 0xE61C83EA
	Offset: 0x1798
	Size: 0xC4
	Parameters: 5
	Flags: Linked
*/
function force_goal(goto, b_shoot, str_end_on, b_keep_colors, b_should_sprint)
{
	if(!isdefined(b_shoot))
	{
		b_shoot = 1;
	}
	if(!isdefined(b_keep_colors))
	{
		b_keep_colors = 0;
	}
	if(!isdefined(b_should_sprint))
	{
		b_should_sprint = 0;
	}
	self endon(#"death");
	s_tracker = spawnstruct();
	self thread _force_goal(s_tracker, goto, b_shoot, str_end_on, b_keep_colors, b_should_sprint);
	s_tracker waittill(#"done");
}

/*
	Name: _force_goal
	Namespace: ai
	Checksum: 0x924B4B4E
	Offset: 0x1868
	Size: 0x4E8
	Parameters: 6
	Flags: Linked
*/
function _force_goal(s_tracker, goto, b_shoot, str_end_on, b_keep_colors, b_should_sprint)
{
	if(!isdefined(b_shoot))
	{
		b_shoot = 1;
	}
	if(!isdefined(b_keep_colors))
	{
		b_keep_colors = 0;
	}
	if(!isdefined(b_should_sprint))
	{
		b_should_sprint = 0;
	}
	self endon(#"death");
	self notify(#"new_force_goal");
	flag::wait_till_clear("force_goal");
	flag::set(#"force_goal");
	color_enabled = 0;
	if(!b_keep_colors)
	{
		if(isdefined(colors::get_force_color()))
		{
			color_enabled = 1;
			self colors::disable();
		}
	}
	allowpain = self.allowpain;
	ignoresuppression = self.ignoresuppression;
	grenadeawareness = self.grenadeawareness;
	if(!b_shoot)
	{
		self val::set(#"ai_forcegoal", "ignoreall", 1);
	}
	else if(self has_behavior_attribute("move_mode"))
	{
		var_a5151bf = self get_behavior_attribute("move_mode");
		self set_behavior_attribute("move_mode", "rambo");
	}
	if(b_should_sprint && self has_behavior_attribute("sprint"))
	{
		self set_behavior_attribute("sprint", 1);
	}
	self.ignoresuppression = 1;
	self.grenadeawareness = 0;
	self val::set(#"ai_forcegoal", "ignoreme", 1);
	self disable_pain();
	if(!isplayer(self))
	{
		self val::set(#"ai_forcegoal", "push_player", 1);
	}
	if(isdefined(goto))
	{
		self setgoal(goto, 1);
	}
	self function_54115a91(goto);
	self waittill(#"goal", #"new_force_goal", str_end_on);
	if(color_enabled)
	{
		colors::enable();
	}
	if(!isplayer(self))
	{
		self val::reset(#"ai_forcegoal", "push_player");
	}
	self clearforcedgoal();
	self val::reset(#"ai_forcegoal", "ignoreme");
	self val::reset(#"ai_forcegoal", "ignoreall");
	if(is_true(allowpain))
	{
		self enable_pain();
	}
	if(self has_behavior_attribute("sprint"))
	{
		self set_behavior_attribute("sprint", 0);
	}
	if(isdefined(var_a5151bf))
	{
		self set_behavior_attribute("move_mode", var_a5151bf);
	}
	self.ignoresuppression = ignoresuppression;
	self.grenadeawareness = grenadeawareness;
	flag::clear(#"force_goal");
	s_tracker notify(#"done");
}

/*
	Name: stoppainwaitinterval
	Namespace: ai
	Checksum: 0xE47E5145
	Offset: 0x1D58
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function stoppainwaitinterval()
{
	self notify(#"painwaitintervalremove");
}

/*
	Name: _allowpainrestore
	Namespace: ai
	Checksum: 0x37E0041
	Offset: 0x1D78
	Size: 0x46
	Parameters: 0
	Flags: Linked, Private
*/
function private _allowpainrestore()
{
	self endon(#"death");
	self waittill(#"painwaitintervalremove", #"painwaitinterval");
	self.allowpain = 1;
}

/*
	Name: painwaitinterval
	Namespace: ai
	Checksum: 0xC6210C91
	Offset: 0x1DC8
	Size: 0xF6
	Parameters: 1
	Flags: None
*/
function painwaitinterval(msec)
{
	self endon(#"death");
	self notify(#"painwaitinterval");
	self endon(#"painwaitinterval", #"painwaitintervalremove");
	self thread _allowpainrestore();
	if(!isdefined(msec) || msec < 20)
	{
		msec = 20;
	}
	while(isalive(self))
	{
		self waittill(#"pain");
		self.allowpain = 0;
		wait(float(msec) / 1000);
		self.allowpain = 1;
	}
}

/*
	Name: bloody_death
	Namespace: ai
	Checksum: 0x33F53790
	Offset: 0x1EC8
	Size: 0x2BC
	Parameters: 2
	Flags: None
*/
function bloody_death(n_delay, hit_loc)
{
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death");
	if(isdefined(n_delay))
	{
		wait(n_delay);
	}
	if(!isalive(self))
	{
		return;
	}
	if(isdefined(hit_loc))
	{
		/#
			assert(isinarray(array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""), hit_loc), "");
		#/
	}
	else
	{
		hit_loc = array::random(array("helmet", "head", "neck", "torso_upper", "torso_mid", "torso_lower", "right_arm_upper", "left_arm_upper", "right_arm_lower", "left_arm_lower", "right_hand", "left_hand", "right_leg_upper", "left_leg_upper", "right_leg_lower", "left_leg_lower", "right_foot", "left_foot", "gun", "riotshield"));
	}
	if(is_true(self.var_4b5540a0))
	{
		self delete();
	}
	else if(!self flag::get("in_action"))
	{
		util::stop_magic_bullet_shield(self);
		self dodamage(self.health + 100, self.origin, undefined, undefined, hit_loc);
		self kill();
	}
}

/*
	Name: shouldregisterclientfieldforarchetype
	Namespace: ai
	Checksum: 0x9CB66046
	Offset: 0x2190
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function shouldregisterclientfieldforarchetype(archetype)
{
	if(is_true(level.clientfieldaicheck) && !isarchetypeloaded(archetype))
	{
		return false;
	}
	return true;
}

/*
	Name: set_protect_ent
	Namespace: ai
	Checksum: 0x9A6B2DDA
	Offset: 0x21E8
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function set_protect_ent(entity)
{
	if(!isdefined(entity.protect_tactical_influencer) && sessionmodeiscampaigngame())
	{
		teammask = util::getteammask(self.team);
		entity.protect_tactical_influencer = createtacticalinfluencer("protect_entity_influencer_def", entity, teammask);
	}
	self.protectent = entity;
	if(isactor(self))
	{
		self setblackboardattribute("_defend", "defend_enabled");
	}
}

/*
	Name: set_group_protect_ent
	Namespace: ai
	Checksum: 0xB9DC1BCF
	Offset: 0x22C0
	Size: 0x10C
	Parameters: 2
	Flags: None
*/
function set_group_protect_ent(e_ent_to_protect, defend_volume_name_or_ent)
{
	a_defenders = self;
	if(!isdefined(a_defenders))
	{
		a_defenders = [];
	}
	else if(!isarray(a_defenders))
	{
		a_defenders = array(a_defenders);
	}
	if(isstring(defend_volume_name_or_ent))
	{
		vol_defend = getent(defend_volume_name_or_ent, "targetname");
	}
	else if(isentity(defend_volume_name_or_ent))
	{
		vol_defend = defend_volume_name_or_ent;
	}
	array::run_all(a_defenders, &setgoal, vol_defend, 1);
	array::thread_all(a_defenders, &set_protect_ent, e_ent_to_protect);
}

/*
	Name: remove_protect_ent
	Namespace: ai
	Checksum: 0x40C5B93D
	Offset: 0x23D8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function remove_protect_ent()
{
	self.protectent = undefined;
	if(isactor(self))
	{
		self setblackboardattribute("_defend", "defend_disabled");
	}
}

/*
	Name: t_cylinder
	Namespace: ai
	Checksum: 0x1C6EEB0B
	Offset: 0x2430
	Size: 0x86
	Parameters: 3
	Flags: Linked
*/
function t_cylinder(origin, radius, halfheight)
{
	struct = spawnstruct();
	struct.type = 1;
	struct.origin = origin;
	struct.radius = float(radius);
	struct.halfheight = float(halfheight);
	return struct;
}

/*
	Name: function_470c0597
	Namespace: ai
	Checksum: 0xB4AE6A80
	Offset: 0x24C0
	Size: 0xE2
	Parameters: 3
	Flags: Linked
*/
function function_470c0597(center, halfsize, angles)
{
	/#
		assert(isvec(center));
	#/
	/#
		assert(isvec(halfsize));
	#/
	/#
		assert(isvec(angles));
	#/
	struct = spawnstruct();
	struct.type = 2;
	struct.center = center;
	struct.halfsize = halfsize;
	struct.angles = angles;
	return struct;
}

/*
	Name: function_1628d95b
	Namespace: ai
	Checksum: 0x4F1ECED
	Offset: 0x25B0
	Size: 0x274
	Parameters: 3
	Flags: Linked
*/
function function_1628d95b(cansee, var_9a21f98d, var_2dd9c403)
{
	if(!isdefined(cansee))
	{
		cansee = 0;
	}
	if(!isdefined(var_9a21f98d))
	{
		var_9a21f98d = 1;
	}
	if(!isdefined(var_2dd9c403))
	{
		var_2dd9c403 = self.origin;
	}
	var_56203bf4 = function_4d8c71ce(util::get_enemy_team(self.team), #"team3");
	nearesttarget = undefined;
	var_46e1d165 = undefined;
	foreach(target in var_56203bf4)
	{
		if(!isalive(target) || is_true(target.var_becd4d91) || target function_41b04632())
		{
			continue;
		}
		if(cansee && var_9a21f98d)
		{
			if(!self cansee(target))
			{
				continue;
			}
		}
		else if(cansee && !var_9a21f98d)
		{
			targetpoint = (isdefined(target.var_88f8feeb) ? target.var_88f8feeb : target getcentroid());
			if(!sighttracepassed(self geteye(), targetpoint, 0, target))
			{
				continue;
			}
		}
		distsq = distancesquared(var_2dd9c403, target.origin);
		if(!isdefined(nearesttarget) || distsq < var_46e1d165)
		{
			nearesttarget = target;
			var_46e1d165 = distsq;
		}
	}
	return nearesttarget;
}

/*
	Name: function_31a31a25
	Namespace: ai
	Checksum: 0x78717CE4
	Offset: 0x2830
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function function_31a31a25(var_9a21f98d)
{
	if(!isdefined(var_9a21f98d))
	{
		var_9a21f98d = 1;
	}
	return function_1628d95b(1, var_9a21f98d);
}

/*
	Name: function_41b04632
	Namespace: ai
	Checksum: 0x35703CFB
	Offset: 0x2870
	Size: 0x48
	Parameters: 0
	Flags: Linked
*/
function function_41b04632()
{
	return isdefined(self.targetname) && self.targetname == "destructible" && !isdefined(getent(self.target, "targetname"));
}

/*
	Name: function_63734291
	Namespace: ai
	Checksum: 0x78FBE1EE
	Offset: 0x28C0
	Size: 0x110
	Parameters: 1
	Flags: None
*/
function function_63734291(enemy)
{
	if(!isdefined(enemy))
	{
		return false;
	}
	var_aba9ee4c = 1;
	if(isdefined(self.var_ffa507cd))
	{
		var_e1ea86de = self.var_ffa507cd;
		if(var_e1ea86de < randomfloat(1))
		{
			var_aba9ee4c = 0;
		}
	}
	if(var_aba9ee4c && isvehicle(enemy) && !is_true(enemy.var_c95dcb15))
	{
		dist_squared = distancesquared(self.origin, enemy.origin);
		if(dist_squared >= 562500)
		{
			enemy notify(#"hash_4853a85e5ddc4a47");
			return true;
		}
	}
	return false;
}

/*
	Name: function_28aab32a
	Namespace: ai
	Checksum: 0xF09F64AC
	Offset: 0x29D8
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function function_28aab32a()
{
	if(!is_true(self.var_28aab32a) || is_true(self.var_c2986b66) || is_true(self.var_b736fc8b))
	{
		return false;
	}
	return true;
}

/*
	Name: stun
	Namespace: ai
	Checksum: 0x5D994643
	Offset: 0x2A48
	Size: 0xDE
	Parameters: 1
	Flags: Linked
*/
function stun(duration)
{
	if(!isdefined(duration))
	{
		duration = self.var_95d94ac4;
	}
	if(!isdefined(duration) || !is_true(self.var_28aab32a) || is_true(self.var_c2986b66) || is_true(self.var_b736fc8b))
	{
		return;
	}
	end_time = gettime() + (int(duration * 1000));
	if(isdefined(self.var_3d461e6f) && self.var_3d461e6f > end_time)
	{
		return;
	}
	self.var_3d461e6f = end_time;
}

/*
	Name: is_stunned
	Namespace: ai
	Checksum: 0x1198EE3A
	Offset: 0x2B30
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function is_stunned()
{
	return isdefined(self.var_3d461e6f) && gettime() < self.var_3d461e6f;
}

/*
	Name: clear_stun
	Namespace: ai
	Checksum: 0xDDE824D9
	Offset: 0x2B58
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function clear_stun()
{
	self.var_3d461e6f = undefined;
}

/*
	Name: function_9139c839
	Namespace: ai
	Checksum: 0x6AC3176D
	Offset: 0x2B70
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_9139c839()
{
	if(!isdefined(self.var_76167463))
	{
		if(isdefined(self.aisettingsbundle))
		{
			settingsbundle = self.aisettingsbundle;
		}
		else
		{
			if(isspawner(self) && isdefined(self.aitype))
			{
				settingsbundle = function_edf479a3(self.aitype);
			}
			else if(isvehicle(self) && isdefined(self.scriptbundlesettings))
			{
				settingsbundle = getscriptbundle(self.scriptbundlesettings).aisettingsbundle;
			}
		}
		if(!isdefined(settingsbundle))
		{
			return undefined;
		}
		self.var_76167463 = settingsbundle;
		if(!isdefined(level.var_e3a467cf))
		{
			level.var_e3a467cf = [];
		}
		if(!isdefined(level.var_e3a467cf[self.var_76167463]))
		{
			level.var_e3a467cf[self.var_76167463] = getscriptbundle(self.var_76167463);
		}
	}
	return level.var_e3a467cf[self.var_76167463];
}

/*
	Name: function_71919555
	Namespace: ai
	Checksum: 0x88B99486
	Offset: 0x2CB0
	Size: 0x9A
	Parameters: 2
	Flags: None
*/
function function_71919555(var_45302432, fieldname)
{
	if(!isdefined(level.var_e3a467cf))
	{
		level.var_e3a467cf = [];
	}
	if(!isdefined(level.var_e3a467cf[var_45302432]))
	{
		level.var_e3a467cf[var_45302432] = getscriptbundle(var_45302432);
	}
	if(isdefined(level.var_e3a467cf[var_45302432]))
	{
		return level.var_e3a467cf[var_45302432].(fieldname);
	}
	return undefined;
}

/*
	Name: function_fc7bd6c7
	Namespace: ai
	Checksum: 0x79CC5F8E
	Offset: 0x2D58
	Size: 0x80
	Parameters: 1
	Flags: None
*/
function function_fc7bd6c7(var_80292228)
{
	if(is_true(var_80292228))
	{
		if(isfunctionptr(self.var_9a22ab2b))
		{
			self thread [[self.var_9a22ab2b]]();
		}
	}
	else if(isfunctionptr(self.var_54aff8ae))
	{
		self thread [[self.var_54aff8ae]]();
	}
}

/*
	Name: function_f6060793
	Namespace: ai
	Checksum: 0x65F4C2C6
	Offset: 0x2DE0
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function function_f6060793()
{
	if(isfunctionptr(self.var_b84eb531))
	{
		self thread [[self.var_b84eb531]]();
	}
}

/*
	Name: enable_careful
	Namespace: ai
	Checksum: 0x4316BDED
	Offset: 0x2E18
	Size: 0x42
	Parameters: 0
	Flags: None
*/
function enable_careful()
{
	/#
		assert(isai(self), "");
	#/
	self.script_careful = 1;
}

/*
	Name: disable_careful
	Namespace: ai
	Checksum: 0xC5A7A428
	Offset: 0x2E68
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function disable_careful()
{
	/#
		assert(isai(self), "");
	#/
	self.script_careful = 0;
	self notify(#"stop_being_careful");
}

/*
	Name: look_at
	Namespace: ai
	Checksum: 0x5E37EF4A
	Offset: 0x2EC0
	Size: 0x340
	Parameters: 11
	Flags: None
*/
function look_at(look_at, priority, var_9e364106, duration, var_152044ef, var_71e42546, var_a806de0b, var_8cc599f, var_3777d080, blend_time, weight)
{
	if(!isdefined(priority))
	{
		priority = 2;
	}
	if(!isdefined(var_9e364106))
	{
		var_9e364106 = 1;
	}
	if(!isdefined(duration))
	{
		duration = 0;
	}
	if(!isdefined(var_a806de0b))
	{
		var_a806de0b = 1;
	}
	if(!isdefined(var_8cc599f))
	{
		var_8cc599f = 0;
	}
	if(!isdefined(var_3777d080))
	{
		var_3777d080 = 0;
	}
	if(!isdefined(blend_time))
	{
		blend_time = 0.5;
	}
	if(!isdefined(weight))
	{
		weight = 1;
	}
	/#
		assert(isai(self), "");
	#/
	/#
		assert(priority >= 0 && priority < 4, "");
	#/
	if(!isdefined(self.var_8a068c50))
	{
		self.var_8a068c50 = function_191b31f3();
	}
	if(is_true(self.var_8a068c50[priority].set) && !var_9e364106)
	{
		return false;
	}
	function_e1c5902(var_9e364106);
	self.var_8a068c50[priority].object = look_at;
	self.var_8a068c50[priority].doaim = var_152044ef;
	self.var_8a068c50[priority].var_eba0d1fe = var_71e42546;
	self.var_8a068c50[priority].var_a806de0b = var_a806de0b;
	self.var_8a068c50[priority].var_8cc599f = var_8cc599f;
	self.var_8a068c50[priority].var_3777d080 = var_3777d080;
	self.var_8a068c50[priority].blend_time = blend_time;
	self.var_8a068c50[priority].weight = weight;
	if(isdefined(look_at))
	{
		self.var_8a068c50[priority].set = 1;
	}
	if(duration > 0 && duration < 1)
	{
		self.var_8a068c50[priority].glance = 1;
	}
	self notify(("look_at_" + string(priority)) + "_updated");
	if(duration > 0)
	{
		self thread function_4760d8c0(priority, duration);
	}
	function_fcd4fcb7();
	return true;
}

/*
	Name: function_4760d8c0
	Namespace: ai
	Checksum: 0x9FC23850
	Offset: 0x3208
	Size: 0x8C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4760d8c0(priority, duration)
{
	self notify("49b92de7a3dcbca4");
	self endon("49b92de7a3dcbca4");
	self endon(("look_at_" + string(priority)) + "_updated", #"death");
	wait(duration);
	function_e1c5902(priority);
	function_fcd4fcb7();
}

/*
	Name: function_191b31f3
	Namespace: ai
	Checksum: 0x93A16810
	Offset: 0x32A0
	Size: 0x50
	Parameters: 0
	Flags: Linked, Private
*/
function private function_191b31f3()
{
	var_87000798 = [];
	for(stackindex = 0; stackindex < 4; stackindex++)
	{
		var_87000798[stackindex] = spawnstruct();
	}
	return var_87000798;
}

/*
	Name: function_91692eaa
	Namespace: ai
	Checksum: 0xBB493932
	Offset: 0x32F8
	Size: 0xA6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_91692eaa()
{
	if(!isdefined(self.lookat))
	{
		self.lookat = {};
	}
	for(stackindex = 0; stackindex < 4; stackindex++)
	{
		if(is_true(self.var_8a068c50[stackindex].set))
		{
			self.lookat = function_2e532eed(self.var_8a068c50[stackindex], 1);
			return;
		}
	}
	self.lookat = {#glance:0};
}

/*
	Name: function_e1c5902
	Namespace: ai
	Checksum: 0x7C2A7D53
	Offset: 0x33A8
	Size: 0x1C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e1c5902(priority)
{
	self.var_8a068c50[priority] = {};
}

/*
	Name: function_603b970a
	Namespace: ai
	Checksum: 0x8E88A073
	Offset: 0x33D0
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_603b970a()
{
	if(!isdefined(self.var_8a068c50))
	{
		self.var_8a068c50 = function_191b31f3();
	}
	for(stackindex = 0; stackindex < 4; stackindex++)
	{
		function_e1c5902(stackindex);
	}
	function_fcd4fcb7();
}

/*
	Name: function_6b85d60d
	Namespace: ai
	Checksum: 0x565CEBF5
	Offset: 0x3450
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_6b85d60d(priority)
{
	if(!isdefined(self.var_8a068c50))
	{
		self.var_8a068c50 = function_191b31f3();
	}
	/#
		assert(priority >= 0 && priority < 4, "");
	#/
	function_e1c5902(priority);
	function_fcd4fcb7();
}

/*
	Name: function_5e5653d3
	Namespace: ai
	Checksum: 0x7DA732F7
	Offset: 0x34E8
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function function_5e5653d3()
{
	if(self isinscriptedstate() && !is_true(self._scene_object._s.var_db255011))
	{
		return false;
	}
	if(self flag::get("scripted_lookat_disable"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_fcd4fcb7
	Namespace: ai
	Checksum: 0x49DF14AC
	Offset: 0x3568
	Size: 0x35C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fcd4fcb7()
{
	function_91692eaa();
	object = self.lookat.object;
	doaim = self.lookat.doaim;
	var_eba0d1fe = self.lookat.var_eba0d1fe;
	var_a806de0b = self.lookat.var_a806de0b;
	var_8cc599f = self.lookat.var_8cc599f;
	var_3777d080 = self.lookat.var_3777d080;
	blend_time = self.lookat.blend_time;
	weight = self.lookat.weight;
	if(!function_5e5653d3())
	{
		object = undefined;
	}
	if(isdefined(object))
	{
		var_9d112229 = &lookatentity;
		var_77a9fe9e = &lookatpos;
		if(is_true(doaim))
		{
			var_9d112229 = &aimatentityik;
			if(is_true(var_eba0d1fe))
			{
				var_77a9fe9e = &function_2031372a;
			}
			else
			{
				var_77a9fe9e = &aimatposik;
			}
			if(isentity(object))
			{
				self [[var_9d112229]](object, blend_time, weight);
			}
			else
			{
				if(!isvec(object))
				{
					self [[var_77a9fe9e]](object.origin, blend_time, weight);
				}
				else
				{
					self [[var_77a9fe9e]](object, blend_time, weight);
				}
			}
		}
		else
		{
			if(is_true(var_eba0d1fe))
			{
				var_77a9fe9e = &lookatangles;
			}
			if(isentity(object))
			{
				self [[var_9d112229]](object, var_a806de0b, var_8cc599f, var_3777d080, blend_time, weight);
			}
			else
			{
				if(!isvec(object))
				{
					self [[var_77a9fe9e]](object.origin, var_a806de0b, var_8cc599f, var_3777d080, blend_time, weight);
				}
				else
				{
					self [[var_77a9fe9e]](object, var_a806de0b, var_8cc599f, var_3777d080, blend_time, weight);
				}
			}
		}
	}
	else
	{
		self lookatentity(undefined);
		self lookatpos(undefined);
	}
	/#
		self thread function_1571b7b6(object, is_true(self.lookat.glance));
	#/
}

/*
	Name: function_1571b7b6
	Namespace: ai
	Checksum: 0xCF5E6DF9
	Offset: 0x38D0
	Size: 0x1BE
	Parameters: 2
	Flags: Private
*/
function private function_1571b7b6(object, var_dfb8e94b)
{
	/#
		self endon(#"death", #"entitydeleted");
		self notify("");
		self endon("");
		while(isdefined(object) && function_45ef77da())
		{
			from = self geteye();
			to = object;
			if(!isvec(to) && issentient(to))
			{
				to = to geteye();
			}
			looking = anglestoforward(self gettagangles(""));
			line(from, from + (looking * 500), vectorscale((1, 1, 1), 0.75), 1, 0, 1);
			color = (1, 1, 0);
			if(is_true(var_dfb8e94b))
			{
				color = (1, 1, 1);
			}
			line(from, to, color, 1, 0, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: function_45ef77da
	Namespace: ai
	Checksum: 0x25D3BC51
	Offset: 0x3A98
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function function_45ef77da()
{
	/#
		dvar = getdvarstring(#"hash_4493b356ca38ab5e", "");
		return int(dvar);
	#/
}

/*
	Name: function_fd90d41c
	Namespace: ai
	Checksum: 0xA406D8A1
	Offset: 0x3AF8
	Size: 0xF4
	Parameters: 2
	Flags: None
*/
function function_fd90d41c(target, tag)
{
	if(!isdefined(target))
	{
		self lookatentity();
		if(isdefined(self.var_875e35a2))
		{
			self.var_875e35a2 delete();
		}
		return;
	}
	if(!isdefined(self.var_875e35a2))
	{
		self.var_875e35a2 = util::spawn_model("tag_origin");
	}
	/#
		assert(isdefined(self.var_875e35a2));
	#/
	self.var_875e35a2 linkto(target, tag, (0, 0, 0), (0, 0, 0));
	self lookatentity(self.var_875e35a2);
}

/*
	Name: function_71915b43
	Namespace: ai
	Checksum: 0xDEF85285
	Offset: 0x3BF8
	Size: 0xF4
	Parameters: 2
	Flags: None
*/
function function_71915b43(target, tag)
{
	if(!isdefined(target))
	{
		self aimatentityik();
		if(isdefined(self.var_875e35a2))
		{
			self.var_875e35a2 delete();
		}
		return;
	}
	if(!isdefined(self.var_875e35a2))
	{
		self.var_875e35a2 = util::spawn_model("tag_origin");
	}
	/#
		assert(isdefined(self.var_875e35a2));
	#/
	self.var_875e35a2 linkto(target, tag, (0, 0, 0), (0, 0, 0));
	self aimatentityik(self.var_875e35a2);
}

/*
	Name: poi_enable
	Namespace: ai
	Checksum: 0x95E8DBEF
	Offset: 0x3CF8
	Size: 0x60
	Parameters: 3
	Flags: None
*/
function poi_enable(var_dc8b0c0d, var_90650979, doaim)
{
	if(isfunctionptr(level.poi.var_705e0648))
	{
		self thread [[level.poi.var_705e0648]](var_dc8b0c0d, var_90650979, doaim);
	}
}

/*
	Name: function_3a5e9945
	Namespace: ai
	Checksum: 0x124CFD4A
	Offset: 0x3D60
	Size: 0x80
	Parameters: 6
	Flags: None
*/
function function_3a5e9945(var_dc8b0c0d, yawmin, yawmax, pitchmin, pitchmax, doaim)
{
	if(isfunctionptr(level.poi.var_38974483))
	{
		self thread [[level.poi.var_38974483]](var_dc8b0c0d, yawmin, yawmax, pitchmin, pitchmax, doaim);
	}
}

