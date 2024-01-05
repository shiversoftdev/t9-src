#using script_359683f0ff3b3fbb;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace zclassic;

/*
	Name: main
	Namespace: zclassic
	Checksum: 0x3E5C71
	Offset: 0x80
	Size: 0xAC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level._zombie_gamemodeprecache = &onprecachegametype;
	level._zombie_gamemodemain = &onstartgametype;
	if(!isdefined(level.var_352498c6))
	{
		prototype_hud::register();
		level.var_352498c6 = 1;
	}
	callback::on_gameplay_started(&on_gameplay_started);
	/#
		println("");
	#/
}

/*
	Name: onprecachegametype
	Namespace: zclassic
	Checksum: 0xD8FB1DA3
	Offset: 0x138
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
	/#
		println("");
	#/
}

/*
	Name: onstartgametype
	Namespace: zclassic
	Checksum: 0x8E67404B
	Offset: 0x168
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	/#
		println("");
	#/
}

/*
	Name: on_gameplay_started
	Namespace: zclassic
	Checksum: 0x37E5A2A1
	Offset: 0x198
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function on_gameplay_started(localclientnum)
{
	waitframe(1);
	util::function_8eb5d4b0(3500, 2.5);
}

