#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using script_1fa63e6c62e170a3;
#using scripts\cp_common\util.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace districts;

/*
	Name: function_d210411b
	Namespace: districts
	Checksum: 0xA583B737
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d210411b()
{
	level notify(473123126);
}

/*
	Name: __init__system__
	Namespace: districts
	Checksum: 0x29B09891
	Offset: 0xF8
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
	Checksum: 0x2FF4A8B
	Offset: 0x138
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "district_bitfield", 1, 20, "int");
	namespace_aff1f617::function_41e5864f();
}

/*
	Name: function_a7d79fcb
	Namespace: districts
	Checksum: 0xF3080150
	Offset: 0x188
	Size: 0x154
	Parameters: 2
	Flags: Linked
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
	Checksum: 0xED81BA20
	Offset: 0x2E8
	Size: 0x16C
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
		var_8f63b4bd = 1048575;
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
	Checksum: 0xCA8EC559
	Offset: 0x460
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
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
	Checksum: 0x8CDCBEFE
	Offset: 0x4B0
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1e34097d(var_8f63b4bd)
{
	/#
		assert(var_8f63b4bd < 1048576);
	#/
	level.var_59cd6d34.var_cd7d2e9f = var_8f63b4bd;
	level clientfield::set("district_bitfield", level.var_59cd6d34.var_cd7d2e9f);
}

