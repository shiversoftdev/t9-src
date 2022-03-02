#using scripts\core_common\system_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace player_vtol;

/*
	Name: function_89f2df9
	Namespace: player_vtol
	Checksum: 0x4B4AB7B0
	Offset: 0x80
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"player_vtol", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: player_vtol
	Checksum: 0xFA7E01B5
	Offset: 0xD0
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_70a657d8(localclientnum)
{
	vehicle::add_vehicletype_callback("player_vtol", &function_1b39ded0);
}

/*
	Name: function_1b39ded0
	Namespace: player_vtol
	Checksum: 0x54653A58
	Offset: 0x110
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1b39ded0(localclientnum)
{
}

