#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace repulsor;

/*
	Name: __init__system__
	Namespace: repulsor
	Checksum: 0x55CBA5AC
	Offset: 0x1D0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"repulsor", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: guard
	Namespace: repulsor
	Checksum: 0xD73A7841
	Offset: 0x218
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function guard(target)
{
	self setgoal(target, 0);
	self vehicle_ai::airfollow(target);
}

/*
	Name: function_70a657d8
	Namespace: repulsor
	Checksum: 0x1F6611F7
	Offset: 0x260
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("repulsor_drone", &repulsor_initialize);
	clientfield::register("vehicle", "pulse_fx", 1, 1, "counter");
}

/*
	Name: repulsor_initialize
	Namespace: repulsor
	Checksum: 0x68741BF8
	Offset: 0x2C8
	Size: 0x1E4
	Parameters: 0
	Flags: Linked
*/
function repulsor_initialize()
{
	self useanimtree("generic");
	self.health = self.healthdefault;
	self vehicle::friendly_fire_shield();
	self enableaimassist();
	self setneargoalnotifydist(40);
	self sethoverparams(50, 100, 100);
	self.fovcosine = 0;
	self.fovcosinebusy = 0;
	self.vehaircraftcollisionenabled = 1;
	/#
		assert(isdefined(self.scriptbundlesettings));
	#/
	self.settings = getscriptbundle(self.scriptbundlesettings);
	self.goalradius = 999999;
	self.goalheight = 999999;
	self setgoal(self.origin, 0, self.goalradius, self.goalheight);
	self.overridevehicledamage = &drone_callback_damage;
	self.allowfriendlyfiredamageoverride = &drone_allowfriendlyfiredamage;
	self.attackeraccuracy = 0.5;
	self thread vehicle_ai::nudge_collision();
	if(isdefined(level.vehicle_initializer_cb))
	{
		[[level.vehicle_initializer_cb]](self);
	}
	self.lastdamagetime = 0;
	enable_repulsor();
	defaultrole();
}

/*
	Name: defaultrole
	Namespace: repulsor
	Checksum: 0xF15E0994
	Offset: 0x4B8
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function defaultrole()
{
	self vehicle_ai::init_state_machine_for_role("default");
	self vehicle_ai::get_state_callbacks("combat").update_func = &state_guard_update;
	self vehicle_ai::get_state_callbacks("death").update_func = &state_death_update;
	vehicle_ai::startinitialstate("combat");
}

/*
	Name: state_death_update
	Namespace: repulsor
	Checksum: 0x12872B24
	Offset: 0x560
	Size: 0x3BC
	Parameters: 1
	Flags: Linked
*/
function state_death_update(params)
{
	self endon(#"death");
	remove_repulsor();
	if(isarray(self.followers))
	{
		foreach(follower in self.followers)
		{
			if(isdefined(follower))
			{
				follower.leader = undefined;
			}
		}
	}
	self.off = 1;
	death_type = vehicle_ai::get_death_type(params);
	if(!isdefined(death_type) && isdefined(params))
	{
		if(isdefined(params.weapon))
		{
			if(params.weapon.doannihilate)
			{
				death_type = "gibbed";
			}
			else if(params.weapon.dogibbing && isdefined(params.attacker))
			{
				dist = distance(self.origin, params.attacker.origin);
				if(dist < params.weapon.maxgibdistance)
				{
					gib_chance = 1 - (dist / params.weapon.maxgibdistance);
					if(randomfloatrange(0, 2) < gib_chance)
					{
						death_type = "gibbed";
					}
				}
			}
		}
		if(isdefined(params.meansofdeath))
		{
			meansofdeath = params.meansofdeath;
			if(meansofdeath === "MOD_EXPLOSIVE" || meansofdeath === "MOD_GRENADE_SPLASH" || meansofdeath === "MOD_PROJECTILE_SPLASH" || meansofdeath === "MOD_PROJECTILE")
			{
				death_type = "gibbed";
			}
		}
	}
	if(!isdefined(death_type))
	{
		crash_style = randomint(3);
		switch(crash_style)
		{
			case 0:
			{
				if(self.hijacked === 1)
				{
					params.death_type = "gibbed";
					vehicle_ai::defaultstate_death_update(params);
				}
				else
				{
					vehicle_death::barrel_rolling_crash();
				}
				break;
			}
			case 1:
			{
				vehicle_death::plane_crash();
				break;
			}
			default:
			{
				vehicle_death::random_crash(params.vdir);
			}
		}
		self vehicle_death::deletewhensafe();
	}
	else
	{
		params.death_type = death_type;
		vehicle_ai::defaultstate_death_update(params);
	}
}

/*
	Name: guard_points_debug
	Namespace: repulsor
	Checksum: 0xC6E983FC
	Offset: 0x928
	Size: 0x10A
	Parameters: 0
	Flags: None
*/
function guard_points_debug()
{
	/#
		self endon(#"death");
		if(self.isdebugdrawing === 1)
		{
			return;
		}
		self.isdebugdrawing = 1;
		while(true)
		{
			foreach(point in self.debugpointsarray)
			{
				color = (1, 0, 0);
				if(ispointinnavvolume(point, ""))
				{
					color = (0, 1, 0);
				}
				debugstar(point, 5, color);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: get_guard_points
	Namespace: repulsor
	Checksum: 0x359443B1
	Offset: 0xA40
	Size: 0x332
	Parameters: 1
	Flags: None
*/
function get_guard_points(owner)
{
	/#
		assert(self._guard_points.size > 0, "");
	#/
	points_array = [];
	foreach(point in self._guard_points)
	{
		offset = rotatepoint(point, owner.angles);
		worldpoint = (offset + owner.origin) + (owner getvelocity() * 0.5);
		if(ispointinnavvolume(worldpoint, "navvolume_small"))
		{
			if(!isdefined(points_array))
			{
				points_array = [];
			}
			else if(!isarray(points_array))
			{
				points_array = array(points_array);
			}
			points_array[points_array.size] = worldpoint;
		}
	}
	if(points_array.size < 1)
	{
		queryresult = positionquery_source_navigation(owner.origin + vectorscale((0, 0, 1), 50), 25, 200, 100, 1.2 * self.radius, self);
		positionquery_filter_sight(queryresult, owner.origin + vectorscale((0, 0, 1), 10), (0, 0, 0), self, 3);
		foreach(point in queryresult.data)
		{
			if(point.visibility === 1 && bullettracepassed(owner.origin + vectorscale((0, 0, 1), 10), point.origin, 0, self, self, 0, 1))
			{
				if(!isdefined(points_array))
				{
					points_array = [];
				}
				else if(!isarray(points_array))
				{
					points_array = array(points_array);
				}
				points_array[points_array.size] = point.origin;
			}
		}
	}
	return points_array;
}

/*
	Name: update_guard_target
	Namespace: repulsor
	Checksum: 0x6D936BE4
	Offset: 0xD80
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function update_guard_target()
{
	if(isalive(self.host))
	{
		return;
	}
	aiarray = getaiteamarray(self.team);
	aiarray = arraysort(aiarray, self.origin, 1);
	for(i = 0; i < aiarray.size; i++)
	{
		friend = aiarray[i];
		if(friend !== self && !vehicle_ai::entityisarchetype(friend, #"repulsor") && isalive(friend))
		{
			if(self cansee(friend))
			{
				guard(friend);
				break;
			}
			if(!isalive(self.host))
			{
				guard(friend);
			}
		}
	}
}

/*
	Name: test_get_back_point
	Namespace: repulsor
	Checksum: 0x514728F9
	Offset: 0xED0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function test_get_back_point(point)
{
	if(sighttracepassed(self.origin, point, 0, self))
	{
		if(bullettracepassed(self.origin, point, 0, self, self, 0, 1))
		{
			return 1;
		}
		return 0;
	}
	return -1;
}

/*
	Name: test_get_back_queryresult
	Namespace: repulsor
	Checksum: 0xACA79F54
	Offset: 0xF40
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function test_get_back_queryresult(queryresult)
{
	getbackpoint = undefined;
	foreach(point in queryresult.data)
	{
		testresult = test_get_back_point(point.origin);
		if(testresult == 1)
		{
			return point.origin;
		}
		if(testresult == 0)
		{
			waitframe(1);
		}
	}
	return undefined;
}

/*
	Name: state_guard_update
	Namespace: repulsor
	Checksum: 0x6F551BAA
	Offset: 0x1030
	Size: 0x6D4
	Parameters: 1
	Flags: Linked
*/
function state_guard_update(params)
{
	self endon(#"death", #"change_state");
	self sethoverparams(20, 40, 30);
	wait(0.1);
	self clientfield::increment("pulse_fx", 1);
	timenotatgoal = gettime();
	pointindex = 0;
	stuckcount = 0;
	while(true)
	{
		update_guard_target();
		usepathfinding = 1;
		onnavvolume = ispointinnavvolume(self.origin, "navvolume_small");
		if(!onnavvolume)
		{
			getbackpoint = undefined;
			pointonnavvolume = self getclosestpointonnavvolume(self.origin, 500);
			if(isdefined(pointonnavvolume))
			{
				if(test_get_back_point(pointonnavvolume) == 1)
				{
					getbackpoint = pointonnavvolume;
				}
			}
			if(!isdefined(getbackpoint))
			{
				queryresult = positionquery_source_navigation(self.origin, 0, 1500, 200, 80, self);
				getbackpoint = test_get_back_queryresult(queryresult);
			}
			if(!isdefined(getbackpoint))
			{
				queryresult = positionquery_source_navigation(self.origin, 0, 300, 700, 30, self);
				getbackpoint = test_get_back_queryresult(queryresult);
			}
			if(isdefined(getbackpoint))
			{
				if(distancesquared(getbackpoint, self.origin) > sqr(20))
				{
					self.current_pathto_pos = getbackpoint;
					usepathfinding = 0;
					self.vehaircraftcollisionenabled = 0;
				}
				else
				{
					onnavvolume = 1;
				}
			}
			else
			{
				stuckcount++;
				if(stuckcount == 1)
				{
					stucklocation = self.origin;
				}
				else if(stuckcount > 10)
				{
					/#
						v_box_min = (self.radius * -1, self.radius * -1, self.radius * -1);
						v_box_max = (self.radius, self.radius, self.radius);
						box(self.origin, v_box_min, v_box_max, self.angles[1], (1, 0, 0), 1, 0, 1000000);
						if(isdefined(stucklocation))
						{
							line(stucklocation, self.origin, (1, 0, 0), 1, 1, 1000000);
						}
					#/
					self kill();
					wait(0.5);
					continue;
				}
			}
		}
		airfollowingposition = undefined;
		if(onnavvolume)
		{
			self.vehaircraftcollisionenabled = 1;
			airfollowingposition = self vehicle_ai::getairfollowingposition(1);
			if(!isdefined(airfollowingposition))
			{
				var_1f2328d0 = self function_4794d6a3();
				if(!is_true(self.isatgoal))
				{
					airfollowingposition = function_649bd6d(var_1f2328d0);
				}
			}
		}
		if(isdefined(airfollowingposition))
		{
			if(util::timesince(self.lastdamagetime) < 1.5)
			{
				if(!isdefined(self.evasiveoffset))
				{
					self.evasiveoffset = math::point_on_sphere_even_distribution(100, randomint(80), 100);
				}
				self.current_pathto_pos = self getclosestpointonnavvolume(airfollowingposition + (100 * self.evasiveoffset), 60);
				if(!isdefined(self.current_pathto_pos))
				{
					self.current_pathto_pos = airfollowingposition;
				}
			}
			else
			{
				self.evasiveoffset = undefined;
				self.current_pathto_pos = airfollowingposition;
			}
		}
		if(isdefined(self.current_pathto_pos))
		{
			distancetogoalsq = distancesquared(self.current_pathto_pos, self.origin);
			if(!onnavvolume || distancetogoalsq > sqr(60))
			{
				if(distancetogoalsq > sqr(500))
				{
					self setspeed(self.settings.defaultmovespeed * 2);
				}
				else
				{
					self setspeed(self.settings.defaultmovespeed);
				}
				timenotatgoal = gettime();
			}
			else
			{
				wait(0.2);
				continue;
			}
			var_1f2328d0 = self function_4794d6a3();
			if(!isdefined(var_1f2328d0.var_9e404264) || is_true(var_1f2328d0.var_9e404264))
			{
				if(self function_a57c34b7(self.current_pathto_pos, 1, usepathfinding))
				{
					self playsound(#"veh_repulsor_direction");
					self vehclearlookat();
					self notify(#"fire_stop");
					waitframe(1);
				}
				else
				{
					wait(0.5);
				}
			}
			else
			{
				wait(0.5);
			}
		}
		else
		{
			wait(0.5);
		}
	}
}

/*
	Name: repulsor_fx
	Namespace: repulsor
	Checksum: 0x7CA922C6
	Offset: 0x1710
	Size: 0xE8
	Parameters: 0
	Flags: Linked
*/
function repulsor_fx()
{
	self notify(#"end_repulsor_fx");
	self endon(#"end_repulsor_fx", #"death");
	while(true)
	{
		self waittill(#"projectile_applyattractor", #"play_meleefx");
		if(util::iscooldownready("repulsorfx_interval"))
		{
			playfxontag(self.settings.trophyrepulsefx, self, "tag_origin");
			self clientfield::increment("pulse_fx", 1);
			util::cooldown("repulsorfx_interval", 0.5);
		}
	}
}

/*
	Name: enable_repulsor
	Namespace: repulsor
	Checksum: 0xDA08B79F
	Offset: 0x1800
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function enable_repulsor()
{
	if(!isdefined(self.missile_repulsor))
	{
		self.missile_repulsor = missile_createrepulsorent(self, 40000, self.settings.trophysystemrange, 1);
	}
	self thread repulsor_fx();
}

/*
	Name: remove_repulsor
	Namespace: repulsor
	Checksum: 0x4E96A8A9
	Offset: 0x1860
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function remove_repulsor()
{
	if(isdefined(self.missile_repulsor))
	{
		missile_deleteattractor(self.missile_repulsor);
		self.missile_repulsor = undefined;
	}
	self notify(#"end_repulsor_fx");
}

/*
	Name: drone_callback_damage
	Namespace: repulsor
	Checksum: 0xA2A0276A
	Offset: 0x18B0
	Size: 0x15E
	Parameters: 15
	Flags: Linked
*/
function drone_callback_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(smeansofdeath === "MOD_GRENADE" || smeansofdeath === "MOD_GRENADE_SPLASH" || smeansofdeath === "MOD_PROJECTILE" || smeansofdeath === "MOD_PROJECTILE_SPLASH" || smeansofdeath === "MOD_EXPLOSIVE" || smeansofdeath === "MOD_IMPACT" || smeansofdeath === "MOD_ELECTROCUTED" || smeansofdeath === "MOD_GAS")
	{
		return 0;
	}
	idamage = vehicle_ai::shared_callback_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
	self.lastdamagetime = gettime();
	return idamage;
}

/*
	Name: drone_allowfriendlyfiredamage
	Namespace: repulsor
	Checksum: 0xC0D33605
	Offset: 0x1A18
	Size: 0x86
	Parameters: 4
	Flags: Linked
*/
function drone_allowfriendlyfiredamage(einflictor, eattacker, smeansofdeath, weapon)
{
	if(isdefined(smeansofdeath) && isdefined(smeansofdeath.archetype) && isdefined(weapon) && smeansofdeath.archetype == #"repulsor" && weapon == "MOD_EXPLOSIVE")
	{
		return true;
	}
	return false;
}

/*
	Name: function_649bd6d
	Namespace: repulsor
	Checksum: 0x1D88F26B
	Offset: 0x1AA8
	Size: 0x40E
	Parameters: 1
	Flags: Linked
*/
function function_649bd6d(goal)
{
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
		vehicle_ai::positionquery_postprocess_sortscore(queryresult);
		self vehicle_ai::positionquery_debugscores(queryresult);
		foreach(point in queryresult.data)
		{
			if(self isingoal(point.origin))
			{
				return point.origin;
			}
		}
	}
	return undefined;
}

