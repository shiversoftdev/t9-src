#using scripts\core_common\array_shared.gsc;

#namespace namespace_679a22ba;

/*
	Name: function_3ba2f5dd
	Namespace: namespace_679a22ba
	Checksum: 0x91E3711D
	Offset: 0x68
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function function_3ba2f5dd(var_693839ad, var_bc631e23)
{
	if(!isdefined(level.var_ce15b8c9))
	{
		level.var_ce15b8c9 = [];
	}
	level.var_ce15b8c9[var_693839ad] = var_bc631e23;
}

/*
	Name: function_77be8a83
	Namespace: namespace_679a22ba
	Checksum: 0x2AA7B0CA
	Offset: 0xB0
	Size: 0x1EC
	Parameters: 1
	Flags: Linked
*/
function function_77be8a83(var_e98de867)
{
	/#
		assert(isdefined(var_e98de867), "");
	#/
	bundle = getscriptbundle(var_e98de867);
	/#
		assert(isdefined(bundle), "" + (ishash(var_e98de867) ? function_9e72a96(var_e98de867) : var_e98de867));
	#/
	var_89592ba7 = {#hash_b0abb10e:(isdefined(bundle.var_d961aeb3) ? bundle.var_d961aeb3 : 0), #hash_7c88c117:[]};
	foreach(var_c1d870ac in bundle.ailist)
	{
		var_89592ba7.var_7c88c117[index] = {#hash_cffbc08:var_c1d870ac.var_a949845f, #spawned:0, #name:(isdefined(level.var_ce15b8c9[var_c1d870ac.var_37d9fb07]) ? level.var_ce15b8c9[var_c1d870ac.var_37d9fb07] : var_c1d870ac.var_37d9fb07)};
	}
	return var_89592ba7;
}

/*
	Name: function_ca209564
	Namespace: namespace_679a22ba
	Checksum: 0xAC36D0D9
	Offset: 0x2A8
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_ca209564(var_e98de867, var_ddb02c2b)
{
	/#
		assert(isdefined(var_e98de867), "");
	#/
	if(isdefined(var_e98de867))
	{
		var_3561dd4b = getscriptbundle(var_e98de867);
		/#
			assert(isdefined(var_3561dd4b), "" + (ishash(var_e98de867) ? function_9e72a96(var_e98de867) : var_e98de867));
		#/
		if(isdefined(var_ddb02c2b))
		{
			return function_15541865(var_3561dd4b.ailist, var_ddb02c2b.var_7c88c117, 1, var_ddb02c2b.var_b0abb10e);
		}
		return function_15541865(var_3561dd4b.ailist, [], 0);
	}
}

/*
	Name: function_3e7317ca
	Namespace: namespace_679a22ba
	Checksum: 0x5B994AA6
	Offset: 0x3C0
	Size: 0xD0
	Parameters: 1
	Flags: None
*/
function function_3e7317ca(var_e98de867)
{
	/#
		assert(isdefined(var_e98de867), "");
	#/
	var_3561dd4b = getscriptbundle(var_e98de867);
	/#
		assert(isdefined(var_3561dd4b), "" + (ishash(var_e98de867) ? function_9e72a96(var_e98de867) : var_e98de867));
	#/
	var_29556c1a = [];
	function_cbafbbab(var_3561dd4b.ailist, var_29556c1a);
	return var_29556c1a;
}

/*
	Name: function_266ee075
	Namespace: namespace_679a22ba
	Checksum: 0xC5509959
	Offset: 0x498
	Size: 0xE8
	Parameters: 2
	Flags: Linked
*/
function function_266ee075(var_8452bcb9, var_ddb02c2b)
{
	foreach(entry in var_ddb02c2b.var_7c88c117)
	{
		var_cffbc08 = function_b9ea4226(entry.var_cffbc08, var_ddb02c2b.var_b0abb10e);
		if(entry.name === var_8452bcb9 && (var_cffbc08 - entry.spawned) > 0)
		{
			entry.spawned++;
			break;
		}
	}
}

/*
	Name: function_898aced0
	Namespace: namespace_679a22ba
	Checksum: 0x5C0D9F42
	Offset: 0x588
	Size: 0xBC
	Parameters: 2
	Flags: None
*/
function function_898aced0(var_8452bcb9, var_ddb02c2b)
{
	foreach(entry in var_ddb02c2b.var_7c88c117)
	{
		if(entry.name === var_8452bcb9 && entry.var_cffbc08 > 0)
		{
			entry.spawned--;
			break;
		}
	}
}

/*
	Name: function_ce65eab6
	Namespace: namespace_679a22ba
	Checksum: 0x87F954A6
	Offset: 0x650
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_ce65eab6(var_89592ba7)
{
	spawned = 0;
	var_cffbc08 = 0;
	infinite = 0;
	foreach(entry in var_89592ba7.var_7c88c117)
	{
		if(entry.var_cffbc08 == -1)
		{
			infinite = 1;
		}
		spawned = spawned + entry.spawned;
		var_cffbc08 = var_cffbc08 + function_b9ea4226(entry.var_cffbc08, var_89592ba7.var_b0abb10e);
	}
	return {#hash_cffbc08:(infinite ? -1 : var_cffbc08), #spawned:spawned};
}

/*
	Name: function_f6a07949
	Namespace: namespace_679a22ba
	Checksum: 0xB57F8B18
	Offset: 0x790
	Size: 0x56
	Parameters: 1
	Flags: None
*/
function function_f6a07949(var_89592ba7)
{
	var_aeb18f6 = function_ce65eab6(var_89592ba7);
	return var_aeb18f6.var_cffbc08 == -1 || var_aeb18f6.spawned < var_aeb18f6.var_cffbc08;
}

/*
	Name: function_15541865
	Namespace: namespace_679a22ba
	Checksum: 0xA83ACB9C
	Offset: 0x7F0
	Size: 0x17E
	Parameters: 4
	Flags: Linked, Private
*/
function private function_15541865(&var_8def964, &var_fcfdb752, var_e1be5b85, var_b0abb10e)
{
	if(!isdefined(var_e1be5b85))
	{
		var_e1be5b85 = 0;
	}
	if(!isdefined(var_b0abb10e))
	{
		var_b0abb10e = 0;
	}
	var_8452bcb9 = function_622c131e(var_8def964, var_fcfdb752, var_e1be5b85, var_b0abb10e);
	if(!isdefined(var_8452bcb9))
	{
		return undefined;
	}
	var_74142af1 = getscriptbundle(var_8452bcb9);
	if(var_74142af1.type === #"hash_70192c753a56c1d3")
	{
		return_struct = {#hash_990b33df:var_74142af1.var_5fa96b51[randomint(var_74142af1.var_5fa96b51.size)].var_1b48d0fc};
		if(var_e1be5b85)
		{
			return_struct.var_29459a31 = var_8452bcb9;
		}
		return return_struct;
	}
	if(!isdefined(var_74142af1.ailist) || var_74142af1.ailist.size == 0)
	{
		return undefined;
	}
	return_struct = function_15541865(var_74142af1.ailist, var_fcfdb752, 0);
	if(var_e1be5b85)
	{
		return_struct.var_29459a31 = var_8452bcb9;
	}
	return return_struct;
}

/*
	Name: function_cbafbbab
	Namespace: namespace_679a22ba
	Checksum: 0xEF95B2D9
	Offset: 0x978
	Size: 0x1F4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_cbafbbab(&var_8def964, &var_bcaf6518)
{
	for(index = 0; index < var_8def964.size; index++)
	{
		entry = var_8def964[index];
		var_8452bcb9 = (isdefined(level.var_ce15b8c9[entry.var_37d9fb07]) ? level.var_ce15b8c9[entry.var_37d9fb07] : entry.var_37d9fb07);
		if(!isdefined(var_8452bcb9))
		{
			return undefined;
		}
		var_74142af1 = getscriptbundle(var_8452bcb9);
		if(var_74142af1.type === #"hash_70192c753a56c1d3")
		{
			/#
				assert(isdefined(var_74142af1.var_5fa96b51) && var_74142af1.var_5fa96b51.size > 0, "");
			#/
			foreach(aitype in var_74142af1.var_5fa96b51)
			{
				name = aitype.var_1b48d0fc;
				array::add(var_bcaf6518, name, 0);
			}
			continue;
		}
		if(!isdefined(var_74142af1.ailist) || var_74142af1.ailist.size == 0)
		{
			return undefined;
		}
		function_cbafbbab(var_74142af1.ailist, var_bcaf6518);
	}
}

/*
	Name: function_622c131e
	Namespace: namespace_679a22ba
	Checksum: 0x11F4E8C3
	Offset: 0xB78
	Size: 0x208
	Parameters: 4
	Flags: Linked, Private
*/
function private function_622c131e(&var_5c120708, &var_fcfdb752, var_e1be5b85, var_b0abb10e)
{
	total_weights = 0;
	var_5b34aaca = [];
	for(index = 0; index < var_5c120708.size; index++)
	{
		entry = var_5c120708[index];
		var_cffbc08 = function_b9ea4226((isdefined(var_fcfdb752[index].var_cffbc08) ? var_fcfdb752[index].var_cffbc08 : 0), index);
		if(is_true(var_e1be5b85) && !function_9a90dff7(var_fcfdb752[index]) && (var_cffbc08 - var_fcfdb752[index].spawned) <= 0)
		{
			continue;
		}
		total_weights = total_weights + (isdefined(entry.var_857deb66) ? entry.var_857deb66 : 0);
		struct = {#name:(isdefined(level.var_ce15b8c9[entry.var_37d9fb07]) ? level.var_ce15b8c9[entry.var_37d9fb07] : entry.var_37d9fb07), #weight:total_weights};
		var_5b34aaca[var_5b34aaca.size] = struct;
	}
	if(!total_weights)
	{
		return;
	}
	random_weight = randomint(total_weights);
	for(index = 0; index < var_5b34aaca.size; index++)
	{
		if(random_weight < var_5b34aaca[index].weight)
		{
			return var_5b34aaca[index].name;
		}
	}
}

/*
	Name: function_b9ea4226
	Namespace: namespace_679a22ba
	Checksum: 0xE0204761
	Offset: 0xD88
	Size: 0xBA
	Parameters: 2
	Flags: Linked
*/
function function_b9ea4226(value, scale)
{
	count = getplayers().size - 1;
	/#
		if(getdvarint(#"hash_4b8ad6985e0ad109", 0) > 0)
		{
			count = getdvarint(#"hash_4b8ad6985e0ad109", 0) - 1;
		}
	#/
	return int(value + ((value * (isdefined(scale) ? scale : 0)) * count));
}

/*
	Name: function_c60389b6
	Namespace: namespace_679a22ba
	Checksum: 0xB20B6B75
	Offset: 0xE50
	Size: 0xE0
	Parameters: 2
	Flags: None
*/
function function_c60389b6(var_e3c68634, var_b0abb10e)
{
	count = getplayers().size - 1;
	/#
		if(getdvarint(#"hash_718bfcd5ab690a9c", 0) > 0)
		{
			count = getdvarint(#"hash_718bfcd5ab690a9c", 0) - 1;
		}
	#/
	scale = (isdefined(var_b0abb10e) ? var_b0abb10e : 0);
	max_spawned = var_e3c68634.var_cffbc08 + ((var_e3c68634.var_cffbc08 * scale) * count);
	return max_spawned - var_e3c68634.spawned;
}

/*
	Name: function_9a90dff7
	Namespace: namespace_679a22ba
	Checksum: 0x87424F9E
	Offset: 0xF38
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_9a90dff7(var_e3c68634)
{
	return var_e3c68634.var_cffbc08 == -1;
}

