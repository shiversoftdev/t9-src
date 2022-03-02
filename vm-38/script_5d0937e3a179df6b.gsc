#using script_35d655b3a0e4a949;
#using script_3a3d4c4130baf173;
#using script_51b0fb46d4a05f60;
#using script_6b418dbafc965acc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_33994c00;

/*
	Name: function_21e07205
	Namespace: namespace_33994c00
	Checksum: 0x539C9CF3
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_21e07205()
{
	level notify(1281805411);
}

#namespace concertina_wire;

/*
	Name: function_89f2df9
	Namespace: concertina_wire
	Checksum: 0x69EB9160
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2089d7dfe76d99c6", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: concertina_wire
	Checksum: 0x34CEA211
	Offset: 0x130
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared("concertina_wire_settings");
}

