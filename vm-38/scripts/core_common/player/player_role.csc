#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace player_role;

/*
	Name: function_bdb2db1b
	Namespace: player_role
	Checksum: 0x4315AE19
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bdb2db1b()
{
	level notify(-50208203);
}

/*
	Name: __init__system__
	Namespace: player_role
	Checksum: 0xAACACCA6
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player_role", undefined, &__postload_init__, undefined, undefined);
}

/*
	Name: __postload_init__
	Namespace: player_role
	Checksum: 0x80F724D1
	Offset: 0xD8
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
	Checksum: 0x2237E382
	Offset: 0xE8
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

