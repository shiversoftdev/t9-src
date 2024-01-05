#namespace namespace_e4c964e8;

/*
	Name: function_c115d6ee
	Namespace: namespace_e4c964e8
	Checksum: 0x9B8D2157
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c115d6ee()
{
	level notify(-807531471);
}

/*
	Name: function_7b29177a
	Namespace: namespace_e4c964e8
	Checksum: 0x9CAFA9FF
	Offset: 0x80
	Size: 0x4E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7b29177a()
{
	var_65792f8b = function_2717b55f();
	var_fc0caf4 = var_65792f8b.var_39cc9e65;
	if(isdefined(var_fc0caf4))
	{
		return getscriptbundle(var_fc0caf4);
	}
	return undefined;
}

/*
	Name: default_value
	Namespace: namespace_e4c964e8
	Checksum: 0x74806186
	Offset: 0xD8
	Size: 0x26
	Parameters: 2
	Flags: Linked, Private
*/
function private default_value(val, def)
{
	if(isdefined(val))
	{
		return val;
	}
	return def;
}

/*
	Name: main
	Namespace: namespace_e4c964e8
	Checksum: 0x6A0068E5
	Offset: 0x108
	Size: 0x20C
	Parameters: 1
	Flags: Private, Event
*/
event private main(eventstruct)
{
	settings = function_7b29177a();
	if(isdefined(settings) && is_true(settings.var_9f40f0a7))
	{
		setdvar(#"hash_53f625ed150e7700", default_value(settings.var_6d94bb5e, 0));
		setdvar(#"hash_10fde33c9a36a9b4", default_value(settings.var_920327d8, 0));
		setdvar(#"cg_aggressivecullradius", default_value(settings.var_45fe6c24, 0));
		setdvar(#"hash_394141aabb847427", default_value(settings.var_cfe949f6, 0));
		setdvar(#"hash_72e6bad547b219c4", default_value(settings.var_8523ce94, 0));
		setdvar(#"hash_41f667b7ac4c5d0a", default_value(settings.var_8ca430ec, 0));
		setdvar(#"hash_7a38facac936bea9", default_value(settings.var_e84972d, 0));
	}
}

