#using scripts\abilities\gadgets\gadget_concertina_wire.csc;
#using scripts\core_common\system_shared.csc;

#namespace gadget_concertina_wire;

/*
	Name: function_14db743e
	Namespace: gadget_concertina_wire
	Checksum: 0xD64155E3
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_14db743e()
{
	level notify(-221766805);
}

#namespace concertina_wire;

/*
	Name: __init__system__
	Namespace: concertina_wire
	Checksum: 0x25357ED7
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"gadget_concertina_wire", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: concertina_wire
	Checksum: 0xD6BCF011
	Offset: 0xF8
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared("concertina_wire_settings_wz");
}

