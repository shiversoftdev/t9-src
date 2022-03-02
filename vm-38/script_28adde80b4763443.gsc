#using script_1650e0411c055aa7;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_33994c00;

/*
	Name: function_864dc315
	Namespace: namespace_33994c00
	Checksum: 0xC9B00CCB
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_864dc315()
{
	level notify(1271205832);
}

#namespace concertina_wire;

/*
	Name: function_89f2df9
	Namespace: concertina_wire
	Checksum: 0x1D2866D6
	Offset: 0xB0
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
	Checksum: 0xAF3AEE0
	Offset: 0x100
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
	Checksum: 0x7E384DB9
	Offset: 0x148
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function function_6230d238(concertinawire)
{
}

