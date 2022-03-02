#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace player_role;

/*
	Name: function_89f2df9
	Namespace: player_role
	Checksum: 0xA5D5C92
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"player_role", undefined, &__postload_init__, undefined, undefined);
}

/*
	Name: __postload_init__
	Namespace: player_role
	Checksum: 0x80F724D1
	Offset: 0xB8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function __postload_init__()
{
}

/*
	Name: is_valid
	Namespace: player_role
	Checksum: 0xAB621565
	Offset: 0xC8
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function is_valid(index)
{
	if(!isdefined(index))
	{
		return 0;
	}
	/#
		if(getdvarint(#"allowdebugcharacter", 0) == 1)
		{
			return index >= 0 && index < getplayerroletemplatecount(currentsessionmode());
		}
	#/
	return index > 0 && index < getplayerroletemplatecount(currentsessionmode());
}

