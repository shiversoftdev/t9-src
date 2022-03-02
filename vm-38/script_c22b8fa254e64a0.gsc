#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace turret_dead_system;

/*
	Name: function_a22723ef
	Namespace: turret_dead_system
	Checksum: 0x18A013B4
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a22723ef()
{
	level notify(1312915878);
}

/*
	Name: function_89f2df9
	Namespace: turret_dead_system
	Checksum: 0xAE9200C5
	Offset: 0x90
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4bbb330ecd0b67a8", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: turret_dead_system
	Checksum: 0x80F724D1
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_8ac3bea9
	Namespace: turret_dead_system
	Checksum: 0x80F724D1
	Offset: 0xF8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

