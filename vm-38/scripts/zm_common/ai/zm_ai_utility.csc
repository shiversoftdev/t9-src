#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_ai_utility;

/*
	Name: function_a83d848b
	Namespace: zm_ai_utility
	Checksum: 0x828F1D4D
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a83d848b()
{
	level notify(-267287868);
}

/*
	Name: __init__system__
	Namespace: zm_ai_utility
	Checksum: 0xE74E7474
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_ai_utility", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_ai_utility
	Checksum: 0x4A7E8393
	Offset: 0x110
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	ai::add_ai_spawn_function(&function_f3a051c6);
	clientfield::register("actor", "actor_enable_on_radar", 1, 1, "int", &on_radar, 0, 0);
}

/*
	Name: function_f3a051c6
	Namespace: zm_ai_utility
	Checksum: 0xE49E4E12
	Offset: 0x188
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f3a051c6(localclientnum)
{
}

/*
	Name: on_radar
	Namespace: zm_ai_utility
	Checksum: 0x7E689727
	Offset: 0x1A0
	Size: 0x74
	Parameters: 7
	Flags: Linked, Private
*/
function private on_radar(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self enableonradar();
	}
	else
	{
		self disableonradar();
	}
}

