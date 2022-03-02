#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_a3cd8b9a;

/*
	Name: function_ba8802e9
	Namespace: namespace_a3cd8b9a
	Checksum: 0xE9F66483
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ba8802e9()
{
	level notify(1739314509);
}

/*
	Name: function_89f2df9
	Namespace: namespace_a3cd8b9a
	Checksum: 0x5AB89E9
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"catalyst", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: precache
	Namespace: namespace_a3cd8b9a
	Checksum: 0x80F724D1
	Offset: 0xF0
	Size: 0x4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec precache()
{
}

/*
	Name: function_70a657d8
	Namespace: namespace_a3cd8b9a
	Checksum: 0x3C8C2D06
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	ai::add_archetype_spawn_function(#"catalyst", &function_5608540a);
}

/*
	Name: function_5608540a
	Namespace: namespace_a3cd8b9a
	Checksum: 0x7E568149
	Offset: 0x140
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5608540a(localclientnum)
{
	self mapshaderconstant(localclientnum, 0, "scriptVector2", 1, 0, 0, 1);
}

