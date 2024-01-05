#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_9f6a2660;

/*
	Name: function_8774381a
	Namespace: namespace_9f6a2660
	Checksum: 0x9CF20C37
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8774381a()
{
	level notify(-2019384466);
}

/*
	Name: __init__system__
	Namespace: namespace_9f6a2660
	Checksum: 0x198D6442
	Offset: 0xA8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_467050137d0c0d2a", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_9f6a2660
	Checksum: 0x515D1E95
	Offset: 0xF8
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_van", &function_c6b4bcab);
}

/*
	Name: function_c6b4bcab
	Namespace: namespace_9f6a2660
	Checksum: 0xC827B261
	Offset: 0x130
	Size: 0xAA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c6b4bcab()
{
	self setmovingplatformenabled(1, 0);
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_e26ae7d4);
	callback::function_d8abfc3d(#"hash_55f29e0747697500", &function_f5da89ea);
	self.var_84fed14b = 40;
	self.var_d6691161 = 175;
	self.var_5d662124 = 2;
}

/*
	Name: function_e26ae7d4
	Namespace: namespace_9f6a2660
	Checksum: 0x32E727C3
	Offset: 0x1E8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_e26ae7d4(params)
{
	player = params.player;
	if(!isdefined(player))
	{
		return;
	}
	if(function_3238d10d(self.origin))
	{
		playsoundatposition(#"hash_5e5cbc0e6e2d1d4e", self.origin);
	}
	self vehicle::toggle_control_bone_group(1, 1);
}

/*
	Name: function_f5da89ea
	Namespace: namespace_9f6a2660
	Checksum: 0x8D209B6D
	Offset: 0x280
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function function_f5da89ea(params)
{
	player = params.player;
	if(!isdefined(player))
	{
		return;
	}
	if(!isalive(self))
	{
		return;
	}
	occupants = self getvehoccupants();
	if(!isdefined(occupants) || occupants.size == 0)
	{
		if(function_3238d10d(self.origin))
		{
			playsoundatposition(#"hash_5e5cbc0e6e2d1d4e", self.origin);
		}
		self vehicle::toggle_control_bone_group(1, 0);
	}
}

