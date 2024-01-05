#using scripts\core_common\math_shared.gsc;
#using script_35ae72be7b4fec10;

#namespace namespace_c8e236da;

/*
	Name: function_ebf737f8
	Namespace: namespace_c8e236da
	Checksum: 0x4CC33CDB
	Offset: 0x80
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function function_ebf737f8(var_e11b5b56)
{
	if(!isdefined(level.var_f9c1d7d5))
	{
		level.var_f9c1d7d5 = [];
	}
	level.var_f9c1d7d5[level.var_f9c1d7d5.size] = var_e11b5b56;
	if(!namespace_61e6d095::exists(#"hash_72cc4740fa4d3da3"))
	{
		namespace_61e6d095::create(#"hash_72cc4740fa4d3da3", #"hash_33da613c2715b7bb");
		namespace_61e6d095::function_46df0bc7(#"hash_72cc4740fa4d3da3", 999);
		namespace_61e6d095::function_d3c3e5c3(#"hash_72cc4740fa4d3da3", [2:#"computer", 1:#"dialog_tree", 0:#"hash_ee64d6a280a2e42"]);
	}
	namespace_61e6d095::function_9ade1d9b(#"hash_72cc4740fa4d3da3", #"hash_732287e2565c2a79", 1, 1);
	namespace_61e6d095::function_f2a9266(#"hash_72cc4740fa4d3da3", level.var_f9c1d7d5.size, "ContentLine", var_e11b5b56, undefined, 1);
}

/*
	Name: function_abdf062
	Namespace: namespace_c8e236da
	Checksum: 0x7DC7AEDE
	Offset: 0x220
	Size: 0xCC
	Parameters: 2
	Flags: None
*/
function function_abdf062(var_5a95d718, var_144abf82)
{
	var_5a95d718 = math::clamp(var_5a95d718, 0, level.var_f9c1d7d5.size - 1);
	arrayinsert(level.var_f9c1d7d5, var_144abf82, var_5a95d718);
	for(i = var_5a95d718; i < level.var_f9c1d7d5.size; i++)
	{
		namespace_61e6d095::function_f2a9266(#"hash_72cc4740fa4d3da3", i + 1, "ContentLine", level.var_f9c1d7d5[i], undefined, 1);
	}
}

/*
	Name: function_bf642b41
	Namespace: namespace_c8e236da
	Checksum: 0xCFFED954
	Offset: 0x2F8
	Size: 0x9C
	Parameters: 2
	Flags: None
*/
function function_bf642b41(var_88e62a80, var_6262df45)
{
	if(isdefined(var_6262df45))
	{
		namespace_61e6d095::function_f2a9266(#"hash_72cc4740fa4d3da3", var_88e62a80 + 1, "ContentLine", var_6262df45);
	}
	else
	{
		namespace_61e6d095::function_7239e030(#"hash_72cc4740fa4d3da3", var_88e62a80 + 1);
		arrayremoveindex(level.var_f9c1d7d5, var_88e62a80);
	}
}

/*
	Name: function_295a2a9e
	Namespace: namespace_c8e236da
	Checksum: 0x8E8751E7
	Offset: 0x3A0
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function function_295a2a9e(var_e11b5b56)
{
	if(!isdefined(level.var_f9c1d7d5))
	{
		return 0;
	}
	return isinarray(level.var_f9c1d7d5, var_e11b5b56);
}

/*
	Name: function_f7362969
	Namespace: namespace_c8e236da
	Checksum: 0xBD85BCCA
	Offset: 0x3E8
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function function_f7362969(var_a5a2c782, var_541423e6)
{
	if(!isdefined(var_541423e6))
	{
		var_541423e6 = 1;
	}
	if(namespace_61e6d095::exists(#"hash_72cc4740fa4d3da3"))
	{
		if(var_541423e6)
		{
			namespace_61e6d095::function_df0d7a85(var_a5a2c782, #"hash_72cc4740fa4d3da3");
		}
		else
		{
			namespace_61e6d095::function_f96376c5(var_a5a2c782);
		}
	}
}

/*
	Name: function_f3aa3e7c
	Namespace: namespace_c8e236da
	Checksum: 0x9D637102
	Offset: 0x478
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function function_f3aa3e7c()
{
	if(namespace_61e6d095::exists(#"hash_72cc4740fa4d3da3"))
	{
		if(level.var_f9c1d7d5.size > 0)
		{
			for(i = 1; i < level.var_f9c1d7d5.size + 1; i++)
			{
				namespace_61e6d095::function_f2a9266(#"hash_72cc4740fa4d3da3", i, "ContentLine", #"");
			}
		}
	}
}

/*
	Name: function_c27f93d5
	Namespace: namespace_c8e236da
	Checksum: 0x3A86556D
	Offset: 0x520
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_c27f93d5()
{
	function_f3aa3e7c();
	if(namespace_61e6d095::exists(#"hash_72cc4740fa4d3da3"))
	{
		level.var_f9c1d7d5 = undefined;
		namespace_61e6d095::remove(#"hash_72cc4740fa4d3da3");
	}
}

