#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace namespace_d2304f18;

/*
	Name: function_79eca7e9
	Namespace: namespace_d2304f18
	Checksum: 0x7E2F9290
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_79eca7e9()
{
	level notify(143568567);
}

/*
	Name: function_89f2df9
	Namespace: namespace_d2304f18
	Checksum: 0x3286E177
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_493e4f8e3fb8b3d7", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d2304f18
	Checksum: 0x8B338208
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("hero_weapon_power");
	zm_powerups::add_zombie_powerup("hero_weapon_power");
}

