#using scripts\core_common\clientfield_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_cc411409;

/*
	Name: function_e050d043
	Namespace: namespace_cc411409
	Checksum: 0x2450730B
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e050d043()
{
	level notify(1926700029);
}

/*
	Name: function_70a657d8
	Namespace: namespace_cc411409
	Checksum: 0x2C83979D
	Offset: 0xE0
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!isdefined(level.var_38bf45dc))
	{
		clientfield::register("scriptmover", "ragdoll_launcher_id", 1, getminbitcountfornum(7), "int", &function_5f224893, 0, 0);
		clientfield::register("scriptmover", "ragdoll_launcher_mag", 1, getminbitcountfornum(4), "int", &function_338ef91c, 0, 0);
		clientfield::register("actor", "ragdoll_launcher_id", 1, getminbitcountfornum(7), "int", &function_e83889f9, 0, 0);
		level.var_38bf45dc = [3:250, 2:128, 1:64, 0:undefined];
	}
}

/*
	Name: function_5f224893
	Namespace: namespace_cc411409
	Checksum: 0xD02102CF
	Offset: 0x248
	Size: 0xD2
	Parameters: 7
	Flags: Linked
*/
function function_5f224893(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.var_30858358))
	{
		level.var_30858358 = [];
	}
	if(!isdefined(level.var_30858358[fieldname]))
	{
		level.var_30858358[fieldname] = [];
	}
	level.var_30858358[fieldname][bwastimejump] = {#time:getservertime(fieldname), #ent:self};
	self.var_2011737d = bwastimejump;
}

/*
	Name: function_338ef91c
	Namespace: namespace_cc411409
	Checksum: 0xC7D03868
	Offset: 0x328
	Size: 0xD2
	Parameters: 7
	Flags: Linked
*/
function function_338ef91c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!(isdefined(self.var_2011737d) && isdefined(level.var_30858358[fieldname][self.var_2011737d])) || level.var_30858358[fieldname][self.var_2011737d].ent !== self)
	{
		/#
			println("");
		#/
		return;
	}
	level.var_30858358[fieldname][self.var_2011737d].var_3934e676 = bwastimejump;
}

/*
	Name: function_e83889f9
	Namespace: namespace_cc411409
	Checksum: 0xCB6C1859
	Offset: 0x408
	Size: 0x17C
	Parameters: 7
	Flags: Linked
*/
function function_e83889f9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	waittillframeend();
	if(!(isdefined(self) && isdefined(level.var_30858358[fieldname][bwastimejump].ent)) || (getservertime(fieldname) - level.var_30858358[fieldname][bwastimejump].time) > 500)
	{
		return;
	}
	var_e7927788 = (self.origin[0], self.origin[1], self.origin[2] + 64);
	var_3f57677f = var_e7927788 - level.var_30858358[fieldname][bwastimejump].ent.origin;
	dist = length(var_3f57677f);
	var_3f57677f = var_3f57677f / dist;
	var_3f57677f = var_3f57677f * level.var_38bf45dc[level.var_30858358[fieldname][bwastimejump].var_3934e676];
	self launchragdoll(var_3f57677f);
}

