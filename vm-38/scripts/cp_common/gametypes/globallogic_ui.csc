#using script_1efc4309c8526a4;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace globallogic_ui;

/*
	Name: function_474556cb
	Namespace: globallogic_ui
	Checksum: 0xD673A68A
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_474556cb()
{
	level notify(748245227);
}

/*
	Name: function_89f2df9
	Namespace: globallogic_ui
	Checksum: 0x8AA35B0D
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"globallogic_ui", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: globallogic_ui
	Checksum: 0x3F61D04D
	Offset: 0x120
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::function_a8bbc967("hudItems.playerInCombat", #"hud_items", #"playerincombat", 1, 1, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.serverDifficulty", #"hud_items", #"serverdifficulty", 1, 3, "int", undefined, 0, 0);
	function_11bcbb57();
}

/*
	Name: function_11bcbb57
	Namespace: globallogic_ui
	Checksum: 0x820EA654
	Offset: 0x1E0
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_11bcbb57()
{
	cp_chyron::register();
}

