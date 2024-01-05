#namespace stats;

/*
	Name: function_d92cb558
	Namespace: stats
	Checksum: 0xEFA53735
	Offset: 0x60
	Size: 0x104
	Parameters: 2
	Flags: None
*/
function function_d92cb558(result, vararg)
{
	/#
		if(!isdefined(result))
		{
			pathstr = (ishash(vararg[0]) ? function_9e72a96(vararg[0]) : vararg[0]);
			if(!isdefined(pathstr))
			{
				return;
			}
			for(i = 1; i < vararg.size; i++)
			{
				pathstr = (pathstr + "") + (ishash(vararg[i]) ? function_9e72a96(vararg[i]) : vararg[i]);
			}
			println("" + pathstr);
		}
	#/
}

/*
	Name: get_stat
	Namespace: stats
	Checksum: 0xE7433C04
	Offset: 0x170
	Size: 0x76
	Parameters: 2
	Flags: Linked, Variadic
*/
function get_stat(localclientnum, ...)
{
	result = readstat(localclientnum, currentsessionmode(), vararg);
	/#
		function_d92cb558(result, vararg);
	#/
	if(!isdefined(result))
	{
		result = 0;
	}
	return result;
}

/*
	Name: function_842e069e
	Namespace: stats
	Checksum: 0x4EF2556C
	Offset: 0x1F0
	Size: 0x60
	Parameters: 3
	Flags: Variadic
*/
function function_842e069e(localclientnum, sessionmode, ...)
{
	result = readstat(localclientnum, sessionmode, vararg);
	/#
		function_d92cb558(result, vararg);
	#/
	return result;
}

/*
	Name: get_stat_global
	Namespace: stats
	Checksum: 0xBC809F94
	Offset: 0x258
	Size: 0x42
	Parameters: 2
	Flags: Linked
*/
function get_stat_global(localclientnum, statname)
{
	return get_stat(localclientnum, #"playerstatslist", statname, #"statvalue");
}

/*
	Name: get_match_stat
	Namespace: stats
	Checksum: 0x7F9AFB5F
	Offset: 0x2A8
	Size: 0x6E
	Parameters: 3
	Flags: Linked, Variadic
*/
function get_match_stat(localclientnum, var_648fa3eb, ...)
{
	result = readmatchstat(localclientnum, var_648fa3eb, vararg);
	/#
		function_d92cb558(result, vararg);
	#/
	if(!isdefined(result))
	{
		result = 0;
	}
	return result;
}

/*
	Name: function_7f413ae3
	Namespace: stats
	Checksum: 0xEE91FC34
	Offset: 0x320
	Size: 0x6E
	Parameters: 3
	Flags: Linked, Variadic
*/
function function_7f413ae3(localclientnum, sessionmode, ...)
{
	result = function_fd428712(localclientnum, sessionmode, vararg);
	/#
		function_d92cb558(result, vararg);
	#/
	if(!isdefined(result))
	{
		result = 0;
	}
	return result;
}

