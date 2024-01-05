#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using script_2f2e0161d9aace47;
#using script_341ccd78d3215071;

#namespace namespace_5c4c9a39;

/*
	Name: function_7b6ea63c
	Namespace: namespace_5c4c9a39
	Checksum: 0xA9158C92
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7b6ea63c()
{
	level notify(1349398029);
}

/*
	Name: init
	Namespace: namespace_5c4c9a39
	Checksum: 0xBAEB4741
	Offset: 0xA8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function init()
{
	zm_gold_hud::register();
	zm_gold_align_satellite_hud::register();
}

