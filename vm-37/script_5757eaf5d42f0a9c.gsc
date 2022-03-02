#using script_7f1f926c510e9617;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\cp_common\util.csc;

#namespace districts;

/*
	Name: function_89f2df9
	Namespace: districts
	Checksum: 0xA3223549
	Offset: 0xE0
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register("cp_districts_system", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: districts
	Checksum: 0xD70D65B8
	Offset: 0x120
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "district_bitfield", 1, 16, "int", &function_36d7ec1e, 0, 0);
	namespace_aff1f617::function_41e5864f(0);
}

/*
	Name: function_36d7ec1e
	Namespace: districts
	Checksum: 0xE1C185A1
	Offset: 0x190
	Size: 0x1D6
	Parameters: 7
	Flags: None
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
		var_45691171 = 65535 & bwastimejump;
		var_6ee67be7 = (~bwastimejump) & 65535;
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
	Checksum: 0x60D13AC2
	Offset: 0x370
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_8040a3dc(index)
{
	/#
		assert(index < 16);
	#/
	if(index >= level.var_59cd6d34.var_2844be06.size)
	{
		return undefined;
	}
	return level.var_59cd6d34.var_2844be06[index];
}

