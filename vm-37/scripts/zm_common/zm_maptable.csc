#using scripts\core_common\util_shared.csc;

#namespace zm_maptable;

/*
	Name: function_10672567
	Namespace: zm_maptable
	Checksum: 0x2BE1206C
	Offset: 0x68
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function function_10672567()
{
	if(!isdefined(level.maptableentry))
	{
		mapname = util::get_map_name();
		fields = getmapfields(mapname);
		level.maptableentry = fields;
	}
	return level.maptableentry;
}

/*
	Name: get_cast
	Namespace: zm_maptable
	Checksum: 0xC5289B4C
	Offset: 0xD8
	Size: 0x56
	Parameters: 0
	Flags: Linked
*/
function get_cast()
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
	Name: get_story
	Namespace: zm_maptable
	Checksum: 0xC0081DEF
	Offset: 0x138
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function get_story()
{
	var_26ea2807 = get_cast();
	if(var_26ea2807 === #"story1")
	{
		return 1;
	}
	return 2;
}

