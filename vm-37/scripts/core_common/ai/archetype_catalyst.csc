#using scripts\core_common\system_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace archetype_catalyst;

/*
	Name: __init__system__
	Namespace: archetype_catalyst
	Checksum: 0x7AB392F7
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"catalyst", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: precache
	Namespace: archetype_catalyst
	Checksum: 0x80F724D1
	Offset: 0xD0
	Size: 0x4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec precache()
{
}

/*
	Name: function_70a657d8
	Namespace: archetype_catalyst
	Checksum: 0xEF4DF520
	Offset: 0xE0
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
	Namespace: archetype_catalyst
	Checksum: 0x34C0C341
	Offset: 0x120
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5608540a(localclientnum)
{
	self mapshaderconstant(localclientnum, 0, "scriptVector2", 1, 0, 0, 1);
}

