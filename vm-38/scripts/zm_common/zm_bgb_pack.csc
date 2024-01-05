#using scripts\zm_common\load.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_44ee8aa7;

/*
	Name: function_3bccabb6
	Namespace: namespace_44ee8aa7
	Checksum: 0x4229FB88
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3bccabb6()
{
	level notify(1321757270);
}

#namespace bgb_pack;

/*
	Name: __init__system__
	Namespace: bgb_pack
	Checksum: 0x45B269A2
	Offset: 0xB0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"bgb_pack", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bgb_pack
	Checksum: 0xBE1C1EDC
	Offset: 0x108
	Size: 0x20
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(level.bgb_in_use))
	{
		return;
	}
}

/*
	Name: function_8ac3bea9
	Namespace: bgb_pack
	Checksum: 0xF92F5887
	Offset: 0x130
	Size: 0x20
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	if(!is_true(level.bgb_in_use))
	{
		return;
	}
}

