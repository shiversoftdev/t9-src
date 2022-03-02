#using scripts\core_common\util_shared.gsc;

#namespace namespace_cb7cafc3;

/*
	Name: function_a31ad465
	Namespace: namespace_cb7cafc3
	Checksum: 0xCAC1F646
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a31ad465()
{
	level notify(17036055);
}

/*
	Name: function_10672567
	Namespace: namespace_cb7cafc3
	Checksum: 0xFFD8948A
	Offset: 0x88
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function function_10672567()
{
	if(!isdefined(level.var_4ada4f1f))
	{
		mapname = util::function_53bbf9d2();
		fields = getmapfields(mapname);
		level.var_4ada4f1f = fields;
	}
	return level.var_4ada4f1f;
}

/*
	Name: function_90500af5
	Namespace: namespace_cb7cafc3
	Checksum: 0xF05A6F18
	Offset: 0xF8
	Size: 0x56
	Parameters: 0
	Flags: Linked
*/
function function_90500af5()
{
	cast = #"other";
	fields = function_10672567();
	if(isdefined(fields))
	{
		cast = fields.cast;
	}
	return cast;
}

/*
	Name: function_166646a6
	Namespace: namespace_cb7cafc3
	Checksum: 0x3360542
	Offset: 0x158
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function function_166646a6()
{
	var_26ea2807 = function_90500af5();
	if(var_26ea2807 === #"hash_517389c0ae1875f9")
	{
		return 1;
	}
	return 2;
}

