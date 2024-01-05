#using scripts\core_common\load_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace wz_golova;

/*
	Name: function_586350d9
	Namespace: wz_golova
	Checksum: 0x317059F9
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_586350d9()
{
	level notify(-1885332320);
}

/*
	Name: main
	Namespace: wz_golova
	Checksum: 0xB3B245A2
	Offset: 0xA8
	Size: 0x114
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	setsaveddvar(#"enable_global_wind", 1);
	setsaveddvar(#"wind_global_vector", "88 0 0");
	setsaveddvar(#"wind_global_low_altitude", 0);
	setsaveddvar(#"wind_global_hi_altitude", 10000);
	setsaveddvar(#"wind_global_low_strength_percent", 100);
	callback::on_gameplay_started(&on_gameplay_started);
	load::main();
	util::waitforclient(0);
}

/*
	Name: on_gameplay_started
	Namespace: wz_golova
	Checksum: 0x9E459E6
	Offset: 0x1C8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function on_gameplay_started(localclientnum)
{
	waitframe(1);
	util::function_8eb5d4b0(700, 1.5);
}

