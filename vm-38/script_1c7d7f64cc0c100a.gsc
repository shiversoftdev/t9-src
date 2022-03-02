#using script_35d655b3a0e4a949;
#using script_51b0fb46d4a05f60;
#using script_687c5fa24f83e902;
#using script_6b418dbafc965acc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_39000839;

/*
	Name: function_c962a5a3
	Namespace: namespace_39000839
	Checksum: 0x42FCD829
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c962a5a3()
{
	level notify(291488291);
}

#namespace smart_cover;

/*
	Name: function_89f2df9
	Namespace: smart_cover
	Checksum: 0xA34D3656
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1fb0b26684caee0f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: smart_cover
	Checksum: 0x98B8C2B9
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

