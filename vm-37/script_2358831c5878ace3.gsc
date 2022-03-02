#namespace weapons;

/*
	Name: function_251ec78c
	Namespace: weapons
	Checksum: 0x71D566BB
	Offset: 0x60
	Size: 0x102
	Parameters: 2
	Flags: Linked
*/
function function_251ec78c(weapon, var_a4bc20c2)
{
	if(!isdefined(var_a4bc20c2))
	{
		var_a4bc20c2 = 1;
	}
	if(weapon.isaltmode)
	{
		baseweapon = weapon.altweapon;
	}
	else
	{
		if(weapon.var_bf0eb41)
		{
			baseweapon = weapon.dualwieldweapon;
		}
		else
		{
			if(var_a4bc20c2)
			{
				baseweapon = getweapon(weapon.statname, weapon.attachments);
			}
			else
			{
				baseweapon = getweapon(weapon.name, weapon.attachments);
			}
		}
	}
	if(level.weaponnone == baseweapon)
	{
		baseweapon = weapon;
	}
	baseweapon = function_eeddea9a(baseweapon, function_9f1cc9a9(weapon));
	return baseweapon;
}

/*
	Name: getbaseweapon
	Namespace: weapons
	Checksum: 0x2883FF65
	Offset: 0x170
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function getbaseweapon(weapon)
{
	baseweapon = function_251ec78c(weapon);
	return baseweapon.rootweapon;
}

