#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace flak_drone;

/*
	Name: init_shared
	Namespace: flak_drone
	Checksum: 0x44516110
	Offset: 0x1B0
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.var_cc04df33))
	{
		level.var_cc04df33 = {};
		clientfield::register("vehicle", "flak_drone_camo", 1, 3, "int");
		vehicle::add_main_callback("veh_flak_drone_mp", &initflakdrone);
	}
}

/*
	Name: initflakdrone
	Namespace: flak_drone
	Checksum: 0x18117863
	Offset: 0x238
	Size: 0x24C
	Parameters: 0
	Flags: Linked
*/
function initflakdrone()
{
	self.health = self.healthdefault;
	self vehicle::friendly_fire_shield();
	self enableaimassist();
	self setneargoalnotifydist(40);
	self sethoverparams(50, 75, 100);
	self setvehicleavoidance(1);
	self.fovcosine = 0;
	self.fovcosinebusy = 0;
	self.vehaircraftcollisionenabled = 1;
	self.goalradius = 999999;
	self.goalheight = 999999;
	self function_a57c34b7(self.origin);
	self thread vehicle_ai::nudge_collision();
	self.overridevehicledamage = &flakdronedamageoverride;
	self vehicle_ai::init_state_machine_for_role("default");
	self vehicle_ai::get_state_callbacks("combat").enter_func = &state_combat_enter;
	self vehicle_ai::get_state_callbacks("combat").update_func = &state_combat_update;
	self vehicle_ai::get_state_callbacks("off").enter_func = &state_off_enter;
	self vehicle_ai::get_state_callbacks("off").update_func = &state_off_update;
	self vehicle_ai::get_state_callbacks("death").update_func = &state_death_update;
	self vehicle_ai::startinitialstate("off");
}

/*
	Name: state_off_enter
	Namespace: flak_drone
	Checksum: 0x66B92405
	Offset: 0x490
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function state_off_enter(params)
{
}

/*
	Name: state_off_update
	Namespace: flak_drone
	Checksum: 0xAC96E894
	Offset: 0x4A8
	Size: 0x430
	Parameters: 1
	Flags: Linked
*/
function state_off_update(params)
{
	self endon(#"change_state", #"death");
	while(!isdefined(self.parent))
	{
		wait(0.1);
	}
	self.parent endon(#"death");
	while(true)
	{
		self setspeed(400);
		if(is_true(self.inpain))
		{
			wait(0.1);
		}
		self vehclearlookat();
		self.current_pathto_pos = undefined;
		queryorigin = self.parent.origin + (0, 0, -75);
		queryresult = positionquery_source_navigation(queryorigin, 25, 75, 40, 40, self);
		if(isdefined(queryresult))
		{
			positionquery_filter_distancetogoal(queryresult, self);
			vehicle_ai::positionquery_filter_outofgoalanchor(queryresult);
			best_point = undefined;
			best_score = -999999;
			foreach(point in queryresult.data)
			{
				randomscore = randomfloatrange(0, 100);
				disttooriginscore = point.disttoorigin2d * 0.2;
				point.score = point.score + (randomscore + disttooriginscore);
				/#
					if(!isdefined(point._scoredebug))
					{
						point._scoredebug = [];
					}
					if(!isdefined(point._scoredebug[#"disttoorigin"]))
					{
						point._scoredebug[#"disttoorigin"] = spawnstruct();
					}
					point._scoredebug[#"disttoorigin"].score = disttooriginscore;
					point._scoredebug[#"disttoorigin"].scorename = "";
				#/
				point.score = point.score + disttooriginscore;
				if(point.score > best_score)
				{
					best_score = point.score;
					best_point = point;
				}
			}
			self vehicle_ai::positionquery_debugscores(queryresult);
			if(isdefined(best_point))
			{
				self.current_pathto_pos = best_point.origin;
			}
		}
		if(isdefined(self.current_pathto_pos))
		{
			self updateflakdronespeed();
			self function_a57c34b7(self.current_pathto_pos);
		}
		else
		{
			if(isdefined(self.parent.heligoalpos))
			{
				self.current_pathto_pos = self.parent.heligoalpos;
			}
			else
			{
				self.current_pathto_pos = queryorigin;
			}
			self updateflakdronespeed();
			self function_a57c34b7(self.current_pathto_pos);
		}
		wait(randomfloatrange(0.1, 0.2));
	}
}

/*
	Name: updateflakdronespeed
	Namespace: flak_drone
	Checksum: 0x480FF60A
	Offset: 0x8E0
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function updateflakdronespeed()
{
	desiredspeed = 400;
	if(isdefined(self.parent))
	{
		parentspeed = self.parent getspeed();
		desiredspeed = parentspeed * 0.9;
		if(distance2dsquared(self.parent.origin, self.origin) > sqr(36))
		{
			if(isdefined(self.current_pathto_pos))
			{
				flakdronedistancetogoalsquared = distance2dsquared(self.origin, self.current_pathto_pos);
				parentdistancetogoalsquared = distance2dsquared(self.parent.origin, self.current_pathto_pos);
				if(flakdronedistancetogoalsquared > parentdistancetogoalsquared)
				{
					desiredspeed = parentspeed * 1.3;
				}
				else
				{
					desiredspeed = parentspeed * 0.8;
				}
			}
		}
	}
	self setspeed(max(desiredspeed, 10));
}

/*
	Name: state_combat_enter
	Namespace: flak_drone
	Checksum: 0xAC96B88A
	Offset: 0xA50
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function state_combat_enter(params)
{
}

/*
	Name: state_combat_update
	Namespace: flak_drone
	Checksum: 0xEE99E0A0
	Offset: 0xA68
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function state_combat_update(params)
{
	drone = self;
	drone endon(#"change_state", #"death");
	drone thread spawnflakrocket(drone.incoming_missile, drone.origin, drone.parent);
	drone ghost();
}

/*
	Name: spawnflakrocket
	Namespace: flak_drone
	Checksum: 0x50901E1B
	Offset: 0xB00
	Size: 0x502
	Parameters: 3
	Flags: Linked
*/
function spawnflakrocket(missile, spawnpos, parent)
{
	drone = self;
	missile endon(#"death");
	missile missile_settarget(parent);
	rocket = magicbullet(getweapon(#"flak_drone_rocket"), spawnpos, missile.origin, parent, missile);
	rocket.team = parent.team;
	rocket setteam(parent.team);
	rocket clientfield::set("enemyvehicle", 1);
	rocket missile_settarget(missile);
	missile thread cleanupaftermissiledeath(rocket, drone);
	curdist = distance(missile.origin, rocket.origin);
	tooclosetopredictedparent = 0;
	/#
		debug_draw = getdvarint(#"scr_flak_drone_debug_trails", 0);
		debug_duration = getdvarint(#"scr_flak_drone_debug_trails_duration", 400);
	#/
	while(true)
	{
		waitframe(1);
		prevdist = curdist;
		if(isdefined(rocket))
		{
			curdist = distance(missile.origin, rocket.origin);
			distdelta = prevdist - curdist;
			predicteddist = curdist - distdelta;
		}
		/#
			if(debug_draw && isdefined(missile))
			{
				util::debug_sphere(missile.origin, 6, vectorscale((1, 0, 0), 0.9), 0.9, debug_duration);
			}
			if(debug_draw && isdefined(rocket))
			{
				util::debug_sphere(rocket.origin, 6, vectorscale((0, 0, 1), 0.9), 0.9, debug_duration);
			}
		#/
		if(isdefined(parent))
		{
			parentvelocity = parent getvelocity();
			parentpredictedlocation = parent.origin + (parentvelocity * 0.05);
			missilevelocity = missile getvelocity();
			missilepredictedlocation = missile.origin + (missilevelocity * 0.05);
			if(distancesquared(parentpredictedlocation, missilepredictedlocation) < sqr(1000) || distancesquared(parent.origin, missilepredictedlocation) < sqr(1000))
			{
				tooclosetopredictedparent = 1;
			}
		}
		if(predicteddist < 0 || curdist > prevdist || tooclosetopredictedparent || !isdefined(rocket))
		{
			/#
				if(debug_draw && isdefined(parent))
				{
					if(tooclosetopredictedparent && (!(predicteddist < 0 || curdist > prevdist)))
					{
						util::debug_sphere(parent.origin, 18, vectorscale((1, 0, 1), 0.9), 0.9, debug_duration);
					}
					else
					{
						util::debug_sphere(parent.origin, 18, vectorscale((0, 1, 0), 0.9), 0.9, debug_duration);
					}
				}
			#/
			if(isdefined(rocket))
			{
				rocket detonate();
			}
			missile thread heatseekingmissile::_missiledetonate(missile.target_attacker, missile.target_weapon, missile.target_weapon.explosionradius, 10, 20);
			return;
		}
	}
}

/*
	Name: cleanupaftermissiledeath
	Namespace: flak_drone
	Checksum: 0x569D00E3
	Offset: 0x1010
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function cleanupaftermissiledeath(rocket, flak_drone)
{
	missile = self;
	missile waittill(#"death");
	wait(0.5);
	if(isdefined(rocket))
	{
		rocket delete();
	}
	if(isdefined(flak_drone))
	{
		flak_drone delete();
	}
}

/*
	Name: state_death_update
	Namespace: flak_drone
	Checksum: 0x85AE7853
	Offset: 0x10A0
	Size: 0x1BC
	Parameters: 1
	Flags: Linked
*/
function state_death_update(params)
{
	self endon(#"death");
	dogibbeddeath = 0;
	if(isdefined(self.death_info))
	{
		if(isdefined(self.death_info.weapon))
		{
			if(self.death_info.weapon.dogibbing || self.death_info.weapon.doannihilate)
			{
				dogibbeddeath = 1;
			}
		}
		if(isdefined(self.death_info.meansofdeath))
		{
			meansofdeath = self.death_info.meansofdeath;
			if(meansofdeath == "MOD_EXPLOSIVE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_PROJECTILE_SPLASH" || meansofdeath == "MOD_PROJECTILE")
			{
				dogibbeddeath = 1;
			}
		}
	}
	params = getscriptbundle("killstreak_core");
	if(dogibbeddeath)
	{
		self playsound(#"veh_wasp_gibbed");
		self ghost();
		self notsolid();
		wait(5);
		if(isdefined(self))
		{
			self delete();
		}
	}
	else
	{
		self vehicle_death::flipping_shooting_death();
	}
}

/*
	Name: drone_pain_for_time
	Namespace: flak_drone
	Checksum: 0x3EE5BEAE
	Offset: 0x1268
	Size: 0x1E6
	Parameters: 3
	Flags: Linked
*/
function drone_pain_for_time(time, stablizeparam, restorelookpoint)
{
	self endon(#"death");
	self.painstarttime = gettime();
	if(!is_true(self.inpain))
	{
		self.inpain = 1;
		while(gettime() < self.painstarttime + (int(time * 1000)))
		{
			self setvehvelocity(self.velocity * stablizeparam);
			self setangularvelocity(self getangularvelocity() * stablizeparam);
			wait(0.1);
		}
		if(isdefined(restorelookpoint))
		{
			restorelookent = spawn("script_model", restorelookpoint);
			restorelookent setmodel(#"tag_origin");
			self vehclearlookat();
			self vehlookat(restorelookent);
			self turretsettarget(0, restorelookent);
			restorelookent thread util::function_f9af3d43(1.5);
			wait(1.5);
			self vehclearlookat();
			self turretcleartarget(0);
		}
		self.inpain = 0;
	}
}

/*
	Name: drone_pain
	Namespace: flak_drone
	Checksum: 0xD551DFCC
	Offset: 0x1458
	Size: 0x12C
	Parameters: 6
	Flags: Linked
*/
function drone_pain(eattacker, damagetype, hitpoint, hitdirection, hitlocationinfo, partname)
{
	if(!is_true(self.inpain))
	{
		yaw_vel = math::randomsign() * randomfloatrange(280, 320);
		ang_vel = self getangularvelocity();
		ang_vel = ang_vel + (randomfloatrange(-120, -100), yaw_vel, randomfloatrange(-200, 200));
		self setangularvelocity(ang_vel);
		self thread drone_pain_for_time(0.8, 0.7);
	}
}

/*
	Name: flakdronedamageoverride
	Namespace: flak_drone
	Checksum: 0xF01F8903
	Offset: 0x1590
	Size: 0xF8
	Parameters: 15
	Flags: Linked
*/
function flakdronedamageoverride(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(psoffsettime == "MOD_TRIGGER_HURT")
	{
		return 0;
	}
	if(isdefined(shitloc) && isdefined(shitloc.team) && util::function_fbce7263(shitloc.team, self.team))
	{
		drone_pain(shitloc, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
	}
	return vdamageorigin;
}

/*
	Name: spawn
	Namespace: flak_drone
	Checksum: 0x909DC80B
	Offset: 0x1690
	Size: 0x130
	Parameters: 2
	Flags: Linked
*/
function spawn(parent, ondeathcallback)
{
	if(!isnavvolumeloaded())
	{
		/#
			iprintlnbold("");
		#/
		return undefined;
	}
	spawnpoint = parent.origin + (vectorscale((0, 0, -1), 50));
	drone = spawnvehicle("veh_flak_drone_mp", spawnpoint, parent.angles, "dynamic_spawn_ai");
	drone.death_callback = ondeathcallback;
	drone configureteam(parent, 0);
	drone thread watchgameevents();
	drone thread watchdeath();
	drone thread watchparentdeath();
	drone thread watchparentmissiles();
	return drone;
}

/*
	Name: configureteam
	Namespace: flak_drone
	Checksum: 0xCAD0B0B4
	Offset: 0x17C8
	Size: 0xB2
	Parameters: 2
	Flags: Linked
*/
function configureteam(parent, ishacked)
{
	drone = self;
	drone.team = parent.team;
	drone setteam(parent.team);
	if(ishacked)
	{
		drone clientfield::set("enemyvehicle", 2);
	}
	else
	{
		drone clientfield::set("enemyvehicle", 1);
	}
	drone.parent = parent;
}

/*
	Name: watchgameevents
	Namespace: flak_drone
	Checksum: 0x72CD4B98
	Offset: 0x1888
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function watchgameevents()
{
	drone = self;
	drone endon(#"death");
	drone.parent.owner waittill(#"game_ended", #"emp_jammed", #"disconnect", #"joined_team");
	drone shutdown(1);
}

/*
	Name: watchdeath
	Namespace: flak_drone
	Checksum: 0xD06D913D
	Offset: 0x1930
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function watchdeath()
{
	drone = self;
	drone.parent endon(#"death");
	drone waittill(#"death");
	drone shutdown(1);
}

/*
	Name: watchparentdeath
	Namespace: flak_drone
	Checksum: 0x4EEC8EB7
	Offset: 0x1998
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function watchparentdeath()
{
	drone = self;
	drone endon(#"death");
	drone.parent waittill(#"death");
	drone shutdown(1);
}

/*
	Name: watchparentmissiles
	Namespace: flak_drone
	Checksum: 0xF58A0B70
	Offset: 0x1A08
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function watchparentmissiles()
{
	drone = self;
	drone endon(#"death");
	drone.parent endon(#"death");
	waitresult = undefined;
	waitresult = drone.parent waittill(#"stinger_fired_at_me");
	drone.incoming_missile = waitresult.projectile;
	drone.incoming_missile.target_weapon = waitresult.weapon;
	drone.incoming_missile.target_attacker = waitresult.attacker;
	drone vehicle_ai::set_state("combat");
}

/*
	Name: setcamostate
	Namespace: flak_drone
	Checksum: 0x987BC86A
	Offset: 0x1AE0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function setcamostate(state)
{
	self clientfield::set("flak_drone_camo", state);
}

/*
	Name: shutdown
	Namespace: flak_drone
	Checksum: 0xB76A1834
	Offset: 0x1B18
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function shutdown(explode)
{
	drone = self;
	if(isdefined(drone.death_callback))
	{
		drone.parent thread [[drone.death_callback]]();
	}
	if(isdefined(drone) && !isdefined(drone.parent))
	{
		drone ghost();
		drone notsolid();
		wait(5);
		if(isdefined(drone))
		{
			drone delete();
		}
	}
	if(isdefined(drone))
	{
		if(explode)
		{
			drone dodamage(drone.health + 1000, drone.origin, drone, drone, "none", "MOD_EXPLOSIVE");
		}
		else
		{
			drone delete();
		}
	}
}

