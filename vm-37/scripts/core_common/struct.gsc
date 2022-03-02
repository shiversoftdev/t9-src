#namespace struct;

/*
	Name: function_e0a8e4ba
	Namespace: struct
	Checksum: 0x66B0C3BF
	Offset: 0x138
	Size: 0x2DC
	Parameters: 1
	Flags: Linked, Private, Event
*/
event private function_e0a8e4ba(struct)
{
	foreach(k in [11:"script_string", 10:"script_label", 9:"script_linkname", 8:"linkname", 7:"linkto", 6:"script_noteworthy", 5:"classname", 4:"groupname", 3:"variantname", 2:"scriptbundlename", 1:"target", 0:"targetname"])
	{
		if(!isdefined(level.var_41204f29))
		{
			level.var_41204f29 = [];
		}
		else if(!isarray(level.var_41204f29))
		{
			level.var_41204f29 = array(level.var_41204f29);
		}
		if(!isinarray(level.var_41204f29, tolower(k)))
		{
			level.var_41204f29[level.var_41204f29.size] = tolower(k);
		}
	}
	level.var_5e990e96 = arraycopy(level.var_41204f29);
	if(isdefined(level.struct))
	{
		temp = arraycopy(level.struct);
		level.struct = [];
		foreach(struct in temp)
		{
			init(struct);
		}
	}
	function_6c07201b("CreateStruct", &function_e0a8e4ba);
}

/*
	Name: init
	Namespace: struct
	Checksum: 0x8BEC238E
	Offset: 0x420
	Size: 0x228
	Parameters: 1
	Flags: Linked, Event
*/
event init(s)
{
	foreach(k in [])
	{
		v = s.(k);
		if(isdefined(v))
		{
			if(!isdefined(level.var_657bb3b3[k][v]))
			{
				level.var_657bb3b3[k][v] = [];
			}
			else if(!isarray(level.var_657bb3b3[k][v]))
			{
				level.var_657bb3b3[k][v] = array(level.var_657bb3b3[k][v]);
			}
			if(!isinarray(level.var_657bb3b3[k][v], s))
			{
				level.var_657bb3b3[k][v][level.var_657bb3b3[k][v].size] = s;
			}
		}
	}
	if(!isdefined(level.struct))
	{
		level.struct = [];
	}
	else if(!isarray(level.struct))
	{
		level.struct = array(level.struct);
	}
	if(!isinarray(level.struct, s))
	{
		level.struct[level.struct.size] = s;
	}
}

/*
	Name: _cache
	Namespace: struct
	Checksum: 0x30AF0A30
	Offset: 0x650
	Size: 0x16A
	Parameters: 2
	Flags: Linked, Private
*/
function private _cache(k, v)
{
	/#
		/#
			assert(isdefined(k), "");
		#/
		print(("" + k) + "");
	#/
	if(!isdefined(level.var_5e990e96))
	{
		level.var_5e990e96 = [];
	}
	else if(!isarray(level.var_5e990e96))
	{
		level.var_5e990e96 = array(level.var_5e990e96);
	}
	if(!isinarray(level.var_5e990e96, tolower(k)))
	{
		level.var_5e990e96[level.var_5e990e96.size] = tolower(k);
	}
	level.var_657bb3b3[k][v] = function_7b8e26b3((isdefined(level.struct) ? level.struct : []), v, k);
}

/*
	Name: set
	Namespace: struct
	Checksum: 0x7E4DF143
	Offset: 0x7C8
	Size: 0x190
	Parameters: 2
	Flags: None
*/
function set(str_key, str_value)
{
	v = self.(str_key);
	if(isdefined(v))
	{
		if(isdefined(level.var_657bb3b3[str_key][v]))
		{
			arrayremovevalue(level.var_657bb3b3[str_key][v], self);
		}
	}
	self.(str_key) = str_value;
	if(isdefined(level.var_657bb3b3[str_key][str_value]) || isinarray(level.var_e019c0d3, str_key))
	{
		if(!isdefined(level.var_657bb3b3[str_key][str_value]))
		{
			level.var_657bb3b3[str_key][str_value] = [];
		}
		else if(!isarray(level.var_657bb3b3[str_key][str_value]))
		{
			level.var_657bb3b3[str_key][str_value] = array(level.var_657bb3b3[str_key][str_value]);
		}
		if(!isinarray(level.var_657bb3b3[str_key][str_value], self))
		{
			level.var_657bb3b3[str_key][str_value][level.var_657bb3b3[str_key][str_value].size] = self;
		}
	}
}

/*
	Name: get
	Namespace: struct
	Checksum: 0xA9991071
	Offset: 0x960
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function get(str_value, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	a_result = get_array(str_value, str_key);
	/#
		/#
			loc_000009D4:
			assert(a_result.size < 2, (("" + (isdefined(str_key) ? "" + str_key : "")) + "") + (isdefined(str_value) ? "" + str_value : "") + "");
		#/
	#/
	return (a_result.size > 0 ? a_result[0] : undefined);
}

/*
	Name: get_array
	Namespace: struct
	Checksum: 0xEDEFFFC8
	Offset: 0xA48
	Size: 0xEE
	Parameters: 2
	Flags: Linked
*/
function get_array(str_value, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(isdefined(str_value))
	{
		if(!isdefined(level.var_41204f29) || !isinarray(level.var_41204f29, tolower(str_key)))
		{
			if(!isdefined(level.var_657bb3b3[str_key][str_value]))
			{
				_cache(str_key, str_value);
			}
		}
		return arraycopy((isdefined(level.var_657bb3b3[str_key][str_value]) ? level.var_657bb3b3[str_key][str_value] : []));
	}
	return [];
}

/*
	Name: spawn
	Namespace: struct
	Checksum: 0xF074B778
	Offset: 0xB40
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function spawn(v_origin, v_angles)
{
	if(!isdefined(v_origin))
	{
		v_origin = (0, 0, 0);
	}
	s = {#angles:v_angles, #origin:v_origin};
	return s;
}

/*
	Name: delete
	Namespace: struct
	Checksum: 0x47CF88D3
	Offset: 0xBA8
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function delete()
{
	self notify(#"death");
	foreach(str_key in level.var_5e990e96)
	{
		value = self.(str_key);
		if(isdefined(value))
		{
			if(isdefined(level.var_657bb3b3[str_key][value]))
			{
				arrayremovevalue(level.var_657bb3b3[str_key][value], self);
			}
		}
	}
	if(isarray(level.struct))
	{
		arrayremovevalue(level.struct, self);
	}
}

/*
	Name: get_script_bundle_instances
	Namespace: struct
	Checksum: 0x8DB7C1D8
	Offset: 0xCD0
	Size: 0xD2
	Parameters: 2
	Flags: Linked
*/
function get_script_bundle_instances(str_type, kvp)
{
	a_instances = get_array("scriptbundle_" + str_type, "classname");
	if(a_instances.size > 0 && isdefined(kvp))
	{
		if(isarray(kvp))
		{
			str_value = kvp[0];
			str_key = kvp[1];
		}
		else
		{
			str_value = kvp;
			str_key = "scriptbundlename";
		}
		a_instances = function_7b8e26b3(a_instances, str_value, str_key);
	}
	return a_instances;
}

/*
	Name: findstruct
	Namespace: struct
	Checksum: 0xA6CA4E4F
	Offset: 0xDB0
	Size: 0x1EE
	Parameters: 3
	Flags: Event
*/
event findstruct(param1, name, index)
{
	level.var_875f0835 = undefined;
	if(isvec(param1) || isdefined(param1.position))
	{
		position = (0, 0, 0);
		if(isvec(param1))
		{
			position = param1;
		}
		else
		{
			if(isdefined(param1.position))
			{
				position = param1.position;
			}
			else
			{
				return;
			}
		}
		if(isdefined(level.struct))
		{
			foreach(struct in level.struct)
			{
				if(distancesquared(struct.origin, position) < 1)
				{
					level.var_875f0835 = struct;
					return;
				}
			}
		}
	}
	else
	{
		s = get(param1);
		if(isdefined(s))
		{
			return s;
		}
		s = getscriptbundle(name);
		if(isdefined(s))
		{
			if(index < 0)
			{
				level.var_875f0835 = s;
				return;
			}
			if(isdefined(s.objects))
			{
				level.var_875f0835 = s.objects[index];
				return;
			}
		}
	}
}

