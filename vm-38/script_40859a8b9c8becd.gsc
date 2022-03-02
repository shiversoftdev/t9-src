#using scripts\core_common\array_shared.gsc;

#namespace namespace_d5ac265e;

/*
	Name: function_971edce8
	Namespace: namespace_d5ac265e
	Checksum: 0x462C5088
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_971edce8()
{
	level notify(1950097701);
}

#namespace namespace_1125e192;

/*
	Name: function_93c5a24
	Namespace: namespace_1125e192
	Checksum: 0xD74C6D3B
	Offset: 0x88
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_93c5a24()
{
	if(!isdefined(level.var_f804b293))
	{
		return;
	}
	if(!getdvarint(#"hash_1429e62553e102ab", 0))
	{
		if(!is_true(getgametypesetting(#"hash_34c2c463f81af043")))
		{
			return;
		}
		if(function_21a3a673(1, 100) > level.var_15d17eb2 * 3)
		{
			return;
		}
	}
	level.var_2c56b3ec = array::random(level.var_f804b293);
	/#
		level thread function_ace23f69(level.var_2c56b3ec.origin);
	#/
}

/*
	Name: function_ace23f69
	Namespace: namespace_1125e192
	Checksum: 0x50DA46DB
	Offset: 0x188
	Size: 0x6E
	Parameters: 1
	Flags: None
*/
function function_ace23f69(v_loc)
{
	/#
		self notify("");
		self endon("");
		while(isdefined(v_loc))
		{
			sphere(v_loc, 32, (1, 0, 0), undefined, undefined, undefined, 10);
			waitframe(10);
		}
	#/
}

