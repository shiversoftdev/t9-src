#using script_2009cc4c4ecc010f;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace namespace_8ac7fc3d;

/*
	Name: function_ece76a02
	Namespace: namespace_8ac7fc3d
	Checksum: 0x2B293735
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ece76a02()
{
	level notify(1664192117);
}

/*
	Name: function_89f2df9
	Namespace: namespace_8ac7fc3d
	Checksum: 0x6E6C41B0
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_22256eb7a0eb3611", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_8ac7fc3d
	Checksum: 0xD2ABCDEA
	Offset: 0x100
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_70a657d8(localclientnum)
{
	vehicle::add_vehicletype_callback("player_jetski", &function_966d6664);
	setdvar(#"phys_buoyancy", 1);
}

/*
	Name: function_966d6664
	Namespace: namespace_8ac7fc3d
	Checksum: 0xC3343343
	Offset: 0x168
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_966d6664(localclientnum)
{
	self.var_917cf8e3 = &player_vehicle::function_b0d51c9;
	self.var_1a6ef836 = 0;
}

