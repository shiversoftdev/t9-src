#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace perks;

/*
	Name: function_89f2df9
	Namespace: perks
	Checksum: 0xB77D3E84
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2af3fdb587243686", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: perks
	Checksum: 0xDF749414
	Offset: 0x120
	Size: 0x114
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::function_a8bbc967("hudItems.ammoCooldowns.equipment.tactical", #"hud_items", [2:#"tactical", 1:#"equipment", 0:#"hash_2f126bd99a74de8b"], 1, 5, "float", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.ammoCooldowns.equipment.lethal", #"hud_items", [2:#"lethal", 1:#"equipment", 0:#"hash_2f126bd99a74de8b"], 1, 5, "float", undefined, 0, 0);
}

