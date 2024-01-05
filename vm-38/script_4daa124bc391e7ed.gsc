#namespace namespace_9bcd7d72;

/*
	Name: function_8c90c0e1
	Namespace: namespace_9bcd7d72
	Checksum: 0xFAD7B18E
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8c90c0e1()
{
	level notify(1069675574);
}

/*
	Name: function_bdda909b
	Namespace: namespace_9bcd7d72
	Checksum: 0xD770639C
	Offset: 0x80
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_bdda909b()
{
	if(sessionmodeiswarzonegame())
	{
		return;
	}
	if(getdvarint(#"hash_290a348c7affc7c", 0) == 0)
	{
		self function_330f08cc(1, 1, 0, 1, 1, 1);
	}
}

