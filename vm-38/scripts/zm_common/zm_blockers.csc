#using scripts\zm_common\zm_weapons.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_blockers;

/*
	Name: function_710180b0
	Namespace: zm_blockers
	Checksum: 0xE4556B8E
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_710180b0()
{
	level notify(1886235586);
}

/*
	Name: __init__system__
	Namespace: zm_blockers
	Checksum: 0x6994554A
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_blockers", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_blockers
	Checksum: 0x80F724D1
	Offset: 0x110
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_8ac3bea9
	Namespace: zm_blockers
	Checksum: 0x80F724D1
	Offset: 0x120
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
}

