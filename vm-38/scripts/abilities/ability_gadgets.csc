#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace ability_gadgets;

/*
	Name: function_87675b0a
	Namespace: ability_gadgets
	Checksum: 0x848B590C
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_87675b0a()
{
	level notify(1563236124);
}

/*
	Name: __init__system__
	Namespace: ability_gadgets
	Checksum: 0xAC77A6ED
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"ability_gadgets", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: ability_gadgets
	Checksum: 0x1D1A219A
	Offset: 0x130
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register_clientuimodel("huditems.abilityHoldToActivate", #"hud_items", #"hash_699f031de6af4f60", 1, 2, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("huditems.abilityDelayProgress", #"hud_items", #"hash_44ab75a900c80d0f", 1, 5, "float", undefined, 0, 0);
}

