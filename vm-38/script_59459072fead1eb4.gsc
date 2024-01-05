#using script_67049b48b589d81;
#using script_75c3996cce8959f7;
#using script_42cbbdcd1e160063;
#using script_30c7fb449869910;
#using script_771f5bff431d8d57;
#using script_3314b730521b9666;
#using script_77163d5a569e2071;
#using script_38635d174016f682;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace namespace_f6712ec9;

/*
	Name: function_24ff2783
	Namespace: namespace_f6712ec9
	Checksum: 0x6BE8BE77
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_24ff2783()
{
	level notify(2010677197);
}

/*
	Name: init
	Namespace: namespace_f6712ec9
	Checksum: 0x93A7581F
	Offset: 0x108
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_cae618b4("spawner_zombietron_crawler");
}

