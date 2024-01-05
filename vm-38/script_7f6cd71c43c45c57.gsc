#namespace namespace_53508120;

/*
	Name: function_77a320c4
	Namespace: namespace_53508120
	Checksum: 0x5C234DCF
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_77a320c4()
{
	level notify(-943377718);
}

#namespace weapons;

/*
	Name: function_251ec78c
	Namespace: weapons
	Checksum: 0x7A57D6BA
	Offset: 0x80
	Size: 0x13A
	Parameters: 2
	Flags: Linked
*/
function function_251ec78c(weapon, var_a4bc20c2)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponnone;
	}
	if(!isdefined(var_a4bc20c2))
	{
		var_a4bc20c2 = 1;
	}
	if(is_true(weapon.isaltmode))
	{
		baseweapon = weapon.altweapon;
	}
	else
	{
		if(is_true(weapon.var_bf0eb41))
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
	Checksum: 0x526B73AB
	Offset: 0x1C8
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function getbaseweapon(weapon)
{
	baseweapon = function_251ec78c(weapon);
	return baseweapon.rootweapon;
}

