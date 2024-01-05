#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using script_47d08d7129406c5a;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_b1fabd77;

/*
	Name: __init__system__
	Namespace: namespace_b1fabd77
	Checksum: 0xFD0A36A8
	Offset: 0x100
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_755cb45f3199fa30", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_b1fabd77
	Checksum: 0x386AFA18
	Offset: 0x150
	Size: 0x11C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "hind_gunner_postfx_active", 1, 1, "int");
	clientfield::register("vehicle", "hind_compass_icon", 1, 2, "int");
	vehicle::add_main_callback("helicopter_heavy", &function_8220feb0);
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_8f37f11);
	callback::function_d8abfc3d(#"hash_2c1cafe2a67dfef8", &change_seat);
	callback::function_d8abfc3d(#"hash_55f29e0747697500", &function_1ec626d7);
}

/*
	Name: function_8220feb0
	Namespace: namespace_b1fabd77
	Checksum: 0x53B76351
	Offset: 0x278
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_8220feb0()
{
	self.var_dc20225f = 1;
	namespace_c8fb02a7::function_a01726dd();
}

/*
	Name: function_8f37f11
	Namespace: namespace_b1fabd77
	Checksum: 0x31D1AC20
	Offset: 0x2A8
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_8f37f11(params)
{
	self endon(#"death");
	if(isalive(self))
	{
		if(isdefined(params.player))
		{
			enter_seat = params.eventstruct.seat_index;
			if(namespace_c8fb02a7::function_9ffa5fd(undefined, enter_seat))
			{
				self function_6ffe1aa7(params.player, undefined, enter_seat);
			}
		}
		self thread update_compass_icon();
	}
}

/*
	Name: function_1ec626d7
	Namespace: namespace_b1fabd77
	Checksum: 0xC0B57BA1
	Offset: 0x370
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_1ec626d7(params)
{
	params.player clientfield::set_to_player("hind_gunner_postfx_active", 0);
	self thread update_compass_icon();
}

/*
	Name: change_seat
	Namespace: namespace_b1fabd77
	Checksum: 0x93B09FFF
	Offset: 0x3C0
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function change_seat(params)
{
	self endon(#"death");
	if(isalive(self))
	{
		if(isdefined(params.player))
		{
			enter_seat = params.eventstruct.seat_index;
			exit_seat = params.eventstruct.old_seat_index;
			if(namespace_c8fb02a7::function_9ffa5fd(exit_seat, enter_seat))
			{
				self function_6ffe1aa7(params.player, exit_seat, enter_seat);
			}
		}
		self thread update_compass_icon();
	}
}

/*
	Name: update_compass_icon
	Namespace: namespace_b1fabd77
	Checksum: 0xC5854FB8
	Offset: 0x4A0
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function update_compass_icon()
{
	self endon(#"death");
	self notify("6fdbe6a52e632df0");
	self endon("6fdbe6a52e632df0");
	owner = self getvehoccupants()[0];
	if(isdefined(owner))
	{
		self clientfield::set("hind_compass_icon", 1);
		wait(2);
		self clientfield::set("hind_compass_icon", 2);
		return;
	}
	self clientfield::set("hind_compass_icon", 1);
	wait(2);
	self clientfield::set("hind_compass_icon", 0);
}

/*
	Name: function_6ffe1aa7
	Namespace: namespace_b1fabd77
	Checksum: 0xC19C8E9E
	Offset: 0x5A0
	Size: 0xC4
	Parameters: 3
	Flags: None
*/
function function_6ffe1aa7(player, var_92eb9b7d, var_6d872cea)
{
	if(!(var_92eb9b7d === 1 || var_6d872cea === 1))
	{
		return;
	}
	var_78efa1b4 = self function_ff1bf59c(var_92eb9b7d, var_6d872cea);
	wait(var_78efa1b4);
	if(var_6d872cea === 1)
	{
		player clientfield::set_to_player("hind_gunner_postfx_active", 1);
	}
	else if(var_92eb9b7d === 1)
	{
		player clientfield::set_to_player("hind_gunner_postfx_active", 0);
	}
}

