#using script_d9b5c8b1ad38ef5;

#namespace namespace_99c84a33;

/*
	Name: function_99652b58
	Namespace: namespace_99c84a33
	Checksum: 0xCF8AD95A
	Offset: 0x78
	Size: 0xA4
	Parameters: 3
	Flags: None
*/
function function_99652b58(name, index, team)
{
	if(!isdefined(team))
	{
		team = #"none";
	}
	cameras = territory::get_ent_array(name, "targetname");
	if(cameras.size)
	{
		function_1d94550a(name, index, team, cameras[0].origin, cameras[0].angles);
		return true;
	}
	return false;
}

/*
	Name: function_67b65e2a
	Namespace: namespace_99c84a33
	Checksum: 0x2615188B
	Offset: 0x128
	Size: 0x64
	Parameters: 5
	Flags: None
*/
function function_67b65e2a(name, index, team, origin, angles)
{
	function_1d94550a(name, index, team, origin, angles);
	function_e795803(name, 1);
}

/*
	Name: function_99c84a33
	Namespace: namespace_99c84a33
	Checksum: 0xCB31E165
	Offset: 0x198
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_99c84a33(index)
{
	self.spectatorclient = -1;
	self function_eccd0b1c(index);
}

