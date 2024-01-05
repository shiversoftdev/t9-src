#using script_355c6e84a79530cb;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using script_7fc996fe8678852;

#namespace namespace_7a9f67c8;

/*
	Name: function_9de556b8
	Namespace: namespace_7a9f67c8
	Checksum: 0x375B8CA8
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9de556b8()
{
	level notify(-793881006);
}

/*
	Name: __init__system__
	Namespace: namespace_7a9f67c8
	Checksum: 0x977BDC54
	Offset: 0xA0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_3617acb8b856566f", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_7a9f67c8
	Checksum: 0xCC53B9BE
	Offset: 0xF0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	namespace_8b6a9d79::function_b3464a7c(#"hash_38cc1135684934da", &function_f14de68);
}

/*
	Name: function_f14de68
	Namespace: namespace_7a9f67c8
	Checksum: 0x498E7771
	Offset: 0x148
	Size: 0xD0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f14de68(instance)
{
	instance endon(#"cleanup");
	a_machines = namespace_8b6a9d79::function_f703a5a(instance);
	foreach(s_machine in a_machines)
	{
		level thread namespace_73df937d::function_ae44cb3d(instance, s_machine.content_key);
	}
}

