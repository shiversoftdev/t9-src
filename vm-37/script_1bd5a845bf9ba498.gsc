#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_14c21b91;

/*
	Name: function_89f2df9
	Namespace: namespace_14c21b91
	Checksum: 0xAF0A1B05
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_e77f876300a38be", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_14c21b91
	Checksum: 0xC6003522
	Offset: 0xB8
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
	Checksum: 0x4B713687
	Offset: 0xE8
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
	Checksum: 0xF2F9B017
	Offset: 0x140
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

