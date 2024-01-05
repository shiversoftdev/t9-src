#using scripts\core_common\load_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace mp_moscow;

/*
	Name: function_c2ca794f
	Namespace: mp_moscow
	Checksum: 0x1C072574
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c2ca794f()
{
	level notify(2071751368);
}

/*
	Name: main
	Namespace: mp_moscow
	Checksum: 0xB3B245A2
	Offset: 0xB0
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
	Namespace: mp_moscow
	Checksum: 0xEA4AAAE9
	Offset: 0x1D0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function on_gameplay_started(localclientnum)
{
	waitframe(1);
	util::function_8eb5d4b0(700, 2);
}

