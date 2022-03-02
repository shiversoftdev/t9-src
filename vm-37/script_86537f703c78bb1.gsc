#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace namespace_20a2e496;

/*
	Name: function_89f2df9
	Namespace: namespace_20a2e496
	Checksum: 0xD9B2BFF8
	Offset: 0x98
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
	Checksum: 0x8EF5885
	Offset: 0xE8
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
	Checksum: 0xA992B42B
	Offset: 0x128
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6e6e0d52(localclientnum)
{
}

