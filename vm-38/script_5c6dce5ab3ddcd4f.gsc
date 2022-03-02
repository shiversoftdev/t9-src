#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace paintshop;

/*
	Name: function_afafb8de
	Namespace: paintshop
	Checksum: 0xFA3D04DA
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_afafb8de()
{
	level notify(1148665753);
}

/*
	Name: function_89f2df9
	Namespace: paintshop
	Checksum: 0x46555EAE
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"paintshop", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: paintshop
	Checksum: 0xD6D37178
	Offset: 0xD8
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
	Checksum: 0xEDCED56
	Offset: 0x128
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
	Checksum: 0xE346C621
	Offset: 0x208
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

