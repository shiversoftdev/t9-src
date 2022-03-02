#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\statemachine_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace vehicle_ai;

/*
	Name: function_89f2df9
	Namespace: vehicle_ai
	Checksum: 0x568E8F10
	Offset: 0x2B0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"vehicle_ai", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: vehicle_ai
	Checksum: 0xE0271FD7
	Offset: 0x2F8
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	animation::add_notetrack_func("vehicle_ai::SetRotorSpeedCallback", &function_7ae52016);
}

/*
	Name: entityisarchetype
	Namespace: vehicle_ai
	Checksum: 0x193CA452
	Offset: 0x330
	Size: 0xAA
	Parameters: 2
	Flags: Linked
*/
function entityisarchetype(entity, archetype)
{
	if(!isdefined(entity))
	{
		return false;
	}
	if(isplayer(entity) && entity.usingvehicle && isdefined(entity.viewlockedentity) && entity.viewlockedentity.archetype === archetype)
	{
		return true;
	}
	if(isvehicle(entity) && entity.archetype === archetype)
	{
		return true;
	}
	return false;
}

/*
	Name: getenemytarget
	Namespace: vehicle_ai
	Checksum: 0x3C976E49
	Offset: 0x3E8
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function getenemytarget()
{
	if(isdefined(self.enemy) && self cansee(self.enemy))
	{
		return self.enemy;
	}
	if(isdefined(self.enemylastseenpos))
	{
		return self.enemylastseenpos;
	}
	return undefined;
}

/*
	Name: gettargetpos
	Namespace: vehicle_ai
	Checksum: 0xCC48E012
	Offset: 0x448
	Size: 0xF2
	Parameters: 2
	Flags: Linked
*/
function gettargetpos(target, geteye)
{
	pos = undefined;
	if(isdefined(target))
	{
		if(isvec(target))
		{
			pos = target;
		}
		else
		{
			if(is_true(geteye) && issentient(target))
			{
				pos = target geteye();
			}
			else
			{
				if(isentity(target))
				{
					pos = target.origin;
				}
				else if(isdefined(target.origin) && isvec(target.origin))
				{
					pos = target.origin;
				}
			}
		}
	}
	return pos;
}

/*
	Name: gettargeteyeoffset
	Namespace: vehicle_ai
	Checksum: 0xB9DF10C8
	Offset: 0x548
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function gettargeteyeoffset(target)
{
	offset = (0, 0, 0);
	if(isdefined(target) && issentient(target))
	{
		offset = target geteye() - target.origin;
	}
	return offset;
}

/*
	Name: fire_for_time
	Namespace: vehicle_ai
	Checksum: 0xDD32F472
	Offset: 0x5B8
	Size: 0x1B4
	Parameters: 4
	Flags: Linked
*/
function fire_for_time(totalfiretime, turretidx, target, intervalscale)
{
	if(!isdefined(intervalscale))
	{
		intervalscale = 1;
	}
	self endon(#"death", #"change_state");
	if(!isdefined(turretidx))
	{
		turretidx = 0;
	}
	self notify("fire_stop" + turretidx);
	self endon("fire_stop" + turretidx);
	weapon = self seatgetweapon(turretidx);
	if(!isdefined(weapon) || weapon.name == #"none" || weapon.firetime <= 0)
	{
		/#
			println(((("" + turretidx) + "") + self getentnum() + "") + self.model);
		#/
		return;
	}
	firetime = weapon.firetime * intervalscale;
	firecount = (int(floor(totalfiretime / firetime))) + 1;
	__fire_for_rounds_internal(firecount, firetime, turretidx, target);
}

/*
	Name: fire_for_rounds
	Namespace: vehicle_ai
	Checksum: 0xA0A96F0B
	Offset: 0x778
	Size: 0x134
	Parameters: 3
	Flags: Linked
*/
function fire_for_rounds(firecount, turretidx, target)
{
	self endon(#"death", #"fire_stop", #"change_state");
	if(!isdefined(turretidx))
	{
		turretidx = 0;
	}
	weapon = self seatgetweapon(turretidx);
	if(!isdefined(weapon) || weapon.name == #"none" || weapon.firetime <= 0)
	{
		/#
			println(((("" + turretidx) + "") + self getentnum() + "") + self.model);
		#/
		return;
	}
	__fire_for_rounds_internal(firecount, weapon.firetime, turretidx, target);
}

/*
	Name: __fire_for_rounds_internal
	Namespace: vehicle_ai
	Checksum: 0x7D1E8A5E
	Offset: 0x8B8
	Size: 0x102
	Parameters: 4
	Flags: Linked
*/
function __fire_for_rounds_internal(firecount, fireinterval, turretidx, target)
{
	self endon(#"death", #"fire_stop", #"change_state");
	/#
		assert(isdefined(turretidx));
	#/
	if(isdefined(target))
	{
		target endon(#"death");
	}
	counter = 0;
	while(counter < firecount)
	{
		if(self.avoid_shooting_owner === 1 && self owner_in_line_of_fire())
		{
			wait(fireinterval);
			continue;
		}
		self fireturret(turretidx, target);
		counter++;
		wait(fireinterval);
	}
}

/*
	Name: owner_in_line_of_fire
	Namespace: vehicle_ai
	Checksum: 0xF028BDB
	Offset: 0x9C8
	Size: 0x124
	Parameters: 0
	Flags: Linked
*/
function owner_in_line_of_fire()
{
	if(!isdefined(self.owner))
	{
		return 0;
	}
	dist_squared_to_owner = distancesquared(self.owner.origin, self.origin);
	line_of_fire_dot = (dist_squared_to_owner < 9216 ? 0.866 : 0.9848);
	gun_angles = self gettagangles((isdefined(self.avoid_shooting_owner_ref_tag) ? self.avoid_shooting_owner_ref_tag : "tag_flash"));
	if(!isdefined(gun_angles))
	{
		return 0;
	}
	gun_forward = anglestoforward(gun_angles);
	dot = vectordot(gun_forward, vectornormalize(self.owner.origin - self.origin));
	return dot > line_of_fire_dot;
}

/*
	Name: setturrettarget
	Namespace: vehicle_ai
	Checksum: 0xDC5A67B7
	Offset: 0xAF8
	Size: 0x54
	Parameters: 3
	Flags: None
*/
function setturrettarget(target, turretidx, offset)
{
	if(!isdefined(turretidx))
	{
		turretidx = 0;
	}
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	self turretsettarget(turretidx, target, offset);
}

/*
	Name: fireturret
	Namespace: vehicle_ai
	Checksum: 0x160B6CE7
	Offset: 0xB58
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function fireturret(turretidx, target, offset)
{
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	self fireweapon(turretidx, target, offset, self);
}

/*
	Name: airfollow
	Namespace: vehicle_ai
	Checksum: 0xB4B82971
	Offset: 0xBB0
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function airfollow(target)
{
	/#
		assert(isairborne(self));
	#/
	if(!isdefined(target))
	{
		return;
	}
	if(isdefined(self.host))
	{
		arrayremovevalue(self.host.airfollowers, self);
	}
	self.host = target;
	if(!isdefined(target.airfollowers))
	{
		target.airfollowers = [];
	}
	if(!isdefined(target.airfollowers))
	{
		target.airfollowers = [];
	}
	else if(!isarray(target.airfollowers))
	{
		target.airfollowers = array(target.airfollowers);
	}
	target.airfollowers[target.airfollowers.size] = self;
}

/*
	Name: getairfollowindex
	Namespace: vehicle_ai
	Checksum: 0x98952753
	Offset: 0xCC8
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function getairfollowindex()
{
	/#
		assert(isairborne(self));
	#/
	if(!isdefined(self.host))
	{
		return undefined;
	}
	for(i = 0; i < self.host.airfollowers.size; i++)
	{
		if(self === self.host.airfollowers[i])
		{
			return i;
		}
	}
	return undefined;
}

/*
	Name: getairfollowingposition
	Namespace: vehicle_ai
	Checksum: 0xE879E275
	Offset: 0xD68
	Size: 0x1CC
	Parameters: 1
	Flags: Linked
*/
function getairfollowingposition(userelativeangletohost)
{
	/#
		assert(isairborne(self));
	#/
	index = self getairfollowindex();
	if(!isdefined(index))
	{
		return undefined;
	}
	offset = getairfollowingoffset(self.host, index);
	if(!isdefined(offset))
	{
		return undefined;
	}
	origin = getairfollowingorigin();
	if(!userelativeangletohost)
	{
		return origin + offset;
	}
	angles = undefined;
	if(isdefined(self.host.airfollowconfig) && self.host.airfollowconfig.tag !== "")
	{
		angles = self.host gettagangles(self.host.airfollowconfig.tag);
	}
	else
	{
		if(isplayer(self.host))
		{
			angles = self.host getplayerangles();
		}
		else
		{
			angles = self.host.angles;
		}
	}
	yawangles = (0, angles[1], 0);
	newoffset = rotatepoint(offset, yawangles);
	return origin + newoffset;
}

/*
	Name: getairfollowingorigin
	Namespace: vehicle_ai
	Checksum: 0x7233D6D4
	Offset: 0xF40
	Size: 0xDA
	Parameters: 0
	Flags: Linked
*/
function getairfollowingorigin()
{
	/#
		assert(isairborne(self));
	#/
	origin = (self.host.origin + self.host.mins) + self.host.maxs;
	if(isdefined(self.host.airfollowconfig) && self.host.airfollowconfig.tag !== "")
	{
		origin = self.host gettagorigin(self.host.airfollowconfig.tag);
	}
	return origin;
}

/*
	Name: getairfollowinglength
	Namespace: vehicle_ai
	Checksum: 0xE5627A91
	Offset: 0x1028
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function getairfollowinglength(targetent)
{
	distance = undefined;
	if(isdefined(targetent) && isdefined(targetent.airfollowconfig))
	{
		distance = targetent.airfollowconfig.distance;
	}
	else
	{
		size = self.host.maxs - self.host.mins;
		distance = 0.5 * length(size);
		distance = 0.5 * (distance + size[2]);
	}
	return distance;
}

/*
	Name: getairfollowingoffset
	Namespace: vehicle_ai
	Checksum: 0xDEE750FA
	Offset: 0x10E8
	Size: 0xCC
	Parameters: 2
	Flags: Linked
*/
function getairfollowingoffset(targetent, index)
{
	numberofpoints = 8;
	pitchrange = 90;
	if(isdefined(targetent) && isdefined(targetent.airfollowconfig))
	{
		numberofpoints = targetent.airfollowconfig.numberofpoints;
		pitchrange = targetent.airfollowconfig.pitchrange;
	}
	distance = getairfollowinglength(targetent);
	if(index >= numberofpoints)
	{
		return undefined;
	}
	dir = math::point_on_sphere_even_distribution(pitchrange, index, numberofpoints);
	return dir * distance;
}

/*
	Name: javelin_losetargetatrighttime
	Namespace: vehicle_ai
	Checksum: 0xAA5EA25C
	Offset: 0x11C0
	Size: 0x150
	Parameters: 2
	Flags: Linked
*/
function javelin_losetargetatrighttime(target, gunnerindex)
{
	self endon(#"death");
	if(isdefined(gunnerindex))
	{
		firedgunnerindex = -1;
		while(firedgunnerindex != gunnerindex)
		{
			waitresult = undefined;
			waitresult = self waittill(#"gunner_weapon_fired");
			firedgunnerindex = waitresult.gunner_index;
			projarray = waitresult.projectile;
		}
	}
	else
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_fired");
		projarray = waitresult.projectile;
	}
	if(!isdefined(projarray))
	{
		return;
	}
	foreach(proj in projarray)
	{
		self thread javelin_losetargetatrighttimeprojectile(proj, target);
	}
}

/*
	Name: javelin_losetargetatrighttimeprojectile
	Namespace: vehicle_ai
	Checksum: 0x90E6D14A
	Offset: 0x1318
	Size: 0x134
	Parameters: 2
	Flags: Linked
*/
function javelin_losetargetatrighttimeprojectile(proj, target)
{
	self endon(#"death");
	proj endon(#"death");
	wait(2);
	sound_played = undefined;
	while(isdefined(target))
	{
		if(proj getvelocity()[2] < -150)
		{
			distsq = distancesquared(proj.origin, target.origin);
			if(!isdefined(sound_played) && distsq <= sqr(1400))
			{
				proj playsound(#"prj_quadtank_javelin_incoming");
				sound_played = 1;
			}
			if(distsq < sqr(1200))
			{
				proj missile_settarget(undefined);
				break;
			}
		}
		wait(0.1);
	}
}

/*
	Name: waittill_pathing_done
	Namespace: vehicle_ai
	Checksum: 0x9FB647BD
	Offset: 0x1458
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function waittill_pathing_done(maxtime)
{
	if(!isdefined(maxtime))
	{
		maxtime = 15;
	}
	self endon(#"change_state");
	result = undefined;
	result = self waittilltimeout(maxtime, #"near_goal", #"force_goal", #"reached_end_node", #"pathfind_failed");
}

/*
	Name: waittill_pathresult
	Namespace: vehicle_ai
	Checksum: 0x48BE9B2E
	Offset: 0x14E8
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function waittill_pathresult(maxtime)
{
	if(!isdefined(maxtime))
	{
		maxtime = 0.5;
	}
	self endon(#"change_state");
	result = undefined;
	result = self waittilltimeout(maxtime, #"pathfind_failed", #"pathfind_succeeded", #"change_state");
	succeeded = result._notify === "pathfind_succeeded";
	return succeeded;
}

/*
	Name: waittill_asm_terminated
	Namespace: vehicle_ai
	Checksum: 0xF5D99608
	Offset: 0x1590
	Size: 0x7E
	Parameters: 0
	Flags: Linked
*/
function waittill_asm_terminated()
{
	self endon(#"death");
	self notify(#"end_asm_terminated_thread");
	self endon(#"end_asm_terminated_thread");
	self waittill(#"asm_terminated");
	self notify(#"asm_complete", {#substate:"__terminated__"});
}

/*
	Name: waittill_asm_timeout
	Namespace: vehicle_ai
	Checksum: 0x338B1F27
	Offset: 0x1618
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function waittill_asm_timeout(timeout)
{
	self endon(#"death");
	self notify(#"end_asm_timeout_thread");
	self endon(#"end_asm_timeout_thread");
	wait(timeout);
	self notify(#"asm_complete", {#substate:"__timeout__"});
}

/*
	Name: waittill_asm_complete
	Namespace: vehicle_ai
	Checksum: 0x56B2952A
	Offset: 0x16A0
	Size: 0x106
	Parameters: 2
	Flags: Linked
*/
function waittill_asm_complete(substate_to_wait, timeout)
{
	if(!isdefined(timeout))
	{
		timeout = 10;
	}
	self endon(#"death");
	self thread waittill_asm_terminated();
	self thread waittill_asm_timeout(timeout);
	substate = undefined;
	while(!isdefined(substate) || (substate != substate_to_wait && substate != "__terminated__" && substate != "__timeout__"))
	{
		waitresult = undefined;
		waitresult = self waittill(#"asm_complete");
		substate = waitresult.substate;
	}
	self notify(#"end_asm_terminated_thread");
	self notify(#"end_asm_timeout_thread");
}

/*
	Name: throw_off_balance
	Namespace: vehicle_ai
	Checksum: 0xE915D917
	Offset: 0x17B0
	Size: 0x1DC
	Parameters: 4
	Flags: None
*/
function throw_off_balance(damagetype, hitpoint, hitdirection, hitlocationinfo)
{
	if(hitdirection == "MOD_EXPLOSIVE" || hitdirection == "MOD_GRENADE_SPLASH" || hitdirection == "MOD_PROJECTILE_SPLASH")
	{
		self setvehvelocity(self.velocity + (vectornormalize(hitlocationinfo) * 300));
		ang_vel = self getangularvelocity();
		ang_vel = ang_vel + (randomfloatrange(-300, 300), randomfloatrange(-300, 300), randomfloatrange(-300, 300));
		self setangularvelocity(ang_vel);
	}
	else
	{
		ang_vel = self getangularvelocity();
		yaw_vel = randomfloatrange(-320, 320);
		yaw_vel = yaw_vel + (math::sign(yaw_vel) * 150);
		ang_vel = ang_vel + (randomfloatrange(-150, 150), yaw_vel, randomfloatrange(-150, 150));
		self setangularvelocity(ang_vel);
	}
}

/*
	Name: predicted_collision
	Namespace: vehicle_ai
	Checksum: 0x8EFCBE6B
	Offset: 0x1998
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function predicted_collision()
{
	self endon(#"crash_done", #"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"veh_predictedcollision");
		if(waitresult.normal[2] >= 0.6)
		{
			self notify(#"veh_collision", waitresult);
			callback::callback(#"veh_collision", waitresult);
		}
	}
}

/*
	Name: collision_fx
	Namespace: vehicle_ai
	Checksum: 0x84682583
	Offset: 0x1A50
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function collision_fx(normal)
{
	tilted = normal[2] < 0.6;
	fx_origin = self.origin - (normal * (tilted ? 28 : 10));
	self playsound(#"veh_wasp_wall_imp");
}

/*
	Name: nudge_collision
	Namespace: vehicle_ai
	Checksum: 0x1DBDE99C
	Offset: 0x1AD0
	Size: 0x422
	Parameters: 0
	Flags: Linked
*/
function nudge_collision()
{
	self endon(#"crash_done", #"power_off_done", #"death");
	self notify(#"end_nudge_collision");
	self endon(#"end_nudge_collision");
	if(self.notsolid === 1)
	{
		return;
	}
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"veh_collision");
		velocity = waitresult.velocity;
		normal = waitresult.normal;
		ang_vel = self getangularvelocity() * 0.5;
		self setangularvelocity(ang_vel);
		empedoroff = self get_current_state() === "emped" || self get_current_state() === "off";
		if(isalive(self) && (normal[2] < 0.6 || !empedoroff))
		{
			self setvehvelocity(self.velocity + (normal * 90));
			self collision_fx(normal);
		}
		else
		{
			if(empedoroff)
			{
				if(isdefined(self.bounced))
				{
					self playsound(#"veh_wasp_wall_imp");
					self setvehvelocity((0, 0, 0));
					self setangularvelocity((0, 0, 0));
					pitch = self.angles[0];
					pitch = math::sign(pitch) * math::clamp(abs(pitch), 10, 15);
					self.angles = (pitch, self.angles[1], self.angles[2]);
					self.bounced = undefined;
					self notify(#"landed");
					return;
				}
				self.bounced = 1;
				self setvehvelocity(self.velocity + (normal * 30));
				self collision_fx(normal);
			}
			else
			{
				impact_vel = abs(vectordot(velocity, normal));
				if(normal[2] < 0.6 && impact_vel < 100)
				{
					self setvehvelocity(self.velocity + (normal * 90));
					self collision_fx(normal);
				}
				else
				{
					self playsound(#"veh_wasp_ground_death");
					self thread vehicle_death::death_fire_loop_audio();
					self notify(#"crash_done");
				}
			}
		}
	}
}

/*
	Name: level_out_for_landing
	Namespace: vehicle_ai
	Checksum: 0xE9E2E8D8
	Offset: 0x1F00
	Size: 0xFE
	Parameters: 0
	Flags: None
*/
function level_out_for_landing()
{
	self endon(#"death", #"change_state", #"landed");
	while(true)
	{
		velocity = self.velocity;
		self.angles = (self.angles[0] * 0.85, self.angles[1], self.angles[2] * 0.85);
		ang_vel = self getangularvelocity() * 0.85;
		self setangularvelocity(ang_vel);
		self setvehvelocity(velocity + (vectorscale((0, 0, -1), 60)));
		waitframe(1);
	}
}

/*
	Name: immolate
	Namespace: vehicle_ai
	Checksum: 0xCFA5F403
	Offset: 0x2008
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function immolate(attacker)
{
	self endon(#"death");
	self thread burning_thread(attacker, attacker);
}

/*
	Name: burning_thread
	Namespace: vehicle_ai
	Checksum: 0xA85B92EB
	Offset: 0x2050
	Size: 0x28C
	Parameters: 2
	Flags: Linked
*/
function burning_thread(attacker, inflictor)
{
	self endon(#"death");
	self notify(#"end_immolating_thread");
	self endon(#"end_immolating_thread");
	damagepersecond = self.settings.burn_damagepersecond;
	if(!isdefined(damagepersecond) || damagepersecond <= 0)
	{
		return;
	}
	secondsperonedamage = 1 / float(damagepersecond);
	if(!isdefined(self.abnormal_status))
	{
		self.abnormal_status = spawnstruct();
	}
	if(self.abnormal_status.burning !== 1)
	{
		self vehicle::toggle_burn_fx(1);
	}
	self.abnormal_status.burning = 1;
	self.abnormal_status.attacker = attacker;
	self.abnormal_status.inflictor = inflictor;
	lastingtime = self.settings.burn_lastingtime;
	if(!isdefined(lastingtime))
	{
		lastingtime = 999999;
	}
	starttime = gettime();
	interval = max(secondsperonedamage, 0.5);
	damage = 0;
	while(util::timesince(starttime) < lastingtime)
	{
		previoustime = gettime();
		wait(interval);
		damage = damage + (util::timesince(previoustime) * damagepersecond);
		damageint = int(damage);
		self dodamage(damageint, self.origin, attacker, self, "none", "MOD_BURNED");
		damage = damage - damageint;
	}
	self.abnormal_status.burning = 0;
	self vehicle::toggle_burn_fx(0);
}

/*
	Name: iff_notifymeinnsec
	Namespace: vehicle_ai
	Checksum: 0xB27B3D9D
	Offset: 0x22E8
	Size: 0x36
	Parameters: 2
	Flags: Linked
*/
function iff_notifymeinnsec(time, note)
{
	self endon(#"death");
	wait(time);
	self notify(note);
}

/*
	Name: iff_override
	Namespace: vehicle_ai
	Checksum: 0xCFB81397
	Offset: 0x2328
	Size: 0x1E4
	Parameters: 2
	Flags: None
*/
function iff_override(owner, time)
{
	if(!isdefined(time))
	{
		time = 60;
	}
	self endon(#"death");
	self._iffoverride_oldteam = self.team;
	self iff_override_team_switch_behavior(owner.team);
	if(isdefined(self.iff_override_cb))
	{
		self [[self.iff_override_cb]](1);
	}
	if(isdefined(self.settings) && !is_true(self.settings.iffshouldrevertteam))
	{
		return;
	}
	timeout = (isdefined(self.settings) ? self.settings.ifftimetillrevert : time);
	/#
		assert(timeout > 10);
	#/
	self thread iff_notifymeinnsec(timeout - 10, "iff_override_revert_warn");
	msg = undefined;
	msg = self waittilltimeout(timeout, #"iff_override_reverted");
	if(msg == "timeout")
	{
		self notify(#"iff_override_reverted");
	}
	self playsound(#"gdt_iff_deactivate");
	self iff_override_team_switch_behavior(self._iffoverride_oldteam);
	if(isdefined(self.iff_override_cb))
	{
		self [[self.iff_override_cb]](0);
	}
}

/*
	Name: iff_override_team_switch_behavior
	Namespace: vehicle_ai
	Checksum: 0x47CA9528
	Offset: 0x2518
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function iff_override_team_switch_behavior(team)
{
	self endon(#"death");
	self val::set(#"iff_override", "ignoreme", 1);
	self start_scripted();
	self vehicle::lights_off();
	wait(0.1);
	wait(1);
	self setteam(team);
	self blink_lights_for_time(1);
	self stop_scripted();
	wait(1);
	self val::reset(#"iff_override", "ignoreme");
}

/*
	Name: blink_lights_for_time
	Namespace: vehicle_ai
	Checksum: 0x127CB1A3
	Offset: 0x2628
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function blink_lights_for_time(time)
{
	self endon(#"death");
	starttime = gettime();
	self vehicle::lights_off();
	wait(0.1);
	while(gettime() < starttime + (int(time * 1000)))
	{
		self vehicle::lights_off();
		wait(0.2);
		self vehicle::lights_on();
		wait(0.2);
	}
	self vehicle::lights_on();
}

/*
	Name: turnoff
	Namespace: vehicle_ai
	Checksum: 0xE8FA34C7
	Offset: 0x2700
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function turnoff()
{
	self notify(#"shut_off");
}

/*
	Name: turnon
	Namespace: vehicle_ai
	Checksum: 0xA38F2373
	Offset: 0x2720
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function turnon()
{
	self notify(#"start_up");
}

/*
	Name: turnoffalllightsandlaser
	Namespace: vehicle_ai
	Checksum: 0xFEDE3498
	Offset: 0x2740
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function turnoffalllightsandlaser()
{
	self laseroff();
	self vehicle::lights_off();
	self vehicle::toggle_lights_group(1, 0);
	self vehicle::toggle_lights_group(2, 0);
	self vehicle::toggle_lights_group(3, 0);
	self vehicle::toggle_lights_group(4, 0);
	self vehicle::toggle_force_driver_taillights(0);
	self vehicle::toggle_burn_fx(0);
	self vehicle::toggle_emp_fx(0);
}

/*
	Name: turnoffallambientanims
	Namespace: vehicle_ai
	Checksum: 0x20C9EB57
	Offset: 0x2828
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function turnoffallambientanims()
{
	self vehicle::toggle_ambient_anim_group(1, 0);
	self vehicle::toggle_ambient_anim_group(2, 0);
	self vehicle::toggle_ambient_anim_group(3, 0);
}

/*
	Name: clearalllookingandtargeting
	Namespace: vehicle_ai
	Checksum: 0xFBD1AE9
	Offset: 0x2880
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function clearalllookingandtargeting()
{
	self turretcleartarget(0);
	self turretcleartarget(1);
	self turretcleartarget(2);
	self turretcleartarget(3);
	self turretcleartarget(4);
	self vehclearlookat();
}

/*
	Name: clearallmovement
	Namespace: vehicle_ai
	Checksum: 0x2E531A5E
	Offset: 0x2920
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function clearallmovement(zerooutspeed)
{
	if(!isdefined(zerooutspeed))
	{
		zerooutspeed = 0;
	}
	self cancelaimove();
	self function_d4c687c9();
	self pathvariableoffsetclear();
	self pathfixedoffsetclear();
	if(zerooutspeed === 1)
	{
		self notify(#"landed");
		self setvehvelocity((0, 0, 0));
		self setphysacceleration((0, 0, 0));
		self setangularvelocity((0, 0, 0));
	}
}

/*
	Name: update_damage_fx_level
	Namespace: vehicle_ai
	Checksum: 0xEA5CB7B0
	Offset: 0x2A08
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function update_damage_fx_level(idamage)
{
	if(!isdefined(self.damagelevel))
	{
		self.damagelevel = 0;
		self.newdamagelevel = self.damagelevel;
	}
	newdamagelevel = vehicle::should_update_damage_fx_level(self.health, idamage, self.healthdefault);
	if(newdamagelevel > self.damagelevel)
	{
		self.newdamagelevel = newdamagelevel;
	}
	if(self.newdamagelevel > self.damagelevel)
	{
		self.damagelevel = self.newdamagelevel;
		self notify(#"pain");
		vehicle::set_damage_fx_level(self.damagelevel);
	}
}

/*
	Name: shared_callback_damage
	Namespace: vehicle_ai
	Checksum: 0xE4B40D59
	Offset: 0x2AD8
	Size: 0x1D8
	Parameters: 15
	Flags: Linked
*/
function shared_callback_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(should_emp(self, vsurfacenormal, partname, psoffsettime, damagefromunderneath))
	{
		minempdowntime = 0.8 * (isdefined(self.settings.empdowntime) ? self.settings.empdowntime : 0);
		maxempdowntime = 1.2 * (isdefined(self.settings.empdowntime) ? self.settings.empdowntime : 1);
		self notify(#"emped", {#param2:psoffsettime, #param1:damagefromunderneath, #param0:randomfloatrange(minempdowntime, maxempdowntime)});
	}
	if(should_burn(self, vsurfacenormal, partname, psoffsettime, damagefromunderneath))
	{
		self thread burning_thread(damagefromunderneath, psoffsettime);
	}
	self update_damage_fx_level(modelindex);
	return modelindex;
}

/*
	Name: should_emp
	Namespace: vehicle_ai
	Checksum: 0x80C2E2A9
	Offset: 0x2CB8
	Size: 0x140
	Parameters: 5
	Flags: Linked
*/
function should_emp(vehicle, weapon, meansofdeath, einflictor, eattacker)
{
	if(!isdefined(vehicle) || meansofdeath === "MOD_IMPACT" || vehicle.disableelectrodamage === 1)
	{
		return 0;
	}
	if(!(isdefined(weapon) && weapon.isemp || meansofdeath === "MOD_ELECTROCUTED"))
	{
		return 0;
	}
	causer = (isdefined(eattacker) ? eattacker : einflictor);
	if(!isdefined(causer))
	{
		return 1;
	}
	if(isai(causer) && isvehicle(causer))
	{
		return 0;
	}
	if(level.teambased)
	{
		return vehicle.team != causer.team;
	}
	if(isdefined(vehicle.owner))
	{
		return vehicle.owner != causer;
	}
	return vehicle != causer;
}

/*
	Name: should_burn
	Namespace: vehicle_ai
	Checksum: 0x3BADE922
	Offset: 0x2E08
	Size: 0x138
	Parameters: 5
	Flags: Linked
*/
function should_burn(vehicle, weapon, meansofdeath, einflictor, eattacker)
{
	if(level.disablevehicleburndamage === 1 || weapon.disableburndamage === 1)
	{
		return 0;
	}
	if(!isdefined(weapon))
	{
		return 0;
	}
	if(meansofdeath !== "MOD_BURNED")
	{
		return 0;
	}
	if(weapon === einflictor)
	{
		return 0;
	}
	causer = (isdefined(eattacker) ? eattacker : einflictor);
	if(!isdefined(causer))
	{
		return 1;
	}
	if(isai(causer) && isvehicle(causer))
	{
		return 0;
	}
	if(level.teambased)
	{
		return weapon.team != causer.team;
	}
	if(isdefined(weapon.owner))
	{
		return weapon.owner != causer;
	}
	return weapon != causer;
}

/*
	Name: startinitialstate
	Namespace: vehicle_ai
	Checksum: 0xA150AA8E
	Offset: 0x2F50
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function startinitialstate(defaultstate)
{
	if(!isdefined(defaultstate))
	{
		defaultstate = "combat";
	}
	params = spawnstruct();
	params.isinitialstate = 1;
	if(isdefined(self.script_startstate))
	{
		self set_state(self.script_startstate, params);
	}
	else
	{
		self set_state(defaultstate, params);
	}
}

/*
	Name: start_scripted
	Namespace: vehicle_ai
	Checksum: 0x81A5809A
	Offset: 0x2FF0
	Size: 0x6A
	Parameters: 2
	Flags: Linked
*/
function start_scripted(disable_death_state, no_clear_movement)
{
	params = spawnstruct();
	params.no_clear_movement = no_clear_movement;
	self set_state("scripted", params);
	self._no_death_state = disable_death_state;
}

/*
	Name: stop_scripted
	Namespace: vehicle_ai
	Checksum: 0xCA7DA1C7
	Offset: 0x3068
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function stop_scripted(statename)
{
	if(isalive(self) && is_instate("scripted"))
	{
		if(isdefined(statename))
		{
			self set_state(statename);
		}
		else
		{
			self set_state("combat");
		}
	}
}

/*
	Name: set_role
	Namespace: vehicle_ai
	Checksum: 0x92EE183E
	Offset: 0x30F0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function set_role(rolename)
{
	self.current_role = rolename;
}

/*
	Name: has_state
	Namespace: vehicle_ai
	Checksum: 0x171EF0D1
	Offset: 0x3118
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function has_state(name)
{
	/#
		assert(isdefined(self), "");
	#/
	return isdefined(self.state_machines) && isdefined(self.current_role) && isdefined(self.state_machines[self.current_role]) && self.state_machines[self.current_role] statemachine::has_state(name);
}

/*
	Name: set_state
	Namespace: vehicle_ai
	Checksum: 0xC66F9EAD
	Offset: 0x31A8
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function set_state(name, params)
{
	if(isdefined(self.state_machines) && isdefined(self.current_role))
	{
		self.state_machines[self.current_role] thread statemachine::set_state(name, params);
	}
}

/*
	Name: evaluate_connections
	Namespace: vehicle_ai
	Checksum: 0x61CC1C06
	Offset: 0x3210
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function evaluate_connections(eval_func, params)
{
	if(isdefined(self.state_machines) && isdefined(self.current_role))
	{
		self.state_machines[self.current_role] statemachine::evaluate_connections(eval_func, params);
	}
}

/*
	Name: get_state_callbacks
	Namespace: vehicle_ai
	Checksum: 0x332F42F8
	Offset: 0x3278
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function get_state_callbacks(statename)
{
	rolename = "default";
	if(isdefined(self.current_role))
	{
		rolename = self.current_role;
	}
	if(isdefined(self.state_machines[rolename]))
	{
		return self.state_machines[rolename].states[statename];
	}
	return undefined;
}

/*
	Name: get_state_callbacks_for_role
	Namespace: vehicle_ai
	Checksum: 0xA0C9C7CA
	Offset: 0x32E8
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function get_state_callbacks_for_role(rolename, statename)
{
	if(!isdefined(rolename))
	{
		rolename = "default";
	}
	if(isdefined(self.state_machines[rolename]))
	{
		return self.state_machines[rolename].states[statename];
	}
	return undefined;
}

/*
	Name: get_current_state
	Namespace: vehicle_ai
	Checksum: 0x335401CC
	Offset: 0x3348
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function get_current_state()
{
	if(isdefined(self.current_role) && isdefined(self.state_machines[self.current_role].current_state))
	{
		return self.state_machines[self.current_role].current_state.name;
	}
	return undefined;
}

/*
	Name: get_previous_state
	Namespace: vehicle_ai
	Checksum: 0x844E64D6
	Offset: 0x33A8
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function get_previous_state()
{
	if(isdefined(self.current_role) && isdefined(self.state_machines[self.current_role].previous_state))
	{
		return self.state_machines[self.current_role].previous_state.name;
	}
	return undefined;
}

/*
	Name: get_next_state
	Namespace: vehicle_ai
	Checksum: 0x6CB0A21
	Offset: 0x3408
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function get_next_state()
{
	if(isdefined(self.current_role) && isdefined(self.state_machines[self.current_role].next_state))
	{
		return self.state_machines[self.current_role].next_state.name;
	}
	return undefined;
}

/*
	Name: is_instate
	Namespace: vehicle_ai
	Checksum: 0xBC99B2EE
	Offset: 0x3468
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function is_instate(statename)
{
	if(isdefined(self.current_role) && isdefined(self.state_machines[self.current_role].current_state))
	{
		return self.state_machines[self.current_role].current_state.name === statename;
	}
	return 0;
}

/*
	Name: add_state
	Namespace: vehicle_ai
	Checksum: 0x81739B27
	Offset: 0x34D0
	Size: 0x86
	Parameters: 4
	Flags: Linked
*/
function add_state(name, enter_func, update_func, exit_func)
{
	if(isdefined(self.current_role))
	{
		statemachine = self.state_machines[self.current_role];
		if(isdefined(statemachine))
		{
			state = statemachine statemachine::add_state(name, enter_func, update_func, exit_func);
			return state;
		}
	}
	return undefined;
}

/*
	Name: add_interrupt_connection
	Namespace: vehicle_ai
	Checksum: 0x15A453C9
	Offset: 0x3560
	Size: 0x54
	Parameters: 4
	Flags: Linked
*/
function add_interrupt_connection(from_state_name, to_state_name, on_notify, checkfunc)
{
	self.state_machines[self.current_role] statemachine::add_interrupt_connection(from_state_name, to_state_name, on_notify, checkfunc);
}

/*
	Name: add_utility_connection
	Namespace: vehicle_ai
	Checksum: 0xA3936DDB
	Offset: 0x35C0
	Size: 0x54
	Parameters: 4
	Flags: Linked
*/
function add_utility_connection(from_state_name, to_state_name, checkfunc, defaultscore)
{
	self.state_machines[self.current_role] statemachine::add_utility_connection(from_state_name, to_state_name, checkfunc, defaultscore);
}

/*
	Name: function_b94a7666
	Namespace: vehicle_ai
	Checksum: 0xE73E890
	Offset: 0x3620
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_b94a7666(from_state_name, on_notify)
{
	self.state_machines[self.current_role] statemachine::function_b94a7666(from_state_name, on_notify);
}

/*
	Name: function_6c17ee49
	Namespace: vehicle_ai
	Checksum: 0x9810CF62
	Offset: 0x3668
	Size: 0x56
	Parameters: 0
	Flags: Linked
*/
function function_6c17ee49()
{
	if(isdefined(self.current_role))
	{
		if(isdefined(self.state_machines[self.current_role]))
		{
			return self.state_machines[self.current_role] statemachine::has_state("death");
		}
	}
	return 0;
}

/*
	Name: init_state_machine_for_role
	Namespace: vehicle_ai
	Checksum: 0x386B7B53
	Offset: 0x36C8
	Size: 0x648
	Parameters: 1
	Flags: Linked
*/
function init_state_machine_for_role(rolename)
{
	if(!isdefined(rolename))
	{
		rolename = "default";
	}
	statemachine = statemachine::create(rolename, self);
	statemachine.isrole = 1;
	if(!isdefined(self.current_role))
	{
		set_role(rolename);
	}
	statemachine statemachine::add_state("suspend", undefined, undefined, undefined);
	statemachine statemachine::add_state("death", &defaultstate_death_enter, &defaultstate_death_update, undefined);
	statemachine statemachine::add_state("scripted", &defaultstate_scripted_enter, undefined, &defaultstate_scripted_exit);
	statemachine statemachine::add_state("spline", undefined, undefined, &function_e0887c67);
	statemachine statemachine::add_state("combat", &defaultstate_combat_enter, undefined, &defaultstate_combat_exit);
	statemachine statemachine::add_state("emped", &defaultstate_emped_enter, &defaultstate_emped_update, &defaultstate_emped_exit, &defaultstate_emped_reenter);
	statemachine statemachine::add_state("off", &defaultstate_off_enter, undefined, &defaultstate_off_exit);
	statemachine statemachine::add_state("driving", &defaultstate_driving_enter, undefined, &defaultstate_driving_exit);
	statemachine statemachine::add_state("pain", &defaultstate_pain_enter, &function_97e9de18, &defaultstate_pain_exit);
	statemachine statemachine::add_interrupt_connection("off", "combat", "start_up");
	statemachine statemachine::add_interrupt_connection("driving", "combat", "exit_vehicle");
	statemachine statemachine::add_utility_connection("emped", "combat");
	statemachine statemachine::add_utility_connection("pain", "combat");
	statemachine statemachine::add_interrupt_connection("combat", "emped", "emped");
	statemachine statemachine::add_interrupt_connection("pain", "emped", "emped");
	statemachine statemachine::add_interrupt_connection("emped", "emped", "emped");
	statemachine statemachine::add_interrupt_connection("combat", "off", "shut_off");
	statemachine statemachine::add_interrupt_connection("emped", "off", "shut_off");
	statemachine statemachine::add_interrupt_connection("pain", "off", "shut_off");
	statemachine statemachine::add_interrupt_connection("combat", "driving", "enter_vehicle", &function_329f45a4);
	statemachine statemachine::add_interrupt_connection("emped", "driving", "enter_vehicle", &function_329f45a4);
	statemachine statemachine::add_interrupt_connection("off", "driving", "enter_vehicle", &function_329f45a4);
	statemachine statemachine::add_interrupt_connection("pain", "driving", "enter_vehicle", &function_329f45a4);
	statemachine statemachine::add_interrupt_connection("combat", "pain", "pain");
	statemachine statemachine::add_interrupt_connection("emped", "pain", "pain");
	statemachine statemachine::add_interrupt_connection("off", "pain", "pain");
	statemachine statemachine::add_interrupt_connection("driving", "pain", "pain");
	self.overridevehiclekilled = &callback_vehiclekilled;
	self.overridevehicledeathpostgame = &callback_vehiclekilled;
	statemachine thread statemachine::set_state("suspend");
	self thread on_death_cleanup();
	return statemachine;
}

/*
	Name: register_custom_add_state_callback
	Namespace: vehicle_ai
	Checksum: 0x90660374
	Offset: 0x3D18
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function register_custom_add_state_callback(func)
{
	if(!isdefined(level.level_specific_add_state_callbacks))
	{
		level.level_specific_add_state_callbacks = [];
	}
	level.level_specific_add_state_callbacks[level.level_specific_add_state_callbacks.size] = func;
}

/*
	Name: call_custom_add_state_callbacks
	Namespace: vehicle_ai
	Checksum: 0xA630EC5F
	Offset: 0x3D68
	Size: 0x56
	Parameters: 0
	Flags: Linked
*/
function call_custom_add_state_callbacks()
{
	if(isdefined(level.level_specific_add_state_callbacks))
	{
		for(i = 0; i < level.level_specific_add_state_callbacks.size; i++)
		{
			self [[level.level_specific_add_state_callbacks[i]]]();
		}
	}
}

/*
	Name: callback_vehiclekilled
	Namespace: vehicle_ai
	Checksum: 0x96E609F0
	Offset: 0x3DC8
	Size: 0xFC
	Parameters: 8
	Flags: Linked
*/
function callback_vehiclekilled(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	if(is_true(self._no_death_state))
	{
		return;
	}
	death_info = spawnstruct();
	death_info.inflictor = einflictor;
	death_info.attacker = eattacker;
	death_info.damage = idamage;
	death_info.meansofdeath = smeansofdeath;
	death_info.weapon = weapon;
	death_info.dir = vdir;
	death_info.hitloc = shitloc;
	death_info.timeoffset = psoffsettime;
	self set_state("death", death_info);
}

/*
	Name: on_death_cleanup
	Namespace: vehicle_ai
	Checksum: 0x882F19A8
	Offset: 0x3ED0
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function on_death_cleanup()
{
	state_machines = self.state_machines;
	self waittill(#"death");
	waittillframeend();
	foreach(statemachine in state_machines)
	{
		statemachine statemachine::clear();
	}
}

/*
	Name: defaultstate_death_enter
	Namespace: vehicle_ai
	Checksum: 0xE34EEB7F
	Offset: 0x3F88
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function defaultstate_death_enter(params)
{
	self vehicle::toggle_tread_fx(0);
	self vehicle::toggle_exhaust_fx(0);
	self vehicle::toggle_sounds(0);
	self disableaimassist();
	turnoffalllightsandlaser();
	turnoffallambientanims();
	clearalllookingandtargeting();
	clearallmovement();
	self cancelaimove();
	self val::set(#"defaultstate_death_enter", "takedamage", 0);
	self vehicle_death::death_cleanup_level_variables();
}

/*
	Name: burning_death_fx
	Namespace: vehicle_ai
	Checksum: 0x9FEAD4E5
	Offset: 0x4098
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function burning_death_fx()
{
	if(isdefined(self.settings.burn_death_fx_1) && isdefined(self.settings.burn_death_tag_1))
	{
		playfxontag(self.settings.burn_death_fx_1, self, self.settings.burn_death_tag_1);
	}
	if(isdefined(self.settings.burn_death_sound_1))
	{
		self playsound(self.settings.burn_death_sound_1);
	}
}

/*
	Name: emp_death_fx
	Namespace: vehicle_ai
	Checksum: 0xA5300C99
	Offset: 0x4138
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function emp_death_fx()
{
	if(isdefined(self.settings.emp_death_fx_1) && isdefined(self.settings.emp_death_tag_1))
	{
		playfxontag(self.settings.emp_death_fx_1, self, self.settings.emp_death_tag_1);
	}
	if(isdefined(self.settings.emp_death_sound_1))
	{
		self playsound(self.settings.emp_death_sound_1);
	}
}

/*
	Name: death_radius_damage_special
	Namespace: vehicle_ai
	Checksum: 0x38D2D4E6
	Offset: 0x41D8
	Size: 0xFC
	Parameters: 2
	Flags: Linked
*/
function death_radius_damage_special(radiusscale, meansofdamage)
{
	self endon(#"death");
	if(!isdefined(self) || self.abandoned === 1 || self.damage_on_death === 0 || self.radiusdamageradius <= 0)
	{
		return;
	}
	position = self.origin + vectorscale((0, 0, 1), 15);
	radius = self.radiusdamageradius * radiusscale;
	damagemax = self.radiusdamagemax;
	damagemin = self.radiusdamagemin;
	waitframe(1);
	if(isdefined(self))
	{
		self radiusdamage(position, radius, damagemax, damagemin, undefined, meansofdamage);
	}
}

/*
	Name: burning_death
	Namespace: vehicle_ai
	Checksum: 0x86C7E81B
	Offset: 0x42E0
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function burning_death(params)
{
	self endon(#"death");
	self burning_death_fx();
	self.skipfriendlyfirecheck = 1;
	self thread death_radius_damage_special(2, "MOD_BURNED");
	self vehicle_death::set_death_model(self.deathmodel, self.modelswapdelay);
	self vehicle::do_death_dynents(3);
	self vehicle_death::deletewhensafe(10);
}

/*
	Name: emped_death
	Namespace: vehicle_ai
	Checksum: 0x4741F519
	Offset: 0x43A8
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function emped_death(params)
{
	self endon(#"death");
	self emp_death_fx();
	self.skipfriendlyfirecheck = 1;
	self thread death_radius_damage_special(2, "MOD_ELECTROCUTED");
	self vehicle_death::set_death_model(self.deathmodel, self.modelswapdelay);
	self vehicle::do_death_dynents(2);
	self vehicle_death::deletewhensafe();
}

/*
	Name: gibbed_death
	Namespace: vehicle_ai
	Checksum: 0x350495EF
	Offset: 0x4470
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function gibbed_death(params)
{
	self endon(#"death");
	self vehicle_death::death_fx();
	self thread vehicle_death::death_radius_damage();
	self vehicle_death::set_death_model(self.deathmodel, self.modelswapdelay);
	self vehicle::do_death_dynents();
	self vehicle_death::deletewhensafe();
}

/*
	Name: default_death
	Namespace: vehicle_ai
	Checksum: 0xB06D22A6
	Offset: 0x4520
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function default_death(params)
{
	self endon(#"death");
	self vehicle_death::death_fx();
	self thread vehicle_death::death_radius_damage();
	self vehicle_death::set_death_model(self.deathmodel, self.modelswapdelay);
	if(self.classname == "script_vehicle")
	{
		self thread vehicle_death::death_jolt(self.vehicletype);
	}
	if(isdefined(level.disable_thermal))
	{
		[[level.disable_thermal]]();
	}
	waittime = (isdefined(self.waittime_before_delete) ? self.waittime_before_delete : 0);
	owner = self getvehicleowner();
	if(isdefined(owner) && self isremotecontrol())
	{
		waittime = max(waittime, 4);
	}
	util::waitfortime(waittime);
	vehicle_death::freewhensafe();
}

/*
	Name: get_death_type
	Namespace: vehicle_ai
	Checksum: 0xDE87E8AC
	Offset: 0x4698
	Size: 0xFE
	Parameters: 1
	Flags: Linked
*/
function get_death_type(params)
{
	if(self.delete_on_death === 1)
	{
		death_type = "default";
	}
	else
	{
		death_type = self.death_type;
	}
	if(!isdefined(death_type))
	{
		death_type = params.death_type;
	}
	if(!isdefined(death_type) && isdefined(self.abnormal_status) && self.abnormal_status.burning === 1)
	{
		death_type = "burning";
	}
	if(!isdefined(death_type) && (isdefined(self.abnormal_status) && self.abnormal_status.emped === 1) || (isdefined(params.weapon) && params.weapon.isemp))
	{
		death_type = "emped";
	}
	return death_type;
}

/*
	Name: defaultstate_death_update
	Namespace: vehicle_ai
	Checksum: 0x6C9B3C62
	Offset: 0x47A0
	Size: 0x182
	Parameters: 1
	Flags: Linked
*/
function defaultstate_death_update(params)
{
	self endon(#"death");
	if(isdefined(level.vehicle_destructer_cb))
	{
		[[level.vehicle_destructer_cb]](self);
	}
	if(self.delete_on_death === 1)
	{
		default_death(params);
		vehicle_death::deletewhensafe(0.25);
	}
	else
	{
		death_type = (isdefined(get_death_type(params)) ? get_death_type(params) : "default");
		switch(death_type)
		{
			case "burning":
			{
				burning_death(params);
				break;
			}
			case "emped":
			{
				emped_death(params);
				break;
			}
			case "gibbed":
			{
				gibbed_death(params);
				break;
			}
			default:
			{
				default_death(params);
				break;
			}
		}
	}
}

/*
	Name: defaultstate_scripted_enter
	Namespace: vehicle_ai
	Checksum: 0x8F2578EC
	Offset: 0x4930
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function defaultstate_scripted_enter(params)
{
	if(params.no_clear_movement !== 1)
	{
		clearalllookingandtargeting();
		clearallmovement();
		if(hasasm(self))
		{
			self asmrequestsubstate(#"locomotion@movement");
		}
		self resumespeed();
	}
}

/*
	Name: defaultstate_scripted_exit
	Namespace: vehicle_ai
	Checksum: 0x6651A160
	Offset: 0x49D0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function defaultstate_scripted_exit(params)
{
	if(params.no_clear_movement !== 1)
	{
		clearalllookingandtargeting();
		clearallmovement();
	}
}

/*
	Name: function_e0887c67
	Namespace: vehicle_ai
	Checksum: 0xF0921C59
	Offset: 0x4A20
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function function_e0887c67(params)
{
	self notify(#"endpath");
	self.attachedpath = undefined;
}

/*
	Name: defaultstate_combat_enter
	Namespace: vehicle_ai
	Checksum: 0x3C9050FA
	Offset: 0x4A50
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function defaultstate_combat_enter(params)
{
}

/*
	Name: defaultstate_combat_exit
	Namespace: vehicle_ai
	Checksum: 0xF23393C7
	Offset: 0x4A68
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function defaultstate_combat_exit(params)
{
}

/*
	Name: defaultstate_emped_enter
	Namespace: vehicle_ai
	Checksum: 0x3C03D7BB
	Offset: 0x4A80
	Size: 0x18C
	Parameters: 1
	Flags: Linked
*/
function defaultstate_emped_enter(params)
{
	self vehicle::toggle_tread_fx(0);
	self vehicle::toggle_exhaust_fx(0);
	self vehicle::toggle_sounds(0);
	params.laseron = islaseron(self);
	self laseroff();
	self vehicle::lights_off();
	clearalllookingandtargeting();
	if(!is_true(self.var_94e2cf87))
	{
		clearallmovement();
	}
	if(isairborne(self))
	{
		self setrotorspeed(0);
	}
	if(!isdefined(self.abnormal_status))
	{
		self.abnormal_status = spawnstruct();
	}
	self.abnormal_status.emped = 1;
	self.abnormal_status.attacker = params.param1;
	self.abnormal_status.inflictor = params.param2;
	self vehicle::toggle_emp_fx(1);
}

/*
	Name: emp_startup_fx
	Namespace: vehicle_ai
	Checksum: 0xB0658D03
	Offset: 0x4C18
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function emp_startup_fx()
{
	if(isdefined(self) && isdefined(self.settings) && isdefined(self.settings.emp_startup_fx_1) && isdefined(self.settings.emp_startup_tag_1))
	{
		playfxontag(self.settings.emp_startup_fx_1, self, self.settings.emp_startup_tag_1);
	}
}

/*
	Name: defaultstate_emped_update
	Namespace: vehicle_ai
	Checksum: 0x6324008E
	Offset: 0x4CA0
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function defaultstate_emped_update(params)
{
	self endon(#"death", #"change_state");
	time = params.param0;
	/#
		assert(isdefined(time));
	#/
	util::cooldown("emped_timer", time);
	while(!util::iscooldownready("emped_timer"))
	{
		timeleft = max(util::getcooldownleft("emped_timer"), 0.5);
		wait(timeleft);
	}
	self.abnormal_status.emped = 0;
	self vehicle::toggle_emp_fx(0);
	self emp_startup_fx();
	wait(1);
	self evaluate_connections();
}

/*
	Name: defaultstate_emped_exit
	Namespace: vehicle_ai
	Checksum: 0x635212D9
	Offset: 0x4DE0
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function defaultstate_emped_exit(params)
{
	self vehicle::toggle_tread_fx(1);
	self vehicle::toggle_exhaust_fx(1);
	self vehicle::toggle_sounds(1);
	if(params.laseron === 1)
	{
		self laseron();
	}
	self vehicle::lights_on();
}

/*
	Name: defaultstate_emped_reenter
	Namespace: vehicle_ai
	Checksum: 0xAF06D13C
	Offset: 0x4E80
	Size: 0x10
	Parameters: 1
	Flags: Linked
*/
function defaultstate_emped_reenter(params)
{
	return true;
}

/*
	Name: defaultstate_off_enter
	Namespace: vehicle_ai
	Checksum: 0xEE6E605
	Offset: 0x4E98
	Size: 0x1D4
	Parameters: 1
	Flags: Linked
*/
function defaultstate_off_enter(params)
{
	self vehicle::toggle_tread_fx(0);
	self vehicle::toggle_exhaust_fx(0);
	self vehicle::toggle_sounds(0);
	self vehicle::function_bbc1d940(0);
	params.laseron = islaseron(self);
	turnoffalllightsandlaser();
	turnoffallambientanims();
	clearalllookingandtargeting();
	clearallmovement();
	if(isdefined(level.disable_thermal))
	{
		[[level.disable_thermal]]();
	}
	if(isairborne(self))
	{
		if(params.isinitialstate !== 1 && params.no_falling !== 1)
		{
			self setphysacceleration(vectorscale((0, 0, -1), 300));
		}
		self setrotorspeed(0);
	}
	if(!is_true(params.isinitialstate) && (self get_previous_state() === "driving" || is_true(params.var_c1273f91)))
	{
		self vehicle::function_7f0bbde3();
	}
}

/*
	Name: defaultstate_off_exit
	Namespace: vehicle_ai
	Checksum: 0x9F5ED909
	Offset: 0x5078
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
*/
function defaultstate_off_exit(params)
{
	self vehicle::toggle_tread_fx(1);
	self vehicle::toggle_exhaust_fx(1);
	if(self get_next_state() === "driving" || is_true(params.var_da88902a))
	{
		self thread vehicle::function_fa4236af(params);
	}
	else
	{
		self vehicle::toggle_sounds(1);
	}
	if(isairborne(self))
	{
		self setphysacceleration((0, 0, 0));
		if(!is_true(params.var_1751c737))
		{
			self thread nudge_collision();
		}
		self setrotorspeed(1);
	}
	if(params.laseron === 1)
	{
		self laseron();
	}
	if(isdefined(level.enable_thermal))
	{
		if(self get_next_state() !== "death")
		{
			[[level.enable_thermal]]();
		}
	}
	if(!is_true(self.nolights))
	{
		self vehicle::lights_on();
	}
	self vehicle::toggle_force_driver_taillights(0);
}

/*
	Name: function_329f45a4
	Namespace: vehicle_ai
	Checksum: 0xB7A45AA7
	Offset: 0x5268
	Size: 0xAE
	Parameters: 4
	Flags: Linked
*/
function function_329f45a4(current_state, to_state, connection, params)
{
	if(!isdefined(self))
	{
		return false;
	}
	if(is_true(self.emped) || is_true(self.jammed))
	{
		return false;
	}
	driver = self getseatoccupant(0);
	if(isplayer(driver))
	{
		return true;
	}
	return false;
}

/*
	Name: function_6664e3af
	Namespace: vehicle_ai
	Checksum: 0x9BBFA96A
	Offset: 0x5320
	Size: 0x6E
	Parameters: 4
	Flags: Linked
*/
function function_6664e3af(current_state, to_state_name, connection, params)
{
	if(isalive(self))
	{
		driver = self getseatoccupant(0);
		if(!isdefined(driver))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: defaultstate_driving_enter
	Namespace: vehicle_ai
	Checksum: 0xF87072C9
	Offset: 0x5398
	Size: 0x17C
	Parameters: 1
	Flags: Linked
*/
function defaultstate_driving_enter(params)
{
	params.driver = self getseatoccupant(0);
	if(!isdefined(params.driver))
	{
		if(isdefined(params.turn_off))
		{
			self [[params.turn_off]]();
			return;
		}
	}
	/#
		assert(isdefined(params.driver));
	#/
	self.turretrotscale = 1;
	if(!is_true(params.var_c2e048f9))
	{
		self.team = params.driver.team;
	}
	if(hasasm(self))
	{
		self asmrequestsubstate(#"locomotion@movement");
	}
	clearalllookingandtargeting();
	clearallmovement();
	self cancelaimove();
	if(is_true(params.var_7dabdc1b))
	{
		self returnplayercontrol();
	}
	self setheliheightcap(1);
}

/*
	Name: defaultstate_driving_exit
	Namespace: vehicle_ai
	Checksum: 0x8CFA1DB8
	Offset: 0x5520
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function defaultstate_driving_exit(params)
{
	self.turretrotscale = 1;
	self setheliheightcap(0);
	self takeplayercontrol();
	clearalllookingandtargeting();
	clearallmovement();
}

/*
	Name: defaultstate_pain_enter
	Namespace: vehicle_ai
	Checksum: 0x6BA6C094
	Offset: 0x5598
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function defaultstate_pain_enter(params)
{
	clearalllookingandtargeting();
	clearallmovement();
}

/*
	Name: defaultstate_pain_exit
	Namespace: vehicle_ai
	Checksum: 0xD35AE5E6
	Offset: 0x55D0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function defaultstate_pain_exit(params)
{
	clearalllookingandtargeting();
	clearallmovement();
}

/*
	Name: function_97e9de18
	Namespace: vehicle_ai
	Checksum: 0xA9BDA52F
	Offset: 0x5608
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_97e9de18(params)
{
	self endon(#"death", #"change_state");
	wait(0.2);
	self evaluate_connections();
}

/*
	Name: canseeenemyfromposition
	Namespace: vehicle_ai
	Checksum: 0x67622F60
	Offset: 0x5660
	Size: 0x62
	Parameters: 3
	Flags: None
*/
function canseeenemyfromposition(position, enemy, sight_check_height)
{
	sightcheckorigin = position + (0, 0, sight_check_height);
	return sighttracepassed(sightcheckorigin, enemy.origin + vectorscale((0, 0, 1), 30), 0, self);
}

/*
	Name: positionquery_debugscores
	Namespace: vehicle_ai
	Checksum: 0x5BAF0716
	Offset: 0x56D0
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function positionquery_debugscores(queryresult)
{
	if(!is_true(getdvarint(#"hkai_debugpositionquery", 0)))
	{
		return;
	}
	i = 1;
	foreach(point in queryresult.data)
	{
		point debugscore(self, i, queryresult.sorted);
		i++;
	}
}

/*
	Name: debugscore
	Namespace: vehicle_ai
	Checksum: 0x9F03629B
	Offset: 0x57D0
	Size: 0x260
	Parameters: 3
	Flags: Linked
*/
function debugscore(entity, num, sorted)
{
	/#
		if(!isdefined(self._scoredebug))
		{
			return;
		}
		if(!is_true(getdvarint(#"hkai_debugpositionquery", 0)))
		{
			return;
		}
		count = 1;
		color = (1, 0, 0);
		if(self.score >= 0 || (is_true(sorted) && num == 1))
		{
			color = (0, 1, 0);
		}
		recordstar(self.origin, color);
		if(is_true(sorted))
		{
			record3dtext(((("" + num) + "") + self.score) + "", self.origin - (0, 0, 10 * count), color);
		}
		else
		{
			record3dtext(("" + self.score) + "", self.origin - (0, 0, 10 * count), color);
		}
		foreach(score in self._scoredebug)
		{
			count++;
			record3dtext((score.scorename + "") + score.score, self.origin - (0, 0, 10 * count), color);
		}
	#/
}

/*
	Name: _less_than_val
	Namespace: vehicle_ai
	Checksum: 0x2AFDD73B
	Offset: 0x5A38
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function _less_than_val(left, right)
{
	if(!isdefined(left))
	{
		return 0;
	}
	if(!isdefined(right))
	{
		return 1;
	}
	return left < right;
}

/*
	Name: _cmp_val
	Namespace: vehicle_ai
	Checksum: 0x1EED8182
	Offset: 0x5A78
	Size: 0x5A
	Parameters: 3
	Flags: Linked
*/
function _cmp_val(left, right, descending)
{
	if(descending)
	{
		return _less_than_val(right, left);
	}
	return _less_than_val(left, right);
}

/*
	Name: _sort_by_score
	Namespace: vehicle_ai
	Checksum: 0xA0CD5EE5
	Offset: 0x5AE0
	Size: 0x42
	Parameters: 3
	Flags: Linked
*/
function _sort_by_score(left, right, descending)
{
	return _cmp_val(left.score, right.score, descending);
}

/*
	Name: positionquery_filter_random
	Namespace: vehicle_ai
	Checksum: 0x9F94B5C5
	Offset: 0x5B30
	Size: 0x17A
	Parameters: 3
	Flags: None
*/
function positionquery_filter_random(queryresult, min, max)
{
	foreach(point in queryresult.data)
	{
		score = randomfloatrange(min, max);
		/#
			if(!isdefined(point._scoredebug))
			{
				point._scoredebug = [];
			}
			if(!isdefined(point._scoredebug[#"random"]))
			{
				point._scoredebug[#"random"] = spawnstruct();
			}
			point._scoredebug[#"random"].score = score;
			point._scoredebug[#"random"].scorename = "";
		#/
		point.score = point.score + score;
	}
}

/*
	Name: positionquery_postprocess_sortscore
	Namespace: vehicle_ai
	Checksum: 0xDFA00A09
	Offset: 0x5CB8
	Size: 0x6E
	Parameters: 2
	Flags: Linked
*/
function positionquery_postprocess_sortscore(queryresult, descending)
{
	if(!isdefined(descending))
	{
		descending = 1;
	}
	sorted = array::merge_sort(queryresult.data, &_sort_by_score, descending);
	queryresult.data = sorted;
	queryresult.sorted = 1;
}

/*
	Name: positionquery_filter_outofgoalanchor
	Namespace: vehicle_ai
	Checksum: 0x1A7F7B68
	Offset: 0x5D30
	Size: 0x18A
	Parameters: 2
	Flags: Linked
*/
function positionquery_filter_outofgoalanchor(queryresult, tolerance)
{
	if(!isdefined(tolerance))
	{
		tolerance = 1;
	}
	foreach(point in queryresult.data)
	{
		if(point.disttogoal > tolerance)
		{
			score = -10000 - (point.disttogoal * 10);
			/#
				if(!isdefined(point._scoredebug))
				{
					point._scoredebug = [];
				}
				if(!isdefined(point._scoredebug[#"outofgoalanchor"]))
				{
					point._scoredebug[#"outofgoalanchor"] = spawnstruct();
				}
				point._scoredebug[#"outofgoalanchor"].score = score;
				point._scoredebug[#"outofgoalanchor"].scorename = "";
			#/
			point.score = point.score + score;
		}
	}
}

/*
	Name: positionquery_filter_engagementdist
	Namespace: vehicle_ai
	Checksum: 0x17080B1A
	Offset: 0x5EC8
	Size: 0x2DA
	Parameters: 5
	Flags: Linked
*/
function positionquery_filter_engagementdist(queryresult, enemy, engagementdistancemin, engagementdistancemax, engagementdistance)
{
	if(!isdefined(enemy))
	{
		return;
	}
	if(!isdefined(engagementdistance))
	{
		engagementdistance = (engagementdistancemin + engagementdistancemax) * 0.5;
	}
	half_engagement_width = abs(engagementdistancemax - engagementdistance);
	enemy_origin = (enemy.origin[0], enemy.origin[1], 0);
	vec_enemy_to_self = vectornormalize((self.origin[0], self.origin[1], 0) - enemy_origin);
	foreach(point in queryresult.data)
	{
		point.distawayfromengagementarea = 0;
		vec_enemy_to_point = (point.origin[0], point.origin[1], 0) - enemy_origin;
		dist_in_front_of_enemy = vectordot(vec_enemy_to_point, vec_enemy_to_self);
		if(abs(dist_in_front_of_enemy) < engagementdistancemin)
		{
			dist_in_front_of_enemy = engagementdistancemin * -1;
		}
		dist_away_from_sweet_line = abs(dist_in_front_of_enemy - engagementdistance);
		if(dist_away_from_sweet_line > half_engagement_width)
		{
			point.distawayfromengagementarea = dist_away_from_sweet_line - half_engagement_width;
		}
		too_far_dist = engagementdistancemax * 1.1;
		too_far_dist_sq = sqr(too_far_dist);
		dist_from_enemy_sq = distance2dsquared(point.origin, enemy_origin);
		if(dist_from_enemy_sq > too_far_dist_sq)
		{
			ratiosq = dist_from_enemy_sq / too_far_dist_sq;
			dist = ratiosq * too_far_dist;
			dist_outside = dist - too_far_dist;
			if(dist_outside > point.distawayfromengagementarea)
			{
				point.distawayfromengagementarea = dist_outside;
			}
		}
	}
}

/*
	Name: positionquery_filter_distawayfromtarget
	Namespace: vehicle_ai
	Checksum: 0xCEE6BFB8
	Offset: 0x61B0
	Size: 0x2DA
	Parameters: 4
	Flags: Linked
*/
function positionquery_filter_distawayfromtarget(queryresult, targetarray, distance, tooclosepenalty)
{
	if(!isdefined(targetarray) || !isarray(targetarray))
	{
		return;
	}
	foreach(point in queryresult.data)
	{
		tooclose = 0;
		foreach(target in targetarray)
		{
			origin = undefined;
			if(isvec(target))
			{
				origin = target;
			}
			else
			{
				if(issentient(target) && isalive(target))
				{
					origin = target.origin;
				}
				else if(isentity(target))
				{
					origin = target.origin;
				}
			}
			if(isdefined(origin) && distance2dsquared(point.origin, origin) < sqr(distance))
			{
				tooclose = 1;
				break;
			}
		}
		if(tooclose)
		{
			/#
				if(!isdefined(point._scoredebug))
				{
					point._scoredebug = [];
				}
				if(!isdefined(point._scoredebug[#"tooclosetoothers"]))
				{
					point._scoredebug[#"tooclosetoothers"] = spawnstruct();
				}
				point._scoredebug[#"tooclosetoothers"].score = tooclosepenalty;
				point._scoredebug[#"tooclosetoothers"].scorename = "";
			#/
			point.score = point.score + tooclosepenalty;
		}
	}
}

/*
	Name: distancepointtoengagementheight
	Namespace: vehicle_ai
	Checksum: 0x5CD7581C
	Offset: 0x6498
	Size: 0xFC
	Parameters: 4
	Flags: None
*/
function distancepointtoengagementheight(origin, enemy, engagementheightmin, engagementheightmax)
{
	if(!isdefined(engagementheightmin))
	{
		return undefined;
	}
	result = 0;
	engagementheight = 0.5 * (self.settings.engagementheightmin + self.settings.engagementheightmax);
	half_height = abs(engagementheightmax - engagementheight);
	targetheight = engagementheightmin.origin[2] + engagementheight;
	distfromengagementheight = abs(enemy[2] - targetheight);
	if(distfromengagementheight > half_height)
	{
		result = distfromengagementheight - half_height;
	}
	return result;
}

/*
	Name: positionquery_filter_engagementheight
	Namespace: vehicle_ai
	Checksum: 0x43E1AE03
	Offset: 0x65A0
	Size: 0x152
	Parameters: 4
	Flags: Linked
*/
function positionquery_filter_engagementheight(queryresult, enemy, engagementheightmin, engagementheightmax)
{
	if(!isdefined(enemy))
	{
		return;
	}
	engagementheight = 0.5 * (engagementheightmin + engagementheightmax);
	half_height = abs(engagementheightmax - engagementheight);
	foreach(point in queryresult.data)
	{
		point.distengagementheight = 0;
		targetheight = enemy.origin[2] + engagementheight;
		distfromengagementheight = abs(point.origin[2] - targetheight);
		if(distfromengagementheight > half_height)
		{
			point.distengagementheight = distfromengagementheight - half_height;
		}
	}
}

/*
	Name: positionquery_postprocess_removeoutofgoalradius
	Namespace: vehicle_ai
	Checksum: 0xB94ADFE4
	Offset: 0x6700
	Size: 0x98
	Parameters: 2
	Flags: None
*/
function positionquery_postprocess_removeoutofgoalradius(queryresult, tolerance)
{
	if(!isdefined(tolerance))
	{
		tolerance = 1;
	}
	for(i = 0; i < queryresult.data.size; i++)
	{
		point = queryresult.data[i];
		if(point.disttogoal > tolerance)
		{
			arrayremoveindex(queryresult.data, i);
			i--;
		}
	}
}

/*
	Name: target_hijackers
	Namespace: vehicle_ai
	Checksum: 0x71104E3A
	Offset: 0x67A0
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function target_hijackers()
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"ccom_lock_being_targeted");
		hijackingplayer = waitresult.hijacking_player;
		self getperfectinfo(hijackingplayer, 1);
		if(isplayer(hijackingplayer))
		{
			self setpersonalthreatbias(hijackingplayer, 1500, 4);
		}
	}
}

/*
	Name: function_f2964e93
	Namespace: vehicle_ai
	Checksum: 0x5AD85B75
	Offset: 0x6860
	Size: 0x28
	Parameters: 1
	Flags: Event
*/
event function_f2964e93(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
}

/*
	Name: function_b7880090
	Namespace: vehicle_ai
	Checksum: 0xFC28F695
	Offset: 0x6890
	Size: 0x28
	Parameters: 1
	Flags: Event
*/
event function_b7880090(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
}

/*
	Name: function_7ae52016
	Namespace: vehicle_ai
	Checksum: 0x549897F0
	Offset: 0x68C0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_7ae52016(val)
{
	if(isairborne(self))
	{
		self setrotorspeed(float(val));
	}
}

/*
	Name: function_e057db25
	Namespace: vehicle_ai
	Checksum: 0x45D21003
	Offset: 0x6918
	Size: 0x2E4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_e057db25(var_2d1cbdd9, goalpos, vararg)
{
	switch(vararg.size)
	{
		case 8:
		{
			return tacticalquery(var_2d1cbdd9, goalpos, vararg[0], vararg[1], vararg[2], vararg[3], vararg[4], vararg[5], vararg[6], vararg[7]);
		}
		case 7:
		{
			return tacticalquery(var_2d1cbdd9, goalpos, vararg[0], vararg[1], vararg[2], vararg[3], vararg[4], vararg[5], vararg[6]);
		}
		case 6:
		{
			return tacticalquery(var_2d1cbdd9, goalpos, vararg[0], vararg[1], vararg[2], vararg[3], vararg[4], vararg[5]);
		}
		case 5:
		{
			return tacticalquery(var_2d1cbdd9, goalpos, vararg[0], vararg[1], vararg[2], vararg[3], vararg[4]);
		}
		case 4:
		{
			return tacticalquery(var_2d1cbdd9, goalpos, vararg[0], vararg[1], vararg[2], vararg[3]);
		}
		case 3:
		{
			return tacticalquery(var_2d1cbdd9, goalpos, vararg[0], vararg[1], vararg[2]);
		}
		case 2:
		{
			return tacticalquery(var_2d1cbdd9, goalpos, vararg[0], vararg[1]);
		}
		case 1:
		{
			return tacticalquery(var_2d1cbdd9, goalpos, vararg[0]);
		}
		case 0:
		{
			return tacticalquery(var_2d1cbdd9, goalpos);
		}
		default:
		{
			/#
				assertmsg("");
			#/
		}
	}
	return undefined;
}

/*
	Name: function_1d436633
	Namespace: vehicle_ai
	Checksum: 0x6FB4031F
	Offset: 0x6C08
	Size: 0x526
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_1d436633(...)
{
	/#
		assert(isdefined(self.ai));
	#/
	if(!isdefined(self.ai.var_88b0fd29))
	{
		self.ai.var_88b0fd29 = gettime();
	}
	var_12cb92c6 = 0;
	var_1f2328d0 = self function_4794d6a3();
	newpos = undefined;
	forcedgoal = is_true(var_1f2328d0.goalforced);
	isatgoal = is_true(var_1f2328d0.isatgoal) || (self isapproachinggoal() && isdefined(self.overridegoalpos));
	itsbeenawhile = is_true(var_1f2328d0.isatgoal) && gettime() > self.ai.var_88b0fd29;
	var_48ea0381 = 0;
	var_2a8c95a5 = forcedgoal && isdefined(self.overridegoalpos) && distancesquared(self.overridegoalpos, var_1f2328d0.goalpos) < sqr(self.radius);
	if(isdefined(self.enemy) && !self haspath())
	{
		var_48ea0381 = !self seerecently(self.enemy, randomintrange(3, 5));
		if(issentient(self.enemy) || function_ffa5b184(self.enemy))
		{
			var_48ea0381 = var_48ea0381 && !self attackedrecently(self.enemy, randomintrange(5, 7));
		}
	}
	var_12cb92c6 = !isatgoal || var_48ea0381 || itsbeenawhile;
	var_12cb92c6 = var_12cb92c6 && !var_2a8c95a5;
	if(var_12cb92c6)
	{
		if(forcedgoal)
		{
			newpos = getclosestpointonnavmesh(var_1f2328d0.goalpos, self.radius * 2, self.radius);
		}
		else
		{
			/#
				assert(isdefined(self.settings.tacbundle) && self.settings.tacbundle != "", "");
			#/
			goalarray = function_e057db25(self.settings.tacbundle, var_1f2328d0.goalpos, vararg);
			var_817e8fd0 = [];
			if(isdefined(goalarray) && goalarray.size)
			{
				foreach(goal in goalarray)
				{
					if(!self isingoal(goal.origin))
					{
						continue;
					}
					if(isdefined(self.overridegoalpos) && distancesquared(self.overridegoalpos, goal.origin) < sqr(self.radius))
					{
						continue;
					}
					var_817e8fd0[var_817e8fd0.size] = goal;
				}
				if(var_817e8fd0.size)
				{
					goal = array::random(var_817e8fd0);
					newpos = goal.origin;
				}
			}
		}
		if(!isdefined(newpos))
		{
			newpos = getclosestpointonnavmesh(var_1f2328d0.goalpos, self.radius * 2, self.radius);
		}
		self.ai.var_88b0fd29 = gettime() + randomintrange(3500, 5000);
	}
	return newpos;
}

/*
	Name: function_4ab1a63a
	Namespace: vehicle_ai
	Checksum: 0xDF967AAC
	Offset: 0x7138
	Size: 0x49A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4ab1a63a(goal)
{
	if(isdefined(self.settings.engagementheightmax) && isdefined(self.settings.engagementheightmin))
	{
		var_20b5eeff = 0.5 * (self.settings.engagementheightmax + self.settings.engagementheightmin);
	}
	else
	{
		var_20b5eeff = 150;
	}
	var_3069c020 = (isdefined(self.settings.var_2ade16ee) ? self.settings.var_2ade16ee : 450);
	maxradius = goal.goalradius;
	minradius = min(self.radius * 2, maxradius / 3);
	innerspacing = mapfloat(1000, 3000, self.radius, self.radius * 3, goal.goalradius);
	outerspacing = innerspacing * 1.5;
	queryresult = positionquery_source_navigation(goal.goalpos, minradius, maxradius, goal.goalheight, innerspacing, self, outerspacing);
	positionquery_filter_inclaimedlocation(queryresult, self);
	foreach(point in queryresult.data)
	{
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
				point._scoredebug[#"inclaimedlocation"].score = -5000;
				point._scoredebug[#"inclaimedlocation"].scorename = "";
			#/
			point.score = point.score + -5000;
		}
		score = randomfloatrange(0, 80);
		/#
			if(!isdefined(point._scoredebug))
			{
				point._scoredebug = [];
			}
			if(!isdefined(point._scoredebug[#"random"]))
			{
				point._scoredebug[#"random"] = spawnstruct();
			}
			point._scoredebug[#"random"].score = score;
			point._scoredebug[#"random"].scorename = "";
		#/
		point.score = point.score + score;
	}
	if(queryresult.data.size > 0)
	{
		positionquery_postprocess_sortscore(queryresult);
		self positionquery_debugscores(queryresult);
		foreach(point in queryresult.data)
		{
			if(self isingoal(point.origin))
			{
				return point;
			}
		}
	}
	return undefined;
}

/*
	Name: function_1e0d693b
	Namespace: vehicle_ai
	Checksum: 0x975157CB
	Offset: 0x75E0
	Size: 0xC2A
	Parameters: 2
	Flags: Linked
*/
function function_1e0d693b(goal, enemy)
{
	prefereddistawayfromorigin = (isdefined(self.settings.var_99955aeb) ? self.settings.var_99955aeb : 150);
	if(isdefined(self.settings.engagementheightmax) && isdefined(self.settings.engagementheightmin))
	{
		var_20b5eeff = 0.5 * (self.settings.engagementheightmax + self.settings.engagementheightmin);
	}
	else
	{
		var_20b5eeff = 150;
	}
	var_3069c020 = (isdefined(self.settings.var_2ade16ee) ? self.settings.var_2ade16ee : 450);
	enemypos = enemy.origin;
	if(function_ffa5b184(enemy))
	{
		enemypos = enemy.var_88f8feeb;
	}
	var_caa2a43c = max(prefereddistawayfromorigin, goal.goalradius + distance2d(self.origin, goal.goalpos));
	var_a51de54a = goal.goalheight + (abs(self.origin[2] - goal.goalpos[2]));
	closedist = 1.2 * self.var_ec0d66ce;
	fardist = 3 * self.var_ec0d66ce;
	selfdisttoenemy = distance2d(self.origin, enemypos);
	querymultiplier = mapfloat(closedist, fardist, 1, 3, selfdisttoenemy);
	maxsearchradius = min(var_caa2a43c, (isdefined(self.settings.var_3285f09a) ? self.settings.var_3285f09a : 1000) * querymultiplier);
	halfheight = min(var_a51de54a / 2, (isdefined(self.settings.var_e1d36c37) ? self.settings.var_e1d36c37 : 300) * querymultiplier);
	innerspacing = maxsearchradius / 10;
	outerspacing = innerspacing;
	queryresult = positionquery_source_navigation(self.origin, (isdefined(self.settings.var_99955aeb) ? self.settings.var_99955aeb : 0), maxsearchradius, halfheight, innerspacing, self, outerspacing);
	positionquery_filter_distancetogoal(queryresult, self);
	positionquery_filter_inclaimedlocation(queryresult, self);
	positionquery_filter_sight(queryresult, enemypos, self geteye() - self.origin, self, 0, enemy);
	self positionquery_filter_engagementdist(queryresult, enemy, self.settings.engagementdistmin, self.settings.engagementdistmax, var_3069c020);
	goalheight = enemypos[2] + (0.5 * (self.settings.engagementheightmin + self.settings.engagementheightmax));
	foreach(point in queryresult.data)
	{
		if(point.disttogoal > 0)
		{
			score = -5000 - (point.disttogoal * 2);
			/#
				if(!isdefined(point._scoredebug))
				{
					point._scoredebug = [];
				}
				if(!isdefined(point._scoredebug[#"outofgoalanchor"]))
				{
					point._scoredebug[#"outofgoalanchor"] = spawnstruct();
				}
				point._scoredebug[#"outofgoalanchor"].score = score;
				point._scoredebug[#"outofgoalanchor"].scorename = "";
			#/
			point.score = point.score + score;
		}
		if(!point.visibility)
		{
			/#
				if(!isdefined(point._scoredebug))
				{
					point._scoredebug = [];
				}
				if(!isdefined(point._scoredebug[#"hash_3f8a9579ce4600de"]))
				{
					point._scoredebug[#"hash_3f8a9579ce4600de"] = spawnstruct();
				}
				point._scoredebug[#"hash_3f8a9579ce4600de"].score = -5000;
				point._scoredebug[#"hash_3f8a9579ce4600de"].scorename = "";
			#/
			point.score = point.score + -5000;
		}
		/#
			if(!isdefined(point._scoredebug))
			{
				point._scoredebug = [];
			}
			if(!isdefined(point._scoredebug[#"engagementdist"]))
			{
				point._scoredebug[#"engagementdist"] = spawnstruct();
			}
			point._scoredebug[#"engagementdist"].score = point.distawayfromengagementarea * -1;
			point._scoredebug[#"engagementdist"].scorename = "";
		#/
		point.score = point.score + (point.distawayfromengagementarea * -1);
		/#
			if(!isdefined(point._scoredebug))
			{
				point._scoredebug = [];
			}
			if(!isdefined(point._scoredebug[#"hash_6c444b535ec20313"]))
			{
				point._scoredebug[#"hash_6c444b535ec20313"] = spawnstruct();
			}
			point._scoredebug[#"hash_6c444b535ec20313"].score = mapfloat(0, prefereddistawayfromorigin, -5000, 0, point.disttoorigin2d);
			point._scoredebug[#"hash_6c444b535ec20313"].scorename = "";
		#/
		point.score = point.score + (mapfloat(0, prefereddistawayfromorigin, -5000, 0, point.disttoorigin2d));
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
				point._scoredebug[#"inclaimedlocation"].score = -5000;
				point._scoredebug[#"inclaimedlocation"].scorename = "";
			#/
			point.score = point.score + -5000;
		}
		distfrompreferredheight = abs(point.origin[2] - goalheight);
		if(distfrompreferredheight > var_20b5eeff)
		{
			heightscore = mapfloat(var_20b5eeff, 10000, 0, 2500, distfrompreferredheight) * -1;
			/#
				if(!isdefined(point._scoredebug))
				{
					point._scoredebug = [];
				}
				if(!isdefined(point._scoredebug[#"height"]))
				{
					point._scoredebug[#"height"] = spawnstruct();
				}
				point._scoredebug[#"height"].score = heightscore;
				point._scoredebug[#"height"].scorename = "";
			#/
			point.score = point.score + heightscore;
		}
		score = randomfloatrange(0, 80);
		/#
			if(!isdefined(point._scoredebug))
			{
				point._scoredebug = [];
			}
			if(!isdefined(point._scoredebug[#"random"]))
			{
				point._scoredebug[#"random"] = spawnstruct();
			}
			point._scoredebug[#"random"].score = score;
			point._scoredebug[#"random"].scorename = "";
		#/
		point.score = point.score + score;
	}
	if(queryresult.data.size > 0)
	{
		positionquery_postprocess_sortscore(queryresult);
		self positionquery_debugscores(queryresult);
		foreach(point in queryresult.data)
		{
			if(self isingoal(point.origin))
			{
				return point;
			}
		}
	}
	return undefined;
}

/*
	Name: function_4646fb11
	Namespace: vehicle_ai
	Checksum: 0x9B1D0C60
	Offset: 0x8218
	Size: 0x4EA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4646fb11(goal)
{
	minsearchradius = math::clamp(120, 0, goal.goalradius);
	maxsearchradius = math::clamp(800, 120, goal.goalradius);
	queryresult = positionquery_source_navigation(self.origin, minsearchradius, maxsearchradius, 400, 80, self, 50);
	positionquery_filter_distancetogoal(queryresult, self);
	positionquery_filter_inclaimedlocation(queryresult, self);
	foreach(point in queryresult.data)
	{
		if(point.disttogoal > 0)
		{
			score = -5000 - (point.disttogoal * 2);
			/#
				if(!isdefined(point._scoredebug))
				{
					point._scoredebug = [];
				}
				if(!isdefined(point._scoredebug[#"outofgoalanchor"]))
				{
					point._scoredebug[#"outofgoalanchor"] = spawnstruct();
				}
				point._scoredebug[#"outofgoalanchor"].score = score;
				point._scoredebug[#"outofgoalanchor"].scorename = "";
			#/
			point.score = point.score + score;
		}
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
				point._scoredebug[#"inclaimedlocation"].score = -5000;
				point._scoredebug[#"inclaimedlocation"].scorename = "";
			#/
			point.score = point.score + -5000;
		}
		score = randomfloatrange(0, 80);
		/#
			if(!isdefined(point._scoredebug))
			{
				point._scoredebug = [];
			}
			if(!isdefined(point._scoredebug[#"random"]))
			{
				point._scoredebug[#"random"] = spawnstruct();
			}
			point._scoredebug[#"random"].score = score;
			point._scoredebug[#"random"].scorename = "";
		#/
		point.score = point.score + score;
	}
	if(queryresult.data.size > 0)
	{
		positionquery_postprocess_sortscore(queryresult);
		self positionquery_debugscores(queryresult);
		foreach(point in queryresult.data)
		{
			if(self isingoal(point.origin))
			{
				return point;
			}
		}
	}
	return undefined;
}

/*
	Name: function_b1bd875a
	Namespace: vehicle_ai
	Checksum: 0xACE30A59
	Offset: 0x8710
	Size: 0x680
	Parameters: 0
	Flags: None
*/
function function_b1bd875a()
{
	/#
		assert(isdefined(self.ai));
	#/
	if(!isdefined(self.ai.var_88b0fd29))
	{
		self.ai.var_88b0fd29 = gettime() + 1000;
		return;
	}
	var_1f2328d0 = self function_4794d6a3();
	/#
		assert(isdefined(var_1f2328d0.goalpos));
	#/
	var_12cb92c6 = 0;
	newpos = undefined;
	point = undefined;
	enemy = self.enemy;
	currenttime = gettime();
	forcedgoal = is_true(var_1f2328d0.goalforced);
	isatgoal = is_true(var_1f2328d0.isatgoal);
	haspath = self haspath();
	isapproachinggoal = !isatgoal && haspath && self isapproachinggoal();
	itsbeenawhile = currenttime >= self.ai.var_88b0fd29;
	var_ed3f071f = currenttime >= (self.ai.var_88b0fd29 + 5000);
	var_48ea0381 = 0;
	if(issentient(enemy) && !haspath)
	{
		var_48ea0381 = !self seerecently(enemy, randomintrange(3, 5));
		if(var_48ea0381 && issentient(enemy))
		{
			var_48ea0381 = !self attackedrecently(enemy, randomintrange(5, 7));
		}
	}
	var_3e782e85 = forcedgoal || (var_1f2328d0.goalradius < (2 * self.radius) && var_1f2328d0.goalheight < (2 * self.radius));
	var_f5ae7ee0 = isatgoal && !var_3e782e85 && (itsbeenawhile || var_48ea0381);
	var_633ff15a = !isatgoal && (!isapproachinggoal || var_ed3f071f);
	var_12cb92c6 = var_f5ae7ee0 || var_633ff15a;
	if(var_12cb92c6)
	{
		if(!isatgoal || !var_3e782e85)
		{
			if(var_3e782e85)
			{
				newpos = self getclosestpointonnavvolume(var_1f2328d0.goalpos, self.radius * 2);
			}
			else
			{
				if(!isatgoal)
				{
					point = function_4ab1a63a(var_1f2328d0);
				}
				else
				{
					if(isdefined(enemy))
					{
						point = function_1e0d693b(var_1f2328d0, enemy);
					}
					else
					{
						point = function_4646fb11(var_1f2328d0);
					}
				}
			}
			if(isdefined(point))
			{
				newpos = point.origin;
			}
			if(!isdefined(newpos))
			{
				newpos = self getclosestpointonnavvolume(var_1f2328d0.goalpos, self.radius * 2);
			}
			if(!isdefined(newpos))
			{
				/#
					record3dtext((((("" + var_1f2328d0.goalpos) + "") + var_1f2328d0.goalradius) + "") + var_1f2328d0.goalheight, self.origin + vectorscale((0, 0, 1), 8), (1, 0, 0));
					recordline(self.origin, var_1f2328d0.goalpos, (1, 0, 0));
				#/
				newpos = var_1f2328d0.goalpos;
			}
			else if(!self isingoal(newpos))
			{
				/#
					record3dtext((((((("" + newpos) + "") + var_1f2328d0.goalpos) + "") + var_1f2328d0.goalradius) + "") + var_1f2328d0.goalheight, self.origin + vectorscale((0, 0, 1), 8), (1, 0, 0));
					recordline(self.origin, newpos, (1, 0, 0));
				#/
				newpos = var_1f2328d0.goalpos;
			}
			if(distancesquared(self.origin, newpos) < sqr(self.radius * 2))
			{
				newpos = undefined;
			}
			self.ai.var_88b0fd29 = currenttime + randomintrange(1000, 2000);
		}
	}
	else if(isatgoal && var_3e782e85)
	{
		self setspeedimmediate(0);
		self setvehvelocity((0, 0, 0));
		self setphysacceleration((0, 0, 0));
	}
	return newpos;
}

