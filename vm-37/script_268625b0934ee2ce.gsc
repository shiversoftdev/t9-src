#using script_1883fa4e60abbf9f;
#using script_42e8ee8721f5e6ef;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace player;

/*
	Name: scalevolume
	Namespace: player
	Checksum: 0x376272A3
	Offset: 0x1D8
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

#namespace stealth_player;

/*
	Name: stealth_noteworthy_thread
	Namespace: stealth_player
	Checksum: 0xD0ED06DF
	Offset: 0x1F8
	Size: 0x506
	Parameters: 2
	Flags: None
*/
function stealth_noteworthy_thread(enabled, callouts)
{
	self notify(#"stealth_noteworthy_thread");
	if(!isdefined(enabled))
	{
		enabled = 1;
	}
	if(!enabled)
	{
		return;
	}
	self endoncallback(&function_19d52da4, #"stealth_noteworthy_thread", #"disconnect");
	/#
		assert(isplayer(self));
	#/
	while(!isdefined(self.stealth))
	{
		wait(1);
	}
	callback::on_ai_killed(&function_3a7a5076);
	stealth_noteworthy_init();
	/#
		self thread function_1e099116();
	#/
	if(!isdefined(self.stealth.stealth_noted))
	{
		self.stealth.stealth_noted = [];
	}
	self thread stealth_noteworthy_kill_monitor();
	if(is_true(callouts))
	{
		self thread stealth_noteworthy_callouts(1);
	}
	contents = stealth_noteworthy_aim_contents();
	while(true)
	{
		level flag::wait_till("stealth_enabled");
		level flag::wait_till_clear("stealth_spotted");
		bestdot = -1;
		var_17280c7c = undefined;
		if(self playerads() > level.stealth.noteworthy.stealth_noteworthy_min_ads)
		{
			eye = self getplayercamerapos();
			var_a74a4e75 = anglestoforward(self getplayerangles());
			targets = stealth_noteworthy_entities(self.origin, 20000, "axis", level.stealth.noteworthy.civilians_aim, level.stealth.noteworthy.fakeactors_aim);
			foreach(var_acbf85fc in targets)
			{
				entnum = var_acbf85fc getentitynumber();
				if(isdefined(self.stealth.stealth_noted[entnum]))
				{
					continue;
				}
				var_dfc74aa8 = var_acbf85fc stealth_noteworthy_get_eye();
				dir = vectornormalize(var_dfc74aa8 - eye);
				dot = vectordot(var_a74a4e75, dir);
				if(dot > level.stealth.noteworthy.stealth_noteworthy_min_dot && dot > bestdot)
				{
					if(sighttracepassed(var_dfc74aa8, eye, 0, self))
					{
						bestdot = dot;
						var_17280c7c = var_acbf85fc;
					}
				}
			}
			if(isdefined(var_17280c7c))
			{
				self thread stealth_noteworthy_delayed("aim", var_17280c7c);
			}
			foreach(entnum, ent in self.stealth.stealth_noted)
			{
				if(!isdefined(self.stealth.stealth_noted[entnum]))
				{
					self.stealth.stealth_noted[entnum] = undefined;
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_19d52da4
	Namespace: stealth_player
	Checksum: 0xE6597A3F
	Offset: 0x708
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_19d52da4(parm)
{
	callback::remove_on_ai_killed(&function_3a7a5076);
}

/*
	Name: stealth_noteworthy_init
	Namespace: stealth_player
	Checksum: 0xB3849BFA
	Offset: 0x740
	Size: 0x33A
	Parameters: 0
	Flags: Linked, Private
*/
function private stealth_noteworthy_init()
{
	if(isdefined(level.stealth.noteworthy))
	{
		return;
	}
	/#
		function_5ac4dc99("", 0);
	#/
	level.stealth.noteworthy = spawnstruct();
	level.stealth.noteworthy.priority_func = &stealth_noteworthy_priority;
	level.stealth.noteworthy.stealth_noteworthy_min_ads = 0.3;
	level.stealth.noteworthy.stealth_noteworthy_min_dot = 0.99;
	level.stealth.noteworthy.stealth_noteworthy_min_delay = 0.25;
	level.stealth.noteworthy.stealth_noteworthy_max_delay = 0.5;
	level.stealth.noteworthy.callout_enabled = [];
	level.stealth.noteworthy.callout_enabled[#"left"] = 1;
	level.stealth.noteworthy.callout_enabled[#"right"] = 1;
	level.stealth.noteworthy.callout_enabled[#"ahead"] = 0;
	level.stealth.noteworthy.callout_enabled[#"behind"] = 1;
	level.stealth.noteworthy.callout_enabled[#"below"] = 1;
	level.stealth.noteworthy.fakeactors_aim = 1;
	level.stealth.noteworthy.fakeactors_callout = 0;
	level.stealth.noteworthy.civilians_aim = 1;
	level.stealth.noteworthy.civilians_callout = 1;
	level.stealth.noteworthy.callout_debounce_guy = 60000;
	level.stealth.noteworthy.callout_debounce_all = 15000;
	level.stealth.noteworthy.callout_radius = 800;
	level.stealth.noteworthy.callout_proximity_radius = 0;
	level.stealth.noteworthy.callout_bunch_radius = 100;
	level.stealth.noteworthy.callout_func_validator = undefined;
	level.stealth.noteworthy.callout_traces = 0;
	level.stealth.noteworthy.callout_spotted = 0;
}

/*
	Name: stealth_noteworthy_kill_monitor
	Namespace: stealth_player
	Checksum: 0x556C8C0B
	Offset: 0xA88
	Size: 0x340
	Parameters: 0
	Flags: Linked, Private
*/
function private stealth_noteworthy_kill_monitor()
{
	/#
		assert(isplayer(self));
	#/
	var_a57f6402 = 0;
	kills = undefined;
	while(true)
	{
		kills = self.stats[#"kills"];
		if(!isdefined(kills))
		{
			kills = 0;
		}
		var_9be355ac = kills;
		lastkilltime = gettime();
		level flag::wait_till("stealth_enabled");
		level flag::wait_till_clear("stealth_spotted");
		var_7f729179 = undefined;
		var_7f729179 = level waittill(#"ai_killed");
		victim = var_7f729179.evictim;
		attacker = var_7f729179.eattacker;
		meansofdeath = var_7f729179.smeansofdeath;
		weapon = var_7f729179.weapon;
		if(isdefined(attacker) && attacker != self)
		{
			continue;
		}
		if(!level flag::get("stealth_enabled") || level flag::get("stealth_spotted"))
		{
			continue;
		}
		if(isdefined(victim) && isdefined(victim.team) && victim.team != "axis")
		{
			self thread stealth_noteworthy_delayed("civilian_kill", victim);
		}
		kills = self.stats[#"kills"];
		if(!isdefined(kills))
		{
			kills = 1;
		}
		var_7cc7f71e = kills - var_9be355ac;
		if(gettime() - lastkilltime > 1000)
		{
			var_a57f6402 = 0;
		}
		isbullet = isdefined(weapon) && weapon.isbulletweapon;
		if(var_7cc7f71e >= 2 && isbullet)
		{
			self thread stealth_noteworthy_delayed("good_kill_double", victim, 1);
		}
		var_a57f6402 = var_a57f6402 + var_7cc7f71e;
		if(var_a57f6402 > 1)
		{
			self thread stealth_noteworthy_delayed("good_kill_impressive", victim, 1);
		}
		else
		{
			if(isbullet)
			{
				self thread stealth_noteworthy_delayed("good_kill_bullet", victim, 1);
			}
			else
			{
				self thread stealth_noteworthy_delayed("good_kill", victim, 1);
			}
		}
	}
}

/*
	Name: function_3a7a5076
	Namespace: stealth_player
	Checksum: 0x60FD468F
	Offset: 0xDD0
	Size: 0x30
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3a7a5076(var_854423c5)
{
	var_854423c5.evictim = self;
	level notify(#"ai_killed", var_854423c5);
}

/*
	Name: stealth_noteworthy_delayed
	Namespace: stealth_player
	Checksum: 0x371F107F
	Offset: 0xE08
	Size: 0x5D6
	Parameters: 4
	Flags: Linked, Private
*/
function private stealth_noteworthy_delayed(eventname, target, var_78a2f9b6, delay)
{
	targets = undefined;
	entnum = undefined;
	if(isarray(target))
	{
		targets = target;
	}
	else
	{
		entnum = target getentitynumber();
		targets = [];
		targets[entnum] = target;
	}
	if(isdefined(self.stealth.stealth_note_pending))
	{
		if([[level.stealth.noteworthy.priority_func]](self.stealth.stealth_note_pending) > [[level.stealth.noteworthy.priority_func]](eventname))
		{
			return;
		}
		if(eventname == "aim")
		{
			if(isdefined(self.stealth.stealth_note_pending_targets[entnum]))
			{
				return;
			}
			self.stealth.stealth_note_pending_targets = targets;
		}
		else
		{
			if(self.stealth.stealth_note_pending == eventname)
			{
				self.stealth.stealth_note_pending_targets[entnum] = target;
			}
			else
			{
				self.stealth.stealth_note_pending_targets = targets;
			}
		}
	}
	else
	{
		self.stealth.stealth_note_pending = eventname;
		self.stealth.stealth_note_pending_targets = targets;
	}
	self notify(#"stealth_noteworthy_delayed");
	self endon(#"stealth_noteworthy_delayed");
	self endon(#"disconnect");
	if(is_true(var_78a2f9b6) && isdefined(self.stealth.maxalertlevel))
	{
		self.stealth.stealth_note_start_alert = self.stealth.maxalertlevel;
	}
	if(!isdefined(delay))
	{
		delay = randomfloatrange(level.stealth.noteworthy.stealth_noteworthy_min_delay, level.stealth.noteworthy.stealth_noteworthy_max_delay);
	}
	if(delay > 0)
	{
		wait(delay);
	}
	function_1eaaceab(self.stealth.stealth_note_pending_targets);
	if(is_true(var_78a2f9b6) && isdefined(self.stealth.maxalertlevel) && self.stealth.stealth_note_start_alert < self.stealth.maxalertlevel)
	{
		self.stealth.stealth_note_pending = undefined;
		self.stealth.stealth_note_pending_targets = undefined;
		return;
	}
	if(eventname == "aim")
	{
		eye = self getplayercamerapos();
		var_a74a4e75 = anglestoforward(self getplayerangles());
		contents = stealth_noteworthy_aim_contents();
		foreach(ent in self.stealth.stealth_note_pending_targets)
		{
			var_dfc74aa8 = ent stealth_noteworthy_get_eye();
			dir = vectornormalize(var_dfc74aa8 - eye);
			dot = vectordot(var_a74a4e75, dir);
			if(dot < level.stealth.noteworthy.stealth_noteworthy_min_dot || !sighttracepassed(var_dfc74aa8, eye, 0, self))
			{
				self.stealth.stealth_note_pending = undefined;
				self.stealth.stealth_note_pending_targets = undefined;
				return;
			}
		}
		foreach(target in self.stealth.stealth_note_pending_targets)
		{
			self.stealth.stealth_noted[target getentitynumber()] = target;
		}
	}
	self notify("stealth_noteworthy", {#targets:self.stealth.stealth_note_pending_targets, #event:eventname});
	self.stealth.stealth_note_pending = undefined;
	self.stealth.stealth_note_pending_targets = undefined;
}

/*
	Name: stealth_noteworthy_priority
	Namespace: stealth_player
	Checksum: 0xF443288E
	Offset: 0x13E8
	Size: 0x10C
	Parameters: 1
	Flags: Linked, Private
*/
function private stealth_noteworthy_priority(eventname)
{
	if(!isdefined(eventname))
	{
		return -1;
	}
	switch(eventname)
	{
		case "hash_48d20ba57ac4bfc9":
		{
			return 70;
		}
		case "hash_1660e53a237b361f":
		{
			return 60;
		}
		case "hash_69549d190b855fff":
		{
			return 50;
		}
		case "hash_3dba80d5e594e48e":
		{
			return 40;
		}
		case "hash_3ad2f4667e2f7219":
		{
			return 30;
		}
		case "aim":
		{
			return 20;
		}
		case "hash_a82fa1391355735":
		case "hash_32b3037d0c7237a1":
		case "hash_41c5f724238aa06e":
		case "hash_5f71ade4df457495":
		case "hash_66e5f6a038177fe8":
		{
			return 10;
		}
	}
	return 0;
}

/*
	Name: function_1e099116
	Namespace: stealth_player
	Checksum: 0xF1AA8030
	Offset: 0x1500
	Size: 0x174
	Parameters: 0
	Flags: Private
*/
function private function_1e099116()
{
	/#
		while(true)
		{
			var_7f729179 = undefined;
			var_7f729179 = getplayers()[0] waittill("");
			eventname = var_7f729179.event;
			var_e6eef508 = var_7f729179.targets;
			if(getdvarint(#"hash_3ca672bc9412d156"))
			{
				foreach(subject in var_e6eef508)
				{
					if(isdefined(subject))
					{
						iprintln((("" + eventname) + "") + subject getentitynumber());
						continue;
					}
					iprintln(("" + eventname) + "");
				}
			}
		}
	#/
}

/*
	Name: stealth_noteworthy_aim_contents
	Namespace: stealth_player
	Checksum: 0x80F724D1
	Offset: 0x1680
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private stealth_noteworthy_aim_contents()
{
}

/*
	Name: stealth_noteworthy_entities
	Namespace: stealth_player
	Checksum: 0x918F906A
	Offset: 0x1690
	Size: 0x1AE
	Parameters: 5
	Flags: Linked, Private
*/
function private stealth_noteworthy_entities(origin, radius, team, civilians, fakeactors)
{
	if(!isdefined(team))
	{
		team = "axis";
	}
	if(is_true(civilians))
	{
		entities = function_e45cbe76(origin, radius, team, "neutral");
	}
	else
	{
		entities = function_e45cbe76(origin, radius, team);
	}
	function_1eaaceab(entities);
	if(is_true(fakeactors))
	{
		var_33ed2ca8 = [];
		foreach(var_2b0a1046 in var_33ed2ca8)
		{
			if(isdefined(var_2b0a1046.team) && (var_2b0a1046.team == team || (is_true(civilians) && var_2b0a1046.team == "neutral")))
			{
				entities[entities.size] = var_2b0a1046;
			}
		}
	}
	return entities;
}

/*
	Name: stealth_noteworthy_callouts
	Namespace: stealth_player
	Checksum: 0x43E2ED91
	Offset: 0x1848
	Size: 0x8C0
	Parameters: 1
	Flags: Linked
*/
function stealth_noteworthy_callouts(enabled)
{
	self notify(#"stealth_noteworthy_callouts");
	self endon(#"stealth_noteworthy_callouts");
	if(!is_true(enabled))
	{
		return;
	}
	level.stealth.noteworthy.callout_next = 0;
	while(true)
	{
		wait(0.5);
		level flag::wait_till("stealth_enabled");
		if(!level.stealth.noteworthy.callout_spotted)
		{
			level flag::wait_till_clear("stealth_spotted");
		}
		entities = stealth_noteworthy_entities(self.origin, level.stealth.noteworthy.callout_radius, undefined, level.stealth.noteworthy.civilians_callout, level.stealth.noteworthy.fakeactors_callout);
		callouts = stealth_noteworthy_callouts_init();
		self_eye = self getplayercamerapos();
		foreach(ent in entities)
		{
			if(!isdefined(ent.stealth))
			{
				continue;
			}
			if(is_true(ent.stealth.callout_disabled))
			{
				continue;
			}
			if(isdefined(ent.stealth.callout_next) && gettime() < ent.stealth.callout_next)
			{
				continue;
			}
			if(isdefined(level.stealth.noteworthy.callout_func_validator) && !self [[level.stealth.noteworthy.callout_func_validator]](ent))
			{
				continue;
			}
			var_b7f614b4 = distancesquared(self.origin, ent.origin) > (level.stealth.noteworthy.callout_proximity_radius * level.stealth.noteworthy.callout_proximity_radius);
			if(var_b7f614b4 && !stealth_noteworthy_trace(ent stealth_noteworthy_get_eye(), self_eye, ent))
			{
				continue;
			}
			if(self stealth_noteworthy_visible(ent, var_b7f614b4))
			{
				ent.stealth.callout_next = gettime() + level.stealth.noteworthy.callout_debounce_guy;
				continue;
			}
			if(gettime() < level.stealth.noteworthy.callout_next)
			{
				continue;
			}
			type = self stealth_noteworthy_callout_type(ent);
			if(isdefined(type))
			{
				entnum = ent getentitynumber();
				if(is_true(level.stealth.noteworthy.callout_civilians))
				{
					foreach(var_edce0829 in callouts.results[#"all"])
					{
						if(var_edce0829.team != ent.team && var_edce0829.team == "neutral")
						{
							callouts = stealth_noteworthy_callouts_init();
						}
						break;
					}
				}
				callouts.results[#"all"][entnum] = ent;
				dist_sq = distancesquared(self.origin, ent.origin);
				if(dist_sq < callouts.closest_dist_sq)
				{
					callouts.closest_dist_sq = dist_sq;
					callouts.closest_type = type;
				}
				callouts.results[type][entnum] = ent;
			}
		}
		if(isdefined(callouts.closest_type))
		{
			type = callouts.closest_type;
			foreach(ent in callouts.results[type])
			{
				ent.stealth.callout_next = gettime() + level.stealth.noteworthy.callout_debounce_guy;
			}
			level.stealth.noteworthy.callout_next = gettime() + level.stealth.noteworthy.callout_debounce_all;
			var_2a0b59fb = [];
			foreach(ent in callouts.results[type])
			{
				var_d853ee3f = stealth_noteworthy_entities(ent.origin, level.stealth.noteworthy.callout_bunch_radius, ent.team, 0, level.stealth.noteworthy.fakeactors_callout);
				foreach(other_ent in var_d853ee3f)
				{
					var_2a0b59fb[other_ent getentitynumber()] = other_ent;
					other_ent.stealth.callout_next = gettime() + level.stealth.noteworthy.callout_debounce_guy;
				}
			}
			foreach(ent in var_2a0b59fb)
			{
				callouts.results[type][ent getentitynumber()] = ent;
			}
			self stealth_noteworthy_delayed("callout_" + type, callouts.results[type], undefined, 0);
		}
	}
}

/*
	Name: stealth_noteworthy_callouts_init
	Namespace: stealth_player
	Checksum: 0x863A0357
	Offset: 0x2110
	Size: 0xD6
	Parameters: 0
	Flags: Linked, Private
*/
function private stealth_noteworthy_callouts_init()
{
	callouts = spawnstruct();
	callouts.results[#"left"] = [];
	callouts.results[#"right"] = [];
	callouts.results[#"ahead"] = [];
	callouts.results[#"behind"] = [];
	callouts.results[#"below"] = [];
	callouts.results[#"all"] = [];
	callouts.closest_type = undefined;
	callouts.closest_dist_sq = sqr(20000);
	return callouts;
}

/*
	Name: stealth_noteworthy_callout_type
	Namespace: stealth_player
	Checksum: 0x35E3D6CE
	Offset: 0x21F0
	Size: 0x1F2
	Parameters: 1
	Flags: Linked, Private
*/
function private stealth_noteworthy_callout_type(ent)
{
	type = undefined;
	var_bae3b774 = anglestoforward(self.angles);
	self_right = vectorcross(var_bae3b774, (0, 0, 1));
	dir = vectornormalize(ent.origin - self.origin);
	var_35a5aae = vectordot(var_bae3b774, dir);
	if(var_35a5aae > 0.7)
	{
		type = "ahead";
	}
	else
	{
		if(var_35a5aae < -0.6)
		{
			type = "behind";
		}
		else
		{
			height = ent.origin[2] - self.origin[2];
			if(var_35a5aae > 0 && height < -100)
			{
				type = "below";
			}
			else
			{
				dot_right = vectordot(self_right, dir);
				if(dot_right < -0.7)
				{
					type = "left";
				}
				else if(dot_right > 0.7)
				{
					type = "right";
				}
			}
		}
	}
	if(isdefined(type) && !is_true(level.stealth.noteworthy.callout_enabled[type]))
	{
		return undefined;
	}
	return type;
}

/*
	Name: stealth_noteworthy_visible
	Namespace: stealth_player
	Checksum: 0x24ED3E60
	Offset: 0x23F0
	Size: 0xF8
	Parameters: 2
	Flags: Linked, Private
*/
function private stealth_noteworthy_visible(other, var_5958f865)
{
	if(!util::within_fov(self.origin, self.angles, other.origin, 0.7))
	{
		return false;
	}
	eye = self geteye();
	if(isplayer(self))
	{
		eye = self getplayercamerapos();
	}
	if(stealth_noteworthy_trace(eye, other.origin, other))
	{
		return true;
	}
	if(var_5958f865 || stealth_noteworthy_trace(eye, other stealth_noteworthy_get_eye(), other))
	{
		return true;
	}
	return false;
}

/*
	Name: stealth_noteworthy_get_eye
	Namespace: stealth_player
	Checksum: 0x83DC5F46
	Offset: 0x24F0
	Size: 0x8A
	Parameters: 0
	Flags: Linked, Private
*/
function private stealth_noteworthy_get_eye()
{
	eye = self.origin + vectorscale((0, 0, 1), 50);
	if(isplayer(self))
	{
		eye = self getplayercamerapos();
	}
	else if(issentient(self))
	{
		eye = self geteye();
	}
	return eye;
}

/*
	Name: stealth_noteworthy_trace
	Namespace: stealth_player
	Checksum: 0x6E39337C
	Offset: 0x2588
	Size: 0x9A
	Parameters: 3
	Flags: Linked, Private
*/
function private stealth_noteworthy_trace(start, end, ignore_ent)
{
	level.stealth.noteworthy.callout_traces++;
	if(level.stealth.noteworthy.callout_traces > 3)
	{
		waitframe(1);
		level.stealth.noteworthy.callout_traces = 1;
	}
	return sighttracepassed(start, end, 0, self, ignore_ent);
}

/*
	Name: ambient_player_thread
	Namespace: stealth_player
	Checksum: 0x890B48AA
	Offset: 0x2630
	Size: 0x27A
	Parameters: 4
	Flags: Linked
*/
function ambient_player_thread(var_bfd9f922, var_ececce87, var_d572c578, var_4fb611ad)
{
	/#
		assert(isplayer(self));
	#/
	self notify(#"ambient_player_thread");
	self endon(#"ambient_player_thread", #"disconnect");
	if(!isdefined(var_bfd9f922))
	{
		var_bfd9f922 = 10;
	}
	if(!isdefined(var_ececce87))
	{
		var_ececce87 = 15;
	}
	if(!isdefined(var_d572c578))
	{
		var_d572c578 = 20;
	}
	if(!isdefined(var_4fb611ad))
	{
		var_4fb611ad = 40;
	}
	level.stealth.candidatesvoice = [];
	while(true)
	{
		if(!isalive(self))
		{
			waitframe(1);
			continue;
		}
		self flag::wait_till("stealth_enabled");
		if(level.stealth.candidatesvoice.size == 0)
		{
			wait(1);
		}
		else
		{
			wait(randomfloatrange(var_bfd9f922, var_ececce87));
		}
		if(level flag::get("stealth_spotted"))
		{
			continue;
		}
		level.stealth.candidatesvoice = self ambient_candidates(0, 1);
		if(level.stealth.candidatesvoice.size > 0)
		{
			speaker = level.stealth.candidatesvoice[0];
			type = "idle";
			if(isdefined(speaker.demeanoroverride) && speaker.demeanoroverride == "alert")
			{
				type = "idle_alert";
			}
			speaker thread namespace_979752dc::addeventplaybcs("stealth", type);
			speaker.stealth.vo_next_ambient = gettime() + (randomfloatrange(var_d572c578, var_4fb611ad) * 1000);
		}
	}
}

/*
	Name: ambient_candidates
	Namespace: stealth_player
	Checksum: 0xADCDD791
	Offset: 0x28B8
	Size: 0x362
	Parameters: 2
	Flags: Linked, Private
*/
function private ambient_candidates(var_af882d4b, var_b5e49a23)
{
	maxdist = 1000;
	candidates = [];
	if(!var_af882d4b && !var_b5e49a23)
	{
		return candidates;
	}
	if(var_af882d4b && !var_b5e49a23 && !namespace_bec1e8ca::exists("stealth", "radio", "convo"))
	{
		return candidates;
	}
	var_349e927f = function_e45cbe76(self.origin, maxdist, "axis");
	foreach(enemy in var_349e927f)
	{
		if(!var_af882d4b && !isalive(enemy))
		{
			continue;
		}
		if(!var_af882d4b && (!isdefined(enemy.stealth) || (issentient(enemy) && enemy.alertlevel == "combat")))
		{
			continue;
		}
		if(issentient(enemy) && enemy.ignoreall)
		{
			continue;
		}
		if(issentient(enemy) && !isdefined(enemy.stealth))
		{
			continue;
		}
		if(enemy isinscriptedstate())
		{
			continue;
		}
		if(isdefined(enemy.fnisinstealthidle) && !is_true(enemy [[enemy.fnisinstealthidle]]()))
		{
			continue;
		}
		if(enemy.species == "dog")
		{
			continue;
		}
		if(isdefined(enemy.stealth))
		{
			if(isdefined(enemy.stealth.vo_next_ambient) && gettime() < enemy.stealth.vo_next_ambient)
			{
				continue;
			}
			if(isdefined(enemy.stealth.last_sound_time) && (gettime() - enemy.stealth.last_sound_time) < 10000)
			{
				continue;
			}
			if(isdefined(enemy.stealth.last_severity_time) && (gettime() - enemy.stealth.last_severity_time) < 10000)
			{
				continue;
			}
		}
		candidates[candidates.size] = enemy;
	}
	candidates = arraysortclosest(candidates, self.origin);
	return candidates;
}

/*
	Name: ambient_player_stop
	Namespace: stealth_player
	Checksum: 0xFC8CCB46
	Offset: 0x2C28
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function ambient_player_stop()
{
	self notify(#"ambient_player_thread");
}

