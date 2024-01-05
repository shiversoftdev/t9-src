#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_ac0c0ba8;

/*
	Name: function_fbe23143
	Namespace: namespace_ac0c0ba8
	Checksum: 0xCB1085C2
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fbe23143()
{
	level notify(1480635179);
}

/*
	Name: __init__system__
	Namespace: namespace_ac0c0ba8
	Checksum: 0x5A8D9F84
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_770956d673fdbba2", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ac0c0ba8
	Checksum: 0x4F8F969A
	Offset: 0x150
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_e051b3bc = [];
	thread think();
	/#
		thread debug();
	#/
}

/*
	Name: debug
	Namespace: namespace_ac0c0ba8
	Checksum: 0x57296C83
	Offset: 0x198
	Size: 0x2C2
	Parameters: 0
	Flags: Private
*/
function private debug()
{
	/#
		while(true)
		{
			foreach(horde in level.var_e051b3bc)
			{
				recordcircle(horde.origin, horde.radius, (0, 0, 1), "");
				recordcircle(horde.origin, 20, (0, 0, 1), "");
				foreach(goal_point in horde.goal_points)
				{
					recordline(horde.origin, goal_point.origin, (0, 1, 0), "");
					recordcircle(goal_point.origin, 20, (0, 1, 0), "");
				}
				if(isdefined(horde.path))
				{
					for(i = 0; i < horde.path.pathpoints.size - 1; i++)
					{
						point = horde.path.pathpoints[i];
						next_point = horde.path.pathpoints[i + 1];
						recordline(point, next_point, (1, 0, 0), "");
						recordcircle(point, 20, (1, 0, 0), "");
					}
					point = horde.path.pathpoints[i];
					recordcircle(point, 20, (1, 0, 0), "");
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_86d29fe1
	Namespace: namespace_ac0c0ba8
	Checksum: 0x339A4373
	Offset: 0x468
	Size: 0xA4
	Parameters: 4
	Flags: Linked
*/
function function_86d29fe1(var_f9289185, origin, angles, radius)
{
	horde = {#at_goal:0, #hash_91fc28f4:-1, #path:undefined, #radius:radius, #angles:angles, #origin:origin, #name:var_f9289185};
	return horde;
}

/*
	Name: function_88b2dd98
	Namespace: namespace_ac0c0ba8
	Checksum: 0x936F4279
	Offset: 0x518
	Size: 0x292
	Parameters: 1
	Flags: Linked, Private
*/
function private function_88b2dd98(numpoints)
{
	goal_points = [];
	for(i = 0; i < numpoints; i++)
	{
		var_99a3ff38 = 0;
		attempts = 0;
		goal_point = spawnstruct();
		while(!var_99a3ff38 && attempts < 10)
		{
			spawn_angle = randomint(360);
			var_e294ac7d = randomfloat(1);
			var_e294ac7d = sqrt(var_e294ac7d);
			var_9b178666 = int(var_e294ac7d * self.radius);
			spawnx = self.origin[0] + (var_9b178666 * cos(spawn_angle));
			spawny = self.origin[1] + (var_9b178666 * sin(spawn_angle));
			spawnz = self.origin[2];
			goal_point.origin = (spawnx, spawny, spawnz);
			var_99a3ff38 = 1;
			foreach(var_a4e6f42c in goal_points)
			{
				if(distance2dsquared(goal_point.origin, var_a4e6f42c.origin) < 2500)
				{
					var_99a3ff38 = 0;
				}
			}
			attempts++;
		}
		goal_point.zombie = undefined;
		goal_point.offset = self.origin - goal_point.origin;
		goal_points[i] = goal_point;
	}
	self.goal_points = goal_points;
}

/*
	Name: function_11280436
	Namespace: namespace_ac0c0ba8
	Checksum: 0x19A8E464
	Offset: 0x7B8
	Size: 0x18C
	Parameters: 5
	Flags: None
*/
function function_11280436(var_f9289185, origin, angles, radius, var_aae3fc82)
{
	horde = function_86d29fe1(var_f9289185, origin, angles, radius);
	horde function_88b2dd98(var_aae3fc82);
	for(i = 0; i < horde.goal_points.size; i++)
	{
		goal_point = horde.goal_points[i];
		spawn_angles = (0, randomint(360), 0);
		zombie = spawnactor("spawner_boct_zombie_wz", goal_point.origin, spawn_angles, "radial_zombie");
		zombie.variant_type = randomint(level.var_9ee73630[zombie.zombie_move_speed][zombie.zombie_arms_position]);
		zombie.ignoreall = 1;
		zombie pathmode("dont move", 1);
		goal_point.zombie = zombie;
	}
	level.var_e051b3bc[level.var_e051b3bc.size] = horde;
}

/*
	Name: think
	Namespace: namespace_ac0c0ba8
	Checksum: 0x8DE9B978
	Offset: 0x950
	Size: 0x110
	Parameters: 0
	Flags: Linked, Private
*/
function private think()
{
	while(true)
	{
		for(i = 0; i < level.var_e051b3bc.size; i++)
		{
			horde = level.var_e051b3bc[i];
			var_71890760 = horde function_8ac809ae();
			if(!var_71890760)
			{
				horde function_e20d964f();
				i--;
				continue;
			}
			if(isdefined(horde.path))
			{
				horde function_3e88b567();
				horde function_18ca9034();
				continue;
			}
			if(horde.at_goal == 1)
			{
				horde function_684b4879();
			}
		}
		wait(0.2);
	}
}

/*
	Name: function_3e88b567
	Namespace: namespace_ac0c0ba8
	Checksum: 0xB51E269D
	Offset: 0xA68
	Size: 0x152
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3e88b567()
{
	goal = self.path.pathpoints[self.var_91fc28f4];
	if(distancesquared(self.origin, goal) < 100)
	{
		self.var_91fc28f4++;
		if(!isdefined(self.path.pathpoints[self.var_91fc28f4]))
		{
			self.path = undefined;
			self.var_91fc28f4 = -1;
			self.origin = goal;
			self.at_goal = 1;
			return;
		}
		goal = self.path.pathpoints[self.var_91fc28f4];
	}
	var_cdbefa16 = vectornormalize(goal - self.origin);
	velocity = var_cdbefa16 * 10;
	self.origin = self.origin + velocity;
	self.origin = getclosestpointonnavmesh(self.origin, 200, 32);
	self.angles = vectortoangles(var_cdbefa16);
}

/*
	Name: function_18ca9034
	Namespace: namespace_ac0c0ba8
	Checksum: 0xA7BCE9DB
	Offset: 0xBC8
	Size: 0x1D0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_18ca9034()
{
	foreach(goal_point in self.goal_points)
	{
		goal_point.origin = getclosestpointonnavmesh(self.origin - goal_point.offset, 200, 32);
		zombie = goal_point.zombie;
		if(!isdefined(zombie) || !isalive(zombie))
		{
			continue;
		}
		if(!zombie.allowoffnavmesh)
		{
			zombie function_d1e55248(#"hash_63080f1458dca706", 1);
		}
		zombie function_a57c34b7(goal_point.origin);
		distancetogoalsq = distance2dsquared(goal_point.origin, zombie.origin);
		if(distancetogoalsq > 40000 || (zombie.zombie_move_speed == "sprint" && distancetogoalsq > 6400))
		{
			zombie function_9758722("sprint");
			continue;
		}
		zombie function_9758722("walk");
	}
}

/*
	Name: function_9defb9e0
	Namespace: namespace_ac0c0ba8
	Checksum: 0x8D98E8BC
	Offset: 0xDA0
	Size: 0xD2
	Parameters: 1
	Flags: None
*/
function function_9defb9e0(goal)
{
	path = generatenavmeshpath(self.origin, goal, undefined, self.radius, 100);
	if(!isdefined(path))
	{
		return;
	}
	self.path = path;
	self.var_91fc28f4 = 0;
	var_bdd8bda9 = self.path.pathpoints[1];
	if(!isdefined(var_bdd8bda9))
	{
		return;
	}
	var_cdbefa16 = vectornormalize(var_bdd8bda9 - self.origin);
	self.angles = vectortoangles(var_cdbefa16);
}

/*
	Name: function_9758722
	Namespace: namespace_ac0c0ba8
	Checksum: 0x1FCE243B
	Offset: 0xE80
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function function_9758722(speed)
{
	if(self.zombie_move_speed === speed)
	{
		return;
	}
	self.zombie_move_speed = speed;
	if(!isdefined(self.zombie_arms_position))
	{
		self.zombie_arms_position = (math::cointoss() == 1 ? "up" : "down");
	}
	if(isdefined(level.var_9ee73630))
	{
		self.variant_type = randomint(level.var_9ee73630[self.zombie_move_speed][self.zombie_arms_position]);
	}
}

/*
	Name: function_8ac809ae
	Namespace: namespace_ac0c0ba8
	Checksum: 0x82C60B00
	Offset: 0xF40
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac809ae()
{
	foreach(point in self.goal_points)
	{
		zombie = point.zombie;
		if(isdefined(zombie) && isalive(zombie))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_e20d964f
	Namespace: namespace_ac0c0ba8
	Checksum: 0x3E277BEB
	Offset: 0xFF8
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_e20d964f()
{
	foreach(point in self.goal_points)
	{
		point = undefined;
	}
	arrayremovevalue(level.var_e051b3bc, self);
}

/*
	Name: function_d1e55248
	Namespace: namespace_ac0c0ba8
	Checksum: 0xE3AFFE64
	Offset: 0x1098
	Size: 0x7C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d1e55248(id, value)
{
	if(is_true(value))
	{
		self val::set(id, "allowoffnavmesh", 1);
	}
	else
	{
		self val::reset(id, "allowoffnavmesh");
	}
}

/*
	Name: function_684b4879
	Namespace: namespace_ac0c0ba8
	Checksum: 0xCD42590B
	Offset: 0x1120
	Size: 0x118
	Parameters: 0
	Flags: Linked, Private
*/
function private function_684b4879()
{
	foreach(point in self.goal_points)
	{
		zombie = point.zombie;
		if(isdefined(zombie) && isalive(zombie))
		{
			distsq = distancesquared(zombie.origin, zombie.overridegoalpos);
			if(distsq < 400 && zombie.allowoffnavmesh)
			{
				zombie function_d1e55248(#"hash_63080f1458dca706", 0);
			}
		}
	}
}

