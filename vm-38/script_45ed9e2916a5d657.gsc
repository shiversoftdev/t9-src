#using script_ac6a30f1991e105;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_cd6bd9f;

/*
	Name: function_a2eb6dc5
	Namespace: namespace_cd6bd9f
	Checksum: 0xB2D2EFD3
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a2eb6dc5()
{
	level notify(1953799655);
}

/*
	Name: function_89f2df9
	Namespace: namespace_cd6bd9f
	Checksum: 0xE3E48A5F
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_54149d856843e31a", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_cd6bd9f
	Checksum: 0x2B639635
	Offset: 0x120
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	ai::add_archetype_spawn_function(#"hash_7c0d83ac1e845ac2", &function_7ec99c76);
}

/*
	Name: function_7ec99c76
	Namespace: namespace_cd6bd9f
	Checksum: 0x549299F0
	Offset: 0x160
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7ec99c76(localclientnum)
{
	playfx(localclientnum, "zombie/fx_portal_keeper_spawn_burst_zod_zmb", self.origin, anglestoforward((0, 0, 0)), anglestoup((0, 0, 0)));
}

