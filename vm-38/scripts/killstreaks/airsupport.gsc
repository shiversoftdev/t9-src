#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\weapons\weapons.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace airsupport;

/*
	Name: function_e1c68c97
	Namespace: airsupport
	Checksum: 0xC241ED53
	Offset: 0x1E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e1c68c97()
{
	level notify(-804595150);
}

/*
	Name: init_shared
	Namespace: airsupport
	Checksum: 0x5D7937B1
	Offset: 0x200
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.var_f81eb032))
	{
		level.var_f81eb032 = {};
		level.var_f81eb032.var_176dc082 = &monitorspeed;
		level.noflyzones = [];
		level.noflyzones = getentarray("no_fly_zone", "targetname");
		airsupport_heights = struct::get_array("air_support_height", "targetname");
		/#
			if(airsupport_heights.size > 1)
			{
				util::error("");
			}
		#/
		airsupport_heights = getentarray("air_support_height", "targetname");
		/#
			if(airsupport_heights.size > 0)
			{
				util::error("");
			}
		#/
		heli_height_meshes = getentarray("heli_height_lock", "classname");
		/#
			if(heli_height_meshes.size > 1)
			{
				util::error("");
			}
		#/
		callback::on_spawned(&clearmonitoredspeed);
	}
}

/*
	Name: function_83904681
	Namespace: airsupport
	Checksum: 0xF0EC00FF
	Offset: 0x398
	Size: 0x12C
	Parameters: 3
	Flags: Linked
*/
function function_83904681(location, usedcallback, killstreakname)
{
	self notify(#"used");
	waitframe(1);
	if(isdefined(usedcallback))
	{
		killstreak_id = -1;
		if(isdefined(killstreakname))
		{
			params = killstreaks::get_script_bundle(killstreakname);
			team = self.team;
			killstreak_id = self killstreakrules::killstreakstart(killstreakname, team, 0, 1);
			if(killstreak_id == -1)
			{
				return 0;
			}
			if(isdefined(level.var_1492d026))
			{
				self [[level.var_1492d026]](killstreakname, team, killstreak_id);
			}
			self stats::function_e24eec31(params.ksweapon, #"used", 1);
		}
		return self [[usedcallback]](location, killstreak_id, killstreakname);
	}
	return 1;
}

/*
	Name: endselectionongameend
	Namespace: airsupport
	Checksum: 0xC6D217D8
	Offset: 0x4D0
	Size: 0x7E
	Parameters: 0
	Flags: Linked
*/
function endselectionongameend()
{
	self endon(#"death", #"disconnect", #"cancel_location", #"used", #"host_migration_begin");
	level waittill(#"game_ended");
	self notify(#"game_ended");
}

/*
	Name: endselectiononhostmigration
	Namespace: airsupport
	Checksum: 0xB181B899
	Offset: 0x558
	Size: 0x7E
	Parameters: 0
	Flags: Linked
*/
function endselectiononhostmigration()
{
	self endon(#"death", #"disconnect", #"cancel_location", #"used", #"game_ended");
	level waittill(#"host_migration_begin");
	self notify(#"cancel_location");
}

/*
	Name: endselectionthink
	Namespace: airsupport
	Checksum: 0x22946DEA
	Offset: 0x5E0
	Size: 0x1F6
	Parameters: 0
	Flags: Linked
*/
function endselectionthink()
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isalive(self));
	#/
	/#
		assert(isdefined(self.selectinglocation));
	#/
	/#
		assert(self.selectinglocation == 1);
	#/
	self thread endselectionongameend();
	self thread endselectiononhostmigration();
	event = undefined;
	event = self waittill(#"delete", #"death", #"disconnect", #"cancel_location", #"game_ended", #"used", #"weapon_change", #"emp_jammed");
	if(event._notify != "disconnect")
	{
		self.selectinglocation = undefined;
		if(event._notify === "weapon_change")
		{
			self endlocationselection();
		}
		else
		{
			self thread clearuplocationselection();
		}
	}
	if(event._notify != "used")
	{
		self notify(#"confirm_location");
	}
}

/*
	Name: clearuplocationselection
	Namespace: airsupport
	Checksum: 0xFA3824FC
	Offset: 0x7E0
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function clearuplocationselection()
{
	event = undefined;
	event = self waittill(#"delete", #"death", #"disconnect", #"game_ended", #"used", #"weapon_change", #"emp_jammed", #"weapon_change_complete");
	if(event._notify != "disconnect" && isdefined(self))
	{
		self endlocationselection();
	}
}

/*
	Name: stoploopsoundaftertime
	Namespace: airsupport
	Checksum: 0x1AE0F65B
	Offset: 0x8C0
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function stoploopsoundaftertime(time)
{
	self endon(#"death");
	wait(time);
	self stoploopsound(2);
}

/*
	Name: calculatefalltime
	Namespace: airsupport
	Checksum: 0xAED93A1
	Offset: 0x908
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function calculatefalltime(flyheight)
{
	gravity = getdvarint(#"bg_gravity", 0);
	time = sqrt((2 * flyheight) / gravity);
	return time;
}

/*
	Name: calculatereleasetime
	Namespace: airsupport
	Checksum: 0xD407CD50
	Offset: 0x980
	Size: 0xC8
	Parameters: 5
	Flags: Linked
*/
function calculatereleasetime(flytime, flyheight, flyspeed, bombspeedscale, var_60b3d9e1)
{
	if(!isdefined(var_60b3d9e1))
	{
		var_60b3d9e1 = 0.5;
	}
	falltime = calculatefalltime(flyheight);
	bomb_x = (flyspeed * bombspeedscale) * falltime;
	release_time = bomb_x / flyspeed;
	/#
		assert(var_60b3d9e1 >= 0 && var_60b3d9e1 <= 1, "");
	#/
	return (flytime * var_60b3d9e1) - release_time;
}

/*
	Name: callstrike
	Namespace: airsupport
	Checksum: 0x994D3B88
	Offset: 0xA50
	Size: 0x354
	Parameters: 1
	Flags: None
*/
function callstrike(flightplan)
{
	level.bomberdamagedents = [];
	level.bomberdamagedentscount = 0;
	level.bomberdamagedentsindex = 0;
	/#
		assert(flightplan.distance != 0, "");
	#/
	planehalfdistance = flightplan.distance / 2;
	path = getstrikepath(flightplan.target, flightplan.height, planehalfdistance);
	startpoint = path[#"start"];
	endpoint = path[#"end"];
	flightplan.height = path[#"height"];
	direction = path[#"direction"];
	d = length(startpoint - endpoint);
	flytime = d / flightplan.speed;
	bombtime = calculatereleasetime(flytime, flightplan.height, flightplan.speed, flightplan.bombspeedscale);
	if(bombtime < 0)
	{
		bombtime = 0;
	}
	/#
		assert(flytime > bombtime);
	#/
	flightplan.owner endon(#"disconnect");
	requireddeathcount = flightplan.owner.deathcount;
	side = vectorcross(anglestoforward(direction), (0, 0, 1));
	plane_seperation = 25;
	side_offset = vectorscale(side, plane_seperation);
	level thread planestrike(flightplan.owner, requireddeathcount, startpoint, endpoint, bombtime, flytime, flightplan.speed, flightplan.bombspeedscale, direction, flightplan.planespawncallback);
	wait(flightplan.planespacing);
	level thread planestrike(flightplan.owner, requireddeathcount, startpoint + side_offset, endpoint + side_offset, bombtime, flytime, flightplan.speed, flightplan.bombspeedscale, direction, flightplan.planespawncallback);
	wait(flightplan.planespacing);
	side_offset = vectorscale(side, -1 * plane_seperation);
	level thread planestrike(flightplan.owner, requireddeathcount, startpoint + side_offset, endpoint + side_offset, bombtime, flytime, flightplan.speed, flightplan.bombspeedscale, direction, flightplan.planespawncallback);
}

/*
	Name: planestrike
	Namespace: airsupport
	Checksum: 0x5ADF0F5F
	Offset: 0xDB0
	Size: 0x154
	Parameters: 10
	Flags: Linked
*/
function planestrike(owner, requireddeathcount, pathstart, pathend, bombtime, flytime, flyspeed, bombspeedscale, direction, planespawnedfunction)
{
	if(!isdefined(owner))
	{
		return;
	}
	plane = spawn("script_model", pathstart);
	plane.angles = direction;
	plane.team = owner.team;
	plane setowner(owner);
	plane moveto(pathend, flytime, 0, 0);
	/#
		thread debug_plane_line(flytime, flyspeed, pathstart, pathend);
	#/
	if(isdefined(planespawnedfunction))
	{
		plane [[planespawnedfunction]](owner, requireddeathcount, pathstart, pathend, bombtime, bombspeedscale, flytime, flyspeed);
	}
	wait(flytime);
	plane notify(#"delete");
	plane delete();
}

/*
	Name: determinegroundpoint
	Namespace: airsupport
	Checksum: 0x5AFDB918
	Offset: 0xF10
	Size: 0x86
	Parameters: 2
	Flags: Linked
*/
function determinegroundpoint(player, position)
{
	ground = (position[0], position[1], player.origin[2]);
	trace = bullettrace(ground + vectorscale((0, 0, 1), 10000), ground, 0, undefined);
	return trace[#"position"];
}

/*
	Name: determinetargetpoint
	Namespace: airsupport
	Checksum: 0x2438A828
	Offset: 0xFA0
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function determinetargetpoint(player, position)
{
	point = determinegroundpoint(player, position);
	return clamptarget(point);
}

/*
	Name: getmintargetheight
	Namespace: airsupport
	Checksum: 0xC96A9B09
	Offset: 0xFF8
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function getmintargetheight()
{
	return level.spawnmins[2] - 500;
}

/*
	Name: getmaxtargetheight
	Namespace: airsupport
	Checksum: 0x596DBEF7
	Offset: 0x1020
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function getmaxtargetheight()
{
	return level.spawnmaxs[2] + 500;
}

/*
	Name: clamptarget
	Namespace: airsupport
	Checksum: 0x3180791F
	Offset: 0x1048
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function clamptarget(target)
{
	min = getmintargetheight();
	max = getmaxtargetheight();
	if(target[2] < min)
	{
		target[2] = min;
	}
	if(target[2] > max)
	{
		target[2] = max;
	}
	return target;
}

/*
	Name: _insidecylinder
	Namespace: airsupport
	Checksum: 0x797ED2AC
	Offset: 0x10D8
	Size: 0x7E
	Parameters: 4
	Flags: Linked
*/
function _insidecylinder(point, base, radius, height)
{
	if(isdefined(height))
	{
		if(point[2] > base[2] + height)
		{
			return false;
		}
	}
	dist = distance2d(point, base);
	if(dist < radius)
	{
		return true;
	}
	return false;
}

/*
	Name: _insidenoflyzonebyindex
	Namespace: airsupport
	Checksum: 0xF018EAC7
	Offset: 0x1160
	Size: 0x8A
	Parameters: 3
	Flags: Linked
*/
function _insidenoflyzonebyindex(point, index, disregardheight)
{
	height = level.noflyzones[index].height;
	if(isdefined(disregardheight))
	{
		height = undefined;
	}
	return _insidecylinder(point, level.noflyzones[index].origin, level.noflyzones[index].radius, height);
}

/*
	Name: getnoflyzoneheight
	Namespace: airsupport
	Checksum: 0xD887CD07
	Offset: 0x11F8
	Size: 0xDE
	Parameters: 1
	Flags: Linked
*/
function getnoflyzoneheight(point)
{
	height = point[2];
	origin = undefined;
	for(i = 0; i < level.noflyzones.size; i++)
	{
		if(_insidenoflyzonebyindex(point, i))
		{
			if(height < level.noflyzones[i].height)
			{
				height = level.noflyzones[i].height;
				origin = level.noflyzones[i].origin;
			}
		}
	}
	if(!isdefined(origin))
	{
		return point[2];
	}
	return origin[2] + height;
}

/*
	Name: insidenoflyzones
	Namespace: airsupport
	Checksum: 0x932DF8EB
	Offset: 0x12E0
	Size: 0x76
	Parameters: 2
	Flags: Linked
*/
function insidenoflyzones(point, disregardheight)
{
	noflyzones = [];
	for(i = 0; i < level.noflyzones.size; i++)
	{
		if(_insidenoflyzonebyindex(point, i, disregardheight))
		{
			noflyzones[noflyzones.size] = i;
		}
	}
	return noflyzones;
}

/*
	Name: crossesnoflyzone
	Namespace: airsupport
	Checksum: 0xBBD5648D
	Offset: 0x1360
	Size: 0x12A
	Parameters: 2
	Flags: Linked
*/
function crossesnoflyzone(start, end)
{
	for(i = 0; i < level.noflyzones.size; i++)
	{
		point = math::closest_point_on_line(level.noflyzones[i].origin + (0, 0, 0.5 * level.noflyzones[i].height), start, end);
		dist = distance2d(point, level.noflyzones[i].origin);
		if(point[2] > level.noflyzones[i].origin[2] + level.noflyzones[i].height)
		{
			continue;
		}
		if(dist < level.noflyzones[i].radius)
		{
			return i;
		}
	}
	return undefined;
}

/*
	Name: crossesnoflyzones
	Namespace: airsupport
	Checksum: 0x4C10B65C
	Offset: 0x1498
	Size: 0x11A
	Parameters: 2
	Flags: Linked
*/
function crossesnoflyzones(start, end)
{
	zones = [];
	for(i = 0; i < level.noflyzones.size; i++)
	{
		point = math::closest_point_on_line(level.noflyzones[i].origin, start, end);
		dist = distance2d(point, level.noflyzones[i].origin);
		if(point[2] > level.noflyzones[i].origin[2] + level.noflyzones[i].height)
		{
			continue;
		}
		if(dist < level.noflyzones[i].radius)
		{
			zones[zones.size] = i;
		}
	}
	return zones;
}

/*
	Name: getnoflyzoneheightcrossed
	Namespace: airsupport
	Checksum: 0x63FF8D23
	Offset: 0x15C0
	Size: 0x102
	Parameters: 3
	Flags: Linked
*/
function getnoflyzoneheightcrossed(start, end, minheight)
{
	height = minheight;
	for(i = 0; i < level.noflyzones.size; i++)
	{
		point = math::closest_point_on_line(level.noflyzones[i].origin, start, end);
		dist = distance2d(point, level.noflyzones[i].origin);
		if(dist < level.noflyzones[i].radius)
		{
			if(height < level.noflyzones[i].height)
			{
				height = level.noflyzones[i].height;
			}
		}
	}
	return height;
}

/*
	Name: _shouldignorenoflyzone
	Namespace: airsupport
	Checksum: 0xD738992B
	Offset: 0x16D0
	Size: 0x68
	Parameters: 2
	Flags: Linked
*/
function _shouldignorenoflyzone(noflyzone, noflyzones)
{
	if(!isdefined(noflyzone))
	{
		return true;
	}
	for(i = 0; i < noflyzones.size; i++)
	{
		if(isdefined(noflyzones[i]) && noflyzones[i] == noflyzone)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: _shouldignorestartgoalnoflyzone
	Namespace: airsupport
	Checksum: 0x3FB5893F
	Offset: 0x1740
	Size: 0x6E
	Parameters: 3
	Flags: Linked
*/
function _shouldignorestartgoalnoflyzone(noflyzone, startnoflyzones, goalnoflyzones)
{
	if(!isdefined(noflyzone))
	{
		return true;
	}
	if(_shouldignorenoflyzone(noflyzone, startnoflyzones))
	{
		return true;
	}
	if(_shouldignorenoflyzone(noflyzone, goalnoflyzones))
	{
		return true;
	}
	return false;
}

/*
	Name: gethelipath
	Namespace: airsupport
	Checksum: 0x58ACBEFC
	Offset: 0x17B8
	Size: 0x100
	Parameters: 2
	Flags: Linked
*/
function gethelipath(start, goal)
{
	startnoflyzones = insidenoflyzones(start, 1);
	/#
		thread debug_line(start, goal, (1, 1, 1));
	#/
	goalnoflyzones = insidenoflyzones(goal);
	if(goalnoflyzones.size)
	{
		goal = (goal[0], goal[1], getnoflyzoneheight(goal));
	}
	goal_points = calculatepath(start, goal, startnoflyzones, goalnoflyzones);
	if(!isdefined(goal_points))
	{
		return undefined;
	}
	/#
		assert(goal_points.size >= 1);
	#/
	return goal_points;
}

/*
	Name: function_a43d04ef
	Namespace: airsupport
	Checksum: 0x52A7E032
	Offset: 0x18C0
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_a43d04ef(goalorigin)
{
	self endon(#"death", #"hash_41aaa8d75d168e0a");
	var_9fbf3012 = 40000;
	wait(20);
	while(true)
	{
		distsq = distancesquared(self.origin, goalorigin);
		if(distsq <= var_9fbf3012)
		{
			self notify(#"fallback_goal");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_fabf8bc5
	Namespace: airsupport
	Checksum: 0x827EBA04
	Offset: 0x1970
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_fabf8bc5(goalorigin)
{
	self endon(#"death", #"hash_41aaa8d75d168e0a");
	var_9fbf3012 = 10000;
	if(isdefined(self.var_f766e12d))
	{
		var_9fbf3012 = sqr(self.var_f766e12d);
	}
	while(true)
	{
		distsq = distancesquared(self.origin, goalorigin);
		if(distsq <= var_9fbf3012)
		{
			self notify(#"fallback_goal");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_e0e908c3
	Namespace: airsupport
	Checksum: 0x47372A38
	Offset: 0x1A40
	Size: 0x194
	Parameters: 3
	Flags: Linked
*/
function function_e0e908c3(var_dbd23dc, path, stopatgoal)
{
	self endon(#"death", #"hash_78e76e8d9370e349");
	if(var_dbd23dc)
	{
		while(true)
		{
			var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
			if(var_baa92af9)
			{
				self util::make_sentient();
				break;
			}
			waitframe(1);
		}
		self setgoal(path[0], 1, stopatgoal);
		self function_a57c34b7(path[0], stopatgoal, 1);
	}
	else if(issentient(self))
	{
		while(true)
		{
			var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
			if(!var_baa92af9)
			{
				if(issentient(self))
				{
					self function_60d50ea4();
				}
				break;
			}
			waitframe(1);
		}
		self function_a57c34b7(path[0], stopatgoal, 0);
	}
}

/*
	Name: function_f1b7b432
	Namespace: airsupport
	Checksum: 0xCD263860
	Offset: 0x1BE0
	Size: 0x2CE
	Parameters: 5
	Flags: None
*/
function function_f1b7b432(path, donenotify, stopatgoal, var_135dc5d1, var_96e5d7f)
{
	if(!isdefined(var_96e5d7f))
	{
		var_96e5d7f = 0;
	}
	self endon(#"death");
	var_dbd23dc = 0;
	if(!ispointinnavvolume(path[0], "navvolume_big"))
	{
		if(issentient(self))
		{
			self function_60d50ea4();
		}
		self function_a57c34b7(path[0], stopatgoal, 0);
	}
	else
	{
		if(!ispointinnavvolume(self.origin, "navvolume_big"))
		{
			if(issentient(self))
			{
				self function_60d50ea4();
			}
			self function_a57c34b7(path[0], stopatgoal, 0);
			var_dbd23dc = 1;
		}
		else
		{
			self setgoal(path[0], 1, stopatgoal);
			self function_a57c34b7(path[0], stopatgoal, 1);
		}
	}
	if(is_true(var_135dc5d1))
	{
		self thread function_fabf8bc5(path[0]);
	}
	if(is_true(var_96e5d7f))
	{
		self thread function_a43d04ef(path[0]);
	}
	self thread function_e0e908c3(var_dbd23dc, path, stopatgoal);
	/#
		thread debug_line(self.origin, path[0], (1, 1, 0));
	#/
	if(stopatgoal)
	{
		self waittill(#"goal", #"fallback_goal");
	}
	else
	{
		self waittill(#"near_goal", #"fallback_goal");
	}
	if(isdefined(donenotify))
	{
		self notify(donenotify);
	}
	self notify(#"hash_41aaa8d75d168e0a");
	self notify(#"hash_78e76e8d9370e349");
}

/*
	Name: followpath
	Namespace: airsupport
	Checksum: 0xFE651B69
	Offset: 0x1EB8
	Size: 0x14A
	Parameters: 3
	Flags: Linked
*/
function followpath(path, donenotify, stopatgoal)
{
	self endon(#"death");
	for(i = 0; i < path.size - 1; i++)
	{
		self setgoal(path[i], 0);
		/#
			thread debug_line(self.origin, path[i], (1, 1, 0));
		#/
		self waittill(#"near_goal");
	}
	self setgoal(path[path.size - 1], stopatgoal);
	/#
		thread debug_line(self.origin, path[i], (1, 1, 0));
	#/
	if(stopatgoal)
	{
		self waittill(#"goal");
	}
	else
	{
		self waittill(#"near_goal");
	}
	if(isdefined(donenotify))
	{
		self notify(donenotify);
	}
}

/*
	Name: setgoalposition
	Namespace: airsupport
	Checksum: 0x6C45AB7E
	Offset: 0x2010
	Size: 0x94
	Parameters: 3
	Flags: None
*/
function setgoalposition(goal, donenotify, stopatgoal)
{
	if(!isdefined(stopatgoal))
	{
		stopatgoal = 1;
	}
	start = self.origin;
	goal_points = gethelipath(start, goal);
	if(!isdefined(goal_points))
	{
		goal_points = [];
		goal_points[0] = goal;
	}
	followpath(goal_points, donenotify, stopatgoal);
}

/*
	Name: clearpath
	Namespace: airsupport
	Checksum: 0x9729BDB
	Offset: 0x20B0
	Size: 0x8E
	Parameters: 4
	Flags: None
*/
function clearpath(start, end, startnoflyzone, goalnoflyzone)
{
	noflyzones = crossesnoflyzones(start, end);
	for(i = 0; i < noflyzones.size; i++)
	{
		if(!_shouldignorestartgoalnoflyzone(noflyzones[i], startnoflyzone, goalnoflyzone))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: append_array
	Namespace: airsupport
	Checksum: 0xC876244F
	Offset: 0x2148
	Size: 0x46
	Parameters: 2
	Flags: None
*/
function append_array(dst, src)
{
	for(i = 0; i < src.size; i++)
	{
		dst[dst.size] = src[i];
	}
}

/*
	Name: calculatepath_r
	Namespace: airsupport
	Checksum: 0x9155348
	Offset: 0x2198
	Size: 0xDA
	Parameters: 6
	Flags: Linked
*/
function calculatepath_r(start, end, points, startnoflyzones, goalnoflyzones, depth)
{
	depth--;
	if(depth <= 0)
	{
		points[points.size] = end;
		return points;
	}
	noflyzones = crossesnoflyzones(start, end);
	for(i = 0; i < noflyzones.size; i++)
	{
		noflyzone = noflyzones[i];
		if(!_shouldignorestartgoalnoflyzone(noflyzone, startnoflyzones, goalnoflyzones))
		{
			return undefined;
		}
	}
	points[points.size] = end;
	return points;
}

/*
	Name: calculatepath
	Namespace: airsupport
	Checksum: 0x9D48E143
	Offset: 0x2280
	Size: 0x14A
	Parameters: 4
	Flags: Linked
*/
function calculatepath(start, end, startnoflyzones, goalnoflyzones)
{
	points = [];
	points = calculatepath_r(start, end, points, startnoflyzones, goalnoflyzones, 3);
	if(!isdefined(points))
	{
		return undefined;
	}
	/#
		assert(points.size >= 1);
	#/
	/#
		debug_sphere(points[points.size - 1], 10, (1, 0, 0), 1, 1000);
	#/
	point = start;
	for(i = 0; i < points.size; i++)
	{
		/#
			thread debug_line(point, points[i], (0, 1, 0));
			debug_sphere(points[i], 10, (0, 0, 1), 1, 1000);
		#/
		point = points[i];
	}
	return points;
}

/*
	Name: _getstrikepathstartandend
	Namespace: airsupport
	Checksum: 0x507A6D17
	Offset: 0x23D8
	Size: 0x19C
	Parameters: 3
	Flags: Linked
*/
function _getstrikepathstartandend(goal, yaw, halfdistance)
{
	direction = (0, yaw, 0);
	startpoint = goal + (vectorscale(anglestoforward(direction), -1 * halfdistance));
	endpoint = goal + vectorscale(anglestoforward(direction), halfdistance);
	noflyzone = crossesnoflyzone(startpoint, endpoint);
	path = [];
	if(isdefined(noflyzone))
	{
		path[#"noflyzone"] = noflyzone;
		startpoint = (startpoint[0], startpoint[1], level.noflyzones[noflyzone].origin[2] + level.noflyzones[noflyzone].height);
		endpoint = (endpoint[0], endpoint[1], startpoint[2]);
	}
	else
	{
		path[#"noflyzone"] = undefined;
	}
	path[#"start"] = startpoint;
	path[#"end"] = endpoint;
	path[#"direction"] = direction;
	return path;
}

/*
	Name: getstrikepath
	Namespace: airsupport
	Checksum: 0x4F19A5F2
	Offset: 0x2580
	Size: 0x164
	Parameters: 4
	Flags: Linked
*/
function getstrikepath(target, height, halfdistance, yaw)
{
	noflyzoneheight = getnoflyzoneheight(target);
	worldheight = target[2] + height;
	if(noflyzoneheight > worldheight)
	{
		worldheight = noflyzoneheight;
	}
	goal = (target[0], target[1], worldheight);
	path = [];
	if(!isdefined(yaw) || yaw != "random")
	{
		for(i = 0; i < 3; i++)
		{
			path = _getstrikepathstartandend(goal, randomint(360), halfdistance);
			if(!isdefined(path[#"noflyzone"]))
			{
				break;
			}
		}
	}
	else
	{
		path = _getstrikepathstartandend(goal, yaw, halfdistance);
	}
	path[#"height"] = worldheight - target[2];
	return path;
}

/*
	Name: doglassdamage
	Namespace: airsupport
	Checksum: 0x2BB8836E
	Offset: 0x26F0
	Size: 0x6C
	Parameters: 5
	Flags: None
*/
function doglassdamage(pos, radius, max, min, mod)
{
	wait(randomfloatrange(0.05, 0.15));
	glassradiusdamage(pos, radius, max, min, mod);
}

/*
	Name: entlosradiusdamage
	Namespace: airsupport
	Checksum: 0x1E861DA4
	Offset: 0x2768
	Size: 0x3BA
	Parameters: 7
	Flags: None
*/
function entlosradiusdamage(ent, pos, radius, max, min, owner, einflictor)
{
	dist = distance(pos, ent.damagecenter);
	if(ent.isplayer || ent.isactor)
	{
		assumed_ceiling_height = 800;
		eye_position = ent.entity geteye();
		head_height = eye_position[2];
		debug_display_time = 4000;
		trace = weapons::damage_trace(ent.entity.origin, ent.entity.origin + (0, 0, assumed_ceiling_height), 0, undefined);
		indoors = trace[#"fraction"] != 1;
		if(indoors)
		{
			test_point = trace[#"position"];
			/#
				debug_star(test_point, (0, 1, 0), debug_display_time);
			#/
			trace = weapons::damage_trace((test_point[0], test_point[1], head_height), (pos[0], pos[1], head_height), 0, undefined);
			indoors = trace[#"fraction"] != 1;
			if(indoors)
			{
				/#
					debug_star((pos[0], pos[1], head_height), (0, 1, 0), debug_display_time);
				#/
				dist = dist * 4;
				if(dist > radius)
				{
					return false;
				}
			}
			else
			{
				/#
					debug_star((pos[0], pos[1], head_height), (1, 0, 0), debug_display_time);
				#/
				trace = weapons::damage_trace((pos[0], pos[1], head_height), pos, 0, undefined);
				indoors = trace[#"fraction"] != 1;
				if(indoors)
				{
					/#
						debug_star(pos, (0, 1, 0), debug_display_time);
					#/
					dist = dist * 4;
					if(dist > radius)
					{
						return false;
					}
				}
				else
				{
					/#
						debug_star(pos, (1, 0, 0), debug_display_time);
					#/
				}
			}
		}
		else
		{
			/#
				debug_star(ent.entity.origin + (0, 0, assumed_ceiling_height), (1, 0, 0), debug_display_time);
			#/
		}
	}
	ent.damage = int(max + (((min - max) * dist) / radius));
	ent.pos = pos;
	ent.damageowner = owner;
	ent.einflictor = einflictor;
	return true;
}

/*
	Name: getrandommappoint
	Namespace: airsupport
	Checksum: 0xA6CBD368
	Offset: 0x2B30
	Size: 0x1D0
	Parameters: 4
	Flags: None
*/
function getrandommappoint(x_offset, y_offset, map_x_percentage, map_y_percentage)
{
	minimaporigins = getentarray("minimap_corner", "targetname");
	if(minimaporigins.size)
	{
		rand_x = 0;
		rand_y = 0;
		if(minimaporigins[0].origin[0] < minimaporigins[1].origin[0])
		{
			rand_x = randomfloatrange(minimaporigins[0].origin[0] * map_x_percentage, minimaporigins[1].origin[0] * map_x_percentage);
			rand_y = randomfloatrange(minimaporigins[0].origin[1] * map_y_percentage, minimaporigins[1].origin[1] * map_y_percentage);
		}
		else
		{
			rand_x = randomfloatrange(minimaporigins[1].origin[0] * map_x_percentage, minimaporigins[0].origin[0] * map_x_percentage);
			rand_y = randomfloatrange(minimaporigins[1].origin[1] * map_y_percentage, minimaporigins[0].origin[1] * map_y_percentage);
		}
		return (x_offset + rand_x, y_offset + rand_y, 0);
	}
	return (x_offset, y_offset, 0);
}

/*
	Name: getmaxmapwidth
	Namespace: airsupport
	Checksum: 0xA81A6DDF
	Offset: 0x2D08
	Size: 0xDE
	Parameters: 0
	Flags: None
*/
function getmaxmapwidth()
{
	minimaporigins = getentarray("minimap_corner", "targetname");
	if(minimaporigins.size)
	{
		x = abs(minimaporigins[0].origin[0] - minimaporigins[1].origin[0]);
		y = abs(minimaporigins[0].origin[1] - minimaporigins[1].origin[1]);
		return max(x, y);
	}
	return 0;
}

/*
	Name: stoprotation
	Namespace: airsupport
	Checksum: 0xA28AC852
	Offset: 0x2DF0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function stoprotation(time)
{
	self endon(#"death");
	wait(time);
	self stoploopsound();
}

/*
	Name: flattenyaw
	Namespace: airsupport
	Checksum: 0xAC342E85
	Offset: 0x2E38
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function flattenyaw(goal)
{
	self endon(#"death");
	increment = 3;
	if(self.angles[1] > goal)
	{
		increment = increment * -1;
	}
	while(abs(self.angles[1] - goal) > 3)
	{
		self.angles = (self.angles[0], self.angles[1] + increment, self.angles[2]);
		waitframe(1);
	}
}

/*
	Name: flattenroll
	Namespace: airsupport
	Checksum: 0xAEAC01B4
	Offset: 0x2EF8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function flattenroll()
{
	self endon(#"death");
	while(self.angles[2] < 0)
	{
		self.angles = (self.angles[0], self.angles[1], self.angles[2] + 2.5);
		waitframe(1);
	}
}

/*
	Name: leave
	Namespace: airsupport
	Checksum: 0x2D989A08
	Offset: 0x2F70
	Size: 0x286
	Parameters: 2
	Flags: None
*/
function leave(duration, var_384be02f)
{
	if(!isdefined(var_384be02f))
	{
		var_384be02f = 0;
	}
	self unlink();
	self thread stoprotation(1);
	tries = 10;
	yaw = 0;
	while(tries > 0)
	{
		exitvector = (anglestoforward(self.angles + (0, yaw, 0))) * 20000;
		exitpoint = (self.origin[0] + exitvector[0], self.origin[1] + exitvector[1], self.origin[2] + var_384be02f);
		nfz = crossesnoflyzone(self.origin, exitpoint);
		if(isdefined(nfz))
		{
			if(tries != 1)
			{
				if((tries % 2) == 1)
				{
					yaw = yaw * -1;
				}
				else
				{
					yaw = yaw + 10;
					yaw = yaw * -1;
				}
			}
			tries--;
		}
		else
		{
			tries = 0;
		}
	}
	self thread flattenyaw(self.angles[1] + yaw);
	if(self.angles[2] != 0)
	{
		self thread flattenroll();
	}
	if(isvehicle(self))
	{
		self setspeed((length(exitvector) / duration) / 17.6, 60);
		self setgoal(exitpoint, 0, 0);
	}
	else
	{
		self moveto(exitpoint, duration, 0, 0);
	}
	self notify(#"leaving");
}

/*
	Name: getrandomhelicopterstartorigin
	Namespace: airsupport
	Checksum: 0x9786162F
	Offset: 0x3200
	Size: 0x1CC
	Parameters: 0
	Flags: None
*/
function getrandomhelicopterstartorigin()
{
	dist = -1 * getdvarint(#"scr_supplydropincomingdistance", 10000);
	pathrandomness = 100;
	direction = (0, randomintrange(-2, 3), 0);
	start_origin = anglestoforward(direction) * dist;
	start_origin = start_origin + ((randomfloat(2) - 1) * pathrandomness, (randomfloat(2) - 1) * pathrandomness, 0);
	/#
		if(getdvarint(#"scr_noflyzones_debug", 0))
		{
			if(level.noflyzones.size)
			{
				index = randomintrange(0, level.noflyzones.size);
				delta = level.noflyzones[index].origin;
				delta = (delta[0] + randomint(10), delta[1] + randomint(10), 0);
				delta = vectornormalize(delta);
				start_origin = delta * dist;
			}
		}
	#/
	return start_origin;
}

/*
	Name: debug_no_fly_zones
	Namespace: airsupport
	Checksum: 0x49C203B
	Offset: 0x33D8
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function debug_no_fly_zones()
{
	/#
		for(i = 0; i < level.noflyzones.size; i++)
		{
			debug_airsupport_cylinder(level.noflyzones[i].origin, level.noflyzones[i].radius, level.noflyzones[i].height, (1, 1, 1), undefined, 5000);
		}
	#/
}

/*
	Name: debug_plane_line
	Namespace: airsupport
	Checksum: 0x77FE10B9
	Offset: 0x3470
	Size: 0xB4
	Parameters: 4
	Flags: None
*/
function debug_plane_line(flytime, flyspeed, pathstart, pathend)
{
	/#
		/#
			thread debug_line(pathstart, pathend, (1, 1, 1));
		#/
		delta = vectornormalize(pathend - pathstart);
		/#
			for(i = 0; i < flytime; i++)
			{
				thread debug_star(pathstart + (vectorscale(delta, i * flyspeed)), (1, 0, 0));
			}
		#/
	#/
}

/*
	Name: debug_draw_bomb_explosion
	Namespace: airsupport
	Checksum: 0x15FB7E8
	Offset: 0x3530
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function debug_draw_bomb_explosion(prevpos)
{
	/#
		self notify(#"draw_explosion");
		waitframe(1);
		self endon(#"draw_explosion");
		waitresult = undefined;
		waitresult = self waittill(#"projectile_impact");
		/#
			thread debug_line(prevpos, waitresult.position, (0.5, 1, 0));
			thread debug_star(waitresult.position, (1, 0, 0));
		#/
	#/
}

/*
	Name: debug_draw_bomb_path
	Namespace: airsupport
	Checksum: 0xD8F8E309
	Offset: 0x35F0
	Size: 0x128
	Parameters: 3
	Flags: None
*/
function debug_draw_bomb_path(projectile, color, time)
{
	/#
		self endon(#"death");
		level.airsupport_debug = getdvarint(#"scr_airsupport_debug", 0);
		if(!isdefined(color))
		{
			color = (0.5, 1, 0);
		}
		if(isdefined(level.airsupport_debug) && level.airsupport_debug == 1)
		{
			prevpos = self.origin;
			while(isdefined(self.origin))
			{
				/#
					thread debug_line(prevpos, self.origin, color, time);
				#/
				prevpos = self.origin;
				if(isdefined(projectile) && projectile)
				{
					thread debug_draw_bomb_explosion(prevpos);
				}
				wait(0.2);
			}
		}
	#/
}

/*
	Name: debug_print3d_simple
	Namespace: airsupport
	Checksum: 0xECA9157C
	Offset: 0x3720
	Size: 0xE4
	Parameters: 4
	Flags: None
*/
function debug_print3d_simple(message, ent, offset, frames)
{
	/#
		level.airsupport_debug = getdvarint(#"scr_airsupport_debug", 0);
		if(isdefined(level.airsupport_debug) && level.airsupport_debug == 1)
		{
			if(isdefined(frames))
			{
				thread draw_text(message, vectorscale((1, 1, 1), 0.8), ent, offset, frames);
			}
			else
			{
				thread draw_text(message, vectorscale((1, 1, 1), 0.8), ent, offset, 0);
			}
		}
	#/
}

/*
	Name: draw_text
	Namespace: airsupport
	Checksum: 0xEBDADE7F
	Offset: 0x3810
	Size: 0xF2
	Parameters: 5
	Flags: None
*/
function draw_text(msg, color, ent, offset, frames)
{
	/#
		if(frames == 0)
		{
			while(isdefined(ent) && isdefined(ent.origin))
			{
				print3d(ent.origin + offset, msg, color, 0.5, 4);
				waitframe(1);
			}
		}
		else
		{
			for(i = 0; i < frames; i++)
			{
				if(!isdefined(ent))
				{
					break;
				}
				print3d(ent.origin + offset, msg, color, 0.5, 4);
				waitframe(1);
			}
		}
	#/
}

/*
	Name: debug_print3d
	Namespace: airsupport
	Checksum: 0x9831D7DE
	Offset: 0x3910
	Size: 0xA4
	Parameters: 5
	Flags: None
*/
function debug_print3d(message, color, ent, origin_offset, frames)
{
	/#
		level.airsupport_debug = getdvarint(#"scr_airsupport_debug", 0);
		if(isdefined(level.airsupport_debug) && level.airsupport_debug == 1)
		{
			self thread draw_text(message, color, ent, origin_offset, frames);
		}
	#/
}

/*
	Name: debug_line
	Namespace: airsupport
	Checksum: 0xF53B769A
	Offset: 0x39C0
	Size: 0xEC
	Parameters: 5
	Flags: None
*/
function debug_line(from, to, color, time, depthtest)
{
	/#
		level.airsupport_debug = getdvarint(#"scr_airsupport_debug", 0);
		if(isdefined(level.airsupport_debug) && level.airsupport_debug == 1)
		{
			if(distancesquared(from, to) < 0.01)
			{
				return;
			}
			if(!isdefined(time))
			{
				time = 1000;
			}
			if(!isdefined(depthtest))
			{
				depthtest = 1;
			}
			line(from, to, color, 1, depthtest, time);
		}
	#/
}

/*
	Name: debug_star
	Namespace: airsupport
	Checksum: 0x1EFC178C
	Offset: 0x3AB8
	Size: 0xAC
	Parameters: 3
	Flags: None
*/
function debug_star(origin, color, time)
{
	/#
		level.airsupport_debug = getdvarint(#"scr_airsupport_debug", 0);
		if(isdefined(level.airsupport_debug) && level.airsupport_debug == 1)
		{
			if(!isdefined(time))
			{
				time = 1000;
			}
			if(!isdefined(color))
			{
				color = (1, 1, 1);
			}
			debugstar(origin, time, color);
		}
	#/
}

/*
	Name: debug_circle
	Namespace: airsupport
	Checksum: 0xAD18601D
	Offset: 0x3B70
	Size: 0xBC
	Parameters: 4
	Flags: None
*/
function debug_circle(origin, radius, color, time)
{
	/#
		level.airsupport_debug = getdvarint(#"scr_airsupport_debug", 0);
		if(isdefined(level.airsupport_debug) && level.airsupport_debug == 1)
		{
			if(!isdefined(time))
			{
				time = 1000;
			}
			if(!isdefined(color))
			{
				color = (1, 1, 1);
			}
			circle(origin, radius, color, 1, 1, time);
		}
	#/
}

/*
	Name: debug_sphere
	Namespace: airsupport
	Checksum: 0xCB5077A
	Offset: 0x3C38
	Size: 0x104
	Parameters: 5
	Flags: None
*/
function debug_sphere(origin, radius, color, alpha, time)
{
	/#
		level.airsupport_debug = getdvarint(#"scr_airsupport_debug", 0);
		if(isdefined(level.airsupport_debug) && level.airsupport_debug == 1)
		{
			if(!isdefined(time))
			{
				time = 1000;
			}
			if(!isdefined(color))
			{
				color = (1, 1, 1);
			}
			sides = int(10 * (1 + (int(radius / 100))));
			sphere(origin, radius, color, alpha, 1, sides, time);
		}
	#/
}

/*
	Name: debug_airsupport_cylinder
	Namespace: airsupport
	Checksum: 0x8B727EE
	Offset: 0x3D48
	Size: 0xAC
	Parameters: 6
	Flags: None
*/
function debug_airsupport_cylinder(origin, radius, height, color, mustrenderheight, time)
{
	/#
		level.airsupport_debug = getdvarint(#"scr_airsupport_debug", 0);
		if(isdefined(level.airsupport_debug) && level.airsupport_debug == 1)
		{
			debug_cylinder(origin, radius, height, color, mustrenderheight, time);
		}
	#/
}

/*
	Name: debug_cylinder
	Namespace: airsupport
	Checksum: 0x2D862502
	Offset: 0x3E00
	Size: 0x11C
	Parameters: 6
	Flags: None
*/
function debug_cylinder(origin, radius, height, color, mustrenderheight, time)
{
	/#
		subdivision = 600;
		if(!isdefined(time))
		{
			time = 1000;
		}
		if(!isdefined(color))
		{
			color = (1, 1, 1);
		}
		count = height / subdivision;
		for(i = 0; i < count; i++)
		{
			point = origin + (0, 0, i * subdivision);
			circle(point, radius, color, 1, 1, time);
		}
		if(isdefined(mustrenderheight))
		{
			point = origin + (0, 0, mustrenderheight);
			circle(point, radius, color, 1, 1, time);
		}
	#/
}

/*
	Name: getpointonline
	Namespace: airsupport
	Checksum: 0xF2312445
	Offset: 0x3F28
	Size: 0x8E
	Parameters: 3
	Flags: None
*/
function getpointonline(startpoint, endpoint, ratio)
{
	nextpoint = (startpoint[0] + ((endpoint[0] - startpoint[0]) * ratio), startpoint[1] + ((endpoint[1] - startpoint[1]) * ratio), startpoint[2] + ((endpoint[2] - startpoint[2]) * ratio));
	return nextpoint;
}

/*
	Name: cantargetplayerwithspecialty
	Namespace: airsupport
	Checksum: 0xCA2083DD
	Offset: 0x3FC0
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function cantargetplayerwithspecialty()
{
	if(self hasperk(#"specialty_nottargetedbyairsupport") || (isdefined(self.specialty_nottargetedbyairsupport) && self.specialty_nottargetedbyairsupport))
	{
		if(!isdefined(self.nottargettedai_underminspeedtimer) || self.nottargettedai_underminspeedtimer < getdvarint(#"perk_nottargetedbyai_graceperiod", 0))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: monitorspeed
	Namespace: airsupport
	Checksum: 0x1FA448B5
	Offset: 0x4058
	Size: 0x1D0
	Parameters: 1
	Flags: Linked
*/
function monitorspeed(spawnprotectiontime)
{
	self endon(#"death", #"disconnect");
	if(self hasperk(#"specialty_nottargetedbyairsupport") == 0)
	{
		return;
	}
	getdvarstring(#"perk_nottargetted_graceperiod");
	graceperiod = getdvarint(#"perk_nottargetedbyai_graceperiod", 0);
	minspeed = getdvarint(#"perk_nottargetedbyai_min_speed", 0);
	minspeedsq = minspeed * minspeed;
	waitperiod = 0.25;
	waitperiodmilliseconds = int(waitperiod * 1000);
	if(minspeedsq == 0)
	{
		return;
	}
	self.nottargettedai_underminspeedtimer = 0;
	if(isdefined(spawnprotectiontime))
	{
		wait(spawnprotectiontime);
	}
	while(true)
	{
		velocity = self getvelocity();
		speedsq = lengthsquared(velocity);
		if(speedsq < minspeedsq)
		{
			self.nottargettedai_underminspeedtimer = self.nottargettedai_underminspeedtimer + waitperiodmilliseconds;
		}
		else
		{
			self.nottargettedai_underminspeedtimer = 0;
		}
		wait(waitperiod);
	}
}

/*
	Name: clearmonitoredspeed
	Namespace: airsupport
	Checksum: 0xE0386B5E
	Offset: 0x4230
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function clearmonitoredspeed()
{
	if(isdefined(self.nottargettedai_underminspeedtimer))
	{
		self.nottargettedai_underminspeedtimer = 0;
	}
}

/*
	Name: function_9e2054b0
	Namespace: airsupport
	Checksum: 0x8687DE4B
	Offset: 0x4258
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_9e2054b0(var_65885f89)
{
	self clientfield::set_player_uimodel("locSel.snapTo", 0);
	self [[var_65885f89]]();
	self.selectinglocation = 1;
	self thread endselectionthink();
	self clientfield::set_player_uimodel("locSel.commandMode", 0);
	self thread function_deb91ef4();
}

/*
	Name: waitforlocationselection
	Namespace: airsupport
	Checksum: 0xBC45D41B
	Offset: 0x42F8
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function waitforlocationselection()
{
	self endon(#"emp_jammed", #"emp_grenaded");
	waitresult = undefined;
	waitresult = self waittill(#"confirm_location");
	locationinfo = spawnstruct();
	locationinfo.origin = waitresult.position;
	locationinfo.yaw = waitresult.yaw;
	return locationinfo;
}

/*
	Name: function_deb91ef4
	Namespace: airsupport
	Checksum: 0xB826429
	Offset: 0x4390
	Size: 0x2C2
	Parameters: 0
	Flags: Linked
*/
function function_deb91ef4()
{
	self endon(#"emp_jammed", #"emp_grenaded", #"disconnect", #"confirm_location", #"cancel_location", #"enter_vehicle");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		if(menu == "LocationSelector")
		{
			if(response == "cancel")
			{
				self notify(#"cancel_location");
				return;
			}
			if(response == "player_location")
			{
				self notify(#"confirm_location", {#yaw:0, #position:self.origin});
				return;
			}
			if(response == "take_control")
			{
				self notify(#"enter_vehicle");
				return;
			}
			objid = waitresult.intpayload;
			foreach(point in level.var_51368c39)
			{
				if(point.objectiveid == objid)
				{
					self notify(#"confirm_location", {#yaw:point.yaw, #position:point.origin});
					return;
				}
			}
			var_65072254 = function_cc3ada06(objid);
			if(isdefined(var_65072254))
			{
				self notify(#"confirm_location", {#yaw:0, #position:var_65072254});
				return;
			}
		}
		waitframe(1);
	}
}

/*
	Name: singleradarsweep
	Namespace: airsupport
	Checksum: 0xE9E7615B
	Offset: 0x4660
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function singleradarsweep()
{
	self endon(#"disconnect", #"cancel_selection");
	wait(0.5);
	self playlocalsound(#"mpl_killstreak_satellite");
	if(!level.forceradar)
	{
		self thread radarsweep();
	}
}

/*
	Name: radarsweep
	Namespace: airsupport
	Checksum: 0xB7C476F2
	Offset: 0x46E0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function radarsweep()
{
	self setclientuivisibilityflag("g_compassShowEnemies", 1);
	wait(0.2);
	self setclientuivisibilityflag("g_compassShowEnemies", 0);
}

