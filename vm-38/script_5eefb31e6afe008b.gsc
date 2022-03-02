#namespace namespace_4a5bc380;

/*
	Name: function_5e556b07
	Namespace: namespace_4a5bc380
	Checksum: 0xA2EB9E38
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5e556b07()
{
	level notify(246355297);
}

#namespace ping;

/*
	Name: function_fed6948
	Namespace: ping
	Checksum: 0x97207B44
	Offset: 0x80
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_fed6948(type)
{
	switch(type)
	{
		case 3:
		case 6:
		case 7:
		case 11:
		{
			return -1;
		}
		case 1:
		case 2:
		case 10:
		{
			return -2;
		}
	}
	return undefined;
}

/*
	Name: function_5947d757
	Namespace: ping
	Checksum: 0x5AFD7302
	Offset: 0x128
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_5947d757(type)
{
	return (isdefined(function_fed6948(type)) ? function_fed6948(type) : type);
}

/*
	Name: function_44806bba
	Namespace: ping
	Checksum: 0xF3F2E725
	Offset: 0x178
	Size: 0x208
	Parameters: 1
	Flags: Linked
*/
function function_44806bba(type)
{
	pool = function_5947d757(type);
	if(pool == -1)
	{
		return getdvarint(#"hash_135ab15dc980084b", 2);
	}
	if(pool == -2)
	{
		return getdvarint(#"hash_5ef51cd5a0446de9", 2);
	}
	if(pool == 0)
	{
		return getdvarint(#"hash_4b0a67e50aeacdee", 1);
	}
	if(pool == 4)
	{
		return getdvarint(#"hash_4685d89a104a6860", 1);
	}
	if(pool == 5)
	{
		return getdvarint(#"hash_60e62eecbe40e4ee", 1);
	}
	if(pool == 8 || pool == 9)
	{
		return getdvarint(#"hash_37085d816592dbe3", 2);
	}
	if(pool == 12)
	{
		return getdvarint(#"hash_37085d816592dbe3", 2);
	}
	/#
		assertmsg(((("" + type) + "") + pool) + "");
	#/
	return 1;
}

