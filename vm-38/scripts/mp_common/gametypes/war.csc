#using script_6b50f4c9dd53e2dd;

#namespace war;

/*
	Name: function_2ebf2be9
	Namespace: war
	Checksum: 0x67258E96
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2ebf2be9()
{
	level notify(-2060293337);
}

/*
	Name: main
	Namespace: war
	Checksum: 0xD596F523
	Offset: 0x88
	Size: 0x24
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_d03f485e::init_shared(eventstruct);
}

