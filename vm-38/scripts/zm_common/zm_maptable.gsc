#using scripts\core_common\util_shared.gsc;

#namespace zm_maptable;

/*
	Name: function_a31ad465
	Namespace: zm_maptable
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
	Namespace: zm_maptable
	Checksum: 0xFFD8948A
	Offset: 0x88
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
	Checksum: 0xF05A6F18
	Offset: 0xF8
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
	Checksum: 0x3360542
	Offset: 0x158
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

