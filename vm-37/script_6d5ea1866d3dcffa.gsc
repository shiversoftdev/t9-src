#using script_71b355b2496e3c6d;
#using scripts\core_common\system_shared.csc;

#namespace namespace_5a359049;

/*
	Name: function_89f2df9
	Namespace: namespace_5a359049
	Checksum: 0x8258FEA5
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_695bd4a240716800", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_5a359049
	Checksum: 0xCB283418
	Offset: 0xF8
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(is_true(level.legacy_cymbal_monkey))
	{
		level.cymbal_monkey_model = "weapon_zombie_monkey_bomb";
	}
	else
	{
		level.cymbal_monkey_model = "wpn_t7_zmb_monkey_bomb_world";
	}
	namespace_cc411409::function_70a657d8();
}

