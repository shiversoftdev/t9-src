#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_14c21b91;

/*
	Name: function_4396a482
	Namespace: namespace_14c21b91
	Checksum: 0xBD387D9C
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4396a482()
{
	level notify(-1382827818);
}

/*
	Name: __init__system__
	Namespace: namespace_14c21b91
	Checksum: 0x25BC71
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_e77f876300a38be", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_14c21b91
	Checksum: 0xDB3D7115
	Offset: 0xD8
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_end_game(&on_end_game);
}

/*
	Name: codecallback_startgametype
	Namespace: namespace_14c21b91
	Checksum: 0xF0EF958A
	Offset: 0x108
	Size: 0x4C
	Parameters: 1
	Flags: Event
*/
event codecallback_startgametype(eventstruct)
{
	if(sessionmodeismultiplayergame() && function_8f29c880())
	{
		function_3ae87223();
	}
}

/*
	Name: on_end_game
	Namespace: namespace_14c21b91
	Checksum: 0x33ED560F
	Offset: 0x160
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function on_end_game(localclientnum)
{
	if(sessionmodeismultiplayergame() && function_8f29c880())
	{
		function_8871747f();
	}
}

