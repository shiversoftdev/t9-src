#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace perks;

/*
	Name: function_b500a37c
	Namespace: perks
	Checksum: 0x6019C8A1
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b500a37c()
{
	level notify(180665477);
}

/*
	Name: __init__system__
	Namespace: perks
	Checksum: 0xC865259A
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2af3fdb587243686", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: perks
	Checksum: 0x582B502D
	Offset: 0x140
	Size: 0x114
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register_clientuimodel("hudItems.ammoCooldowns.equipment.tactical", #"hud_items", [2:#"tactical", 1:#"equipment", 0:#"hash_2f126bd99a74de8b"], 1, 5, "float", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.ammoCooldowns.equipment.lethal", #"hud_items", [2:#"lethal", 1:#"equipment", 0:#"hash_2f126bd99a74de8b"], 1, 5, "float", undefined, 0, 0);
}

