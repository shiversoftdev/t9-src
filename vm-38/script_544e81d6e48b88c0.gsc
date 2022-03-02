#using script_19c6c147c637b960;

#namespace namespace_99c84a33;

/*
	Name: function_1c09445f
	Namespace: namespace_99c84a33
	Checksum: 0xF0AA75E9
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1c09445f()
{
	level notify(1648061372);
}

/*
	Name: function_99652b58
	Namespace: namespace_99c84a33
	Checksum: 0x722B41BC
	Offset: 0x98
	Size: 0x8C
	Parameters: 3
	Flags: None
*/
function function_99652b58(name, index, team)
{
	cameras = getentarray(0, index, "targetname");
	if(cameras.size)
	{
		function_1d94550a(index, team, #"none", cameras[0].origin, cameras[0].angles);
	}
}

/*
	Name: function_bb3bbc2c
	Namespace: namespace_99c84a33
	Checksum: 0xA61F3592
	Offset: 0x130
	Size: 0x8C
	Parameters: 3
	Flags: Linked
*/
function function_bb3bbc2c(name, index, team)
{
	cameras = territory::get_struct_array(index, "targetname");
	if(cameras.size)
	{
		function_1d94550a(index, team, #"none", cameras[0].origin, cameras[0].angles);
	}
}

