#using script_ac6a30f1991e105;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_9f3d3e9;

/*
	Name: function_611cc46d
	Namespace: namespace_9f3d3e9
	Checksum: 0x88FB05FF
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_611cc46d()
{
	level notify(1403247869);
}

/*
	Name: function_89f2df9
	Namespace: namespace_9f3d3e9
	Checksum: 0xC834AF3C
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_78bf0dc450091c57", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9f3d3e9
	Checksum: 0x87380BD0
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	ai::add_archetype_spawn_function(#"avogadro", &function_1caf705e);
}

/*
	Name: function_1caf705e
	Namespace: namespace_9f3d3e9
	Checksum: 0xF99CEEF9
	Offset: 0x130
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1caf705e(localclientnum)
{
}

