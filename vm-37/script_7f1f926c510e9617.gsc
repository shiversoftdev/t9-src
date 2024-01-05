#using scripts\core_common\clientfield_shared.csc;
#using scripts\cp_common\util.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_aff1f617;

/*
	Name: function_41e5864f
	Namespace: namespace_aff1f617
	Checksum: 0xF1A12CEB
	Offset: 0x98
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_41e5864f(var_e3087505)
{
	if(!isdefined(var_e3087505))
	{
		var_e3087505 = 1;
	}
	level.var_59cd6d34 = {#first_time:1, #hash_846147d7:1, #hash_cd7d2e9f:0};
	function_77051d2b(var_e3087505);
}

/*
	Name: function_77051d2b
	Namespace: namespace_aff1f617
	Checksum: 0x17E20B0B
	Offset: 0x118
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_77051d2b(var_e3087505)
{
	if(!isdefined(var_e3087505))
	{
		var_e3087505 = 1;
	}
	function_715de8e5(var_e3087505);
	if(!isdefined(level.var_59cd6d34.var_2844be06))
	{
		level.var_59cd6d34.var_2844be06 = [];
		for(i = 1; i <= 16; i++)
		{
			if(var_e3087505)
			{
				level.var_59cd6d34.var_2844be06["district_" + i] = i - 1;
				continue;
			}
			level.var_59cd6d34.var_2844be06[i - 1] = "district_" + i;
		}
	}
}

/*
	Name: function_715de8e5
	Namespace: namespace_aff1f617
	Checksum: 0x1860C4
	Offset: 0x208
	Size: 0xEA
	Parameters: 1
	Flags: None
*/
function function_715de8e5(var_e3087505)
{
	var_e5f80f4e = getmapfields();
	if(isarray(var_e5f80f4e.var_42200354) && var_e5f80f4e.var_42200354.size > 0)
	{
		if(var_e3087505)
		{
			level.var_59cd6d34.var_2844be06 = [];
			for(i = 0; i < var_e5f80f4e.var_42200354.size; i++)
			{
				level.var_59cd6d34.var_2844be06[var_e5f80f4e.var_42200354[i]] = i;
			}
		}
		else
		{
			level.var_59cd6d34.var_2844be06 = arraycopy(var_e5f80f4e.var_42200354);
		}
	}
}

