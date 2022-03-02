#using script_4acb48c9cb82bb51;

#namespace war;

/*
	Name: main
	Namespace: war
	Checksum: 0xFA862692
	Offset: 0x68
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
	Checksum: 0xB8F7E490
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	namespace_d03f485e::function_1804ad1c();
}

