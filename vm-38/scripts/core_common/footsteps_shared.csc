#namespace footsteps_shared;

/*
	Name: function_3f0f4a9b
	Namespace: footsteps_shared
	Checksum: 0xFA06C570
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3f0f4a9b()
{
	level notify(-1610177489);
}

#namespace footsteps;

/*
	Name: missing_ai_footstep_callback
	Namespace: footsteps
	Checksum: 0xCE121013
	Offset: 0x80
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function missing_ai_footstep_callback()
{
	/#
		type = self.archetype;
		aitype = self._aitype;
		if(!isdefined(type))
		{
			type = "";
		}
		if(!isdefined(self._aitype))
		{
			aitype = "";
		}
		println(((("" + type) + "") + aitype) + "");
	#/
}

/*
	Name: registeraitypefootstepcb
	Namespace: footsteps
	Checksum: 0x55C9A069
	Offset: 0x120
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function registeraitypefootstepcb(archetype, callback)
{
	if(!isdefined(level._footstepcbfuncs))
	{
		level._footstepcbfuncs = [];
	}
	/#
		assert(!isdefined(level._footstepcbfuncs[archetype]), ("" + archetype) + "");
	#/
	level._footstepcbfuncs[archetype] = callback;
}

/*
	Name: playaifootstep
	Namespace: footsteps
	Checksum: 0x7DB783CF
	Offset: 0x1B0
	Size: 0xDA
	Parameters: 5
	Flags: Linked
*/
function playaifootstep(client_num, pos, surface, notetrack, bone)
{
	if(!isdefined(self.archetype))
	{
		/#
			println("");
		#/
		footstepdoeverything();
		return;
	}
	if(!isdefined(level._footstepcbfuncs) || !isdefined(level._footstepcbfuncs[self.archetype]))
	{
		self missing_ai_footstep_callback();
		footstepdoeverything();
		return;
	}
	[[level._footstepcbfuncs[self.archetype]]](client_num, pos, surface, notetrack, bone);
}

