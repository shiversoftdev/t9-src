#namespace flowgraph_player;

/*
	Name: function_9a819539
	Namespace: flowgraph_player
	Checksum: 0xF8A0989
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9a819539()
{
	level notify(1714928101);
}

/*
	Name: ifplayer
	Namespace: flowgraph_player
	Checksum: 0x474D0F06
	Offset: 0x80
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function ifplayer(x, e_entity)
{
	return isplayer(e_entity);
}

