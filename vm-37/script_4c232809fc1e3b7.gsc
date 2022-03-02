#using script_3a3d4c4130baf173;
#using scripts\core_common\system_shared.csc;

#namespace concertina_wire;

/*
	Name: function_89f2df9
	Namespace: concertina_wire
	Checksum: 0x277FE1C1
	Offset: 0x90
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
	Checksum: 0x621833A2
	Offset: 0xD8
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared("concertina_wire_settings_wz");
}

