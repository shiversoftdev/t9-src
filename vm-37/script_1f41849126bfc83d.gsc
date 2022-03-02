#using script_152c3f4ffef9e588;
#using script_c8d806d2487b617;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_6615ea91;

/*
	Name: function_89f2df9
	Namespace: namespace_6615ea91
	Checksum: 0x2AF7D4E2
	Offset: 0x128
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_53f69893eea352cb", &function_70a657d8, undefined, undefined, #"radiation");
}

/*
	Name: function_70a657d8
	Namespace: namespace_6615ea91
	Checksum: 0x44D29BFC
	Offset: 0x178
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	callback::on_spawned(&function_e4a4b07b);
	clientfield::function_a8bbc967("hudItems.incursion.radiationDamage", 1, 5, "float");
	clientfield::function_a8bbc967("hudItems.incursion.radiationProtection", 1, 5, "float");
	clientfield::function_a8bbc967("hudItems.incursion.radiationHealth", 1, 5, "float");
	clientfield::register("toplayer", "radiation", 1, 10, "int");
}

/*
	Name: function_e4a4b07b
	Namespace: namespace_6615ea91
	Checksum: 0xDC151D09
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e4a4b07b()
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	self function_137e7814(self, 0);
}

/*
	Name: function_59621e3c
	Namespace: namespace_6615ea91
	Checksum: 0x50E6C913
	Offset: 0x2A8
	Size: 0x13C
	Parameters: 2
	Flags: Linked
*/
function function_59621e3c(player, sickness)
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	radiationlevel = radiation::function_c9c6dda1(player);
	if(!isdefined(radiationlevel))
	{
		/#
			assert(0);
		#/
		return;
	}
	var_2ba8769e = namespace_956bd4dd::function_6b384c0f(radiationlevel, sickness);
	if(!isdefined(var_2ba8769e))
	{
		/#
			assert(0);
		#/
		return;
	}
	var_d4393988 = player clientfield::get_to_player("radiation");
	var_4e56b794 = var_d4393988 >> 3;
	var_4e56b794 = var_4e56b794 | (1 << var_2ba8769e);
	var_66bba724 = radiationlevel;
	var_d4393988 = (var_4e56b794 << 3) | var_66bba724;
	player clientfield::set_to_player("radiation", var_d4393988);
}

/*
	Name: function_cca7424d
	Namespace: namespace_6615ea91
	Checksum: 0xB3F62C37
	Offset: 0x3F0
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_cca7424d(player, percentage)
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	percentage = max(min(5, percentage), 0);
	player clientfield::set_player_uimodel("hudItems.incursion.radiationProtection", percentage / 5);
}

/*
	Name: function_5cf1c0a
	Namespace: namespace_6615ea91
	Checksum: 0xBD047077
	Offset: 0x478
	Size: 0x13C
	Parameters: 2
	Flags: Linked
*/
function function_5cf1c0a(player, sickness)
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	radiationlevel = radiation::function_c9c6dda1(player);
	var_66bba724 = radiationlevel;
	if(!isdefined(radiationlevel))
	{
		/#
			assert(0);
		#/
		return;
	}
	var_2ba8769e = namespace_956bd4dd::function_6b384c0f(radiationlevel, sickness);
	if(!isdefined(var_2ba8769e))
	{
		/#
			assert(0);
		#/
		return;
	}
	var_d4393988 = player clientfield::get_to_player("radiation");
	var_4e56b794 = var_d4393988 >> 3;
	var_4e56b794 = var_4e56b794 & (~(1 << var_2ba8769e));
	var_d4393988 = (var_4e56b794 << 3) | var_66bba724;
	player clientfield::set_to_player("radiation", var_d4393988);
}

/*
	Name: function_36a2c924
	Namespace: namespace_6615ea91
	Checksum: 0x137D98
	Offset: 0x5C0
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_36a2c924(player, var_c49d0215)
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	player clientfield::set_player_uimodel("hudItems.incursion.radiationDamage", var_c49d0215);
}

/*
	Name: function_137e7814
	Namespace: namespace_6615ea91
	Checksum: 0x936B2B1B
	Offset: 0x610
	Size: 0xEC
	Parameters: 2
	Flags: Linked
*/
function function_137e7814(player, radiationlevel)
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	var_d4393988 = player clientfield::get_to_player("radiation");
	/#
		assert(radiationlevel >= 0);
	#/
	/#
		assert(radiationlevel < pow(2, 3));
	#/
	var_842e1a12 = ((var_d4393988 >> 3) << 3) | (radiationlevel & (8 - 1));
	player clientfield::set_to_player("radiation", var_842e1a12);
}

/*
	Name: function_835a6746
	Namespace: namespace_6615ea91
	Checksum: 0x7B2FF007
	Offset: 0x708
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_835a6746(player, var_ac3a86ea)
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	player clientfield::set_player_uimodel("hudItems.incursion.radiationHealth", 1 - var_ac3a86ea);
}

