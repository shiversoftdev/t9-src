#using script_3469488e46c579c6;
#using script_8988fdbc78d6c53;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_player.gsc;

#namespace ballistic_knife;

/*
	Name: function_5c4cf873
	Namespace: ballistic_knife
	Checksum: 0x8763366
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5c4cf873()
{
	level notify(148163740);
}

/*
	Name: function_89f2df9
	Namespace: ballistic_knife
	Checksum: 0x8D2DD6D3
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"ballistic_knife", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: ballistic_knife
	Checksum: 0x98B8C2B9
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

