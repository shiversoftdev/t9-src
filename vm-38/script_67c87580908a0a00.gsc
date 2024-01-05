#namespace namespace_bd884c6d;

/*
	Name: function_8eb6accc
	Namespace: namespace_bd884c6d
	Checksum: 0x86273456
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8eb6accc()
{
	level notify(1268410171);
}

#namespace activecamo;

/*
	Name: function_b259f3e0
	Namespace: activecamo
	Checksum: 0x2828E575
	Offset: 0x90
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_b259f3e0(camoweapon)
{
	/#
		assert(isdefined(camoweapon));
	#/
	var_e69cf15d = function_3786d342(camoweapon);
	if(isdefined(var_e69cf15d) && var_e69cf15d != level.weaponnone)
	{
		camoweapon = var_e69cf15d;
	}
	return camoweapon;
}

/*
	Name: function_c14cb514
	Namespace: activecamo
	Checksum: 0x3B4D39B0
	Offset: 0x108
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
	Checksum: 0x18C032A5
	Offset: 0x200
	Size: 0xD0
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x8CEF9BDE
	Offset: 0x2D8
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_13e12ab1(camoindex)
{
	var_f4eb4a50 = undefined;
	activecamoname = getactivecamo(camoindex);
	if(isdefined(activecamoname) && activecamoname != #"")
	{
		var_f4eb4a50 = getscriptbundle(activecamoname);
	}
	return var_f4eb4a50;
}

/*
	Name: function_edd6511
	Namespace: activecamo
	Checksum: 0x1E8552C0
	Offset: 0x358
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
	Checksum: 0x7995EE50
	Offset: 0x3A8
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_5af7df72(var_6f2ae9c0)
{
	camoindex = getcamoindex(var_6f2ae9c0);
	return getactivecamo(camoindex);
}

/*
	Name: function_54f0afd2
	Namespace: activecamo
	Checksum: 0xF0618203
	Offset: 0x3F8
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function function_54f0afd2(var_3594168e)
{
	var_e2dbd42d = (isdefined(var_3594168e.var_e2dbd42d) ? var_3594168e.var_e2dbd42d : 0);
	if(sessionmodeiszombiesgame() && isdefined(var_3594168e.var_9b0d1315) && var_3594168e.var_9b0d1315 > 0)
	{
		var_e2dbd42d = var_3594168e.var_9b0d1315;
	}
	return var_e2dbd42d;
}

