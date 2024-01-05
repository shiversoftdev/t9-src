#using script_40fc784c60f9fa7b;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_799b5780;

/*
	Name: function_b4f25878
	Namespace: namespace_799b5780
	Checksum: 0xDE4C3722
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b4f25878()
{
	level notify(-28460417);
}

/*
	Name: __init__system__
	Namespace: namespace_799b5780
	Checksum: 0xC7C6AC84
	Offset: 0xC8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_280f5959b67c367a", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_799b5780
	Checksum: 0x5A2B2842
	Offset: 0x118
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_truck_transport", &function_3391a69f);
}

/*
	Name: function_3391a69f
	Namespace: namespace_799b5780
	Checksum: 0x585BEFF4
	Offset: 0x150
	Size: 0x18C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3391a69f()
{
	self setmovingplatformenabled(1, 0);
	self.var_96c0f900 = [];
	self.var_96c0f900[1] = 1000;
	self.var_4ca92b57 = 30;
	self.var_57371c71 = 60;
	self.var_84fed14b = 40;
	self.var_d6691161 = 175;
	self.var_5d662124 = 2;
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &player_enter);
	callback::function_d8abfc3d(#"hash_55f29e0747697500", &player_exit);
	callback::function_d8abfc3d(#"hash_2c1cafe2a67dfef8", &function_379a71bd);
	callback::function_d8abfc3d(#"hash_551381cffdc79048", &player_vehicle::function_948f0984);
	self vehicle::toggle_control_bone_group(1, 1);
	self thread player_vehicle::function_5bce3f3a(1, 1000);
}

/*
	Name: function_135c137c
	Namespace: namespace_799b5780
	Checksum: 0x37203768
	Offset: 0x2E8
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_135c137c(player)
{
	if(!isdefined(self.var_9be5a571))
	{
		self.var_9be5a571 = [];
	}
	if(!isdefined(self.var_3800be7e))
	{
		self thread player_vehicle::function_53f7a11f(player);
	}
}

/*
	Name: function_3a991b11
	Namespace: namespace_799b5780
	Checksum: 0x62F080A
	Offset: 0x338
	Size: 0x1A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3a991b11()
{
	if(!isdefined(self.var_3800be7e))
	{
		self.overridevehicledamage = undefined;
	}
}

/*
	Name: function_e2ade94b
	Namespace: namespace_799b5780
	Checksum: 0xE34E96C
	Offset: 0x360
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e2ade94b()
{
	self vehicle::toggle_control_bone_group(1, 0);
}

/*
	Name: function_86c4506d
	Namespace: namespace_799b5780
	Checksum: 0x62E80668
	Offset: 0x388
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_86c4506d()
{
	self vehicle::toggle_control_bone_group(1, 1);
}

/*
	Name: player_enter
	Namespace: namespace_799b5780
	Checksum: 0xE26A548B
	Offset: 0x3B8
	Size: 0xC2
	Parameters: 1
	Flags: Linked, Private
*/
function private player_enter(params)
{
	player = params.player;
	eventstruct = params.eventstruct;
	if(!isdefined(player))
	{
		return;
	}
	if(isdefined(eventstruct.seat_index))
	{
		switch(eventstruct.seat_index)
		{
			case 0:
			{
				self function_135c137c(player);
				break;
			}
			case 1:
			{
				self function_e2ade94b();
				break;
			}
		}
	}
}

/*
	Name: player_exit
	Namespace: namespace_799b5780
	Checksum: 0x8EE41FCB
	Offset: 0x488
	Size: 0xB2
	Parameters: 1
	Flags: Linked, Private
*/
function private player_exit(params)
{
	eventstruct = params.eventstruct;
	player = params.player;
	if(isdefined(eventstruct.seat_index))
	{
		switch(eventstruct.seat_index)
		{
			case 0:
			{
				self function_3a991b11();
				break;
			}
			case 1:
			{
				self function_86c4506d();
				break;
			}
		}
	}
}

/*
	Name: function_379a71bd
	Namespace: namespace_799b5780
	Checksum: 0x53E465B1
	Offset: 0x548
	Size: 0x13A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_379a71bd(params)
{
	player = params.player;
	eventstruct = params.eventstruct;
	if(!isdefined(player))
	{
		return;
	}
	if(isdefined(eventstruct.seat_index))
	{
		switch(eventstruct.seat_index)
		{
			case 0:
			{
				self function_135c137c(player);
				break;
			}
			case 1:
			{
				self function_e2ade94b();
				break;
			}
		}
	}
	if(isdefined(eventstruct.old_seat_index))
	{
		switch(eventstruct.old_seat_index)
		{
			case 0:
			{
				self function_3a991b11();
				break;
			}
			case 1:
			{
				self function_86c4506d();
				break;
			}
		}
	}
}

