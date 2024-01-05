#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\cp_common\util.gsc;

#namespace friendlyfire;

/*
	Name: __init__system__
	Namespace: friendlyfire
	Checksum: 0x56F629AB
	Offset: 0x180
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"friendlyfire", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: friendlyfire
	Checksum: 0xDD2CC5D8
	Offset: 0x1C8
	Size: 0x124
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.friendlyfirepoints[#"min_participation"] = -5;
	level.friendlyfirepoints[#"max_participation"] = 1000;
	level.friendlyfirepoints[#"enemy_kill_points"] = 250;
	level.friendlyfirepoints[#"friend_kill_points"] = -5;
	level.friendlyfirepoints[#"civ_kill_points"] = -5;
	level.friendlyfirepoints[#"point_loss_interval"] = 0.75;
	level.friendlyfiredamagepercentage = 0.5;
	if(sessionmodeiscampaigngame() && level.gametype !== "coop")
	{
		level.friendlyfiredisabled = 0;
	}
	if(!isdefined(level.friendlyfiredisabled))
	{
		level.friendlyfiredisabled = 0;
	}
	callback::on_connect(&init_player);
}

/*
	Name: init_player
	Namespace: friendlyfire
	Checksum: 0xAED2A1B0
	Offset: 0x2F8
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function init_player()
{
	/#
		assert(isdefined(self), "");
	#/
	self.participation = 0;
	/#
		self thread debug_friendlyfire();
	#/
	self thread participation_point_flattenovertime();
}

/*
	Name: debug_log
	Namespace: friendlyfire
	Checksum: 0xE184282A
	Offset: 0x360
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function debug_log(msg)
{
	/#
		if(getdvarstring(#"debug_friendlyfire") == "")
		{
			iprintlnbold(msg);
		}
		if(getdvarstring(#"debug_friendlyfire_log") == "")
		{
			println("" + msg);
		}
	#/
}

/*
	Name: function_25d6cf14
	Namespace: friendlyfire
	Checksum: 0x89F9CE4C
	Offset: 0x410
	Size: 0xEBC
	Parameters: 0
	Flags: Private
*/
function private function_25d6cf14()
{
	/#
		if(!isdefined(self.var_d5b6872a))
		{
			self.var_d5b6872a = spawnstruct();
			self.var_d5b6872a.fullpts = level.friendlyfirepoints[#"max_participation"] - level.friendlyfirepoints[#"min_participation"];
			self.var_d5b6872a.lbound = 520;
			self.var_d5b6872a.rbound = 620;
			self.var_d5b6872a.ypos = 130;
			self.var_d5b6872a.bar_width = self.var_d5b6872a.rbound - self.var_d5b6872a.lbound;
		}
		if(!isdefined(self.var_d5b6872a.friendly_fire))
		{
			self.var_d5b6872a.friendly_fire = newdebughudelem();
			self.var_d5b6872a.friendly_fire.fontscale = 3;
			self.var_d5b6872a.friendly_fire.alignx = "";
			self.var_d5b6872a.friendly_fire.aligny = "";
			self.var_d5b6872a.friendly_fire.x = (self.var_d5b6872a.rbound - (self.var_d5b6872a.bar_width * (level.friendlyfirepoints[#"max_participation"] / self.var_d5b6872a.fullpts))) - (log(self.participation) * self.var_d5b6872a.friendly_fire.fontscale);
			self.var_d5b6872a.friendly_fire.y = 100;
			self.var_d5b6872a.friendly_fire.alpha = 1;
		}
		if(!isdefined(self.var_d5b6872a.friendly_fire_lower_bound_label))
		{
			self.var_d5b6872a.friendly_fire_lower_bound_label = newdebughudelem();
			self.var_d5b6872a.friendly_fire_lower_bound_label.fontscale = 1.5;
			self.var_d5b6872a.friendly_fire_lower_bound_label.alignx = "";
			self.var_d5b6872a.friendly_fire_lower_bound_label.aligny = "";
			self.var_d5b6872a.friendly_fire_lower_bound_label.x = self.var_d5b6872a.lbound - (((ceil(max(log(abs(level.friendlyfirepoints[#"min_participation"])) / log(10), 0))) - 2) + (self.participation < 0) * self.var_d5b6872a.friendly_fire.fontscale);
			self.var_d5b6872a.friendly_fire_lower_bound_label.y = self.var_d5b6872a.ypos;
			self.var_d5b6872a.friendly_fire_lower_bound_label.alpha = 1;
			self.var_d5b6872a.friendly_fire_lower_bound_label setvalue(level.friendlyfirepoints[#"min_participation"]);
		}
		if(!isdefined(self.var_d5b6872a.friendly_fire_upper_bound_label))
		{
			self.var_d5b6872a.friendly_fire_upper_bound_label = newdebughudelem();
			self.var_d5b6872a.friendly_fire_upper_bound_label.fontscale = 1.5;
			self.var_d5b6872a.friendly_fire_upper_bound_label.alignx = "";
			self.var_d5b6872a.friendly_fire_upper_bound_label.aligny = "";
			self.var_d5b6872a.friendly_fire_upper_bound_label.x = self.var_d5b6872a.rbound + ((2 * ((ceil(max(log(abs(level.friendlyfirepoints[#"max_participation"])) / log(10), 0))) + 2.5) + (self.participation < 0)) * self.var_d5b6872a.friendly_fire.fontscale);
			self.var_d5b6872a.friendly_fire_upper_bound_label.y = self.var_d5b6872a.ypos;
			self.var_d5b6872a.friendly_fire_upper_bound_label.alpha = 1;
			self.var_d5b6872a.friendly_fire_upper_bound_label setvalue(level.friendlyfirepoints[#"max_participation"]);
		}
		if(!isdefined(self.var_d5b6872a.debug_health_bar_bg))
		{
			self.var_d5b6872a.debug_health_bar_bg = newdebughudelem(self);
			self.var_d5b6872a.debug_health_bar_bg.alignx = "";
			self.var_d5b6872a.debug_health_bar_bg.aligny = "";
			self.var_d5b6872a.debug_health_bar_bg.x = self.var_d5b6872a.rbound;
			self.var_d5b6872a.debug_health_bar_bg.y = self.var_d5b6872a.ypos;
			self.var_d5b6872a.debug_health_bar_bg.sort = 1;
			self.var_d5b6872a.debug_health_bar_bg.alpha = 1;
			self.var_d5b6872a.debug_health_bar_bg.foreground = 1;
			self.var_d5b6872a.debug_health_bar_bg.color = vectorscale((1, 1, 1), 0.4);
			self.var_d5b6872a.debug_health_bar_bg setshader(#"white", self.var_d5b6872a.bar_width, 9);
		}
		if(!isdefined(self.var_d5b6872a.debug_health_bar))
		{
			self.var_d5b6872a.debug_health_bar = newdebughudelem(self);
			self.var_d5b6872a.debug_health_bar.alignx = "";
			self.var_d5b6872a.debug_health_bar.aligny = "";
			self.var_d5b6872a.debug_health_bar.x = 620;
			self.var_d5b6872a.debug_health_bar.y = self.var_d5b6872a.ypos;
			self.var_d5b6872a.debug_health_bar.sort = 4;
			self.var_d5b6872a.debug_health_bar.alpha = 1;
			self.var_d5b6872a.debug_health_bar.foreground = 1;
			self.var_d5b6872a.debug_health_bar.color = vectorscale((0, 0, 1), 0.9);
			self.var_d5b6872a.debug_health_bar setshader(#"white", 4, 15);
		}
		if(!isdefined(self.var_d5b6872a.debug_health_bar_left_bound))
		{
			self.var_d5b6872a.debug_health_bar_left_bound = newdebughudelem(self);
			self.var_d5b6872a.debug_health_bar_left_bound.alignx = "";
			self.var_d5b6872a.debug_health_bar_left_bound.aligny = "";
			self.var_d5b6872a.debug_health_bar_left_bound.x = self.var_d5b6872a.lbound;
			self.var_d5b6872a.debug_health_bar_left_bound.y = self.var_d5b6872a.ypos;
			self.var_d5b6872a.debug_health_bar_left_bound.sort = 2;
			self.var_d5b6872a.debug_health_bar_left_bound.alpha = 1;
			self.var_d5b6872a.debug_health_bar_left_bound.foreground = 1;
			self.var_d5b6872a.debug_health_bar_left_bound setshader(#"black", 4, 21);
		}
		if(!isdefined(self.var_d5b6872a.debug_health_bar_right_bound))
		{
			self.var_d5b6872a.debug_health_bar_right_bound = newdebughudelem(self);
			self.var_d5b6872a.debug_health_bar_right_bound.alignx = "";
			self.var_d5b6872a.debug_health_bar_right_bound.aligny = "";
			self.var_d5b6872a.debug_health_bar_right_bound.x = self.var_d5b6872a.rbound;
			self.var_d5b6872a.debug_health_bar_right_bound.y = self.var_d5b6872a.ypos;
			self.var_d5b6872a.debug_health_bar_right_bound.sort = 2;
			self.var_d5b6872a.debug_health_bar_right_bound.alpha = 1;
			self.var_d5b6872a.debug_health_bar_right_bound.foreground = 1;
			self.var_d5b6872a.debug_health_bar_right_bound setshader(#"black", 4, 21);
		}
		if(!isdefined(self.var_d5b6872a.debug_health_bar_0_top))
		{
			self.var_d5b6872a.debug_health_bar_0_top = newdebughudelem(self);
			self.var_d5b6872a.debug_health_bar_0_top.alignx = "";
			self.var_d5b6872a.debug_health_bar_0_top.aligny = "";
			self.var_d5b6872a.debug_health_bar_0_top.x = self.var_d5b6872a.lbound + (((level.friendlyfirepoints[#"min_participation"] * -1) / self.var_d5b6872a.fullpts) * self.var_d5b6872a.bar_width);
			self.var_d5b6872a.debug_health_bar_0_top.y = self.var_d5b6872a.ypos + 9;
			self.var_d5b6872a.debug_health_bar_0_top.sort = 2;
			self.var_d5b6872a.debug_health_bar_0_top.alpha = 1;
			self.var_d5b6872a.debug_health_bar_0_top.foreground = 1;
			self.var_d5b6872a.debug_health_bar_0_top setshader(#"black", 4, 4);
		}
		if(!isdefined(self.var_d5b6872a.debug_health_bar_0_bottom))
		{
			self.var_d5b6872a.debug_health_bar_0_bottom = newdebughudelem(self);
			self.var_d5b6872a.debug_health_bar_0_bottom.alignx = "";
			self.var_d5b6872a.debug_health_bar_0_bottom.aligny = "";
			self.var_d5b6872a.debug_health_bar_0_bottom.x = self.var_d5b6872a.lbound + (((level.friendlyfirepoints[#"min_participation"] * -1) / self.var_d5b6872a.fullpts) * self.var_d5b6872a.bar_width);
			self.var_d5b6872a.debug_health_bar_0_bottom.y = self.var_d5b6872a.ypos - 9;
			self.var_d5b6872a.debug_health_bar_0_bottom.sort = 2;
			self.var_d5b6872a.debug_health_bar_0_bottom.alpha = 1;
			self.var_d5b6872a.debug_health_bar_0_bottom.foreground = 1;
			self.var_d5b6872a.debug_health_bar_0_bottom setshader(#"black", 4, 4);
		}
	#/
}

/*
	Name: debug_friendlyfire
	Namespace: friendlyfire
	Checksum: 0xBFA0BF8A
	Offset: 0x12D8
	Size: 0x498
	Parameters: 0
	Flags: None
*/
function debug_friendlyfire()
{
	/#
		self endon(#"disconnect", #"hash_1ff2bf35392915");
		if(getdvarstring(#"debug_friendlyfire") == "")
		{
			setdvar(#"debug_friendlyfire", "");
		}
		if(getdvarstring(#"debug_friendlyfire_log") == "")
		{
			setdvar(#"debug_friendlyfire_log", "");
		}
		for(;;)
		{
			function_25d6cf14();
			if(getdvarstring(#"debug_friendlyfire") == "")
			{
				self.var_d5b6872a.friendly_fire.alpha = 1;
				self.var_d5b6872a.friendly_fire_lower_bound_label.alpha = 1;
				self.var_d5b6872a.friendly_fire_upper_bound_label.alpha = 1;
				self.var_d5b6872a.debug_health_bar_bg.alpha = 1;
				self.var_d5b6872a.debug_health_bar.alpha = 1;
				self.var_d5b6872a.debug_health_bar_left_bound.alpha = 1;
				self.var_d5b6872a.debug_health_bar_right_bound.alpha = 1;
				self.var_d5b6872a.debug_health_bar_0_top.alpha = 1;
				self.var_d5b6872a.debug_health_bar_0_bottom.alpha = 1;
			}
			else
			{
				self.var_d5b6872a.friendly_fire.alpha = 0;
				self.var_d5b6872a.friendly_fire_lower_bound_label.alpha = 0;
				self.var_d5b6872a.friendly_fire_upper_bound_label.alpha = 0;
				self.var_d5b6872a.debug_health_bar_bg.alpha = 0;
				self.var_d5b6872a.debug_health_bar.alpha = 0;
				self.var_d5b6872a.debug_health_bar_left_bound.alpha = 0;
				self.var_d5b6872a.debug_health_bar_right_bound.alpha = 0;
				self.var_d5b6872a.debug_health_bar_0_top.alpha = 0;
				self.var_d5b6872a.debug_health_bar_0_bottom.alpha = 0;
			}
			xpos = ((level.friendlyfirepoints[#"max_participation"] - self.participation) / self.var_d5b6872a.fullpts) * self.var_d5b6872a.bar_width;
			self.var_d5b6872a.debug_health_bar.x = self.var_d5b6872a.rbound - xpos;
			self.var_d5b6872a.friendly_fire setvalue(self.participation);
			self.var_d5b6872a.friendly_fire.x = (self.var_d5b6872a.rbound - (self.var_d5b6872a.bar_width * (level.friendlyfirepoints[#"max_participation"] / self.var_d5b6872a.fullpts))) + ((((ceil(max(log(abs(self.participation)) / log(10), 0))) + 1) + (self.participation < 0) * self.var_d5b6872a.friendly_fire.fontscale) * 2);
			wait(0.25);
		}
	#/
}

/*
	Name: check_warlord_killed
	Namespace: friendlyfire
	Checksum: 0x9109D787
	Offset: 0x1778
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function check_warlord_killed(entity)
{
	if(entity.archetype === "warlord_soldier")
	{
		return entity.shieldhealth <= 0;
	}
	return 0;
}

/*
	Name: friendly_fire_callback
	Namespace: friendlyfire
	Checksum: 0x24EDB188
	Offset: 0x17B8
	Size: 0x5DC
	Parameters: 4
	Flags: None
*/
function friendly_fire_callback(entity, damage, attacker, method)
{
	if(!isdefined(entity))
	{
		return;
	}
	if(!isdefined(entity.team))
	{
		entity.team = #"allies";
	}
	if(!isdefined(entity))
	{
		return;
	}
	warlord_was_killed = check_warlord_killed(entity);
	if(entity.health <= 0)
	{
		if(!warlord_was_killed)
		{
			return;
		}
	}
	if(level.friendlyfiredisabled)
	{
		return;
	}
	if(is_true(entity.nofriendlyfire))
	{
		return;
	}
	if(!isdefined(attacker))
	{
		return;
	}
	bplayersdamage = 0;
	if(isplayer(attacker))
	{
		bplayersdamage = 1;
	}
	else if(isdefined(attacker.classname) && attacker.classname == "script_vehicle")
	{
		owner = attacker getvehicleowner();
		if(isdefined(owner))
		{
			if(isplayer(owner))
			{
				if(!isdefined(owner.friendlyfire_attacker_not_vehicle_owner))
				{
					bplayersdamage = 1;
					attacker = owner;
				}
			}
		}
	}
	if(!bplayersdamage)
	{
		return;
	}
	same_team = entity.team == attacker.team;
	if(attacker.team == #"allies")
	{
		if(entity.team == #"neutral" && !is_true(level.ignoreneutralfriendlyfire))
		{
			same_team = 1;
		}
	}
	same_team = same_team | util::function_9b7092ef(entity.team, attacker.team);
	if(entity.team != #"neutral" || (entity.team == #"neutral" && !is_true(level.ignoreneutralfriendlyfire)))
	{
		attacker.last_hit_team = entity.team;
	}
	killed = damage >= entity.health || warlord_was_killed;
	if(!entity.allowdeath)
	{
		killed = 0;
	}
	if(!same_team)
	{
		if(killed)
		{
			attacker.participation = attacker.participation + level.friendlyfirepoints[#"enemy_kill_points"];
			attacker participation_point_cap();
			debug_log(("Enemy killed: +") + level.friendlyfirepoints[#"enemy_kill_points"]);
		}
		return;
	}
	if(isdefined(entity.no_friendly_fire_penalty))
	{
		return;
	}
	if((isdefined(attacker.participation) ? attacker.participation : 0) > 0)
	{
		attacker.participation = 0;
	}
	if(killed)
	{
		if(entity.archetype === #"civilian" || entity.team == #"neutral")
		{
			level notify(#"player_killed_civ");
			attacker.participation = attacker.participation + level.friendlyfirepoints[#"civ_kill_points"];
			debug_log(("Civilian killed: -") + (0 - level.friendlyfirepoints[#"civ_kill_points"]));
		}
		else
		{
			if(isdefined(entity) && isdefined(entity.ff_kill_penalty))
			{
				attacker.participation = attacker.participation + entity.ff_kill_penalty;
				debug_log(("Friendly killed with custom penalty: -") + (0 - entity.ff_kill_penalty));
			}
			else
			{
				attacker.participation = attacker.participation + level.friendlyfirepoints[#"friend_kill_points"];
				debug_log(("Friendly killed: -") + (0 - level.friendlyfirepoints[#"friend_kill_points"]));
			}
		}
	}
	else
	{
		attacker.participation = attacker.participation - 1;
		debug_log(("Friendly hurt: -") + damage);
	}
	attacker participation_point_cap();
	if(check_grenade(entity, method) && savecommit_aftergrenade())
	{
		return;
	}
	attacker friendly_fire_checkpoints();
}

/*
	Name: friendly_fire_think
	Namespace: friendlyfire
	Checksum: 0xD0FBE7D
	Offset: 0x1DA0
	Size: 0x698
	Parameters: 1
	Flags: None
*/
function friendly_fire_think(entity)
{
	level endon(#"hash_fef7dac2cb38596");
	entity endon(#"no_friendly_fire");
	if(!isdefined(entity))
	{
		return;
	}
	if(!isdefined(entity.team))
	{
		entity.team = #"allies";
	}
	for(;;)
	{
		if(!isdefined(entity))
		{
			return;
		}
		waitresult = undefined;
		waitresult = entity waittill(#"damage");
		attacker = waitresult.attacker;
		damage = waitresult.amount;
		method = waitresult.mod;
		if(level.friendlyfiredisabled)
		{
			continue;
		}
		if(!isdefined(entity))
		{
			return;
		}
		if(is_true(entity.nofriendlyfire))
		{
			continue;
		}
		if(!isdefined(attacker))
		{
			continue;
		}
		bplayersdamage = 0;
		if(isplayer(attacker))
		{
			bplayersdamage = 1;
		}
		else if(isdefined(attacker.classname) && attacker.classname == "script_vehicle")
		{
			owner = attacker getvehicleowner();
			if(isdefined(owner))
			{
				if(isplayer(owner))
				{
					if(!isdefined(owner.friendlyfire_attacker_not_vehicle_owner))
					{
						bplayersdamage = 1;
						attacker = owner;
					}
				}
			}
		}
		if(!bplayersdamage)
		{
			continue;
		}
		same_team = entity.team == attacker.team;
		if(attacker.team == #"allies")
		{
			if(entity.team == #"neutral" && !is_true(level.ignoreneutralfriendlyfire))
			{
				same_team = 1;
			}
		}
		same_team = same_team | util::function_9b7092ef(entity.team, attacker.team);
		if(entity.team != #"neutral" || (entity.team == #"neutral" && !is_true(level.ignoreneutralfriendlyfire)))
		{
			attacker.last_hit_team = entity.team;
		}
		killed = damage >= entity.health;
		if(!entity.allowdeath)
		{
			killed = 0;
		}
		if(!same_team)
		{
			if(killed)
			{
				attacker.participation = attacker.participation + level.friendlyfirepoints[#"enemy_kill_points"];
				attacker participation_point_cap();
				debug_log(("Enemy killed: +") + level.friendlyfirepoints[#"enemy_kill_points"]);
			}
			return;
		}
		if(isdefined(entity.no_friendly_fire_penalty))
		{
			continue;
		}
		if((isdefined(attacker.participation) ? attacker.participation : 0) > 0)
		{
			attacker.participation = 0;
		}
		if(killed)
		{
			if(entity.archetype === #"civilian" || entity.team == #"neutral")
			{
				level notify(#"player_killed_civ");
				if(attacker.participation <= 0)
				{
					attacker.participation = attacker.participation + level.friendlyfirepoints[#"min_participation"];
					debug_log("Civilian killed with negative score, autofail!");
				}
				else
				{
					attacker.participation = attacker.participation + level.friendlyfirepoints[#"civ_kill_points"];
					debug_log(("Civilian killed: -") + (0 - level.friendlyfirepoints[#"civ_kill_points"]));
				}
			}
			else
			{
				if(isdefined(entity) && isdefined(entity.ff_kill_penalty))
				{
					attacker.participation = attacker.participation + entity.ff_kill_penalty;
					debug_log(("Friendly killed with custom penalty: -") + (0 - entity.ff_kill_penalty));
				}
				else
				{
					attacker.participation = attacker.participation + level.friendlyfirepoints[#"friend_kill_points"];
					debug_log(("Friendly killed: -") + (0 - level.friendlyfirepoints[#"friend_kill_points"]));
				}
			}
		}
		else
		{
			attacker.participation = attacker.participation - 1;
			debug_log(("Friendly hurt: -") + damage);
		}
		attacker participation_point_cap();
		if(check_grenade(entity, method) && savecommit_aftergrenade())
		{
			if(killed)
			{
				return;
			}
			continue;
		}
		attacker friendly_fire_checkpoints();
	}
}

/*
	Name: friendly_fire_checkpoints
	Namespace: friendlyfire
	Checksum: 0x5BE917B9
	Offset: 0x2440
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function friendly_fire_checkpoints()
{
	if(self.participation <= level.friendlyfirepoints[#"min_participation"])
	{
		self thread missionfail();
	}
}

/*
	Name: check_grenade
	Namespace: friendlyfire
	Checksum: 0x759DF049
	Offset: 0x2488
	Size: 0x8E
	Parameters: 2
	Flags: None
*/
function check_grenade(entity, method)
{
	if(!isdefined(entity))
	{
		return 0;
	}
	wasgrenade = 0;
	if(isdefined(entity.damageweapon) && entity.damageweapon.name == "none")
	{
		wasgrenade = 1;
	}
	if(isdefined(method) && method == "MOD_GRENADE_SPLASH")
	{
		wasgrenade = 1;
	}
	return wasgrenade;
}

/*
	Name: savecommit_aftergrenade
	Namespace: friendlyfire
	Checksum: 0x397365D5
	Offset: 0x2520
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function savecommit_aftergrenade()
{
	currenttime = gettime();
	if(currenttime < 4500)
	{
		/#
			println("");
		#/
		return true;
	}
	return false;
}

/*
	Name: participation_point_cap
	Namespace: friendlyfire
	Checksum: 0xDD0CC89C
	Offset: 0x2570
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function participation_point_cap()
{
	if(!isdefined(self.participation))
	{
		/#
			assertmsg("");
		#/
		return;
	}
	if(self.participation > level.friendlyfirepoints[#"max_participation"])
	{
		self.participation = level.friendlyfirepoints[#"max_participation"];
	}
	if(self.participation < level.friendlyfirepoints[#"min_participation"])
	{
		self.participation = level.friendlyfirepoints[#"min_participation"];
	}
}

/*
	Name: participation_point_flattenovertime
	Namespace: friendlyfire
	Checksum: 0x3A5EE90
	Offset: 0x2628
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function participation_point_flattenovertime()
{
	level endon(#"friendly_fire_terminate");
	self endon(#"disconnect");
	for(;;)
	{
		if(self.participation > 0)
		{
			self.participation--;
		}
		wait(level.friendlyfirepoints[#"point_loss_interval"]);
	}
}

/*
	Name: turnbackon
	Namespace: friendlyfire
	Checksum: 0xC1D4CFF4
	Offset: 0x2698
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function turnbackon()
{
	level.friendlyfiredisabled = 0;
}

/*
	Name: turnoff
	Namespace: friendlyfire
	Checksum: 0x1AEDEE90
	Offset: 0x26B0
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function turnoff()
{
	level.friendlyfiredisabled = 1;
}

/*
	Name: missionfail
	Namespace: friendlyfire
	Checksum: 0xF593D044
	Offset: 0x26D0
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function missionfail()
{
	self endon(#"death");
	level endon(#"hash_2a5bc3aedd245590");
	self.participation = 0;
	self.lives = 0;
	if(self.last_hit_team === #"neutral")
	{
		util::missionfailedwrapper_nodeath(#"hash_293687c2ffb1b911", #"hash_7d45646726cd7f74");
	}
	else
	{
		util::missionfailedwrapper_nodeath(#"hash_23aab5a843404b78", #"hash_7d45646726cd7f74");
	}
}

/*
	Name: function_708f45ad
	Namespace: friendlyfire
	Checksum: 0x2B20B03A
	Offset: 0x27A8
	Size: 0x4A
	Parameters: 0
	Flags: None
*/
function function_708f45ad()
{
	self endon(#"death");
	level endon(#"hash_2a5bc3aedd245590");
	self.participation = 0;
	wait(0.05);
	self.participation = 0;
}

/*
	Name: notifydamage
	Namespace: friendlyfire
	Checksum: 0xE470CF37
	Offset: 0x2800
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function notifydamage(entity)
{
	level endon(#"hash_fef7dac2cb38596");
	entity endon(#"death");
	for(;;)
	{
		entity notify(#"friendlyfire_notify", entity waittill(#"damage"));
	}
}

/*
	Name: notifydamagenotdone
	Namespace: friendlyfire
	Checksum: 0x99292B10
	Offset: 0x2878
	Size: 0x68
	Parameters: 1
	Flags: None
*/
function notifydamagenotdone(entity)
{
	level endon(#"hash_fef7dac2cb38596");
	waitresult = undefined;
	waitresult = entity waittill(#"damage_notdone");
	waitresult.amount = -1;
	entity notify(#"friendlyfire_notify", waitresult);
}

/*
	Name: notifydeath
	Namespace: friendlyfire
	Checksum: 0xE6ECE22B
	Offset: 0x28E8
	Size: 0x68
	Parameters: 1
	Flags: None
*/
function notifydeath(entity)
{
	level endon(#"hash_fef7dac2cb38596");
	waitresult = undefined;
	waitresult = entity waittill(#"death");
	waitresult.amount = -1;
	entity notify(#"friendlyfire_notify", waitresult);
}

