#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using script_1fa63e6c62e170a3;
#using scripts\cp_common\util.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace districts;

/*
	Name: __init__system__
	Namespace: districts
	Checksum: 0xA3223549
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register("cp_districts_system", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: districts
	Checksum: 0x7F930C1
	Offset: 0x118
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "district_bitfield", 1, 16, "int");
	namespace_aff1f617::function_41e5864f();
}

/*
	Name: function_a7d79fcb
	Namespace: districts
	Checksum: 0x83115639
	Offset: 0x168
	Size: 0x154
	Parameters: 2
	Flags: None
*/
function function_a7d79fcb(names, exclusive)
{
	if(!isdefined(exclusive))
	{
		exclusive = 0;
	}
	if(!isdefined(names))
	{
		names = [];
	}
	else if(!isarray(names))
	{
		names = array(names);
	}
	var_8f63b4bd = level.var_59cd6d34.var_cd7d2e9f;
	if(exclusive)
	{
		var_8f63b4bd = 0;
	}
	foreach(name in names)
	{
		bit = function_da432d39(name);
		if(bit >= 0)
		{
			var_8f63b4bd = var_8f63b4bd | (1 << bit);
		}
	}
	level function_1e34097d(var_8f63b4bd);
}

/*
	Name: function_930f8c81
	Namespace: districts
	Checksum: 0x958311CF
	Offset: 0x2C8
	Size: 0x164
	Parameters: 2
	Flags: None
*/
function function_930f8c81(names, exclusive)
{
	if(!isdefined(exclusive))
	{
		exclusive = 0;
	}
	if(!isdefined(names))
	{
		names = [];
	}
	else if(!isarray(names))
	{
		names = array(names);
	}
	var_8f63b4bd = level.var_59cd6d34.var_cd7d2e9f;
	if(exclusive)
	{
		var_8f63b4bd = 65535;
	}
	foreach(name in names)
	{
		bit = function_da432d39(name);
		if(bit >= 0)
		{
			mask = ~(1 << bit);
			var_8f63b4bd = var_8f63b4bd & mask;
		}
	}
	level function_1e34097d(var_8f63b4bd);
}

/*
	Name: function_da432d39
	Namespace: districts
	Checksum: 0x53451037
	Offset: 0x438
	Size: 0x42
	Parameters: 1
	Flags: Private
*/
function private function_da432d39(name)
{
	index = level.var_59cd6d34.var_2844be06[name];
	if(isdefined(index))
	{
		return index;
	}
	return -1;
}

/*
	Name: function_1e34097d
	Namespace: districts
	Checksum: 0xA1A5FF14
	Offset: 0x488
	Size: 0x74
	Parameters: 1
	Flags: Private
*/
function private function_1e34097d(var_8f63b4bd)
{
	/#
		assert(var_8f63b4bd < 65536);
	#/
	level.var_59cd6d34.var_cd7d2e9f = var_8f63b4bd;
	level clientfield::set("district_bitfield", level.var_59cd6d34.var_cd7d2e9f);
}

