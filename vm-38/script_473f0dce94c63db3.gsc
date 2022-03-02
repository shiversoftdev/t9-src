#using script_2009cc4c4ecc010f;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace namespace_dff38fd8;

/*
	Name: function_e253600c
	Namespace: namespace_dff38fd8
	Checksum: 0xB6173AFF
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e253600c()
{
	level notify(787752061);
}

/*
	Name: function_89f2df9
	Namespace: namespace_dff38fd8
	Checksum: 0x5F04E17D
	Offset: 0xA8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5899c013879294b7", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_dff38fd8
	Checksum: 0x4945D806
	Offset: 0xF8
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_70a657d8(localclientnum)
{
	vehicle::add_vehicletype_callback("player_pbr", &function_cc0af45d);
	setdvar(#"phys_buoyancy", 1);
}

/*
	Name: function_cc0af45d
	Namespace: namespace_dff38fd8
	Checksum: 0x18925099
	Offset: 0x160
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cc0af45d(localclientnum)
{
	self.var_917cf8e3 = &player_vehicle::function_b0d51c9;
	self.var_1a6ef836 = 0;
}

