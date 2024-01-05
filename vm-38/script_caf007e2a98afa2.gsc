#namespace animation_state_machine_utility;

/*
	Name: function_9c140811
	Namespace: animation_state_machine_utility
	Checksum: 0x58D2FECE
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9c140811()
{
	level notify(-67018958);
}

#namespace animationstatenetworkutility;

/*
	Name: requeststate
	Namespace: animationstatenetworkutility
	Checksum: 0xE1ABEA16
	Offset: 0x80
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function requeststate(entity, statename)
{
	/#
		assert(isdefined(entity));
	#/
	entity asmrequestsubstate(statename);
}

/*
	Name: searchanimationmap
	Namespace: animationstatenetworkutility
	Checksum: 0x3DFAC3B9
	Offset: 0xD0
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function searchanimationmap(entity, aliasname)
{
	if(isdefined(entity) && isdefined(aliasname))
	{
		animationname = entity animmappingsearch(aliasname);
		return animationname;
	}
}

