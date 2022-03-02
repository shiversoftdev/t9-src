#using script_44b0b8420eabacad;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\load_shared.gsc;

#namespace namespace_6f24c171;

/*
	Name: function_c373b9e5
	Namespace: namespace_6f24c171
	Checksum: 0x2437AB9B
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c373b9e5()
{
	level notify(399630479);
}

/*
	Name: main
	Namespace: namespace_6f24c171
	Checksum: 0xB8BF908A
	Offset: 0xE0
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	function_24198689();
	load::main();
	compass::setupminimap("");
}

/*
	Name: function_24198689
	Namespace: namespace_6f24c171
	Checksum: 0xEDB0BC49
	Offset: 0x130
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_24198689()
{
	var_780f74b5 = [];
	var_780f74b5[var_780f74b5.size] = "mp_spawn_point";
	var_780f74b5[var_780f74b5.size] = "mp_spawn_point_axis";
	var_780f74b5[var_780f74b5.size] = "mp_spawn_point_allies";
	spawning::move_spawn_point(var_780f74b5, (1251, -1009, 8), (1287, -955, 68), vectorscale((0, 1, 0), 105));
}

