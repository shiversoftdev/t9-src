#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace player_atv;

/*
	Name: function_eb320642
	Namespace: player_atv
	Checksum: 0xA87B7262
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eb320642()
{
	level notify(1025901944);
}

/*
	Name: __init__system__
	Namespace: player_atv
	Checksum: 0xA26421AC
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player_atv", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: player_atv
	Checksum: 0x13453780
	Offset: 0x108
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_atv", &function_500291c4);
}

/*
	Name: function_500291c4
	Namespace: player_atv
	Checksum: 0xCA60385
	Offset: 0x140
	Size: 0x32
	Parameters: 0
	Flags: Linked, Private
*/
function private function_500291c4()
{
	self.var_93dc9da9 = "veh_atv_wall_imp";
	self.var_d6691161 = 200;
	self.var_5002d77c = 0.6;
}

