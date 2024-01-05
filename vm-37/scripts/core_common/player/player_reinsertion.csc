#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace player_reinsertion;

/*
	Name: __init__system__
	Namespace: player_reinsertion
	Checksum: 0x1040EA50
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player_reinsertion", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player_reinsertion
	Checksum: 0x9441599A
	Offset: 0xB8
	Size: 0x18
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(level.var_f2814a96 !== 0)
	{
		return;
	}
}

