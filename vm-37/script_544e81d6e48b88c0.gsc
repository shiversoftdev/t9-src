#using script_19c6c147c637b960;

#namespace namespace_99c84a33;

/*
	Name: function_99652b58
	Namespace: namespace_99c84a33
	Checksum: 0x756D7C74
	Offset: 0x78
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
	Checksum: 0xD0855BAA
	Offset: 0x110
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

