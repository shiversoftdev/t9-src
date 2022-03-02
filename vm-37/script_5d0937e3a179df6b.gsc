#using script_35d655b3a0e4a949;
#using script_3a3d4c4130baf173;
#using script_51b0fb46d4a05f60;
#using script_6b418dbafc965acc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace concertina_wire;

/*
	Name: function_89f2df9
	Namespace: concertina_wire
	Checksum: 0xC1854C1B
	Offset: 0xC8
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
	Checksum: 0x70BE2B73
	Offset: 0x110
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared("concertina_wire_settings");
}

