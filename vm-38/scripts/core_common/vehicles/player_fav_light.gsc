#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_20a2e496;

/*
	Name: function_8f2f1aa5
	Namespace: namespace_20a2e496
	Checksum: 0x12EEC6D0
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8f2f1aa5()
{
	level notify(-634785932);
}

/*
	Name: __init__system__
	Namespace: namespace_20a2e496
	Checksum: 0x1DF06417
	Offset: 0xC0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_65231a254dac5391", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_20a2e496
	Checksum: 0x744F94F3
	Offset: 0x110
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_fav_light", &function_6e6e0d52);
}

/*
	Name: function_6e6e0d52
	Namespace: namespace_20a2e496
	Checksum: 0xB2FEE1CD
	Offset: 0x148
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6e6e0d52()
{
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_1d4618ca);
	callback::function_d8abfc3d(#"hash_2c1cafe2a67dfef8", &function_79f2b4cf);
	callback::function_d8abfc3d(#"hash_55f29e0747697500", &function_c4c18caf);
	self.var_d6691161 = 200;
	self.var_5002d77c = 0.6;
	self vehicle::toggle_control_bone_group(2, 1);
}

/*
	Name: function_1d4618ca
	Namespace: namespace_20a2e496
	Checksum: 0xE04185BC
	Offset: 0x220
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_1d4618ca(params)
{
	player = params.player;
	eventstruct = params.eventstruct;
	if(!isdefined(player))
	{
		return;
	}
	if(eventstruct.seat_index == 0)
	{
		self vehicle::toggle_control_bone_group(1, 1);
	}
	else if(eventstruct.seat_index == 1)
	{
		self vehicle::toggle_control_bone_group(2, 0);
	}
}

/*
	Name: function_79f2b4cf
	Namespace: namespace_20a2e496
	Checksum: 0xA16E0333
	Offset: 0x2C8
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_79f2b4cf(params)
{
	player = params.player;
	eventstruct = params.eventstruct;
	if(!isdefined(player))
	{
		return;
	}
	if(eventstruct.seat_index == 1)
	{
		self vehicle::toggle_control_bone_group(2, 0);
	}
	else if(eventstruct.seat_index == 0)
	{
		self vehicle::toggle_control_bone_group(2, 1);
	}
}

/*
	Name: function_c4c18caf
	Namespace: namespace_20a2e496
	Checksum: 0x1C9908E3
	Offset: 0x370
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_c4c18caf(params)
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
	eventstruct = params.eventstruct;
	if(eventstruct.seat_index == 1)
	{
		self vehicle::toggle_control_bone_group(2, 1);
	}
	occupants = self getvehoccupants();
	if(!isdefined(occupants) || occupants.size == 0)
	{
		self vehicle::toggle_control_bone_group(1, 0);
	}
}

