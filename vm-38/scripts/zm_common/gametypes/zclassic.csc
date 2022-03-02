#using script_359683f0ff3b3fbb;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace zclassic;

/*
	Name: function_b583180f
	Namespace: zclassic
	Checksum: 0xDBECB674
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b583180f()
{
	level notify(1422180829);
}

/*
	Name: main
	Namespace: zclassic
	Checksum: 0x5A6AD809
	Offset: 0xA0
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
	callback::function_d46d9315(&function_d46d9315);
	/#
		println("");
	#/
}

/*
	Name: onprecachegametype
	Namespace: zclassic
	Checksum: 0x2CB8293E
	Offset: 0x158
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
	Checksum: 0xC06F8F5C
	Offset: 0x188
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
	Name: function_d46d9315
	Namespace: zclassic
	Checksum: 0xB41BBEEB
	Offset: 0x1B8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_d46d9315(localclientnum)
{
	waitframe(1);
	util::function_8eb5d4b0(3500, 2.5);
}

