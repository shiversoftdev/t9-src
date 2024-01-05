#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace paintshop;

/*
	Name: __init__system__
	Namespace: paintshop
	Checksum: 0xE97AF9DA
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"paintshop", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: paintshop
	Checksum: 0x25AA0A8C
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(getdvarint(#"hash_2728dd57f235e6e5", 0))
	{
		callback::on_spawned(&on_player_spawned);
	}
}

/*
	Name: on_player_spawned
	Namespace: paintshop
	Checksum: 0x3194D4E1
	Offset: 0x108
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private on_player_spawned(localclientnum)
{
	spawned_player = self;
	local_player = function_5c10bd79(localclientnum);
	if(spawned_player.team == local_player.team || function_b37afded(spawned_player.team, local_player.team))
	{
		if(function_5020f5d1(localclientnum) < function_5ada7356())
		{
			spawned_player function_2bbc8349(localclientnum, 1);
		}
	}
	else
	{
		spawned_player function_2bbc8349(localclientnum, 0);
	}
}

/*
	Name: function_2bbc8349
	Namespace: paintshop
	Checksum: 0x903AA48D
	Offset: 0x1E8
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function function_2bbc8349(localclientnum, enable)
{
	if(!getdvarint(#"hash_2728dd57f235e6e5", 0))
	{
		return;
	}
	if(isdefined(self) && (isdefined(localclientnum) && isdefined(enable)) && isplayer(self))
	{
		player = self;
		player function_8f214149(localclientnum, enable);
	}
}

