#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace player_atv;

/*
	Name: __init__system__
	Namespace: player_atv
	Checksum: 0x9022C20A
	Offset: 0x98
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
	Checksum: 0x61350E38
	Offset: 0xE8
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_atv", &function_500291c4);
}

/*
	Name: function_500291c4
	Namespace: player_atv
	Checksum: 0x46783C6F
	Offset: 0x120
	Size: 0x32
	Parameters: 0
	Flags: Private
*/
function private function_500291c4()
{
	self.var_93dc9da9 = "veh_atv_wall_imp";
	self.var_d6691161 = 200;
	self.var_5002d77c = 0.6;
}

