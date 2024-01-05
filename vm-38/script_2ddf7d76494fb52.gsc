#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_297ae820;

/*
	Name: function_72fcbeb7
	Namespace: namespace_297ae820
	Checksum: 0x65F1EFF0
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_72fcbeb7()
{
	level notify(-2099748101);
}

/*
	Name: init
	Namespace: namespace_297ae820
	Checksum: 0x7A179F42
	Offset: 0xB0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "" + #"hash_658f225a02b95617", 28000, 1, "int");
	clientfield::register("world", "" + #"hash_5e34e1c50fd13b32", 28000, 1, "int");
	clientfield::register("world", "" + #"dark_aether_light_on", 28000, 1, "int");
}

/*
	Name: function_3528419f
	Namespace: namespace_297ae820
	Checksum: 0xAEBE289D
	Offset: 0x180
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_3528419f(state)
{
	level endon(#"end_game");
	level clientfield::set("" + #"hash_658f225a02b95617", state);
}

