#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace player_hemtt;

/*
	Name: function_43c73db3
	Namespace: player_hemtt
	Checksum: 0x60FFEB54
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_43c73db3()
{
	level notify(1902063497);
}

/*
	Name: function_89f2df9
	Namespace: player_hemtt
	Checksum: 0x96E1EF0E
	Offset: 0x108
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"player_hemtt", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: player_hemtt
	Checksum: 0xDF1FEAFE
	Offset: 0x158
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("hemtt_wz", &function_7cb966e4);
}

/*
	Name: function_7cb966e4
	Namespace: player_hemtt
	Checksum: 0xB1BA4C97
	Offset: 0x190
	Size: 0xC2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7cb966e4()
{
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_3fbda54b);
	callback::function_d8abfc3d(#"hash_2c1cafe2a67dfef8", &function_4a8e844a);
	self.var_93dc9da9 = "veh_truck_wall_imp";
	self.var_4ca92b57 = 30;
	self.var_57371c71 = 60;
	self.var_84fed14b = 30;
	self.var_d6691161 = 150;
	self.var_5d662124 = 2;
}

/*
	Name: function_3fbda54b
	Namespace: player_hemtt
	Checksum: 0x7BBF547A
	Offset: 0x260
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3fbda54b(params)
{
	player = params.player;
	seatindex = params.eventstruct.seat_index;
	if(seatindex == 0)
	{
		playfxontag("vehicle/fx8_exhaust_truck_cargo_startup_os", self, "tag_fx_exhaust");
		if(isdefined(player))
		{
			player playrumbleonentity("jet_rumble");
		}
	}
}

/*
	Name: function_4a8e844a
	Namespace: player_hemtt
	Checksum: 0x4EAC7E21
	Offset: 0x300
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4a8e844a(params)
{
	player = params.player;
	seatindex = params.eventstruct.seat_index;
	if(seatindex == 0)
	{
		playfxontag("vehicle/fx8_exhaust_truck_cargo_startup_os", self, "tag_fx_exhaust");
		if(isdefined(player))
		{
			player playrumbleonentity("jet_rumble");
		}
	}
}

