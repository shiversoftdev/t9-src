#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace smart_bomb;

/*
	Name: function_c6f75619
	Namespace: smart_bomb
	Checksum: 0xD3E5F3AF
	Offset: 0x160
	Size: 0x1B4
	Parameters: 0
	Flags: Linked
*/
function function_c6f75619()
{
	self.last_jump_chance_time = 0;
	self.fovcosine = 0;
	self.fovcosinebusy = 0;
	self.delete_on_death = 1;
	self.health = self.healthdefault;
	self vehicle::friendly_fire_shield();
	/#
		assert(isdefined(self.scriptbundlesettings));
	#/
	self.settings = getscriptbundle(self.scriptbundlesettings);
	if(self.settings.aim_assist)
	{
		self enableaimassist();
	}
	if(self.settings.ignorelaststandplayers === 1)
	{
		self.ignorelaststandplayers = 1;
	}
	self setneargoalnotifydist(self.settings.near_goal_notify_dist);
	self.goalradius = 999999;
	self.goalheight = 999999;
	self setgoal(self.origin, 0, self.goalradius, self.goalheight);
	self.allowfriendlyfiredamageoverride = &function_bf16c9ed;
	self.do_death_fx = &do_death_fx;
	self.canbemeleed = 0;
	self thread vehicle_ai::nudge_collision();
	self thread sndfunctions();
}

/*
	Name: state_scripted_update
	Namespace: smart_bomb
	Checksum: 0x92D6CE97
	Offset: 0x320
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function state_scripted_update(params)
{
	self endon(#"change_state", #"death");
	driver = self getseatoccupant(0);
	if(isplayer(driver))
	{
		driver endon(#"disconnect");
		driver util::waittill_attack_button_pressed();
		self kill(self.origin, driver);
	}
}

/*
	Name: state_death_update
	Namespace: smart_bomb
	Checksum: 0x1740DC9
	Offset: 0x3D8
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function state_death_update(params)
{
	self endon(#"death");
	attacker = params.inflictor;
	if(!isdefined(attacker))
	{
		attacker = params.attacker;
	}
	waitframe(1);
	damage_on_death = self.damage_on_death;
	if(isdefined(attacker) && !is_true(self.detonate_sides_disabled))
	{
		if(attacker !== self && (!isdefined(self.owner) || self.owner !== attacker) && (isai(attacker) || isplayer(attacker)))
		{
			damage_on_death = 0;
			self detonate_sides(attacker);
		}
	}
	self.damage_on_death = damage_on_death;
	self vehicle_ai::defaultstate_death_update();
}

/*
	Name: state_emped_update
	Namespace: smart_bomb
	Checksum: 0xD36C1E9B
	Offset: 0x510
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function state_emped_update(params)
{
	self endon(#"death", #"change_state");
	if(self.servershortout === 1)
	{
		forward = vectornormalize((self getvelocity()[0], self getvelocity()[1], 0));
		side = vectorcross(forward, (0, 0, 1)) * math::randomsign();
		self function_a57c34b7((self.origin + (side * 500)) + (forward * randomfloat(400)), 0, 0);
		wait(0.6);
		self function_d4c687c9();
		self waittilltimeout(1.5, #"veh_collision");
		self kill(self.origin, self.abnormal_status.attacker, self.abnormal_status.inflictor, getweapon(#"emp"));
	}
	else
	{
		vehicle_ai::defaultstate_emped_update(params);
	}
}

/*
	Name: state_combat_update
	Namespace: smart_bomb
	Checksum: 0x7A76623C
	Offset: 0x6E0
	Size: 0x9D4
	Parameters: 1
	Flags: Linked
*/
function state_combat_update(params)
{
	self endon(#"change_state", #"death");
	pathfailcount = 0;
	foundpath = 1;
	self thread prevent_stuck();
	self thread detonation_monitor();
	for(;;)
	{
		if(is_true(self.inpain))
		{
			wait(0.1);
			continue;
		}
		if(!isdefined(self.enemy))
		{
			if(isdefined(self.settings.all_knowing))
			{
				self force_get_enemies();
			}
			self setspeed(self.settings.defaultmovespeed * 0.35);
			pixbeginevent();
			queryresult = positionquery_source_navigation(self.origin, 0, self.settings.max_move_dist * 3, self.settings.max_move_dist * 3, self.radius * 2, self, self.radius * 4);
			pixendevent();
			positionquery_filter_inclaimedlocation(queryresult, self);
			positionquery_filter_distancetogoal(queryresult, self);
			vehicle_ai::positionquery_filter_outofgoalanchor(queryresult);
			best_point = undefined;
			best_score = -999999;
			foreach(point in queryresult.data)
			{
				/#
					if(!isdefined(point._scoredebug))
					{
						point._scoredebug = [];
					}
					if(!isdefined(point._scoredebug[#"disttoorigin"]))
					{
						point._scoredebug[#"disttoorigin"] = spawnstruct();
					}
					point._scoredebug[#"disttoorigin"].score = mapfloat(0, 200, 0, 100, point.disttoorigin2d);
					point._scoredebug[#"disttoorigin"].scorename = "";
				#/
				point.score = point.score + mapfloat(0, 200, 0, 100, point.disttoorigin2d);
				if(point.inclaimedlocation)
				{
					/#
						if(!isdefined(point._scoredebug))
						{
							point._scoredebug = [];
						}
						if(!isdefined(point._scoredebug[#"inclaimedlocation"]))
						{
							point._scoredebug[#"inclaimedlocation"] = spawnstruct();
						}
						point._scoredebug[#"inclaimedlocation"].score = -500;
						point._scoredebug[#"inclaimedlocation"].scorename = "";
					#/
					point.score = point.score + -500;
				}
				/#
					if(!isdefined(point._scoredebug))
					{
						point._scoredebug = [];
					}
					if(!isdefined(point._scoredebug[#"random"]))
					{
						point._scoredebug[#"random"] = spawnstruct();
					}
					point._scoredebug[#"random"].score = randomfloatrange(0, 50);
					point._scoredebug[#"random"].scorename = "";
				#/
				point.score = point.score + randomfloatrange(0, 50);
				if(isdefined(self.prevmovedir))
				{
					movedir = vectornormalize(point.origin - self.origin);
					if(vectordot(movedir, self.prevmovedir) > 0.64)
					{
						/#
							if(!isdefined(point._scoredebug))
							{
								point._scoredebug = [];
							}
							if(!isdefined(point._scoredebug[#"currentmovedir"]))
							{
								point._scoredebug[#"currentmovedir"] = spawnstruct();
							}
							point._scoredebug[#"currentmovedir"].score = randomfloatrange(50, 150);
							point._scoredebug[#"currentmovedir"].scorename = "";
						#/
						point.score = point.score + randomfloatrange(50, 150);
					}
				}
				if(point.score > best_score)
				{
					best_score = point.score;
					best_point = point;
				}
			}
			self vehicle_ai::positionquery_debugscores(queryresult);
			foundpath = 0;
			if(isdefined(best_point))
			{
				foundpath = self function_a57c34b7(best_point.origin, 0, 1);
			}
			else
			{
				wait(1);
			}
			if(foundpath)
			{
				self.prevmovedir = vectornormalize(best_point.origin - self.origin);
				self.current_pathto_pos = undefined;
				self thread path_update_interrupt();
				pathfailcount = 0;
				self vehicle_ai::waittill_pathing_done();
			}
			else
			{
				wait(1);
			}
			continue;
		}
		if(!self.enemy.allowdeath && issentient(self.enemy) && self getpersonalthreatbias(self.enemy) == 0)
		{
			self setpersonalthreatbias(self.enemy, -2000, 30);
			waitframe(1);
			continue;
		}
		foundpath = hunt_enemy();
		if(!foundpath)
		{
			pathfailcount++;
			if(pathfailcount > 2)
			{
				/#
				#/
				if(isdefined(self.enemy) && issentient(self.enemy))
				{
					self setpersonalthreatbias(self.enemy, -2000, 5);
				}
				if(isdefined(self.settings.max_path_fail_count) && pathfailcount > self.settings.max_path_fail_count)
				{
					detonate();
				}
			}
			wait(0.2);
			pixbeginevent();
			queryresult = positionquery_source_navigation(self.origin, 0, self.settings.max_move_dist, self.settings.max_move_dist, self.radius, self);
			pixendevent();
			if(queryresult.data.size)
			{
				point = queryresult.data[randomint(queryresult.data.size)];
				self function_a57c34b7(point.origin, 0, 0);
				self.current_pathto_pos = undefined;
				self thread path_update_interrupt();
				wait(2);
				self notify(#"near_goal");
			}
		}
		wait(0.2);
	}
}

/*
	Name: hunt_enemy
	Namespace: smart_bomb
	Checksum: 0xFC324848
	Offset: 0x10C0
	Size: 0x60A
	Parameters: 0
	Flags: Linked
*/
function hunt_enemy()
{
	foundpath = 0;
	targetpos = function_dcecac3c();
	if(isdefined(targetpos))
	{
		if(distancesquared(self.origin, targetpos) > sqr(400) && self isposinclaimedlocation(targetpos))
		{
			pixbeginevent();
			queryresult = positionquery_source_navigation(targetpos, 0, self.settings.max_move_dist, self.settings.max_move_dist, self.radius, self);
			pixendevent();
			positionquery_filter_inclaimedlocation(queryresult, self.enemy);
			best_point = undefined;
			best_score = -999999;
			foreach(point in queryresult.data)
			{
				/#
					if(!isdefined(point._scoredebug))
					{
						point._scoredebug = [];
					}
					if(!isdefined(point._scoredebug[#"disttoorigin"]))
					{
						point._scoredebug[#"disttoorigin"] = spawnstruct();
					}
					point._scoredebug[#"disttoorigin"].score = mapfloat(0, 200, 0, -200, distance(point.origin, queryresult.origin));
					point._scoredebug[#"disttoorigin"].scorename = "";
				#/
				point.score = point.score + (mapfloat(0, 200, 0, -200, distance(point.origin, queryresult.origin)));
				/#
					if(!isdefined(point._scoredebug))
					{
						point._scoredebug = [];
					}
					if(!isdefined(point._scoredebug[#"heighttoorigin"]))
					{
						point._scoredebug[#"heighttoorigin"] = spawnstruct();
					}
					point._scoredebug[#"heighttoorigin"].score = mapfloat(50, 200, 0, -200, abs(point.origin[2] - queryresult.origin[2]));
					point._scoredebug[#"heighttoorigin"].scorename = "";
				#/
				point.score = point.score + (mapfloat(50, 200, 0, -200, abs(point.origin[2] - queryresult.origin[2])));
				if(point.inclaimedlocation === 1)
				{
					/#
						if(!isdefined(point._scoredebug))
						{
							point._scoredebug = [];
						}
						if(!isdefined(point._scoredebug[#"inclaimedlocation"]))
						{
							point._scoredebug[#"inclaimedlocation"] = spawnstruct();
						}
						point._scoredebug[#"inclaimedlocation"].score = -500;
						point._scoredebug[#"inclaimedlocation"].scorename = "";
					#/
					point.score = point.score + -500;
				}
				if(point.score > best_score)
				{
					best_score = point.score;
					best_point = point;
				}
			}
			self vehicle_ai::positionquery_debugscores(queryresult);
			if(isdefined(best_point))
			{
				targetpos = best_point.origin;
			}
		}
		foundpath = self function_a57c34b7(targetpos, 0, 1);
		if(self.test_failed_path === 1)
		{
			foundpath = vehicle_ai::waittill_pathresult(0.5);
		}
		if(foundpath)
		{
			self.current_pathto_pos = targetpos;
			self thread path_update_interrupt();
			pathfailcount = 0;
			self vehicle_ai::waittill_pathing_done();
		}
		else
		{
			waitframe(1);
		}
	}
	return foundpath;
}

/*
	Name: prevent_stuck
	Namespace: smart_bomb
	Checksum: 0xB254C66A
	Offset: 0x16D8
	Size: 0x11E
	Parameters: 0
	Flags: Linked
*/
function prevent_stuck()
{
	self endon(#"change_state", #"death");
	self notify(#"end_prevent_stuck");
	self endon(#"end_prevent_stuck");
	wait(2);
	count = 0;
	previous_origin = undefined;
	while(true)
	{
		if(isdefined(previous_origin) && distancesquared(previous_origin, self.origin) < sqr(0.1) && !is_true(level.bzm_worldpaused))
		{
			count++;
		}
		else
		{
			previous_origin = self.origin;
			count = 0;
		}
		if(count > 10)
		{
			detonate();
		}
		wait(1);
	}
}

/*
	Name: check_detonation_dist
	Namespace: smart_bomb
	Checksum: 0xEE0E8FE8
	Offset: 0x1800
	Size: 0x14C
	Parameters: 2
	Flags: Linked
*/
function check_detonation_dist(origin, enemy)
{
	if(isdefined(enemy) && isalive(enemy))
	{
		enemy_look_dir_offst = anglestoforward(enemy.angles) * 30;
		targetpoint = enemy.origin + enemy_look_dir_offst;
		if(distance2dsquared(targetpoint, origin) < sqr(self.settings.detonation_distance) && ((abs(targetpoint[2] - origin[2])) < self.settings.detonation_distance || (abs((targetpoint[2] - self.settings.jump_height) - origin[2])) < self.settings.detonation_distance))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: jump_detonate
	Namespace: smart_bomb
	Checksum: 0x84CF9DF9
	Offset: 0x1958
	Size: 0x23C
	Parameters: 0
	Flags: Linked
*/
function jump_detonate()
{
	if(isdefined(self.sndalias[#"jump_up"]))
	{
		self playsound(self.sndalias[#"jump_up"]);
	}
	self launchvehicle((0, 0, 1) * self.jumpforce, (0, 0, 0), 1);
	self.is_jumping = 1;
	wait(0.4);
	time_to_land = 0.6;
	while(time_to_land > 0)
	{
		if(check_detonation_dist(self.origin, self.enemy))
		{
			self detonate();
		}
		waitframe(1);
		time_to_land = time_to_land - 0.05;
	}
	if(isalive(self))
	{
		self.is_jumping = 0;
		trace = physicstrace(self.origin + (0, 0, self.radius * 2), self.origin - vectorscale((0, 0, 1), 1000), vectorscale((-1, -1, -1), 10), vectorscale((1, 1, 1), 10), self, 2);
		willfall = 1;
		if(trace[#"fraction"] < 1)
		{
			pos = trace[#"position"];
			pos_on_navmesh = getclosestpointonnavmesh(pos, 100, self.radius, 4194287);
			if(isdefined(pos_on_navmesh))
			{
				willfall = 0;
			}
		}
		if(willfall)
		{
			self detonate();
		}
	}
}

/*
	Name: detonate
	Namespace: smart_bomb
	Checksum: 0xEBC87CAC
	Offset: 0x1BA0
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function detonate(attacker)
{
	if(!isdefined(attacker))
	{
		attacker = self;
	}
	if(isdefined(self.owner) && isbot(self.owner) && isdefined(self.killstreaktype) && self.killstreaktype == "recon_car")
	{
		self notify(#"shutdown");
	}
	else
	{
		self stopsounds();
		self dodamage(self.health + 1000, self.origin, attacker, self, "none", "MOD_EXPLOSIVE", 0, self.turretweapon);
	}
}

/*
	Name: detonation_monitor
	Namespace: smart_bomb
	Checksum: 0x3A40232D
	Offset: 0x1C88
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function detonation_monitor()
{
	self endon(#"death", #"change_state");
	lastenemy = undefined;
	while(true)
	{
		wait(0.2);
		try_detonate();
		if(isdefined(self.var_345c5167))
		{
			[[self.var_345c5167]]();
		}
		else
		{
			function_ded83def(lastenemy);
		}
	}
}

/*
	Name: function_ded83def
	Namespace: smart_bomb
	Checksum: 0x9AD1001D
	Offset: 0x1D28
	Size: 0x450
	Parameters: 1
	Flags: Linked
*/
function function_ded83def(lastenemy)
{
	if(isdefined(self.enemy) && isplayer(self.enemy))
	{
		if(lastenemy !== self.enemy)
		{
			lastdisttoenemysquared = 1E+08;
			lastenemy = self.enemy;
		}
		if(!isdefined(self.looping_targeting_sound))
		{
			if(isdefined(self.sndalias[#"vehalarm"]))
			{
				self.looping_targeting_sound = spawn("script_origin", self.origin);
				self.looping_targeting_sound linkto(self);
				self.looping_targeting_sound setinvisibletoall();
				self.looping_targeting_sound setvisibletoplayer(self.enemy);
				self.looping_targeting_sound playloopsound(self.sndalias[#"vehalarm"]);
				self.looping_targeting_sound thread function_47dbd72(self);
			}
		}
		enemy = self.enemy;
		enemy_origin = enemy.origin;
		if(isplayer(enemy) && enemy isinvehicle())
		{
			enemy_vehicle = enemy getvehicleoccupied();
			enemy_origin = enemy_vehicle.origin;
		}
		disttoenemysquared = distancesquared(self.origin, enemy_origin);
		if(disttoenemysquared < sqr(250))
		{
			if(lastdisttoenemysquared > sqr(250) && !is_true(self.servershortout) && isdefined(self.sndalias[#"vehclose250"]))
			{
				self playsoundtoplayer(self.sndalias[#"vehclose250"], self.enemy);
			}
		}
		else
		{
			if(disttoenemysquared < sqr(750))
			{
				if(lastdisttoenemysquared > sqr(750) && !is_true(self.servershortout) && isdefined(self.sndalias[#"vehtargeting"]))
				{
					self playsoundtoplayer(self.sndalias[#"vehtargeting"], self.enemy);
				}
			}
			else if(disttoenemysquared < sqr(1500))
			{
				if(lastdisttoenemysquared > sqr(1500) && !is_true(self.servershortout) && isdefined(self.sndalias[#"vehclose1500"]))
				{
					self playsoundtoplayer(self.sndalias[#"vehclose1500"], self.enemy);
				}
			}
		}
		if(disttoenemysquared < lastdisttoenemysquared)
		{
			lastdisttoenemysquared = disttoenemysquared;
		}
		lastdisttoenemysquared = lastdisttoenemysquared + sqr(10);
	}
}

/*
	Name: function_47dbd72
	Namespace: smart_bomb
	Checksum: 0x72C70E8B
	Offset: 0x2180
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_47dbd72(bomb)
{
	bomb waittill(#"death");
	if(isdefined(bomb))
	{
		bomb stopsounds();
	}
	if(isdefined(self))
	{
		self stoploopsound();
		self delete();
	}
}

/*
	Name: try_detonate
	Namespace: smart_bomb
	Checksum: 0xA317ECF7
	Offset: 0x2208
	Size: 0x470
	Parameters: 0
	Flags: Linked
*/
function try_detonate()
{
	if(is_true(self.disableautodetonation))
	{
		return;
	}
	jump_time = 0.5;
	cur_time = gettime();
	if(isdefined(self.enemy))
	{
		var_8abb9239 = self.origin;
		jump_chance = self.settings.jump_chance;
		if(isdefined(jump_chance) && jump_chance > 0)
		{
			can_jump = 1;
			if(can_jump)
			{
				jump_origin = self.origin + (self getvelocity() * jump_time);
				centroid = self.enemy getcentroid();
				if(centroid[2] - self.settings.jump_height > jump_origin[2])
				{
					jump_chance = 1;
				}
				if(randomfloat(1) <= jump_chance)
				{
					var_8abb9239 = jump_origin;
					self.last_jump_chance_time = cur_time;
					jump = 1;
				}
			}
		}
		if(isdefined(var_8abb9239) && check_detonation_dist(var_8abb9239, self.enemy))
		{
			trace = bullettrace(var_8abb9239 + (0, 0, self.radius), self.enemy.origin + (0, 0, self.radius), 1, self);
			if(trace[#"fraction"] === 1 || isdefined(trace[#"entity"]))
			{
				if(is_true(jump))
				{
					self jump_detonate();
				}
				else
				{
					self detonate();
				}
			}
		}
	}
	if(isdefined(self.team))
	{
		a_enemies = function_f6f34851(self.team);
		if(!isdefined(a_enemies) || a_enemies.size == 0)
		{
			return;
		}
		a_enemies = arraysortclosest(a_enemies, self.origin, 2, 0, self.settings.detonation_distance);
		foreach(player in a_enemies)
		{
			if(!isdefined(self.enemy) || player != self.enemy)
			{
				if(player isnotarget() || !isalive(player) || player laststand::player_is_in_laststand())
				{
					continue;
				}
				if(player.ignoreme === 1)
				{
					continue;
				}
				trace = bullettrace(self.origin + (0, 0, self.radius), player.origin + (0, 0, self.radius), 1, self);
				if(trace[#"fraction"] === 1 || isdefined(trace[#"entity"]))
				{
					self detonate();
				}
			}
		}
	}
}

/*
	Name: function_dcecac3c
	Namespace: smart_bomb
	Checksum: 0x743E2962
	Offset: 0x2680
	Size: 0x37C
	Parameters: 0
	Flags: Linked
*/
function function_dcecac3c()
{
	if(isdefined(self.settings.all_knowing))
	{
		if(isdefined(self.enemy))
		{
			target_pos = self.enemy.origin;
		}
	}
	else
	{
		target_pos = vehicle_ai::gettargetpos(vehicle_ai::getenemytarget());
	}
	enemy = self.enemy;
	if(isdefined(target_pos))
	{
		target_pos_onnavmesh = getclosestpointonnavmesh(target_pos, self.settings.detonation_distance * 1.5, self.radius, 4194287);
	}
	if(!isdefined(target_pos_onnavmesh))
	{
		if(isdefined(self.enemy) && issentient(self.enemy))
		{
			self setpersonalthreatbias(self.enemy, -2000, 5);
		}
		if(isdefined(self.current_pathto_pos))
		{
			target_pos_onnavmesh = getclosestpointonnavmesh(self.current_pathto_pos, self.settings.detonation_distance * 2, self.settings.detonation_distance * 1.5, 4194287);
		}
		if(isdefined(target_pos_onnavmesh))
		{
			return target_pos_onnavmesh;
		}
		return self.current_pathto_pos;
	}
	if(isdefined(self.enemy) && issentient(self.enemy))
	{
		if(distancesquared(target_pos, target_pos_onnavmesh) > sqr(self.settings.detonation_distance * 0.9))
		{
			self setpersonalthreatbias(self.enemy, -2000, 5);
		}
	}
	if(isdefined(enemy) && isplayer(enemy))
	{
		enemy_vel_offset = enemy getvelocity() * 0.5;
		enemy_look_dir_offset = anglestoforward(enemy.angles);
		if(distance2dsquared(self.origin, enemy.origin) > sqr(500))
		{
			enemy_look_dir_offset = enemy_look_dir_offset * 110;
		}
		else
		{
			enemy_look_dir_offset = enemy_look_dir_offset * 35;
		}
		offset = enemy_vel_offset + enemy_look_dir_offset;
		offset = (offset[0], offset[1], 0);
		if(tracepassedonnavmesh(target_pos_onnavmesh, target_pos + offset))
		{
			target_pos = target_pos + offset;
		}
		else
		{
			target_pos = target_pos_onnavmesh;
		}
	}
	else
	{
		target_pos = target_pos_onnavmesh;
	}
	return target_pos;
}

/*
	Name: path_update_interrupt
	Namespace: smart_bomb
	Checksum: 0xF25678CC
	Offset: 0x2A08
	Size: 0x364
	Parameters: 0
	Flags: Linked
*/
function path_update_interrupt()
{
	self endon(#"death", #"change_state", #"near_goal", #"reached_end_node");
	self notify(#"path_update_interrupt");
	self endon(#"path_update_interrupt");
	wait(0.1);
	while(true)
	{
		if(isdefined(self.current_pathto_pos))
		{
			if(distance2dsquared(self.current_pathto_pos, self.goalpos) > sqr(self.goalradius))
			{
				wait(0.5);
				self notify(#"near_goal");
			}
			targetpos = function_dcecac3c();
			if(isdefined(targetpos))
			{
				if(distancesquared(self.origin, targetpos) > sqr(400))
				{
					repath_range = self.settings.repath_range * 2;
					wait(0.1);
				}
				else
				{
					repath_range = self.settings.repath_range;
				}
				if(distance2dsquared(self.current_pathto_pos, targetpos) > sqr(repath_range))
				{
					if(isdefined(self.sndalias) && isdefined(self.sndalias[#"direction"]))
					{
						self playsound(self.sndalias[#"direction"]);
					}
					self notify(#"near_goal");
				}
			}
			if(isdefined(self.enemy) && isplayer(self.enemy) && !isdefined(self.slow_trigger))
			{
				forward = anglestoforward(self.enemy getplayerangles());
				var_d3d5462f = self.origin - self.enemy.origin;
				speedtouse = self.settings.defaultmovespeed;
				if(vectordot(forward, var_d3d5462f) > 0)
				{
					self setspeed(speedtouse);
				}
				else
				{
					self setspeed(speedtouse * 0.75);
				}
			}
			else
			{
				speedtouse = self.settings.defaultmovespeed;
				self setspeed(speedtouse);
			}
			wait(0.2);
		}
		else
		{
			wait(0.4);
		}
	}
}

/*
	Name: function_bf16c9ed
	Namespace: smart_bomb
	Checksum: 0x73D614BF
	Offset: 0x2D78
	Size: 0xFA
	Parameters: 4
	Flags: Linked
*/
function function_bf16c9ed(einflictor, eattacker, smeansofdeath, weapon)
{
	if(isdefined(self.owner) && eattacker == self.owner && isdefined(self.settings.friendly_fire) && int(self.settings.friendly_fire) && !weapon.isemp)
	{
		return true;
	}
	if(isdefined(eattacker) && (isdefined(eattacker.archetype) && eattacker.archetype != #"bot") && isdefined(smeansofdeath) && smeansofdeath == "MOD_EXPLOSIVE")
	{
		return true;
	}
	return false;
}

/*
	Name: detonate_sides
	Namespace: smart_bomb
	Checksum: 0x62EB65C7
	Offset: 0x2E80
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function detonate_sides(einflictor)
{
	forward_direction = anglestoforward(self.angles);
	up_direction = anglestoup(self.angles);
	origin = self.origin + vectorscale(up_direction, 15);
	right_direction = vectorcross(forward_direction, up_direction);
	right_direction = vectornormalize(right_direction);
	left_direction = vectorscale(right_direction, -1);
	einflictor cylinderdamage(vectorscale(right_direction, 140), origin, 15, 50, self.radiusdamagemax, self.radiusdamagemax / 5, self, "MOD_EXPLOSIVE", self.turretweapon);
	einflictor cylinderdamage(vectorscale(left_direction, 140), origin, 15, 50, self.radiusdamagemax, self.radiusdamagemax / 5, self, "MOD_EXPLOSIVE", self.turretweapon);
}

/*
	Name: function_ec8d8bbc
	Namespace: smart_bomb
	Checksum: 0xD78A7DE0
	Offset: 0x2FE8
	Size: 0x2E8
	Parameters: 15
	Flags: None
*/
function function_ec8d8bbc(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(self.drop_deploying === 1 && modelindex == "MOD_TRIGGER_HURT" && (!isdefined(self.hurt_trigger_immune_end_time) || gettime() < self.hurt_trigger_immune_end_time))
	{
		return 0;
	}
	if(isdefined(psoffsettime) && (isdefined(psoffsettime.archetype) && psoffsettime.archetype != #"bot") && isdefined(modelindex) && modelindex == "MOD_EXPLOSIVE")
	{
		if(psoffsettime != self && isdefined(vsurfacenormal) && lengthsquared(vsurfacenormal) > 0.1 && (!isdefined(psoffsettime) || psoffsettime.team === self.team) && (!isdefined(vdamageorigin) || vdamageorigin.team === self.team))
		{
			self setvehvelocity(self.velocity + (vectornormalize(vsurfacenormal) * 300));
			return 1;
		}
	}
	if(vehicle_ai::should_emp(self, partname, modelindex, vdamageorigin, psoffsettime))
	{
		minempdowntime = 0.8 * self.settings.empdowntime;
		maxempdowntime = 1.2 * self.settings.empdowntime;
		self notify(#"emped", {#pararm2:vdamageorigin, #param1:psoffsettime, #param0:randomfloatrange(minempdowntime, maxempdowntime)});
	}
	if(vehicle_ai::should_burn(self, partname, modelindex, vdamageorigin, psoffsettime))
	{
		self thread vehicle_ai::burning_thread(psoffsettime, vdamageorigin);
	}
	return damagefromunderneath;
}

/*
	Name: force_get_enemies
	Namespace: smart_bomb
	Checksum: 0xC328C852
	Offset: 0x32D8
	Size: 0xBA
	Parameters: 0
	Flags: Linked
*/
function force_get_enemies()
{
	foreach(player in level.players)
	{
		if(self util::isenemyplayer(player) && !player.ignoreme)
		{
			self getperfectinfo(player);
			return;
		}
	}
}

/*
	Name: sndfunctions
	Namespace: smart_bomb
	Checksum: 0xCB03C228
	Offset: 0x33A0
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function sndfunctions()
{
	if(self isdrivableplayervehicle())
	{
		self thread function_dd7a181d();
	}
	else
	{
		self thread function_2a91d5ee();
		if(sessionmodeiscampaigngame() || sessionmodeiszombiesgame())
		{
			self thread function_12857be3();
		}
	}
}

/*
	Name: function_dd7a181d
	Namespace: smart_bomb
	Checksum: 0x4ECDE2E6
	Offset: 0x3438
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function function_dd7a181d()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"veh_landed");
		if(isdefined(self.sndalias[#"land"]))
		{
			self playsound(self.sndalias[#"land"]);
		}
	}
}

/*
	Name: function_2a91d5ee
	Namespace: smart_bomb
	Checksum: 0x852DA0ED
	Offset: 0x34C0
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_2a91d5ee()
{
	self endon(#"death");
	if(!sessionmodeiscampaigngame() && !sessionmodeiszombiesgame())
	{
		self waittill(#"veh_landed");
	}
	while(true)
	{
		self waittill(#"veh_inair");
		if(isdefined(self.sndalias[#"inair"]))
		{
			self playsound(self.sndalias[#"inair"]);
		}
		self waittill(#"veh_landed");
		if(isdefined(self.sndalias[#"land"]))
		{
			self playsound(self.sndalias[#"land"]);
		}
	}
}

/*
	Name: function_12857be3
	Namespace: smart_bomb
	Checksum: 0x10A677B3
	Offset: 0x35F8
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function function_12857be3()
{
	self endon(#"death");
	wait(randomfloatrange(0.25, 1.5));
	if(isdefined(self.sndalias[#"spawn"]))
	{
		if(isdefined(self.enemy) && isdefined(self.enemy.team))
		{
			foreach(player in level.players)
			{
				if(player.team == self.enemy.team)
				{
					self playsoundtoplayer(self.sndalias[#"spawn"], player);
				}
			}
		}
		else
		{
			self playsound(self.sndalias[#"spawn"]);
		}
	}
}

/*
	Name: isdrivableplayervehicle
	Namespace: smart_bomb
	Checksum: 0x4F385CFD
	Offset: 0x3768
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function isdrivableplayervehicle()
{
	str_vehicletype = self.vehicletype;
	if(isdefined(str_vehicletype) && self.var_46439e18)
	{
		return true;
	}
	return false;
}

/*
	Name: do_death_fx
	Namespace: smart_bomb
	Checksum: 0xEEAC14F0
	Offset: 0x37A8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function do_death_fx()
{
	self vehicle::do_death_dynents();
	self clientfield::set("deathfx", 1);
}

