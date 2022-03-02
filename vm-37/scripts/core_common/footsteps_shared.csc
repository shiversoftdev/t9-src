#namespace footsteps;

/*
	Name: missing_ai_footstep_callback
	Namespace: footsteps
	Checksum: 0x583F997B
	Offset: 0x60
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
	Checksum: 0xEC47D272
	Offset: 0x100
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
	Checksum: 0xA15FF3F7
	Offset: 0x190
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

