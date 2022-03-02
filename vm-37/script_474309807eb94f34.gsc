#namespace activecamo;

/*
	Name: function_b259f3e0
	Namespace: activecamo
	Checksum: 0xDE67A9E
	Offset: 0x70
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_b259f3e0(var_e827f698)
{
	/#
		assert(isdefined(var_e827f698));
	#/
	var_e69cf15d = function_3786d342(var_e827f698);
	if(isdefined(var_e69cf15d) && var_e69cf15d != level.weaponnone)
	{
		var_e827f698 = var_e69cf15d;
	}
	return var_e827f698;
}

/*
	Name: function_c14cb514
	Namespace: activecamo
	Checksum: 0x1C0D0CBA
	Offset: 0xE8
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function function_c14cb514(weapon)
{
	if(isdefined(level.var_f06de157))
	{
		return [[level.var_f06de157]](weapon);
	}
	if(isdefined(weapon))
	{
		if(level.weaponnone != weapon)
		{
			var_7c3192e1 = function_b259f3e0(weapon);
			if(var_7c3192e1.isaltmode)
			{
				if(isdefined(var_7c3192e1.altweapon) && level.weaponnone != var_7c3192e1.altweapon)
				{
					var_7c3192e1 = var_7c3192e1.altweapon;
				}
			}
			if(isdefined(var_7c3192e1.rootweapon) && level.weaponnone != var_7c3192e1.rootweapon)
			{
				return var_7c3192e1.rootweapon;
			}
			return var_7c3192e1;
		}
	}
	return weapon;
}

/*
	Name: function_94c2605
	Namespace: activecamo
	Checksum: 0x101B33F8
	Offset: 0x1E0
	Size: 0xD0
	Parameters: 1
	Flags: None
*/
function function_94c2605(weapon)
{
	if(isdefined(weapon))
	{
		if(level.weaponnone != weapon)
		{
			var_7c3192e1 = weapon;
			if(var_7c3192e1.inventorytype == "dwlefthand")
			{
				if(isdefined(var_7c3192e1.dualwieldweapon) && level.weaponnone != var_7c3192e1.dualwieldweapon)
				{
					var_7c3192e1 = var_7c3192e1.dualwieldweapon;
				}
			}
			if(var_7c3192e1.isaltmode)
			{
				if(isdefined(var_7c3192e1.altweapon) && level.weaponnone != var_7c3192e1.altweapon)
				{
					var_7c3192e1 = var_7c3192e1.altweapon;
				}
			}
			return var_7c3192e1;
		}
	}
	return weapon;
}

/*
	Name: function_13e12ab1
	Namespace: activecamo
	Checksum: 0xEB6E5F14
	Offset: 0x2B8
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_13e12ab1(camoindex)
{
	var_f4eb4a50 = undefined;
	activecamoname = function_11c873a(camoindex);
	if(isdefined(activecamoname) && activecamoname != #"")
	{
		var_f4eb4a50 = getscriptbundle(activecamoname);
	}
	return var_f4eb4a50;
}

/*
	Name: function_edd6511
	Namespace: activecamo
	Checksum: 0x3FFBCE54
	Offset: 0x338
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_edd6511(var_6f2ae9c0)
{
	camoindex = getcamoindex(var_6f2ae9c0);
	return function_13e12ab1(camoindex);
}

/*
	Name: function_5af7df72
	Namespace: activecamo
	Checksum: 0x4514A05E
	Offset: 0x388
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_5af7df72(var_6f2ae9c0)
{
	camoindex = getcamoindex(var_6f2ae9c0);
	return function_11c873a(camoindex);
}

