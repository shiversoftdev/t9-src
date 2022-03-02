#namespace animationstatenetworkutility;

/*
	Name: requeststate
	Namespace: animationstatenetworkutility
	Checksum: 0x78330846
	Offset: 0x60
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
	Checksum: 0xF4A61039
	Offset: 0xB0
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

