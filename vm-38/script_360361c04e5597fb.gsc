#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace namespace_7457b8d5;

/*
	Name: function_fef07dee
	Namespace: namespace_7457b8d5
	Checksum: 0x398EFF05
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fef07dee()
{
	level notify(1633537085);
}

/*
	Name: init
	Namespace: namespace_7457b8d5
	Checksum: 0x25F0F55E
	Offset: 0xD8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	vehicle::add_vehicletype_callback("spider", &function_2503e2a);
}

/*
	Name: function_2503e2a
	Namespace: namespace_7457b8d5
	Checksum: 0xDBF83D2B
	Offset: 0x110
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2503e2a(localclientnum)
{
}

