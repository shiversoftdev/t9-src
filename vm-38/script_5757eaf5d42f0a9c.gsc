#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using script_7f1f926c510e9617;
#using scripts\cp_common\util.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;

#namespace districts;

/*
	Name: function_abe33121
	Namespace: districts
	Checksum: 0xDE0F2EEB
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_abe33121()
{
	level notify(249779767);
}

/*
	Name: __init__system__
	Namespace: districts
	Checksum: 0x29B09891
	Offset: 0x100
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
	Checksum: 0x5B101172
	Offset: 0x140
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "district_bitfield", 1, 20, "int", &function_36d7ec1e, 0, 0);
	namespace_aff1f617::function_41e5864f(0);
}

/*
	Name: function_36d7ec1e
	Namespace: districts
	Checksum: 0xF92779FE
	Offset: 0x1B0
	Size: 0x1DE
	Parameters: 7
	Flags: Linked
*/
function function_36d7ec1e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!level.var_59cd6d34.first_time)
	{
		var_45691171 = (~level.var_59cd6d34.var_cd7d2e9f) & bwastimejump;
		var_6ee67be7 = (~bwastimejump) & level.var_59cd6d34.var_cd7d2e9f;
	}
	else
	{
		var_45691171 = 1048575 & bwastimejump;
		var_6ee67be7 = (~bwastimejump) & 1048575;
		level.var_59cd6d34.first_time = 0;
	}
	i = 0;
	while(var_45691171 != 0)
	{
		if(var_45691171 & 1)
		{
			name = function_8040a3dc(i);
			if(!isdefined(name))
			{
				break;
			}
			function_e8f072a1(name, 1);
		}
		var_45691171 = var_45691171 >> 1;
		i++;
	}
	i = 0;
	while(var_6ee67be7 != 0)
	{
		if(var_6ee67be7 & 1)
		{
			name = function_8040a3dc(i);
			if(!isdefined(name))
			{
				break;
			}
			function_e8f072a1(name, 0);
		}
		var_6ee67be7 = var_6ee67be7 >> 1;
		i++;
	}
	level.var_59cd6d34.var_cd7d2e9f = bwastimejump;
}

/*
	Name: function_8040a3dc
	Namespace: districts
	Checksum: 0xC30F6207
	Offset: 0x398
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_8040a3dc(index)
{
	/#
		assert(index < 20);
	#/
	if(index >= level.var_59cd6d34.var_2844be06.size)
	{
		return undefined;
	}
	return level.var_59cd6d34.var_2844be06[index];
}

