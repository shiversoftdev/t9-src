#using script_7b68dad851540de;
#using scripts\core_common\ai_shared.gsc;

#namespace tac;

/*
	Name: function_13942b3d
	Namespace: tac
	Checksum: 0xD7E42F2E
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_13942b3d()
{
	level notify(768015983);
}

#namespace namespace_206491b4;

/*
	Name: function_24b5e32
	Namespace: namespace_206491b4
	Checksum: 0x1440BA78
	Offset: 0xF0
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_24b5e32(pos)
{
	pos = goal_origin(pos);
	if(isdefined(self.smart_object))
	{
		return self.smart_object smart_object::get_goal().angles;
	}
	if(is_true(self.limitstealthturning))
	{
		return vectortoangles(pos - self.origin);
	}
	lookdir = findopenlookdir(pos);
	if(isdefined(lookdir))
	{
		return vectortoangles(lookdir);
	}
}

/*
	Name: findopenlookdir
	Namespace: namespace_206491b4
	Checksum: 0x9CC51DDA
	Offset: 0x1C8
	Size: 0x1C0
	Parameters: 3
	Flags: Linked
*/
function findopenlookdir(from, radius, mindist)
{
	if(!isdefined(radius))
	{
		radius = 256;
	}
	if(!isdefined(mindist))
	{
		mindist = 96;
	}
	from = goal_origin(from);
	space = ai::t_cylinder(from, radius, 128);
	tacpoints = (isdefined(tacticalquery("stealth_open_view_space", from, space)) ? tacticalquery("stealth_open_view_space", from, space) : []);
	mindistsq = sqr(mindist);
	foreach(tac in tacpoints)
	{
		if(distancesquared(from, tac.origin) > mindistsq)
		{
			dir = tac.origin - from;
			return vectornormalize((dir[0], dir[1], 0));
		}
	}
}

/*
	Name: findclosestnonlospointwithinradius
	Namespace: namespace_206491b4
	Checksum: 0x218C7839
	Offset: 0x390
	Size: 0x7A
	Parameters: 6
	Flags: Linked
*/
function findclosestnonlospointwithinradius(center, radius, var_72cc3c18, var_465a4fd5, var_56d24f04, var_78b09589)
{
	cylinder = ai::t_cylinder(center, radius, 128);
	return function_a4b83b6a("stealth_closest_non_los_space", cylinder, var_72cc3c18, var_465a4fd5, var_56d24f04, var_78b09589);
}

/*
	Name: findclosestnonlospointwithinvolume
	Namespace: namespace_206491b4
	Checksum: 0x7E51DE1
	Offset: 0x418
	Size: 0x4A
	Parameters: 5
	Flags: Linked
*/
function findclosestnonlospointwithinvolume(vol, var_72cc3c18, var_465a4fd5, var_56d24f04, var_78b09589)
{
	return function_a4b83b6a("stealth_closest_non_los_space", vol, var_72cc3c18, var_465a4fd5, var_56d24f04, var_78b09589);
}

/*
	Name: findclosestlospointwithinradius
	Namespace: namespace_206491b4
	Checksum: 0xC831E1DA
	Offset: 0x470
	Size: 0x7A
	Parameters: 6
	Flags: Linked
*/
function findclosestlospointwithinradius(center, radius, var_72cc3c18, var_465a4fd5, var_56d24f04, var_78b09589)
{
	cylinder = ai::t_cylinder(center, radius, 128);
	return function_a4b83b6a("stealth_closest_los_space", cylinder, var_72cc3c18, var_465a4fd5, var_56d24f04, var_78b09589);
}

/*
	Name: findclosestlospointwithinvolume
	Namespace: namespace_206491b4
	Checksum: 0xAE26B20E
	Offset: 0x4F8
	Size: 0x4A
	Parameters: 5
	Flags: Linked
*/
function findclosestlospointwithinvolume(vol, var_72cc3c18, var_465a4fd5, var_56d24f04, var_78b09589)
{
	return function_a4b83b6a("stealth_closest_los_space", vol, var_72cc3c18, var_465a4fd5, var_56d24f04, var_78b09589);
}

/*
	Name: function_a4b83b6a
	Namespace: namespace_206491b4
	Checksum: 0x16A25FBE
	Offset: 0x550
	Size: 0x238
	Parameters: 6
	Flags: Linked, Private
*/
function private function_a4b83b6a(var_b1f9c3ce, space, var_72cc3c18, var_465a4fd5, var_56d24f04, var_78b09589)
{
	tacpoints = (isdefined(tacticalquery(var_b1f9c3ce, space.origin, space, var_72cc3c18, var_465a4fd5)) ? tacticalquery(var_b1f9c3ce, space.origin, space, var_72cc3c18, var_465a4fd5) : []);
	if(isdefined(var_56d24f04))
	{
		/#
			assert(isdefined(var_78b09589));
		#/
		var_dfdc1e6f = sqr(var_78b09589);
		var_fdba779a = [];
		foreach(tac in tacpoints)
		{
			ignored = 0;
			foreach(point in var_56d24f04)
			{
				if(distancesquared(point.origin, tac.origin) < var_dfdc1e6f)
				{
					ignored = 1;
					break;
				}
			}
			if(!ignored)
			{
				var_fdba779a[var_fdba779a.size] = tac;
			}
		}
		tacpoints = var_fdba779a;
	}
	if(tacpoints.size > 0)
	{
		return tacpoints[0].origin;
	}
	return var_465a4fd5;
}

/*
	Name: goal_origin
	Namespace: namespace_206491b4
	Checksum: 0x7A307AAC
	Offset: 0x790
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private goal_origin(goal)
{
	if(isvec(goal))
	{
		return goal;
	}
	return goal.origin;
}

