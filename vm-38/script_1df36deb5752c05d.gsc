#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_a0b518ca : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_a0b518ca
		Checksum: 0xB32238A4
		Offset: 0x328
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_a0b518ca
		Checksum: 0x58B225B1
		Offset: 0x6B8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_a0b518ca
		Checksum: 0xB8EF73CA
		Offset: 0x460
		Size: 0x3C
		Parameters: 2
		Flags: None
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_338d48a0
		Namespace: namespace_a0b518ca
		Checksum: 0x832E6DA3
		Offset: 0x668
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_338d48a0(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "hasDamage", value);
	}

	/*
		Name: close
		Namespace: namespace_a0b518ca
		Checksum: 0x2D75E372
		Offset: 0x4A8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_62264c81
		Namespace: namespace_a0b518ca
		Checksum: 0xE01C8BB1
		Offset: 0x4D8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_62264c81(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "chargePct", value);
	}

	/*
		Name: function_751f7270
		Namespace: namespace_a0b518ca
		Checksum: 0x456DAD00
		Offset: 0x618
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_751f7270(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "hasCharge", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_a0b518ca
		Checksum: 0x6F814EAA
		Offset: 0x348
		Size: 0x10C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_control_point_hud");
		namespace_6aaccc24::function_da693cbe("chargePct", 8000, 7, "float");
		namespace_6aaccc24::function_da693cbe("damagePct", 8000, 7, "float");
		namespace_6aaccc24::function_da693cbe("ordaHealthPct", 16000, 7, "float");
		namespace_6aaccc24::function_da693cbe("hasOrda", 16000, 1, "int");
		namespace_6aaccc24::function_da693cbe("hasCharge", 16000, 1, "int");
		namespace_6aaccc24::function_da693cbe("hasDamage", 16000, 1, "int");
	}

	/*
		Name: function_a04ff29a
		Namespace: namespace_a0b518ca
		Checksum: 0xD2B03B1F
		Offset: 0x528
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_a04ff29a(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "damagePct", value);
	}

	/*
		Name: function_a59aefa6
		Namespace: namespace_a0b518ca
		Checksum: 0x52F11E48
		Offset: 0x578
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_a59aefa6(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "ordaHealthPct", value);
	}

	/*
		Name: function_a95c34f3
		Namespace: namespace_a0b518ca
		Checksum: 0xE7B9EA6A
		Offset: 0x5C8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_a95c34f3(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "hasOrda", value);
	}

}

#namespace namespace_72133e5;

/*
	Name: function_eb17663
	Namespace: namespace_72133e5
	Checksum: 0x52660878
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eb17663()
{
	level notify(1151047824);
}

/*
	Name: register
	Namespace: namespace_72133e5
	Checksum: 0xC0B971F3
	Offset: 0x138
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_a0b518ca();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: namespace_72133e5
	Checksum: 0x3A6790E3
	Offset: 0x178
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: namespace_72133e5
	Checksum: 0x2AD0B106
	Offset: 0x1B8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: namespace_72133e5
	Checksum: 0x1E0592EA
	Offset: 0x1E0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_62264c81
	Namespace: namespace_72133e5
	Checksum: 0x49892A03
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_62264c81(player, value)
{
	[[ self ]]->function_62264c81(player, value);
}

/*
	Name: function_a04ff29a
	Namespace: namespace_72133e5
	Checksum: 0xB40559A1
	Offset: 0x238
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_a04ff29a(player, value)
{
	[[ self ]]->function_a04ff29a(player, value);
}

/*
	Name: function_a59aefa6
	Namespace: namespace_72133e5
	Checksum: 0x240FB947
	Offset: 0x268
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_a59aefa6(player, value)
{
	[[ self ]]->function_a59aefa6(player, value);
}

/*
	Name: function_a95c34f3
	Namespace: namespace_72133e5
	Checksum: 0x418AC2F9
	Offset: 0x298
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_a95c34f3(player, value)
{
	[[ self ]]->function_a95c34f3(player, value);
}

/*
	Name: function_751f7270
	Namespace: namespace_72133e5
	Checksum: 0xDD69489
	Offset: 0x2C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_751f7270(player, value)
{
	[[ self ]]->function_751f7270(player, value);
}

/*
	Name: function_338d48a0
	Namespace: namespace_72133e5
	Checksum: 0xD973F8D9
	Offset: 0x2F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_338d48a0(player, value)
{
	[[ self ]]->function_338d48a0(player, value);
}

