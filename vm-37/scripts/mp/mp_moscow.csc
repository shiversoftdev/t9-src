#using scripts\core_common\load_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace mp_moscow;

/*
	Name: main
	Namespace: mp_moscow
	Checksum: 0xADDAB26D
	Offset: 0x90
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
	Checksum: 0xB01D8559
	Offset: 0x1B0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function on_gameplay_started(localclientnum)
{
	waitframe(1);
	util::function_8eb5d4b0(700, 2);
}

