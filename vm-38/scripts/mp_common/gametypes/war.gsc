#using script_4acb48c9cb82bb51;

#namespace war;

/*
	Name: function_e38cd0b9
	Namespace: war
	Checksum: 0x7167F21C
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e38cd0b9()
{
	level notify(1075204026);
}

/*
	Name: main
	Namespace: war
	Checksum: 0x2112924C
	Offset: 0x88
	Size: 0x34
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_d03f485e::function_dc5b7ee6();
	level.onstartgametype = &onstartgametype;
}

/*
	Name: onstartgametype
	Namespace: war
	Checksum: 0x71157430
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	namespace_d03f485e::function_1804ad1c();
}

