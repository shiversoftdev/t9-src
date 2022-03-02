#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_e0710ee6;

/*
	Name: function_89f2df9
	Namespace: namespace_e0710ee6
	Checksum: 0x98566F6A
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3997833cc3034f0", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e0710ee6
	Checksum: 0x7453E36D
	Offset: 0xF0
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
	Namespace: namespace_e0710ee6
	Checksum: 0x3DB0F5C5
	Offset: 0x168
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f3a051c6(localclientnum)
{
}

/*
	Name: on_radar
	Namespace: namespace_e0710ee6
	Checksum: 0x859BFF11
	Offset: 0x180
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

