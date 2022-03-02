#using script_ac6a30f1991e105;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_f7516cdf;

/*
	Name: function_7299f99d
	Namespace: namespace_f7516cdf
	Checksum: 0x77C5EC61
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7299f99d()
{
	level notify(1101649674);
}

/*
	Name: function_89f2df9
	Namespace: namespace_f7516cdf
	Checksum: 0xF37F215F
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2d983ef9e336df0b", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_f7516cdf
	Checksum: 0x87380BD0
	Offset: 0xE8
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	ai::add_archetype_spawn_function(#"avogadro", &function_1caf705e);
}

/*
	Name: function_1caf705e
	Namespace: namespace_f7516cdf
	Checksum: 0xF99CEEF9
	Offset: 0x128
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_1caf705e(localclientnum)
{
}

