#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace ability_gadgets;

/*
	Name: function_89f2df9
	Namespace: ability_gadgets
	Checksum: 0x22CC01B6
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"ability_gadgets", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: ability_gadgets
	Checksum: 0x275004B4
	Offset: 0x110
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::function_a8bbc967("huditems.abilityHoldToActivate", #"hud_items", #"hash_699f031de6af4f60", 1, 2, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("huditems.abilityDelayProgress", #"hud_items", #"hash_44ab75a900c80d0f", 1, 5, "float", undefined, 0, 0);
}

