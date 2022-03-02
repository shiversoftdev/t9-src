#using script_2f272fb57a31d81c;
#using script_747cc3ca88e8d5b4;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;

#namespace missile_turret;

/*
	Name: function_44591b8
	Namespace: missile_turret
	Checksum: 0xDCF11242
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_44591b8()
{
	level notify(1960062242);
}

/*
	Name: function_89f2df9
	Namespace: missile_turret
	Checksum: 0x61C37470
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"missile_turret", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: missile_turret
	Checksum: 0x787F9A41
	Offset: 0x108
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	bundle = getscriptbundle("killstreak_missile_turret");
	namespace_231aa29a::function_155de655(bundle);
}

