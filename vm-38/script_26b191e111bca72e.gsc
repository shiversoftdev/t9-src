#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_33e4d1e0;

/*
	Name: function_49540446
	Namespace: namespace_33e4d1e0
	Checksum: 0x7FC9A447
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_49540446()
{
	level notify(2026083193);
}

#namespace namespace_47a807c3;

/*
	Name: function_89f2df9
	Namespace: namespace_47a807c3
	Checksum: 0x838989AF
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7587f8ddd6b0d47a", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_47a807c3
	Checksum: 0x80F724D1
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}
