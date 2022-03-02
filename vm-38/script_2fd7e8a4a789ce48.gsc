#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace namespace_dca7e7f7;

/*
	Name: function_ad0b1e9d
	Namespace: namespace_dca7e7f7
	Checksum: 0xD707BD41
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ad0b1e9d()
{
	level notify(1872760124);
}

/*
	Name: function_89f2df9
	Namespace: namespace_dca7e7f7
	Checksum: 0xDFE747C8
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1314c8c8bb6fdb10", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_dca7e7f7
	Checksum: 0xA4791F91
	Offset: 0x100
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_sedan", &function_3ca3e81e);
}

/*
	Name: function_3ca3e81e
	Namespace: namespace_dca7e7f7
	Checksum: 0x43070E46
	Offset: 0x138
	Size: 0xAA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3ca3e81e()
{
	self setmovingplatformenabled(1, 0);
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_9c00eeec);
	callback::function_d8abfc3d(#"hash_55f29e0747697500", &function_9303f902);
	self.var_84fed14b = 40;
	self.var_d6691161 = 175;
	self.var_5d662124 = 2;
}

/*
	Name: function_9c00eeec
	Namespace: namespace_dca7e7f7
	Checksum: 0x7C9E00ED
	Offset: 0x1F0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_9c00eeec(params)
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
	if(!isdefined(occupants) || occupants.size <= 1)
	{
		self playsound(#"hash_50ca37222ffa9505");
		self vehicle::toggle_control_bone_group(1, 1);
	}
}

/*
	Name: function_9303f902
	Namespace: namespace_dca7e7f7
	Checksum: 0xEE5A0FA9
	Offset: 0x2C0
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_9303f902(params)
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
		self playsound(#"hash_50ca37222ffa9505");
		self vehicle::toggle_control_bone_group(1, 0);
	}
}

