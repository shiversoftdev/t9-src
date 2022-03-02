#using script_1650e0411c055aa7;
#using scripts\core_common\system_shared.gsc;

#namespace concertina_wire;

/*
	Name: function_89f2df9
	Namespace: concertina_wire
	Checksum: 0x3E5AB5BA
	Offset: 0x90
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2089d7dfe76d99c6", &function_70a657d8, undefined, undefined, #"weapons");
}

/*
	Name: function_70a657d8
	Namespace: concertina_wire
	Checksum: 0x99EA242
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared("concertina_wire_settings_wz");
	function_c5f0b9e7(&function_6230d238);
}

/*
	Name: function_6230d238
	Namespace: concertina_wire
	Checksum: 0xBFA3D71
	Offset: 0x128
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function function_6230d238(concertinawire)
{
}

