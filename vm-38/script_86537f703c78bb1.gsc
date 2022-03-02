#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace namespace_20a2e496;

/*
	Name: function_6a4a0a01
	Namespace: namespace_20a2e496
	Checksum: 0x1DFB5DA0
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6a4a0a01()
{
	level notify(610258742);
}

/*
	Name: function_89f2df9
	Namespace: namespace_20a2e496
	Checksum: 0x1DF06417
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_65231a254dac5391", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_20a2e496
	Checksum: 0xC486B594
	Offset: 0x108
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_70a657d8(localclientnum)
{
	vehicle::add_vehicletype_callback("player_fav_light", &function_6e6e0d52);
}

/*
	Name: function_6e6e0d52
	Namespace: namespace_20a2e496
	Checksum: 0x867D0187
	Offset: 0x148
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6e6e0d52(localclientnum)
{
}

