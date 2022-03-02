#using script_327a7949550f84af;
#using script_747cc3ca88e8d5b4;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;

#namespace ultimate_turret;

/*
	Name: function_9c80ea1a
	Namespace: ultimate_turret
	Checksum: 0x4708CFE7
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9c80ea1a()
{
	level notify(1223332708);
}

/*
	Name: function_89f2df9
	Namespace: ultimate_turret
	Checksum: 0x4AD92999
	Offset: 0xC0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"ultimate_turret", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: ultimate_turret
	Checksum: 0x19AE6BCD
	Offset: 0x110
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	bundle = getscriptbundle("killstreak_ultimate_turret");
	namespace_231aa29a::function_155de655(bundle);
}

