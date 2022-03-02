#using script_40fc784c60f9fa7b;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace namespace_f0fad81d;

/*
	Name: function_3e9518a7
	Namespace: namespace_f0fad81d
	Checksum: 0x8F7227CC
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3e9518a7()
{
	level notify(452621102);
}

/*
	Name: function_89f2df9
	Namespace: namespace_f0fad81d
	Checksum: 0xA656DDB
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5115ee7eff718e37", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_f0fad81d
	Checksum: 0x6B7E5B7B
	Offset: 0x108
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_btr40", &function_a5a8e361);
}

/*
	Name: function_a5a8e361
	Namespace: namespace_f0fad81d
	Checksum: 0x458F152F
	Offset: 0x140
	Size: 0x194
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a5a8e361()
{
	self setmovingplatformenabled(1, 0);
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_658070e);
	callback::function_d8abfc3d(#"hash_55f29e0747697500", &function_b3042635);
	callback::function_d8abfc3d(#"hash_2c1cafe2a67dfef8", &function_32ff31aa);
	self.var_96c0f900 = [];
	self.var_96c0f900[1] = 1000;
	self.var_4ca92b57 = 30;
	self.var_57371c71 = 60;
	self.var_84fed14b = 40;
	self.var_d6691161 = 175;
	self.var_5d662124 = 2;
	self vehicle::toggle_control_bone_group(1, 1);
	self vehicle::toggle_control_bone_group(2, 1);
	self vehicle::toggle_control_bone_group(3, 1);
	self thread player_vehicle::function_5bce3f3a(1, 1000);
}

/*
	Name: function_658070e
	Namespace: namespace_f0fad81d
	Checksum: 0x4CC74412
	Offset: 0x2E0
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_658070e(params)
{
	player = params.player;
	eventstruct = params.eventstruct;
	if(!isdefined(player))
	{
		return;
	}
	if(eventstruct.seat_index >= 1 && eventstruct.seat_index <= 4)
	{
		self vehicle::toggle_control_bone_group((eventstruct.seat_index - 1) + 1, 0);
	}
}

/*
	Name: function_b3042635
	Namespace: namespace_f0fad81d
	Checksum: 0x769F5CCE
	Offset: 0x380
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_b3042635(params)
{
	eventstruct = params.eventstruct;
	if(eventstruct.seat_index >= 1 && eventstruct.seat_index <= 4)
	{
		self vehicle::toggle_control_bone_group((eventstruct.seat_index - 1) + 1, 1);
	}
}

/*
	Name: function_32ff31aa
	Namespace: namespace_f0fad81d
	Checksum: 0x37931D8A
	Offset: 0x408
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_32ff31aa(params)
{
	player = params.player;
	eventstruct = params.eventstruct;
	if(!isdefined(player))
	{
		return;
	}
	if(eventstruct.seat_index >= 1 && eventstruct.seat_index <= 4)
	{
		self vehicle::toggle_control_bone_group((eventstruct.seat_index - 1) + 1, 0);
	}
	if(eventstruct.var_21911287 >= 1 && eventstruct.var_21911287 <= 4)
	{
		self vehicle::toggle_control_bone_group((eventstruct.var_21911287 - 1) + 1, 1);
	}
}

