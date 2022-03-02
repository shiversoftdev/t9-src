#using scripts\core_common\array_shared.gsc;

#namespace namespace_bec1e8ca;

/*
	Name: function_c5dda35e
	Namespace: namespace_bec1e8ca
	Checksum: 0xA858D45A
	Offset: 0x78
	Size: 0x148
	Parameters: 2
	Flags: Variadic
*/
function function_c5dda35e(category, ...)
{
	level.bctable[category] = [];
	foreach(filename in vararg)
	{
		if(isarray(filename))
		{
			foreach(file in filename)
			{
				function_b8e1addf(category, file);
			}
			continue;
		}
		function_b8e1addf(category, filename);
	}
}

/*
	Name: function_b8e1addf
	Namespace: namespace_bec1e8ca
	Checksum: 0x62AFCEDD
	Offset: 0x1C8
	Size: 0x2AE
	Parameters: 2
	Flags: None
*/
function function_b8e1addf(category, filename)
{
	row = 0;
	while(true)
	{
		var_be812f0a = tablelookupcolumnforrow(filename, row, 0);
		if(!isdefined(var_be812f0a))
		{
			return;
		}
		var_be812f0a = tolower(var_be812f0a);
		var_7e8c6c7c = tolower(tablelookupcolumnforrow(filename, row, 1));
		var_40b9a488 = tolower(tablelookupcolumnforrow(filename, row, 2));
		var_4ef5dd5c = tolower(tablelookupcolumnforrow(filename, row, 3));
		var_c605de16 = [];
		while(true)
		{
			alias = tablelookupcolumnforrow(filename, row, var_c605de16.size + 4);
			if(!isdefined(alias) || alias == "")
			{
				break;
			}
			var_c605de16[var_c605de16.size] = tolower(alias);
		}
		if(var_be812f0a == "" && var_7e8c6c7c == "" && var_c605de16.size == 0)
		{
			break;
		}
		if(var_be812f0a == "")
		{
			var_be812f0a = "all";
		}
		if(var_7e8c6c7c == "")
		{
			var_7e8c6c7c = "all";
		}
		key = categorykey(var_be812f0a, var_7e8c6c7c);
		level.bctable[category][key] = {#hash_df2220dd:var_c605de16, #delay:float(var_4ef5dd5c), #probability:float(var_40b9a488)};
		row++;
	}
}

/*
	Name: function_4e83ff35
	Namespace: namespace_bec1e8ca
	Checksum: 0x321E8DE7
	Offset: 0x480
	Size: 0x7A
	Parameters: 3
	Flags: None
*/
function function_4e83ff35(category, type, modifier)
{
	key = categorykey(type, modifier);
	if(!exists(category, type, modifier))
	{
		return 0;
	}
	return level.bctable[category][key].probability;
}

/*
	Name: function_2d2570e3
	Namespace: namespace_bec1e8ca
	Checksum: 0x9840057
	Offset: 0x508
	Size: 0x7A
	Parameters: 3
	Flags: None
*/
function function_2d2570e3(category, type, modifier)
{
	key = categorykey(type, modifier);
	if(!exists(category, type, modifier))
	{
		return 0;
	}
	return level.bctable[category][key].delay;
}

/*
	Name: function_ac3d3b19
	Namespace: namespace_bec1e8ca
	Checksum: 0x64CF7C1B
	Offset: 0x590
	Size: 0x72
	Parameters: 3
	Flags: None
*/
function function_ac3d3b19(category, type, modifier)
{
	key = categorykey(type, modifier);
	if(!exists(category, type, modifier))
	{
		return undefined;
	}
	return level.bctable[category][key].var_df2220dd;
}

/*
	Name: exists
	Namespace: namespace_bec1e8ca
	Checksum: 0x16E5204B
	Offset: 0x610
	Size: 0xC4
	Parameters: 3
	Flags: None
*/
function exists(category, type, modifier)
{
	if(!isdefined(level.bctable) || !isdefined(level.bctable[category]))
	{
		return false;
	}
	key = categorykey(type, modifier);
	if(!isstruct(level.bctable[category][key]))
	{
		return false;
	}
	if(level.bctable[category][key].var_df2220dd.size == 0)
	{
		return false;
	}
	return true;
}

/*
	Name: categorykey
	Namespace: namespace_bec1e8ca
	Checksum: 0x4CF2D950
	Offset: 0x6E0
	Size: 0x84
	Parameters: 2
	Flags: Private
*/
function private categorykey(type, modifier)
{
	if(!isdefined(type))
	{
		type = "all";
	}
	if(!isdefined(modifier))
	{
		modifier = "all";
	}
	return ((tolower("" + type)) + "_") + (tolower("" + modifier));
}

