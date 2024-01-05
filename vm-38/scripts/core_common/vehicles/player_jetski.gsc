#using script_40fc784c60f9fa7b;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_8ac7fc3d;

/*
	Name: function_585e077e
	Namespace: namespace_8ac7fc3d
	Checksum: 0x8509C417
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_585e077e()
{
	level notify(-1333262208);
}

/*
	Name: __init__system__
	Namespace: namespace_8ac7fc3d
	Checksum: 0x6E6C41B0
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_22256eb7a0eb3611", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_8ac7fc3d
	Checksum: 0xD082846
	Offset: 0x108
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_jetski", &function_966d6664);
	setdvar(#"phys_buoyancy", 1);
}

/*
	Name: function_966d6664
	Namespace: namespace_8ac7fc3d
	Checksum: 0x829F71D1
	Offset: 0x168
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_966d6664()
{
	self.var_84fed14b = 40;
	self.var_4ca92b57 = 20;
	self.var_d6691161 = 175;
	self.var_5d662124 = 2;
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_4fc75987);
	self player_vehicle::function_cc30c4bb(#"hash_22c22a196fd2cc77", 6);
}

/*
	Name: function_4fc75987
	Namespace: namespace_8ac7fc3d
	Checksum: 0xCE4CD85A
	Offset: 0x210
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4fc75987(params)
{
	self thread player_vehicle::function_e8e41bbb();
}

