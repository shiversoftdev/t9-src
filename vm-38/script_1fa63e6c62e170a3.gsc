#using scripts\core_common\clientfield_shared.gsc;
#using scripts\cp_common\util.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_9426656f;

/*
	Name: function_7cb4d8c9
	Namespace: namespace_9426656f
	Checksum: 0x9D464A62
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7cb4d8c9()
{
	level notify(53502575);
}

#namespace namespace_aff1f617;

/*
	Name: function_41e5864f
	Namespace: namespace_aff1f617
	Checksum: 0xCA93948A
	Offset: 0xB8
	Size: 0x74
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x75E8F4B7
	Offset: 0x138
	Size: 0xE4
	Parameters: 1
	Flags: Linked
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
		for(i = 1; i <= 20; i++)
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
	Checksum: 0xA9FEF899
	Offset: 0x228
	Size: 0xEA
	Parameters: 1
	Flags: Linked
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

