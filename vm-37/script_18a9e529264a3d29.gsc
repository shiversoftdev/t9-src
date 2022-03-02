#using scripts\core_common\util_shared.csc;

#namespace namespace_cb7cafc3;

/*
	Name: function_10672567
	Namespace: namespace_cb7cafc3
	Checksum: 0x2BE1206C
	Offset: 0x68
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
	Checksum: 0xC5289B4C
	Offset: 0xD8
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
	Checksum: 0xC0081DEF
	Offset: 0x138
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

