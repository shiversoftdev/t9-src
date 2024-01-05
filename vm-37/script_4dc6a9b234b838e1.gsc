#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_cc411409;

/*
	Name: function_70a657d8
	Namespace: namespace_cc411409
	Checksum: 0x8D5871B6
	Offset: 0xE0
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!isdefined(level.var_30858358))
	{
		clientfield::register("scriptmover", "ragdoll_launcher_id", 1, getminbitcountfornum(7), "int");
		clientfield::register("scriptmover", "ragdoll_launcher_mag", 1, getminbitcountfornum(4), "int");
		clientfield::register("actor", "ragdoll_launcher_id", 1, getminbitcountfornum(7), "int");
		level.var_30858358 = [];
	}
}

/*
	Name: function_9a7edbff
	Namespace: namespace_cc411409
	Checksum: 0x6E9BA0D9
	Offset: 0x1C8
	Size: 0x146
	Parameters: 2
	Flags: Linked
*/
function function_9a7edbff(origin, magnitude)
{
	for(i = 1; i < 7; i++)
	{
		if(!isentity(level.var_30858358[i]))
		{
			level.var_30858358[i] = util::spawn_model(#"tag_origin", origin);
			level.var_30858358[i] clientfield::set("ragdoll_launcher_id", i);
			level.var_30858358[i] clientfield::set("ragdoll_launcher_mag", magnitude);
			level.var_30858358[i].index = i;
			level.var_30858358[i].magnitude = magnitude;
			level.var_30858358[i] thread function_9cffb95a();
			return level.var_30858358[i];
		}
	}
}

/*
	Name: function_706a56ae
	Namespace: namespace_cc411409
	Checksum: 0x4A31A152
	Offset: 0x318
	Size: 0x1DC
	Parameters: 2
	Flags: Linked
*/
function function_706a56ae(var_ed6db408, magnitude)
{
	if(!(isdefined(self) && isdefined(magnitude)))
	{
		return;
	}
	/#
		assert(magnitude <= 3, ("" + magnitude) + "");
	#/
	if(isvec(var_ed6db408))
	{
		var_218aaae3 = function_72d3bca6(level.var_30858358, var_ed6db408, undefined, 0, 32);
		foreach(var_887796fa in var_218aaae3)
		{
			if(var_887796fa.magnitude === magnitude)
			{
				launcher = var_887796fa;
				break;
			}
		}
		if(!isdefined(launcher))
		{
			launcher = function_9a7edbff(var_ed6db408, magnitude);
		}
	}
	else if(isentity(var_ed6db408))
	{
		launcher = var_ed6db408;
	}
	if(!isdefined(launcher))
	{
		return;
	}
	launcher thread function_9cffb95a();
	self startragdoll();
	self clientfield::set("ragdoll_launcher_id", launcher.index);
}

/*
	Name: function_9cffb95a
	Namespace: namespace_cc411409
	Checksum: 0x8C63EEFF
	Offset: 0x500
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9cffb95a()
{
	self endon(#"death");
	self notify("15629674c8c062da");
	self endon("15629674c8c062da");
	wait(0.5);
	function_12d36686(self.index);
}

/*
	Name: function_12d36686
	Namespace: namespace_cc411409
	Checksum: 0x2194C166
	Offset: 0x560
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_12d36686(index)
{
	/#
		assert(isentity(level.var_30858358[index]), "");
	#/
	level.var_30858358[index] deletedelay();
	level.var_30858358[index] = undefined;
}

