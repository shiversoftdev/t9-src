#using scripts\abilities\gadgets\gadget_concertina_wire.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace concertina_wire;

/*
	Name: __init__system__
	Namespace: concertina_wire
	Checksum: 0x3E5AB5BA
	Offset: 0x90
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"gadget_concertina_wire", &function_70a657d8, undefined, undefined, #"weapons");
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
	function_c5f0b9e7(&onconcertinawireplaced);
}

/*
	Name: onconcertinawireplaced
	Namespace: concertina_wire
	Checksum: 0xBFA3D71
	Offset: 0x128
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function onconcertinawireplaced(concertinawire)
{
}

